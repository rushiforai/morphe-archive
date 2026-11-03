#include <android/log.h>
#include <dlfcn.h>
#include <pthread.h>
#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/mman.h>
#include <time.h>
#include <unistd.h>

#define TAG "ConsumerClarity"
#define ANCHOR_VA 0x00be6a40ULL
#define REVIEW_HOOK_VA 0x00ffced0ULL
#define VENDOR_HOOK_VA 0x017ae4e4ULL
#define MAX_LIST_ITEMS 4096

extern void consumerclarity_review_trampoline(void);
extern void consumerclarity_vendor_trampoline(void);
extern void consumerclarity_sort_reviews(uint64_t response, uint64_t heap, uint64_t null_object);
extern void consumerclarity_sort_vendors(uint64_t response, uint64_t heap, uint64_t null_object);

uint64_t consumerclarity_review_return;
uint64_t consumerclarity_vendor_return;

static const uint8_t review_prologue[] = {
    0xfd, 0x79, 0xbf, 0xa9, 0xfd, 0x03, 0x0f, 0xaa,
    0xef, 0x61, 0x00, 0xd1, 0x50, 0x27, 0x40, 0xf9,
};

static const uint8_t vendor_prologue[] = {
    0xfd, 0x79, 0xbf, 0xa9, 0xfd, 0x03, 0x0f, 0xaa,
    0xef, 0x41, 0x01, 0xd1, 0xa1, 0x03, 0x1f, 0xf8,
};

typedef struct {
    uint64_t heap;
    uint32_t null_ref;
} DartContext;

static uint64_t dart_pointer(const DartContext *context, uint32_t ref) {
    return (uint64_t)ref + (context->heap << 32);
}

static uint32_t dart_field(uint64_t object, uint32_t offset) {
    uint32_t value;
    memcpy(&value, (const void *)(uintptr_t)(object + offset - 1), sizeof(value));
    return value;
}

static int64_t dart_integer(const DartContext *context, uint32_t ref) {
    if (ref == context->null_ref) return 0;
    if ((ref & 1U) == 0) return ((int32_t)ref) >> 1;
    int64_t value;
    memcpy(&value, (const void *)(uintptr_t)(dart_pointer(context, ref) + 7), sizeof(value));
    return value;
}

static double dart_double(const DartContext *context, uint32_t ref) {
    if (ref == context->null_ref || (ref & 1U) == 0) return 0.0;
    double value;
    memcpy(&value, (const void *)(uintptr_t)(dart_pointer(context, ref) + 7), sizeof(value));
    return value;
}

static int dart_string(const DartContext *context, uint64_t item, uint32_t offset,
                       const uint8_t **bytes, int32_t *length) {
    uint32_t ref = dart_field(item, offset);
    if (ref == context->null_ref || (ref & 1U) == 0) return 0;
    uint64_t string = dart_pointer(context, ref);
    int32_t raw_length = (int32_t)dart_field(string, 8);
    int32_t size = raw_length >> 1;
    if (size < 0 || size > 80) return 0;
    *bytes = (const uint8_t *)(uintptr_t)(string + 15);
    *length = size;
    return 1;
}

static int iso_date(const uint8_t *bytes, int32_t length) {
    if (length < 10 || bytes[4] != '-' || bytes[7] != '-') return 0;
    for (int i = 0; i < 4; ++i) {
        if (bytes[i] < '0' || bytes[i] > '9') return 0;
    }
    return 1;
}

static int compare_dates(const DartContext *context, uint64_t left, uint64_t right) {
    const uint8_t *left_bytes = NULL;
    const uint8_t *right_bytes = NULL;
    int32_t left_length = 0;
    int32_t right_length = 0;
    int left_valid = dart_string(context, left, 0x18, &left_bytes, &left_length) &&
                     iso_date(left_bytes, left_length);
    int right_valid = dart_string(context, right, 0x18, &right_bytes, &right_length) &&
                      iso_date(right_bytes, right_length);
    if (left_valid != right_valid) return left_valid ? -1 : 1;
    if (!left_valid) return 0;
    int32_t common = left_length < right_length ? left_length : right_length;
    int comparison = memcmp(left_bytes, right_bytes, (size_t)common);
    if (comparison != 0) return -comparison;
    if (left_length == right_length) return 0;
    return left_length > right_length ? -1 : 1;
}

static int compare_ids(const DartContext *context, uint64_t left, uint64_t right) {
    int64_t left_id = dart_integer(context, dart_field(left, 8));
    int64_t right_id = dart_integer(context, dart_field(right, 8));
    if (left_id == right_id) return 0;
    return left_id < right_id ? -1 : 1;
}

