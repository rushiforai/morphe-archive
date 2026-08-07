.class public Lcom/p1/mobile/putong/core/ui/tarot/LineView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/tarot/LineView$a;
    }
.end annotation


# instance fields
.field public a:Landroid/graphics/Paint;

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:I

.field public i:Landroid/graphics/Paint;

.field public j:I

.field public k:F

.field public l:Landroid/graphics/Paint;

.field public m:Landroid/graphics/Path;

.field public n:I

.field public o:F

.field public p:F

.field public q:F

.field public r:Landroid/animation/ValueAnimator;

.field public s:Z

.field public t:Landroid/graphics/RectF;

.field public u:F


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 47
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/tarot/LineView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 46
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/tarot/LineView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    const/high16 p1, 0x41f00000    # 30.0f

    .line 5
    .line 6
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->b:F

    .line 7
    .line 8
    const/high16 p1, 0x42480000    # 50.0f

    .line 9
    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->c:F

    .line 11
    .line 12
    const/high16 p1, 0x43fa0000    # 500.0f

    .line 13
    .line 14
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 15
    .line 16
    const/high16 p1, 0x41200000    # 10.0f

    .line 17
    .line 18
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->g:F

    .line 19
    .line 20
    const/4 p1, -0x1

    .line 21
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->h:I

    .line 22
    .line 23
    const/4 p1, 0x5

    .line 24
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->j:I

    .line 25
    .line 26
    const/high16 p1, 0x41a00000    # 20.0f

    .line 27
    .line 28
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 29
    .line 30
    const/16 p1, 0x320

    .line 31
    .line 32
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->n:I

    .line 33
    .line 34
    const/high16 p1, 0x3f800000    # 1.0f

    .line 35
    .line 36
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 37
    .line 38
    const/high16 p1, 0x428c0000    # 70.0f

    .line 39
    .line 40
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->q:F

    .line 41
    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->b()V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/tarot/LineView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->c(Landroid/animation/ValueAnimator;)V

    return-void
.end method


