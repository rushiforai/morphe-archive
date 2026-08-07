.class public Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;
.super Ljava/lang/Object;

# interfaces
.implements Lio/agora/mediaplayer/IMediaPlayerCacheManager;


# static fields
.field protected static mInstance:Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;


# instance fields
.field private cacheManagerInitStatus:I

.field private final mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(Lio/agora/rtc2/internal/RtcEngineImpl;)V
    .locals 1

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const/4 v0, -0x1

    iput v0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->cacheManagerInitStatus:I

    iput-object p1, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->initMediaPlayerCacheManager()I

    move-result p1

    iput p1, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->cacheManagerInitStatus:I

    return-void
.end method

.method public static declared-synchronized destroyMediaPlayerCacheManager()V
    .locals 2

    const-class v0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_0
    sput-object v1, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mInstance:Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-void

    :catchall_0
    move-exception v1

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1
.end method

.method public static declared-synchronized getMediaPlayerCacheManager(Lio/agora/rtc2/internal/RtcEngineImpl;)Lio/agora/mediaplayer/IMediaPlayerCacheManager;
    .locals 2

    const-class v0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;

    monitor-enter v0

    if-nez p0, :cond_0

    monitor-exit v0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    :try_start_0
    sget-object v1, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mInstance:Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;

    if-nez v1, :cond_1

    new-instance v1, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;

    invoke-direct {v1, p0}, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;-><init>(Lio/agora/rtc2/internal/RtcEngineImpl;)V

    sput-object v1, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mInstance:Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;

    goto :goto_0

    :catchall_0
    move-exception p0

    goto :goto_1

    :cond_1
    :goto_0
    sget-object p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mInstance:Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit v0

    return-object p0

    :goto_1
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p0
.end method


# virtual methods
.method public enableAutoRemoveCache(Z)I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheEnableAutoRemoveCache(Z)I

    move-result p0

    return p0
.end method

.method public getCacheDir()Ljava/lang/String;
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheGetCacheDir()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public getCacheFileCount()I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheGetCacheFileCount()I

    move-result p0

    return p0
.end method

.method public getCacheManagerInitStatus()I
    .locals 0

    iget p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->cacheManagerInitStatus:I

    return p0
.end method

.method public getMaxCacheFileCount()I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheGetMaxCacheFileCount()I

    move-result p0

    return p0
.end method

.method public getMaxCacheFileSize()J
    .locals 2

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheGetMaxCacheFileSize()J

    move-result-wide v0

    return-wide v0
.end method

.method public removeAllCaches()I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheRemoveAllCaches()I

    move-result p0

    return p0
.end method

.method public removeCacheByUri(Ljava/lang/String;)I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheRemoveCacheByUri(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public removeOldCache()I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheRemoveOldCache()I

    move-result p0

    return p0
.end method

.method public setCacheDir(Ljava/lang/String;)I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheSetCacheDir(Ljava/lang/String;)I

    move-result p0

    return p0
.end method

.method public setMaxCacheFileCount(I)I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheSetMaxCacheFileCount(I)I

    move-result p0

    return p0
.end method

.method public setMaxCacheFileSize(J)I
    .locals 0

    iget-object p0, p0, Lio/agora/rtc2/internal/MediaPlayerCacheManagerImpl;->mRtcEngineImpl:Lio/agora/rtc2/internal/RtcEngineImpl;

    invoke-virtual {p0, p1, p2}, Lio/agora/rtc2/internal/RtcEngineImpl;->mediaPlayerCacheSetMaxCacheFileSize(J)I

    move-result p0

    return p0
.end method
