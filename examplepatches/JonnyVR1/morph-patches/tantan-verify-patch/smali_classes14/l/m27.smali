.class public Ll/m27;
.super Ll/dy6;
.source "SourceFile"


# instance fields
.field public R:Z

.field public S:Z

.field public final T:Lrx/subjects/a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/a<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/BoostStatus;",
            ">;>;"
        }
    .end annotation
.end field

.field public final U:Ll/byd0;

.field public final V:Ll/jxd0;

.field public W:Ll/jxd0;

.field public X:Ll/jxd0;

.field public final Y:Ll/jxd0;

.field public final Z:Ll/jxd0;

.field public a0:Ll/jxd0;

.field public final b0:Ll/vxd0;

.field public final c0:Ll/vxd0;

.field public final d0:Ll/vxd0;

.field public final e0:Ll/jxd0;

.field public final f0:Ll/byd0;

.field public final g0:Ll/byd0;

.field public final h0:Ll/byd0;

.field public final i0:Ll/vxd0;

.field public final j0:Ll/jxd0;

.field public final k0:Ll/byd0;

.field public final l0:Ll/wyd0;

.field public final m0:Ll/jxd0;

.field public n0:Z

.field public o0:Z

.field public volatile p0:I

.field public q0:Z

.field public volatile r0:I


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/api/c;)V
    .locals 5

    .line 1
    invoke-direct {p0, p1}, Ll/dy6;-><init>(Lcom/p1/mobile/putong/core/api/c;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lcom/google/common/base/Optional;->absent()Lcom/google/common/base/Optional;

    .line 5
    .line 6
    .line 7
    move-result-object p1

    .line 8
    invoke-static {p1}, Lrx/subjects/a;->c(Ljava/lang/Object;)Lrx/subjects/a;

    .line 9
    .line 10
    .line 11
    move-result-object p1

    .line 12
    iput-object p1, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 13
    .line 14
    new-instance p1, Ll/byd0;

    .line 15
    .line 16
    new-instance v0, Ljava/lang/StringBuilder;

    .line 17
    .line 18
    const-string v1, "tantan_coin_boost_bubble_shown_time_"

    .line 19
    .line 20
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 21
    .line 22
    .line 23
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v1

    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    const-wide/16 v1, 0x0

    .line 39
    .line 40
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 45
    .line 46
    .line 47
    iput-object p1, p0, Ll/m27;->U:Ll/byd0;

    .line 48
    .line 49
    new-instance p1, Ll/jxd0;

    .line 50
    .line 51
    new-instance v0, Ljava/lang/StringBuilder;

    .line 52
    .line 53
    const-string v2, "is_in_super_boost"

    .line 54
    .line 55
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 56
    .line 57
    .line 58
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    invoke-interface {v2}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v2

    .line 66
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 74
    .line 75
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Ll/m27;->V:Ll/jxd0;

    .line 79
    .line 80
    new-instance p1, Ll/jxd0;

    .line 81
    .line 82
    new-instance v0, Ljava/lang/StringBuilder;

    .line 83
    .line 84
    const-string v3, "need_show_boosted_dialog"

    .line 85
    .line 86
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 87
    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 90
    .line 91
    .line 92
    move-result-object v3

    .line 93
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 98
    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 105
    .line 106
    .line 107
    iput-object p1, p0, Ll/m27;->W:Ll/jxd0;

    .line 108
    .line 109
    new-instance p1, Ll/jxd0;

    .line 110
    .line 111
    new-instance v0, Ljava/lang/StringBuilder;

    .line 112
    .line 113
    const-string v3, "boost_has_been_used_"

    .line 114
    .line 115
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 119
    .line 120
    .line 121
    move-result-object v3

    .line 122
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 127
    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 134
    .line 135
    .line 136
    iput-object p1, p0, Ll/m27;->X:Ll/jxd0;

    .line 137
    .line 138
    new-instance p1, Ll/jxd0;

    .line 139
    .line 140
    new-instance v0, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    const-string v3, "boost_confirm_dialog_shown_"

    .line 143
    .line 144
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 148
    .line 149
    .line 150
    move-result-object v3

    .line 151
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 156
    .line 157
    .line 158
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 163
    .line 164
    .line 165
    iput-object p1, p0, Ll/m27;->Y:Ll/jxd0;

    .line 166
    .line 167
    new-instance p1, Ll/jxd0;

    .line 168
    .line 169
    new-instance v0, Ljava/lang/StringBuilder;

    .line 170
    .line 171
    const-string v3, "given_user_once_boost_"

    .line 172
    .line 173
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 177
    .line 178
    .line 179
    move-result-object v3

    .line 180
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 185
    .line 186
    .line 187
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 192
    .line 193
    .line 194
    iput-object p1, p0, Ll/m27;->Z:Ll/jxd0;

    .line 195
    .line 196
    new-instance p1, Ll/jxd0;

    .line 197
    .line 198
    new-instance v0, Ljava/lang/StringBuilder;

    .line 199
    .line 200
    const-string v3, "is_allow_show_boost_entrance_"

    .line 201
    .line 202
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 203
    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 206
    .line 207
    .line 208
    move-result-object v3

    .line 209
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 221
    .line 222
    invoke-direct {p1, v0, v3}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 223
    .line 224
    .line 225
    iput-object p1, p0, Ll/m27;->a0:Ll/jxd0;

    .line 226
    .line 227
    new-instance p1, Ll/vxd0;

    .line 228
    .line 229
    new-instance v0, Ljava/lang/StringBuilder;

    .line 230
    .line 231
    const-string v3, "guide_use_boost_times_in_today_"

    .line 232
    .line 233
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 234
    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    invoke-interface {v3}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v3

    .line 244
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 245
    .line 246
    .line 247
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    const/4 v3, 0x0

    .line 252
    invoke-direct {p1, v0, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 253
    .line 254
    .line 255
    iput-object p1, p0, Ll/m27;->b0:Ll/vxd0;

    .line 256
    .line 257
    new-instance p1, Ll/vxd0;

    .line 258
    .line 259
    new-instance v0, Ljava/lang/StringBuilder;

    .line 260
    .line 261
    const-string v4, "guide_boosting_times_in_today_"

    .line 262
    .line 263
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 264
    .line 265
    .line 266
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 267
    .line 268
    .line 269
    move-result-object v4

    .line 270
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v4

    .line 274
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 275
    .line 276
    .line 277
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 278
    .line 279
    .line 280
    move-result-object v0

    .line 281
    invoke-direct {p1, v0, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 282
    .line 283
    .line 284
    iput-object p1, p0, Ll/m27;->c0:Ll/vxd0;

    .line 285
    .line 286
    new-instance p1, Ll/vxd0;

    .line 287
    .line 288
    new-instance v0, Ljava/lang/StringBuilder;

    .line 289
    .line 290
    const-string v4, "guide_buy_boost_times_in_today_"

    .line 291
    .line 292
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 293
    .line 294
    .line 295
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 296
    .line 297
    .line 298
    move-result-object v4

    .line 299
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 300
    .line 301
    .line 302
    move-result-object v4

    .line 303
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 304
    .line 305
    .line 306
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v0

    .line 310
    invoke-direct {p1, v0, v3}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 311
    .line 312
    .line 313
    iput-object p1, p0, Ll/m27;->d0:Ll/vxd0;

    .line 314
    .line 315
    new-instance p1, Ll/jxd0;

    .line 316
    .line 317
    new-instance v0, Ljava/lang/StringBuilder;

    .line 318
    .line 319
    const-string v4, "force_like_"

    .line 320
    .line 321
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 322
    .line 323
    .line 324
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 325
    .line 326
    .line 327
    move-result-object v4

    .line 328
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 333
    .line 334
    .line 335
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 340
    .line 341
    .line 342
    iput-object p1, p0, Ll/m27;->e0:Ll/jxd0;

    .line 343
    .line 344
    new-instance p1, Ll/byd0;

    .line 345
    .line 346
    new-instance v0, Ljava/lang/StringBuilder;

    .line 347
    .line 348
    const-string v4, "boost_guide"

    .line 349
    .line 350
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 351
    .line 352
    .line 353
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 354
    .line 355
    .line 356
    move-result-object v4

    .line 357
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 358
    .line 359
    .line 360
    move-result-object v4

    .line 361
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 362
    .line 363
    .line 364
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 365
    .line 366
    .line 367
    move-result-object v0

    .line 368
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 369
    .line 370
    .line 371
    iput-object p1, p0, Ll/m27;->f0:Ll/byd0;

    .line 372
    .line 373
    new-instance p1, Ll/byd0;

    .line 374
    .line 375
    new-instance v0, Ljava/lang/StringBuilder;

    .line 376
    .line 377
    const-string v4, "last_o_dimond_request_boost_"

    .line 378
    .line 379
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 383
    .line 384
    .line 385
    move-result-object v4

    .line 386
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 387
    .line 388
    .line 389
    move-result-object v4

    .line 390
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 391
    .line 392
    .line 393
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 394
    .line 395
    .line 396
    move-result-object v0

    .line 397
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 398
    .line 399
    .line 400
    iput-object p1, p0, Ll/m27;->g0:Ll/byd0;

    .line 401
    .line 402
    new-instance p1, Ll/byd0;

    .line 403
    .line 404
    new-instance v0, Ljava/lang/StringBuilder;

    .line 405
    .line 406
    const-string v4, "last_ultra_premium_request_boost_"

    .line 407
    .line 408
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 409
    .line 410
    .line 411
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 412
    .line 413
    .line 414
    move-result-object v4

    .line 415
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 416
    .line 417
    .line 418
    move-result-object v4

    .line 419
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 420
    .line 421
    .line 422
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 427
    .line 428
    .line 429
    iput-object p1, p0, Ll/m27;->h0:Ll/byd0;

    .line 430
    .line 431
    new-instance p1, Ll/vxd0;

    .line 432
    .line 433
    new-instance v0, Ljava/lang/StringBuilder;

    .line 434
    .line 435
    const-string v4, "boost_guide_close"

    .line 436
    .line 437
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 438
    .line 439
    .line 440
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 441
    .line 442
    .line 443
    move-result-object v4

    .line 444
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 445
    .line 446
    .line 447
    move-result-object v4

    .line 448
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 449
    .line 450
    .line 451
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 452
    .line 453
    .line 454
    move-result-object v0

    .line 455
    const/16 v4, 0x3e8

    .line 456
    .line 457
    invoke-direct {p1, v0, v4}, Ll/vxd0;-><init>(Ljava/lang/String;I)V

    .line 458
    .line 459
    .line 460
    iput-object p1, p0, Ll/m27;->i0:Ll/vxd0;

    .line 461
    .line 462
    new-instance p1, Ll/jxd0;

    .line 463
    .line 464
    new-instance v0, Ljava/lang/StringBuilder;

    .line 465
    .line 466
    const-string v4, "showed_boost_guide"

    .line 467
    .line 468
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 469
    .line 470
    .line 471
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 472
    .line 473
    .line 474
    move-result-object v4

    .line 475
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 476
    .line 477
    .line 478
    move-result-object v4

    .line 479
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 480
    .line 481
    .line 482
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 487
    .line 488
    .line 489
    iput-object p1, p0, Ll/m27;->j0:Ll/jxd0;

    .line 490
    .line 491
    new-instance p1, Ll/byd0;

    .line 492
    .line 493
    new-instance v0, Ljava/lang/StringBuilder;

    .line 494
    .line 495
    const-string v4, "last_finished_boost_id"

    .line 496
    .line 497
    invoke-direct {v0, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 498
    .line 499
    .line 500
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 501
    .line 502
    .line 503
    move-result-object v4

    .line 504
    invoke-interface {v4}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    invoke-virtual {v0, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 509
    .line 510
    .line 511
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 512
    .line 513
    .line 514
    move-result-object v0

    .line 515
    invoke-direct {p1, v0, v1}, Ll/byd0;-><init>(Ljava/lang/String;Ljava/lang/Long;)V

    .line 516
    .line 517
    .line 518
    iput-object p1, p0, Ll/m27;->k0:Ll/byd0;

    .line 519
    .line 520
    new-instance p1, Ll/wyd0;

    .line 521
    .line 522
    new-instance v0, Ljava/lang/StringBuilder;

    .line 523
    .line 524
    const-string v1, "last_boosting_id"

    .line 525
    .line 526
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 527
    .line 528
    .line 529
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 534
    .line 535
    .line 536
    move-result-object v1

    .line 537
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 538
    .line 539
    .line 540
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 541
    .line 542
    .line 543
    move-result-object v0

    .line 544
    const-string v1, ""

    .line 545
    .line 546
    invoke-direct {p1, v0, v1}, Ll/wyd0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 547
    .line 548
    .line 549
    iput-object p1, p0, Ll/m27;->l0:Ll/wyd0;

    .line 550
    .line 551
    new-instance p1, Ll/jxd0;

    .line 552
    .line 553
    new-instance v0, Ljava/lang/StringBuilder;

    .line 554
    .line 555
    const-string v1, "showed_first_trial_4_new_user"

    .line 556
    .line 557
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 558
    .line 559
    .line 560
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 561
    .line 562
    .line 563
    move-result-object v1

    .line 564
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v1

    .line 568
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 569
    .line 570
    .line 571
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 572
    .line 573
    .line 574
    move-result-object v0

    .line 575
    invoke-direct {p1, v0, v2}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 576
    .line 577
    .line 578
    iput-object p1, p0, Ll/m27;->m0:Ll/jxd0;

    .line 579
    .line 580
    iput-boolean v3, p0, Ll/m27;->n0:Z

    .line 581
    .line 582
    iput-boolean v3, p0, Ll/m27;->o0:Z

    .line 583
    .line 584
    iput v3, p0, Ll/m27;->p0:I

    .line 585
    .line 586
    iput-boolean v3, p0, Ll/m27;->q0:Z

    .line 587
    .line 588
    iput v3, p0, Ll/m27;->r0:I

    .line 589
    .line 590
    return-void
.end method

.method public static B3()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jan;->z3()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lqb;->u4()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    return v0
.end method

.method public static D3()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jan;->L3()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lqb;->Z4()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    return v0
.end method

.method public static E3()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jan;->T3()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lqb;->y5()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    return v0
.end method

.method public static I3()Z
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 8
    .line 9
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 10
    .line 11
    invoke-virtual {v2}, Ll/m27;->w3()J

    .line 12
    .line 13
    .line 14
    move-result-wide v2

    .line 15
    sub-long/2addr v2, v0

    .line 16
    const-wide/16 v0, 0x0

    .line 17
    .line 18
    cmp-long v0, v2, v0

    .line 19
    .line 20
    if-lez v0, :cond_0

    .line 21
    .line 22
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 25
    .line 26
    invoke-virtual {v0}, Ll/m27;->F3()Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    const/4 v0, 0x1

    .line 33
    return v0

    .line 34
    :cond_0
    const/4 v0, 0x0

    .line 35
    return v0
.end method

.method public static synthetic a3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/j27;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/j27;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostPeakTime;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/k27;

    .line 13
    .line 14
    invoke-direct {v1}, Ll/k27;-><init>()V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    return-object v0
.end method

.method public static synthetic b3(Ll/m27;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m27;->M3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic c3(Ll/m27;Ljava/lang/String;Lrx/c$d;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m27;->R3(Ljava/lang/String;Lrx/c$d;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic d3(Ll/m27;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m27;->L3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic e3(Ll/m27;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m27;->P3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic f3(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->L1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic g3(Ll/m27;Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m27;->S3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic h3(Ljava/lang/String;)Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->L1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    sget-object v1, Lcom/p1/mobile/putong/api/api/Network;->JSON:Ll/e7y;

    .line 16
    .line 17
    invoke-static {v1, p0}, Ll/z1d0;->create(Ll/e7y;Ljava/lang/String;)Ll/z1d0;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {v0, p0}, Ll/x1d0$a;->k(Ll/z1d0;)Ll/x1d0$a;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    return-object p0
.end method

.method public static synthetic i3(Ll/m27;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m27;->Q3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic j3(Ll/m27;)Ll/x1d0;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m27;->O3()Ll/x1d0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic k3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static synthetic l3(Lcom/p1/mobile/putong/core/data/BoostPeakTime;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BoostPeakTime;->data:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public static synthetic m3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/api/a;->L1()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0
.end method

.method public static synthetic n3(Ll/m27;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/m27;->N3()Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic o3()Ll/x1d0;
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-static {v1}, Lcom/p1/mobile/putong/core/api/a;->j(Ljava/lang/String;)Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    return-object v0
.end method

.method public static synthetic p3(Ll/m27;Lcom/p1/mobile/putong/core/data/BoostQuery;)Ll/uxj0;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/m27;->K3(Lcom/p1/mobile/putong/core/data/BoostQuery;)Ll/uxj0;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic q3(Ll/m27;Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/m27;->T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    move-result-object p0

    return-object p0
.end method

.method public static u3()Ljava/lang/String;
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jan;->y3()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    return-object v0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lqb;->t4()Ljava/lang/String;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    return-object v0
.end method

.method public static z3()I
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 12
    .line 13
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 14
    .line 15
    invoke-virtual {v0}, Ll/jan;->s3()I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    return v0

    .line 20
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 21
    .line 22
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 23
    .line 24
    invoke-virtual {v0}, Ll/lqb;->m4()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    return v0
.end method


# virtual methods
.method public final A3(Z)Ljava/lang/String;
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    invoke-interface {p0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    const-string p0, "diamond"

    .line 14
    .line 15
    return-object p0

    .line 16
    :cond_0
    invoke-static {p1}, Ll/lqb;->i4(Z)Ljava/lang/String;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    return-object p0
.end method

.method public C3()I
    .locals 0

    .line 1
    iget p0, p0, Ll/m27;->p0:I

    .line 2
    .line 3
    return p0
.end method

.method public F3()Z
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/common/base/Optional;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/common/base/Optional;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 28
    .line 29
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/BoostStatus;->active:Z

    .line 30
    .line 31
    if-eqz p0, :cond_0

    .line 32
    .line 33
    const/4 p0, 0x1

    .line 34
    return p0

    .line 35
    :cond_0
    const/4 p0, 0x0

    .line 36
    return p0
.end method

.method public G3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m27;->V:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public H3()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/m27;->R:Z

    .line 2
    .line 3
    return p0
.end method

.method public J3()Z
    .locals 0

    .line 1
    iget p0, p0, Ll/m27;->r0:I

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    const/4 p0, 0x1

    .line 6
    return p0

    .line 7
    :cond_0
    const/4 p0, 0x0

    .line 8
    return p0
.end method

.method public final synthetic K3(Lcom/p1/mobile/putong/core/data/BoostQuery;)Ll/uxj0;
    .locals 1

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/BoostQuery;->data:Lcom/p1/mobile/putong/core/data/BoostQueryData;

    .line 2
    .line 3
    iget v0, p1, Lcom/p1/mobile/putong/core/data/BoostQueryData;->likeCount:I

    .line 4
    .line 5
    iput v0, p0, Ll/m27;->p0:I

    .line 6
    .line 7
    iget p1, p1, Lcom/p1/mobile/putong/core/data/BoostQueryData;->allCount:I

    .line 8
    .line 9
    iput p1, p0, Ll/m27;->r0:I

    .line 10
    .line 11
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 12
    .line 13
    return-object p0
.end method

.method public final synthetic L3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/w17;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/w17;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/BoostQuery;->JSON_ADAPTER:Lcom/tantanapp/common/data/JsonAdapter;

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/qi20;->c(Ll/pcj;Lcom/tantanapp/common/data/JsonAdapter;)Lrx/c;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Ll/x17;

    .line 13
    .line 14
    invoke-direct {v1, p0}, Ll/x17;-><init>(Ll/m27;)V

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    return-object p0
.end method

.method public final synthetic M3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 2

    .line 1
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 2
    .line 3
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 8
    .line 9
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    .line 10
    .line 11
    invoke-static {p1}, Ll/jyb;->l0(Ljava/util/List;)Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    check-cast p1, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 16
    .line 17
    iget-object v0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 18
    .line 19
    invoke-static {p1}, Lcom/google/common/base/Optional;->fromNullable(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v0, v1}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, p1}, Ll/m27;->Y3(Lcom/p1/mobile/putong/core/data/BoostStatus;)V

    .line 27
    .line 28
    .line 29
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 30
    .line 31
    return-object p0
.end method

.method public final synthetic N3()Lrx/c;
    .locals 2

    .line 1
    new-instance v0, Ll/e27;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/e27;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    new-instance v1, Ll/f27;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/f27;-><init>(Ll/m27;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final synthetic O3()Ll/x1d0;
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/api/a;->P:Lcom/p1/mobile/putong/api/api/Network;

    .line 2
    .line 3
    invoke-virtual {v0}, Lcom/p1/mobile/putong/api/api/Network;->auth()Ll/x1d0$a;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->H()Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    invoke-interface {v1}, Lcom/p1/mobile/putong/account_api/api/serviceprovider/api/AccountService;->userId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    invoke-virtual {p0}, Ll/m27;->v3()I

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    sget v2, Ll/uqb0;->f0:I

    .line 20
    .line 21
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-static {v1, p0, v2}, Lcom/p1/mobile/putong/core/api/a;->k(Ljava/lang/String;ILjava/lang/String;)Ljava/lang/String;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-virtual {p0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    return-object p0
.end method

.method public final synthetic P3()Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/c27;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/c27;-><init>(Ll/m27;)V

    .line 4
    .line 5
    .line 6
    const/4 p0, 0x1

    .line 7
    invoke-static {v0, p0}, Ll/qi20;->g(Ll/pcj;Z)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public final synthetic Q3(Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v1, p1, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/c;->v3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 6
    .line 7
    .line 8
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 9
    .line 10
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/core/data/CoreData;->boostStatus:Ljava/util/List;

    .line 17
    .line 18
    invoke-static {v0}, Ll/jyb;->l0(Ljava/util/List;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/m27;->X3()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/m27;->W3()V

    .line 28
    .line 29
    .line 30
    const/4 v1, 0x0

    .line 31
    iput-boolean v1, p0, Ll/m27;->n0:Z

    .line 32
    .line 33
    iget-object v1, p0, Ll/m27;->e0:Ll/jxd0;

    .line 34
    .line 35
    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 36
    .line 37
    invoke-virtual {v1, v2}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 38
    .line 39
    .line 40
    if-eqz v0, :cond_0

    .line 41
    .line 42
    iget-object v1, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 43
    .line 44
    invoke-static {v0}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 45
    .line 46
    .line 47
    move-result-object v2

    .line 48
    invoke-virtual {v1, v2}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    :cond_0
    invoke-virtual {p0, v0}, Ll/m27;->Y3(Lcom/p1/mobile/putong/core/data/BoostStatus;)V

    .line 52
    .line 53
    .line 54
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/jan;->P3()Lrx/c;

    .line 69
    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_1
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 73
    .line 74
    invoke-virtual {p0, p1}, Ll/lqb;->l5(Lcom/p1/mobile/putong/data/Envelope;)V

    .line 75
    .line 76
    .line 77
    :goto_0
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 78
    .line 79
    return-object p0
.end method

.method public final synthetic R3(Ljava/lang/String;Lrx/c$d;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/z17;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/z17;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->e(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1, p2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 15
    .line 16
    .line 17
    move-result-object p2

    .line 18
    invoke-virtual {p1, p2}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    new-instance p2, Ll/a27;

    .line 23
    .line 24
    invoke-direct {p2, p0}, Ll/a27;-><init>(Ll/m27;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p1, p2}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    return-object p0
.end method

.method public final synthetic S3(Ljava/lang/String;Lcom/p1/mobile/putong/data/Envelope;)Ll/uxj0;
    .locals 3

    .line 1
    const-string v0, "oDiamond"

    .line 2
    .line 3
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/m27;->g0:Ll/byd0;

    .line 10
    .line 11
    invoke-static {}, Ll/pzi0;->o()J

    .line 12
    .line 13
    .line 14
    move-result-wide v1

    .line 15
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    :cond_0
    const-string v0, "ultraPremium"

    .line 23
    .line 24
    invoke-static {p1, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result p1

    .line 28
    if-eqz p1, :cond_1

    .line 29
    .line 30
    iget-object p1, p0, Ll/m27;->h0:Ll/byd0;

    .line 31
    .line 32
    invoke-static {}, Ll/pzi0;->o()J

    .line 33
    .line 34
    .line 35
    move-result-wide v0

    .line 36
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {p1, v0}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    :cond_1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 44
    .line 45
    iget-object p1, p2, Lcom/p1/mobile/putong/data/Envelope;->counters:Lcom/p1/mobile/putong/data/Counter;

    .line 46
    .line 47
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/api/c;->v3(Lcom/p1/mobile/putong/data/Counter;)V

    .line 48
    .line 49
    .line 50
    sget-object p0, Ll/uxj0;->a:Ll/uxj0;

    .line 51
    .line 52
    return-object p0
.end method

.method public final synthetic T3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;
    .locals 1

    .line 1
    new-instance v0, Ll/h27;

    .line 2
    .line 3
    invoke-direct {v0, p1}, Ll/h27;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/qi20;->a(Ll/pcj;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    new-instance v0, Ll/i27;

    .line 11
    .line 12
    invoke-direct {v0, p0, p2}, Ll/i27;-><init>(Ll/m27;Ljava/lang/String;)V

    .line 13
    .line 14
    .line 15
    invoke-virtual {p1, v0}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    return-object p0
.end method

.method public final U3()Ljava/lang/String;
    .locals 3

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-interface {v0}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;->rc()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    const-string v0, "false"

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    const-string v0, "true"

    .line 19
    .line 20
    :goto_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 21
    .line 22
    const-string v2, "{\"active\": true, \"consumeType\": \""

    .line 23
    .line 24
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    const/4 v2, 0x0

    .line 28
    invoke-virtual {p0, v2}, Ll/m27;->A3(Z)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 33
    .line 34
    .line 35
    const-string p0, "\", \"coinSign\":\"\",\"business\":\"\", \"giftVer\":"

    .line 36
    .line 37
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 41
    .line 42
    .line 43
    const-string p0, " }"

    .line 44
    .line 45
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 46
    .line 47
    .line 48
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object p0

    .line 52
    return-object p0
.end method

.method public V3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/v17;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/v17;-><init>(Ll/m27;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "query_boost_status_new"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public W3()V
    .locals 3

    .line 1
    invoke-static {}, Ll/joa;->D3()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 9
    .line 10
    new-instance v1, Ll/b27;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/b27;-><init>(Ll/m27;)V

    .line 13
    .line 14
    .line 15
    const-string p0, "user-boost_start"

    .line 16
    .line 17
    const/4 v2, -0x1

    .line 18
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public X3()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput v0, p0, Ll/m27;->p0:I

    .line 3
    .line 4
    iput v0, p0, Ll/m27;->r0:I

    .line 5
    .line 6
    return-void
.end method

.method public final Y3(Lcom/p1/mobile/putong/core/data/BoostStatus;)V
    .locals 3

    .line 1
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/BoostStatus;->active:Z

    .line 8
    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    iget-object p0, p0, Ll/m27;->l0:Ll/wyd0;

    .line 12
    .line 13
    new-instance v0, Ljava/lang/StringBuilder;

    .line 14
    .line 15
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 16
    .line 17
    .line 18
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/BoostStatus;->boostRecordID:J

    .line 19
    .line 20
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 21
    .line 22
    .line 23
    const-string v1, "::"

    .line 24
    .line 25
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/BoostStatus;->endTime:D

    .line 29
    .line 30
    double-to-long v1, v1

    .line 31
    invoke-virtual {v0, v1, v2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 32
    .line 33
    .line 34
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 35
    .line 36
    .line 37
    move-result-object p1

    .line 38
    invoke-virtual {p0, p1}, Ll/wyd0;->put(Ljava/lang/Object;)Z

    .line 39
    .line 40
    .line 41
    :cond_0
    return-void
.end method

.method public Z3(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m27;->V:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public a4(Z)V
    .locals 0

    .line 1
    iput-boolean p1, p0, Ll/m27;->R:Z

    .line 2
    .line 3
    return-void
.end method

.method public b4(ZLjava/lang/String;Lcom/p1/mobile/putong/core/data/Privilege;Ljava/lang/String;ZZ)Lrx/c;
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z",
            "Ljava/lang/String;",
            "Lcom/p1/mobile/putong/core/data/Privilege;",
            "Ljava/lang/String;",
            "ZZ)",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/m27;->S:Z

    .line 3
    .line 4
    sget-object v1, Lcom/p1/mobile/putong/core/data/Privilege;->minBoost:Lcom/p1/mobile/putong/core/data/Privilege;

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-ne p3, v1, :cond_0

    .line 8
    .line 9
    move v0, v2

    .line 10
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 11
    .line 12
    .line 13
    move-result-object p3

    .line 14
    invoke-interface {p3}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->xf()Z

    .line 15
    .line 16
    .line 17
    move-result p3

    .line 18
    const-string v1, "boost"

    .line 19
    .line 20
    const-string v3, "minBoost"

    .line 21
    .line 22
    if-eqz p3, :cond_2

    .line 23
    .line 24
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 25
    .line 26
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->I0:Ll/jan;

    .line 27
    .line 28
    invoke-virtual {p0, p1}, Ll/m27;->A3(Z)Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v4

    .line 32
    if-eqz v0, :cond_1

    .line 33
    .line 34
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    goto :goto_0

    .line 39
    :cond_1
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    :goto_0
    invoke-virtual {p3, v4, v1}, Ll/jan;->S3(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;

    .line 44
    .line 45
    .line 46
    move-result-object p3

    .line 47
    invoke-static {p3}, Ll/p8i0;->e(Ljava/lang/Long;)Lrx/c$d;

    .line 48
    .line 49
    .line 50
    move-result-object p3

    .line 51
    goto :goto_2

    .line 52
    :cond_2
    sget-object p3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 53
    .line 54
    iget-object p3, p3, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 55
    .line 56
    invoke-virtual {p0, p1}, Ll/m27;->A3(Z)Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v4

    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    invoke-static {v3}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    goto :goto_1

    .line 67
    :cond_3
    invoke-static {v1}, Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;

    .line 68
    .line 69
    .line 70
    move-result-object v1

    .line 71
    :goto_1
    invoke-virtual {p3, v4, v1}, Ll/lqb;->s5(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/SummarizedPrivilegesId;)Ljava/lang/Long;

    .line 72
    .line 73
    .line 74
    move-result-object p3

    .line 75
    invoke-static {p3}, Ll/z7i0;->e(Ljava/lang/Long;)Lrx/c$d;

    .line 76
    .line 77
    .line 78
    move-result-object p3

    .line 79
    :goto_2
    new-instance v1, Lorg/json/JSONObject;

    .line 80
    .line 81
    invoke-direct {v1}, Lorg/json/JSONObject;-><init>()V

    .line 82
    .line 83
    .line 84
    :try_start_0
    const-string v3, "active"

    .line 85
    .line 86
    invoke-virtual {v1, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 87
    .line 88
    .line 89
    const-string v2, "consumeType"

    .line 90
    .line 91
    invoke-virtual {p0, p1}, Ll/m27;->A3(Z)Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    invoke-virtual {v1, v2, v3}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 96
    .line 97
    .line 98
    const-string v2, "diamond"

    .line 99
    .line 100
    invoke-virtual {p0, p1}, Ll/m27;->A3(Z)Ljava/lang/String;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    invoke-static {v2, p1}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 105
    .line 106
    .line 107
    move-result p1

    .line 108
    if-eqz p1, :cond_4

    .line 109
    .line 110
    const-string p1, "diamondSign"

    .line 111
    .line 112
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 113
    .line 114
    .line 115
    goto :goto_3

    .line 116
    :catch_0
    move-exception p1

    .line 117
    goto :goto_5

    .line 118
    :cond_4
    const-string p1, "coinSign"

    .line 119
    .line 120
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 121
    .line 122
    .line 123
    :goto_3
    const-string p1, "business"

    .line 124
    .line 125
    if-eqz v0, :cond_5

    .line 126
    .line 127
    :try_start_1
    const-string p2, "intlMinBoost"

    .line 128
    .line 129
    invoke-virtual {v1, p1, p2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 130
    .line 131
    .line 132
    goto :goto_4

    .line 133
    :cond_5
    invoke-static {p4}, Ll/jyb;->L(Ljava/lang/String;)Z

    .line 134
    .line 135
    .line 136
    move-result p2

    .line 137
    if-nez p2, :cond_6

    .line 138
    .line 139
    invoke-virtual {v1, p1, p4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 140
    .line 141
    .line 142
    :cond_6
    :goto_4
    if-nez v0, :cond_7

    .line 143
    .line 144
    const-string p1, "freeUse"

    .line 145
    .line 146
    invoke-virtual {v1, p1, p5}, Lorg/json/JSONObject;->put(Ljava/lang/String;Z)Lorg/json/JSONObject;

    .line 147
    .line 148
    .line 149
    :cond_7
    invoke-virtual {v1}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object p1
    :try_end_1
    .catch Lorg/json/JSONException; {:try_start_1 .. :try_end_1} :catch_0

    .line 153
    goto :goto_6

    .line 154
    :goto_5
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 155
    .line 156
    .line 157
    const-string p1, "{}"

    .line 158
    .line 159
    :goto_6
    if-eqz p6, :cond_8

    .line 160
    .line 161
    invoke-virtual {p0}, Ll/m27;->U3()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object p1

    .line 165
    :cond_8
    iget-object p2, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 166
    .line 167
    new-instance p4, Ll/y17;

    .line 168
    .line 169
    invoke-direct {p4, p0, p1, p3}, Ll/y17;-><init>(Ll/m27;Ljava/lang/String;Lrx/c$d;)V

    .line 170
    .line 171
    .line 172
    const-string p0, "patch_boost_status_new"

    .line 173
    .line 174
    const/4 p1, -0x1

    .line 175
    invoke-virtual {p2, p0, p1, p4}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 176
    .line 177
    .line 178
    move-result-object p0

    .line 179
    return-object p0
.end method

.method public c4(Ljava/lang/String;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "{\"active\": true, \"consumeType\": \""

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    const/4 v1, 0x0

    .line 9
    invoke-virtual {p0, v1}, Ll/m27;->A3(Z)Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v1, "\", \"business\":\""

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 22
    .line 23
    .line 24
    const-string v1, "\"}"

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    iget-object v1, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 34
    .line 35
    new-instance v2, Ll/d27;

    .line 36
    .line 37
    invoke-direct {v2, p0, v0, p1}, Ll/d27;-><init>(Ll/m27;Ljava/lang/String;Ljava/lang/String;)V

    .line 38
    .line 39
    .line 40
    const-string p0, "patch_boost_status_new_silently"

    .line 41
    .line 42
    const/4 p1, -0x1

    .line 43
    invoke-virtual {v1, p0, p1, v2}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 44
    .line 45
    .line 46
    return-void
.end method

.method public d4()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/m27;->W:Ll/jxd0;

    .line 2
    .line 3
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/m27;->X:Ll/jxd0;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 11
    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    iput-boolean v0, p0, Ll/m27;->S:Z

    .line 15
    .line 16
    iget-object v1, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 17
    .line 18
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    check-cast v1, Lcom/google/common/base/Optional;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    if-eqz v1, :cond_0

    .line 29
    .line 30
    iget-object v1, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 31
    .line 32
    invoke-virtual {v1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Lcom/google/common/base/Optional;

    .line 37
    .line 38
    invoke-virtual {v1}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    check-cast v1, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 43
    .line 44
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/data/BoostStatus;->clone()Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 45
    .line 46
    .line 47
    move-result-object v1

    .line 48
    iput-boolean v0, v1, Lcom/p1/mobile/putong/core/data/BoostStatus;->active:Z

    .line 49
    .line 50
    iget-object v0, p0, Ll/m27;->k0:Ll/byd0;

    .line 51
    .line 52
    iget-wide v2, v1, Lcom/p1/mobile/putong/core/data/BoostStatus;->boostRecordID:J

    .line 53
    .line 54
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-virtual {v0, v2}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    iget-object v0, p0, Ll/m27;->l0:Ll/wyd0;

    .line 62
    .line 63
    invoke-virtual {v0}, Ll/wyd0;->clear()Z

    .line 64
    .line 65
    .line 66
    iget-object p0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 67
    .line 68
    invoke-static {v1}, Lcom/google/common/base/Optional;->of(Ljava/lang/Object;)Lcom/google/common/base/Optional;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    invoke-virtual {p0, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 73
    .line 74
    .line 75
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 76
    .line 77
    .line 78
    move-result-object p0

    .line 79
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 80
    .line 81
    .line 82
    move-result-object p0

    .line 83
    invoke-interface {p0}, Ll/r97;->a2()Z

    .line 84
    .line 85
    .line 86
    move-result p0

    .line 87
    if-nez p0, :cond_2

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    invoke-virtual {p0}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 94
    .line 95
    .line 96
    move-result-object p0

    .line 97
    invoke-interface {p0}, Ll/r97;->Lg()Z

    .line 98
    .line 99
    .line 100
    move-result p0

    .line 101
    if-eqz p0, :cond_1

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :cond_1
    return-void

    .line 105
    :cond_2
    :goto_0
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 106
    .line 107
    iget-object p0, p0, Lcom/p1/mobile/putong/core/api/c;->J0:Ll/m27;

    .line 108
    .line 109
    invoke-virtual {p0}, Ll/m27;->V3()Lrx/c;

    .line 110
    .line 111
    .line 112
    return-void
.end method

.method public e4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m27;->Y:Ll/jxd0;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public r3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v0, Ll/g27;

    .line 4
    .line 5
    invoke-direct {v0}, Ll/g27;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v1, "boost_peak_time"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {p0, v1, v2, v0}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public s3()Lrx/c;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/uxj0;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/dy6;->Q:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    new-instance v1, Ll/l27;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/l27;-><init>(Ll/m27;)V

    .line 6
    .line 7
    .line 8
    const-string p0, "user-boost_query"

    .line 9
    .line 10
    const/4 v2, 0x0

    .line 11
    invoke-virtual {v0, p0, v2, v1}, Lcom/tantanapp/common/network/RunnerProxy;->scheduled(Ljava/lang/String;ILl/pcj;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method

.method public t3()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Lcom/google/common/base/Optional<",
            "Lcom/p1/mobile/putong/core/data/BoostStatus;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {p0}, Lrx/c;->asObservable()Lrx/c;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public v3()I
    .locals 1

    .line 1
    iget-object v0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/common/base/Optional;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/common/base/Optional;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 28
    .line 29
    iget p0, p0, Lcom/p1/mobile/putong/core/data/BoostStatus;->duration:I

    .line 30
    .line 31
    return p0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0
.end method

.method public w3()J
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 2
    .line 3
    invoke-virtual {v0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lcom/google/common/base/Optional;

    .line 8
    .line 9
    invoke-virtual {v0}, Lcom/google/common/base/Optional;->isPresent()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    iget-object p0, p0, Ll/m27;->T:Lrx/subjects/a;

    .line 16
    .line 17
    invoke-virtual {p0}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    check-cast p0, Lcom/google/common/base/Optional;

    .line 22
    .line 23
    invoke-virtual {p0}, Lcom/google/common/base/Optional;->get()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Lcom/p1/mobile/putong/core/data/BoostStatus;

    .line 28
    .line 29
    iget-wide v0, p0, Lcom/p1/mobile/putong/core/data/BoostStatus;->endTime:D

    .line 30
    .line 31
    double-to-long v0, v0

    .line 32
    return-wide v0

    .line 33
    :cond_0
    const-wide/16 v0, 0x0

    .line 34
    .line 35
    return-wide v0
.end method

.method public x3()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/m27;->Y:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    check-cast p0, Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public y3()I
    .locals 0

    .line 1
    iget p0, p0, Ll/m27;->r0:I

    .line 2
    .line 3
    return p0
.end method
