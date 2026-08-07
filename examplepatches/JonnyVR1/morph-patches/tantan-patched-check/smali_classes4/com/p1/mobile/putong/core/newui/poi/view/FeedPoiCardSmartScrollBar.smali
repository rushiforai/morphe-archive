.class public Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;
.super Landroid/view/View;
.source "SourceFile"

# interfaces
.implements Lv/VScroll$a;


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/graphics/Paint;

.field public d:Lv/VScroll;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/high16 p1, -0x1000000

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->a:I

    .line 7
    .line 8
    const/4 p1, -0x1

    .line 9
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b:I

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 17
    .line 18
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->e()V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 22
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/high16 p1, -0x1000000

    .line 23
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->a:I

    const/4 p1, -0x1

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b:I

    .line 25
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->e()V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 27
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/high16 p1, -0x1000000

    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->a:I

    const/4 p1, -0x1

    .line 29
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b:I

    .line 30
    new-instance p1, Landroid/graphics/Paint;

    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 31
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->e()V

    return-void
.end method


# virtual methods
.method public a(Lv/VScroll;IIII)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Lv/VScroll;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->d:Lv/VScroll;

    .line 2
    .line 3
    invoke-virtual {p1, p0}, Lv/VScroll;->d(Lv/VScroll$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final c(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->a:I

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    div-int/lit8 v2, v1, 0x2

    .line 17
    .line 18
    new-instance v3, Landroid/graphics/RectF;

    .line 19
    .line 20
    int-to-float v1, v1

    .line 21
    int-to-float v0, v0

    .line 22
    const/4 v4, 0x0

    .line 23
    invoke-direct {v3, v4, v4, v1, v0}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 24
    .line 25
    .line 26
    int-to-float v0, v2

    .line 27
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 28
    .line 29
    invoke-virtual {p1, v3, v0, v0, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public final d(Landroid/graphics/Canvas;)V
    .locals 8

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->d:Lv/VScroll;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 7
    .line 8
    iget v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b:I

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->d:Lv/VScroll;

    .line 18
    .line 19
    invoke-virtual {v1}, Landroid/view/View;->getScrollY()I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->d:Lv/VScroll;

    .line 24
    .line 25
    invoke-virtual {v2}, Landroid/view/View;->getHeight()I

    .line 26
    .line 27
    .line 28
    move-result v2

    .line 29
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->d:Lv/VScroll;

    .line 30
    .line 31
    const/4 v4, 0x0

    .line 32
    invoke-virtual {v3, v4}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    .line 33
    .line 34
    .line 35
    move-result-object v3

    .line 36
    invoke-virtual {v3}, Landroid/view/View;->getHeight()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    const/high16 v4, 0x3f800000    # 1.0f

    .line 41
    .line 42
    if-lez v3, :cond_1

    .line 43
    .line 44
    int-to-float v5, v2

    .line 45
    int-to-float v6, v3

    .line 46
    div-float/2addr v5, v6

    .line 47
    goto :goto_0

    .line 48
    :cond_1
    move v5, v4

    .line 49
    :goto_0
    cmpl-float v6, v5, v4

    .line 50
    .line 51
    if-lez v6, :cond_2

    .line 52
    .line 53
    goto :goto_1

    .line 54
    :cond_2
    move v4, v5

    .line 55
    :goto_1
    int-to-float v5, v0

    .line 56
    mul-float/2addr v5, v4

    .line 57
    float-to-int v4, v5

    .line 58
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 59
    .line 60
    .line 61
    move-result v5

    .line 62
    div-int/lit8 v6, v5, 0x2

    .line 63
    .line 64
    const/4 v7, 0x0

    .line 65
    if-le v3, v2, :cond_3

    .line 66
    .line 67
    int-to-float v1, v1

    .line 68
    sub-int/2addr v3, v2

    .line 69
    int-to-float v2, v3

    .line 70
    div-float/2addr v1, v2

    .line 71
    goto :goto_2

    .line 72
    :cond_3
    move v1, v7

    .line 73
    :goto_2
    sub-int/2addr v0, v4

    .line 74
    int-to-float v0, v0

    .line 75
    mul-float/2addr v1, v0

    .line 76
    new-instance v0, Landroid/graphics/RectF;

    .line 77
    .line 78
    int-to-float v2, v5

    .line 79
    int-to-float v3, v4

    .line 80
    add-float/2addr v3, v1

    .line 81
    invoke-direct {v0, v7, v1, v2, v3}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 82
    .line 83
    .line 84
    int-to-float v1, v6

    .line 85
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 86
    .line 87
    invoke-virtual {p1, v0, v1, v1, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public final e()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget v1, Ll/c9c0;->Z:I

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getColor(I)I

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->a:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c:Landroid/graphics/Paint;

    .line 14
    .line 15
    sget-object v0, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 16
    .line 17
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->c(Landroid/graphics/Canvas;)V

    .line 5
    .line 6
    .line 7
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->d(Landroid/graphics/Canvas;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public setSliderColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/newui/poi/view/FeedPoiCardSmartScrollBar;->b:I

    .line 2
    .line 3
    return-void
.end method
