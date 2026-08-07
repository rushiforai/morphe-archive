.class public Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public final b:I

.field public final c:I

.field public final d:I

.field public final e:I

.field public f:I

.field public g:Landroid/graphics/Paint;

.field public h:Landroid/graphics/Path;

.field public i:Landroid/graphics/CornerPathEffect;

.field public j:I

.field public k:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 2

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->b:I

    .line 6
    .line 7
    const/4 v0, 0x1

    .line 8
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->c:I

    .line 9
    .line 10
    const/4 v1, 0x2

    .line 11
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->d:I

    .line 12
    .line 13
    const/4 v1, 0x3

    .line 14
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->e:I

    .line 15
    .line 16
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->f:I

    .line 17
    .line 18
    const/4 v0, 0x0

    .line 19
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 23
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->b:I

    const/4 v0, 0x1

    .line 25
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->c:I

    const/4 v1, 0x2

    .line 26
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->d:I

    const/4 v1, 0x3

    .line 27
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->e:I

    .line 28
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->f:I

    .line 29
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 30
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    const/4 p3, 0x0

    .line 31
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->b:I

    const/4 p3, 0x1

    .line 32
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->c:I

    const/4 v0, 0x2

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->d:I

    const/4 v0, 0x3

    .line 34
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->e:I

    .line 35
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->f:I

    .line 36
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a(II)I
    .locals 1

    .line 1
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getMode(I)I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p2}, Landroid/view/View$MeasureSpec;->getSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    const/high16 v0, -0x80000000

    .line 10
    .line 11
    if-eq p0, v0, :cond_0

    .line 12
    .line 13
    const/high16 v0, 0x40000000    # 2.0f

    .line 14
    .line 15
    if-eq p0, v0, :cond_0

    .line 16
    .line 17
    return p1

    .line 18
    :cond_0
    return p2
.end method

.method public b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    new-instance v0, Landroid/graphics/Path;

    .line 2
    .line 3
    invoke-direct {v0}, Landroid/graphics/Path;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 7
    .line 8
    new-instance v0, Landroid/graphics/Paint;

    .line 9
    .line 10
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 14
    .line 15
    new-instance v0, Landroid/graphics/CornerPathEffect;

    .line 16
    .line 17
    const/high16 v1, 0x40800000    # 4.0f

    .line 18
    .line 19
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    int-to-float v1, v1

    .line 24
    invoke-direct {v0, v1}, Landroid/graphics/CornerPathEffect;-><init>(F)V

    .line 25
    .line 26
    .line 27
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->i:Landroid/graphics/CornerPathEffect;

    .line 28
    .line 29
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->a:I

    .line 32
    .line 33
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 34
    .line 35
    .line 36
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->i:Landroid/graphics/CornerPathEffect;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setPathEffect(Landroid/graphics/PathEffect;)Landroid/graphics/PathEffect;

    .line 41
    .line 42
    .line 43
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 44
    .line 45
    const/4 v1, 0x1

    .line 46
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 50
    .line 51
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 52
    .line 53
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 54
    .line 55
    .line 56
    if-eqz p2, :cond_0

    .line 57
    .line 58
    sget-object v0, Ll/shc0;->b0:[I

    .line 59
    .line 60
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    sget p2, Ll/shc0;->c0:I

    .line 65
    .line 66
    const v0, -0xff0100

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->a:I

    .line 74
    .line 75
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 76
    .line 77
    .line 78
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->f:I

    .line 5
    .line 6
    const/4 v1, 0x2

    .line 7
    const/4 v2, 0x0

    .line 8
    if-eqz v0, :cond_3

    .line 9
    .line 10
    const/4 v3, 0x1

    .line 11
    if-eq v0, v3, :cond_2

    .line 12
    .line 13
    if-eq v0, v1, :cond_1

    .line 14
    .line 15
    const/4 v3, 0x3

    .line 16
    if-eq v0, v3, :cond_0

    .line 17
    .line 18
    goto :goto_0

    .line 19
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 20
    .line 21
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 22
    .line 23
    div-int/2addr v3, v1

    .line 24
    int-to-float v1, v3

    .line 25
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 26
    .line 27
    .line 28
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 29
    .line 30
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 31
    .line 32
    int-to-float v1, v1

    .line 33
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 34
    .line 35
    int-to-float v3, v3

    .line 36
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 40
    .line 41
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 42
    .line 43
    int-to-float v1, v1

    .line 44
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 45
    .line 46
    .line 47
    goto :goto_0

    .line 48
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 49
    .line 50
    invoke-virtual {v0, v2, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 54
    .line 55
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 56
    .line 57
    int-to-float v3, v3

    .line 58
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 64
    .line 65
    int-to-float v2, v2

    .line 66
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 67
    .line 68
    div-int/2addr v3, v1

    .line 69
    int-to-float v1, v3

    .line 70
    invoke-virtual {v0, v2, v1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 71
    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_2
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 75
    .line 76
    invoke-virtual {v0, v2, v2}, Landroid/graphics/Path;->moveTo(FF)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 80
    .line 81
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 82
    .line 83
    div-int/2addr v3, v1

    .line 84
    int-to-float v1, v3

    .line 85
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 86
    .line 87
    int-to-float v3, v3

    .line 88
    invoke-virtual {v0, v1, v3}, Landroid/graphics/Path;->lineTo(FF)V

    .line 89
    .line 90
    .line 91
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 92
    .line 93
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 94
    .line 95
    int-to-float v1, v1

    .line 96
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 97
    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 101
    .line 102
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 103
    .line 104
    int-to-float v3, v3

    .line 105
    invoke-virtual {v0, v2, v3}, Landroid/graphics/Path;->moveTo(FF)V

    .line 106
    .line 107
    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 109
    .line 110
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 111
    .line 112
    int-to-float v3, v3

    .line 113
    iget v4, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 114
    .line 115
    int-to-float v4, v4

    .line 116
    invoke-virtual {v0, v3, v4}, Landroid/graphics/Path;->lineTo(FF)V

    .line 117
    .line 118
    .line 119
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 120
    .line 121
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 122
    .line 123
    div-int/2addr v3, v1

    .line 124
    int-to-float v1, v3

    .line 125
    invoke-virtual {v0, v1, v2}, Landroid/graphics/Path;->lineTo(FF)V

    .line 126
    .line 127
    .line 128
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 129
    .line 130
    invoke-virtual {v0}, Landroid/graphics/Path;->close()V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->h:Landroid/graphics/Path;

    .line 134
    .line 135
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-virtual {p1, v0, p0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 138
    .line 139
    .line 140
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x64

    .line 5
    .line 6
    invoke-virtual {p0, v0, p1}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->a(II)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 11
    .line 12
    invoke-virtual {p0, v0, p2}, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->a(II)I

    .line 13
    .line 14
    .line 15
    move-result p1

    .line 16
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->k:I

    .line 17
    .line 18
    iget p2, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->j:I

    .line 19
    .line 20
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public setContentColor(I)V
    .locals 1

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->a:I

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/status/display/statuspage/newtab/FeedSquareBottomStickoutView;->g:Landroid/graphics/Paint;

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-virtual {v0, p1}, Landroid/graphics/Paint;->setColor(I)V

    .line 8
    .line 9
    .line 10
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method
