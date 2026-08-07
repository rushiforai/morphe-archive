.class public Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private observer:Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;->observer:Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public onSyncEvent(Lcom/ss/bytertc/engine/live/ChorusCacheSyncEvent;Lcom/ss/bytertc/engine/live/ChorusCacheSyncError;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;->observer:Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;->onSyncEvent(Lcom/ss/bytertc/engine/live/ChorusCacheSyncEvent;Lcom/ss/bytertc/engine/live/ChorusCacheSyncError;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onSyncedUsersChanged(I[Ljava/lang/String;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;->observer:Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;->onSyncedUsersChanged(I[Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onSyncedVideoFrames(I[Ljava/lang/String;[Lcom/ss/bytertc/engine/video/IVideoFrame;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;->observer:Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3}, Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;->onSyncedVideoFrames(I[Ljava/lang/String;[Lcom/ss/bytertc/engine/video/IVideoFrame;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setUserObserver(Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/ChorusCacheSyncObserver;->observer:Lcom/ss/bytertc/engine/live/IChorusCacheSyncObserver;

    .line 4
    .line 5
    :cond_0
    return-void
.end method
