.class public Lcom/p1/mobile/putong/live/base/view/CloseButton;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:F

.field public d:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 64
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/CloseButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 63
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/CloseButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/thc0;->i:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    sget p2, Ll/thc0;->j:I

    .line 11
    .line 12
    const p3, -0x777778

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->a:I

    .line 20
    .line 21
    sget p2, Ll/thc0;->k:I

    .line 22
    .line 23
    const/4 p3, -0x1

    .line 24
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 25
    .line 26
    .line 27
    move-result p2

    .line 28
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->b:I

    .line 29
    .line 30
    sget p2, Ll/thc0;->l:I

    .line 31
    .line 32
    sget p3, Ll/qa00;->c:I

    .line 33
    .line 34
    int-to-float p3, p3

    .line 35
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 36
    .line 37
    .line 38
    move-result p2

    .line 39
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->c:F

    .line 40
    .line 41
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 42
    .line 43
    .line 44
    new-instance p1, Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 47
    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 50
    .line 51
    const/4 p2, 0x1

    .line 52
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 56
    .line 57
    sget-object p1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 58
    .line 59
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 60
    .line 61
    .line 62
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v2

    .line 5
    invoke-virtual {p0}, Landroid/view/View;->getPaddingStart()I

    .line 6
    .line 7
    .line 8
    move-result v3

    .line 9
    sub-int/2addr v2, v3

    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getPaddingEnd()I

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    sub-int/2addr v2, v3

    .line 15
    shr-int/lit8 v3, v2, 0x1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 18
    .line 19
    .line 20
    move-result v4

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    sub-int/2addr v4, v5

    .line 26
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    sub-int v9, v4, v5

    .line 31
    .line 32
    shr-int/lit8 v10, v9, 0x1

    .line 33
    .line 34
    invoke-static {v3, v10}, Ljava/lang/Math;->min(II)I

    .line 35
    .line 36
    .line 37
    move-result v4

    .line 38
    iget v5, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->c:F

    .line 39
    .line 40
    const/high16 v6, 0x40000000    # 2.0f

    .line 41
    .line 42
    div-float/2addr v5, v6

    .line 43
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 44
    .line 45
    .line 46
    move-result v6

    .line 47
    shr-int/lit8 v6, v6, 0x1

    .line 48
    .line 49
    int-to-float v6, v6

    .line 50
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    shr-int/lit8 v7, v7, 0x1

    .line 55
    .line 56
    int-to-float v7, v7

    .line 57
    invoke-virtual {p1, v6, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 58
    .line 59
    .line 60
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 61
    .line 62
    iget v7, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->a:I

    .line 63
    .line 64
    invoke-virtual {v6, v7}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    .line 66
    .line 67
    int-to-float v4, v4

    .line 68
    iget-object v6, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 69
    .line 70
    const/4 v7, 0x0

    .line 71
    invoke-virtual {p1, v7, v7, v4, v6}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 72
    .line 73
    .line 74
    iget-object v4, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 75
    .line 76
    iget v6, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->b:I

    .line 77
    .line 78
    invoke-virtual {v4, v6}, Landroid/graphics/Paint;->setColor(I)V

    .line 79
    .line 80
    .line 81
    const/high16 v4, 0x42340000    # 45.0f

    .line 82
    .line 83
    invoke-virtual {p1, v4}, Landroid/graphics/Canvas;->rotate(F)V

    .line 84
    .line 85
    .line 86
    neg-int v3, v3

    .line 87
    shr-int/lit8 v3, v3, 0x1

    .line 88
    .line 89
    int-to-float v3, v3

    .line 90
    move v4, v2

    .line 91
    move v2, v3

    .line 92
    neg-float v3, v5

    .line 93
    shr-int/lit8 v4, v4, 0x2

    .line 94
    .line 95
    int-to-float v4, v4

    .line 96
    iget-object v8, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 97
    .line 98
    move v6, v5

    .line 99
    move v7, v5

    .line 100
    move-object v1, p1

    .line 101
    invoke-virtual/range {v1 .. v8}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 102
    .line 103
    .line 104
    move v1, v3

    .line 105
    move v3, v5

    .line 106
    neg-int v2, v10

    .line 107
    shr-int/lit8 v2, v2, 0x1

    .line 108
    .line 109
    int-to-float v2, v2

    .line 110
    shr-int/lit8 v4, v9, 0x2

    .line 111
    .line 112
    int-to-float v4, v4

    .line 113
    iget-object v7, p0, Lcom/p1/mobile/putong/live/base/view/CloseButton;->d:Landroid/graphics/Paint;

    .line 114
    .line 115
    move v6, v3

    .line 116
    move-object v0, p1

    .line 117
    invoke-virtual/range {v0 .. v7}, Landroid/graphics/Canvas;->drawRoundRect(FFFFFFLandroid/graphics/Paint;)V

    .line 118
    .line 119
    .line 120
    return-void
.end method
