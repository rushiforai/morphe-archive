.class public interface abstract Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onCacheSyncVideoFrames(Ljava/lang/String;[Ljava/lang/String;[Lcom/ss/bytertc/engine/video/IVideoFrame;[[BI)V
.end method

.method public abstract onClientMixedStreamEvent(Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;Lcom/ss/bytertc/engine/live/MixedStreamType;Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;)V
.end method

.method public abstract onMixedAudioFrame(Ljava/lang/String;[BIJ)V
.end method

.method public abstract onMixedDataFrame(Ljava/lang/String;[BJ)V
.end method

.method public abstract onMixedFirstAudioFrame(Ljava/lang/String;)V
.end method

.method public abstract onMixedFirstVideoFrame(Ljava/lang/String;)V
.end method

.method public abstract onMixedVideoFrame(Ljava/lang/String;Lcom/ss/bytertc/engine/video/IVideoFrame;)V
.end method
