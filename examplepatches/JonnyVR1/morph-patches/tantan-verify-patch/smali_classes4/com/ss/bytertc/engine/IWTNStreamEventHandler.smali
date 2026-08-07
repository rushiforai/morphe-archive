.class public interface abstract Lcom/ss/bytertc/engine/IWTNStreamEventHandler;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onWTNAudioSubscribeStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/data/WTNSubscribeState;Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;)V
.end method

.method public abstract onWTNDataMessageReceived(Ljava/lang/String;Ljava/nio/ByteBuffer;Lcom/ss/bytertc/engine/data/DataMessageSourceType;)V
.end method

.method public abstract onWTNFirstRemoteAudioFrame(Ljava/lang/String;)V
.end method

.method public abstract onWTNFirstRemoteVideoFrameDecoded(Ljava/lang/String;Lcom/ss/bytertc/engine/data/VideoFrameInfo;)V
.end method

.method public abstract onWTNRemoteAudioStats(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RemoteAudioStats;)V
.end method

.method public abstract onWTNRemoteVideoStats(Ljava/lang/String;Lcom/ss/bytertc/engine/type/RemoteVideoStats;)V
.end method

.method public abstract onWTNSEIMessageReceived(Ljava/lang/String;ILjava/nio/ByteBuffer;)V
.end method

.method public abstract onWTNVideoSubscribeStateChanged(Ljava/lang/String;Lcom/ss/bytertc/engine/data/WTNSubscribeState;Lcom/ss/bytertc/engine/data/WTNSubscribeStateChangeReason;)V
.end method
