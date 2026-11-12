/*
 * Native far-plane quad helper: builds the stock Steam Link quad layers
 * (base left/right, fovea left/right) directly for the older renderer layouts,
 * oriented by the head pose only and placed at a configurable far distance.
 *
 * Math follows the stock QSVLRendererXR quad routine (5002527 0x10e71c) and the
 * legacy fovea FOV derivation in FlipFrame, all in 32-bit float with the same
 * operation order where it matters. Build with -ffp-contract=off.
 *
 * Geometry: each quad uses the head ORIENTATION. The eye POSITION is retained so
 * each eye's image stays centred on that eye; base and fovea share orientation and
 * position and differ only in FOV and size.
 *
 * Failure policy: the helper itself never aborts and never calls OpenXR. Only
 * GXR_SQ_LAYERS can propagate a C++ exception, and only one thrown by the scene's
 * own operator new / vector length-error thrower (compiled with -fexceptions so the
 * helper frame has an FDE and the unwinder passes through it unchanged).
 *
 * Frame transaction: FRAME_EYE only stages (pending FOV + dimensions); FRAME composes
 * all four quads into a candidate set and commits them together. Any invalid input
 * (non-finite matrix/FOV/eye/sum, degenerate size, unset dimensions) leaves EVERY
 * committed field byte-for-byte as it was (identity/zero-size before the first good
 * frame). There is no latch: the next valid frame recovers.
 *
 * State lifetime: states are pooled, never returned to libc. Callers must quiesce
 * before DESTROY under the stock renderer ownership/join protocol: recycling is
 * not protection against a stale call touching another renderer's state. The eye
 * mutex is initialised once and never destroyed.
 */
#include "gxr_sq_abi.h"

#include <math.h>
#include <pthread.h>
#include <stdlib.h>
#include <string.h>

#define KEEP __attribute__((visibility("default"), used))

/* Identity string pinned by the Kotlin installer (NATIVE_QUAD_FAR_BUILD_ID); bump with any behaviour change. */
__attribute__((used, retain)) static const char gxr_sq_build_id[] = "GXR-NATIVE-QUAD-1.3-FARPLANE-ABI1";

/* Far-plane experiment: ASCII marker, one little-endian float32 distance at +16 and one byte of
 * layer-settings mode at +20. The Kotlin installer finds the marker, pins those file offsets and
 * rewrites exactly those bytes before packaging. volatile plus a writable object stops the
 * compiler from folding the stock values. op_create reads them once and fails closed (NULL, no
 * layers) outside [1.0, 1000.0] m or for an unknown settings mode. */
__attribute__((used, retain)) static volatile struct {
    char marker[16];
    float distance;
    uint8_t settings_mode; /* 0 = keep the renderer's layer chain, 1 = strip FB layer settings */
    uint8_t pad[3];
} gxr_sq_distance_slot = { "GXRQUADDIST16M0", 1.996000051498413f, 0, { 0, 0, 0 } };
typedef __typeof__(gxr_sq_distance_slot) gxr_sq_distance_slot_t;
_Static_assert(sizeof(gxr_sq_distance_slot_t) == 24, "distance slot size");
_Static_assert(offsetof(gxr_sq_distance_slot_t, distance) == 16, "distance slot offset");
_Static_assert(offsetof(gxr_sq_distance_slot_t, settings_mode) == 20, "settings slot offset");

typedef struct { float x, y, z, w; } quat_t;
typedef struct { float x, y, z; } vec3_t;

/* XrCompositionLayerQuad, 0x70 bytes with tail padding (stock stride). */
typedef struct gxr_quad {
    uint32_t type;           /* 0x00 XR_TYPE_COMPOSITION_LAYER_QUAD = 36 */
    uint32_t pad0;
    const void *next;        /* 0x08 */
    uint64_t layer_flags;    /* 0x10 */
    uint64_t space;          /* 0x18 */
    uint32_t eye_visibility; /* 0x20 */
    uint32_t pad1;
    uint64_t swapchain;      /* 0x28 */
    int32_t rect_x, rect_y;  /* 0x30 */
    int32_t rect_w, rect_h;  /* 0x38 */
    uint32_t array_index;    /* 0x40 */
    uint32_t pad2;
    quat_t orientation;      /* 0x48 */
    vec3_t position;         /* 0x58 */
    float size_w, size_h;    /* 0x64 */
    uint32_t pad3;           /* 0x6c */
} gxr_quad;

