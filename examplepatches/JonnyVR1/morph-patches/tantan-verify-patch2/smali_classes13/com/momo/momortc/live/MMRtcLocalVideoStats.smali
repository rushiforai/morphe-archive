.class public Lcom/momo/momortc/live/MMRtcLocalVideoStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public gopDuration:J

.field public vCaptureCount:J

.field public vEncodeCount:I

.field public vEncodeSize:J

.field public vSendSize:J

.field public videoBitrate:I

.field public videoFramerate:I

.field public videoMute:Z

.field public videoheight:I

.field public videowidth:I


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
    iput v0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoBitrate:I

    .line 6
    .line 7
    iput v0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoFramerate:I

    .line 8
    .line 9
    iput v0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videowidth:I

    .line 10
    .line 11
    iput v0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoheight:I

    .line 12
    .line 13
    const-wide/16 v1, 0x0

    .line 14
    .line 15
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vCaptureCount:J

    .line 16
    .line 17
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeSize:J

    .line 18
    .line 19
    iput v0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeCount:I

    .line 20
    .line 21
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vSendSize:J

    .line 22
    .line 23
    iput-wide v1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->gopDuration:J

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoMute:Z

    .line 26
    .line 27
    return-void
.end method


# virtual methods
.method public setGopDuration(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->gopDuration:J

    .line 2
    .line 3
    return-void
.end method

.method public setVideoBitrate(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoBitrate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoFramerate(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoFramerate:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideoMute(Z)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-boolean p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoMute:Z

    .line 2
    .line 3
    return-void
.end method

.method public setVideoheight(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videoheight:I

    .line 2
    .line 3
    return-void
.end method

.method public setVideowidth(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->videowidth:I

    .line 2
    .line 3
    return-void
.end method

.method public setvCaptureCount(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vCaptureCount:J

    .line 2
    .line 3
    return-void
.end method

.method public setvEncodeCount(I)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeCount:I

    .line 2
    .line 3
    return-void
.end method

.method public setvEncodeSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vEncodeSize:J

    .line 2
    .line 3
    return-void
.end method

.method public setvSendSize(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcLocalVideoStats;->vSendSize:J

    .line 2
    .line 3
    return-void
.end method
