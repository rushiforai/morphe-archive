.class Ltv/danmaku/ijk/media/streamer/ScreenRender$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field final synthetic a:I

.field final synthetic b:I

.field final synthetic c:I

.field final synthetic d:Z

.field final synthetic e:Ltv/danmaku/ijk/media/streamer/ScreenRender;


# virtual methods
.method public run()V
    .locals 9

    .line 1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 2
    .line 3
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->e(Ltv/danmaku/ijk/media/streamer/ScreenRender;)V

    .line 4
    .line 5
    .line 6
    iget v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->a:I

    .line 7
    .line 8
    const/16 v1, 0x5a

    .line 9
    .line 10
    if-eq v0, v1, :cond_1

    .line 11
    .line 12
    const/16 v1, 0x10e

    .line 13
    .line 14
    if-ne v0, v1, :cond_0

    .line 15
    .line 16
    goto :goto_0

    .line 17
    :cond_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 18
    .line 19
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->b:I

    .line 20
    .line 21
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->i(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 22
    .line 23
    .line 24
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 25
    .line 26
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->c:I

    .line 27
    .line 28
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 29
    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    :goto_0
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 33
    .line 34
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->b:I

    .line 35
    .line 36
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 37
    .line 38
    .line 39
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 40
    .line 41
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->c:I

    .line 42
    .line 43
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->i(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 44
    .line 45
    .line 46
    :goto_1
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 47
    .line 48
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 49
    .line 50
    .line 51
    move-result v1

    .line 52
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 53
    .line 54
    .line 55
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 56
    .line 57
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    if-nez v0, :cond_2

    .line 62
    .line 63
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 64
    .line 65
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-nez v0, :cond_2

    .line 70
    .line 71
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 72
    .line 73
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 74
    .line 75
    .line 76
    move-result v1

    .line 77
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 78
    .line 79
    .line 80
    goto :goto_2

    .line 81
    :cond_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 82
    .line 83
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 84
    .line 85
    .line 86
    move-result v1

    .line 87
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 88
    .line 89
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 90
    .line 91
    .line 92
    move-result v2

    .line 93
    sub-int/2addr v1, v2

    .line 94
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 95
    .line 96
    .line 97
    :goto_2
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 98
    .line 99
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 100
    .line 101
    if-eqz v1, :cond_7

    .line 102
    .line 103
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    if-nez v0, :cond_6

    .line 108
    .line 109
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 110
    .line 111
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    if-nez v0, :cond_6

    .line 116
    .line 117
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 118
    .line 119
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l(Ltv/danmaku/ijk/media/streamer/ScreenRender;)Landroid/graphics/PointF;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iget v0, v0, Landroid/graphics/PointF;->x:F

    .line 124
    .line 125
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 126
    .line 127
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->l(Ltv/danmaku/ijk/media/streamer/ScreenRender;)Landroid/graphics/PointF;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    iget v1, v1, Landroid/graphics/PointF;->y:F

    .line 132
    .line 133
    div-float v2, v1, v0

    .line 134
    .line 135
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 136
    .line 137
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 138
    .line 139
    .line 140
    move-result v3

    .line 141
    int-to-float v3, v3

    .line 142
    iget-object v4, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 143
    .line 144
    invoke-static {v4}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 145
    .line 146
    .line 147
    move-result v4

    .line 148
    int-to-float v4, v4

    .line 149
    div-float/2addr v3, v4

    .line 150
    cmpg-float v2, v2, v3

    .line 151
    .line 152
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 153
    .line 154
    if-gtz v2, :cond_4

    .line 155
    .line 156
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    invoke-static {v3, v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 161
    .line 162
    .line 163
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 164
    .line 165
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 166
    .line 167
    .line 168
    move-result v2

    .line 169
    int-to-float v2, v2

    .line 170
    mul-float/2addr v2, v0

    .line 171
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 172
    .line 173
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 174
    .line 175
    .line 176
    move-result v3

    .line 177
    int-to-float v3, v3

    .line 178
    mul-float/2addr v3, v1

    .line 179
    cmpl-float v2, v2, v3

    .line 180
    .line 181
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 182
    .line 183
    if-eqz v2, :cond_3

    .line 184
    .line 185
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 186
    .line 187
    .line 188
    move-result v2

    .line 189
    float-to-int v1, v1

    .line 190
    mul-int/2addr v2, v1

    .line 191
    float-to-int v0, v0

    .line 192
    div-int/2addr v2, v0

    .line 193
    div-int/lit8 v2, v2, 0x10

    .line 194
    .line 195
    mul-int/lit8 v2, v2, 0x10

    .line 196
    .line 197
    invoke-static {v3, v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 198
    .line 199
    .line 200
    goto :goto_3

    .line 201
    :cond_3
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    invoke-static {v3, v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 206
    .line 207
    .line 208
    goto :goto_3

    .line 209
    :cond_4
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 210
    .line 211
    .line 212
    move-result v2

    .line 213
    invoke-static {v3, v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 214
    .line 215
    .line 216
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 217
    .line 218
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    int-to-float v2, v2

    .line 223
    mul-float/2addr v2, v0

    .line 224
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 225
    .line 226
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 227
    .line 228
    .line 229
    move-result v3

    .line 230
    int-to-float v3, v3

    .line 231
    mul-float/2addr v3, v1

    .line 232
    cmpl-float v2, v2, v3

    .line 233
    .line 234
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 235
    .line 236
    if-eqz v2, :cond_5

    .line 237
    .line 238
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 239
    .line 240
    .line 241
    move-result v2

    .line 242
    float-to-int v0, v0

    .line 243
    mul-int/2addr v2, v0

    .line 244
    float-to-int v0, v1

    .line 245
    div-int/2addr v2, v0

    .line 246
    div-int/lit8 v2, v2, 0x10

    .line 247
    .line 248
    mul-int/lit8 v2, v2, 0x10

    .line 249
    .line 250
    invoke-static {v3, v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 251
    .line 252
    .line 253
    goto :goto_3

    .line 254
    :cond_5
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    invoke-static {v3, v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 259
    .line 260
    .line 261
    goto :goto_3

    .line 262
    :cond_6
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 263
    .line 264
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 265
    .line 266
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->k(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 271
    .line 272
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->j(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 273
    .line 274
    .line 275
    move-result v2

    .line 276
    invoke-virtual {v1, v0, v2}, Ll/iej;->Q1(II)V

    .line 277
    .line 278
    .line 279
    :goto_3
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 280
    .line 281
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->f:Ll/iej;

    .line 282
    .line 283
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 288
    .line 289
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 290
    .line 291
    .line 292
    move-result v2

    .line 293
    invoke-virtual {v1, v0, v2}, Ll/wej;->setRenderSize(II)V

    .line 294
    .line 295
    .line 296
    :cond_7
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 297
    .line 298
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 299
    .line 300
    iget-boolean v1, v1, Ll/jfj;->a:Z

    .line 301
    .line 302
    if-eqz v1, :cond_a

    .line 303
    .line 304
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 305
    .line 306
    .line 307
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 308
    .line 309
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 310
    .line 311
    .line 312
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 313
    .line 314
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 315
    .line 316
    .line 317
    move-result v1

    .line 318
    int-to-double v1, v1

    .line 319
    const-wide/high16 v3, 0x3ff0000000000000L    # 1.0

    .line 320
    .line 321
    mul-double/2addr v1, v3

    .line 322
    iget-object v5, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 323
    .line 324
    invoke-static {v5}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m(Ltv/danmaku/ijk/media/streamer/ScreenRender;)F

    .line 325
    .line 326
    .line 327
    move-result v5

    .line 328
    float-to-double v5, v5

    .line 329
    mul-double/2addr v1, v5

    .line 330
    double-to-int v1, v1

    .line 331
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 332
    .line 333
    .line 334
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 335
    .line 336
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 337
    .line 338
    .line 339
    move-result v1

    .line 340
    int-to-double v1, v1

    .line 341
    mul-double/2addr v1, v3

    .line 342
    iget-object v3, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 343
    .line 344
    invoke-static {v3}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->m(Ltv/danmaku/ijk/media/streamer/ScreenRender;)F

    .line 345
    .line 346
    .line 347
    move-result v3

    .line 348
    float-to-double v3, v3

    .line 349
    mul-double/2addr v1, v3

    .line 350
    double-to-int v1, v1

    .line 351
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 352
    .line 353
    .line 354
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 355
    .line 356
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 357
    .line 358
    .line 359
    move-result v0

    .line 360
    const/16 v1, 0xa0

    .line 361
    .line 362
    if-ge v0, v1, :cond_8

    .line 363
    .line 364
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 365
    .line 366
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->b(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 367
    .line 368
    .line 369
    :cond_8
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 370
    .line 371
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 372
    .line 373
    .line 374
    move-result v0

    .line 375
    if-ge v0, v1, :cond_9

    .line 376
    .line 377
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 378
    .line 379
    invoke-static {v0, v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d(Ltv/danmaku/ijk/media/streamer/ScreenRender;I)I

    .line 380
    .line 381
    .line 382
    :cond_9
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 383
    .line 384
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->g:Ll/jfj;

    .line 385
    .line 386
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 391
    .line 392
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 393
    .line 394
    .line 395
    move-result v2

    .line 396
    invoke-virtual {v1, v0, v2}, Ll/wej;->setRenderSize(II)V

    .line 397
    .line 398
    .line 399
    :cond_a
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 400
    .line 401
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 402
    .line 403
    if-eqz v1, :cond_b

    .line 404
    .line 405
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 406
    .line 407
    .line 408
    move-result v6

    .line 409
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 410
    .line 411
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 412
    .line 413
    .line 414
    move-result v7

    .line 415
    const/4 v8, 0x0

    .line 416
    const-wide/16 v2, 0x0

    .line 417
    .line 418
    const/4 v4, 0x0

    .line 419
    const/4 v5, 0x0

    .line 420
    invoke-virtual/range {v1 .. v8}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->y2(JIIIII)V

    .line 421
    .line 422
    .line 423
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 424
    .line 425
    iget-object v1, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->h:Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;

    .line 426
    .line 427
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 428
    .line 429
    .line 430
    move-result v0

    .line 431
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 432
    .line 433
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 434
    .line 435
    .line 436
    move-result v2

    .line 437
    invoke-virtual {v1, v0, v2}, Ltv/danmaku/ijk/media/processing/GLMergeTextureFilter;->setRenderSize(II)V

    .line 438
    .line 439
    .line 440
    :cond_b
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 441
    .line 442
    invoke-static {v0}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->n(Ltv/danmaku/ijk/media/streamer/ScreenRender;)Ll/zej;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 447
    .line 448
    invoke-static {v1}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->a(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 449
    .line 450
    .line 451
    move-result v1

    .line 452
    iget-object v2, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 453
    .line 454
    invoke-static {v2}, Ltv/danmaku/ijk/media/streamer/ScreenRender;->c(Ltv/danmaku/ijk/media/streamer/ScreenRender;)I

    .line 455
    .line 456
    .line 457
    move-result v2

    .line 458
    invoke-virtual {v0, v1, v2}, Ll/zej;->setRenderSize(II)V

    .line 459
    .line 460
    .line 461
    iget-boolean v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->d:Z

    .line 462
    .line 463
    iget-object v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 464
    .line 465
    if-eqz v0, :cond_c

    .line 466
    .line 467
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 468
    .line 469
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->a:I

    .line 470
    .line 471
    rsub-int v1, v1, 0x168

    .line 472
    .line 473
    invoke-virtual {v0, v1}, Ll/qnw;->changeCurRotation(I)V

    .line 474
    .line 475
    .line 476
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 477
    .line 478
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 479
    .line 480
    const/4 v1, 0x2

    .line 481
    invoke-virtual {v0, v1}, Ll/qnw;->flipPosition(I)V

    .line 482
    .line 483
    .line 484
    goto :goto_4

    .line 485
    :cond_c
    iget-object v0, v1, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 486
    .line 487
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->a:I

    .line 488
    .line 489
    invoke-virtual {v0, v1}, Ll/qnw;->changeCurRotation(I)V

    .line 490
    .line 491
    .line 492
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 493
    .line 494
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 495
    .line 496
    const/4 v1, 0x1

    .line 497
    invoke-virtual {v0, v1}, Ll/qnw;->flipPosition(I)V

    .line 498
    .line 499
    .line 500
    :goto_4
    iget-object v0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->e:Ltv/danmaku/ijk/media/streamer/ScreenRender;

    .line 501
    .line 502
    iget-object v0, v0, Ltv/danmaku/ijk/media/streamer/ScreenRender;->d:Ll/qnw;

    .line 503
    .line 504
    iget v1, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->b:I

    .line 505
    .line 506
    iget p0, p0, Ltv/danmaku/ijk/media/streamer/ScreenRender$2;->c:I

    .line 507
    .line 508
    invoke-virtual {v0, v1, p0}, Ll/qnw;->setRenderSize(II)V

    .line 509
    .line 510
    .line 511
    return-void
.end method
