.class public Lcom/momo/xengine/media/EncodeTimestampCalculator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/momo/xengine/media/IEncodeTimestampCalculator;


# instance fields
.field pointer:J


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
    iput-wide v0, p0, Lcom/momo/xengine/media/EncodeTimestampCalculator;->pointer:J

    .line 7
    .line 8
    return-void
.end method

.method private native nativeCalculateTimestamp(JJF)J
.end method

.method private native nativeInit(J)J
.end method

.method private native nativeRelease(J)V
.end method


# virtual methods
.method public calculateTimestamp(JF)J
    .locals 6

    .line 1
    iget-wide v1, p0, Lcom/momo/xengine/media/EncodeTimestampCalculator;->pointer:J

    .line 2
    .line 3
    move-object v0, p0

    .line 4
    move-wide v3, p1

    .line 5
    move v5, p3

    .line 6
    invoke-direct/range {v0 .. v5}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->nativeCalculateTimestamp(JJF)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method

.method public init(J)Z
    .locals 2

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->nativeInit(J)J

    .line 2
    .line 3
    .line 4
    move-result-wide p1

    .line 5
    iput-wide p1, p0, Lcom/momo/xengine/media/EncodeTimestampCalculator;->pointer:J

    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    cmp-long p0, p1, v0

    .line 10
    .line 11
    if-eqz p0, :cond_0

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

.method public isInit()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/EncodeTimestampCalculator;->pointer:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-eqz p0, :cond_0

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

.method public release()V
    .locals 5

    .line 1
    iget-wide v0, p0, Lcom/momo/xengine/media/EncodeTimestampCalculator;->pointer:J

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
    invoke-direct {p0, v0, v1}, Lcom/momo/xengine/media/EncodeTimestampCalculator;->nativeRelease(J)V

    .line 10
    .line 11
    .line 12
    iput-wide v2, p0, Lcom/momo/xengine/media/EncodeTimestampCalculator;->pointer:J

    .line 13
    .line 14
    :cond_0
    return-void
.end method
