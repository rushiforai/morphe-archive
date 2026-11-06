#define _GNU_SOURCE
#include <android/log.h>
#include <link.h>
#include <pthread.h>
#include <stdint.h>
#include <string.h>
#include <sys/mman.h>
#include <unistd.h>

#define TAG "PGOHOOK431"
#define LOGI(...) __android_log_print(ANDROID_LOG_INFO, TAG, __VA_ARGS__)
#define LOGE(...) __android_log_print(ANDROID_LOG_ERROR, TAG, __VA_ARGS__)

#define PAGE_SZ 4096UL

/*
 * The target is a tiny IL2CPP Vector3 setter, located by its machine code instead of a
 * hardcoded address, so it keeps working across game updates as long as the code is
 * identical and unique (verified: exactly one match in 0.431.0 and in 0.433.1):
 *   ldr x8,[x0,#0xe0]; cbz x8,+0x10; stp s0,s1,[x8,#16]; str s2,[x8,#24]; ret
 * If a future build has zero or several matches, the hook is NOT installed.
 */
static const uint8_t SIGNATURE[20] = {
    0x08, 0x70, 0x40, 0xf9, 0x88, 0x00, 0x00, 0xb4, 0x00, 0x05,
    0x02, 0x2d, 0x02, 0x19, 0x00, 0xbd, 0xc0, 0x03, 0x5f, 0xd6,
};

typedef void (*curve_set_t)(void *, float, float, float, void *);
static curve_set_t orig_curve_set;

static int hit_count;

static void curve_set_hook(void *self, float x, float y, float z, void *mi) {
    /* Log the first few calls so a log shows whether the game reaches this setter at all. */
    int n = __atomic_fetch_add(&hit_count, 1, __ATOMIC_RELAXED);
    float mag = x * x + y * y + z * z;
    int zero = mag < 0.000001f;
    if (n < 20)
        LOGI("curve setter call #%d in=(%f,%f,%f) %s", n + 1, (double)x, (double)y, (double)z,
             zero ? "zero vector -> forcing x=1" : "non-zero, unchanged");
    if (zero) x = 1.0f;
    orig_curve_set(self, x, y, z, mi);
}

struct scan_ctx {
    uintptr_t bias;          /* load bias of libil2cpp.so (0 = not found) */
    const ElfW(Phdr) *phdr;
    int phnum;
};

static int find_il2cpp_cb(struct dl_phdr_info *info, size_t size, void *data) {
    (void)size;
    struct scan_ctx *ctx = (struct scan_ctx *)data;
    if (!info->dlpi_name) return 0;
    size_t n = strlen(info->dlpi_name);
    static const char suffix[] = "/libil2cpp.so";
    if (n < sizeof(suffix) - 1 ||
        strcmp(info->dlpi_name + n - (sizeof(suffix) - 1), suffix) != 0)
        return 0;
    ctx->bias = (uintptr_t)info->dlpi_addr;
    ctx->phdr = info->dlpi_phdr;
    ctx->phnum = info->dlpi_phnum;
    return 1; /* stop iteration */
}

static int in_relro(const struct scan_ctx *ctx, uintptr_t addr) {
    for (int i = 0; i < ctx->phnum; i++) {
        const ElfW(Phdr) *p = &ctx->phdr[i];
        if (p->p_type != PT_GNU_RELRO) continue;
        uintptr_t lo = ctx->bias + p->p_vaddr;
        if (addr >= lo && addr < lo + p->p_memsz) return 1;
    }
    return 0;
}

