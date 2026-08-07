.class public Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;
    }
.end annotation


# instance fields
.field public A:I

.field public final B:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;

.field public a:Landroid/graphics/Paint;

.field public b:Landroid/graphics/Paint;

.field public c:Landroid/graphics/Paint;

.field public d:Landroid/graphics/Paint;

.field public e:Landroid/graphics/Paint;

.field public f:Landroid/graphics/Paint;

.field public g:Landroid/graphics/LinearGradient;

.field public h:Landroid/graphics/LinearGradient;

.field public i:Landroid/graphics/SweepGradient;

.field public final j:I

.field public final k:I

.field public final l:I

.field public final m:I

.field public n:I

.field public o:I

.field public p:Z

.field public q:I

.field public r:I

.field public s:I

.field public t:Landroid/graphics/RectF;

.field public u:Z

.field public v:I

.field public w:I

.field public x:I

.field public y:F

.field public z:Z


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 211
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 210
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 5

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/view/View;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const v0, 0xffffff

    .line 5
    .line 6
    .line 7
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->j:I

    .line 8
    .line 9
    const v0, -0x7b000001

    .line 10
    .line 11
    .line 12
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->k:I

    .line 13
    .line 14
    const v0, 0x1e979797

    .line 15
    .line 16
    .line 17
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->l:I

    .line 18
    .line 19
    const v0, 0x979797

    .line 20
    .line 21
    .line 22
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->m:I

    .line 23
    .line 24
    const v0, 0x3f4ccccd    # 0.8f

    .line 25
    .line 26
    .line 27
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->n:I

    .line 32
    .line 33
    const/4 v1, 0x0

    .line 34
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->p:Z

    .line 35
    .line 36
    const v2, -0x43300

    .line 37
    .line 38
    .line 39
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->q:I

    .line 40
    .line 41
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->r:I

    .line 42
    .line 43
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->s:I

    .line 44
    .line 45
    const v3, -0x272728

    .line 46
    .line 47
    .line 48
    iput v3, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->v:I

    .line 49
    .line 50
    const/high16 v3, 0x3f800000    # 1.0f

    .line 51
    .line 52
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 53
    .line 54
    .line 55
    move-result v4

    .line 56
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->x:I

    .line 57
    .line 58
    const v4, 0x3f48f5c3    # 0.785f

    .line 59
    .line 60
    .line 61
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->y:F

    .line 62
    .line 63
    iput-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->z:Z

    .line 64
    .line 65
    iput v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->A:I

    .line 66
    .line 67
    new-instance v4, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;

    .line 68
    .line 69
    invoke-direct {v4}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->B:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/content/Context;->getTheme()Landroid/content/res/Resources$Theme;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    sget-object v4, Ll/nhc0;->x:[I

    .line 79
    .line 80
    invoke-virtual {p1, p2, v4, p3, v1}, Landroid/content/res/Resources$Theme;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    sget p2, Ll/nhc0;->B:I

    .line 85
    .line 86
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 87
    .line 88
    .line 89
    move-result p2

    .line 90
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->p:Z

    .line 91
    .line 92
    sget p2, Ll/nhc0;->C:I

    .line 93
    .line 94
    const/4 p3, -0x1

    .line 95
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 96
    .line 97
    .line 98
    move-result p2

    .line 99
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->w:I

    .line 100
    .line 101
    sget p2, Ll/nhc0;->E:I

    .line 102
    .line 103
    const p3, -0x101218

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 107
    .line 108
    .line 109
    move-result p2

    .line 110
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->o:I

    .line 111
    .line 112
    sget p2, Ll/nhc0;->F:I

    .line 113
    .line 114
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 115
    .line 116
    .line 117
    move-result p2

    .line 118
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->q:I

    .line 119
    .line 120
    sget p2, Ll/nhc0;->G:I

    .line 121
    .line 122
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 123
    .line 124
    .line 125
    move-result p2

    .line 126
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->r:I

    .line 127
    .line 128
    sget p2, Ll/nhc0;->y:I

    .line 129
    .line 130
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 131
    .line 132
    .line 133
    move-result p3

    .line 134
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 135
    .line 136
    .line 137
    move-result p2

    .line 138
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->n:I

    .line 139
    .line 140
    sget p2, Ll/nhc0;->D:I

    .line 141
    .line 142
    invoke-static {v3}, Ll/qa00;->d(F)I

    .line 143
    .line 144
    .line 145
    move-result p3

    .line 146
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 147
    .line 148
    .line 149
    move-result p2

    .line 150
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->x:I

    .line 151
    .line 152
    sget p2, Ll/nhc0;->A:I

    .line 153
    .line 154
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 155
    .line 156
    .line 157
    move-result p2

    .line 158
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->A:I

    .line 159
    .line 160
    sget p2, Ll/nhc0;->z:I

    .line 161
    .line 162
    invoke-virtual {p1, p2, v1}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 163
    .line 164
    .line 165
    move-result p2

    .line 166
    iput-boolean p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->z:Z

    .line 167
    .line 168
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 169
    .line 170
    .line 171
    new-instance p1, Landroid/graphics/Paint;

    .line 172
    .line 173
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 174
    .line 175
    .line 176
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->a:Landroid/graphics/Paint;

    .line 177
    .line 178
    new-instance p1, Landroid/graphics/Paint;

    .line 179
    .line 180
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 181
    .line 182
    .line 183
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->b:Landroid/graphics/Paint;

    .line 184
    .line 185
    new-instance p1, Landroid/graphics/Paint;

    .line 186
    .line 187
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 188
    .line 189
    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 191
    .line 192
    new-instance p1, Landroid/graphics/Paint;

    .line 193
    .line 194
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 195
    .line 196
    .line 197
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->d:Landroid/graphics/Paint;

    .line 198
    .line 199
    new-instance p1, Landroid/graphics/Paint;

    .line 200
    .line 201
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 202
    .line 203
    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->e:Landroid/graphics/Paint;

    .line 205
    .line 206
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 207
    .line 208
    .line 209
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;[I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->d([I)V

    return-void
.end method


# virtual methods
.method public b(Landroid/graphics/Canvas;FFI)V
    .locals 6

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->B:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->b(Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;)F

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/high16 v1, 0x3f800000    # 1.0f

    .line 8
    .line 9
    sub-float/2addr v1, v0

    .line 10
    const/high16 v2, 0x3f000000    # 0.5f

    .line 11
    .line 12
    cmpg-float v3, v1, v2

    .line 13
    .line 14
    if-gtz v3, :cond_0

    .line 15
    .line 16
    const/high16 v2, 0x40800000    # 4.0f

    .line 17
    .line 18
    mul-float/2addr v1, v2

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    sub-float/2addr v1, v2

    .line 21
    const/high16 v2, 0x40000000    # 2.0f

    .line 22
    .line 23
    mul-float/2addr v1, v2

    .line 24
    sub-float v1, v2, v1

    .line 25
    .line 26
    :goto_0
    const v2, 0x3da3d70a    # 0.08f

    .line 27
    .line 28
    .line 29
    mul-float/2addr v1, v2

    .line 30
    const/high16 v2, 0x437f0000    # 255.0f

    .line 31
    .line 32
    mul-float/2addr v1, v2

    .line 33
    float-to-int v1, v1

    .line 34
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->c()Landroid/graphics/Paint;

    .line 35
    .line 36
    .line 37
    move-result-object v2

    .line 38
    int-to-float v3, p4

    .line 39
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 40
    .line 41
    .line 42
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->c()Landroid/graphics/Paint;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    const/16 v3, 0x30

    .line 47
    .line 48
    const/16 v4, 0x87

    .line 49
    .line 50
    const/16 v5, 0xf5

    .line 51
    .line 52
    invoke-virtual {v2, v1, v5, v3, v4}, Landroid/graphics/Paint;->setARGB(IIII)V

    .line 53
    .line 54
    .line 55
    float-to-double v0, v0

    .line 56
    const-wide/high16 v2, 0x3fe0000000000000L    # 0.5

    .line 57
    .line 58
    sub-double/2addr v0, v2

    .line 59
    int-to-double v2, p4

    .line 60
    mul-double/2addr v0, v2

    .line 61
    double-to-int p4, v0

    .line 62
    int-to-float p4, p4

    .line 63
    add-float/2addr p3, p4

    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->c()Landroid/graphics/Paint;

    .line 65
    .line 66
    .line 67
    move-result-object p4

    .line 68
    invoke-virtual {p1, p2, p2, p3, p4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 69
    .line 70
    .line 71
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 72
    .line 73
    .line 74
    return-void
.end method

.method public c()V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    sget-object v1, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->a:Landroid/graphics/Paint;

    .line 9
    .line 10
    const/4 v2, 0x1

    .line 11
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 12
    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->a:Landroid/graphics/Paint;

    .line 15
    .line 16
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->n:I

    .line 17
    .line 18
    int-to-float v3, v3

    .line 19
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 20
    .line 21
    .line 22
    new-instance v0, Ll/l760;

    .line 23
    .line 24
    invoke-direct {v0, p0}, Ll/l760;-><init>(Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;)V

    .line 25
    .line 26
    .line 27
    invoke-static {p0, v0}, Ll/bnl0;->Q0(Landroid/view/View;Ll/y20;)V

    .line 28
    .line 29
    .line 30
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 31
    .line 32
    sget-object v3, Landroid/graphics/Paint$Style;->STROKE:Landroid/graphics/Paint$Style;

    .line 33
    .line 34
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 38
    .line 39
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 40
    .line 41
    .line 42
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 43
    .line 44
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->n:I

    .line 45
    .line 46
    int-to-float v4, v4

    .line 47
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 48
    .line 49
    .line 50
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->b:Landroid/graphics/Paint;

    .line 51
    .line 52
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->o:I

    .line 53
    .line 54
    invoke-virtual {v0, v4}, Landroid/graphics/Paint;->setColor(I)V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->b:Landroid/graphics/Paint;

    .line 58
    .line 59
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 60
    .line 61
    .line 62
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->b:Landroid/graphics/Paint;

    .line 63
    .line 64
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 65
    .line 66
    .line 67
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->p:Z

    .line 68
    .line 69
    if-eqz v0, :cond_1

    .line 70
    .line 71
    new-instance v0, Landroid/graphics/Paint;

    .line 72
    .line 73
    invoke-direct {v0}, Landroid/graphics/Paint;-><init>()V

    .line 74
    .line 75
    .line 76
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 77
    .line 78
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 79
    .line 80
    .line 81
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 82
    .line 83
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->q:I

    .line 84
    .line 85
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 86
    .line 87
    .line 88
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->u:Z

    .line 89
    .line 90
    if-eqz v0, :cond_0

    .line 91
    .line 92
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 93
    .line 94
    sget-object v3, Landroid/graphics/Paint$Cap;->ROUND:Landroid/graphics/Paint$Cap;

    .line 95
    .line 96
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setStrokeCap(Landroid/graphics/Paint$Cap;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 100
    .line 101
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 102
    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->d:Landroid/graphics/Paint;

    .line 106
    .line 107
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->v:I

    .line 108
    .line 109
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 110
    .line 111
    .line 112
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->d:Landroid/graphics/Paint;

    .line 113
    .line 114
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 115
    .line 116
    .line 117
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->d:Landroid/graphics/Paint;

    .line 118
    .line 119
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 120
    .line 121
    .line 122
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->e:Landroid/graphics/Paint;

    .line 123
    .line 124
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->w:I

    .line 125
    .line 126
    invoke-virtual {v0, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 127
    .line 128
    .line 129
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->e:Landroid/graphics/Paint;

    .line 130
    .line 131
    invoke-virtual {v0, v2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 132
    .line 133
    .line 134
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->e:Landroid/graphics/Paint;

    .line 135
    .line 136
    invoke-virtual {p0, v1}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 137
    .line 138
    .line 139
    return-void
.end method

.method public final synthetic d([I)V
    .locals 12

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->a:Landroid/graphics/Paint;

    .line 2
    .line 3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->g:Landroid/graphics/LinearGradient;

    .line 4
    .line 5
    const/4 v2, 0x1

    .line 6
    const/4 v3, 0x0

    .line 7
    if-nez v1, :cond_0

    .line 8
    .line 9
    new-instance v4, Landroid/graphics/LinearGradient;

    .line 10
    .line 11
    aget v1, p1, v3

    .line 12
    .line 13
    aget v5, p1, v2

    .line 14
    .line 15
    invoke-static {v1, v5}, Ljava/lang/Math;->min(II)I

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    int-to-float v8, v1

    .line 20
    const v10, -0x7b000001

    .line 21
    .line 22
    .line 23
    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 24
    .line 25
    const/4 v5, 0x0

    .line 26
    const/4 v6, 0x0

    .line 27
    const/4 v7, 0x0

    .line 28
    const v9, 0xffffff

    .line 29
    .line 30
    .line 31
    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 32
    .line 33
    .line 34
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->g:Landroid/graphics/LinearGradient;

    .line 35
    .line 36
    move-object v1, v4

    .line 37
    :cond_0
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 41
    .line 42
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->h:Landroid/graphics/LinearGradient;

    .line 43
    .line 44
    if-nez v1, :cond_1

    .line 45
    .line 46
    new-instance v4, Landroid/graphics/LinearGradient;

    .line 47
    .line 48
    aget v1, p1, v3

    .line 49
    .line 50
    aget p1, p1, v2

    .line 51
    .line 52
    invoke-static {v1, p1}, Ljava/lang/Math;->min(II)I

    .line 53
    .line 54
    .line 55
    move-result p1

    .line 56
    int-to-float v8, p1

    .line 57
    const v10, 0x979797

    .line 58
    .line 59
    .line 60
    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 61
    .line 62
    const/4 v5, 0x0

    .line 63
    const/4 v6, 0x0

    .line 64
    const/4 v7, 0x0

    .line 65
    const v9, 0x1e979797

    .line 66
    .line 67
    .line 68
    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 69
    .line 70
    .line 71
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->h:Landroid/graphics/LinearGradient;

    .line 72
    .line 73
    move-object v1, v4

    .line 74
    :cond_1
    invoke-virtual {v0, v1}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public e(II)V
    .locals 1

    .line 1
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->q:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_1

    .line 4
    .line 5
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->r:I

    .line 6
    .line 7
    if-eq v0, p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->q:I

    .line 12
    .line 13
    iput p2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->r:I

    .line 14
    .line 15
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public getHasProgress()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->p:Z

    .line 2
    .line 3
    return p0
.end method

.method public getProgress()I
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->s:I

    .line 2
    .line 3
    return p0
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 10

    .line 1
    invoke-super/range {p0 .. p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 5
    .line 6
    .line 7
    move-result v2

    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    .line 9
    .line 10
    .line 11
    move-result v3

    .line 12
    invoke-static {v2, v3}, Ljava/lang/Math;->min(II)I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    div-int/lit8 v3, v2, 0x2

    .line 17
    .line 18
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->A:I

    .line 19
    .line 20
    if-lez v4, :cond_0

    .line 21
    .line 22
    sub-int v4, v3, v4

    .line 23
    .line 24
    :goto_0
    move v7, v4

    .line 25
    goto :goto_1

    .line 26
    :cond_0
    int-to-float v4, v3

    .line 27
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->y:F

    .line 28
    .line 29
    mul-float/2addr v4, v5

    .line 30
    invoke-static {v4}, Ljava/lang/Math;->round(F)I

    .line 31
    .line 32
    .line 33
    move-result v4

    .line 34
    goto :goto_0

    .line 35
    :goto_1
    invoke-virtual {p0}, Landroid/view/View;->getWidth()I

    .line 36
    .line 37
    .line 38
    move-result v4

    .line 39
    int-to-float v4, v4

    .line 40
    const/high16 v5, 0x40000000    # 2.0f

    .line 41
    .line 42
    div-float v8, v4, v5

    .line 43
    .line 44
    int-to-float v4, v3

    .line 45
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->a:Landroid/graphics/Paint;

    .line 46
    .line 47
    invoke-virtual {p1, v8, v8, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 48
    .line 49
    .line 50
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->n:I

    .line 51
    .line 52
    sub-int v4, v3, v4

    .line 53
    .line 54
    int-to-float v4, v4

    .line 55
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->b:Landroid/graphics/Paint;

    .line 56
    .line 57
    invoke-virtual {p1, v8, v8, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 58
    .line 59
    .line 60
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 61
    .line 62
    invoke-virtual {v4}, Landroid/graphics/Paint;->getStrokeWidth()F

    .line 63
    .line 64
    .line 65
    move-result v4

    .line 66
    const/4 v5, 0x0

    .line 67
    cmpl-float v4, v4, v5

    .line 68
    .line 69
    if-lez v4, :cond_1

    .line 70
    .line 71
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->n:I

    .line 72
    .line 73
    mul-int/lit8 v4, v4, 0x2

    .line 74
    .line 75
    sub-int v4, v3, v4

    .line 76
    .line 77
    int-to-float v4, v4

    .line 78
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c:Landroid/graphics/Paint;

    .line 79
    .line 80
    invoke-virtual {p1, v8, v8, v4, v5}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->B:Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;

    .line 84
    .line 85
    invoke-static {v4}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;->a(Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView$a;)Z

    .line 86
    .line 87
    .line 88
    move-result v4

    .line 89
    if-eqz v4, :cond_2

    .line 90
    .line 91
    int-to-float v4, v7

    .line 92
    sub-int v5, v3, v7

    .line 93
    .line 94
    invoke-virtual {p0, p1, v8, v4, v5}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->b(Landroid/graphics/Canvas;FFI)V

    .line 95
    .line 96
    .line 97
    :cond_2
    iget-boolean v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->p:Z

    .line 98
    .line 99
    if-eqz v4, :cond_7

    .line 100
    .line 101
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->i:Landroid/graphics/SweepGradient;

    .line 102
    .line 103
    if-nez v4, :cond_3

    .line 104
    .line 105
    new-instance v4, Landroid/graphics/SweepGradient;

    .line 106
    .line 107
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->q:I

    .line 108
    .line 109
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->r:I

    .line 110
    .line 111
    filled-new-array {v5, v6, v5}, [I

    .line 112
    .line 113
    .line 114
    move-result-object v5

    .line 115
    const/4 v6, 0x0

    .line 116
    invoke-direct {v4, v8, v8, v5, v6}, Landroid/graphics/SweepGradient;-><init>(FF[I[F)V

    .line 117
    .line 118
    .line 119
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->i:Landroid/graphics/SweepGradient;

    .line 120
    .line 121
    new-instance v4, Landroid/graphics/Matrix;

    .line 122
    .line 123
    invoke-direct {v4}, Landroid/graphics/Matrix;-><init>()V

    .line 124
    .line 125
    .line 126
    const/high16 v5, 0x43870000    # 270.0f

    .line 127
    .line 128
    invoke-virtual {v4, v5, v8, v8}, Landroid/graphics/Matrix;->preRotate(FFF)Z

    .line 129
    .line 130
    .line 131
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->i:Landroid/graphics/SweepGradient;

    .line 132
    .line 133
    invoke-virtual {v5, v4}, Landroid/graphics/Shader;->setLocalMatrix(Landroid/graphics/Matrix;)V

    .line 134
    .line 135
    .line 136
    :cond_3
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 137
    .line 138
    iget-object v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->i:Landroid/graphics/SweepGradient;

    .line 139
    .line 140
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 141
    .line 142
    .line 143
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 144
    .line 145
    sub-int/2addr v3, v7

    .line 146
    int-to-float v5, v3

    .line 147
    invoke-virtual {v4, v5}, Landroid/graphics/Paint;->setStrokeWidth(F)V

    .line 148
    .line 149
    .line 150
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->t:Landroid/graphics/RectF;

    .line 151
    .line 152
    if-nez v4, :cond_4

    .line 153
    .line 154
    new-instance v4, Landroid/graphics/RectF;

    .line 155
    .line 156
    invoke-direct {v4}, Landroid/graphics/RectF;-><init>()V

    .line 157
    .line 158
    .line 159
    iput-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->t:Landroid/graphics/RectF;

    .line 160
    .line 161
    :cond_4
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->t:Landroid/graphics/RectF;

    .line 162
    .line 163
    div-int/lit8 v3, v3, 0x2

    .line 164
    .line 165
    iget v5, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->x:I

    .line 166
    .line 167
    mul-int/lit8 v6, v5, 0x2

    .line 168
    .line 169
    sub-int v6, v3, v6

    .line 170
    .line 171
    int-to-float v6, v6

    .line 172
    mul-int/lit8 v9, v5, 0x2

    .line 173
    .line 174
    sub-int v9, v3, v9

    .line 175
    .line 176
    int-to-float v9, v9

    .line 177
    sub-int/2addr v2, v3

    .line 178
    mul-int/lit8 v3, v5, 0x2

    .line 179
    .line 180
    add-int/2addr v3, v2

    .line 181
    int-to-float v3, v3

    .line 182
    mul-int/lit8 v5, v5, 0x2

    .line 183
    .line 184
    add-int/2addr v2, v5

    .line 185
    int-to-float v2, v2

    .line 186
    invoke-virtual {v4, v6, v9, v3, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 187
    .line 188
    .line 189
    iget-boolean v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->z:Z

    .line 190
    .line 191
    if-eqz v2, :cond_5

    .line 192
    .line 193
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->t:Landroid/graphics/RectF;

    .line 194
    .line 195
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->s:I

    .line 196
    .line 197
    int-to-float v4, v3

    .line 198
    const/4 v5, 0x0

    .line 199
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 200
    .line 201
    const/high16 v3, -0x3d4c0000    # -90.0f

    .line 202
    .line 203
    move-object v1, p1

    .line 204
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 205
    .line 206
    .line 207
    goto :goto_2

    .line 208
    :cond_5
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->s:I

    .line 209
    .line 210
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->t:Landroid/graphics/RectF;

    .line 211
    .line 212
    const/16 v3, 0x5a

    .line 213
    .line 214
    if-gt v1, v3, :cond_6

    .line 215
    .line 216
    add-int/lit16 v3, v1, 0x10e

    .line 217
    .line 218
    int-to-float v3, v3

    .line 219
    rsub-int v1, v1, 0x168

    .line 220
    .line 221
    int-to-float v4, v1

    .line 222
    const/4 v5, 0x0

    .line 223
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 224
    .line 225
    move-object v1, p1

    .line 226
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 227
    .line 228
    .line 229
    goto :goto_2

    .line 230
    :cond_6
    add-int/lit8 v3, v1, -0x5a

    .line 231
    .line 232
    int-to-float v3, v3

    .line 233
    rsub-int v1, v1, 0x168

    .line 234
    .line 235
    int-to-float v4, v1

    .line 236
    const/4 v5, 0x0

    .line 237
    iget-object v6, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->f:Landroid/graphics/Paint;

    .line 238
    .line 239
    move-object v1, p1

    .line 240
    invoke-virtual/range {v1 .. v6}, Landroid/graphics/Canvas;->drawArc(Landroid/graphics/RectF;FFZLandroid/graphics/Paint;)V

    .line 241
    .line 242
    .line 243
    goto :goto_2

    .line 244
    :cond_7
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->x:I

    .line 245
    .line 246
    int-to-float v2, v2

    .line 247
    add-float/2addr v2, v8

    .line 248
    int-to-float v3, v7

    .line 249
    iget-object v4, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->d:Landroid/graphics/Paint;

    .line 250
    .line 251
    invoke-virtual {p1, v8, v2, v3, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 252
    .line 253
    .line 254
    :goto_2
    int-to-float v2, v7

    .line 255
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->e:Landroid/graphics/Paint;

    .line 256
    .line 257
    invoke-virtual {p1, v8, v8, v2, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 258
    .line 259
    .line 260
    return-void
.end method

.method public setHasProgress(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->p:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInnerBackgroundColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->w:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setInnerBorderColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->v:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setOuterBackgroundColor(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->o:I

    .line 2
    .line 3
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public setProgress(I)V
    .locals 2

    int-to-long v0, p1

    .line 16
    invoke-virtual {p0, v0, v1}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->setProgress(J)V

    return-void
.end method

.method public setProgress(J)V
    .locals 0

    .line 1
    long-to-float p1, p1

    .line 2
    const p2, 0x40666666    # 3.6f

    .line 3
    .line 4
    .line 5
    mul-float/2addr p1, p2

    .line 6
    invoke-static {p1}, Ljava/lang/Math;->round(F)I

    .line 7
    .line 8
    .line 9
    move-result p1

    .line 10
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->s:I

    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public setProgressColor(I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->e(II)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setRoundProgressCap(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->u:Z

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->u:Z

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/boost/view/OverlapCircleView;->c()V

    .line 8
    .line 9
    .line 10
    :cond_0
    return-void
.end method
