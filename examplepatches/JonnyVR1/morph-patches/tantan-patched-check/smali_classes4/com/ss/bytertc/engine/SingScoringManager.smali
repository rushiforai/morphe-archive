.class public Lcom/ss/bytertc/engine/SingScoringManager;
.super Lcom/ss/bytertc/engine/audio/ISingScoringManager;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "SingScoringManager"


# instance fields
.field private final mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

.field private final mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

.field mNativeHandler:Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;

.field private mNativeRTCVideoEngine:J

.field private mNativeSingScoringManager:J

.field private final mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mSingScoringEventHandler:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/ISingScoringEventHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(JJ)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/audio/ISingScoringManager;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeRTCVideoEngine:J

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 28
    .line 29
    iput-wide p1, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeRTCVideoEngine:J

    .line 30
    .line 31
    iput-wide p3, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

    .line 32
    .line 33
    new-instance p1, Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;-><init>(Lcom/ss/bytertc/engine/SingScoringManager;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeHandler:Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;

    .line 39
    .line 40
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 4
    .line 5
    .line 6
    const-wide/16 v0, 0x0

    .line 7
    .line 8
    :try_start_0
    iput-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 11
    .line 12
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 20
    .line 21
    .line 22
    throw v0
.end method

.method public getAverageScore()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string v0, "SingScoringManager"

    .line 15
    .line 16
    const-string v1, "native SingScoringManager is invalid, getAverageScore failed."

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    move-exception v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeGetAverageScore(J)I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public getLastSentenceScore()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string v0, "SingScoringManager"

    .line 15
    .line 16
    const-string v1, "native SingScoringManager is invalid, getLastSentenceScore failed."

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    move-exception v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeGetLastSentenceScore(J)I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public getSingScoringEventHandler()Lcom/ss/bytertc/engine/ISingScoringEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mSingScoringEventHandler:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/ISingScoringEventHandler;

    .line 8
    .line 9
    return-object p0
.end method

.method public getStandardPitchInfo(Ljava/lang/String;)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            ")",
            "Ljava/util/List<",
            "Lcom/ss/bytertc/engine/data/StandardPitchInfo;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string p1, "SingScoringManager"

    .line 15
    .line 16
    const-string v0, "native SingScoringManager is invalid, getStandardPitchInfo failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 24
    .line 25
    .line 26
    const/4 p0, 0x0

    .line 27
    return-object p0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeGetStandardPitchInfo(JLjava/lang/String;)[Lcom/ss/bytertc/engine/data/StandardPitchInfo;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    .line 35
    .line 36
    .line 37
    move-result-object p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 41
    .line 42
    .line 43
    return-object p1

    .line 44
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public getTotalScore()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string v0, "SingScoringManager"

    .line 15
    .line 16
    const-string v1, "native SingScoringManager is invalid, getTotalScore failed."

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    move-exception v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeGetTotalScore(J)I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method

.method public initSingScoring(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/ISingScoringEventHandler;)I
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string p1, "SingScoringManager"

    .line 15
    .line 16
    const-string p2, "native SingScoringManager is invalid, initSingScoring failed."

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    move-exception v0

    .line 29
    move-object p1, v0

    .line 30
    goto :goto_1

    .line 31
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 32
    .line 33
    invoke-direct {v0, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 34
    .line 35
    .line 36
    iput-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mSingScoringEventHandler:Ljava/lang/ref/WeakReference;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    .line 38
    iget-wide v1, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeRTCVideoEngine:J

    .line 39
    .line 40
    if-nez p3, :cond_1

    .line 41
    .line 42
    :try_start_2
    iget-wide v3, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

    .line 43
    .line 44
    const/4 v7, 0x0

    .line 45
    move-object v5, p1

    .line 46
    move-object v6, p2

    .line 47
    invoke-static/range {v1 .. v7}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeInitSingScoring(JJLjava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 54
    .line 55
    .line 56
    return p1

    .line 57
    :cond_1
    move-object v5, p1

    .line 58
    move-object v6, p2

    .line 59
    :try_start_3
    iget-wide v3, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

    .line 60
    .line 61
    iget-object v7, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeHandler:Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;

    .line 62
    .line 63
    invoke-static/range {v1 .. v7}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeInitSingScoring(JJLjava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/handler/NativeSingScoringEventHandler;)I

    .line 64
    .line 65
    .line 66
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 67
    goto :goto_0

    .line 68
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 71
    .line 72
    .line 73
    throw p1
.end method

.method public setSingScoringConfig(Lcom/ss/bytertc/engine/data/SingScoringConfig;)I
    .locals 7

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

    .line 7
    .line 8
    const-wide/16 v3, 0x0

    .line 9
    .line 10
    cmp-long v0, v1, v3

    .line 11
    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    const-string p1, "SingScoringManager"

    .line 15
    .line 16
    const-string v0, "native SingScoringManager is invalid, setSingScoringConfig failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    move-exception v0

    .line 29
    move-object p1, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    :try_start_1
    iget-object v0, p1, Lcom/ss/bytertc/engine/data/SingScoringConfig;->sampleRate:Lcom/ss/bytertc/engine/data/AudioSampleRate;

    .line 32
    .line 33
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/AudioSampleRate;->value()I

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    iget-object v0, p1, Lcom/ss/bytertc/engine/data/SingScoringConfig;->mode:Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/MulDimSingScoringMode;->value()I

    .line 40
    .line 41
    .line 42
    move-result v4

    .line 43
    iget-object v5, p1, Lcom/ss/bytertc/engine/data/SingScoringConfig;->lyricsFilepath:Ljava/lang/String;

    .line 44
    .line 45
    iget-object v6, p1, Lcom/ss/bytertc/engine/data/SingScoringConfig;->midiFilepath:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static/range {v1 .. v6}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeSetSingScoringConfig(JIILjava/lang/String;Ljava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 51
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 54
    .line 55
    .line 56
    return p1

    .line 57
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    throw p1
.end method

.method public startSingScoring(II)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string p1, "SingScoringManager"

    .line 15
    .line 16
    const-string p2, "native SingScoringManager is invalid, startSingScoring failed."

    .line 17
    .line 18
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeStartSingScoring(JII)I

    .line 31
    .line 32
    .line 33
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return p1

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw p1
.end method

.method public stopSingScoring()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mNativeSingScoringManager:J

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
    const-string v0, "SingScoringManager"

    .line 15
    .line 16
    const-string v1, "native SingScoringManager is invalid, stopSingScoring failed."

    .line 17
    .line 18
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    move-exception v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeSingScoringManagerFunctions;->nativeStopSingScoring(J)I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/SingScoringManager;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    throw v0
.end method
