.class public Lcom/ss/bytertc/ktv/KTVManagerImpl;
.super Lcom/ss/bytertc/ktv/IKTVManager;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "KTVManagerImpl"


# instance fields
.field private final mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

.field private final mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

.field private mKTVManagerEventHandler:Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;

.field private mKTVPlayer:Lcom/ss/bytertc/ktv/KTVPlayerImpl;

.field private mNativeKTVManager:J

.field private mNativeKTVManagerEventHandlerPtr:J

.field private final mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;


# direct methods
.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/ktv/IKTVManager;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 5
    .line 6
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    iput-object v1, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 22
    .line 23
    iput-wide p1, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 24
    .line 25
    return-void
.end method

.method private calculateMusicFilterValue([Lcom/ss/bytertc/ktv/data/MusicFilterType;)I
    .locals 5

    .line 1
    const/4 p0, 0x0

    .line 2
    if-nez p1, :cond_0

    .line 3
    .line 4
    move v0, p0

    .line 5
    goto :goto_0

    .line 6
    :cond_0
    array-length v0, p1

    .line 7
    :goto_0
    if-nez v0, :cond_1

    .line 8
    .line 9
    sget-object p0, Lcom/ss/bytertc/ktv/data/MusicFilterType;->NONE:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value()I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 v1, 0x1

    .line 17
    if-ne v0, v1, :cond_2

    .line 18
    .line 19
    aget-object p0, p1, p0

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    return p0

    .line 26
    :cond_2
    aget-object v0, p1, p0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    array-length v1, p1

    .line 33
    move v2, p0

    .line 34
    :goto_1
    if-ge v2, v1, :cond_5

    .line 35
    .line 36
    aget-object v3, p1, v2

    .line 37
    .line 38
    sget-object v4, Lcom/ss/bytertc/ktv/data/MusicFilterType;->NONE:Lcom/ss/bytertc/ktv/data/MusicFilterType;

    .line 39
    .line 40
    invoke-virtual {v4}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value()I

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-ne v0, v4, :cond_4

    .line 45
    .line 46
    sget-boolean p1, Lcom/ss/bytertc/engine/BuildConfig;->DEBUG:Z

    .line 47
    .line 48
    const-string v0, "types contains \'MUSIC_FILTER_TYPE_NONE\' and other"

    .line 49
    .line 50
    if-nez p1, :cond_3

    .line 51
    .line 52
    const-string p0, "KTVManagerImpl"

    .line 53
    .line 54
    invoke-static {p0, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, -0x1

    .line 58
    return p0

    .line 59
    :cond_3
    invoke-static {v0}, Ll/wg3;->a(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    return p0

    .line 63
    :cond_4
    invoke-virtual {v3}, Lcom/ss/bytertc/ktv/data/MusicFilterType;->value()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    or-int/2addr v0, v3

    .line 68
    add-int/lit8 v2, v2, 0x1

    .line 69
    .line 70
    goto :goto_1

    .line 71
    :cond_5
    return v0
.end method


# virtual methods
.method public cancelDownload(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string v0, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v1, "native KTVManagerImpl is invalid, downloadLyric failed."

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 25
    .line 26
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeCancelDownload(JI)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    throw p1
.end method

.method public clearCache()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string v0, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v1, "native KTVManagerImpl is invalid, clearCache failed."

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :goto_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 25
    .line 26
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeClearCache(J)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return-void

    .line 35
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    throw v0
.end method

.method public destroy()V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVPlayer:Lcom/ss/bytertc/ktv/KTVPlayerImpl;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/ss/bytertc/ktv/KTVPlayerImpl;->destroy()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVPlayer:Lcom/ss/bytertc/ktv/KTVPlayerImpl;

    .line 10
    .line 11
    :cond_0
    iget-wide v2, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManagerEventHandlerPtr:J

    .line 12
    .line 13
    const-wide/16 v4, 0x0

    .line 14
    .line 15
    cmp-long v0, v2, v4

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-static {v2, v3}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeReleaseKTVManagerEventHandler(J)V

    .line 20
    .line 21
    .line 22
    iput-wide v4, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManagerEventHandlerPtr:J

    .line 23
    .line 24
    :cond_1
    iput-object v1, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVManagerEventHandler:Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;

    .line 25
    .line 26
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 27
    .line 28
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 29
    .line 30
    .line 31
    :try_start_0
    iput-wide v4, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    .line 33
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :catchall_0
    move-exception v0

    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public downloadLyric(Ljava/lang/String;Lcom/ss/bytertc/ktv/data/DownloadLyricType;)I
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Lcom/ss/bytertc/ktv/data/DownloadLyricType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string p2, "native KTVManagerImpl is invalid, downloadLyric failed."

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    const/4 p0, -0x1

    .line 27
    return p0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-virtual {p2}, Lcom/ss/bytertc/ktv/data/DownloadLyricType;->value()I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeDownloadLyric(JLjava/lang/String;I)I

    .line 35
    .line 36
    .line 37
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 41
    .line 42
    .line 43
    return p1

    .line 44
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public downloadMidi(Ljava/lang/String;)I
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v0, "native KTVManagerImpl is invalid, downloadMidi failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    const/4 p0, -0x1

    .line 27
    return p0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeDownloadMidi(JLjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return p1

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public downloadMusic(Ljava/lang/String;)I
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v0, "native KTVManagerImpl is invalid, downloadMusic failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    const/4 p0, -0x1

    .line 27
    return p0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeDownloadMusic(JLjava/lang/String;)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return p1

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public getHandler()Lcom/ss/bytertc/ktv/IKTVManagerEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVManagerEventHandler:Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;->getKTVHandler()Lcom/ss/bytertc/ktv/IKTVManagerEventHandler;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public getHotMusic(Ljava/util/List;[Lcom/ss/bytertc/ktv/data/MusicFilterType;)V
    .locals 4
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # [Lcom/ss/bytertc/ktv/data/MusicFilterType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;[",
            "Lcom/ss/bytertc/ktv/data/MusicFilterType;",
            ")V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string p2, "native KTVManagerImpl is invalid, getHotMusic failed."

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_1
    invoke-direct {p0, p2}, Lcom/ss/bytertc/ktv/KTVManagerImpl;->calculateMusicFilterValue([Lcom/ss/bytertc/ktv/data/MusicFilterType;)I

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    const/4 v0, -0x1

    .line 34
    if-ne p2, v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    new-array v0, v0, [Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-wide v1, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 47
    .line 48
    invoke-static {v1, v2, v0, p2}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeGetHotMusic(J[Ljava/lang/String;I)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    .line 51
    goto :goto_0

    .line 52
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw p1
.end method

.method public getKTVPlayer()Lcom/ss/bytertc/ktv/IKTVPlayer;
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    const-string v1, "KTVManagerImpl"

    .line 13
    .line 14
    if-nez v0, :cond_0

    .line 15
    .line 16
    :try_start_1
    const-string v0, "native KTVManagerImpl is invalid, getKTVPlayer failed."

    .line 17
    .line 18
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_2

    .line 24
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVPlayer:Lcom/ss/bytertc/ktv/KTVPlayerImpl;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 31
    .line 32
    .line 33
    return-object v0

    .line 34
    :cond_1
    :try_start_2
    iget-wide v4, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 35
    .line 36
    invoke-static {v4, v5}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeGetKTVPlayer(J)J

    .line 37
    .line 38
    .line 39
    move-result-wide v4

    .line 40
    cmp-long v0, v4, v2

    .line 41
    .line 42
    if-nez v0, :cond_2

    .line 43
    .line 44
    const-string v0, "native nativeKTVPlayer is invalid, getKTVPlayer failed."

    .line 45
    .line 46
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 47
    .line 48
    .line 49
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 52
    .line 53
    .line 54
    const/4 p0, 0x0

    .line 55
    return-object p0

    .line 56
    :cond_2
    :try_start_3
    new-instance v0, Lcom/ss/bytertc/ktv/KTVPlayerImpl;

    .line 57
    .line 58
    invoke-direct {v0, v4, v5}, Lcom/ss/bytertc/ktv/KTVPlayerImpl;-><init>(J)V

    .line 59
    .line 60
    .line 61
    iput-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVPlayer:Lcom/ss/bytertc/ktv/KTVPlayerImpl;
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 62
    .line 63
    goto :goto_1

    .line 64
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 67
    .line 68
    .line 69
    throw v0
.end method

.method public getMusicDetail(Ljava/lang/String;)V
    .locals 4
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v0, "native KTVManagerImpl is invalid, getMusicDetail failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeGetMusicDetail(JLjava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    throw p1
.end method

.method public getMusicList(II[Lcom/ss/bytertc/ktv/data/MusicFilterType;)V
    .locals 4
    .param p3    # [Lcom/ss/bytertc/ktv/data/MusicFilterType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string p2, "native KTVManagerImpl is invalid, getMusicList failed."

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_1
    invoke-direct {p0, p3}, Lcom/ss/bytertc/ktv/KTVManagerImpl;->calculateMusicFilterValue([Lcom/ss/bytertc/ktv/data/MusicFilterType;)I

    .line 30
    .line 31
    .line 32
    move-result p3

    .line 33
    const/4 v0, -0x1

    .line 34
    if-ne p3, v0, :cond_1

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 38
    .line 39
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeGetMusicList(JIII)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 44
    .line 45
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 46
    .line 47
    .line 48
    throw p1
.end method

.method public searchMusic(Ljava/lang/String;II[Lcom/ss/bytertc/ktv/data/MusicFilterType;)V
    .locals 6
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p4    # [Lcom/ss/bytertc/ktv/data/MusicFilterType;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string p2, "native KTVManagerImpl is invalid, searchMusic failed."

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    goto :goto_1

    .line 30
    :cond_0
    :try_start_1
    invoke-direct {p0, p4}, Lcom/ss/bytertc/ktv/KTVManagerImpl;->calculateMusicFilterValue([Lcom/ss/bytertc/ktv/data/MusicFilterType;)I

    .line 31
    .line 32
    .line 33
    move-result v5

    .line 34
    const/4 p4, -0x1

    .line 35
    if-ne v5, p4, :cond_1

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_1
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 39
    .line 40
    move-object v2, p1

    .line 41
    move v3, p2

    .line 42
    move v4, p3

    .line 43
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeSearchMusic(JLjava/lang/String;III)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    throw p1
.end method

.method public setKTVManagerEventHandler(Lcom/ss/bytertc/ktv/IKTVManagerEventHandler;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v0, v0, v2

    .line 11
    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v0, "native KTVManagerImpl is invalid, setKTVManagerEventHandler failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_1
    :try_start_1
    new-instance v0, Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;-><init>(Lcom/ss/bytertc/ktv/IKTVManagerEventHandler;)V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mKTVManagerEventHandler:Lcom/ss/bytertc/engine/handler/KTVManagerEventHandler;

    .line 35
    .line 36
    iget-wide v4, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManagerEventHandlerPtr:J

    .line 37
    .line 38
    iget-wide v6, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 39
    .line 40
    invoke-static {v6, v7, v0}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeSetKTVManagerEventHandler(JLcom/ss/bytertc/ktv/IKTVManagerEventHandler;)J

    .line 41
    .line 42
    .line 43
    move-result-wide v0

    .line 44
    iput-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManagerEventHandlerPtr:J

    .line 45
    .line 46
    cmp-long p1, v4, v2

    .line 47
    .line 48
    if-eqz p1, :cond_0

    .line 49
    .line 50
    invoke-static {v4, v5}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeReleaseKTVManagerEventHandler(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    .line 52
    .line 53
    goto :goto_0

    .line 54
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 55
    .line 56
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 57
    .line 58
    .line 59
    throw p1
.end method

.method public setMaxCacheSize(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mNativeKTVManager:J

    .line 7
    .line 8
    const-wide/16 v2, 0x0

    .line 9
    .line 10
    cmp-long v2, v0, v2

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    const-string p1, "KTVManagerImpl"

    .line 15
    .line 16
    const-string v0, "native KTVManagerImpl is invalid, setMaxCacheSize failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_1

    .line 29
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeKTVManagerFunctions;->nativeSetMaxCacheSize(JI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    .line 31
    .line 32
    goto :goto_0

    .line 33
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/ktv/KTVManagerImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 34
    .line 35
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 36
    .line 37
    .line 38
    throw p1
.end method
