.class public Lcom/idv/identity/platform/widget/IndicatorView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field private a:I

.field private b:I

.field private c:I

.field private d:I

.field private e:I

.field private f:I

.field private g:I

.field private h:Landroid/graphics/Paint;

.field private i:Landroid/graphics/Paint;

.field private j:I

.field private k:I

.field private l:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 34
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/widget/IndicatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 33
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/platform/widget/IndicatorView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->a:I

    .line 6
    .line 7
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->b:I

    .line 8
    .line 9
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->c:I

    .line 10
    .line 11
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->d:I

    .line 12
    .line 13
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->e:I

    .line 14
    .line 15
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->f:I

    .line 16
    .line 17
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->g:I

    .line 18
    .line 19
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->j:I

    .line 20
    .line 21
    const/4 v0, -0x1

    .line 22
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->k:I

    .line 23
    .line 24
    const v0, -0x777778

    .line 25
    .line 26
    .line 27
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->l:I

    .line 28
    .line 29
    invoke-direct {p0, p1, p2, p3}, Lcom/idv/identity/platform/widget/IndicatorView;->b(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method private a()V
    .locals 2

    .line 1
    iget v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->j:I

    .line 2
    .line 3
    iget v1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->f:I

    .line 4
    .line 5
    if-lt v0, v1, :cond_0

    .line 6
    .line 7
    add-int/lit8 v0, v1, -0x1

    .line 8
    .line 9
    iput v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->j:I

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    if-gt v1, v0, :cond_1

    .line 13
    .line 14
    const/16 v0, 0x8

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_1
    const/4 v0, 0x0

    .line 18
    :goto_0
    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method private b(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1

    .line 1
    new-instance p3, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p3, p0, Lcom/idv/identity/platform/widget/IndicatorView;->h:Landroid/graphics/Paint;

    .line 7
    .line 8
    new-instance p3, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p3, p0, Lcom/idv/identity/platform/widget/IndicatorView;->i:Landroid/graphics/Paint;

    .line 14
    .line 15
    sget-object p3, Ll/ghc0;->t:[I

    .line 16
    .line 17
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    sget p2, Ll/ghc0;->u:I

    .line 24
    .line 25
    const/4 p3, -0x1

    .line 26
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput p2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->k:I

    .line 31
    .line 32
    sget p2, Ll/ghc0;->v:I

    .line 33
    .line 34
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    iput p2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->l:I

    .line 39
    .line 40
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 41
    .line 42
    .line 43
    :cond_0
    iget-object p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->h:Landroid/graphics/Paint;

    .line 44
    .line 45
    iget p2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->k:I

    .line 46
    .line 47
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->h:Landroid/graphics/Paint;

    .line 51
    .line 52
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 53
    .line 54
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 55
    .line 56
    .line 57
    iget-object p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->h:Landroid/graphics/Paint;

    .line 58
    .line 59
    const/4 p3, 0x1

    .line 60
    invoke-virtual {p1, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 61
    .line 62
    .line 63
    iget-object p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->i:Landroid/graphics/Paint;

    .line 64
    .line 65
    iget v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->l:I

    .line 66
    .line 67
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 68
    .line 69
    .line 70
    iget-object p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->i:Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->i:Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-virtual {p0, p3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 78
    .line 79
    .line 80
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->b:I

    .line 5
    .line 6
    int-to-float v0, v0

    .line 7
    const/high16 v1, 0x40000000    # 2.0f

    .line 8
    .line 9
    div-float/2addr v0, v1

    .line 10
    iget v2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->d:I

    .line 11
    .line 12
    int-to-float v2, v2

    .line 13
    div-float/2addr v2, v1

    .line 14
    const/4 v1, 0x0

    .line 15
    :goto_0
    iget v3, p0, Lcom/idv/identity/platform/widget/IndicatorView;->f:I

    .line 16
    .line 17
    if-ge v1, v3, :cond_1

    .line 18
    .line 19
    iget v3, p0, Lcom/idv/identity/platform/widget/IndicatorView;->d:I

    .line 20
    .line 21
    iput v3, p0, Lcom/idv/identity/platform/widget/IndicatorView;->e:I

    .line 22
    .line 23
    iget v4, p0, Lcom/idv/identity/platform/widget/IndicatorView;->g:I

    .line 24
    .line 25
    mul-int v5, v1, v3

    .line 26
    .line 27
    add-int/2addr v4, v5

    .line 28
    mul-int/2addr v3, v1

    .line 29
    add-int/2addr v4, v3

    .line 30
    int-to-float v3, v4

    .line 31
    add-float/2addr v3, v2

    .line 32
    iget v4, p0, Lcom/idv/identity/platform/widget/IndicatorView;->j:I

    .line 33
    .line 34
    if-ne v1, v4, :cond_0

    .line 35
    .line 36
    iget-object v4, p0, Lcom/idv/identity/platform/widget/IndicatorView;->h:Landroid/graphics/Paint;

    .line 37
    .line 38
    goto :goto_1

    .line 39
    :cond_0
    iget-object v4, p0, Lcom/idv/identity/platform/widget/IndicatorView;->i:Landroid/graphics/Paint;

    .line 40
    .line 41
    :goto_1
    invoke-virtual {p1, v3, v0, v2, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 42
    .line 43
    .line 44
    add-int/lit8 v1, v1, 0x1

    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_1
    return-void
.end method

.method public onMeasure(II)V
    .locals 2

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->a:I

    .line 9
    .line 10
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->b:I

    .line 15
    .line 16
    iget p2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->a:I

    .line 17
    .line 18
    iget v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->f:I

    .line 19
    .line 20
    add-int/2addr v0, v0

    .line 21
    add-int/lit8 v0, v0, -0x1

    .line 22
    .line 23
    div-int/2addr p2, v0

    .line 24
    iput p2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->c:I

    .line 25
    .line 26
    invoke-static {p2, p1}, Ljava/lang/Math;->min(II)I

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->d:I

    .line 31
    .line 32
    iget p2, p0, Lcom/idv/identity/platform/widget/IndicatorView;->a:I

    .line 33
    .line 34
    int-to-float p2, p2

    .line 35
    const/high16 v0, 0x40000000    # 2.0f

    .line 36
    .line 37
    div-float/2addr p2, v0

    .line 38
    iget v1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->f:I

    .line 39
    .line 40
    add-int/2addr v1, v1

    .line 41
    add-int/lit8 v1, v1, -0x1

    .line 42
    .line 43
    mul-int/2addr v1, p1

    .line 44
    int-to-float p1, v1

    .line 45
    div-float/2addr p1, v0

    .line 46
    sub-float/2addr p2, p1

    .line 47
    float-to-int p1, p2

    .line 48
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->g:I

    .line 49
    .line 50
    return-void
.end method

.method public setColorSelector(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->k:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->h:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setColorUnSelector(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->l:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/idv/identity/platform/widget/IndicatorView;->i:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setCurrentSelectedPosition(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->j:I

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setIndicatorItemCount(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/idv/identity/platform/widget/IndicatorView;->f:I

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/widget/IndicatorView;->a()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
