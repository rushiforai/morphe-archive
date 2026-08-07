.class public Ll/mo0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:F

.field public b:F

.field public c:F

.field public d:F

.field public e:F

.field public f:F

.field public g:F

.field public h:F

.field public i:F

.field public j:F

.field public k:F

.field public l:F


# direct methods
.method public constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/high16 v0, 0x3f800000    # 1.0f

    .line 5
    .line 6
    iput v0, p0, Ll/mo0;->i:F

    .line 7
    .line 8
    iput v0, p0, Ll/mo0;->j:F

    .line 9
    .line 10
    const/4 v1, 0x0

    .line 11
    iput v1, p0, Ll/mo0;->k:F

    .line 12
    .line 13
    iput v0, p0, Ll/mo0;->l:F

    .line 14
    .line 15
    return-void
.end method


# virtual methods
.method public a(F)F
    .locals 2

    .line 1
    iget v0, p0, Ll/mo0;->c:F

    .line 2
    .line 3
    iget v1, p0, Ll/mo0;->d:F

    .line 4
    .line 5
    sub-float/2addr v1, v0

    .line 6
    mul-float/2addr v1, p1

    .line 7
    add-float/2addr v0, v1

    .line 8
    iget v1, p0, Ll/mo0;->a:F

    .line 9
    .line 10
    iget p0, p0, Ll/mo0;->b:F

    .line 11
    .line 12
    sub-float/2addr p0, v1

    .line 13
    mul-float/2addr p0, p1

    .line 14
    add-float/2addr v1, p0

    .line 15
    mul-float/2addr v0, v0

    .line 16
    mul-float/2addr v1, v1

    .line 17
    add-float/2addr v0, v1

    .line 18
    float-to-double p0, v0

    .line 19
    invoke-static {p0, p1}, Ljava/lang/Math;->sqrt(D)D

    .line 20
    .line 21
    .line 22
    move-result-wide p0

    .line 23
    double-to-float p0, p0

    .line 24
    return p0
.end method

.method public b()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/mo0;->b:F

    .line 3
    .line 4
    iput v0, p0, Ll/mo0;->d:F

    .line 5
    .line 6
    const/high16 v1, 0x3f800000    # 1.0f

    .line 7
    .line 8
    iput v1, p0, Ll/mo0;->f:F

    .line 9
    .line 10
    iput v0, p0, Ll/mo0;->h:F

    .line 11
    .line 12
    iput v1, p0, Ll/mo0;->j:F

    .line 13
    .line 14
    iput v0, p0, Ll/mo0;->l:F

    .line 15
    .line 16
    return-void
.end method

