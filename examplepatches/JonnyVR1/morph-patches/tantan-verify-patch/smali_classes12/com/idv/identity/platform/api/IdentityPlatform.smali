.class public Lcom/idv/identity/platform/api/IdentityPlatform;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final CLOUD_AUTH_HK:Ljava/lang/String; = "https://cloudauth-intl.cn-hongkong.aliyuncs.com"

.field public static final CLOUD_HOST:Ljava/lang/String; = "cloudauth-intl.cn-hongkong.aliyuncs.com"

.field private static final FINAL_RESULT:Ljava/lang/String; = "FINAL_RESULT"

.field private static final START_INIT:Ljava/lang/String; = "START_INIT"

.field private static isBusy:Z

.field private static s_instance:Lcom/idv/identity/platform/api/IdentityPlatform;


# instance fields
.field private ctx:Landroid/content/Context;

.field private identityCallback:Lcom/idv/identity/platform/api/IdentityCallback;

.field private verifyStartTime:J


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/platform/api/IdentityPlatform;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/idv/identity/platform/api/IdentityPlatform;->s_instance:Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 7
    .line 8
    return-void
.end method

.method private constructor <init>()V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-object v0, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->identityCallback:Lcom/idv/identity/platform/api/IdentityCallback;

    .line 6
    .line 7
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 8
    .line 9
    .line 10
    move-result-wide v0

    .line 11
    iput-wide v0, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->verifyStartTime:J

    .line 12
    .line 13
    return-void
.end method

