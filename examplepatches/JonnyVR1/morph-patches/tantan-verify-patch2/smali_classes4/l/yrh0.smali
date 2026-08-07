.class public Ll/yrh0;
.super Ll/irh0;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RequiresApi;
    api = 0x13
.end annotation


# instance fields
.field k:Landroid/graphics/SurfaceTexture;

.field l:[F

.field m:I

.field n:[Landroid/media/ImageReader;

.field o:[Landroid/view/Surface;


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
    iput-object p2, p0, Ll/yrh0;->l:[F

    .line 9
    .line 10
    iget-object p2, p1, Ll/jrh0$a;->d:Landroid/graphics/SurfaceTexture;

    .line 11
    .line 12
    iput-object p2, p0, Ll/yrh0;->k:Landroid/graphics/SurfaceTexture;

    .line 13
    .line 14
    iget p1, p1, Ll/jrh0$a;->e:I

    .line 15
    .line 16
    iput p1, p0, Ll/yrh0;->m:I

    .line 17
    .line 18
    iget p1, p0, Ll/irh0;->f:I

    .line 19
    .line 20
    new-array v0, p1, [Landroid/media/ImageReader;

    .line 21
    .line 22
    iput-object v0, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 23
    .line 24
    if-eqz p2, :cond_0

    .line 25
    .line 26
    add-int/lit8 p1, p1, 0x1

    .line 27
    .line 28
    :cond_0
    new-array p1, p1, [Landroid/view/Surface;

    .line 29
    .line 30
    iput-object p1, p0, Ll/yrh0;->o:[Landroid/view/Surface;

    .line 31
    .line 32
    if-eqz p2, :cond_1

    .line 33
    .line 34
    new-instance p2, Landroid/view/Surface;

    .line 35
    .line 36
    iget-object p0, p0, Ll/yrh0;->k:Landroid/graphics/SurfaceTexture;

    .line 37
    .line 38
    invoke-direct {p2, p0}, Landroid/view/Surface;-><init>(Landroid/graphics/SurfaceTexture;)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x0

    .line 42
    aput-object p2, p1, p0

    .line 43
    .line 44
    :cond_1
    return-void
.end method


# virtual methods
.method public d()Landroid/view/Surface;
    .locals 1

    .line 1
    iget-object p0, p0, Ll/yrh0;->o:[Landroid/view/Surface;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x0

    .line 6
    aget-object p0, p0, v0

    .line 7
    .line 8
    return-object p0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    return-object p0
.end method

.method public e()Landroid/graphics/SurfaceTexture;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrh0;->k:Landroid/graphics/SurfaceTexture;

    .line 2
    .line 3
    return-object p0
.end method

.method public f()[Landroid/view/Surface;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/yrh0;->o:[Landroid/view/Surface;

    .line 2
    .line 3
    return-object p0
.end method

.method public g()I
    .locals 0

    .line 1
    const/16 p0, 0x8

    .line 2
    .line 3
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
    invoke-virtual {p0, p1, p2}, Ll/yrh0;->i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    return p0
.end method

.method public i(Ljava/util/List;Lcom/ss/android/ttvecamera/TEFrameSizei;)I
    .locals 5
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
    iget-object p1, p0, Ll/yrh0;->k:Landroid/graphics/SurfaceTexture;

    .line 18
    .line 19
    if-eqz p1, :cond_1

    .line 20
    .line 21
    iget-object p2, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 22
    .line 23
    iget v0, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 24
    .line 25
    iget p2, p2, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 26
    .line 27
    invoke-virtual {p1, v0, p2}, Landroid/graphics/SurfaceTexture;->setDefaultBufferSize(II)V

    .line 28
    .line 29
    .line 30
    :cond_1
    const/4 p1, 0x0

    .line 31
    move p2, p1

    .line 32
    :goto_0
    iget v0, p0, Ll/irh0;->f:I

    .line 33
    .line 34
    if-ge p2, v0, :cond_3

    .line 35
    .line 36
    iget-object v0, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 37
    .line 38
    iget-object v1, p0, Ll/irh0;->c:Lcom/ss/android/ttvecamera/TEFrameSizei;

    .line 39
    .line 40
    iget v2, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->width:I

    .line 41
    .line 42
    iget v1, v1, Lcom/ss/android/ttvecamera/TEFrameSizei;->height:I

    .line 43
    .line 44
    iget-object v3, p0, Ll/irh0;->b:Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;

    .line 45
    .line 46
    invoke-static {v3}, Lcom/ss/android/ttvecamera/TECameraFrame;->g(Lcom/ss/android/ttvecamera/TECameraFrame$ETEPixelFormat;)I

    .line 47
    .line 48
    .line 49
    move-result v3

    .line 50
    const/4 v4, 0x1

    .line 51
    invoke-static {v2, v1, v3, v4}, Landroid/media/ImageReader;->newInstance(IIII)Landroid/media/ImageReader;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    aput-object v1, v0, p2

    .line 56
    .line 57
    iget-object v0, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 58
    .line 59
    aget-object v0, v0, p2

    .line 60
    .line 61
    new-instance v1, Ll/yrh0$a;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/yrh0$a;-><init>(Ll/yrh0;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Ll/irh0;->d:Lcom/ss/android/ttvecamera/c;

    .line 67
    .line 68
    invoke-virtual {v2}, Lcom/ss/android/ttvecamera/c;->E()Landroid/os/Handler;

    .line 69
    .line 70
    .line 71
    move-result-object v2

    .line 72
    invoke-virtual {v0, v1, v2}, Landroid/media/ImageReader;->setOnImageAvailableListener(Landroid/media/ImageReader$OnImageAvailableListener;Landroid/os/Handler;)V

    .line 73
    .line 74
    .line 75
    iget-object v0, p0, Ll/yrh0;->k:Landroid/graphics/SurfaceTexture;

    .line 76
    .line 77
    iget-object v1, p0, Ll/yrh0;->o:[Landroid/view/Surface;

    .line 78
    .line 79
    if-eqz v0, :cond_2

    .line 80
    .line 81
    add-int/lit8 v0, p2, 0x1

    .line 82
    .line 83
    iget-object v2, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 84
    .line 85
    aget-object v2, v2, p2

    .line 86
    .line 87
    invoke-virtual {v2}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 88
    .line 89
    .line 90
    move-result-object v2

    .line 91
    aput-object v2, v1, v0

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :cond_2
    iget-object v0, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 95
    .line 96
    aget-object v0, v0, p2

    .line 97
    .line 98
    invoke-virtual {v0}, Landroid/media/ImageReader;->getSurface()Landroid/view/Surface;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    aput-object v0, v1, p2

    .line 103
    .line 104
    :goto_1
    add-int/lit8 p2, p2, 0x1

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :cond_3
    return p1
.end method

.method public l()V
    .locals 0

    .line 1
    return-void
.end method

.method public m()V
    .locals 5

    .line 1
    invoke-super {p0}, Ll/irh0;->m()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    array-length v2, v0

    .line 10
    move v3, v1

    .line 11
    :goto_0
    if-ge v3, v2, :cond_1

    .line 12
    .line 13
    aget-object v4, v0, v3

    .line 14
    .line 15
    if-eqz v4, :cond_0

    .line 16
    .line 17
    invoke-virtual {v4}, Landroid/media/ImageReader;->close()V

    .line 18
    .line 19
    .line 20
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_1
    const/4 v0, 0x0

    .line 24
    iput-object v0, p0, Ll/yrh0;->n:[Landroid/media/ImageReader;

    .line 25
    .line 26
    :cond_2
    iget-object v0, p0, Ll/yrh0;->k:Landroid/graphics/SurfaceTexture;

    .line 27
    .line 28
    if-eqz v0, :cond_3

    .line 29
    .line 30
    iget-object p0, p0, Ll/yrh0;->o:[Landroid/view/Surface;

    .line 31
    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    aget-object p0, p0, v1

    .line 35
    .line 36
    if-eqz p0, :cond_3

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/view/Surface;->release()V

    .line 39
    .line 40
    .line 41
    :cond_3
    return-void
.end method
