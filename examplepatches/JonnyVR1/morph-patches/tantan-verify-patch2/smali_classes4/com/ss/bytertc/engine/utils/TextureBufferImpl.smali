.class public Lcom/ss/bytertc/engine/utils/TextureBufferImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;
.implements Lcom/ss/bytertc/engine/utils/EglContextCarrier;
.implements Lcom/ss/bytertc/engine/video/ITextureBuffer;


# instance fields
.field private final height:I

.field private final id:I

.field private mEglBaseContext:Lcom/bytedance/realx/video/EglBase$Context;

.field private refCount:I

.field private final refCountLock:Ljava/lang/Object;

.field private final releaseCallback:Ljava/lang/Runnable;

.field private scaleFilter:Lcom/bytedance/realx/video/FilterType;

.field private final textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

.field private final transformMatrix:Landroid/graphics/Matrix;

.field private final type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

.field private final width:I

.field private yuvImage:Landroid/graphics/YuvImage;


# direct methods
.method public constructor <init>(IIIILcom/ss/bytertc/engine/utils/TextureHelper;)V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/lang/Object;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCountLock:Ljava/lang/Object;

    .line 10
    .line 11
    iput p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 12
    .line 13
    iput p2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 14
    .line 15
    sget-object p1, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->getGlTarget()I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    if-ne p3, p2, :cond_0

    .line 22
    .line 23
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 24
    .line 25
    goto :goto_0

    .line 26
    :cond_0
    sget-object p1, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 27
    .line 28
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 29
    .line 30
    :goto_0
    iput p4, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 31
    .line 32
    new-instance p1, Landroid/graphics/Matrix;

    .line 33
    .line 34
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 38
    .line 39
    invoke-virtual {p1}, Landroid/graphics/Matrix;->reset()V

    .line 40
    .line 41
    .line 42
    iput-object p5, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 43
    .line 44
    new-instance p1, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;

    .line 45
    .line 46
    invoke-direct {p1, p0, p5, p4}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$1;-><init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;Lcom/ss/bytertc/engine/utils/TextureHelper;I)V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->releaseCallback:Ljava/lang/Runnable;

    .line 50
    .line 51
    const/4 p1, 0x1

    .line 52
    iput p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCount:I

    .line 53
    .line 54
    return-void
.end method

.method public constructor <init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Lcom/ss/bytertc/engine/utils/TextureHelper;Ljava/lang/Runnable;)V
    .locals 1

    .line 55
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 56
    new-instance v0, Ljava/lang/Object;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCountLock:Ljava/lang/Object;

    .line 57
    iput p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 58
    iput p2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 59
    iput-object p3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 60
    iput p4, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 61
    iput-object p5, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 62
    iput-object p6, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 63
    iput-object p7, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->releaseCallback:Ljava/lang/Runnable;

    const/4 p1, 0x1

    .line 64
    iput p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCount:I

    return-void
.end method

