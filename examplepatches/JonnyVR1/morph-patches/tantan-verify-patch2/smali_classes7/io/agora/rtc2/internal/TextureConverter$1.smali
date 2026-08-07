.class Lio/agora/rtc2/internal/TextureConverter$1;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/rtc2/internal/TextureConverter;->convert(Lio/agora/base/VideoFrame;)Lio/agora/base/VideoFrame;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Lio/agora/base/VideoFrame;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/rtc2/internal/TextureConverter;

.field final synthetic val$inputFrame:Lio/agora/base/VideoFrame;


# direct methods
.method public constructor <init>(Lio/agora/rtc2/internal/TextureConverter;Lio/agora/base/VideoFrame;)V
    .locals 0

    iput-object p1, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    iput-object p2, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Lio/agora/base/VideoFrame;
    .locals 10
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$000(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/TextureBufferHelper;

    move-result-object v0

    invoke-virtual {v0}, Lio/agora/base/TextureBufferHelper;->isTextureInUse()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-static {}, Lio/agora/rtc2/internal/TextureConverter;->access$100()Ljava/lang/String;

    move-result-object p0

    const-string v0, "failed to convert, texture in use"

    invoke-static {p0, v0}, Lio/agora/utils2/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    new-instance v1, Lio/agora/base/internal/video/GlTextureFrameBuffer;

    const/16 v2, 0x1908

    invoke-direct {v1, v2}, Lio/agora/base/internal/video/GlTextureFrameBuffer;-><init>(I)V

    invoke-static {v0, v1}, Lio/agora/rtc2/internal/TextureConverter;->access$202(Lio/agora/rtc2/internal/TextureConverter;Lio/agora/base/internal/video/GlTextureFrameBuffer;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    :cond_1
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v0}, Lio/agora/base/VideoFrame;->getRotatedWidth()I

    move-result v0

    iget-object v1, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v1}, Lio/agora/base/VideoFrame;->getRotatedHeight()I

    move-result v1

    iget-object v2, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v2}, Lio/agora/base/VideoFrame;->getRotation()I

    move-result v2

    rem-int/lit16 v2, v2, 0x168

    const/16 v3, 0x5a

    if-eq v2, v3, :cond_3

    const/16 v3, 0x10e

    if-ne v2, v3, :cond_2

    goto :goto_1

    :cond_2
    :goto_0
    move v3, v0

    move v4, v1

    goto :goto_2

    :cond_3
    :goto_1
    xor-int/2addr v0, v1

    xor-int/2addr v1, v0

    xor-int/2addr v0, v1

    goto :goto_0

    :goto_2
    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    move-result-object v0

    invoke-virtual {v0, v3, v4}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->setSize(II)V

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getFrameBufferId()I

    move-result v0

    const v1, 0x8d40

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    const-string v0, "VideoFrameRotator.glBindFramebuffer"

    invoke-static {v0}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    const/16 v0, 0x4000

    invoke-static {v0}, Landroid/opengl/GLES20;->glClear(I)V

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$500(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/VideoFrameDrawer;

    move-result-object v2

    move v8, v3

    iget-object v3, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$300(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlRectDrawer;

    move-result-object v0

    iget-object v5, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v5}, Lio/agora/rtc2/internal/TextureConverter;->access$400(Lio/agora/rtc2/internal/TextureConverter;)Landroid/graphics/Matrix;

    move-result-object v5

    const/4 v6, 0x0

    const/4 v7, 0x0

    move v9, v4

    move-object v4, v0

    invoke-virtual/range {v2 .. v9}, Lio/agora/base/internal/video/VideoFrameDrawer;->convertByDrawFrame(Lio/agora/base/VideoFrame;Lio/agora/base/internal/video/RendererCommon$GlDrawer;Landroid/graphics/Matrix;IIII)V

    move v4, v9

    const-string v0, "VideoFrameRotator.drawFrame"

    invoke-static {v0}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    invoke-static {}, Landroid/opengl/GLES20;->glFlush()V

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$000(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/TextureBufferHelper;

    move-result-object v2

    sget-object v5, Lio/agora/base/VideoFrame$TextureBuffer$Type;->RGB:Lio/agora/base/VideoFrame$TextureBuffer$Type;

    iget-object v0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->this$0:Lio/agora/rtc2/internal/TextureConverter;

    invoke-static {v0}, Lio/agora/rtc2/internal/TextureConverter;->access$200(Lio/agora/rtc2/internal/TextureConverter;)Lio/agora/base/internal/video/GlTextureFrameBuffer;

    move-result-object v0

    invoke-virtual {v0}, Lio/agora/base/internal/video/GlTextureFrameBuffer;->getTextureId()I

    move-result v6

    new-instance v7, Landroid/graphics/Matrix;

    invoke-direct {v7}, Landroid/graphics/Matrix;-><init>()V

    move v3, v8

    invoke-virtual/range {v2 .. v7}, Lio/agora/base/TextureBufferHelper;->wrapTextureBuffer(IILio/agora/base/VideoFrame$TextureBuffer$Type;ILandroid/graphics/Matrix;)Lio/agora/base/VideoFrame$TextureBuffer;

    move-result-object v0

    new-instance v1, Lio/agora/base/VideoFrame;

    iget-object v2, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {v2}, Lio/agora/base/VideoFrame;->getRotation()I

    move-result v2

    iget-object p0, p0, Lio/agora/rtc2/internal/TextureConverter$1;->val$inputFrame:Lio/agora/base/VideoFrame;

    invoke-virtual {p0}, Lio/agora/base/VideoFrame;->getTimestampNs()J

    move-result-wide v3

    invoke-direct {v1, v0, v2, v3, v4}, Lio/agora/base/VideoFrame;-><init>(Lio/agora/base/VideoFrame$Buffer;IJ)V

    return-object v1
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 2
    invoke-virtual {p0}, Lio/agora/rtc2/internal/TextureConverter$1;->call()Lio/agora/base/VideoFrame;

    move-result-object p0

    return-object p0
.end method