_Static_assert(sizeof(gxr_quad) == 0x70, "quad stride");
_Static_assert(offsetof(gxr_quad, next) == 0x08, "next");
_Static_assert(offsetof(gxr_quad, layer_flags) == 0x10, "flags");
_Static_assert(offsetof(gxr_quad, space) == 0x18, "space");
_Static_assert(offsetof(gxr_quad, eye_visibility) == 0x20, "eye");
_Static_assert(offsetof(gxr_quad, swapchain) == 0x28, "swapchain");
_Static_assert(offsetof(gxr_quad, rect_x) == 0x30, "rect");
_Static_assert(offsetof(gxr_quad, array_index) == 0x40, "array");
_Static_assert(offsetof(gxr_quad, orientation) == 0x48, "orientation");
_Static_assert(offsetof(gxr_quad, position) == 0x58, "position");
_Static_assert(offsetof(gxr_quad, size_w) == 0x64, "size");

#define QUAD_BASE_L 0
#define QUAD_BASE_R 1
#define QUAD_FOVEA_L 2
#define QUAD_FOVEA_R 3
#define XR_TYPE_QUAD 36u
#define XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB 1000204000u
#define SETTINGS_KEEP 0u
#define SETTINGS_NONE 1u
#define FOVEA_FLAGS 6u /* BLEND_TEXTURE_SOURCE_ALPHA | UNPREMULTIPLIED_ALPHA */

typedef void *(*new_fn_t)(size_t);
typedef void (*delete_fn_t)(void *);
typedef void (*throw_fn_t)(const void *);
typedef int (*ref_space_fn_t)(const void *, uint32_t, uint64_t *);
typedef void (*fov_fn_t)(float *, const float *);

typedef struct gxr_sq_state {
    gxr_quad quads[4];
    float fov[4][4]; /* L,R,U,D radians per quad */
    float eye[2][7]; /* quat xyzw, pos xyz */
    pthread_mutex_t eye_lock;
    new_fn_t new_fn;
    delete_fn_t delete_fn;
    throw_fn_t throw_fn;
    ref_space_fn_t ref_space_fn;
    fov_fn_t fov_fn;
    uint32_t space_type_off;
    uint32_t in_pool;
    /* staged by FRAME_EYE, committed together with the poses by FRAME */
    float pend_fov[4][4];
    uint32_t pend_w[2], pend_h[2]; /* 0 = never staged */
    struct gxr_sq_state *next_free;
    float distance; /* read once from the patchable slot in op_create */
    uint32_t settings_mode; /* 0 keep, 1 strip FB layer settings; also read once */
} gxr_sq_state;

_Static_assert(offsetof(gxr_sq_state, fov) == 0x1C0, "committed fov");
_Static_assert(offsetof(gxr_sq_state, eye) == 0x200, "eye cache");
_Static_assert(offsetof(gxr_sq_state, pend_fov) == 0x290, "pending fov");
_Static_assert(offsetof(gxr_sq_state, pend_w) == 0x2D0, "pending width (thunks.S PEND_W0)");
_Static_assert(offsetof(gxr_sq_state, pend_h) == 0x2D8, "pending height (thunks.S PEND_H0)");

/* Recycled states (never freed, see file comment). Touched only by CREATE/DESTROY. */
static pthread_mutex_t pool_lock = PTHREAD_MUTEX_INITIALIZER;
static gxr_sq_state *pool_head;

static const void *resolve(const gxr_sq_table *t, int32_t off) {
    return (const char *)t + off;
}

static int finite_f(float v) {
    uint32_t bits;
    memcpy(&bits, &v, sizeof(bits));
    return (bits & 0x7f800000u) != 0x7f800000u;
}

