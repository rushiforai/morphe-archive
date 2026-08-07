.class public Ll/gwj0;
.super Ll/d0j0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/d0j0<",
        "Ll/fwj0;",
        ">;"
    }
.end annotation


# instance fields
.field public i:Lv/VRelative;

.field public j:Lv/VText;

.field public k:Lv/VFrame;

.field public l:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

.field public m:Lv/VDraweeView;

.field public n:Lv/VText;

.field public o:Lv/VText;

.field public p:Lv/VText;

.field public q:Lv/VText;

.field public r:Ljava/lang/String;


# direct methods
.method public constructor <init>(Lv/VFrame;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/d0j0;-><init>(Lv/VFrame;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public c()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/puj0;->b:Landroid/view/View;

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ll/gwj0;->y(Landroid/view/View;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public d()I
    .locals 0

    .line 1
    sget p0, Ll/yec0;->o6:I

    .line 2
    .line 3
    return p0
.end method

.method public destroy()V
    .locals 1

    .line 1
    const-string v0, ""

    .line 2
    .line 3
    iput-object v0, p0, Ll/gwj0;->r:Ljava/lang/String;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/d0j0;->p()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public e()I
    .locals 0

    .line 1
    sget p0, Ll/mdc0;->G7:I

    .line 2
    .line 3
    return p0
.end method

.method public inflateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return-object p0
.end method

.method public j(Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;ILjava/util/List;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;",
            "I",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto/16 :goto_2

    .line 4
    .line 5
    :cond_0
    iget-object p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->status:Ljava/lang/String;

    .line 6
    .line 7
    const-string v0, "speakingInTurn"

    .line 8
    .line 9
    invoke-static {p2, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p2

    .line 13
    if-nez p2, :cond_1

    .line 14
    .line 15
    goto/16 :goto_2

    .line 16
    .line 17
    :cond_1
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->getCurrentSpeaker()Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;

    .line 18
    .line 19
    .line 20
    move-result-object p2

    .line 21
    if-nez p2, :cond_2

    .line 22
    .line 23
    goto/16 :goto_2

    .line 24
    .line 25
    :cond_2
    iget-object v0, p0, Ll/gwj0;->m:Lv/VDraweeView;

    .line 26
    .line 27
    iget-object v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->mask:Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 28
    .line 29
    const/4 v2, 0x0

    .line 30
    invoke-static {v0, v1, v2}, Ll/ql3;->b(Lcom/facebook/drawee/view/SimpleDraweeView;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;Z)V

    .line 31
    .line 32
    .line 33
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 34
    .line 35
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->getCurrentPlayer(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-interface {p3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    :cond_3
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    if-eqz v1, :cond_4

    .line 52
    .line 53
    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v1

    .line 57
    check-cast v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 58
    .line 59
    iget-object v3, v1, Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;->userId:Ljava/lang/String;

    .line 60
    .line 61
    sget-object v4, Ll/zrv;->a:Ll/wrv;

    .line 62
    .line 63
    invoke-virtual {v4}, Ll/wrv;->D0()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object v4

    .line 67
    invoke-static {v3, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v3

    .line 71
    if-eqz v3, :cond_3

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_4
    const/4 v1, 0x0

    .line 75
    :goto_0
    iget-object p3, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 76
    .line 77
    sget-object v3, Ll/zrv;->a:Ll/wrv;

    .line 78
    .line 79
    invoke-virtual {v3}, Ll/wrv;->D0()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v3

    .line 83
    invoke-static {p3, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 84
    .line 85
    .line 86
    move-result p3

    .line 87
    const/4 v3, 0x1

    .line 88
    const/high16 v4, 0x42600000    # 56.0f

    .line 89
    .line 90
    const/16 v5, 0x8

    .line 91
    .line 92
    if-eqz p3, :cond_5

    .line 93
    .line 94
    iget-object p3, p0, Ll/gwj0;->n:Lv/VText;

    .line 95
    .line 96
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ic:I

    .line 97
    .line 98
    invoke-virtual {p3, v1}, Landroid/widget/TextView;->setText(I)V

    .line 99
    .line 100
    .line 101
    iget-object p3, p0, Ll/gwj0;->o:Lv/VText;

    .line 102
    .line 103
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 104
    .line 105
    .line 106
    iget-object p3, p0, Ll/gwj0;->o:Lv/VText;

    .line 107
    .line 108
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 109
    .line 110
    .line 111
    move-result-object v1

    .line 112
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    sget v6, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ac:I

    .line 117
    .line 118
    invoke-virtual {v1, v6}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 119
    .line 120
    .line 121
    move-result-object v1

    .line 122
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->word:Ljava/lang/String;

    .line 123
    .line 124
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 133
    .line 134
    .line 135
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 136
    .line 137
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Hc:I

    .line 138
    .line 139
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 140
    .line 141
    .line 142
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 143
    .line 144
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 145
    .line 146
    .line 147
    iget-object p3, p0, Ll/gwj0;->q:Lv/VText;

    .line 148
    .line 149
    invoke-virtual {p3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 150
    .line 151
    .line 152
    iget-object p3, p0, Ll/gwj0;->k:Lv/VFrame;

    .line 153
    .line 154
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    invoke-static {p3, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 159
    .line 160
    .line 161
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 162
    .line 163
    invoke-virtual {p3, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 164
    .line 165
    .line 166
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 167
    .line 168
    new-instance v0, Ll/gwj0$a;

    .line 169
    .line 170
    invoke-direct {v0, p0, p1}, Ll/gwj0$a;-><init>(Ll/gwj0;Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;)V

    .line 171
    .line 172
    .line 173
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 174
    .line 175
    .line 176
    goto/16 :goto_1

    .line 177
    .line 178
    :cond_5
    const/high16 p3, 0x42a00000    # 80.0f

    .line 179
    .line 180
    if-eqz v0, :cond_6

    .line 181
    .line 182
    iget-object v1, p0, Ll/gwj0;->n:Lv/VText;

    .line 183
    .line 184
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    invoke-virtual {v3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 189
    .line 190
    .line 191
    move-result-object v3

    .line 192
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ec:I

    .line 193
    .line 194
    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v3

    .line 198
    iget v4, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->number:I

    .line 199
    .line 200
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 201
    .line 202
    .line 203
    move-result-object v4

    .line 204
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    invoke-static {v3, v4}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v3

    .line 212
    invoke-virtual {v1, v3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 213
    .line 214
    .line 215
    iget-object v1, p0, Ll/gwj0;->o:Lv/VText;

    .line 216
    .line 217
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 218
    .line 219
    .line 220
    iget-object v1, p0, Ll/gwj0;->p:Lv/VText;

    .line 221
    .line 222
    invoke-virtual {v1, v5}, Landroid/view/View;->setVisibility(I)V

    .line 223
    .line 224
    .line 225
    iget-object v1, p0, Ll/gwj0;->q:Lv/VText;

    .line 226
    .line 227
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    .line 228
    .line 229
    .line 230
    iget-object v1, p0, Ll/gwj0;->k:Lv/VFrame;

    .line 231
    .line 232
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 233
    .line 234
    .line 235
    move-result p3

    .line 236
    invoke-static {v1, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 237
    .line 238
    .line 239
    iget-object p3, p0, Ll/gwj0;->q:Lv/VText;

    .line 240
    .line 241
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 242
    .line 243
    .line 244
    move-result-object v1

    .line 245
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ac:I

    .line 250
    .line 251
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->word:Ljava/lang/String;

    .line 256
    .line 257
    filled-new-array {v0}, [Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-static {v1, v0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 266
    .line 267
    .line 268
    goto/16 :goto_1

    .line 269
    .line 270
    :cond_6
    iget-object v0, p0, Ll/gwj0;->n:Lv/VText;

    .line 271
    .line 272
    if-eqz v1, :cond_7

    .line 273
    .line 274
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    invoke-virtual {v1}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 279
    .line 280
    .line 281
    move-result-object v1

    .line 282
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ec:I

    .line 283
    .line 284
    invoke-virtual {v1, v2}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v1

    .line 288
    iget v2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->number:I

    .line 289
    .line 290
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    invoke-static {v1, v2}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 303
    .line 304
    .line 305
    iget-object v0, p0, Ll/gwj0;->o:Lv/VText;

    .line 306
    .line 307
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 308
    .line 309
    .line 310
    iget-object v0, p0, Ll/gwj0;->p:Lv/VText;

    .line 311
    .line 312
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 313
    .line 314
    .line 315
    iget-object v0, p0, Ll/gwj0;->q:Lv/VText;

    .line 316
    .line 317
    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    .line 318
    .line 319
    .line 320
    iget-object v0, p0, Ll/gwj0;->k:Lv/VFrame;

    .line 321
    .line 322
    invoke-static {p3}, Ll/qa00;->d(F)I

    .line 323
    .line 324
    .line 325
    move-result p3

    .line 326
    invoke-static {v0, p3}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 327
    .line 328
    .line 329
    goto :goto_1

    .line 330
    :cond_7
    invoke-virtual {p0}, Ll/puj0;->C0()Landroid/content/Context;

    .line 331
    .line 332
    .line 333
    move-result-object p3

    .line 334
    invoke-virtual {p3}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    .line 335
    .line 336
    .line 337
    move-result-object p3

    .line 338
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->Ec:I

    .line 339
    .line 340
    invoke-virtual {p3, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    .line 341
    .line 342
    .line 343
    move-result-object p3

    .line 344
    iget v1, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->number:I

    .line 345
    .line 346
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 347
    .line 348
    .line 349
    move-result-object v1

    .line 350
    filled-new-array {v1}, [Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object v1

    .line 354
    invoke-static {p3, v1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 355
    .line 356
    .line 357
    move-result-object p3

    .line 358
    invoke-virtual {v0, p3}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 359
    .line 360
    .line 361
    iget-object p3, p0, Ll/gwj0;->o:Lv/VText;

    .line 362
    .line 363
    invoke-virtual {p3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 364
    .line 365
    .line 366
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 367
    .line 368
    invoke-virtual {p3, v2}, Landroid/view/View;->setVisibility(I)V

    .line 369
    .line 370
    .line 371
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 372
    .line 373
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Kc:I

    .line 374
    .line 375
    invoke-virtual {p3, v0}, Landroid/widget/TextView;->setText(I)V

    .line 376
    .line 377
    .line 378
    iget-object p3, p0, Ll/gwj0;->q:Lv/VText;

    .line 379
    .line 380
    invoke-virtual {p3, v5}, Landroid/view/View;->setVisibility(I)V

    .line 381
    .line 382
    .line 383
    iget-object p3, p0, Ll/gwj0;->k:Lv/VFrame;

    .line 384
    .line 385
    invoke-static {v4}, Ll/qa00;->d(F)I

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    invoke-static {p3, v0}, Ll/bnl0;->X(Landroid/view/View;I)V

    .line 390
    .line 391
    .line 392
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 393
    .line 394
    invoke-virtual {p3, v3}, Landroid/view/View;->setEnabled(Z)V

    .line 395
    .line 396
    .line 397
    iget-object p3, p0, Ll/gwj0;->p:Lv/VText;

    .line 398
    .line 399
    new-instance v0, Ll/gwj0$b;

    .line 400
    .line 401
    invoke-direct {v0, p0}, Ll/gwj0$b;-><init>(Ll/gwj0;)V

    .line 402
    .line 403
    .line 404
    invoke-virtual {p3, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    .line 405
    .line 406
    .line 407
    :goto_1
    iget-object p3, p0, Ll/gwj0;->r:Ljava/lang/String;

    .line 408
    .line 409
    iget-object v0, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 410
    .line 411
    invoke-static {p3, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 412
    .line 413
    .line 414
    move-result p3

    .line 415
    if-nez p3, :cond_8

    .line 416
    .line 417
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverCurrentPlayer;->userId:Ljava/lang/String;

    .line 418
    .line 419
    iput-object p2, p0, Ll/gwj0;->r:Ljava/lang/String;

    .line 420
    .line 421
    invoke-virtual {p0}, Ll/d0j0;->p()V

    .line 422
    .line 423
    .line 424
    iget p2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->remainSeconds:I

    .line 425
    .line 426
    iget p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveUndercoverGame;->countDownSeconds:I

    .line 427
    .line 428
    invoke-virtual {p0, p2, p1}, Ll/d0j0;->w(II)V

    .line 429
    .line 430
    .line 431
    :cond_8
    :goto_2
    return-void
.end method

.method public v()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/puj0;->c:Ll/ouj0;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    check-cast p0, Ll/fwj0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ouj0;->J3()Ll/jvj0;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/jvj0;->u4()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public x()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/d0j0;->x()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/gwj0;->j:Lv/VText;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/d0j0;->u()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/gwj0;->l:Lcom/p1/mobile/putong/live/base/view/CircularProgressView;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/d0j0;->q()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    int-to-float p0, p0

    .line 20
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/base/view/CircularProgressView;->setProgress(F)V

    .line 21
    .line 22
    .line 23
    return-void
.end method

.method public final y(Landroid/view/View;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/hwj0;->a(Ll/gwj0;Landroid/view/View;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
