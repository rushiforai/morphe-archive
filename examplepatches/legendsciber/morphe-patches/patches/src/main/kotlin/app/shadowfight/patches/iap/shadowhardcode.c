#include <jni.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <pthread.h>
#include <stdint.h>
#include <dlfcn.h>

#define LOG_TAG "SF2IAP"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#include <android/log.h>

/*
 * Shadow Fight 2 - IAP Bypass v27
 *
 * Strategy: Hook PaymentUI.MakePurchase to intercept real-money purchases
 * before they reach Unity IAP / Google Play. When a real-money item is
 * detected, we directly invoke IAGKBFCKFKB with KGNNFOHIBBD=1 (Gold)
 * via IL2CPP runtime_invoke, bypassing Google Play entirely.
 *
 * Also hooks:
 * - IAGKBFCKFKB: changes RealMoney->Gold (safety net)
 * - HDDFDBIKKFH: sets currency amount to 999999
 */

#define IAGKBFCKFKB_RVA 0x340CE28
#define HDDFDBIKKFH_RVA 0x305A128
#define MAKEPURCHASE_RVA 0x334BB34
#define ENTRY_SIZE 16

static void write_log(const char* msg) {
    FILE* fp = fopen("/sdcard/Download/sf2-iap-log.txt", "a");
    if (fp) { fprintf(fp, "%s\n", msg); fclose(fp); }
}

static uintptr_t find_libil2cpp() {
    FILE* fp = fopen("/proc/self/maps", "r");
    if (!fp) return 0;
    char line[512];
    uintptr_t base = 0;
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, "libil2cpp.so")) {
            sscanf(line, "%lx-", &base);
            break;
        }
    }
    fclose(fp);
    return base;
}

static int make_writable(void* addr, size_t len) {
    long page = sysconf(_SC_PAGESIZE);
    void* start = (void*)((uintptr_t)addr & ~(page - 1));
    int ret = mprotect(start, len + page, PROT_READ | PROT_WRITE | PROT_EXEC);
    if (ret != 0) {
        LOGE("mprotect failed for %p: %d", addr, ret);
        write_log("ERROR: mprotect failed");
    }
    return ret == 0;
}

static void flush_icache(void* addr, size_t len) {
    uintptr_t a = (uintptr_t)addr & ~15UL;
    for (uintptr_t i = a; i < (uintptr_t)addr + len; i += 16) {
        __asm__ volatile("dc cvau, %0" :: "r"(i));
        __asm__ volatile("ic ivau, %0" :: "r"(i));
    }
    __asm__ volatile("dsb ish");
    __asm__ volatile("isb");
}

/* ==== IL2CPP API types ==== */
typedef void* Il2CppDomain;
typedef void* Il2CppAssembly;
typedef void* Il2CppImage;
typedef void* Il2CppClass;
typedef void* Il2CppMethod;
typedef void* Il2CppObject;
typedef void* Il2CppString;
typedef void* Il2CppField;
typedef void* Il2CppThread;

typedef struct {
    const char* name;
    const char* type;
    uint32_t token;
} Il2CppMethodInterfaceOffsetInfo;

/* ==== IL2CPP API function pointers ==== */
static Il2CppDomain (*fp_il2cpp_domain_get)(void);
static const Il2CppAssembly** (*fp_il2cpp_domain_get_assemblies)(const Il2CppDomain*, size_t*);
static Il2CppImage* (*fp_il2cpp_assembly_get_image)(const Il2CppAssembly*);
static Il2CppClass* (*fp_il2cpp_class_from_name)(const Il2CppImage*, const char*, const char*);
static Il2CppMethod* (*fp_il2cpp_class_get_method_from_name)(Il2CppClass*, const char*, int);
static Il2CppObject* (*fp_il2cpp_runtime_invoke)(const Il2CppMethod*, void*, void**, void**);
static Il2CppString* (*fp_il2cpp_string_new)(const char*);
static Il2CppThread* (*fp_il2cpp_thread_attach)(Il2CppDomain*);
static Il2CppObject* (*fp_il2cpp_object_new)(const Il2CppClass*);
static void (*fp_il2cpp_field_set_value)(Il2CppObject*, Il2CppField*, void*);

static int il2cpp_api_loaded = 0;

