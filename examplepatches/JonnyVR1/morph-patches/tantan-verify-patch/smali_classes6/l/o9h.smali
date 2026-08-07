.class public Ll/o9h;
.super Ll/l4h;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public d:I

.field public e:I

.field public f:Ljava/lang/String;

.field public g:Ll/vg60;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/vg60<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation
.end field

.field public h:Landroid/view/View;

.field public i:Ll/x20;

.field public j:I

.field public k:I

.field public l:I


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 37
    invoke-direct {p0}, Ll/l4h;-><init>()V

    const/4 v0, 0x6

    .line 38
    iput v0, p0, Ll/o9h;->d:I

    const/4 v0, 0x0

    .line 39
    iput v0, p0, Ll/o9h;->e:I

    const/high16 v0, 0x42880000    # 68.0f

    .line 40
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Ll/o9h;->j:I

    const/high16 v0, 0x41800000    # 16.0f

    .line 41
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Ll/o9h;->k:I

    const/high16 v0, 0x41000000    # 8.0f

    .line 42
    invoke-static {v0}, Ll/qa00;->d(F)I

    move-result v0

    iput v0, p0, Ll/o9h;->l:I

    return-void
.end method

.method public constructor <init>(I)V
    .locals 1

    .line 1
    invoke-direct {p0}, Ll/l4h;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x6

    .line 5
    iput v0, p0, Ll/o9h;->d:I

    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput v0, p0, Ll/o9h;->e:I

    .line 9
    .line 10
    const/high16 v0, 0x42880000    # 68.0f

    .line 11
    .line 12
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    iput v0, p0, Ll/o9h;->j:I

    .line 17
    .line 18
    const/high16 v0, 0x41800000    # 16.0f

    .line 19
    .line 20
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    iput v0, p0, Ll/o9h;->k:I

    .line 25
    .line 26
    const/high16 v0, 0x41000000    # 8.0f

    .line 27
    .line 28
    invoke-static {v0}, Ll/qa00;->d(F)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    iput v0, p0, Ll/o9h;->l:I

    .line 33
    .line 34
    iput p1, p0, Ll/o9h;->d:I

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public varargs a(Lcom/p1/mobile/android/app/Act;Ljava/util/Map;[Landroid/view/View;)Z
    .locals 12

    .line 1
    invoke-super {p0, p1, p2, p3}, Ll/l4h;->a(Lcom/p1/mobile/android/app/Act;Ljava/util/Map;[Landroid/view/View;)Z

    .line 2
    .line 3
    .line 4
    const-string v0, "FEED_INSERT_PART_ATTENTION_BUTTON_DATA_MOMENT"

    .line 5
    .line 6
    invoke-interface {p2, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    const-string v1, "FEED_INSERT_PART_ATTENTION_BUTTON_DATA_USER_ID"

    .line 11
    .line 12
    invoke-interface {p2, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    const-string v2, "FEED_INSERT_PART_ATTENTION_BUTTON_DATA_CLICK"

    .line 17
    .line 18
    invoke-interface {p2, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    const-string v3, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_PROCESS"

    .line 23
    .line 24
    invoke-interface {p2, v3}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const-string v4, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_PADDING"

    .line 29
    .line 30
    invoke-interface {p2, v4}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v4

    .line 34
    const-string v5, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_WIDTH"

    .line 35
    .line 36
    invoke-interface {p2, v5}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    const-string v6, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_COUNT"

    .line 41
    .line 42
    invoke-interface {p2, v6}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    const-string v7, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_GRAVITY"

    .line 47
    .line 48
    invoke-interface {p2, v7}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    const-string v8, "FEED_INSERT_PART_ATTENTION_BUTTON_MOMENT_VIEW_RENDERED"

    .line 53
    .line 54
    invoke-interface {p2, v8}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    move-result-object p2

    .line 58
    instance-of v8, v0, Ll/vg60;

    .line 59
    .line 60
    if-eqz v8, :cond_1

    .line 61
    .line 62
    check-cast v0, Ll/vg60;

    .line 63
    .line 64
    iget-object v8, v0, Ll/vg60;->a:Ljava/util/List;

    .line 65
    .line 66
    instance-of v9, v8, Ll/fg00;

    .line 67
    .line 68
    if-eqz v9, :cond_0

    .line 69
    .line 70
    new-instance v9, Ll/vg60;

    .line 71
    .line 72
    check-cast v8, Ll/fg00;

    .line 73
    .line 74
    invoke-virtual {v8}, Ll/fg00;->c()Ljava/util/List;

    .line 75
    .line 76
    .line 77
    move-result-object v8

    .line 78
    iget-object v0, v0, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 79
    .line 80
    invoke-direct {v9, v8, v0}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 81
    .line 82
    .line 83
    iput-object v9, p0, Ll/o9h;->g:Ll/vg60;

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    iput-object v0, p0, Ll/o9h;->g:Ll/vg60;

    .line 87
    .line 88
    :cond_1
    :goto_0
    instance-of v0, v1, Ljava/lang/String;

    .line 89
    .line 90
    if-eqz v0, :cond_2

    .line 91
    .line 92
    check-cast v1, Ljava/lang/String;

    .line 93
    .line 94
    iput-object v1, p0, Ll/o9h;->f:Ljava/lang/String;

    .line 95
    .line 96
    :cond_2
    instance-of v0, v2, Ll/x20;

    .line 97
    .line 98
    if-eqz v0, :cond_3

    .line 99
    .line 100
    check-cast v2, Ll/x20;

    .line 101
    .line 102
    iput-object v2, p0, Ll/o9h;->i:Ll/x20;

    .line 103
    .line 104
    :cond_3
    instance-of v0, v4, Ll/pf60;

    .line 105
    .line 106
    if-eqz v0, :cond_4

    .line 107
    .line 108
    check-cast v4, Ll/pf60;

    .line 109
    .line 110
    iget-object v0, v4, Ll/pf60;->a:Ljava/lang/Object;

    .line 111
    .line 112
    check-cast v0, Ljava/lang/Integer;

    .line 113
    .line 114
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    iput v0, p0, Ll/o9h;->k:I

    .line 119
    .line 120
    iget-object v0, v4, Ll/pf60;->b:Ljava/lang/Object;

    .line 121
    .line 122
    check-cast v0, Ljava/lang/Integer;

    .line 123
    .line 124
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    iput v0, p0, Ll/o9h;->l:I

    .line 129
    .line 130
    :cond_4
    instance-of v0, v5, Ljava/lang/Integer;

    .line 131
    .line 132
    if-eqz v0, :cond_5

    .line 133
    .line 134
    move-object v1, v5

    .line 135
    check-cast v1, Ljava/lang/Integer;

    .line 136
    .line 137
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 138
    .line 139
    .line 140
    move-result v1

    .line 141
    iput v1, p0, Ll/o9h;->j:I

    .line 142
    .line 143
    :cond_5
    instance-of v1, v6, Ljava/lang/Integer;

    .line 144
    .line 145
    if-eqz v1, :cond_6

    .line 146
    .line 147
    check-cast v6, Ljava/lang/Integer;

    .line 148
    .line 149
    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    .line 150
    .line 151
    .line 152
    move-result v1

    .line 153
    iput v1, p0, Ll/o9h;->d:I

    .line 154
    .line 155
    :cond_6
    instance-of v1, v3, Ll/z20;

    .line 156
    .line 157
    const/4 v2, 0x0

    .line 158
    if-eqz v1, :cond_7

    .line 159
    .line 160
    check-cast v3, Ll/z20;

    .line 161
    .line 162
    goto :goto_1

    .line 163
    :cond_7
    move-object v3, v2

    .line 164
    :goto_1
    instance-of v1, p2, Ll/y20;

    .line 165
    .line 166
    if-eqz v1, :cond_8

    .line 167
    .line 168
    move-object v2, p2

    .line 169
    check-cast v2, Ll/y20;

    .line 170
    .line 171
    :cond_8
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 172
    .line 173
    .line 174
    move-result p2

    .line 175
    const/4 v1, 0x0

    .line 176
    if-eqz p2, :cond_9

    .line 177
    .line 178
    array-length p2, p3

    .line 179
    if-lez p2, :cond_9

    .line 180
    .line 181
    aget-object p2, p3, v1

    .line 182
    .line 183
    iput-object p2, p0, Ll/o9h;->h:Landroid/view/View;

    .line 184
    .line 185
    :cond_9
    invoke-virtual {p0}, Ll/o9h;->c()Z

    .line 186
    .line 187
    .line 188
    iget-object p2, p0, Ll/o9h;->h:Landroid/view/View;

    .line 189
    .line 190
    instance-of p2, p2, Landroid/widget/RelativeLayout;

    .line 191
    .line 192
    if-eqz p2, :cond_19

    .line 193
    .line 194
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 195
    .line 196
    .line 197
    move-result p2

    .line 198
    if-eqz p2, :cond_19

    .line 199
    .line 200
    instance-of p2, v7, Ljava/lang/Integer;

    .line 201
    .line 202
    iget-object p3, p0, Ll/o9h;->h:Landroid/view/View;

    .line 203
    .line 204
    if-eqz p2, :cond_a

    .line 205
    .line 206
    check-cast p3, Landroid/widget/RelativeLayout;

    .line 207
    .line 208
    check-cast v7, Ljava/lang/Integer;

    .line 209
    .line 210
    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    .line 211
    .line 212
    .line 213
    move-result p2

    .line 214
    invoke-virtual {p0, p1, p3, p2}, Ll/o9h;->f(Lcom/p1/mobile/android/app/Act;Landroid/widget/RelativeLayout;I)Landroid/widget/LinearLayout;

    .line 215
    .line 216
    .line 217
    move-result-object p2

    .line 218
    goto :goto_2

    .line 219
    :cond_a
    check-cast p3, Landroid/widget/RelativeLayout;

    .line 220
    .line 221
    invoke-virtual {p0, p1, p3}, Ll/o9h;->g(Lcom/p1/mobile/android/app/Act;Landroid/widget/RelativeLayout;)Landroid/widget/LinearLayout;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    :goto_2
    invoke-virtual {p0, p2}, Ll/o9h;->i(Landroid/widget/LinearLayout;)V

    .line 226
    .line 227
    .line 228
    iget-object p3, p0, Ll/o9h;->g:Ll/vg60;

    .line 229
    .line 230
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 231
    .line 232
    .line 233
    move-result p3

    .line 234
    const/4 v4, 0x1

    .line 235
    if-eqz p3, :cond_16

    .line 236
    .line 237
    iget-object p3, p0, Ll/o9h;->g:Ll/vg60;

    .line 238
    .line 239
    iget-object p3, p3, Ll/vg60;->a:Ljava/util/List;

    .line 240
    .line 241
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 242
    .line 243
    .line 244
    move-result p3

    .line 245
    if-eqz p3, :cond_16

    .line 246
    .line 247
    invoke-virtual {p0}, Ll/o9h;->e()Ljava/util/List;

    .line 248
    .line 249
    .line 250
    move-result-object p3

    .line 251
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 252
    .line 253
    .line 254
    move-result-object p3

    .line 255
    :cond_b
    :goto_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 256
    .line 257
    .line 258
    move-result v6

    .line 259
    if-eqz v6, :cond_12

    .line 260
    .line 261
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 262
    .line 263
    .line 264
    move-result-object v6

    .line 265
    instance-of v7, v6, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 266
    .line 267
    if-eqz v7, :cond_b

    .line 268
    .line 269
    check-cast v6, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 270
    .line 271
    iget v7, p0, Ll/o9h;->e:I

    .line 272
    .line 273
    iget v8, p0, Ll/o9h;->d:I

    .line 274
    .line 275
    if-ne v7, v8, :cond_c

    .line 276
    .line 277
    goto/16 :goto_6

    .line 278
    .line 279
    :cond_c
    iget-object v7, v6, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 280
    .line 281
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 282
    .line 283
    .line 284
    move-result v7

    .line 285
    if-eqz v7, :cond_b

    .line 286
    .line 287
    iget-object v6, v6, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 288
    .line 289
    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 290
    .line 291
    .line 292
    move-result-object v6

    .line 293
    :goto_4
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    .line 294
    .line 295
    .line 296
    move-result v7

    .line 297
    if-eqz v7, :cond_b

    .line 298
    .line 299
    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v7

    .line 303
    check-cast v7, Lcom/p1/mobile/putong/data/Media;

    .line 304
    .line 305
    iget v8, p0, Ll/o9h;->e:I

    .line 306
    .line 307
    iget v9, p0, Ll/o9h;->d:I

    .line 308
    .line 309
    if-ne v8, v9, :cond_d

    .line 310
    .line 311
    goto :goto_3

    .line 312
    :cond_d
    invoke-virtual {p0, p1}, Ll/o9h;->j(Lcom/p1/mobile/android/app/Act;)Lv/VDraweeView;

    .line 313
    .line 314
    .line 315
    move-result-object v8

    .line 316
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 317
    .line 318
    .line 319
    move-result v9

    .line 320
    if-eqz v9, :cond_e

    .line 321
    .line 322
    invoke-interface {v3, v8, v7}, Ll/z20;->call(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 323
    .line 324
    .line 325
    :cond_e
    instance-of v9, v7, Lcom/p1/mobile/putong/data/Picture;

    .line 326
    .line 327
    if-eqz v9, :cond_10

    .line 328
    .line 329
    if-eqz v0, :cond_f

    .line 330
    .line 331
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 332
    .line 333
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Media;->cover()Lcom/p1/mobile/putong/data/Picture;

    .line 334
    .line 335
    .line 336
    move-result-object v7

    .line 337
    move-object v10, v5

    .line 338
    check-cast v10, Ljava/lang/Integer;

    .line 339
    .line 340
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 341
    .line 342
    .line 343
    move-result v11

    .line 344
    invoke-virtual {v7, v11}, Lcom/p1/mobile/putong/data/Picture;->profileSize(I)Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 345
    .line 346
    .line 347
    move-result-object v7

    .line 348
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture$ImageUri;->formatted()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v7

    .line 352
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 353
    .line 354
    .line 355
    move-result v11

    .line 356
    invoke-virtual {v10}, Ljava/lang/Integer;->intValue()I

    .line 357
    .line 358
    .line 359
    move-result v10

    .line 360
    invoke-virtual {v9, v8, v7, v11, v10}, Ll/fsb0;->I0(Lcom/facebook/drawee/view/SimpleDraweeView;Ljava/lang/String;II)Lcom/facebook/imagepipeline/request/ImageRequest;

    .line 361
    .line 362
    .line 363
    goto :goto_5

    .line 364
    :cond_f
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 365
    .line 366
    check-cast v7, Lcom/p1/mobile/putong/data/Picture;

    .line 367
    .line 368
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 369
    .line 370
    .line 371
    move-result-object v7

    .line 372
    invoke-virtual {v9, v8, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 373
    .line 374
    .line 375
    goto :goto_5

    .line 376
    :cond_10
    instance-of v9, v7, Lcom/p1/mobile/putong/data/Video;

    .line 377
    .line 378
    if-eqz v9, :cond_11

    .line 379
    .line 380
    check-cast v7, Lcom/p1/mobile/putong/data/Video;

    .line 381
    .line 382
    iget-object v9, v7, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 383
    .line 384
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 385
    .line 386
    .line 387
    move-result v9

    .line 388
    if-eqz v9, :cond_11

    .line 389
    .line 390
    iget-object v9, v7, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 391
    .line 392
    iget-object v9, v9, Lcom/p1/mobile/putong/data/Media;->url:Ljava/lang/String;

    .line 393
    .line 394
    invoke-static {v9}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 395
    .line 396
    .line 397
    move-result v9

    .line 398
    if-eqz v9, :cond_11

    .line 399
    .line 400
    sget-object v9, Ll/uqb0;->G:Ll/fsb0;

    .line 401
    .line 402
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Video;->cover:Lcom/p1/mobile/putong/data/Picture;

    .line 403
    .line 404
    invoke-virtual {v7}, Lcom/p1/mobile/putong/data/Picture;->momentPictureSmall()Lcom/p1/mobile/putong/data/Picture$ImageUri;

    .line 405
    .line 406
    .line 407
    move-result-object v7

    .line 408
    invoke-virtual {v9, v8, v7}, Ll/fsb0;->Q0(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/data/Picture$ImageUri;)V

    .line 409
    .line 410
    .line 411
    invoke-virtual {v8}, Lcom/facebook/drawee/view/DraweeView;->getHierarchy()Ll/mde;

    .line 412
    .line 413
    .line 414
    move-result-object v7

    .line 415
    check-cast v7, Ll/wlj;

    .line 416
    .line 417
    new-instance v9, Ll/x0e0;

    .line 418
    .line 419
    invoke-virtual {p1}, Landroidx/appcompat/app/AppCompatActivity;->getResources()Landroid/content/res/Resources;

    .line 420
    .line 421
    .line 422
    move-result-object v10

    .line 423
    sget v11, Ll/lbc0;->h1:I

    .line 424
    .line 425
    invoke-virtual {v10, v11}, Landroid/content/res/Resources;->getDrawable(I)Landroid/graphics/drawable/Drawable;

    .line 426
    .line 427
    .line 428
    move-result-object v10

    .line 429
    sget-object v11, Ll/h1e0;->g:Ll/h1e0;

    .line 430
    .line 431
    invoke-direct {v9, v10, v11}, Ll/x0e0;-><init>(Landroid/graphics/drawable/Drawable;Ll/h1e0;)V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v7, v9}, Ll/wlj;->c(Landroid/graphics/drawable/Drawable;)V

    .line 435
    .line 436
    .line 437
    :cond_11
    :goto_5
    invoke-virtual {p2, v8}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 438
    .line 439
    .line 440
    iget v7, p0, Ll/o9h;->e:I

    .line 441
    .line 442
    invoke-virtual {p0, v8, v7}, Ll/o9h;->k(Landroid/view/View;I)V

    .line 443
    .line 444
    .line 445
    iget v7, p0, Ll/o9h;->e:I

    .line 446
    .line 447
    add-int/2addr v7, v4

    .line 448
    iput v7, p0, Ll/o9h;->e:I

    .line 449
    .line 450
    goto/16 :goto_4

    .line 451
    .line 452
    :cond_12
    :goto_6
    invoke-static {}, Lcom/p1/mobile/putong/feed/FeedModule;->H()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->Br()Z

    .line 457
    .line 458
    .line 459
    move-result p1

    .line 460
    if-eqz p1, :cond_16

    .line 461
    .line 462
    iget p1, p0, Ll/o9h;->e:I

    .line 463
    .line 464
    if-nez p1, :cond_16

    .line 465
    .line 466
    iget-object p1, p0, Ll/o9h;->g:Ll/vg60;

    .line 467
    .line 468
    iget-object p1, p1, Ll/vg60;->a:Ljava/util/List;

    .line 469
    .line 470
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 471
    .line 472
    .line 473
    move-result-object p1

    .line 474
    :cond_13
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 475
    .line 476
    .line 477
    move-result p3

    .line 478
    if-eqz p3, :cond_16

    .line 479
    .line 480
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 481
    .line 482
    .line 483
    move-result-object p3

    .line 484
    check-cast p3, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 485
    .line 486
    iget-object p3, p3, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 487
    .line 488
    const-string v0, ""

    .line 489
    .line 490
    if-nez p3, :cond_14

    .line 491
    .line 492
    goto :goto_7

    .line 493
    :cond_14
    const-string v3, "\r|\n"

    .line 494
    .line 495
    invoke-virtual {p3, v3, v0}, Ljava/lang/String;->replaceAll(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    :goto_7
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 500
    .line 501
    .line 502
    move-result p3

    .line 503
    if-nez p3, :cond_15

    .line 504
    .line 505
    iget p3, p0, Ll/o9h;->e:I

    .line 506
    .line 507
    invoke-virtual {p0, v0, p3}, Ll/o9h;->h(Ljava/lang/String;I)Landroid/view/View;

    .line 508
    .line 509
    .line 510
    move-result-object p3

    .line 511
    invoke-virtual {p2, p3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 512
    .line 513
    .line 514
    iget v0, p0, Ll/o9h;->e:I

    .line 515
    .line 516
    invoke-virtual {p0, p3, v0}, Ll/o9h;->k(Landroid/view/View;I)V

    .line 517
    .line 518
    .line 519
    iget p3, p0, Ll/o9h;->e:I

    .line 520
    .line 521
    add-int/2addr p3, v4

    .line 522
    iput p3, p0, Ll/o9h;->e:I

    .line 523
    .line 524
    :cond_15
    iget p3, p0, Ll/o9h;->e:I

    .line 525
    .line 526
    const/4 v0, 0x3

    .line 527
    if-ne p3, v0, :cond_13

    .line 528
    .line 529
    :cond_16
    if-eqz v2, :cond_17

    .line 530
    .line 531
    iget p1, p0, Ll/o9h;->e:I

    .line 532
    .line 533
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 534
    .line 535
    .line 536
    move-result-object p1

    .line 537
    invoke-interface {v2, p1}, Ll/y20;->call(Ljava/lang/Object;)V

    .line 538
    .line 539
    .line 540
    :cond_17
    invoke-virtual {p0}, Ll/o9h;->b()Z

    .line 541
    .line 542
    .line 543
    iget p1, p0, Ll/o9h;->e:I

    .line 544
    .line 545
    if-eqz p1, :cond_18

    .line 546
    .line 547
    iget-object p1, p0, Ll/o9h;->h:Landroid/view/View;

    .line 548
    .line 549
    invoke-virtual {p1, v1}, Landroid/view/View;->setVisibility(I)V

    .line 550
    .line 551
    .line 552
    invoke-virtual {p0}, Ll/o9h;->d()V

    .line 553
    .line 554
    .line 555
    :cond_18
    return v4

    .line 556
    :cond_19
    return v1
.end method

.method public b()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public c()Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public final d()V
    .locals 2

    .line 1
    const-string v0, "owner_id"

    .line 2
    .line 3
    iget-object p0, p0, Ll/o9h;->f:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    filled-new-array {p0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v0, "e_moment"

    .line 14
    .line 15
    const-string v1, "p_suggest_user_profile_info_view"

    .line 16
    .line 17
    invoke-static {v0, v1, p0}, Ll/tfj0;->e(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final e()Ljava/util/List;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/feed/data/Moment;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/o9h;->g:Ll/vg60;

    .line 2
    .line 3
    iget-object v0, v0, Ll/vg60;->a:Ljava/util/List;

    .line 4
    .line 5
    instance-of v0, v0, Ljava/util/ArrayList;

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    new-instance v0, Ljava/util/ArrayList;

    .line 10
    .line 11
    iget-object p0, p0, Ll/o9h;->g:Ll/vg60;

    .line 12
    .line 13
    iget-object p0, p0, Ll/vg60;->a:Ljava/util/List;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 16
    .line 17
    .line 18
    goto :goto_1

    .line 19
    :cond_0
    :try_start_0
    new-instance v0, Ljava/util/ArrayList;

    .line 20
    .line 21
    iget-object v1, p0, Ll/o9h;->g:Ll/vg60;

    .line 22
    .line 23
    iget-object v1, v1, Ll/vg60;->a:Ljava/util/List;

    .line 24
    .line 25
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    goto :goto_0

    .line 29
    :catchall_0
    move-exception v0

    .line 30
    new-instance v1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 36
    .line 37
    .line 38
    move-object v0, v1

    .line 39
    :goto_0
    new-instance v1, Ll/vg60;

    .line 40
    .line 41
    iget-object v2, p0, Ll/o9h;->g:Ll/vg60;

    .line 42
    .line 43
    iget-object v2, v2, Ll/vg60;->b:Lcom/p1/mobile/putong/data/DbLinks;

    .line 44
    .line 45
    invoke-direct {v1, v0, v2}, Ll/vg60;-><init>(Ljava/util/List;Lcom/p1/mobile/putong/data/DbLinks;)V

    .line 46
    .line 47
    .line 48
    iput-object v1, p0, Ll/o9h;->g:Ll/vg60;

    .line 49
    .line 50
    :goto_1
    const/4 p0, 0x0

    .line 51
    :goto_2
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 52
    .line 53
    .line 54
    move-result v1

    .line 55
    if-ge p0, v1, :cond_2

    .line 56
    .line 57
    invoke-interface {v0, p0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v1

    .line 61
    check-cast v1, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 62
    .line 63
    invoke-static {v1}, Ll/ksg;->X(Lcom/p1/mobile/putong/feed/data/Moment;)Z

    .line 64
    .line 65
    .line 66
    move-result v2

    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    invoke-interface {v0, v1}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 70
    .line 71
    .line 72
    add-int/lit8 p0, p0, -0x1

    .line 73
    .line 74
    :cond_1
    add-int/lit8 p0, p0, 0x1

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_2
    return-object v0
.end method

.method public final f(Lcom/p1/mobile/android/app/Act;Landroid/widget/RelativeLayout;I)Landroid/widget/LinearLayout;
    .locals 0

    .line 1
    new-instance p0, Landroid/widget/LinearLayout;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, p3}, Landroid/widget/LinearLayout;->setGravity(I)V

    .line 7
    .line 8
    .line 9
    new-instance p1, Landroid/widget/RelativeLayout$LayoutParams;

    .line 10
    .line 11
    const/4 p3, -0x2

    .line 12
    invoke-direct {p1, p3, p3}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 13
    .line 14
    .line 15
    const/16 p3, 0xd

    .line 16
    .line 17
    invoke-virtual {p1, p3}, Landroid/widget/RelativeLayout$LayoutParams;->addRule(I)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p2, p0, p1}, Landroid/view/ViewGroup;->addView(Landroid/view/View;Landroid/view/ViewGroup$LayoutParams;)V

    .line 24
    .line 25
    .line 26
    return-object p0
.end method

.method public final g(Lcom/p1/mobile/android/app/Act;Landroid/widget/RelativeLayout;)Landroid/widget/LinearLayout;
    .locals 4

    .line 1
    new-instance p0, Landroid/widget/HorizontalScrollView;

    .line 2
    .line 3
    invoke-direct {p0, p1}, Landroid/widget/HorizontalScrollView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance v0, Landroid/widget/RelativeLayout$LayoutParams;

    .line 7
    .line 8
    const/4 v1, -0x2

    .line 9
    invoke-direct {v0, v1, v1}, Landroid/widget/RelativeLayout$LayoutParams;-><init>(II)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 13
    .line 14
    .line 15
    const/4 v0, 0x0

    .line 16
    invoke-virtual {p0, v0}, Landroid/view/View;->setHorizontalScrollBarEnabled(Z)V

    .line 17
    .line 18
    .line 19
    new-instance v2, Landroid/widget/LinearLayout;

    .line 20
    .line 21
    invoke-direct {v2, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 22
    .line 23
    .line 24
    new-instance p1, Landroid/view/ViewGroup$MarginLayoutParams;

    .line 25
    .line 26
    const/4 v3, -0x1

    .line 27
    invoke-direct {p1, v3, v1}, Landroid/view/ViewGroup$MarginLayoutParams;-><init>(II)V

    .line 28
    .line 29
    .line 30
    const/high16 v1, 0x41d00000    # 26.0f

    .line 31
    .line 32
    invoke-static {v1}, Ll/qa00;->d(F)I

    .line 33
    .line 34
    .line 35
    move-result v1

    .line 36
    invoke-virtual {v2, v0, v0, v0, v1}, Landroid/view/View;->setPadding(IIII)V

    .line 37
    .line 38
    .line 39
    invoke-virtual {v2, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0, v2}, Landroid/widget/HorizontalScrollView;->addView(Landroid/view/View;)V

    .line 43
    .line 44
    .line 45
    invoke-virtual {p2}, Landroid/view/ViewGroup;->removeAllViews()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p2, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    .line 49
    .line 50
    .line 51
    return-object v2
.end method

.method public final h(Ljava/lang/String;I)Landroid/view/View;
    .locals 2
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    iget-object p0, p0, Ll/l4h;->c:Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    invoke-static {p0}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget v0, Ll/tec0;->Q0:I

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    invoke-virtual {p0, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    check-cast p0, Lv/VFrame;

    .line 15
    .line 16
    sget v0, Ll/hdc0;->m0:I

    .line 17
    .line 18
    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lv/VImage;

    .line 23
    .line 24
    sget v1, Ll/hdc0;->Q1:I

    .line 25
    .line 26
    invoke-virtual {p0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    check-cast v1, Lv/VText;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 33
    .line 34
    .line 35
    if-nez p2, :cond_0

    .line 36
    .line 37
    sget p1, Ll/lbc0;->n1:I

    .line 38
    .line 39
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    sget p1, Ll/lbc0;->k1:I

    .line 43
    .line 44
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 45
    .line 46
    .line 47
    return-object p0

    .line 48
    :cond_0
    const/4 p1, 0x1

    .line 49
    if-ne p2, p1, :cond_1

    .line 50
    .line 51
    sget p1, Ll/lbc0;->o1:I

    .line 52
    .line 53
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 54
    .line 55
    .line 56
    sget p1, Ll/lbc0;->l1:I

    .line 57
    .line 58
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 59
    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_1
    sget p1, Ll/lbc0;->p1:I

    .line 63
    .line 64
    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    .line 65
    .line 66
    .line 67
    sget p1, Ll/lbc0;->m1:I

    .line 68
    .line 69
    invoke-virtual {p0, p1}, Landroid/view/View;->setBackgroundResource(I)V

    .line 70
    .line 71
    .line 72
    return-object p0
.end method

.method public final i(Landroid/widget/LinearLayout;)V
    .locals 0

    .line 1
    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final j(Lcom/p1/mobile/android/app/Act;)Lv/VDraweeView;
    .locals 1

    .line 1
    new-instance v0, Lv/VDraweeView;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Lv/VDraweeView;-><init>(Landroid/content/Context;)V

    .line 4
    .line 5
    .line 6
    new-instance p1, Landroid/widget/LinearLayout$LayoutParams;

    .line 7
    .line 8
    iget p0, p0, Ll/o9h;->j:I

    .line 9
    .line 10
    invoke-direct {p1, p0, p0}, Landroid/widget/LinearLayout$LayoutParams;-><init>(II)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, p1}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 14
    .line 15
    .line 16
    return-object v0
.end method

.method public final k(Landroid/view/View;I)V
    .locals 2

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p1}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 12
    .line 13
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    if-eqz v1, :cond_1

    .line 18
    .line 19
    if-nez p2, :cond_0

    .line 20
    .line 21
    iget p2, p0, Ll/o9h;->k:I

    .line 22
    .line 23
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->leftMargin:I

    .line 24
    .line 25
    :cond_0
    iget p0, p0, Ll/o9h;->l:I

    .line 26
    .line 27
    iput p0, v0, Landroid/widget/LinearLayout$LayoutParams;->rightMargin:I

    .line 28
    .line 29
    invoke-virtual {p1, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 30
    .line 31
    .line 32
    :cond_1
    return-void
.end method

.method public onClick(Landroid/view/View;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/o9h;->i:Ll/x20;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Ll/o9h;->i:Ll/x20;

    .line 10
    .line 11
    invoke-interface {p0}, Ll/x20;->call()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
