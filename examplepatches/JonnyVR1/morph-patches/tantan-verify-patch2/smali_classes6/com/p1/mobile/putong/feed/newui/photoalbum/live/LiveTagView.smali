.class public Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/RectF;

.field public c:I

.field public d:I

.field public e:I

.field public f:I

.field public g:I

.field public h:I

.field public i:I

.field public j:I

.field public k:I

.field public l:I

.field public m:I

.field public n:F

.field public o:F

.field public p:F

.field public q:Z

.field public r:I

.field public s:I


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 117
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 116
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Landroid/graphics/Paint;

    .line 5
    .line 6
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 10
    .line 11
    const/16 p1, 0x2bc

    .line 12
    .line 13
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->c:I

    .line 14
    .line 15
    const/high16 p1, 0x40000000    # 2.0f

    .line 16
    .line 17
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result p2

    .line 21
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->d:I

    .line 22
    .line 23
    const/high16 p2, 0x40800000    # 4.0f

    .line 24
    .line 25
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->e:I

    .line 30
    .line 31
    const/high16 p2, 0x40e00000    # 7.0f

    .line 32
    .line 33
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 34
    .line 35
    .line 36
    move-result p2

    .line 37
    iput p2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->f:I

    .line 38
    .line 39
    const/high16 p2, 0x41100000    # 9.0f

    .line 40
    .line 41
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 42
    .line 43
    .line 44
    move-result p3

    .line 45
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->g:I

    .line 46
    .line 47
    const/high16 p3, 0x41400000    # 12.0f

    .line 48
    .line 49
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 50
    .line 51
    .line 52
    move-result p3

    .line 53
    iput p3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->h:I

    .line 54
    .line 55
    const/high16 p3, 0x41600000    # 14.0f

    .line 56
    .line 57
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->i:I

    .line 62
    .line 63
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 64
    .line 65
    .line 66
    move-result p1

    .line 67
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->j:I

    .line 68
    .line 69
    invoke-static {p2}, Ll/qa00;->d(F)I

    .line 70
    .line 71
    .line 72
    move-result p1

    .line 73
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->k:I

    .line 74
    .line 75
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->l:I

    .line 80
    .line 81
    const/high16 p1, 0x3f800000    # 1.0f

    .line 82
    .line 83
    invoke-static {p1}, Ll/qa00;->d(F)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->m:I

    .line 88
    .line 89
    const-string p1, "#ff852a"

    .line 90
    .line 91
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result p1

    .line 95
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->r:I

    .line 96
    .line 97
    const-string p1, "#ff3a00"

    .line 98
    .line 99
    invoke-static {p1}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result p1

    .line 103
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->s:I

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a()V

    .line 106
    .line 107
    .line 108
    new-instance p1, Landroid/graphics/RectF;

    .line 109
    .line 110
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 111
    .line 112
    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->b:Landroid/graphics/RectF;

    .line 114
    .line 115
    return-void
.end method


