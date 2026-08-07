.class public Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;


# instance fields
.field private isAgfxTexture:Z

.field private final nativeRXVideoFrame:J

.field private final refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;


# direct methods
.method public constructor <init>(JZ)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 5
    .line 6
    iput-boolean p3, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->isAgfxTexture:Z

    .line 7
    .line 8
    new-instance p3, Lcom/bytedance/realx/base/RefCountDelegate;

    .line 9
    .line 10
    new-instance v0, Ll/zjc0;

    .line 11
    .line 12
    invoke-direct {v0, p1, p2}, Ll/zjc0;-><init>(J)V

    .line 13
    .line 14
    .line 15
    invoke-direct {p3, v0}, Lcom/bytedance/realx/base/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    iput-object p3, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 19
    .line 20
    return-void
.end method

.method public static synthetic a(J)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeReleaseRXVideoFrame(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private applyTransformMatrix(Landroid/graphics/Matrix;IIIILcom/bytedance/realx/video/FilterType;)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;
    .locals 9

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->isAgfxTexture:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    .line 8
    .line 9
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-direct {v0, v1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->retain()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p6}, Lcom/bytedance/realx/video/FilterType;->toInt()I

    .line 23
    .line 24
    .line 25
    move-result p1

    .line 26
    invoke-static {p1}, Lcom/bytedance/realx/video/RXVideoScaleFilter;->fromId(I)Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 27
    .line 28
    .line 29
    move-result-object v8

    .line 30
    invoke-static {v0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 31
    .line 32
    .line 33
    move-result-object v3

    .line 34
    iget-wide v1, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 35
    .line 36
    move v4, p2

    .line 37
    move v5, p3

    .line 38
    move v6, p4

    .line 39
    move v7, p5

    .line 40
    invoke-static/range {v1 .. v8}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeCreateTextureRXVideoFrame(J[FIIIILcom/bytedance/realx/video/RXVideoScaleFilter;)J

    .line 41
    .line 42
    .line 43
    move-result-wide p0

    .line 44
    new-instance p2, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;

    .line 45
    .line 46
    const/4 p3, 0x0

    .line 47
    invoke-direct {p2, p0, p1, p3}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;-><init>(JZ)V

    .line 48
    .line 49
    .line 50
    return-object p2
.end method

.method private static native nativeCreateTextureRXVideoFrame(J[FIIIILcom/bytedance/realx/video/RXVideoScaleFilter;)J
.end method

.method private static native nativeGetAndroidEGLContext(J)Landroid/opengl/EGLContext;
.end method

.method private static native nativeGetEGLContext(J)Landroid/opengl/EGLContext;
.end method

.method private static native nativeGetFloatTextureMatrix(J)[F
.end method

.method private static native nativeGetHeight(J)I
.end method

.method private static native nativeGetPixelFormat(J)Lcom/bytedance/realx/video/RXPixelFormat;
.end method

.method private static native nativeGetRXVideoScaleFilter(J)Lcom/bytedance/realx/video/RXVideoScaleFilter;
.end method

.method private static native nativeGetTextureId(J)I
.end method

.method private static native nativeGetUnscaledHeight(J)I
.end method

.method private static native nativeGetUnscaledWidth(J)I
.end method

.method private static native nativeGetWidth(J)I
.end method

.method private static native nativeReleaseRXVideoFrame(J)V
.end method

.method private static native nativeToI420(J)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
.end method


# virtual methods
.method public applyTransformMatrix(Landroid/graphics/Matrix;II)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;
    .locals 7

    .line 51
    sget-object v6, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    move v4, p2

    move v5, p3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    invoke-direct/range {v0 .. v6}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;IIIILcom/bytedance/realx/video/FilterType;)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    move-result-object p0

    return-object p0
.end method

.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->isAgfxTexture:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getUnscaledWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getUnscaledHeight()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    move v4, p1

    .line 24
    new-instance p1, Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 27
    .line 28
    .line 29
    add-int/2addr p2, p4

    .line 30
    sub-int p2, v1, p2

    .line 31
    .line 32
    int-to-float v4, v4

    .line 33
    int-to-float v0, v0

    .line 34
    div-float/2addr v4, v0

    .line 35
    int-to-float p2, p2

    .line 36
    int-to-float v1, v1

    .line 37
    div-float/2addr p2, v1

    .line 38
    invoke-virtual {p1, v4, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 39
    .line 40
    .line 41
    int-to-float p2, p3

    .line 42
    div-float/2addr p2, v0

    .line 43
    int-to-float v4, p4

    .line 44
    div-float/2addr v4, v1

    .line 45
    invoke-virtual {p1, p2, v4}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 46
    .line 47
    .line 48
    mul-int/2addr v2, p3

    .line 49
    int-to-float p2, v2

    .line 50
    div-float/2addr p2, v0

    .line 51
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    mul-int/2addr v3, p4

    .line 56
    int-to-float p3, v3

    .line 57
    div-float/2addr p3, v1

    .line 58
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    move p4, p5

    .line 63
    move p5, p6

    .line 64
    sget-object p6, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 65
    .line 66
    invoke-direct/range {p0 .. p6}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;IIIILcom/bytedance/realx/video/FilterType;)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public cropAndScaleWithFilter(IIIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 6

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->isAgfxTexture:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getUnscaledWidth()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getUnscaledHeight()I

    .line 20
    .line 21
    .line 22
    move-result v3

    .line 23
    move v4, p1

    .line 24
    new-instance p1, Landroid/graphics/Matrix;

    .line 25
    .line 26
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 27
    .line 28
    .line 29
    add-int/2addr p2, p4

    .line 30
    sub-int p2, v1, p2

    .line 31
    .line 32
    int-to-float v4, v4

    .line 33
    int-to-float v0, v0

    .line 34
    div-float/2addr v4, v0

    .line 35
    int-to-float p2, p2

    .line 36
    int-to-float v1, v1

    .line 37
    div-float/2addr p2, v1

    .line 38
    invoke-virtual {p1, v4, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 39
    .line 40
    .line 41
    int-to-float p2, p3

    .line 42
    div-float/2addr p2, v0

    .line 43
    int-to-float v4, p4

    .line 44
    div-float/2addr v4, v1

    .line 45
    invoke-virtual {p1, p2, v4}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 46
    .line 47
    .line 48
    mul-int/2addr v2, p3

    .line 49
    int-to-float p2, v2

    .line 50
    div-float/2addr p2, v0

    .line 51
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 52
    .line 53
    .line 54
    move-result p2

    .line 55
    mul-int/2addr v3, p4

    .line 56
    int-to-float p3, v3

    .line 57
    div-float/2addr p3, v1

    .line 58
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 59
    .line 60
    .line 61
    move-result p3

    .line 62
    invoke-static {p7}, Lcom/bytedance/realx/video/FilterType;->fromValue(I)Lcom/bytedance/realx/video/FilterType;

    .line 63
    .line 64
    .line 65
    move-result-object p4

    .line 66
    move v5, p6

    .line 67
    move-object p6, p4

    .line 68
    move p4, p5

    .line 69
    move p5, v5

    .line 70
    invoke-direct/range {p0 .. p6}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;IIIILcom/bytedance/realx/video/FilterType;)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    return-object p0
.end method

.method public getBufferType()I
    .locals 0

    .line 1
    invoke-super {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getBufferType()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getEGLContext()Landroid/opengl/EGLContext;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetAndroidEGLContext(J)Landroid/opengl/EGLContext;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getEglContext()Landroid/opengl/EGLContext;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetEGLContext(J)Landroid/opengl/EGLContext;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHeight()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetHeight(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getEGLContext()Landroid/opengl/EGLContext;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    return-wide v0

    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/opengl/EGLObjectHandle;->getNativeHandle()J

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    return-wide v0
.end method

.method public getScaleFilter()Lcom/bytedance/realx/video/FilterType;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetRXVideoScaleFilter(J)Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-virtual {p0}, Lcom/bytedance/realx/video/RXVideoScaleFilter;->value()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Lcom/bytedance/realx/video/FilterType;->fromValue(I)Lcom/bytedance/realx/video/FilterType;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getTextureId()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetTextureId(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetFloatTextureMatrix(J)[F

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-static {p0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetPixelFormat(J)Lcom/bytedance/realx/video/RXPixelFormat;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Lcom/bytedance/realx/video/RXPixelFormat;->kTexture2D:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 8
    .line 9
    if-ne p0, v0, :cond_0

    .line 10
    .line 11
    sget-object p0, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    sget-object v0, Lcom/bytedance/realx/video/RXPixelFormat;->kTextureOES:Lcom/bytedance/realx/video/RXPixelFormat;

    .line 15
    .line 16
    if-ne p0, v0, :cond_1

    .line 17
    .line 18
    sget-object p0, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return-object p0
.end method

.method public getTypeGlTarget()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->getGlTarget()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public getUnscaledHeight()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetUnscaledHeight(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUnscaledWidth()I
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetUnscaledWidth(J)I

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
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetWidth(J)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public nativeGetTransFormMatrix()[F
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeGetFloatTextureMatrix(J)[F

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/base/RefCountDelegate;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/base/RefCountDelegate;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 5

    .line 1
    iget-boolean v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->isAgfxTexture:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    new-instance v0, Landroid/graphics/Matrix;

    .line 8
    .line 9
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    mul-int/2addr v1, p2

    .line 17
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    div-int/2addr v1, v2

    .line 22
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 23
    .line 24
    .line 25
    move-result v1

    .line 26
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getHeight()I

    .line 27
    .line 28
    .line 29
    move-result v2

    .line 30
    mul-int/2addr v2, p1

    .line 31
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getWidth()I

    .line 32
    .line 33
    .line 34
    move-result v3

    .line 35
    div-int/2addr v2, v3

    .line 36
    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    .line 37
    .line 38
    .line 39
    move-result v2

    .line 40
    int-to-float v1, v1

    .line 41
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getWidth()I

    .line 42
    .line 43
    .line 44
    move-result v3

    .line 45
    int-to-float v3, v3

    .line 46
    div-float/2addr v1, v3

    .line 47
    int-to-float v3, v2

    .line 48
    invoke-virtual {p0}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v4

    .line 52
    int-to-float v4, v4

    .line 53
    div-float/2addr v3, v4

    .line 54
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 55
    .line 56
    .line 57
    add-int/2addr p4, v2

    .line 58
    sub-int p4, p2, p4

    .line 59
    .line 60
    div-int/2addr p3, p1

    .line 61
    int-to-float p3, p3

    .line 62
    div-int/2addr p4, p2

    .line 63
    int-to-float p4, p4

    .line 64
    invoke-virtual {v0, p3, p4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0, v0, p1, p2}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeRXVideoFrame:J

    .line 2
    .line 3
    invoke-static {v0, v1}, Lcom/bytedance/realx/video/memory/bridge/RXWebRTCTextureBuffer;->nativeToI420(J)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
