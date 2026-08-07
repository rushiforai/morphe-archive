.class public Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;
.super Landroid/view/View;
.source "SourceFile"


# instance fields
.field public a:Landroid/graphics/RectF;

.field public b:Landroid/graphics/RectF;

.field public c:[F

.field public d:[F

.field public e:F

.field public f:Landroid/graphics/Paint;

.field public g:I

.field public h:F

.field public i:I

.field public j:I

.field public k:F

.field public l:Landroid/graphics/drawable/Drawable;

.field public m:Landroid/graphics/Path;

.field public n:F

.field public o:I

.field public p:I

.field public q:F

.field public r:F

.field public s:Landroid/animation/AnimatorSet;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Landroid/view/View;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RectF;

    .line 5
    .line 6
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 10
    .line 11
    new-instance v0, Landroid/graphics/RectF;

    .line 12
    .line 13
    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    .line 14
    .line 15
    .line 16
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b:Landroid/graphics/RectF;

    .line 17
    .line 18
    const/4 v0, 0x2

    .line 19
    new-array v0, v0, [F

    .line 20
    .line 21
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->c:[F

    .line 22
    .line 23
    const/4 v0, 0x0

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 25
    .line 26
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->r:F

    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    invoke-virtual {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 33
    invoke-direct {p0, p1, p2}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 34
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 35
    new-instance v0, Landroid/graphics/RectF;

    invoke-direct {v0}, Landroid/graphics/RectF;-><init>()V

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b:Landroid/graphics/RectF;

    const/4 v0, 0x2

    .line 36
    new-array v0, v0, [F

    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->c:[F

    const/4 v0, 0x0

    .line 37
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 38
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->r:F

    .line 39
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 40
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 41
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 42
    new-instance p3, Landroid/graphics/RectF;

    invoke-direct {p3}, Landroid/graphics/RectF;-><init>()V

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b:Landroid/graphics/RectF;

    const/4 p3, 0x2

    .line 43
    new-array p3, p3, [F

    iput-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->c:[F

    const/4 p3, 0x0

    .line 44
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 45
    iput p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->r:F

    .line 46
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .locals 5

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->g:I

    .line 2
    .line 3
    new-array v1, v0, [F

    .line 4
    .line 5
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->d:[F

    .line 6
    .line 7
    const/16 v1, 0x168

    .line 8
    .line 9
    div-int/2addr v1, v0

    .line 10
    int-to-float v0, v1

    .line 11
    const v1, 0x3eddd97f    # 0.4333f

    .line 12
    .line 13
    .line 14
    mul-float/2addr v1, v0

    .line 15
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->e:F

    .line 16
    .line 17
    const/high16 v2, 0x40000000    # 2.0f

    .line 18
    .line 19
    div-float/2addr v1, v2

    .line 20
    const/4 v2, 0x0

    .line 21
    :goto_0
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->d:[F

    .line 22
    .line 23
    array-length v4, v3

    .line 24
    if-ge v2, v4, :cond_0

    .line 25
    .line 26
    int-to-float v4, v2

    .line 27
    mul-float/2addr v4, v0

    .line 28
    sub-float/2addr v4, v1

    .line 29
    aput v4, v3, v2

    .line 30
    .line 31
    add-int/lit8 v2, v2, 0x1

    .line 32
    .line 33
    goto :goto_0

    .line 34
    :cond_0
    return-void
.end method

.method public final b(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 2

    .line 1
    sget-object v0, Ll/khc0;->r1:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    sget p2, Ll/khc0;->t1:I

    .line 8
    .line 9
    sget v0, Ll/qa00;->i:I

    .line 10
    .line 11
    int-to-float v0, v0

    .line 12
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->k:F

    .line 17
    .line 18
    sget p2, Ll/khc0;->s1:I

    .line 19
    .line 20
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 21
    .line 22
    .line 23
    move-result-object p2

    .line 24
    iput-object p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->l:Landroid/graphics/drawable/Drawable;

    .line 25
    .line 26
    sget p2, Ll/khc0;->u1:I

    .line 27
    .line 28
    const/16 v0, 0x8

    .line 29
    .line 30
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 31
    .line 32
    .line 33
    move-result p2

    .line 34
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->g:I

    .line 35
    .line 36
    sget p2, Ll/khc0;->w1:I

    .line 37
    .line 38
    const-string v0, "#00ffffff"

    .line 39
    .line 40
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 45
    .line 46
    .line 47
    move-result p2

    .line 48
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->i:I

    .line 49
    .line 50
    sget p2, Ll/khc0;->v1:I

    .line 51
    .line 52
    const-string v0, "#22ffffff"

    .line 53
    .line 54
    invoke-static {v0}, Landroid/graphics/Color;->parseColor(Ljava/lang/String;)I

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 59
    .line 60
    .line 61
    move-result p2

    .line 62
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->j:I

    .line 63
    .line 64
    sget p2, Ll/khc0;->x1:I

    .line 65
    .line 66
    const/high16 v0, 0x3f000000    # 0.5f

    .line 67
    .line 68
    invoke-virtual {p1, p2, v0}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 69
    .line 70
    .line 71
    move-result p2

    .line 72
    sget v0, Ll/khc0;->y1:I

    .line 73
    .line 74
    const v1, 0x3f1e353f    # 0.618f

    .line 75
    .line 76
    .line 77
    invoke-virtual {p1, v0, v1}, Landroid/content/res/TypedArray;->getFloat(IF)F

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->h:F

    .line 82
    .line 83
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 84
    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iget p1, p1, Landroid/util/DisplayMetrics;->widthPixels:I

    .line 99
    .line 100
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->o:I

    .line 101
    .line 102
    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    invoke-static {p1}, Ll/bnl0;->x0(Landroid/content/Context;)I

    .line 107
    .line 108
    .line 109
    move-result p1

    .line 110
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->p:I

    .line 111
    .line 112
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->o:I

    .line 113
    .line 114
    int-to-float v1, v0

    .line 115
    mul-float/2addr v1, p2

    .line 116
    int-to-float v0, v0

    .line 117
    mul-float/2addr v1, v0

    .line 118
    mul-float/2addr v1, p2

    .line 119
    int-to-float p2, p1

    .line 120
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->h:F

    .line 121
    .line 122
    mul-float/2addr p2, v0

    .line 123
    int-to-float p1, p1

    .line 124
    mul-float/2addr p2, p1

    .line 125
    mul-float/2addr p2, v0

    .line 126
    add-float/2addr v1, p2

    .line 127
    float-to-double p1, v1

    .line 128
    invoke-static {p1, p2}, Ljava/lang/Math;->sqrt(D)D

    .line 129
    .line 130
    .line 131
    move-result-wide p1

    .line 132
    double-to-float p1, p1

    .line 133
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->n:F

    .line 134
    .line 135
    new-instance p1, Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 138
    .line 139
    .line 140
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->f:Landroid/graphics/Paint;

    .line 141
    .line 142
    const/4 p2, -0x1

    .line 143
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 144
    .line 145
    .line 146
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->f:Landroid/graphics/Paint;

    .line 147
    .line 148
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 149
    .line 150
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a()V

    .line 154
    .line 155
    .line 156
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->l:Landroid/graphics/drawable/Drawable;

    .line 157
    .line 158
    if-nez p1, :cond_0

    .line 159
    .line 160
    new-instance p1, Landroid/graphics/drawable/GradientDrawable;

    .line 161
    .line 162
    invoke-direct {p1}, Landroid/graphics/drawable/GradientDrawable;-><init>()V

    .line 163
    .line 164
    .line 165
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->l:Landroid/graphics/drawable/Drawable;

    .line 166
    .line 167
    const/4 p2, 0x0

    .line 168
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/GradientDrawable;->setGradientType(I)V

    .line 169
    .line 170
    .line 171
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->l:Landroid/graphics/drawable/Drawable;

    .line 172
    .line 173
    check-cast p0, Landroid/graphics/drawable/GradientDrawable;

    .line 174
    .line 175
    sget-object p1, Landroid/graphics/drawable/GradientDrawable$Orientation;->TOP_BOTTOM:Landroid/graphics/drawable/GradientDrawable$Orientation;

    .line 176
    .line 177
    invoke-virtual {p0, p1}, Landroid/graphics/drawable/GradientDrawable;->setOrientation(Landroid/graphics/drawable/GradientDrawable$Orientation;)V

    .line 178
    .line 179
    .line 180
    :cond_0
    return-void
.end method

.method public getRadiateTranslationY()F
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->c:[F

    .line 2
    .line 3
    const/4 v1, 0x1

    .line 4
    aget v0, v0, v1

    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->p:I

    .line 7
    .line 8
    int-to-float v2, v1

    .line 9
    div-float/2addr v0, v2

    .line 10
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->h:F

    .line 11
    .line 12
    sub-float/2addr p0, v0

    .line 13
    int-to-float v0, v1

    .line 14
    mul-float/2addr p0, v0

    .line 15
    return p0
.end method

.method public getRotateAngle()F
    .locals 0
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 2
    .line 3
    return p0
.end method

.method public onDetachedFromWindow()V
    .locals 1

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->s:Landroid/animation/AnimatorSet;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->s:Landroid/animation/AnimatorSet;

    .line 13
    .line 14
    invoke-virtual {v0}, Landroid/animation/AnimatorSet;->isRunning()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_0

    .line 19
    .line 20
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->s:Landroid/animation/AnimatorSet;

    .line 21
    .line 22
    invoke-virtual {p0}, Landroid/animation/AnimatorSet;->cancel()V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 9

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->m:Landroid/graphics/Path;

    .line 5
    .line 6
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->m:Landroid/graphics/Path;

    .line 13
    .line 14
    invoke-virtual {p1, v0}, Landroid/graphics/Canvas;->clipPath(Landroid/graphics/Path;)Z

    .line 15
    .line 16
    .line 17
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->l:Landroid/graphics/drawable/Drawable;

    .line 18
    .line 19
    invoke-virtual {v0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 20
    .line 21
    .line 22
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 23
    .line 24
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 25
    .line 26
    invoke-virtual {v1}, Landroid/graphics/RectF;->centerX()F

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 31
    .line 32
    invoke-virtual {v2}, Landroid/graphics/RectF;->centerY()F

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->r:F

    .line 37
    .line 38
    add-float/2addr v2, v3

    .line 39
    invoke-virtual {p1, v0, v1, v2}, Landroid/graphics/Canvas;->rotate(FFF)V

    .line 40
    .line 41
    .line 42
    const/4 v0, 0x0

    .line 43
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->r:F

    .line 44
    .line 45
    invoke-virtual {p1, v0, v1}, Landroid/graphics/Canvas;->translate(FF)V

    .line 46
    .line 47
    .line 48
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->d:[F

    .line 49
    .line 50
    array-length v1, v0

    .line 51
    const/4 v2, 0x0

    .line 52
    :goto_0
    if-ge v2, v1, :cond_1

    .line 53
    .line 54
    aget v5, v0, v2

    .line 55
    .line 56
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 57
    .line 58
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->e:F

    .line 59
    .line 60
    const/4 v7, 0x1

    .line 61
    iget-object v8, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->f:Landroid/graphics/Paint;

    .line 62
    .line 63
    move-object v3, p1

    .line 64
    invoke-virtual/range {v3 .. v8}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 65
    .line 66
    .line 67
    add-int/lit8 v2, v2, 0x1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    return-void
.end method

.method public onSizeChanged(IIII)V
    .locals 7

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Landroid/view/View;->onSizeChanged(IIII)V

    .line 2
    .line 3
    .line 4
    new-instance v0, Landroid/graphics/RadialGradient;

    .line 5
    .line 6
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->c:[F

    .line 7
    .line 8
    const/4 p4, 0x0

    .line 9
    aget v1, p3, p4

    .line 10
    .line 11
    const/4 p4, 0x1

    .line 12
    aget v2, p3, p4

    .line 13
    .line 14
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->n:F

    .line 15
    .line 16
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->i:I

    .line 17
    .line 18
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->j:I

    .line 19
    .line 20
    sget-object v6, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 21
    .line 22
    invoke-direct/range {v0 .. v6}, Landroid/graphics/RadialGradient;-><init>(FFFIILandroid/graphics/Shader$TileMode;)V

    .line 23
    .line 24
    .line 25
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->f:Landroid/graphics/Paint;

    .line 26
    .line 27
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 28
    .line 29
    .line 30
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->a:Landroid/graphics/RectF;

    .line 31
    .line 32
    shr-int/lit8 p4, p1, 0x1

    .line 33
    .line 34
    int-to-float p4, p4

    .line 35
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->n:F

    .line 36
    .line 37
    sub-float v1, p4, v0

    .line 38
    .line 39
    iput v1, p3, Landroid/graphics/RectF;->left:F

    .line 40
    .line 41
    add-float/2addr p4, v0

    .line 42
    iput p4, p3, Landroid/graphics/RectF;->right:F

    .line 43
    .line 44
    shr-int/lit8 v2, p2, 0x1

    .line 45
    .line 46
    int-to-float v2, v2

    .line 47
    sub-float v3, v2, v0

    .line 48
    .line 49
    iput v3, p3, Landroid/graphics/RectF;->top:F

    .line 50
    .line 51
    add-float/2addr v2, v0

    .line 52
    iput v2, p3, Landroid/graphics/RectF;->bottom:F

    .line 53
    .line 54
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->l:Landroid/graphics/drawable/Drawable;

    .line 55
    .line 56
    float-to-int v0, v1

    .line 57
    float-to-int v1, v3

    .line 58
    float-to-int p4, p4

    .line 59
    float-to-int v2, v2

    .line 60
    invoke-virtual {p3, v0, v1, p4, v2}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 61
    .line 62
    .line 63
    new-instance p3, Landroid/graphics/RectF;

    .line 64
    .line 65
    int-to-float p1, p1

    .line 66
    int-to-float p2, p2

    .line 67
    const/4 p4, 0x0

    .line 68
    invoke-direct {p3, p4, p4, p1, p2}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0, p3}, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->setVisualRect(Landroid/graphics/RectF;)V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public setRotateAngle(F)V
    .locals 1
    .annotation build Landroidx/annotation/Keep;
    .end annotation

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->q:F

    .line 8
    .line 9
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public setVisualRect(Landroid/graphics/RectF;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b:Landroid/graphics/RectF;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Landroid/graphics/RectF;->set(Landroid/graphics/RectF;)V

    .line 4
    .line 5
    .line 6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->m:Landroid/graphics/Path;

    .line 7
    .line 8
    if-nez p1, :cond_0

    .line 9
    .line 10
    new-instance p1, Landroid/graphics/Path;

    .line 11
    .line 12
    invoke-direct {p1}, Landroid/graphics/Path;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->m:Landroid/graphics/Path;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-virtual {p1}, Landroid/graphics/Path;->reset()V

    .line 19
    .line 20
    .line 21
    :goto_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->m:Landroid/graphics/Path;

    .line 22
    .line 23
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->b:Landroid/graphics/RectF;

    .line 24
    .line 25
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/vip/widget/RadialView;->k:F

    .line 26
    .line 27
    sget-object v1, Landroid/graphics/Path$Direction;->CW:Landroid/graphics/Path$Direction;

    .line 28
    .line 29
    invoke-virtual {p1, v0, p0, p0, v1}, Landroid/graphics/Path;->addRoundRect(Landroid/graphics/RectF;FFLandroid/graphics/Path$Direction;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