.method public static synthetic access$000(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;)Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 12
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->dequeueTexture()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    return-object v1

    .line 11
    :cond_0
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 12
    .line 13
    sget-object v3, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 14
    .line 15
    if-ne v2, v3, :cond_1

    .line 16
    .line 17
    const/16 v1, 0xa

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    sget-object v3, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 21
    .line 22
    if-ne v2, v3, :cond_2

    .line 23
    .line 24
    const/16 v1, 0xb

    .line 25
    .line 26
    :goto_0
    iget-object v2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 27
    .line 28
    iget v3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 29
    .line 30
    invoke-virtual {v2, v1, v3, v0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->drawTexture(III)V

    .line 31
    .line 32
    .line 33
    new-instance v4, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 34
    .line 35
    iget v5, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 36
    .line 37
    iget v6, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 38
    .line 39
    iget-object v7, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 40
    .line 41
    iget v8, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 42
    .line 43
    iget-object v9, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 44
    .line 45
    iget-object v10, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 46
    .line 47
    new-instance v11, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;

    .line 48
    .line 49
    invoke-direct {v11, p0, v0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$2;-><init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;I)V

    .line 50
    .line 51
    .line 52
    invoke-direct/range {v4 .. v11}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Lcom/ss/bytertc/engine/utils/TextureHelper;Ljava/lang/Runnable;)V

    .line 53
    .line 54
    .line 55
    return-object v4

    .line 56
    :cond_2
    return-object v1
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 9
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->retain()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Matrix;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 7
    .line 8
    .line 9
    iget v1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 10
    .line 11
    add-int/2addr p2, p4

    .line 12
    sub-int p2, v1, p2

    .line 13
    .line 14
    int-to-float p1, p1

    .line 15
    iget v2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 16
    .line 17
    int-to-float v2, v2

    .line 18
    div-float/2addr p1, v2

    .line 19
    int-to-float p2, p2

    .line 20
    int-to-float v1, v1

    .line 21
    div-float/2addr p2, v1

    .line 22
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 23
    .line 24
    .line 25
    int-to-float p1, p3

    .line 26
    iget p2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 27
    .line 28
    int-to-float p2, p2

    .line 29
    div-float/2addr p1, p2

    .line 30
    int-to-float p2, p4

    .line 31
    iget p3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 32
    .line 33
    int-to-float p3, p3

    .line 34
    div-float/2addr p2, p3

    .line 35
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 36
    .line 37
    .line 38
    const/4 p1, 0x0

    .line 39
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 40
    .line 41
    new-instance v6, Landroid/graphics/Matrix;

    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 44
    .line 45
    invoke-direct {v6, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 49
    .line 50
    .line 51
    new-instance v1, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 52
    .line 53
    iget-object v4, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 54
    .line 55
    iget v5, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 56
    .line 57
    iget-object v7, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 58
    .line 59
    new-instance v8, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$3;

    .line 60
    .line 61
    invoke-direct {v8, p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$3;-><init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;)V

    .line 62
    .line 63
    .line 64
    move v2, p5

    .line 65
    move v3, p6

    .line 66
    invoke-direct/range {v1 .. v8}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Lcom/ss/bytertc/engine/utils/TextureHelper;Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-object v1
.end method

.method public cropAndScaleWithFilter(IIIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 9

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    iget v1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 7
    .line 8
    add-int/2addr p2, p4

    .line 9
    sub-int p2, v1, p2

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    iget v2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 13
    .line 14
    int-to-float v2, v2

    .line 15
    div-float/2addr p1, v2

    .line 16
    int-to-float p2, p2

    .line 17
    int-to-float v1, v1

    .line 18
    div-float/2addr p2, v1

    .line 19
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 20
    .line 21
    .line 22
    int-to-float p1, p3

    .line 23
    iget p2, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 24
    .line 25
    int-to-float p2, p2

    .line 26
    div-float/2addr p1, p2

    .line 27
    int-to-float p2, p4

    .line 28
    iget p3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 29
    .line 30
    int-to-float p3, p3

    .line 31
    div-float/2addr p2, p3

    .line 32
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 33
    .line 34
    .line 35
    invoke-static/range {p7 .. p7}, Lcom/bytedance/realx/video/FilterType;->fromValue(I)Lcom/bytedance/realx/video/FilterType;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 40
    .line 41
    new-instance v6, Landroid/graphics/Matrix;

    .line 42
    .line 43
    iget-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 44
    .line 45
    invoke-direct {v6, p1}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v6, v0}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 49
    .line 50
    .line 51
    new-instance v1, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 52
    .line 53
    iget-object v4, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 54
    .line 55
    iget v5, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 56
    .line 57
    iget-object v7, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 58
    .line 59
    new-instance v8, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$4;

    .line 60
    .line 61
    invoke-direct {v8, p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$4;-><init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;)V

    .line 62
    .line 63
    .line 64
    move v2, p5

    .line 65
    move v3, p6

    .line 66
    invoke-direct/range {v1 .. v8}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Lcom/ss/bytertc/engine/utils/TextureHelper;Ljava/lang/Runnable;)V

    .line 67
    .line 68
    .line 69
    return-object v1
.end method

.method public getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->mEglBaseContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 2
    .line 3
    return-object p0
.end method

