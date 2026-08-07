.class public Lcom/momo/rtcbase/TextureBufferImpl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/rtcbase/VideoFrame$TextureBuffer;


# instance fields
.field private final height:I

.field private final id:I

.field private final refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

.field private final toI420Handler:Landroid/os/Handler;

.field private final transformMatrix:Landroid/graphics/Matrix;

.field private final type:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

.field private final unscaledHeight:I

.field private final unscaledWidth:I

.field private final width:I

.field private final yuvConverter:Lcom/momo/rtcbase/YuvConverter;


# direct methods
.method private constructor <init>(IIIILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V
    .locals 0

    .line 30
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 31
    iput p1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledWidth:I

    .line 32
    iput p2, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledHeight:I

    .line 33
    iput p3, p0, Lcom/momo/rtcbase/TextureBufferImpl;->width:I

    .line 34
    iput p4, p0, Lcom/momo/rtcbase/TextureBufferImpl;->height:I

    .line 35
    iput-object p5, p0, Lcom/momo/rtcbase/TextureBufferImpl;->type:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 36
    iput p6, p0, Lcom/momo/rtcbase/TextureBufferImpl;->id:I

    .line 37
    iput-object p7, p0, Lcom/momo/rtcbase/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 38
    iput-object p8, p0, Lcom/momo/rtcbase/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 39
    iput-object p9, p0, Lcom/momo/rtcbase/TextureBufferImpl;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 40
    new-instance p1, Lcom/momo/rtcbase/RefCountDelegate;

    invoke-direct {p1, p10}, Lcom/momo/rtcbase/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    return-void
.end method

.method public constructor <init>(IILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledWidth:I

    .line 5
    .line 6
    iput p2, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledHeight:I

    .line 7
    .line 8
    iput p1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->width:I

    .line 9
    .line 10
    iput p2, p0, Lcom/momo/rtcbase/TextureBufferImpl;->height:I

    .line 11
    .line 12
    iput-object p3, p0, Lcom/momo/rtcbase/TextureBufferImpl;->type:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 13
    .line 14
    iput p4, p0, Lcom/momo/rtcbase/TextureBufferImpl;->id:I

    .line 15
    .line 16
    iput-object p5, p0, Lcom/momo/rtcbase/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 17
    .line 18
    iput-object p6, p0, Lcom/momo/rtcbase/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 19
    .line 20
    iput-object p7, p0, Lcom/momo/rtcbase/TextureBufferImpl;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 21
    .line 22
    new-instance p1, Lcom/momo/rtcbase/RefCountDelegate;

    .line 23
    .line 24
    invoke-direct {p1, p8}, Lcom/momo/rtcbase/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    .line 28
    .line 29
    return-void
.end method

.method public static synthetic a(Lcom/momo/rtcbase/TextureBufferImpl;)Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Lcom/momo/rtcbase/YuvConverter;->convert(Lcom/momo/rtcbase/VideoFrame$TextureBuffer;)Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method private applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/momo/rtcbase/TextureBufferImpl;
    .locals 11

    .line 1
    new-instance v7, Landroid/graphics/Matrix;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 4
    .line 5
    invoke-direct {v7, v0}, Landroid/graphics/Matrix;-><init>(Landroid/graphics/Matrix;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v7, p1}, Landroid/graphics/Matrix;->preConcat(Landroid/graphics/Matrix;)Z

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/momo/rtcbase/TextureBufferImpl;->retain()V

    .line 12
    .line 13
    .line 14
    new-instance v0, Lcom/momo/rtcbase/TextureBufferImpl;

    .line 15
    .line 16
    iget-object v5, p0, Lcom/momo/rtcbase/TextureBufferImpl;->type:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 17
    .line 18
    iget v6, p0, Lcom/momo/rtcbase/TextureBufferImpl;->id:I

    .line 19
    .line 20
    iget-object v8, p0, Lcom/momo/rtcbase/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 21
    .line 22
    iget-object v9, p0, Lcom/momo/rtcbase/TextureBufferImpl;->yuvConverter:Lcom/momo/rtcbase/YuvConverter;

    .line 23
    .line 24
    new-instance v10, Ll/bti0;

    .line 25
    .line 26
    invoke-direct {v10, p0}, Ll/bti0;-><init>(Lcom/momo/rtcbase/TextureBufferImpl;)V

    .line 27
    .line 28
    .line 29
    move v1, p2

    .line 30
    move v2, p3

    .line 31
    move v3, p4

    .line 32
    move/from16 v4, p5

    .line 33
    .line 34
    invoke-direct/range {v0 .. v10}, Lcom/momo/rtcbase/TextureBufferImpl;-><init>(IIIILcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lcom/momo/rtcbase/YuvConverter;Ljava/lang/Runnable;)V

    .line 35
    .line 36
    .line 37
    return-object v0
.end method


# virtual methods
.method public applyTransformMatrix(Landroid/graphics/Matrix;II)Lcom/momo/rtcbase/TextureBufferImpl;
    .locals 6

    move v4, p2

    move v5, p3

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 38
    invoke-direct/range {v0 .. v5}, Lcom/momo/rtcbase/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/momo/rtcbase/TextureBufferImpl;

    move-result-object p0

    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/momo/rtcbase/VideoFrame$Buffer;
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
    iget v1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->height:I

    .line 8
    .line 9
    add-int/2addr p2, p4

    .line 10
    sub-int p2, v1, p2

    .line 11
    .line 12
    int-to-float v0, v0

    .line 13
    iget v2, p0, Lcom/momo/rtcbase/TextureBufferImpl;->width:I

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
    iget v0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->width:I

    .line 25
    .line 26
    int-to-float v0, v0

    .line 27
    div-float/2addr p2, v0

    .line 28
    int-to-float v0, p4

    .line 29
    iget v1, p0, Lcom/momo/rtcbase/TextureBufferImpl;->height:I

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
    iget p2, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledWidth:I

    .line 37
    .line 38
    mul-int/2addr p2, p3

    .line 39
    int-to-float p2, p2

    .line 40
    iget p3, p0, Lcom/momo/rtcbase/TextureBufferImpl;->width:I

    .line 41
    .line 42
    int-to-float p3, p3

    .line 43
    div-float/2addr p2, p3

    .line 44
    invoke-static {p2}, Ljava/lang/Math;->round(F)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iget p3, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledHeight:I

    .line 49
    .line 50
    mul-int/2addr p3, p4

    .line 51
    int-to-float p3, p3

    .line 52
    iget p4, p0, Lcom/momo/rtcbase/TextureBufferImpl;->height:I

    .line 53
    .line 54
    int-to-float p4, p4

    .line 55
    div-float/2addr p3, p4

    .line 56
    invoke-static {p3}, Ljava/lang/Math;->round(F)I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    move p4, p5

    .line 61
    move p5, p6

    .line 62
    invoke-direct/range {p0 .. p5}, Lcom/momo/rtcbase/TextureBufferImpl;->applyTransformMatrix(Landroid/graphics/Matrix;IIII)Lcom/momo/rtcbase/TextureBufferImpl;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getTextureId()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->id:I

    .line 2
    .line 3
    return p0
.end method

.method public getTransformMatrix()Landroid/graphics/Matrix;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->transformMatrix:Landroid/graphics/Matrix;

    .line 2
    .line 3
    return-object p0
.end method

.method public getType()Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->type:Lcom/momo/rtcbase/VideoFrame$TextureBuffer$Type;

    .line 2
    .line 3
    return-object p0
.end method

.method public getUnscaledHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getUnscaledWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->unscaledWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/RefCountDelegate;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->refCountDelegate:Lcom/momo/rtcbase/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/momo/rtcbase/RefCountDelegate;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public toI420()Lcom/momo/rtcbase/VideoFrame$I420Buffer;
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/momo/rtcbase/TextureBufferImpl;->toI420Handler:Landroid/os/Handler;

    .line 2
    .line 3
    new-instance v1, Ll/zsi0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/zsi0;-><init>(Lcom/momo/rtcbase/TextureBufferImpl;)V

    .line 6
    .line 7
    .line 8
    invoke-static {v0, v1}, Lcom/momo/rtcbase/ThreadUtils;->invokeAtFrontUninterruptibly(Landroid/os/Handler;Ljava/util/concurrent/Callable;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Lcom/momo/rtcbase/VideoFrame$I420Buffer;

    .line 13
    .line 14
    return-object p0
.end method
