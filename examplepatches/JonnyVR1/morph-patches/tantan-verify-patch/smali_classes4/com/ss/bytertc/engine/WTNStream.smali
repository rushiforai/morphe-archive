.class public Lcom/ss/bytertc/engine/WTNStream;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/IWTNStream;


# static fields
.field private static final TAG:Ljava/lang/String; = "WTNStream"


# instance fields
.field private final mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

.field private final mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

.field mNativeHandler:Lcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;

.field private mNativeWTNStream:J

.field private final mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mWTNStreamEventHandler:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Lcom/ss/bytertc/engine/IWTNStreamEventHandler;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 7
    .line 8
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 9
    .line 10
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    iput-object v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    iput-object v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 26
    .line 27
    iput-wide p1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 28
    .line 29
    new-instance p1, Lcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;

    .line 30
    .line 31
    invoke-direct {p1, p0}, Lcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;-><init>(Lcom/ss/bytertc/engine/WTNStream;)V

    .line 32
    .line 33
    .line 34
    iput-object p1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeHandler:Lcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

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
    iput-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    .line 10
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

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
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 20
    .line 21
    .line 22
    throw v0
.end method

.method public getWTNStreamEventHandler()Lcom/ss/bytertc/engine/IWTNStreamEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mWTNStreamEventHandler:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Lcom/ss/bytertc/engine/IWTNStreamEventHandler;

    .line 8
    .line 9
    return-object p0
.end method

.method public setWTNRemoteAudioPlaybackVolume(Ljava/lang/String;I)I
    .locals 5

    .line 1
    const-string v0, "setWTNRemoteAudioPlaybackVolume...public stream id: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J
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
    const-string v2, "WTNStream"

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_1
    const-string p1, "native engine is invalid, setWTNRemoteAudioPlaybackVolume failed."

    .line 19
    .line 20
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 26
    .line 27
    .line 28
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return p1

    .line 35
    :catchall_0
    move-exception p1

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    const-string v0, ", volume: "

    .line 46
    .line 47
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 48
    .line 49
    .line 50
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 61
    .line 62
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSetWTNRemoteAudioPlaybackVolume(JLjava/lang/String;I)I

    .line 63
    .line 64
    .line 65
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 66
    goto :goto_0

    .line 67
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 70
    .line 71
    .line 72
    throw p1
.end method

.method public setWTNRemoteVideoCanvas(Ljava/lang/String;Lcom/ss/bytertc/engine/VideoCanvas;)I
    .locals 10

    .line 1
    const-string v0, "setWTNRemoteVideoCanvas...public stream id: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J
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
    const-string v2, "WTNStream"

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_1
    const-string p1, "native engine is invalid, setWTNRemoteVideoCanvas failed."

    .line 19
    .line 20
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 26
    .line 27
    .line 28
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return p1

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    move-object p1, v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    iget-wide v3, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 54
    .line 55
    iget-object v6, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderView:Landroid/view/View;

    .line 56
    .line 57
    iget v7, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderMode:I

    .line 58
    .line 59
    iget v8, p2, Lcom/ss/bytertc/engine/VideoCanvas;->backgroundColor:I

    .line 60
    .line 61
    iget-object p2, p2, Lcom/ss/bytertc/engine/VideoCanvas;->renderRotation:Lcom/ss/bytertc/engine/data/VideoRotation;

    .line 62
    .line 63
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoRotation;->value()I

    .line 64
    .line 65
    .line 66
    move-result v9

    .line 67
    move-object v5, p1

    .line 68
    invoke-static/range {v3 .. v9}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSetWTNRemoteVideoCanvas(JLjava/lang/String;Landroid/view/View;III)I

    .line 69
    .line 70
    .line 71
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 72
    goto :goto_0

    .line 73
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 74
    .line 75
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 76
    .line 77
    .line 78
    throw p1
.end method