.method public static synthetic access$000(Lcom/idv/identity/platform/api/IdentityPlatform;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->sendResponse(Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private configPopNetWorkEnv(Ll/tj20;)V
    .locals 0

    .line 1
    const-string p0, "https://cloudauth-intl.cn-hongkong.aliyuncs.com"

    .line 2
    .line 3
    iput-object p0, p1, Ll/tj20;->b:Ljava/lang/String;

    .line 4
    .line 5
    const-string p0, "cloudauth-intl.cn-hongkong.aliyuncs.com"

    .line 6
    .line 7
    iput-object p0, p1, Ll/tj20;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method private errCode2ClientResponse(Ljava/lang/String;)Lcom/idv/identity/platform/api/IdentityResponse;
    .locals 4

    .line 1
    new-instance p0, Lcom/idv/identity/platform/api/IdentityResponse;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/idv/identity/platform/api/IdentityResponse;-><init>()V

    .line 4
    .line 5
    .line 6
    if-nez p1, :cond_0

    .line 7
    .line 8
    const-string p1, ""

    .line 9
    .line 10
    :cond_0
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->message:Ljava/lang/String;

    .line 11
    .line 12
    sget-object v0, Ll/dfm;->H:Ljava/lang/String;

    .line 13
    .line 14
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/16 p1, 0x3ef

    .line 21
    .line 22
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 23
    .line 24
    const-string p1, "A1007_1"

    .line 25
    .line 26
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 27
    .line 28
    return-object p0

    .line 29
    :cond_1
    sget-object v0, Ll/dfm;->I:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    const/16 v1, 0x3eb

    .line 36
    .line 37
    if-eqz v0, :cond_2

    .line 38
    .line 39
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 40
    .line 41
    const-string p1, "A1003_7"

    .line 42
    .line 43
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_2
    sget-object v0, Ll/dfm;->B:Ljava/lang/String;

    .line 47
    .line 48
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/16 p1, 0x3f2

    .line 55
    .line 56
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 57
    .line 58
    const-string p1, "A1010_1"

    .line 59
    .line 60
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 61
    .line 62
    return-object p0

    .line 63
    :cond_3
    sget-object v0, Ll/dfm;->E:Ljava/lang/String;

    .line 64
    .line 65
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    if-eqz v0, :cond_4

    .line 70
    .line 71
    const/16 p1, 0x3f9

    .line 72
    .line 73
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 74
    .line 75
    const-string p1, "A1017_1"

    .line 76
    .line 77
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 78
    .line 79
    return-object p0

    .line 80
    :cond_4
    sget-object v0, Ll/dfm;->w:Ljava/lang/String;

    .line 81
    .line 82
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/16 v2, 0x3f0

    .line 87
    .line 88
    if-eqz v0, :cond_5

    .line 89
    .line 90
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 91
    .line 92
    const-string p1, "A1008_2"

    .line 93
    .line 94
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 95
    .line 96
    return-object p0

    .line 97
    :cond_5
    sget-object v0, Ll/dfm;->x:Ljava/lang/String;

    .line 98
    .line 99
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    if-eqz v0, :cond_6

    .line 104
    .line 105
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 106
    .line 107
    const-string p1, "A1008_3"

    .line 108
    .line 109
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 110
    .line 111
    return-object p0

    .line 112
    :cond_6
    sget-object v0, Ll/dfm;->v:Ljava/lang/String;

    .line 113
    .line 114
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    if-eqz v0, :cond_7

    .line 119
    .line 120
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 121
    .line 122
    const-string p1, "A1008_1"

    .line 123
    .line 124
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 125
    .line 126
    return-object p0

    .line 127
    :cond_7
    sget-object v0, Ll/dfm;->m:Ljava/lang/String;

    .line 128
    .line 129
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    const/16 p1, 0x3f7

    .line 136
    .line 137
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 138
    .line 139
    const-string p1, "A1015_1"

    .line 140
    .line 141
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 142
    .line 143
    return-object p0

    .line 144
    :cond_8
    sget-object v0, Ll/dfm;->g:Ljava/lang/String;

    .line 145
    .line 146
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    const/16 v2, 0x3ec

    .line 151
    .line 152
    if-eqz v0, :cond_9

    .line 153
    .line 154
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 155
    .line 156
    const-string p1, "A1004_1"

    .line 157
    .line 158
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 159
    .line 160
    return-object p0

    .line 161
    :cond_9
    sget-object v0, Ll/dfm;->h:Ljava/lang/String;

    .line 162
    .line 163
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 170
    .line 171
    const-string p1, "A1004_3"

    .line 172
    .line 173
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 174
    .line 175
    return-object p0

    .line 176
    :cond_a
    sget-object v0, Ll/dfm;->i:Ljava/lang/String;

    .line 177
    .line 178
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_b

    .line 183
    .line 184
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 185
    .line 186
    const-string p1, "A1004_2"

    .line 187
    .line 188
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 189
    .line 190
    return-object p0

    .line 191
    :cond_b
    sget-object v0, Ll/dfm;->k:Ljava/lang/String;

    .line 192
    .line 193
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    if-eqz v0, :cond_c

    .line 198
    .line 199
    const/16 p1, 0x3f8

    .line 200
    .line 201
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 202
    .line 203
    const-string p1, "A1016_1"

    .line 204
    .line 205
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 206
    .line 207
    return-object p0

    .line 208
    :cond_c
    sget-object v0, Ll/dfm;->r:Ljava/lang/String;

    .line 209
    .line 210
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    if-eqz v0, :cond_d

    .line 215
    .line 216
    const/16 p1, 0x3e8

    .line 217
    .line 218
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 219
    .line 220
    const-string p1, "A1000_1"

    .line 221
    .line 222
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 223
    .line 224
    return-object p0

    .line 225
    :cond_d
    sget-object v0, Ll/dfm;->s:Ljava/lang/String;

    .line 226
    .line 227
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    if-eqz v0, :cond_e

    .line 232
    .line 233
    const/16 p1, 0x3e9

    .line 234
    .line 235
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 236
    .line 237
    const-string p1, "A1001_1"

    .line 238
    .line 239
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 240
    .line 241
    return-object p0

    .line 242
    :cond_e
    sget-object v0, Ll/dfm;->t:Ljava/lang/String;

    .line 243
    .line 244
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    const-string v2, "A1005_2"

    .line 249
    .line 250
    const/16 v3, 0x3ed

    .line 251
    .line 252
    if-eqz v0, :cond_f

    .line 253
    .line 254
    iput v3, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 255
    .line 256
    iput-object v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 257
    .line 258
    return-object p0

    .line 259
    :cond_f
    sget-object v0, Ll/dfm;->o:Ljava/lang/String;

    .line 260
    .line 261
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    if-eqz v0, :cond_10

    .line 266
    .line 267
    iput v3, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 268
    .line 269
    const-string p1, "A1005_1"

    .line 270
    .line 271
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 272
    .line 273
    return-object p0

    .line 274
    :cond_10
    sget-object v0, Ll/dfm;->p:Ljava/lang/String;

    .line 275
    .line 276
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    if-eqz v0, :cond_11

    .line 281
    .line 282
    iput v3, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 283
    .line 284
    iput-object v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 285
    .line 286
    return-object p0

    .line 287
    :cond_11
    sget-object v0, Ll/dfm;->J:Ljava/lang/String;

    .line 288
    .line 289
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    if-eqz v0, :cond_12

    .line 294
    .line 295
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 296
    .line 297
    const-string p1, "A1003_1"

    .line 298
    .line 299
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 300
    .line 301
    return-object p0

    .line 302
    :cond_12
    const-string v0, "INIT_RESPONSE_FORMAT_ERROR"

    .line 303
    .line 304
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    if-eqz v0, :cond_13

    .line 309
    .line 310
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 311
    .line 312
    const-string p1, "A1003_2"

    .line 313
    .line 314
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 315
    .line 316
    return-object p0

    .line 317
    :cond_13
    const-string v0, "INIT_CONTENT_FORMAT_ERROR"

    .line 318
    .line 319
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    if-eqz v0, :cond_14

    .line 324
    .line 325
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 326
    .line 327
    const-string p1, "A1003_3"

    .line 328
    .line 329
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 330
    .line 331
    return-object p0

    .line 332
    :cond_14
    sget-object v0, Ll/dfm;->b:Ljava/lang/String;

    .line 333
    .line 334
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 335
    .line 336
    .line 337
    move-result v0

    .line 338
    if-eqz v0, :cond_15

    .line 339
    .line 340
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 341
    .line 342
    const-string p1, "A1003_6"

    .line 343
    .line 344
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 345
    .line 346
    return-object p0

    .line 347
    :cond_15
    const-string v0, "INIT_RESPONSE_ERROR"

    .line 348
    .line 349
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 350
    .line 351
    .line 352
    move-result v0

    .line 353
    if-eqz v0, :cond_16

    .line 354
    .line 355
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 356
    .line 357
    const-string p1, "A1003_5"

    .line 358
    .line 359
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 360
    .line 361
    return-object p0

    .line 362
    :cond_16
    const-string v0, "INIT_CONTENT_DECRYPT_ERROR"

    .line 363
    .line 364
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    if-eqz v0, :cond_17

    .line 369
    .line 370
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 371
    .line 372
    const-string p1, "A1003_4"

    .line 373
    .line 374
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 375
    .line 376
    return-object p0

    .line 377
    :cond_17
    sget-object v0, Ll/dfm;->f:Ljava/lang/String;

    .line 378
    .line 379
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    if-eqz v0, :cond_18

    .line 384
    .line 385
    const/16 p1, 0x3ee

    .line 386
    .line 387
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 388
    .line 389
    const-string p1, "A1006_1"

    .line 390
    .line 391
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 392
    .line 393
    return-object p0

    .line 394
    :cond_18
    sget-object v0, Ll/dfm;->G:Ljava/lang/String;

    .line 395
    .line 396
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    const/16 v2, 0x7d0

    .line 401
    .line 402
    if-eqz v0, :cond_19

    .line 403
    .line 404
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 405
    .line 406
    const-string p1, "A2000_2"

    .line 407
    .line 408
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 409
    .line 410
    return-object p0

    .line 411
    :cond_19
    sget-object v0, Ll/dfm;->y:Ljava/lang/String;

    .line 412
    .line 413
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 414
    .line 415
    .line 416
    move-result v0

    .line 417
    if-eqz v0, :cond_1a

    .line 418
    .line 419
    const/16 p1, 0x7d2

    .line 420
    .line 421
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 422
    .line 423
    const-string p1, "A2002_1"

    .line 424
    .line 425
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 426
    .line 427
    return-object p0

    .line 428
    :cond_1a
    sget-object v0, Ll/dfm;->z:Ljava/lang/String;

    .line 429
    .line 430
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 431
    .line 432
    .line 433
    move-result v0

    .line 434
    if-eqz v0, :cond_1b

    .line 435
    .line 436
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 437
    .line 438
    const-string p1, "A2000_1"

    .line 439
    .line 440
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 441
    .line 442
    return-object p0

    .line 443
    :cond_1b
    sget-object v0, Ll/dfm;->l:Ljava/lang/String;

    .line 444
    .line 445
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 446
    .line 447
    .line 448
    move-result v0

    .line 449
    if-eqz v0, :cond_1c

    .line 450
    .line 451
    const/16 p1, 0x3f6

    .line 452
    .line 453
    iput p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 454
    .line 455
    const-string p1, "A1014_1"

    .line 456
    .line 457
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 458
    .line 459
    return-object p0

    .line 460
    :cond_1c
    const-string v0, "INIT_LOAD_MODEL_ERROR"

    .line 461
    .line 462
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 463
    .line 464
    .line 465
    move-result v0

    .line 466
    const/16 v2, 0x3ea

    .line 467
    .line 468
    if-eqz v0, :cond_1d

    .line 469
    .line 470
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 471
    .line 472
    const-string p1, "A1002_1"

    .line 473
    .line 474
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 475
    .line 476
    return-object p0

    .line 477
    :cond_1d
    const-string v0, "INIT_LOAD_SO_ERROR"

    .line 478
    .line 479
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 480
    .line 481
    .line 482
    move-result v0

    .line 483
    if-eqz v0, :cond_1e

    .line 484
    .line 485
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 486
    .line 487
    const-string p1, "A1002_3"

    .line 488
    .line 489
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 490
    .line 491
    return-object p0

    .line 492
    :cond_1e
    sget-object v0, Ll/dfm;->D:Ljava/lang/String;

    .line 493
    .line 494
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 495
    .line 496
    .line 497
    move-result v0

    .line 498
    const-string v3, "A1012_1"

    .line 499
    .line 500
    if-eqz v0, :cond_1f

    .line 501
    .line 502
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 503
    .line 504
    iput-object v3, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 505
    .line 506
    return-object p0

    .line 507
    :cond_1f
    sget-object v0, Ll/dfm;->C:Ljava/lang/String;

    .line 508
    .line 509
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 510
    .line 511
    .line 512
    move-result v0

    .line 513
    if-eqz v0, :cond_20

    .line 514
    .line 515
    iput v1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 516
    .line 517
    iput-object v3, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 518
    .line 519
    return-object p0

    .line 520
    :cond_20
    const-string v0, "CODE_VERIFY_INTERRUPT"

    .line 521
    .line 522
    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 523
    .line 524
    .line 525
    move-result p1

    .line 526
    if-eqz p1, :cond_21

    .line 527
    .line 528
    iput v2, p0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 529
    .line 530
    const-string p1, "A1002_2"

    .line 531
    .line 532
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 533
    .line 534
    :cond_21
    return-object p0
.end method

.method private static getApDidToken(Landroid/content/Context;)Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, ""

    .line 2
    .line 3
    return-object p0
.end method

.method public static getInstance()Lcom/idv/identity/platform/api/IdentityPlatform;
    .locals 1

    .line 1
    sget-object v0, Lcom/idv/identity/platform/api/IdentityPlatform;->s_instance:Lcom/idv/identity/platform/api/IdentityPlatform;

    .line 2
    .line 3
    return-object v0
.end method

.method public static getMetaInfo(Landroid/content/Context;)Ljava/lang/String;
    .locals 2

    .line 1
    new-instance v0, Lcom/idv/identity/platform/api/IdentityMetaInfo;

    .line 2
    .line 3
    invoke-direct {v0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {p0}, Lcom/idv/identity/platform/api/IdentityPlatform;->getApDidToken(Landroid/content/Context;)Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object v1

    .line 10
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setApdidToken(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-virtual {v0, v1}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setAppName(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {p0}, Ll/ac00;->e(Landroid/content/Context;)Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setAppVersion(Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    sget-object p0, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setDeviceModel(Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string p0, "android"

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setDeviceType(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    sget-object p0, Landroid/os/Build$VERSION;->RELEASE:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setOsVersion(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    const-string p0, "5.1.0:11501568,4"

    .line 43
    .line 44
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setBioMetaInfo(Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    const-string p0, "1.0.0"

    .line 48
    .line 49
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setIdentityVer(Ljava/lang/String;)V

    .line 50
    .line 51
    .line 52
    const-string p0, "1.3.5.intl"

    .line 53
    .line 54
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setSdkVersion(Ljava/lang/String;)V

    .line 55
    .line 56
    .line 57
    sget-object p0, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 58
    .line 59
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setDeviceBrand(Ljava/lang/String;)V

    .line 60
    .line 61
    .line 62
    sget-object p0, Landroid/os/Build;->MANUFACTURER:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setDeviceManufacturer(Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    invoke-static {}, Ll/t0g0;->b()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {v0, p0}, Lcom/idv/identity/platform/api/IdentityMetaInfo;->setFgVersion(Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :try_start_0
    invoke-static {v0}, Lcom/alibaba/fastjson/JSON;->toJSONString(Ljava/lang/Object;)Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 78
    return-object p0

    .line 79
    :catchall_0
    move-exception p0

    .line 80
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V

    .line 81
    .line 82
    .line 83
    const-string p0, ""

    .line 84
    .line 85
    return-object p0
.end method

.method public static getNetworkEnv()Ll/tj20;
    .locals 1

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->K()Ll/tj20;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    return-object v0
.end method

.method private initCustomParams(Ljava/util/Map;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_18

    .line 2
    .line 3
    invoke-interface {p1}, Ljava/util/Map;->size()I

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-gtz p0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_6

    .line 10
    .line 11
    :cond_0
    const-string p0, ""

    .line 12
    .line 13
    sput-object p0, Ll/hfm;->c:Ljava/lang/String;

    .line 14
    .line 15
    const-string v0, "WaterMark"

    .line 16
    .line 17
    invoke-interface {p1, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v1

    .line 21
    if-eqz v1, :cond_1

    .line 22
    .line 23
    invoke-interface {p1, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    check-cast v1, Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v2

    .line 33
    if-nez v2, :cond_1

    .line 34
    .line 35
    sput-object v1, Ll/hfm;->c:Ljava/lang/String;

    .line 36
    .line 37
    :cond_1
    const-string v1, "="

    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v2, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    sget-object v0, Ll/hfm;->c:Ljava/lang/String;

    .line 52
    .line 53
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    const-string v2, "MaxErrorTimes"

    .line 61
    .line 62
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    move-result v3

    .line 66
    if-eqz v3, :cond_4

    .line 67
    .line 68
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 69
    .line 70
    .line 71
    move-result-object v3

    .line 72
    check-cast v3, Ljava/lang/String;

    .line 73
    .line 74
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 75
    .line 76
    .line 77
    move-result v4

    .line 78
    if-nez v4, :cond_4

    .line 79
    .line 80
    const/16 v4, 0xa

    .line 81
    .line 82
    :try_start_0
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 83
    .line 84
    .line 85
    move-result-object v3

    .line 86
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 87
    .line 88
    .line 89
    move-result v3
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 90
    const/4 v5, 0x3

    .line 91
    if-gt v3, v5, :cond_2

    .line 92
    .line 93
    move v4, v5

    .line 94
    goto :goto_0

    .line 95
    :cond_2
    if-lt v3, v4, :cond_3

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_3
    move v4, v3

    .line 99
    :catch_0
    :goto_0
    sput v4, Ll/hfm;->j:I

    .line 100
    .line 101
    :cond_4
    const-string v3, ","

    .line 102
    .line 103
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    new-instance v2, Ljava/lang/StringBuilder;

    .line 116
    .line 117
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 118
    .line 119
    .line 120
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 121
    .line 122
    .line 123
    sget v0, Ll/hfm;->j:I

    .line 124
    .line 125
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    const-string v2, "CardOcrTimeOutPeriod"

    .line 133
    .line 134
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 135
    .line 136
    .line 137
    move-result v4

    .line 138
    const/16 v5, 0x3c

    .line 139
    .line 140
    const/16 v6, 0x14

    .line 141
    .line 142
    if-eqz v4, :cond_7

    .line 143
    .line 144
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    check-cast v4, Ljava/lang/String;

    .line 149
    .line 150
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 151
    .line 152
    .line 153
    move-result v7

    .line 154
    if-nez v7, :cond_7

    .line 155
    .line 156
    :try_start_1
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 157
    .line 158
    .line 159
    move-result-object v4

    .line 160
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 161
    .line 162
    .line 163
    move-result v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 164
    if-gt v4, v6, :cond_5

    .line 165
    .line 166
    goto :goto_1

    .line 167
    :cond_5
    if-lt v4, v5, :cond_6

    .line 168
    .line 169
    move v4, v5

    .line 170
    goto :goto_2

    .line 171
    :catch_1
    :goto_1
    move v4, v6

    .line 172
    :cond_6
    :goto_2
    sput v4, Ll/hfm;->k:I

    .line 173
    .line 174
    :cond_7
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    new-instance v2, Ljava/lang/StringBuilder;

    .line 187
    .line 188
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 189
    .line 190
    .line 191
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 192
    .line 193
    .line 194
    sget v0, Ll/hfm;->k:I

    .line 195
    .line 196
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 197
    .line 198
    .line 199
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const-string v2, "FaceVerifyTimeOutPeriod"

    .line 204
    .line 205
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 206
    .line 207
    .line 208
    move-result v4

    .line 209
    if-eqz v4, :cond_a

    .line 210
    .line 211
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v4

    .line 215
    check-cast v4, Ljava/lang/String;

    .line 216
    .line 217
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 218
    .line 219
    .line 220
    move-result v7

    .line 221
    if-nez v7, :cond_a

    .line 222
    .line 223
    :try_start_2
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v4

    .line 227
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 228
    .line 229
    .line 230
    move-result v4
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2

    .line 231
    if-gt v4, v6, :cond_8

    .line 232
    .line 233
    move v5, v6

    .line 234
    goto :goto_3

    .line 235
    :cond_8
    if-lt v4, v5, :cond_9

    .line 236
    .line 237
    goto :goto_3

    .line 238
    :cond_9
    move v5, v4

    .line 239
    :goto_3
    move v6, v5

    .line 240
    :catch_2
    sput v6, Ll/hfm;->l:I

    .line 241
    .line 242
    :cond_a
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 251
    .line 252
    .line 253
    move-result-object v0

    .line 254
    new-instance v2, Ljava/lang/StringBuilder;

    .line 255
    .line 256
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 257
    .line 258
    .line 259
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 260
    .line 261
    .line 262
    sget v0, Ll/hfm;->l:I

    .line 263
    .line 264
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 265
    .line 266
    .line 267
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 268
    .line 269
    .line 270
    move-result-object v0

    .line 271
    const-string v2, "OcrResultTimeOutPeriod"

    .line 272
    .line 273
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 274
    .line 275
    .line 276
    move-result v4

    .line 277
    const/4 v5, 0x0

    .line 278
    if-eqz v4, :cond_b

    .line 279
    .line 280
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 281
    .line 282
    .line 283
    move-result-object v4

    .line 284
    check-cast v4, Ljava/lang/String;

    .line 285
    .line 286
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 287
    .line 288
    .line 289
    move-result v6

    .line 290
    if-nez v6, :cond_b

    .line 291
    .line 292
    :try_start_3
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(Ljava/lang/String;)Ljava/lang/Integer;

    .line 293
    .line 294
    .line 295
    move-result-object v4

    .line 296
    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    .line 297
    .line 298
    .line 299
    move-result v4
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_3

    .line 300
    goto :goto_4

    .line 301
    :catch_3
    move v4, v5

    .line 302
    :goto_4
    sput v4, Ll/hfm;->m:I

    .line 303
    .line 304
    :cond_b
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 305
    .line 306
    .line 307
    move-result-object v0

    .line 308
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 313
    .line 314
    .line 315
    move-result-object v0

    .line 316
    new-instance v2, Ljava/lang/StringBuilder;

    .line 317
    .line 318
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 319
    .line 320
    .line 321
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 322
    .line 323
    .line 324
    sget v0, Ll/hfm;->m:I

    .line 325
    .line 326
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 327
    .line 328
    .line 329
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    const-string v2, "IdCardVerifyMode"

    .line 334
    .line 335
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v4

    .line 339
    const/4 v6, 0x1

    .line 340
    const-string v7, "0"

    .line 341
    .line 342
    if-eqz v4, :cond_c

    .line 343
    .line 344
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 345
    .line 346
    .line 347
    move-result-object v4

    .line 348
    check-cast v4, Ljava/lang/String;

    .line 349
    .line 350
    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 351
    .line 352
    .line 353
    move-result v4

    .line 354
    if-eqz v4, :cond_c

    .line 355
    .line 356
    sput-boolean v6, Ll/hfm;->b:Z

    .line 357
    .line 358
    :cond_c
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 367
    .line 368
    .line 369
    move-result-object v0

    .line 370
    new-instance v2, Ljava/lang/StringBuilder;

    .line 371
    .line 372
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 373
    .line 374
    .line 375
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 376
    .line 377
    .line 378
    sget-boolean v0, Ll/hfm;->b:Z

    .line 379
    .line 380
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 381
    .line 382
    .line 383
    move-result-object v0

    .line 384
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 385
    .line 386
    .line 387
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 388
    .line 389
    .line 390
    move-result-object v0

    .line 391
    const-string v2, "OcrResultButtonColor"

    .line 392
    .line 393
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 394
    .line 395
    .line 396
    move-result v4

    .line 397
    if-eqz v4, :cond_d

    .line 398
    .line 399
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v4

    .line 403
    check-cast v4, Ljava/lang/String;

    .line 404
    .line 405
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 406
    .line 407
    .line 408
    move-result v8

    .line 409
    if-nez v8, :cond_d

    .line 410
    .line 411
    sput-object v4, Ll/hfm;->f:Ljava/lang/String;

    .line 412
    .line 413
    :cond_d
    sget-object v4, Ll/hfm;->f:Ljava/lang/String;

    .line 414
    .line 415
    if-eqz v4, :cond_e

    .line 416
    .line 417
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 418
    .line 419
    .line 420
    move-result-object v0

    .line 421
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 422
    .line 423
    .line 424
    move-result-object v0

    .line 425
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 426
    .line 427
    .line 428
    move-result-object v0

    .line 429
    new-instance v2, Ljava/lang/StringBuilder;

    .line 430
    .line 431
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 432
    .line 433
    .line 434
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 435
    .line 436
    .line 437
    sget-object v0, Ll/hfm;->f:Ljava/lang/String;

    .line 438
    .line 439
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 440
    .line 441
    .line 442
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 443
    .line 444
    .line 445
    move-result-object v0

    .line 446
    :cond_e
    sput-boolean v6, Ll/hfm;->d:Z

    .line 447
    .line 448
    const-string v2, "ShowOcrResult"

    .line 449
    .line 450
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 451
    .line 452
    .line 453
    move-result v4

    .line 454
    if-eqz v4, :cond_f

    .line 455
    .line 456
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v4

    .line 460
    check-cast v4, Ljava/lang/String;

    .line 461
    .line 462
    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 463
    .line 464
    .line 465
    move-result v4

    .line 466
    if-eqz v4, :cond_f

    .line 467
    .line 468
    sput-boolean v5, Ll/hfm;->d:Z

    .line 469
    .line 470
    :cond_f
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 479
    .line 480
    .line 481
    move-result-object v0

    .line 482
    new-instance v2, Ljava/lang/StringBuilder;

    .line 483
    .line 484
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 485
    .line 486
    .line 487
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 488
    .line 489
    .line 490
    sget-boolean v0, Ll/hfm;->d:Z

    .line 491
    .line 492
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 493
    .line 494
    .line 495
    move-result-object v0

    .line 496
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 497
    .line 498
    .line 499
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 500
    .line 501
    .line 502
    move-result-object v0

    .line 503
    sput-boolean v6, Ll/hfm;->e:Z

    .line 504
    .line 505
    const-string v2, "EditOcrResult"

    .line 506
    .line 507
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 508
    .line 509
    .line 510
    move-result v4

    .line 511
    if-eqz v4, :cond_10

    .line 512
    .line 513
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 514
    .line 515
    .line 516
    move-result-object v4

    .line 517
    check-cast v4, Ljava/lang/String;

    .line 518
    .line 519
    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 520
    .line 521
    .line 522
    move-result v4

    .line 523
    if-eqz v4, :cond_10

    .line 524
    .line 525
    sput-boolean v5, Ll/hfm;->e:Z

    .line 526
    .line 527
    :cond_10
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 528
    .line 529
    .line 530
    move-result-object v0

    .line 531
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 536
    .line 537
    .line 538
    move-result-object v0

    .line 539
    new-instance v2, Ljava/lang/StringBuilder;

    .line 540
    .line 541
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 542
    .line 543
    .line 544
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 545
    .line 546
    .line 547
    sget-boolean v0, Ll/hfm;->e:Z

    .line 548
    .line 549
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 550
    .line 551
    .line 552
    move-result-object v0

    .line 553
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 554
    .line 555
    .line 556
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 557
    .line 558
    .line 559
    move-result-object v0

    .line 560
    const-string v2, "ShowBlbumIcon"

    .line 561
    .line 562
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 563
    .line 564
    .line 565
    move-result v4

    .line 566
    if-eqz v4, :cond_11

    .line 567
    .line 568
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 569
    .line 570
    .line 571
    move-result-object v4

    .line 572
    check-cast v4, Ljava/lang/String;

    .line 573
    .line 574
    invoke-virtual {v7, v4}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 575
    .line 576
    .line 577
    move-result v4

    .line 578
    if-eqz v4, :cond_11

    .line 579
    .line 580
    sput-boolean v5, Ll/hfm;->g:Z

    .line 581
    .line 582
    :cond_11
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    new-instance v2, Ljava/lang/StringBuilder;

    .line 595
    .line 596
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 597
    .line 598
    .line 599
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 600
    .line 601
    .line 602
    sget-boolean v0, Ll/hfm;->g:Z

    .line 603
    .line 604
    invoke-static {v0}, Ljava/lang/String;->valueOf(Z)Ljava/lang/String;

    .line 605
    .line 606
    .line 607
    move-result-object v0

    .line 608
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 609
    .line 610
    .line 611
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 612
    .line 613
    .line 614
    move-result-object v0

    .line 615
    const-string v2, "RoundProgressColor"

    .line 616
    .line 617
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 618
    .line 619
    .line 620
    move-result v4

    .line 621
    if-eqz v4, :cond_12

    .line 622
    .line 623
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 624
    .line 625
    .line 626
    move-result-object v4

    .line 627
    check-cast v4, Ljava/lang/String;

    .line 628
    .line 629
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 630
    .line 631
    .line 632
    move-result v5

    .line 633
    if-nez v5, :cond_12

    .line 634
    .line 635
    sput-object v4, Ll/hfm;->h:Ljava/lang/String;

    .line 636
    .line 637
    :cond_12
    sget-object v4, Ll/hfm;->h:Ljava/lang/String;

    .line 638
    .line 639
    if-eqz v4, :cond_13

    .line 640
    .line 641
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 642
    .line 643
    .line 644
    move-result-object v0

    .line 645
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 646
    .line 647
    .line 648
    move-result-object v0

    .line 649
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 650
    .line 651
    .line 652
    move-result-object v0

    .line 653
    new-instance v2, Ljava/lang/StringBuilder;

    .line 654
    .line 655
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 656
    .line 657
    .line 658
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 659
    .line 660
    .line 661
    sget-object v0, Ll/hfm;->h:Ljava/lang/String;

    .line 662
    .line 663
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 664
    .line 665
    .line 666
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v0

    .line 670
    :cond_13
    const-string v2, "SdkLanguage"

    .line 671
    .line 672
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 673
    .line 674
    .line 675
    move-result v4

    .line 676
    if-eqz v4, :cond_15

    .line 677
    .line 678
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 679
    .line 680
    .line 681
    move-result-object v4

    .line 682
    check-cast v4, Ljava/lang/String;

    .line 683
    .line 684
    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 685
    .line 686
    .line 687
    move-result v5

    .line 688
    if-nez v5, :cond_14

    .line 689
    .line 690
    sput-object v4, Ll/hfm;->o:Ljava/lang/String;

    .line 691
    .line 692
    goto :goto_5

    .line 693
    :cond_14
    sput-object p0, Ll/hfm;->o:Ljava/lang/String;

    .line 694
    .line 695
    :cond_15
    :goto_5
    invoke-virtual {v0, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 696
    .line 697
    .line 698
    move-result-object v0

    .line 699
    invoke-virtual {v0, v2}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 700
    .line 701
    .line 702
    move-result-object v0

    .line 703
    invoke-virtual {v0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 704
    .line 705
    .line 706
    move-result-object v0

    .line 707
    new-instance v2, Ljava/lang/StringBuilder;

    .line 708
    .line 709
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 710
    .line 711
    .line 712
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 713
    .line 714
    .line 715
    sget-object v0, Ll/hfm;->o:Ljava/lang/String;

    .line 716
    .line 717
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 718
    .line 719
    .line 720
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 721
    .line 722
    .line 723
    move-result-object v0

    .line 724
    const-string v2, "CloseButtonLayout"

    .line 725
    .line 726
    invoke-interface {p1, v2}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 727
    .line 728
    .line 729
    move-result v3

    .line 730
    if-eqz v3, :cond_16

    .line 731
    .line 732
    invoke-interface {p1, v2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 733
    .line 734
    .line 735
    move-result-object v2

    .line 736
    check-cast v2, Ljava/lang/String;

    .line 737
    .line 738
    invoke-static {v2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 739
    .line 740
    .line 741
    move-result v3

    .line 742
    if-nez v3, :cond_16

    .line 743
    .line 744
    sput-object v2, Ll/hfm;->i:Ljava/lang/String;

    .line 745
    .line 746
    :cond_16
    sput-object p0, Ll/hfm;->a:Ljava/lang/String;

    .line 747
    .line 748
    const-string p0, "Protocol"

    .line 749
    .line 750
    invoke-interface {p1, p0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 751
    .line 752
    .line 753
    move-result v2

    .line 754
    if-eqz v2, :cond_17

    .line 755
    .line 756
    invoke-interface {p1, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 757
    .line 758
    .line 759
    move-result-object p1

    .line 760
    check-cast p1, Ljava/lang/String;

    .line 761
    .line 762
    sput-object p1, Ll/hfm;->a:Ljava/lang/String;

    .line 763
    .line 764
    :cond_17
    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 765
    .line 766
    .line 767
    move-result-object p0

    .line 768
    invoke-virtual {p0, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 769
    .line 770
    .line 771
    move-result-object p0

    .line 772
    new-instance p1, Ljava/lang/StringBuilder;

    .line 773
    .line 774
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 775
    .line 776
    .line 777
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 778
    .line 779
    .line 780
    sget-object p0, Ll/hfm;->a:Ljava/lang/String;

    .line 781
    .line 782
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 783
    .line 784
    .line 785
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 786
    .line 787
    .line 788
    move-result-object p0

    .line 789
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 790
    .line 791
    .line 792
    move-result-object p1

    .line 793
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 794
    .line 795
    const-string v1, "params"

    .line 796
    .line 797
    filled-new-array {v1, p0}, [Ljava/lang/String;

    .line 798
    .line 799
    .line 800
    move-result-object p0

    .line 801
    const-string v1, "initCustomParams"

    .line 802
    .line 803
    invoke-virtual {p1, v0, v1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 804
    .line 805
    .line 806
    :cond_18
    :goto_6
    return-void
.end method

.method private initFaceGuard(Landroid/content/Context;Z)V
    .locals 0

    return-void
.end method

.method private initLogService(Landroid/content/Context;Ljava/lang/String;)V
    .locals 10

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v1, Landroid/os/Build;->BRAND:Ljava/lang/String;

    .line 11
    .line 12
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    const-string v1, "|"

    .line 16
    .line 17
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 18
    .line 19
    .line 20
    sget-object v2, Landroid/os/Build;->MODEL:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 26
    .line 27
    .line 28
    sget-object v2, Landroid/os/Build;->ID:Ljava/lang/String;

    .line 29
    .line 30
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v4

    .line 37
    sget-object v6, Landroid/os/Build;->FINGERPRINT:Ljava/lang/String;

    .line 38
    .line 39
    sget p0, Landroid/os/Build$VERSION;->SDK_INT:I

    .line 40
    .line 41
    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v7

    .line 45
    new-instance p0, Ljava/lang/StringBuilder;

    .line 46
    .line 47
    invoke-direct {p0}, Ljava/lang/StringBuilder;-><init>()V

    .line 48
    .line 49
    .line 50
    invoke-static {p1}, Ll/je00;->c(Landroid/content/Context;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-static {p1}, Ll/je00;->d(Landroid/content/Context;)Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v1

    .line 64
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v8

    .line 71
    invoke-static {p1}, Ll/je00;->b(Landroid/content/Context;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object v9

    .line 75
    const-string v2, "Android"

    .line 76
    .line 77
    const-string v3, "1.3.5.intl"

    .line 78
    .line 79
    move-object v1, p1

    .line 80
    move-object v5, p2

    .line 81
    invoke-virtual/range {v0 .. v9}, Lcom/idv/identity/platform/log/RecordService;->init(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method private install(Landroid/content/Context;Z)V
    .locals 1

    const/4 v0, 0x0

    .line 93
    invoke-direct {p0, p1, p2, v0}, Lcom/idv/identity/platform/api/IdentityPlatform;->install(Landroid/content/Context;ZLjava/util/Map;)V

    return-void
.end method

.method private install(Landroid/content/Context;ZLjava/util/Map;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Z",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/afm;->G()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {v0}, Ll/afm;->c()V

    .line 17
    .line 18
    .line 19
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    iput-object v0, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 24
    .line 25
    invoke-static {}, Ll/bfm;->c()Ll/bfm;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    iget-object p0, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 30
    .line 31
    invoke-virtual {v0, p0}, Ll/bfm;->d(Landroid/content/Context;)Ll/bfm;

    .line 32
    .line 33
    .line 34
    const/4 p0, 0x0

    .line 35
    if-eqz p3, :cond_3

    .line 36
    .line 37
    const-string v0, "CustomUrl"

    .line 38
    .line 39
    invoke-interface {p3, v0}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 40
    .line 41
    .line 42
    move-result v1

    .line 43
    if-eqz v1, :cond_1

    .line 44
    .line 45
    invoke-interface {p3, v0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ljava/lang/String;

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_1
    move-object v0, p0

    .line 53
    :goto_0
    const-string v1, "CustomHost"

    .line 54
    .line 55
    invoke-interface {p3, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result v2

    .line 59
    if-eqz v2, :cond_2

    .line 60
    .line 61
    invoke-interface {p3, v1}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 62
    .line 63
    .line 64
    move-result-object p0

    .line 65
    check-cast p0, Ljava/lang/String;

    .line 66
    .line 67
    :cond_2
    move-object p3, p0

    .line 68
    move-object p0, v0

    .line 69
    goto :goto_1

    .line 70
    :cond_3
    move-object p3, p0

    .line 71
    :goto_1
    invoke-static {p1, p2, p0, p3}, Ll/t0g0;->d(Landroid/content/Context;ZLjava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    invoke-static {p1}, Lcom/idv/identity/platform/api/IdentityPlatformExt;->initNetworkProxy(Landroid/content/Context;)V

    .line 75
    .line 76
    .line 77
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    const/4 p2, 0x1

    .line 82
    invoke-virtual {p0, p2}, Ll/afm;->g1(Z)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    .line 86
    .line 87
    .line 88
    move-result-object p0

    .line 89
    invoke-static {p0}, Ll/g610;->a(Landroid/content/Context;)V

    .line 90
    .line 91
    .line 92
    return-void
.end method

.method public static reportCrash(Ljava/lang/String;Lcom/idv/identity/platform/api/IdentityCrashCallback;)V
    .locals 2

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object p1

    .line 5
    sget-object v0, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    const-string v1, "crashInfo"

    .line 8
    .line 9
    filled-new-array {v1, p0}, [Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string v1, "appCrash"

    .line 14
    .line 15
    invoke-virtual {p1, v0, v1, p0}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method private sendResponse(Ljava/lang/String;)V
    .locals 13

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    :cond_0
    sget-object p1, Ll/dfm;->a:Ljava/lang/String;

    .line 10
    .line 11
    :cond_1
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-virtual {v0}, Ll/afm;->l0()J

    .line 16
    .line 17
    .line 18
    move-result-wide v0

    .line 19
    new-instance v2, Ljava/lang/StringBuilder;

    .line 20
    .line 21
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 22
    .line 23
    .line 24
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 25
    .line 26
    .line 27
    move-result-wide v3

    .line 28
    sub-long/2addr v3, v0

    .line 29
    long-to-double v0, v3

    .line 30
    const-wide v3, 0x408f400000000000L    # 1000.0

    .line 31
    .line 32
    .line 33
    .line 34
    .line 35
    div-double/2addr v0, v3

    .line 36
    invoke-virtual {v2, v0, v1}, Ljava/lang/StringBuilder;->append(D)Ljava/lang/StringBuilder;

    .line 37
    .line 38
    .line 39
    const-string v0, "s"

    .line 40
    .line 41
    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v12

    .line 48
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->errCode2ClientResponse(Ljava/lang/String;)Lcom/idv/identity/platform/api/IdentityResponse;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    const-string v1, "CODE_NETWORK_ERROR_1006"

    .line 53
    .line 54
    invoke-virtual {v1, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 62
    .line 63
    iget v2, v0, Lcom/idv/identity/platform/api/IdentityResponse;->code:I

    .line 64
    .line 65
    const/16 v3, 0x3e8

    .line 66
    .line 67
    if-ne v2, v3, :cond_2

    .line 68
    .line 69
    const-string v3, "success"

    .line 70
    .line 71
    :goto_0
    move-object v4, v3

    .line 72
    goto :goto_1

    .line 73
    :cond_2
    const-string v3, "fail"

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :goto_1
    invoke-static {v2}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v6

    .line 80
    iget-object v2, v0, Lcom/idv/identity/platform/api/IdentityResponse;->subCode:Ljava/lang/String;

    .line 81
    .line 82
    invoke-static {v2}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v8

    .line 86
    iget-object v10, v0, Lcom/idv/identity/platform/api/IdentityResponse;->message:Ljava/lang/String;

    .line 87
    .line 88
    const-string v11, "timeCost"

    .line 89
    .line 90
    const-string v3, "status"

    .line 91
    .line 92
    const-string v5, "code"

    .line 93
    .line 94
    const-string v7, "subCode"

    .line 95
    .line 96
    const-string v9, "message"

    .line 97
    .line 98
    filled-new-array/range {v3 .. v12}, [Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    const-string v3, "FINAL_RESULT"

    .line 103
    .line 104
    invoke-virtual {p1, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 105
    .line 106
    .line 107
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    invoke-virtual {p1}, Lcom/idv/identity/platform/log/RecordService;->flush()V

    .line 112
    .line 113
    .line 114
    iget-object p1, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->identityCallback:Lcom/idv/identity/platform/api/IdentityCallback;

    .line 115
    .line 116
    if-eqz p1, :cond_6

    .line 117
    .line 118
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    invoke-virtual {p1}, Ll/afm;->a0()Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, v0, Lcom/idv/identity/platform/api/IdentityResponse;->ocrInfo:Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 127
    .line 128
    if-eqz p1, :cond_5

    .line 129
    .line 130
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    invoke-virtual {p1}, Ll/afm;->Y()Landroid/graphics/Bitmap;

    .line 135
    .line 136
    .line 137
    move-result-object p1

    .line 138
    if-nez p1, :cond_3

    .line 139
    .line 140
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    invoke-virtual {p1}, Ll/afm;->W()Landroid/graphics/Bitmap;

    .line 145
    .line 146
    .line 147
    move-result-object p1

    .line 148
    :cond_3
    iget-object v1, v0, Lcom/idv/identity/platform/api/IdentityResponse;->ocrInfo:Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 149
    .line 150
    iput-object p1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->IDCardFrontImage:Landroid/graphics/Bitmap;

    .line 151
    .line 152
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    invoke-virtual {p1}, Ll/afm;->U()Landroid/graphics/Bitmap;

    .line 157
    .line 158
    .line 159
    move-result-object p1

    .line 160
    if-nez p1, :cond_4

    .line 161
    .line 162
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    invoke-virtual {p1}, Ll/afm;->S()Landroid/graphics/Bitmap;

    .line 167
    .line 168
    .line 169
    move-result-object p1

    .line 170
    :cond_4
    iget-object v1, v0, Lcom/idv/identity/platform/api/IdentityResponse;->ocrInfo:Lcom/idv/identity/platform/api/IdentityOcrInfo;

    .line 171
    .line 172
    iput-object p1, v1, Lcom/idv/identity/platform/api/IdentityOcrInfo;->IDCardBackImage:Landroid/graphics/Bitmap;

    .line 173
    .line 174
    :cond_5
    iget-object p1, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->identityCallback:Lcom/idv/identity/platform/api/IdentityCallback;

    .line 175
    .line 176
    invoke-interface {p1, v0}, Lcom/idv/identity/platform/api/IdentityCallback;->response(Lcom/idv/identity/platform/api/IdentityResponse;)Z

    .line 177
    .line 178
    .line 179
    const/4 p1, 0x0

    .line 180
    iput-object p1, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->identityCallback:Lcom/idv/identity/platform/api/IdentityCallback;

    .line 181
    .line 182
    :cond_6
    const/4 p0, 0x0

    .line 183
    sput-boolean p0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 184
    .line 185
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 186
    .line 187
    .line 188
    move-result-object p0

    .line 189
    invoke-virtual {p0}, Ll/afm;->c()V

    .line 190
    .line 191
    .line 192
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 193
    .line 194
    .line 195
    move-result-object p0

    .line 196
    invoke-virtual {p0}, Ll/afm;->K()Ll/tj20;

    .line 197
    .line 198
    .line 199
    move-result-object p0

    .line 200
    if-eqz p0, :cond_7

    .line 201
    .line 202
    invoke-virtual {p0}, Ll/tj20;->a()V

    .line 203
    .line 204
    .line 205
    :cond_7
    invoke-static {}, Ll/g610;->b()V

    .line 206
    .line 207
    .line 208
    return-void
.end method

.method public static setNetworkEnv(Ll/tj20;)V
    .locals 1

    .line 69
    invoke-static {}, Ll/afm;->H()Ll/afm;

    move-result-object v0

    invoke-virtual {v0, p0}, Ll/afm;->k1(Ll/tj20;)V

    return-void
.end method

.method private static setNetworkEnv(Ljava/lang/String;)Z
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "transactionId:"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v1, " env:"

    .line 12
    .line 13
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Ll/afm;->K()Ll/tj20;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v1, "setNetworkEnv"

    .line 32
    .line 33
    invoke-static {v1, v0}, Ll/o6r0;->b(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    invoke-virtual {v0}, Ll/afm;->K()Ll/tj20;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    if-nez v0, :cond_1

    .line 45
    .line 46
    invoke-static {p0}, Ll/tj20;->c(Ljava/lang/String;)Ll/tj20;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    if-nez p0, :cond_0

    .line 51
    .line 52
    const/4 p0, 0x0

    .line 53
    return p0

    .line 54
    :cond_0
    invoke-static {}, Lcom/idv/identity/util/IdentityUtils;->gk()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    iput-object v0, p0, Ll/tj20;->e:Ljava/lang/String;

    .line 59
    .line 60
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    invoke-virtual {v0, p0}, Ll/afm;->k1(Ll/tj20;)V

    .line 65
    .line 66
    .line 67
    :cond_1
    const/4 p0, 0x1

    .line 68
    return p0
.end method

.method public static updateFaceGuardSession(Ljava/lang/String;)V
    .locals 1

    .line 1
    new-instance v0, Lcom/idv/identity/platform/api/IdentityPlatform$1;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lcom/idv/identity/platform/api/IdentityPlatform$1;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method private verifyStart(Ljava/lang/String;Ljava/util/Map;Lcom/idv/identity/platform/api/IdentityCallback;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/idv/identity/platform/api/IdentityCallback;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    sget-object v1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_INFO:Lcom/idv/identity/platform/log/RecordLevel;

    .line 6
    .line 7
    new-instance v2, Ljava/lang/StringBuilder;

    .line 8
    .line 9
    const-string v3, "start enter IDV transactionId:"

    .line 10
    .line 11
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v2

    .line 21
    const-string v3, "message"

    .line 22
    .line 23
    filled-new-array {v3, v2}, [Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v2

    .line 27
    const-string v3, "START_INIT"

    .line 28
    .line 29
    invoke-virtual {v0, v1, v3, v2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v4

    .line 36
    sget-boolean v0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 37
    .line 38
    if-eqz v0, :cond_0

    .line 39
    .line 40
    iget-wide v6, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->verifyStartTime:J

    .line 41
    .line 42
    sub-long/2addr v4, v6

    .line 43
    const-wide/16 v6, 0x3e8

    .line 44
    .line 45
    cmp-long v0, v4, v6

    .line 46
    .line 47
    if-gez v0, :cond_0

    .line 48
    .line 49
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget-object p1, Lcom/idv/identity/platform/log/RecordLevel;->LOG_ERROR:Lcom/idv/identity/platform/log/RecordLevel;

    .line 54
    .line 55
    const-string p2, "errMsg"

    .line 56
    .line 57
    const-string p3, "start enter IDV isBusy"

    .line 58
    .line 59
    filled-new-array {p2, p3}, [Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p2

    .line 63
    invoke-virtual {p0, p1, v3, p2}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 68
    .line 69
    .line 70
    move-result-wide v4

    .line 71
    iput-wide v4, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->verifyStartTime:J

    .line 72
    .line 73
    const/4 v0, 0x1

    .line 74
    sput-boolean v0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 75
    .line 76
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    invoke-virtual {v0}, Ll/afm;->B()Ll/g5g;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    if-nez v0, :cond_1

    .line 85
    .line 86
    new-instance v0, Ll/g5g;

    .line 87
    .line 88
    invoke-direct {v0}, Ll/g5g;-><init>()V

    .line 89
    .line 90
    .line 91
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 92
    .line 93
    .line 94
    move-result-object v2

    .line 95
    invoke-virtual {v2, v0}, Ll/afm;->a1(Ll/g5g;)V

    .line 96
    .line 97
    .line 98
    :cond_1
    iput-object p3, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->identityCallback:Lcom/idv/identity/platform/api/IdentityCallback;

    .line 99
    .line 100
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 101
    .line 102
    .line 103
    move-result-object p3

    .line 104
    invoke-virtual {p3}, Ll/afm;->G()Z

    .line 105
    .line 106
    .line 107
    move-result p3

    .line 108
    const/4 v0, 0x0

    .line 109
    if-nez p3, :cond_2

    .line 110
    .line 111
    sput-boolean v0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 112
    .line 113
    sget-object p1, Ll/dfm;->B:Ljava/lang/String;

    .line 114
    .line 115
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->sendResponse(Ljava/lang/String;)V

    .line 116
    .line 117
    .line 118
    return-void

    .line 119
    :cond_2
    iget-object p3, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 120
    .line 121
    if-nez p3, :cond_3

    .line 122
    .line 123
    sput-boolean v0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 124
    .line 125
    sget-object p1, Ll/dfm;->I:Ljava/lang/String;

    .line 126
    .line 127
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->sendResponse(Ljava/lang/String;)V

    .line 128
    .line 129
    .line 130
    return-void

    .line 131
    :cond_3
    if-eqz p1, :cond_7

    .line 132
    .line 133
    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    .line 134
    .line 135
    .line 136
    move-result p3

    .line 137
    if-eqz p3, :cond_4

    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_4
    invoke-static {p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->setNetworkEnv(Ljava/lang/String;)Z

    .line 141
    .line 142
    .line 143
    move-result p3

    .line 144
    if-nez p3, :cond_5

    .line 145
    .line 146
    sget-object p1, Ll/dfm;->H:Ljava/lang/String;

    .line 147
    .line 148
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->sendResponse(Ljava/lang/String;)V

    .line 149
    .line 150
    .line 151
    sput-boolean v0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 152
    .line 153
    return-void

    .line 154
    :cond_5
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    iget-wide v4, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->verifyStartTime:J

    .line 159
    .line 160
    invoke-virtual {p3, v4, v5}, Ll/afm;->Q1(J)V

    .line 161
    .line 162
    .line 163
    iget-object p3, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 164
    .line 165
    invoke-direct {p0, p3, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->initLogService(Landroid/content/Context;Ljava/lang/String;)V

    .line 166
    .line 167
    .line 168
    if-eqz p2, :cond_6

    .line 169
    .line 170
    invoke-interface {p2}, Ljava/util/Map;->isEmpty()Z

    .line 171
    .line 172
    .line 173
    move-result p3

    .line 174
    if-nez p3, :cond_6

    .line 175
    .line 176
    invoke-direct {p0, p2}, Lcom/idv/identity/platform/api/IdentityPlatform;->initCustomParams(Ljava/util/Map;)V

    .line 177
    .line 178
    .line 179
    :cond_6
    invoke-static {}, Lcom/idv/identity/platform/log/RecordService;->getInstance()Lcom/idv/identity/platform/log/RecordService;

    .line 180
    .line 181
    .line 182
    move-result-object p2

    .line 183
    const-string p3, "transactionId"

    .line 184
    .line 185
    filled-new-array {p3, p1}, [Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object p3

    .line 189
    invoke-virtual {p2, v1, v3, p3}, Lcom/idv/identity/platform/log/RecordService;->recordEvent(Lcom/idv/identity/platform/log/RecordLevel;Ljava/lang/String;[Ljava/lang/String;)V

    .line 190
    .line 191
    .line 192
    invoke-static {p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->updateFaceGuardSession(Ljava/lang/String;)V

    .line 193
    .line 194
    .line 195
    sget p2, Ll/t0g0;->a:I

    .line 196
    .line 197
    invoke-static {p2, p1}, Ll/t0g0;->e(ILjava/lang/String;)V

    .line 198
    .line 199
    .line 200
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 201
    .line 202
    .line 203
    move-result-object p2

    .line 204
    invoke-virtual {p2, p1}, Ll/afm;->K0(Ljava/lang/String;)V

    .line 205
    .line 206
    .line 207
    invoke-static {}, Ll/afm;->H()Ll/afm;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    new-instance p2, Lcom/idv/identity/platform/api/IdentityPlatform$2;

    .line 212
    .line 213
    invoke-direct {p2, p0}, Lcom/idv/identity/platform/api/IdentityPlatform$2;-><init>(Lcom/idv/identity/platform/api/IdentityPlatform;)V

    .line 214
    .line 215
    .line 216
    invoke-virtual {p1, p2}, Ll/afm;->e1(Lcom/idv/identity/platform/api/IdentityRetCallback;)V

    .line 217
    .line 218
    .line 219
    iget-object p1, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 220
    .line 221
    invoke-static {p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->getMetaInfo(Landroid/content/Context;)Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    new-instance p2, Landroid/content/Intent;

    .line 226
    .line 227
    iget-object p3, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 228
    .line 229
    const-class v0, Lcom/idv/identity/platform/SystemLoadingActivity;

    .line 230
    .line 231
    invoke-direct {p2, p3, v0}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 232
    .line 233
    .line 234
    const-string p3, "toyger_meta_info"

    .line 235
    .line 236
    invoke-virtual {p2, p3, p1}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 237
    .line 238
    .line 239
    const/high16 p1, 0x10000000

    .line 240
    .line 241
    invoke-virtual {p2, p1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    .line 242
    .line 243
    .line 244
    iget-object p0, p0, Lcom/idv/identity/platform/api/IdentityPlatform;->ctx:Landroid/content/Context;

    .line 245
    .line 246
    invoke-virtual {p0, p2}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :cond_7
    :goto_0
    sput-boolean v0, Lcom/idv/identity/platform/api/IdentityPlatform;->isBusy:Z

    .line 251
    .line 252
    sget-object p1, Ll/dfm;->H:Ljava/lang/String;

    .line 253
    .line 254
    invoke-direct {p0, p1}, Lcom/idv/identity/platform/api/IdentityPlatform;->sendResponse(Ljava/lang/String;)V

    .line 255
    .line 256
    .line 257
    return-void
.end method


# virtual methods
.method public getCtx()Landroid/content/Context;
    .locals 1

    .line 1
    invoke-static {}, Ll/xrl;->a()Ll/xrl;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xrl;->b()Landroid/app/Activity;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    if-eqz p0, :cond_1

    .line 10
    .line 11
    invoke-virtual {p0}, Landroid/app/Activity;->isFinishing()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-nez v0, :cond_1

    .line 16
    .line 17
    invoke-virtual {p0}, Landroid/app/Activity;->isDestroyed()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    goto :goto_0

    .line 24
    :cond_0
    return-object p0

    .line 25
    :cond_1
    :goto_0
    invoke-static {}, Ll/bfm;->c()Ll/bfm;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {p0}, Ll/bfm;->b()Landroid/content/Context;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    return-object p0
.end method

.method public install(Landroid/content/Context;)V
    .locals 1

    const/4 v0, 0x0

    .line 94
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/api/IdentityPlatform;->install(Landroid/content/Context;Z)V

    return-void
.end method

.method public install(Landroid/content/Context;Ljava/util/Map;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/content/Context;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;)V"
        }
    .end annotation

    const/4 v0, 0x0

    .line 95
    invoke-direct {p0, p1, v0, p2}, Lcom/idv/identity/platform/api/IdentityPlatform;->install(Landroid/content/Context;ZLjava/util/Map;)V

    return-void
.end method

.method public installIPv6(Landroid/content/Context;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    invoke-direct {p0, p1, v0}, Lcom/idv/identity/platform/api/IdentityPlatform;->install(Landroid/content/Context;Z)V

    .line 3
    .line 4
    .line 5
    return-void
.end method

.method public setCustomUIConfig(ILjava/lang/String;)Ljava/lang/String;
    .locals 0

    .line 1
    invoke-static {}, Ll/bfm;->c()Ll/bfm;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0, p1, p2}, Ll/bfm;->a(ILjava/lang/String;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public verify(Ljava/lang/String;Ljava/util/Map;Lcom/idv/identity/platform/api/IdentityCallback;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;",
            "Lcom/idv/identity/platform/api/IdentityCallback;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1, p2, p3}, Lcom/idv/identity/platform/api/IdentityPlatform;->verifyStart(Ljava/lang/String;Ljava/util/Map;Lcom/idv/identity/platform/api/IdentityCallback;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method
