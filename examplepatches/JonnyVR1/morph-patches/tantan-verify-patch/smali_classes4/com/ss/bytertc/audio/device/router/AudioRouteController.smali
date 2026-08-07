.class public Lcom/ss/bytertc/audio/device/router/AudioRouteController;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;


# static fields
.field public static EVENT_ONLY_LOG:I = 0x0

.field public static EVENT_SCO_FAILED_FORCE_TO_MEDIA_MODE:I = 0x1

.field private static final TAG:Ljava/lang/String; = "AudioRouteController"


# instance fields
.field private currentRouting:I
    .annotation build Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
    .end annotation
.end field

.field private isMediaMode:Z

.field private lock:Ljava/util/concurrent/locks/ReadWriteLock;

.field private mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

.field private nativeAudioRouteControllerPtr:J

.field private rLock:Ljava/util/concurrent/locks/Lock;

.field private wLock:Ljava/util/concurrent/locks/Lock;


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private constructor <init>(J)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->currentRouting:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput-boolean v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->isMediaMode:Z

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 16
    .line 17
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->readLock()Ljava/util/concurrent/locks/Lock;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->lock:Ljava/util/concurrent/locks/ReadWriteLock;

    .line 24
    .line 25
    invoke-interface {v0}, Ljava/util/concurrent/locks/ReadWriteLock;->writeLock()Ljava/util/concurrent/locks/Lock;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iput-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->wLock:Ljava/util/concurrent/locks/Lock;

    .line 30
    .line 31
    iput-wide p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J

    .line 32
    .line 33
    new-instance p1, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 34
    .line 35
    invoke-direct {p1, p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;-><init>(Lcom/ss/bytertc/audio/device/router/IAudioRouteCallback;)V

    .line 36
    .line 37
    .line 38
    iput-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 39
    .line 40
    return-void
.end method

.method private getCaptureDeviceName()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J

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
    const-string v0, "nativePtr is 0"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->getCaptureDeviceName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 34
    .line 35
    .line 36
    throw v0
.end method

.method private getRenderDeviceName()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J

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
    const-string v0, "nativePtr is 0"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->getRenderDeviceName()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 34
    .line 35
    .line 36
    throw v0
.end method

.method private getSessionInfo()Ljava/lang/String;
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J

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
    const-string v0, "nativePtr is 0"
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 15
    .line 16
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    return-object v0

    .line 22
    :catchall_0
    move-exception v0

    .line 23
    goto :goto_1

    .line 24
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->getSessionInfo()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    goto :goto_0

    .line 31
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 32
    .line 33
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 34
    .line 35
    .line 36
    throw v0
.end method

.method private init()I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
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
    const/4 v1, -0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 18
    .line 19
    .line 20
    return v1

    .line 21
    :cond_0
    :try_start_1
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->initAudioRouteDeviceManager()I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->getDeviceState()I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 35
    .line 36
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 42
    .line 43
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 44
    .line 45
    .line 46
    throw v0
.end method

.method private initAudioRouteDeviceManager()I
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->init()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->release()I

    .line 10
    .line 11
    .line 12
    new-instance p0, Ljava/lang/StringBuilder;

    .line 13
    .line 14
    const-string v1, "init failed. code: "

    .line 15
    .line 16
    invoke-direct {p0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object p0

    .line 26
    const-string v1, "AudioRouteController"

    .line 27
    .line 28
    invoke-static {v1, p0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    return v0
.end method

.method private native onDeviceEvent(JIZLjava/lang/String;)V
.end method

.method private native onError(JI)V
.end method

.method private release()I
    .locals 5

    .line 1
    const-string v0, "AudioRouteController: release end"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->wLock:Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 6
    .line 7
    .line 8
    const-string v1, "AudioRouteController: release begin"

    .line 9
    .line 10
    const-string v2, "AudioRouteController"

    .line 11
    .line 12
    invoke-static {v2, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    const-wide/16 v3, 0x0

    .line 16
    .line 17
    :try_start_0
    iput-wide v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J

    .line 18
    .line 19
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    invoke-virtual {v1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->release()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    const/4 v3, 0x0

    .line 28
    iput-object v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :catchall_0
    move-exception v1

    .line 32
    goto :goto_1

    .line 33
    :cond_0
    const/4 v1, 0x0

    .line 34
    :goto_0
    const/4 v3, -0x1

    .line 35
    iput v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->currentRouting:I

    .line 36
    .line 37
    const/4 v3, 0x1

    .line 38
    iput-boolean v3, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->isMediaMode:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    .line 40
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->wLock:Ljava/util/concurrent/locks/Lock;

    .line 44
    .line 45
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 46
    .line 47
    .line 48
    return v1

    .line 49
    :goto_1
    invoke-static {v2, v0}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->wLock:Ljava/util/concurrent/locks/Lock;

    .line 53
    .line 54
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 55
    .line 56
    .line 57
    throw v1
.end method

.method private restartBluetoothSco()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
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
    if-nez v0, :cond_1

    .line 13
    .line 14
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 15
    .line 16
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_1
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->restartBluetoothSco()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 25
    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception v0

    .line 29
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 30
    .line 31
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 32
    .line 33
    .line 34
    throw v0
.end method

.method private setAudioRoute(IZ)I
    .locals 8
    .param p1    # I
        .annotation build Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager$RoutingDeviceType;
        .end annotation
    .end param

    .line 1
    const-string v0, "AudioRouteController: setAudioRoute, end, routing: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 6
    .line 7
    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "AudioRouteController: setAudioRoute, begin, routing: "

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    const-string v2, ", isMediaMode: "

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v3, "AudioRouteController"

    .line 31
    .line 32
    invoke-static {v3, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :try_start_0
    iget-wide v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 36
    .line 37
    const-wide/16 v6, 0x0

    .line 38
    .line 39
    cmp-long v1, v4, v6

    .line 40
    .line 41
    if-nez v1, :cond_0

    .line 42
    .line 43
    new-instance v1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 52
    .line 53
    .line 54
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-static {v3, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 65
    .line 66
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 67
    .line 68
    .line 69
    const/4 p0, -0x5

    .line 70
    return p0

    .line 71
    :cond_0
    :try_start_1
    iput-boolean p2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->isMediaMode:Z

    .line 72
    .line 73
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 74
    .line 75
    invoke-virtual {v1, p1, p2}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->setAudioRoute(IZ)I

    .line 76
    .line 77
    .line 78
    move-result v1

    .line 79
    if-nez v1, :cond_1

    .line 80
    .line 81
    move v4, p1

    .line 82
    goto :goto_0

    .line 83
    :cond_1
    iget v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->currentRouting:I

    .line 84
    .line 85
    :goto_0
    iput v4, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->currentRouting:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 86
    .line 87
    new-instance v4, Ljava/lang/StringBuilder;

    .line 88
    .line 89
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-static {v3, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 106
    .line 107
    .line 108
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 109
    .line 110
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 111
    .line 112
    .line 113
    return v1

    .line 114
    :catchall_0
    move-exception v1

    .line 115
    new-instance v4, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v4, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v4, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    invoke-static {v3, p1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 137
    .line 138
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 139
    .line 140
    .line 141
    throw v1
.end method

.method private setUseAudioDeviceCallback(Z)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 2
    .line 3
    invoke-interface {v0}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
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
    const/4 v1, -0x1

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 16
    .line 17
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 18
    .line 19
    .line 20
    return v1

    .line 21
    :cond_0
    :try_start_1
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 22
    .line 23
    if-eqz v0, :cond_2

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->release()I

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 29
    .line 30
    invoke-virtual {v0, p1, p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->setUseAudioDeviceCallback(ZLcom/ss/bytertc/audio/device/router/IAudioRouteCallback;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0}, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->initAudioRouteDeviceManager()I

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-eqz p1, :cond_1

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    iget-object p1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->mAudioRouteDeviceManager:Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;

    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteDeviceManager;->getDeviceState()I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 46
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 47
    .line 48
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_1

    .line 54
    :cond_2
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 55
    .line 56
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 57
    .line 58
    .line 59
    const/4 p0, 0x0

    .line 60
    return p0

    .line 61
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 62
    .line 63
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 64
    .line 65
    .line 66
    throw p1
.end method


# virtual methods
.method public onDeviceEvent(IZLjava/lang/String;)V
    .locals 11

    .line 1
    const-string v1, "AudioRouteController: onDeviceEvent, end"

    .line 2
    .line 3
    const-string v0, "AudioRouteController: onDeviceEvent(Java) deviceType:"

    .line 4
    .line 5
    iget-object v2, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 6
    .line 7
    invoke-interface {v2}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 8
    .line 9
    .line 10
    new-instance v2, Ljava/lang/StringBuilder;

    .line 11
    .line 12
    const-string v3, "onDeviceEvent, begin, deviceType: "

    .line 13
    .line 14
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    const-string v3, ", connected: "

    .line 21
    .line 22
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    const-string v3, ", deviceInfo:"

    .line 29
    .line 30
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 37
    .line 38
    .line 39
    move-result-object v2

    .line 40
    const-string v4, "AudioRouteController"

    .line 41
    .line 42
    invoke-static {v4, v2}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :try_start_0
    iget-wide v5, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 46
    .line 47
    const-wide/16 v7, 0x0

    .line 48
    .line 49
    cmp-long v2, v5, v7

    .line 50
    .line 51
    if-nez v2, :cond_0

    .line 52
    .line 53
    invoke-static {v4, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 57
    .line 58
    :goto_0
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 59
    .line 60
    .line 61
    return-void

    .line 62
    :cond_0
    :try_start_1
    new-instance v2, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 68
    .line 69
    .line 70
    const-string v0, ", connected:"

    .line 71
    .line 72
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v2, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    invoke-static {v4, v0}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    iget-wide v6, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 92
    .line 93
    move-object v5, p0

    .line 94
    move v8, p1

    .line 95
    move v9, p2

    .line 96
    move-object v10, p3

    .line 97
    :try_start_2
    invoke-direct/range {v5 .. v10}, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->onDeviceEvent(JIZLjava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 98
    .line 99
    .line 100
    invoke-static {v4, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    iget-object p0, v5, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :catchall_0
    move-exception v0

    .line 107
    :goto_1
    move-object p0, v0

    .line 108
    goto :goto_2

    .line 109
    :catchall_1
    move-exception v0

    .line 110
    move-object v5, p0

    .line 111
    goto :goto_1

    .line 112
    :goto_2
    invoke-static {v4, v1}, Lcom/bytedance/realx/base/RXLogging;->w(Ljava/lang/String;Ljava/lang/String;)V

    .line 113
    .line 114
    .line 115
    iget-object p1, v5, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 116
    .line 117
    invoke-interface {p1}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 118
    .line 119
    .line 120
    throw p0
.end method

.method public onError(ILjava/lang/String;)V
    .locals 5

    .line 1
    const-string v0, "AudioRouteController: ERROR-"

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 4
    .line 5
    invoke-interface {v1}, Ljava/util/concurrent/locks/Lock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    const-wide/16 v3, 0x0

    .line 11
    .line 12
    cmp-long v1, v1, v3

    .line 13
    .line 14
    if-nez v1, :cond_1

    .line 15
    .line 16
    :cond_0
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 17
    .line 18
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :cond_1
    :try_start_1
    const-string v1, "AudioRouteController"

    .line 23
    .line 24
    new-instance v2, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 30
    .line 31
    .line 32
    const-string v0, ":"

    .line 33
    .line 34
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {v2, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p2

    .line 44
    invoke-static {v1, p2}, Lcom/bytedance/realx/base/RXLogging;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    sget p2, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->EVENT_SCO_FAILED_FORCE_TO_MEDIA_MODE:I

    .line 48
    .line 49
    if-ne p1, p2, :cond_0

    .line 50
    .line 51
    iget-wide v0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->nativeAudioRouteControllerPtr:J

    .line 52
    .line 53
    invoke-direct {p0, v0, v1, p1}, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->onError(JI)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :catchall_0
    move-exception p1

    .line 58
    iget-object p0, p0, Lcom/ss/bytertc/audio/device/router/AudioRouteController;->rLock:Ljava/util/concurrent/locks/Lock;

    .line 59
    .line 60
    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    .line 61
    .line 62
    .line 63
    throw p1
.end method
