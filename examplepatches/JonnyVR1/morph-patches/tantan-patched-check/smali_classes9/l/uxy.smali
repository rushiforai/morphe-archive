.class public Ll/uxy;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/OfficialAccount;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/OfficialAccount;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static b(Ljava/lang/String;Z)Ljava/util/List;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Z)",
            "Ljava/util/List<",
            "Ll/rxy;",
            ">;"
        }
    .end annotation

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->M2:Lcom/p1/mobile/putong/core/api/g$d;

    .line 6
    .line 7
    invoke-virtual {p1}, Ll/mof0;->n()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    check-cast p1, Ljava/util/Collection;

    .line 12
    .line 13
    new-instance v0, Ll/txy;

    .line 14
    .line 15
    invoke-direct {v0, p0}, Ll/txy;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-static {p1, v0}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    check-cast p1, Lcom/p1/mobile/putong/core/data/OfficialAccount;

    .line 23
    .line 24
    new-instance p1, Ljava/util/ArrayList;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 27
    .line 28
    .line 29
    new-instance v0, Ll/wxy;

    .line 30
    .line 31
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->SHI_PAI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 32
    .line 33
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 34
    .line 35
    .line 36
    move-result-object v2

    .line 37
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 38
    .line 39
    .line 40
    move-result-object v2

    .line 41
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 42
    .line 43
    .line 44
    move-result v2

    .line 45
    if-eqz v2, :cond_0

    .line 46
    .line 47
    sget v2, Ll/ibc0;->L4:I

    .line 48
    .line 49
    goto :goto_0

    .line 50
    :cond_0
    sget v2, Ll/ibc0;->K4:I

    .line 51
    .line 52
    :goto_0
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 53
    .line 54
    .line 55
    move-result-object v3

    .line 56
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 61
    .line 62
    .line 63
    move-result v3

    .line 64
    if-eqz v3, :cond_1

    .line 65
    .line 66
    sget v3, Ll/ibc0;->N4:I

    .line 67
    .line 68
    goto :goto_1

    .line 69
    :cond_1
    sget v3, Ll/ibc0;->M4:I

    .line 70
    .line 71
    :goto_1
    invoke-direct {v0, v1, v2, v3}, Ll/wxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    .line 72
    .line 73
    .line 74
    invoke-static {}, Ll/uxy;->d()I

    .line 75
    .line 76
    .line 77
    move-result v1

    .line 78
    invoke-virtual {v0, v1}, Ll/wxy;->l(I)Ll/wxy;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    const/4 v1, -0x1

    .line 83
    invoke-virtual {v0, v1}, Ll/wxy;->m(I)Ll/wxy;

    .line 84
    .line 85
    .line 86
    new-instance v0, Ll/vxy;

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->PIC:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 89
    .line 90
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 91
    .line 92
    .line 93
    move-result-object v2

    .line 94
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 95
    .line 96
    .line 97
    move-result-object v2

    .line 98
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 99
    .line 100
    .line 101
    move-result v2

    .line 102
    if-eqz v2, :cond_2

    .line 103
    .line 104
    sget v2, Ll/ibc0;->J4:I

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_2
    sget v2, Ll/ibc0;->I4:I

    .line 108
    .line 109
    :goto_2
    invoke-direct {v0, v1, v2}, Ll/vxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V

    .line 110
    .line 111
    .line 112
    invoke-static {}, Ll/uxy;->d()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-virtual {v0, v1}, Ll/yxy;->l(I)Ll/yxy;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    invoke-static {}, Ll/uxy;->e()I

    .line 121
    .line 122
    .line 123
    move-result v1

    .line 124
    invoke-virtual {v0, v1}, Ll/yxy;->n(I)Ll/yxy;

    .line 125
    .line 126
    .line 127
    new-instance v0, Ll/sxy;

    .line 128
    .line 129
    sget-object v1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->EMOJI:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 130
    .line 131
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    invoke-virtual {v2}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    invoke-interface {v2}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 140
    .line 141
    .line 142
    move-result v2

    .line 143
    if-eqz v2, :cond_3

    .line 144
    .line 145
    sget v2, Ll/ibc0;->A4:I

    .line 146
    .line 147
    goto :goto_3

    .line 148
    :cond_3
    sget v2, Ll/ibc0;->z4:I

    .line 149
    .line 150
    :goto_3
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 151
    .line 152
    .line 153
    move-result-object v3

    .line 154
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 155
    .line 156
    .line 157
    move-result-object v3

    .line 158
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 159
    .line 160
    .line 161
    move-result v3

    .line 162
    if-eqz v3, :cond_4

    .line 163
    .line 164
    sget v3, Ll/ibc0;->E4:I

    .line 165
    .line 166
    goto :goto_4

    .line 167
    :cond_4
    sget v3, Ll/ibc0;->D4:I

    .line 168
    .line 169
    :goto_4
    invoke-direct {v0, v1, v2, v3}, Ll/sxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    .line 170
    .line 171
    .line 172
    invoke-static {}, Ll/uxy;->d()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-virtual {v0, v1}, Ll/sxy;->p(I)Ll/sxy;

    .line 177
    .line 178
    .line 179
    move-result-object v0

    .line 180
    invoke-static {}, Ll/uxy;->e()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    invoke-virtual {v0, v1}, Ll/sxy;->q(I)Ll/sxy;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    new-instance v1, Ll/zxy;

    .line 189
    .line 190
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->AUDIO:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 191
    .line 192
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 193
    .line 194
    .line 195
    move-result-object v3

    .line 196
    invoke-virtual {v3}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    invoke-interface {v3}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 201
    .line 202
    .line 203
    move-result v3

    .line 204
    if-eqz v3, :cond_5

    .line 205
    .line 206
    sget v3, Ll/ibc0;->y4:I

    .line 207
    .line 208
    goto :goto_5

    .line 209
    :cond_5
    sget v3, Ll/ibc0;->x4:I

    .line 210
    .line 211
    :goto_5
    invoke-direct {v1, v2, v3}, Ll/zxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V

    .line 212
    .line 213
    .line 214
    invoke-static {}, Ll/uxy;->d()I

    .line 215
    .line 216
    .line 217
    move-result v2

    .line 218
    invoke-virtual {v1, v2}, Ll/yxy;->l(I)Ll/yxy;

    .line 219
    .line 220
    .line 221
    move-result-object v1

    .line 222
    invoke-static {}, Ll/uxy;->e()I

    .line 223
    .line 224
    .line 225
    move-result v2

    .line 226
    invoke-virtual {v1, v2}, Ll/yxy;->n(I)Ll/yxy;

    .line 227
    .line 228
    .line 229
    move-result-object v1

    .line 230
    invoke-virtual {v1}, Ll/rxy;->h()Ll/rxy;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    invoke-interface {p1, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 235
    .line 236
    .line 237
    invoke-interface {p1, v1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 238
    .line 239
    .line 240
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 241
    .line 242
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 243
    .line 244
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/g;->J0:Ll/wyd0;

    .line 245
    .line 246
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Ljava/lang/CharSequence;

    .line 251
    .line 252
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 253
    .line 254
    .line 255
    move-result p0

    .line 256
    if-nez p0, :cond_7

    .line 257
    .line 258
    new-instance p0, Ll/zxy;

    .line 259
    .line 260
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->GIFT:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 261
    .line 262
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 267
    .line 268
    .line 269
    move-result-object v1

    .line 270
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-eqz v1, :cond_6

    .line 275
    .line 276
    sget v1, Ll/ibc0;->C4:I

    .line 277
    .line 278
    goto :goto_6

    .line 279
    :cond_6
    sget v1, Ll/ibc0;->B4:I

    .line 280
    .line 281
    :goto_6
    invoke-direct {p0, v0, v1}, Ll/zxy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V

    .line 282
    .line 283
    .line 284
    invoke-static {}, Ll/uxy;->d()I

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    invoke-virtual {p0, v0}, Ll/yxy;->l(I)Ll/yxy;

    .line 289
    .line 290
    .line 291
    move-result-object p0

    .line 292
    invoke-static {}, Ll/uxy;->e()I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    invoke-virtual {p0, v0}, Ll/yxy;->n(I)Ll/yxy;

    .line 297
    .line 298
    .line 299
    move-result-object p0

    .line 300
    const/4 v0, 0x0

    .line 301
    invoke-virtual {p0, v0}, Ll/rxy;->k(Z)Ll/rxy;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 306
    .line 307
    .line 308
    :cond_7
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 309
    .line 310
    .line 311
    move-result-object p0

    .line 312
    invoke-virtual {p0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 313
    .line 314
    .line 315
    move-result-object p0

    .line 316
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 317
    .line 318
    .line 319
    move-result p0

    .line 320
    if-eqz p0, :cond_8

    .line 321
    .line 322
    new-instance p0, Ll/ayy;

    .line 323
    .line 324
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->MORE:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 325
    .line 326
    sget v1, Ll/ibc0;->G4:I

    .line 327
    .line 328
    sget v2, Ll/ibc0;->H4:I

    .line 329
    .line 330
    invoke-direct {p0, v0, v1, v2}, Ll/ayy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;II)V

    .line 331
    .line 332
    .line 333
    invoke-static {}, Ll/uxy;->d()I

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    invoke-virtual {p0, v0}, Ll/yxy;->l(I)Ll/yxy;

    .line 338
    .line 339
    .line 340
    move-result-object p0

    .line 341
    invoke-static {}, Ll/uxy;->e()I

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    invoke-virtual {p0, v0}, Ll/yxy;->n(I)Ll/yxy;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 350
    .line 351
    .line 352
    return-object p1

    .line 353
    :cond_8
    new-instance p0, Ll/ayy;

    .line 354
    .line 355
    sget-object v0, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;->MORE:Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;

    .line 356
    .line 357
    sget v1, Ll/ibc0;->F4:I

    .line 358
    .line 359
    invoke-direct {p0, v0, v1}, Ll/ayy;-><init>(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemType;I)V

    .line 360
    .line 361
    .line 362
    invoke-static {}, Ll/uxy;->d()I

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    invoke-virtual {p0, v0}, Ll/yxy;->l(I)Ll/yxy;

    .line 367
    .line 368
    .line 369
    move-result-object p0

    .line 370
    invoke-static {}, Ll/uxy;->e()I

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    invoke-virtual {p0, v0}, Ll/yxy;->n(I)Ll/yxy;

    .line 375
    .line 376
    .line 377
    move-result-object p0

    .line 378
    invoke-interface {p1, p0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 379
    .line 380
    .line 381
    return-object p1
.end method

.method public static c(Ll/rxy;Landroid/content/Context;II)Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;
    .locals 2

    .line 1
    invoke-static {p1}, Ll/p9r;->a(Landroid/content/Context;)Landroid/view/LayoutInflater;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget v0, Ll/qec0;->K2:I

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    check-cast p1, Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;

    .line 13
    .line 14
    invoke-virtual {p0, p1, p2, p3}, Ll/rxy;->c(Lcom/p1/mobile/putong/core/ui/messages/model/messagebar/MessageBarActionItemView;II)V

    .line 15
    .line 16
    .line 17
    return-object p1
.end method

.method public static d()I
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const/high16 v0, 0x66000000

    .line 16
    .line 17
    return v0

    .line 18
    :cond_0
    const/high16 v0, 0x4c000000    # 3.3554432E7f

    .line 19
    .line 20
    return v0
.end method

.method public static e()I
    .locals 1

    .line 1
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const v0, -0x8ff6

    .line 16
    .line 17
    .line 18
    return v0

    .line 19
    :cond_0
    const v0, -0x181e3

    .line 20
    .line 21
    .line 22
    return v0
.end method

.method public static f(Ljava/lang/String;Z)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    const/4 v1, 0x1

    .line 14
    if-nez p0, :cond_1

    .line 15
    .line 16
    invoke-static {}, Ll/h39;->S()Z

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    if-eqz p0, :cond_1

    .line 21
    .line 22
    if-nez p1, :cond_1

    .line 23
    .line 24
    if-eqz v0, :cond_1

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isHeartbeatConv()Z

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/data/Conversation;->isSeeUpgradedConv()Z

    .line 33
    .line 34
    .line 35
    move-result p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_0
    const/4 p0, 0x0

    .line 40
    goto :goto_1

    .line 41
    :cond_1
    :goto_0
    move p0, v1

    .line 42
    :goto_1
    xor-int/2addr p0, v1

    .line 43
    return p0
.end method

.method public static g(Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)Z
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 10
    .line 11
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 12
    .line 13
    iget-object v1, v1, Ll/dkb;->U1:Lrx/subjects/a;

    .line 14
    .line 15
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    check-cast v1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 20
    .line 21
    invoke-static {p0}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_0

    .line 26
    .line 27
    invoke-static {}, Ll/h39;->N()Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    if-nez p1, :cond_0

    .line 34
    .line 35
    if-eqz v0, :cond_0

    .line 36
    .line 37
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 38
    .line 39
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 40
    .line 41
    invoke-virtual {p0, p2}, Ll/dkb;->Aa(Lcom/p1/mobile/putong/data/User;)Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-nez p0, :cond_0

    .line 46
    .line 47
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-nez p0, :cond_0

    .line 52
    .line 53
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 54
    .line 55
    .line 56
    move-result p0

    .line 57
    if-nez p0, :cond_0

    .line 58
    .line 59
    if-eqz v1, :cond_0

    .line 60
    .line 61
    iget-boolean p0, v1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->display:Z

    .line 62
    .line 63
    if-eqz p0, :cond_0

    .line 64
    .line 65
    iget-wide p0, v1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 66
    .line 67
    invoke-static {}, Ll/pzi0;->o()J

    .line 68
    .line 69
    .line 70
    move-result-wide v1

    .line 71
    long-to-double v1, v1

    .line 72
    cmpl-double p0, p0, v1

    .line 73
    .line 74
    if-lez p0, :cond_0

    .line 75
    .line 76
    iget-object p0, v0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 77
    .line 78
    const-string p1, "default"

    .line 79
    .line 80
    invoke-static {p0, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 81
    .line 82
    .line 83
    move-result p0

    .line 84
    if-eqz p0, :cond_0

    .line 85
    .line 86
    const/4 p0, 0x1

    .line 87
    return p0

    .line 88
    :cond_0
    const/4 p0, 0x0

    .line 89
    return p0
.end method

.method public static h(Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)Z
    .locals 1

    .line 1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 4
    .line 5
    invoke-virtual {p1, p0}, Lcom/p1/mobile/putong/core/api/g;->zp(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    invoke-static {}, Ll/h39;->R()Z

    .line 10
    .line 11
    .line 12
    move-result p1

    .line 13
    if-eqz p1, :cond_0

    .line 14
    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    if-eqz p2, :cond_0

    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 20
    .line 21
    const-string v0, "default"

    .line 22
    .line 23
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-eqz p1, :cond_0

    .line 28
    .line 29
    iget-object p0, p0, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 30
    .line 31
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-eqz p0, :cond_0

    .line 36
    .line 37
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 38
    .line 39
    .line 40
    move-result p0

    .line 41
    if-nez p0, :cond_0

    .line 42
    .line 43
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_0

    .line 48
    .line 49
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/User;->isAccountCancellation()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-nez p0, :cond_0

    .line 54
    .line 55
    const/4 p0, 0x1

    .line 56
    return p0

    .line 57
    :cond_0
    const/4 p0, 0x0

    .line 58
    return p0
.end method
