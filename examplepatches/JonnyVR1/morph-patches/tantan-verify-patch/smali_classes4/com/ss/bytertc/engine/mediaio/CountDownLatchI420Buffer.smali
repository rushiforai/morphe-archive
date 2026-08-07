.class public Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/video/VideoFrame$I420Buffer;


# instance fields
.field private final buffer:Lcom/bytedance/realx/video/JavaI420Buffer;
    .annotation build Landroidx/annotation/NonNull;
    .end annotation
.end field

.field private final mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

.field private mCustomReleaseCallback:Ljava/lang/Runnable;


# direct methods
.method private constructor <init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/CountDownLatch;

    .line 5
    .line 6
    const/4 v1, 0x1

    .line 7
    invoke-direct {v0, v1}, Ljava/util/concurrent/CountDownLatch;-><init>(I)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 11
    .line 12
    iput-object p9, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->mCustomReleaseCallback:Ljava/lang/Runnable;

    .line 13
    .line 14
    move-object v0, p9

    .line 15
    new-instance p9, Ll/prb;

    .line 16
    .line 17
    invoke-direct {p9, p0, v0}, Ll/prb;-><init>(Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;Ljava/lang/Runnable;)V

    .line 18
    .line 19
    .line 20
    invoke-static/range {p1 .. p9}, Lcom/bytedance/realx/video/JavaI420Buffer;->wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    iput-object p1, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 25
    .line 26
    return-void
.end method

.method public static synthetic a(Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;Ljava/lang/Runnable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    .line 4
    .line 5
    .line 6
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->mCustomReleaseCallback:Ljava/lang/Runnable;

    .line 7
    .line 8
    if-eqz p0, :cond_0

    .line 9
    .line 10
    invoke-interface {p1}, Ljava/lang/Runnable;->run()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public static wrap(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;
    .locals 10

    .line 1
    new-instance v0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;

    .line 2
    .line 3
    move v1, p0

    .line 4
    move v2, p1

    .line 5
    move-object v3, p2

    .line 6
    move v4, p3

    .line 7
    move-object v5, p4

    .line 8
    move v6, p5

    .line 9
    move-object/from16 v7, p6

    .line 10
    .line 11
    move/from16 v8, p7

    .line 12
    .line 13
    move-object/from16 v9, p8

    .line 14
    .line 15
    invoke-direct/range {v0 .. v9}, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;-><init>(IILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/nio/ByteBuffer;ILjava/lang/Runnable;)V

    .line 16
    .line 17
    .line 18
    return-object v0
.end method


# virtual methods
.method public copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->copyData()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p6}, Lcom/bytedance/realx/video/JavaI420Buffer;->cropAndScale(IIIIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDataU()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataU()Ljava/nio/ByteBuffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getDataV()Ljava/nio/ByteBuffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataV()Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getDataY()Ljava/nio/ByteBuffer;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getHeight()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getLatch()Ljava/util/concurrent/CountDownLatch;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->mCountDownLatch:Ljava/util/concurrent/CountDownLatch;

    .line 2
    .line 3
    return-object p0
.end method

.method public getStrideU()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideU()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getStrideV()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideV()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getStrideY()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getStrideY()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getWidth()I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->getWidth()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public release()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->release()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public retain()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->retain()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/bytedance/realx/video/JavaI420Buffer;->scaleAndFill(IIII)Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/mediaio/CountDownLatchI420Buffer;->buffer:Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/bytedance/realx/video/JavaI420Buffer;->toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method
