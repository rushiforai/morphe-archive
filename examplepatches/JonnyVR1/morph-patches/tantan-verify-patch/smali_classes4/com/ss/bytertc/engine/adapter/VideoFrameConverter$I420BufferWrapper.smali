.class Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/ss/bytertc/engine/adapter/VideoFrameConverter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "I420BufferWrapper"
.end annotation


# instance fields
.field private i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

.field private needManualRelease:Z


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/VideoFrame;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    instance-of v0, v0, Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    check-cast p1, Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 17
    .line 18
    iput-object p1, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 19
    .line 20
    const/4 p1, 0x0

    .line 21
    iput-boolean p1, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->needManualRelease:Z

    .line 22
    .line 23
    return-void

    .line 24
    :cond_0
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    invoke-interface {v0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->toI420()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iput-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 33
    .line 34
    const/4 v0, 0x1

    .line 35
    iput-boolean v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->needManualRelease:Z

    .line 36
    .line 37
    invoke-virtual {p1}, Lcom/bytedance/realx/video/VideoFrame;->getBuffer()Lcom/bytedance/realx/video/VideoFrame$Buffer;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-interface {p0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->release()V

    .line 42
    .line 43
    .line 44
    return-void
.end method


# virtual methods
.method public getBuffer()Lcom/bytedance/realx/video/VideoFrame$I420Buffer;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 2
    .line 3
    return-object p0
.end method

.method public release()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->i420Buffer:Lcom/bytedance/realx/video/VideoFrame$I420Buffer;

    .line 2
    .line 3
    instance-of v1, v0, Lcom/bytedance/realx/video/JavaI420Buffer;

    .line 4
    .line 5
    if-eqz v1, :cond_0

    .line 6
    .line 7
    iget-boolean p0, p0, Lcom/ss/bytertc/engine/adapter/VideoFrameConverter$I420BufferWrapper;->needManualRelease:Z

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {v0}, Lcom/bytedance/realx/video/VideoFrame$Buffer;->release()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
