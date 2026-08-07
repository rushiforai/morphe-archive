.class public Ll/csh0;
.super Ll/irh0;
.source "SourceFile"


# instance fields
.field k:Landroid/graphics/SurfaceTexture;

.field l:Landroid/view/Surface;

.field m:[F

.field n:I

.field o:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;


# direct methods
.method public constructor <init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/irh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 2
    .line 3
    .line 4
    const/16 p2, 0x10

    .line 5
    .line 6
    new-array p2, p2, [F

    .line 7
    .line 8
    iput-object p2, p0, Ll/csh0;->m:[F

    .line 9
    .line 10
    new-instance p2, Ll/csh0$a;

    .line 11
    .line 12
    invoke-direct {p2, p0}, Ll/csh0$a;-><init>(Ll/csh0;)V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Ll/csh0;->o:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    .line 16
    .line 17
    iget-object p2, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    iput-object p2, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 20
    .line 21
    iget p1, p1, Ll/jrh0$a;->e:I

    .line 22
    .line 23
    iput p1, p0, Ll/csh0;->n:I

    .line 24
    .line 25
    new-instance p1, Landroid/view/Surface;

    .line 26
    .line 27
    iget-object p2, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 28
    .line 29
    invoke-direct {p1, p2}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 30
    .line 31
    .line 32
    iput-object p1, p0, Ll/csh0;->l:Landroid/view/Surface;

    .line 33
    .line 34
    return-void
.end method

.method private p(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    .locals 1
    .param p1    # Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    iget-object p0, p0, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->E()Landroid/os/Handler;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-virtual {v0, p1, p0}, Landroid/graphics/SurfaceTexture;->setOnFrameAvailableListener(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;Landroid/os/Handler;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public d()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/csh0;->l:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public h(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 2
    .param p1    # Landroid/hardware/camera2/params/StreamConfigurationMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    const-class v0, Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 8
    .line 9
    invoke-virtual {v1}, Lcom/ss/android/ttvecamera/c;->u()Lcom/ss/android/ttvecamera/TECameraSettings;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    iget-boolean v1, v1, Lcom/ss/android/ttvecamera/TECameraSettings;->a0:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    const-class v1, Landroid/media/MediaRecorder;

    .line 18
    .line 19
    invoke-virtual {p1, v1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(Ljava/lang/Class;)[Landroid/util/Size;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ll/irh0;->a([Landroid/util/Size;)Ljava/util/List;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    invoke-static {v0}, Ll/irh0;->a([Landroid/util/Size;)Ljava/util/List;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-static {v0, p1}, Lcom/ss/android/ttvecamera/f;->t(Ljava/util/List;Ljava/util/List;)Ljava/util/List;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {p0, p1, p2}, Ll/csh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    return p0

    .line 40
    :cond_0
    invoke-static {v0}, Ll/irh0;->a([Landroid/util/Size;)Ljava/util/List;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    invoke-virtual {p0, p1, p2}, Ll/csh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 45
    .line 46
    .line 47
    move-result p0

    .line 48
    return p0
.end method

.method public i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 1
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0xf
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ">;",
            "Lcom/ss/android/ttvecamera/TEFrameSizei;",
            ")I"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-lez p2, :cond_2

    .line 8
    .line 9
    iget-object p2, p0, Ll/irh0;->h:Lcom/ss/android/ttvecamera/c$e;

    .line 10
    .line 11
    if-eqz p2, :cond_1

    .line 12
    .line 13
    invoke-interface {p2, p1}, Lcom/ss/android/ttvecamera/c$e;->getPreviewSize(Ljava/util/List;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 14
    .line 15
    .line 16
    move-result-object p2

    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iput-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 20
    .line 21
    goto :goto_0

    .line 22
    :cond_0
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 23
    .line 24
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    iput-object p1, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 29
    .line 30
    goto :goto_0

    .line 31
    :cond_1
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 32
    .line 33
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    iput-object p1, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 38
    .line 39
    :cond_2
    :goto_0
    iget-object p1, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 40
    .line 41
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 42
    .line 43
    iget v0, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 44
    .line 45
    iget p2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 46
    .line 47
    invoke-virtual {p1, v0, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Ll/csh0;->o:Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;

    .line 51
    .line 52
    invoke-direct {p0, p1}, Ll/csh0;->p(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 53
    .line 54
    .line 55
    const/4 p0, 0x0

    .line 56
    return p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/csh0;->l:Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 9
    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    invoke-virtual {v0}, Landroid/graphics/SurfaceTexture;->release()V

    .line 13
    .line 14
    .line 15
    :cond_1
    new-instance v0, Landroid/graphics/SurfaceTexture;

    .line 16
    .line 17
    iget v1, p0, Ll/csh0;->n:I

    .line 18
    .line 19
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 23
    .line 24
    new-instance v0, Landroid/view/Surface;

    .line 25
    .line 26
    iget-object v1, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/csh0;->l:Landroid/view/Surface;

    .line 32
    .line 33
    iget-object v0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 34
    .line 35
    iget-object p0, p0, Ll/csh0;->k:Landroid/graphics/SurfaceTexture;

    .line 36
    .line 37
    invoke-interface {v0, p0}, Ll/irh0$c;->onNewSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/irh0;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/csh0;->l:Landroid/view/Surface;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/csh0;->l:Landroid/view/Surface;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
