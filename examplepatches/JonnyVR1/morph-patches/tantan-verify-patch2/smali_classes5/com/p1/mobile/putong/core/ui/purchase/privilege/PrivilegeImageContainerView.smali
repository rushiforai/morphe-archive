.class public Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;
.super Landroid/widget/LinearLayout;
.source "SourceFile"


# instance fields
.field public a:Landroid/widget/ImageView;


# direct methods
.method public constructor <init>(Landroid/content/Context;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-direct {p0, p1}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 5
    invoke-direct {p0, p1, p2}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;)V

    return-void
.end method

.method public constructor <init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V
    .locals 0
    .param p1    # Landroid/content/Context;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .param p2    # Landroid/util/AttributeSet;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 6
    invoke-direct {p0, p1, p2, p3}, Landroid/widget/LinearLayout;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    return-void
.end method


# virtual methods
.method public final a(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/ae90;->a(Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public b(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 2

    .line 1
    invoke-virtual {p1}, Ll/a690;->l()Lcom/p1/mobile/putong/core/data/Privilege;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 8
    .line 9
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    sget-object v1, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView$a;->a:[I

    .line 18
    .line 19
    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    aget v0, v1, v0

    .line 24
    .line 25
    const/4 v1, 0x0

    .line 26
    packed-switch v0, :pswitch_data_0

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :pswitch_0
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 34
    .line 35
    invoke-virtual {p1}, Ll/a690;->j()I

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :pswitch_1
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 44
    .line 45
    .line 46
    move-result p1

    .line 47
    if-nez p1, :cond_3

    .line 48
    .line 49
    invoke-static {p2}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 50
    .line 51
    .line 52
    move-result p1

    .line 53
    if-eqz p1, :cond_1

    .line 54
    .line 55
    goto :goto_1

    .line 56
    :cond_1
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 60
    .line 61
    invoke-static {}, Ll/c17;->u0()Z

    .line 62
    .line 63
    .line 64
    move-result p1

    .line 65
    if-eqz p1, :cond_2

    .line 66
    .line 67
    sget p1, Ll/jbc0;->l0:I

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_2
    sget p1, Ll/jbc0;->k0:I

    .line 71
    .line 72
    :goto_0
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :cond_3
    :goto_1
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 80
    .line 81
    invoke-static {}, Ll/c17;->u0()Z

    .line 82
    .line 83
    .line 84
    move-result p1

    .line 85
    if-eqz p1, :cond_4

    .line 86
    .line 87
    sget p1, Ll/jbc0;->M4:I

    .line 88
    .line 89
    goto :goto_2

    .line 90
    :cond_4
    sget p1, Ll/jbc0;->L4:I

    .line 91
    .line 92
    :goto_2
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 93
    .line 94
    .line 95
    return-void

    .line 96
    :pswitch_2
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 97
    .line 98
    .line 99
    return-void

    .line 100
    :pswitch_3
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 104
    .line 105
    invoke-static {}, Ll/c17;->u0()Z

    .line 106
    .line 107
    .line 108
    move-result p1

    .line 109
    if-eqz p1, :cond_5

    .line 110
    .line 111
    sget p1, Ll/jbc0;->d0:I

    .line 112
    .line 113
    goto :goto_3

    .line 114
    :cond_5
    sget p1, Ll/jbc0;->c0:I

    .line 115
    .line 116
    :goto_3
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :pswitch_4
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 121
    .line 122
    .line 123
    invoke-static {}, Ll/s7a;->h()Z

    .line 124
    .line 125
    .line 126
    move-result p1

    .line 127
    if-eqz p1, :cond_7

    .line 128
    .line 129
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 130
    .line 131
    .line 132
    move-result p1

    .line 133
    if-nez p1, :cond_6

    .line 134
    .line 135
    invoke-static {p2}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 136
    .line 137
    .line 138
    move-result p1

    .line 139
    if-eqz p1, :cond_7

    .line 140
    .line 141
    :cond_6
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 142
    .line 143
    sget p1, Ll/jbc0;->j5:I

    .line 144
    .line 145
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 146
    .line 147
    .line 148
    return-void

    .line 149
    :cond_7
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 150
    .line 151
    invoke-static {}, Ll/c17;->u0()Z

    .line 152
    .line 153
    .line 154
    move-result p1

    .line 155
    if-eqz p1, :cond_8

    .line 156
    .line 157
    sget p1, Ll/jbc0;->R4:I

    .line 158
    .line 159
    goto :goto_4

    .line 160
    :cond_8
    sget p1, Ll/jbc0;->Q4:I

    .line 161
    .line 162
    :goto_4
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 163
    .line 164
    .line 165
    return-void

    .line 166
    :pswitch_5
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 167
    .line 168
    .line 169
    move-result p1

    .line 170
    if-nez p1, :cond_b

    .line 171
    .line 172
    invoke-static {p2}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 173
    .line 174
    .line 175
    move-result p1

    .line 176
    if-eqz p1, :cond_9

    .line 177
    .line 178
    goto :goto_6

    .line 179
    :cond_9
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 180
    .line 181
    .line 182
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 183
    .line 184
    invoke-static {}, Ll/c17;->u0()Z

    .line 185
    .line 186
    .line 187
    move-result p1

    .line 188
    if-eqz p1, :cond_a

    .line 189
    .line 190
    sget p1, Ll/jbc0;->L5:I

    .line 191
    .line 192
    goto :goto_5

    .line 193
    :cond_a
    sget p1, Ll/jbc0;->K5:I

    .line 194
    .line 195
    :goto_5
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_b
    :goto_6
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 200
    .line 201
    .line 202
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 203
    .line 204
    invoke-static {}, Ll/c17;->u0()Z

    .line 205
    .line 206
    .line 207
    move-result p1

    .line 208
    if-eqz p1, :cond_c

    .line 209
    .line 210
    sget p1, Ll/jbc0;->O4:I

    .line 211
    .line 212
    goto :goto_7

    .line 213
    :cond_c
    sget p1, Ll/jbc0;->N4:I

    .line 214
    .line 215
    :goto_7
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 216
    .line 217
    .line 218
    return-void

    .line 219
    :pswitch_6
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 223
    .line 224
    sget p1, Ll/jbc0;->M5:I

    .line 225
    .line 226
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 227
    .line 228
    .line 229
    return-void

    .line 230
    :pswitch_7
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 231
    .line 232
    .line 233
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 244
    .line 245
    .line 246
    move-result p1

    .line 247
    if-eqz p1, :cond_d

    .line 248
    .line 249
    sget p1, Ll/jbc0;->q9:I

    .line 250
    .line 251
    goto :goto_8

    .line 252
    :cond_d
    sget p1, Ll/jbc0;->p9:I

    .line 253
    .line 254
    :goto_8
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 255
    .line 256
    .line 257
    return-void

    .line 258
    :pswitch_8
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 259
    .line 260
    .line 261
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 262
    .line 263
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->eg()Z

    .line 272
    .line 273
    .line 274
    move-result p1

    .line 275
    if-eqz p1, :cond_e

    .line 276
    .line 277
    sget p1, Ll/jbc0;->o9:I

    .line 278
    .line 279
    goto :goto_9

    .line 280
    :cond_e
    sget p1, Ll/jbc0;->n9:I

    .line 281
    .line 282
    :goto_9
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :pswitch_9
    invoke-static {p2}, Ll/wib0;->i(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 287
    .line 288
    .line 289
    move-result p1

    .line 290
    if-nez p1, :cond_11

    .line 291
    .line 292
    invoke-static {p2}, Ll/wib0;->j(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 293
    .line 294
    .line 295
    move-result p1

    .line 296
    if-eqz p1, :cond_f

    .line 297
    .line 298
    goto :goto_b

    .line 299
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 300
    .line 301
    invoke-static {}, Ll/c17;->u0()Z

    .line 302
    .line 303
    .line 304
    move-result p2

    .line 305
    if-eqz p2, :cond_10

    .line 306
    .line 307
    sget p2, Ll/jbc0;->Pc:I

    .line 308
    .line 309
    goto :goto_a

    .line 310
    :cond_10
    sget p2, Ll/jbc0;->Oc:I

    .line 311
    .line 312
    :goto_a
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 313
    .line 314
    .line 315
    goto :goto_d

    .line 316
    :cond_11
    :goto_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 317
    .line 318
    invoke-static {}, Ll/c17;->u0()Z

    .line 319
    .line 320
    .line 321
    move-result p2

    .line 322
    if-eqz p2, :cond_12

    .line 323
    .line 324
    sget p2, Ll/jbc0;->A4:I

    .line 325
    .line 326
    goto :goto_c

    .line 327
    :cond_12
    sget p2, Ll/jbc0;->z4:I

    .line 328
    .line 329
    :goto_c
    invoke-virtual {p1, p2}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 330
    .line 331
    .line 332
    :goto_d
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 333
    .line 334
    .line 335
    return-void

    .line 336
    :pswitch_a
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 337
    .line 338
    .line 339
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 340
    .line 341
    invoke-static {}, Ll/c17;->u0()Z

    .line 342
    .line 343
    .line 344
    move-result p1

    .line 345
    if-eqz p1, :cond_13

    .line 346
    .line 347
    sget p1, Ll/jbc0;->S8:I

    .line 348
    .line 349
    goto :goto_e

    .line 350
    :cond_13
    sget p1, Ll/jbc0;->R8:I

    .line 351
    .line 352
    :goto_e
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 353
    .line 354
    .line 355
    return-void

    .line 356
    :pswitch_b
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 357
    .line 358
    .line 359
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 360
    .line 361
    sget p1, Ll/jbc0;->tc:I

    .line 362
    .line 363
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 364
    .line 365
    .line 366
    return-void

    .line 367
    :pswitch_c
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 368
    .line 369
    .line 370
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 371
    .line 372
    invoke-static {}, Ll/c17;->u0()Z

    .line 373
    .line 374
    .line 375
    move-result p1

    .line 376
    if-eqz p1, :cond_14

    .line 377
    .line 378
    sget p1, Ll/jbc0;->ic:I

    .line 379
    .line 380
    goto :goto_f

    .line 381
    :cond_14
    sget p1, Ll/jbc0;->hc:I

    .line 382
    .line 383
    :goto_f
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 384
    .line 385
    .line 386
    return-void

    .line 387
    :pswitch_d
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 388
    .line 389
    .line 390
    invoke-static {}, Ll/c17;->u0()Z

    .line 391
    .line 392
    .line 393
    move-result p1

    .line 394
    if-eqz p1, :cond_15

    .line 395
    .line 396
    sget p1, Ll/jbc0;->B8:I

    .line 397
    .line 398
    goto :goto_10

    .line 399
    :cond_15
    sget p1, Ll/jbc0;->A8:I

    .line 400
    .line 401
    :goto_10
    invoke-static {}, Ll/s7a;->k()Z

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    if-eqz v0, :cond_16

    .line 406
    .line 407
    invoke-static {p2}, Ll/wib0;->g(Lcom/p1/mobile/putong/core/data/PurchaseType;)Z

    .line 408
    .line 409
    .line 410
    move-result p2

    .line 411
    if-eqz p2, :cond_16

    .line 412
    .line 413
    sget p1, Ll/jbc0;->R:I

    .line 414
    .line 415
    :cond_16
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 416
    .line 417
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 418
    .line 419
    .line 420
    return-void

    .line 421
    :pswitch_e
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 422
    .line 423
    .line 424
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 425
    .line 426
    sget p1, Ll/jbc0;->gc:I

    .line 427
    .line 428
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 429
    .line 430
    .line 431
    return-void

    .line 432
    :pswitch_f
    invoke-virtual {p0, v1, v1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 433
    .line 434
    .line 435
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 436
    .line 437
    .line 438
    move-result-object p1

    .line 439
    invoke-virtual {p1}, Ljava/util/Locale;->getLanguage()Ljava/lang/String;

    .line 440
    .line 441
    .line 442
    move-result-object p1

    .line 443
    const-string p2, "en"

    .line 444
    .line 445
    invoke-virtual {p2, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result p1

    .line 449
    if-eqz p1, :cond_17

    .line 450
    .line 451
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 452
    .line 453
    sget p1, Ll/jbc0;->C8:I

    .line 454
    .line 455
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 456
    .line 457
    .line 458
    return-void

    .line 459
    :cond_17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 460
    .line 461
    .line 462
    move-result-object p1

    .line 463
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 464
    .line 465
    .line 466
    move-result-object p1

    .line 467
    invoke-interface {p1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->z1()Z

    .line 468
    .line 469
    .line 470
    move-result p1

    .line 471
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 472
    .line 473
    if-eqz p1, :cond_18

    .line 474
    .line 475
    sget p1, Ll/jbc0;->a0:I

    .line 476
    .line 477
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 478
    .line 479
    .line 480
    return-void

    .line 481
    :cond_18
    sget p1, Ll/jbc0;->dc:I

    .line 482
    .line 483
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 484
    .line 485
    .line 486
    return-void

    .line 487
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_f
        :pswitch_e
        :pswitch_d
        :pswitch_c
        :pswitch_b
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
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public c(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 6
    .line 7
    sget p1, Ll/jbc0;->z8:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public d(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 6
    .line 7
    sget p1, Ll/jbc0;->La:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public e(Ll/a690;Lcom/p1/mobile/putong/core/data/PurchaseType;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    invoke-virtual {p0, p1, p1}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->f(II)V

    .line 3
    .line 4
    .line 5
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 6
    .line 7
    sget p1, Ll/jbc0;->Ma:I

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final f(II)V
    .locals 1

    .line 1
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 2
    .line 3
    invoke-virtual {v0}, Landroid/view/View;->getLayoutParams()Landroid/view/ViewGroup$LayoutParams;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Landroid/widget/LinearLayout$LayoutParams;

    .line 8
    .line 9
    iput p1, v0, Landroid/widget/LinearLayout$LayoutParams;->topMargin:I

    .line 10
    .line 11
    iput p2, v0, Landroid/widget/LinearLayout$LayoutParams;->bottomMargin:I

    .line 12
    .line 13
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a:Landroid/widget/ImageView;

    .line 14
    .line 15
    invoke-virtual {p0, v0}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public onFinishInflate()V
    .locals 0

    .line 1
    invoke-super {p0}, Landroid/view/View;->onFinishInflate()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0, p0}, Lcom/p1/mobile/putong/core/ui/purchase/privilege/PrivilegeImageContainerView;->a(Landroid/view/View;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method
