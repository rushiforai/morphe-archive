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
#include <setjmp.h>
#include <link.h>

#define LOG_TAG "SF2IAP"
#include <android/log.h>

/*
 * Shadow Fight 2 - IAP Bypass v44
 *
 * Method pointer rewrite + vtable scan.
 * Async OnPurchaseSucceeded with thread attach + GC-safe string copy.
 */

static volatile int g_log_busy = 0;

static void write_log(const char* msg) {
    if (g_log_busy) return;
    g_log_busy = 1;
    FILE* fp = fopen("/sdcard/Download/sf2-iap-v44.txt", "a");
    if (fp) { fprintf(fp, "%s\n", msg); fflush(fp); fclose(fp); }
    g_log_busy = 0;
}

/* ==== IL2CPP API ==== */
typedef void* Il2CppDomain;
typedef void* Il2CppAssembly;
typedef void* Il2CppImage;
typedef void* Il2CppClass;
typedef void* Il2CppMethod;
typedef void* Il2CppString;
typedef void* Il2CppThread;

static Il2CppDomain (*fp_domain_get)(void);
static const Il2CppAssembly** (*fp_domain_get_assemblies)(const Il2CppDomain*, size_t*);
static Il2CppImage* (*fp_assembly_get_image)(const Il2CppAssembly*);
static Il2CppClass* (*fp_class_from_name)(const Il2CppImage*, const char*, const char*);
static Il2CppMethod* (*fp_class_get_method_from_name)(Il2CppClass*, const char*, int);
static Il2CppString* (*fp_string_new)(const char*);
static Il2CppThread* (*fp_thread_attach)(const Il2CppDomain*);
static Il2CppThread* (*fp_thread_current)(void);
static void* (*fp_domain_get_assemblies_fn)(const Il2CppDomain*, size_t*);

static Il2CppDomain* g_domain = NULL;

static int load_api(void* h) {
    int ok = 1;
    #define L(sym, var) fp_##var = dlsym(h, "il2cpp_" #var); if(!fp_##var) { write_log("MISSING: il2cpp_" #var); ok=0; }
    L(x, domain_get);
    L(x, domain_get_assemblies);
    L(x, assembly_get_image);
    L(x, class_from_name);
    L(x, class_get_method_from_name);
    L(x, string_new);
    L(x, thread_attach);
    L(x, thread_current);
    #undef L
    if (ok) write_log("API loaded (8 functions)");
    else write_log("API load FAILED");
    return ok;
}

/* ==== Crash guard ==== */
static sigjmp_buf g_jmp;

static void on_crash(int sig, siginfo_t* info, void* ctx) {
    siglongjmp(g_jmp, 1);
}

static struct sigaction g_old_segv, g_old_abrt;

static void guard_on(void) {
    struct sigaction sa;
    sa.sa_sigaction = on_crash;
    sa.sa_flags = SA_SIGINFO;
    sigemptyset(&sa.sa_mask);
    sigaction(SIGSEGV, &sa, &g_old_segv);
    sigaction(SIGABRT, &sa, &g_old_abrt);
}

static void guard_off(void) {
    sigaction(SIGSEGV, &g_old_segv, NULL);
    sigaction(SIGABRT, &g_old_abrt, NULL);
}

#define SAFE(type, call) ({ \
    type _r = (type)0; \
    guard_on(); \
    if (sigsetjmp(g_jmp, 1) == 0) { \
        _r = call; \
    } \
    guard_off(); \
    _r; \
})

/* ==== Hook function ==== */
static Il2CppMethod* m_OnPurchaseSucceeded = 0;

/* Crash recovery for OnPurchaseSucceeded call */
static sigjmp_buf g_hook_jmp;
static volatile int g_hook_crashed = 0;
static volatile int g_hook_sig = 0;
static volatile void* g_hook_fault = NULL;

static void hook_crash_handler(int sig, siginfo_t* info, void* ctx) {
    g_hook_crashed = 1;
    g_hook_sig = sig;
    g_hook_fault = info->si_addr;
    siglongjmp(g_hook_jmp, 1);
}

/* GC-safe: copy product ID from Il2CppString into native buffer */
static void copy_product_id(void* il2cpp_str, char* out, int max) {
    out[0] = 0;
    if (!il2cpp_str) return;
    int len = *(int*)((uintptr_t)il2cpp_str + 0x10);
    if (len <= 0 || len >= max) return;
    uint16_t* chars = (uint16_t*)((uintptr_t)il2cpp_str + 0x14);
    for (int i = 0; i < len; i++) out[i] = (char)chars[i];
    out[len] = 0;
}

