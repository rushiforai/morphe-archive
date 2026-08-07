.class public Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;
.super Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;
.source "SourceFile"


# instance fields
.field private A:I

.field private B:J

.field private C:I

.field private D:I

.field private E:I

.field private F:I

.field private G:I

.field private H:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

.field private I:Z

.field private J:I

.field private K:Landroid/graphics/SurfaceTexture;

.field private L:I

.field private M:Landroid/graphics/Bitmap;

.field private N:I

.field private O:Z

.field private P:I

.field private Q:I

.field private R:Z

.field private S:Ll/qnw;

.field private x:I

.field private y:I

.field private z:I


# direct methods
.method public constructor <init>(IIII)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/MMTextureResourceInput;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, -0x1

    .line 5
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->L:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->O:Z

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 12
    .line 13
    iput p2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->z:I

    .line 14
    .line 15
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->A:I

    .line 16
    .line 17
    iput p3, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->x:I

    .line 18
    .line 19
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->y:I

    .line 20
    .line 21
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->C:I

    .line 22
    .line 23
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->D:I

    .line 24
    .line 25
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->G:I

    .line 26
    .line 27
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->F:I

    .line 28
    .line 29
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->E:I

    .line 30
    .line 31
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->I:Z

    .line 34
    .line 35
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->J:I

    .line 36
    .line 37
    iput-object v2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->K:Landroid/graphics/SurfaceTexture;

    .line 38
    .line 39
    const-wide/16 p1, -0x1

    .line 40
    .line 41
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->B:J

    .line 42
    .line 43
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 44
    .line 45
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 46
    .line 47
    iput-boolean v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->R:Z

    .line 48
    .line 49
    new-instance p1, Ll/qnw;

    .line 50
    .line 51
    invoke-direct {p1}, Ll/qnw;-><init>()V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 55
    .line 56
    iget p2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->x:I

    .line 57
    .line 58
    const/4 p3, 0x7

    .line 59
    if-ne p2, p3, :cond_0

    .line 60
    .line 61
    invoke-virtual {p1, v1}, Ll/qnw;->setOESMode(Z)V

    .line 62
    .line 63
    .line 64
    :cond_0
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 65
    .line 66
    invoke-virtual {p0}, Ll/qnw;->initWithGLContext()V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method private e2()V
    .locals 4

    .line 1
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->y:I

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    const/4 v1, 0x1

    .line 6
    if-eq v0, v1, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 10
    .line 11
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 12
    .line 13
    iget v2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 14
    .line 15
    const/4 v3, 0x2

    .line 16
    invoke-virtual {v0, v1, v2, v3}, Ll/qnw;->setDisplayMode(III)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 20
    .line 21
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->G:I

    .line 22
    .line 23
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->F:I

    .line 24
    .line 25
    invoke-virtual {v0, v1, p0}, Ll/qnw;->setRenderSize(II)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 30
    .line 31
    iget v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 32
    .line 33
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 34
    .line 35
    invoke-virtual {v0, v1, p0}, Ll/qnw;->setRenderSize(II)V

    .line 36
    .line 37
    .line 38
    return-void
.end method


# virtual methods
.method public Q1()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->y:I

    .line 2
    .line 3
    return p0
.end method

.method public R1()Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;
    .locals 0

    .line 1
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->H:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 2
    .line 3
    return-object p0
.end method

.method public S1()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->I:Z

    .line 2
    .line 3
    return p0
.end method

.method public T1()I
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->O:Z

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->C:I

    .line 6
    .line 7
    if-ltz v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->D:I

    .line 10
    .line 11
    if-ltz v0, :cond_1

    .line 12
    .line 13
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->G:I

    .line 14
    .line 15
    if-lez v0, :cond_1

    .line 16
    .line 17
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->F:I

    .line 18
    .line 19
    if-lez v0, :cond_1

    .line 20
    .line 21
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->E:I

    .line 22
    .line 23
    if-ltz v0, :cond_1

    .line 24
    .line 25
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 26
    .line 27
    if-lez v0, :cond_1

    .line 28
    .line 29
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 30
    .line 31
    if-gtz v0, :cond_0

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->L:I

    .line 35
    .line 36
    return p0

    .line 37
    :cond_1
    :goto_0
    const/4 p0, -0x1

    .line 38
    return p0
.end method

.method public U1()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->x:I

    .line 2
    .line 3
    return p0
.end method

.method public V1()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 2
    .line 3
    return p0
.end method

.method public W1()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 2
    .line 3
    return p0
.end method

.method public X1()J
    .locals 2

    .line 1
    iget-wide v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->B:J

    .line 2
    .line 3
    return-wide v0
.end method

.method public Y1()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->F:I

    .line 2
    .line 3
    return p0
.end method

.method public Z1()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->G:I

    .line 2
    .line 3
    return p0
.end method

.method public a2()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->C:I

    .line 2
    .line 3
    return p0
.end method

