.class public Lcom/momo/momortc/live/MMRtcRemoteAudioStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public aReceiveSize:J

.field public audiLossTimestamp:I

.field public audioBitrate:I

.field public audioCache:I

.field public audioDelay:I

.field public audioLost:I

.field public audioMute:Z

.field public audioPlayLag:I

.field public expandCartonCount:I

.field public expandCount:I

.field public expandRealCount:I

.field public networkRtt:I


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
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioBitrate:I

    .line 6
    .line 7
    const-wide/16 v1, 0x0

    .line 8
    .line 9
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->aReceiveSize:J

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioDelay:I

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioLost:I

    .line 14
    .line 15
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioPlayLag:I

    .line 16
    .line 17
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCount:I

    .line 18
    .line 19
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCartonCount:I

    .line 20
    .line 21
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandRealCount:I

    .line 22
    .line 23
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioCache:I

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioMute:Z

    .line 26
    .line 27
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audiLossTimestamp:I

    .line 28
    .line 29
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->networkRtt:I

    .line 30
    .line 31
    return-void
.end method


# virtual methods
.method public setAudiLossTimestamp(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audiLossTimestamp:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioBitrate(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioCache(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioCache:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioDelay(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioDelay:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioLost(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioLost:I

    .line 2
    .line 3
    return-void
.end method

.method public setAudioMute(Z)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioMute:Z

    .line 2
    .line 3
    return-void
.end method

.method public setAudioPlayLag(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->audioPlayLag:I

    .line 2
    .line 3
    return-void
.end method

.method public setExpandCartonCount(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCartonCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setExpandCount(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setExpandRealCount(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->expandRealCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setNetworkRtt(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->networkRtt:I

    .line 2
    .line 3
    return-void
.end method

.method public setaReceiveSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcRemoteAudioStats;->aReceiveSize:J

    .line 2
    .line 3
    return-void
.end method
