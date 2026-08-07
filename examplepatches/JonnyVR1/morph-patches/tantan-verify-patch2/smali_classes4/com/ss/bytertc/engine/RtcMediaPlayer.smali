.class public Lcom/ss/bytertc/engine/RtcMediaPlayer;
.super Lcom/ss/bytertc/engine/audio/IMediaPlayer;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "MediaPlayer"


# instance fields
.field private mAudioFrameObserver:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

.field private mMediaPlayerCustomSourceProvider:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;

.field private mMediaPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

.field private mNativeMediaPlayer:J

.field private mNativeRTCEngine:J


# direct methods
.method public constructor <init>(J)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 37
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ss/bytertc/engine/RtcMediaPlayer;-><init>(JJ)V

    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/audio/IMediaPlayer;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mAudioFrameObserver:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerCustomSourceProvider:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;

    .line 10
    .line 11
    iput-wide p1, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 12
    .line 13
    iput-wide p3, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeRTCEngine:J

    .line 14
    .line 15
    new-instance p1, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

    .line 16
    .line 17
    invoke-direct {p1}, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mAudioFrameObserver:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

    .line 21
    .line 22
    new-instance p1, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

    .line 23
    .line 24
    invoke-direct {p1}, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

    .line 28
    .line 29
    new-instance p1, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;

    .line 30
    .line 31
    invoke-direct {p1}, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerCustomSourceProvider:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeDestory(J)V

    .line 5
    .line 6
    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    iput-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 10
    .line 11
    iput-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeRTCEngine:J

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mAudioFrameObserver:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

    .line 17
    .line 18
    iput-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerCustomSourceProvider:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    monitor-exit p0

    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw v0
.end method

