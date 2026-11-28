#define RTLD_NOW 2
#define ANDROID_LOG_INFO 4
#define ANDROID_LOG_WARN 5
#define ANDROID_LOG_ERROR 6
#define MXVP_BUILD_OFF 0xB9694UL
#define COPY_SYM "_ZN5media3avc10NALUCopier6copyToEPKhjh"

typedef __SIZE_TYPE__ size_t;
typedef __UINTPTR_TYPE__ uintptr_t;
typedef unsigned char u8;
typedef struct { const char *dli_fname; void *dli_fbase; const char *dli_sname; void *dli_saddr; } Dl_info;

extern void *dlopen(const char *, int);
extern void *dlsym(void *, const char *);
extern int dladdr(const void *, Dl_info *);
extern void *malloc(size_t);
extern void free(void *);
extern void *memmove(void *, const void *, size_t);

typedef int (*log_fn)(int, const char *, const char *, ...);
static log_fn g_log;
#define LOGI(...) do { if (g_log) g_log(ANDROID_LOG_INFO, "HDR10FIX", __VA_ARGS__); } while (0)
#define LOGW(...) do { if (g_log) g_log(ANDROID_LOG_WARN, "HDR10FIX", __VA_ARGS__); } while (0)
#define LOGE(...) do { if (g_log) g_log(ANDROID_LOG_ERROR, "HDR10FIX", __VA_ARGS__); } while (0)

struct MxBuffer { u8 *begin; u8 *end; u8 *cursor; };
typedef int (*build_fn)(void *, struct MxBuffer *, const u8 *, int);
static build_fn g_original;
static unsigned long g_removed;
static int g_announced;

static void init_log(void) {
    if (!g_log) {
        void *h = dlopen("liblog.so", RTLD_NOW);
        if (h) g_log = (log_fn)dlsym(h, "__android_log_print");
    }
}

static build_fn resolve_original(void) {
    if (g_original) return g_original;
    void *h = dlopen("libmxvp.so", RTLD_NOW);
    if (!h) { init_log(); LOGE("could not open libmxvp.so"); return 0; }
    void *anchor = dlsym(h, COPY_SYM);
    Dl_info di;
    if (!anchor || !dladdr(anchor, &di) || !di.dli_fbase) {
        init_log(); LOGE("could not resolve libmxvp base"); return 0;
    }
    g_original = (build_fn)((uintptr_t)di.dli_fbase + MXVP_BUILD_OFF);
    init_log();
    LOGI("interposed buildAnnexB; libmxvp=%p original=%p", di.dli_fbase, (void *)g_original);
    return g_original;
}

static size_t start_code_len(const u8 *p, size_t n) {
    if (n >= 4 && p[0] == 0 && p[1] == 0 && p[2] == 0 && p[3] == 1) return 4;
    if (n >= 3 && p[0] == 0 && p[1] == 0 && p[2] == 1) return 3;
    return 0;
}

static size_t find_start(const u8 *p, size_t n, size_t from) {
    size_t i;
    for (i = from; i + 3 <= n; ++i) {
        if (p[i] == 0 && p[i+1] == 0) {
            if (i + 3 <= n && p[i+2] == 1) return i;
            if (i + 4 <= n && p[i+2] == 0 && p[i+3] == 1) return i;
        }
    }
    return n;
}

static int is_hdr10plus_t35(const u8 *p, size_t n) {
    return n >= 6 && p[0] == 0xB5 && p[1] == 0x00 && p[2] == 0x3C && p[3] == 0x00 && p[4] == 0x01 && p[5] == 0x04;
}

static size_t ebsp_to_rbsp(const u8 *src, size_t n, u8 *dst) {
    size_t i, o = 0;
    int zeros = 0;
    for (i = 0; i < n; ++i) {
        u8 b = src[i];
        if (zeros >= 2 && b == 0x03 && i + 1 < n && src[i+1] <= 0x03) continue;
        dst[o++] = b;
        if (b == 0) zeros++; else zeros = 0;
    }
    return o;
}

static size_t rbsp_to_ebsp(const u8 *src, size_t n, u8 *dst) {
    size_t i, o = 0;
    int zeros = 0;
    for (i = 0; i < n; ++i) {
        u8 b = src[i];
        if (zeros >= 2 && b <= 0x03) { dst[o++] = 0x03; zeros = 0; }
        dst[o++] = b;
        if (b == 0) zeros++; else zeros = 0;
    }
    return o;
}

