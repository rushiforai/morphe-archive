.class public Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtcRoomEventHandler"


# instance fields
.field private mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

.field private mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/RTCRoomImpl;Lcom/ss/bytertc/engine/GameRoomImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 5
    .line 6
    iput-object p2, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 7
    .line 8
    return-void
.end method

.method public static allocateDirectByteBuffer(I)Ljava/nio/ByteBuffer;
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-static {p0}, Ljava/nio/ByteBuffer;->allocateDirect(I)Ljava/nio/ByteBuffer;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method


# virtual methods
.method public onAVSyncEvent(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/AVSyncEvent;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onAVSyncEvent..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAVSyncEvent(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/AVSyncEvent;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAVSyncEvent(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/AVSyncEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onAVSyncEvent callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onAVSyncStateChange(Lcom/ss/bytertc/engine/data/AVSyncState;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onAVSyncStateChange: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcRoomEventHandler"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAVSyncStateChange(Lcom/ss/bytertc/engine/data/AVSyncState;)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAVSyncStateChange(Lcom/ss/bytertc/engine/data/AVSyncState;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v0, "onAVSyncStateChange callback catch exception.\n"

    .line 49
    .line 50
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onAudioPublishStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onAudioPublishStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onAudioStreamBanned(Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onAudioStreamBanned, user: "

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
    const-string v1, ", banned: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const-string v1, "true"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v1, "false"

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "RtcRoomEventHandler"

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAudioStreamBanned(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAudioStreamBanned(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void

    .line 61
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string p2, "onAudioStreamBanned callback catch exception.\n"

    .line 64
    .line 65
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onAudioSubscribeStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onAudioSubscribeStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onForwardStreamEvent([Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onForwardStreamEvent"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onForwardStreamEvent([Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onForwardStreamEvent([Lcom/ss/bytertc/engine/data/ForwardStreamEventInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v0, "onForwardStreamEvent callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onForwardStreamStateChanged([Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "OnForwardStreamStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onForwardStreamStateChanged([Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onForwardStreamStateChanged([Lcom/ss/bytertc/engine/data/ForwardStreamStateInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v0, "onForwardStreamStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onLeaveRoom(Lcom/ss/bytertc/engine/InternalRTCStats;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onLeaveRoom..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/RTCRoomStats;-><init>(Lcom/ss/bytertc/engine/InternalRTCStats;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onLeaveRoom(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/RTCRoomStats;-><init>(Lcom/ss/bytertc/engine/InternalRTCStats;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onLeaveRoom(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void

    .line 44
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v0, "onLeaveRoom callback catch exception.\n"

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public onLocalStreamStats(Lcom/ss/bytertc/engine/InternalLocalStreamStats;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onLocalStreamStats..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/ss/bytertc/engine/type/LocalStreamStats;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/LocalStreamStats;-><init>(Lcom/ss/bytertc/engine/InternalLocalStreamStats;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onLocalStreamStats(Lcom/ss/bytertc/engine/type/LocalStreamStats;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Lcom/ss/bytertc/engine/type/LocalStreamStats;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/LocalStreamStats;-><init>(Lcom/ss/bytertc/engine/InternalLocalStreamStats;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onLocalStreamStats(Lcom/ss/bytertc/engine/type/LocalStreamStats;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void

    .line 44
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v0, "onLocalStreamStats callback catch exception.\n"

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public onNetworkQuality(Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;[Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;)V
    .locals 6
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "Local onNetworkQuality, uid: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->uid:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    const-string v1, ", info: "

    .line 14
    .line 15
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 16
    .line 17
    .line 18
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->toString()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v2, "RtcRoomEventHandler"

    .line 30
    .line 31
    invoke-static {v2, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 35
    .line 36
    if-eqz v0, :cond_0

    .line 37
    .line 38
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    goto :goto_0

    .line 43
    :catch_0
    move-exception p0

    .line 44
    goto :goto_2

    .line 45
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 46
    .line 47
    if-eqz p0, :cond_1

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    goto :goto_0

    .line 54
    :cond_1
    const/4 p0, 0x0

    .line 55
    :goto_0
    if-eqz p0, :cond_3

    .line 56
    .line 57
    array-length v0, p2

    .line 58
    new-array v0, v0, [Lcom/ss/bytertc/engine/type/NetworkQualityStats;

    .line 59
    .line 60
    const/4 v3, 0x0

    .line 61
    :goto_1
    array-length v4, p2

    .line 62
    if-ge v3, v4, :cond_2

    .line 63
    .line 64
    new-instance v4, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 67
    .line 68
    .line 69
    const-string v5, "Remote onNetworkQuality, uid: "

    .line 70
    .line 71
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    aget-object v5, p2, v3

    .line 75
    .line 76
    iget-object v5, v5, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->uid:Ljava/lang/String;

    .line 77
    .line 78
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    aget-object v5, p2, v3

    .line 85
    .line 86
    invoke-virtual {v5}, Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v5

    .line 90
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 91
    .line 92
    .line 93
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v4

    .line 97
    invoke-static {v2, v4}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 98
    .line 99
    .line 100
    new-instance v4, Lcom/ss/bytertc/engine/type/NetworkQualityStats;

    .line 101
    .line 102
    aget-object v5, p2, v3

    .line 103
    .line 104
    invoke-direct {v4, v5}, Lcom/ss/bytertc/engine/type/NetworkQualityStats;-><init>(Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;)V

    .line 105
    .line 106
    .line 107
    aput-object v4, v0, v3

    .line 108
    .line 109
    add-int/lit8 v3, v3, 0x1

    .line 110
    .line 111
    goto :goto_1

    .line 112
    :cond_2
    new-instance p2, Lcom/ss/bytertc/engine/type/NetworkQualityStats;

    .line 113
    .line 114
    invoke-direct {p2, p1}, Lcom/ss/bytertc/engine/type/NetworkQualityStats;-><init>(Lcom/ss/bytertc/engine/InternalNetworkQualityInfo;)V

    .line 115
    .line 116
    .line 117
    invoke-virtual {p0, p2, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onNetworkQuality(Lcom/ss/bytertc/engine/type/NetworkQualityStats;[Lcom/ss/bytertc/engine/type/NetworkQualityStats;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 118
    .line 119
    .line 120
    :cond_3
    return-void

    .line 121
    :goto_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 122
    .line 123
    const-string p2, "onNetworkQuality callback catch exception.\n"

    .line 124
    .line 125
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 126
    .line 127
    .line 128
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p0

    .line 132
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 133
    .line 134
    .line 135
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 136
    .line 137
    .line 138
    move-result-object p0

    .line 139
    invoke-static {v2, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-void
.end method

.method public onPublishPrivilegeTokenWillExpire()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onPublishPrivilegeTokenWillExpire"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onPublishPrivilegeTokenWillExpire()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onPublishPrivilegeTokenWillExpire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "onPublishPrivilegeTokenWillExpire callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onRemoteStreamStats(Lcom/ss/bytertc/engine/InternalRemoteStreamStats;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onRemoteStreamStats..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/RemoteStreamStats;-><init>(Lcom/ss/bytertc/engine/InternalRemoteStreamStats;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRemoteStreamStats(Lcom/ss/bytertc/engine/type/RemoteStreamStats;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Lcom/ss/bytertc/engine/type/RemoteStreamStats;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/RemoteStreamStats;-><init>(Lcom/ss/bytertc/engine/InternalRemoteStreamStats;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRemoteStreamStats(Lcom/ss/bytertc/engine/type/RemoteStreamStats;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void

    .line 44
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v0, "onRemoteStreamStats callback catch exception.\n"

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public onRoomBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;J)V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRoomBinaryMessageReceived, length: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcRoomEventHandler"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 25
    .line 26
    if-eqz v0, :cond_0

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    invoke-virtual {v0, p1, v2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomBinaryMessageReceived(JLjava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    invoke-virtual {v0, p1, v2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 67
    .line 68
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomBinaryMessageReceived(JLjava/lang/String;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 73
    .line 74
    .line 75
    :cond_1
    return-void

    .line 76
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 77
    .line 78
    const-string p2, "onRoomBinaryMessageReceived callback catch exception.\n"

    .line 79
    .line 80
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 91
    .line 92
    .line 93
    move-result-object p0

    .line 94
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 95
    .line 96
    .line 97
    return-void
.end method

.method public onRoomEvent(Ljava/lang/String;Ljava/lang/String;ILcom/ss/bytertc/engine/InternalRoomEventInfo;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onRoomEvent..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/RoomEvent;->valueOf(I)Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomEventInfo;

    .line 21
    .line 22
    invoke-direct {v0, p4}, Lcom/ss/bytertc/engine/type/RoomEventInfo;-><init>(Lcom/ss/bytertc/engine/InternalRoomEventInfo;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomEvent(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/RoomEvent;Lcom/ss/bytertc/engine/type/RoomEventInfo;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :catch_0
    move-exception p0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 36
    .line 37
    .line 38
    move-result-object p0

    .line 39
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/RoomEvent;->valueOf(I)Lcom/ss/bytertc/engine/type/RoomEvent;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    new-instance v0, Lcom/ss/bytertc/engine/type/RoomEventInfo;

    .line 44
    .line 45
    invoke-direct {v0, p4}, Lcom/ss/bytertc/engine/type/RoomEventInfo;-><init>(Lcom/ss/bytertc/engine/InternalRoomEventInfo;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0, p1, p2, p3, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomEvent(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/RoomEvent;Lcom/ss/bytertc/engine/type/RoomEventInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 49
    .line 50
    .line 51
    :cond_1
    return-void

    .line 52
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 53
    .line 54
    const-string p2, "onRtcStats callback catch exception.\n"

    .line 55
    .line 56
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 71
    .line 72
    .line 73
    return-void
.end method

.method public onRoomExtraInfoUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    .locals 8
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRoomExtraInfoUpdate , key:"

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
    const-string v1, ",value:"

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
    const-string v1, "RtcRoomEventHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual/range {p0 .. p5}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomExtraInfoUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception v0

    .line 41
    move-object p0, v0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 44
    .line 45
    if-eqz p0, :cond_1

    .line 46
    .line 47
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    move-object v3, p1

    .line 52
    move-object v4, p2

    .line 53
    move-object v5, p3

    .line 54
    move-wide v6, p4

    .line 55
    invoke-virtual/range {v2 .. v7}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomExtraInfoUpdate(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;J)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 56
    .line 57
    .line 58
    :cond_1
    return-void

    .line 59
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string p2, "onRoomExtraInfoUpdate callback catch exception.\n"

    .line 62
    .line 63
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object p0

    .line 70
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 78
    .line 79
    .line 80
    return-void
.end method

.method public onRoomMessageReceived(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRoomMessageReceived: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcRoomEventHandler"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-virtual {v0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomMessageReceived(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 32
    .line 33
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomMessageReceived(JLjava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :catch_0
    move-exception p0

    .line 42
    goto :goto_0

    .line 43
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 44
    .line 45
    if-eqz v0, :cond_1

    .line 46
    .line 47
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-virtual {v0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomMessageReceived(Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 55
    .line 56
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomMessageReceived(JLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void

    .line 64
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 65
    .line 66
    const-string p2, "onRoomMessageReceived callback catch exception.\n"

    .line 67
    .line 68
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 76
    .line 77
    .line 78
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object p0

    .line 82
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public onRoomMessageSendResult(JI)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onRoomMessageSendResult..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomMessageSendResult(JI)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomMessageSendResult(JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onRoomMessageSendResult callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onRoomStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onRoomStateChanged..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onRoomStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onRoomStateChangedWithReason(Ljava/lang/String;Ljava/lang/String;II)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onRoomStateChangedWithReason..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/RoomState;->valueOf(I)Lcom/ss/bytertc/engine/type/RoomState;

    .line 17
    .line 18
    .line 19
    move-result-object p3

    .line 20
    invoke-static {p4}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->valueOf(I)Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 21
    .line 22
    .line 23
    move-result-object p4

    .line 24
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomStateChangedWithReason(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/RoomState;Lcom/ss/bytertc/engine/type/RoomStateChangeReason;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :catch_0
    move-exception p0

    .line 29
    goto :goto_0

    .line 30
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 31
    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/RoomState;->valueOf(I)Lcom/ss/bytertc/engine/type/RoomState;

    .line 39
    .line 40
    .line 41
    move-result-object p3

    .line 42
    invoke-static {p4}, Lcom/ss/bytertc/engine/type/RoomStateChangeReason;->valueOf(I)Lcom/ss/bytertc/engine/type/RoomStateChangeReason;

    .line 43
    .line 44
    .line 45
    move-result-object p4

    .line 46
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomStateChangedWithReason(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/type/RoomState;Lcom/ss/bytertc/engine/type/RoomStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    .line 49
    :cond_1
    return-void

    .line 50
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 51
    .line 52
    const-string p2, "onRoomStateChanged callback catch exception.\n"

    .line 53
    .line 54
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 62
    .line 63
    .line 64
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public onRoomStats(Lcom/ss/bytertc/engine/InternalRTCStats;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onRtcStats..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    new-instance v0, Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 17
    .line 18
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/RTCRoomStats;-><init>(Lcom/ss/bytertc/engine/InternalRTCStats;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomStats(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :catch_0
    move-exception p0

    .line 26
    goto :goto_0

    .line 27
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 28
    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    new-instance v0, Lcom/ss/bytertc/engine/type/RTCRoomStats;

    .line 36
    .line 37
    invoke-direct {v0, p1}, Lcom/ss/bytertc/engine/type/RTCRoomStats;-><init>(Lcom/ss/bytertc/engine/InternalRTCStats;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomStats(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void

    .line 44
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    const-string v0, "onRtcStats callback catch exception.\n"

    .line 47
    .line 48
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 63
    .line 64
    .line 65
    return-void
.end method

.method public onRoomWarning(I)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onRoomWarning, warnNum: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcRoomEventHandler"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomWarning(I)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :catch_0
    move-exception p0

    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 35
    .line 36
    if-eqz p0, :cond_1

    .line 37
    .line 38
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onRoomWarning(I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void

    .line 46
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 47
    .line 48
    const-string v0, "onRoomWarning callback catch exception.\n"

    .line 49
    .line 50
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void
.end method

.method public onScreenAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onScreenAudioPublishStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onScreenAudioPublishStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onScreenAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onScreenAudioSubscribeStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onScreenAudioSubscribeStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onScreenVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onScreenVideoPublishStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onScreenVideoPublishStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onScreenVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onScreenVideoSubscribeStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onScreenVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onScreenVideoSubscribeStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onSetRoomExtraInfoResult(JI)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onSetRoomExtraInfoResult,result:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "RtcRoomEventHandler"

    .line 16
    .line 17
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->fromId(I)Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 29
    .line 30
    .line 31
    move-result-object p3

    .line 32
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSetRoomExtraInfoResult(JLcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;)V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :catch_0
    move-exception p0

    .line 37
    goto :goto_0

    .line 38
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 39
    .line 40
    if-eqz p0, :cond_1

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 43
    .line 44
    .line 45
    move-result-object p0

    .line 46
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;->fromId(I)Lcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;

    .line 47
    .line 48
    .line 49
    move-result-object p3

    .line 50
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSetRoomExtraInfoResult(JLcom/ss/bytertc/engine/type/SetRoomExtraInfoResult;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string p2, "onSetRoomExtraInfoResult callback catch exception.\n"

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onStreamAdd(Lcom/ss/bytertc/engine/RTCStream;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onStreamAdd..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamAdd(Lcom/ss/bytertc/engine/RTCStream;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamAdd(Lcom/ss/bytertc/engine/RTCStream;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v0, "onStreamAdd callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onStreamPublishSuccess(Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onStreamPublishSuccess..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamPublishSuccess(Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamPublishSuccess(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onStreamPublishSuccess callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onStreamRemove(Lcom/ss/bytertc/engine/RTCStream;I)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onStreamRemove...uid: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/ss/bytertc/engine/RTCStream;->userId:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "RtcRoomEventHandler"

    .line 18
    .line 19
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 23
    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    aget-object p2, v0, p2

    .line 35
    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamRemove(Lcom/ss/bytertc/engine/RTCStream;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    aget-object p2, v0, p2

    .line 55
    .line 56
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamRemove(Lcom/ss/bytertc/engine/RTCStream;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 57
    .line 58
    .line 59
    :cond_1
    return-void

    .line 60
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 61
    .line 62
    const-string p2, "onStreamRemove callback catch exception.\n"

    .line 63
    .line 64
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0

    .line 78
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public onStreamStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onStreamStateChanged..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onStreamStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onStreamStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onSubscribePrivilegeTokenWillExpire()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onSubscribePrivilegeTokenWillExpire"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubscribePrivilegeTokenWillExpire()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubscribePrivilegeTokenWillExpire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "onSubscribePrivilegeTokenWillExpire callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onSubtitleMessageReceived([Lcom/ss/bytertc/engine/type/SubtitleMessage;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onSubtitleMessageReceived, subtitles length: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    array-length v1, p1

    .line 9
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 10
    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "RtcRoomEventHandler"

    .line 17
    .line 18
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 22
    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubtitleMessageReceived([Lcom/ss/bytertc/engine/type/SubtitleMessage;)V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :catch_0
    move-exception p0

    .line 34
    goto :goto_0

    .line 35
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 36
    .line 37
    if-eqz p0, :cond_1

    .line 38
    .line 39
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubtitleMessageReceived([Lcom/ss/bytertc/engine/type/SubtitleMessage;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 44
    .line 45
    .line 46
    :cond_1
    return-void

    .line 47
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 48
    .line 49
    const-string v0, "onSubtitleMessageReceived callback catch exception.\n"

    .line 50
    .line 51
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    return-void
.end method

.method public onSubtitleStateChanged(IILjava/lang/String;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onSubtitleStateChanged, state: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", errorCode: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", errorMessage: "

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RtcRoomEventHandler"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p1}, Lcom/ss/bytertc/engine/type/SubtitleState;->fromId(I)Lcom/ss/bytertc/engine/type/SubtitleState;

    .line 45
    .line 46
    .line 47
    move-result-object p1

    .line 48
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/SubtitleErrorCode;->fromId(I)Lcom/ss/bytertc/engine/type/SubtitleErrorCode;

    .line 49
    .line 50
    .line 51
    move-result-object p2

    .line 52
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubtitleStateChanged(Lcom/ss/bytertc/engine/type/SubtitleState;Lcom/ss/bytertc/engine/type/SubtitleErrorCode;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :catch_0
    move-exception p0

    .line 57
    goto :goto_0

    .line 58
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 59
    .line 60
    if-eqz p0, :cond_1

    .line 61
    .line 62
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 63
    .line 64
    .line 65
    move-result-object p0

    .line 66
    invoke-static {p1}, Lcom/ss/bytertc/engine/type/SubtitleState;->fromId(I)Lcom/ss/bytertc/engine/type/SubtitleState;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/SubtitleErrorCode;->fromId(I)Lcom/ss/bytertc/engine/type/SubtitleErrorCode;

    .line 71
    .line 72
    .line 73
    move-result-object p2

    .line 74
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onSubtitleStateChanged(Lcom/ss/bytertc/engine/type/SubtitleState;Lcom/ss/bytertc/engine/type/SubtitleErrorCode;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 75
    .line 76
    .line 77
    :cond_1
    return-void

    .line 78
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 79
    .line 80
    const-string p2, "onSubtitleStateChanged callback catch exception.\n"

    .line 81
    .line 82
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 93
    .line 94
    .line 95
    move-result-object p0

    .line 96
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 97
    .line 98
    .line 99
    return-void
.end method

.method public onTokenWillExpire()V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onTokenWillExpire"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onTokenWillExpire()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onTokenWillExpire()V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance v0, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string v2, "onTokenWillExpire callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onUserBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;J)V
    .locals 3
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserBinaryMessageReceived: uid:"

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
    const-string v1, "binary message length"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p2}, Ljava/nio/Buffer;->capacity()I

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const-string v1, "RtcRoomEventHandler"

    .line 28
    .line 29
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 33
    .line 34
    if-eqz v0, :cond_0

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 41
    .line 42
    .line 43
    move-result-object v2

    .line 44
    invoke-virtual {v0, p1, v2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 48
    .line 49
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserBinaryMessageReceived(JLjava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :catch_0
    move-exception p0

    .line 58
    goto :goto_0

    .line 59
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 60
    .line 61
    if-eqz v0, :cond_1

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    invoke-virtual {p2}, Ljava/nio/ByteBuffer;->duplicate()Ljava/nio/ByteBuffer;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v0, p1, v2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 75
    .line 76
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserBinaryMessageReceived(JLjava/lang/String;Ljava/nio/ByteBuffer;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 81
    .line 82
    .line 83
    :cond_1
    return-void

    .line 84
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 85
    .line 86
    const-string p2, "onUserBinaryMessageReceived callback catch exception.\n"

    .line 87
    .line 88
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object p0

    .line 95
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object p0

    .line 102
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onUserJoined(Lcom/ss/bytertc/engine/UserInfo;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserJoined... uid: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UserInfo;->getUid()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, ", extraInfo: "

    .line 16
    .line 17
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/UserInfo;->getExtraInfo()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RtcRoomEventHandler"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserJoined(Lcom/ss/bytertc/engine/UserInfo;)V

    .line 45
    .line 46
    .line 47
    return-void

    .line 48
    :catch_0
    move-exception p0

    .line 49
    goto :goto_0

    .line 50
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 51
    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0, p1}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserJoined(Lcom/ss/bytertc/engine/UserInfo;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void

    .line 62
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string v0, "onUserJoined callback catch exception.\n"

    .line 65
    .line 66
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onUserLeave(Ljava/lang/String;I)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserLeave... uid: "

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
    const-string v1, ", reason: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RtcRoomEventHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserLeave(Ljava/lang/String;I)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserLeave(Ljava/lang/String;I)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string p2, "onUserLeave callback catch exception.\n"

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onUserMessageReceived(Ljava/lang/String;Ljava/lang/String;J)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserMessageReceived: uid:"

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
    const-string v1, "message"

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
    const-string v1, "RtcRoomEventHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    invoke-virtual {v0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserMessageReceived(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserMessageReceived(JLjava/lang/String;Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    return-void

    .line 49
    :catch_0
    move-exception p0

    .line 50
    goto :goto_0

    .line 51
    :cond_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    invoke-virtual {v0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserMessageReceived(Ljava/lang/String;Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-virtual {p0, p3, p4, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserMessageReceived(JLjava/lang/String;Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 69
    .line 70
    .line 71
    :cond_1
    return-void

    .line 72
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 73
    .line 74
    const-string p2, "onUserMessageReceived callback catch exception.\n"

    .line 75
    .line 76
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 91
    .line 92
    .line 93
    return-void
.end method

.method public onUserMessageSendResult(JI)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onUserMessageSendResult..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserMessageSendResult(JI)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserMessageSendResult(JI)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onUserMessageSendResult callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onUserPublishScreen(Ljava/lang/String;I)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserPublishScreen... uid: "

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
    const-string v1, ", type: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RtcRoomEventHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishScreen(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishScreen(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void

    .line 62
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p2, "onUserPublishScreen callback catch exception.\n"

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onUserPublishScreenAudio(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onUserPublishScreenAudio"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishScreenAudio(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishScreenAudio(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onUserPublishScreenAudio callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onUserPublishScreenVideo(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onUserPublishScreenVideo"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishScreenVideo(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishScreenVideo(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onUserPublishScreenVideo callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onUserPublishStream(Ljava/lang/String;I)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserPublishStream... uid: "

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
    const-string v1, ", type: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RtcRoomEventHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 37
    .line 38
    .line 39
    move-result-object p2

    .line 40
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStream(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;)V

    .line 41
    .line 42
    .line 43
    return-void

    .line 44
    :catch_0
    move-exception p0

    .line 45
    goto :goto_0

    .line 46
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 47
    .line 48
    if-eqz p0, :cond_1

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStream(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 59
    .line 60
    .line 61
    :cond_1
    return-void

    .line 62
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 63
    .line 64
    const-string p2, "onUserPublishStream callback catch exception.\n"

    .line 65
    .line 66
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    return-void
.end method

.method public onUserPublishStreamAudio(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onUserPublishStreamAudio"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStreamAudio(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStreamAudio(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onUserPublishStreamAudio callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onUserPublishStreamVideo"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onUserPublishStreamVideo callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onUserUnpublishScreen(Ljava/lang/String;II)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserUnPublishScreen... uid: "

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
    const-string v1, ", type: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", reasen:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RtcRoomEventHandler"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    aget-object p3, v0, p3

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserUnpublishScreen(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception p0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    aget-object p3, v0, p3

    .line 77
    .line 78
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserUnpublishScreen(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void

    .line 82
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string p2, "onUserUnPublishScreen callback catch exception.\n"

    .line 85
    .line 86
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public onUserUnpublishStream(Ljava/lang/String;II)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserUnPublishStream... uid: "

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
    const-string v1, ", type: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    const-string v1, ", reasen:"

    .line 20
    .line 21
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "RtcRoomEventHandler"

    .line 32
    .line 33
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 45
    .line 46
    .line 47
    move-result-object p2

    .line 48
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    aget-object p3, v0, p3

    .line 53
    .line 54
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserUnpublishStream(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V

    .line 55
    .line 56
    .line 57
    return-void

    .line 58
    :catch_0
    move-exception p0

    .line 59
    goto :goto_0

    .line 60
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 61
    .line 62
    if-eqz p0, :cond_1

    .line 63
    .line 64
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    aget-object p3, v0, p3

    .line 77
    .line 78
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserUnpublishStream(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 79
    .line 80
    .line 81
    :cond_1
    return-void

    .line 82
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string p2, "onUserUnPublishStream callback catch exception.\n"

    .line 85
    .line 86
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object p0

    .line 100
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 101
    .line 102
    .line 103
    return-void
.end method

.method public onUserVisibilityChanged(ZLcom/ss/bytertc/engine/type/UserVisibilityChangeError;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserVisibilityChanged, currentUserVisibility:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, ", errorCode:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    const-string v1, "RtcRoomEventHandler"

    .line 24
    .line 25
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 29
    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserVisibilityChanged(ZLcom/ss/bytertc/engine/type/UserVisibilityChangeError;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catch_0
    move-exception p0

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 43
    .line 44
    if-eqz p0, :cond_1

    .line 45
    .line 46
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserVisibilityChanged(ZLcom/ss/bytertc/engine/type/UserVisibilityChangeError;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void

    .line 54
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 55
    .line 56
    const-string p2, "onUserVisibilityChanged callback catch exception.\n"

    .line 57
    .line 58
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 66
    .line 67
    .line 68
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public onVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onVideoPublishStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onVideoPublishStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public onVideoStreamBanned(Ljava/lang/String;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onVideoStreamBanned, user: "

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
    const-string v1, ", banned: "

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    if-eqz p2, :cond_0

    .line 17
    .line 18
    const-string v1, "true"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_0
    const-string v1, "false"

    .line 22
    .line 23
    :goto_0
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "RtcRoomEventHandler"

    .line 31
    .line 32
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 36
    .line 37
    if-eqz v0, :cond_1

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onVideoStreamBanned(Ljava/lang/String;Z)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catch_0
    move-exception p0

    .line 48
    goto :goto_1

    .line 49
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 50
    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onVideoStreamBanned(Ljava/lang/String;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 58
    .line 59
    .line 60
    :cond_2
    return-void

    .line 61
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 62
    .line 63
    const-string p2, "onVideoStreamBanned callback catch exception.\n"

    .line 64
    .line 65
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 66
    .line 67
    .line 68
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 69
    .line 70
    .line 71
    move-result-object p0

    .line 72
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 73
    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 80
    .line 81
    .line 82
    return-void
.end method

.method public onVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onVideoSubscribeStateChanged"

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandler"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catch_0
    move-exception p0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandler;->mGameRTCRoom:Lcom/ss/bytertc/engine/GameRoomImpl;

    .line 23
    .line 24
    if-eqz p0, :cond_1

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/GameRoomImpl;->getRtcRoomHandler()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 31
    .line 32
    .line 33
    :cond_1
    return-void

    .line 34
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 35
    .line 36
    const-string p2, "onVideoSubscribeStateChanged callback catch exception.\n"

    .line 37
    .line 38
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 53
    .line 54
    .line 55
    return-void
.end method
