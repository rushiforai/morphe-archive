.class public Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;
.super Lcom/bytedance/realx/video/memory/RXVideoMemory;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/memory/RXVideoOpenGLMemoryInterface;


# direct methods
.method public constructor <init>(J)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/bytedance/realx/video/memory/RXVideoMemory;-><init>(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static createRXOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;
    .locals 0
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    .line 1
    invoke-static/range {p0 .. p10}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeCreateOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)J

    .line 2
    .line 3
    .line 4
    move-result-wide p0

    .line 5
    new-instance p2, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;

    .line 6
    .line 7
    invoke-direct {p2, p0, p1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;-><init>(J)V

    .line 8
    .line 9
    .line 10
    return-object p2
.end method

.method private static native nativeCreateOpenGLMemory(IIIIILcom/bytedance/realx/video/RXPixelFormat;[FLandroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoScaleFilter;Lcom/bytedance/realx/video/RXVideoRotation;Ljava/lang/Runnable;)J
.end method

.method private static native nativeGetHeight(J)I
.end method

.method private static native nativeGetJavaEGLContext(J)Landroid/opengl/EGLContext;
.end method

.method private static native nativeGetNativeEGLContext(J)J
.end method

.method private static native nativeGetRotation(J)Lcom/bytedance/realx/video/RXVideoRotation;
.end method

.method private static native nativeGetScaleFilter(J)Lcom/bytedance/realx/video/RXVideoScaleFilter;
.end method

.method private static native nativeGetTextureId(J)I
.end method

.method private static native nativeGetTextureMatrix(J)[F
.end method

.method private static native nativeGetTextureTarget(J)Lcom/bytedance/realx/video/RXPixelFormat;
.end method

.method private static native nativeGetUnscaledHeight(J)I
.end method

.method private static native nativeGetUnscaledWidth(J)I
.end method

.method private static native nativeGetVideoMemoryType(J)Lcom/bytedance/realx/video/RXVideoMemoryType;
.end method

.method private static native nativeGetWidth(J)I
.end method

.method private static native nativeReleaseTextureVideoMemory(J)V
.end method

.method private static native nativeSetRenderHelper(JLcom/bytedance/realx/video/MediaCodecTextureBufferHelper;)V
.end method

.method private static release(Ljava/lang/Runnable;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 4
    .line 5
    .line 6
    :cond_0
    return-void
.end method


# virtual methods
.method public getAndroidTextureMatrix()Landroid/graphics/Matrix;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    new-instance p0, Landroid/graphics/Matrix;

    .line 8
    .line 9
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 10
    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetTextureMatrix(J)[F

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-static {p0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public getEGLContext()Landroid/opengl/EGLContext;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Landroid/opengl/EGL14;->EGL_NO_CONTEXT:Landroid/opengl/EGLContext;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetJavaEGLContext(J)Landroid/opengl/EGLContext;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getHeight()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetHeight(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetVideoMemoryType(J)Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getNativeEGLContext()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetNativeEGLContext(J)J

    .line 13
    .line 14
    .line 15
    move-result-wide v0

    .line 16
    return-wide v0
.end method

.method public getPixelFormat()Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return-object p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetRotation(J)Lcom/bytedance/realx/video/RXVideoRotation;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getScaleFilter()Lcom/bytedance/realx/video/RXVideoScaleFilter;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetScaleFilter(J)Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getTextureId()I
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetTextureId(J)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getTextureMatrix()[F
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    const/16 p0, 0x10

    .line 8
    .line 9
    new-array p0, p0, [F

    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    const/high16 v1, 0x3f800000    # 1.0f

    .line 13
    .line 14
    aput v1, p0, v0

    .line 15
    .line 16
    const/4 v0, 0x5

    .line 17
    aput v1, p0, v0

    .line 18
    .line 19
    const/16 v0, 0xa

    .line 20
    .line 21
    aput v1, p0, v0

    .line 22
    .line 23
    const/16 v0, 0xf

    .line 24
    .line 25
    aput v1, p0, v0

    .line 26
    .line 27
    return-object p0

    .line 28
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 29
    .line 30
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetTextureMatrix(J)[F

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    return-object p0
.end method

.method public getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/RXVideoMemory;->isNullPointer()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object p0, Lcom/bytedance/realx/video/RXPixelFormat;->kUnknown:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 8
    .line 9
    return-object p0

    .line 10
    :cond_0
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 11
    .line 12
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetTextureTarget(J)Lcom/bytedance/realx/video/RXPixelFormat;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    return-object p0
.end method

.method public getUnScaledHeight()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetUnscaledHeight(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUnScaledWidth()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetUnscaledWidth(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWidth()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeGetWidth(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setRenderHelper(Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;)V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/RXVideoMemory;->nativeHandle:J

    .line 2
    .line 3
    invoke-static {v0, v1, p1}, Lcom/bytedance/realx/video/memory/NativeRXOpenGLMemory;->nativeSetRenderHelper(JLcom/bytedance/realx/video/MediaCodecTextureBufferHelper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
