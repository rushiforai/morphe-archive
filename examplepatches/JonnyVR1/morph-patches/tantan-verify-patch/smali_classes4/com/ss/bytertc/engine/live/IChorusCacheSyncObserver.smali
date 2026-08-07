.class public interface abstract Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# virtual methods
.method public abstract onSyncEvent(Lcom/ss/bytertc/engine/live/ChorusCacheSyncEvent;Lcom/ss/bytertc/engine/live/ChorusCacheSyncError;)V
.end method

.method public abstract onSyncedUsersChanged(I[Ljava/lang/String;)V
.end method

.method public abstract onSyncedVideoFrames(I[Ljava/lang/String;[Lcom/ss/bytertc/engine/video/IVideoFrame;)V
.end method