/* -1 = preserve original; 0 = drop NAL; >0 = rebuilt NAL data length excluding start code. */
static long filter_sei_nal(const u8 *nal, size_t nal_len, u8 *dst, unsigned long *removed) {
    u8 *rbsp;
    size_t rbsp_len, pos = 0, out = 0;
    int found = 0, kept = 0;
    if (nal_len < 3) return -1;
    rbsp = (u8 *)malloc(nal_len);
    if (!rbsp) return -1;
    rbsp_len = ebsp_to_rbsp(nal + 2, nal_len - 2, rbsp);
    while (pos < rbsp_len) {
        size_t msg_start = pos, payload_type = 0, payload_size = 0, payload_start, msg_end;
        if (pos + 1 == rbsp_len && rbsp[pos] == 0x80) break;
        while (pos < rbsp_len && rbsp[pos] == 0xFF) { payload_type += 255; pos++; }
        if (pos >= rbsp_len) { free(rbsp); return -1; }
        payload_type += rbsp[pos++];
        while (pos < rbsp_len && rbsp[pos] == 0xFF) { payload_size += 255; pos++; }
        if (pos >= rbsp_len) { free(rbsp); return -1; }
        payload_size += rbsp[pos++];
        payload_start = pos;
        if (payload_size > rbsp_len - pos) { free(rbsp); return -1; }
        msg_end = pos + payload_size;
        if (payload_type == 4 && is_hdr10plus_t35(rbsp + payload_start, payload_size)) {
            found = 1;
            (*removed)++;
        } else {
            if (out != msg_start) memmove(rbsp + out, rbsp + msg_start, msg_end - msg_start);
            out += msg_end - msg_start;
            kept = 1;
        }
        pos = msg_end;
    }
    if (!found) { free(rbsp); return -1; }
    if (!kept) { free(rbsp); return 0; }
    rbsp[out++] = 0x80;
    dst[0] = nal[0];
    dst[1] = nal[1];
    out = rbsp_to_ebsp(rbsp, out, dst + 2) + 2;
    free(rbsp);
    return (long)out;
}

static void strip_hdr10plus(struct MxBuffer *b) {
    u8 *buf, *outp;
    size_t len, first, cur;
    unsigned long removed = 0;
    if (!b || !b->begin || !b->cursor || b->cursor < b->begin) return;
    buf = b->begin;
    len = (size_t)(b->cursor - b->begin);
    first = find_start(buf, len, 0);
    if (first == len) return;
    outp = buf;
    if (first) { memmove(outp, buf, first); outp += first; }
    cur = first;
    while (cur < len) {
        size_t sc = start_code_len(buf + cur, len - cur);
        size_t data, next, nal_len;
        int nal_type;
        if (!sc) { memmove(outp, buf + cur, len - cur); outp += len - cur; break; }
        data = cur + sc;
        next = find_start(buf, len, data);
        nal_len = next - data;
        if (nal_len < 2) { memmove(outp, buf + cur, next - cur); outp += next - cur; cur = next; continue; }
        nal_type = (buf[data] >> 1) & 0x3F;
        if (nal_type == 39 || nal_type == 40) {
            long rebuilt;
            memmove(outp, buf + cur, sc);
            rebuilt = filter_sei_nal(buf + data, nal_len, outp + sc, &removed);
            if (rebuilt == 0) {
                /* drop this SEI NAL */
            } else if (rebuilt > 0) {
                outp += sc + (size_t)rebuilt;
            } else {
                memmove(outp, buf + cur, next - cur);
                outp += next - cur;
            }
        } else {
            memmove(outp, buf + cur, next - cur);
            outp += next - cur;
        }
        cur = next;
    }
    if (removed) {
        b->cursor = outp;
        g_removed += removed;
        init_log();
        if (g_removed <= 8 || (g_removed & 0x7F) == 0) LOGI("stripped HDR10+ SEI messages: total=%lu AU=%lu", g_removed, removed);
    }
}

__attribute__((visibility("default")))
int mx_build_annexb(void *self, struct MxBuffer *dst, const u8 *src, int size)
    __asm__("_ZN5media3avc11Transformer11buildAnnexBERNS0_6BufferEPKhi");

int mx_build_annexb(void *self, struct MxBuffer *dst, const u8 *src, int size) {
    build_fn orig = resolve_original();
    int ok;
    if (!g_announced) { init_log(); LOGI("HDR10+ buildAnnexB interposer active"); g_announced = 1; }
    if (!orig) return 0;
    ok = orig(self, dst, src, size);
    if (ok) strip_hdr10plus(dst);
    return ok;
}