.method public b2()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->D:I

    .line 2
    .line 3
    return p0
.end method

.method public c2()I
    .locals 0

    .line 1
    iget p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->E:I

    .line 2
    .line 3
    return p0
.end method

.method public d2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->O:Z

    .line 2
    .line 3
    return-void
.end method

.method public drawFrame()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/qnw;->drawFrame()V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/gfj;->getTextOutID()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->L:I

    .line 13
    .line 14
    return-void
.end method

.method public f2(Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->H:Ltv/danmaku/ijk/media/source/AidSource$FirstFrameDrawCallback;

    .line 2
    .line 3
    return-void
.end method

.method public g2(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->I:Z

    .line 2
    .line 3
    return-void
.end method

.method public h2(II)V
    .locals 0

    .line 1
    iput p2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 2
    .line 3
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 4
    .line 5
    return-void
.end method

.method public i2(J)V
    .locals 0

    .line 1
    iput-wide p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->B:J

    .line 2
    .line 3
    return-void
.end method

.method public j2(IIIII)V
    .locals 0

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->C:I

    .line 2
    .line 3
    iput p2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->D:I

    .line 4
    .line 5
    iput p3, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->G:I

    .line 6
    .line 7
    iput p4, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->F:I

    .line 8
    .line 9
    iput p5, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->E:I

    .line 10
    .line 11
    return-void
.end method

.method public k2(ILandroid/graphics/SurfaceTexture;)V
    .locals 1

    .line 1
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->J:I

    .line 2
    .line 3
    iput-object p2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->K:Landroid/graphics/SurfaceTexture;

    .line 4
    .line 5
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 6
    .line 7
    if-lez v0, :cond_1

    .line 8
    .line 9
    iget v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 10
    .line 11
    if-lez v0, :cond_1

    .line 12
    .line 13
    if-gez p1, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->e2()V

    .line 17
    .line 18
    .line 19
    iget-object p0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 20
    .line 21
    invoke-virtual {p0, p1, p2}, Ll/qnw;->loadTexture(ILandroid/graphics/SurfaceTexture;)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    :goto_0
    const/4 p1, -0x1

    .line 26
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->L:I

    .line 27
    .line 28
    return-void
.end method

.method public l2(Landroid/graphics/Bitmap;)V
    .locals 4

    .line 1
    if-eqz p1, :cond_6

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 11
    .line 12
    if-ne v0, p1, :cond_1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_1
    if-eqz v0, :cond_2

    .line 16
    .line 17
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 24
    .line 25
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 30
    .line 31
    :cond_2
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    iput v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->N:I

    .line 35
    .line 36
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 37
    .line 38
    .line 39
    move-result p1

    .line 40
    iget-object v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 41
    .line 42
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v1

    .line 46
    iget-boolean v2, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->R:Z

    .line 47
    .line 48
    if-eqz v2, :cond_3

    .line 49
    .line 50
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 51
    .line 52
    if-ne p1, v3, :cond_3

    .line 53
    .line 54
    iget v3, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 55
    .line 56
    if-eq v1, v3, :cond_5

    .line 57
    .line 58
    :cond_3
    if-nez v2, :cond_4

    .line 59
    .line 60
    iput-boolean v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->R:Z

    .line 61
    .line 62
    :cond_4
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->Q:I

    .line 63
    .line 64
    iput v1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->P:I

    .line 65
    .line 66
    :cond_5
    :goto_0
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 67
    .line 68
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->M:Landroid/graphics/Bitmap;

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Ll/qnw;->loadTexture(Landroid/graphics/Bitmap;)V

    .line 71
    .line 72
    .line 73
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 74
    .line 75
    invoke-virtual {p1}, Ll/qnw;->getBitmapTextureID()I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->J:I

    .line 80
    .line 81
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 82
    .line 83
    invoke-virtual {p1}, Ll/qnw;->getBitmapSurfaceTexture()Landroid/graphics/SurfaceTexture;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    iput-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->K:Landroid/graphics/SurfaceTexture;

    .line 88
    .line 89
    invoke-direct {p0}, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->e2()V

    .line 90
    .line 91
    .line 92
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 93
    .line 94
    invoke-virtual {p1}, Ll/qnw;->drawFrame()V

    .line 95
    .line 96
    .line 97
    iget-object p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 98
    .line 99
    invoke-virtual {p1}, Ll/gfj;->getTextOutID()I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->L:I

    .line 104
    .line 105
    return-void

    .line 106
    :cond_6
    :goto_1
    const/4 p1, -0x1

    .line 107
    iput p1, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->L:I

    .line 108
    .line 109
    return-void
.end method

.method public release()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/qnw;->destroy()V

    .line 6
    .line 7
    .line 8
    const/4 v0, 0x0

    .line 9
    iput-object v0, p0, Ltv/danmaku/ijk/media/processing/GLMulViewTextureFilter;->S:Ll/qnw;

    .line 10
    .line 11
    :cond_0
    return-void
.end method
