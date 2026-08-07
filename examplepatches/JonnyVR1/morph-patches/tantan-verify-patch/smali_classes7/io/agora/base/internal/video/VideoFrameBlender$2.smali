.class Lio/agora/base/internal/video/VideoFrameBlender$2;
.super Ljava/lang/Object;

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lio/agora/base/internal/video/VideoFrameBlender;->createAndBindTextureBuffer(II)Z
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Boolean;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lio/agora/base/internal/video/VideoFrameBlender;

.field final synthetic val$height:I

.field final synthetic val$width:I


# direct methods
.method public constructor <init>(Lio/agora/base/internal/video/VideoFrameBlender;II)V
    .locals 0

    iput-object p1, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    iput p2, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$width:I

    iput p3, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$height:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public call()Ljava/lang/Boolean;
    .locals 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "into createAndBindTextureBuffer width:"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v1, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$width:I

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v1, " ,height:"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget v2, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$height:I

    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v2, "AndroidVideoFrameBlender"

    invoke-static {v2, v0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    :try_start_0
    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$000(Lio/agora/base/internal/video/VideoFrameBlender;)Lio/agora/base/internal/video/EglBase;

    move-result-object v0

    invoke-interface {v0}, Lio/agora/base/internal/video/EglBase;->makeCurrent()V
    :try_end_0
    .catch Ljava/lang/RuntimeException; {:try_start_0 .. :try_end_0} :catch_0

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$200(Lio/agora/base/internal/video/VideoFrameBlender;)V

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    const/16 v3, 0xde1

    invoke-static {v3}, Lio/agora/base/internal/video/GlUtil;->generateTexture(I)I

    move-result v4

    invoke-static {v0, v4}, Lio/agora/base/internal/video/VideoFrameBlender;->access$302(Lio/agora/base/internal/video/VideoFrameBlender;I)I

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$300(Lio/agora/base/internal/video/VideoFrameBlender;)I

    move-result v0

    if-gtz v0, :cond_0

    const-string p0, "generateTexture failed"

    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->e(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_0
    const v0, 0x84c0

    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    iget-object v0, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v0}, Lio/agora/base/internal/video/VideoFrameBlender;->access$300(Lio/agora/base/internal/video/VideoFrameBlender;)I

    move-result v0

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const-string v0, "glTexImage2D"

    invoke-static {v0}, Lio/agora/base/internal/ATrace;->beginSection(Ljava/lang/String;)V

    const/16 v0, 0x2802

    const v4, 0x47012f00    # 33071.0f

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2803

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    const/16 v0, 0x2801

    const/16 v4, 0x2601

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    const/16 v0, 0x2800

    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    iget v8, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$width:I

    iget v9, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$height:I

    const/16 v12, 0x1401

    const/4 v13, 0x0

    const/16 v5, 0xde1

    const/4 v6, 0x0

    const/16 v7, 0x1908

    const/4 v10, 0x0

    const/16 v11, 0x1908

    invoke-static/range {v5 .. v13}, Landroid/opengl/GLES20;->glTexImage2D(IIIIIIIILjava/nio/Buffer;)V

    invoke-static {}, Lio/agora/base/internal/ATrace;->endSection()V

    const-string v0, "TextureBufferPool.glTexImage2D"

    invoke-static {v0}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    const/4 v0, 0x0

    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    const/4 v4, 0x1

    new-array v5, v4, [I

    invoke-static {v4, v5, v0}, Landroid/opengl/GLES20;->glGenFramebuffers(I[II)V

    const-string v4, "glGenFramebuffers"

    invoke-static {v4}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    iget-object v4, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    aget v5, v5, v0

    invoke-static {v4, v5}, Lio/agora/base/internal/video/VideoFrameBlender;->access$402(Lio/agora/base/internal/video/VideoFrameBlender;I)I

    iget-object v4, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v4}, Lio/agora/base/internal/video/VideoFrameBlender;->access$400(Lio/agora/base/internal/video/VideoFrameBlender;)I

    move-result v4

    const v5, 0x8d40

    invoke-static {v5, v4}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    new-instance v4, Ljava/lang/StringBuilder;

    const-string v6, "glBindFramebuffer "

    invoke-direct {v4, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v6, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v6}, Lio/agora/base/internal/video/VideoFrameBlender;->access$400(Lio/agora/base/internal/video/VideoFrameBlender;)I

    move-result v6

    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    iget-object v4, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->this$0:Lio/agora/base/internal/video/VideoFrameBlender;

    invoke-static {v4}, Lio/agora/base/internal/video/VideoFrameBlender;->access$300(Lio/agora/base/internal/video/VideoFrameBlender;)I

    move-result v4

    const v6, 0x8ce0

    invoke-static {v5, v6, v3, v4, v0}, Landroid/opengl/GLES20;->glFramebufferTexture2D(IIIII)V

    const-string v3, "glFramebufferTexture2D"

    invoke-static {v3}, Lio/agora/base/internal/video/GlUtil;->checkNoGLES2Error(Ljava/lang/String;)V

    invoke-static {v5}, Landroid/opengl/GLES20;->glCheckFramebufferStatus(I)I

    move-result v3

    const v4, 0x8cd5

    if-eq v3, v4, :cond_1

    new-instance p0, Ljava/lang/StringBuilder;

    const-string v0, "Framebuffer not complete, status: "

    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->w(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    return-object p0

    :cond_1
    invoke-static {v5, v0}, Landroid/opengl/GLES20;->glBindFramebuffer(II)V

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v3, "createAndBindTextureBuffer success width:"

    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget v3, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$width:I

    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    iget p0, p0, Lio/agora/base/internal/video/VideoFrameBlender$2;->val$height:I

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {v2, p0}, Lio/agora/base/internal/Logging;->d(Ljava/lang/String;Ljava/lang/String;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :catch_0
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

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
    invoke-virtual {p0}, Lio/agora/base/internal/video/VideoFrameBlender$2;->call()Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
