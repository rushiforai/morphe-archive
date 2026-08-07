.class public Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final TAG:Ljava/lang/String; = "RtcRoomEventHandlerEx"


# instance fields
.field private mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/RTCRoomImpl;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public onAVSyncEvent(Lcom/ss/bytertc/engine/data/StreamKey;Lcom/ss/bytertc/engine/data/AVSyncEvent;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onAVSyncEvent..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandlerEx"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onAVSyncEvent(Lcom/ss/bytertc/engine/data/StreamKey;Lcom/ss/bytertc/engine/data/AVSyncEvent;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

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
    return-void

    .line 23
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string p2, "onAVSyncEvent callback catch exception.\n"

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onStreamPublishSuccess(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;Z)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onStreamPublishSuccess..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandlerEx"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onStreamPublishSuccess(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

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
    return-void

    .line 23
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string p2, "onStreamPublishSuccess callback catch exception.\n"

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onStreamStateChanged(Lcom/ss/bytertc/engine/data/StreamKey;ILjava/lang/String;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onStreamStateChanged streamIndex: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/StreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcRoomEventHandlerEx"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onStreamStateChanged(Lcom/ss/bytertc/engine/data/StreamKey;ILjava/lang/String;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

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
    return-void

    .line 39
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string p2, "onStreamStateChanged callback catch exception.\n"

    .line 42
    .line 43
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    return-void
.end method

.method public onStreamSubscribed(ILjava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/SubscribeConfig;)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    const-string v0, "onStreamSubscribed..."

    .line 2
    .line 3
    const-string v1, "RtcRoomEventHandlerEx"

    .line 4
    .line 5
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 9
    .line 10
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    invoke-virtual {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onStreamSubscribed(ILjava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/SubscribeConfig;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

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
    return-void

    .line 23
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 24
    .line 25
    const-string p2, "onStreamSubscribed callback catch exception.\n"

    .line 26
    .line 27
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public onUserPublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;ZI)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserPublishStream streamIndex: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcRoomEventHandlerEx"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :try_start_0
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 25
    .line 26
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    if-eqz p0, :cond_0

    .line 31
    .line 32
    invoke-static {p3}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 33
    .line 34
    .line 35
    move-result-object p3

    .line 36
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onUserPublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;ZLcom/ss/bytertc/engine/type/MediaStreamType;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

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
    return-void

    .line 43
    :goto_0
    new-instance p1, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    const-string p2, "onUserPublishStream callback catch exception.\n"

    .line 46
    .line 47
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    return-void
.end method

.method public onUserUnpublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;II)V
    .locals 2
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "onUserUnpublishStream streamIndex: "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Lcom/ss/bytertc/engine/data/RemoteStreamKey;->getStreamIndex()Lcom/ss/bytertc/engine/data/StreamIndex;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "RtcRoomEventHandlerEx"

    .line 20
    .line 21
    invoke-static {v1, v0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    if-ltz p3, :cond_0

    .line 25
    .line 26
    :try_start_0
    sget-object v0, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->STREAM_REMOVE_REASON_PUBLISH_PRIVILEGE_TOKEN_EXPIRED:Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 27
    .line 28
    invoke-virtual {v0}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->value()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-le p3, v0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catch_0
    move-exception p0

    .line 36
    goto :goto_1

    .line 37
    :cond_0
    :goto_0
    const-string p3, "onUserUnpublishStream callback reason invalid.\n"

    .line 38
    .line 39
    invoke-static {v1, p3}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const/4 p3, 0x0

    .line 43
    :cond_1
    iget-object p0, p0, Lcom/ss/bytertc/engine/handler/RTCRoomEventHandlerEx;->mRtcRoom:Lcom/ss/bytertc/engine/RTCRoomImpl;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/ss/bytertc/engine/RTCRoomImpl;->getRtcRoomHandlerEx()Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    if-eqz p0, :cond_2

    .line 50
    .line 51
    invoke-static {p2}, Lcom/ss/bytertc/engine/type/MediaStreamType;->valueOf(I)Lcom/ss/bytertc/engine/type/MediaStreamType;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-static {}, Lcom/ss/bytertc/engine/type/StreamRemoveReason;->values()[Lcom/ss/bytertc/engine/type/StreamRemoveReason;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    aget-object p3, v0, p3

    .line 60
    .line 61
    invoke-virtual {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;->onUserUnpublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 62
    .line 63
    .line 64
    :cond_2
    return-void

    .line 65
    :goto_1
    new-instance p1, Ljava/lang/StringBuilder;

    .line 66
    .line 67
    const-string p2, "onUserUnpublishStream callback catch exception.\n"

    .line 68
    .line 69
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-static {v1, p0}, Lcom/ss/bytertc/engine/utils/LogUtil;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 84
    .line 85
    .line 86
    return-void
.end method