.method public c(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FFFF)V
    .locals 8

    .line 1
    const/4 v7, 0x0

    .line 2
    move-object v0, p0

    .line 3
    move-object v1, p1

    .line 4
    move-object v2, p2

    .line 5
    move v3, p3

    .line 6
    move v4, p4

    .line 7
    move v5, p5

    .line 8
    move v6, p6

    .line 9
    invoke-virtual/range {v0 .. v7}, Ll/mo0;->d(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FFFFZ)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(Landroid/view/View;Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;FFFFZ)V
    .locals 4

    .line 1
    sget-object p5, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_RIGHT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 2
    .line 3
    const/high16 p6, 0x42480000    # 50.0f

    .line 4
    .line 5
    const/high16 v0, 0x3fa00000    # 1.25f

    .line 6
    .line 7
    const/high16 v1, -0x40800000    # -1.0f

    .line 8
    .line 9
    const/high16 v2, 0x3f800000    # 1.0f

    .line 10
    .line 11
    const/4 v3, 0x0

    .line 12
    if-ne p2, p5, :cond_6

    .line 13
    .line 14
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 15
    .line 16
    .line 17
    move-result p2

    .line 18
    int-to-float p2, p2

    .line 19
    mul-float/2addr p2, v0

    .line 20
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 21
    .line 22
    .line 23
    move-result p5

    .line 24
    add-float/2addr p5, p3

    .line 25
    invoke-static {p2, p5}, Ljava/lang/Math;->max(FF)F

    .line 26
    .line 27
    .line 28
    move-result p2

    .line 29
    iput p2, p0, Ll/mo0;->d:F

    .line 30
    .line 31
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    iput p2, p0, Ll/mo0;->b:F

    .line 36
    .line 37
    iget p2, p0, Ll/mo0;->d:F

    .line 38
    .line 39
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 40
    .line 41
    .line 42
    move-result p2

    .line 43
    if-eqz p2, :cond_0

    .line 44
    .line 45
    iput v3, p0, Ll/mo0;->b:F

    .line 46
    .line 47
    :cond_0
    iget p2, p0, Ll/mo0;->b:F

    .line 48
    .line 49
    cmpl-float p2, p2, v3

    .line 50
    .line 51
    if-eqz p2, :cond_f

    .line 52
    .line 53
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 54
    .line 55
    .line 56
    move-result p2

    .line 57
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 58
    .line 59
    .line 60
    move-result p3

    .line 61
    int-to-float p3, p3

    .line 62
    cmpg-float p2, p2, p3

    .line 63
    .line 64
    if-gez p2, :cond_2

    .line 65
    .line 66
    iget p2, p0, Ll/mo0;->b:F

    .line 67
    .line 68
    cmpl-float p3, p4, v3

    .line 69
    .line 70
    if-lez p3, :cond_1

    .line 71
    .line 72
    move v1, v2

    .line 73
    :cond_1
    invoke-static {}, Ll/pzi0;->o()J

    .line 74
    .line 75
    .line 76
    move-result-wide p3

    .line 77
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 78
    .line 79
    .line 80
    move-result p5

    .line 81
    int-to-long p5, p5

    .line 82
    rem-long/2addr p3, p5

    .line 83
    long-to-float p3, p3

    .line 84
    mul-float/2addr v1, p3

    .line 85
    add-float/2addr p2, v1

    .line 86
    iput p2, p0, Ll/mo0;->b:F

    .line 87
    .line 88
    goto/16 :goto_0

    .line 89
    .line 90
    :cond_2
    if-eqz p7, :cond_4

    .line 91
    .line 92
    iget p2, p0, Ll/mo0;->b:F

    .line 93
    .line 94
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 95
    .line 96
    .line 97
    move-result p3

    .line 98
    int-to-float p3, p3

    .line 99
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 100
    .line 101
    .line 102
    move-result p5

    .line 103
    invoke-static {p3, p5}, Ljava/lang/Math;->min(FF)F

    .line 104
    .line 105
    .line 106
    move-result p3

    .line 107
    cmpl-float p4, p4, v3

    .line 108
    .line 109
    if-lez p4, :cond_3

    .line 110
    .line 111
    move v1, v2

    .line 112
    :cond_3
    mul-float/2addr p3, v1

    .line 113
    add-float/2addr p2, p3

    .line 114
    iput p2, p0, Ll/mo0;->b:F

    .line 115
    .line 116
    goto/16 :goto_0

    .line 117
    .line 118
    :cond_4
    cmpl-float p2, p4, v3

    .line 119
    .line 120
    iget p3, p0, Ll/mo0;->b:F

    .line 121
    .line 122
    if-lez p2, :cond_5

    .line 123
    .line 124
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 125
    .line 126
    .line 127
    move-result p2

    .line 128
    int-to-float p2, p2

    .line 129
    invoke-static {p2, p4}, Ljava/lang/Math;->min(FF)F

    .line 130
    .line 131
    .line 132
    move-result p2

    .line 133
    sget p4, Ll/vo0;->r:F

    .line 134
    .line 135
    div-float/2addr p2, p4

    .line 136
    add-float/2addr p3, p2

    .line 137
    iput p3, p0, Ll/mo0;->b:F

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_5
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 142
    .line 143
    .line 144
    move-result p2

    .line 145
    neg-int p2, p2

    .line 146
    int-to-float p2, p2

    .line 147
    invoke-static {p2, p4}, Ljava/lang/Math;->max(FF)F

    .line 148
    .line 149
    .line 150
    move-result p2

    .line 151
    sget p4, Ll/vo0;->r:F

    .line 152
    .line 153
    div-float/2addr p2, p4

    .line 154
    add-float/2addr p3, p2

    .line 155
    iput p3, p0, Ll/mo0;->b:F

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_6
    sget-object p5, Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;->SWIPE_LEFT:Lcom/p1/mobile/putong/core/newui/home/opt/CardOperation;

    .line 160
    .line 161
    if-ne p2, p5, :cond_d

    .line 162
    .line 163
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 164
    .line 165
    .line 166
    move-result p2

    .line 167
    invoke-static {p2}, Ljava/lang/Math;->abs(F)F

    .line 168
    .line 169
    .line 170
    move-result p2

    .line 171
    add-float/2addr p2, p3

    .line 172
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    .line 173
    .line 174
    .line 175
    move-result p3

    .line 176
    int-to-float p3, p3

    .line 177
    mul-float/2addr p3, v0

    .line 178
    invoke-static {p2, p3}, Ljava/lang/Math;->max(FF)F

    .line 179
    .line 180
    .line 181
    move-result p2

    .line 182
    mul-float/2addr p2, v1

    .line 183
    iput p2, p0, Ll/mo0;->d:F

    .line 184
    .line 185
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 186
    .line 187
    .line 188
    move-result p2

    .line 189
    iput p2, p0, Ll/mo0;->b:F

    .line 190
    .line 191
    iget p2, p0, Ll/mo0;->d:F

    .line 192
    .line 193
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 194
    .line 195
    .line 196
    move-result p2

    .line 197
    if-eqz p2, :cond_7

    .line 198
    .line 199
    iput v3, p0, Ll/mo0;->b:F

    .line 200
    .line 201
    :cond_7
    iget p2, p0, Ll/mo0;->b:F

    .line 202
    .line 203
    cmpl-float p2, p2, v3

    .line 204
    .line 205
    if-eqz p2, :cond_f

    .line 206
    .line 207
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 208
    .line 209
    .line 210
    move-result p2

    .line 211
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 212
    .line 213
    .line 214
    move-result p3

    .line 215
    int-to-float p3, p3

    .line 216
    cmpg-float p2, p2, p3

    .line 217
    .line 218
    if-gez p2, :cond_9

    .line 219
    .line 220
    iget p2, p0, Ll/mo0;->b:F

    .line 221
    .line 222
    cmpl-float p3, p4, v3

    .line 223
    .line 224
    if-lez p3, :cond_8

    .line 225
    .line 226
    move v1, v2

    .line 227
    :cond_8
    invoke-static {}, Ll/pzi0;->o()J

    .line 228
    .line 229
    .line 230
    move-result-wide p3

    .line 231
    invoke-static {p6}, Ll/qa00;->d(F)I

    .line 232
    .line 233
    .line 234
    move-result p5

    .line 235
    int-to-long p5, p5

    .line 236
    rem-long/2addr p3, p5

    .line 237
    long-to-float p3, p3

    .line 238
    mul-float/2addr v1, p3

    .line 239
    add-float/2addr p2, v1

    .line 240
    iput p2, p0, Ll/mo0;->b:F

    .line 241
    .line 242
    goto :goto_0

    .line 243
    :cond_9
    if-eqz p7, :cond_b

    .line 244
    .line 245
    iget p2, p0, Ll/mo0;->b:F

    .line 246
    .line 247
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 248
    .line 249
    .line 250
    move-result p3

    .line 251
    int-to-float p3, p3

    .line 252
    invoke-static {p4}, Ljava/lang/Math;->abs(F)F

    .line 253
    .line 254
    .line 255
    move-result p5

    .line 256
    invoke-static {p3, p5}, Ljava/lang/Math;->min(FF)F

    .line 257
    .line 258
    .line 259
    move-result p3

    .line 260
    cmpl-float p4, p4, v3

    .line 261
    .line 262
    if-lez p4, :cond_a

    .line 263
    .line 264
    move v1, v2

    .line 265
    :cond_a
    mul-float/2addr p3, v1

    .line 266
    add-float/2addr p2, p3

    .line 267
    iput p2, p0, Ll/mo0;->b:F

    .line 268
    .line 269
    goto :goto_0

    .line 270
    :cond_b
    cmpl-float p2, p4, v3

    .line 271
    .line 272
    iget p3, p0, Ll/mo0;->b:F

    .line 273
    .line 274
    if-lez p2, :cond_c

    .line 275
    .line 276
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 277
    .line 278
    .line 279
    move-result p2

    .line 280
    int-to-float p2, p2

    .line 281
    invoke-static {p2, p4}, Ljava/lang/Math;->min(FF)F

    .line 282
    .line 283
    .line 284
    move-result p2

    .line 285
    sget p4, Ll/vo0;->r:F

    .line 286
    .line 287
    div-float/2addr p2, p4

    .line 288
    add-float/2addr p3, p2

    .line 289
    iput p3, p0, Ll/mo0;->b:F

    .line 290
    .line 291
    goto :goto_0

    .line 292
    :cond_c
    invoke-virtual {p1}, Landroid/view/View;->getHeight()I

    .line 293
    .line 294
    .line 295
    move-result p2

    .line 296
    neg-int p2, p2

    .line 297
    int-to-float p2, p2

    .line 298
    invoke-static {p2, p4}, Ljava/lang/Math;->max(FF)F

    .line 299
    .line 300
    .line 301
    move-result p2

    .line 302
    sget p4, Ll/vo0;->r:F

    .line 303
    .line 304
    div-float/2addr p2, p4

    .line 305
    add-float/2addr p3, p2

    .line 306
    iput p3, p0, Ll/mo0;->b:F

    .line 307
    .line 308
    goto :goto_0

    .line 309
    :cond_d
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredHeight()I

    .line 310
    .line 311
    .line 312
    move-result p2

    .line 313
    int-to-float p2, p2

    .line 314
    const/high16 p3, -0x40400000    # -1.5f

    .line 315
    .line 316
    mul-float/2addr p2, p3

    .line 317
    iput p2, p0, Ll/mo0;->b:F

    .line 318
    .line 319
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 320
    .line 321
    .line 322
    move-result p2

    .line 323
    iput p2, p0, Ll/mo0;->c:F

    .line 324
    .line 325
    invoke-static {p2}, Ljava/lang/Float;->isNaN(F)Z

    .line 326
    .line 327
    .line 328
    move-result p2

    .line 329
    if-eqz p2, :cond_e

    .line 330
    .line 331
    iput v3, p0, Ll/mo0;->c:F

    .line 332
    .line 333
    :cond_e
    iget p2, p0, Ll/mo0;->c:F

    .line 334
    .line 335
    iput p2, p0, Ll/mo0;->d:F

    .line 336
    .line 337
    :cond_f
    :goto_0
    iput v2, p0, Ll/mo0;->f:F

    .line 338
    .line 339
    invoke-virtual {p1}, Landroid/view/View;->getRotation()F

    .line 340
    .line 341
    .line 342
    move-result p1

    .line 343
    const p2, 0x3f99999a    # 1.2f

    .line 344
    .line 345
    .line 346
    mul-float/2addr p1, p2

    .line 347
    iput p1, p0, Ll/mo0;->h:F

    .line 348
    .line 349
    iput v2, p0, Ll/mo0;->l:F

    .line 350
    .line 351
    return-void