.method public getEglContext()Landroid/opengl/EGLContext;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->getEglBaseContext()Lcom/bytedance/realx/video/EglBase$Context;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-interface {p0}, Lcom/bytedance/realx/video/EglBase$Context;->getEgl14Context()Landroid/opengl/EGLContext;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->getNativeEglContext()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public getScaleFilter()Lcom/bytedance/realx/video/FilterType;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    sget-object p0, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureHelper()Lcom/ss/bytertc/engine/utils/TextureHelper;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureId()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeGlTarget()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->getGlTarget()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getUnscaledHeight()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnscaledWidth()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public nativeGetTransFormMatrix()[F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-static {p0}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixFromAndroidGraphicsMatrix(Landroid/graphics/Matrix;)[F

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public release()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCountLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCount:I

    .line 5
    .line 6
    add-int/lit8 v1, v1, -0x1

    .line 7
    .line 8
    iput v1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCount:I

    .line 9
    .line 10
    if-nez v1, :cond_0

    .line 11
    .line 12
    iget-object p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->releaseCallback:Ljava/lang/Runnable;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 17
    .line 18
    .line 19
    goto :goto_0

    .line 20
    :catchall_0
    move-exception p0

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    :goto_0
    monitor-exit v0

    .line 23
    return-void

    .line 24
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    throw p0
.end method

.method public retain()V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCountLock:Ljava/lang/Object;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget v1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCount:I

    .line 5
    .line 6
    add-int/lit8 v1, v1, 0x1

    .line 7
    .line 8
    iput v1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->refCount:I

    .line 9
    .line 10
    monitor-exit v0

    .line 11
    return-void

    .line 12
    :catchall_0
    move-exception p0

    .line 13
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    throw p0
.end method

.method public saveMyBitmap(Ljava/lang/String;[BII)V
    .locals 6

    .line 1
    const-string p3, "texturebuffer"

    .line 2
    .line 3
    const-string p4, "saveMyBitmap"

    .line 4
    .line 5
    invoke-static {p3, p4}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    new-instance p3, Ljava/io/File;

    .line 9
    .line 10
    invoke-direct {p3, p1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    :try_start_0
    invoke-virtual {p3}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 14
    .line 15
    .line 16
    :catch_0
    :try_start_1
    new-instance p1, Ljava/io/FileOutputStream;

    .line 17
    .line 18
    invoke-direct {p1, p3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/FileNotFoundException; {:try_start_1 .. :try_end_1} :catch_1

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catch_1
    move-exception v0

    .line 23
    move-object p1, v0

    .line 24
    invoke-virtual {p1}, Ljava/lang/Throwable;->printStackTrace()V

    .line 25
    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    :goto_0
    new-instance v0, Landroid/graphics/YuvImage;

    .line 29
    .line 30
    iget v3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 31
    .line 32
    iget v4, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 33
    .line 34
    const/4 v5, 0x0

    .line 35
    const/16 v2, 0x11

    .line 36
    .line 37
    move-object v1, p2

    .line 38
    invoke-direct/range {v0 .. v5}, Landroid/graphics/YuvImage;-><init>([BIII[I)V

    .line 39
    .line 40
    .line 41
    :try_start_2
    new-instance p2, Landroid/graphics/Rect;

    .line 42
    .line 43
    iget p3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->width:I

    .line 44
    .line 45
    iget p0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->height:I

    .line 46
    .line 47
    const/4 p4, 0x0

    .line 48
    invoke-direct {p2, p4, p4, p3, p0}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    const/16 p0, 0x32

    .line 52
    .line 53
    invoke-virtual {v0, p2, p0, p1}, Landroid/graphics/YuvImage;->compressToJpeg(Landroid/graphics/Rect;ILjava/io/OutputStream;)Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 54
    .line 55
    .line 56
    :catch_2
    :try_start_3
    invoke-virtual {p1}, Ljava/io/OutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3

    .line 57
    .line 58
    .line 59
    goto :goto_1

    .line 60
    :catch_3
    move-exception v0

    .line 61
    move-object p0, v0

    .line 62
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 63
    .line 64
    .line 65
    :goto_1
    :try_start_4
    invoke-virtual {p1}, Ljava/io/FileOutputStream;->close()V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_4

    .line 66
    .line 67
    .line 68
    goto :goto_2

    .line 69
    :catch_4
    move-exception v0

    .line 70
    move-object p0, v0

    .line 71
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 72
    .line 73
    .line 74
    :goto_2
    return-void
.end method

.method public scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 8

    .line 1
    new-instance v5, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v5}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    mul-int/2addr v0, p2

    .line 11
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    div-int/2addr v0, v1

    .line 16
    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    mul-int/2addr v1, p1

    .line 25
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    div-int/2addr v1, v2

    .line 30
    invoke-static {p2, v1}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v1

    .line 34
    int-to-float v0, v0

    .line 35
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v2

    .line 39
    int-to-float v2, v2

    .line 40
    div-float/2addr v0, v2

    .line 41
    int-to-float v2, v1

    .line 42
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    int-to-float v3, v3

    .line 47
    div-float/2addr v2, v3

    .line 48
    invoke-virtual {v5, v0, v2}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 49
    .line 50
    .line 51
    add-int/2addr p4, v1

    .line 52
    sub-int p4, p2, p4

    .line 53
    .line 54
    div-int/2addr p3, p1

    .line 55
    int-to-float p3, p3

    .line 56
    div-int/2addr p4, p2

    .line 57
    int-to-float p4, p4

    .line 58
    invoke-virtual {v5, p3, p4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 59
    .line 60
    .line 61
    new-instance v0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;

    .line 62
    .line 63
    iget-object v3, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 64
    .line 65
    iget v4, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->id:I

    .line 66
    .line 67
    iget-object v6, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 68
    .line 69
    new-instance v7, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$5;

    .line 70
    .line 71
    invoke-direct {v7, p0}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl$5;-><init>(Lcom/ss/bytertc/engine/utils/TextureBufferImpl;)V

    .line 72
    .line 73
    .line 74
    move v1, p1

    .line 75
    move v2, p2

    .line 76
    invoke-direct/range {v0 .. v7}, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Lcom/ss/bytertc/engine/utils/TextureHelper;Ljava/lang/Runnable;)V

    .line 77
    .line 78
    .line 79
    return-object v0
.end method

.method public setEglBaseContext(Lcom/bytedance/realx/video/EglBase$Context;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->mEglBaseContext:Lcom/bytedance/realx/video/EglBase$Context;

    .line 2
    .line 3
    return-void
.end method

.method public setTransFormMatrix([F)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {p1}, Lcom/bytedance/realx/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/utils/TextureBufferImpl;->textureHelper:Lcom/ss/bytertc/engine/utils/TextureHelper;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/ss/bytertc/engine/utils/TextureHelper;->textureToYuv(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
