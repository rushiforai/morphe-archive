.class Lio/agora/base/internal/video/VideoFrameBlender$5;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoFrameBlender;->uploadImageSourceToTexture(Lio/agora/base/VideoFrame;)Lio/agora/base/VideoFrame$TextureBuffer;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/VideoFrame$TextureBuffer;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/VideoFrameBlender;

.field final synthetic val$inputFrame:Lio/agora/base/VideoFrame;


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoFrameBlender;Lio/agora/base/VideoFrame;)V
    .locals 0

    iput-object p1, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    iput-object p2, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/VideoFrame$TextureBuffer;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v0

    instance-of v0, v0, Lio/agora/base/VideoFrame$RgbaBuffer;

    if-nez v0, :cond_0

    goto :goto_0

    :cond_0
    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$000(Lio/agora/base/internal/video/VideoFrameBlender;)Lio/agora/base/internal/video/EglBase;

    move-result-object v0

    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->makeCurrent()V

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getBuffer()Lio/agora/base/VideoFrame$Buffer;

    move-result-object v0

    check-cast v0, Lio/agora/base/VideoFrame$RgbaBuffer;

    invoke-interface {v0}, Lio/agora/base/VideoFrame$RgbaBuffer;->getData()Ljava/nio/ByteBuffer;

    move-result-object v0

    iget-object v1, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v1}, Lio/agora/base/VideoFrame;->getRotatedWidth()I

    move-result v1

    iget-object v2, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v2}, Lio/agora/base/VideoFrame;->getRotatedHeight()I

    move-result v2

    const/16 v3, 0x1908

    invoke-static {v0, v1, v2, v3}, Lio/agora/base/internal/video/VideoFrameBlender;->createImageTexture(Ljava/nio/ByteBuffer;III)I

    move-result v9

    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    new-instance v4, Lio/agora/base/TextureBuffer;

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$000(Lio/agora/base/internal/video/VideoFrameBlender;)Lio/agora/base/internal/video/EglBase;

    move-result-object v0

    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->getEglBaseContext()Lio/agora/base/internal/video/EglBase$Context;

    move-result-object v5

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getRotatedWidth()I

    move-result v6

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getRotatedHeight()I

    move-result v7

    sget-object v8, Lio/agora/base/VideoFrame$TextureBuffer$Type;->RGB:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    sget-object v0, Lio/agora/base/internal/video/GlUtil;->IDENTITY_MATRIX:[F

    invoke-static {v0}, Lio/agora/base/internal/video/RendererCommon;->convertMatrixToAndroidGraphicsMatrix([F)Landroid/graphics/Matrix;

    move-result-object v10

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$1200(Lio/agora/base/internal/video/VideoFrameBlender;)Landroid/os/Handler;

    move-result-object v11

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$5;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$1300(Lio/agora/base/internal/video/VideoFrameBlender;)Lio/agora/base/internal/video/YuvConverter;

    move-result-object v12

    new-instance v13, Lio/agora/base/internal/video/VideoFrameBlender$5$1;

    invoke-direct {v13, p0, v9}, Lio/agora/base/internal/video/VideoFrameBlender$5$1;-><init>(Lio/agora/base/internal/video/VideoFrameBlender$5;I)V

    invoke-direct/range {v4 .. v13}, Lio/agora/base/TextureBuffer;-><init>(Lio/agora/base/internal/video/EglBase$Context;IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;Landroid/os/Handler;Lio/agora/base/internal/video/YuvConverter;Ljava/lang/Runnable;)V

    return-object v4

    :cond_1
    :goto_0
    const/4 p0, 0x0

    return-object p0
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2
    invoke-virtual {p0}, Lio/agora/base/internal/video/VideoFrameBlender$5;->call()Lio/agora/base/VideoFrame$TextureBuffer;

    move-result-object p0

    return-object p0
.end method
