.class public Lio/agora/mediaplayer/data/MediaPlayerSource;
.super Ljava/lang/Object;


# instance fields
.field autoPlay:Z

.field enableCache:Z

.field enableMultiAudioTrack:Z

.field isAgoraSource:Ljava/lang/Boolean;

.field isLiveSource:Ljava/lang/Boolean;

.field provider:Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;

.field startPos:J

.field uri:Ljava/lang/String;

.field url:Ljava/lang/String;


# direct methods
.method public constructor <init>()V
    .locals 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->startPos:J

    const/4 v0, 0x0

    iput-boolean v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableCache:Z

    iput-boolean v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableMultiAudioTrack:Z

    const/4 v0, 0x0

    iput-object v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->url:Ljava/lang/String;

    iput-object v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->uri:Ljava/lang/String;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->autoPlay:Z

    iput-object v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->provider:Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;

    return-void
.end method


# virtual methods
.method public enableAgoraSource(Z)V
    .locals 0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->isAgoraSource:Ljava/lang/Boolean;

    return-void
.end method

.method public enableLiveSource(Z)V
    .locals 0

    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p1

    iput-object p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->isLiveSource:Ljava/lang/Boolean;

    return-void
.end method

.method public getProvider()Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->provider:Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;

    return-object p0
.end method

.method public getStartPos()J
    .locals 2
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-wide v0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->startPos:J

    return-wide v0
.end method

.method public getUri()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->uri:Ljava/lang/String;

    return-object p0
.end method

.method public getUrl()Ljava/lang/String;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->url:Ljava/lang/String;

    return-object p0
.end method

.method public isAgoraSource()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->isAgoraSource:Ljava/lang/Boolean;

    return-object p0
.end method

.method public isAutoPlay()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->autoPlay:Z

    return p0
.end method

.method public isEnableCache()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableCache:Z

    return p0
.end method

.method public isEnableMultiAudioTrack()Z
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-boolean p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableMultiAudioTrack:Z

    return p0
.end method

.method public isLiveSource()Ljava/lang/Boolean;
    .locals 0
    .annotation build Lio/agora/base/internal/CalledByNative;
    .end annotation

    iget-object p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->isLiveSource:Ljava/lang/Boolean;

    return-object p0
.end method

.method public setAutoPlay(Z)V
    .locals 0

    iput-boolean p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->autoPlay:Z

    return-void
.end method

.method public setEnableCache(Z)V
    .locals 0

    iput-boolean p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableCache:Z

    return-void
.end method

.method public setEnableMultiAudioTrack(Z)V
    .locals 0

    iput-boolean p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableMultiAudioTrack:Z

    return-void
.end method

.method public setProvider(Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;)V
    .locals 0

    iput-object p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->provider:Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;

    return-void
.end method

.method public setStartPos(J)V
    .locals 0

    iput-wide p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->startPos:J

    return-void
.end method

.method public setUri(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->uri:Ljava/lang/String;

    return-void
.end method

.method public setUrl(Ljava/lang/String;)V
    .locals 0

    iput-object p1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->url:Ljava/lang/String;

    return-void
.end method

.method public toString()Ljava/lang/String;
    .locals 3

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "MediaPlayerSource{url=\'"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->url:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', uri=\'"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->uri:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v1, "\', startPos="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-wide v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->startPos:J

    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    const-string v1, ", enableCache="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableCache:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", autoPlay="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->autoPlay:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", enableMultiAudioTrack="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-boolean v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->enableMultiAudioTrack:Z

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", isLiveSource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->isLiveSource:Ljava/lang/Boolean;

    const/4 v2, 0x0

    if-eqz v1, :cond_0

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    goto :goto_0

    :cond_0
    move-object v1, v2

    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", isAgoraSource="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object v1, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->isAgoraSource:Ljava/lang/Boolean;

    if-eqz v1, :cond_1

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-object v2, v1

    :cond_1
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", provider="

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget-object p0, p0, Lio/agora/mediaplayer/data/MediaPlayerSource;->provider:Lio/agora/mediaplayer/IMediaPlayerCustomDataProvider;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const/16 p0, 0x7d

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
