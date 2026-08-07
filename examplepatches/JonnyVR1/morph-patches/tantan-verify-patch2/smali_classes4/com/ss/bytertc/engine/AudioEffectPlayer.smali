.class public Lcom/ss/bytertc/engine/AudioEffectPlayer;
.super Lcom/ss/bytertc/engine/audio/IAudioEffectPlayer;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "AudioEffectPlayer"


# instance fields
.field private mAudioEffectPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;

.field private mCachedHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;

.field private mNativeAudioEffectPlayer:J

.field private mNativeRTCEngine:J


# direct methods
.method public constructor <init>(J)V
    .locals 2

    const-wide/16 v0, 0x0

    .line 21
    invoke-direct {p0, p1, p2, v0, v1}, Lcom/ss/bytertc/engine/AudioEffectPlayer;-><init>(JJ)V

    return-void
.end method

.method public constructor <init>(JJ)V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/audio/IAudioEffectPlayer;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mAudioEffectPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;

    .line 6
    .line 7
    iput-object v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mCachedHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;

    .line 8
    .line 9
    iput-wide p1, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

    .line 10
    .line 11
    iput-wide p3, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeRTCEngine:J

    .line 12
    .line 13
    new-instance p1, Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;

    .line 14
    .line 15
    invoke-direct {p1}, Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mAudioEffectPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;

    .line 19
    .line 20
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    const-wide/16 v0, 0x0

    .line 3
    .line 4
    :try_start_0
    iput-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 10
    throw v0
.end method

.method public declared-synchronized getDuration(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, getDuration failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeGetDuration(JI)I

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

.method public declared-synchronized getPosition(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, getPosition failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeGetPosition(JI)I

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

.method public declared-synchronized getVolume(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, getVolume failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeGetVolume(JI)I

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

.method public declared-synchronized pause(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, pause failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativePause(JI)I

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

.method public declared-synchronized pauseAll()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string v0, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v1, "native AudioEffectPlayer is invalid, pauseAll failed."

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
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativePauseAll(J)I

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

.method public declared-synchronized preload(ILjava/lang/String;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string p2, "native AudioEffectPlayer is invalid, preload failed."

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
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativePreload(JILjava/lang/String;)I

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

.method public declared-synchronized resume(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, resume failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeResume(JI)I

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

.method public declared-synchronized resumeAll()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string v0, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v1, "native AudioEffectPlayer is invalid, resumeAll failed."

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
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeResumeAll(J)I

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

.method public declared-synchronized setEventHandler(Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

    .line 3
    .line 4
    const-wide/16 v2, 0x0

    .line 5
    .line 6
    cmp-long v0, v0, v2

    .line 7
    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeRTCEngine:J

    .line 11
    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mAudioEffectPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;->setAudioEffectPlayerEventHandler(Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mCachedHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    if-ne v0, p1, :cond_1

    .line 27
    .line 28
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_SUCCESS:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    monitor-exit p0

    .line 35
    return p1

    .line 36
    :catchall_0
    move-exception p1

    .line 37
    goto :goto_1

    .line 38
    :cond_1
    :try_start_1
    iput-object p1, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mCachedHandler:Lcom/ss/bytertc/engine/IAudioEffectPlayerEventHandler;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    .line 40
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

    .line 41
    .line 42
    if-nez p1, :cond_2

    .line 43
    .line 44
    :try_start_2
    iget-wide v2, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeRTCEngine:J

    .line 45
    .line 46
    const/4 p1, 0x0

    .line 47
    invoke-static {v0, v1, v2, v3, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeSetEventHandler(JJLcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    monitor-exit p0

    .line 52
    return p1

    .line 53
    :cond_2
    :try_start_3
    iget-wide v2, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeRTCEngine:J

    .line 54
    .line 55
    iget-object p1, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mAudioEffectPlayerEventHandler:Lcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;

    .line 56
    .line 57
    invoke-static {v0, v1, v2, v3, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeSetEventHandler(JJLcom/ss/bytertc/engine/handler/RTCAudioEffectPlayerEventHandler;)I

    .line 58
    .line 59
    .line 60
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 61
    monitor-exit p0

    .line 62
    return p1

    .line 63
    :cond_3
    :goto_0
    :try_start_4
    const-string p1, "AudioEffectPlayer"

    .line 64
    .line 65
    const-string v0, "native AudioEffectPlayer is invalid or nativeEngine is invalid, setEventHandler failed."

    .line 66
    .line 67
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 68
    .line 69
    .line 70
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 71
    .line 72
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 73
    .line 74
    .line 75
    move-result p1
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 76
    monitor-exit p0

    .line 77
    return p1

    .line 78
    :goto_1
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 79
    throw p1
.end method

.method public declared-synchronized setPosition(II)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string p2, "native AudioEffectPlayer is invalid, setPosition failed."

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
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeSetPosition(JII)I

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

.method public declared-synchronized setVolume(II)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string p2, "native AudioEffectPlayer is invalid, setVolume failed."

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
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeSetVolume(JII)I

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

.method public declared-synchronized setVolumeAll(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, setVolumeAll failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeSetVolumeAll(JI)I

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

.method public declared-synchronized start(ILjava/lang/String;Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;)I
    .locals 8

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string p2, "native AudioEffectPlayer is invalid, start failed."

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
    iget-object v2, p3, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->type:Lcom/ss/bytertc/engine/data/AudioMixingType;

    .line 29
    .line 30
    invoke-virtual {v2}, Lcom/ss/bytertc/engine/data/AudioMixingType;->value()I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    iget v5, p3, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->playCount:I

    .line 35
    .line 36
    iget v6, p3, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->startPos:I

    .line 37
    .line 38
    iget v7, p3, Lcom/ss/bytertc/engine/data/AudioEffectPlayerConfig;->pitch:I

    .line 39
    .line 40
    move v2, p1

    .line 41
    move-object v3, p2

    .line 42
    invoke-static/range {v0 .. v7}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeStart(JILjava/lang/String;IIII)I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    monitor-exit p0

    .line 47
    return p1

    .line 48
    :goto_0
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 49
    throw p1
.end method

.method public declared-synchronized stop(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, stop failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeStop(JI)I

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

.method public declared-synchronized stopAll()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string v0, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v1, "native AudioEffectPlayer is invalid, stopAll failed."

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
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeStopAll(J)I

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

.method public declared-synchronized unload(I)I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string p1, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v0, "native AudioEffectPlayer is invalid, unload failed."

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
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeUnload(JI)I

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

.method public declared-synchronized unloadAll()I
    .locals 4

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/AudioEffectPlayer;->mNativeAudioEffectPlayer:J

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
    const-string v0, "AudioEffectPlayer"

    .line 11
    .line 12
    const-string v1, "native AudioEffectPlayer is invalid, unloadAll failed."

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
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeAudioEffectPlayerFunctions;->nativeUnloadAll(J)I

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
