.class public Ll/xrh0;
.super Ll/irh0;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0x13
.end annotation


# instance fields
.field k:Landroid/media/ImageReader;


# direct methods
.method public constructor <init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/irh0;-><init>(Ll/jrh0$a;Lcom/ss/android/ttvecamera/c;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public d()Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/xrh0;->k:Landroid/media/ImageReader;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return-object p0
.end method

.method public e()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    const/4 p0, 0x2

    .line 2
    return p0
.end method

.method public h(Landroid/hardware/camera2/params/StreamConfigurationMap;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 6
    .param p1    # Landroid/hardware/camera2/params/StreamConfigurationMap;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/RequiresApi;
        api = 0x15
    .end annotation

    .line 1
    invoke-virtual {p1}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputFormats()[I

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v1, p0, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 6
    .line 7
    invoke-static {v1}, Lcom/ss/android/ttvecamera/TECameraFrame;->g(Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;)I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    array-length v2, v0

    .line 12
    const/4 v3, 0x0

    .line 13
    move v4, v3

    .line 14
    :goto_0
    if-ge v4, v2, :cond_1

    .line 15
    .line 16
    aget v5, v0, v4

    .line 17
    .line 18
    if-ne v5, v1, :cond_0

    .line 19
    .line 20
    move v3, v5

    .line 21
    goto :goto_1

    .line 22
    :cond_0
    add-int/lit8 v4, v4, 0x1

    .line 23
    .line 24
    goto :goto_0

    .line 25
    :cond_1
    :goto_1
    if-nez v3, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;->PIXEL_FORMAT_YUV420:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 28
    .line 29
    iput-object v0, p0, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 30
    .line 31
    const/16 v3, 0x23

    .line 32
    .line 33
    :cond_2
    invoke-virtual {p1, v3}, Landroid/hardware/camera2/params/StreamConfigurationMap;->getOutputSizes(I)[Landroid/util/Size;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    invoke-static {p1}, Ll/irh0;->a([Landroid/util/Size;)Ljava/util/List;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    invoke-virtual {p0, p1, p2}, Ll/xrh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 2
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
    iget-object p1, p0, Ll/xrh0;->k:Landroid/media/ImageReader;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    invoke-virtual {p1}, Landroid/media/ImageReader;->close()V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p1, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 25
    .line 26
    iget p2, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 27
    .line 28
    iget p1, p1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 29
    .line 30
    iget-object v0, p0, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 31
    .line 32
    invoke-static {v0}, Lcom/ss/android/ttvecamera/TECameraFrame;->g(Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;)I

    .line 33
    .line 34
    .line 35
    move-result v0

    .line 36
    const/4 v1, 0x1

    .line 37
    invoke-static {p2, p1, v0, v1}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Ll/xrh0;->k:Landroid/media/ImageReader;

    .line 42
    .line 43
    new-instance p2, Ll/xrh0$a;

    .line 44
    .line 45
    invoke-direct {p2, p0}, Ll/xrh0$a;-><init>(Ll/xrh0;)V

    .line 46
    .line 47
    .line 48
    iget-object p0, p0, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 49
    .line 50
    invoke-virtual {p0}, Lcom/ss/android/ttvecamera/c;->E()Landroid/os/Handler;

    .line 51
    .line 52
    .line 53
    move-result-object p0

    .line 54
    invoke-virtual {p1, p2, p0}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 55
    .line 56
    .line 57
    const/4 p0, 0x0

    .line 58
    return p0
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public m()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/irh0;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/xrh0;->k:Landroid/media/ImageReader;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/media/ImageReader;->close()V

    .line 9
    .line 10
    .line 11
    const/4 v0, 0x0

    .line 12
    iput-object v0, p0, Ll/xrh0;->k:Landroid/media/ImageReader;

    .line 13
    .line 14
    :cond_0
    return-void
.end method
