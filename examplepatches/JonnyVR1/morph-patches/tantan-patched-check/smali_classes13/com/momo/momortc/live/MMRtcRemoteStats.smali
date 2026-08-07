.class public Lcom/momo/momortc/live/MMRtcRemoteStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

.field public uid:J

.field public videoStats:Lcom/momo/momortc/live/MMRtcRemoteVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public setAudioStats(Lcom/momo/momortc/live/MMRtcRemoteAudioStats;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMRtcRemoteStats;->AudioStats:Lcom/momo/momortc/live/MMRtcRemoteAudioStats;

    .line 2
    .line 3
    return-void
.end method

.method public setUid(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcRemoteStats;->uid:J

    .line 2
    .line 3
    return-void
.end method

.method public setVideoStats(Lcom/momo/momortc/live/MMRtcRemoteVideoStats;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMRtcRemoteStats;->videoStats:Lcom/momo/momortc/live/MMRtcRemoteVideoStats;

    .line 2
    .line 3
    return-void
.end method