static int preference_int(const char *key, int fallback) {
    FILE *file = fopen("/data/data/com.talabat/shared_prefs/consumerclarity.xml", "r");
    if (file == NULL) return fallback;
    char name[96];
    snprintf(name, sizeof(name), "name=\"%s\"", key);
    char *contents = NULL;
    size_t capacity = 0;
    size_t length = 0;
    int result = fallback;
    int c;
    while ((c = fgetc(file)) != EOF && length < 65535) {
        if (length + 1 >= capacity) {
            size_t grown_capacity = capacity == 0 ? 4096 : capacity * 2;
            char *grown = realloc(contents, grown_capacity);
            if (grown == NULL) {
                free(contents);
                contents = NULL;
                break;
            }
            contents = grown;
            capacity = grown_capacity;
        }
        contents[length++] = (char)c;
    }
    fclose(file);
    if (contents != NULL) {
        contents[length] = '\0';
        char *found = strstr(contents, name);
        if (found != NULL) {
            char *value = strstr(found, "value=\"");
            if (value != NULL) {
                value += 7;
                if (strncmp(value, "true", 4) == 0) result = 1;
                else if (strncmp(value, "false", 5) == 0) result = 0;
                else result = (int)strtol(value, NULL, 10);
            }
        }
        free(contents);
    }
    return result;
}

static int sponsored_mode;
static int review_sort_mode;
static int restaurant_min_rating;
static int review_min_rating;
static int review_content_mode;
static time_t preferences_timestamp;

static void refresh_preferences() {
    time_t now = time(NULL);
    if (now == preferences_timestamp) return;
    preferences_timestamp = now;
    sponsored_mode = preference_int("sponsored_mode", 0);
    review_sort_mode = preference_int("review_sort_mode", 0);
    restaurant_min_rating = preference_int("restaurant_min_rating", 0);
    review_min_rating = preference_int("review_min_rating", 0);
    review_content_mode = preference_int("review_content_mode", 0);
}

static int compare_reviews(const DartContext *context, uint64_t left, uint64_t right) {
    int mode = review_sort_mode;
    if (mode == 2) {
        double left_rating = dart_double(context, dart_field(left, 0x14));
        double right_rating = dart_double(context, dart_field(right, 0x14));
        if (left_rating != right_rating) return left_rating > right_rating ? -1 : 1;
    }
    int comparison = compare_dates(context, left, right);
    if (mode == 1) comparison = -comparison;
    return comparison != 0 ? comparison : compare_ids(context, left, right);
}

static double dart_rating(const DartContext *context, uint32_t ref, int *rated) {
    *rated = ref != context->null_ref && (ref & 1U) != 0;
    return dart_double(context, ref);
}

static int compare_vendors(const DartContext *context, uint64_t left, uint64_t right) {
    int left_rated;
    int right_rated;
    double left_rating = dart_rating(context, dart_field(left, 0x34), &left_rated);
    double right_rating = dart_rating(context, dart_field(right, 0x34), &right_rated);
    if (left_rated != right_rated) return left_rated ? -1 : 1;
    int left_sponsored = dart_integer(context, dart_field(left, 0x197)) > 0;
    int right_sponsored = dart_integer(context, dart_field(right, 0x197)) > 0;
    if (left_sponsored != right_sponsored) return left_sponsored ? 1 : -1;
    if (left_rating != right_rating) return left_rating > right_rating ? -1 : 1;
    return compare_ids(context, left, right);
}

static uint32_t *dart_list(const DartContext *context, uint64_t response, int32_t *count) {
    if ((response & 1U) == 0) return NULL;
    uint32_t list_ref = dart_field(response, 8);
    if (list_ref == context->null_ref || (list_ref & 1U) == 0) return NULL;
    uint64_t list = dart_pointer(context, list_ref);
    int32_t raw_count = (int32_t)dart_field(list, 0x0c);
    if ((raw_count & 1) != 0) return NULL;
    int32_t size = raw_count >> 1;
    if (size < 0 || size > MAX_LIST_ITEMS) return NULL;
    uint32_t data_ref = dart_field(list, 0x10);
    if (data_ref == context->null_ref || (data_ref & 1U) == 0) return NULL;
    uint64_t data = dart_pointer(context, data_ref);
    *count = size;
    return (uint32_t *)(uintptr_t)(data + 15);
}

