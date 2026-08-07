.class public Ll/gjc0;
.super Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onAVSyncStateChange(Lcom/ss/bytertc/engine/data/AVSyncState;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAudioPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAudioStreamBanned(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onAudioSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onLeaveRoom(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onLocalStreamStats(Lcom/ss/bytertc/engine/type/LocalStreamStats;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onNetworkQuality(Lcom/ss/bytertc/engine/type/NetworkQualityStats;[Lcom/ss/bytertc/engine/type/NetworkQualityStats;)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onNetworkQuality(Lcom/ss/bytertc/engine/type/NetworkQualityStats;[Lcom/ss/bytertc/engine/type/NetworkQualityStats;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onRemoteStreamStats(Lcom/ss/bytertc/engine/type/RemoteStreamStats;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRoomBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRoomMessageReceived(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRoomMessageSendResult(JI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRoomStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRoomStats(Lcom/ss/bytertc/engine/type/RTCRoomStats;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onRoomWarning(I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStreamAdd(Lcom/ss/bytertc/engine/RTCStream;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStreamPublishSuccess(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStreamRemove(Lcom/ss/bytertc/engine/RTCStream;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onStreamStateChanged(Ljava/lang/String;Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onTokenWillExpire()V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserBinaryMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserJoined(Lcom/ss/bytertc/engine/UserInfo;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserLeave(Ljava/lang/String;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserMessageReceived(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserMessageSendResult(JI)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserPublishScreen(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onUserPublishStreamAudio(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStreamAudio(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandler;->onUserPublishStreamVideo(Ljava/lang/String;Ljava/lang/String;Z)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onUserUnpublishScreen(Ljava/lang/String;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onVideoPublishStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/PublishState;Lcom/ss/bytertc/engine/data/PublishStateChangeReason;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onVideoStreamBanned(Ljava/lang/String;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public onVideoSubscribeStateChanged(Ljava/lang/String;Ljava/lang/String;Lcom/ss/bytertc/engine/data/SubscribeState;Lcom/ss/bytertc/engine/data/SubscribeStateChangeReason;)V
    .locals 0

    .line 1
    return-void
.end method
