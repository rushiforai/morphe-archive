.class public Ll/xfm;
.super Ll/qnw;
.source "SourceFile"

# interfaces
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
.implements Ll/z5m;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;
.implements Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;
.implements Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0xe
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/xfm$b;
    }
.end annotation


# instance fields
.field private A:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

.field private B:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field

.field C:I

.field D:I

.field E:J

.field private F:F

.field G:Z

.field H:I

.field private I:Z

.field private J:Lcom/momo/piplinemomoext/input/audio/a;

.field protected K:Z

.field private L:Ll/xfm$b;

.field private M:I

.field private N:I

.field private O:I

.field private P:Ll/brx;

.field private v:Ll/g510;

.field protected x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

.field y:Ljava/lang/String;

.field private z:Landroid/view/Surface;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/lang/String;ZLl/brx;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ll/qnw;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x1e0

    .line 5
    .line 6
    iput v0, p0, Ll/xfm;->C:I

    .line 7
    .line 8
    iput v0, p0, Ll/xfm;->D:I

    .line 9
    .line 10
    const/high16 v0, 0x3f800000    # 1.0f

    .line 11
    .line 12
    iput v0, p0, Ll/xfm;->F:F

    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-boolean v0, p0, Ll/xfm;->G:Z

    .line 16
    .line 17
    const/16 v1, 0xf

    .line 18
    .line 19
    iput v1, p0, Ll/xfm;->H:I

    .line 20
    .line 21
    iput-boolean v0, p0, Ll/xfm;->K:Z

    .line 22
    .line 23
    const v0, 0xac44

    .line 24
    .line 25
    .line 26
    iput v0, p0, Ll/xfm;->M:I

    .line 27
    .line 28
    const/4 v0, 0x1

    .line 29
    iput v0, p0, Ll/xfm;->N:I

    .line 30
    .line 31
    iput v0, p0, Ll/xfm;->O:I

    .line 32
    .line 33
    iput-object p4, p0, Ll/xfm;->P:Ll/brx;

    .line 34
    .line 35
    iput-boolean p3, p0, Ll/xfm;->I:Z

    .line 36
    .line 37
    new-instance p3, Ljava/lang/ref/WeakReference;

    .line 38
    .line 39
    invoke-direct {p3, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    iput-object p3, p0, Ll/xfm;->B:Ljava/lang/ref/WeakReference;

    .line 43
    .line 44
    iput-object p2, p0, Ll/xfm;->y:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {p0}, Ll/xfm;->start()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public static synthetic Q1(Ll/xfm;)Ll/g510;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfm;->v:Ll/g510;

    .line 2
    .line 3
    return-object p0
.end method

.method private stopAndReleasePlayer()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

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
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 8
    .line 9
    if-eqz v1, :cond_1

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 13
    .line 14
    .line 15
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 18
    .line 19
    .line 20
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 21
    .line 22
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 23
    .line 24
    .line 25
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 26
    .line 27
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 28
    .line 29
    .line 30
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 31
    .line 32
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurfaceH(Landroid/view/Surface;)V

    .line 38
    .line 39
    .line 40
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 41
    .line 42
    invoke-virtual {v1, v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 43
    .line 44
    .line 45
    iget-object v1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 46
    .line 47
    iput-object v2, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 48
    .line 49
    new-instance v2, Ljava/lang/Thread;

    .line 50
    .line 51
    new-instance v3, Ll/xfm$a;

    .line 52
    .line 53
    invoke-direct {v3, p0, v1}, Ll/xfm$a;-><init>(Ll/xfm;Ltv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 54
    .line 55
    .line 56
    const-string p0, "live-media-IikInput"

    .line 57
    .line 58
    invoke-direct {v2, v3, p0}, Ljava/lang/Thread;-><init>(Ljava/lang/Runnable;Ljava/lang/String;)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v2}, Ljava/lang/Thread;->run()V

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :catchall_0
    move-exception p0

    .line 66
    goto :goto_1

    .line 67
    :cond_1
    :goto_0
    monitor-exit v0

    .line 68
    return-void

    .line 69
    :goto_1
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0
.end method


# virtual methods
.method public K(Ll/g510;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/xfm;->v:Ll/g510;

    .line 2
    .line 3
    return-void
.end method

.method public R1()Landroid/content/Context;
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xfm;->B:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 6
    .line 7
    return-object p0

    .line 8
    :cond_0
    invoke-virtual {v0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    if-nez v0, :cond_1

    .line 13
    .line 14
    sget-object p0, Ll/l26;->a:Landroid/content/Context;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    iget-object p0, p0, Ll/xfm;->B:Ljava/lang/ref/WeakReference;

    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    check-cast p0, Landroid/content/Context;

    .line 24
    .line 25
    return-object p0
.end method

.method public S1()J
    .locals 2

    .line 1
    iget-object p0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getCurrentPosition()J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    return-wide v0

    .line 10
    :cond_0
    const-wide/16 v0, 0x0

    .line 11
    .line 12
    return-wide v0
.end method

.method public T1(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->openAudioTracks(Z)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public U1()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfm;->B:Ljava/lang/ref/WeakReference;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Ljava/lang/ref/Reference;->clear()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public V1(Lcom/momo/piplinemomoext/input/audio/a;)V
    .locals 1

    .line 1
    iput-object p1, p0, Ll/xfm;->J:Lcom/momo/piplinemomoext/input/audio/a;

    .line 2
    .line 3
    invoke-interface {p1}, Lcom/momo/piplinemomoext/input/audio/a;->a1()V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Ll/xfm;->J:Lcom/momo/piplinemomoext/input/audio/a;

    .line 7
    .line 8
    const/4 v0, 0x1

    .line 9
    invoke-interface {p1, v0}, Lcom/momo/piplinemomoext/input/audio/a;->l(I)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/xfm;->J:Lcom/momo/piplinemomoext/input/audio/a;

    .line 13
    .line 14
    iget p0, p0, Ll/xfm;->F:F

    .line 15
    .line 16
    invoke-interface {p1, p0}, Ll/l6m;->W1(F)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public W1(III)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xfm;->M:I

    .line 2
    .line 3
    iput p2, p0, Ll/xfm;->N:I

    .line 4
    .line 5
    iput p3, p0, Ll/xfm;->O:I

    .line 6
    .line 7
    return-void
.end method

.method public X1(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->selectAudioTrack(I)V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public Y1(F)V
    .locals 3

    .line 1
    iput p1, p0, Ll/xfm;->F:F

    .line 2
    .line 3
    iget-object v0, p0, Ll/xfm;->J:Lcom/momo/piplinemomoext/input/audio/a;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-interface {v0, p1}, Ll/l6m;->W1(F)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ljava/lang/StringBuilder;

    .line 15
    .line 16
    const-string v2, "level:"

    .line 17
    .line 18
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(F)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string p1, ",mOnlyVideo:"

    .line 25
    .line 26
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    iget-boolean p1, p0, Ll/xfm;->I:Z

    .line 30
    .line 31
    invoke-virtual {v1, p1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    const-string v1, "ijkPlayerInput setVolume"

    .line 39
    .line 40
    filled-new-array {v1, p1}, [Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {v0, p1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 45
    .line 46
    .line 47
    iget-object p1, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 48
    .line 49
    if-eqz p1, :cond_2

    .line 50
    .line 51
    iget-boolean v0, p0, Ll/xfm;->I:Z

    .line 52
    .line 53
    if-eqz v0, :cond_1

    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    invoke-virtual {p1, p0, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_1
    iget p0, p0, Ll/xfm;->F:F

    .line 61
    .line 62
    invoke-virtual {p1, p0, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 63
    .line 64
    .line 65
    :cond_2
    return-void
.end method

.method public catchErrorLog0()V
    .locals 0

    .line 1
    return-void
.end method

.method public catchErrorLog1()V
    .locals 0

    .line 1
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qnw;->destroy()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public getDuration()J
    .locals 3

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "----ijkPlayerInput:getDuration:mMediaPlayer="

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object v2, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 13
    .line 14
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 22
    .line 23
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object p0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 27
    .line 28
    if-eqz p0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->getDuration()J

    .line 31
    .line 32
    .line 33
    move-result-wide v0

    .line 34
    return-wide v0

    .line 35
    :cond_0
    const-wide/16 v0, 0x0

    .line 36
    .line 37
    return-wide v0
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
.end method

.method public getInputHeight()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xfm;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public getInputWidth()I
    .locals 0

    .line 1
    iget p0, p0, Ll/xfm;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public getScreenTexture()Landroid/graphics/SurfaceTexture;
    .locals 5

    .line 1
    iget-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

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
    iput-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 58
    .line 59
    :cond_0
    iget-object p0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

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
    invoke-super {p0}, Ll/qnw;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Ll/xfm;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    .line 11
    new-instance v0, Landroid/view/Surface;

    .line 12
    .line 13
    iget-object v1, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 19
    .line 20
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    new-instance v1, Ljava/lang/StringBuilder;

    .line 25
    .line 26
    const-string v2, "initWithGLContext(), @@@@@@@@@@ mText="

    .line 27
    .line 28
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v2, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 32
    .line 33
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v2, "; mSurface="

    .line 37
    .line 38
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v2, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 42
    .line 43
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v2, ";inputWidth="

    .line 47
    .line 48
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    iget v2, p0, Ll/xfm;->C:I

    .line 52
    .line 53
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v2, ";inputHeight="

    .line 57
    .line 58
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    iget v2, p0, Ll/xfm;->D:I

    .line 62
    .line 63
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    const-string v2, ";texture_in="

    .line 67
    .line 68
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 69
    .line 70
    .line 71
    iget v2, p0, Ll/wej;->texture_in:I

    .line 72
    .line 73
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v1

    .line 80
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 81
    .line 82
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 86
    .line 87
    iget v1, p0, Ll/xfm;->C:I

    .line 88
    .line 89
    iget v2, p0, Ll/xfm;->D:I

    .line 90
    .line 91
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 92
    .line 93
    .line 94
    iget-object v0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 95
    .line 96
    iget-object p0, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 97
    .line 98
    invoke-virtual {v0, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurfaceH(Landroid/view/Surface;)V

    .line 99
    .line 100
    .line 101
    :cond_0
    return-void
.end method

.method public onBufferingUpdate(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public onCompletion(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/xfm;->G:Z

    .line 3
    .line 4
    return-void
.end method

.method public onDrawFrame()V
    .locals 2
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    iget v0, p0, Ll/wej;->texture_in:I

    .line 2
    .line 3
    iget-object v1, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 6
    .line 7
    .line 8
    invoke-super {p0}, Ll/wej;->onDrawFrame()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public onError(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 5

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    new-instance v0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v1, "IMediaPlayer Error"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 13
    .line 14
    .line 15
    move-result-wide v1

    .line 16
    iget-wide v3, p0, Ll/xfm;->E:J

    .line 17
    .line 18
    sub-long/2addr v1, v3

    .line 19
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    const-string v1, "mswhat"

    .line 23
    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 28
    .line 29
    .line 30
    const-string p2, "extra"

    .line 31
    .line 32
    invoke-virtual {v0, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    invoke-virtual {v0, p3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 36
    .line 37
    .line 38
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    const-string p3, "Pipeline_Normal_pip->PIPLINE"

    .line 43
    .line 44
    invoke-virtual {p1, p3, p2}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const/4 p1, 0x0

    .line 48
    iput-boolean p1, p0, Ll/xfm;->G:Z

    .line 49
    .line 50
    const/4 p0, 0x1

    .line 51
    return p0
.end method

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    const-string v0, "Pipeline_Normal_pip->PIPLINE"

    .line 6
    .line 7
    const-string v1, "onFrameAvailable"

    .line 8
    .line 9
    invoke-virtual {p1, v0, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-object p1, p0, Ll/xfm;->v:Ll/g510;

    .line 13
    .line 14
    if-eqz p1, :cond_0

    .line 15
    .line 16
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object p1

    .line 20
    invoke-virtual {p1, v0, v1}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p0, Ll/xfm;->v:Ll/g510;

    .line 24
    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/g510;->z(Ll/omw;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void
.end method

.method public onInfo(Ltv/danmaku/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/xfm;->A:Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-interface {v0, p1, p2, p3, p4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;->onMediaDateCallback([BIILtv/danmaku/ijk/media/player/IjkMediaPlayer;)V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v1, p0, Ll/xfm;->J:Lcom/momo/piplinemomoext/input/audio/a;

    .line 9
    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iget-boolean v0, p0, Ll/xfm;->I:Z

    .line 13
    .line 14
    if-nez v0, :cond_1

    .line 15
    .line 16
    iget v6, p0, Ll/xfm;->N:I

    .line 17
    .line 18
    move-object v2, p1

    .line 19
    move v3, p2

    .line 20
    move v4, p3

    .line 21
    move-object v5, p4

    .line 22
    invoke-interface/range {v1 .. v6}, Lcom/momo/piplinemomoext/input/audio/a;->G0([BIILjava/lang/Object;I)V

    .line 23
    .line 24
    .line 25
    :cond_1
    return-void
.end method

.method public onPrepared(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 6
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/xfm;->G:Z

    .line 3
    .line 4
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    iput v0, p0, Ll/xfm;->C:I

    .line 9
    .line 10
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->getVideoHeight()I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Ll/xfm;->D:I

    .line 15
    .line 16
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "openPublishHelp, <onPrepared> cost time:"

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 28
    .line 29
    .line 30
    move-result-wide v2

    .line 31
    iget-wide v4, p0, Ll/xfm;->E:J

    .line 32
    .line 33
    sub-long/2addr v2, v4

    .line 34
    invoke-virtual {v1, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 35
    .line 36
    .line 37
    const-string v2, "ms height"

    .line 38
    .line 39
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    .line 41
    .line 42
    iget v2, p0, Ll/xfm;->C:I

    .line 43
    .line 44
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 45
    .line 46
    .line 47
    const-string v2, "height"

    .line 48
    .line 49
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    iget v2, p0, Ll/xfm;->D:I

    .line 53
    .line 54
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 62
    .line 63
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    iget-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 67
    .line 68
    if-eqz v0, :cond_0

    .line 69
    .line 70
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    new-instance v1, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    const-string v3, "onPrepared, @@@@@@@@@@ mText="

    .line 77
    .line 78
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    iget-object v3, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 82
    .line 83
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 84
    .line 85
    .line 86
    const-string v3, "; mSurface="

    .line 87
    .line 88
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    iget-object v3, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 92
    .line 93
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    const-string v3, ";inputWidth="

    .line 97
    .line 98
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 99
    .line 100
    .line 101
    iget v3, p0, Ll/xfm;->C:I

    .line 102
    .line 103
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    const-string v3, ";inputHeight="

    .line 107
    .line 108
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    iget v3, p0, Ll/xfm;->D:I

    .line 112
    .line 113
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 114
    .line 115
    .line 116
    const-string v3, ";texture_in="

    .line 117
    .line 118
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 119
    .line 120
    .line 121
    iget v3, p0, Ll/wej;->texture_in:I

    .line 122
    .line 123
    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 124
    .line 125
    .line 126
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v1

    .line 130
    invoke-virtual {v0, v2, v1}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 134
    .line 135
    iget v1, p0, Ll/xfm;->C:I

    .line 136
    .line 137
    iget v2, p0, Ll/xfm;->D:I

    .line 138
    .line 139
    invoke-virtual {v0, v1, v2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 140
    .line 141
    .line 142
    :cond_0
    iget-object p0, p0, Ll/xfm;->v:Ll/g510;

    .line 143
    .line 144
    if-eqz p0, :cond_1

    .line 145
    .line 146
    const/4 v0, 0x0

    .line 147
    invoke-virtual {p0, v0}, Ll/g510;->z(Ll/omw;)V

    .line 148
    .line 149
    .line 150
    :cond_1
    invoke-interface {p1}, Ltv/danmaku/ijk/media/player/IMediaPlayer;->start()V

    .line 151
    .line 152
    .line 153
    return-void
.end method

.method public onSeekComplete(Ltv/danmaku/ijk/media/player/IMediaPlayer;)V
    .locals 0

    .line 1
    return-void
.end method

.method public onVideoMediacodecChanged(Ltv/danmaku/ijk/media/player/IMediaPlayer;I)V
    .locals 0

    .line 1
    return-void
.end method

.method public pause()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ll/xfm;->G:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->pause()V

    .line 10
    .line 11
    .line 12
    :cond_0
    iget-object p0, p0, Ll/xfm;->J:Lcom/momo/piplinemomoext/input/audio/a;

    .line 13
    .line 14
    if-eqz p0, :cond_1

    .line 15
    .line 16
    invoke-interface {p0}, Lcom/momo/piplinemomoext/input/audio/a;->a1()V

    .line 17
    .line 18
    .line 19
    :cond_1
    return-void
.end method

.method public resume()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/xfm;->G:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->start()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public seek(J)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean p0, p0, Ll/xfm;->G:Z

    .line 6
    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->seekTo(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setFps(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/xfm;->H:I

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 12
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xe
    .end annotation

    .line 1
    const-string v0, "openPublishHelp, end, cost time:"

    .line 2
    .line 3
    const-string v1, "OnlyVideo:"

    .line 4
    .line 5
    const-string v2, "openPublishHelp(setSurfaceH), @@@@@@@@@@ mText="

    .line 6
    .line 7
    const-string v3, "openPublishHelp, @@@@@@@@@@ mText="

    .line 8
    .line 9
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 10
    .line 11
    .line 12
    move-result-wide v4

    .line 13
    iput-wide v4, p0, Ll/xfm;->E:J

    .line 14
    .line 15
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 16
    .line 17
    .line 18
    move-result-object v4

    .line 19
    const-string v5, "openPublishHelp, start"

    .line 20
    .line 21
    const-string v6, "Pipeline_Normal_pip->PIPLINE"

    .line 22
    .line 23
    invoke-virtual {v4, v6, v5}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    iget-object v4, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 27
    .line 28
    const-string v5, "ms"

    .line 29
    .line 30
    if-eqz v4, :cond_0

    .line 31
    .line 32
    invoke-direct {p0}, Ll/xfm;->stopAndReleasePlayer()V

    .line 33
    .line 34
    .line 35
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 36
    .line 37
    .line 38
    move-result-object v4

    .line 39
    new-instance v7, Ljava/lang/StringBuilder;

    .line 40
    .line 41
    const-string v8, "openPublishHelp, <release> cost time:"

    .line 42
    .line 43
    invoke-direct {v7, v8}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 47
    .line 48
    .line 49
    move-result-wide v8

    .line 50
    iget-wide v10, p0, Ll/xfm;->E:J

    .line 51
    .line 52
    sub-long/2addr v8, v10

    .line 53
    invoke-virtual {v7, v8, v9}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v7, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {v7}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object v7

    .line 63
    invoke-virtual {v4, v6, v7}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_0
    :try_start_0
    iget-object v4, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    .line 67
    .line 68
    const-string v7, "; mSurface="

    .line 69
    .line 70
    const-string v8, ";texture_in="

    .line 71
    .line 72
    if-nez v4, :cond_1

    .line 73
    .line 74
    :try_start_1
    invoke-virtual {p0}, Ll/xfm;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 75
    .line 76
    .line 77
    move-result-object v4

    .line 78
    iput-object v4, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 79
    .line 80
    new-instance v4, Landroid/view/Surface;

    .line 81
    .line 82
    iget-object v9, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 83
    .line 84
    invoke-direct {v4, v9}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 85
    .line 86
    .line 87
    iput-object v4, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 88
    .line 89
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    new-instance v9, Ljava/lang/StringBuilder;

    .line 94
    .line 95
    invoke-direct {v9, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 96
    .line 97
    .line 98
    iget-object v3, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 99
    .line 100
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 101
    .line 102
    .line 103
    invoke-virtual {v9, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 104
    .line 105
    .line 106
    iget-object v3, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 107
    .line 108
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    iget v3, p0, Ll/wej;->texture_in:I

    .line 115
    .line 116
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v9, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 120
    .line 121
    .line 122
    iget v3, p0, Ll/wej;->texture_in:I

    .line 123
    .line 124
    invoke-virtual {v9, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 125
    .line 126
    .line 127
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-virtual {v4, v6, v3}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    :cond_1
    new-instance v3, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 135
    .line 136
    invoke-virtual {p0}, Ll/xfm;->R1()Landroid/content/Context;

    .line 137
    .line 138
    .line 139
    move-result-object v4

    .line 140
    iget-object v9, p0, Ll/xfm;->P:Ll/brx;

    .line 141
    .line 142
    invoke-direct {v3, v4, v9}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;-><init>(Landroid/content/Context;Ll/brx;)V

    .line 143
    .line 144
    .line 145
    iput-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 146
    .line 147
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnPreparedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnPreparedListener;)V

    .line 148
    .line 149
    .line 150
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 151
    .line 152
    const/4 v4, 0x0

    .line 153
    invoke-virtual {v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaCodecEnabled(Z)V

    .line 154
    .line 155
    .line 156
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 157
    .line 158
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnCompletionListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnCompletionListener;)V

    .line 159
    .line 160
    .line 161
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 162
    .line 163
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 164
    .line 165
    .line 166
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 167
    .line 168
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnErrorListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 169
    .line 170
    .line 171
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 172
    .line 173
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnSeekCompleteListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnSeekCompleteListener;)V

    .line 174
    .line 175
    .line 176
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 177
    .line 178
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnInfoListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 179
    .line 180
    .line 181
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 182
    .line 183
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnBufferingUpdateListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnBufferingUpdateListener;)V

    .line 184
    .line 185
    .line 186
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 187
    .line 188
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoMediacodecChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoMediacodecChangedListener;)V

    .line 189
    .line 190
    .line 191
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 192
    .line 193
    invoke-virtual {v3, p0}, Ltv/danmaku/ijk/media/player/SimpleMediaPlayer;->setOnVideoSizeChangedListener(Ltv/danmaku/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 194
    .line 195
    .line 196
    iget-boolean v3, p0, Ll/xfm;->I:Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_1 .. :try_end_1} :catch_0

    .line 197
    .line 198
    iget-object v9, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 199
    .line 200
    if-nez v3, :cond_2

    .line 201
    .line 202
    :try_start_2
    invoke-virtual {v9, p0}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 203
    .line 204
    .line 205
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 206
    .line 207
    const/4 v4, 0x1

    .line 208
    invoke-virtual {v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 209
    .line 210
    .line 211
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 212
    .line 213
    iget v4, p0, Ll/xfm;->M:I

    .line 214
    .line 215
    int-to-long v9, v4

    .line 216
    const/16 v4, 0x4e38

    .line 217
    .line 218
    invoke-virtual {v3, v4, v9, v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 219
    .line 220
    .line 221
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 222
    .line 223
    iget v4, p0, Ll/xfm;->N:I

    .line 224
    .line 225
    int-to-long v9, v4

    .line 226
    const/16 v4, 0x4e36

    .line 227
    .line 228
    invoke-virtual {v3, v4, v9, v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 229
    .line 230
    .line 231
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 232
    .line 233
    iget v4, p0, Ll/xfm;->O:I

    .line 234
    .line 235
    int-to-long v9, v4

    .line 236
    const/16 v4, 0x4e37

    .line 237
    .line 238
    invoke-virtual {v3, v4, v9, v10}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setPropertyLong(IJ)V

    .line 239
    .line 240
    .line 241
    goto :goto_0

    .line 242
    :cond_2
    const/4 v3, 0x0

    .line 243
    invoke-virtual {v9, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDataCallback(Ltv/danmaku/ijk/media/player/IjkMediaPlayer$MediaDateCallback;)V

    .line 244
    .line 245
    .line 246
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 247
    .line 248
    invoke-virtual {v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setMediaDateCallbackFlags(I)V

    .line 249
    .line 250
    .line 251
    :goto_0
    iget-object v3, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 252
    .line 253
    iget-object v4, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 254
    .line 255
    invoke-virtual {v3, v4}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setSurfaceH(Landroid/view/Surface;)V

    .line 256
    .line 257
    .line 258
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 259
    .line 260
    .line 261
    move-result-object v3

    .line 262
    new-instance v4, Ljava/lang/StringBuilder;

    .line 263
    .line 264
    invoke-direct {v4, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    iget-object v2, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 268
    .line 269
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 270
    .line 271
    .line 272
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    .line 274
    .line 275
    iget-object v2, p0, Ll/xfm;->z:Landroid/view/Surface;

    .line 276
    .line 277
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 278
    .line 279
    .line 280
    invoke-virtual {v4, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 281
    .line 282
    .line 283
    iget v2, p0, Ll/wej;->texture_in:I

    .line 284
    .line 285
    invoke-virtual {v4, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 286
    .line 287
    .line 288
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    invoke-virtual {v3, v6, v2}, Ll/oq70;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    iget-object v2, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 296
    .line 297
    iget-object v3, p0, Ll/xfm;->y:Ljava/lang/String;

    .line 298
    .line 299
    invoke-virtual {v3}, Ljava/lang/String;->toString()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v3

    .line 303
    invoke-virtual {v2, v3}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setDataSource(Ljava/lang/String;)V

    .line 304
    .line 305
    .line 306
    iget-object v2, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 307
    .line 308
    invoke-virtual {v2}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->prepareAsync()V

    .line 309
    .line 310
    .line 311
    invoke-static {}, Ll/b7y;->c()Ll/b7y;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    const-string v3, "ijkPlayerInput"

    .line 316
    .line 317
    new-instance v4, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    invoke-direct {v4, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 320
    .line 321
    .line 322
    iget-boolean v1, p0, Ll/xfm;->I:Z

    .line 323
    .line 324
    invoke-virtual {v4, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 325
    .line 326
    .line 327
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    filled-new-array {v3, v1}, [Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v1

    .line 335
    invoke-virtual {v2, v1}, Ll/b7y;->g([Ljava/lang/Object;)V

    .line 336
    .line 337
    .line 338
    iget-boolean v1, p0, Ll/xfm;->I:Z
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_2 .. :try_end_2} :catch_0

    .line 339
    .line 340
    iget-object v2, p0, Ll/xfm;->x:Ltv/danmaku/ijk/media/player/IjkMediaPlayer;

    .line 341
    .line 342
    if-eqz v1, :cond_3

    .line 343
    .line 344
    const/4 v1, 0x0

    .line 345
    :try_start_3
    invoke-virtual {v2, v1, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 346
    .line 347
    .line 348
    goto :goto_1

    .line 349
    :cond_3
    iget v1, p0, Ll/xfm;->F:F

    .line 350
    .line 351
    invoke-virtual {v2, v1, v1}, Ltv/danmaku/ijk/media/player/IjkMediaPlayer;->setVolume(FF)V

    .line 352
    .line 353
    .line 354
    :goto_1
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    new-instance v2, Ljava/lang/StringBuilder;

    .line 359
    .line 360
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 361
    .line 362
    .line 363
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 364
    .line 365
    .line 366
    move-result-wide v3

    .line 367
    iget-wide v7, p0, Ll/xfm;->E:J

    .line 368
    .line 369
    sub-long/2addr v3, v7

    .line 370
    invoke-virtual {v2, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 371
    .line 372
    .line 373
    invoke-virtual {v2, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 374
    .line 375
    .line 376
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 377
    .line 378
    .line 379
    move-result-object v0

    .line 380
    invoke-virtual {v1, v6, v0}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Ll/xfm;->L:Ll/xfm$b;

    .line 384
    .line 385
    if-nez v0, :cond_4

    .line 386
    .line 387
    new-instance v0, Ll/xfm$b;

    .line 388
    .line 389
    const-string v1, "live-media-ijkRender"

    .line 390
    .line 391
    invoke-direct {v0, p0, v1}, Ll/xfm$b;-><init>(Ll/xfm;Ljava/lang/String;)V

    .line 392
    .line 393
    .line 394
    iput-object v0, p0, Ll/xfm;->L:Ll/xfm$b;

    .line 395
    .line 396
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3 .. :try_end_3} :catch_0

    .line 397
    .line 398
    .line 399
    :cond_4
    return-void

    .line 400
    :catch_0
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 401
    .line 402
    .line 403
    move-result-object v0

    .line 404
    new-instance v1, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    const-string v2, "openPublishHelp Unable to open content: "

    .line 407
    .line 408
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    iget-object v2, p0, Ll/xfm;->y:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 414
    .line 415
    .line 416
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 417
    .line 418
    .line 419
    move-result-object v1

    .line 420
    invoke-virtual {v0, v6, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 421
    .line 422
    .line 423
    invoke-direct {p0}, Ll/xfm;->stopAndReleasePlayer()V

    .line 424
    .line 425
    .line 426
    invoke-virtual {p0}, Ll/xfm;->catchErrorLog1()V

    .line 427
    .line 428
    .line 429
    return-void

    .line 430
    :catch_1
    invoke-direct {p0}, Ll/xfm;->stopAndReleasePlayer()V

    .line 431
    .line 432
    .line 433
    invoke-virtual {p0}, Ll/xfm;->catchErrorLog0()V

    .line 434
    .line 435
    .line 436
    return-void
.end method

.method public stop()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/xfm;->G:Z

    .line 3
    .line 4
    invoke-direct {p0}, Ll/xfm;->stopAndReleasePlayer()V

    .line 5
    .line 6
    .line 7
    iget-object v0, p0, Ll/xfm;->L:Ll/xfm$b;

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/xfm$b;->a()V

    .line 12
    .line 13
    .line 14
    const/4 v0, 0x0

    .line 15
    iput-object v0, p0, Ll/xfm;->L:Ll/xfm$b;

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/xfm;->U1()V

    .line 18
    .line 19
    .line 20
    return-void
.end method
