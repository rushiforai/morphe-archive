.class public interface abstract Lcom/ss/bytertc/engine/IWTNStream;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract setWTNRemoteAudioPlaybackVolume(Ljava/lang/String;I)I
.end method

.method public abstract setWTNRemoteVideoCanvas(Ljava/lang/String;Lcom/ss/bytertc/engine/VideoCanvas;)I
.end method

.method public abstract setWTNRemoteVideoSink(Ljava/lang/String;Lcom/ss/bytertc/engine/video/IVideoSink;Lcom/ss/bytertc/engine/video/RemoteVideoSinkConfig;)I
.end method

.method public abstract setWTNStreamEventHandler(Lcom/ss/bytertc/engine/IWTNStreamEventHandler;)I
.end method

.method public abstract subscribeWTNAudioStream(Ljava/lang/String;Z)I
.end method

.method public abstract subscribeWTNVideoStream(Ljava/lang/String;Z)I
.end method
