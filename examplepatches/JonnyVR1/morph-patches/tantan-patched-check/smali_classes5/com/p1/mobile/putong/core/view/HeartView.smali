.class public Lcom/p1/mobile/putong/core/view/HeartView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Bitmap;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Rect;

.field public d:Landroid/graphics/Rect;

.field public e:Landroid/graphics/Rect;

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:F

.field public o:I

.field public p:I

.field public q:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/HeartView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 6
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/HeartView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 7
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/view/HeartView;Landroid/graphics/Bitmap;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/HeartView;->f(Landroid/graphics/Bitmap;)V

    return-void
.end method

.method private getDstRect()Landroid/graphics/Rect;
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Rect;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->f:I

    .line 4
    .line 5
    neg-int v2, v1

    .line 6
    div-int/lit8 v2, v2, 0x2

    .line 7
    .line 8
    iget v3, p0, Lcom/p1/mobile/putong/core/view/HeartView;->l:I

    .line 9
    .line 10
    add-int/2addr v2, v3

    .line 11
    iget v4, p0, Lcom/p1/mobile/putong/core/view/HeartView;->g:I

    .line 12
    .line 13
    neg-int v5, v4

    .line 14
    div-int/lit8 v5, v5, 0x2

    .line 15
    .line 16
    iget p0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->m:I

    .line 17
    .line 18
    add-int/2addr v5, p0

    .line 19
    div-int/lit8 v1, v1, 0x2

    .line 20
    .line 21
    add-int/2addr v1, v3

    .line 22
    div-int/lit8 v4, v4, 0x2

    .line 23
    .line 24
    add-int/2addr v4, p0

    .line 25
    invoke-direct {v0, v2, v5, v1, v4}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 26
    .line 27
    .line 28
    return-object v0
.end method


# virtual methods
.method public b()V
    .locals 11

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->d:Landroid/graphics/Rect;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->e:Landroid/graphics/Rect;

    .line 6
    .line 7
    iget v2, v1, Landroid/graphics/Rect;->left:I

    .line 8
    .line 9
    int-to-float v2, v2

    .line 10
    iget v3, p0, Lcom/p1/mobile/putong/core/view/HeartView;->n:F

    .line 11
    .line 12
    iget v4, p0, Lcom/p1/mobile/putong/core/view/HeartView;->o:I

    .line 13
    .line 14
    int-to-float v5, v4

    .line 15
    mul-float/2addr v5, v3

    .line 16
    sub-float/2addr v2, v5

    .line 17
    float-to-int v2, v2

    .line 18
    iput v2, v0, Landroid/graphics/Rect;->left:I

    .line 19
    .line 20
    iget v2, v1, Landroid/graphics/Rect;->top:I

    .line 21
    .line 22
    int-to-double v5, v2

    .line 23
    iget v2, p0, Lcom/p1/mobile/putong/core/view/HeartView;->p:I

    .line 24
    .line 25
    int-to-float v7, v2

    .line 26
    mul-float/2addr v7, v3

    .line 27
    float-to-double v7, v7

    .line 28
    const-wide v9, 0x3fe199999999999aL    # 0.55

    .line 29
    .line 30
    .line 31
    .line 32
    .line 33
    mul-double/2addr v7, v9

    .line 34
    sub-double/2addr v5, v7

    .line 35
    double-to-int v5, v5

    .line 36
    iput v5, v0, Landroid/graphics/Rect;->top:I

    .line 37
    .line 38
    iget v5, v1, Landroid/graphics/Rect;->right:I

    .line 39
    .line 40
    int-to-float v5, v5

    .line 41
    int-to-float v4, v4

    .line 42
    mul-float/2addr v4, v3

    .line 43
    add-float/2addr v5, v4

    .line 44
    float-to-int v4, v5

    .line 45
    iput v4, v0, Landroid/graphics/Rect;->right:I

    .line 46
    .line 47
    iget v1, v1, Landroid/graphics/Rect;->bottom:I

    .line 48
    .line 49
    int-to-double v4, v1

    .line 50
    int-to-float v1, v2

    .line 51
    mul-float/2addr v3, v1

    .line 52
    float-to-double v1, v3

    .line 53
    const-wide v6, 0x3ff7333333333333L    # 1.45

    .line 54
    .line 55
    .line 56
    .line 57
    .line 58
    mul-double/2addr v1, v6

    .line 59
    add-double/2addr v4, v1

    .line 60
    double-to-int v1, v4

    .line 61
    iput v1, v0, Landroid/graphics/Rect;->bottom:I

    .line 62
    .line 63
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 64
    .line 65
    .line 66
    :cond_0
    return-void
.end method