.end method

.method public e(Landroid/view/View;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    iput v0, p0, Ll/mo0;->a:F

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    iput v0, p0, Ll/mo0;->c:F

    .line 12
    .line 13
    invoke-virtual {p1}, Landroid/view/View;->getScaleX()F

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    iput v0, p0, Ll/mo0;->e:F

    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/view/View;->getRotation()F

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    iput v0, p0, Ll/mo0;->g:F

    .line 24
    .line 25
    invoke-virtual {p1}, Landroid/view/View;->getAlpha()F

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    iput v0, p0, Ll/mo0;->i:F

    .line 30
    .line 31
    iget v0, p0, Ll/mo0;->a:F

    .line 32
    .line 33
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    const/4 v1, 0x0

    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iput v1, p0, Ll/mo0;->a:F

    .line 41
    .line 42
    :cond_0
    iget v0, p0, Ll/mo0;->c:F

    .line 43
    .line 44
    invoke-static {v0}, Ljava/lang/Float;->isNaN(F)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_1

    .line 49
    .line 50
    iput v1, p0, Ll/mo0;->c:F

    .line 51
    .line 52
    :cond_1
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    invoke-virtual {p1}, Landroid/view/View;->getTranslationX()F

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    mul-float/2addr v0, v1

    .line 61
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 62
    .line 63
    .line 64
    move-result v1

    .line 65
    invoke-virtual {p1}, Landroid/view/View;->getTranslationY()F

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    mul-float/2addr v1, p1

    .line 70
    add-float/2addr v0, v1

    .line 71
    float-to-double v0, v0

    .line 72
    invoke-static {v0, v1}, Ljava/lang/Math;->sqrt(D)D

    .line 73
    .line 74
    .line 75
    move-result-wide v0

    .line 76
    double-to-float p1, v0

    .line 77
    sget v0, Ll/vo0;->t:F

    .line 78
    .line 79
    div-float/2addr p1, v0

    .line 80
    iput p1, p0, Ll/mo0;->k:F

    .line 81
    .line 82
    return-void
.end method
