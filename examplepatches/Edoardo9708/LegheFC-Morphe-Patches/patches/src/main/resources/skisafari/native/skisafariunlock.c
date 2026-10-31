#define _GNU_SOURCE
#include <android/log.h>
#include <dlfcn.h>
#include <jni.h>
#include <link.h>
#include <stdint.h>
#include <string.h>

#define TAG "SkiSafari-Unlock"
#define LOGI(message) __android_log_write(ANDROID_LOG_INFO, TAG, message)
#define LOGE(message) __android_log_write(ANDROID_LOG_ERROR, TAG, message)

// RVAs recovered from the exact libil2cpp.so SHA-256 enforced by the Morphe
// RawResourcePatch. These are virtual addresses (ELF image base zero), not
// file offsets. The original library remains byte-for-byte unchanged.
#define GAMESTATE_GET_PERSISTENT_PROFILE_RVA 0xBCDE98u
#define GAMESTATE_GET_IS_LOAD_REQUESTED_RVA  0xBCDE40u
#define SHOP_ITEM_HELPER_GET_INSTANCE_RVA   0xC8DB68u
#define SHOP_ITEM_HELPER_UNLOCK_ALL_RVA     0xC8DC94u
#define SHOP_ITEM_HELPER_GET_ALL_IDS_RVA    0xC8EA28u
#define SHOP_ITEM_HELPER_IS_UNLOCKED_RVA    0xC8F374u

typedef struct {
    uintptr_t base;
    const char *path;
} Il2CppImage;

static int g_unlock_called;
static int g_profile_ready_logged;
static int g_runtime_ready;
static int g_wait_logged;

static int find_il2cpp(struct dl_phdr_info *info, size_t size, void *data) {
    (void) size;
    if (info->dlpi_name != NULL && strstr(info->dlpi_name, "libil2cpp.so") != NULL) {
        ((Il2CppImage *) data)->base = (uintptr_t) info->dlpi_addr;
        ((Il2CppImage *) data)->path = info->dlpi_name;
        return 1;
    }
    return 0;
}

JNIEXPORT jint JNICALL
Java_lab_skisafari_SkiSafariUnlock_tryUnlock(JNIEnv *env, jclass clazz) {
    (void) env;
    (void) clazz;

    int previous_state = __atomic_load_n(&g_unlock_called, __ATOMIC_ACQUIRE);
    if (previous_state == 2) return 4;
    if (previous_state == 1) return -3;

    Il2CppImage image = {0};
    dl_iterate_phdr(find_il2cpp, &image);
    if (image.base == 0) return 0;

    if (!g_runtime_ready) {
        typedef void *(*RuntimeGetter)(void);
        // Unity may load IL2CPP with RTLD_LOCAL. Acquire only the existing image;
        // never load or initialize a second copy as a side effect of polling.
        void *handle = dlopen(image.path, RTLD_NOW | RTLD_NOLOAD);
        if (handle == NULL) return 0;
        RuntimeGetter get_corlib = (RuntimeGetter) dlsym(handle, "il2cpp_get_corlib");
        RuntimeGetter thread_current = (RuntimeGetter) dlsym(handle, "il2cpp_thread_current");
        dlclose(handle);
        if (get_corlib == NULL || thread_current == NULL) {
            LOGE("Errore: API IL2CPP corlib/thread current non esportate.");
            return -1;
        }
        // domain_get lazily allocates a domain even before Runtime::Init. A
        // non-null domain therefore does not authorize thread_attach or game
        // metadata calls. Let Unity initialize its existing thread itself.
        if (get_corlib() == NULL || thread_current() == NULL) {
            if (!g_wait_logged++) LOGI("Attesa inizializzazione IL2CPP sul thread Unity; nessun attach forzato.");
            return 0;
        }
        g_runtime_ready = 1;
        LOGI("Runtime IL2CPP e thread Unity gia' inizializzati.");
    }

    typedef void *(*StaticGetter)(void *method_info);
    typedef uint8_t (*BoolGetter)(void *method_info);
    typedef void *(*InstanceGetter)(void *instance, void *method_info);
    typedef uint8_t (*IsUnlocked)(void *instance, void *name, void *method_info);
    typedef void (*UnlockMethod)(void *instance, void *method_info);

    StaticGetter get_profile = (StaticGetter)
            (image.base + GAMESTATE_GET_PERSISTENT_PROFILE_RVA);
    StaticGetter get_shop_helper = (StaticGetter)
            (image.base + SHOP_ITEM_HELPER_GET_INSTANCE_RVA);
    UnlockMethod unlock_all = (UnlockMethod)
            (image.base + SHOP_ITEM_HELPER_UNLOCK_ALL_RVA);
    BoolGetter load_requested = (BoolGetter)
            (image.base + GAMESTATE_GET_IS_LOAD_REQUESTED_RVA);
    InstanceGetter get_ids = (InstanceGetter)
            (image.base + SHOP_ITEM_HELPER_GET_ALL_IDS_RVA);
    IsUnlocked is_unlocked = (IsUnlocked)
            (image.base + SHOP_ITEM_HELPER_IS_UNLOCKED_RVA);

    if (load_requested(NULL)) return 1;
    void *profile = get_profile(NULL);
    if (profile == NULL) return 1;

    if (!__atomic_exchange_n(&g_profile_ready_logged, 1, __ATOMIC_ACQ_REL)) {
        LOGI("Profilo persistente pronto.");
    }

    void *shop_helper = get_shop_helper(NULL);
    if (shop_helper == NULL) return 2;

    // List<string> layout verified against this image's ARM64 list accesses:
    // backing array +0x10, size +0x18; array length +0x18, elements +0x20.
    void *ids = get_ids(shop_helper, NULL);
    if (ids == NULL) return 2;
    int32_t count;
    void *array;
    memcpy(&count, (uint8_t *) ids + 0x18, sizeof(count));
    memcpy(&array, (uint8_t *) ids + 0x10, sizeof(array));
    if (count <= 0) return 2;
    if (count > 100000 || array == NULL) return -2;
    uintptr_t capacity;
    memcpy(&capacity, (uint8_t *) array + 0x18, sizeof(capacity));
    if (capacity < (uintptr_t) count) return -2;

    int expected = 0;
    if (!__atomic_compare_exchange_n(&g_unlock_called, &expected, 1, 0,
            __ATOMIC_ACQ_REL, __ATOMIC_ACQUIRE)) return expected == 2 ? 4 : -3;
    LOGI("Avvio ShopItemHelper.UnlockAllItems().");
    unlock_all(shop_helper, NULL);
    for (int32_t i = 0; i < count; i++) {
        void *name;
        memcpy(&name, (uint8_t *) array + 0x20 + (size_t) i * sizeof(void *), sizeof(name));
        if (name == NULL || !is_unlocked(shop_helper, name, NULL)) {
            LOGE("Errore: UnlockAllItems ritornato ma catalogo non completamente sbloccato; nessun marcatore persistente.");
            return -3;
        }
    }
    LOGI("Catalogo non vuoto e sblocchi verificati in memoria.");
    __atomic_store_n(&g_unlock_called, 2, __ATOMIC_RELEASE);
    LOGI("UnlockAllItems ritornato; il metodo chiama GameState.Save quando cambia gli sblocchi.");
    return 3;
}
