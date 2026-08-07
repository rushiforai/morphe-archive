.class public Lcom/ss/bytertc/engine/RTSRoomImpl;
.super Lcom/ss/bytertc/engine/RTSRoom;
.source "SourceFile"


# static fields
.field protected static final TAG:Ljava/lang/String; = "RTSRoom"


# instance fields
.field private final mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

.field private final mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

.field protected mNativeRtcRoom:J

.field private mNativeRtcRoomEventHandlerRts:J

.field private final mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

.field private mRoom:Ljava/lang/String;

.field private mRtcRoomEventHandlerRts:Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerRts;

.field private mRtcRoomHandlerRts:Lcom/ss/bytertc/engine/handler/IRTSRoomEventHandler;

.field private mUser:Ljava/lang/String;


# direct methods
.method public constructor <init>(Ljava/lang/String;J)V
    .locals 2

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/RTSRoom;-><init>()V

    .line 2
    .line 3
    .line 4
    const-wide/16 v0, 0x0

    .line 5
    .line 6
    iput-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 7
    .line 8
    iput-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoomEventHandlerRts:J

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mReadWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->readLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    iput-object v1, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock;->writeLock()Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    iput-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 28
    .line 29
    iput-wide p2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 30
    .line 31
    iput-object p1, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRoom:Ljava/lang/String;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public destroy()V
    .locals 6

    .line 1
    const-string v0, "Destroy "

    .line 2
    .line 3
    const-string v1, "RTSRoom"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long v0, v2, v4

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string v0, "native rtcroom is invalid, Destroy failed."

    .line 22
    .line 23
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    :try_start_1
    iput-wide v4, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 35
    .line 36
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 39
    .line 40
    .line 41
    invoke-static {v2, v3}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeDestroyRTSRoom(J)V

    .line 42
    .line 43
    .line 44
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoomEventHandlerRts:J

    .line 45
    .line 46
    cmp-long v2, v0, v4

    .line 47
    .line 48
    if-eqz v2, :cond_1

    .line 49
    .line 50
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeReleaseRTCRoomEventHandlerRts(J)V

    .line 51
    .line 52
    .line 53
    iput-wide v4, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoomEventHandlerRts:J

    .line 54
    .line 55
    :cond_1
    return-void

    .line 56
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniWriteLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;

    .line 57
    .line 58
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$WriteLock;->unlock()V

    .line 59
    .line 60
    .line 61
    throw v0
.end method

.method public getNativeHandle()J
    .locals 2

    .line 1
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public getRtcRoomHandlerRts()Lcom/ss/bytertc/engine/handler/IRTSRoomEventHandler;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRtcRoomHandlerRts:Lcom/ss/bytertc/engine/handler/IRTSRoomEventHandler;

    .line 2
    .line 3
    return-object p0
.end method

.method public getmRoom()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRoom:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public getmUser()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mUser:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public joinRTSRoom(Ljava/lang/String;Lcom/ss/bytertc/engine/UserInfo;)I
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "joinRoom with token: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ",room"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    iget-object v1, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRoom:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    const-string v1, " and uid: "

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    if-nez p2, :cond_0

    .line 27
    .line 28
    const-string v1, ""

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_0
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/UserInfo;->getUid()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v1

    .line 35
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v0

    .line 42
    const-string v1, "RTSRoom"

    .line 43
    .line 44
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 50
    .line 51
    .line 52
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 53
    .line 54
    const-wide/16 v4, 0x0

    .line 55
    .line 56
    cmp-long v0, v2, v4

    .line 57
    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    const-string p1, "native room is invalid, joinRoom failed."

    .line 61
    .line 62
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 66
    .line 67
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 68
    .line 69
    .line 70
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 71
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 74
    .line 75
    .line 76
    return p1

    .line 77
    :catchall_0
    move-exception p1

    .line 78
    goto :goto_2

    .line 79
    :cond_1
    if-nez p2, :cond_2

    .line 80
    .line 81
    :try_start_1
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 82
    .line 83
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    goto :goto_1

    .line 88
    :cond_2
    if-nez p1, :cond_3

    .line 89
    .line 90
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_PARAMETER_ERR:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    goto :goto_1

    .line 97
    :cond_3
    invoke-virtual {p2}, Lcom/ss/bytertc/engine/UserInfo;->getUid()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mUser:Ljava/lang/String;

    .line 102
    .line 103
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 104
    .line 105
    invoke-static {v0, v1, p1, p2}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeJoinRTSRoom(JLjava/lang/String;Lcom/ss/bytertc/engine/UserInfo;)I

    .line 106
    .line 107
    .line 108
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 109
    goto :goto_1

    .line 110
    :goto_2
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 111
    .line 112
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 113
    .line 114
    .line 115
    throw p1
