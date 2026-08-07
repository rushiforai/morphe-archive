.class public Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IDecodeOneFrameFFmpeg;


# instance fields
.field private pointer:J

.field private sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->pointer:J

    .line 7
    .line 8
    new-instance v0, Lcom/momo/xengine/media/types/VideoFrame;

    .line 9
    .line 10
    invoke-direct {v0}, Lcom/momo/xengine/media/types/VideoFrame;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 14
    .line 15
    invoke-direct {p0}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->nativeCreate()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    iput-wide v0, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->pointer:J

    .line 20
    .line 21
    iget-object p0, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 22
    .line 23
    const v0, 0xbdd80

    .line 24
    .line 25
    .line 26
    new-array v0, v0, [B

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Lcom/momo/xengine/media/types/VideoFrame;->setData([B)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method private native nativeCreate()J
.end method

.method private native nativeDecodeOneFrame(J[BILcom/momo/xengine/media/types/VideoFrame;)Z
.end method

.method private native nativeInit(J)Z
.end method

.method private native nativeRelease(J)V
.end method


# virtual methods
.method public decodeOneFrameToYUV([BI)[B
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->pointer:J

    .line 2
    .line 3
    const-wide/16 v3, 0x0

    .line 4
    .line 5
    cmp-long v0, v1, v3

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v5, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 10
    .line 11
    move-object v0, p0

    .line 12
    move-object v3, p1

    .line 13
    move v4, p2

    .line 14
    invoke-direct/range {v0 .. v5}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->nativeDecodeOneFrame(J[BILcom/momo/xengine/media/types/VideoFrame;)Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    iget-object p0, v0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->sourceVideo:Lcom/momo/xengine/media/types/VideoFrame;

    .line 21
    .line 22
    invoke-virtual {p0}, Lcom/momo/xengine/media/types/VideoFrame;->getData()[B

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    return-object p0

    .line 27
    :cond_0
    const/4 p0, 0x0

    .line 28
    return-object p0
.end method

.method public init()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->nativeInit(J)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0

    .line 14
    :cond_0
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public release()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v4, v0, v2

    .line 6
    .line 7
    if-eqz v4, :cond_0

    .line 8
    .line 9
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->nativeRelease(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/momo/xengine/media/DecodeOneFrameFFmpeg;->pointer:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method
