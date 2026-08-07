.class public Ll/sti0;
.super Ll/qnw;
.source "SourceFile"

# interfaces
.implements Ll/z5m;
.implements Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/sti0$b;
    }
.end annotation


# instance fields
.field A:Lcom/immomo/mediacore/sink/CongressUtil;

.field B:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

.field C:Ll/gkl0$c;

.field D:J

.field E:Ljava/lang/Runnable;

.field private F:Landroid/os/Handler;

.field v:Ll/g510;

.field private x:Ll/sti0$b;

.field y:I

.field z:J


# direct methods
.method public constructor <init>(JIILcom/immomo/mediacore/sink/CongressUtil;)V
    .locals 2

    .line 38
    invoke-direct {p0}, Ll/qnw;-><init>()V

    const/16 v0, 0xf

    .line 39
    iput v0, p0, Ll/sti0;->y:I

    const-wide/16 v0, 0x2710

    .line 40
    iput-wide v0, p0, Ll/sti0;->z:J

    const/4 v0, 0x0

    .line 41
    iput-object v0, p0, Ll/sti0;->C:Ll/gkl0$c;

    .line 42
    iput-object v0, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 43
    new-instance v0, Landroid/os/Handler;

    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    move-result-object v1

    invoke-direct {v0, v1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    iput-object v0, p0, Ll/sti0;->F:Landroid/os/Handler;

    .line 44
    invoke-virtual {p0, p3, p4}, Ll/qnw;->setRenderSize(II)V

    .line 45
    iput-object p5, p0, Ll/sti0;->A:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 46
    iput-wide p1, p0, Ll/sti0;->D:J

    return-void
.end method

.method public constructor <init>(JIILl/gkl0$c;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ll/qnw;-><init>()V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0xf

    .line 5
    .line 6
    iput v0, p0, Ll/sti0;->y:I

    .line 7
    .line 8
    const-wide/16 v0, 0x2710

    .line 9
    .line 10
    iput-wide v0, p0, Ll/sti0;->z:J

    .line 11
    .line 12
    const/4 v0, 0x0

    .line 13
    iput-object v0, p0, Ll/sti0;->C:Ll/gkl0$c;

    .line 14
    .line 15
    iput-object v0, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 16
    .line 17
    new-instance v1, Landroid/os/Handler;

    .line 18
    .line 19
    invoke-static {}, Landroid/os/Looper;->getMainLooper()Landroid/os/Looper;

    .line 20
    .line 21
    .line 22
    move-result-object v2

    .line 23
    invoke-direct {v1, v2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 24
    .line 25
    .line 26
    iput-object v1, p0, Ll/sti0;->F:Landroid/os/Handler;

    .line 27
    .line 28
    invoke-virtual {p0, p3, p4}, Ll/qnw;->setRenderSize(II)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/sti0;->A:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 32
    .line 33
    iput-wide p1, p0, Ll/sti0;->D:J

    .line 34
    .line 35
    iput-object p5, p0, Ll/sti0;->C:Ll/gkl0$c;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public K(Ll/g510;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/sti0;->v:Ll/g510;

    .line 2
    .line 3
    return-void
.end method

.method public Q1()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wej;->getHeight()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public R1()I
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/wej;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public destroy()V
    .locals 3

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-object v0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 3
    .line 4
    invoke-static {}, Ll/oq70;->d()Ll/oq70;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ljava/lang/StringBuilder;

    .line 9
    .line 10
    const-string v2, "destorytextIn:"

    .line 11
    .line 12
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    iget v2, p0, Ll/wej;->texture_in:I

    .line 16
    .line 17
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    const-string v2, "Pipeline_Normal_pip->PIPLINE"

    .line 25
    .line 26
    invoke-virtual {v0, v2, v1}, Ll/oq70;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    invoke-super {p0}, Ll/qnw;->destroy()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public getInput()Ll/gfj;
    .locals 0

    .line 1
    return-object p0
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
    .locals 4

    .line 1
    invoke-super {p0}, Ll/qnw;->initWithGLContext()V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/view/Surface;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/sti0;->getScreenTexture()Landroid/graphics/SurfaceTexture;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 11
    .line 12
    .line 13
    iget-object v1, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 14
    .line 15
    invoke-virtual {v1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 16
    .line 17
    .line 18
    iget-object v1, p0, Ll/sti0;->B:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    invoke-virtual {v1, v0}, Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;->setSurfaceH(Landroid/view/Surface;)V

    .line 23
    .line 24
    .line 25
    :cond_0
    iget-object v1, p0, Ll/sti0;->A:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 26
    .line 27
    if-eqz v1, :cond_1

    .line 28
    .line 29
    iget-wide v2, p0, Ll/sti0;->D:J

    .line 30
    .line 31
    invoke-virtual {v1, v2, v3, v0}, Lcom/immomo/mediacore/sink/CongressUtil;->setVideoSurface(JLandroid/view/Surface;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    iget-object v0, p0, Ll/sti0;->C:Ll/gkl0$c;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    iget-object p0, p0, Ll/qnw;->b:Landroid/graphics/SurfaceTexture;

    .line 39
    .line 40
    invoke-interface {v0, p0}, Ll/gkl0$c;->a(Landroid/graphics/SurfaceTexture;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    return-void
.end method

.method public onDrawFrame()V
    .locals 2

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

.method public onFrameAvailable(Landroid/graphics/SurfaceTexture;)V
    .locals 3

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
    const-string v1, ">>>>>>>>>>>>>>>>>>>>1 onFrameAvailable"

    .line 8
    .line 9
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    iget-wide v1, p0, Ll/sti0;->D:J

    .line 13
    .line 14
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    const-string v1, "\u300a\u300b"

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    const-string v1, "Pipeline_Normal_pip->PIPLINE"

    .line 30
    .line 31
    invoke-virtual {p1, v1, v0}, Ll/oq70;->f(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    iget-object p1, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 35
    .line 36
    if-nez p1, :cond_0

    .line 37
    .line 38
    new-instance p1, Ll/sti0$a;

    .line 39
    .line 40
    invoke-direct {p1, p0}, Ll/sti0$a;-><init>(Ll/sti0;)V

    .line 41
    .line 42
    .line 43
    iput-object p1, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 44
    .line 45
    :cond_0
    iget-object p1, p0, Ll/sti0;->F:Landroid/os/Handler;

    .line 46
    .line 47
    if-eqz p1, :cond_1

    .line 48
    .line 49
    iget-object v0, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 50
    .line 51
    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 52
    .line 53
    .line 54
    iget-object p1, p0, Ll/sti0;->F:Landroid/os/Handler;

    .line 55
    .line 56
    iget-object v0, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 57
    .line 58
    iget-wide v1, p0, Ll/sti0;->z:J

    .line 59
    .line 60
    invoke-virtual {p1, v0, v1, v2}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    .line 61
    .line 62
    .line 63
    :cond_1
    return-void
.end method

.method public releaseFrameBuffer()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/qnw;->releaseFrameBuffer()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setFps(I)V
    .locals 0

    .line 1
    iput p1, p0, Ll/sti0;->y:I

    .line 2
    .line 3
    return-void
.end method

.method public start()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/sti0;->x:Ll/sti0$b;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/sti0$b;

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-direct {v0, p0, v1}, Ll/sti0$b;-><init>(Ll/sti0;Ll/sti0$a;)V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Ll/sti0;->x:Ll/sti0$b;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public stop()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/sti0;->x:Ll/sti0$b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/sti0$b;->a()V

    .line 7
    .line 8
    .line 9
    iput-object v1, p0, Ll/sti0;->x:Ll/sti0$b;

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Ll/sti0;->F:Landroid/os/Handler;

    .line 12
    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    iget-object v2, p0, Ll/sti0;->E:Ljava/lang/Runnable;

    .line 16
    .line 17
    if-eqz v2, :cond_1

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    iput-object v1, p0, Ll/sti0;->A:Lcom/immomo/mediacore/sink/CongressUtil;

    .line 23
    .line 24
    iput-object v1, p0, Ll/sti0;->B:Ltv/danmaku/ijk/media/player/IjkConfMediaPlayer;

    .line 25
    .line 26
    const-wide/16 v0, 0x0

    .line 27
    .line 28
    iput-wide v0, p0, Ll/sti0;->D:J

    .line 29
    .line 30
    return-void
.end method
