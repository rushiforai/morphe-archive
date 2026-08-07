.class public Lcom/momo/momortc/live/MMRtcRemoteVideoStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public vReceiveSize:J

.field public videoBitrate:I

.field public videoDelay:I

.field public videoDelayEx:Ljava/lang/String;

.field public videoFramerate:I

.field public videoLost:F

.field public videoMute:Z

.field public videoPlayLag:I

.field public videoRenderCount:J

.field public videoheight:I

.field public videowidth:I


# direct methods
.method public constructor <init>()V
    .locals 4
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoBitrate:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoFramerate:I

    .line 8
    .line 9
    const-wide/16 v1, 0x0

    .line 10
    .line 11
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->vReceiveSize:J

    .line 12
    .line 13
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videowidth:I

    .line 14
    .line 15
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoheight:I

    .line 16
    .line 17
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoDelay:I

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    iput v3, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoLost:F

    .line 21
    .line 22
    iput v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoPlayLag:I

    .line 23
    .line 24
    const-string v3, ""

    .line 25
    .line 26
    iput-object v3, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoDelayEx:Ljava/lang/String;

    .line 27
    .line 28
    iput-boolean v0, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoMute:Z

    .line 29
    .line 30
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoRenderCount:J

    .line 31
    .line 32
    return-void
.end method


# virtual methods
.method public setVideoBitrate(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoDelay(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoDelay:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoDelayEx(Ljava/lang/String;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoDelayEx:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFramerate(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoFramerate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoLost(F)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoLost:F

    .line 2
    .line 3
    return-void
.end method

.method public setVideoMute(Z)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoMute:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideoPlayLag(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoPlayLag:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoRenderCount(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoRenderCount:J

    .line 2
    .line 3
    return-void
.end method

.method public setVideoheight(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videoheight:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideowidth(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->videowidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setvReceiveSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcRemoteVideoStats;->vReceiveSize:J

    .line 2
    .line 3
    return-void
.end method
