.class public Ll/zvg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pxh;


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Landroid/graphics/Canvas;Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;[Landroid/graphics/Paint;F)V
    .locals 10

    .line 1
    array-length p2, p3

    .line 2
    const/4 v0, 0x1

    .line 3
    if-le p2, v0, :cond_0

    .line 4
    .line 5
    iget-object p2, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 6
    .line 7
    invoke-virtual {p2}, Landroid/graphics/RectF;->centerX()F

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    iget-object v1, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerY()F

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    iget-object v2, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 18
    .line 19
    iget v3, v2, Landroid/graphics/RectF;->right:F

    .line 20
    .line 21
    iget v2, v2, Landroid/graphics/RectF;->left:F

    .line 22
    .line 23
    sub-float/2addr v3, v2

    .line 24
    const/high16 v2, 0x40000000    # 2.0f

    .line 25
    .line 26
    div-float/2addr v3, v2

    .line 27
    aget-object v0, p3, v0

    .line 28
    .line 29
    invoke-virtual {p1, p2, v1, v3, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    iget-object v5, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 33
    .line 34
    iget p2, p0, Ll/zvg;->b:I

    .line 35
    .line 36
    int-to-float v6, p2

    .line 37
    invoke-virtual {p0, p4}, Ll/zvg;->e(F)F

    .line 38
    .line 39
    .line 40
    move-result v7

    .line 41
    const/4 p0, 0x0

    .line 42
    aget-object v9, p3, p0

    .line 43
    .line 44
    const/4 v8, 0x0

    .line 45
    move-object v4, p1

    .line 46
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    .line 1
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/shc0;->A:[I

    .line 8
    .line 9
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    sget p2, Ll/shc0;->B:I

    .line 14
    .line 15
    const/4 v0, -0x1

    .line 16
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 17
    .line 18
    .line 19
    move-result p2

    .line 20
    iput p2, p0, Ll/zvg;->a:I

    .line 21
    .line 22
    sget p2, Ll/shc0;->C:I

    .line 23
    .line 24
    const/16 v0, -0x5a

    .line 25
    .line 26
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 27
    .line 28
    .line 29
    move-result p2

    .line 30
    iput p2, p0, Ll/zvg;->b:I

    .line 31
    .line 32
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 33
    .line 34
    .line 35
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)V
    .locals 6

    .line 1
    iget-object v0, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getDrawLineWidth()I

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    iget v2, p0, Ll/zvg;->a:I

    .line 18
    .line 19
    if-gtz v2, :cond_0

    .line 20
    .line 21
    shr-int/lit8 p1, p1, 0x1

    .line 22
    .line 23
    new-instance v2, Landroid/graphics/RectF;

    .line 24
    .line 25
    int-to-float v3, p1

    .line 26
    sub-int/2addr v0, p1

    .line 27
    int-to-float v0, v0

    .line 28
    sub-int/2addr v1, p1

    .line 29
    int-to-float p1, v1

    .line 30
    invoke-direct {v2, v3, v3, v0, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 31
    .line 32
    .line 33
    iput-object v2, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 34
    .line 35
    return-void

    .line 36
    :cond_0
    mul-int/lit8 p1, p1, 0x2

    .line 37
    .line 38
    sub-int v3, v0, p1

    .line 39
    .line 40
    mul-int/lit8 v4, v2, 0x2

    .line 41
    .line 42
    sub-int/2addr v3, v4

    .line 43
    div-int/lit8 v3, v3, 0x2

    .line 44
    .line 45
    sub-int p1, v1, p1

    .line 46
    .line 47
    mul-int/lit8 v2, v2, 0x2

    .line 48
    .line 49
    sub-int/2addr p1, v2

    .line 50
    div-int/lit8 p1, p1, 0x2

    .line 51
    .line 52
    new-instance v2, Landroid/graphics/RectF;

    .line 53
    .line 54
    int-to-float v4, v3

    .line 55
    int-to-float v5, p1

    .line 56
    sub-int/2addr v0, v3

    .line 57
    int-to-float v0, v0

    .line 58
    sub-int/2addr v1, p1

    .line 59
    int-to-float p1, v1

    .line 60
    invoke-direct {v2, v4, v5, v0, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 61
    .line 62
    .line 63
    iput-object v2, p0, Ll/zvg;->c:Landroid/graphics/RectF;

    .line 64
    .line 65
    :cond_1
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)[Landroid/graphics/Paint;
    .locals 4

    .line 1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getBackGroundColor()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    const/4 v0, 0x1

    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    new-instance p0, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {p0}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 14
    .line 15
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getBackGroundColor()I

    .line 22
    .line 23
    .line 24
    move-result v1

    .line 25
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getDrawLineWidth()I

    .line 29
    .line 30
    .line 31
    move-result v1

    .line 32
    int-to-float v1, v1

    .line 33
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 34
    .line 35
    .line 36
    sget-object v1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 37
    .line 38
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 39
    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    :goto_0
    if-eqz p0, :cond_1

    .line 44
    .line 45
    const/4 v1, 0x2

    .line 46
    goto :goto_1

    .line 47
    :cond_1
    move v1, v0

    .line 48
    :goto_1
    new-array v1, v1, [Landroid/graphics/Paint;

    .line 49
    .line 50
    new-instance v2, Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-direct {v2}, Landroid/graphics/Paint;-><init>()V

    .line 53
    .line 54
    .line 55
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 56
    .line 57
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    .line 59
    .line 60
    invoke-virtual {v2, v0}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 61
    .line 62
    .line 63
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getProgressColor()I

    .line 64
    .line 65
    .line 66
    move-result v3

    .line 67
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 68
    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getDrawLineWidth()I

    .line 71
    .line 72
    .line 73
    move-result p1

    .line 74
    int-to-float p1, p1

    .line 75
    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 76
    .line 77
    .line 78
    sget-object p1, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 79
    .line 80
    invoke-virtual {v2, p1}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 81
    .line 82
    .line 83
    const/4 p1, 0x0

    .line 84
    aput-object v2, v1, p1

    .line 85
    .line 86
    if-eqz p0, :cond_2

    .line 87
    .line 88
    aput-object p0, v1, v0

    .line 89
    .line 90
    :cond_2
    return-object v1
.end method

.method public final e(F)F
    .locals 0

    .line 1
    const/high16 p0, 0x43b40000    # 360.0f

    .line 2
    .line 3
    mul-float/2addr p1, p0

    .line 4
    return p1
.end method
