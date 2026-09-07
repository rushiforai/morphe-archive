#include <jni.h>
#include <string.h>
#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/mman.h>
#include <pthread.h>
#include <stdint.h>
#include <dlfcn.h>
#include <signal.h>
#include <fcntl.h>

#define LOG_TAG "SF2IAP"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, LOG_TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, LOG_TAG, __VA_ARGS__)
#include <android/log.h>

/*
 * Shadow Fight 2 - IAP Bypass v38
 *
 * Strategy:
 * 1. Hook GooglePlayStore.Purchase at entry → block Google Play from opening
 * 2. Use IL2CPP API to find PurchasingManager, call OnPurchaseSucceeded
 *    with fake receipt → triggers normal purchase flow
 * 3. Method pointer rewrite for VerifyPurchase/ConfirmPurchase → call
 *    success callback immediately → bypasses server verification hang
 *
 * Key difference from v36: method pointer rewrite modifies MethodInfo[0x00]
 * (the function pointer slot in the method metadata), NOT the .text section.
 * This avoids corrupting executable code.
 */

#define PURCHASE_RVA 0x3C6368C
#define ONSUCCESS_RVA 0x3C49BA0
#define ENTRY_SIZE 16

static void write_log(const char* msg) {
    FILE* fp = fopen("/sdcard/Download/sf2-iap-v38.txt", "a");
    if (fp) { fprintf(fp, "%s\n", msg); fclose(fp); }
}

static void write_crash(int sig, siginfo_t* info, void* ctx) {
    FILE* fp = fopen("/sdcard/Download/sf2-iap-v38-crash.txt", "a");
    if (fp) {
        fprintf(fp, "=== CRASH sig=%d fault=%p pc=%p ===\n",
                sig, info->si_addr, __builtin_return_address(0));
        fflush(fp);
        fsync(fileno(fp));
        fclose(fp);
    }
    _exit(1);
}

static uintptr_t find_libil2cpp(void) {
    FILE* fp = fopen("/proc/self/maps", "r");
    if (!fp) return 0;
    char line[512];
    uintptr_t base = 0;
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, "libil2cpp.so") && strstr(line, "r-xp")) {
            sscanf(line, "%lx-", &base);
            break;
        }
    }
    fclose(fp);
    return base;
}

static uintptr_t find_libil2cpp_fullpath(char* buf, size_t len) {
    FILE* fp = fopen("/proc/self/maps", "r");
    if (!fp) return 0;
    char line[512];
    uintptr_t base = 0;
    while (fgets(line, sizeof(line), fp)) {
        if (strstr(line, "libil2cpp.so")) {
            char* path = strchr(line, '/');
            if (path) {
                char* nl = strchr(path, '\n');
                if (nl) *nl = 0;
                strncpy(buf, path, len);
                sscanf(line, "%lx-", &base);
            }
            break;
        }
    }
    fclose(fp);
    return base;
}

