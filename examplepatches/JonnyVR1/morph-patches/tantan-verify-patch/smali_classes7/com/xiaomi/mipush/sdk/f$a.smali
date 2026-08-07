.class Lcom/xiaomi/mipush/sdk/f$a;
.super Landroid/os/Handler;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/xiaomi/mipush/sdk/f;-><init>(Landroid/content/Context;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic a:Lcom/xiaomi/mipush/sdk/f;


# direct methods
.method public constructor <init>(Lcom/xiaomi/mipush/sdk/f;Landroid/os/Looper;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 2
    .line 3
    invoke-direct {p0, p2}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public dispatchMessage(Landroid/os/Message;)V
    .locals 8

    .line 1
    iget v0, p1, Landroid/os/Message;->what:I

    .line 2
    .line 3
    const/16 v1, 0x13

    .line 4
    .line 5
    if-eq v0, v1, :cond_0

    .line 6
    .line 7
    return-void

    .line 8
    :cond_0
    iget-object v0, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 9
    .line 10
    check-cast v0, Ljava/lang/String;

    .line 11
    .line 12
    iget v1, p1, Landroid/os/Message;->arg1:I

    .line 13
    .line 14
    const-class v2, Ll/m5r0;

    .line 15
    .line 16
    monitor-enter v2

    .line 17
    :try_start_0
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 18
    .line 19
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 24
    .line 25
    .line 26
    move-result-object v3

    .line 27
    invoke-virtual {v3, v0}, Ll/m5r0;->f(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result v3

    .line 31
    if-eqz v3, :cond_9

    .line 32
    .line 33
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 34
    .line 35
    invoke-static {v3}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    invoke-static {v3}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 40
    .line 41
    .line 42
    move-result-object v3

    .line 43
    invoke-virtual {v3, v0}, Ll/m5r0;->a(Ljava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v3

    .line 47
    const/16 v4, 0xa

    .line 48
    .line 49
    if-ge v3, v4, :cond_8

    .line 50
    .line 51
    const-string v3, ""

    .line 52
    .line 53
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 54
    .line 55
    .line 56
    move-result-object v4

    .line 57
    if-eqz v4, :cond_1

    .line 58
    .line 59
    invoke-virtual {p1}, Landroid/os/Message;->getData()Landroid/os/Bundle;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const-string v3, "third_sync_reason"

    .line 64
    .line 65
    invoke-virtual {p1, v3}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v3

    .line 69
    goto :goto_0

    .line 70
    :catchall_0
    move-exception p0

    .line 71
    goto/16 :goto_3

    .line 72
    .line 73
    :cond_1
    :goto_0
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->a:Lcom/xiaomi/mipush/sdk/v;

    .line 74
    .line 75
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 76
    .line 77
    .line 78
    move-result v4

    .line 79
    const/4 v5, 0x0

    .line 80
    const/4 v6, 0x1

    .line 81
    if-ne v4, v1, :cond_2

    .line 82
    .line 83
    const-string v4, "syncing"

    .line 84
    .line 85
    iget-object v7, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 86
    .line 87
    invoke-static {v7}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-static {v7}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 92
    .line 93
    .line 94
    move-result-object v7

    .line 95
    invoke-virtual {v7, p1}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 96
    .line 97
    .line 98
    move-result-object v7

    .line 99
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 100
    .line 101
    .line 102
    move-result v4

    .line 103
    if-eqz v4, :cond_2

    .line 104
    .line 105
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 106
    .line 107
    invoke-static {v1, v0, p1, v6, v5}, Lcom/xiaomi/mipush/sdk/f;->s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 108
    .line 109
    .line 110
    goto/16 :goto_1

    .line 111
    .line 112
    :cond_2
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->b:Lcom/xiaomi/mipush/sdk/v;

    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 115
    .line 116
    .line 117
    move-result v4

    .line 118
    if-ne v4, v1, :cond_3

    .line 119
    .line 120
    const-string v4, "syncing"

    .line 121
    .line 122
    iget-object v7, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 123
    .line 124
    invoke-static {v7}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 125
    .line 126
    .line 127
    move-result-object v7

    .line 128
    invoke-static {v7}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 129
    .line 130
    .line 131
    move-result-object v7

    .line 132
    invoke-virtual {v7, p1}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v7

    .line 136
    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result v4

    .line 140
    if-eqz v4, :cond_3

    .line 141
    .line 142
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 143
    .line 144
    invoke-static {v1, v0, p1, v6, v5}, Lcom/xiaomi/mipush/sdk/f;->s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 145
    .line 146
    .line 147
    goto/16 :goto_1

    .line 148
    .line 149
    :cond_3
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->c:Lcom/xiaomi/mipush/sdk/v;

    .line 150
    .line 151
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 152
    .line 153
    .line 154
    move-result v4

    .line 155
    const/4 v5, 0x0

    .line 156
    if-ne v4, v1, :cond_4

    .line 157
    .line 158
    const-string v4, "syncing"

    .line 159
    .line 160
    iget-object v6, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 161
    .line 162
    invoke-static {v6}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 163
    .line 164
    .line 165
    move-result-object v6

    .line 166
    invoke-static {v6}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 167
    .line 168
    .line 169
    move-result-object v6

    .line 170
    invoke-virtual {v6, p1}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v6

    .line 174
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 175
    .line 176
    .line 177
    move-result v4

    .line 178
    if-eqz v4, :cond_4

    .line 179
    .line 180
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 181
    .line 182
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 183
    .line 184
    .line 185
    move-result-object v1

    .line 186
    sget-object v4, Lcom/xiaomi/mipush/sdk/d;->a:Lcom/xiaomi/mipush/sdk/d;

    .line 187
    .line 188
    invoke-static {v1, v4}, Ll/n1r0;->e(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ljava/util/HashMap;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    const-string v4, "third_sync_reason"

    .line 193
    .line 194
    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 198
    .line 199
    invoke-static {v3, v0, p1, v5, v1}, Lcom/xiaomi/mipush/sdk/f;->s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 200
    .line 201
    .line 202
    goto/16 :goto_1

    .line 203
    .line 204
    :cond_4
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->d:Lcom/xiaomi/mipush/sdk/v;

    .line 205
    .line 206
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 207
    .line 208
    .line 209
    move-result v4

    .line 210
    if-ne v4, v1, :cond_5

    .line 211
    .line 212
    const-string v4, "syncing"

    .line 213
    .line 214
    iget-object v6, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 215
    .line 216
    invoke-static {v6}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 217
    .line 218
    .line 219
    move-result-object v6

    .line 220
    invoke-static {v6}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 221
    .line 222
    .line 223
    move-result-object v6

    .line 224
    invoke-virtual {v6, p1}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v6

    .line 228
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 229
    .line 230
    .line 231
    move-result v4

    .line 232
    if-eqz v4, :cond_5

    .line 233
    .line 234
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 235
    .line 236
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 237
    .line 238
    .line 239
    move-result-object v3

    .line 240
    sget-object v4, Lcom/xiaomi/mipush/sdk/d;->b:Lcom/xiaomi/mipush/sdk/d;

    .line 241
    .line 242
    invoke-static {v3, v4}, Ll/n1r0;->e(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ljava/util/HashMap;

    .line 243
    .line 244
    .line 245
    move-result-object v3

    .line 246
    invoke-static {v1, v0, p1, v5, v3}, Lcom/xiaomi/mipush/sdk/f;->s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 247
    .line 248
    .line 249
    goto :goto_1

    .line 250
    :cond_5
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->e:Lcom/xiaomi/mipush/sdk/v;

    .line 251
    .line 252
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 253
    .line 254
    .line 255
    move-result v4

    .line 256
    if-ne v4, v1, :cond_6

    .line 257
    .line 258
    const-string v4, "syncing"

    .line 259
    .line 260
    iget-object v6, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 261
    .line 262
    invoke-static {v6}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 263
    .line 264
    .line 265
    move-result-object v6

    .line 266
    invoke-static {v6}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 267
    .line 268
    .line 269
    move-result-object v6

    .line 270
    invoke-virtual {v6, p1}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v6

    .line 274
    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 275
    .line 276
    .line 277
    move-result v4

    .line 278
    if-eqz v4, :cond_6

    .line 279
    .line 280
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 281
    .line 282
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 283
    .line 284
    .line 285
    move-result-object v1

    .line 286
    sget-object v4, Lcom/xiaomi/mipush/sdk/d;->c:Lcom/xiaomi/mipush/sdk/d;

    .line 287
    .line 288
    invoke-static {v1, v4}, Ll/n1r0;->e(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ljava/util/HashMap;

    .line 289
    .line 290
    .line 291
    move-result-object v1

    .line 292
    const-string v4, "third_sync_reason"

    .line 293
    .line 294
    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 295
    .line 296
    .line 297
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 298
    .line 299
    invoke-static {v3, v0, p1, v5, v1}, Lcom/xiaomi/mipush/sdk/f;->s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 300
    .line 301
    .line 302
    goto :goto_1

    .line 303
    :cond_6
    sget-object p1, Lcom/xiaomi/mipush/sdk/v;->f:Lcom/xiaomi/mipush/sdk/v;

    .line 304
    .line 305
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 306
    .line 307
    .line 308
    move-result v4

    .line 309
    if-ne v4, v1, :cond_7

    .line 310
    .line 311
    const-string v1, "syncing"

    .line 312
    .line 313
    iget-object v4, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 314
    .line 315
    invoke-static {v4}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 316
    .line 317
    .line 318
    move-result-object v4

    .line 319
    invoke-static {v4}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 320
    .line 321
    .line 322
    move-result-object v4

    .line 323
    invoke-virtual {v4, p1}, Ll/m5r0;->b(Lcom/xiaomi/mipush/sdk/v;)Ljava/lang/String;

    .line 324
    .line 325
    .line 326
    move-result-object v4

    .line 327
    invoke-virtual {v1, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    if-eqz v1, :cond_7

    .line 332
    .line 333
    iget-object v1, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 334
    .line 335
    invoke-static {v1}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    sget-object v4, Lcom/xiaomi/mipush/sdk/d;->d:Lcom/xiaomi/mipush/sdk/d;

    .line 340
    .line 341
    invoke-static {v1, v4}, Ll/n1r0;->e(Landroid/content/Context;Lcom/xiaomi/mipush/sdk/d;)Ljava/util/HashMap;

    .line 342
    .line 343
    .line 344
    move-result-object v1

    .line 345
    const-string v4, "third_sync_reason"

    .line 346
    .line 347
    invoke-virtual {v1, v4, v3}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    iget-object v3, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 351
    .line 352
    invoke-static {v3, v0, p1, v5, v1}, Lcom/xiaomi/mipush/sdk/f;->s(Lcom/xiaomi/mipush/sdk/f;Ljava/lang/String;Lcom/xiaomi/mipush/sdk/v;ZLjava/util/HashMap;)V

    .line 353
    .line 354
    .line 355
    :cond_7
    :goto_1
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 356
    .line 357
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 358
    .line 359
    .line 360
    move-result-object p0

    .line 361
    invoke-static {p0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 362
    .line 363
    .line 364
    move-result-object p0

    .line 365
    invoke-virtual {p0, v0}, Ll/m5r0;->g(Ljava/lang/String;)V

    .line 366
    .line 367
    .line 368
    goto :goto_2

    .line 369
    :cond_8
    iget-object p0, p0, Lcom/xiaomi/mipush/sdk/f$a;->a:Lcom/xiaomi/mipush/sdk/f;

    .line 370
    .line 371
    invoke-static {p0}, Lcom/xiaomi/mipush/sdk/f;->c(Lcom/xiaomi/mipush/sdk/f;)Landroid/content/Context;

    .line 372
    .line 373
    .line 374
    move-result-object p0

    .line 375
    invoke-static {p0}, Ll/m5r0;->c(Landroid/content/Context;)Ll/m5r0;

    .line 376
    .line 377
    .line 378
    move-result-object p0

    .line 379
    invoke-virtual {p0, v0}, Ll/m5r0;->h(Ljava/lang/String;)V

    .line 380
    .line 381
    .line 382
    :cond_9
    :goto_2
    monitor-exit v2

    .line 383
    return-void

    .line 384
    :goto_3
    monitor-exit v2
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 385
    throw p0
.end method
