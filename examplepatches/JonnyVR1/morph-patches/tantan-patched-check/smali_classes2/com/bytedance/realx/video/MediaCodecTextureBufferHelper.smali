.class public Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;
    }
.end annotation


# instance fields
.field private mReleaseFunc:Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;

.field private mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

.field private render:Z


# direct methods
.method public constructor <init>(Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->render:Z

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 9
    .line 10
    iput-object p1, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mReleaseFunc:Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public getMatrix()[F
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return-object p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->getTexMatrix()[F

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public isAvaliable()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->isAvaliable()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public releaseOutputBuffer(Z)V
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->runTask(Z)I

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public runTask(Z)I
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mReleaseFunc:Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper$ReleaseOutPutBuffer;->release(Z)I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public setRender(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->render:Z

    .line 2
    .line 3
    return-void
.end method

.method public setSurfaceTextureHelper(Lcom/bytedance/realx/video/SurfaceTextureHelper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    return-void
.end method

.method public updateTextureImage()Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->updateTexImage()V

    .line 8
    .line 9
    .line 10
    const/4 p0, 0x1

    .line 11
    return p0
.end method

.method public updateTextureImageAndWait(I)Z
    .locals 0
    .annotation build Lcom/bytedance/realx/base/CalledByNative;
    .end annotation

    .line 1
    iget-object p0, p0, Lcom/bytedance/realx/video/MediaCodecTextureBufferHelper;->mSurfaceTextureHelper:Lcom/bytedance/realx/video/SurfaceTextureHelper;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x0

    .line 6
    return p0

    .line 7
    :cond_0
    invoke-virtual {p0, p1}, Lcom/bytedance/realx/video/SurfaceTextureHelper;->updateTexImageAndWait(I)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method
