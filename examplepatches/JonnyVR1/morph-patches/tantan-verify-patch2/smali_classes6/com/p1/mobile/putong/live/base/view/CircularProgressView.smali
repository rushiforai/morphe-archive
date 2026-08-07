.class public Lcom/p1/mobile/putong/live/base/view/CircularProgressView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/RectF;

.field public d:[I

.field public e:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 161
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 160
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 4
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    sget-object p3, Ll/thc0;->a:[I

    .line 5
    .line 6
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance p2, Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 16
    .line 17
    sget-object p3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 18
    .line 19
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    .line 21
    .line 22
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 23
    .line 24
    sget-object v0, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 25
    .line 26
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 27
    .line 28
    .line 29
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 30
    .line 31
    const/4 v1, 0x1

    .line 32
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 33
    .line 34
    .line 35
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 36
    .line 37
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 38
    .line 39
    .line 40
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 41
    .line 42
    sget v2, Ll/thc0;->c:I

    .line 43
    .line 44
    const/high16 v3, 0x40a00000    # 5.0f

    .line 45
    .line 46
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 51
    .line 52
    .line 53
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 54
    .line 55
    sget v2, Ll/thc0;->b:I

    .line 56
    .line 57
    const v3, -0x333334

    .line 58
    .line 59
    .line 60
    invoke-virtual {p1, v2, v3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 61
    .line 62
    .line 63
    move-result v2

    .line 64
    invoke-virtual {p2, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 65
    .line 66
    .line 67
    new-instance p2, Landroid/graphics/Paint;

    .line 68
    .line 69
    invoke-direct {p2}, Landroid/graphics/Paint;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 73
    .line 74
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 75
    .line 76
    .line 77
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 78
    .line 79
    invoke-virtual {p2, v0}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 80
    .line 81
    .line 82
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 83
    .line 84
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 85
    .line 86
    .line 87
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 88
    .line 89
    invoke-virtual {p2, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 90
    .line 91
    .line 92
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 93
    .line 94
    sget p3, Ll/thc0;->g:I

    .line 95
    .line 96
    const/high16 v0, 0x41200000    # 10.0f

    .line 97
    .line 98
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 99
    .line 100
    .line 101
    move-result p3

    .line 102
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 103
    .line 104
    .line 105
    iget-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 106
    .line 107
    sget p3, Ll/thc0;->d:I

    .line 108
    .line 109
    const v0, -0xffff01

    .line 110
    .line 111
    .line 112
    invoke-virtual {p1, p3, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 113
    .line 114
    .line 115
    move-result p3

    .line 116
    invoke-virtual {p2, p3}, Landroid/graphics/Paint;->setColor(I)V

    .line 117
    .line 118
    .line 119
    sget p2, Ll/thc0;->f:I

    .line 120
    .line 121
    const/4 p3, -0x1

    .line 122
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    sget v0, Ll/thc0;->e:I

    .line 127
    .line 128
    invoke-virtual {p1, v0, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    if-eq p2, p3, :cond_0

    .line 133
    .line 134
    if-eq v0, p3, :cond_0

    .line 135
    .line 136
    filled-new-array {p2, v0}, [I

    .line 137
    .line 138
    .line 139
    move-result-object p2

    .line 140
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->d:[I

    .line 141
    .line 142
    goto :goto_0

    .line 143
    :cond_0
    const/4 p2, 0x0

    .line 144
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->d:[I

    .line 145
    .line 146
    :goto_0
    sget p2, Ll/thc0;->h:I

    .line 147
    .line 148
    const/4 p3, 0x0

    .line 149
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 150
    .line 151
    .line 152
    move-result p2

    .line 153
    int-to-float p2, p2

    .line 154
    iput p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->e:F

    .line 155
    .line 156
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 157
    .line 158
    .line 159
    return-void
.end method


# virtual methods
.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 12

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->c:Landroid/graphics/RectF;

    .line 5
    .line 6
    const/4 v4, 0x0

    .line 7
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    const/high16 v3, 0x43b40000    # 360.0f

    .line 11
    .line 12
    move-object v0, p1

    .line 13
    invoke-virtual/range {v0 .. v5}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 14
    .line 15
    .line 16
    iget-object v7, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->c:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/high16 p1, 0x43b40000    # 360.0f

    .line 19
    .line 20
    iget v1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->e:F

    .line 21
    .line 22
    mul-float/2addr v1, p1

    .line 23
    const/high16 p1, 0x42c80000    # 100.0f

    .line 24
    .line 25
    div-float v9, v1, p1

    .line 26
    .line 27
    const/4 v10, 0x0

    .line 28
    iget-object v11, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 29
    .line 30
    const/high16 v8, 0x42be0000    # 95.0f

    .line 31
    .line 32
    move-object v6, v0

    .line 33
    invoke-virtual/range {v6 .. v11}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

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
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 9
    .line 10
    .line 11
    move-result p2

    .line 12
    sub-int/2addr p1, p2

    .line 13
    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    .line 14
    .line 15
    .line 16
    move-result p2

    .line 17
    sub-int/2addr p1, p2

    .line 18
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 19
    .line 20
    .line 21
    move-result p2

    .line 22
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    sub-int/2addr p2, v0

    .line 27
    invoke-virtual {p0}, Landroid/view/View;->getPaddingBottom()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    sub-int/2addr p2, v0

    .line 32
    if-le p1, p2, :cond_0

    .line 33
    .line 34
    move v0, p2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    move v0, p1

    .line 37
    :goto_0
    int-to-float v0, v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 39
    .line 40
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 45
    .line 46
    invoke-virtual {v2}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 47
    .line 48
    .line 49
    move-result v2

    .line 50
    cmpl-float v1, v1, v2

    .line 51
    .line 52
    if-lez v1, :cond_1

    .line 53
    .line 54
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->a:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    goto :goto_1

    .line 61
    :cond_1
    iget-object v1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 62
    .line 63
    invoke-virtual {v1}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 64
    .line 65
    .line 66
    move-result v1

    .line 67
    :goto_1
    sub-float/2addr v0, v1

    .line 68
    float-to-int v0, v0

    .line 69
    invoke-virtual {p0}, Landroid/view/View;->getPaddingLeft()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    sub-int/2addr p1, v0

    .line 74
    div-int/lit8 p1, p1, 0x2

    .line 75
    .line 76
    add-int/2addr v1, p1

    .line 77
    invoke-virtual {p0}, Landroid/view/View;->getPaddingTop()I

    .line 78
    .line 79
    .line 80
    move-result p1

    .line 81
    sub-int/2addr p2, v0

    .line 82
    div-int/lit8 p2, p2, 0x2

    .line 83
    .line 84
    add-int/2addr p1, p2

    .line 85
    new-instance p2, Landroid/graphics/RectF;

    .line 86
    .line 87
    int-to-float v2, v1

    .line 88
    int-to-float v3, p1

    .line 89
    add-int/2addr v1, v0

    .line 90
    int-to-float v1, v1

    .line 91
    add-int/2addr p1, v0

    .line 92
    int-to-float p1, p1

    .line 93
    invoke-direct {p2, v2, v3, v1, p1}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 94
    .line 95
    .line 96
    iput-object p2, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->c:Landroid/graphics/RectF;

    .line 97
    .line 98
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->d:[I

    .line 99
    .line 100
    if-eqz p1, :cond_2

    .line 101
    .line 102
    array-length p1, p1

    .line 103
    const/4 p2, 0x1

    .line 104
    if-le p1, p2, :cond_2

    .line 105
    .line 106
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->b:Landroid/graphics/Paint;

    .line 107
    .line 108
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 109
    .line 110
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 111
    .line 112
    .line 113
    move-result p2

    .line 114
    int-to-float v4, p2

    .line 115
    iget-object v5, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->d:[I

    .line 116
    .line 117
    const/4 v6, 0x0

    .line 118
    sget-object v7, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 119
    .line 120
    const/4 v1, 0x0

    .line 121
    const/4 v2, 0x0

    .line 122
    const/4 v3, 0x0

    .line 123
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p1, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 127
    .line 128
    .line 129
    :cond_2
    return-void
.end method

.method public setProgress(F)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->e:F

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 4
    .line 5
    .line 6
    return-void
.end method
