.class public Lcom/bytedance/realx/video/TextureBufferImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;


# instance fields
.field private final height:I

.field private final id:I

.field private final refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

.field private scaleFilter:Lcom/bytedance/realx/video/FilterType;

.field private final toI420Handler:Landroid/os/Handler;

.field private final transformMatrix:Landroid/graphics/Matrix;

.field private final type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

.field private final unscaledHeight:I

.field private final unscaledWidth:I

.field private final width:I

.field private final yuvConverter:Lcom/bytedance/realx/video/YuvConverter;


# direct methods
.method private constructor <init>(IIIILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILcom/bytedance/realx/video/FilterType;Landroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 0
    .param p11    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledWidth:I

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledHeight:I

    .line 7
    .line 8
    iput p3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 9
    .line 10
    iput p4, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 13
    .line 14
    iput p6, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->id:I

    .line 15
    .line 16
    iput-object p7, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 17
    .line 18
    iput-object p8, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 19
    .line 20
    iput-object p9, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 21
    .line 22
    iput-object p10, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 23
    .line 24
    new-instance p1, Lcom/bytedance/realx/base/RefCountDelegate;

    .line 25
    .line 26
    invoke-direct {p1, p11}, Lcom/bytedance/realx/base/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 30
    .line 31
    return-void
.end method

.method public constructor <init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V
    .locals 0
    .param p8    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 32
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 33
    iput p1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledWidth:I

    .line 34
    iput p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledHeight:I

    .line 35
    iput p1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 36
    iput p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 37
    iput-object p3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 38
    iput p4, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->id:I

    .line 39
    iput-object p5, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 40
    iput-object p6, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 41
    iput-object p7, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 42
    new-instance p1, Lcom/bytedance/realx/base/RefCountDelegate;

    invoke-direct {p1, p8}, Lcom/bytedance/realx/base/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    return-void
.end method

.method public static synthetic a()Landroid/opengl/EGLContext;
    .locals 1

    .line 1
    invoke-static {}, Landroid/opengl/EGL14;->eglGetCurrentContext()Landroid/opengl/EGLContext;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    return-object v0
.end method

.method private applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/bytedance/realx/video/TextureBufferImpl;
    .locals 12

    .line 1
    new-instance v8, Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-direct {v8, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v8, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->retain()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 15
    .line 16
    iget-object v5, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 17
    .line 18
    iget v6, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->id:I

    .line 19
    .line 20
    iget-object v7, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 21
    .line 22
    iget-object v9, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 23
    .line 24
    iget-object v10, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 25
    .line 26
    new-instance v11, Ll/cti0;

    .line 27
    .line 28
    invoke-direct {v11, p0}, Ll/cti0;-><init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V

    .line 29
    .line 30
    .line 31
    move v1, p2

    .line 32
    move v2, p3

    .line 33
    move/from16 v3, p4

    .line 34
    .line 35
    move/from16 v4, p5

    .line 36
    .line 37
    invoke-direct/range {v0 .. v11}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IIIILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILcom/bytedance/realx/video/FilterType;Landroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 38
    .line 39
    .line 40
    return-object v0
.end method

.method public static synthetic b(Lcom/bytedance/realx/video/TextureBufferImpl;I)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/YuvConverter;->queueTexture(I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static synthetic c(Lcom/bytedance/realx/video/TextureBufferImpl;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/bytedance/realx/video/YuvConverter;->convert(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic d(Lcom/bytedance/realx/video/TextureBufferImpl;)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 4
    .line 5
    iget v2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledWidth:I

    .line 6
    .line 7
    iget v3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledHeight:I

    .line 8
    .line 9
    invoke-virtual {v0, p0, v1, v2, v3}, Lcom/bytedance/realx/video/YuvConverter;->convert(Lcom/bytedance/realx/video/VideoFrame$TextureBuffer;Lcom/bytedance/realx/video/FilterType;II)Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    return-object p0
.end method

.method public static synthetic e(Lcom/bytedance/realx/video/TextureBufferImpl;)Lcom/bytedance/realx/video/TextureBufferImpl;
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 2
    .line 3
    iget v1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 4
    .line 5
    iget v2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 6
    .line 7
    invoke-virtual {v0, v1, v2}, Lcom/bytedance/realx/video/YuvConverter;->dequeueTexture(II)I

    .line 8
    .line 9
    .line 10
    move-result v6

    .line 11
    if-nez v6, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return-object p0

    .line 15
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 16
    .line 17
    sget-object v1, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->OES:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 18
    .line 19
    if-ne v0, v1, :cond_1

    .line 20
    .line 21
    const/16 v0, 0xb

    .line 22
    .line 23
    :goto_0
    move v4, v0

    .line 24
    goto :goto_1

    .line 25
    :cond_1
    const/16 v0, 0xa

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :goto_1
    iget-object v3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 29
    .line 30
    iget v5, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->id:I

    .line 31
    .line 32
    iget v7, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 33
    .line 34
    iget v8, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 35
    .line 36
    invoke-virtual/range {v3 .. v8}, Lcom/bytedance/realx/video/YuvConverter;->drawTexture(IIIII)V

    .line 37
    .line 38
    .line 39
    new-instance v3, Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 40
    .line 41
    iget v4, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 42
    .line 43
    iget v5, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 44
    .line 45
    move v7, v6

    .line 46
    sget-object v6, Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;->RGB:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 47
    .line 48
    iget-object v8, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 49
    .line 50
    iget-object v9, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 51
    .line 52
    iget-object v10, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->yuvConverter:Lcom/bytedance/realx/video/YuvConverter;

    .line 53
    .line 54
    new-instance v11, Ll/dti0;

    .line 55
    .line 56
    invoke-direct {v11, p0, v7}, Ll/dti0;-><init>(Lcom/bytedance/realx/video/TextureBufferImpl;I)V

    .line 57
    .line 58
    .line 59
    invoke-direct/range {v3 .. v11}, Lcom/bytedance/realx/video/TextureBufferImpl;-><init>(IILcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/bytedance/realx/video/YuvConverter;Ljava/lang/Runnable;)V

    .line 60
    .line 61
    .line 62
    return-object v3
.end method


# virtual methods
.method public applyTransformMatrix(Landroid/graphics/Matrix;II)Lcom/bytedance/realx/video/TextureBufferImpl;
    .locals 6

    move v4, p2

    move v5, p3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 41
    invoke-direct/range {v0 .. v5}, Lcom/bytedance/realx/video/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/bytedance/realx/video/TextureBufferImpl;

    move-result-object p0

    return-object p0
.end method

.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/eti0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/eti0;-><init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 13
    .line 14
    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 3

    .line 1
    move v0, p1

    .line 2
    new-instance p1, Landroid/graphics/Matrix;

    .line 3
    .line 4
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 5
    .line 6
    .line 7
    iget v1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 8
    .line 9
    add-int/2addr p2, p4

    .line 10
    sub-int p2, v1, p2

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    iget v2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    div-float/2addr v0, v2

    .line 17
    int-to-float p2, p2

    .line 18
    int-to-float v1, v1

    .line 19
    div-float/2addr p2, v1

    .line 20
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 21
    .line 22
    .line 23
    int-to-float p2, p3

    .line 24
    iget v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 25
    .line 26
    int-to-float v0, v0

    .line 27
    div-float/2addr p2, v0

    .line 28
    int-to-float v0, p4

    .line 29
    iget v1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    div-float/2addr v0, v1

    .line 33
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 34
    .line 35
    .line 36
    sget-object p2, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 37
    .line 38
    iput-object p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 39
    .line 40
    iget p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledWidth:I

    .line 41
    .line 42
    mul-int/2addr p2, p3

    .line 43
    int-to-float p2, p2

    .line 44
    iget p3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 45
    .line 46
    int-to-float p3, p3

    .line 47
    div-float/2addr p2, p3

    .line 48
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 49
    .line 50
    .line 51
    move-result p2

    .line 52
    iget p3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledHeight:I

    .line 53
    .line 54
    mul-int/2addr p3, p4

    .line 55
    int-to-float p3, p3

    .line 56
    iget p4, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 57
    .line 58
    int-to-float p4, p4

    .line 59
    div-float/2addr p3, p4

    .line 60
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 61
    .line 62
    .line 63
    move-result p3

    .line 64
    move p4, p5

    .line 65
    move p5, p6

    .line 66
    invoke-direct/range {p0 .. p5}, Lcom/bytedance/realx/video/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    return-object p0
.end method

.method public cropAndScaleWithFilter(IIIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 3

    .line 1
    move v0, p1

    .line 2
    new-instance p1, Landroid/graphics/Matrix;

    .line 3
    .line 4
    invoke-direct {p1}, Landroid/graphics/Matrix;-><init>()V

    .line 5
    .line 6
    .line 7
    iget v1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 8
    .line 9
    add-int/2addr p2, p4

    .line 10
    sub-int p2, v1, p2

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    iget v2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 14
    .line 15
    int-to-float v2, v2

    .line 16
    div-float/2addr v0, v2

    .line 17
    int-to-float p2, p2

    .line 18
    int-to-float v1, v1

    .line 19
    div-float/2addr p2, v1

    .line 20
    invoke-virtual {p1, v0, p2}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 21
    .line 22
    .line 23
    int-to-float p2, p3

    .line 24
    iget v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 25
    .line 26
    int-to-float v0, v0

    .line 27
    div-float/2addr p2, v0

    .line 28
    int-to-float v0, p4

    .line 29
    iget v1, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 30
    .line 31
    int-to-float v1, v1

    .line 32
    div-float/2addr v0, v1

    .line 33
    invoke-virtual {p1, p2, v0}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 34
    .line 35
    .line 36
    invoke-static {p7}, Lcom/bytedance/realx/video/FilterType;->fromValue(I)Lcom/bytedance/realx/video/FilterType;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    iput-object p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 41
    .line 42
    iget p2, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledWidth:I

    .line 43
    .line 44
    mul-int/2addr p2, p3

    .line 45
    int-to-float p2, p2

    .line 46
    iget p3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 47
    .line 48
    int-to-float p3, p3

    .line 49
    div-float/2addr p2, p3

    .line 50
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    iget p3, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledHeight:I

    .line 55
    .line 56
    mul-int/2addr p3, p4

    .line 57
    int-to-float p3, p3

    .line 58
    iget p4, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 59
    .line 60
    int-to-float p4, p4

    .line 61
    div-float/2addr p3, p4

    .line 62
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 63
    .line 64
    .line 65
    move-result p3

    .line 66
    move p4, p5

    .line 67
    move p5, p6

    .line 68
    invoke-direct/range {p0 .. p5}, Lcom/bytedance/realx/video/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    return-object p0
.end method

.method public getEglContext()Landroid/opengl/EGLContext;
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

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
    new-instance v0, Ll/ati0;

    .line 8
    .line 9
    invoke-direct {v0}, Ll/ati0;-><init>()V

    .line 10
    .line 11
    .line 12
    invoke-static {p0, v0}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    check-cast p0, Landroid/opengl/EGLContext;

    .line 17
    .line 18
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getNativeEglContext()J
    .locals 2

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getEglContext()Landroid/opengl/EGLContext;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTypeGlTarget()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->type:Lcom/bytedance/realx/video/VideoFrame$TextureBuffer$Type;

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

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnscaledWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->unscaledWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public nativeGetTransFormMatrix()[F
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

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
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

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
    iget-object p0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

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
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getWidth()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    mul-int/2addr v1, p2

    .line 11
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getHeight()I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    div-int/2addr v1, v2

    .line 16
    invoke-static {p1, v1}, Ljava/lang/Math;->min(II)I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getHeight()I

    .line 21
    .line 22
    .line 23
    move-result v2

    .line 24
    mul-int/2addr v2, p1

    .line 25
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getWidth()I

    .line 26
    .line 27
    .line 28
    move-result v3

    .line 29
    div-int/2addr v2, v3

    .line 30
    invoke-static {p2, v2}, Ljava/lang/Math;->min(II)I

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    int-to-float v1, v1

    .line 35
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v3

    .line 39
    int-to-float v3, v3

    .line 40
    div-float/2addr v1, v3

    .line 41
    int-to-float v3, v2

    .line 42
    invoke-virtual {p0}, Lcom/bytedance/realx/video/TextureBufferImpl;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v4

    .line 46
    int-to-float v4, v4

    .line 47
    div-float/2addr v3, v4

    .line 48
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Matrix;->preScale(FF)Z

    .line 49
    .line 50
    .line 51
    add-int/2addr p4, v2

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
    invoke-virtual {v0, p3, p4}, Landroid/graphics/Matrix;->preTranslate(FF)Z

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0, v0, p1, p2}, Lcom/bytedance/realx/video/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;II)Lcom/bytedance/realx/video/TextureBufferImpl;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->scaleFilter:Lcom/bytedance/realx/video/FilterType;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    sget-object v1, Lcom/bytedance/realx/video/FilterType;->Origin:Lcom/bytedance/realx/video/FilterType;

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 11
    .line 12
    new-instance v1, Ll/gti0;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/gti0;-><init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V

    .line 15
    .line 16
    .line 17
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 22
    .line 23
    return-object p0

    .line 24
    :cond_1
    :goto_0
    iget-object v0, p0, Lcom/bytedance/realx/video/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 25
    .line 26
    new-instance v1, Ll/fti0;

    .line 27
    .line 28
    invoke-direct {v1, p0}, Ll/fti0;-><init>(Lcom/bytedance/realx/video/TextureBufferImpl;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/bytedance/realx/base/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    check-cast p0, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 36
    .line 37
    return-object p0
.end method
