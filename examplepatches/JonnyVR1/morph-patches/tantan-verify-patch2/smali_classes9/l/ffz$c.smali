.class public Ll/ffz$c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bm50;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/ffz;->T(IIZI)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field public a:Landroid/graphics/PointF;

.field public final synthetic b:Ll/ffz;


# direct methods
.method public constructor <init>(Ll/ffz;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 p1, 0x0

    .line 7
    iput-object p1, p0, Ll/ffz$c;->a:Landroid/graphics/PointF;

    .line 8
    .line 9
    return-void
.end method


# virtual methods
.method public dispatchTouchEvent(Landroid/view/MotionEvent;)Z
    .locals 8

    .line 1
    const/high16 v0, 0x40800000    # 4.0f

    .line 2
    .line 3
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-interface {v1}, Ll/r97;->E()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    const/4 v2, 0x1

    .line 20
    const/4 v3, 0x0

    .line 21
    if-eqz v1, :cond_2

    .line 22
    .line 23
    iget-object v1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 24
    .line 25
    invoke-static {v1}, Ll/ffz;->B(Ll/ffz;)Ll/vez;

    .line 26
    .line 27
    .line 28
    move-result-object v1

    .line 29
    invoke-virtual {v1}, Ll/j3z;->e0()Ll/mzl;

    .line 30
    .line 31
    .line 32
    move-result-object v1

    .line 33
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    invoke-virtual {v1}, Ll/clz;->e4()Z

    .line 38
    .line 39
    .line 40
    move-result v1

    .line 41
    if-eqz v1, :cond_0

    .line 42
    .line 43
    const/high16 v0, 0x41000000    # 8.0f

    .line 44
    .line 45
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    :cond_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    iget-object v4, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 54
    .line 55
    const/4 v5, 0x2

    .line 56
    if-eq v1, v5, :cond_1

    .line 57
    .line 58
    invoke-static {v4, v3}, Ll/ffz;->E(Ll/ffz;Z)V

    .line 59
    .line 60
    .line 61
    iget-object v1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 62
    .line 63
    invoke-static {v1, v3}, Ll/ffz;->C(Ll/ffz;Z)V

    .line 64
    .line 65
    .line 66
    goto :goto_0

    .line 67
    :cond_1
    invoke-static {v4}, Ll/ffz;->A(Ll/ffz;)Z

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    if-eqz v1, :cond_2

    .line 72
    .line 73
    return v2

    .line 74
    :cond_2
    :goto_0
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    if-nez v1, :cond_3

    .line 79
    .line 80
    new-instance v0, Landroid/graphics/PointF;

    .line 81
    .line 82
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 83
    .line 84
    .line 85
    move-result v1

    .line 86
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 87
    .line 88
    .line 89
    move-result p1

    .line 90
    invoke-direct {v0, v1, p1}, Landroid/graphics/PointF;-><init>(FF)V

    .line 91
    .line 92
    .line 93
    iput-object v0, p0, Ll/ffz$c;->a:Landroid/graphics/PointF;

    .line 94
    .line 95
    goto/16 :goto_3

    .line 96
    .line 97
    :cond_3
    iget-object v1, p0, Ll/ffz$c;->a:Landroid/graphics/PointF;

    .line 98
    .line 99
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v1

    .line 103
    if-eqz v1, :cond_9

    .line 104
    .line 105
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 106
    .line 107
    .line 108
    move-result v1

    .line 109
    if-eq v1, v2, :cond_9

    .line 110
    .line 111
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getAction()I

    .line 112
    .line 113
    .line 114
    move-result v1

    .line 115
    const/4 v4, 0x3

    .line 116
    if-eq v1, v4, :cond_9

    .line 117
    .line 118
    new-instance v1, Landroid/graphics/RectF;

    .line 119
    .line 120
    iget-object v4, p0, Ll/ffz$c;->a:Landroid/graphics/PointF;

    .line 121
    .line 122
    iget v5, v4, Landroid/graphics/PointF;->x:F

    .line 123
    .line 124
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 125
    .line 126
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 127
    .line 128
    .line 129
    move-result v6

    .line 130
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 131
    .line 132
    .line 133
    move-result v7

    .line 134
    invoke-direct {v1, v5, v4, v6, v7}, Landroid/graphics/RectF;-><init>(FFFF)V

    .line 135
    .line 136
    .line 137
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 138
    .line 139
    .line 140
    move-result v4

    .line 141
    invoke-virtual {v1}, Landroid/graphics/RectF;->width()F

    .line 142
    .line 143
    .line 144
    move-result v5

    .line 145
    mul-float/2addr v4, v5

    .line 146
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 147
    .line 148
    .line 149
    move-result v5

    .line 150
    invoke-virtual {v1}, Landroid/graphics/RectF;->height()F

    .line 151
    .line 152
    .line 153
    move-result v1

    .line 154
    mul-float/2addr v5, v1

    .line 155
    add-float/2addr v4, v5

    .line 156
    float-to-double v4, v4

    .line 157
    invoke-static {v4, v5}, Ljava/lang/Math;->sqrt(D)D

    .line 158
    .line 159
    .line 160
    move-result-wide v4

    .line 161
    double-to-float v1, v4

    .line 162
    int-to-float v0, v0

    .line 163
    cmpl-float v1, v1, v0

    .line 164
    .line 165
    if-lez v1, :cond_4

    .line 166
    .line 167
    move v1, v2

    .line 168
    goto :goto_1

    .line 169
    :cond_4
    move v1, v3

    .line 170
    :goto_1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 171
    .line 172
    .line 173
    move-result-object v4

    .line 174
    invoke-virtual {v4}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 175
    .line 176
    .line 177
    move-result-object v4

    .line 178
    invoke-interface {v4}, Ll/r97;->E()Z

    .line 179
    .line 180
    .line 181
    move-result v4

    .line 182
    if-eqz v4, :cond_6

    .line 183
    .line 184
    iget-object v4, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 185
    .line 186
    invoke-static {v4}, Ll/ffz;->B(Ll/ffz;)Ll/vez;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    invoke-virtual {v4}, Ll/j3z;->e0()Ll/mzl;

    .line 191
    .line 192
    .line 193
    move-result-object v4

    .line 194
    invoke-interface {v4}, Ll/mzl;->l()Ll/clz;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    invoke-virtual {v4}, Ll/clz;->e4()Z

    .line 199
    .line 200
    .line 201
    move-result v4

    .line 202
    if-eqz v4, :cond_6

    .line 203
    .line 204
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getY()F

    .line 205
    .line 206
    .line 207
    move-result v1

    .line 208
    iget-object v4, p0, Ll/ffz$c;->a:Landroid/graphics/PointF;

    .line 209
    .line 210
    iget v4, v4, Landroid/graphics/PointF;->y:F

    .line 211
    .line 212
    sub-float/2addr v1, v4

    .line 213
    invoke-static {v1}, Ljava/lang/Math;->abs(F)F

    .line 214
    .line 215
    .line 216
    move-result v1

    .line 217
    cmpl-float v0, v1, v0

    .line 218
    .line 219
    if-lez v0, :cond_5

    .line 220
    .line 221
    move v1, v2

    .line 222
    goto :goto_2

    .line 223
    :cond_5
    move v1, v3

    .line 224
    :cond_6
    :goto_2
    invoke-virtual {p1}, Landroid/view/MotionEvent;->getX()F

    .line 225
    .line 226
    .line 227
    move-result p1

    .line 228
    iget-object v0, p0, Ll/ffz$c;->a:Landroid/graphics/PointF;

    .line 229
    .line 230
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 231
    .line 232
    sub-float/2addr p1, v0

    .line 233
    invoke-static {p1}, Ljava/lang/Math;->abs(F)F

    .line 234
    .line 235
    .line 236
    move-result p1

    .line 237
    sget v0, Ll/qa00;->a:I

    .line 238
    .line 239
    int-to-float v0, v0

    .line 240
    cmpl-float p1, p1, v0

    .line 241
    .line 242
    if-lez p1, :cond_7

    .line 243
    .line 244
    iget-object p1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 245
    .line 246
    invoke-static {p1}, Ll/ffz;->B(Ll/ffz;)Ll/vez;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    iget-object p1, p1, Ll/qzz;->r1:Ll/hxy;

    .line 263
    .line 264
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 265
    .line 266
    .line 267
    move-result p1

    .line 268
    if-eqz p1, :cond_7

    .line 269
    .line 270
    iget-object p1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 271
    .line 272
    invoke-static {p1}, Ll/ffz;->B(Ll/ffz;)Ll/vez;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 277
    .line 278
    .line 279
    move-result-object p1

    .line 280
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 281
    .line 282
    .line 283
    move-result-object p1

    .line 284
    invoke-virtual {p1}, Ll/clz;->t7()Ll/qzz;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    iget-object p1, p1, Ll/qzz;->r1:Ll/hxy;

    .line 289
    .line 290
    iget-object p1, p1, Ll/hxy;->d:Landroidx/recyclerview/widget/RecyclerView;

    .line 291
    .line 292
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-eqz p1, :cond_7

    .line 297
    .line 298
    move v1, v3

    .line 299
    :cond_7
    if-eqz v1, :cond_9

    .line 300
    .line 301
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 302
    .line 303
    .line 304
    move-result-object p1

    .line 305
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    invoke-interface {p1}, Ll/r97;->E()Z

    .line 310
    .line 311
    .line 312
    move-result p1

    .line 313
    if-eqz p1, :cond_8

    .line 314
    .line 315
    iget-object p1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 316
    .line 317
    invoke-static {p1, v2}, Ll/ffz;->C(Ll/ffz;Z)V

    .line 318
    .line 319
    .line 320
    :cond_8
    iget-object p1, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 321
    .line 322
    const/4 v0, -0x1

    .line 323
    invoke-virtual {p1, v3, v0}, Ll/ffz;->k(II)V

    .line 324
    .line 325
    .line 326
    iget-object p0, p0, Ll/ffz$c;->b:Ll/ffz;

    .line 327
    .line 328
    invoke-static {p0}, Ll/ffz;->B(Ll/ffz;)Ll/vez;

    .line 329
    .line 330
    .line 331
    move-result-object p0

    .line 332
    invoke-virtual {p0}, Ll/j3z;->e0()Ll/mzl;

    .line 333
    .line 334
    .line 335
    move-result-object p0

    .line 336
    invoke-interface {p0}, Ll/mzl;->l()Ll/clz;

    .line 337
    .line 338
    .line 339
    move-result-object p0

    .line 340
    invoke-virtual {p0}, Ll/clz;->t7()Ll/qzz;

    .line 341
    .line 342
    .line 343
    move-result-object p0

    .line 344
    invoke-virtual {p0, v3}, Ll/qzz;->y0(Z)V

    .line 345
    .line 346
    .line 347
    :cond_9
    :goto_3
    return v3
.end method