static int install(const struct scan_ctx *ctx, uintptr_t target) {
    int found = 0;

    /* Method-pointer slots must be writable at load time, so only PF_W
     * PT_LOAD segments (.data.rel.ro / .data) can hold them. */
    for (int i = 0; i < ctx->phnum; i++) {
        const ElfW(Phdr) *p = &ctx->phdr[i];
        if (p->p_type != PT_LOAD || !(p->p_flags & PF_W)) continue;
        uintptr_t lo = (ctx->bias + p->p_vaddr + 7UL) & ~7UL;
        uintptr_t hi = ctx->bias + p->p_vaddr + p->p_memsz;
        for (uintptr_t a = lo; a + sizeof(uintptr_t) <= hi; a += sizeof(uintptr_t)) {
            if (*(volatile uintptr_t *)a != target) continue;
            uintptr_t page = a & ~(PAGE_SZ - 1UL);
            if (mprotect((void *)page, PAGE_SZ, PROT_READ | PROT_WRITE) != 0) {
                LOGE("mprotect RW failed slot=%lx", (unsigned long)a);
                continue;
            }
            orig_curve_set = (curve_set_t)target;
            __atomic_store_n((uintptr_t *)a, (uintptr_t)curve_set_hook, __ATOMIC_RELEASE);
            int prot = in_relro(ctx, a) ? PROT_READ : (PROT_READ | PROT_WRITE);
            if (mprotect((void *)page, PAGE_SZ, prot) != 0)
                LOGE("mprotect restore failed slot=%lx", (unsigned long)a);
            LOGI("patched slot=%lx", (unsigned long)a);
            ++found;
        }
    }
    return found;
}

/* Counts 4-byte-aligned SIGNATURE matches in executable segments; returns the last match. */
static uintptr_t find_unique_signature(const struct scan_ctx *ctx, int *count_out) {
    uintptr_t found = 0;
    int count = 0;
    for (int i = 0; i < ctx->phnum; i++) {
        const ElfW(Phdr) *p = &ctx->phdr[i];
        if (p->p_type != PT_LOAD || !(p->p_flags & PF_X)) continue;
        const uint8_t *cur = (const uint8_t *)(ctx->bias + p->p_vaddr);
        size_t left = p->p_filesz;
        while (left >= sizeof(SIGNATURE)) {
            const uint8_t *m = (const uint8_t *)memmem(cur, left, SIGNATURE, sizeof(SIGNATURE));
            if (!m) break;
            if (((uintptr_t)m & 3UL) == 0) {
                found = (uintptr_t)m;
                count++;
            }
            size_t advance = (size_t)(m - cur) + 1;
            cur += advance;
            left -= advance;
        }
    }
    *count_out = count;
    return count == 1 ? found : 0;
}

static void *worker(void *unused) {
    (void)unused;
    struct scan_ctx ctx;

    /* dl_iterate_phdr only lists fully linked libraries, so once libil2cpp.so
     * shows up its relocations are already applied. */
    for (int i = 0; i < 300; i++) {
        memset(&ctx, 0, sizeof(ctx));
        if (dl_iterate_phdr(find_il2cpp_cb, &ctx) && ctx.bias) break;
        ctx.bias = 0;
        usleep(100000);
    }
    if (!ctx.bias) {
        LOGE("libil2cpp.so not found after 30s");
        return NULL;
    }

    int signature_count = 0;
    uintptr_t target = find_unique_signature(&ctx, &signature_count);
    if (!target) {
        LOGE("throw setter signature matches=%d (expected exactly 1) - game version not "
             "supported, hook NOT installed", signature_count);
        return NULL;
    }
    LOGI("throw setter found at rva=%lx", (unsigned long)(target - ctx.bias));

    int matches = install(&ctx, target);
    if (matches > 0)
        LOGI("curve setter hook installed matches=%d target=%lx", matches,
             (unsigned long)target);
    else
        LOGE("no pointer slot references target=%lx", (unsigned long)target);
    return NULL;
}

__attribute__((constructor)) static void init(void) {
    LOGI("libpgo_hook constructor running, starting worker");
    pthread_t t;
    if (pthread_create(&t, NULL, worker, NULL) == 0) pthread_detach(t);
    else LOGE("pthread_create failed");
}
