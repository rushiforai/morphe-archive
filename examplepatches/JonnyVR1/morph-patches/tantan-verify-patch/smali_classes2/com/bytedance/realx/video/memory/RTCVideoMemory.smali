.class public abstract Lcom/bytedance/realx/video/memory/RTCVideoMemory;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/bytedance/realx/base/RefCounted;


# instance fields
.field refCounted:Lcom/bytedance/realx/video/memory/RefObject;

.field private releaseCallback:Ljava/lang/Runnable;


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->releaseCallback:Ljava/lang/Runnable;

    .line 6
    .line 7
    new-instance v0, Lcom/bytedance/realx/video/memory/RefObject;

    .line 8
    .line 9
    new-instance v1, Ll/kjc0;

    .line 10
    .line 11
    invoke-direct {v1, p0}, Ll/kjc0;-><init>(Lcom/bytedance/realx/video/memory/RTCVideoMemory;)V

    .line 12
    .line 13
    .line 14
    invoke-direct {v0, v1}, Lcom/bytedance/realx/video/memory/RefObject;-><init>(Ljava/lang/Runnable;)V

    .line 15
    .line 16
    .line 17
    iput-object v0, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 18
    .line 19
    return-void
.end method

.method public static synthetic a(Lcom/bytedance/realx/video/memory/RTCVideoMemory;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->releaseCallback:Ljava/lang/Runnable;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method


# virtual methods
.method public abstract getHeight()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getMemoryType()Lcom/bytedance/realx/video/RXVideoMemoryType;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getRotation()Lcom/bytedance/realx/video/RXVideoRotation;
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public abstract getWidth()I
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation
.end method

.method public declared-synchronized hasReleaseCallback()Z
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->releaseCallback:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    goto :goto_0

    .line 8
    :cond_0
    const/4 v0, 0x0

    .line 9
    :goto_0
    monitor-exit p0

    .line 10
    return v0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 13
    throw v0
.end method

.method public declared-synchronized release()V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/bytedance/realx/video/memory/RefObject;->release()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized retain()V
    .locals 1
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->refCounted:Lcom/bytedance/realx/video/memory/RefObject;

    .line 3
    .line 4
    invoke-virtual {v0}, Lcom/bytedance/realx/video/memory/RefObject;->retain()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception v0

    .line 10
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 11
    throw v0
.end method

.method public declared-synchronized setReleaseCallback(Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/bytedance/realx/video/memory/RTCVideoMemory;->releaseCallback:Ljava/lang/Runnable;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 3
    .line 4
    monitor-exit p0

    .line 5
    return-void

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 8
    throw p1
.end method
