.class public Lv/image/RoundedImageView;
.super Landroid/widget/ImageView;
.source "SourceFile"


# annotations
.annotation build Landroid/annotation/SuppressLint;
    value = {
        "AppCompatCustomView"
    }
.end annotation


# static fields
.field public static final p:Landroid/graphics/Shader$TileMode;

.field public static final q:[Landroid/widget/ImageView$ScaleType;


# instance fields
.field public final a:[F

.field public b:Landroid/graphics/drawable/Drawable;

.field public c:Landroid/content/res/ColorStateList;

.field public d:F

.field public e:Landroid/graphics/ColorFilter;

.field public f:Z

.field public g:Landroid/graphics/drawable/Drawable;

.field public h:Z

.field public i:Z

.field public j:Z

.field public k:I

.field public l:I

.field public m:Landroid/widget/ImageView$ScaleType;

.field public n:Landroid/graphics/Shader$TileMode;

.field public o:Landroid/graphics/Shader$TileMode;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    sput-object v0, Lv/image/RoundedImageView;->p:Landroid/graphics/Shader$TileMode;

    .line 4
    .line 5
    sget-object v1, Landroid/widget/ImageView$ScaleType;->MATRIX:Landroid/widget/ImageView$ScaleType;

    .line 6
    .line 7
    sget-object v2, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 8
    .line 9
    sget-object v3, Landroid/widget/ImageView$ScaleType;->FIT_START:Landroid/widget/ImageView$ScaleType;

    .line 10
    .line 11
    sget-object v4, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 12
    .line 13
    sget-object v5, Landroid/widget/ImageView$ScaleType;->FIT_END:Landroid/widget/ImageView$ScaleType;

    .line 14
    .line 15
    sget-object v6, Landroid/widget/ImageView$ScaleType;->CENTER:Landroid/widget/ImageView$ScaleType;

    .line 16
    .line 17
    sget-object v7, Landroid/widget/ImageView$ScaleType;->CENTER_CROP:Landroid/widget/ImageView$ScaleType;

    .line 18
    .line 19
    sget-object v8, Landroid/widget/ImageView$ScaleType;->CENTER_INSIDE:Landroid/widget/ImageView$ScaleType;

    .line 20
    .line 21
    filled-new-array/range {v1 .. v8}, [Landroid/widget/ImageView$ScaleType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    sput-object v0, Lv/image/RoundedImageView;->q:[Landroid/widget/ImageView$ScaleType;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 276
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x4

    .line 277
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Lv/image/RoundedImageView;->a:[F

    const/high16 p1, -0x1000000

    .line 278
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    .line 279
    iput p1, p0, Lv/image/RoundedImageView;->d:F

    const/4 p1, 0x0

    .line 280
    iput-object p1, p0, Lv/image/RoundedImageView;->e:Landroid/graphics/ColorFilter;

    const/4 p1, 0x0

    .line 281
    iput-boolean p1, p0, Lv/image/RoundedImageView;->f:Z

    .line 282
    iput-boolean p1, p0, Lv/image/RoundedImageView;->h:Z

    .line 283
    iput-boolean p1, p0, Lv/image/RoundedImageView;->i:Z

    .line 284
    iput-boolean p1, p0, Lv/image/RoundedImageView;->j:Z

    .line 285
    sget-object p1, Lv/image/RoundedImageView;->p:Landroid/graphics/Shader$TileMode;

    iput-object p1, p0, Lv/image/RoundedImageView;->n:Landroid/graphics/Shader$TileMode;

    .line 286
    iput-object p1, p0, Lv/image/RoundedImageView;->o:Landroid/graphics/Shader$TileMode;

    return-void

    nop

    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 1

    const/4 v0, 0x0

    .line 275
    invoke-direct {p0, p1, p2, v0}, Lv/image/RoundedImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 9

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v0, v0, [F

    .line 6
    .line 7
    fill-array-data v0, :array_0

    .line 8
    .line 9
    .line 10
    iput-object v0, p0, Lv/image/RoundedImageView;->a:[F

    .line 11
    .line 12
    const/high16 v1, -0x1000000

    .line 13
    .line 14
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 15
    .line 16
    .line 17
    move-result-object v2

    .line 18
    iput-object v2, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 19
    .line 20
    const/4 v2, 0x0

    .line 21
    iput v2, p0, Lv/image/RoundedImageView;->d:F

    .line 22
    .line 23
    const/4 v3, 0x0

    .line 24
    iput-object v3, p0, Lv/image/RoundedImageView;->e:Landroid/graphics/ColorFilter;

    .line 25
    .line 26
    const/4 v3, 0x0

    .line 27
    iput-boolean v3, p0, Lv/image/RoundedImageView;->f:Z

    .line 28
    .line 29
    iput-boolean v3, p0, Lv/image/RoundedImageView;->h:Z

    .line 30
    .line 31
    iput-boolean v3, p0, Lv/image/RoundedImageView;->i:Z

    .line 32
    .line 33
    iput-boolean v3, p0, Lv/image/RoundedImageView;->j:Z

    .line 34
    .line 35
    sget-object v4, Lv/image/RoundedImageView;->p:Landroid/graphics/Shader$TileMode;

    .line 36
    .line 37
    iput-object v4, p0, Lv/image/RoundedImageView;->n:Landroid/graphics/Shader$TileMode;

    .line 38
    .line 39
    iput-object v4, p0, Lv/image/RoundedImageView;->o:Landroid/graphics/Shader$TileMode;

    .line 40
    .line 41
    sget-object v4, Ll/hhc0;->K0:[I

    .line 42
    .line 43
    invoke-virtual {p1, p2, v4, p3, v3}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    sget p2, Ll/hhc0;->L0:I

    .line 48
    .line 49
    const/4 p3, -0x1

    .line 50
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 51
    .line 52
    .line 53
    move-result p2

    .line 54
    if-ltz p2, :cond_0

    .line 55
    .line 56
    sget-object v4, Lv/image/RoundedImageView;->q:[Landroid/widget/ImageView$ScaleType;

    .line 57
    .line 58
    aget-object p2, v4, p2

    .line 59
    .line 60
    invoke-virtual {p0, p2}, Lv/image/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 61
    .line 62
    .line 63
    goto :goto_0

    .line 64
    :cond_0
    sget-object p2, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 65
    .line 66
    invoke-virtual {p0, p2}, Lv/image/RoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 67
    .line 68
    .line 69
    :goto_0
    sget p2, Ll/hhc0;->O0:I

    .line 70
    .line 71
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 72
    .line 73
    .line 74
    move-result p2

    .line 75
    int-to-float p2, p2

    .line 76
    sget v4, Ll/hhc0;->R0:I

    .line 77
    .line 78
    invoke-virtual {p1, v4, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 79
    .line 80
    .line 81
    move-result v4

    .line 82
    int-to-float v4, v4

    .line 83
    aput v4, v0, v3

    .line 84
    .line 85
    sget v4, Ll/hhc0;->S0:I

    .line 86
    .line 87
    invoke-virtual {p1, v4, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 88
    .line 89
    .line 90
    move-result v4

    .line 91
    int-to-float v4, v4

    .line 92
    const/4 v5, 0x1

    .line 93
    aput v4, v0, v5

    .line 94
    .line 95
    sget v4, Ll/hhc0;->Q0:I

    .line 96
    .line 97
    invoke-virtual {p1, v4, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    int-to-float v4, v4

    .line 102
    const/4 v6, 0x2

    .line 103
    aput v4, v0, v6

    .line 104
    .line 105
    sget v4, Ll/hhc0;->P0:I

    .line 106
    .line 107
    invoke-virtual {p1, v4, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    int-to-float v4, v4

    .line 112
    const/4 v6, 0x3

    .line 113
    aput v4, v0, v6

    .line 114
    .line 115
    array-length v0, v0

    .line 116
    move v4, v3

    .line 117
    move v6, v4

    .line 118
    :goto_1
    if-ge v4, v0, :cond_2

    .line 119
    .line 120
    iget-object v7, p0, Lv/image/RoundedImageView;->a:[F

    .line 121
    .line 122
    aget v8, v7, v4

    .line 123
    .line 124
    cmpg-float v8, v8, v2

    .line 125
    .line 126
    if-gez v8, :cond_1

    .line 127
    .line 128
    aput v2, v7, v4

    .line 129
    .line 130
    goto :goto_2

    .line 131
    :cond_1
    move v6, v5

    .line 132
    :goto_2
    add-int/lit8 v4, v4, 0x1

    .line 133
    .line 134
    goto :goto_1

    .line 135
    :cond_2
    if-nez v6, :cond_4

    .line 136
    .line 137
    cmpg-float v0, p2, v2

    .line 138
    .line 139
    if-gez v0, :cond_3

    .line 140
    .line 141
    move p2, v2

    .line 142
    :cond_3
    iget-object v0, p0, Lv/image/RoundedImageView;->a:[F

    .line 143
    .line 144
    array-length v0, v0

    .line 145
    move v4, v3

    .line 146
    :goto_3
    if-ge v4, v0, :cond_4

    .line 147
    .line 148
    iget-object v6, p0, Lv/image/RoundedImageView;->a:[F

    .line 149
    .line 150
    aput p2, v6, v4

    .line 151
    .line 152
    add-int/lit8 v4, v4, 0x1

    .line 153
    .line 154
    goto :goto_3

    .line 155
    :cond_4
    sget p2, Ll/hhc0;->N0:I

    .line 156
    .line 157
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 158
    .line 159
    .line 160
    move-result p2

    .line 161
    int-to-float p2, p2

    .line 162
    iput p2, p0, Lv/image/RoundedImageView;->d:F

    .line 163
    .line 164
    cmpg-float p2, p2, v2

    .line 165
    .line 166
    if-gez p2, :cond_5

    .line 167
    .line 168
    iput v2, p0, Lv/image/RoundedImageView;->d:F

    .line 169
    .line 170
    :cond_5
    sget p2, Ll/hhc0;->M0:I

    .line 171
    .line 172
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 173
    .line 174
    .line 175
    move-result-object p2

    .line 176
    iput-object p2, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 177
    .line 178
    if-nez p2, :cond_6

    .line 179
    .line 180
    invoke-static {v1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 181
    .line 182
    .line 183
    move-result-object p2

    .line 184
    iput-object p2, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 185
    .line 186
    :cond_6
    sget p2, Ll/hhc0;->T0:I

    .line 187
    .line 188
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 189
    .line 190
    .line 191
    move-result p2

    .line 192
    iput-boolean p2, p0, Lv/image/RoundedImageView;->j:Z

    .line 193
    .line 194
    sget p2, Ll/hhc0;->U0:I

    .line 195
    .line 196
    invoke-virtual {p1, p2, v3}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 197
    .line 198
    .line 199
    move-result p2

    .line 200
    iput-boolean p2, p0, Lv/image/RoundedImageView;->i:Z

    .line 201
    .line 202
    sget p2, Ll/hhc0;->V0:I

    .line 203
    .line 204
    const/4 p3, -0x2

    .line 205
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 206
    .line 207
    .line 208
    move-result p2

    .line 209
    if-eq p2, p3, :cond_7

    .line 210
    .line 211
    invoke-static {p2}, Lv/image/RoundedImageView;->b(I)Landroid/graphics/Shader$TileMode;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    invoke-virtual {p0, v0}, Lv/image/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 216
    .line 217
    .line 218
    invoke-static {p2}, Lv/image/RoundedImageView;->b(I)Landroid/graphics/Shader$TileMode;

    .line 219
    .line 220
    .line 221
    move-result-object p2

    .line 222
    invoke-virtual {p0, p2}, Lv/image/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 223
    .line 224
    .line 225
    :cond_7
    sget p2, Ll/hhc0;->W0:I

    .line 226
    .line 227
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 228
    .line 229
    .line 230
    move-result p2

    .line 231
    if-eq p2, p3, :cond_8

    .line 232
    .line 233
    invoke-static {p2}, Lv/image/RoundedImageView;->b(I)Landroid/graphics/Shader$TileMode;

    .line 234
    .line 235
    .line 236
    move-result-object p2

    .line 237
    invoke-virtual {p0, p2}, Lv/image/RoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 238
    .line 239
    .line 240
    :cond_8
    sget p2, Ll/hhc0;->X0:I

    .line 241
    .line 242
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 243
    .line 244
    .line 245
    move-result p2

    .line 246
    if-eq p2, p3, :cond_9

    .line 247
    .line 248
    invoke-static {p2}, Lv/image/RoundedImageView;->b(I)Landroid/graphics/Shader$TileMode;

    .line 249
    .line 250
    .line 251
    move-result-object p2

    .line 252
    invoke-virtual {p0, p2}, Lv/image/RoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 253
    .line 254
    .line 255
    :cond_9
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 256
    .line 257
    .line 258
    invoke-virtual {p0, v5}, Lv/image/RoundedImageView;->g(Z)V

    .line 259
    .line 260
    .line 261
    iget-boolean p2, p0, Lv/image/RoundedImageView;->j:Z

    .line 262
    .line 263
    if-eqz p2, :cond_a

    .line 264
    .line 265
    iget-object p2, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 266
    .line 267
    invoke-super {p0, p2}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 268
    .line 269
    .line 270
    :cond_a
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 271
    .line 272
    .line 273
    return-void

    .line 274
    nop

    .line 275
    :array_0
    .array-data 4
        0x0
        0x0
        0x0
        0x0
    .end array-data
.end method

.method public static b(I)Landroid/graphics/Shader$TileMode;
    .locals 1

    .line 1
    if-eqz p0, :cond_2

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eq p0, v0, :cond_1

    .line 5
    .line 6
    const/4 v0, 0x2

    .line 7
    if-eq p0, v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x0

    .line 10
    return-object p0

    .line 11
    :cond_0
    sget-object p0, Landroid/graphics/Shader$TileMode;->MIRROR:Landroid/graphics/Shader$TileMode;

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_1
    sget-object p0, Landroid/graphics/Shader$TileMode;->REPEAT:Landroid/graphics/Shader$TileMode;

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_2
    sget-object p0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 18
    .line 19
    return-object p0
.end method


# virtual methods
.method public final a()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Lv/image/RoundedImageView;->f:Z

    .line 6
    .line 7
    if-eqz v1, :cond_0

    .line 8
    .line 9
    invoke-virtual {v0}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    iput-object v0, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    iget-boolean v1, p0, Lv/image/RoundedImageView;->h:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Lv/image/RoundedImageView;->e:Landroid/graphics/ColorFilter;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method public final c()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget v2, p0, Lv/image/RoundedImageView;->l:I

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lv/image/RoundedImageView;->l:I

    .line 20
    .line 21
    :cond_1
    :goto_0
    invoke-static {v1}, Ll/ind0;->e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public final d()Landroid/graphics/drawable/Drawable;
    .locals 3

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return-object v1

    .line 9
    :cond_0
    iget v2, p0, Lv/image/RoundedImageView;->k:I

    .line 10
    .line 11
    if-eqz v2, :cond_1

    .line 12
    .line 13
    :try_start_0
    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    .line 16
    move-result-object v1
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 17
    goto :goto_0

    .line 18
    :catch_0
    const/4 v0, 0x0

    .line 19
    iput v0, p0, Lv/image/RoundedImageView;->k:I

    .line 20
    .line 21
    :cond_1
    :goto_0
    invoke-static {v1}, Ll/ind0;->e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method public drawableStateChanged()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/widget/ImageView;->drawableStateChanged()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public e(FFFF)V
    .locals 6

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->a:[F

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    aget v2, v0, v1

    .line 5
    .line 6
    cmpl-float v2, v2, p1

    .line 7
    .line 8
    const/4 v3, 0x3

    .line 9
    const/4 v4, 0x2

    .line 10
    const/4 v5, 0x1

    .line 11
    if-nez v2, :cond_0

    .line 12
    .line 13
    aget v2, v0, v5

    .line 14
    .line 15
    cmpl-float v2, v2, p2

    .line 16
    .line 17
    if-nez v2, :cond_0

    .line 18
    .line 19
    aget v2, v0, v4

    .line 20
    .line 21
    cmpl-float v2, v2, p4

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    aget v2, v0, v3

    .line 26
    .line 27
    cmpl-float v2, v2, p3

    .line 28
    .line 29
    if-nez v2, :cond_0

    .line 30
    .line 31
    return-void

    .line 32
    :cond_0
    aput p1, v0, v1

    .line 33
    .line 34
    aput p2, v0, v5

    .line 35
    .line 36
    aput p3, v0, v3

    .line 37
    .line 38
    aput p4, v0, v4

    .line 39
    .line 40
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0, v1}, Lv/image/RoundedImageView;->g(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public final f(Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView$ScaleType;)V
    .locals 4

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    instance-of v0, p1, Ll/ind0;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    check-cast p1, Ll/ind0;

    .line 10
    .line 11
    invoke-virtual {p1, p2}, Ll/ind0;->l(Landroid/widget/ImageView$ScaleType;)Ll/ind0;

    .line 12
    .line 13
    .line 14
    move-result-object p2

    .line 15
    iget v0, p0, Lv/image/RoundedImageView;->d:F

    .line 16
    .line 17
    invoke-virtual {p2, v0}, Ll/ind0;->i(F)Ll/ind0;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    iget-object v0, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 22
    .line 23
    invoke-virtual {p2, v0}, Ll/ind0;->h(Landroid/content/res/ColorStateList;)Ll/ind0;

    .line 24
    .line 25
    .line 26
    move-result-object p2

    .line 27
    iget-boolean v0, p0, Lv/image/RoundedImageView;->i:Z

    .line 28
    .line 29
    invoke-virtual {p2, v0}, Ll/ind0;->k(Z)Ll/ind0;

    .line 30
    .line 31
    .line 32
    move-result-object p2

    .line 33
    iget-object v0, p0, Lv/image/RoundedImageView;->n:Landroid/graphics/Shader$TileMode;

    .line 34
    .line 35
    invoke-virtual {p2, v0}, Ll/ind0;->m(Landroid/graphics/Shader$TileMode;)Ll/ind0;

    .line 36
    .line 37
    .line 38
    move-result-object p2

    .line 39
    iget-object v0, p0, Lv/image/RoundedImageView;->o:Landroid/graphics/Shader$TileMode;

    .line 40
    .line 41
    invoke-virtual {p2, v0}, Ll/ind0;->n(Landroid/graphics/Shader$TileMode;)Ll/ind0;

    .line 42
    .line 43
    .line 44
    iget-object p2, p0, Lv/image/RoundedImageView;->a:[F

    .line 45
    .line 46
    if-eqz p2, :cond_1

    .line 47
    .line 48
    aget v0, p2, v1

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    aget v1, p2, v1

    .line 52
    .line 53
    const/4 v2, 0x2

    .line 54
    aget v2, p2, v2

    .line 55
    .line 56
    const/4 v3, 0x3

    .line 57
    aget p2, p2, v3

    .line 58
    .line 59
    invoke-virtual {p1, v0, v1, v2, p2}, Ll/ind0;->j(FFFF)Ll/ind0;

    .line 60
    .line 61
    .line 62
    :cond_1
    invoke-virtual {p0}, Lv/image/RoundedImageView;->a()V

    .line 63
    .line 64
    .line 65
    return-void

    .line 66
    :cond_2
    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 67
    .line 68
    if-eqz v0, :cond_3

    .line 69
    .line 70
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 71
    .line 72
    invoke-virtual {p1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    :goto_0
    if-ge v1, v0, :cond_3

    .line 77
    .line 78
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 79
    .line 80
    .line 81
    move-result-object v2

    .line 82
    invoke-virtual {p0, v2, p2}, Lv/image/RoundedImageView;->f(Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView$ScaleType;)V

    .line 83
    .line 84
    .line 85
    add-int/lit8 v1, v1, 0x1

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :cond_3
    :goto_1
    return-void
.end method

.method public final g(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lv/image/RoundedImageView;->j:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-static {p1}, Ll/ind0;->e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    sget-object v0, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 18
    .line 19
    invoke-virtual {p0, p1, v0}, Lv/image/RoundedImageView;->f(Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView$ScaleType;)V

    .line 20
    .line 21
    .line 22
    :cond_1
    return-void
.end method

.method public getBorderColor()I
    .locals 0
    .annotation build Landroidx/annotation/ColorInt;
    .end annotation

    .line 1
    iget-object p0, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-virtual {p0}, Landroid/content/res/ColorStateList;->getDefaultColor()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public getBorderColors()Landroid/content/res/ColorStateList;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBorderWidth()F
    .locals 0

    .line 1
    iget p0, p0, Lv/image/RoundedImageView;->d:F

    .line 2
    .line 3
    return p0
.end method

.method public getCornerRadius()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Lv/image/RoundedImageView;->getMaxCornerRadius()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getMaxCornerRadius()F
    .locals 4

    .line 1
    iget-object p0, p0, Lv/image/RoundedImageView;->a:[F

    .line 2
    .line 3
    array-length v0, p0

    .line 4
    const/4 v1, 0x0

    .line 5
    const/4 v2, 0x0

    .line 6
    :goto_0
    if-ge v2, v0, :cond_0

    .line 7
    .line 8
    aget v3, p0, v2

    .line 9
    .line 10
    invoke-static {v3, v1}, Ljava/lang/Math;->max(FF)F

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    add-int/lit8 v2, v2, 0x1

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    return v1
.end method

.method public getScaleType()Landroid/widget/ImageView$ScaleType;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/image/RoundedImageView;->m:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/image/RoundedImageView;->n:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .locals 0

    .line 1
    iget-object p0, p0, Lv/image/RoundedImageView;->o:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public final h()V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    iget-object v1, p0, Lv/image/RoundedImageView;->m:Landroid/widget/ImageView$ScaleType;

    .line 4
    .line 5
    invoke-virtual {p0, v0, v1}, Lv/image/RoundedImageView;->f(Landroid/graphics/drawable/Drawable;Landroid/widget/ImageView$ScaleType;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setBackgroundColor(I)V
    .locals 1

    .line 1
    new-instance v0, Landroid/graphics/drawable/ColorDrawable;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 7
    .line 8
    invoke-virtual {p0, v0}, Lv/image/RoundedImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setBackgroundResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lv/image/RoundedImageView;->l:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lv/image/RoundedImageView;->l:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/image/RoundedImageView;->c()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lv/image/RoundedImageView;->b:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void
.end method

.method public setBorderColor(I)V
    .locals 0
    .param p1    # I
        .annotation build Landroidx/annotation/ColorInt;
        .end annotation
    .end param

    .line 39
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->setBorderColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_1

    .line 10
    :cond_0
    if-eqz p1, :cond_1

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :cond_1
    const/high16 p1, -0x1000000

    .line 14
    .line 15
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    :goto_0
    iput-object p1, p0, Lv/image/RoundedImageView;->c:Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Lv/image/RoundedImageView;->d:F

    .line 29
    .line 30
    const/4 v0, 0x0

    .line 31
    cmpl-float p1, p1, v0

    .line 32
    .line 33
    if-lez p1, :cond_2

    .line 34
    .line 35
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 36
    .line 37
    .line 38
    :cond_2
    :goto_1
    return-void
.end method

.method public setBorderWidth(F)V
    .locals 1

    .line 1
    iget v0, p0, Lv/image/RoundedImageView;->d:F

    .line 2
    .line 3
    cmpl-float v0, v0, p1

    .line 4
    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iput p1, p0, Lv/image/RoundedImageView;->d:F

    .line 9
    .line 10
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public setBorderWidth(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->setBorderWidth(F)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->e:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lv/image/RoundedImageView;->e:Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lv/image/RoundedImageView;->h:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Lv/image/RoundedImageView;->f:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lv/image/RoundedImageView;->a()V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    :cond_0
    return-void
.end method

.method public setCornerRadius(F)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p1, p1, p1}, Lv/image/RoundedImageView;->e(FFFF)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setCornerRadiusDimen(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DimenRes;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    invoke-virtual {p0, p1, p1, p1, p1}, Lv/image/RoundedImageView;->e(FFFF)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lv/image/RoundedImageView;->k:I

    .line 3
    .line 4
    invoke-static {p1}, Ll/ind0;->d(Landroid/graphics/Bitmap;)Ll/ind0;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setImageDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Lv/image/RoundedImageView;->k:I

    .line 3
    .line 4
    invoke-static {p1}, Ll/ind0;->e(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setImageResource(I)V
    .locals 1
    .param p1    # I
        .annotation build Landroidx/annotation/DrawableRes;
        .end annotation
    .end param

    .line 1
    iget v0, p0, Lv/image/RoundedImageView;->k:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Lv/image/RoundedImageView;->k:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lv/image/RoundedImageView;->d()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lv/image/RoundedImageView;->g:Landroid/graphics/drawable/Drawable;

    .line 17
    .line 18
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 19
    .line 20
    .line 21
    :cond_0
    return-void
.end method

.method public setImageURI(Landroid/net/Uri;)V
    .locals 0

    .line 1
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setImageURI(Landroid/net/Uri;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Landroid/widget/ImageView;->getDrawable()Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOval(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Lv/image/RoundedImageView;->i:Z

    .line 2
    .line 3
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->m:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lv/image/RoundedImageView;->m:Landroid/widget/ImageView$ScaleType;

    .line 6
    .line 7
    sget-object v0, Lv/image/RoundedImageView$a;->a:[I

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 10
    .line 11
    .line 12
    move-result v1

    .line 13
    aget v0, v0, v1

    .line 14
    .line 15
    packed-switch v0, :pswitch_data_0

    .line 16
    .line 17
    .line 18
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 19
    .line 20
    .line 21
    goto :goto_0

    .line 22
    :pswitch_0
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_XY:Landroid/widget/ImageView$ScaleType;

    .line 23
    .line 24
    invoke-super {p0, p1}, Landroid/widget/ImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 25
    .line 26
    .line 27
    :goto_0
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 35
    .line 36
    .line 37
    :cond_0
    return-void

    .line 38
    nop

    .line 39
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public setTileModeX(Landroid/graphics/Shader$TileMode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->n:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lv/image/RoundedImageView;->n:Landroid/graphics/Shader$TileMode;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public setTileModeY(Landroid/graphics/Shader$TileMode;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lv/image/RoundedImageView;->o:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Lv/image/RoundedImageView;->o:Landroid/graphics/Shader$TileMode;

    .line 7
    .line 8
    invoke-virtual {p0}, Lv/image/RoundedImageView;->h()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-virtual {p0, p1}, Lv/image/RoundedImageView;->g(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
