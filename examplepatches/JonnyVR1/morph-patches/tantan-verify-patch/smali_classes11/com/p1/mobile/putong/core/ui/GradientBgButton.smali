.class public Lcom/p1/mobile/putong/core/ui/GradientBgButton;
.super Lcom/p1/mobile/putong/core/ui/ShadowButton;
.source "SourceFile"


# instance fields
.field public A:I

.field public B:I

.field public C:I

.field public D:I

.field public E:D

.field public F:D

.field public G:Z

.field public H:Landroid/graphics/Rect;

.field public I:Ljava/lang/String;

.field public J:I

.field public K:F

.field public L:Landroid/graphics/Paint;

.field public M:Landroid/util/Pair;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroid/util/Pair<",
            "[I[F>;"
        }
    .end annotation
.end field

.field public x:I

.field public y:I

.field public z:I


# direct methods
.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/ShadowButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0

    .line 8
    invoke-direct {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/ShadowButton;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 9
    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->f(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method


# virtual methods
.method public d(Landroid/graphics/Canvas;F)V
    .locals 12

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->G:Z

    .line 2
    .line 3
    if-nez v0, :cond_5

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/BounceView;->a:Lcom/p1/mobile/putong/core/ui/a;

    .line 6
    .line 7
    iget v0, v0, Lcom/p1/mobile/putong/core/ui/a;->c:F

    .line 8
    .line 9
    const/high16 v1, 0x40000000    # 2.0f

    .line 10
    .line 11
    div-float/2addr v0, v1

    .line 12
    div-float v0, p2, v0

    .line 13
    .line 14
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 15
    .line 16
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->c:I

    .line 17
    .line 18
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setColor(I)V

    .line 19
    .line 20
    .line 21
    float-to-double v2, p2

    .line 22
    iget-wide v4, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->E:D

    .line 23
    .line 24
    mul-double v6, v2, v4

    .line 25
    .line 26
    add-double/2addr v6, v2

    .line 27
    double-to-int v6, v6

    .line 28
    iput v6, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->A:I

    .line 29
    .line 30
    iget-wide v6, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->F:D

    .line 31
    .line 32
    mul-double v8, v2, v6

    .line 33
    .line 34
    sub-double v8, v2, v8

    .line 35
    .line 36
    double-to-int v8, v8

    .line 37
    iput v8, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->C:I

    .line 38
    .line 39
    mul-double/2addr v4, v2

    .line 40
    sub-double v4, v2, v4

    .line 41
    .line 42
    double-to-int v4, v4

    .line 43
    iput v4, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->B:I

    .line 44
    .line 45
    mul-double/2addr v6, v2

    .line 46
    add-double/2addr v2, v6

    .line 47
    double-to-int v2, v2

    .line 48
    iput v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->D:I

    .line 49
    .line 50
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->M:Landroid/util/Pair;

    .line 51
    .line 52
    if-nez v2, :cond_0

    .line 53
    .line 54
    new-instance v3, Landroid/graphics/LinearGradient;

    .line 55
    .line 56
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->A:I

    .line 57
    .line 58
    int-to-float v4, v2

    .line 59
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->C:I

    .line 60
    .line 61
    int-to-float v5, v2

    .line 62
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->B:I

    .line 63
    .line 64
    int-to-float v6, v2

    .line 65
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->D:I

    .line 66
    .line 67
    int-to-float v7, v2

    .line 68
    iget v8, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->x:I

    .line 69
    .line 70
    iget v9, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->y:I

    .line 71
    .line 72
    sget-object v10, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 73
    .line 74
    invoke-direct/range {v3 .. v10}, Landroid/graphics/LinearGradient;-><init>(FFFFIILandroid/graphics/Shader$TileMode;)V

    .line 75
    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_0
    new-instance v4, Landroid/graphics/LinearGradient;

    .line 79
    .line 80
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->A:I

    .line 81
    .line 82
    int-to-float v5, v2

    .line 83
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->C:I

    .line 84
    .line 85
    int-to-float v6, v2

    .line 86
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->B:I

    .line 87
    .line 88
    int-to-float v7, v2

    .line 89
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->D:I

    .line 90
    .line 91
    int-to-float v8, v2

    .line 92
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->M:Landroid/util/Pair;

    .line 93
    .line 94
    iget-object v3, v2, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 95
    .line 96
    move-object v9, v3

    .line 97
    check-cast v9, [I

    .line 98
    .line 99
    iget-object v2, v2, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 100
    .line 101
    move-object v10, v2

    .line 102
    check-cast v10, [F

    .line 103
    .line 104
    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 105
    .line 106
    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 107
    .line 108
    .line 109
    move-object v3, v4

    .line 110
    :goto_0
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 111
    .line 112
    invoke-virtual {v2, v3}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 113
    .line 114
    .line 115
    invoke-virtual {p0, p1, p2, v0}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->h(Landroid/graphics/Canvas;FF)V

    .line 116
    .line 117
    .line 118
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 119
    .line 120
    invoke-static {p2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result p2

    .line 124
    if-eqz p2, :cond_4

    .line 125
    .line 126
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->l:Landroid/graphics/drawable/Drawable;

    .line 127
    .line 128
    instance-of v2, p2, Landroid/graphics/drawable/VectorDrawable;

    .line 129
    .line 130
    if-nez v2, :cond_2

    .line 131
    .line 132
    instance-of v2, p2, Ll/u1l0;

    .line 133
    .line 134
    if-eqz v2, :cond_1

    .line 135
    .line 136
    goto :goto_1

    .line 137
    :cond_1
    check-cast p2, Landroid/graphics/drawable/BitmapDrawable;

    .line 138
    .line 139
    invoke-virtual {p2}, Landroid/graphics/drawable/BitmapDrawable;->getBitmap()Landroid/graphics/Bitmap;

    .line 140
    .line 141
    .line 142
    move-result-object p2

    .line 143
    goto :goto_2

    .line 144
    :cond_2
    :goto_1
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 145
    .line 146
    float-to-int v2, v2

    .line 147
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 148
    .line 149
    float-to-int v3, v3

    .line 150
    invoke-virtual {p0, p2, v2, v3}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->k(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;

    .line 151
    .line 152
    .line 153
    move-result-object p2

    .line 154
    :goto_2
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 155
    .line 156
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 157
    .line 158
    div-float/2addr v3, v1

    .line 159
    mul-float/2addr v3, v0

    .line 160
    sub-float v3, v2, v3

    .line 161
    .line 162
    iget v4, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 163
    .line 164
    div-float/2addr v4, v1

    .line 165
    mul-float/2addr v4, v0

    .line 166
    sub-float/2addr v2, v4

    .line 167
    const/4 v1, 0x0

    .line 168
    cmpl-float v4, v3, v1

    .line 169
    .line 170
    if-lez v4, :cond_5

    .line 171
    .line 172
    cmpl-float v1, v2, v1

    .line 173
    .line 174
    if-lez v1, :cond_5

    .line 175
    .line 176
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->H:Landroid/graphics/Rect;

    .line 177
    .line 178
    if-nez v1, :cond_3

    .line 179
    .line 180
    new-instance v1, Landroid/graphics/Rect;

    .line 181
    .line 182
    invoke-direct {v1}, Landroid/graphics/Rect;-><init>()V

    .line 183
    .line 184
    .line 185
    iput-object v1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->H:Landroid/graphics/Rect;

    .line 186
    .line 187
    :cond_3
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->H:Landroid/graphics/Rect;

    .line 188
    .line 189
    float-to-int v4, v3

    .line 190
    float-to-int v5, v2

    .line 191
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->g:F

    .line 192
    .line 193
    mul-float/2addr v6, v0

    .line 194
    add-float/2addr v3, v6

    .line 195
    float-to-int v3, v3

    .line 196
    iget v6, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->h:F

    .line 197
    .line 198
    mul-float/2addr v6, v0

    .line 199
    add-float/2addr v2, v6

    .line 200
    float-to-int v0, v2

    .line 201
    invoke-virtual {v1, v4, v5, v3, v0}, Landroid/graphics/Rect;->set(IIII)V

    .line 202
    .line 203
    .line 204
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->H:Landroid/graphics/Rect;

    .line 205
    .line 206
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 207
    .line 208
    const/4 v1, 0x0

    .line 209
    invoke-virtual {p1, p2, v1, v0, p0}, Landroid/graphics/Canvas;->drawBitmap(Landroid/graphics/Bitmap;Landroid/graphics/Rect;Landroid/graphics/Rect;Landroid/graphics/Paint;)V

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_4
    iget-object p2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->I:Ljava/lang/String;

    .line 214
    .line 215
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 216
    .line 217
    .line 218
    move-result p2

    .line 219
    if-nez p2, :cond_5

    .line 220
    .line 221
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getWidth()I

    .line 222
    .line 223
    .line 224
    move-result p2

    .line 225
    div-int/lit8 p2, p2, 0x2

    .line 226
    .line 227
    invoke-virtual {p1}, Landroid/graphics/Canvas;->getHeight()I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    div-int/lit8 v0, v0, 0x2

    .line 232
    .line 233
    int-to-float v0, v0

    .line 234
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 235
    .line 236
    invoke-virtual {v2}, Landroid/graphics/Paint;->descent()F

    .line 237
    .line 238
    .line 239
    move-result v2

    .line 240
    iget-object v3, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 241
    .line 242
    invoke-virtual {v3}, Landroid/graphics/Paint;->ascent()F

    .line 243
    .line 244
    .line 245
    move-result v3

    .line 246
    add-float/2addr v2, v3

    .line 247
    div-float/2addr v2, v1

    .line 248
    sub-float/2addr v0, v2

    .line 249
    float-to-int v0, v0

    .line 250
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->I:Ljava/lang/String;

    .line 251
    .line 252
    int-to-float p2, p2

    .line 253
    int-to-float v0, v0

    .line 254
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 255
    .line 256
    invoke-virtual {p1, v1, p2, v0, p0}, Landroid/graphics/Canvas;->drawText(Ljava/lang/String;FFLandroid/graphics/Paint;)V

    .line 257
    .line 258
    .line 259
    :cond_5
    return-void
.end method

.method public final f(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 3

    .line 1
    sget-object v0, Ll/xhc0;->K:[I

    .line 2
    .line 3
    invoke-virtual {p1, p2, v0}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[I)Landroid/content/res/TypedArray;

    .line 4
    .line 5
    .line 6
    move-result-object p2

    .line 7
    sget v0, Ll/xhc0;->Q:I

    .line 8
    .line 9
    const/4 v1, -0x1

    .line 10
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 11
    .line 12
    .line 13
    move-result v0

    .line 14
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->x:I

    .line 15
    .line 16
    sget v0, Ll/xhc0;->P:I

    .line 17
    .line 18
    const/high16 v2, -0x10000

    .line 19
    .line 20
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->y:I

    .line 25
    .line 26
    sget v0, Ll/xhc0;->O:I

    .line 27
    .line 28
    const/4 v2, 0x0

    .line 29
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->z:I

    .line 34
    .line 35
    sget v0, Ll/xhc0;->V:I

    .line 36
    .line 37
    invoke-virtual {p2, v0, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->G:Z

    .line 42
    .line 43
    sget v0, Ll/xhc0;->S:I

    .line 44
    .line 45
    invoke-virtual {p2, v0}, Landroid/content/res/TypedArray;->getString(I)Ljava/lang/String;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    iput-object v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->I:Ljava/lang/String;

    .line 50
    .line 51
    sget v0, Ll/xhc0;->T:I

    .line 52
    .line 53
    invoke-virtual {p2, v0, v1}, Landroid/content/res/TypedArray;->getColor(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    iput v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->J:I

    .line 58
    .line 59
    sget v0, Ll/xhc0;->U:I

    .line 60
    .line 61
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    if-eqz v1, :cond_0

    .line 66
    .line 67
    invoke-virtual {p1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    invoke-virtual {p1}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iget p1, p1, Landroid/util/DisplayMetrics;->density:F

    .line 76
    .line 77
    const/high16 v1, 0x41c00000    # 24.0f

    .line 78
    .line 79
    mul-float/2addr p1, v1

    .line 80
    goto :goto_0

    .line 81
    :cond_0
    const/16 p1, 0x18

    .line 82
    .line 83
    invoke-static {p1}, Ll/qa00;->f(I)I

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    int-to-float p1, p1

    .line 88
    :goto_0
    invoke-virtual {p2, v0, p1}, Landroid/content/res/TypedArray;->getDimension(IF)F

    .line 89
    .line 90
    .line 91
    move-result p1

    .line 92
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->K:F

    .line 93
    .line 94
    invoke-virtual {p2}, Landroid/content/res/TypedArray;->recycle()V

    .line 95
    .line 96
    .line 97
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->z:I

    .line 98
    .line 99
    int-to-double p1, p1

    .line 100
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    .line 101
    .line 102
    .line 103
    move-result-wide p1

    .line 104
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->E:D

    .line 105
    .line 106
    iget p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->z:I

    .line 107
    .line 108
    int-to-double p1, p1

    .line 109
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    .line 110
    .line 111
    .line 112
    move-result-wide p1

    .line 113
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->F:D

    .line 114
    .line 115
    new-instance p1, Landroid/graphics/Paint;

    .line 116
    .line 117
    invoke-direct {p1}, Landroid/graphics/Paint;-><init>()V

    .line 118
    .line 119
    .line 120
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 121
    .line 122
    const/4 p2, 0x1

    .line 123
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setAntiAlias(Z)V

    .line 124
    .line 125
    .line 126
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 127
    .line 128
    sget-object p2, Landroid/graphics/Paint$Style;->FILL:Landroid/graphics/Paint$Style;

    .line 129
    .line 130
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setStyle(Landroid/graphics/Paint$Style;)V

    .line 131
    .line 132
    .line 133
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 134
    .line 135
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->J:I

    .line 136
    .line 137
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setColor(I)V

    .line 138
    .line 139
    .line 140
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 141
    .line 142
    iget p2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->K:F

    .line 143
    .line 144
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextSize(F)V

    .line 145
    .line 146
    .line 147
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 148
    .line 149
    sget-object p2, Landroid/graphics/Paint$Align;->CENTER:Landroid/graphics/Paint$Align;

    .line 150
    .line 151
    invoke-virtual {p1, p2}, Landroid/graphics/Paint;->setTextAlign(Landroid/graphics/Paint$Align;)V

    .line 152
    .line 153
    .line 154
    invoke-virtual {p0}, Landroid/view/View;->isInEditMode()Z

    .line 155
    .line 156
    .line 157
    move-result p1

    .line 158
    if-eqz p1, :cond_1

    .line 159
    .line 160
    return-void

    .line 161
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->L:Landroid/graphics/Paint;

    .line 162
    .line 163
    const/4 p1, 0x3

    .line 164
    invoke-static {p1}, Ll/lyh0;->c(I)Landroid/graphics/Typeface;

    .line 165
    .line 166
    .line 167
    move-result-object p1

    .line 168
    invoke-virtual {p0, p1}, Landroid/graphics/Paint;->setTypeface(Landroid/graphics/Typeface;)Landroid/graphics/Typeface;

    .line 169
    .line 170
    .line 171
    return-void
.end method

.method public h(Landroid/graphics/Canvas;FF)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3}, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->j(Landroid/graphics/Canvas;FF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public i(Landroid/graphics/Canvas;FF)V
    .locals 5

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/graphics/Paint;->getShader()Landroid/graphics/Shader;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    invoke-virtual {v1, v2}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 11
    .line 12
    .line 13
    iget-boolean v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->o:Z

    .line 14
    .line 15
    if-eqz v1, :cond_0

    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 18
    .line 19
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 20
    .line 21
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d:I

    .line 22
    .line 23
    invoke-virtual {p0, v3, p3}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 24
    .line 25
    .line 26
    move-result v3

    .line 27
    const/4 v4, 0x0

    .line 28
    invoke-virtual {v1, v2, v4, v2, v3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 29
    .line 30
    .line 31
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 32
    .line 33
    iget-object v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 34
    .line 35
    invoke-virtual {p1, v1, v1, p2, v2}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 36
    .line 37
    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 39
    .line 40
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 41
    .line 42
    iget v3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e:I

    .line 43
    .line 44
    invoke-virtual {p0, v3, p3}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 45
    .line 46
    .line 47
    move-result p3

    .line 48
    invoke-virtual {v1, v2, v4, v4, p3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 49
    .line 50
    .line 51
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 52
    .line 53
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 54
    .line 55
    invoke-virtual {p1, p3, p3, p2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 56
    .line 57
    .line 58
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 59
    .line 60
    invoke-virtual {p3}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 61
    .line 62
    .line 63
    :cond_0
    iget-object p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 64
    .line 65
    invoke-virtual {p3, v0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 66
    .line 67
    .line 68
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 69
    .line 70
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 71
    .line 72
    invoke-virtual {p1, p3, p3, p2, p0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public j(Landroid/graphics/Canvas;FF)V
    .locals 4

    .line 1
    iget-boolean v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->o:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 6
    .line 7
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 8
    .line 9
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->d:I

    .line 10
    .line 11
    invoke-virtual {p0, v2, p3}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 12
    .line 13
    .line 14
    move-result v2

    .line 15
    const/4 v3, 0x0

    .line 16
    invoke-virtual {v0, v1, v3, v1, v2}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 17
    .line 18
    .line 19
    iget v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 20
    .line 21
    iget-object v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 22
    .line 23
    invoke-virtual {p1, v0, v0, p2, v1}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 27
    .line 28
    iget v1, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->i:F

    .line 29
    .line 30
    iget v2, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->e:I

    .line 31
    .line 32
    invoke-virtual {p0, v2, p3}, Lcom/p1/mobile/putong/core/ui/ShadowButton;->b(IF)I

    .line 33
    .line 34
    .line 35
    move-result p3

    .line 36
    invoke-virtual {v0, v1, v3, v3, p3}, Landroid/graphics/Paint;->setShadowLayer(FFFI)V

    .line 37
    .line 38
    .line 39
    :cond_0
    iget p3, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->m:F

    .line 40
    .line 41
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 42
    .line 43
    invoke-virtual {p1, p3, p3, p2, v0}, Landroid/graphics/Canvas;->drawCircle(FFFLandroid/graphics/Paint;)V

    .line 44
    .line 45
    .line 46
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/ShadowButton;->j:Landroid/graphics/Paint;

    .line 47
    .line 48
    invoke-virtual {p0}, Landroid/graphics/Paint;->clearShadowLayer()V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public final k(Landroid/graphics/drawable/Drawable;II)Landroid/graphics/Bitmap;
    .locals 2

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicWidth()I

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    :cond_0
    if-nez p3, :cond_1

    .line 8
    .line 9
    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->getIntrinsicHeight()I

    .line 10
    .line 11
    .line 12
    move-result p3

    .line 13
    :cond_1
    sget-object p0, Landroid/graphics/Bitmap$Config;->ARGB_8888:Landroid/graphics/Bitmap$Config;

    .line 14
    .line 15
    invoke-static {p2, p3, p0}, Landroid/graphics/Bitmap;->createBitmap(IILandroid/graphics/Bitmap$Config;)Landroid/graphics/Bitmap;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    new-instance p2, Landroid/graphics/Canvas;

    .line 20
    .line 21
    invoke-direct {p2, p0}, Landroid/graphics/Canvas;-><init>(Landroid/graphics/Bitmap;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p2}, Landroid/graphics/Canvas;->getWidth()I

    .line 25
    .line 26
    .line 27
    move-result p3

    .line 28
    invoke-virtual {p2}, Landroid/graphics/Canvas;->getHeight()I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    const/4 v1, 0x0

    .line 33
    invoke-virtual {p1, v1, v1, p3, v0}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, p2}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    .line 37
    .line 38
    .line 39
    return-object p0
.end method

.method public setButtonColorAngle(I)V
    .locals 4

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->z:I

    .line 2
    .line 3
    int-to-double v0, p1

    .line 4
    invoke-static {v0, v1}, Ljava/lang/Math;->sin(D)D

    .line 5
    .line 6
    .line 7
    move-result-wide v2

    .line 8
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->E:D

    .line 9
    .line 10
    invoke-static {v0, v1}, Ljava/lang/Math;->cos(D)D

    .line 11
    .line 12
    .line 13
    move-result-wide v0

    .line 14
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->F:D

    .line 15
    .line 16
    return-void
.end method

.method public setButtonColorAngleD(D)V
    .locals 2

    .line 1
    invoke-static {p1, p2}, Ljava/lang/Math;->sin(D)D

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->E:D

    .line 6
    .line 7
    invoke-static {p1, p2}, Ljava/lang/Math;->cos(D)D

    .line 8
    .line 9
    .line 10
    move-result-wide p1

    .line 11
    iput-wide p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->F:D

    .line 12
    .line 13
    return-void
.end method

.method public setButtonColorEnd(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->y:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->M:Landroid/util/Pair;

    .line 5
    .line 6
    return-void
.end method

.method public setButtonColorStart(I)V
    .locals 0

    .line 1
    iput p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->x:I

    .line 2
    .line 3
    const/4 p1, 0x0

    .line 4
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->M:Landroid/util/Pair;

    .line 5
    .line 6
    return-void
.end method

.method public setCenterText(Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->I:Ljava/lang/String;

    .line 2
    .line 3
    return-void
.end method

.method public setEmpty(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lcom/p1/mobile/putong/core/ui/GradientBgButton;->G:Z

    .line 2
    .line 3
    return-void
.end method
