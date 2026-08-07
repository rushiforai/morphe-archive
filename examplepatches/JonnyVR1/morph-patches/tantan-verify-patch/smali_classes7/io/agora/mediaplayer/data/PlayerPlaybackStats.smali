.class public Lio/agora/mediaplayer/data/PlayerPlaybackStats;
.super Ljava/lang/Object;


# instance fields
.field private audioBitrateInKbps:J

.field private totalBitrateInKbps:J

.field private videoBitrateInKbps:J

.field private videoFps:J


# direct methods
.method public constructor <init>()V
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoFps:J

    iput-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoBitrateInKbps:J

    iput-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->audioBitrateInKbps:J

    iput-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->totalBitrateInKbps:J

    return-void
.end method


# virtual methods
.method public getAudioBitrate()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->audioBitrateInKbps:J

    return-wide v0
.end method

.method public getTotalBitrate()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->totalBitrateInKbps:J

    return-wide v0
.end method

.method public getVideoBitrate()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoBitrateInKbps:J

    return-wide v0
.end method

.method public getVideoFps()J
    .locals 2

    iget-wide v0, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoFps:J

    return-wide v0
.end method

.method public setAudioBitrate(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->audioBitrateInKbps:J

    return-void
.end method

.method public setTotalBitrate(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->totalBitrateInKbps:J

    return-void
.end method

.method public setVideoBitrate(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoBitrateInKbps:J

    return-void
.end method

.method public setVideoFps(J)V
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iput-wide p1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoFps:J

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "PlayerPlaybackStats{videoFps="

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-wide v1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoFps:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", videoBitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->videoBitrateInKbps:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", audioBitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->audioBitrateInKbps:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", totalBitrate="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/mediaplayer/data/PlayerPlaybackStats;->totalBitrateInKbps:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