static void sort_response(uint64_t response, uint64_t heap, uint64_t null_object, int vendors) {
    refresh_preferences();
    int original_order = (vendors ? sponsored_mode : review_sort_mode) == (vendors ? 2 : 3);
    DartContext context = {.heap = heap, .null_ref = (uint32_t)null_object};
    int32_t count = 0;
    uint32_t *items = dart_list(&context, response, &count);
    if (items == NULL) return;
    int minimum_rating = vendors ? restaurant_min_rating : review_min_rating;
    int content_mode = vendors ? 0 : review_content_mode;
    if ((vendors && sponsored_mode == 1) || minimum_rating > 0 || content_mode > 0) {
        int32_t kept = 0;
        for (int32_t i = 0; i < count; ++i) {
            uint32_t ref = items[i];
            if (ref == context.null_ref || (ref & 1U) == 0) {
                items[kept++] = ref;
                continue;
            }
            uint64_t item = dart_pointer(&context, ref);
            if (vendors && sponsored_mode == 1 &&
                dart_integer(&context, dart_field(item, 0x197)) > 0) continue;
            double rating = dart_double(&context, dart_field(item, vendors ? 0x34 : 0x14));
            if (minimum_rating > 0 && rating * 10.0 < (double)minimum_rating) continue;
            if (content_mode == 2 && rating <= 0.0) continue;
            if (content_mode == 1) {
                const uint8_t *text = NULL;
                int32_t length = 0;
                if (!dart_string(&context, item, 0x10, &text, &length) || length == 0) continue;
            }
            items[kept++] = ref;
        }
        count = kept;
        uint32_t list_ref = dart_field(response, 8);
        uint64_t list = dart_pointer(&context, list_ref);
        uint32_t raw_count = (uint32_t)(count << 1);
        memcpy((void *)(uintptr_t)(list + 11), &raw_count, sizeof(raw_count));
    }
    if (original_order || count < 2) return;
    for (int32_t i = 1; i < count; ++i) {
        uint32_t item_ref = items[i];
        if (item_ref == context.null_ref || (item_ref & 1U) == 0) continue;
        uint64_t item = dart_pointer(&context, item_ref);
        int32_t position = i;
        while (position > 0) {
            uint32_t previous_ref = items[position - 1];
            if (previous_ref == context.null_ref || (previous_ref & 1U) == 0) break;
            uint64_t previous = dart_pointer(&context, previous_ref);
            int comparison = vendors ? compare_vendors(&context, item, previous)
                                     : compare_reviews(&context, item, previous);
            if (comparison >= 0) break;
            items[position] = previous_ref;
            --position;
        }
        items[position] = item_ref;
    }
}

void consumerclarity_sort_reviews(uint64_t response, uint64_t heap, uint64_t null_object) {
    sort_response(response, heap, null_object, 0);
}

void consumerclarity_sort_vendors(uint64_t response, uint64_t heap, uint64_t null_object) {
    sort_response(response, heap, null_object, 1);
}

static int install_hook(uint64_t anchor, uint64_t hook_va, const uint8_t *expected,
                        void *trampoline, uint64_t *return_slot) {
    uint8_t *hook = (uint8_t *)(uintptr_t)(anchor + hook_va - ANCHOR_VA);
    if (memcmp(hook, expected, 16) != 0) {
        __android_log_write(ANDROID_LOG_ERROR, TAG, "Instruction guard rejected a hook");
        return 0;
    }
    *return_slot = (uint64_t)(uintptr_t)(hook + 16);
    uint64_t target = (uint64_t)(uintptr_t)trampoline;
    uint32_t replacement[4] = {
        0x58000050U,
        0xd61f0200U,
        (uint32_t)target,
        (uint32_t)(target >> 32),
    };
    uintptr_t page = (uintptr_t)hook & ~(uintptr_t)(getpagesize() - 1);
    if (mprotect((void *)page, (size_t)getpagesize(), PROT_READ | PROT_WRITE | PROT_EXEC) != 0) {
        __android_log_write(ANDROID_LOG_ERROR, TAG, "Unable to make Dart code writable");
        return 0;
    }
    memcpy(hook, replacement, sizeof(replacement));
    __builtin___clear_cache((char *)hook, (char *)hook + sizeof(replacement));
    mprotect((void *)page, (size_t)getpagesize(), PROT_READ | PROT_EXEC);
    return 1;
}

static void *install_when_loaded(void *unused) {
    (void)unused;
    for (int attempt = 0; attempt < 600; ++attempt) {
        void *app = dlopen("libapp.so", RTLD_NOW | RTLD_NOLOAD);
        if (app != NULL) {
            void *anchor = dlsym(app, "_kDartIsolateSnapshotInstructions");
            if (anchor != NULL) {
                int reviews = install_hook((uint64_t)(uintptr_t)anchor, REVIEW_HOOK_VA,
                                           review_prologue, consumerclarity_review_trampoline,
                                           &consumerclarity_review_return);
                int vendors = install_hook((uint64_t)(uintptr_t)anchor, VENDOR_HOOK_VA,
                                           vendor_prologue, consumerclarity_vendor_trampoline,
                                           &consumerclarity_vendor_return);
                __android_log_print(ANDROID_LOG_INFO, TAG,
                                    "Sorting hooks: reviews=%d restaurants=%d", reviews, vendors);
                return NULL;
            }
        }
        usleep(100000);
    }
    __android_log_write(ANDROID_LOG_ERROR, TAG, "Timed out waiting for libapp.so");
    return NULL;
}

__attribute__((constructor)) static void consumerclarity_init(void) {
    pthread_t thread;
    if (pthread_create(&thread, NULL, install_when_loaded, NULL) == 0) {
        pthread_detach(thread);
    }
}
