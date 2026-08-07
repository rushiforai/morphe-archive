.class public Lcom/momo/momortc/live/MMRtcStats;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public audioStats:Lcom/momo/momortc/live/MMRtcLocalAudioStats;

.field public channelID:Ljava/lang/String;

.field public remoteStats:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/momo/momortc/live/MMRtcRemoteStats;",
            ">;"
        }
    .end annotation
.end field

.field public rxBytes:J

.field public txBytes:J

.field public userCount:J

.field public videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;


# direct methods
.method public constructor <init>()V
    .locals 2
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
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcStats;->rxBytes:J

    .line 9
    .line 10
    iput-wide v0, p0, Lcom/momo/momortc/live/MMRtcStats;->userCount:J

    .line 11
    .line 12
    const-string v0, ""

    .line 13
    .line 14
    iput-object v0, p0, Lcom/momo/momortc/live/MMRtcStats;->channelID:Ljava/lang/String;

    .line 15
    .line 16
    new-instance v0, Ljava/util/ArrayList;

    .line 17
    .line 18
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object v0, p0, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 22
    .line 23
    return-void
.end method


# virtual methods
.method public setAudioStats(Lcom/momo/momortc/live/MMRtcLocalAudioStats;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMRtcStats;->audioStats:Lcom/momo/momortc/live/MMRtcLocalAudioStats;

    .line 2
    .line 3
    return-void
.end method

.method public setChannelID(Ljava/lang/String;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMRtcStats;->channelID:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setRemoteStats(Lcom/momo/momortc/live/MMRtcRemoteStats;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/momo/momortc/live/MMRtcStats;->remoteStats:Ljava/util/List;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setRxBytes(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcStats;->rxBytes:J

    .line 2
    .line 3
    return-void
.end method

.method public setTxBytes(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcStats;->txBytes:J

    .line 2
    .line 3
    return-void
.end method

.method public setUserCount(J)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-wide p1, p0, Lcom/momo/momortc/live/MMRtcStats;->userCount:J

    .line 2
    .line 3
    return-void
.end method

.method public setVideoStats(Lcom/momo/momortc/live/MMRtcLocalVideoStats;)V
    .locals 0
    .annotation build Lcom/momo/rtcbase/CalledByNative;
    .end annotation

    .line 1
    iput-object p1, p0, Lcom/momo/momortc/live/MMRtcStats;->videoStats:Lcom/momo/momortc/live/MMRtcLocalVideoStats;

    .line 2
    .line 3
    return-void
.end method