static int quat_ok(const float *q) {
    for (int i = 0; i < 4; ++i)
        if (!finite_f(q[i])) return 0;
    float n = q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3];
    return n > 0.5f && n < 2.0f;
}

static void set_identity_eyes(gxr_sq_state *s) {
    for (int e = 0; e < 2; ++e) {
        s->eye[e][0] = 0.f; s->eye[e][1] = 0.f; s->eye[e][2] = 0.f; s->eye[e][3] = 1.f;
        s->eye[e][4] = 0.f; s->eye[e][5] = 0.f; s->eye[e][6] = 0.f;
    }
}

/* ---- lifecycle --------------------------------------------------------------- */

static gxr_sq_state *op_create(const gxr_sq_table *t, const char *renderer) {
    if (!t || !renderer || t->abi != GXR_SQ_ABI_VERSION || t->size != sizeof(*t)) return NULL;
    /* One read per state. Fail closed: a bad slot creates no layers rather than another distance. */
    float quad_distance = gxr_sq_distance_slot.distance;
    if (!finite_f(quad_distance) || quad_distance < 1.0f || quad_distance > 1000.0f) return NULL;
    uint32_t settings_mode = gxr_sq_distance_slot.settings_mode;
    if (settings_mode != SETTINGS_KEEP && settings_mode != SETTINGS_NONE) return NULL;
    pthread_mutex_lock(&pool_lock);
    gxr_sq_state *s = pool_head;
    if (s) pool_head = s->next_free;
    pthread_mutex_unlock(&pool_lock);
    if (s) {
        /* recycled: reset everything except the (still initialised, unlocked) eye mutex */
        memset(s, 0, offsetof(gxr_sq_state, eye_lock));
        memset((char *)s + offsetof(gxr_sq_state, new_fn), 0, sizeof(*s) - offsetof(gxr_sq_state, new_fn));
    } else {
        s = (gxr_sq_state *)calloc(1, sizeof(*s));
        if (!s) return NULL;
        if (pthread_mutex_init(&s->eye_lock, NULL) != 0) {
            free(s);
            return NULL;
        }
    }
    s->new_fn = (new_fn_t)resolve(t, t->new_fn);
    s->delete_fn = (delete_fn_t)resolve(t, t->delete_fn);
    s->throw_fn = (throw_fn_t)resolve(t, t->throw_length_fn);
    s->ref_space_fn = (ref_space_fn_t)resolve(t, t->ref_space_fn);
    s->fov_fn = (fov_fn_t)resolve(t, t->fov_fn);
    s->space_type_off = t->ctx_space_type_off;
    s->distance = quad_distance;
    s->settings_mode = settings_mode;
    for (int i = 0; i < 4; ++i) {
        gxr_quad *q = &s->quads[i];
        int fovea = i >= QUAD_FOVEA_L;
        q->type = XR_TYPE_QUAD;
        q->next = renderer + (fovea ? t->next_fovea_off : t->next_base_off);
        /* Only an FB layer-settings node is removed; an unrelated chain stays exactly as the
         * renderer built it. A successor may legitimately be NULL (end of chain). */
        if (s->settings_mode == SETTINGS_NONE &&
            *(const uint32_t *)q->next == XR_TYPE_COMPOSITION_LAYER_SETTINGS_FB)
            q->next = *(const void *const *)((const char *)q->next + 8);
        q->layer_flags = fovea ? FOVEA_FLAGS : 0u;
        q->eye_visibility = (i & 1) ? 2u : 1u;
        q->orientation.w = 1.f;
    }
    set_identity_eyes(s);
    return s;
}

static void op_init(gxr_sq_state *s, const void *ctx) {
    uint32_t type = *(const uint32_t *)((const char *)ctx + s->space_type_off);
    for (int i = 0; i < 4; ++i) {
        uint64_t space = 0;
        s->ref_space_fn(ctx, type, &space);
        s->quads[i].space = space;
    }
}

static void op_destroy(gxr_sq_state *s) {
    pthread_mutex_lock(&pool_lock);
    if (!s->in_pool) {
        s->in_pool = 1;
        s->next_free = pool_head;
        pool_head = s;
    }
    pthread_mutex_unlock(&pool_lock);
}

