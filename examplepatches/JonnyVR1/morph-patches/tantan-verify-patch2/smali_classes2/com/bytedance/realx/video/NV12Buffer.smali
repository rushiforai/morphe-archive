.class public Lcom/bytedance/realx/video/NV12Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;


# instance fields
.field private final buffer:Ljava/nio/ByteBuffer;

.field private final dataUV:Ljava/nio/ByteBuffer;

.field private final dataY:Ljava/nio/ByteBuffer;

.field private final height:I

.field private final refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

.field private final sliceHeight:I

.field private final stride:I

.field private final strideUV:I

.field private final strideY:I

.field private final width:I


# direct methods
.method public constructor <init>(IIIILjava/nio/ByteBuffer;Ljava/lang/Runnable;)V
    .locals 0
    .param p6    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput p1, p0, Lcom/bytedance/realx/video/NV12Buffer;->width:I

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/NV12Buffer;->height:I

    .line 7
    .line 8
    iput p3, p0, Lcom/bytedance/realx/video/NV12Buffer;->stride:I

    .line 9
    .line 10
    iput p4, p0, Lcom/bytedance/realx/video/NV12Buffer;->sliceHeight:I

    .line 11
    .line 12
    iput-object p5, p0, Lcom/bytedance/realx/video/NV12Buffer;->buffer:Ljava/nio/ByteBuffer;

    .line 13
    .line 14
    iput p3, p0, Lcom/bytedance/realx/video/NV12Buffer;->strideY:I

    .line 15
    .line 16
    iput p3, p0, Lcom/bytedance/realx/video/NV12Buffer;->strideUV:I

    .line 17
    .line 18
    mul-int p1, p3, p2

    .line 19
    .line 20
    add-int/lit8 p2, p2, 0x1

    .line 21
    .line 22
    div-int/lit8 p2, p2, 0x2

    .line 23
    .line 24
    const/4 p4, 0x0

    .line 25
    invoke-virtual {p5, p4}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 26
    .line 27
    .line 28
    invoke-virtual {p5, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 29
    .line 30
    .line 31
    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 32
    .line 33
    .line 34
    move-result-object p4

    .line 35
    iput-object p4, p0, Lcom/bytedance/realx/video/NV12Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 36
    .line 37
    invoke-virtual {p5, p1}, Ljava/nio/ByteBuffer;->position(I)Ljava/nio/Buffer;

    .line 38
    .line 39
    .line 40
    mul-int/2addr p2, p3

    .line 41
    add-int/2addr p1, p2

    .line 42
    invoke-virtual {p5, p1}, Ljava/nio/ByteBuffer;->limit(I)Ljava/nio/Buffer;

    .line 43
    .line 44
    .line 45
    invoke-virtual {p5}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/bytedance/realx/video/NV12Buffer;->dataUV:Ljava/nio/ByteBuffer;

    .line 50
    .line 51
    new-instance p1, Lcom/bytedance/realx/base/RefCountDelegate;

    .line 52
    .line 53
    invoke-direct {p1, p6}, Lcom/bytedance/realx/base/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 54
    .line 55
    .line 56
    iput-object p1, p0, Lcom/bytedance/realx/video/NV12Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 57
    .line 58
    return-void
.end method

.method private static native nativeCropAndScale(IIIIIILjava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V
.end method


# virtual methods
.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-static/range {p5 .. p6}, Lcom/bytedance/realx/video/JavaI420Buffer;->allocate(II)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    const/4 v0, 0x0

    .line 10
    return-object v0

    .line 11
    :cond_0
    iget-object v8, v0, Lcom/bytedance/realx/video/NV12Buffer;->buffer:Ljava/nio/ByteBuffer;

    .line 12
    .line 13
    iget v9, v0, Lcom/bytedance/realx/video/NV12Buffer;->width:I

    .line 14
    .line 15
    iget v10, v0, Lcom/bytedance/realx/video/NV12Buffer;->height:I

    .line 16
    .line 17
    iget v11, v0, Lcom/bytedance/realx/video/NV12Buffer;->stride:I

    .line 18
    .line 19
    iget v12, v0, Lcom/bytedance/realx/video/NV12Buffer;->sliceHeight:I

    .line 20
    .line 21
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 22
    .line 23
    .line 24
    move-result-object v13

    .line 25
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideY()I

    .line 26
    .line 27
    .line 28
    move-result v14

    .line 29
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 30
    .line 31
    .line 32
    move-result-object v15

    .line 33
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideU()I

    .line 34
    .line 35
    .line 36
    move-result v16

    .line 37
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 38
    .line 39
    .line 40
    move-result-object v17

    .line 41
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideV()I

    .line 42
    .line 43
    .line 44
    move-result v18

    .line 45
    move/from16 v2, p1

    .line 46
    .line 47
    move/from16 v3, p2

    .line 48
    .line 49
    move/from16 v4, p3

    .line 50
    .line 51
    move/from16 v5, p4

    .line 52
    .line 53
    move/from16 v6, p5

    .line 54
    .line 55
    move/from16 v7, p6

    .line 56
    .line 57
    invoke-static/range {v2 .. v18}, Lcom/bytedance/realx/video/NV12Buffer;->nativeCropAndScale(IIIIIILjava/nio/ByteBuffer;IIIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V

    .line 58
    .line 59
    .line 60
    return-object v1
.end method

.method public getBufferType()I
    .locals 0

    const/4 p0, 0x1

    return p0
.end method

.method public getDataUV()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->dataUV:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDataY()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->dataY:Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/nio/ByteBuffer;->slice()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideUV()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->strideUV:I

    .line 2
    .line 3
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->strideY:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

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
    iget-object p0, p0, Lcom/bytedance/realx/video/NV12Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/base/RefCountDelegate;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    invoke-static {p1, p2}, Lcom/bytedance/realx/video/JavaI420Buffer;->allocate(II)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-nez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    :cond_0
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 7

    .line 1
    iget v3, p0, Lcom/bytedance/realx/video/NV12Buffer;->width:I

    .line 2
    .line 3
    iget v4, p0, Lcom/bytedance/realx/video/NV12Buffer;->height:I

    .line 4
    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x0

    .line 7
    move v5, v3

    .line 8
    move v6, v4

    .line 9
    move-object v0, p0

    .line 10
    invoke-virtual/range {v0 .. v6}, Lcom/bytedance/realx/video/NV12Buffer;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 15
    .line 16
    return-object p0
.end method

.method public toNV12()Lcom/bytedance/realx/video/VideoFrame$NV12Buffer;
    .locals 0

    .line 1
    invoke-virtual {p0}, Lcom/bytedance/realx/video/NV12Buffer;->retain()V

    .line 2
    .line 3
    .line 4
    return-object p0
.end method
