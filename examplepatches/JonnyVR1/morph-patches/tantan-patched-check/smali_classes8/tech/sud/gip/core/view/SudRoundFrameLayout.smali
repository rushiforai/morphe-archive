.class public Ltech/sud/gip/core/view/SudRoundFrameLayout;
.super Landroid/widget/FrameLayout;
.source "SourceFile"


# instance fields
.field private final leftBottomCorner:Z

.field private final leftTopCorner:Z

.field private final path:Landroid/graphics/Path;

.field private final radiusArray:[F

.field private final rectF:Landroid/graphics/RectF;

.field private final rightBottomCorner:Z

.field private final rightTopCorner:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 127
    invoke-direct {p0, p1, v0}, Ltech/sud/gip/core/view/SudRoundFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 126
    invoke-direct {p0, p1, p2, v0}, Ltech/sud/gip/core/view/SudRoundFrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 12

    .line 1
    invoke-direct {p0, p1, p2}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    const/16 v0, 0x8

    .line 5
    .line 6
    new-array v0, v0, [F

    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    const/4 v2, 0x0

    .line 10
    aput v2, v0, v1

    .line 11
    .line 12
    const/4 v3, 0x1

    .line 13
    aput v2, v0, v3

    .line 14
    .line 15
    const/4 v4, 0x2

    .line 16
    aput v2, v0, v4

    .line 17
    .line 18
    const/4 v5, 0x3

    .line 19
    aput v2, v0, v5

    .line 20
    .line 21
    const/4 v6, 0x4

    .line 22
    aput v2, v0, v6

    .line 23
    .line 24
    const/4 v7, 0x5

    .line 25
    aput v2, v0, v7

    .line 26
    .line 27
    const/4 v8, 0x6

    .line 28
    aput v2, v0, v8

    .line 29
    .line 30
    const/4 v9, 0x7

    .line 31
    aput v2, v0, v9

    .line 32
    .line 33
    iput-object v0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->radiusArray:[F

    .line 34
    .line 35
    new-instance v10, Landroid/graphics/Path;

    .line 36
    .line 37
    invoke-direct {v10}, Landroid/graphics/Path;-><init>()V

    .line 38
    .line 39
    .line 40
    iput-object v10, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->path:Landroid/graphics/Path;

    .line 41
    .line 42
    new-instance v10, Landroid/graphics/RectF;

    .line 43
    .line 44
    invoke-direct {v10}, Landroid/graphics/RectF;-><init>()V

    .line 45
    .line 46
    .line 47
    iput-object v10, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rectF:Landroid/graphics/RectF;

    .line 48
    .line 49
    sget-object v10, Ltech/sud/gip/R$styleable;->fsm_mgp_RoundFrameLayout:[I

    .line 50
    .line 51
    invoke-virtual {p1, p2, v10, p3, v1}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_RoundFrameLayout_sudTopLeftEnabled:I

    .line 56
    .line 57
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 58
    .line 59
    .line 60
    move-result p2

    .line 61
    iput-boolean p2, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->leftTopCorner:Z

    .line 62
    .line 63
    sget p3, Ltech/sud/gip/R$styleable;->fsm_mgp_RoundFrameLayout_sudTopRightEnabled:I

    .line 64
    .line 65
    invoke-virtual {p1, p3, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 66
    .line 67
    .line 68
    move-result p3

    .line 69
    iput-boolean p3, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rightTopCorner:Z

    .line 70
    .line 71
    sget v10, Ltech/sud/gip/R$styleable;->fsm_mgp_RoundFrameLayout_sudBottomLeftEnabled:I

    .line 72
    .line 73
    invoke-virtual {p1, v10, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    iput-boolean v10, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->leftBottomCorner:Z

    .line 78
    .line 79
    sget v11, Ltech/sud/gip/R$styleable;->fsm_mgp_RoundFrameLayout_sudBottomRightEnabled:I

    .line 80
    .line 81
    invoke-virtual {p1, v11, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 82
    .line 83
    .line 84
    move-result v11

    .line 85
    iput-boolean v11, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rightBottomCorner:Z

    .line 86
    .line 87
    sget p0, Ltech/sud/gip/R$styleable;->fsm_mgp_RoundFrameLayout_sudCornerRadius:I

    .line 88
    .line 89
    invoke-virtual {p1, p0, v2}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 90
    .line 91
    .line 92
    move-result p0

    .line 93
    float-to-int p0, p0

    .line 94
    if-eqz p2, :cond_0

    .line 95
    .line 96
    int-to-float p2, p0

    .line 97
    aput p2, v0, v1

    .line 98
    .line 99
    aput p2, v0, v3

    .line 100
    .line 101
    :cond_0
    if-eqz p3, :cond_1

    .line 102
    .line 103
    int-to-float p2, p0

    .line 104
    aput p2, v0, v4

    .line 105
    .line 106
    aput p2, v0, v5

    .line 107
    .line 108
    :cond_1
    if-eqz v11, :cond_2

    .line 109
    .line 110
    int-to-float p2, p0

    .line 111
    aput p2, v0, v8

    .line 112
    .line 113
    aput p2, v0, v9

    .line 114
    .line 115
    :cond_2
    if-eqz v10, :cond_3

    .line 116
    .line 117
    int-to-float p0, p0

    .line 118
    aput p0, v0, v6

    .line 119
    .line 120
    aput p0, v0, v7

    .line 121
    .line 122
    :cond_3
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 123
    .line 124
    .line 125
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->leftTopCorner:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-boolean v0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->leftBottomCorner:Z

    .line 6
    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-boolean v0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rightTopCorner:Z

    .line 10
    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    iget-boolean v0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rightBottomCorner:Z

    .line 14
    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->path:Landroid/graphics/Path;

    .line 18
    .line 19
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 20
    .line 21
    .line 22
    :cond_1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public onMeasure(II)V
    .locals 1

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/FrameLayout;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-object p1, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rectF:Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 7
    .line 8
    .line 9
    move-result p2

    .line 10
    int-to-float p2, p2

    .line 11
    iput p2, p1, Landroid/graphics/RectF;->right:F

    .line 12
    .line 13
    iget-object p1, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rectF:Landroid/graphics/RectF;

    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 16
    .line 17
    .line 18
    move-result p2

    .line 19
    int-to-float p2, p2

    .line 20
    iput p2, p1, Landroid/graphics/RectF;->bottom:F

    .line 21
    .line 22
    iget-object p1, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->path:Landroid/graphics/Path;

    .line 23
    .line 24
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 25
    .line 26
    .line 27
    iget-object p1, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->path:Landroid/graphics/Path;

    .line 28
    .line 29
    iget-object p2, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->rectF:Landroid/graphics/RectF;

    .line 30
    .line 31
    iget-object p0, p0, Ltech/sud/gip/core/view/SudRoundFrameLayout;->radiusArray:[F

    .line 32
    .line 33
    sget-object v0, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 34
    .line 35
    invoke-virtual {p1, p2, p0, v0}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;[FLandroid/graphics/Path$Direction;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method
