.class public Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;
.super Landroid/view/View;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;,
        Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;,
        Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;
    }
.end annotation


# static fields
.field public static final f:F

.field public static final g:F


# instance fields
.field public a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;

.field public b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;

.field public c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

.field public d:Landroid/animation/ValueAnimator;

.field public e:Landroid/graphics/LinearGradient;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    sget v0, Ll/qa00;->o:I

    .line 2
    .line 3
    int-to-float v0, v0

    .line 4
    sput v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->f:F

    .line 5
    .line 6
    const/high16 v0, 0x42500000    # 52.0f

    .line 7
    .line 8
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    int-to-float v0, v0

    .line 13
    sput v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->g:F

    .line 14
    .line 15
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 9
    invoke-direct {p0, p1, v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    const/4 v0, 0x0

    .line 8
    invoke-direct {p0, p1, p2, v0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

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
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic a(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Landroid/animation/ValueAnimator;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->i(Landroid/animation/ValueAnimator;)V

    return-void
.end method

.method public static bridge synthetic b(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Landroid/graphics/LinearGradient;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e:Landroid/graphics/LinearGradient;

    return-object p0
.end method

.method public static bridge synthetic c(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    return-object p0
.end method

.method public static bridge synthetic d(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Landroid/graphics/LinearGradient;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->e:Landroid/graphics/LinearGradient;

    return-void
.end method

.method public static bridge synthetic e()F
    .locals 1

    .line 1
    sget v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->g:F

    return v0
.end method


# virtual methods
.method public f()V
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 6
    .line 7
    .line 8
    :cond_0
    return-void
.end method

.method public final g(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    return-object v1

    .line 8
    :cond_0
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 9
    .line 10
    invoke-virtual {v2, v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->a(Landroid/graphics/Bitmap;)Landroid/graphics/Rect;

    .line 11
    .line 12
    .line 13
    move-result-object v2

    .line 14
    iget-object v3, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 15
    .line 16
    invoke-virtual {v3}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->f()Landroid/graphics/Paint;

    .line 17
    .line 18
    .line 19
    move-result-object v3

    .line 20
    iget-object v4, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 21
    .line 22
    invoke-virtual {v4}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->f()Landroid/graphics/Paint;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    invoke-virtual {v1}, Landroid/graphics/Bitmap;->getWidth()I

    .line 27
    .line 28
    .line 29
    move-result v5

    .line 30
    new-instance v6, Landroid/graphics/Canvas;

    .line 31
    .line 32
    invoke-direct {v6, v1}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 33
    .line 34
    .line 35
    invoke-virtual {v6}, Landroid/graphics/Canvas;->save()I

    .line 36
    .line 37
    .line 38
    iget v7, v2, Landroid/graphics/Rect;->top:I

    .line 39
    .line 40
    int-to-float v7, v7

    .line 41
    const/4 v8, 0x0

    .line 42
    invoke-virtual {v6, v8, v7}, Landroid/graphics/Canvas;->translate(FF)V

    .line 43
    .line 44
    .line 45
    const/4 v7, 0x1

    .line 46
    invoke-virtual {v3, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 47
    .line 48
    .line 49
    iget-object v9, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 50
    .line 51
    invoke-virtual {v9}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->j()Landroid/graphics/RectF;

    .line 52
    .line 53
    .line 54
    move-result-object v9

    .line 55
    invoke-virtual {v2}, Landroid/graphics/Rect;->width()I

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    int-to-float v2, v2

    .line 60
    sget v10, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->g:F

    .line 61
    .line 62
    add-float/2addr v10, v8

    .line 63
    div-float/2addr v2, v10

    .line 64
    int-to-float v5, v5

    .line 65
    sget v10, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->f:F

    .line 66
    .line 67
    mul-float/2addr v10, v2

    .line 68
    invoke-virtual {v9, v8, v8, v5, v10}, Landroid/graphics/RectF;->set(FFFF)V

    .line 69
    .line 70
    .line 71
    new-instance v11, Landroid/graphics/LinearGradient;

    .line 72
    .line 73
    iget v13, v9, Landroid/graphics/RectF;->top:F

    .line 74
    .line 75
    iget v15, v9, Landroid/graphics/RectF;->bottom:F

    .line 76
    .line 77
    const v5, -0x4c00afb9

    .line 78
    .line 79
    .line 80
    const v10, 0xfe7c3f

    .line 81
    .line 82
    .line 83
    const v12, -0xbcb7

    .line 84
    .line 85
    .line 86
    filled-new-array {v12, v5, v10}, [I

    .line 87
    .line 88
    .line 89
    move-result-object v16

    .line 90
    const/4 v5, 0x3

    .line 91
    new-array v5, v5, [F

    .line 92
    .line 93
    fill-array-data v5, :array_0

    .line 94
    .line 95
    .line 96
    sget-object v18, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 97
    .line 98
    const/4 v12, 0x0

    .line 99
    const/4 v14, 0x0

    .line 100
    move-object/from16 v17, v5

    .line 101
    .line 102
    invoke-direct/range {v11 .. v18}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 103
    .line 104
    .line 105
    invoke-virtual {v3, v11}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 106
    .line 107
    .line 108
    invoke-virtual {v6, v9, v3}, Landroid/graphics/Canvas;->drawRect(Landroid/graphics/RectF;Landroid/graphics/Paint;)V

    .line 109
    .line 110
    .line 111
    new-instance v5, Landroid/graphics/Paint;

    .line 112
    .line 113
    invoke-direct {v5}, Landroid/graphics/Paint;-><init>()V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v5, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 117
    .line 118
    .line 119
    const/16 v10, 0xa

    .line 120
    .line 121
    invoke-static {v10}, Ll/qa00;->f(I)I

    .line 122
    .line 123
    .line 124
    move-result v10

    .line 125
    int-to-float v10, v10

    .line 126
    mul-float/2addr v10, v2

    .line 127
    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 128
    .line 129
    .line 130
    const/4 v10, -0x1

    .line 131
    invoke-virtual {v5, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 132
    .line 133
    .line 134
    sget v11, Ll/qa00;->d:I

    .line 135
    .line 136
    int-to-float v11, v11

    .line 137
    mul-float/2addr v11, v2

    .line 138
    const/high16 v12, 0x40000000    # 2.0f

    .line 139
    .line 140
    div-float/2addr v11, v12

    .line 141
    const/high16 v12, 0x41900000    # 18.0f

    .line 142
    .line 143
    invoke-static {v12}, Ll/qa00;->d(F)I

    .line 144
    .line 145
    .line 146
    move-result v12

    .line 147
    int-to-float v12, v12

    .line 148
    mul-float/2addr v12, v2

    .line 149
    invoke-virtual {v9}, Landroid/graphics/RectF;->height()F

    .line 150
    .line 151
    .line 152
    move-result v13

    .line 153
    const/high16 v14, 0x40e00000    # 7.0f

    .line 154
    .line 155
    invoke-static {v14}, Ll/qa00;->d(F)I

    .line 156
    .line 157
    .line 158
    move-result v14

    .line 159
    int-to-float v14, v14

    .line 160
    mul-float/2addr v14, v2

    .line 161
    sub-float/2addr v13, v14

    .line 162
    invoke-virtual {v6, v12, v13}, Landroid/graphics/Canvas;->translate(FF)V

    .line 163
    .line 164
    .line 165
    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    .line 166
    .line 167
    .line 168
    move-result-object v12

    .line 169
    sget v13, Lcom/p1/mobile/putong/feed/R$string;->W0:I

    .line 170
    .line 171
    invoke-virtual {v12, v13}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v12

    .line 175
    invoke-virtual {v6, v12, v8, v8, v5}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 176
    .line 177
    .line 178
    sget v12, Ll/qa00;->e:I

    .line 179
    .line 180
    neg-int v12, v12

    .line 181
    int-to-float v12, v12

    .line 182
    mul-float/2addr v12, v2

    .line 183
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 184
    .line 185
    invoke-virtual {v2, v5}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->d(Landroid/graphics/Paint;)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    neg-int v2, v2

    .line 190
    shr-int/2addr v2, v7

    .line 191
    int-to-float v2, v2

    .line 192
    invoke-virtual {v6, v12, v2}, Landroid/graphics/Canvas;->translate(FF)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v4, v7}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 196
    .line 197
    .line 198
    invoke-virtual {v4, v10}, Landroid/graphics/Paint;->setColor(I)V

    .line 199
    .line 200
    .line 201
    sget-object v2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 202
    .line 203
    invoke-virtual {v4, v2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 204
    .line 205
    .line 206
    invoke-virtual {v6, v8, v8, v11, v4}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {v6}, Landroid/graphics/Canvas;->restore()V

    .line 210
    .line 211
    .line 212
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 213
    .line 214
    invoke-virtual {v2, v9}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->i(Landroid/graphics/RectF;)V

    .line 215
    .line 216
    .line 217
    iget-object v2, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 218
    .line 219
    invoke-virtual {v2, v3}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->e(Landroid/graphics/Paint;)V

    .line 220
    .line 221
    .line 222
    iget-object v0, v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 223
    .line 224
    invoke-virtual {v0, v4}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;->e(Landroid/graphics/Paint;)V

    .line 225
    .line 226
    .line 227
    return-object v1

    .line 228
    nop

    .line 229
    :array_0
    .array-data 4
        0x0
        0x3f000000    # 0.5f
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public final h()V
    .locals 2

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Ll/ius;)V

    .line 5
    .line 6
    .line 7
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->c:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$c;

    .line 8
    .line 9
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;

    .line 10
    .line 11
    invoke-direct {v0, p0, v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Ll/ius;)V

    .line 12
    .line 13
    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic i(Landroid/animation/ValueAnimator;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    check-cast v1, Ljava/lang/Float;

    .line 8
    .line 9
    invoke-virtual {v1}, Ljava/lang/Float;->floatValue()F

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->a(F)V

    .line 14
    .line 15
    .line 16
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;

    .line 17
    .line 18
    invoke-virtual {p1}, Landroid/animation/ValueAnimator;->getAnimatedValue()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Ljava/lang/Float;

    .line 23
    .line 24
    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->a(F)V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 32
    .line 33
    .line 34
    return-void
.end method

.method public j(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->g(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-direct {v0, p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;Landroid/graphics/Bitmap;)V

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->k()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public final k()V
    .locals 6

    .line 1
    const/4 v0, 0x2

    .line 2
    new-array v0, v0, [F

    .line 3
    .line 4
    fill-array-data v0, :array_0

    .line 5
    .line 6
    .line 7
    invoke-static {v0}, Landroid/animation/ValueAnimator;->ofFloat([F)Landroid/animation/ValueAnimator;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 12
    .line 13
    const-wide/16 v1, 0x3e8

    .line 14
    .line 15
    invoke-virtual {v0, v1, v2}, Landroid/animation/ValueAnimator;->setDuration(J)Landroid/animation/ValueAnimator;

    .line 16
    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 19
    .line 20
    new-instance v1, Ll/jke;

    .line 21
    .line 22
    const v2, 0x3e99999a    # 0.3f

    .line 23
    .line 24
    .line 25
    const v3, 0x3f19999a    # 0.6f

    .line 26
    .line 27
    .line 28
    const/4 v4, 0x0

    .line 29
    const/high16 v5, 0x3f800000    # 1.0f

    .line 30
    .line 31
    invoke-direct {v1, v2, v4, v3, v5}, Ll/jke;-><init>(FFFF)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)V

    .line 35
    .line 36
    .line 37
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 38
    .line 39
    new-instance v1, Ll/hus;

    .line 40
    .line 41
    invoke-direct {v1, p0}, Ll/hus;-><init>(Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->addUpdateListener(Landroid/animation/ValueAnimator$AnimatorUpdateListener;)V

    .line 45
    .line 46
    .line 47
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 48
    .line 49
    const/4 v1, -0x1

    .line 50
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatCount(I)V

    .line 51
    .line 52
    .line 53
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 54
    .line 55
    const/4 v1, 0x1

    .line 56
    invoke-virtual {v0, v1}, Landroid/animation/ValueAnimator;->setRepeatMode(I)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->start()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :array_0
    .array-data 4
        0x0
        0x3f800000    # 1.0f
    .end array-data
.end method

.method public onDetachedFromWindow()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onDetachedFromWindow()V

    .line 2
    .line 3
    .line 4
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->d:Landroid/animation/ValueAnimator;

    .line 5
    .line 6
    if-eqz p0, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/animation/ValueAnimator;->cancel()V

    .line 9
    .line 10
    .line 11
    :cond_0
    return-void
.end method

.method public onDraw(Landroid/graphics/Canvas;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Landroid/view/View;->onDraw(Landroid/graphics/Canvas;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->a:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;

    .line 5
    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    invoke-virtual {v0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$b;->b(Landroid/graphics/Canvas;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView;->b:Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;

    .line 13
    .line 14
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/newui/view/LiveHeadAnimView$a;->b(Landroid/graphics/Canvas;)V

    .line 15
    .line 16
    .line 17
    return-void
.end method
