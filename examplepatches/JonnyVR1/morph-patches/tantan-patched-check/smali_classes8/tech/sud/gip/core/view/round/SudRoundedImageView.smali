.class public Ltech/sud/gip/core/view/round/SudRoundedImageView;
.super Landroid/widget/ImageView;
.source "SourceFile"


# static fields
.field static final synthetic $assertionsDisabled:Z = false

.field public static final DEFAULT_BORDER_WIDTH:F = 0.0f

.field public static final DEFAULT_RADIUS:F = 0.0f

.field public static final DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

.field private static final SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

.field public static final TAG:Ljava/lang/String; = "RoundedImageView"

.field private static final TILE_MODE_CLAMP:I = 0x0

.field private static final TILE_MODE_MIRROR:I = 0x2

.field private static final TILE_MODE_REPEAT:I = 0x1

.field private static final TILE_MODE_UNDEFINED:I = -0x2


# instance fields
.field private isSquare:Z

.field private mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

.field private mBorderColor:Landroid/content/res/ColorStateList;

.field private mBorderWidth:F

.field private mColorFilter:Landroid/graphics/ColorFilter;

.field private mColorMod:Z

.field private final mCornerRadii:[F

.field private mDrawable:Landroid/graphics/drawable/Drawable;

.field private mHasColorFilter:Z

.field private mIsOval:Z

.field private mMutateBackground:Z

.field private mResource:I

.field private mScaleType:Landroid/widget/ImageView$ScaleType;

.field private mTileModeX:Landroid/graphics/Shader$TileMode;

.field private mTileModeY:Landroid/graphics/Shader$TileMode;


# direct methods
.method static constructor <clinit>()V
    .locals 9

    .line 1
    sget-object v0, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    sput-object v0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

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
    sput-object v0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

    .line 26
    .line 27
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;)V
    .locals 0

    .line 280
    invoke-direct {p0, p1}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;)V

    const/4 p1, 0x4

    .line 281
    new-array p1, p1, [F

    fill-array-data p1, :array_0

    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    const/high16 p1, -0x1000000

    .line 282
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    const/4 p1, 0x0

    .line 283
    iput p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    const/4 p1, 0x0

    .line 284
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    const/4 p1, 0x0

    .line 285
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorMod:Z

    .line 286
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mHasColorFilter:Z

    .line 287
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mIsOval:Z

    .line 288
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 289
    sget-object p1, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 290
    sget-object p1, Ltech/sud/gip/core/view/round/SudRoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 291
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeY:Landroid/graphics/Shader$TileMode;

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

    .line 279
    invoke-direct {p0, p1, p2, v0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 10

    .line 1
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/ImageView;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x4

    .line 5
    new-array v1, v0, [F

    .line 6
    .line 7
    const/4 v2, 0x0

    .line 8
    const/4 v3, 0x0

    .line 9
    aput v3, v1, v2

    .line 10
    .line 11
    const/4 v4, 0x1

    .line 12
    aput v3, v1, v4

    .line 13
    .line 14
    const/4 v5, 0x2

    .line 15
    aput v3, v1, v5

    .line 16
    .line 17
    const/4 v6, 0x3

    .line 18
    aput v3, v1, v6

    .line 19
    .line 20
    iput-object v1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 21
    .line 22
    const/high16 v7, -0x1000000

    .line 23
    .line 24
    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 25
    .line 26
    .line 27
    move-result-object v8

    .line 28
    iput-object v8, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 29
    .line 30
    iput v3, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    .line 31
    .line 32
    const/4 v8, 0x0

    .line 33
    iput-object v8, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 34
    .line 35
    iput-boolean v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorMod:Z

    .line 36
    .line 37
    iput-boolean v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mHasColorFilter:Z

    .line 38
    .line 39
    iput-boolean v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mIsOval:Z

    .line 40
    .line 41
    iput-boolean v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 42
    .line 43
    sget-object v8, Landroid/widget/ImageView$ScaleType;->FIT_CENTER:Landroid/widget/ImageView$ScaleType;

    .line 44
    .line 45
    iput-object v8, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 46
    .line 47
    sget-object v9, Ltech/sud/gip/core/view/round/SudRoundedImageView;->DEFAULT_TILE_MODE:Landroid/graphics/Shader$TileMode;

    .line 48
    .line 49
    iput-object v9, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 50
    .line 51
    iput-object v9, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 52
    .line 53
    sget-object v9, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView:[I

    .line 54
    .line 55
    invoke-virtual {p1, p2, v9, p3, v2}, Landroid/content/Context;->obtainStyledAttributes(Landroid/util/AttributeSet;[III)Landroid/content/res/TypedArray;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_android_scaleType:I

    .line 60
    .line 61
    const/4 p3, -0x1

    .line 62
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 63
    .line 64
    .line 65
    move-result p2

    .line 66
    if-ltz p2, :cond_0

    .line 67
    .line 68
    sget-object v8, Ltech/sud/gip/core/view/round/SudRoundedImageView;->SCALE_TYPES:[Landroid/widget/ImageView$ScaleType;

    .line 69
    .line 70
    aget-object p2, v8, p2

    .line 71
    .line 72
    invoke-virtual {p0, p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 73
    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_0
    invoke-virtual {p0, v8}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setScaleType(Landroid/widget/ImageView$ScaleType;)V

    .line 77
    .line 78
    .line 79
    :goto_0
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_corner_radius:I

    .line 80
    .line 81
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 82
    .line 83
    .line 84
    move-result p2

    .line 85
    int-to-float p2, p2

    .line 86
    sget v8, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_corner_radius_top_left:I

    .line 87
    .line 88
    invoke-virtual {p1, v8, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 89
    .line 90
    .line 91
    move-result v8

    .line 92
    int-to-float v8, v8

    .line 93
    aput v8, v1, v2

    .line 94
    .line 95
    sget v8, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_corner_radius_top_right:I

    .line 96
    .line 97
    invoke-virtual {p1, v8, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 98
    .line 99
    .line 100
    move-result v8

    .line 101
    int-to-float v8, v8

    .line 102
    aput v8, v1, v4

    .line 103
    .line 104
    sget v8, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_corner_radius_bottom_right:I

    .line 105
    .line 106
    invoke-virtual {p1, v8, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 107
    .line 108
    .line 109
    move-result v8

    .line 110
    int-to-float v8, v8

    .line 111
    aput v8, v1, v5

    .line 112
    .line 113
    sget v5, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_corner_radius_bottom_left:I

    .line 114
    .line 115
    invoke-virtual {p1, v5, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 116
    .line 117
    .line 118
    move-result v5

    .line 119
    int-to-float v5, v5

    .line 120
    aput v5, v1, v6

    .line 121
    .line 122
    move v1, v2

    .line 123
    move v5, v1

    .line 124
    :goto_1
    if-ge v1, v0, :cond_2

    .line 125
    .line 126
    iget-object v6, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 127
    .line 128
    aget v8, v6, v1

    .line 129
    .line 130
    cmpg-float v8, v8, v3

    .line 131
    .line 132
    if-gez v8, :cond_1

    .line 133
    .line 134
    aput v3, v6, v1

    .line 135
    .line 136
    goto :goto_2

    .line 137
    :cond_1
    move v5, v4

    .line 138
    :goto_2
    add-int/lit8 v1, v1, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :cond_2
    if-nez v5, :cond_4

    .line 142
    .line 143
    cmpg-float v0, p2, v3

    .line 144
    .line 145
    if-gez v0, :cond_3

    .line 146
    .line 147
    move p2, v3

    .line 148
    :cond_3
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 149
    .line 150
    array-length v0, v0

    .line 151
    move v1, v2

    .line 152
    :goto_3
    if-ge v1, v0, :cond_4

    .line 153
    .line 154
    iget-object v5, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 155
    .line 156
    aput p2, v5, v1

    .line 157
    .line 158
    add-int/lit8 v1, v1, 0x1

    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_4
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_border_width:I

    .line 162
    .line 163
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getDimensionPixelSize(II)I

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    int-to-float p2, p2

    .line 168
    iput p2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    .line 169
    .line 170
    cmpg-float p2, p2, v3

    .line 171
    .line 172
    if-gez p2, :cond_5

    .line 173
    .line 174
    iput v3, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    .line 175
    .line 176
    :cond_5
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_border_color:I

    .line 177
    .line 178
    invoke-virtual {p1, p2}, Landroid/content/res/TypedArray;->getColorStateList(I)Landroid/content/res/ColorStateList;

    .line 179
    .line 180
    .line 181
    move-result-object p2

    .line 182
    iput-object p2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 183
    .line 184
    if-nez p2, :cond_6

    .line 185
    .line 186
    invoke-static {v7}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    .line 187
    .line 188
    .line 189
    move-result-object p2

    .line 190
    iput-object p2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 191
    .line 192
    :cond_6
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_mutate_background:I

    .line 193
    .line 194
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    iput-boolean p2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 199
    .line 200
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_oval:I

    .line 201
    .line 202
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 203
    .line 204
    .line 205
    move-result p2

    .line 206
    iput-boolean p2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mIsOval:Z

    .line 207
    .line 208
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_square:I

    .line 209
    .line 210
    invoke-virtual {p1, p2, v2}, Landroid/content/res/TypedArray;->getBoolean(IZ)Z

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    iput-boolean p2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->isSquare:Z

    .line 215
    .line 216
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_tile_mode:I

    .line 217
    .line 218
    const/4 p3, -0x2

    .line 219
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 220
    .line 221
    .line 222
    move-result p2

    .line 223
    if-eq p2, p3, :cond_7

    .line 224
    .line 225
    invoke-static {p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    .line 226
    .line 227
    .line 228
    move-result-object v0

    .line 229
    invoke-virtual {p0, v0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 230
    .line 231
    .line 232
    invoke-static {p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    .line 233
    .line 234
    .line 235
    move-result-object p2

    .line 236
    invoke-virtual {p0, p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 237
    .line 238
    .line 239
    :cond_7
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_tile_mode_x:I

    .line 240
    .line 241
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 242
    .line 243
    .line 244
    move-result p2

    .line 245
    if-eq p2, p3, :cond_8

    .line 246
    .line 247
    invoke-static {p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    .line 248
    .line 249
    .line 250
    move-result-object p2

    .line 251
    invoke-virtual {p0, p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setTileModeX(Landroid/graphics/Shader$TileMode;)V

    .line 252
    .line 253
    .line 254
    :cond_8
    sget p2, Ltech/sud/gip/R$styleable;->fsm_mgp_SudRoundedImageView_sud_riv_tile_mode_y:I

    .line 255
    .line 256
    invoke-virtual {p1, p2, p3}, Landroid/content/res/TypedArray;->getInt(II)I

    .line 257
    .line 258
    .line 259
    move-result p2

    .line 260
    if-eq p2, p3, :cond_9

    .line 261
    .line 262
    invoke-static {p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->parseTileMode(I)Landroid/graphics/Shader$TileMode;

    .line 263
    .line 264
    .line 265
    move-result-object p2

    .line 266
    invoke-virtual {p0, p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setTileModeY(Landroid/graphics/Shader$TileMode;)V

    .line 267
    .line 268
    .line 269
    :cond_9
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 270
    .line 271
    .line 272
    invoke-direct {p0, v4}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 273
    .line 274
    .line 275
    invoke-virtual {p1}, Landroid/content/res/TypedArray;->recycle()V

    .line 276
    .line 277
    .line 278
    return-void
.end method

.method private applyColorMod()V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    iget-boolean v1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorMod:Z

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
    iput-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    iget-boolean v1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mHasColorFilter:Z

    .line 16
    .line 17
    if-eqz v1, :cond_0

    .line 18
    .line 19
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 20
    .line 21
    invoke-virtual {v0, p0}, Landroid/graphics/drawable/Drawable;->setColorFilter(Landroid/graphics/ColorFilter;)V

    .line 22
    .line 23
    .line 24
    :cond_0
    return-void
.end method

.method private static parseTileMode(I)Landroid/graphics/Shader$TileMode;
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

.method private resolveResource()Landroid/graphics/drawable/Drawable;
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
    iget v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mResource:I

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
    iput v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mResource:I

    .line 20
    .line 21
    :cond_1
    :goto_0
    invoke-static {v1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    return-object p0
.end method

.method private updateAttrs(Landroid/graphics/drawable/Drawable;)V
    .locals 5

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_1

    .line 4
    :cond_0
    instance-of v0, p1, Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    check-cast p1, Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 10
    .line 11
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 12
    .line 13
    invoke-virtual {p1, v0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setScaleType(Landroid/widget/ImageView$ScaleType;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    iget v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    .line 18
    .line 19
    invoke-virtual {v0, v2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setBorderWidth(F)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iget-object v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setBorderColor(Landroid/content/res/ColorStateList;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-boolean v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mIsOval:Z

    .line 30
    .line 31
    invoke-virtual {v0, v2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setOval(Z)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    iget-object v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 36
    .line 37
    invoke-virtual {v0, v2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setTileModeX(Landroid/graphics/Shader$TileMode;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iget-object v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 42
    .line 43
    invoke-virtual {v0, v2}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setTileModeY(Landroid/graphics/Shader$TileMode;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 44
    .line 45
    .line 46
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 47
    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    aget v1, v0, v1

    .line 51
    .line 52
    const/4 v2, 0x1

    .line 53
    aget v2, v0, v2

    .line 54
    .line 55
    const/4 v3, 0x2

    .line 56
    aget v3, v0, v3

    .line 57
    .line 58
    const/4 v4, 0x3

    .line 59
    aget v0, v0, v4

    .line 60
    .line 61
    invoke-virtual {p1, v1, v2, v3, v0}, Ltech/sud/gip/core/view/round/RoundedDrawable;->setCornerRadius(FFFF)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 62
    .line 63
    .line 64
    :cond_1
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->applyColorMod()V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_2
    instance-of v0, p1, Landroid/graphics/drawable/LayerDrawable;

    .line 69
    .line 70
    if-eqz v0, :cond_3

    .line 71
    .line 72
    check-cast p1, Landroid/graphics/drawable/LayerDrawable;

    .line 73
    .line 74
    invoke-virtual {p1}, Landroid/graphics/drawable/LayerDrawable;->getNumberOfLayers()I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    :goto_0
    if-ge v1, v0, :cond_3

    .line 79
    .line 80
    invoke-virtual {p1, v1}, Landroid/graphics/drawable/LayerDrawable;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 81
    .line 82
    .line 83
    move-result-object v2

    .line 84
    invoke-direct {p0, v2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 85
    .line 86
    .line 87
    add-int/lit8 v1, v1, 0x1

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :cond_3
    :goto_1
    return-void
.end method

.method private updateBackgroundDrawableAttrs(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    iget-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-static {p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 14
    .line 15
    :cond_0
    iget-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 16
    .line 17
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 18
    .line 19
    .line 20
    :cond_1
    return-void
.end method

.method private updateDrawableAttrs()V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    invoke-direct {p0, v0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateAttrs(Landroid/graphics/drawable/Drawable;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
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

.method public getBorderColor()I
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

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
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 2
    .line 3
    return-object p0
.end method

.method public getBorderWidth()F
    .locals 0

    .line 1
    iget p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    .line 2
    .line 3
    return p0
.end method

.method public getCornerRadius()F
    .locals 0

    .line 1
    invoke-virtual {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->getMaxCornerRadius()F

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    return p0
.end method

.method public getCornerRadius(I)F
    .locals 0

    .line 6
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    aget p0, p0, p1

    return p0
.end method

.method public getMaxCornerRadius()F
    .locals 4

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

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
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileModeX()Landroid/graphics/Shader$TileMode;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public getTileModeY()Landroid/graphics/Shader$TileMode;
    .locals 0

    .line 1
    iget-object p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    return-object p0
.end method

.method public isOval()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mIsOval:Z

    .line 2
    .line 3
    return p0
.end method

.method public mutateBackground(Z)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public mutatesBackground()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mMutateBackground:Z

    .line 2
    .line 3
    return p0
.end method

.method public onMeasure(II)V
    .locals 0

    .line 1
    invoke-super {p0, p1, p2}, Landroid/widget/ImageView;->onMeasure(II)V

    .line 2
    .line 3
    .line 4
    iget-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->isSquare:Z

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 9
    .line 10
    .line 11
    move-result p1

    .line 12
    invoke-virtual {p0}, Landroid/view/View;->getMeasuredWidth()I

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    invoke-virtual {p0, p1, p2}, Landroid/view/View;->setMeasuredDimension(II)V

    .line 17
    .line 18
    .line 19
    :cond_0
    return-void
.end method

.method public setBackground(Landroid/graphics/drawable/Drawable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V
    .locals 0
    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 1
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBackgroundDrawable:Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    invoke-super {p0, p1}, Landroid/view/View;->setBackgroundDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public setBorderColor(I)V
    .locals 0

    .line 39
    invoke-static {p1}, Landroid/content/res/ColorStateList;->valueOf(I)Landroid/content/res/ColorStateList;

    move-result-object p1

    invoke-virtual {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setBorderColor(Landroid/content/res/ColorStateList;)V

    return-void
.end method

.method public setBorderColor(Landroid/content/res/ColorStateList;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

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
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderColor:Landroid/content/res/ColorStateList;

    .line 20
    .line 21
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 22
    .line 23
    .line 24
    const/4 p1, 0x0

    .line 25
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 26
    .line 27
    .line 28
    iget p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

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
    iget v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

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
    iput p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mBorderWidth:F

    .line 9
    .line 10
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 11
    .line 12
    .line 13
    const/4 p1, 0x0

    .line 14
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

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

    .line 21
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    invoke-virtual {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setBorderWidth(F)V

    return-void
.end method

.method public setColorFilter(Landroid/graphics/ColorFilter;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorFilter:Landroid/graphics/ColorFilter;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mHasColorFilter:Z

    .line 9
    .line 10
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mColorMod:Z

    .line 11
    .line 12
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->applyColorMod()V

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

    .line 55
    invoke-virtual {p0, p1, p1, p1, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setCornerRadius(FFFF)V

    return-void
.end method

.method public setCornerRadius(FFFF)V
    .locals 6

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

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
    cmpl-float v2, v2, p3

    .line 22
    .line 23
    if-nez v2, :cond_0

    .line 24
    .line 25
    aget v2, v0, v3

    .line 26
    .line 27
    cmpl-float v2, v2, p4

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
    aput p4, v0, v3

    .line 37
    .line 38
    aput p3, v0, v4

    .line 39
    .line 40
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 41
    .line 42
    .line 43
    invoke-direct {p0, v1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public setCornerRadius(IF)V
    .locals 2

    .line 50
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    aget v1, v0, p1

    cmpl-float v1, v1, p2

    if-nez v1, :cond_0

    return-void

    .line 51
    :cond_0
    aput p2, v0, p1

    .line 52
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    const/4 p1, 0x0

    .line 53
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 54
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    return-void
.end method

.method public setCornerRadiusDimen(I)V
    .locals 1

    .line 14
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, p1}, Landroid/content/res/Resources;->getDimension(I)F

    move-result p1

    .line 15
    invoke-virtual {p0, p1, p1, p1, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setCornerRadius(FFFF)V

    return-void
.end method

.method public setCornerRadiusDimen(II)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    .line 6
    .line 7
    .line 8
    move-result p2

    .line 9
    int-to-float p2, p2

    .line 10
    invoke-virtual {p0, p1, p2}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setCornerRadius(IF)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setImageBitmap(Landroid/graphics/Bitmap;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mResource:I

    .line 3
    .line 4
    invoke-static {p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->fromBitmap(Landroid/graphics/Bitmap;)Ltech/sud/gip/core/view/round/RoundedDrawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

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
    iput v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mResource:I

    .line 3
    .line 4
    invoke-static {p1}, Ltech/sud/gip/core/view/round/RoundedDrawable;->fromDrawable(Landroid/graphics/drawable/Drawable;)Landroid/graphics/drawable/Drawable;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 9
    .line 10
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

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

    .line 1
    iget v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mResource:I

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mResource:I

    .line 6
    .line 7
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->resolveResource()Landroid/graphics/drawable/Drawable;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

    .line 12
    .line 13
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mDrawable:Landroid/graphics/drawable/Drawable;

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
    invoke-virtual {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public setOval(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mIsOval:Z

    .line 2
    .line 3
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public setRadius(I)V
    .locals 4

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 2
    .line 3
    array-length v0, v0

    .line 4
    const/4 v1, 0x0

    .line 5
    :goto_0
    if-ge v1, v0, :cond_0

    .line 6
    .line 7
    iget-object v2, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mCornerRadii:[F

    .line 8
    .line 9
    int-to-float v3, p1

    .line 10
    aput v3, v2, v1

    .line 11
    .line 12
    add-int/lit8 v1, v1, 0x1

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    return-void
.end method

.method public setScaleType(Landroid/widget/ImageView$ScaleType;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 2
    .line 3
    if-eq v0, p1, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mScaleType:Landroid/widget/ImageView$ScaleType;

    .line 6
    .line 7
    sget-object v0, Ltech/sud/gip/core/view/round/SudRoundedImageView$1;->$SwitchMap$android$widget$ImageView$ScaleType:[I

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
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 28
    .line 29
    .line 30
    const/4 p1, 0x0

    .line 31
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

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
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeX:Landroid/graphics/Shader$TileMode;

    .line 7
    .line 8
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

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
    iget-object v0, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iput-object p1, p0, Ltech/sud/gip/core/view/round/SudRoundedImageView;->mTileModeY:Landroid/graphics/Shader$TileMode;

    .line 7
    .line 8
    invoke-direct {p0}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateDrawableAttrs()V

    .line 9
    .line 10
    .line 11
    const/4 p1, 0x0

    .line 12
    invoke-direct {p0, p1}, Ltech/sud/gip/core/view/round/SudRoundedImageView;->updateBackgroundDrawableAttrs(Z)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    .line 16
    .line 17
    .line 18
    return-void
.end method
