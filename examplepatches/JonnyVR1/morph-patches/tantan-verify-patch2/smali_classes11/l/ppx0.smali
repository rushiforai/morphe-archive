.class public final Ll/ppx0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:Ll/h4t0;

.field public final synthetic b:Landroid/content/ServiceConnection;

.field public final synthetic c:Ll/qqx0;


# direct methods
.method public constructor <init>(Ll/qqx0;Ll/h4t0;Landroid/content/ServiceConnection;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 1
    iput-object p2, p0, Ll/ppx0;->a:Ll/h4t0;

    .line 2
    .line 3
    iput-object p3, p0, Ll/ppx0;->b:Landroid/content/ServiceConnection;

    .line 4
    .line 5
    iput-object p1, p0, Ll/ppx0;->c:Ll/qqx0;

    .line 6
    .line 7
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final run()V
    .locals 14

    .line 1
    iget-object v0, p0, Ll/ppx0;->c:Ll/qqx0;

    .line 2
    .line 3
    iget-object v1, v0, Ll/qqx0;->b:Ll/tnx0;

    .line 4
    .line 5
    invoke-static {v0}, Ll/qqx0;->a(Ll/qqx0;)Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    iget-object v2, p0, Ll/ppx0;->a:Ll/h4t0;

    .line 10
    .line 11
    iget-object p0, p0, Ll/ppx0;->b:Landroid/content/ServiceConnection;

    .line 12
    .line 13
    invoke-virtual {v1, v0, v2}, Ll/tnx0;->a(Ljava/lang/String;Ll/h4t0;)Landroid/os/Bundle;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    iget-object v3, v1, Ll/tnx0;->a:Ll/atx0;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/atx0;->zzl()Ll/qsx0;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-virtual {v3}, Ll/yyx0;->h()V

    .line 24
    .line 25
    .line 26
    iget-object v3, v1, Ll/tnx0;->a:Ll/atx0;

    .line 27
    .line 28
    invoke-virtual {v3}, Ll/atx0;->L()V

    .line 29
    .line 30
    .line 31
    if-eqz v2, :cond_a

    .line 32
    .line 33
    const-string v3, "install_begin_timestamp_seconds"

    .line 34
    .line 35
    const-wide/16 v4, 0x0

    .line 36
    .line 37
    invoke-virtual {v2, v3, v4, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 38
    .line 39
    .line 40
    move-result-wide v6

    .line 41
    const-wide/16 v8, 0x3e8

    .line 42
    .line 43
    mul-long/2addr v6, v8

    .line 44
    cmp-long v3, v6, v4

    .line 45
    .line 46
    if-nez v3, :cond_0

    .line 47
    .line 48
    iget-object v0, v1, Ll/tnx0;->a:Ll/atx0;

    .line 49
    .line 50
    invoke-virtual {v0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 51
    .line 52
    .line 53
    move-result-object v0

    .line 54
    invoke-virtual {v0}, Ll/d6x0;->F()Ll/l8x0;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v2, "Service response is missing Install Referrer install timestamp"

    .line 59
    .line 60
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 61
    .line 62
    .line 63
    goto/16 :goto_3

    .line 64
    .line 65
    :cond_0
    const-string v3, "install_referrer"

    .line 66
    .line 67
    invoke-virtual {v2, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v3

    .line 71
    if-eqz v3, :cond_9

    .line 72
    .line 73
    invoke-virtual {v3}, Ljava/lang/String;->isEmpty()Z

    .line 74
    .line 75
    .line 76
    move-result v10

    .line 77
    if-eqz v10, :cond_1

    .line 78
    .line 79
    goto/16 :goto_2

    .line 80
    .line 81
    :cond_1
    iget-object v10, v1, Ll/tnx0;->a:Ll/atx0;

    .line 82
    .line 83
    invoke-virtual {v10}, Ll/atx0;->zzj()Ll/d6x0;

    .line 84
    .line 85
    .line 86
    move-result-object v10

    .line 87
    invoke-virtual {v10}, Ll/d6x0;->E()Ll/l8x0;

    .line 88
    .line 89
    .line 90
    move-result-object v10

    .line 91
    const-string v11, "InstallReferrer API result"

    .line 92
    .line 93
    invoke-virtual {v10, v11, v3}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 94
    .line 95
    .line 96
    invoke-static {}, Ll/nny0;->a()Z

    .line 97
    .line 98
    .line 99
    move-result v10

    .line 100
    if-eqz v10, :cond_2

    .line 101
    .line 102
    iget-object v10, v1, Ll/tnx0;->a:Ll/atx0;

    .line 103
    .line 104
    invoke-virtual {v10}, Ll/atx0;->u()Ll/ajr0;

    .line 105
    .line 106
    .line 107
    move-result-object v10

    .line 108
    sget-object v11, Ll/whs0;->V0:Ll/zpw0;

    .line 109
    .line 110
    invoke-virtual {v10, v11}, Ll/ajr0;->n(Ll/zpw0;)Z

    .line 111
    .line 112
    .line 113
    move-result v10

    .line 114
    if-eqz v10, :cond_2

    .line 115
    .line 116
    const/4 v10, 0x1

    .line 117
    goto :goto_0

    .line 118
    :cond_2
    const/4 v10, 0x0

    .line 119
    :goto_0
    iget-object v11, v1, Ll/tnx0;->a:Ll/atx0;

    .line 120
    .line 121
    invoke-virtual {v11}, Ll/atx0;->G()Ll/hny0;

    .line 122
    .line 123
    .line 124
    move-result-object v11

    .line 125
    const-string v12, "?"

    .line 126
    .line 127
    invoke-virtual {v12, v3}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    .line 128
    .line 129
    .line 130
    move-result-object v3

    .line 131
    invoke-static {v3}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 132
    .line 133
    .line 134
    move-result-object v3

    .line 135
    invoke-virtual {v11, v3, v10}, Ll/hny0;->w(Landroid/net/Uri;Z)Landroid/os/Bundle;

    .line 136
    .line 137
    .line 138
    move-result-object v3

    .line 139
    if-nez v3, :cond_3

    .line 140
    .line 141
    iget-object v0, v1, Ll/tnx0;->a:Ll/atx0;

    .line 142
    .line 143
    invoke-virtual {v0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const-string v2, "No campaign params defined in Install Referrer result"

    .line 152
    .line 153
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 154
    .line 155
    .line 156
    goto/16 :goto_3

    .line 157
    .line 158
    :cond_3
    const-string v11, "click_timestamp"

    .line 159
    .line 160
    if-eqz v10, :cond_5

    .line 161
    .line 162
    const-string v10, "gclid"

    .line 163
    .line 164
    invoke-virtual {v3, v10}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 165
    .line 166
    .line 167
    move-result v10

    .line 168
    if-nez v10, :cond_4

    .line 169
    .line 170
    const-string v10, "gbraid"

    .line 171
    .line 172
    invoke-virtual {v3, v10}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    .line 173
    .line 174
    .line 175
    move-result v10

    .line 176
    if-eqz v10, :cond_7

    .line 177
    .line 178
    :cond_4
    const-string v10, "referrer_click_timestamp_server_seconds"

    .line 179
    .line 180
    invoke-virtual {v2, v10, v4, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 181
    .line 182
    .line 183
    move-result-wide v12

    .line 184
    mul-long/2addr v12, v8

    .line 185
    cmp-long v2, v12, v4

    .line 186
    .line 187
    if-lez v2, :cond_7

    .line 188
    .line 189
    invoke-virtual {v3, v11, v12, v13}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 190
    .line 191
    .line 192
    goto :goto_1

    .line 193
    :cond_5
    const-string v10, "medium"

    .line 194
    .line 195
    invoke-virtual {v3, v10}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v10

    .line 199
    if-eqz v10, :cond_7

    .line 200
    .line 201
    const-string v12, "(not set)"

    .line 202
    .line 203
    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 204
    .line 205
    .line 206
    move-result v12

    .line 207
    if-nez v12, :cond_7

    .line 208
    .line 209
    const-string v12, "organic"

    .line 210
    .line 211
    invoke-virtual {v12, v10}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    .line 212
    .line 213
    .line 214
    move-result v10

    .line 215
    if-nez v10, :cond_7

    .line 216
    .line 217
    const-string v10, "referrer_click_timestamp_seconds"

    .line 218
    .line 219
    invoke-virtual {v2, v10, v4, v5}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    .line 220
    .line 221
    .line 222
    move-result-wide v12

    .line 223
    mul-long/2addr v12, v8

    .line 224
    cmp-long v2, v12, v4

    .line 225
    .line 226
    if-nez v2, :cond_6

    .line 227
    .line 228
    iget-object v0, v1, Ll/tnx0;->a:Ll/atx0;

    .line 229
    .line 230
    invoke-virtual {v0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 231
    .line 232
    .line 233
    move-result-object v0

    .line 234
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    const-string v2, "Install Referrer is missing click timestamp for ad campaign"

    .line 239
    .line 240
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 241
    .line 242
    .line 243
    goto :goto_3

    .line 244
    :cond_6
    invoke-virtual {v3, v11, v12, v13}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    .line 245
    .line 246
    .line 247
    :cond_7
    :goto_1
    iget-object v2, v1, Ll/tnx0;->a:Ll/atx0;

    .line 248
    .line 249
    invoke-virtual {v2}, Ll/atx0;->A()Ll/ajx0;

    .line 250
    .line 251
    .line 252
    move-result-object v2

    .line 253
    iget-object v2, v2, Ll/ajx0;->h:Ll/zjx0;

    .line 254
    .line 255
    invoke-virtual {v2}, Ll/zjx0;->a()J

    .line 256
    .line 257
    .line 258
    move-result-wide v4

    .line 259
    cmp-long v2, v6, v4

    .line 260
    .line 261
    if-nez v2, :cond_8

    .line 262
    .line 263
    iget-object v2, v1, Ll/tnx0;->a:Ll/atx0;

    .line 264
    .line 265
    invoke-virtual {v2}, Ll/atx0;->zzj()Ll/d6x0;

    .line 266
    .line 267
    .line 268
    move-result-object v2

    .line 269
    invoke-virtual {v2}, Ll/d6x0;->E()Ll/l8x0;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    const-string v4, "Logging Install Referrer campaign from module while it may have already been logged."

    .line 274
    .line 275
    invoke-virtual {v2, v4}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 276
    .line 277
    .line 278
    :cond_8
    iget-object v2, v1, Ll/tnx0;->a:Ll/atx0;

    .line 279
    .line 280
    invoke-virtual {v2}, Ll/atx0;->k()Z

    .line 281
    .line 282
    .line 283
    move-result v2

    .line 284
    if-eqz v2, :cond_a

    .line 285
    .line 286
    iget-object v2, v1, Ll/tnx0;->a:Ll/atx0;

    .line 287
    .line 288
    invoke-virtual {v2}, Ll/atx0;->A()Ll/ajx0;

    .line 289
    .line 290
    .line 291
    move-result-object v2

    .line 292
    iget-object v2, v2, Ll/ajx0;->h:Ll/zjx0;

    .line 293
    .line 294
    invoke-virtual {v2, v6, v7}, Ll/zjx0;->b(J)V

    .line 295
    .line 296
    .line 297
    iget-object v2, v1, Ll/tnx0;->a:Ll/atx0;

    .line 298
    .line 299
    invoke-virtual {v2}, Ll/atx0;->zzj()Ll/d6x0;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    invoke-virtual {v2}, Ll/d6x0;->E()Ll/l8x0;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    const-string v4, "Logging Install Referrer campaign from gmscore with "

    .line 308
    .line 309
    const-string v5, "referrer API v2"

    .line 310
    .line 311
    invoke-virtual {v2, v4, v5}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 312
    .line 313
    .line 314
    const-string v2, "_cis"

    .line 315
    .line 316
    invoke-virtual {v3, v2, v5}, Landroid/os/BaseBundle;->putString(Ljava/lang/String;Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    iget-object v2, v1, Ll/tnx0;->a:Ll/atx0;

    .line 320
    .line 321
    invoke-virtual {v2}, Ll/atx0;->C()Lcom/google/android/gms/measurement/internal/g;

    .line 322
    .line 323
    .line 324
    move-result-object v2

    .line 325
    const-string v4, "auto"

    .line 326
    .line 327
    const-string v5, "_cmp"

    .line 328
    .line 329
    invoke-virtual {v2, v4, v5, v3, v0}, Lcom/google/android/gms/measurement/internal/g;->Z(Ljava/lang/String;Ljava/lang/String;Landroid/os/Bundle;Ljava/lang/String;)V

    .line 330
    .line 331
    .line 332
    goto :goto_3

    .line 333
    :cond_9
    :goto_2
    iget-object v0, v1, Ll/tnx0;->a:Ll/atx0;

    .line 334
    .line 335
    invoke-virtual {v0}, Ll/atx0;->zzj()Ll/d6x0;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    invoke-virtual {v0}, Ll/d6x0;->A()Ll/l8x0;

    .line 340
    .line 341
    .line 342
    move-result-object v0

    .line 343
    const-string v2, "No referrer defined in Install Referrer response"

    .line 344
    .line 345
    invoke-virtual {v0, v2}, Ll/l8x0;->a(Ljava/lang/String;)V

    .line 346
    .line 347
    .line 348
    :cond_a
    :goto_3
    if-eqz p0, :cond_b

    .line 349
    .line 350
    invoke-static {}, Lcom/google/android/gms/common/stats/ConnectionTracker;->getInstance()Lcom/google/android/gms/common/stats/ConnectionTracker;

    .line 351
    .line 352
    .line 353
    move-result-object v0

    .line 354
    iget-object v1, v1, Ll/tnx0;->a:Ll/atx0;

    .line 355
    .line 356
    invoke-virtual {v1}, Ll/atx0;->zza()Landroid/content/Context;

    .line 357
    .line 358
    .line 359
    move-result-object v1

    .line 360
    invoke-virtual {v0, v1, p0}, Lcom/google/android/gms/common/stats/ConnectionTracker;->unbindService(Landroid/content/Context;Landroid/content/ServiceConnection;)V

    .line 361
    .line 362
    .line 363
    :cond_b
    return-void
.end method
