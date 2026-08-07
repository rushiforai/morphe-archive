.class Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/momo/rtcbase/MediaCodecVideoDecoder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "TimeStamps"
.end annotation


# instance fields
.field private final decodeStartTimeMs:J

.field private final ntpTimeStampMs:J

.field private final timeStampMs:J


# direct methods
.method public constructor <init>(JJJ)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-wide p1, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->decodeStartTimeMs:J

    .line 5
    .line 6
    iput-wide p3, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->timeStampMs:J

    .line 7
    .line 8
    iput-wide p5, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->ntpTimeStampMs:J

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic access$700(Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->decodeStartTimeMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$800(Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->timeStampMs:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public static synthetic access$900(Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;)J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/momo/rtcbase/MediaCodecVideoDecoder$TimeStamps;->ntpTimeStampMs:J

    .line 2
    .line 3
    return-wide v0
.end method
