.class public Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;


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
    iput-object v0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public onCacheSyncVideoFrames(Ljava/lang/String;[Ljava/lang/String;[Lcom/ss/bytertc/engine/video/IVideoFrame;[[BI)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p5}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onCacheSyncVideoFrames(Ljava/lang/String;[Ljava/lang/String;[Lcom/ss/bytertc/engine/video/IVideoFrame;[[BI)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onClientMixedStreamEvent(Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;Lcom/ss/bytertc/engine/live/MixedStreamType;Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onClientMixedStreamEvent(Lcom/ss/bytertc/engine/live/MixedStreamTaskInfo;Lcom/ss/bytertc/engine/live/MixedStreamType;Lcom/ss/bytertc/engine/live/MixedStreamTaskEvent;Lcom/ss/bytertc/engine/live/MixedStreamTaskErrorCode;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMixedAudioFrame(Ljava/lang/String;[BIJ)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface/range {p0 .. p5}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onMixedAudioFrame(Ljava/lang/String;[BIJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMixedDataFrame(Ljava/lang/String;[BJ)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2, p3, p4}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onMixedDataFrame(Ljava/lang/String;[BJ)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMixedFirstAudioFrame(Ljava/lang/String;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onMixedFirstAudioFrame(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMixedFirstVideoFrame(Ljava/lang/String;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onMixedFirstVideoFrame(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public onMixedVideoFrame(Ljava/lang/String;Lcom/ss/bytertc/engine/video/IVideoFrame;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1, p2}, Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;->onMixedVideoFrame(Ljava/lang/String;Lcom/ss/bytertc/engine/video/IVideoFrame;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setUserObserver(Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/ss/bytertc/engine/live/PushMixedStreamToCDNObserver;->mLiveTransObserver:Lcom/ss/bytertc/engine/live/IClientMixedStreamObserver;

    .line 2
    .line 3
    return-void
.end method