.method public c()V
    .locals 1

    .line 1
    const-string v0, "https://auto.tancdn.com/v1/raw/e6813acd-6384-4cf5-b254-fba2dda3419814.webp"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/view/HeartView;->d(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d(Ljava/lang/String;)V
    .locals 2

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->q:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->q:Z

    .line 8
    .line 9
    sget-object v0, Ll/uqb0;->G:Ll/fsb0;

    .line 10
    .line 11
    new-instance v1, Ll/m0l;

    .line 12
    .line 13
    invoke-direct {v1, p0}, Ll/m0l;-><init>(Lcom/p1/mobile/putong/core/view/HeartView;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {v0, p1, v1}, Ll/fsb0;->I(Ljava/lang/String;Ll/y20;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public final e(Landroid/graphics/Bitmap;)V
    .locals 6

    .line 1
    new-instance v0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->b:Landroid/graphics/Paint;

    .line 7
    .line 8
    const/4 v1, 0x1

    .line 9
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->h:I

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getHeight()I

    .line 19
    .line 20
    .line 21
    move-result p1

    .line 22
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->i:I

    .line 23
    .line 24
    iget v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->h:I

    .line 25
    .line 26
    div-int/lit8 v0, v0, 0x3

    .line 27
    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->f:I

    .line 29
    .line 30
    div-int/lit8 p1, p1, 0x3

    .line 31
    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->g:I

    .line 33
    .line 34
    invoke-static {}, Ll/vnb;->s1()Z

    .line 35
    .line 36
    .line 37
    move-result p1

    .line 38
    if-eqz p1, :cond_0

    .line 39
    .line 40
    const-wide v0, 0x3ff6666666666666L    # 1.4

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    goto :goto_0

    .line 46
    :cond_0
    const-wide v0, 0x3ff3333333333333L    # 1.2

    .line 47
    .line 48
    .line 49
    .line 50
    .line 51
    :goto_0
    iget p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->h:I

    .line 52
    .line 53
    int-to-double v2, p1

    .line 54
    mul-double/2addr v2, v0

    .line 55
    iget p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->f:I

    .line 56
    .line 57
    int-to-double v4, p1

    .line 58
    sub-double/2addr v2, v4

    .line 59
    double-to-int p1, v2

    .line 60
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->o:I

    .line 61
    .line 62
    iget p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->i:I

    .line 63
    .line 64
    int-to-double v2, p1

    .line 65
    mul-double/2addr v2, v0

    .line 66
    iget p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->g:I

    .line 67
    .line 68
    int-to-double v0, p1

    .line 69
    sub-double/2addr v2, v0

    .line 70
    double-to-int p1, v2

    .line 71
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->p:I

    .line 72
    .line 73
    new-instance p1, Landroid/graphics/Rect;

    .line 74
    .line 75
    iget v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->h:I

    .line 76
    .line 77
    iget v1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->i:I

    .line 78
    .line 79
    const/4 v2, 0x0

    .line 80
    invoke-direct {p1, v2, v2, v0, v1}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->c:Landroid/graphics/Rect;

    .line 84
    .line 85
    return-void
.end method

.method public final synthetic f(Landroid/graphics/Bitmap;)V
    .locals 2

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/Bitmap;->getConfig()Landroid/graphics/Bitmap$Config;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const/4 v1, 0x0

    .line 14
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Bitmap;->copy(Landroid/graphics/Bitmap$Config;Z)Landroid/graphics/Bitmap;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->a:Landroid/graphics/Bitmap;

    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/view/HeartView;->e(Landroid/graphics/Bitmap;)V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method

.method public getSize()F
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->n:F

    .line 2
    .line 3
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->a:Landroid/graphics/Bitmap;

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->isRecycled()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-nez v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->a:Landroid/graphics/Bitmap;

    .line 15
    .line 16
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->recycle()V

    .line 17
    .line 18
    .line 19
    const/4 v0, 0x0

    .line 20
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->a:Landroid/graphics/Bitmap;

    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->a:Landroid/graphics/Bitmap;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->c:Landroid/graphics/Rect;

    .line 6
    .line 7
    iget-object v2, p0, Lcom/p1/mobile/putong/core/view/HeartView;->d:Landroid/graphics/Rect;

    .line 8
    .line 9
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/HeartView;->b:Landroid/graphics/Paint;

    .line 10
    .line 11
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public onMeasure(II)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->j:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->k:I

    .line 15
    .line 16
    iget p2, p0, Lcom/p1/mobile/putong/core/view/HeartView;->j:I

    .line 17
    .line 18
    shr-int/lit8 p2, p2, 0x1

    .line 19
    .line 20
    iput p2, p0, Lcom/p1/mobile/putong/core/view/HeartView;->l:I

    .line 21
    .line 22
    shr-int/lit8 p1, p1, 0x1

    .line 23
    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->m:I

    .line 25
    .line 26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->d:Landroid/graphics/Rect;

    .line 27
    .line 28
    if-nez p1, :cond_0

    .line 29
    .line 30
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/view/HeartView;->getDstRect()Landroid/graphics/Rect;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->d:Landroid/graphics/Rect;

    .line 35
    .line 36
    new-instance p1, Landroid/graphics/Rect;

    .line 37
    .line 38
    iget-object p2, p0, Lcom/p1/mobile/putong/core/view/HeartView;->d:Landroid/graphics/Rect;

    .line 39
    .line 40
    iget v0, p2, Landroid/graphics/Rect;->left:I

    .line 41
    .line 42
    iget v1, p2, Landroid/graphics/Rect;->top:I

    .line 43
    .line 44
    iget v2, p2, Landroid/graphics/Rect;->right:I

    .line 45
    .line 46
    iget p2, p2, Landroid/graphics/Rect;->bottom:I

    .line 47
    .line 48
    invoke-direct {p1, v0, v1, v2, p2}, Landroid/graphics/Rect;-><init>(IIII)V

    .line 49
    .line 50
    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->e:Landroid/graphics/Rect;

    .line 52
    .line 53
    :cond_0
    return-void
.end method

.method public setPercent(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/view/HeartView;->n:F

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/HeartView;->b()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
