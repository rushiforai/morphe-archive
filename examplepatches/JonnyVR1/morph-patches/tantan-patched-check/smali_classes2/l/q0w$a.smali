.class Ll/q0w$a;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/concurrent/Callable;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Ll/q0w;->y(Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/concurrent/Callable<",
        "Ljava/lang/Void;",
        ">;"
    }
.end annotation


# instance fields
.field final synthetic a:Ljava/util/Map;

.field final synthetic b:Ljava/lang/String;

.field final synthetic c:Ljava/lang/String;

.field final synthetic d:Ll/q0w;


# direct methods
.method public constructor <init>(Ll/q0w;Ljava/util/Map;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 2
    .line 3
    iput-object p2, p0, Ll/q0w$a;->a:Ljava/util/Map;

    .line 4
    .line 5
    iput-object p3, p0, Ll/q0w$a;->b:Ljava/lang/String;

    .line 6
    .line 7
    iput-object p4, p0, Ll/q0w$a;->c:Ljava/lang/String;

    .line 8
    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 10
    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public a()Ljava/lang/Void;
    .locals 6

    .line 1
    const-string v0, "NULL and cleverTapID "

    .line 2
    .line 3
    const-string v1, "asyncProfileSwitchUser:[profile "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    iget-object v3, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 7
    .line 8
    invoke-static {v3}, Ll/q0w;->c(Ll/q0w;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 9
    .line 10
    .line 11
    move-result-object v3

    .line 12
    invoke-virtual {v3}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 13
    .line 14
    .line 15
    move-result-object v3

    .line 16
    iget-object v4, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 17
    .line 18
    invoke-static {v4}, Ll/q0w;->c(Ll/q0w;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 19
    .line 20
    .line 21
    move-result-object v4

    .line 22
    invoke-virtual {v4}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v4

    .line 26
    new-instance v5, Ljava/lang/StringBuilder;

    .line 27
    .line 28
    invoke-direct {v5, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    iget-object v1, p0, Ll/q0w$a;->a:Ljava/util/Map;

    .line 32
    .line 33
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 34
    .line 35
    .line 36
    const-string v1, " with Cached GUID "

    .line 37
    .line 38
    invoke-virtual {v5, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 39
    .line 40
    .line 41
    iget-object v1, p0, Ll/q0w$a;->b:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz v1, :cond_0

    .line 44
    .line 45
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 46
    .line 47
    invoke-static {v0}, Ll/q0w;->d(Ll/q0w;)Ljava/lang/String;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    goto :goto_0

    .line 52
    :catchall_0
    move-exception v0

    .line 53
    goto/16 :goto_2

    .line 54
    .line 55
    :cond_0
    new-instance v1, Ljava/lang/StringBuilder;

    .line 56
    .line 57
    invoke-direct {v1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 58
    .line 59
    .line 60
    iget-object v0, p0, Ll/q0w$a;->c:Ljava/lang/String;

    .line 61
    .line 62
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    .line 64
    .line 65
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    :goto_0
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 70
    .line 71
    .line 72
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {v3, v4, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;)V

    .line 77
    .line 78
    .line 79
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 80
    .line 81
    invoke-static {v0}, Ll/q0w;->o(Ll/q0w;)Ll/bu9;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    const/4 v1, 0x0

    .line 86
    invoke-virtual {v0, v1}, Ll/bu9;->T(Z)V

    .line 87
    .line 88
    .line 89
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 90
    .line 91
    invoke-static {v0}, Ll/q0w;->r(Ll/q0w;)Ll/cob0;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    invoke-virtual {v0, v1}, Ll/cob0;->w(Z)V

    .line 96
    .line 97
    .line 98
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 99
    .line 100
    invoke-static {v0}, Ll/q0w;->t(Ll/q0w;)Ll/ik2;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 105
    .line 106
    invoke-static {v1}, Ll/q0w;->s(Ll/q0w;)Landroid/content/Context;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    sget-object v3, Lcom/clevertap/android/sdk/events/EventGroup;->REGULAR:Lcom/clevertap/android/sdk/events/EventGroup;

    .line 111
    .line 112
    const/4 v4, 0x1

    .line 113
    invoke-virtual {v0, v1, v3, v2, v4}, Ll/ik2;->d(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/String;Z)V

    .line 114
    .line 115
    .line 116
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 117
    .line 118
    invoke-static {v0}, Ll/q0w;->t(Ll/q0w;)Ll/ik2;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 123
    .line 124
    invoke-static {v1}, Ll/q0w;->s(Ll/q0w;)Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v1

    .line 128
    sget-object v3, Lcom/clevertap/android/sdk/events/EventGroup;->PUSH_NOTIFICATION_VIEWED:Lcom/clevertap/android/sdk/events/EventGroup;

    .line 129
    .line 130
    invoke-virtual {v0, v1, v3, v2, v4}, Ll/ik2;->d(Landroid/content/Context;Lcom/clevertap/android/sdk/events/EventGroup;Ljava/lang/String;Z)V

    .line 131
    .line 132
    .line 133
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 134
    .line 135
    invoke-static {v0}, Ll/q0w;->u(Ll/q0w;)Lcom/clevertap/android/sdk/network/ContentFetchManager;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/network/ContentFetchManager;->d()V

    .line 140
    .line 141
    .line 142
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 143
    .line 144
    invoke-static {v0}, Ll/q0w;->v(Ll/q0w;)V

    .line 145
    .line 146
    .line 147
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 148
    .line 149
    invoke-static {v0}, Ll/q0w;->w(Ll/q0w;)Ll/bj2;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 154
    .line 155
    invoke-static {v1}, Ll/q0w;->s(Ll/q0w;)Landroid/content/Context;

    .line 156
    .line 157
    .line 158
    move-result-object v1

    .line 159
    invoke-interface {v0, v1}, Ll/bj2;->b(Landroid/content/Context;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v4}, Ll/bu9;->K(I)V

    .line 163
    .line 164
    .line 165
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 166
    .line 167
    invoke-static {v0}, Ll/q0w;->x(Ll/q0w;)Ll/xse0;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    invoke-virtual {v0}, Ll/xse0;->c()V

    .line 172
    .line 173
    .line 174
    iget-object v0, p0, Ll/q0w$a;->b:Ljava/lang/String;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 175
    .line 176
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 177
    .line 178
    if-eqz v0, :cond_1

    .line 179
    .line 180
    :try_start_1
    invoke-static {v1}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    iget-object v1, p0, Ll/q0w$a;->b:Ljava/lang/String;

    .line 185
    .line 186
    invoke-virtual {v0, v1}, Ll/uzd;->o(Ljava/lang/String;)V

    .line 187
    .line 188
    .line 189
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 190
    .line 191
    invoke-static {v0}, Ll/q0w;->f(Ll/q0w;)Ll/ch2;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iget-object v1, p0, Ll/q0w$a;->b:Ljava/lang/String;

    .line 196
    .line 197
    invoke-virtual {v0, v1}, Ll/ch2;->u(Ljava/lang/String;)V

    .line 198
    .line 199
    .line 200
    goto :goto_1

    .line 201
    :cond_1
    invoke-static {v1}, Ll/q0w;->c(Ll/q0w;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    invoke-virtual {v0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getEnableCustomCleverTapId()Z

    .line 206
    .line 207
    .line 208
    move-result v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 209
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 210
    .line 211
    if-eqz v0, :cond_2

    .line 212
    .line 213
    :try_start_2
    invoke-static {v1}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 214
    .line 215
    .line 216
    move-result-object v0

    .line 217
    iget-object v1, p0, Ll/q0w$a;->c:Ljava/lang/String;

    .line 218
    .line 219
    invoke-virtual {v0, v1}, Ll/uzd;->n(Ljava/lang/String;)Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    goto :goto_1

    .line 223
    :cond_2
    invoke-static {v1}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/uzd;->m()V

    .line 228
    .line 229
    .line 230
    :goto_1
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 231
    .line 232
    invoke-static {v0}, Ll/q0w;->g(Ll/q0w;)Ll/duv;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    invoke-virtual {v0}, Ll/duv;->k()V

    .line 237
    .line 238
    .line 239
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 240
    .line 241
    invoke-static {v0}, Ll/q0w;->f(Ll/q0w;)Ll/ch2;

    .line 242
    .line 243
    .line 244
    move-result-object v0

    .line 245
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 246
    .line 247
    invoke-static {v1}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    invoke-virtual {v1}, Ll/uzd;->E()Ljava/lang/String;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    invoke-virtual {v0, v1}, Ll/ch2;->u(Ljava/lang/String;)V

    .line 256
    .line 257
    .line 258
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 259
    .line 260
    invoke-static {v0}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    invoke-virtual {v0}, Ll/uzd;->k0()V

    .line 265
    .line 266
    .line 267
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 268
    .line 269
    invoke-static {v0}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 270
    .line 271
    .line 272
    move-result-object v0

    .line 273
    invoke-virtual {v0}, Ll/uzd;->m0()V

    .line 274
    .line 275
    .line 276
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 277
    .line 278
    invoke-static {v0}, Ll/q0w;->h(Ll/q0w;)V

    .line 279
    .line 280
    .line 281
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 282
    .line 283
    invoke-static {v0}, Ll/q0w;->i(Ll/q0w;)Ll/sk0;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    invoke-virtual {v0}, Ll/sk0;->w()V

    .line 288
    .line 289
    .line 290
    iget-object v0, p0, Ll/q0w$a;->a:Ljava/util/Map;

    .line 291
    .line 292
    if-eqz v0, :cond_3

    .line 293
    .line 294
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 295
    .line 296
    invoke-static {v0}, Ll/q0w;->i(Ll/q0w;)Ll/sk0;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iget-object v1, p0, Ll/q0w$a;->a:Ljava/util/Map;

    .line 301
    .line 302
    invoke-virtual {v0, v1}, Ll/sk0;->N(Ljava/util/Map;)V

    .line 303
    .line 304
    .line 305
    :cond_3
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 306
    .line 307
    invoke-static {v0}, Ll/q0w;->r(Ll/q0w;)Ll/cob0;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    invoke-virtual {v0, v4}, Ll/cob0;->w(Z)V

    .line 312
    .line 313
    .line 314
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 315
    .line 316
    invoke-static {v0}, Ll/q0w;->j(Ll/q0w;)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 320
    .line 321
    invoke-static {v0}, Ll/q0w;->k(Ll/q0w;)V

    .line 322
    .line 323
    .line 324
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 325
    .line 326
    invoke-static {v0}, Ll/q0w;->l(Ll/q0w;)V

    .line 327
    .line 328
    .line 329
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 330
    .line 331
    invoke-static {v0}, Ll/q0w;->m(Ll/q0w;)V

    .line 332
    .line 333
    .line 334
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 335
    .line 336
    invoke-virtual {v0}, Ll/q0w;->C()V

    .line 337
    .line 338
    .line 339
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 340
    .line 341
    invoke-static {v0}, Ll/q0w;->n(Ll/q0w;)V

    .line 342
    .line 343
    .line 344
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 345
    .line 346
    invoke-virtual {v0}, Ll/q0w;->A()V

    .line 347
    .line 348
    .line 349
    iget-object v0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 350
    .line 351
    invoke-static {v0}, Ll/q0w;->p(Ll/q0w;)Ll/w36;

    .line 352
    .line 353
    .line 354
    move-result-object v0

    .line 355
    invoke-virtual {v0}, Ll/w36;->i()Ll/vqm;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 360
    .line 361
    invoke-static {v1}, Ll/q0w;->e(Ll/q0w;)Ll/uzd;

    .line 362
    .line 363
    .line 364
    move-result-object v1

    .line 365
    invoke-virtual {v1}, Ll/uzd;->E()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object v1

    .line 369
    invoke-virtual {v0, v1}, Ll/vqm;->e(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 370
    .line 371
    .line 372
    goto :goto_3

    .line 373
    :goto_2
    iget-object v1, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 374
    .line 375
    invoke-static {v1}, Ll/q0w;->c(Ll/q0w;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 376
    .line 377
    .line 378
    move-result-object v1

    .line 379
    invoke-virtual {v1}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getLogger()Lcom/clevertap/android/sdk/Logger;

    .line 380
    .line 381
    .line 382
    move-result-object v1

    .line 383
    iget-object p0, p0, Ll/q0w$a;->d:Ll/q0w;

    .line 384
    .line 385
    invoke-static {p0}, Ll/q0w;->c(Ll/q0w;)Lcom/clevertap/android/sdk/CleverTapInstanceConfig;

    .line 386
    .line 387
    .line 388
    move-result-object p0

    .line 389
    invoke-virtual {p0}, Lcom/clevertap/android/sdk/CleverTapInstanceConfig;->getAccountId()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    const-string v3, "Reset Profile error"

    .line 394
    .line 395
    invoke-virtual {v1, p0, v3, v0}, Lcom/clevertap/android/sdk/Logger;->verbose(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 396
    .line 397
    .line 398
    :goto_3
    return-object v2
.end method

.method public bridge synthetic call()Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/q0w$a;->a()Ljava/lang/Void;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method