static int load_il2cpp_api(void) {
    void* handle = dlopen("libil2cpp.so", RTLD_NOW | RTLD_NOLOAD);
    if (!handle) {
        LOGE("dlopen libil2cpp.so failed: %s", dlerror());
        return 0;
    }

    #define LOAD_API(name) fp_##name = (typeof(fp_##name))dlsym(handle, #name); \
        if (!fp_##name) { LOGE("Missing: " #name); return 0; }

    LOAD_API(il2cpp_domain_get)
    LOAD_API(il2cpp_domain_get_assemblies)
    LOAD_API(il2cpp_assembly_get_image)
    LOAD_API(il2cpp_class_from_name)
    LOAD_API(il2cpp_class_get_method_from_name)
    LOAD_API(il2cpp_runtime_invoke)
    LOAD_API(il2cpp_string_new)
    LOAD_API(il2cpp_thread_attach)
    LOAD_API(il2cpp_object_new)

    #undef LOAD_API

    il2cpp_api_loaded = 1;
    write_log("IL2CPP API loaded successfully");
    return 1;
}

/* ==== Cached IL2CPP references ==== */
static Il2CppClass* class_MGNPHCAAEIO = 0;
static Il2CppMethod* method_IAGKBFCKFKB_5 = 0; /* 5 parameters version */
static Il2CppMethod* method_IAGKBFCKFKB_4 = 0; /* 4 parameters version */

static int find_il2cpp_methods(void) {
    Il2CppDomain* domain = fp_il2cpp_domain_get();
    if (!domain) { write_log("ERROR: il2cpp_domain_get failed"); return 0; }

    fp_il2cpp_thread_attach(domain);

    size_t count = 0;
    const Il2CppAssembly** assemblies = fp_il2cpp_domain_get_assemblies(domain, &count);
    if (!assemblies) { write_log("ERROR: no assemblies"); return 0; }

    /* Find MGNPHCAAEIO class in any assembly */
    for (size_t i = 0; i < count && !class_MGNPHCAAEIO; i++) {
        Il2CppImage* image = fp_il2cpp_assembly_get_image(assemblies[i]);
        if (!image) continue;
        class_MGNPHCAAEIO = fp_il2cpp_class_from_name(image, "", "MGNPHCAAEIO");
    }

    if (!class_MGNPHCAAEIO) { write_log("ERROR: MGNPHCAAEIO class not found"); return 0; }
    write_log("Found MGNPHCAAEIO class");

    /* Find IAGKBFCKFKB methods */
    /* First overload: (HOOAAGABMBL, KGNNFOHIBBD, int, Action, bool) = 5 params */
    method_IAGKBFCKFKB_5 = fp_il2cpp_class_get_method_from_name(class_MGNPHCAAEIO, "IAGKBFCKFKB", 5);
    /* Second overload: (HOOAAGABMBL, IGFGDDANEPE, KGNNFOHIBBD, int, Action, bool) = 6 params */
    /* Try with 4 params first (default params might reduce visible count) */
    method_IAGKBFCKFKB_4 = fp_il2cpp_class_get_method_from_name(class_MGNPHCAAEIO, "IAGKBFCKFKB", 4);

    char buf[128];
    snprintf(buf, sizeof(buf), "IAGKBFCKFKB_5=%p IAGKBFCKFKB_4=%p",
             (void*)method_IAGKBFCKFKB_5, (void*)method_IAGKBFCKFKB_4);
    write_log(buf);

    return (method_IAGKBFCKFKB_5 || method_IAGKBFCKFKB_4) ? 1 : 0;
}

/* ==== Hook trampolines ==== */
static uint8_t TRAMP_MAKE[32] __attribute__((aligned(16)));
static uint8_t TRAMP_IAPK[32] __attribute__((aligned(16)));
static uint8_t TRAMP_HDDF[32] __attribute__((aligned(16)));

static void install_entry_hook(uintptr_t target, uint8_t* tramp, const char* name) {
    /* Copy original 16 bytes to trampoline */
    memcpy(tramp, (void*)target, ENTRY_SIZE);
    /* Append: ldr x16, [pc, #8]; br x16; .quad target+16 */
    tramp[16] = 0x50; tramp[17] = 0x00; tramp[18] = 0x00; tramp[19] = 0x58;
    tramp[20] = 0x00; tramp[21] = 0x02; tramp[22] = 0x1F; tramp[23] = 0xD6;
    uintptr_t cont = target + ENTRY_SIZE;
    memcpy(tramp + 24, &cont, 8);

    /* Write entry: ldr x16, [pc, #8]; br x16; .quad tramp */
    if (!make_writable((void*)target, 32)) {
        char buf[128];
        snprintf(buf, sizeof(buf), "ERROR: mprotect failed for %s", name);
        write_log(buf);
        return;
    }
    uint8_t entry[ENTRY_SIZE];
    entry[0] = 0x50; entry[1] = 0x00; entry[2] = 0x00; entry[3] = 0x58;
    entry[4] = 0x00; entry[5] = 0x02; entry[6] = 0x1F; entry[7] = 0xD6;
    uintptr_t tramp_ptr = (uintptr_t)tramp;
    memcpy(entry + 8, &tramp_ptr, 8);
    memcpy((void*)target, entry, ENTRY_SIZE);
    flush_icache((void*)target, ENTRY_SIZE);

    char buf[128];
    snprintf(buf, sizeof(buf), "%s hook installed @ 0x%lx", name, (long)target);
    write_log(buf);
}

/* ==== IAGKBFCKFKB hook (safety net: RealMoney->Gold) ==== */
static void hooked_iapk(uint64_t x0, uint64_t x1, uint64_t x2, uint64_t x3, uint64_t x4) {
    int currencyType = (int)x1;
    if (currencyType == 3) {
        x1 = 1; /* Gold */
        write_log("IAPK hook: RealMoney->Gold");
    }
    typedef void (*fn)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
    ((fn)TRAMP_IAPK)(x0, x1, x2, x3, x4);
}

/* ==== HDDFDBIKKFH hook: amount=999999 ==== */
static void hooked_hddf(uint64_t x0, uint64_t x1, uint64_t x2) {
    x1 = 999999;
    typedef void (*fn)(uint64_t, uint64_t, uint64_t);
    ((fn)TRAMP_HDDF)(x0, x1, x2);
}

/* ==== MakePurchase hook: intercept before Google Play ==== */
/*
 * PaymentUI.MakePurchase(HOOAAGABMBL item, Nullable<ObscuredLong> price)
 * x0 = this (PaymentUI)
 * x1 = HOOAAGABMBL (item)
 * x2 = Nullable<ObscuredLong>* (price override pointer)
 *
 * Strategy: Instead of calling original (which goes to Unity IAP -> Google Play),
 * we check if item has RealMoneyItem ID. If so, call IAGKBFCKFKB directly
 * with KGNNFOHIBBD=1 (Gold).
 */
typedef void (*fn_makepurchase)(uint64_t, uint64_t, uint64_t);

static void hooked_makepurchase(uint64_t x0, uint64_t x1, uint64_t x2) {
    if (!il2cpp_api_loaded || !method_IAGKBFCKFKB_5) {
        /* Fallback: call original */
        ((fn_makepurchase)TRAMP_MAKE)(x0, x1, x2);
        return;
    }

    /*
     * Check if item is a real-money item by examining its string fields.
     * HOOAAGABMBL fields at various offsets are strings.
     * We'll check offset 0x10 (DPLBMJODBEK type) for "RealMoneyItem".
     *
     * Actually, let's use a simpler approach: just ALWAYS redirect to Gold.
     * This means ALL purchases go through Gold path (no Google Play).
     * The player has 999999 Gold from HDDFDBIKKFH hook, so it always succeeds.
     */

    /* Call IAGKBFCKFKB via IL2CPP runtime_invoke */
    /* params: x0=item, x1=Gold(1), x2=amount(1), x3=callback(null), x4=bool(1) */
    void* args[5];
    args[0] = (void*)x1;           /* item */
    args[1] = (void*)(uint64_t)1;  /* KGNNFOHIBBD = Gold */
    args[2] = (void*)(uint64_t)1;  /* amount */
    args[3] = NULL;                 /* callback (null) */
    args[4] = (void*)(uint64_t)1;  /* bool = true */

    void* exc = NULL;
    write_log("MakePurchase intercepted -> calling IAGKBFCKFKB(Gold) via IL2CPP");
    fp_il2cpp_runtime_invoke(method_IAGKBFCKFKB_5, NULL, args, &exc);

    if (exc) {
        write_log("ERROR: IAGKBFCKFKB invoke failed, falling back to original");
        ((fn_makepurchase)TRAMP_MAKE)(x0, x1, x2);
    }
}

/* ==== Main hook thread ==== */
static void* hook_thread(void* arg) {
    write_log("=== SF2 IAP Bypass v27 ===");

    /* Load IL2CPP API */
    if (!load_il2cpp_api()) {
        write_log("ERROR: Failed to load IL2CPP API");
        return NULL;
    }

    /* Find libil2cpp base */
    uintptr_t il2cpp_base = 0;
    for (int i = 0; i < 200; i++) {
        il2cpp_base = find_libil2cpp();
        if (il2cpp_base) break;
        usleep(100000);
    }
    if (!il2cpp_base) {
        write_log("ERROR: libil2cpp.so not found");
        return NULL;
    }
    { char buf[128]; snprintf(buf, sizeof(buf), "libil2cpp.so base=0x%lx", (long)il2cpp_base); write_log(buf); }

    /* Find IL2CPP methods */
    if (!find_il2cpp_methods()) {
        write_log("ERROR: Failed to find IL2CPP methods");
        return NULL;
    }

    /* Hook 1: MakePurchase - intercept before Google Play */
    uintptr_t makepurchase_target = il2cpp_base + MAKEPURCHASE_RVA;
    install_entry_hook(makepurchase_target, TRAMP_MAKE, "MakePurchase");

    /* Hook 2: IAGKBFCKFKB - safety net (RealMoney->Gold) */
    uintptr_t iapk_target = il2cpp_base + IAGKBFCKFKB_RVA;
    install_entry_hook(iapk_target, TRAMP_IAPK, "IAGKBFCKFKB");

    /* Hook 3: HDDFDBIKKFH - amount=999999 */
    uintptr_t hddf_target = il2cpp_base + HDDFDBIKKFH_RVA;
    install_entry_hook(hddf_target, TRAMP_HDDF, "HDDFDBIKKFH");

    write_log("=== All hooks installed ===");
    return NULL;
}

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    write_log("=== JNI_OnLoad ===");
    pthread_t tid;
    pthread_create(&tid, NULL, hook_thread, NULL);
    pthread_detach(tid);
    return JNI_VERSION_1_6;
}