.method public declared-synchronized getAudioTrackCount()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, getAudioTrackCount failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeGetAudioTrackCount(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized getPlaybackDuration()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, getPlaybackDuration failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeGetPlaybackDuration(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized getPosition()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, getPosition failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeGetPosition(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized getState()Lcom/ss/bytertc/engine/data/PlayerState;
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, getState failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/PlayerState;->IDLE:Lcom/ss/bytertc/engine/data/PlayerState;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    .line 19
    monitor-exit p0

    .line 20
    return-object v0

    .line 21
    :catchall_0
    move-exception v0

    .line 22
    goto :goto_0

    .line 23
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeGetState(J)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    invoke-static {v0}, Lcom/ss/bytertc/engine/data/PlayerState;->fromId(I)Lcom/ss/bytertc/engine/data/PlayerState;

    .line 28
    .line 29
    .line 30
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return-object v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized getTotalDuration()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, getTotalDuration failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeGetTotalDuration(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized getVolume(Lcom/ss/bytertc/engine/data/AudioMixingType;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, getVolume failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioMixingType;->value()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeGetVolume(JI)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    monitor-exit p0

    .line 36
    return p1

    .line 37
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    throw p1
.end method

.method public declared-synchronized open(Ljava/lang/String;Lcom/ss/bytertc/engine/data/MediaPlayerConfig;)I
    .locals 10

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string p2, "native MediaPlayer is invalid, open failed."

    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    move-object p1, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    :try_start_1
    iget-object v2, p2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/data/AudioMixingType;->value()I

    .line 31
    .line 32
    .line 33
    move-result v3

    .line 34
    iget v4, p2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->playCount:I

    .line 35
    .line 36
    iget v5, p2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->startPos:I

    .line 37
    .line 38
    iget-boolean v6, p2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->autoPlay:Z

    .line 39
    .line 40
    iget-wide v7, p2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->callbackOnProgressInterval:J

    .line 41
    .line 42
    iget-boolean v9, p2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->syncProgressToRecordFrame:Z

    .line 43
    .line 44
    move-object v2, p1

    .line 45
    invoke-static/range {v0 .. v9}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeOpen(JLjava/lang/String;IIIZJZ)I

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    monitor-exit p0

    .line 50
    return p1

    .line 51
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 52
    throw p1
.end method

.method public declared-synchronized openWithCustomSource(Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;Lcom/ss/bytertc/engine/data/MediaPlayerConfig;)I
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p1

    .line 4
    .line 5
    move-object/from16 v2, p2

    .line 6
    .line 7
    monitor-enter p0

    .line 8
    :try_start_0
    iget-wide v3, v1, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 9
    .line 10
    const-wide/16 v5, 0x0

    .line 11
    .line 12
    cmp-long v3, v3, v5

    .line 13
    .line 14
    if-nez v3, :cond_0

    .line 15
    .line 16
    const-string v0, "MediaPlayer"

    .line 17
    .line 18
    const-string v2, "native MediaPlayer is invalid, openWithCustomSource failed."

    .line 19
    .line 20
    invoke-static {v0, v2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 26
    .line 27
    .line 28
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 29
    monitor-exit p0

    .line 30
    return v0

    .line 31
    :catchall_0
    move-exception v0

    .line 32
    goto :goto_0

    .line 33
    :cond_0
    :try_start_1
    iget-object v3, v1, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerCustomSourceProvider:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;

    .line 34
    .line 35
    iget-object v4, v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->provider:Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;

    .line 36
    .line 37
    invoke-virtual {v3, v4}, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;->setCustomSourceProvider(Lcom/ss/bytertc/engine/IMediaPlayerCustomSourceProvider;)V

    .line 38
    .line 39
    .line 40
    iget-wide v5, v1, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 41
    .line 42
    iget-object v3, v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->mode:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;

    .line 43
    .line 44
    invoke-virtual {v3}, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceMode;->value()I

    .line 45
    .line 46
    .line 47
    move-result v7

    .line 48
    iget-object v0, v0, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSource;->type:Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;

    .line 49
    .line 50
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/MediaPlayerCustomSourceStreamType;->value()I

    .line 51
    .line 52
    .line 53
    move-result v8

    .line 54
    iget-object v9, v1, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerCustomSourceProvider:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;

    .line 55
    .line 56
    iget-object v0, v2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 57
    .line 58
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioMixingType;->value()I

    .line 59
    .line 60
    .line 61
    move-result v10

    .line 62
    iget v11, v2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->playCount:I

    .line 63
    .line 64
    iget v12, v2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->startPos:I

    .line 65
    .line 66
    iget-boolean v13, v2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->autoPlay:Z

    .line 67
    .line 68
    iget-wide v14, v2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->callbackOnProgressInterval:J

    .line 69
    .line 70
    iget-boolean v0, v2, Lcom/ss/bytertc/engine/data/MediaPlayerConfig;->syncProgressToRecordFrame:Z

    .line 71
    .line 72
    move/from16 v16, v0

    .line 73
    .line 74
    invoke-static/range {v5 .. v16}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeOpenWithCustomSource(JIILcom/ss/bytertc/engine/handler/RTCMediaPlayerCustomSourceProvider;IIIZJZ)I

    .line 75
    .line 76
    .line 77
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 78
    monitor-exit p0

    .line 79
    return v0

    .line 80
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 81
    throw v0
.end method

.method public declared-synchronized pause()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, pause failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativePause(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized pushExternalAudioFrame(Lcom/ss/bytertc/engine/utils/AudioFrame;)I
    .locals 6

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, pushExternalAudioFrame failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    move-object p1, v0

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    :try_start_1
    iget-object v2, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->buffer:[B

    .line 29
    .line 30
    iget v3, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->samples:I

    .line 31
    .line 32
    iget-object v4, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 33
    .line 34
    invoke-virtual {v4}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    iget-object p1, p1, Lcom/ss/bytertc/engine/utils/AudioFrame;->channel:Lcom/ss/bytertc/engine/data/AudioChannel;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioChannel;->value()I

    .line 41
    .line 42
    .line 43
    move-result v5

    .line 44
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativePushExternalAudioFrame(J[BIII)I

    .line 45
    .line 46
    .line 47
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 48
    monitor-exit p0

    .line 49
    return p1

    .line 50
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw p1
.end method

.method public declared-synchronized registerAudioFrameObserver(Lcom/ss/bytertc/engine/IMediaPlayerAudioFrameObserver;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, registerAudioFrameObserver failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mAudioFrameObserver:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;->setAudioFrameObserver(Lcom/ss/bytertc/engine/IMediaPlayerAudioFrameObserver;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    :try_start_2
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeRegisterAudioFrameObserver(JLcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;)I

    .line 38
    .line 39
    .line 40
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    monitor-exit p0

    .line 42
    return p1

    .line 43
    :cond_1
    :try_start_3
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mAudioFrameObserver:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;

    .line 44
    .line 45
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeRegisterAudioFrameObserver(JLcom/ss/bytertc/engine/handler/RTCMediaPlayerAudioFrameObserver;)I

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    monitor-exit p0

    .line 50
    return p1

    .line 51
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 52
    throw p1
.end method

.method public declared-synchronized resume()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, resume failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeResume(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized selectAudioTrack(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, selectAudioTrack failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSelectAudioTrack(JI)I

    .line 28
    .line 29
    .line 30
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized setAudioDualMonoMode(Lcom/ss/bytertc/engine/data/AudioMixingDualMonoMode;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, setAudioDualMonoMode failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/AudioMixingDualMonoMode;->value()I

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetAudioDualMonoMode(JI)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    monitor-exit p0

    .line 36
    return p1

    .line 37
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    throw p1
.end method

.method public declared-synchronized setAudioPitch(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, setAudioPitch failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetAudioPitch(JI)I

    .line 28
    .line 29
    .line 30
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized setEventHandler(Lcom/ss/bytertc/engine/IMediaPlayerEventHandler;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, setEventHandler failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

    .line 28
    .line 29
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;->setMediaPlayerEventHandler(Lcom/ss/bytertc/engine/IMediaPlayerEventHandler;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 33
    .line 34
    if-nez p1, :cond_1

    .line 35
    .line 36
    const/4 p1, 0x0

    .line 37
    :try_start_2
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetEventHandler(JLcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;)I

    .line 38
    .line 39
    .line 40
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 41
    monitor-exit p0

    .line 42
    return p1

    .line 43
    :cond_1
    :try_start_3
    iget-object p1, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mMediaPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;

    .line 44
    .line 45
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetEventHandler(JLcom/ss/bytertc/engine/handler/RTCMediaPlayerEventHandler;)I

    .line 46
    .line 47
    .line 48
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 49
    monitor-exit p0

    .line 50
    return p1

    .line 51
    :goto_0
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 52
    throw p1
.end method

.method public declared-synchronized setLoudness(F)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, setLoudness failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetLoudness(JF)I

    .line 28
    .line 29
    .line 30
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized setPlaybackSpeed(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, setPlaybackSpeed failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetPlaybackSpeed(JI)I

    .line 28
    .line 29
    .line 30
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized setPosition(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string v0, "native MediaPlayer is invalid, setPosition failed."

    .line 13
    .line 14
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetPosition(JI)I

    .line 28
    .line 29
    .line 30
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized setProgressInterval(J)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string p2, "native MediaPlayer is invalid, setProgressInterval failed."

    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetProgressInterval(JJ)I

    .line 28
    .line 29
    .line 30
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return p1

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw p1
.end method

.method public declared-synchronized setVolume(ILcom/ss/bytertc/engine/data/AudioMixingType;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string p1, "MediaPlayer"

    .line 11
    .line 12
    const-string p2, "native MediaPlayer is invalid, setVolume failed."

    .line 13
    .line 14
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return p1

    .line 25
    :catchall_0
    move-exception p1

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/AudioMixingType;->value()I

    .line 28
    .line 29
    .line 30
    move-result p2

    .line 31
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeSetVolume(JII)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    monitor-exit p0

    .line 36
    return p1

    .line 37
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 38
    throw p1
.end method

.method public declared-synchronized start()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, start failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeStart(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method

.method public declared-synchronized stop()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RtcMediaPlayer;->mNativeMediaPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v2, v0, v2

    .line 7
    .line 8
    if-nez v2, :cond_0

    .line 9
    .line 10
    const-string v0, "MediaPlayer"

    .line 11
    .line 12
    const-string v1, "native MediaPlayer is invalid, stop failed."

    .line 13
    .line 14
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 20
    .line 21
    .line 22
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    monitor-exit p0

    .line 24
    return v0

    .line 25
    :catchall_0
    move-exception v0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeMediaPlayerFunctions;->nativeStop(J)I

    .line 28
    .line 29
    .line 30
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    monitor-exit p0

    .line 32
    return v0

    .line 33
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 34
    throw v0
.end method
