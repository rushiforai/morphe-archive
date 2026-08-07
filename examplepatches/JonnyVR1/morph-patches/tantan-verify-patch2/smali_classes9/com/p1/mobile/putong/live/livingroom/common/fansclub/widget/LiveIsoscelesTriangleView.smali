.class public Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Paint;

.field public final b:Landroid/graphics/Path;

.field public c:I
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation
.end field

.field public d:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 17
    .line 18
    const/high16 v0, -0x1000000

    .line 19
    .line 20
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->c:I

    .line 21
    .line 22
    const/4 v0, 0x0

    .line 23
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 24
    .line 25
    const/4 v0, 0x0

    .line 26
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 31
    new-instance v0, Landroid/graphics/Paint;

    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 32
    new-instance v0, Landroid/graphics/Path;

    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    const/high16 v0, -0x1000000

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->c:I

    const/4 v0, 0x0

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 35
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 36
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 37
    new-instance p3, Landroid/graphics/Paint;

    invoke-direct {p3}, Landroid/graphics/Paint;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 38
    new-instance p3, Landroid/graphics/Path;

    invoke-direct {p3}, Landroid/graphics/Path;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    const/high16 p3, -0x1000000

    .line 39
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->c:I

    const/4 p3, 0x0

    .line 40
    iput p3, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 41
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    if-eqz p2, :cond_0

    .line 3
    .line 4
    sget-object v1, Ll/vhc0;->y:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget p2, Ll/vhc0;->z:I

    .line 11
    .line 12
    const/high16 v1, -0x1000000

    .line 13
    .line 14
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->c:I

    .line 19
    .line 20
    sget p2, Ll/vhc0;->A:I

    .line 21
    .line 22
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 23
    .line 24
    .line 25
    move-result p2

    .line 26
    iput p2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 27
    .line 28
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 32
    .line 33
    rem-int/lit8 p2, p1, 0x5a

    .line 34
    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_1
    rem-int/lit16 p1, p1, 0x168

    .line 41
    .line 42
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 43
    .line 44
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 45
    .line 46
    const/4 p2, 0x1

    .line 47
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 48
    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 51
    .line 52
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setDither(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 56
    .line 57
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 58
    .line 59
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 60
    .line 61
    .line 62
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 63
    .line 64
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->c:I

    .line 65
    .line 66
    invoke-virtual {p1, p0}, Landroid/graphics/Paint;->setColor(I)V

    .line 67
    .line 68
    .line 69
    return-void
.end method

.method public draw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->draw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-virtual {v2}, Landroid/graphics/Path;->reset()V

    .line 15
    .line 16
    .line 17
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->d:I

    .line 18
    .line 19
    const/high16 v3, 0x40000000    # 2.0f

    .line 20
    .line 21
    const/4 v4, 0x0

    .line 22
    if-eqz v2, :cond_3

    .line 23
    .line 24
    const/16 v5, 0x5a

    .line 25
    .line 26
    if-eq v2, v5, :cond_2

    .line 27
    .line 28
    const/16 v5, 0xb4

    .line 29
    .line 30
    if-eq v2, v5, :cond_1

    .line 31
    .line 32
    const/16 v5, 0x10e

    .line 33
    .line 34
    if-eq v2, v5, :cond_0

    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 38
    .line 39
    int-to-float v1, v1

    .line 40
    div-float v3, v1, v3

    .line 41
    .line 42
    invoke-virtual {v2, v4, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 43
    .line 44
    .line 45
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 46
    .line 47
    int-to-float v0, v0

    .line 48
    invoke-virtual {v2, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 49
    .line 50
    .line 51
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 52
    .line 53
    invoke-virtual {v1, v0, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 54
    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_1
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 58
    .line 59
    invoke-virtual {v2, v4, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 63
    .line 64
    int-to-float v0, v0

    .line 65
    invoke-virtual {v2, v0, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 66
    .line 67
    .line 68
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 69
    .line 70
    div-float/2addr v0, v3

    .line 71
    int-to-float v1, v1

    .line 72
    invoke-virtual {v2, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_2
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 77
    .line 78
    invoke-virtual {v2, v4, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 79
    .line 80
    .line 81
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 82
    .line 83
    int-to-float v0, v0

    .line 84
    int-to-float v1, v1

    .line 85
    div-float v3, v1, v3

    .line 86
    .line 87
    invoke-virtual {v2, v0, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 91
    .line 92
    invoke-virtual {v0, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 93
    .line 94
    .line 95
    goto :goto_0

    .line 96
    :cond_3
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 97
    .line 98
    int-to-float v0, v0

    .line 99
    div-float v3, v0, v3

    .line 100
    .line 101
    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 102
    .line 103
    .line 104
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 105
    .line 106
    int-to-float v1, v1

    .line 107
    invoke-virtual {v2, v0, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 108
    .line 109
    .line 110
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 111
    .line 112
    invoke-virtual {v0, v4, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 113
    .line 114
    .line 115
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 116
    .line 117
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 118
    .line 119
    .line 120
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->b:Landroid/graphics/Path;

    .line 121
    .line 122
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 123
    .line 124
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 125
    .line 126
    .line 127
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
    move-result v0

    .line 8
    invoke-static {p1}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    const/high16 v1, -0x80000000

    .line 13
    .line 14
    if-ne p1, v1, :cond_0

    .line 15
    .line 16
    sget p1, Ll/qa00;->g:I

    .line 17
    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    add-int/2addr p1, v0

    .line 23
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr v0, p1

    .line 28
    :cond_0
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 29
    .line 30
    .line 31
    move-result p1

    .line 32
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 33
    .line 34
    .line 35
    move-result p2

    .line 36
    if-ne p2, v1, :cond_1

    .line 37
    .line 38
    sget p1, Ll/qa00;->d:I

    .line 39
    .line 40
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 41
    .line 42
    .line 43
    move-result p2

    .line 44
    add-int/2addr p1, p2

    .line 45
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    add-int/2addr p1, p2

    .line 50
    :cond_1
    invoke-virtual {p0, v0, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public setColor(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/MainThread;
    .end annotation

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->c:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/common/fansclub/widget/LiveIsoscelesTriangleView;->a:Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 9
    .line 10
    .line 11
    return-void
.end method
