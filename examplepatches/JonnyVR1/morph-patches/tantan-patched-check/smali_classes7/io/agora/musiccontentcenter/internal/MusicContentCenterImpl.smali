.class public Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;
.super Lio/agora/musiccontentcenter/IAgoraMusicContentCenter;


# static fields
.field private static final TAG:Ljava/lang/String; = "MusicContentCenterImpl"


# instance fields
.field private final mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

.field private mNativeHandle:J

.field private final mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/RtcEngine;)V
    .locals 3

    invoke-direct {p0}, Lio/agora/musiccontentcenter/IAgoraMusicContentCenter;-><init>()V

    const-wide/16 v0, 0x0

    iput-wide v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>(Z)V

    iput-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    instance-of v0, p1, Lio/agora/rtc2/internal/RtcEngineImpl;

    if-eqz v0, :cond_0

    move-object v0, p1

    check-cast v0, Lio/agora/rtc2/internal/RtcEngineImpl;

    iput-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    monitor-enter v0

    :try_start_0
    invoke-virtual {p1}, Lio/agora/rtc2/RtcEngine;->getNativeHandle()J

    move-result-wide v1

    invoke-direct {p0, v1, v2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeObjectInit(J)J

    move-result-wide v1

    iput-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_0
    const/4 p1, 0x0

    iput-object p1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    return-void
.end method

.method private native nativeCreateMusicPlayer(J)Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;
.end method

.method private static native nativeDestroy(JJ)I
.end method

.method private native nativeDestroyMusicPlayer(JI)I
.end method

.method private native nativeGetCaches(J)[Lio/agora/musiccontentcenter/MusicCacheInfo;
.end method

.method private native nativeGetInternalSongCode(JJLjava/lang/String;)J
.end method

.method private native nativeGetLyric(JJI)Ljava/lang/String;
.end method

.method private native nativeGetMusicCharts(J)Ljava/lang/String;
.end method

.method private native nativeGetMusicCollectionByMusicChartId(JIIILjava/lang/String;)Ljava/lang/String;
.end method

.method private native nativeGetSongSimpleInfo(JJ)Ljava/lang/String;
.end method

.method private native nativeInitialize(JLjava/lang/Object;)I
.end method

.method private native nativeIsPreloaded(JJ)I
.end method

.method private native nativeObjectInit(J)J
.end method

.method private native nativePreload(JJLjava/lang/String;)I
.end method

.method private native nativePreloadWithSongCode(JJ)Ljava/lang/String;
.end method

.method private native nativeRegisterEventHandler(JLjava/lang/Object;)I
.end method

.method private native nativeRemoveCache(JJ)I
.end method

.method private native nativeRenewToken(JLjava/lang/String;)I
.end method

.method private native nativeSearchMusic(JLjava/lang/String;IILjava/lang/String;)Ljava/lang/String;
.end method

.method private native nativeUnregisterEventHandler(J)I
.end method


# virtual methods
.method public createMusicPlayer()Lio/agora/musiccontentcenter/IAgoraMusicPlayer;
    .locals 8

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_4

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v2}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v2, v3}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeCreateMusicPlayer(J)Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;

    move-result-object v2

    iget-wide v6, v2, Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;->handler:J

    cmp-long v3, v6, v4

    if-eqz v3, :cond_3

    new-instance v1, Lio/agora/musiccontentcenter/internal/AgoraMusicPlayerImpl;

    iget-object p0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    iget v2, v2, Lio/agora/musiccontentcenter/internal/MusicPlayerProperty;->id:I

    invoke-direct {v1, p0, v6, v7, v2}, Lio/agora/musiccontentcenter/internal/AgoraMusicPlayerImpl;-><init>(Lio/agora/rtc2/internal/RtcEngineImpl;JI)V

    goto :goto_1

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string v2, "MusicContentCenter does not initialize or it may be destroyed (createMusicPlayer)"

    invoke-static {p0, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    :cond_3
    :goto_1
    monitor-exit v0

    return-object v1

    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_4
    :goto_3
    return-object v1
.end method

.method public destroyMusicPlayer(Lio/agora/musiccontentcenter/IAgoraMusicPlayer;)I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-eqz v0, :cond_3

    if-nez p1, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-interface {p1}, Lio/agora/mediaplayer/IMediaPlayer;->getMediaPlayerId()I

    move-result p1

    invoke-direct {p0, v1, v2, p1}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeDestroyMusicPlayer(JI)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (destroyMusicPlayer)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public doDestroy()V
    .locals 7

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    return-void

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_1

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v2, 0x1

    invoke-virtual {v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    iget-object v5, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v5}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v5

    invoke-static {v1, v2, v5, v6}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeDestroy(JJ)I

    iput-wide v3, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    iget-object p0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_1
    :goto_0
    monitor-exit v0

    return-void

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0
.end method

.method public getCaches()[Lio/agora/musiccontentcenter/MusicCacheInfo;
    .locals 6

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_3

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v2}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    goto :goto_1

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeGetCaches(J)[Lio/agora/musiccontentcenter/MusicCacheInfo;

    move-result-object p0

    :goto_0
    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_2

    :cond_2
    :goto_1
    const-string p0, "MusicContentCenterImpl"

    const-string v2, "MusicContentCenter does not initialize or it may be destroyed (getCaches)"

    invoke-static {p0, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    new-array p0, v1, [Lio/agora/musiccontentcenter/MusicCacheInfo;

    goto :goto_0

    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_3
    new-array p0, v1, [Lio/agora/musiccontentcenter/MusicCacheInfo;

    return-object p0
.end method

.method public getInternalSongCode(JLjava/lang/String;)J
    .locals 10

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const-wide/16 v1, 0x0

    if-nez v0, :cond_3

    iget-object v3, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v3, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v3

    :try_start_0
    iget-wide v4, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    cmp-long v0, v4, v1

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v4

    cmp-long v0, v4, v1

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v5, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    move-object v4, p0

    move-wide v7, p1

    move-object v9, p3

    invoke-direct/range {v4 .. v9}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeGetInternalSongCode(JJLjava/lang/String;)J

    move-result-wide p0

    monitor-exit v3

    return-wide p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (getInternalSongCode)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v3

    return-wide v1

    :goto_1
    monitor-exit v3
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-wide v1
.end method

.method public getLyric(JI)Ljava/lang/String;
    .locals 9

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v2

    :try_start_0
    iget-wide v3, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v3

    cmp-long v0, v3, v5

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v4, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    move-object v3, p0

    move-wide v6, p1

    move v8, p3

    invoke-direct/range {v3 .. v8}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeGetLyric(JJI)Ljava/lang/String;

    move-result-object p0

    monitor-exit v2

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (getLyric)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v2

    return-object v1

    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-object v1
.end method

.method public getMusicCharts()Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v2}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeGetMusicCharts(J)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string v2, "MusicContentCenter does not initialize or it may be destroyed (getMusicCharts)"

    invoke-static {p0, v2}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return-object v1

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-object v1
.end method

.method public getMusicCollectionByMusicChartId(IIILjava/lang/String;)Ljava/lang/String;
    .locals 10

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v2

    :try_start_0
    iget-wide v3, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v3

    cmp-long v0, v3, v5

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v4, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    move-object v3, p0

    move v6, p1

    move v7, p2

    move v8, p3

    move-object v9, p4

    invoke-direct/range {v3 .. v9}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeGetMusicCollectionByMusicChartId(JIIILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    monitor-exit v2

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (getMusicCollectionByMusicChartId)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v2

    return-object v1

    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-object v1
.end method

.method public getSongSimpleInfo(J)Ljava/lang/String;
    .locals 6

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v2}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1, p2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeGetSongSimpleInfo(JJ)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (getSongSimpleInfo)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return-object v1

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-object v1
.end method

.method public initialize(Lio/agora/musiccontentcenter/MusicContentCenterConfiguration;)I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeInitialize(JLjava/lang/Object;)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (initialize)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public isPreloaded(J)I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1, p2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeIsPreloaded(JJ)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (isPreloaded)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public preload(JLjava/lang/String;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v1, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v1

    :try_start_0
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v0, v2, v4

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v2

    cmp-long v0, v2, v4

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v3, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    move-object v2, p0

    move-wide v5, p1

    move-object v7, p3

    invoke-direct/range {v2 .. v7}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativePreload(JJLjava/lang/String;)I

    move-result p0

    monitor-exit v1

    return p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (preload)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v1

    return p0

    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public preload(J)Ljava/lang/String;
    .locals 6

    .line 2
    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v4, 0x0

    cmp-long v2, v2, v4

    if-eqz v2, :cond_2

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v2}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v2

    cmp-long v2, v2, v4

    if-nez v2, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1, p2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativePreloadWithSongCode(JJ)Ljava/lang/String;

    move-result-object p0

    monitor-exit v0

    return-object p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (preload)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v0

    return-object v1

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-object v1
.end method

.method public registerEventHandler(Lio/agora/musiccontentcenter/IMusicContentCenterEventHandler;)I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeRegisterEventHandler(JLjava/lang/Object;)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (registerEventHandler)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public removeCache(J)I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1, p2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeRemoveCache(JJ)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (removeCache)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public renewToken(Ljava/lang/String;)I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2, p1}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeRenewToken(JLjava/lang/String;)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (renewToken)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method

.method public searchMusic(Ljava/lang/String;IILjava/lang/String;)Ljava/lang/String;
    .locals 10

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_3

    iget-object v2, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v2, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v2

    :try_start_0
    iget-wide v3, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-eqz v0, :cond_2

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v0}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v3

    cmp-long v0, v3, v5

    if-nez v0, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v4, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    move-object v3, p0

    move-object v6, p1

    move v7, p2

    move v8, p3

    move-object v9, p4

    invoke-direct/range {v3 .. v9}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeSearchMusic(JLjava/lang/String;IILjava/lang/String;)Ljava/lang/String;

    move-result-object p0

    monitor-exit v2

    return-object p0

    :catchall_0
    move-exception v0

    move-object p0, v0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string p1, "MusicContentCenter does not initialize or it may be destroyed (searchMusic)"

    invoke-static {p0, p1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    monitor-exit v2

    return-object v1

    :goto_1
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    return-object v1
.end method

.method public unregisterEventHandler()I
    .locals 5

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mIsDestroying:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v0

    if-nez v0, :cond_3

    iget-object v0, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    if-nez v0, :cond_0

    goto :goto_2

    :cond_0
    monitor-enter v0

    :try_start_0
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    iget-object v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mRtcEngine:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {v1}, Lio/agora/rtc2/internal/RtcEngineImpl;->getNativeHandle()J

    move-result-wide v1

    cmp-long v1, v1, v3

    if-nez v1, :cond_1

    goto :goto_0

    :cond_1
    iget-wide v1, p0, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->mNativeHandle:J

    invoke-direct {p0, v1, v2}, Lio/agora/musiccontentcenter/internal/MusicContentCenterImpl;->nativeUnregisterEventHandler(J)I

    move-result p0

    monitor-exit v0

    return p0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_2
    :goto_0
    const-string p0, "MusicContentCenterImpl"

    const-string v1, "MusicContentCenter does not initialize or it may be destroyed (unregisterEventHandler)"

    invoke-static {p0, v1}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, -0x7

    monitor-exit v0

    return p0

    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw p0

    :cond_3
    :goto_2
    const/4 p0, -0x8

    return p0
.end method
