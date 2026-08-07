.class public Lcom/momo/mcamera/mask/videomix/VideoResourceInput;
.super Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Landroid/media/MediaPlayer$OnCompletionListener;
.implements Landroid/media/MediaPlayer$OnErrorListener;
.implements Landroid/media/MediaPlayer$OnInfoListener;
.implements Landroid/media/MediaPlayer$OnPreparedListener;
.implements Landroid/media/MediaPlayer$OnVideoSizeChangedListener;


# annotations
.annotation build Landroid/annotation/TargetApi;
    value = 0xf
.end annotation


# static fields
.field private static final LOG_TAG:Ljava/lang/String; = "MediaPlayerInput"


# instance fields
.field private available:Z

.field private drawFirstFrame:Z

.field private fd:Landroid/content/res/AssetFileDescriptor;

.field private firstFrameTime:J

.field inputHeight:I

.field inputWidth:I

.field protected isFistFrame:Z

.field isPrepared:Z

.field private mContext:Landroid/content/Context;

.field mFps:I

.field protected mMediaPlayer:Landroid/media/MediaPlayer;

.field private mSurface:Landroid/view/Surface;

.field onCompletionListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;

.field onPreparedListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;

.field onVideoSizeChangedListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnVideoSizeChangedListener;

.field renderTimestampListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;

.field rtmpPath:Ljava/lang/String;

.field start_time:J

.field private timestamp:J


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/content/res/AssetFileDescriptor;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x2d0

    .line 5
    .line 6
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    .line 7
    .line 8
    const/16 v0, 0x500

    .line 9
    .line 10
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 14
    .line 15
    const/16 v1, 0xf

    .line 16
    .line 17
    iput v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mFps:I

    .line 18
    .line 19
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isFistFrame:Z

    .line 20
    .line 21
    const-wide/16 v1, 0x0

    .line 22
    .line 23
    iput-wide v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->timestamp:J

    .line 24
    .line 25
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->available:Z

    .line 26
    .line 27
    iput-wide v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->firstFrameTime:J

    .line 28
    .line 29
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->drawFirstFrame:Z

    .line 30
    .line 31
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mContext:Landroid/content/Context;

    .line 32
    .line 33
    iput-object p2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->fd:Landroid/content/res/AssetFileDescriptor;

    .line 34
    .line 35
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->start()V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;I)V
    .locals 3

    .line 39
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;-><init>()V

    const/16 v0, 0x2d0

    .line 40
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    const/16 v0, 0x500

    .line 41
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    const/4 v0, 0x0

    .line 42
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 43
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isFistFrame:Z

    const-wide/16 v1, 0x0

    .line 44
    iput-wide v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->timestamp:J

    .line 45
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->available:Z

    .line 46
    iput-wide v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->firstFrameTime:J

    .line 47
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->drawFirstFrame:Z

    .line 48
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mContext:Landroid/content/Context;

    .line 49
    iput-object p2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->rtmpPath:Ljava/lang/String;

    .line 50
    iput p3, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mFps:I

    .line 51
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->start()V

    return-void
.end method

.method private stopAndReleasePlayer()V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter v0

    .line 7
    :try_start_0
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 14
    .line 15
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 19
    .line 20
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 21
    .line 22
    .line 23
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 24
    .line 25
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 26
    .line 27
    .line 28
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 29
    .line 30
    invoke-virtual {v1, v2}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 34
    .line 35
    monitor-exit v0

    .line 36
    return-void

    .line 37
    :catchall_0
    move-exception p0

    .line 38
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    throw p0
.end method


# virtual methods
.method public catchErrorLog0()V
    .locals 0

    return-void
.end method

.method public catchErrorLog1()V
    .locals 0

    return-void
.end method

.method public destroy()V
    .locals 2

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->destroy()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->stop()V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->release()V

    .line 15
    .line 16
    .line 17
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 18
    .line 19
    :cond_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    if-eqz v0, :cond_1

    .line 22
    .line 23
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    :cond_1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mSurface:Landroid/view/Surface;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 33
    .line 34
    .line 35
    iput-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mSurface:Landroid/view/Surface;

    .line 36
    .line 37
    :cond_2
    return-void
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public getInputHeight()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    .line 2
    .line 3
    return p0
