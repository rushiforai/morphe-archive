.class public Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public final a:Landroid/graphics/Path;

.field public final b:Landroid/graphics/Path;

.field public final c:Landroid/graphics/Path;

.field public d:Landroid/graphics/Paint;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->a:Landroid/graphics/Path;

    .line 10
    .line 11
    new-instance p1, Landroid/graphics/Path;

    .line 12
    .line 13
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->b:Landroid/graphics/Path;

    .line 17
    .line 18
    new-instance p1, Landroid/graphics/Path;

    .line 19
    .line 20
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 21
    .line 22
    .line 23
    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->c:Landroid/graphics/Path;

    .line 24
    .line 25
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 26
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 27
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->a:Landroid/graphics/Path;

    .line 28
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->b:Landroid/graphics/Path;

    .line 29
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->c:Landroid/graphics/Path;

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 31
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->a:Landroid/graphics/Path;

    .line 32
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->b:Landroid/graphics/Path;

    .line 33
    new-instance p1, Landroid/graphics/Path;

    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->c:Landroid/graphics/Path;

    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 11

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->a:Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 7
    .line 8
    .line 9
    move-result v1

    .line 10
    int-to-float v1, v1

    .line 11
    const v2, 0x3ed1eb85    # 0.41f

    .line 12
    .line 13
    .line 14
    mul-float/2addr v1, v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v3, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    int-to-float v0, v0

    .line 24
    const/high16 v1, 0x40400000    # 3.0f

    .line 25
    .line 26
    div-float v5, v0, v1

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    mul-int/lit8 v0, v0, 0x2

    .line 33
    .line 34
    int-to-float v0, v0

    .line 35
    div-float v7, v0, v1

    .line 36
    .line 37
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    int-to-float v9, v0

    .line 42
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    int-to-float v0, v0

    .line 47
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->a:Landroid/graphics/Path;

    .line 48
    .line 49
    mul-float v10, v0, v2

    .line 50
    .line 51
    const/high16 v1, 0x42f00000    # 120.0f

    .line 52
    .line 53
    sub-float v6, v10, v1

    .line 54
    .line 55
    move v8, v6

    .line 56
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 57
    .line 58
    .line 59
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->a:Landroid/graphics/Path;

    .line 60
    .line 61
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 64
    .line 65
    .line 66
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->b:Landroid/graphics/Path;

    .line 67
    .line 68
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    int-to-float v4, v4

    .line 73
    const v6, 0x3f2e147b    # 0.68f

    .line 74
    .line 75
    .line 76
    mul-float/2addr v4, v6

    .line 77
    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 78
    .line 79
    .line 80
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->b:Landroid/graphics/Path;

    .line 81
    .line 82
    mul-float v10, v0, v6

    .line 83
    .line 84
    sub-float v6, v10, v1

    .line 85
    .line 86
    move v8, v6

    .line 87
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 88
    .line 89
    .line 90
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->b:Landroid/graphics/Path;

    .line 91
    .line 92
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 93
    .line 94
    invoke-virtual {p1, v2, v4}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 95
    .line 96
    .line 97
    iget-object v2, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->c:Landroid/graphics/Path;

    .line 98
    .line 99
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    int-to-float v4, v4

    .line 104
    const v6, 0x3f6e147b    # 0.93f

    .line 105
    .line 106
    .line 107
    mul-float/2addr v4, v6

    .line 108
    invoke-virtual {v2, v3, v4}, Landroid/graphics/Path;->moveTo(FF)V

    .line 109
    .line 110
    .line 111
    iget-object v4, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->c:Landroid/graphics/Path;

    .line 112
    .line 113
    mul-float v10, v0, v6

    .line 114
    .line 115
    sub-float v6, v10, v1

    .line 116
    .line 117
    move v8, v6

    .line 118
    invoke-virtual/range {v4 .. v10}, Landroid/graphics/Path;->cubicTo(FFFFFF)V

    .line 119
    .line 120
    .line 121
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->c:Landroid/graphics/Path;

    .line 122
    .line 123
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 124
    .line 125
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 126
    .line 127
    .line 128
    return-void
.end method

.method public onFinishInflate()V
    .locals 2

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

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
    iput-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 16
    .line 17
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 18
    .line 19
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 23
    .line 24
    sget v1, Ll/qa00;->c:I

    .line 25
    .line 26
    int-to-float v1, v1

    .line 27
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 28
    .line 29
    .line 30
    iget-object p0, p0, Lcom/p1/mobile/putong/live/external/internal/live/square/home/submodule/suggest/item/LiveSuggestCardBgView;->d:Landroid/graphics/Paint;

    .line 31
    .line 32
    const-string v0, "#08000000"

    .line 33
    .line 34
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 35
    .line 36
    .line 37
    move-result v0

    .line 38
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setColor(I)V

    .line 39
    .line 40
    .line 41
    return-void
.end method