static void* async_purchase_thread(void* arg) {
    /* Attach this thread to IL2CPP runtime */
    if (fp_thread_attach && g_domain) {
        fp_thread_attach(g_domain);
        write_log("Async: thread attached to IL2CPP");
    }

    /* Wait for game state to settle */
    usleep(1000000);

    write_log("Async: attempting OnPurchaseSucceeded...");

    if (!m_OnPurchaseSucceeded || !fp_string_new) {
        write_log("Async: not ready");
        return NULL;
    }

    /* Read stored values (native copies, GC-safe) */
    extern void* g_async_mgr;
    extern char g_async_pid_str[256];

    if (!g_async_mgr || !g_async_pid_str[0]) {
        write_log("Async: mgr or pid empty");
        return NULL;
    }

    /* Create new IL2CPP strings from native copies */
    void* product_id_str = fp_string_new(g_async_pid_str);
    void* receipt = fp_string_new("{}");
    void* tx_id = fp_string_new("fake_tx_001");

    typedef void (*fn_t)(void*, void*, void*, void*);
    fn_t fn = (fn_t)(*(void**)m_OnPurchaseSucceeded);

    char buf[512];
    snprintf(buf, sizeof(buf), "Async: fn=%p mgr=%p pid_str=%p receipt=%p tx=%p",
             fn, g_async_mgr, product_id_str, receipt, tx_id);
    write_log(buf);

    struct sigaction sa, old_segv, old_abrt;
    sa.sa_sigaction = hook_crash_handler;
    sa.sa_flags = SA_SIGINFO;
    sigemptyset(&sa.sa_mask);
    sigaction(SIGSEGV, &sa, &old_segv);
    sigaction(SIGABRT, &sa, &old_abrt);
    g_hook_crashed = 0;

    if (sigsetjmp(g_hook_jmp, 1) == 0) {
        fn(g_async_mgr, product_id_str, receipt, tx_id);
        write_log("Async: OnPurchaseSucceeded returned OK!");
    } else {
        char cbuf[256];
        snprintf(cbuf, sizeof(cbuf), "Async: CRASHED sig=%d fault=%p", g_hook_sig, g_hook_fault);
        write_log(cbuf);
    }

    sigaction(SIGSEGV, &old_segv, NULL);
    sigaction(SIGABRT, &old_abrt, NULL);
    return NULL;
}

void* g_async_mgr = NULL;
char g_async_pid_str[256] = {0};

void hooked_purchase_entry(void* this_ptr, void* product_def, void* price_override) {
    write_log(">>> PURCHASE INTERCEPTED");

    if (!m_OnPurchaseSucceeded || !fp_string_new) {
        write_log("ERROR: not ready, blocking anyway");
        return;
    }

    /* Extract product ID into native buffer (GC-safe) */
    void* product_id_ptr = product_def ? *(void**)((uintptr_t)product_def + 0x18) : NULL;
    g_async_pid_str[0] = 0;
    copy_product_id(product_id_ptr, g_async_pid_str, sizeof(g_async_pid_str));

    char buf[512];
    snprintf(buf, sizeof(buf), "Product: %s", g_async_pid_str);
    write_log(buf);

    /* Get PurchasingManager via GooglePlayPurchaseCallback -> m_StoreCallback */
    void* gp_cb = *(void**)((uintptr_t)this_ptr + 0x30);
    void* mgr = gp_cb ? *(void**)((uintptr_t)gp_cb + 0x10) : NULL;
    if (!mgr) { write_log("ERROR: PurchasingManager NULL"); return; }

    snprintf(buf, sizeof(buf), "gp_cb=%p mgr=%p", gp_cb, mgr);
    write_log(buf);

    /* Store for async call */
    g_async_mgr = mgr;

    /* Spawn async thread */
    pthread_t tid;
    pthread_create(&tid, NULL, async_purchase_thread, NULL);
    pthread_detach(tid);

    write_log("Hook returning, async thread spawned");
}

