.class public Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x9
    name = "c"
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

.field public b:I

.field public c:I

.field public d:Landroid/content/Context;

.field public e:Landroid/graphics/Shader;

.field public f:Z

.field public g:F

.field public h:F

.field public i:Landroid/graphics/Paint;

.field public j:Landroid/graphics/RectF;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;IILandroid/graphics/Paint;)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->f:Z

    .line 6
    .line 7
    iput-object p2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 8
    .line 9
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 10
    .line 11
    iput p4, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 12
    .line 13
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->d:Landroid/content/Context;

    .line 14
    .line 15
    new-instance p1, Landroid/graphics/RectF;

    .line 16
    .line 17
    invoke-direct {p1}, Landroid/graphics/RectF;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 21
    .line 22
    iput-object p5, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->i:Landroid/graphics/Paint;

    .line 23
    .line 24
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b()V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static bridge synthetic a(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;)Landroid/graphics/Shader;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->e:Landroid/graphics/Shader;

    return-object p0
.end method


# virtual methods
.method public final b()V
    .locals 13

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->f:Z

    .line 3
    .line 4
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 5
    .line 6
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->k()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const/4 v1, 0x0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->d:Landroid/content/Context;

    .line 14
    .line 15
    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 20
    .line 21
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->g(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)I

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    invoke-static {v0, v2}, Landroid/graphics/BitmapFactory;->decodeResource(Landroid/content/res/Resources;I)Landroid/graphics/Bitmap;

    .line 26
    .line 27
    .line 28
    move-result-object v3

    .line 29
    new-instance v8, Landroid/graphics/Matrix;

    .line 30
    .line 31
    invoke-direct {v8}, Landroid/graphics/Matrix;-><init>()V

    .line 32
    .line 33
    .line 34
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 35
    .line 36
    int-to-float v0, v0

    .line 37
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 38
    .line 39
    .line 40
    move-result v2

    .line 41
    int-to-float v2, v2

    .line 42
    div-float/2addr v0, v2

    .line 43
    invoke-virtual {v8, v0, v0}, Landroid/graphics/Matrix;->setScale(FF)V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getWidth()I

    .line 47
    .line 48
    .line 49
    move-result v6

    .line 50
    invoke-virtual {v3}, Landroid/graphics/Bitmap;->getHeight()I

    .line 51
    .line 52
    .line 53
    move-result v7

    .line 54
    const/4 v9, 0x0

    .line 55
    const/4 v4, 0x0

    .line 56
    const/4 v5, 0x0

    .line 57
    invoke-static/range {v3 .. v9}, Landroid/graphics/Bitmap;->createBitmap(Landroid/graphics/Bitmap;IIIILandroid/graphics/Matrix;Z)Landroid/graphics/Bitmap;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v2, Landroid/graphics/BitmapShader;

    .line 62
    .line 63
    sget-object v3, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 64
    .line 65
    invoke-direct {v2, v0, v3, v3}, Landroid/graphics/BitmapShader;-><init>(Landroid/graphics/Bitmap;Landroid/graphics/Shader$TileMode;Landroid/graphics/Shader$TileMode;)V

    .line 66
    .line 67
    .line 68
    iput-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->e:Landroid/graphics/Shader;

    .line 69
    .line 70
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 71
    .line 72
    .line 73
    move-result v2

    .line 74
    neg-int v2, v2

    .line 75
    int-to-float v2, v2

    .line 76
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->g:F

    .line 77
    .line 78
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 79
    .line 80
    int-to-float v2, v2

    .line 81
    iput v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->h:F

    .line 82
    .line 83
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 84
    .line 85
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getWidth()I

    .line 86
    .line 87
    .line 88
    move-result v3

    .line 89
    int-to-float v3, v3

    .line 90
    invoke-virtual {v0}, Landroid/graphics/Bitmap;->getHeight()I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    int-to-float v0, v0

    .line 95
    invoke-virtual {v2, v1, v1, v3, v0}, Landroid/graphics/RectF;->set(FFFF)V

    .line 96
    .line 97
    .line 98
    goto/16 :goto_0

    .line 99
    .line 100
    :cond_0
    new-instance v4, Landroid/graphics/LinearGradient;

    .line 101
    .line 102
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 103
    .line 104
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 105
    .line 106
    .line 107
    move-result v7

    .line 108
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 109
    .line 110
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->a(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)[I

    .line 111
    .line 112
    .line 113
    move-result-object v9

    .line 114
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 115
    .line 116
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->d(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)[F

    .line 117
    .line 118
    .line 119
    move-result-object v10

    .line 120
    sget-object v11, Landroid/graphics/Shader$TileMode;->CLAMP:Landroid/graphics/Shader$TileMode;

    .line 121
    .line 122
    const/4 v5, 0x0

    .line 123
    const/4 v6, 0x0

    .line 124
    const/4 v8, 0x0

    .line 125
    invoke-direct/range {v4 .. v11}, Landroid/graphics/LinearGradient;-><init>(FFFF[I[FLandroid/graphics/Shader$TileMode;)V

    .line 126
    .line 127
    .line 128
    iput-object v4, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->e:Landroid/graphics/Shader;

    .line 129
    .line 130
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 131
    .line 132
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    cmpl-float v0, v0, v1

    .line 137
    .line 138
    iget-object v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 139
    .line 140
    const/high16 v3, 0x3f800000    # 1.0f

    .line 141
    .line 142
    const-wide v4, 0x400921fb54442d18L    # Math.PI

    .line 143
    .line 144
    .line 145
    .line 146
    .line 147
    const/high16 v6, 0x43340000    # 180.0f

    .line 148
    .line 149
    const-wide/16 v7, 0x0

    .line 150
    .line 151
    if-ltz v0, :cond_1

    .line 152
    .line 153
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    neg-float v0, v0

    .line 158
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->g:F

    .line 159
    .line 160
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 161
    .line 162
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    div-float/2addr v0, v6

    .line 167
    float-to-double v9, v0

    .line 168
    mul-double/2addr v9, v4

    .line 169
    double-to-float v0, v9

    .line 170
    mul-float/2addr v0, v3

    .line 171
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 172
    .line 173
    int-to-double v2, v2

    .line 174
    float-to-double v4, v0

    .line 175
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 176
    .line 177
    .line 178
    move-result-wide v9

    .line 179
    mul-double/2addr v2, v9

    .line 180
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 181
    .line 182
    .line 183
    move-result-wide v9

    .line 184
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 185
    .line 186
    int-to-double v11, v0

    .line 187
    mul-double/2addr v9, v11

    .line 188
    add-double/2addr v2, v9

    .line 189
    double-to-float v0, v2

    .line 190
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->h:F

    .line 191
    .line 192
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 193
    .line 194
    int-to-double v2, v0

    .line 195
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 196
    .line 197
    .line 198
    move-result-wide v9

    .line 199
    mul-double/2addr v2, v9

    .line 200
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 201
    .line 202
    .line 203
    move-result-wide v9

    .line 204
    mul-double/2addr v9, v7

    .line 205
    add-double/2addr v2, v9

    .line 206
    double-to-float v0, v2

    .line 207
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 208
    .line 209
    .line 210
    move-result-wide v2

    .line 211
    mul-double/2addr v2, v7

    .line 212
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 213
    .line 214
    .line 215
    move-result-wide v4

    .line 216
    iget v6, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 217
    .line 218
    int-to-double v6, v6

    .line 219
    mul-double/2addr v4, v6

    .line 220
    add-double/2addr v2, v4

    .line 221
    double-to-float v2, v2

    .line 222
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 223
    .line 224
    neg-float v0, v0

    .line 225
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 226
    .line 227
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 228
    .line 229
    .line 230
    move-result v4

    .line 231
    invoke-virtual {v3, v1, v0, v4, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 232
    .line 233
    .line 234
    goto :goto_0

    .line 235
    :cond_1
    invoke-static {v2}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    neg-float v0, v0

    .line 240
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->g:F

    .line 241
    .line 242
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 243
    .line 244
    invoke-static {v0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->h(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    neg-float v0, v0

    .line 249
    div-float/2addr v0, v6

    .line 250
    float-to-double v9, v0

    .line 251
    mul-double/2addr v9, v4

    .line 252
    double-to-float v0, v9

    .line 253
    mul-float/2addr v0, v3

    .line 254
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 255
    .line 256
    int-to-double v2, v2

    .line 257
    float-to-double v4, v0

    .line 258
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 259
    .line 260
    .line 261
    move-result-wide v9

    .line 262
    mul-double/2addr v2, v9

    .line 263
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 264
    .line 265
    .line 266
    move-result-wide v9

    .line 267
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 268
    .line 269
    int-to-double v11, v0

    .line 270
    mul-double/2addr v9, v11

    .line 271
    add-double/2addr v2, v9

    .line 272
    double-to-float v0, v2

    .line 273
    iput v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->h:F

    .line 274
    .line 275
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 276
    .line 277
    .line 278
    move-result-wide v2

    .line 279
    mul-double/2addr v2, v7

    .line 280
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 281
    .line 282
    .line 283
    move-result-wide v9

    .line 284
    iget v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 285
    .line 286
    int-to-double v11, v0

    .line 287
    mul-double/2addr v9, v11

    .line 288
    add-double/2addr v2, v9

    .line 289
    double-to-float v0, v2

    .line 290
    iget v2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 291
    .line 292
    int-to-double v2, v2

    .line 293
    invoke-static {v4, v5}, Ljava/lang/Math;->sin(D)D

    .line 294
    .line 295
    .line 296
    move-result-wide v9

    .line 297
    mul-double/2addr v2, v9

    .line 298
    invoke-static {v4, v5}, Ljava/lang/Math;->cos(D)D

    .line 299
    .line 300
    .line 301
    move-result-wide v4

    .line 302
    mul-double/2addr v4, v7

    .line 303
    add-double/2addr v2, v4

    .line 304
    double-to-float v2, v2

    .line 305
    iget-object v3, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->j:Landroid/graphics/RectF;

    .line 306
    .line 307
    neg-float v0, v0

    .line 308
    iget-object v4, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 309
    .line 310
    invoke-static {v4}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;->j(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;)F

    .line 311
    .line 312
    .line 313
    move-result v4

    .line 314
    invoke-virtual {v3, v1, v0, v4, v2}, Landroid/graphics/RectF;->set(FFFF)V

    .line 315
    .line 316
    .line 317
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->i:Landroid/graphics/Paint;

    .line 318
    .line 319
    iget-object p0, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->e:Landroid/graphics/Shader;

    .line 320
    .line 321
    invoke-virtual {v0, p0}, Landroid/graphics/Paint;->setShader(Landroid/graphics/Shader;)Landroid/graphics/Shader;

    .line 322
    .line 323
    .line 324
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->a:Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$b;

    .line 2
    .line 3
    iput p2, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b:I

    .line 4
    .line 5
    iput p3, p0, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->c:I

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/newui/view/ShimmerOptLayout$c;->b()V

    .line 8
    .line 9
    .line 10
    return-void
.end method
