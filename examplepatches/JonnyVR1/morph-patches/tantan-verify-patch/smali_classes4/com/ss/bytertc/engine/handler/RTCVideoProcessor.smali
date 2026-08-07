.class public Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field private mProc:Lcom/ss/bytertc/engine/video/IVideoProcessor;


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
    iput-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;->mProc:Lcom/ss/bytertc/engine/video/IVideoProcessor;

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public dispose()V
    .locals 0

    return-void
.end method

.method public processVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)Lcom/ss/bytertc/engine/video/IVideoFrame;
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;->mProc:Lcom/ss/bytertc/engine/video/IVideoProcessor;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0, p1}, Lcom/ss/bytertc/engine/video/IVideoProcessor;->processVideoFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)Lcom/ss/bytertc/engine/video/IVideoFrame;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    monitor-exit p0

    .line 11
    return-object p1

    .line 12
    :catchall_0
    move-exception p1

    .line 13
    goto :goto_0

    .line 14
    :cond_0
    monitor-exit p0

    .line 15
    const/4 p0, 0x0

    .line 16
    return-object p0

    .line 17
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 18
    throw p1
.end method

.method public registerLocalVideoProcessor(Lcom/ss/bytertc/engine/video/IVideoProcessor;)I
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/ss/bytertc/engine/handler/RTCVideoProcessor;->mProc:Lcom/ss/bytertc/engine/video/IVideoProcessor;

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw p1
.end method