# virtual methods
.method public final a()V
    .locals 10

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    const/high16 v1, -0x10000

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setColor(I)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v1, 0x1

    .line 11
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setDither(Z)V

    .line 17
    .line 18
    .line 19
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 20
    .line 21
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 22
    .line 23
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 24
    .line 25
    .line 26
    new-instance v2, Landroid/graphics/LinearGradient;

    .line 27
    .line 28
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    int-to-float v6, v0

    .line 33
    iget v7, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->r:I

    .line 34
    .line 35
    iget v8, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->s:I

    .line 36
    .line 37
    sget-object v9, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 38
    .line 39
    const/4 v3, 0x0

    .line 40
    const/4 v4, 0x0

    .line 41
    const/4 v5, 0x0

    .line 42
    invoke-direct/range {v2 .. v9}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p0, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public final b()V
    .locals 6

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->q:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    const/high16 v1, 0x40800000    # 4.0f

    .line 9
    .line 10
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 11
    .line 12
    .line 13
    move-result v2

    .line 14
    sub-int/2addr v0, v2

    .line 15
    const/high16 v2, 0x40000000    # 2.0f

    .line 16
    .line 17
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 18
    .line 19
    .line 20
    move-result v3

    .line 21
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->d:I

    .line 22
    .line 23
    div-int/lit8 v4, v0, 0x6

    .line 24
    .line 25
    add-int/2addr v3, v4

    .line 26
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->e:I

    .line 27
    .line 28
    div-int/lit8 v5, v0, 0x4

    .line 29
    .line 30
    add-int/2addr v3, v5

    .line 31
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->f:I

    .line 32
    .line 33
    add-int/2addr v3, v4

    .line 34
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->g:I

    .line 35
    .line 36
    add-int/2addr v3, v5

    .line 37
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->h:I

    .line 38
    .line 39
    add-int/2addr v3, v4

    .line 40
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->i:I

    .line 41
    .line 42
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    iput v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->j:I

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    sub-int/2addr v3, v1

    .line 57
    int-to-float v1, v3

    .line 58
    const/high16 v3, 0x40e00000    # 7.0f

    .line 59
    .line 60
    mul-float/2addr v1, v3

    .line 61
    const/high16 v3, 0x41400000    # 12.0f

    .line 62
    .line 63
    div-float/2addr v1, v3

    .line 64
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 65
    .line 66
    .line 67
    move-result v3

    .line 68
    int-to-float v3, v3

    .line 69
    add-float/2addr v1, v3

    .line 70
    float-to-int v1, v1

    .line 71
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->k:I

    .line 72
    .line 73
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v2}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result v2

    .line 81
    sub-int/2addr v1, v2

    .line 82
    iput v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->l:I

    .line 83
    .line 84
    div-int/lit8 v0, v0, 0xc

    .line 85
    .line 86
    iput v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->m:I

    .line 87
    .line 88
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 6

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->q:Z

    .line 8
    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->b()V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 15
    .line 16
    .line 17
    move-result-wide v0

    .line 18
    iget v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->c:I

    .line 19
    .line 20
    int-to-long v3, v2

    .line 21
    rem-long/2addr v0, v3

    .line 22
    long-to-float v0, v0

    .line 23
    int-to-float v1, v2

    .line 24
    div-float/2addr v0, v1

    .line 25
    const/high16 v1, 0x3f000000    # 0.5f

    .line 26
    .line 27
    sub-float/2addr v0, v1

    .line 28
    const/high16 v2, 0x40000000    # 2.0f

    .line 29
    .line 30
    mul-float/2addr v0, v2

    .line 31
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->k:I

    .line 32
    .line 33
    int-to-float v4, v3

    .line 34
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->j:I

    .line 35
    .line 36
    sub-int/2addr v3, v5

    .line 37
    int-to-float v3, v3

    .line 38
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 39
    .line 40
    .line 41
    move-result v5

    .line 42
    mul-float/2addr v3, v5

    .line 43
    sub-float/2addr v4, v3

    .line 44
    iput v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->n:F

    .line 45
    .line 46
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->j:I

    .line 47
    .line 48
    int-to-float v4, v3

    .line 49
    iget v5, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->k:I

    .line 50
    .line 51
    sub-int/2addr v5, v3

    .line 52
    int-to-float v3, v5

    .line 53
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result v5

    .line 57
    mul-float/2addr v3, v5

    .line 58
    add-float/2addr v4, v3

    .line 59
    iput v4, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->o:F

    .line 60
    .line 61
    add-float/2addr v0, v1

    .line 62
    const/high16 v1, 0x3f800000    # 1.0f

    .line 63
    .line 64
    cmpl-float v1, v0, v1

    .line 65
    .line 66
    if-lez v1, :cond_1

    .line 67
    .line 68
    sub-float/2addr v0, v2

    .line 69
    :cond_1
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->k:I

    .line 70
    .line 71
    int-to-float v2, v1

    .line 72
    iget v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->j:I

    .line 73
    .line 74
    sub-int/2addr v1, v3

    .line 75
    int-to-float v1, v1

    .line 76
    invoke-static {v0}, Ljava/lang/Math;->abs(F)F

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    mul-float/2addr v1, v0

    .line 81
    sub-float/2addr v2, v1

    .line 82
    iput v2, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->p:F

    .line 83
    .line 84
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->b:Landroid/graphics/RectF;

    .line 85
    .line 86
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->d:I

    .line 87
    .line 88
    int-to-float v1, v1

    .line 89
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 90
    .line 91
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->n:F

    .line 92
    .line 93
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 94
    .line 95
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->e:I

    .line 96
    .line 97
    int-to-float v1, v1

    .line 98
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 99
    .line 100
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->l:I

    .line 101
    .line 102
    int-to-float v1, v1

    .line 103
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 104
    .line 105
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->m:I

    .line 106
    .line 107
    int-to-float v2, v1

    .line 108
    int-to-float v1, v1

    .line 109
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 110
    .line 111
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 112
    .line 113
    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->b:Landroid/graphics/RectF;

    .line 115
    .line 116
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->f:I

    .line 117
    .line 118
    int-to-float v1, v1

    .line 119
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 120
    .line 121
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->o:F

    .line 122
    .line 123
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 124
    .line 125
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->g:I

    .line 126
    .line 127
    int-to-float v1, v1

    .line 128
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 129
    .line 130
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->l:I

    .line 131
    .line 132
    int-to-float v1, v1

    .line 133
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 134
    .line 135
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->m:I

    .line 136
    .line 137
    int-to-float v2, v1

    .line 138
    int-to-float v1, v1

    .line 139
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 140
    .line 141
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 142
    .line 143
    .line 144
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->b:Landroid/graphics/RectF;

    .line 145
    .line 146
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->h:I

    .line 147
    .line 148
    int-to-float v1, v1

    .line 149
    iput v1, v0, Landroid/graphics/RectF;->left:F

    .line 150
    .line 151
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->p:F

    .line 152
    .line 153
    iput v1, v0, Landroid/graphics/RectF;->top:F

    .line 154
    .line 155
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->i:I

    .line 156
    .line 157
    int-to-float v1, v1

    .line 158
    iput v1, v0, Landroid/graphics/RectF;->right:F

    .line 159
    .line 160
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->l:I

    .line 161
    .line 162
    int-to-float v1, v1

    .line 163
    iput v1, v0, Landroid/graphics/RectF;->bottom:F

    .line 164
    .line 165
    iget v1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->m:I

    .line 166
    .line 167
    int-to-float v2, v1

    .line 168
    int-to-float v1, v1

    .line 169
    iget-object v3, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->a:Landroid/graphics/Paint;

    .line 170
    .line 171
    invoke-virtual {p1, v0, v2, v1, v3}, Landroid/graphics/Canvas;->drawRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Paint;)V

    .line 172
    .line 173
    .line 174
    invoke-virtual {p0}, Landroid/view/View;->postInvalidate()V

    .line 175
    .line 176
    .line 177
    return-void
.end method

.method public setLoopTime(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/feed/newui/photoalbum/live/LiveTagView;->c:I

    .line 2
    .line 3
    return-void
.end method
