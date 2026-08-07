.class public abstract Lcom/ss/bytertc/engine/handler/IRTCRoomEventHandlerEx;
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
.method public onAVSyncEvent(Lcom/ss/bytertc/engine/data/StreamKey;Lcom/ss/bytertc/engine/data/AVSyncEvent;)V
    .locals 0

    return-void
.end method

.method public onStreamPublishSuccess(Ljava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;Z)V
    .locals 0

    return-void
.end method

.method public onStreamStateChanged(Lcom/ss/bytertc/engine/data/StreamKey;ILjava/lang/String;)V
    .locals 0

    return-void
.end method

.method public onStreamSubscribed(ILjava/lang/String;Lcom/ss/bytertc/engine/data/StreamIndex;Lcom/ss/bytertc/engine/SubscribeConfig;)V
    .locals 0

    return-void
.end method

.method public onUserPublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;ZLcom/ss/bytertc/engine/type/MediaStreamType;)V
    .locals 0

    return-void
.end method

.method public onUserUnpublishStream(Lcom/ss/bytertc/engine/data/RemoteStreamKey;Lcom/ss/bytertc/engine/type/MediaStreamType;Lcom/ss/bytertc/engine/type/StreamRemoveReason;)V
    .locals 0

    return-void
.end method