/* Setup: the quad's sub-image comes straight from the scene's XRQSwapchain: the XrSwapchain
 * handle at +0 and the (width,height) extent at +0x70 - exactly the two fields the legacy
 * XRQCreateProjectionViewLayer reads (verified per base by build_patch_tables.py); the image
 * rect offset and array index are zero there too. No projection view is ever built. */
static void op_swapchain(gxr_sq_state *s, uint32_t family, uint32_t eye, const char *swapchain) {
    if (family > 1 || eye > 1 || !swapchain) return;
    gxr_quad *q = &s->quads[family * 2 + eye];
    memcpy(&q->swapchain, swapchain, 8);
    q->rect_x = 0;
    q->rect_y = 0;
    memcpy(&q->rect_w, swapchain + 0x70, 8);
    q->array_index = 0;
}

static void op_eyes(gxr_sq_state *s, const char *views) {
    float tmp[2][7];
    for (int e = 0; e < 2; ++e) memcpy(tmp[e], views + e * 0x40 + 0x10, sizeof(tmp[e]));
    for (int e = 0; e < 2; ++e) {
        if (!quat_ok(tmp[e]) || !finite_f(tmp[e][4]) || !finite_f(tmp[e][5]) ||
            !finite_f(tmp[e][6]))
            return;
    }
    pthread_mutex_lock(&s->eye_lock);
    memcpy(s->eye, tmp, sizeof(tmp));
    pthread_mutex_unlock(&s->eye_lock);
}

/* ---- per-frame --------------------------------------------------------------- */

static void fovea_fov(float out[4], const float full[4], const int16_t rect[4], float width,
                      float height) {
    /* vertical (legacy FlipFrame 0x10e704..0x10e750) */
    float x = (float)rect[0], y = (float)rect[1], w = (float)rect[2], h = (float)rect[3];
    float tu = tanf(full[2]);
    float a = tu * h;
    float td = tanf(full[3]);
    float d = tu - td;
    a = a / d;
    float b = a / tu;
    out[2] = atanf((a - y) / b);
    out[3] = atanf((a - (height + y)) / b);
    /* horizontal (0x10e754..0x10e7a4) */
    float tr = tanf(full[1]);
    float c = tr * w;
    float tl = tanf(full[0]);
    d = tr - tl;
    c = c / d;
    b = c / tr;
    out[1] = atanf((((c + x) + width) - w) / b);
    out[0] = atanf(((x - w) + c) / b);
}

/* L,R,U,D radians: finite, inside (-pi/2, pi/2) and non-degenerate (right > left, up > down). */
static int fov_ok(const float f[4]) {
    for (int i = 0; i < 4; ++i)
        if (!finite_f(f[i]) || f[i] <= -1.5707963f || f[i] >= 1.5707963f) return 0;
    return f[1] > f[0] && f[2] > f[3];
}

static void op_frame_eye(gxr_sq_state *s, const char *meta, uint32_t eye, uint32_t width,
                         uint32_t height) {
    if (eye > 1 || width == 0 || height == 0 || width > 0xffff || height > 0xffff) return;
    const float *src = (const float *)(meta + 0x44 + eye * 0x40);
    float m[16];
    for (int i = 0; i < 4; ++i)
        for (int j = 0; j < 4; ++j) m[4 * j + i] = src[4 * i + j];
    /* The size cache FlipFrame compares against (thunks t_dim_w/t_dim_h) must track the real frame size
     * even when the FOV is unusable; otherwise a persistent bad FOV leaves a stale size and the scene
     * regenerates its swapchains on every frame. Dimensions are range-validated above, so stage them
     * unconditionally; only the FOV staging is conditional. */
    s->pend_w[eye] = width;
    s->pend_h[eye] = height;
    float full[4];
    s->fov_fn(full, m);
    int16_t rect[4];
    memcpy(rect, meta + 0xc8 + eye * 8, sizeof(rect));
    float fovea[4];
    fovea_fov(fovea, full, rect, (float)width, (float)height);
    if (!fov_ok(full) || !fov_ok(fovea)) return; /* FOV stays at its last staged value */
    memcpy(s->pend_fov[QUAD_BASE_L + eye], full, sizeof(full));
    memcpy(s->pend_fov[QUAD_FOVEA_L + eye], fovea, sizeof(fovea));
}