.method public setWTNRemoteVideoSink(Ljava/lang/String;Lcom/ss/bytertc/engine/video/IVideoSink;Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;)I
    .locals 9

    .line 1
    const-string v0, "setWTNRemoteVideoSink...public stream id: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J
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
    const-string v2, "WTNStream"

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_1
    const-string p1, "native engine is invalid, setWTNRemoteVideoSink failed."

    .line 19
    .line 20
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 26
    .line 27
    .line 28
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 32
    .line 33
    .line 34
    return p1

    .line 35
    :catchall_0
    move-exception v0

    .line 36
    move-object p1, v0

    .line 37
    goto :goto_3

    .line 38
    :cond_0
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 39
    .line 40
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    if-eqz p2, :cond_1

    .line 54
    .line 55
    new-instance v0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;

    .line 56
    .line 57
    invoke-direct {v0, p2}, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;-><init>(Lcom/ss/bytertc/engine/video/IVideoSink;)V

    .line 58
    .line 59
    .line 60
    :goto_1
    move-object v4, v0

    .line 61
    goto :goto_2

    .line 62
    :cond_1
    const/4 v0, 0x0

    .line 63
    goto :goto_1

    .line 64
    :goto_2
    iget-wide v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 65
    .line 66
    iget-object p2, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->pixelFormat:Lcom/ss/bytertc/engine/data/VideoPixelFormat;

    .line 67
    .line 68
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/data/VideoPixelFormat;->value()I

    .line 69
    .line 70
    .line 71
    move-result v5

    .line 72
    iget-object p2, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->position:Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;

    .line 73
    .line 74
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/RemoteVideoSinkPosition;->getValue()I

    .line 75
    .line 76
    .line 77
    move-result v6

    .line 78
    iget-object p2, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->applyRotation:Lcom/ss/bytertc/engine/video/VideoApplyRotation;

    .line 79
    .line 80
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoApplyRotation;->getValue()I

    .line 81
    .line 82
    .line 83
    move-result v7

    .line 84
    iget-object p2, p3, Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;->mirrorType:Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;

    .line 85
    .line 86
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/video/VideoSinkMirrorType;->getValue()I

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    move-object v3, p1

    .line 91
    invoke-static/range {v1 .. v8}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSetWTNRemoteVideoSink(JLjava/lang/String;Lcom/ss/bytertc/engine/video/IVideoSink;IIII)I

    .line 92
    .line 93
    .line 94
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 95
    goto :goto_0

    .line 96
    :goto_3
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 97
    .line 98
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 99
    .line 100
    .line 101
    throw p1
.end method

.method public setWTNStreamEventHandler(Lcom/ss/bytertc/engine/IWTNStreamEventHandler;)I
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

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
    const-string p1, "WTNStream"

    .line 15
    .line 16
    const-string v0, "native WTNStream is invalid, setWTNStreamEventHandler failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    .line 21
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

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
    goto :goto_1

    .line 30
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/ref/WeakReference;

    .line 31
    .line 32
    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 33
    .line 34
    .line 35
    iput-object v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mWTNStreamEventHandler:Ljava/lang/ref/WeakReference;
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 36
    .line 37
    iget-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x0

    .line 42
    :try_start_2
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSetWTNStreamEventHandler(JLcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;)I

    .line 43
    .line 44
    .line 45
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    return p1

    .line 52
    :cond_1
    :try_start_3
    iget-object p1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeHandler:Lcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;

    .line 53
    .line 54
    invoke-static {v0, v1, p1}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSetWTNStreamEventHandler(JLcom/ss/bytertc/engine/handler/NativeWTNStreamEventHandler;)I

    .line 55
    .line 56
    .line 57
    move-result p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 58
    goto :goto_0

    .line 59
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 62
    .line 63
    .line 64
    throw p1
.end method

.method public subscribeWTNAudioStream(Ljava/lang/String;Z)I
    .locals 5

    .line 1
    const-string v0, "subscribeWTNAudioStream...public stream id: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J
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
    const-string v2, "WTNStream"

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_1
    const-string p1, "native WTNStream is invalid, subscribeWTNAudioStream failed."

    .line 19
    .line 20
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 26
    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", subscribe: "

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 56
    .line 57
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSubscribeWTNAudioStream(JLjava/lang/String;Z)I

    .line 58
    .line 59
    .line 60
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    return p1

    .line 67
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 70
    .line 71
    .line 72
    throw p1
.end method

.method public subscribeWTNVideoStream(Ljava/lang/String;Z)I
    .locals 5

    .line 1
    const-string v0, "subscribeWTNVideoStream...public stream id: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-wide v1, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J
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
    const-string v2, "WTNStream"

    .line 15
    .line 16
    if-nez v1, :cond_0

    .line 17
    .line 18
    :try_start_1
    const-string p1, "native WTNStream is invalid, subscribeWTNVideoStream failed."

    .line 19
    .line 20
    invoke-static {v2, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 24
    .line 25
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 26
    .line 27
    .line 28
    const/4 p0, -0x1

    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception p1

    .line 31
    goto :goto_0

    .line 32
    :cond_0
    :try_start_2
    new-instance v1, Ljava/lang/StringBuilder;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    const-string v0, ", subscribe: "

    .line 41
    .line 42
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 43
    .line 44
    .line 45
    invoke-virtual {v1, p2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    iget-wide v0, p0, Lcom/ss/bytertc/engine/WTNStream;->mNativeWTNStream:J

    .line 56
    .line 57
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeWTNStreamFunctions;->nativeSubscribeWTNVideoStream(JLjava/lang/String;Z)I

    .line 58
    .line 59
    .line 60
    move-result p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 61
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    return p1

    .line 67
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/WTNStream;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 70
    .line 71
    .line 72
    throw p1
.end method