.end method

.method public leaveRoom()I
    .locals 7

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    const-string v1, "leaveChannel"

    .line 4
    .line 5
    const-string v2, "RTSRoom"

    .line 6
    .line 7
    invoke-static {v2, v1}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iget-object v1, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 11
    .line 12
    invoke-virtual {v1}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 13
    .line 14
    .line 15
    :try_start_0
    iget-wide v3, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 16
    .line 17
    const-wide/16 v5, 0x0

    .line 18
    .line 19
    cmp-long v1, v3, v5

    .line 20
    .line 21
    if-nez v1, :cond_0

    .line 22
    .line 23
    const-string v0, "native rtcroom is invalid, leaveChannel failed."

    .line 24
    .line 25
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    sget-object v0, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 31
    .line 32
    .line 33
    move-result v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 35
    .line 36
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :catchall_0
    move-exception v0

    .line 41
    goto :goto_1

    .line 42
    :cond_0
    :try_start_1
    iput-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRoom:Ljava/lang/String;

    .line 43
    .line 44
    iput-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mUser:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {v3, v4}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeLeaveRTSRoom(J)I

    .line 47
    .line 48
    .line 49
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 50
    goto :goto_0

    .line 51
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 54
    .line 55
    .line 56
    throw v0
.end method

.method public sendRoomBinaryMessage([B)J
    .locals 6

    .line 1
    const-string v0, "SendRoomBinaryMessage "

    .line 2
    .line 3
    const-string v1, "RTSRoom"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long v0, v2, v4

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string p1, "native rtcroom is invalid, SendRoomBinaryMessage failed."

    .line 22
    .line 23
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    const-wide/16 p0, -0x1

    .line 32
    .line 33
    return-wide p0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    :try_start_1
    invoke-static {v2, v3, p1}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeSendRTSRoomBinaryMessage(J[B)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    return-wide v0

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    throw p1
.end method

.method public sendRoomMessage(Ljava/lang/String;)J
    .locals 6

    .line 1
    const-string v0, "SendRoomMessage "

    .line 2
    .line 3
    const-string v1, "RTSRoom"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 11
    .line 12
    .line 13
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 14
    .line 15
    const-wide/16 v4, 0x0

    .line 16
    .line 17
    cmp-long v0, v2, v4

    .line 18
    .line 19
    if-nez v0, :cond_0

    .line 20
    .line 21
    const-string p1, "native rtcroom is invalid, SendRoomMessage failed."

    .line 22
    .line 23
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 27
    .line 28
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 29
    .line 30
    .line 31
    const-wide/16 p0, -0x1

    .line 32
    .line 33
    return-wide p0

    .line 34
    :catchall_0
    move-exception p1

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    :try_start_1
    invoke-static {v2, v3, p1}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeSendRTSRoomMessage(JLjava/lang/String;)J

    .line 37
    .line 38
    .line 39
    move-result-wide v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 41
    .line 42
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 43
    .line 44
    .line 45
    return-wide v0

    .line 46
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    throw p1
.end method

.method public sendUserBinaryMessage(Ljava/lang/String;[BLcom/ss/bytertc/engine/type/MessageConfig;)J
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SendUserBinaryMessage. uid : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", message length:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    array-length v1, p2

    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-string v1, "RTSRoom"

    .line 25
    .line 26
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 30
    .line 31
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 32
    .line 33
    .line 34
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 35
    .line 36
    const-wide/16 v4, 0x0

    .line 37
    .line 38
    cmp-long v0, v2, v4

    .line 39
    .line 40
    if-nez v0, :cond_0

    .line 41
    .line 42
    const-string p1, "native rtcroom is invalid, SendUserBinaryMessage failed."

    .line 43
    .line 44
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 50
    .line 51
    .line 52
    const-wide/16 p0, -0x1

    .line 53
    .line 54
    return-wide p0

    .line 55
    :catchall_0
    move-exception p1

    .line 56
    goto :goto_0

    .line 57
    :cond_0
    :try_start_1
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/type/MessageConfig;->value()I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    invoke-static {v2, v3, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeSendRTSUserBinaryMessage(JLjava/lang/String;[BI)J

    .line 62
    .line 63
    .line 64
    move-result-wide p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 65
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 68
    .line 69
    .line 70
    return-wide p1

    .line 71
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 72
    .line 73
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 74
    .line 75
    .line 76
    throw p1
.end method

.method public sendUserMessage(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/MessageConfig;)J
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "SendUserMessage. uid : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", message"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RTSRoom"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 29
    .line 30
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 31
    .line 32
    .line 33
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 34
    .line 35
    const-wide/16 v4, 0x0

    .line 36
    .line 37
    cmp-long v0, v2, v4

    .line 38
    .line 39
    if-nez v0, :cond_0

    .line 40
    .line 41
    const-string p1, "native rtcroom is invalid, SendUserMessage failed."

    .line 42
    .line 43
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 47
    .line 48
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 49
    .line 50
    .line 51
    const-wide/16 p0, -0x1

    .line 52
    .line 53
    return-wide p0

    .line 54
    :catchall_0
    move-exception p1

    .line 55
    goto :goto_0

    .line 56
    :cond_0
    :try_start_1
    invoke-virtual {p3}, Lcom/ss/bytertc/engine/type/MessageConfig;->value()I

    .line 57
    .line 58
    .line 59
    move-result p3

    .line 60
    invoke-static {v2, v3, p1, p2, p3}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeSendRTSUserMessage(JLjava/lang/String;Ljava/lang/String;I)J

    .line 61
    .line 62
    .line 63
    move-result-wide p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 67
    .line 68
    .line 69
    return-wide p1

    .line 70
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 73
    .line 74
    .line 75
    throw p1
.end method

.method public setRTSRoomEventHandler(Lcom/ss/bytertc/engine/handler/IRTSRoomEventHandler;)I
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 4
    .line 5
    .line 6
    :try_start_0
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

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
    const-string p1, "RTSRoom"

    .line 15
    .line 16
    const-string v0, "native room is invalid, setRTCRoomEventHandler failed."

    .line 17
    .line 18
    invoke-static {p1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 24
    .line 25
    .line 26
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 28
    .line 29
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 30
    .line 31
    .line 32
    return p1

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    :try_start_1
    iput-object p1, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRtcRoomHandlerRts:Lcom/ss/bytertc/engine/handler/IRTSRoomEventHandler;

    .line 36
    .line 37
    new-instance p1, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerRts;

    .line 38
    .line 39
    invoke-direct {p1, p0}, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerRts;-><init>(Lcom/ss/bytertc/engine/RTSRoomImpl;)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mRtcRoomEventHandlerRts:Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerRts;

    .line 43
    .line 44
    iget-wide v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoomEventHandlerRts:J

    .line 45
    .line 46
    iget-wide v4, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 47
    .line 48
    invoke-static {v4, v5, p1}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeSetRTCRoomEventHandlerRts(JLcom/ss/bytertc/engine/handler/RTCRoomEventHandlerRts;)J

    .line 49
    .line 50
    .line 51
    move-result-wide v4

    .line 52
    iput-wide v4, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoomEventHandlerRts:J

    .line 53
    .line 54
    cmp-long p1, v0, v2

    .line 55
    .line 56
    if-eqz p1, :cond_1

    .line 57
    .line 58
    invoke-static {v0, v1}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeReleaseRTCRoomEventHandlerRts(J)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 59
    .line 60
    .line 61
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 62
    .line 63
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 64
    .line 65
    .line 66
    const/4 p0, 0x0

    .line 67
    return p0

    .line 68
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 69
    .line 70
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 71
    .line 72
    .line 73
    throw p1
.end method

.method public updateToken(Ljava/lang/String;)I
    .locals 6

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "updateToken. token : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RTSRoom"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->lock()V

    .line 23
    .line 24
    .line 25
    :try_start_0
    iget-wide v2, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mNativeRtcRoom:J

    .line 26
    .line 27
    const-wide/16 v4, 0x0

    .line 28
    .line 29
    cmp-long v0, v2, v4

    .line 30
    .line 31
    if-nez v0, :cond_0

    .line 32
    .line 33
    const-string p1, "native rtcroom is invalid, updateToken failed."

    .line 34
    .line 35
    invoke-static {v1, p1}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    sget-object p1, Lcom/ss/bytertc/engine/data/ReturnStatus;->RETURN_STATUS_NATIVE_IN_VALID:Lcom/ss/bytertc/engine/data/ReturnStatus;

    .line 39
    .line 40
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/ReturnStatus;->value()I

    .line 41
    .line 42
    .line 43
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    :goto_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 47
    .line 48
    .line 49
    return p1

    .line 50
    :catchall_0
    move-exception p1

    .line 51
    goto :goto_1

    .line 52
    :cond_0
    :try_start_1
    invoke-static {v2, v3, p1}, Lcom/ss/bytertc/engine/NativeRTCRoomFunctions;->nativeUpdateRTSToken(JLjava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 56
    goto :goto_0

    .line 57
    :goto_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/RTSRoomImpl;->mJniReadLock:Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;

    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/util/concurrent/locks/ReentrantReadWriteLock$ReadLock;->unlock()V

    .line 60
    .line 61
    .line 62
    throw p1
.end method