.end method

.method public getInputWidth()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    .line 2
    .line 3
    return p0
.end method

.method public getScreenTexture()Landroid/graphics/SurfaceTexture;
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    new-array v1, v0, [I

    .line 7
    .line 8
    const/4 v2, 0x0

    .line 9
    invoke-static {v0, v1, v2}, Landroid/opengl/GLES20;->glGenTextures(I[II)V

    .line 10
    .line 11
    .line 12
    aget v0, v1, v2

    .line 13
    .line 14
    const v3, 0x8d65

    .line 15
    .line 16
    .line 17
    invoke-static {v3, v0}, Landroid/opengl/GLES20;->glBindTexture(II)V

    .line 18
    .line 19
    .line 20
    const/16 v0, 0x2801

    .line 21
    .line 22
    const v4, 0x46180400    # 9729.0f

    .line 23
    .line 24
    .line 25
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 26
    .line 27
    .line 28
    const/16 v0, 0x2800

    .line 29
    .line 30
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameterf(IIF)V

    .line 31
    .line 32
    .line 33
    const/16 v0, 0x2802

    .line 34
    .line 35
    const v4, 0x812f

    .line 36
    .line 37
    .line 38
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 39
    .line 40
    .line 41
    const/16 v0, 0x2803

    .line 42
    .line 43
    invoke-static {v3, v0, v4}, Landroid/opengl/GLES20;->glTexParameteri(III)V

    .line 44
    .line 45
    .line 46
    aget v0, v1, v2

    .line 47
    .line 48
    iput v0, p0, Ll/wej;->texture_in:I

    .line 49
    .line 50
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 51
    .line 52
    iget v1, p0, Ll/wej;->texture_in:I

    .line 53
    .line 54
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 55
    .line 56
    .line 57
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 58
    .line 59
    :cond_0
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 60
    .line 61
    return-object p0
.end method

.method public initWithGLContext()V
    .locals 3
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    invoke-super {p0}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/view/Surface;

    .line 12
    .line 13
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mSurface:Landroid/view/Surface;

    .line 19
    .line 20
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 21
    .line 22
    iget v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    .line 23
    .line 24
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    .line 25
    .line 26
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 27
    .line 28
    .line 29
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mSurface:Landroid/view/Surface;

    .line 37
    .line 38
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public onCompletion(Landroid/media/MediaPlayer;)V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->onCompletionListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 p1, 0x0

    .line 6
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;->onCompletion(Landroid/media/MediaPlayer;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    return-void
.end method

.method public declared-synchronized onDrawFrame()V
    .locals 7

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->drawFirstFrame:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-long v0, v0

    .line 13
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->firstFrameTime:J

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :catchall_0
    move-exception v0

    .line 17
    goto :goto_2

    .line 18
    :cond_0
    :goto_0
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->available:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    if-nez v0, :cond_1

    .line 21
    .line 22
    monitor-exit p0

    .line 23
    return-void

    .line 24
    :cond_1
    :try_start_1
    iget-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->drawFirstFrame:Z

    .line 25
    .line 26
    if-nez v0, :cond_2

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->drawFirstFrame:Z

    .line 30
    .line 31
    :cond_2
    iget v0, p0, Ll/wej;->texture_in:I

    .line 32
    .line 33
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 34
    .line 35
    invoke-virtual {p0, v0, v1}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 36
    .line 37
    .line 38
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 39
    .line 40
    .line 41
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->renderTimestampListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;

    .line 42
    .line 43
    if-eqz v0, :cond_5

    .line 44
    .line 45
    iget-wide v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->firstFrameTime:J

    .line 46
    .line 47
    long-to-float v1, v1

    .line 48
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mFps:I
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 49
    .line 50
    int-to-float v3, v2

    .line 51
    const/high16 v4, 0x447a0000    # 1000.0f

    .line 52
    .line 53
    div-float v3, v4, v3

    .line 54
    .line 55
    cmpg-float v1, v1, v3

    .line 56
    .line 57
    iget-wide v5, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->timestamp:J

    .line 58
    .line 59
    if-gez v1, :cond_3

    .line 60
    .line 61
    goto :goto_1

    .line 62
    :cond_3
    long-to-float v1, v5

    .line 63
    int-to-float v2, v2

    .line 64
    div-float/2addr v4, v2

    .line 65
    sub-float/2addr v1, v4

    .line 66
    float-to-long v5, v1

    .line 67
    :goto_1
    const-wide/16 v1, 0x0

    .line 68
    .line 69
    cmp-long v3, v5, v1

    .line 70
    .line 71
    if-gez v3, :cond_4

    .line 72
    .line 73
    move-wide v5, v1

    .line 74
    :cond_4
    :try_start_2
    invoke-interface {v0, v5, v6}, Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;->onRenderTimestampChanged(J)V

    .line 75
    .line 76
    .line 77
    :cond_5
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 78
    .line 79
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->updateTexImage()V

    .line 80
    .line 81
    .line 82
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 83
    .line 84
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->getCurrentPosition()I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    int-to-long v0, v0

    .line 89
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->timestamp:J

    .line 90
    .line 91
    const/4 v0, 0x0

    .line 92
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->available:Z
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 93
    .line 94
    monitor-exit p0

    .line 95
    return-void

    .line 96
    :goto_2
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 97
    throw v0
.end method

.method public onError(Landroid/media/MediaPlayer;II)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public declared-synchronized onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    const/4 p1, 0x1

    .line 3
    :try_start_0
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->available:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception p1

    .line 8
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 9
    throw p1
.end method

.method public onInfo(Landroid/media/MediaPlayer;II)Z
    .locals 0

    const/4 p0, 0x0

    return p0
.end method

.method public onPrepared(Landroid/media/MediaPlayer;)V
    .locals 3

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 3
    .line 4
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    .line 9
    .line 10
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    iget v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    .line 22
    .line 23
    iget v2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    .line 24
    .line 25
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 29
    .line 30
    invoke-virtual {v0, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->start()V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->onPreparedListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;

    .line 37
    .line 38
    if-eqz p0, :cond_0

    .line 39
    .line 40
    invoke-interface {p0, p1}, Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;->onPrepared(Landroid/media/MediaPlayer;)V

    .line 41
    .line 42
    .line 43
    :cond_0
    return-void
.end method

.method public onVideoSizeChanged(Landroid/media/MediaPlayer;II)V
    .locals 0

    .line 1
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoWidth()I

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    invoke-virtual {p1}, Landroid/media/MediaPlayer;->getVideoHeight()I

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    iput p2, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputWidth:I

    .line 10
    .line 11
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->inputHeight:I

    .line 12
    .line 13
    iget-object p3, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    if-eqz p3, :cond_0

    .line 16
    .line 17
    invoke-virtual {p3, p2, p1}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-virtual {p0, p2, p1}, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->setRenderSize(II)V

    .line 21
    .line 22
    .line 23
    const/4 p1, 0x1

    .line 24
    iput-boolean p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isFistFrame:Z

    .line 25
    .line 26
    return-void
.end method

.method public pause()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->pause()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->start()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public seek(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    long-to-int p0, p1

    .line 10
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->seekTo(I)V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method

.method public setFps(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mFps:I

    .line 2
    .line 3
    return-void
.end method

.method public setOnCompletionListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->onCompletionListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnCompletionListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnPreparedListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->onPreparedListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnPreparedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setOnVideoSizeChangedListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnVideoSizeChangedListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->onVideoSizeChangedListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$OnVideoSizeChangedListener;

    .line 2
    .line 3
    return-void
.end method

.method public setRenderTimestampListener(Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->renderTimestampListener:Lcom/momo/mcamera/mask/videomix/IVideoResourceInputListener$RenderTimestampListener;

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 7

    .line 1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->start_time:J

    .line 6
    .line 7
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->stopAndReleasePlayer()V

    .line 12
    .line 13
    .line 14
    :cond_0
    :try_start_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 15
    .line 16
    if-nez v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 23
    .line 24
    new-instance v0, Landroid/view/Surface;

    .line 25
    .line 26
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/MMTextureResourceInput1;->mText:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mSurface:Landroid/view/Surface;

    .line 32
    .line 33
    :cond_1
    new-instance v0, Landroid/media/MediaPlayer;

    .line 34
    .line 35
    invoke-direct {v0}, Landroid/media/MediaPlayer;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 39
    .line 40
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnPreparedListener(Landroid/media/MediaPlayer$OnPreparedListener;)V

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 44
    .line 45
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnCompletionListener(Landroid/media/MediaPlayer$OnCompletionListener;)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 49
    .line 50
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 54
    .line 55
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnErrorListener(Landroid/media/MediaPlayer$OnErrorListener;)V

    .line 56
    .line 57
    .line 58
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 59
    .line 60
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnInfoListener(Landroid/media/MediaPlayer$OnInfoListener;)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 64
    .line 65
    invoke-virtual {v0, p0}, Landroid/media/MediaPlayer;->setOnVideoSizeChangedListener(Landroid/media/MediaPlayer$OnVideoSizeChangedListener;)V

    .line 66
    .line 67
    .line 68
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 69
    .line 70
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mSurface:Landroid/view/Surface;

    .line 71
    .line 72
    invoke-virtual {v0, v1}, Landroid/media/MediaPlayer;->setSurface(Landroid/view/Surface;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->fd:Landroid/content/res/AssetFileDescriptor;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 76
    .line 77
    iget-object v1, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    :try_start_1
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getFileDescriptor()Ljava/io/FileDescriptor;

    .line 82
    .line 83
    .line 84
    move-result-object v2

    .line 85
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->fd:Landroid/content/res/AssetFileDescriptor;

    .line 86
    .line 87
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getStartOffset()J

    .line 88
    .line 89
    .line 90
    move-result-wide v3

    .line 91
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->fd:Landroid/content/res/AssetFileDescriptor;

    .line 92
    .line 93
    invoke-virtual {v0}, Landroid/content/res/AssetFileDescriptor;->getLength()J

    .line 94
    .line 95
    .line 96
    move-result-wide v5

    .line 97
    invoke-virtual/range {v1 .. v6}, Landroid/media/MediaPlayer;->setDataSource(Ljava/io/FileDescriptor;JJ)V

    .line 98
    .line 99
    .line 100
    goto :goto_0

    .line 101
    :cond_2
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->rtmpPath:Ljava/lang/String;

    .line 102
    .line 103
    invoke-virtual {v0}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v1, v0}, Landroid/media/MediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :goto_0
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 111
    .line 112
    invoke-virtual {v0}, Landroid/media/MediaPlayer;->prepareAsync()V

    .line 113
    .line 114
    .line 115
    iget-object v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->mMediaPlayer:Landroid/media/MediaPlayer;

    .line 116
    .line 117
    const/4 v1, 0x0

    .line 118
    invoke-virtual {v0, v1, v1}, Landroid/media/MediaPlayer;->setVolume(FF)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :catch_0
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->stopAndReleasePlayer()V

    .line 123
    .line 124
    .line 125
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->catchErrorLog1()V

    .line 126
    .line 127
    .line 128
    return-void

    .line 129
    :catch_1
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->stopAndReleasePlayer()V

    .line 130
    .line 131
    .line 132
    invoke-virtual {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->catchErrorLog0()V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->isPrepared:Z

    .line 3
    .line 4
    invoke-direct {p0}, Lcom/momo/mcamera/mask/videomix/VideoResourceInput;->stopAndReleasePlayer()V

    .line 5
    .line 6
    .line 7
    return-void
.end method
