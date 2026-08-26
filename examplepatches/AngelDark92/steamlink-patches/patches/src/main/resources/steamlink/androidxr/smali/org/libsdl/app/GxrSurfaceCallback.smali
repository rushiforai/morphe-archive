.class public Lorg/libsdl/app/GxrSurfaceCallback;
.super Ljava/lang/Object;
.implements Landroid/view/SurfaceHolder$Callback;

.field private final mOwner:Lorg/libsdl/app/SDLSurface;

.method public constructor <init>(Lorg/libsdl/app/SDLSurface;)V
    .locals 0

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lorg/libsdl/app/GxrSurfaceCallback;->mOwner:Lorg/libsdl/app/SDLSurface;

    return-void
.end method

.method public surfaceChanged(Landroid/view/SurfaceHolder;III)V
    .locals 6

    iget-object v0, p0, Lorg/libsdl/app/GxrSurfaceCallback;->mOwner:Lorg/libsdl/app/SDLSurface;

    iget-object v0, v0, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v5

    move v0, p3

    move v1, p4

    move v2, p3

    move v3, p4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static/range {v0 .. v5}, Lorg/libsdl/app/SDLActivity;->nativeSetScreenResolution(IIIIFF)V

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeResize()V

    const-string v0, "SteamLinkGXR"

    const-string v1, "Applied managed-panel surface metrics"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public surfaceCreated(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method

# ─────────────────────────────────────────────────────────────────────────────
# applyManagedPanelMetrics(SDLSurface owner, SurfaceHolder holder, int format, int width, int height)
#
# Called via a direct instruction patch injected at index 0 of the REAL
# SDLSurface.surfaceChanged(), immediately followed by return-void. This is
# necessary because morphe-patcher's extendWith() merge only ADDS methods
# that are missing from the target class by signature -- it silently drops
# any edits to a method that already exists in both the original class and
# the bundled extension class (see ClassMerger.addMissingMethods). Since
# surfaceChanged() pre-exists in the stock SDLSurface class, a full modified
# copy of it bundled here would never actually run. Feeding the true surface
# width/height at 1:1 scale (instead of the full physical combined-display
# metrics) prevents the managed-panel launcher UI from being stretched.
#
# Signature mirrors surfaceChanged()'s own params 1:1 (owner in place of
# `this`) so the caller can pass p0..p4 as one contiguous invoke-static/range
# block -- surfaceChanged's real v-registers can exceed 15, which the fixed
# 4-bit register slots of invoke-static (format 35c) cannot address; only a
# contiguous range is required for invoke-static/range (format 3rc). holder
# and format are unused here, kept only to preserve contiguity.
# ─────────────────────────────────────────────────────────────────────────────
.method public static applyManagedPanelMetrics(Lorg/libsdl/app/SDLSurface;Landroid/view/SurfaceHolder;III)V
    .locals 6

    iget-object v0, p0, Lorg/libsdl/app/SDLSurface;->mDisplay:Landroid/view/Display;

    invoke-virtual {v0}, Landroid/view/Display;->getRefreshRate()F

    move-result v5

    move v0, p3

    move v1, p4

    move v2, p3

    move v3, p4

    const/high16 v4, 0x3f800000    # 1.0f

    invoke-static/range {v0 .. v5}, Lorg/libsdl/app/SDLActivity;->nativeSetScreenResolution(IIIIFF)V

    invoke-static {}, Lorg/libsdl/app/SDLActivity;->onNativeResize()V

    const-string v0, "SteamLinkGXR"

    const-string v1, "Applied managed-panel surface metrics (direct patch)"

    invoke-static {v0, v1}, Landroid/util/Log;->i(Ljava/lang/String;Ljava/lang/String;)I

    return-void
.end method

.method public surfaceDestroyed(Landroid/view/SurfaceHolder;)V
    .locals 0

    return-void
.end method
