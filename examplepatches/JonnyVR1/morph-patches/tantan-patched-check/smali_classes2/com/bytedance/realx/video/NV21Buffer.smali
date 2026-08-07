.class public Lcom/bytedance/realx/video/NV21Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$Buffer;


# instance fields
.field private final data:[B

.field private final height:I

.field private final refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

.field private final stride:I

.field private final width:I


# direct methods
.method public constructor <init>([BIIILjava/lang/Runnable;)V
    .locals 0
    .param p5    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 20
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 21
    iput-object p1, p0, Lcom/bytedance/realx/video/NV21Buffer;->data:[B

    .line 22
    iput p2, p0, Lcom/bytedance/realx/video/NV21Buffer;->stride:I

    .line 23
    iput p3, p0, Lcom/bytedance/realx/video/NV21Buffer;->width:I

    .line 24
    iput p4, p0, Lcom/bytedance/realx/video/NV21Buffer;->height:I

    .line 25
    new-instance p1, Lcom/bytedance/realx/base/RefCountDelegate;

    invoke-direct {p1, p5}, Lcom/bytedance/realx/base/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    iput-object p1, p0, Lcom/bytedance/realx/video/NV21Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    return-void
.end method

.method public constructor <init>([BIILjava/lang/Runnable;)V
    .locals 0
    .param p4    # Ljava/lang/Runnable;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/bytedance/realx/video/NV21Buffer;->data:[B

    .line 5
    .line 6
    iput p2, p0, Lcom/bytedance/realx/video/NV21Buffer;->width:I

    .line 7
    .line 8
    iput p2, p0, Lcom/bytedance/realx/video/NV21Buffer;->stride:I

    .line 9
    .line 10
    iput p3, p0, Lcom/bytedance/realx/video/NV21Buffer;->height:I

    .line 11
    .line 12
    new-instance p1, Lcom/bytedance/realx/base/RefCountDelegate;

    .line 13
    .line 14
    invoke-direct {p1, p4}, Lcom/bytedance/realx/base/RefCountDelegate;-><init>(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lcom/bytedance/realx/video/NV21Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

    .line 18
    .line 19
    return-void
.end method

.method private static native nativeCropAndScale(IIIIII[BIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V
.end method


# virtual methods
.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    const/4 p0, 0x0

    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 17

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
    iget-object v8, v0, Lcom/bytedance/realx/video/NV21Buffer;->data:[B

    .line 12
    .line 13
    iget v9, v0, Lcom/bytedance/realx/video/NV21Buffer;->stride:I

    .line 14
    .line 15
    iget v10, v0, Lcom/bytedance/realx/video/NV21Buffer;->height:I

    .line 16
    .line 17
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataY()Ljava/nio/ByteBuffer;

    .line 18
    .line 19
    .line 20
    move-result-object v11

    .line 21
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideY()I

    .line 22
    .line 23
    .line 24
    move-result v12

    .line 25
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 26
    .line 27
    .line 28
    move-result-object v13

    .line 29
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideU()I

    .line 30
    .line 31
    .line 32
    move-result v14

    .line 33
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataV()Ljava/nio/ByteBuffer;

    .line 34
    .line 35
    .line 36
    move-result-object v15

    .line 37
    invoke-virtual {v1}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideV()I

    .line 38
    .line 39
    .line 40
    move-result v16

    .line 41
    move/from16 v2, p1

    .line 42
    .line 43
    move/from16 v3, p2

    .line 44
    .line 45
    move/from16 v4, p3

    .line 46
    .line 47
    move/from16 v5, p4

    .line 48
    .line 49
    move/from16 v6, p5

    .line 50
    .line 51
    move/from16 v7, p6

    .line 52
    .line 53
    invoke-static/range {v2 .. v16}, Lcom/bytedance/realx/video/NV21Buffer;->nativeCropAndScale(IIIIII[BIILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;I)V

    .line 54
    .line 55
    .line 56
    return-object v1
.end method

.method public getBufferType()I
    .locals 0

    const/4 p0, 0x2

    return p0
.end method

.method public getHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/NV21Buffer;->height:I

    .line 2
    .line 3
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/bytedance/realx/video/NV21Buffer;->width:I

    .line 2
    .line 3
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/NV21Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

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
    iget-object p0, p0, Lcom/bytedance/realx/video/NV21Buffer;->refCountDelegate:Lcom/bytedance/realx/base/RefCountDelegate;

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
    iget v3, p0, Lcom/bytedance/realx/video/NV21Buffer;->stride:I

    .line 2
    .line 3
    iget v4, p0, Lcom/bytedance/realx/video/NV21Buffer;->height:I

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
    invoke-virtual/range {v0 .. v6}, Lcom/bytedance/realx/video/NV21Buffer;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

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
