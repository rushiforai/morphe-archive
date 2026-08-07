.class Ltech/sud/runtime/core/b$2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ltech/sud/runtime/core/b;->emit(IIILjava/lang/String;)Ljava/lang/Object;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:I

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:I

.field final synthetic d:I

.field final synthetic e:Ltech/sud/runtime/core/b;


# direct methods
.method public constructor <init>(Ltech/sud/runtime/core/b;ILjava/lang/String;II)V
    .locals 0

    .line 1
    iput-object p1, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 2
    .line 3
    iput p2, p0, Ltech/sud/runtime/core/b$2;->a:I

    .line 4
    .line 5
    iput-object p3, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput p4, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 8
    .line 9
    iput p5, p0, Ltech/sud/runtime/core/b$2;->d:I

    .line 10
    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 12
    .line 13
    .line 14
    return-void
.end method


# virtual methods
.method public run()V
    .locals 10

    .line 1
    :try_start_0
    iget v0, p0, Ltech/sud/runtime/core/b$2;->a:I

    .line 2
    .line 3
    const/16 v1, 0x1b

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    const/4 v3, 0x1

    .line 7
    if-eq v0, v1, :cond_5

    .line 8
    .line 9
    const/16 v1, 0x1c

    .line 10
    .line 11
    if-eq v0, v1, :cond_4

    .line 12
    .line 13
    const/16 v1, 0x20

    .line 14
    .line 15
    if-eq v0, v1, :cond_3

    .line 16
    .line 17
    packed-switch v0, :pswitch_data_0

    .line 18
    .line 19
    .line 20
    goto/16 :goto_0

    .line 21
    .line 22
    :pswitch_0
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 23
    .line 24
    invoke-static {v0}, Ltech/sud/runtime/core/b;->g(Ltech/sud/runtime/core/b;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 31
    .line 32
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/c;->a(Landroid/app/Activity;Ljava/lang/String;)V

    .line 39
    .line 40
    .line 41
    return-void

    .line 42
    :pswitch_1
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 43
    .line 44
    invoke-static {v0}, Ltech/sud/runtime/core/b;->g(Ltech/sud/runtime/core/b;)Z

    .line 45
    .line 46
    .line 47
    move-result v0

    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 51
    .line 52
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 57
    .line 58
    iget p0, p0, Ltech/sud/runtime/core/b$2;->d:I

    .line 59
    .line 60
    invoke-static {v0, v1, p0}, Ltech/sud/runtime/component/c/c;->a(Landroid/app/Activity;II)V

    .line 61
    .line 62
    .line 63
    return-void

    .line 64
    :pswitch_2
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 65
    .line 66
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 67
    .line 68
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->d()Ltech/sud/runtime/component/e/b;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 73
    .line 74
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/e/b;->b(Ljava/lang/String;)V

    .line 75
    .line 76
    .line 77
    return-void

    .line 78
    :pswitch_3
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 79
    .line 80
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 81
    .line 82
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->d()Ltech/sud/runtime/component/e/b;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 87
    .line 88
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/e/b;->a(Ljava/lang/String;)V

    .line 89
    .line 90
    .line 91
    return-void

    .line 92
    :pswitch_4
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 93
    .line 94
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 95
    .line 96
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->b()Ltech/sud/runtime/component/e/d;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 101
    .line 102
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/e/d;->a(Ljava/lang/String;)V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :pswitch_5
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 107
    .line 108
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 109
    .line 110
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->b()Ltech/sud/runtime/component/e/d;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iget-object v1, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 115
    .line 116
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 117
    .line 118
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/e/d;->a(Ljava/lang/String;I)V

    .line 119
    .line 120
    .line 121
    return-void

    .line 122
    :pswitch_6
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 123
    .line 124
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 125
    .line 126
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->b()Ltech/sud/runtime/component/e/d;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {v0}, Ltech/sud/runtime/component/e/d;->b()V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 134
    .line 135
    new-instance v1, Ltech/sud/runtime/core/b$2$1;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ltech/sud/runtime/core/b$2$1;-><init>(Ltech/sud/runtime/core/b$2;)V

    .line 138
    .line 139
    .line 140
    const-wide/16 v2, 0x1f4

    .line 141
    .line 142
    invoke-virtual {v0, v1, v2, v3}, Ltech/sud/runtime/core/b;->a(Ljava/lang/Runnable;J)V

    .line 143
    .line 144
    .line 145
    return-void

    .line 146
    :pswitch_7
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 147
    .line 148
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 149
    .line 150
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->c()Ltech/sud/runtime/core/i;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    invoke-virtual {v0, v2}, Ltech/sud/runtime/core/i;->a(Z)V

    .line 155
    .line 156
    .line 157
    new-instance v0, Lorg/json/JSONArray;

    .line 158
    .line 159
    iget-object v1, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 160
    .line 161
    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 162
    .line 163
    .line 164
    iget-object v1, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 165
    .line 166
    iget-object v1, v1, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 167
    .line 168
    invoke-virtual {v1}, Ltech/sud/runtime/core/a;->b()Ltech/sud/runtime/component/e/d;

    .line 169
    .line 170
    .line 171
    move-result-object v4

    .line 172
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v5

    .line 180
    iget v6, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 181
    .line 182
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->optDouble(I)D

    .line 183
    .line 184
    .line 185
    move-result-wide v1

    .line 186
    double-to-float v7, v1

    .line 187
    const/4 p0, 0x2

    .line 188
    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->optDouble(I)D

    .line 189
    .line 190
    .line 191
    move-result-wide v1

    .line 192
    double-to-float v8, v1

    .line 193
    const/4 p0, 0x3

    .line 194
    invoke-virtual {v0, p0}, Lorg/json/JSONArray;->optBoolean(I)Z

    .line 195
    .line 196
    .line 197
    move-result v9

    .line 198
    invoke-virtual/range {v4 .. v9}, Ltech/sud/runtime/component/e/d;->a(Ljava/lang/String;IFFZ)V

    .line 199
    .line 200
    .line 201
    return-void

    .line 202
    :pswitch_8
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 203
    .line 204
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 205
    .line 206
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 207
    .line 208
    .line 209
    move-result-object v0

    .line 210
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 211
    .line 212
    iget p0, p0, Ltech/sud/runtime/core/b$2;->d:I

    .line 213
    .line 214
    int-to-float p0, p0

    .line 215
    const v2, 0x3c23d70a    # 0.01f

    .line 216
    .line 217
    .line 218
    mul-float/2addr p0, v2

    .line 219
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/i/b;->a(IF)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :pswitch_9
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 224
    .line 225
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 226
    .line 227
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 228
    .line 229
    .line 230
    move-result-object v0

    .line 231
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 232
    .line 233
    iget p0, p0, Ltech/sud/runtime/core/b$2;->d:I

    .line 234
    .line 235
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/i/b;->a(II)V

    .line 236
    .line 237
    .line 238
    return-void

    .line 239
    :pswitch_a
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 240
    .line 241
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 242
    .line 243
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 244
    .line 245
    .line 246
    move-result-object v0

    .line 247
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 248
    .line 249
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/i/b;->c(I)V

    .line 250
    .line 251
    .line 252
    return-void

    .line 253
    :pswitch_b
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 254
    .line 255
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 256
    .line 257
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 262
    .line 263
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/i/b;->b(I)V

    .line 264
    .line 265
    .line 266
    return-void

    .line 267
    :pswitch_c
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 268
    .line 269
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 270
    .line 271
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 276
    .line 277
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 278
    .line 279
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/i/b;->a(ILjava/lang/String;)V

    .line 280
    .line 281
    .line 282
    return-void

    .line 283
    :pswitch_d
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 284
    .line 285
    iget-boolean v1, v0, Ltech/sud/runtime/core/b;->b:Z

    .line 286
    .line 287
    if-eqz v1, :cond_0

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :cond_0
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 292
    .line 293
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 294
    .line 295
    .line 296
    move-result-object v0

    .line 297
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 298
    .line 299
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/i/b;->a(I)V

    .line 300
    .line 301
    .line 302
    return-void

    .line 303
    :pswitch_e
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 304
    .line 305
    iget-boolean v1, v0, Ltech/sud/runtime/core/b;->b:Z

    .line 306
    .line 307
    if-eqz v1, :cond_1

    .line 308
    .line 309
    goto/16 :goto_0

    .line 310
    .line 311
    :cond_1
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 312
    .line 313
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->a()Ltech/sud/runtime/component/i/b;

    .line 314
    .line 315
    .line 316
    move-result-object v0

    .line 317
    invoke-static {}, Ltech/sud/runtime/core/b;->b()Landroid/content/Context;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 322
    .line 323
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/i/b;->a(Landroid/content/Context;I)V

    .line 324
    .line 325
    .line 326
    return-void

    .line 327
    :pswitch_f
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 328
    .line 329
    invoke-static {v0}, Ltech/sud/runtime/core/b;->f(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/i;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    if-eqz v0, :cond_2

    .line 334
    .line 335
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 336
    .line 337
    invoke-static {v0}, Ltech/sud/runtime/core/b;->f(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/i;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 342
    .line 343
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/c/i;->a(I)V

    .line 344
    .line 345
    .line 346
    return-void

    .line 347
    :pswitch_10
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 348
    .line 349
    invoke-static {v0}, Ltech/sud/runtime/core/b;->f(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/i;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    if-eqz v0, :cond_2

    .line 354
    .line 355
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 356
    .line 357
    invoke-static {v0}, Ltech/sud/runtime/core/b;->f(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/i;

    .line 358
    .line 359
    .line 360
    move-result-object v0

    .line 361
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 362
    .line 363
    iget p0, p0, Ltech/sud/runtime/core/b$2;->d:I

    .line 364
    .line 365
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/c/i;->a(II)V

    .line 366
    .line 367
    .line 368
    return-void

    .line 369
    :pswitch_11
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 370
    .line 371
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 372
    .line 373
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->i()Ltech/sud/runtime/component/a/a;

    .line 374
    .line 375
    .line 376
    move-result-object v0

    .line 377
    if-eqz v0, :cond_2

    .line 378
    .line 379
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 380
    .line 381
    iget v2, p0, Ltech/sud/runtime/core/b$2;->d:I

    .line 382
    .line 383
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 384
    .line 385
    invoke-virtual {v0, v1, v2, p0}, Ltech/sud/runtime/component/a/a;->a(IILjava/lang/String;)V

    .line 386
    .line 387
    .line 388
    return-void

    .line 389
    :pswitch_12
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 390
    .line 391
    iget-object v0, v0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 392
    .line 393
    invoke-virtual {v0}, Ltech/sud/runtime/core/a;->i()Ltech/sud/runtime/component/a/a;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    if-eqz v0, :cond_2

    .line 398
    .line 399
    iget v1, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 400
    .line 401
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 402
    .line 403
    invoke-virtual {v0, v1, p0}, Ltech/sud/runtime/component/a/a;->a(ILjava/lang/String;)V

    .line 404
    .line 405
    .line 406
    return-void

    .line 407
    :pswitch_13
    new-instance v0, Lorg/json/JSONArray;

    .line 408
    .line 409
    iget-object v1, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 410
    .line 411
    invoke-direct {v0, v1}, Lorg/json/JSONArray;-><init>(Ljava/lang/String;)V

    .line 412
    .line 413
    .line 414
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 415
    .line 416
    invoke-static {p0}, Ltech/sud/runtime/core/b;->e(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/d/a;

    .line 417
    .line 418
    .line 419
    move-result-object p0

    .line 420
    invoke-virtual {v0, v2}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object v1

    .line 424
    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v1

    .line 428
    invoke-virtual {v0, v3}, Lorg/json/JSONArray;->opt(I)Ljava/lang/Object;

    .line 429
    .line 430
    .line 431
    move-result-object v0

    .line 432
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    invoke-virtual {p0, v1, v0}, Ltech/sud/runtime/component/d/a;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 437
    .line 438
    .line 439
    return-void

    .line 440
    :pswitch_14
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 441
    .line 442
    iget-object p0, p0, Ltech/sud/runtime/core/b;->a:Ltech/sud/runtime/core/a;

    .line 443
    .line 444
    invoke-virtual {p0}, Ltech/sud/runtime/core/a;->i()Ltech/sud/runtime/component/a/a;

    .line 445
    .line 446
    .line 447
    move-result-object p0

    .line 448
    if-eqz p0, :cond_2

    .line 449
    .line 450
    invoke-virtual {p0, v3}, Ltech/sud/runtime/component/a/a;->a(Z)V

    .line 451
    .line 452
    .line 453
    return-void

    .line 454
    :pswitch_15
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 455
    .line 456
    invoke-static {v0}, Ltech/sud/runtime/core/b;->d(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/f;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    if-eqz v0, :cond_2

    .line 461
    .line 462
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 463
    .line 464
    invoke-static {p0}, Ltech/sud/runtime/core/b;->d(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/c/f;

    .line 465
    .line 466
    .line 467
    move-result-object p0

    .line 468
    invoke-virtual {p0}, Ltech/sud/runtime/component/c/f;->a()V

    .line 469
    .line 470
    .line 471
    return-void

    .line 472
    :pswitch_16
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 473
    .line 474
    invoke-static {v0}, Ltech/sud/runtime/core/b;->c(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/f/a;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    if-eqz v0, :cond_2

    .line 479
    .line 480
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 481
    .line 482
    invoke-static {v0}, Ltech/sud/runtime/core/b;->c(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/f/a;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 487
    .line 488
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/f/a;->a(Ljava/lang/String;)V

    .line 489
    .line 490
    .line 491
    return-void

    .line 492
    :pswitch_17
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 493
    .line 494
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/b/a;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    if-eqz v0, :cond_2

    .line 499
    .line 500
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 501
    .line 502
    invoke-static {v0}, Ltech/sud/runtime/core/b;->b(Ltech/sud/runtime/core/b;)Ltech/sud/runtime/component/b/a;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->b:Ljava/lang/String;

    .line 507
    .line 508
    invoke-virtual {v0, p0}, Ltech/sud/runtime/component/b/a;->a(Ljava/lang/String;)V

    .line 509
    .line 510
    .line 511
    :cond_2
    :goto_0
    return-void

    .line 512
    :pswitch_18
    iget-object p0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 513
    .line 514
    invoke-static {p0}, Ltech/sud/runtime/core/b;->a(Ltech/sud/runtime/core/b;)V

    .line 515
    .line 516
    .line 517
    return-void

    .line 518
    :cond_3
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 519
    .line 520
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 521
    .line 522
    .line 523
    move-result-object v0

    .line 524
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 525
    .line 526
    int-to-float p0, p0

    .line 527
    const v1, 0x38d1b717    # 1.0E-4f

    .line 528
    .line 529
    .line 530
    mul-float/2addr p0, v1

    .line 531
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/c;->a(Landroid/app/Activity;F)V

    .line 532
    .line 533
    .line 534
    return-void

    .line 535
    :cond_4
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 536
    .line 537
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 538
    .line 539
    .line 540
    move-result-object v0

    .line 541
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 542
    .line 543
    invoke-static {v0, p0}, Ltech/sud/runtime/component/c/c;->a(Landroid/content/Context;I)V

    .line 544
    .line 545
    .line 546
    return-void

    .line 547
    :cond_5
    iget-object v0, p0, Ltech/sud/runtime/core/b$2;->e:Ltech/sud/runtime/core/b;

    .line 548
    .line 549
    invoke-static {v0}, Ltech/sud/runtime/core/b;->h(Ltech/sud/runtime/core/b;)Landroid/app/Activity;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    iget p0, p0, Ltech/sud/runtime/core/b$2;->c:I

    .line 554
    .line 555
    if-eqz p0, :cond_6

    .line 556
    .line 557
    move v2, v3

    .line 558
    :cond_6
    invoke-static {v0, v2}, Ltech/sud/runtime/component/c/c;->a(Landroid/app/Activity;Z)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 559
    .line 560
    .line 561
    return-void

    .line 562
    :catch_0
    move-exception v0

    .line 563
    move-object p0, v0

    .line 564
    new-instance v0, Ljava/lang/StringBuilder;

    .line 565
    .line 566
    const-string v1, "J: Async emit get: "

    .line 567
    .line 568
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 569
    .line 570
    .line 571
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object p0

    .line 575
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 576
    .line 577
    .line 578
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 579
    .line 580
    .line 581
    move-result-object p0

    .line 582
    const-string v0, "SudNative"

    .line 583
    .line 584
    invoke-static {v0, p0}, Ltech/sud/runtime/component/h/f;->e(Ljava/lang/String;Ljava/lang/String;)V

    .line 585
    .line 586
    .line 587
    return-void

    .line 588
    nop

    .line 589
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_18
        :pswitch_17
        :pswitch_16
        :pswitch_15
        :pswitch_14
        :pswitch_13
        :pswitch_12
        :pswitch_11
        :pswitch_10
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method