static vec3_t qrot(quat_t q, vec3_t v) {
    vec3_t t = {2.f * (q.y * v.z - q.z * v.y), 2.f * (q.z * v.x - q.x * v.z),
                2.f * (q.x * v.y - q.y * v.x)};
    vec3_t r = {v.x + q.w * t.x + (q.y * t.z - q.z * t.y), v.y + q.w * t.y + (q.z * t.x - q.x * t.z),
                v.z + q.w * t.z + (q.x * t.y - q.y * t.x)};
    return r;
}

/* Same case split and constants as the legacy pose helper (5002395 0x10ec74). */
static quat_t quat_from_matrix(const float *m) {
    float m00 = m[0], m01 = m[1], m02 = m[2];
    float m10 = m[4], m11 = m[5], m12 = m[6];
    float m20 = m[8], m21 = m[9], m22 = m[10];
    float trace = (m00 + m11) + m22;
    quat_t q;
    if (trace > 0.f) {
        float s = 0.5f / sqrtf(trace + 1.f);
        q.w = 0.25f / s;
        q.x = (m21 - m12) * s;
        q.y = (m02 - m20) * s;
        q.z = (m10 - m01) * s;
    } else if (m00 > m11 && m00 > m22) {
        float s = 0.5f / sqrtf(((m00 + 1.f) - m11) - m22);
        q.x = 0.25f / s;
        q.y = (m10 + m01) * s;
        q.z = (m20 + m02) * s;
        q.w = (m21 - m12) * s;
    } else if (m11 > m22) {
        float s = 0.5f / sqrtf(((m11 + 1.f) - m00) - m22);
        q.y = 0.25f / s;
        q.x = (m10 + m01) * s;
        q.z = (m21 + m12) * s;
        q.w = (m02 - m20) * s;
    } else {
        float s = 0.5f / sqrtf(((m22 + 1.f) - m00) - m11);
        q.z = 0.25f / s;
        q.x = (m20 + m02) * s;
        q.y = (m21 + m12) * s;
        q.w = (m10 - m01) * s;
    }
    return q;
}

static int compose(const quat_t hq, const vec3_t hp, const float *eye, const float *fov,
                   float distance, gxr_quad *out) {
    float d = distance;
    vec3_t ep = {eye[4], eye[5], eye[6]};
    float tl = tanf(fov[0]), tr = tanf(fov[1]), tu = tanf(fov[2]), td = tanf(fov[3]);
    vec3_t local = {((tl + tr) * d) * 0.5f, ((tu + td) * d) * 0.5f, -d};
    /* Head orientation only: the eye quaternion is deliberately not applied. The eye position
     * still centres each eye's quad, so base and fovea share pose and differ only in FOV/size. */
    vec3_t in_head = {ep.x + local.x, ep.y + local.y, ep.z + local.z};
    vec3_t world = qrot(hq, in_head);
    quat_t o = hq;
    float w = (tr - tl) * d, h = (tu - td) * d;
    if (!(finite_f(o.x) && finite_f(o.y) && finite_f(o.z) && finite_f(o.w) && finite_f(world.x) &&
          finite_f(world.y) && finite_f(world.z) && finite_f(w) && finite_f(h) && w > 0.f &&
          h > 0.f))
        return 0;
    float px = hp.x + world.x, py = hp.y + world.y, pz = hp.z + world.z;
    if (!(finite_f(px) && finite_f(py) && finite_f(pz))) return 0;
    out->orientation = o;
    out->position.x = px;
    out->position.y = py;
    out->position.z = pz;
    out->size_w = w;
    out->size_h = h;
    return 1;
}

