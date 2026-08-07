.class public Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/video/ITextureBuffer;
.implements Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;


# instance fields
.field webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual/range {p0 .. p6}, Lcom/bytedance/realx/video/TextureBufferImpl;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public cropAndScaleWithFilter(IIIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual/range {p0 .. p6}, Lcom/bytedance/realx/video/TextureBufferImpl;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getEglContext()Landroid/opengl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getEglContext()Landroid/opengl/EGLContext;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getNativeEglContext()J

    .line 9
    .line 10
    .line 11
    move-result-wide v0

    .line 12
    return-wide v0
.end method

.method public getScaleFilter()Lcom/bytedance/realx/video/FilterType;
    .locals 0

    .line 1
    sget-object p0, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureId()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getTextureId()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    new-instance p0, Landroid/graphics/Matrix;

    .line 6
    .line 7
    invoke-direct {p0}, Landroid/graphics/Matrix;-><init>()V

    .line 8
    .line 9
    .line 10
    return-object p0

    .line 11
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    sget-object p0, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    return-object p0
.end method

.method public getTypeGlTarget()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->getGlTarget()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public getUnscaledHeight()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getUnscaledHeight()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public getUnscaledWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getUnscaledWidth()I

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getWidth()I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public nativeGetTransFormMatrix()[F
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    new-array p0, p0, [F

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    const/4 v1, 0x0

    .line 10
    aput v0, p0, v1

    .line 11
    .line 12
    return-object p0

    .line 13
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getTransformMatrix()Landroid/graphics/Matrix;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {p0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->release()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->retain()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/WebrtcTextureBufferWrapper;->webrtcTextureBuffer:Lcom/bytedance/realx/video/TextureBufferImpl;

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
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method
