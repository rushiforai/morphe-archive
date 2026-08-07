.class public Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:I

.field public g:Z

.field public h:Z

.field public i:Z

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:I

.field public o:I

.field public p:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 112
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 111
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/high16 p3, 0x41a00000    # 20.0f

    .line 5
    .line 6
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 7
    .line 8
    .line 9
    move-result p3

    .line 10
    iput p3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->f:I

    .line 11
    .line 12
    sget-object p3, Ll/khc0;->f:[I

    .line 13
    .line 14
    invoke-virtual {p1, p2, p3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    sget p2, Ll/khc0;->g:I

    .line 19
    .line 20
    const/4 p3, 0x0

    .line 21
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->g:Z

    .line 26
    .line 27
    sget p2, Ll/khc0;->h:I

    .line 28
    .line 29
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 30
    .line 31
    .line 32
    move-result p2

    .line 33
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->h:Z

    .line 34
    .line 35
    sget p2, Ll/khc0;->i:I

    .line 36
    .line 37
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 38
    .line 39
    .line 40
    move-result p2

    .line 41
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->i:Z

    .line 42
    .line 43
    sget p2, Ll/khc0;->k:I

    .line 44
    .line 45
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->j:I

    .line 50
    .line 51
    sget p2, Ll/khc0;->j:I

    .line 52
    .line 53
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->k:I

    .line 58
    .line 59
    sget p2, Ll/khc0;->m:I

    .line 60
    .line 61
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 62
    .line 63
    .line 64
    move-result p2

    .line 65
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->l:I

    .line 66
    .line 67
    sget p2, Ll/khc0;->l:I

    .line 68
    .line 69
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 70
    .line 71
    .line 72
    move-result p2

    .line 73
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->m:I

    .line 74
    .line 75
    sget p2, Ll/khc0;->o:I

    .line 76
    .line 77
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 78
    .line 79
    .line 80
    move-result p2

    .line 81
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->n:I

    .line 82
    .line 83
    sget p2, Ll/khc0;->n:I

    .line 84
    .line 85
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInteger(II)I

    .line 86
    .line 87
    .line 88
    move-result p2

    .line 89
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->o:I

    .line 90
    .line 91
    sget p2, Ll/khc0;->p:I

    .line 92
    .line 93
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 94
    .line 95
    .line 96
    move-result p2

    .line 97
    iput p2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->p:I

    .line 98
    .line 99
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 100
    .line 101
    .line 102
    const/4 p1, 0x1

    .line 103
    const/4 p2, 0x0

    .line 104
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setLayerType(ILandroid/graphics/Paint;)V

    .line 105
    .line 106
    .line 107
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->a()V

    .line 108
    .line 109
    .line 110
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->g:Z

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    new-instance v0, Landroid/graphics/Paint;

    .line 7
    .line 8
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->c:Landroid/graphics/Paint;

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->c:Landroid/graphics/Paint;

    .line 17
    .line 18
    sget-object v2, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 19
    .line 20
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->c:Landroid/graphics/Paint;

    .line 24
    .line 25
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->j:I

    .line 26
    .line 27
    int-to-float v2, v2

    .line 28
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 29
    .line 30
    .line 31
    :cond_0
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->h:Z

    .line 32
    .line 33
    const-string v2, "#212121"

    .line 34
    .line 35
    if-eqz v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->d:Landroid/graphics/Paint;

    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->d:Landroid/graphics/Paint;

    .line 48
    .line 49
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 50
    .line 51
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 52
    .line 53
    .line 54
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->d:Landroid/graphics/Paint;

    .line 55
    .line 56
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 61
    .line 62
    .line 63
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->d:Landroid/graphics/Paint;

    .line 64
    .line 65
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->l:I

    .line 66
    .line 67
    int-to-float v3, v3

    .line 68
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 69
    .line 70
    .line 71
    :cond_1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->i:Z

    .line 72
    .line 73
    if-eqz v0, :cond_2

    .line 74
    .line 75
    new-instance v0, Landroid/graphics/Paint;

    .line 76
    .line 77
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 78
    .line 79
    .line 80
    iput-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->e:Landroid/graphics/Paint;

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 83
    .line 84
    .line 85
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->e:Landroid/graphics/Paint;

    .line 86
    .line 87
    sget-object v1, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 88
    .line 89
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 90
    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->e:Landroid/graphics/Paint;

    .line 93
    .line 94
    invoke-static {v2}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 95
    .line 96
    .line 97
    move-result v1

    .line 98
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 99
    .line 100
    .line 101
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->e:Landroid/graphics/Paint;

    .line 102
    .line 103
    iget p0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->n:I

    .line 104
    .line 105
    int-to-float p0, p0

    .line 106
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 107
    .line 108
    .line 109
    :cond_2
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 5
    .param p1    # Landroid/graphics/Canvas;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->c:Landroid/graphics/Paint;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Landroid/graphics/RectF;

    .line 10
    .line 11
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 12
    .line 13
    .line 14
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->j:I

    .line 15
    .line 16
    div-int/lit8 v2, v2, 0x2

    .line 17
    .line 18
    int-to-float v2, v2

    .line 19
    add-float v3, v2, v1

    .line 20
    .line 21
    iput v3, v0, Landroid/graphics/RectF;->top:F

    .line 22
    .line 23
    iput v3, v0, Landroid/graphics/RectF;->left:F

    .line 24
    .line 25
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->a:I

    .line 26
    .line 27
    int-to-float v3, v3

    .line 28
    sub-float/2addr v3, v2

    .line 29
    iput v3, v0, Landroid/graphics/RectF;->right:F

    .line 30
    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->b:I

    .line 32
    .line 33
    int-to-float v3, v3

    .line 34
    sub-float/2addr v3, v2

    .line 35
    iput v3, v0, Landroid/graphics/RectF;->bottom:F

    .line 36
    .line 37
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->k:I

    .line 38
    .line 39
    int-to-float v2, v2

    .line 40
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 41
    .line 42
    .line 43
    move-result v2

    .line 44
    int-to-float v2, v2

    .line 45
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->k:I

    .line 46
    .line 47
    int-to-float v3, v3

    .line 48
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    int-to-float v3, v3

    .line 53
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->c:Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 56
    .line 57
    .line 58
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->d:Landroid/graphics/Paint;

    .line 59
    .line 60
    if-eqz v0, :cond_1

    .line 61
    .line 62
    new-instance v0, Landroid/graphics/RectF;

    .line 63
    .line 64
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 65
    .line 66
    .line 67
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->l:I

    .line 68
    .line 69
    div-int/lit8 v2, v2, 0x2

    .line 70
    .line 71
    add-int/lit8 v2, v2, -0x1

    .line 72
    .line 73
    int-to-float v2, v2

    .line 74
    add-float v3, v2, v1

    .line 75
    .line 76
    iput v3, v0, Landroid/graphics/RectF;->top:F

    .line 77
    .line 78
    iput v3, v0, Landroid/graphics/RectF;->left:F

    .line 79
    .line 80
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->a:I

    .line 81
    .line 82
    int-to-float v3, v3

    .line 83
    sub-float/2addr v3, v2

    .line 84
    iput v3, v0, Landroid/graphics/RectF;->right:F

    .line 85
    .line 86
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->b:I

    .line 87
    .line 88
    int-to-float v3, v3

    .line 89
    sub-float/2addr v3, v2

    .line 90
    iput v3, v0, Landroid/graphics/RectF;->bottom:F

    .line 91
    .line 92
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->m:I

    .line 93
    .line 94
    int-to-float v2, v2

    .line 95
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 96
    .line 97
    .line 98
    move-result v2

    .line 99
    int-to-float v2, v2

    .line 100
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->m:I

    .line 101
    .line 102
    int-to-float v3, v3

    .line 103
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    int-to-float v3, v3

    .line 108
    iget-object v4, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->d:Landroid/graphics/Paint;

    .line 109
    .line 110
    invoke-virtual {p1, v0, v2, v3, v4}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 111
    .line 112
    .line 113
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->e:Landroid/graphics/Paint;

    .line 114
    .line 115
    if-eqz v0, :cond_2

    .line 116
    .line 117
    new-instance v0, Landroid/graphics/RectF;

    .line 118
    .line 119
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 120
    .line 121
    .line 122
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->n:I

    .line 123
    .line 124
    div-int/lit8 v2, v2, 0x2

    .line 125
    .line 126
    iget v3, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->p:I

    .line 127
    .line 128
    add-int/2addr v2, v3

    .line 129
    int-to-float v2, v2

    .line 130
    add-float/2addr v1, v2

    .line 131
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 132
    .line 133
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 134
    .line 135
    iget v1, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->a:I

    .line 136
    .line 137
    int-to-float v1, v1

    .line 138
    sub-float/2addr v1, v2

    .line 139
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 140
    .line 141
    iget v1, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->b:I

    .line 142
    .line 143
    int-to-float v1, v1

    .line 144
    sub-float/2addr v1, v2

    .line 145
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 146
    .line 147
    iget v1, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->o:I

    .line 148
    .line 149
    int-to-float v1, v1

    .line 150
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    int-to-float v1, v1

    .line 155
    iget v2, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->o:I

    .line 156
    .line 157
    int-to-float v2, v2

    .line 158
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 159
    .line 160
    .line 161
    move-result v2

    .line 162
    int-to-float v2, v2

    .line 163
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->e:Landroid/graphics/Paint;

    .line 164
    .line 165
    invoke-virtual {p1, v0, v1, v2, p0}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 166
    .line 167
    .line 168
    :cond_2
    return-void
.end method

.method public onMeasure(II)V
    .locals 0

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
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->a:I

    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredHeight()I

    .line 11
    .line 12
    .line 13
    move-result p1

    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->b:I

    .line 15
    .line 16
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/LinearGradient;

    .line 5
    .line 6
    iget p1, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->b:I

    .line 7
    .line 8
    int-to-float v4, p1

    .line 9
    const-string p1, "#DBBD7A"

    .line 10
    .line 11
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 12
    .line 13
    .line 14
    move-result v5

    .line 15
    const-string p1, "#9E8345"

    .line 16
    .line 17
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v6

    .line 21
    sget-object v7, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 22
    .line 23
    const/4 v1, 0x0

    .line 24
    const/4 v2, 0x0

    .line 25
    const/4 v3, 0x0

    .line 26
    invoke-direct/range {v0 .. v7}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 27
    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/view/CardFrameViewCityC;->c:Landroid/graphics/Paint;

    .line 30
    .line 31
    invoke-virtual {p0, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 32
    .line 33
    .line 34
    return-void
.end method
