.class public Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field public a:[F

.field public b:Landroid/graphics/Path;

.field public c:Landroid/graphics/RectF;

.field public d:Ll/d4t;

.field public e:F

.field public f:Lv/VDraweeView;

.field public g:Landroid/view/TextureView;

.field public h:Ll/dyh0;

.field public i:Landroid/view/Surface;

.field public j:Z

.field public k:Ljava/lang/Runnable;
    .annotation build Landroidx/annotation/Nullable;
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    fill-array-data v0, :array_0

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->a:[F

    .line 12
    .line 13
    new-instance v0, Landroid/graphics/Path;

    .line 14
    .line 15
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 16
    .line 17
    .line 18
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b:Landroid/graphics/Path;

    .line 19
    .line 20
    new-instance v0, Landroid/graphics/RectF;

    .line 21
    .line 22
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c:Landroid/graphics/RectF;

    .line 26
    .line 27
    const/4 v0, 0x1

    .line 28
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j:Z

    .line 29
    .line 30
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j(Landroid/content/Context;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    nop

    .line 35
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 35
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/16 p2, 0x8

    .line 36
    new-array p2, p2, [F

    fill-array-data p2, :array_0

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->a:[F

    .line 37
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b:Landroid/graphics/Path;

    .line 38
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c:Landroid/graphics/RectF;

    const/4 p2, 0x1

    .line 39
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j:Z

    .line 40
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j(Landroid/content/Context;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 41
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/16 p2, 0x8

    .line 42
    new-array p2, p2, [F

    fill-array-data p2, :array_0

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->a:[F

    .line 43
    new-instance p2, Landroid/graphics/Path;

    invoke-direct {p2}, Landroid/graphics/Path;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b:Landroid/graphics/Path;

    .line 44
    new-instance p2, Landroid/graphics/RectF;

    invoke-direct {p2}, Landroid/graphics/RectF;-><init>()V

    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c:Landroid/graphics/RectF;

    const/4 p2, 0x1

    .line 45
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j:Z

    .line 46
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j(Landroid/content/Context;)V

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->n(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Ll/dyh0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->k(Ll/dyh0;Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic c(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    invoke-virtual/range {p0 .. p5}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->m(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V

    return-void
.end method

.method public static synthetic d(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->l(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z

    move-result p0

    return p0
.end method

.method public static bridge synthetic e(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)Ljava/lang/Runnable;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->k:Ljava/lang/Runnable;

    return-object p0
.end method

.method public static bridge synthetic f(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Landroid/view/Surface;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->i:Landroid/view/Surface;

    return-void
.end method

.method public static bridge synthetic g(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Ljava/lang/Runnable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->k:Ljava/lang/Runnable;

    return-void
.end method


# virtual methods
.method public dispatchDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b:Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 4
    .line 5
    .line 6
    invoke-super {p0, p1}, Landroid/view/View;->dispatchDraw(Landroid/graphics/Canvas;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public getSimpleDraweeView()Lcom/facebook/drawee/view/SimpleDraweeView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTextureView()Landroid/view/TextureView;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->g:Landroid/view/TextureView;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h(IIII)V
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Matrix;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Matrix;-><init>()V

    .line 4
    .line 5
    .line 6
    int-to-float p3, p3

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    mul-float v2, p3, v1

    .line 10
    .line 11
    int-to-float p1, p1

    .line 12
    div-float/2addr v2, p1

    .line 13
    int-to-float p4, p4

    .line 14
    mul-float v3, p4, v1

    .line 15
    .line 16
    int-to-float p2, p2

    .line 17
    div-float/2addr v3, p2

    .line 18
    mul-float v4, p1, v1

    .line 19
    .line 20
    div-float/2addr v4, p3

    .line 21
    mul-float p3, p2, v1

    .line 22
    .line 23
    div-float/2addr p3, p4

    .line 24
    invoke-virtual {v0}, Landroid/graphics/Matrix;->reset()V

    .line 25
    .line 26
    .line 27
    cmpl-float p4, v4, p3

    .line 28
    .line 29
    const/high16 v5, 0x40000000    # 2.0f

    .line 30
    .line 31
    if-ltz p4, :cond_0

    .line 32
    .line 33
    mul-float/2addr v4, v3

    .line 34
    sub-float p1, v4, v1

    .line 35
    .line 36
    mul-float/2addr p2, p1

    .line 37
    div-float/2addr p2, v5

    .line 38
    const/4 p1, 0x0

    .line 39
    neg-float p2, p2

    .line 40
    invoke-virtual {v0, p1, p2}, Landroid/graphics/Matrix;->postTranslate(FF)Z

    .line 41
    .line 42
    .line 43
    invoke-virtual {v0, v1, v4}, Landroid/graphics/Matrix;->postScale(FF)Z

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    mul-float/2addr p3, v2

    .line 48
    div-float/2addr p1, v5

    .line 49
    div-float/2addr p2, v5

    .line 50
    invoke-virtual {v0, p3, v1, p1, p2}, Landroid/graphics/Matrix;->postScale(FFFF)Z

    .line 51
    .line 52
    .line 53
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->g:Landroid/view/TextureView;

    .line 54
    .line 55
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setTransform(Landroid/graphics/Matrix;)V

    .line 56
    .line 57
    .line 58
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->g:Landroid/view/TextureView;

    .line 59
    .line 60
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 61
    .line 62
    .line 63
    return-void
.end method

.method public final i()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final j(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/kec0;->Pd:I

    .line 6
    .line 7
    const/4 v1, 0x1

    .line 8
    invoke-virtual {p1, v0, p0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    sget v0, Ll/adc0;->d2:I

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    check-cast v0, Lv/VDraweeView;

    .line 19
    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->f:Lv/VDraweeView;

    .line 21
    .line 22
    sget v0, Ll/adc0;->Zd:I

    .line 23
    .line 24
    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    check-cast p1, Landroid/view/TextureView;

    .line 29
    .line 30
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->g:Landroid/view/TextureView;

    .line 31
    .line 32
    new-instance v0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView$a;

    .line 33
    .line 34
    invoke-direct {v0, p0}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView$a;-><init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p1, v0}, Landroid/view/TextureView;->setSurfaceTextureListener(Landroid/view/TextureView$SurfaceTextureListener;)V

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public final synthetic k(Ll/dyh0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->o(Ll/dyh0;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic l(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    const/4 p1, 0x3

    .line 2
    if-ne p2, p1, :cond_1

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->i()V

    .line 5
    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->d:Ll/d4t;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    invoke-interface {p0}, Ll/d4t;->onStart()V

    .line 12
    .line 13
    .line 14
    :cond_0
    const/4 p0, 0x1

    .line 15
    return p0

    .line 16
    :cond_1
    const/4 p0, 0x0

    .line 17
    return p0
.end method

.method public final synthetic m(Lcom/tantanapp/ijk/media/player/IMediaPlayer;IIII)V
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->g:Landroid/view/TextureView;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    int-to-float p4, p2

    .line 6
    const/high16 p5, 0x3f800000    # 1.0f

    .line 7
    .line 8
    mul-float/2addr p4, p5

    .line 9
    int-to-float p5, p3

    .line 10
    div-float/2addr p4, p5

    .line 11
    iget p5, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->e:F

    .line 12
    .line 13
    cmpl-float p5, p5, p4

    .line 14
    .line 15
    if-eqz p5, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Landroid/view/View;->getWidth()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    iget-object p5, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->g:Landroid/view/TextureView;

    .line 22
    .line 23
    invoke-virtual {p5}, Landroid/view/View;->getHeight()I

    .line 24
    .line 25
    .line 26
    move-result p5

    .line 27
    invoke-virtual {p0, p1, p5, p2, p3}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h(IIII)V

    .line 28
    .line 29
    .line 30
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->e:F

    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public final synthetic n(Lcom/tantanapp/ijk/media/player/IMediaPlayer;II)Z
    .locals 0

    .line 1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    invoke-virtual {p1}, Ll/dyh0;->stop()V

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x0

    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 10
    .line 11
    :cond_0
    const/4 p0, 0x1

    .line 12
    return p0
.end method

.method public o(Ll/dyh0;Ljava/lang/String;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->i:Landroid/view/Surface;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/e4t;

    .line 6
    .line 7
    invoke-direct {v0, p0, p1, p2}, Ll/e4t;-><init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;Ll/dyh0;Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->k:Ljava/lang/Runnable;

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ll/dyh0;->stop()V

    .line 18
    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 22
    .line 23
    :cond_1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p1, p2}, Ll/dyh0;->setDataSource(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 29
    .line 30
    invoke-virtual {p1}, Ll/dyh0;->prepareAsync()V

    .line 31
    .line 32
    .line 33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 34
    .line 35
    new-instance p2, Ll/f4t;

    .line 36
    .line 37
    invoke-direct {p2, p0}, Ll/f4t;-><init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/dyh0;->setOnInfoListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnInfoListener;)V

    .line 41
    .line 42
    .line 43
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 44
    .line 45
    new-instance p2, Ll/g4t;

    .line 46
    .line 47
    invoke-direct {p2, p0}, Ll/g4t;-><init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)V

    .line 48
    .line 49
    .line 50
    invoke-virtual {p1, p2}, Ll/dyh0;->setOnVideoSizeChangedListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnVideoSizeChangedListener;)V

    .line 51
    .line 52
    .line 53
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 54
    .line 55
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->i:Landroid/view/Surface;

    .line 56
    .line 57
    invoke-virtual {p1, p2}, Ll/dyh0;->setSurface(Landroid/view/Surface;)V

    .line 58
    .line 59
    .line 60
    invoke-static {}, Ll/gfv;->a()Ll/gfv;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p1}, Ll/gfv;->b()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_2

    .line 69
    .line 70
    const/4 p1, 0x1

    .line 71
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->setVolume(Z)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :catch_0
    move-exception p1

    .line 76
    goto :goto_1

    .line 77
    :cond_2
    const/4 p1, 0x0

    .line 78
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->setVolume(Z)V

    .line 79
    .line 80
    .line 81
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 82
    .line 83
    new-instance p2, Ll/h4t;

    .line 84
    .line 85
    invoke-direct {p2, p0}, Ll/h4t;-><init>(Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;)V

    .line 86
    .line 87
    .line 88
    invoke-virtual {p1, p2}, Ll/dyh0;->setOnErrorListener(Lcom/tantanapp/ijk/media/player/IMediaPlayer$OnErrorListener;)V

    .line 89
    .line 90
    .line 91
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 92
    .line 93
    iget-boolean p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->j:Z

    .line 94
    .line 95
    invoke-virtual {p1, p2}, Ll/dyh0;->setLooping(Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :goto_1
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->q()V

    .line 103
    .line 104
    .line 105
    return-void
.end method

.method public onLayout(ZIIII)V
    .locals 0

    .line 1
    invoke-super/range {p0 .. p5}, Landroid/widget/FrameLayout;->onLayout(ZIIII)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b:Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 7
    .line 8
    .line 9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c:Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 12
    .line 13
    .line 14
    move-result p2

    .line 15
    int-to-float p2, p2

    .line 16
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 17
    .line 18
    .line 19
    move-result p3

    .line 20
    int-to-float p3, p3

    .line 21
    const/4 p4, 0x0

    .line 22
    invoke-virtual {p1, p4, p4, p2, p3}, Landroid/graphics/RectF;->set(FFFF)V

    .line 23
    .line 24
    .line 25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->b:Landroid/graphics/Path;

    .line 26
    .line 27
    iget-object p2, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c:Landroid/graphics/RectF;

    .line 28
    .line 29
    iget-object p3, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->a:[F

    .line 30
    .line 31
    sget-object p4, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 32
    .line 33
    invoke-virtual {p1, p2, p3, p4}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->c:Landroid/graphics/RectF;

    .line 37
    .line 38
    invoke-virtual {p0}, Landroid/graphics/RectF;->toString()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public p(Ljava/lang/String;Z)V
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->f:Lv/VDraweeView;

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    const/16 v1, 0x1e

    .line 15
    .line 16
    invoke-virtual {p2, p0, p1, v0, v1}, Ll/fsb0;->O(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget-object p2, Ll/uqb0;->G:Ll/fsb0;

    .line 21
    .line 22
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->f:Lv/VDraweeView;

    .line 23
    .line 24
    invoke-virtual {p2, p0, p1}, Ll/fsb0;->L0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_1
    return-void
.end method

.method public q()V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->f:Lv/VDraweeView;

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    invoke-static {v0, v1}, Ll/bnl0;->M0(Landroid/view/View;Z)V

    .line 5
    .line 6
    .line 7
    invoke-static {p0}, Ll/bnl0;->k0(Landroid/view/View;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setLiveMediaListener(Ll/d4t;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->d:Ll/d4t;

    .line 2
    .line 3
    return-void
.end method

.method public setVolume(Z)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/gfv;->a()Ll/gfv;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    const/4 v0, 0x1

    .line 12
    invoke-virtual {p1, v0}, Ll/gfv;->c(Z)V

    .line 13
    .line 14
    .line 15
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 16
    .line 17
    const/high16 p1, 0x3f800000    # 1.0f

    .line 18
    .line 19
    invoke-virtual {p0, p1, p1}, Ll/dyh0;->setVolume(FF)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    invoke-static {}, Ll/gfv;->a()Ll/gfv;

    .line 24
    .line 25
    .line 26
    move-result-object p1

    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-virtual {p1, v0}, Ll/gfv;->c(Z)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/home/livewindow/LiveMediaView;->h:Ll/dyh0;

    .line 32
    .line 33
    const/4 p1, 0x0

    .line 34
    invoke-virtual {p0, p1, p1}, Ll/dyh0;->setVolume(FF)V

    .line 35
    .line 36
    .line 37
    :cond_1
    return-void
.end method