static int make_writable(void* addr, size_t len) {
    long page = sysconf(_SC_PAGESIZE);
    void* start = (void*)((uintptr_t)addr & ~(page - 1));
    size_t alloc_len = ((len + page - 1) / page) * page + page;
    int ret = mprotect(start, alloc_len, PROT_READ | PROT_WRITE | PROT_EXEC);
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

/* ==== IL2CPP API function pointers ==== */
static Il2CppDomain (*fp_il2cpp_domain_get)(void);
static const Il2CppAssembly** (*fp_il2cpp_domain_get_assemblies)(const Il2CppDomain*, size_t*);
static Il2CppImage* (*fp_il2cpp_assembly_get_image)(const Il2CppAssembly*);
static Il2CppClass* (*fp_il2cpp_class_from_name)(const Il2CppImage*, const char*, const char*);
static Il2CppMethod* (*fp_il2cpp_class_get_method_from_name)(Il2CppClass*, const char*, int);
static void* (*fp_il2cpp_class_get_field_from_name)(Il2CppClass*, const char*);
static Il2CppObject* (*fp_il2cpp_object_new)(const Il2CppClass*);
static Il2CppString* (*fp_il2cpp_string_new)(const char*);
static void (*fp_il2cpp_field_set_value)(Il2CppObject*, Il2CppField*, void*);
static Il2CppField* (*fp_il2cpp_field_get_offset_val)(Il2CppField*);

static int il2cpp_api_loaded = 0;

static int load_il2cpp_api(void* handle) {
    #define LOAD(name) fp_##name = (typeof(fp_##name))dlsym(handle, #name); \
        if (!fp_##name) { LOGE("Missing: " #name); return 0; }

    LOAD(il2cpp_domain_get)
    LOAD(il2cpp_domain_get_assemblies)
    LOAD(il2cpp_assembly_get_image)
    LOAD(il2cpp_class_from_name)
    LOAD(il2cpp_class_get_method_from_name)
    LOAD(il2cpp_class_get_field_from_name)
    LOAD(il2cpp_object_new)
    LOAD(il2cpp_string_new)
    LOAD(il2cpp_field_set_value)

    #undef LOAD

    il2cpp_api_loaded = 1;
    write_log("IL2CPP API loaded OK");
    return 1;
}

/* ==== Hook trampolines ==== */
static uint8_t TRAMP_PURCHASE[32] __attribute__((aligned(16)));

static void install_entry_hook(uintptr_t target, uint8_t* tramp, const char* name) {
    memcpy(tramp, (void*)target, ENTRY_SIZE);
    tramp[16] = 0x50; tramp[17] = 0x00; tramp[18] = 0x00; tramp[19] = 0x58;
    tramp[20] = 0x00; tramp[21] = 0x02; tramp[22] = 0x1F; tramp[23] = 0xD6;
    uintptr_t cont = target + ENTRY_SIZE;
    memcpy(tramp + 24, &cont, 8);

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

/* ==== Cached IL2CPP refs ==== */
static Il2CppMethod* method_OnPurchaseSucceeded = 0;
static uintptr_t il2cpp_base = 0;

static void find_purchase_methods(void) {
    Il2CppDomain* domain = fp_il2cpp_domain_get();
    if (!domain) { write_log("ERROR: domain_get failed"); return; }

    size_t count = 0;
    const Il2CppAssembly** assemblies = fp_il2cpp_domain_get_assemblies(domain, &count);
    if (!assemblies) { write_log("ERROR: no assemblies"); return; }

    char buf[256];

    /* Find PurchasingManager.OnPurchaseSucceeded(string, string, string) */
    for (size_t i = 0; i < count; i++) {
        Il2CppImage* image = fp_il2cpp_assembly_get_image(assemblies[i]);
        if (!image) continue;

        Il2CppClass* klass = fp_il2cpp_class_from_name(image, "UnityEngine.Purchasing", "PurchasingManager");
        if (!klass) continue;

        snprintf(buf, sizeof(buf), "Found PurchasingManager in assembly %zu", i);
        write_log(buf);

        method_OnPurchaseSucceeded = fp_il2cpp_class_get_method_from_name(klass, "OnPurchaseSucceeded", 3);
        if (method_OnPurchaseSucceeded) {
            snprintf(buf, sizeof(buf), "OnPurchaseSucceeded(3) methodPtr=%p", *(void**)method_OnPurchaseSucceeded);
            write_log(buf);
        }
        break;
    }

    if (!method_OnPurchaseSucceeded) {
        write_log("WARNING: OnPurchaseSucceeded not found via class search, using RVA");
        method_OnPurchaseSucceeded = (Il2CppMethod*)(il2cpp_base + ONSUCCESS_RVA);
    }
}

/* ==== GooglePlayStore.Purchase hook ==== */
/*
 * GooglePlayStore.Purchase(ProductDefinition product, string dummy)
 * x0 = this (GooglePlayStore instance)
 * x1 = ProductDefinition*
 * x2 = dummy string
 *
 * Strategy: Block Google Play, then call OnPurchaseSucceeded directly.
 */
typedef void (*fn_purchase)(uint64_t, uint64_t, uint64_t);

static void hooked_purchase(uint64_t x0, uint64_t x1, uint64_t x2) {
    write_log(">>> PURCHASE INTERCEPTED");

    if (!il2cpp_api_loaded) {
        write_log("WARNING: IL2CPP not loaded, calling original");
        ((fn_purchase)TRAMP_PURCHASE)(x0, x1, x2);
        return;
    }

    /* Extract product ID from ProductDefinition (offset 0x18 = storeSpecificId) */
    void* product_id_ptr = *(void**)(x1 + 0x18);
    char product_id[256] = "unknown";
    if (product_id_ptr) {
        /* Il2CppString: offset 0x10 = length, offset 0x14 = first char (UTF-16) */
        int len = *(int*)(product_id_ptr + 0x10);
        if (len > 0 && len < 128) {
            uint16_t* chars = (uint16_t*)(product_id_ptr + 0x14);
            for (int i = 0; i < len && i < 255; i++) {
                product_id[i] = (char)chars[i];
            }
            product_id[len] = 0;
        }
    }

    char buf[512];
    snprintf(buf, sizeof(buf), "Product: %s", product_id);
    write_log(buf);

    /* Get PurchasingManager instance:
     * GooglePlayStore + 0x30 = m_GooglePurchaseCallback (GooglePlayPurchaseCallback)
     * GooglePlayPurchaseCallback + 0x10 = m_StoreCallback (PurchasingManager)
     */
    void* google_play_cb = *(void**)(x0 + 0x30);
    if (!google_play_cb) {
        write_log("ERROR: m_GooglePurchaseCallback is NULL");
        ((fn_purchase)TRAMP_PURCHASE)(x0, x1, x2);
        return;
    }

    void* purchasing_mgr = *(void**)(google_play_cb + 0x10);
    if (!purchasing_mgr) {
        write_log("ERROR: m_StoreCallback (PurchasingManager) is NULL");
        ((fn_purchase)TRAMP_PURCHASE)(x0, x1, x2);
        return;
    }

    snprintf(buf, sizeof(buf), "PurchasingManager=%p", purchasing_mgr);
    write_log(buf);

    if (method_OnPurchaseSucceeded) {
        /* Create fake receipt and transaction ID strings */
        void* receipt = fp_il2cpp_string_new("{}");
        void* tx_id = fp_il2cpp_string_new("fake_tx_001");

        /* Call OnPurchaseSucceeded(id, receipt, txId) directly via method pointer */
        typedef void (*fn_onsuccess)(void* this, void* id, void* receipt, void* tx);
        fn_onsuccess fn = (fn_onsuccess)(*(void**)method_OnPurchaseSucceeded);

        snprintf(buf, sizeof(buf), "Calling OnPurchaseSucceeded(%s, {}, fake_tx_001)", product_id);
        write_log(buf);

        fn(purchasing_mgr, product_id_ptr, receipt, tx_id);
        write_log("OnPurchaseSucceeded returned OK");
    } else {
        write_log("ERROR: method_OnPurchaseSucceeded is NULL");
        ((fn_purchase)TRAMP_PURCHASE)(x0, x1, x2);
    }
}

/* ==== VerifyPurchase / ConfirmPurchase callback hook ==== */
/*
 * These are NOT entry hooks. We modify the methodPointer field in MethodInfo
 * (offset 0x00) to redirect the method to our function.
 *
 * VerifyPurchase(CFEFALDOEMD paymentData, Action<bool, string, object> callback)
 * x0 = this (ServerProvider)
 * x1 = paymentData
 * x2 = callback (Action<bool, string, object>)
 *
 * Delegate layout (IL2CPP Unity 2021):
 *   offset 0x00: klass
 *   offset 0x08: monitor
 *   offset 0x10: method_ptr
 *   offset 0x18: invoke_impl
 *   offset 0x20: target
 *   offset 0x28: method info
 */
static void invoke_action3_callback(void* callback, int success) {
    if (!callback) return;

    void* method_ptr = *(void**)((uintptr_t)callback + 0x10);
    void* target = *(void**)((uintptr_t)callback + 0x20);

    if (!method_ptr) {
        write_log("ERROR: callback method_ptr is NULL");
        return;
    }

    void* ok_str = fp_il2cpp_string_new("OK");

    typedef void (*action_fn)(void* target, int arg1, void* arg2, void* arg3);
    action_fn fn = (action_fn)method_ptr;

    char buf[256];
    snprintf(buf, sizeof(buf), "Invoking callback: ptr=%p target=%p success=%d",
             method_ptr, target, success);
    write_log(buf);

    fn(target, success, ok_str, NULL);
    write_log("Callback returned OK");
}

static void hooked_verify_purchase(void* this, void* paymentData, void* callback) {
    write_log(">>> VerifyPurchase intercepted");
    invoke_action3_callback(callback, 1);
}

static void hooked_confirm_purchase(void* this, void* paymentData, void* callback) {
    write_log(">>> ConfirmPurchase intercepted");
    invoke_action3_callback(callback, 1);
}

/* ==== Main hook thread ==== */
static void* hook_thread(void* arg) {
    write_log("=== SF2 IAP Bypass v38 ===");

    struct sigaction sa;
    sa.sa_sigaction = write_crash;
    sa.sa_flags = SA_SIGINFO;
    sigemptyset(&sa.sa_mask);
    sigaction(SIGSEGV, &sa, NULL);
    sigaction(SIGBUS, &sa, NULL);
    sigaction(SIGABRT, &sa, NULL);

    /* Find libil2cpp.so full path and load API */
    char il2cpp_path[256] = {0};
    il2cpp_base = find_libil2cpp_fullpath(il2cpp_path, sizeof(il2cpp_path));
    if (!il2cpp_base) {
        write_log("ERROR: libil2cpp.so not found in maps");
        return NULL;
    }

    char buf[512];
    snprintf(buf, sizeof(buf), "libil2cpp base=0x%lx path=%s", (long)il2cpp_base, il2cpp_path);
    write_log(buf);

    /* Load IL2CPP API from full path (bypasses linker namespace) */
    void* il2cpp_handle = dlopen(il2cpp_path, RTLD_NOW);
    if (!il2cpp_handle) {
        snprintf(buf, sizeof(buf), "ERROR: dlopen failed: %s", dlerror());
        write_log(buf);
        return NULL;
    }

    if (!load_il2cpp_api(il2cpp_handle)) {
        write_log("ERROR: Failed to load IL2CPP API");
        return NULL;
    }

    /* Find purchase methods */
    find_purchase_methods();

    /* Install GooglePlayStore.Purchase entry hook */
    uintptr_t purchase_target = il2cpp_base + PURCHASE_RVA;
    install_entry_hook(purchase_target, TRAMP_PURCHASE, "GooglePlayStore.Purchase");

    /* Find and rewrite VerifyPurchase / ConfirmPurchase method pointers */
    Il2CppDomain* domain = fp_il2cpp_domain_get();
    if (domain) {
        size_t count = 0;
        const Il2CppAssembly** assemblies = fp_il2cpp_domain_get_assemblies(domain, &count);

        for (size_t i = 0; i < count; i++) {
            Il2CppImage* image = fp_il2cpp_assembly_get_image(assemblies[i]);
            if (!image) continue;

            /* Find ServerProvider class */
            Il2CppClass* klass = fp_il2cpp_class_from_name(image, "", "ServerProvider");
            if (!klass) continue;

            snprintf(buf, sizeof(buf), "Found ServerProvider in assembly %zu", i);
            write_log(buf);

            /* Find VerifyPurchase (2 params) */
            Il2CppMethod* vp = fp_il2cpp_class_get_method_from_name(klass, "VerifyPurchase", 2);
            if (vp) {
                void* orig_ptr = *(void**)vp;
                snprintf(buf, sizeof(buf), "VerifyPurchase: orig=%p, rewriting to hooked_verify_purchase", orig_ptr);
                write_log(buf);

                /* Save original for potential fallback */
                *(void**)vp = hooked_verify_purchase;
                write_log("VerifyPurchase method pointer rewritten");
            } else {
                write_log("WARNING: VerifyPurchase not found");
            }

            /* Find ConfirmPurchase (2 params) */
            Il2CppMethod* cp = fp_il2cpp_class_get_method_from_name(klass, "ConfirmPurchase", 2);
            if (cp) {
                void* orig_ptr = *(void**)cp;
                snprintf(buf, sizeof(buf), "ConfirmPurchase: orig=%p, rewriting to hooked_confirm_purchase", orig_ptr);
                write_log(buf);

                *(void**)cp = hooked_confirm_purchase;
                write_log("ConfirmPurchase method pointer rewritten");
            } else {
                write_log("WARNING: ConfirmPurchase not found");
            }

            break;
        }
    }

    write_log("=== All hooks installed ===");
    return NULL;
}

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    write_log("=== JNI_OnLoad v38 ===");
    pthread_t tid;
    pthread_create(&tid, NULL, hook_thread, NULL);
    pthread_detach(tid);
    return JNI_VERSION_1_6;
}
