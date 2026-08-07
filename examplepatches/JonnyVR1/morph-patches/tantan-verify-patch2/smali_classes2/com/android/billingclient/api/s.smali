.class final Lcom/android/billingclient/api/s;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Landroid/content/ServiceConnection;


# instance fields
.field private final a:Ll/ay2;

.field final synthetic b:Lcom/android/billingclient/api/b;


# direct methods
.method public synthetic constructor <init>(Lcom/android/billingclient/api/b;Ll/ay2;Ll/ens0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Lcom/android/billingclient/api/s;->a:Ll/ay2;

    .line 7
    .line 8
    return-void
.end method

.method private final c(Lcom/android/billingclient/api/d;)V
    .locals 3

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x3

    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-void

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    iget-object p0, p0, Lcom/android/billingclient/api/s;->a:Ll/ay2;

    .line 23
    .line 24
    invoke-interface {p0, p1}, Ll/ay2;->a(Lcom/android/billingclient/api/d;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :goto_0
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p0
.end method


# virtual methods
.method public final synthetic a()Ljava/lang/Object;
    .locals 15
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    monitor-enter v0

    .line 8
    :try_start_0
    iget-object v1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 9
    .line 10
    invoke-static {v1}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 11
    .line 12
    .line 13
    move-result v1

    .line 14
    const/4 v2, 0x3

    .line 15
    const/4 v3, 0x0

    .line 16
    if-ne v1, v2, :cond_0

    .line 17
    .line 18
    monitor-exit v0

    .line 19
    goto/16 :goto_28

    .line 20
    .line 21
    :catchall_0
    move-exception p0

    .line 22
    goto/16 :goto_29

    .line 23
    .line 24
    :cond_0
    iget-object v1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 25
    .line 26
    invoke-static {v1}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    if-nez v0, :cond_1

    .line 36
    .line 37
    new-instance v0, Landroid/os/Bundle;

    .line 38
    .line 39
    invoke-direct {v0}, Landroid/os/Bundle;-><init>()V

    .line 40
    .line 41
    .line 42
    const-string v4, "accountName"

    .line 43
    .line 44
    invoke-virtual {v0, v4, v3}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 45
    .line 46
    .line 47
    iget-object v4, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 48
    .line 49
    invoke-static {v4}, Lcom/android/billingclient/api/b;->M0(Lcom/android/billingclient/api/b;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v5

    .line 53
    invoke-static {v4}, Lcom/android/billingclient/api/b;->H0(Lcom/android/billingclient/api/b;)Ljava/lang/Long;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    invoke-virtual {v4}, Ljava/lang/Long;->longValue()J

    .line 58
    .line 59
    .line 60
    move-result-wide v6

    .line 61
    invoke-static {v0, v5, v6, v7}, Lcom/google/android/gms/internal/play_billing/p;->c(Landroid/os/Bundle;Ljava/lang/String;J)Landroid/os/Bundle;

    .line 62
    .line 63
    .line 64
    goto :goto_0

    .line 65
    :cond_1
    move-object v0, v3

    .line 66
    :goto_0
    const/4 v4, 0x6

    .line 67
    const/4 v5, 0x0

    .line 68
    const/4 v6, 0x1

    .line 69
    :try_start_1
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 70
    .line 71
    invoke-static {v7}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v7

    .line 75
    monitor-enter v7
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0

    .line 76
    :try_start_2
    iget-object v8, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 77
    .line 78
    invoke-static {v8}, Lcom/android/billingclient/api/b;->F0(Lcom/android/billingclient/api/b;)Ll/jsr0;

    .line 79
    .line 80
    .line 81
    move-result-object v8

    .line 82
    monitor-exit v7
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 83
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 84
    .line 85
    if-nez v8, :cond_2

    .line 86
    .line 87
    :try_start_3
    invoke-static {v7, v5}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V

    .line 88
    .line 89
    .line 90
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 91
    .line 92
    sget-object v2, Lcom/android/billingclient/api/h0;->m:Lcom/android/billingclient/api/d;

    .line 93
    .line 94
    const/16 v7, 0x77

    .line 95
    .line 96
    invoke-static {v0, v7, v4, v2}, Lcom/android/billingclient/api/b;->l0(Lcom/android/billingclient/api/b;IILcom/android/billingclient/api/d;)V

    .line 97
    .line 98
    .line 99
    invoke-direct {p0, v2}, Lcom/android/billingclient/api/s;->c(Lcom/android/billingclient/api/d;)V

    .line 100
    .line 101
    .line 102
    goto/16 :goto_28

    .line 103
    .line 104
    :catch_0
    move-exception v0

    .line 105
    goto/16 :goto_1e

    .line 106
    .line 107
    :cond_2
    invoke-static {v7}, Lcom/android/billingclient/api/b;->v0(Lcom/android/billingclient/api/b;)Landroid/content/Context;

    .line 108
    .line 109
    .line 110
    move-result-object v7

    .line 111
    invoke-virtual {v7}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v7

    .line 115
    const/16 v9, 0x17

    .line 116
    .line 117
    move v11, v2

    .line 118
    move v10, v9

    .line 119
    :goto_1
    if-lt v10, v2, :cond_5

    .line 120
    .line 121
    if-nez v0, :cond_3

    .line 122
    .line 123
    const-string v11, "subs"

    .line 124
    .line 125
    invoke-interface {v8, v10, v7, v11}, Ll/jsr0;->F6(ILjava/lang/String;Ljava/lang/String;)I

    .line 126
    .line 127
    .line 128
    move-result v11

    .line 129
    goto :goto_2

    .line 130
    :cond_3
    const-string v11, "subs"

    .line 131
    .line 132
    invoke-interface {v8, v10, v7, v11, v0}, Ll/jsr0;->e4(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)I

    .line 133
    .line 134
    .line 135
    move-result v11

    .line 136
    :goto_2
    if-nez v11, :cond_4

    .line 137
    .line 138
    const-string v12, "BillingClient"

    .line 139
    .line 140
    new-instance v13, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {v13}, Ljava/lang/StringBuilder;-><init>()V

    .line 143
    .line 144
    .line 145
    const-string v14, "highestLevelSupportedForSubs: "

    .line 146
    .line 147
    invoke-virtual {v13, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 148
    .line 149
    .line 150
    invoke-virtual {v13, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 151
    .line 152
    .line 153
    invoke-virtual {v13}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v13

    .line 157
    invoke-static {v12, v13}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 158
    .line 159
    .line 160
    goto :goto_3

    .line 161
    :cond_4
    add-int/lit8 v10, v10, -0x1

    .line 162
    .line 163
    goto :goto_1

    .line 164
    :cond_5
    move v10, v5

    .line 165
    :goto_3
    iget-object v12, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 166
    .line 167
    const/4 v13, 0x5

    .line 168
    if-lt v10, v13, :cond_6

    .line 169
    .line 170
    move v13, v6

    .line 171
    goto :goto_4

    .line 172
    :cond_6
    move v13, v5

    .line 173
    :goto_4
    invoke-static {v12, v13}, Lcom/android/billingclient/api/b;->F(Lcom/android/billingclient/api/b;Z)V

    .line 174
    .line 175
    .line 176
    iget-object v12, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 177
    .line 178
    if-lt v10, v2, :cond_7

    .line 179
    .line 180
    move v13, v6

    .line 181
    goto :goto_5

    .line 182
    :cond_7
    move v13, v5

    .line 183
    :goto_5
    invoke-static {v12, v13}, Lcom/android/billingclient/api/b;->G(Lcom/android/billingclient/api/b;Z)V

    .line 184
    .line 185
    .line 186
    const/16 v12, 0x9

    .line 187
    .line 188
    if-ge v10, v2, :cond_8

    .line 189
    .line 190
    const-string v10, "BillingClient"

    .line 191
    .line 192
    const-string v13, "In-app billing API does not support subscription on this device."

    .line 193
    .line 194
    invoke-static {v10, v13}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    move v10, v12

    .line 198
    goto :goto_6

    .line 199
    :cond_8
    move v10, v6

    .line 200
    :goto_6
    move v13, v9

    .line 201
    :goto_7
    if-lt v13, v2, :cond_b

    .line 202
    .line 203
    if-nez v0, :cond_9

    .line 204
    .line 205
    const-string v11, "inapp"

    .line 206
    .line 207
    invoke-interface {v8, v13, v7, v11}, Ll/jsr0;->F6(ILjava/lang/String;Ljava/lang/String;)I

    .line 208
    .line 209
    .line 210
    move-result v11

    .line 211
    goto :goto_8

    .line 212
    :cond_9
    const-string v11, "inapp"

    .line 213
    .line 214
    invoke-interface {v8, v13, v7, v11, v0}, Ll/jsr0;->e4(ILjava/lang/String;Ljava/lang/String;Landroid/os/Bundle;)I

    .line 215
    .line 216
    .line 217
    move-result v11

    .line 218
    :goto_8
    if-nez v11, :cond_a

    .line 219
    .line 220
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 221
    .line 222
    invoke-static {v0, v13}, Lcom/android/billingclient/api/b;->o(Lcom/android/billingclient/api/b;I)V

    .line 223
    .line 224
    .line 225
    const-string v0, "BillingClient"

    .line 226
    .line 227
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 228
    .line 229
    invoke-static {v7}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 230
    .line 231
    .line 232
    move-result v7

    .line 233
    new-instance v8, Ljava/lang/StringBuilder;

    .line 234
    .line 235
    invoke-direct {v8}, Ljava/lang/StringBuilder;-><init>()V

    .line 236
    .line 237
    .line 238
    const-string v13, "mHighestLevelSupportedForInApp: "

    .line 239
    .line 240
    invoke-virtual {v8, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 241
    .line 242
    .line 243
    invoke-virtual {v8, v7}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 244
    .line 245
    .line 246
    invoke-virtual {v8}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 247
    .line 248
    .line 249
    move-result-object v7

    .line 250
    invoke-static {v0, v7}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 251
    .line 252
    .line 253
    goto :goto_9

    .line 254
    :cond_a
    add-int/lit8 v13, v13, -0x1

    .line 255
    .line 256
    goto :goto_7

    .line 257
    :cond_b
    :goto_9
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 258
    .line 259
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 260
    .line 261
    .line 262
    move-result v7

    .line 263
    if-lt v7, v9, :cond_c

    .line 264
    .line 265
    move v7, v6

    .line 266
    goto :goto_a

    .line 267
    :cond_c
    move v7, v5

    .line 268
    :goto_a
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->A(Lcom/android/billingclient/api/b;Z)V

    .line 269
    .line 270
    .line 271
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 272
    .line 273
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 274
    .line 275
    .line 276
    move-result v7

    .line 277
    const/16 v8, 0x16

    .line 278
    .line 279
    if-lt v7, v8, :cond_d

    .line 280
    .line 281
    move v7, v6

    .line 282
    goto :goto_b

    .line 283
    :cond_d
    move v7, v5

    .line 284
    :goto_b
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->z(Lcom/android/billingclient/api/b;Z)V

    .line 285
    .line 286
    .line 287
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 288
    .line 289
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 290
    .line 291
    .line 292
    move-result v7

    .line 293
    const/16 v8, 0x15

    .line 294
    .line 295
    if-lt v7, v8, :cond_e

    .line 296
    .line 297
    move v7, v6

    .line 298
    goto :goto_c

    .line 299
    :cond_e
    move v7, v5

    .line 300
    :goto_c
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->y(Lcom/android/billingclient/api/b;Z)V

    .line 301
    .line 302
    .line 303
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 304
    .line 305
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 306
    .line 307
    .line 308
    move-result v7

    .line 309
    const/16 v8, 0x14

    .line 310
    .line 311
    if-lt v7, v8, :cond_f

    .line 312
    .line 313
    move v7, v6

    .line 314
    goto :goto_d

    .line 315
    :cond_f
    move v7, v5

    .line 316
    :goto_d
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->x(Lcom/android/billingclient/api/b;Z)V

    .line 317
    .line 318
    .line 319
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 320
    .line 321
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 322
    .line 323
    .line 324
    move-result v7

    .line 325
    const/16 v8, 0x13

    .line 326
    .line 327
    if-lt v7, v8, :cond_10

    .line 328
    .line 329
    move v7, v6

    .line 330
    goto :goto_e

    .line 331
    :cond_10
    move v7, v5

    .line 332
    :goto_e
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->w(Lcom/android/billingclient/api/b;Z)V

    .line 333
    .line 334
    .line 335
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 336
    .line 337
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 338
    .line 339
    .line 340
    move-result v7

    .line 341
    const/16 v8, 0x12

    .line 342
    .line 343
    if-lt v7, v8, :cond_11

    .line 344
    .line 345
    move v7, v6

    .line 346
    goto :goto_f

    .line 347
    :cond_11
    move v7, v5

    .line 348
    :goto_f
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->v(Lcom/android/billingclient/api/b;Z)V

    .line 349
    .line 350
    .line 351
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 352
    .line 353
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 354
    .line 355
    .line 356
    move-result v7

    .line 357
    const/16 v8, 0x11

    .line 358
    .line 359
    if-lt v7, v8, :cond_12

    .line 360
    .line 361
    move v7, v6

    .line 362
    goto :goto_10

    .line 363
    :cond_12
    move v7, v5

    .line 364
    :goto_10
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->u(Lcom/android/billingclient/api/b;Z)V

    .line 365
    .line 366
    .line 367
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 368
    .line 369
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 370
    .line 371
    .line 372
    move-result v7

    .line 373
    const/16 v8, 0x10

    .line 374
    .line 375
    if-lt v7, v8, :cond_13

    .line 376
    .line 377
    move v7, v6

    .line 378
    goto :goto_11

    .line 379
    :cond_13
    move v7, v5

    .line 380
    :goto_11
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->t(Lcom/android/billingclient/api/b;Z)V

    .line 381
    .line 382
    .line 383
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 384
    .line 385
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 386
    .line 387
    .line 388
    move-result v7

    .line 389
    const/16 v8, 0xf

    .line 390
    .line 391
    if-lt v7, v8, :cond_14

    .line 392
    .line 393
    move v7, v6

    .line 394
    goto :goto_12

    .line 395
    :cond_14
    move v7, v5

    .line 396
    :goto_12
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->s(Lcom/android/billingclient/api/b;Z)V

    .line 397
    .line 398
    .line 399
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 400
    .line 401
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 402
    .line 403
    .line 404
    move-result v7

    .line 405
    const/16 v8, 0xe

    .line 406
    .line 407
    if-lt v7, v8, :cond_15

    .line 408
    .line 409
    move v7, v6

    .line 410
    goto :goto_13

    .line 411
    :cond_15
    move v7, v5

    .line 412
    :goto_13
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->r(Lcom/android/billingclient/api/b;Z)V

    .line 413
    .line 414
    .line 415
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 416
    .line 417
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 418
    .line 419
    .line 420
    move-result v7

    .line 421
    const/16 v8, 0xc

    .line 422
    .line 423
    if-lt v7, v8, :cond_16

    .line 424
    .line 425
    move v7, v6

    .line 426
    goto :goto_14

    .line 427
    :cond_16
    move v7, v5

    .line 428
    :goto_14
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->q(Lcom/android/billingclient/api/b;Z)V

    .line 429
    .line 430
    .line 431
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 432
    .line 433
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 434
    .line 435
    .line 436
    move-result v7

    .line 437
    const/16 v8, 0xa

    .line 438
    .line 439
    if-lt v7, v8, :cond_17

    .line 440
    .line 441
    move v7, v6

    .line 442
    goto :goto_15

    .line 443
    :cond_17
    move v7, v5

    .line 444
    :goto_15
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->p(Lcom/android/billingclient/api/b;Z)V

    .line 445
    .line 446
    .line 447
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 448
    .line 449
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 450
    .line 451
    .line 452
    move-result v7

    .line 453
    if-lt v7, v12, :cond_18

    .line 454
    .line 455
    move v7, v6

    .line 456
    goto :goto_16

    .line 457
    :cond_18
    move v7, v5

    .line 458
    :goto_16
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->D(Lcom/android/billingclient/api/b;Z)V

    .line 459
    .line 460
    .line 461
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 462
    .line 463
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 464
    .line 465
    .line 466
    move-result v7

    .line 467
    const/16 v8, 0x8

    .line 468
    .line 469
    if-lt v7, v8, :cond_19

    .line 470
    .line 471
    move v7, v6

    .line 472
    goto :goto_17

    .line 473
    :cond_19
    move v7, v5

    .line 474
    :goto_17
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->C(Lcom/android/billingclient/api/b;Z)V

    .line 475
    .line 476
    .line 477
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 478
    .line 479
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 480
    .line 481
    .line 482
    move-result v7

    .line 483
    if-lt v7, v4, :cond_1a

    .line 484
    .line 485
    move v7, v6

    .line 486
    goto :goto_18

    .line 487
    :cond_1a
    move v7, v5

    .line 488
    :goto_18
    invoke-static {v0, v7}, Lcom/android/billingclient/api/b;->B(Lcom/android/billingclient/api/b;Z)V

    .line 489
    .line 490
    .line 491
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 492
    .line 493
    invoke-static {v0}, Lcom/android/billingclient/api/b;->q0(Lcom/android/billingclient/api/b;)I

    .line 494
    .line 495
    .line 496
    move-result v0

    .line 497
    if-ge v0, v2, :cond_1b

    .line 498
    .line 499
    const-string v0, "BillingClient"

    .line 500
    .line 501
    const-string v7, "In-app billing API version 3 is not supported on this device."

    .line 502
    .line 503
    invoke-static {v0, v7}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 504
    .line 505
    .line 506
    const/16 v10, 0x24

    .line 507
    .line 508
    :cond_1b
    if-nez v11, :cond_20

    .line 509
    .line 510
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 511
    .line 512
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 513
    .line 514
    .line 515
    move-result-object v0

    .line 516
    monitor-enter v0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_0

    .line 517
    :try_start_4
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 518
    .line 519
    invoke-static {v7}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 520
    .line 521
    .line 522
    move-result v7

    .line 523
    if-ne v7, v2, :cond_1c

    .line 524
    .line 525
    monitor-exit v0

    .line 526
    goto/16 :goto_28

    .line 527
    .line 528
    :catchall_1
    move-exception v2

    .line 529
    goto :goto_1c

    .line 530
    :cond_1c
    if-ne v1, v6, :cond_1d

    .line 531
    .line 532
    move v2, v5

    .line 533
    goto :goto_19

    .line 534
    :cond_1d
    move v2, v6

    .line 535
    :goto_19
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 536
    .line 537
    const/4 v8, 0x2

    .line 538
    invoke-static {v7, v8}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V

    .line 539
    .line 540
    .line 541
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 542
    .line 543
    invoke-static {v7}, Lcom/android/billingclient/api/b;->z0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/n0;

    .line 544
    .line 545
    .line 546
    move-result-object v7

    .line 547
    if-eqz v7, :cond_1e

    .line 548
    .line 549
    iget-object v7, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 550
    .line 551
    invoke-static {v7}, Lcom/android/billingclient/api/b;->z0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/n0;

    .line 552
    .line 553
    .line 554
    move-result-object v7

    .line 555
    goto :goto_1a

    .line 556
    :cond_1e
    move-object v7, v3

    .line 557
    :goto_1a
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 558
    if-eqz v7, :cond_1f

    .line 559
    .line 560
    :try_start_5
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 561
    .line 562
    invoke-static {v0}, Lcom/android/billingclient/api/b;->i0(Lcom/android/billingclient/api/b;)Z

    .line 563
    .line 564
    .line 565
    move-result v0

    .line 566
    invoke-virtual {v7, v0}, Lcom/android/billingclient/api/n0;->g(Z)V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_0

    .line 567
    .line 568
    .line 569
    :cond_1f
    :goto_1b
    move-object v0, v3

    .line 570
    goto :goto_23

    .line 571
    :goto_1c
    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 572
    :try_start_7
    throw v2

    .line 573
    :cond_20
    if-ne v1, v6, :cond_21

    .line 574
    .line 575
    move v2, v5

    .line 576
    goto :goto_1d

    .line 577
    :cond_21
    move v2, v6

    .line 578
    :goto_1d
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 579
    .line 580
    invoke-static {v0, v5}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V
    :try_end_7
    .catch Ljava/lang/Exception; {:try_start_7 .. :try_end_7} :catch_0

    .line 581
    .line 582
    .line 583
    goto :goto_1b

    .line 584
    :catchall_2
    move-exception v0

    .line 585
    :try_start_8
    monitor-exit v7
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 586
    :try_start_9
    throw v0
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_0

    .line 587
    :goto_1e
    if-ne v1, v6, :cond_22

    .line 588
    .line 589
    move v2, v5

    .line 590
    goto :goto_1f

    .line 591
    :cond_22
    move v2, v6

    .line 592
    :goto_1f
    const-string v1, "BillingClient"

    .line 593
    .line 594
    const-string v7, "Exception while checking if billing is supported; try to reconnect"

    .line 595
    .line 596
    invoke-static {v1, v7, v0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 597
    .line 598
    .line 599
    instance-of v1, v0, Landroid/os/DeadObjectException;

    .line 600
    .line 601
    const/16 v7, 0x2a

    .line 602
    .line 603
    if-eqz v1, :cond_23

    .line 604
    .line 605
    const/16 v1, 0x65

    .line 606
    .line 607
    :goto_20
    move v10, v1

    .line 608
    goto :goto_21

    .line 609
    :cond_23
    instance-of v1, v0, Landroid/os/RemoteException;

    .line 610
    .line 611
    if-eqz v1, :cond_24

    .line 612
    .line 613
    const/16 v1, 0x64

    .line 614
    .line 615
    goto :goto_20

    .line 616
    :cond_24
    instance-of v1, v0, Ljava/lang/SecurityException;

    .line 617
    .line 618
    if-eqz v1, :cond_25

    .line 619
    .line 620
    const/16 v1, 0x66

    .line 621
    .line 622
    goto :goto_20

    .line 623
    :cond_25
    move v10, v7

    .line 624
    :goto_21
    if-ne v10, v7, :cond_26

    .line 625
    .line 626
    invoke-static {v0}, Lcom/android/billingclient/api/f0;->a(Ljava/lang/Exception;)Ljava/lang/String;

    .line 627
    .line 628
    .line 629
    move-result-object v0

    .line 630
    goto :goto_22

    .line 631
    :cond_26
    move-object v0, v3

    .line 632
    :goto_22
    iget-object v1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 633
    .line 634
    invoke-static {v1, v5}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V

    .line 635
    .line 636
    .line 637
    move v11, v4

    .line 638
    :goto_23
    if-nez v11, :cond_28

    .line 639
    .line 640
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 641
    .line 642
    if-eq v6, v2, :cond_27

    .line 643
    .line 644
    :try_start_a
    invoke-static {v0, v4}, Lcom/android/billingclient/api/b;->n0(Lcom/android/billingclient/api/b;I)V

    .line 645
    .line 646
    .line 647
    goto :goto_25

    .line 648
    :catchall_3
    move-exception v0

    .line 649
    goto :goto_24

    .line 650
    :cond_27
    invoke-static {v0}, Lcom/android/billingclient/api/b;->B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;

    .line 651
    .line 652
    .line 653
    move-result-object v0

    .line 654
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/y0;->A()Ll/nby0;

    .line 655
    .line 656
    .line 657
    move-result-object v1

    .line 658
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/o0;->D()Ll/r4y0;

    .line 659
    .line 660
    .line 661
    move-result-object v2

    .line 662
    invoke-virtual {v2, v5}, Ll/r4y0;->r(I)Ll/r4y0;

    .line 663
    .line 664
    .line 665
    invoke-virtual {v1, v2}, Ll/nby0;->o(Ll/r4y0;)Ll/nby0;

    .line 666
    .line 667
    .line 668
    invoke-virtual {v1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 669
    .line 670
    .line 671
    move-result-object v1

    .line 672
    check-cast v1, Lcom/google/android/gms/internal/play_billing/y0;

    .line 673
    .line 674
    invoke-interface {v0, v1}, Lcom/android/billingclient/api/g0;->b(Lcom/google/android/gms/internal/play_billing/y0;)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_3

    .line 675
    .line 676
    .line 677
    goto :goto_25

    .line 678
    :goto_24
    const-string v1, "BillingClient"

    .line 679
    .line 680
    const-string v2, "Unable to log."

    .line 681
    .line 682
    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 683
    .line 684
    .line 685
    :goto_25
    sget-object v0, Lcom/android/billingclient/api/h0;->l:Lcom/android/billingclient/api/d;

    .line 686
    .line 687
    invoke-direct {p0, v0}, Lcom/android/billingclient/api/s;->c(Lcom/android/billingclient/api/d;)V

    .line 688
    .line 689
    .line 690
    goto :goto_28

    .line 691
    :cond_28
    sget-object v1, Lcom/android/billingclient/api/h0;->a:Lcom/android/billingclient/api/d;

    .line 692
    .line 693
    if-eq v6, v2, :cond_29

    .line 694
    .line 695
    :try_start_b
    iget-object v2, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 696
    .line 697
    invoke-static {v2, v10, v4, v1, v0}, Lcom/android/billingclient/api/b;->m0(Lcom/android/billingclient/api/b;IILcom/android/billingclient/api/d;Ljava/lang/String;)V

    .line 698
    .line 699
    .line 700
    goto :goto_27

    .line 701
    :catchall_4
    move-exception v0

    .line 702
    goto :goto_26

    .line 703
    :cond_29
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/o0;->D()Ll/r4y0;

    .line 704
    .line 705
    .line 706
    move-result-object v2

    .line 707
    invoke-virtual {v1}, Lcom/android/billingclient/api/d;->b()I

    .line 708
    .line 709
    .line 710
    move-result v4

    .line 711
    invoke-virtual {v2, v4}, Ll/r4y0;->r(I)Ll/r4y0;

    .line 712
    .line 713
    .line 714
    invoke-virtual {v1}, Lcom/android/billingclient/api/d;->a()Ljava/lang/String;

    .line 715
    .line 716
    .line 717
    move-result-object v1

    .line 718
    invoke-virtual {v2, v1}, Ll/r4y0;->q(Ljava/lang/String;)Ll/r4y0;

    .line 719
    .line 720
    .line 721
    invoke-virtual {v2, v10}, Ll/r4y0;->s(I)Ll/r4y0;

    .line 722
    .line 723
    .line 724
    if-eqz v0, :cond_2a

    .line 725
    .line 726
    invoke-virtual {v2, v0}, Ll/r4y0;->o(Ljava/lang/String;)Ll/r4y0;

    .line 727
    .line 728
    .line 729
    :cond_2a
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 730
    .line 731
    invoke-static {v0}, Lcom/android/billingclient/api/b;->B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;

    .line 732
    .line 733
    .line 734
    move-result-object v0

    .line 735
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/y0;->A()Ll/nby0;

    .line 736
    .line 737
    .line 738
    move-result-object v1

    .line 739
    invoke-virtual {v2}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 740
    .line 741
    .line 742
    move-result-object v2

    .line 743
    check-cast v2, Lcom/google/android/gms/internal/play_billing/o0;

    .line 744
    .line 745
    invoke-virtual {v1, v2}, Ll/nby0;->q(Lcom/google/android/gms/internal/play_billing/o0;)Ll/nby0;

    .line 746
    .line 747
    .line 748
    invoke-virtual {v1}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 749
    .line 750
    .line 751
    move-result-object v1

    .line 752
    check-cast v1, Lcom/google/android/gms/internal/play_billing/y0;

    .line 753
    .line 754
    invoke-interface {v0, v1}, Lcom/android/billingclient/api/g0;->b(Lcom/google/android/gms/internal/play_billing/y0;)V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_4

    .line 755
    .line 756
    .line 757
    goto :goto_27

    .line 758
    :goto_26
    const-string v1, "BillingClient"

    .line 759
    .line 760
    const-string v2, "Unable to log."

    .line 761
    .line 762
    invoke-static {v1, v2, v0}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 763
    .line 764
    .line 765
    :goto_27
    sget-object v0, Lcom/android/billingclient/api/h0;->a:Lcom/android/billingclient/api/d;

    .line 766
    .line 767
    invoke-direct {p0, v0}, Lcom/android/billingclient/api/s;->c(Lcom/android/billingclient/api/d;)V

    .line 768
    .line 769
    .line 770
    :goto_28
    return-object v3

    .line 771
    :goto_29
    :try_start_c
    monitor-exit v0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_0

    .line 772
    throw p0
.end method

.method public final synthetic b()V
    .locals 4

    .line 1
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V

    .line 5
    .line 6
    .line 7
    sget-object v0, Lcom/android/billingclient/api/h0;->n:Lcom/android/billingclient/api/d;

    .line 8
    .line 9
    iget-object v1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 10
    .line 11
    const/16 v2, 0x18

    .line 12
    .line 13
    const/4 v3, 0x6

    .line 14
    invoke-static {v1, v2, v3, v0}, Lcom/android/billingclient/api/b;->l0(Lcom/android/billingclient/api/b;IILcom/android/billingclient/api/d;)V

    .line 15
    .line 16
    .line 17
    invoke-direct {p0, v0}, Lcom/android/billingclient/api/s;->c(Lcom/android/billingclient/api/d;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public final onBindingDied(Landroid/content/ComponentName;)V
    .locals 3

    .line 1
    const-string p1, "BillingClient"

    .line 2
    .line 3
    const-string v0, "Billing service died."

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/billingclient/api/b;->j0(Lcom/android/billingclient/api/b;)Z

    .line 11
    .line 12
    .line 13
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    :try_start_1
    invoke-static {v0}, Lcom/android/billingclient/api/b;->B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/m0;->D()Ll/t2y0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x6

    .line 27
    invoke-virtual {v0, v1}, Ll/t2y0;->r(I)Ll/t2y0;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/o0;->D()Ll/r4y0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/16 v2, 0x7a

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/r4y0;->s(I)Ll/r4y0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/t2y0;->o(Ll/r4y0;)Ll/t2y0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/google/android/gms/internal/play_billing/m0;

    .line 47
    .line 48
    invoke-interface {p1, v0}, Lcom/android/billingclient/api/g0;->d(Lcom/google/android/gms/internal/play_billing/m0;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-static {v0}, Lcom/android/billingclient/api/b;->B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/p0;->y()Lcom/google/android/gms/internal/play_billing/p0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p1, v0}, Lcom/android/billingclient/api/g0;->a(Lcom/google/android/gms/internal/play_billing/p0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :goto_0
    const-string v0, "BillingClient"

    .line 67
    .line 68
    const-string v1, "Unable to log."

    .line 69
    .line 70
    invoke-static {v0, v1, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :goto_1
    iget-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    monitor-enter p1

    .line 80
    :try_start_2
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v1, 0x3

    .line 87
    if-eq v0, v1, :cond_2

    .line 88
    .line 89
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 90
    .line 91
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    if-nez v0, :cond_1

    .line 96
    .line 97
    goto :goto_2

    .line 98
    :cond_1
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 99
    .line 100
    const/4 v1, 0x0

    .line 101
    invoke-static {v0, v1}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V

    .line 102
    .line 103
    .line 104
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 105
    .line 106
    invoke-static {v0}, Lcom/android/billingclient/api/b;->c0(Lcom/android/billingclient/api/b;)V

    .line 107
    .line 108
    .line 109
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 110
    iget-object p0, p0, Lcom/android/billingclient/api/s;->a:Ll/ay2;

    .line 111
    .line 112
    invoke-interface {p0}, Ll/ay2;->c()V

    .line 113
    .line 114
    .line 115
    return-void

    .line 116
    :catchall_1
    move-exception p0

    .line 117
    goto :goto_3

    .line 118
    :cond_2
    :goto_2
    :try_start_3
    monitor-exit p1

    .line 119
    return-void

    .line 120
    :goto_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 121
    throw p0
.end method

.method public final onServiceConnected(Landroid/content/ComponentName;Landroid/os/IBinder;)V
    .locals 7

    .line 1
    const-string p1, "BillingClient"

    .line 2
    .line 3
    const-string v0, "Billing service connected."

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->j(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    monitor-enter p1

    .line 15
    :try_start_0
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 16
    .line 17
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    const/4 v1, 0x3

    .line 22
    if-ne v0, v1, :cond_0

    .line 23
    .line 24
    monitor-exit p1

    .line 25
    return-void

    .line 26
    :catchall_0
    move-exception v0

    .line 27
    move-object p0, v0

    .line 28
    goto :goto_0

    .line 29
    :cond_0
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 30
    .line 31
    invoke-static {p2}, Ll/xqr0;->P2(Landroid/os/IBinder;)Ll/jsr0;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-static {v0, p2}, Lcom/android/billingclient/api/b;->E(Lcom/android/billingclient/api/b;Ll/jsr0;)V

    .line 36
    .line 37
    .line 38
    monitor-exit p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    iget-object v1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 40
    .line 41
    new-instance v2, Lcom/android/billingclient/api/q;

    .line 42
    .line 43
    invoke-direct {v2, p0}, Lcom/android/billingclient/api/q;-><init>(Lcom/android/billingclient/api/s;)V

    .line 44
    .line 45
    .line 46
    new-instance v5, Lcom/android/billingclient/api/r;

    .line 47
    .line 48
    invoke-direct {v5, p0}, Lcom/android/billingclient/api/r;-><init>(Lcom/android/billingclient/api/s;)V

    .line 49
    .line 50
    .line 51
    invoke-static {v1}, Lcom/android/billingclient/api/b;->y0(Lcom/android/billingclient/api/b;)Landroid/os/Handler;

    .line 52
    .line 53
    .line 54
    move-result-object v6

    .line 55
    const-wide/16 v3, 0x7530

    .line 56
    .line 57
    invoke-static/range {v1 .. v6}, Lcom/android/billingclient/api/b;->m(Lcom/android/billingclient/api/b;Ljava/util/concurrent/Callable;JLjava/lang/Runnable;Landroid/os/Handler;)Ljava/util/concurrent/Future;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    if-nez p1, :cond_1

    .line 62
    .line 63
    iget-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 64
    .line 65
    invoke-static {p1}, Lcom/android/billingclient/api/b;->D0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/d;

    .line 66
    .line 67
    .line 68
    move-result-object p2

    .line 69
    const/16 v0, 0x19

    .line 70
    .line 71
    const/4 v1, 0x6

    .line 72
    invoke-static {p1, v0, v1, p2}, Lcom/android/billingclient/api/b;->l0(Lcom/android/billingclient/api/b;IILcom/android/billingclient/api/d;)V

    .line 73
    .line 74
    .line 75
    invoke-direct {p0, p2}, Lcom/android/billingclient/api/s;->c(Lcom/android/billingclient/api/d;)V

    .line 76
    .line 77
    .line 78
    :cond_1
    return-void

    .line 79
    :goto_0
    :try_start_1
    monitor-exit p1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 80
    throw p0
.end method

.method public final onServiceDisconnected(Landroid/content/ComponentName;)V
    .locals 3

    .line 1
    const-string p1, "BillingClient"

    .line 2
    .line 3
    const-string v0, "Billing service disconnected."

    .line 4
    .line 5
    invoke-static {p1, v0}, Lcom/google/android/gms/internal/play_billing/p;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    :try_start_0
    iget-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 9
    .line 10
    invoke-static {p1}, Lcom/android/billingclient/api/b;->j0(Lcom/android/billingclient/api/b;)Z

    .line 11
    .line 12
    .line 13
    move-result p1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 15
    .line 16
    if-eqz p1, :cond_0

    .line 17
    .line 18
    :try_start_1
    invoke-static {v0}, Lcom/android/billingclient/api/b;->B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/m0;->D()Ll/t2y0;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    const/4 v1, 0x6

    .line 27
    invoke-virtual {v0, v1}, Ll/t2y0;->r(I)Ll/t2y0;

    .line 28
    .line 29
    .line 30
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/o0;->D()Ll/r4y0;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const/16 v2, 0x79

    .line 35
    .line 36
    invoke-virtual {v1, v2}, Ll/r4y0;->s(I)Ll/r4y0;

    .line 37
    .line 38
    .line 39
    invoke-virtual {v0, v1}, Ll/t2y0;->o(Ll/r4y0;)Ll/t2y0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {v0}, Ll/oox0;->k()Lcom/google/android/gms/internal/play_billing/d0;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/google/android/gms/internal/play_billing/m0;

    .line 47
    .line 48
    invoke-interface {p1, v0}, Lcom/android/billingclient/api/g0;->d(Lcom/google/android/gms/internal/play_billing/m0;)V

    .line 49
    .line 50
    .line 51
    goto :goto_1

    .line 52
    :catchall_0
    move-exception p1

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    invoke-static {v0}, Lcom/android/billingclient/api/b;->B0(Lcom/android/billingclient/api/b;)Lcom/android/billingclient/api/g0;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    invoke-static {}, Lcom/google/android/gms/internal/play_billing/z0;->y()Lcom/google/android/gms/internal/play_billing/z0;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-interface {p1, v0}, Lcom/android/billingclient/api/g0;->c(Lcom/google/android/gms/internal/play_billing/z0;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 63
    .line 64
    .line 65
    goto :goto_1

    .line 66
    :goto_0
    const-string v0, "BillingClient"

    .line 67
    .line 68
    const-string v1, "Unable to log."

    .line 69
    .line 70
    invoke-static {v0, v1, p1}, Lcom/google/android/gms/internal/play_billing/p;->l(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 71
    .line 72
    .line 73
    :goto_1
    iget-object p1, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 74
    .line 75
    invoke-static {p1}, Lcom/android/billingclient/api/b;->I0(Lcom/android/billingclient/api/b;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    monitor-enter p1

    .line 80
    :try_start_2
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 81
    .line 82
    invoke-static {v0}, Lcom/android/billingclient/api/b;->I(Lcom/android/billingclient/api/b;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    const/4 v1, 0x3

    .line 87
    if-ne v0, v1, :cond_1

    .line 88
    .line 89
    monitor-exit p1

    .line 90
    return-void

    .line 91
    :catchall_1
    move-exception p0

    .line 92
    goto :goto_2

    .line 93
    :cond_1
    iget-object v0, p0, Lcom/android/billingclient/api/s;->b:Lcom/android/billingclient/api/b;

    .line 94
    .line 95
    const/4 v1, 0x0

    .line 96
    invoke-static {v0, v1}, Lcom/android/billingclient/api/b;->H(Lcom/android/billingclient/api/b;I)V

    .line 97
    .line 98
    .line 99
    monitor-exit p1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 100
    iget-object p0, p0, Lcom/android/billingclient/api/s;->a:Ll/ay2;

    .line 101
    .line 102
    invoke-interface {p0}, Ll/ay2;->c()V

    .line 103
    .line 104
    .line 105
    return-void

    .line 106
    :goto_2
    :try_start_3
    monitor-exit p1
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 107
    throw p0
.end method
