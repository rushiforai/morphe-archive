.class public Lcom/tencent/iliveroom/TXILiveRoomDelegateAdapter;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public onClearMixTranscodingConfig(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onConnectOtherRoom(JILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onDetectFacePoints([F)V
    .locals 0

    return-void
.end method

.method public onDisconnectOtherRoom(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onError(JILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onEvent(JILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onJoinRoomFailed(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onJoinRoomSuccess(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onKickOut(Ljava/lang/String;J)V
    .locals 0

    return-void
.end method

.method public onQuitRoomFailed(Ljava/lang/String;ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onQuitRoomSuccess(Ljava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onRecvMessage(Ljava/lang/String;J[B)V
    .locals 0

    return-void
.end method

.method public onRecvStreamMessage(Ljava/lang/String;JI[B)V
    .locals 0

    return-void
.end method

.method public onRoomAudioMuted(Ljava/lang/String;JZ)V
    .locals 0

    return-void
.end method

.method public onRoomBroadcasterIn(Ljava/lang/String;J)V
    .locals 0

    return-void
.end method

.method public onRoomBroadcasterOut(Ljava/lang/String;JI)V
    .locals 0

    return-void
.end method

.method public onRoomHasVideo(Ljava/lang/String;J)V
    .locals 0

    return-void
.end method

.method public onRoomRoleChanged(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onRoomVideoMuted(Ljava/lang/String;JZ)V
    .locals 0

    return-void
.end method

.method public onRoomVideoQosChanged(Ljava/lang/String;II)V
    .locals 0

    return-void
.end method

.method public onSetMixTranscodingConfig(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStartPublishCDNStream(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStatus(Ljava/lang/String;Ljava/util/ArrayList;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/ArrayList<",
            "Lcom/tencent/iliveroom/TXILiveRoomDefine$TXILiveRoomStatus;",
            ">;)V"
        }
    .end annotation

    return-void
.end method

.method public onStopPublishCDNStream(ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStreamMessageError(Ljava/lang/String;JIII)V
    .locals 0

    return-void
.end method

.method public onTextureCustomProcess(III)I
    .locals 0

    return p1
.end method

.method public onTextureDestoryed()V
    .locals 0

    return-void
.end method

.method public onWarning(JILjava/lang/String;)V
    .locals 0

    return-void
.end method
