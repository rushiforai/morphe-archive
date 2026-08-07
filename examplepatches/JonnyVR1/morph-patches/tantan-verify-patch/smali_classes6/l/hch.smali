.class public Ll/hch;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/pxh;


# instance fields
.field public a:I

.field public b:Landroid/graphics/Point;

.field public c:Landroid/graphics/Point;

.field public d:Landroid/graphics/Point;

.field public e:Landroid/graphics/Point;


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
    .locals 14

    .line 1
    iget-object v0, p0, Ll/hch;->c:Landroid/graphics/Point;

    .line 2
    .line 3
    move/from16 v1, p4

    .line 4
    .line 5
    invoke-virtual {p0, v1}, Ll/hch;->e(F)I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    iput v1, v0, Landroid/graphics/Point;->x:I

    .line 10
    .line 11
    iget-object v0, p0, Ll/hch;->d:Landroid/graphics/Point;

    .line 12
    .line 13
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 14
    .line 15
    int-to-float v3, v1

    .line 16
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 17
    .line 18
    int-to-float v4, v0

    .line 19
    iget-object v0, p0, Ll/hch;->e:Landroid/graphics/Point;

    .line 20
    .line 21
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 22
    .line 23
    int-to-float v5, v1

    .line 24
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 25
    .line 26
    int-to-float v6, v0

    .line 27
    const/4 v0, 0x0

    .line 28
    aget-object v7, p3, v0

    .line 29
    .line 30
    move-object v2, p1

    .line 31
    invoke-virtual/range {v2 .. v7}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 32
    .line 33
    .line 34
    iget-object v0, p0, Ll/hch;->b:Landroid/graphics/Point;

    .line 35
    .line 36
    iget v1, v0, Landroid/graphics/Point;->x:I

    .line 37
    .line 38
    int-to-float v9, v1

    .line 39
    iget v0, v0, Landroid/graphics/Point;->y:I

    .line 40
    .line 41
    int-to-float v10, v0

    .line 42
    iget-object p0, p0, Ll/hch;->c:Landroid/graphics/Point;

    .line 43
    .line 44
    iget v0, p0, Landroid/graphics/Point;->x:I

    .line 45
    .line 46
    int-to-float v11, v0

    .line 47
    iget p0, p0, Landroid/graphics/Point;->y:I

    .line 48
    .line 49
    int-to-float v12, p0

    .line 50
    const/4 p0, 0x1

    .line 51
    aget-object v13, p3, p0

    .line 52
    .line 53
    move-object v8, p1

    .line 54
    invoke-virtual/range {v8 .. v13}, Landroid/graphics/Canvas;->drawLine(FFFFLandroid/graphics/Paint;)V

    .line 55
    .line 56
    .line 57
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
    sget p2, Ll/shc0;->D:I

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
    iput p2, p0, Ll/hch;->a:I

    .line 21
    .line 22
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/hch;->d:Landroid/graphics/Point;

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    iget-object v0, p0, Ll/hch;->e:Landroid/graphics/Point;

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    iget v2, p0, Ll/hch;->a:I

    .line 20
    .line 21
    if-gtz v2, :cond_2

    .line 22
    .line 23
    iput v1, p0, Ll/hch;->a:I

    .line 24
    .line 25
    :cond_2
    iget v2, p0, Ll/hch;->a:I

    .line 26
    .line 27
    sub-int/2addr v1, v2

    .line 28
    div-int/lit8 v1, v1, 0x2

    .line 29
    .line 30
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getDrawLineWidth()I

    .line 31
    .line 32
    .line 33
    move-result p1

    .line 34
    sub-int/2addr v0, p1

    .line 35
    div-int/lit8 v0, v0, 0x2

    .line 36
    .line 37
    new-instance p1, Landroid/graphics/Point;

    .line 38
    .line 39
    invoke-direct {p1, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Ll/hch;->d:Landroid/graphics/Point;

    .line 43
    .line 44
    new-instance p1, Landroid/graphics/Point;

    .line 45
    .line 46
    iget v2, p0, Ll/hch;->a:I

    .line 47
    .line 48
    add-int/2addr v2, v1

    .line 49
    invoke-direct {p1, v2, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 50
    .line 51
    .line 52
    iput-object p1, p0, Ll/hch;->e:Landroid/graphics/Point;

    .line 53
    .line 54
    new-instance p1, Landroid/graphics/Point;

    .line 55
    .line 56
    invoke-direct {p1, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Ll/hch;->b:Landroid/graphics/Point;

    .line 60
    .line 61
    new-instance p1, Landroid/graphics/Point;

    .line 62
    .line 63
    invoke-direct {p1, v1, v0}, Landroid/graphics/Point;-><init>(II)V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Ll/hch;->c:Landroid/graphics/Point;

    .line 67
    .line 68
    return-void
.end method

.method public d(Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;)[Landroid/graphics/Paint;
    .locals 4

    .line 1
    new-instance p0, Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-direct {p0}, Landroid/graphics/Paint;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v0, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 9
    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getBackGroundColor()I

    .line 16
    .line 17
    .line 18
    move-result v2

    .line 19
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getDrawLineWidth()I

    .line 23
    .line 24
    .line 25
    move-result v2

    .line 26
    int-to-float v2, v2

    .line 27
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 28
    .line 29
    .line 30
    sget-object v2, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 31
    .line 32
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 33
    .line 34
    .line 35
    new-instance v3, Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-direct {v3}, Landroid/graphics/Paint;-><init>()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {v3, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getProgressColor()I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    invoke-virtual {v3, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1}, Lcom/p1/mobile/putong/feed/newui/view/progressbar/FeedProgressBar;->getDrawLineWidth()I

    .line 54
    .line 55
    .line 56
    move-result p1

    .line 57
    int-to-float p1, p1

    .line 58
    invoke-virtual {v3, p1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 59
    .line 60
    .line 61
    invoke-virtual {v3, v2}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 62
    .line 63
    .line 64
    filled-new-array {p0, v3}, [Landroid/graphics/Paint;

    .line 65
    .line 66
    .line 67
    move-result-object p0

    .line 68
    return-object p0
.end method

.method public final e(F)I
    .locals 0

    .line 1
    iget p0, p0, Ll/hch;->a:I

    .line 2
    .line 3
    int-to-float p0, p0

    .line 4
    mul-float/2addr p0, p1

    .line 5
    float-to-int p0, p0

    .line 6
    return p0
.end method
