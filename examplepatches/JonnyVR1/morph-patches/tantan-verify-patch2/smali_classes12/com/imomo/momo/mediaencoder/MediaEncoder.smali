.class public Lcom/imomo/momo/mediaencoder/MediaEncoder;
.super Lcom/imomo/momo/mediaencoder/FFMediaUtils;
.source "SourceFile"


# static fields
.field public static final MEDIA_ENCODER_NONE:I = 0x0

.field public static final MEDIA_ENCODER_X264:I = 0x1

.field public static final MEDIA_ENCODER_X265:I = 0x2

.field private static final TAG:Ljava/lang/String; = "MediaEncoder"


# instance fields
.field private mHandler:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/imomo/momo/mediaencoder/FFMediaUtils;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 7
    .line 8
    return-void
.end method

.method private native nativeDequeueOutputBuffer(J[BJLcom/imomo/momo/mediaencoder/EncodedDataInfo;)I
.end method

.method private native nativeFlush(J)V
.end method

.method private native nativeInitEncoder(I)J
.end method

.method private native nativeQueueInBuffer(J[BJJ)I
.end method

.method private native nativeRelease(J)V
.end method

.method private native nativeSetParam(JLcom/imomo/momo/mediaencoder/EncodeParam;)I
.end method

.method private native nativeStartEncoding(J)V
.end method

.method private native nativeStopEncoding(J)V
.end method


# virtual methods
.method public dequeueOutputBuffer([BJLcom/imomo/momo/mediaencoder/EncodedDataInfo;)Z
    .locals 7

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move-wide v4, p2

    .line 6
    move-object v6, p4

    .line 7
    invoke-direct/range {v0 .. v6}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeDequeueOutputBuffer(J[BJLcom/imomo/momo/mediaencoder/EncodedDataInfo;)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public flush()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeFlush(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public initEncoder(I)I
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeInitEncoder(I)J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 6
    .line 7
    const-wide/16 p0, 0x0

    .line 8
    .line 9
    cmp-long p0, v0, p0

    .line 10
    .line 11
    if-lez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x0

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, -0x1

    .line 16
    return p0
.end method

.method public queueInBuffer([BJJ)Z
    .locals 8

    .line 1
    iget-wide v1, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-object v3, p1

    .line 5
    move-wide v4, p2

    .line 6
    move-wide v6, p4

    .line 7
    invoke-direct/range {v0 .. v7}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeQueueInBuffer(J[BJJ)I

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_0

    .line 12
    .line 13
    const/4 p0, 0x1

    .line 14
    return p0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    return p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeRelease(J)V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 9
    .line 10
    return-void
.end method

.method public setParam(Lcom/imomo/momo/mediaencoder/EncodeParam;)Z
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1, p1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeSetParam(JLcom/imomo/momo/mediaencoder/EncodeParam;)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method

.method public startEncoding()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeStartEncoding(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public stopEncoding()V
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/imomo/momo/mediaencoder/MediaEncoder;->mHandler:J

    .line 2
    .line 3
    invoke-direct {p0, v0, v1}, Lcom/imomo/momo/mediaencoder/MediaEncoder;->nativeStopEncoding(J)V

    .line 4
    .line 5
    .line 6
    return-void
.end method