# virtual methods
.method public final b()V
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    new-instance v1, Landroid/graphics/Paint;

    .line 4
    .line 5
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 6
    .line 7
    .line 8
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->h:I

    .line 11
    .line 12
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setColor(I)V

    .line 13
    .line 14
    .line 15
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->a:Landroid/graphics/Paint;

    .line 16
    .line 17
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 18
    .line 19
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 20
    .line 21
    .line 22
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->a:Landroid/graphics/Paint;

    .line 23
    .line 24
    const/4 v3, 0x1

    .line 25
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 26
    .line 27
    .line 28
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->a:Landroid/graphics/Paint;

    .line 29
    .line 30
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 31
    .line 32
    .line 33
    new-instance v1, Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 36
    .line 37
    .line 38
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->i:Landroid/graphics/Paint;

    .line 39
    .line 40
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->h:I

    .line 41
    .line 42
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 43
    .line 44
    .line 45
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->i:Landroid/graphics/Paint;

    .line 46
    .line 47
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->j:I

    .line 48
    .line 49
    int-to-float v4, v4

    .line 50
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 51
    .line 52
    .line 53
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->i:Landroid/graphics/Paint;

    .line 54
    .line 55
    sget-object v4, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 56
    .line 57
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 58
    .line 59
    .line 60
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->i:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 63
    .line 64
    .line 65
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->i:Landroid/graphics/Paint;

    .line 66
    .line 67
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 68
    .line 69
    .line 70
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->q:F

    .line 71
    .line 72
    const/high16 v4, 0x43340000    # 180.0f

    .line 73
    .line 74
    sub-float v1, v4, v1

    .line 75
    .line 76
    const/high16 v5, 0x40000000    # 2.0f

    .line 77
    .line 78
    div-float/2addr v1, v5

    .line 79
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 80
    .line 81
    sub-float v4, v1, v4

    .line 82
    .line 83
    iput v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->o:F

    .line 84
    .line 85
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->b:F

    .line 86
    .line 87
    iget v6, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 88
    .line 89
    add-float/2addr v4, v6

    .line 90
    float-to-double v7, v4

    .line 91
    float-to-double v9, v6

    .line 92
    float-to-double v11, v1

    .line 93
    const-wide v13, 0x400921fb54442d18L    # Math.PI

    .line 94
    .line 95
    .line 96
    .line 97
    .line 98
    mul-double/2addr v11, v13

    .line 99
    const-wide v15, 0x4066800000000000L    # 180.0

    .line 100
    .line 101
    .line 102
    .line 103
    .line 104
    div-double/2addr v11, v15

    .line 105
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 106
    .line 107
    .line 108
    move-result-wide v11

    .line 109
    mul-double/2addr v9, v11

    .line 110
    sub-double/2addr v7, v9

    .line 111
    double-to-float v1, v7

    .line 112
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->e:F

    .line 113
    .line 114
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->c:F

    .line 115
    .line 116
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 117
    .line 118
    add-float/2addr v1, v4

    .line 119
    float-to-double v6, v1

    .line 120
    float-to-double v8, v4

    .line 121
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 122
    .line 123
    float-to-double v10, v1

    .line 124
    mul-double/2addr v10, v13

    .line 125
    div-double/2addr v10, v15

    .line 126
    invoke-static {v10, v11}, Ljava/lang/Math;->sin(D)D

    .line 127
    .line 128
    .line 129
    move-result-wide v10

    .line 130
    mul-double/2addr v8, v10

    .line 131
    sub-double/2addr v6, v8

    .line 132
    double-to-float v1, v6

    .line 133
    iput v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->f:F

    .line 134
    .line 135
    new-instance v1, Landroid/graphics/Paint;

    .line 136
    .line 137
    invoke-direct {v1}, Landroid/graphics/Paint;-><init>()V

    .line 138
    .line 139
    .line 140
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->l:Landroid/graphics/Paint;

    .line 141
    .line 142
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->h:I

    .line 143
    .line 144
    invoke-virtual {v1, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 145
    .line 146
    .line 147
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->l:Landroid/graphics/Paint;

    .line 148
    .line 149
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 150
    .line 151
    .line 152
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->l:Landroid/graphics/Paint;

    .line 153
    .line 154
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setDither(Z)V

    .line 155
    .line 156
    .line 157
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->l:Landroid/graphics/Paint;

    .line 158
    .line 159
    invoke-virtual {v1, v3}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 160
    .line 161
    .line 162
    new-instance v1, Landroid/graphics/Path;

    .line 163
    .line 164
    invoke-direct {v1}, Landroid/graphics/Path;-><init>()V

    .line 165
    .line 166
    .line 167
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 168
    .line 169
    iget v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 170
    .line 171
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->q:F

    .line 172
    .line 173
    const/4 v4, 0x2

    .line 174
    new-array v4, v4, [F

    .line 175
    .line 176
    const/4 v6, 0x0

    .line 177
    aput v1, v4, v6

    .line 178
    .line 179
    aput v2, v4, v3

    .line 180
    .line 181
    invoke-static {v4}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->r:Landroid/animation/ValueAnimator;

    .line 186
    .line 187
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->n:I

    .line 188
    .line 189
    int-to-long v2, v2

    .line 190
    invoke-virtual {v1, v2, v3}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 191
    .line 192
    .line 193
    iget-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->r:Landroid/animation/ValueAnimator;

    .line 194
    .line 195
    new-instance v2, Ll/ior;

    .line 196
    .line 197
    invoke-direct {v2, v0}, Ll/ior;-><init>(Lcom/p1/mobile/putong/core/ui/tarot/LineView;)V

    .line 198
    .line 199
    .line 200
    invoke-virtual {v1, v2}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 201
    .line 202
    .line 203
    new-instance v1, Landroid/graphics/RectF;

    .line 204
    .line 205
    iget v2, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->b:F

    .line 206
    .line 207
    iget v3, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->c:F

    .line 208
    .line 209
    iget v4, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 210
    .line 211
    mul-float v6, v4, v5

    .line 212
    .line 213
    add-float/2addr v6, v2

    .line 214
    mul-float/2addr v4, v5

    .line 215
    add-float/2addr v4, v3

    .line 216
    invoke-direct {v1, v2, v3, v6, v4}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 217
    .line 218
    .line 219
    iput-object v1, v0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->t:Landroid/graphics/RectF;

    .line 220
    .line 221
    return-void
.end method

.method public final synthetic c(Landroid/animation/ValueAnimator;)V
    .locals 1

    .line 1
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    check-cast p1, Ljava/lang/Float;

    .line 6
    .line 7
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 8
    .line 9
    .line 10
    move-result p1

    .line 11
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 12
    .line 13
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->q:F

    .line 14
    .line 15
    cmpl-float p1, p1, v0

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    const/4 p1, 0x1

    .line 20
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->s:Z

    .line 21
    .line 22
    :cond_0
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public getAnim()Landroid/animation/ValueAnimator;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->r:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    return-object p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 13

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->e:F

    .line 5
    .line 6
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->f:F

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->g:F

    .line 9
    .line 10
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->a:Landroid/graphics/Paint;

    .line 11
    .line 12
    invoke-virtual {p1, v0, v1, v2, v3}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 13
    .line 14
    .line 15
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->t:Landroid/graphics/RectF;

    .line 16
    .line 17
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->o:F

    .line 18
    .line 19
    iget v7, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 20
    .line 21
    const/4 v8, 0x0

    .line 22
    iget-object v9, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->i:Landroid/graphics/Paint;

    .line 23
    .line 24
    move-object v4, p1

    .line 25
    invoke-virtual/range {v4 .. v9}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 29
    .line 30
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 31
    .line 32
    const/high16 v1, 0x40000000    # 2.0f

    .line 33
    .line 34
    div-float/2addr v0, v1

    .line 35
    sub-float/2addr p1, v0

    .line 36
    float-to-double v2, p1

    .line 37
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 38
    .line 39
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 40
    .line 41
    add-float/2addr p1, v0

    .line 42
    float-to-double v5, p1

    .line 43
    const-wide v7, 0x400921fb54442d18L    # Math.PI

    .line 44
    .line 45
    .line 46
    .line 47
    .line 48
    mul-double/2addr v5, v7

    .line 49
    const-wide v9, 0x4066800000000000L    # 180.0

    .line 50
    .line 51
    .line 52
    .line 53
    .line 54
    div-double/2addr v5, v9

    .line 55
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    .line 56
    .line 57
    .line 58
    move-result-wide v5

    .line 59
    mul-double/2addr v2, v5

    .line 60
    double-to-float p1, v2

    .line 61
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 62
    .line 63
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 64
    .line 65
    div-float/2addr v2, v1

    .line 66
    sub-float/2addr v0, v2

    .line 67
    float-to-double v2, v0

    .line 68
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 69
    .line 70
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 71
    .line 72
    add-float/2addr v0, v5

    .line 73
    float-to-double v5, v0

    .line 74
    mul-double/2addr v5, v7

    .line 75
    div-double/2addr v5, v9

    .line 76
    invoke-static {v5, v6}, Ljava/lang/Math;->cos(D)D

    .line 77
    .line 78
    .line 79
    move-result-wide v5

    .line 80
    mul-double/2addr v2, v5

    .line 81
    double-to-float v0, v2

    .line 82
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 83
    .line 84
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 85
    .line 86
    div-float/2addr v3, v1

    .line 87
    add-float/2addr v2, v3

    .line 88
    float-to-double v2, v2

    .line 89
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 90
    .line 91
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 92
    .line 93
    add-float/2addr v5, v6

    .line 94
    float-to-double v5, v5

    .line 95
    mul-double/2addr v5, v7

    .line 96
    div-double/2addr v5, v9

    .line 97
    invoke-static {v5, v6}, Ljava/lang/Math;->sin(D)D

    .line 98
    .line 99
    .line 100
    move-result-wide v5

    .line 101
    mul-double/2addr v2, v5

    .line 102
    double-to-float v2, v2

    .line 103
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 104
    .line 105
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 106
    .line 107
    div-float/2addr v5, v1

    .line 108
    add-float/2addr v3, v5

    .line 109
    float-to-double v5, v3

    .line 110
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 111
    .line 112
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 113
    .line 114
    add-float/2addr v1, v3

    .line 115
    float-to-double v11, v1

    .line 116
    mul-double/2addr v11, v7

    .line 117
    div-double/2addr v11, v9

    .line 118
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 119
    .line 120
    .line 121
    move-result-wide v11

    .line 122
    mul-double/2addr v5, v11

    .line 123
    double-to-float v1, v5

    .line 124
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->b:F

    .line 125
    .line 126
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 127
    .line 128
    add-float v6, v3, v5

    .line 129
    .line 130
    sub-float/2addr v6, v0

    .line 131
    sub-float p1, v5, p1

    .line 132
    .line 133
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->c:F

    .line 134
    .line 135
    add-float/2addr p1, v0

    .line 136
    add-float/2addr v3, v5

    .line 137
    sub-float/2addr v3, v1

    .line 138
    sub-float/2addr v5, v2

    .line 139
    add-float/2addr v5, v0

    .line 140
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 141
    .line 142
    invoke-virtual {v0, v6, p1}, Landroid/graphics/Path;->moveTo(FF)V

    .line 143
    .line 144
    .line 145
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 146
    .line 147
    invoke-virtual {v0, v3, v5}, Landroid/graphics/Path;->lineTo(FF)V

    .line 148
    .line 149
    .line 150
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 151
    .line 152
    float-to-double v0, v0

    .line 153
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 154
    .line 155
    const/high16 v3, 0x41700000    # 15.0f

    .line 156
    .line 157
    add-float/2addr v2, v3

    .line 158
    float-to-double v11, v2

    .line 159
    mul-double/2addr v11, v7

    .line 160
    div-double/2addr v11, v9

    .line 161
    invoke-static {v11, v12}, Ljava/lang/Math;->sin(D)D

    .line 162
    .line 163
    .line 164
    move-result-wide v11

    .line 165
    mul-double/2addr v0, v11

    .line 166
    double-to-float v0, v0

    .line 167
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->k:F

    .line 168
    .line 169
    float-to-double v1, v1

    .line 170
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->p:F

    .line 171
    .line 172
    add-float/2addr v5, v3

    .line 173
    float-to-double v11, v5

    .line 174
    mul-double/2addr v11, v7

    .line 175
    div-double/2addr v11, v9

    .line 176
    invoke-static {v11, v12}, Ljava/lang/Math;->cos(D)D

    .line 177
    .line 178
    .line 179
    move-result-wide v7

    .line 180
    mul-double/2addr v1, v7

    .line 181
    double-to-float v1, v1

    .line 182
    add-float/2addr v6, v0

    .line 183
    sub-float/2addr p1, v1

    .line 184
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 185
    .line 186
    invoke-virtual {v0, v6, p1}, Landroid/graphics/Path;->lineTo(FF)V

    .line 187
    .line 188
    .line 189
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 190
    .line 191
    invoke-virtual {p1}, Landroid/graphics/Path;->close()V

    .line 192
    .line 193
    .line 194
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 195
    .line 196
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->l:Landroid/graphics/Paint;

    .line 197
    .line 198
    invoke-virtual {v4, p1, v0}, Landroid/graphics/Canvas;->drawPath(Landroid/graphics/Path;Landroid/graphics/Paint;)V

    .line 199
    .line 200
    .line 201
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->m:Landroid/graphics/Path;

    .line 202
    .line 203
    invoke-virtual {p0}, Landroid/graphics/Path;->reset()V

    .line 204
    .line 205
    .line 206
    return-void
.end method

.method public onMeasure(II)V
    .locals 8

    .line 1
    invoke-super {p0, p1, p2}, Landroid/view/View;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->d:F

    .line 5
    .line 6
    const/high16 p2, 0x40000000    # 2.0f

    .line 7
    .line 8
    mul-float v0, p1, p2

    .line 9
    .line 10
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->b:F

    .line 11
    .line 12
    mul-float/2addr v1, p2

    .line 13
    add-float/2addr v0, v1

    .line 14
    float-to-int p2, v0

    .line 15
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->c:F

    .line 16
    .line 17
    const/high16 v1, 0x40400000    # 3.0f

    .line 18
    .line 19
    mul-float/2addr v0, v1

    .line 20
    add-float/2addr v0, p1

    .line 21
    float-to-double v0, v0

    .line 22
    float-to-double v2, p1

    .line 23
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/tarot/LineView;->u:F

    .line 24
    .line 25
    float-to-double v4, p1

    .line 26
    const-wide v6, 0x400921fb54442d18L    # Math.PI

    .line 27
    .line 28
    .line 29
    .line 30
    .line 31
    mul-double/2addr v4, v6

    .line 32
    const-wide v6, 0x4066800000000000L    # 180.0

    .line 33
    .line 34
    .line 35
    .line 36
    .line 37
    div-double/2addr v4, v6

    .line 38
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 39
    .line 40
    .line 41
    move-result-wide v4

    .line 42
    mul-double/2addr v2, v4

    .line 43
    sub-double/2addr v0, v2

    .line 44
    double-to-int p1, v0

    .line 45
    invoke-virtual {p0, p2, p1}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public setOnEndListener(Lcom/p1/mobile/putong/core/ui/tarot/LineView$a;)V
    .locals 0

    return-void
.end method
