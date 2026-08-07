.class public Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;
.super Lcom/bytedance/realx/video/memory/RXVideoTextureMemory;
.source "SourceFile"


# instance fields
.field eglContext:Landroid/opengl/EGLContext;

.field rotation:Lcom/bytedance/realx/video/RXVideoRotation;

.field private textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Landroid/opengl/EGLContext;Lcom/bytedance/realx/video/RXVideoRotation;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Lcom/bytedance/realx/video/memory/RXVideoTextureMemory;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->eglContext:Landroid/opengl/EGLContext;

    .line 7
    .line 8
    iput-object p3, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->rotation:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p1}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->retain()V

    .line 13
    .line 14
    .line 15
    :cond_0
    new-instance p1, Ll/xup0;

    .line 16
    .line 17
    invoke-direct {p1, p0}, Ll/xup0;-><init>(Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->setReleaseCallback(Ljava/lang/Runnable;)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public getEGLContext()Landroid/opengl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->eglContext:Landroid/opengl/EGLContext;

    .line 2
    .line 3
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;
    .locals 0

    .line 1
    sget-object p0, Lcom/bytedance/realx/video/RXVideoMemoryType;->kOPENGL_TEXTURE:Lcom/bytedance/realx/video/RXVideoMemoryType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getNativeEGLContext()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->eglContext:Landroid/opengl/EGLContext;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    return-wide v0

    .line 8
    :cond_0
    invoke-virtual {p0}, Landroid/opengl/EGLObjectHandle;->getNativeHandle()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/bytedance/realx/video/RXVideoRotation;->VIDEO_ROTATION_0:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->rotation:Lcom/bytedance/realx/video/RXVideoRotation;

    .line 9
    .line 10
    return-object p0
.end method

.method public getScaleFilter()Lcom/bytedance/realx/video/RXVideoScaleFilter;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getScaleFilter()Lcom/bytedance/realx/video/FilterType;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    sget-object p0, Lcom/bytedance/realx/video/RXVideoScaleFilter;->kOpenGLOrigin:Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/FilterType;->toInt()I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    invoke-static {p0}, Lcom/bytedance/realx/video/RXVideoScaleFilter;->fromId(I)Lcom/bytedance/realx/video/RXVideoScaleFilter;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getTextureId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getTextureMatrix()[F
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/16 p0, 0x10

    .line 6
    .line 7
    new-array p0, p0, [F

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    const/high16 v1, 0x3f800000    # 1.0f

    .line 11
    .line 12
    aput v1, p0, v0

    .line 13
    .line 14
    const/4 v0, 0x5

    .line 15
    aput v1, p0, v0

    .line 16
    .line 17
    const/16 v0, 0xa

    .line 18
    .line 19
    aput v1, p0, v0

    .line 20
    .line 21
    const/16 v0, 0xf

    .line 22
    .line 23
    aput v1, p0, v0

    .line 24
    .line 25
    return-object p0

    .line 26
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->nativeGetTransFormMatrix()[F

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    return-object p0
.end method

.method public getTextureTarget()Lcom/bytedance/realx/video/RXPixelFormat;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getTypeGlTarget()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Lcom/bytedance/realx/video/RXPixelFormat;->fromId(I)Lcom/bytedance/realx/video/RXPixelFormat;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getUnScaledHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getUnscaledHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getUnScaledWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;->getUnscaledWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/bridge/WebrtcTextureVideoMemory;->textureBuffer:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
