.class public Lcom/momo/rtcbase/TimestampAligner;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private volatile nativeTimestampAligner:J


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/momo/rtcbase/TimestampAligner;->nativeCreateTimestampAligner()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    iput-wide v0, p0, Lcom/momo/rtcbase/TimestampAligner;->nativeTimestampAligner:J

    .line 9
    .line 10
    return-void
.end method

.method private checkNativeAlignerExists()V
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/TimestampAligner;->nativeTimestampAligner:J

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
    return-void

    .line 10
    :cond_0
    const-string p0, "TimestampAligner has been disposed."

    .line 11
    .line 12
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public static getRtcTimeNanos()J
    .locals 2

    .line 1
    invoke-static {}, Lcom/momo/rtcbase/TimestampAligner;->nativeRtcTimeNanos()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    return-wide v0
.end method

.method private static native nativeCreateTimestampAligner()J
.end method

.method private static native nativeReleaseTimestampAligner(J)V
.end method

.method private static native nativeRtcTimeNanos()J
.end method

.method private static native nativeTranslateTimestamp(JJ)J
.end method


# virtual methods
.method public dispose()V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/TimestampAligner;->checkNativeAlignerExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/TimestampAligner;->nativeTimestampAligner:J

    .line 5
    .line 6
    invoke-static {v0, v1}, Lcom/momo/rtcbase/TimestampAligner;->nativeReleaseTimestampAligner(J)V

    .line 7
    .line 8
    .line 9
    const-wide/16 v0, 0x0

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/momo/rtcbase/TimestampAligner;->nativeTimestampAligner:J

    .line 12
    .line 13
    return-void
.end method

.method public translateTimestamp(J)J
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/momo/rtcbase/TimestampAligner;->checkNativeAlignerExists()V

    .line 2
    .line 3
    .line 4
    iget-wide v0, p0, Lcom/momo/rtcbase/TimestampAligner;->nativeTimestampAligner:J

    .line 5
    .line 6
    invoke-static {v0, v1, p1, p2}, Lcom/momo/rtcbase/TimestampAligner;->nativeTranslateTimestamp(JJ)J

    .line 7
    .line 8
    .line 9
    move-result-wide p0

    .line 10
    return-wide p0
.end method
