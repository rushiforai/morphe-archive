.class public Ll/ash0;
.super Ll/irh0;
.source "SourceFile"


# instance fields
.field private k:Landroid/view/Surface;

.field private l:Landroid/view/Surface;

.field private m:Landroid/graphics/SurfaceTexture;

.field private n:[F

.field o:I


# direct methods
.method public constructor <init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V
    .locals 1

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
    iput-object p2, p0, Ll/ash0;->n:[F

    .line 9
    .line 10
    iget-object p2, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 11
    .line 12
    iput-object p2, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    iget p2, p1, Ll/jrh0$a;->e:I

    .line 15
    .line 16
    iput p2, p0, Ll/ash0;->o:I

    .line 17
    .line 18
    new-instance p2, Landroid/view/Surface;

    .line 19
    .line 20
    iget-object v0, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 21
    .line 22
    invoke-direct {p2, v0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 23
    .line 24
    .line 25
    iput-object p2, p0, Ll/ash0;->l:Landroid/view/Surface;

    .line 26
    .line 27
    iget-object p1, p1, Ll/jrh0$a;->g:Landroid/view/Surface;

    .line 28
    .line 29
    iput-object p1, p0, Ll/ash0;->k:Landroid/view/Surface;

    .line 30
    .line 31
    return-void
.end method

.method public static synthetic p(Ll/ash0;)[F
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ash0;->n:[F

    .line 2
    .line 3
    return-object p0
.end method

.method private q(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V
    .locals 1
    .param p1    # Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object v0, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

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
.method public b()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ash0;->k:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public d()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ash0;->l:Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public e()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    const/16 p0, 0x10

    .line 2
    .line 3
    return p0
.end method

.method public h(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 1
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
    move-result-object p1

    .line 7
    invoke-static {p1}, Ll/irh0;->a([Landroid/util/Size;)Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1, p2}, Ll/ash0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 1
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
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/List;->size()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-lez p2, :cond_0

    .line 8
    .line 9
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 10
    .line 11
    invoke-static {p1, p2}, Lcom/ss/android/ttvecamera/f;->b(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    iput-object p1, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 16
    .line 17
    :cond_0
    iget-object p1, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 20
    .line 21
    iget v0, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 22
    .line 23
    iget p2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 24
    .line 25
    invoke-virtual {p1, v0, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/ash0$a;

    .line 29
    .line 30
    invoke-direct {p1, p0}, Ll/ash0$a;-><init>(Ll/ash0;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {p0, p1}, Ll/ash0;->q(Landroid/graphics/SurfaceTexture$OnFrameAvailableListener;)V

    .line 34
    .line 35
    .line 36
    const/4 p0, 0x0

    .line 37
    return p0
.end method

.method public l()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ash0;->l:Landroid/view/Surface;

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
    iget-object v0, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

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
    iget v1, p0, Ll/ash0;->o:I

    .line 18
    .line 19
    invoke-direct {v0, v1}, Landroid/graphics/SurfaceTexture;-><init>(I)V

    .line 20
    .line 21
    .line 22
    iput-object v0, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

    .line 23
    .line 24
    new-instance v0, Landroid/view/Surface;

    .line 25
    .line 26
    iget-object v1, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    invoke-direct {v0, v1}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/ash0;->l:Landroid/view/Surface;

    .line 32
    .line 33
    iget-object v0, p0, Ll/irh0;->a:Ll/irh0$c;

    .line 34
    .line 35
    iget-object p0, p0, Ll/ash0;->m:Landroid/graphics/SurfaceTexture;

    .line 36
    .line 37
    invoke-interface {v0, p0}, Ll/irh0$c;->onNewSurfaceTexture(Landroid/graphics/SurfaceTexture;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public m()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/irh0;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ash0;->l:Landroid/view/Surface;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Ll/ash0;->l:Landroid/view/Surface;

    .line 13
    .line 14
    :cond_0
    iget-object v0, p0, Ll/ash0;->k:Landroid/view/Surface;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    invoke-virtual {v0}, Landroid/view/Surface;->release()V

    .line 19
    .line 20
    .line 21
    iput-object v1, p0, Ll/ash0;->k:Landroid/view/Surface;

    .line 22
    .line 23
    :cond_1
    return-void
.end method
