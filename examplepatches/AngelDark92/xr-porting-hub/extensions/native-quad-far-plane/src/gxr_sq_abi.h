/*
 * Native stock-quad helper ABI (libgxr_quad_native.so).
 *
 * One exported C entry point is called from small thunks that the Steam Link "native quad" patch
 * places in code that the replacement made unused inside libvrlink_scene.so. Each renderer
 * constructor performs an explicit dlopen() of this library (the process keeps the loaded handle;
 * the lookup is repeated per renderer) and holds all quad state outside the old renderer object.
 * Nothing here intercepts OpenXR.
 *
 *   uintptr_t gxr_sq_entry(uint32_t op, void *state, uintptr_t a, uintptr_t b, uintptr_t c,
 *                          uintptr_t d);
 *
 * Contract:
 *  - The helper never aborts and never calls an OpenXR function itself.
 *  - It calls only scene code reached through the self-relative table given at CREATE:
 *    operator new/delete and the vector length-error thrower (stream-layer vector growth),
 *    XRQGetReferenceSpace (an XRQ wrapper; it may call OpenXR inside the scene) and the scene's
 *    matrix-to-FOV routine.
 *  - GXR_SQ_LAYERS may therefore propagate a C++ exception thrown by the scene's operator new or
 *    length-error thrower, exactly like the stock vector push_back it replaces; the helper is
 *    built with unwind tables so the unwinder passes through its frame. No other operation throws.
 *  - States are pooled and never freed (see gxr_sq.c). Stock renderer ownership must quiesce
 *    callers before DESTROY; pooling does not make stale renderer-pointer access safe.
 */
#ifndef GXR_SQ_ABI_H
#define GXR_SQ_ABI_H

#include <stddef.h>
#include <stdint.h>

#define GXR_SQ_ABI_VERSION 1u

enum gxr_sq_op {
    GXR_SQ_CREATE = 0,    /* (0, 0, table*, renderer)            -> state or 0 */
    GXR_SQ_DESTROY = 1,   /* (1, state)                          -> 0          */
    GXR_SQ_INIT = 2,      /* (2, state, ctx*)                    -> 0          */
    GXR_SQ_SWAPCHAIN = 3, /* (3, state, family, eye, XRQSwapchain*) -> 0       */
    GXR_SQ_EYES = 4,      /* (4, state, XrView[2]*)              -> 0          */
    GXR_SQ_FRAME_EYE = 6, /* (6, state, meta*, eye, width, height) -> 0: stages FOV + dimensions */
    GXR_SQ_FRAME = 7,     /* (7, state, meta*)                   -> 0: commits all four quads    */
    GXR_SQ_LAYERS = 8     /* (8, state, vector*)                 -> 0          */
};

enum { GXR_SQ_FAMILY_BASE = 0, GXR_SQ_FAMILY_FOVEA = 1 };

/*
 * Function/constant table passed to CREATE. Every *_fn member is a signed 32-bit byte offset from
 * the address of the table itself, so the table is position independent and carries no relocations.
 */
typedef struct gxr_sq_table {
    uint32_t abi;             /* GXR_SQ_ABI_VERSION */
    uint32_t size;            /* sizeof(gxr_sq_table) */
    int32_t new_fn;           /* void *operator new(size_t)            */
    int32_t delete_fn;        /* void operator delete(void *)          */
    int32_t throw_length_fn;  /* void vector_base_common::__throw_length_error(const void *vec) */
    int32_t ref_space_fn;     /* bool XRQGetReferenceSpace(ctx, uint32 type, uint64 *out)      */
    int32_t fov_fn;           /* void fov_from_matrix(float out[4], const float m[16])         */
    uint32_t ctx_space_type_off; /* offset of the u32 reference space type in the XR context  */
    uint32_t next_base_off;   /* renderer offset of the base-family settings struct   */
    uint32_t next_fovea_off;  /* renderer offset of the fovea-family settings struct  */
} gxr_sq_table;

uintptr_t gxr_sq_entry(uint32_t op, void *state, uintptr_t a, uintptr_t b, uintptr_t c,
                       uintptr_t d);

#endif