static void op_frame(gxr_sq_state *s, const char *meta) {
    float hm[12];
    memcpy(hm, meta + 4, sizeof(hm));
    for (int i = 0; i < 12; ++i)
        if (!finite_f(hm[i])) return;
    /* hm is a row-major 3x4: the 3x3 rotation uses columns 0-2, translation column 3 */
    float rot[12] = {hm[0], hm[1], hm[2], 0.f, hm[4], hm[5], hm[6], 0.f, hm[8], hm[9], hm[10], 0.f};
    quat_t hq = quat_from_matrix(rot);
    vec3_t hp = {hm[3], hm[7], hm[11]};
    float eyes[2][7];
    pthread_mutex_lock(&s->eye_lock);
    memcpy(eyes, s->eye, sizeof(eyes));
    pthread_mutex_unlock(&s->eye_lock);
    /* Frame transaction: compose every quad into a candidate set; commit all or nothing. */
    gxr_quad cand[4];
    memcpy(cand, s->quads, sizeof(cand));
    for (int i = 0; i < 4; ++i) {
        uint32_t w = s->pend_w[i & 1], h = s->pend_h[i & 1];
        if (w == 0 || h == 0) return;
        if (!compose(hq, hp, eyes[i & 1], s->pend_fov[i],
                     s->distance,
                     &cand[i])) return;
        cand[i].rect_x = cand[i].rect_y = 0;
        cand[i].rect_w = (int32_t)w;
        cand[i].rect_h = (int32_t)h;
    }
    memcpy(s->quads, cand, sizeof(cand));
    memcpy(s->fov, s->pend_fov, sizeof(s->fov));
}

/* ---- layer vector (libc++ std::vector<const XrCompositionLayerBaseHeader *>) --- */

static void push_back(gxr_sq_state *s, void **vec, void *item) {
    void **end = (void **)vec[1];
    if (end < (void **)vec[2]) {
        *end = item;
        vec[1] = end + 1;
        return;
    }
    char *begin = (char *)vec[0];
    size_t bytes = (size_t)((char *)end - begin);
    size_t n = bytes >> 3;
    size_t need = n + 1;
    if (need >> 61) {
        s->throw_fn(vec);
        __builtin_trap();
    }
    size_t cap_bytes = (size_t)((char *)vec[2] - begin);
    size_t grown = cap_bytes >> 2;
    size_t new_cap = grown < need ? need : grown;
    if (cap_bytes >= 0x7ffffffffffffff8ull) new_cap = 0x1fffffffffffffffull;
    void **nb = (void **)s->new_fn(new_cap << 3);
    nb[n] = item;
    if (bytes > 0) memcpy(nb, begin, bytes);
    vec[0] = nb;
    vec[1] = nb + n + 1;
    vec[2] = nb + new_cap;
    if (begin) s->delete_fn(begin);
}

static void op_layers(gxr_sq_state *s, void **vec) {
    for (int i = 0; i < 4; ++i) push_back(s, vec, &s->quads[i]);
}

KEEP uintptr_t gxr_sq_entry(uint32_t op, void *state, uintptr_t a, uintptr_t b, uintptr_t c,
                            uintptr_t d) {
    gxr_sq_state *s = (gxr_sq_state *)state;
    if (op == GXR_SQ_CREATE) return (uintptr_t)op_create((const gxr_sq_table *)a, (const char *)b);
    if (!s) return 0;
    switch (op) {
    case GXR_SQ_DESTROY: op_destroy(s); break;
    case GXR_SQ_INIT: op_init(s, (const void *)a); break;
    case GXR_SQ_SWAPCHAIN: op_swapchain(s, (uint32_t)a, (uint32_t)b, (const char *)c); break;
    case GXR_SQ_EYES: op_eyes(s, (const char *)a); break;
    case GXR_SQ_FRAME_EYE: op_frame_eye(s, (const char *)a, (uint32_t)b, (uint32_t)c, (uint32_t)d); break;
    case GXR_SQ_FRAME: op_frame(s, (const char *)a); break;
    case GXR_SQ_LAYERS: op_layers(s, (void **)a); break;
    default: break;
    }
    return 0;
}
