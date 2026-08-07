.class public Lcom/ss/bytertc/engine/video/RTCVideoEffect;
.super Lcom/ss/bytertc/engine/video/IVideoEffect;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RTCVideoEffect"


# instance fields
.field private mFaceDetectionObserver:Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;

.field private final mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

.field private final mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

.field private mNativeEngine:J

.field private mRTCFaceDetectionObserver:Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;

.field private final mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;


# direct methods
.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/IVideoEffect;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mRTCFaceDetectionObserver:Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;

    .line 10
    .line 11
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 12
    .line 13
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    iput-object v1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 29
    .line 30
    iput-wide p1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 31
    .line 32
    new-instance p1, Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;

    .line 33
    .line 34
    invoke-direct {p1, p0}, Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;-><init>(Lcom/ss/bytertc/engine/video/RTCVideoEffect;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mRTCFaceDetectionObserver:Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;

    .line 38
    .line 39
    const-string p0, "RTCVideoEffect"

    .line 40
    .line 41
    const-string p1, "create rtc video effect"

    .line 42
    .line 43
    invoke-static {p0, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method private engineInvalid()Z
    .locals 4

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long p0, v0, v2

    .line 6
    .line 7
    if-nez p0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0
.end method


# virtual methods
.method public appendEffectNodes(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v0, "invalid, appendEffectNodes failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    new-array v0, v0, [Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeAppendVideoEffectNodes(J[Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return p1

    .line 50
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public applyStickerEffect(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v0, "native engine is invalid, applyStickerEffect failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeApplyStickerEffect(JLjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public destroy()V
    .locals 2

    .line 1
    const-string v0, "RTCVideoEffect"

    .line 2
    .line 3
    const-string v1, "dispose rtc video effect"

    .line 4
    .line 5
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->i(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 11
    .line 12
    .line 13
    const-wide/16 v0, 0x0

    .line 14
    .line 15
    :try_start_0
    iput-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    .line 17
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :catchall_0
    move-exception v0

    .line 24
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 25
    .line 26
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 27
    .line 28
    .line 29
    throw v0
.end method

.method public disableFaceDetection()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v1, "invalid, registerFaceDetectionObserver failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    const/4 v0, 0x0

    .line 30
    :try_start_1
    iput-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mFaceDetectionObserver:Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;

    .line 31
    .line 32
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 33
    .line 34
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDisableFaceDetection(J)I

    .line 35
    .line 36
    .line 37
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 41
    .line 42
    .line 43
    return v0

    .line 44
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw v0
.end method

.method public disableVideoEffect()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v1, "invalid, disableVideoEffect failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDisableVideoEffect(J)I

    .line 32
    .line 33
    .line 34
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method public disableVirtualBackground()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v1, "invalid, disableVirtualBackground failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeDisableVirtualBackground(J)I

    .line 32
    .line 33
    .line 34
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method public enableFaceDetection(Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;ILjava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string p2, "invalid, registerFaceDetectionObserver failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mFaceDetectionObserver:Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;

    .line 30
    .line 31
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 32
    .line 33
    iget-object p1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mRTCFaceDetectionObserver:Lcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;

    .line 34
    .line 35
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableFaceDetection(JLcom/ss/bytertc/engine/handler/RTCFaceDetectionObserver;ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 42
    .line 43
    .line 44
    return p1

    .line 45
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 46
    .line 47
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 48
    .line 49
    .line 50
    throw p1
.end method

.method public enableVideoEffect()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v1, "invalid, enableVideoEffect failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableVideoEffect2(J)I

    .line 32
    .line 33
    .line 34
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method public enableVirtualBackground(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VirtualBackgroundSource;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string p2, "invalid, enableVirtualBackground failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

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
    const-string v0, ""

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    iget-object v1, p2, Lcom/ss/bytertc/engine/data/VirtualBackgroundSource;->sourcePath:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v1, :cond_1

    .line 37
    .line 38
    move-object v5, v1

    .line 39
    goto :goto_0

    .line 40
    :cond_1
    move-object v5, v0

    .line 41
    :goto_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 42
    .line 43
    iget-object v2, p2, Lcom/ss/bytertc/engine/data/VirtualBackgroundSource;->sourceType:Lcom/ss/bytertc/engine/data/VirtualBackgroundSourceType;

    .line 44
    .line 45
    invoke-virtual {v2}, Ljava/lang/Enum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v3

    .line 49
    iget v4, p2, Lcom/ss/bytertc/engine/data/VirtualBackgroundSource;->sourceColor:I

    .line 50
    .line 51
    move-object v2, p1

    .line 52
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeEnableVirtualBackground(JLjava/lang/String;IILjava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    return p1

    .line 62
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 65
    .line 66
    .line 67
    throw p1
.end method

.method public getFaceDetectionObserver()Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mFaceDetectionObserver:Lcom/ss/bytertc/engine/video/IFaceDetectionObserver;

    .line 2
    .line 3
    return-object p0
.end method

.method public getVideoEffectHandle()J
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string v0, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v1, "native engine is invalid, getVideoEffectHandle failed."

    .line 15
    .line 16
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const-wide/16 v0, -0x3ee

    .line 25
    .line 26
    return-wide v0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeGetVideoEffectHandle(J)J

    .line 32
    .line 33
    .line 34
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return-wide v0

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method public initCVResource(Ljava/lang/String;Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string p2, "invalid, initCVResource failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeInitCVResource(JLjava/lang/String;Ljava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public removeEffectNodes(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v0, "invalid, removeEffectNodes failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    new-array v0, v0, [Ljava/lang/String;

    .line 34
    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    iget-wide v1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 39
    .line 40
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeRemoveVideoEffectNodes(J[Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 44
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return p1

    .line 50
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 51
    .line 52
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 53
    .line 54
    .line 55
    throw p1
.end method

.method public setAlgoModelResourceFinder(JJ)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string p2, "invalid, setAlgoModelResourceFinder failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception v0

    .line 28
    move-object p1, v0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 31
    .line 32
    move-wide v2, p1

    .line 33
    move-wide v4, p3

    .line 34
    invoke-static/range {v0 .. v5}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEffectAlgoModelResourceFinder(JJJ)I

    .line 35
    .line 36
    .line 37
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 39
    .line 40
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 41
    .line 42
    .line 43
    return p1

    .line 44
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    throw p1
.end method

.method public setColorFilter(Ljava/lang/String;)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v0, "invalid, setColorFilter failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEffectColorFilter(JLjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public setColorFilterIntensity(F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v0, "invalid, setColorFilterIntensity failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEffectColorFilterIntensity(JF)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method

.method public setEffectNodes(Ljava/util/List;)I
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Ljava/lang/String;",
            ">;)I"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    const-string v1, "RTCVideoEffect"

    .line 11
    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    :try_start_1
    const-string p1, "invalid, setEffectNodes failed."

    .line 15
    .line 16
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    if-nez p1, :cond_1

    .line 30
    .line 31
    :try_start_2
    const-string p1, "effect_nodes is null, setting empty effect nodes."

    .line 32
    .line 33
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    new-instance p1, Ljava/util/ArrayList;

    .line 37
    .line 38
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 39
    .line 40
    .line 41
    :cond_1
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    new-array v0, v0, [Ljava/lang/String;

    .line 46
    .line 47
    invoke-interface {p1, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    iget-wide v1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 51
    .line 52
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEffectNodes(J[Ljava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 56
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 59
    .line 60
    .line 61
    return p1

    .line 62
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 63
    .line 64
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 65
    .line 66
    .line 67
    throw p1
.end method

.method public setVideoEffectExpressionDetect(Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;)I
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string v0, "invalid, setVideoEffectExpressionDetect failed."

    .line 15
    .line 16
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    new-instance v0, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;

    .line 30
    .line 31
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/InternalExpressDetectConfig;-><init>(Lcom/ss/bytertc/engine/video/VideoEffectExpressionConfig;)V

    .line 32
    .line 33
    .line 34
    iget-wide v1, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 35
    .line 36
    invoke-static {v1, v2, v0}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeSetVideoEffectExpressionDetect(JLcom/ss/bytertc/engine/InternalExpressDetectConfig;)I

    .line 37
    .line 38
    .line 39
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    return p1

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    throw p1
.end method

.method public updateEffectNode(Ljava/lang/String;Ljava/lang/String;F)I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    invoke-direct {p0}, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->engineInvalid()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const-string p1, "RTCVideoEffect"

    .line 13
    .line 14
    const-string p2, "invalid, updateEffectNode failed."

    .line 15
    .line 16
    invoke-static {p1, p2}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 22
    .line 23
    .line 24
    const/16 p0, -0x3ee

    .line 25
    .line 26
    return p0

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    :try_start_1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mNativeEngine:J

    .line 30
    .line 31
    invoke-static {v0, v1, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCVideoFunctions;->nativeUpdateVideoEffectNode(JLjava/lang/String;Ljava/lang/String;F)I

    .line 32
    .line 33
    .line 34
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 36
    .line 37
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 38
    .line 39
    .line 40
    return p1

    .line 41
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/video/RTCVideoEffect;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 42
    .line 43
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw p1
.end method
