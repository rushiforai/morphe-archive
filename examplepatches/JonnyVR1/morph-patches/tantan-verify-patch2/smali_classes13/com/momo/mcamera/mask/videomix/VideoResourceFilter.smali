.class public Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;
.super Ll/jt2;
.source "SourceFile"

# interfaces
.implements Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;


# instance fields
.field private mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/jt2;-><init>()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 5
    .line 6
    invoke-direct {v0, p1, p2, p3}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;-><init>(Landroid/content/Context;Ljava/lang/String;I)V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 10
    .line 11
    invoke-virtual {v0, p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->setOnCompletionListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public declared-synchronized destroy()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-super {p0}, Ll/gfj;->destroy()V

    .line 3
    .line 4
    .line 5
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->stop()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 13
    .line 14
    const/4 v1, 0x0

    .line 15
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->setOnCompletionListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 19
    .line 20
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->setRenderTimestampListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->setOnPreparedListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->destroy()V

    .line 31
    .line 32
    .line 33
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 34
    .line 35
    goto :goto_0

    .line 36
    :catchall_0
    move-exception v0

    .line 37
    goto :goto_1

    .line 38
    :cond_0
    :goto_0
    monitor-exit p0

    .line 39
    return-void

    .line 40
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 41
    throw v0
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 2

    .line 1
    iget-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    invoke-virtual {p1, v0, v1}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->seek(J)V

    .line 8
    .line 9
    .line 10
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->resume()V

    .line 13
    .line 14
    .line 15
    :cond_0
    return-void
.end method

.method public onDrawFrame()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->onDrawFrame()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public passShaderValues()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/wej;->passShaderValues()V

    .line 2
    .line 3
    .line 4
    const v0, 0x84c0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/opengl/GLES20;->glActiveTexture(I)V

    .line 8
    .line 9
    .line 10
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 11
    .line 12
    invoke-virtual {v0}, Ll/gfj;->getTextOutID()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    const/16 v1, 0xde1

    .line 17
    .line 18
    invoke-static {v1, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 19
    .line 20
    .line 21
    iget p0, p0, Ll/wej;->textureHandle:I

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    invoke-static {p0, v0}, Landroid/opengl/GLES20;->glUniform1i(II)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public setOnPreparedListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->setOnPreparedListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public setRenderTimestampListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceFilter;->mediaPlayerInput:Lcom/momo/mcamera/mask/videomix/VideoResourceInput;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->setRenderTimestampListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method