/* ==== Init thread ==== */
static void* init_thread(void* arg) {
    write_log("=== SF2 IAP Bypass v44 ===");

    /* Wait for libil2cpp.so */
    void* handle = NULL;
    for (int i = 0; i < 120 && !handle; i++) {
        handle = dlopen("libil2cpp.so", RTLD_NOW | RTLD_NOLOAD);
        if (!handle) usleep(250000);
    }
    if (!handle) { write_log("ERROR: no libil2cpp"); return NULL; }
    write_log("libil2cpp found");

    if (!load_api(handle)) return NULL;

    /* Wait 20 seconds for IL2CPP runtime to fully initialize */
    write_log("Waiting 20s for IL2CPP runtime...");
    sleep(20);
    write_log("Wait done, starting init");

    /* Poll until all IL2CPP calls succeed */
    for (int attempt = 0; attempt < 120; attempt++) {
        char buf[256];

        Il2CppDomain* domain = SAFE(Il2CppDomain*, fp_domain_get());
        if (!domain) {
            if (attempt % 10 == 0) {
                snprintf(buf, sizeof(buf), "domain_get NULL, attempt %d", attempt);
                write_log(buf);
            }
            usleep(500000);
            continue;
        }
        g_domain = domain;

        size_t count = 0;
        const Il2CppAssembly** asms = SAFE(const Il2CppAssembly**, fp_domain_get_assemblies(domain, &count));
        if (!asms || count == 0) {
            if (attempt % 10 == 0) {
                snprintf(buf, sizeof(buf), "no assemblies, attempt %d", attempt);
                write_log(buf);
            }
            usleep(500000);
            continue;
        }

        snprintf(buf, sizeof(buf), "Got %zu assemblies", count);
        write_log(buf);

        /* Find GooglePlayStore.Purchase */
        Il2CppMethod* purchase_method = NULL;
        for (size_t i = 0; i < count; i++) {
            void* img = SAFE(void*, fp_assembly_get_image(asms[i]));
            if (!img) continue;
            void* klass = SAFE(void*, fp_class_from_name(img, "UnityEngine.Purchasing", "GooglePlayStore"));
            if (!klass) continue;
            snprintf(buf, sizeof(buf), "GooglePlayStore in asm %zu", i);
            write_log(buf);
            purchase_method = SAFE(Il2CppMethod*, fp_class_get_method_from_name(klass, "Purchase", 2));
            if (purchase_method) {
                snprintf(buf, sizeof(buf), "Purchase ptr=%p", *(void**)purchase_method);
                write_log(buf);
            }
            break;
        }

        /* Find PurchasingManager.OnPurchaseSucceeded */
        for (size_t i = 0; i < count; i++) {
            void* img = SAFE(void*, fp_assembly_get_image(asms[i]));
            if (!img) continue;
            void* klass = SAFE(void*, fp_class_from_name(img, "UnityEngine.Purchasing", "PurchasingManager"));
            if (!klass) continue;
            m_OnPurchaseSucceeded = SAFE(Il2CppMethod*, fp_class_get_method_from_name(klass, "OnPurchaseSucceeded", 3));
            if (m_OnPurchaseSucceeded) {
                snprintf(buf, sizeof(buf), "OnPurchaseSucceeded ptr=%p", *(void**)m_OnPurchaseSucceeded);
                write_log(buf);
            }
            break;
        }

        if (!purchase_method || !m_OnPurchaseSucceeded) {
            write_log("Methods not found yet");
            usleep(500000);
            continue;
        }

        long page = sysconf(_SC_PAGESIZE);
        void* orig_ptr = *(void**)purchase_method;

        /* REWRITE METHOD POINTER */
        void** slot = (void**)purchase_method;
        snprintf(buf, sizeof(buf), "MethodInfo rewrite: %p -> %p", orig_ptr, (void*)hooked_purchase_entry);
        write_log(buf);

        void* start = (void*)((uintptr_t)slot & ~(page - 1));
        if (mprotect(start, 2 * page, PROT_READ | PROT_WRITE) == 0) {
            slot[0] = (void*)hooked_purchase_entry;
            write_log("MethodInfo pointer rewritten");
        }

        /* REWRITE VTABLE ENTRY */
        void* klass_ptr = *(void**)((uintptr_t)purchase_method + 0x20);
        snprintf(buf, sizeof(buf), "Class=%p, scanning for vtable...", klass_ptr);
        write_log(buf);

        int vtable_found = 0;
        uintptr_t scan_start = (uintptr_t)klass_ptr;
        uintptr_t scan_end = scan_start + 0x2000;

        for (uintptr_t addr = scan_start; addr < scan_end; addr += sizeof(void*)) {
            void* val = *(void**)addr;
            if (val == orig_ptr) {
                snprintf(buf, sizeof(buf), "Vtable match at offset 0x%lx", (long)(addr - scan_start));
                write_log(buf);
                void* pg = (void*)(addr & ~(page - 1));
                if (mprotect(pg, page, PROT_READ | PROT_WRITE) == 0) {
                    *(void**)addr = (void*)hooked_purchase_entry;
                    vtable_found = 1;
                    write_log("Vtable entry rewritten!");
                }
                break;
            }
        }

        if (!vtable_found) {
            write_log("WARNING: vtable entry not found");
        }

        write_log("=== ALL REWRITES DONE ===");
        return NULL;
    }

    write_log("ERROR: init failed");
    return NULL;
}

JNIEXPORT jint JNI_OnLoad(JavaVM *vm, void *reserved) {
    write_log("=== JNI_OnLoad v44 ===");
    pthread_t tid;
    pthread_create(&tid, NULL, init_thread, NULL);
    pthread_detach(tid);
    return JNI_VERSION_1_6;
}
