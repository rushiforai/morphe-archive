.class public Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lcom/ss/bytertc/engine/video/IVideoSink;


# instance fields
.field private mSink:Lcom/ss/bytertc/engine/video/IVideoSink;


# direct methods
.method public constructor <init>(Lcom/ss/bytertc/engine/video/IVideoSink;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;->mSink:Lcom/ss/bytertc/engine/video/IVideoSink;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public getRenderElapse()I
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;->mSink:Lcom/ss/bytertc/engine/video/IVideoSink;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0}, Lcom/ss/bytertc/engine/video/IVideoSink;->getRenderElapse()I

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0
.end method

.method public onFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/ss/bytertc/engine/adapter/VideoSinkAdapter;->mSink:Lcom/ss/bytertc/engine/video/IVideoSink;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-interface {p0, p1}, Lcom/ss/bytertc/engine/video/IVideoSink;->onFrame(Lcom/ss/bytertc/engine/video/IVideoFrame;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public release()V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    return-void
.end method
