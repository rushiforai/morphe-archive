.class public Lcom/momo/momortc/live/MMRtcLocalAudioStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public aCaptureSize:J

.field public aEncodeSize:J

.field public aSendSize:J

.field public audioBitrate:J

.field public audioMute:Z

.field public rtt_ms:J


# direct methods
.method public constructor <init>()V
    .locals 3
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->audioBitrate:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aCaptureSize:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aEncodeSize:J

    .line 11
    .line 12
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aSendSize:J

    .line 13
    .line 14
    const/4 v2, 0x0

    .line 15
    iput-boolean v2, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->audioMute:Z

    .line 16
    .line 17
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->rtt_ms:J

    .line 18
    .line 19
    return-void
.end method


# virtual methods
.method public setAudioBitrate(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->audioBitrate:J

    .line 2
    .line 3
    return-void
.end method

.method public setAudioMute(Z)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->audioMute:Z

    .line 2
    .line 3
    return-void
.end method

.method public setRtt_ms(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->rtt_ms:J

    .line 2
    .line 3
    return-void
.end method

.method public setaCaptureSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aCaptureSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setaEncodeSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aEncodeSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setaSendSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalAudioStats;->aSendSize:J

    .line 2
    .line 3
    return-void
.end method
