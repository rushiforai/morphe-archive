.class public Ll/yvk;
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

.method public static a()V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->R5:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/byd0;->clear()Z

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public static b()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->T5:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    return v0
.end method

.method public static c()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->S5:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    return v0
.end method

.method public static d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Z
    .locals 14

    .line 1
    invoke-static {}, Ll/gra;->m0()Lcom/p1/mobile/putong/core/data/ImproveInformationConfig;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    iget v2, v0, Lcom/p1/mobile/putong/core/data/ImproveInformationConfig;->maximumDisplayPerDay:I

    .line 10
    .line 11
    invoke-static {}, Ll/yvk;->m()I

    .line 12
    .line 13
    .line 14
    move-result v3

    .line 15
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 18
    .line 19
    iget-object v4, v4, Ll/dkb;->Y5:Ll/wyd0;

    .line 20
    .line 21
    invoke-virtual {v4}, Ll/azd0;->get()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object v4

    .line 25
    check-cast v4, Ljava/lang/String;

    .line 26
    .line 27
    iget-object v5, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 28
    .line 29
    invoke-static {v5, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v5

    .line 33
    if-nez v5, :cond_1

    .line 34
    .line 35
    if-lt v3, v2, :cond_1

    .line 36
    .line 37
    return v1

    .line 38
    :cond_1
    iget v2, v0, Lcom/p1/mobile/putong/core/data/ImproveInformationConfig;->showIntervalCardSwipe:I

    .line 39
    .line 40
    invoke-static {}, Ll/yvk;->k()J

    .line 41
    .line 42
    .line 43
    move-result-wide v5

    .line 44
    const-wide/16 v7, 0x0

    .line 45
    .line 46
    cmp-long v3, v5, v7

    .line 47
    .line 48
    if-ltz v3, :cond_3

    .line 49
    .line 50
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 51
    .line 52
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->Y0:Ll/r4a;

    .line 53
    .line 54
    iget-object v3, v3, Ll/r4a;->c:Ll/byd0;

    .line 55
    .line 56
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v3

    .line 60
    check-cast v3, Ljava/lang/Long;

    .line 61
    .line 62
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 63
    .line 64
    .line 65
    move-result-wide v7

    .line 66
    cmp-long v7, v7, v5

    .line 67
    .line 68
    if-nez v7, :cond_2

    .line 69
    .line 70
    iget-object v7, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 71
    .line 72
    invoke-static {v4, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 73
    .line 74
    .line 75
    move-result v7

    .line 76
    if-nez v7, :cond_2

    .line 77
    .line 78
    return v1

    .line 79
    :cond_2
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 80
    .line 81
    .line 82
    move-result-wide v7

    .line 83
    int-to-long v2, v2

    .line 84
    add-long/2addr v2, v5

    .line 85
    cmp-long v2, v7, v2

    .line 86
    .line 87
    if-gez v2, :cond_3

    .line 88
    .line 89
    iget-object v2, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 90
    .line 91
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 92
    .line 93
    .line 94
    move-result v2

    .line 95
    if-nez v2, :cond_3

    .line 96
    .line 97
    return v1

    .line 98
    :cond_3
    iget v0, v0, Lcom/p1/mobile/putong/core/data/ImproveInformationConfig;->sameInforCanBeDisplayedAtMost:I

    .line 99
    .line 100
    sget-object v2, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 101
    .line 102
    iget-object v2, v2, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 103
    .line 104
    invoke-virtual {v2}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 109
    .line 110
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 111
    .line 112
    iget-object v3, v3, Ll/dkb;->d6:Ll/wyd0;

    .line 113
    .line 114
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v3

    .line 118
    check-cast v3, Ljava/lang/CharSequence;

    .line 119
    .line 120
    iget-object v5, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 121
    .line 122
    invoke-static {v3, v5}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 123
    .line 124
    .line 125
    move-result v3

    .line 126
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 127
    .line 128
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 129
    .line 130
    iget-object v5, v5, Ll/dkb;->e6:Ll/wyd0;

    .line 131
    .line 132
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v5

    .line 136
    check-cast v5, Ljava/lang/CharSequence;

    .line 137
    .line 138
    iget-object v6, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 139
    .line 140
    invoke-static {v5, v6}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 141
    .line 142
    .line 143
    move-result v5

    .line 144
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 145
    .line 146
    iget-object v6, v6, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 147
    .line 148
    iget-object v6, v6, Ll/dkb;->f6:Ll/wyd0;

    .line 149
    .line 150
    invoke-virtual {v6}, Ll/azd0;->get()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v6

    .line 154
    check-cast v6, Ljava/lang/CharSequence;

    .line 155
    .line 156
    iget-object v7, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 157
    .line 158
    invoke-static {v6, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 159
    .line 160
    .line 161
    move-result v6

    .line 162
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 163
    .line 164
    iget-object v7, v7, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 165
    .line 166
    iget-object v7, v7, Ll/dkb;->g6:Ll/wyd0;

    .line 167
    .line 168
    invoke-virtual {v7}, Ll/azd0;->get()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object v7

    .line 172
    check-cast v7, Ljava/lang/CharSequence;

    .line 173
    .line 174
    iget-object v8, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v7, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 177
    .line 178
    .line 179
    move-result v7

    .line 180
    const-string v8, "fitness"

    .line 181
    .line 182
    invoke-static {p0, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 183
    .line 184
    .line 185
    move-result v8

    .line 186
    const-string v9, "not_reveal"

    .line 187
    .line 188
    const/4 v10, 0x1

    .line 189
    const-string v11, ""

    .line 190
    .line 191
    if-eqz v8, :cond_9

    .line 192
    .line 193
    if-nez v5, :cond_8

    .line 194
    .line 195
    if-nez v6, :cond_8

    .line 196
    .line 197
    if-eqz v7, :cond_4

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_4
    invoke-static {}, Ll/yvk;->c()I

    .line 202
    .line 203
    .line 204
    move-result v8

    .line 205
    if-gt v8, v0, :cond_8

    .line 206
    .line 207
    if-ne v8, v0, :cond_5

    .line 208
    .line 209
    iget-object v8, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 210
    .line 211
    invoke-static {v8, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 212
    .line 213
    .line 214
    move-result v8

    .line 215
    if-nez v8, :cond_5

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_5
    iget-object v8, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 220
    .line 221
    if-eqz v8, :cond_6

    .line 222
    .line 223
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 224
    .line 225
    if-eqz v8, :cond_6

    .line 226
    .line 227
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 228
    .line 229
    if-eqz v8, :cond_6

    .line 230
    .line 231
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 232
    .line 233
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 234
    .line 235
    .line 236
    move-result v8

    .line 237
    if-nez v8, :cond_6

    .line 238
    .line 239
    iget-object v8, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 240
    .line 241
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 242
    .line 243
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 244
    .line 245
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 246
    .line 247
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v8

    .line 251
    check-cast v8, Ljava/lang/CharSequence;

    .line 252
    .line 253
    invoke-static {v8, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 254
    .line 255
    .line 256
    move-result v8

    .line 257
    if-nez v8, :cond_6

    .line 258
    .line 259
    iget-object v8, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 260
    .line 261
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 262
    .line 263
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 264
    .line 265
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 266
    .line 267
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 268
    .line 269
    .line 270
    move-result v8

    .line 271
    if-eqz v8, :cond_9

    .line 272
    .line 273
    :cond_6
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 274
    .line 275
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 276
    .line 277
    .line 278
    move-result v8

    .line 279
    if-eqz v8, :cond_9

    .line 280
    .line 281
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 282
    .line 283
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 284
    .line 285
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 286
    .line 287
    .line 288
    move-result v8

    .line 289
    if-eqz v8, :cond_9

    .line 290
    .line 291
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 292
    .line 293
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 294
    .line 295
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 296
    .line 297
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 298
    .line 299
    .line 300
    move-result v8

    .line 301
    if-eqz v8, :cond_9

    .line 302
    .line 303
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 304
    .line 305
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 306
    .line 307
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 308
    .line 309
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 310
    .line 311
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 312
    .line 313
    .line 314
    move-result v8

    .line 315
    if-nez v8, :cond_9

    .line 316
    .line 317
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 318
    .line 319
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 320
    .line 321
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 322
    .line 323
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->fitness:Ljava/util/List;

    .line 324
    .line 325
    const-string v12, "habit"

    .line 326
    .line 327
    invoke-interface {v8, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 328
    .line 329
    .line 330
    move-result v12

    .line 331
    if-nez v12, :cond_7

    .line 332
    .line 333
    const-string v12, "occasionally"

    .line 334
    .line 335
    invoke-interface {v8, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 336
    .line 337
    .line 338
    move-result v8

    .line 339
    if-eqz v8, :cond_9

    .line 340
    .line 341
    :cond_7
    return v10

    .line 342
    :cond_8
    :goto_0
    return v1

    .line 343
    :cond_9
    const-string v8, "drink"

    .line 344
    .line 345
    invoke-static {p0, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 346
    .line 347
    .line 348
    move-result v8

    .line 349
    const-string v12, "never"

    .line 350
    .line 351
    if-eqz v8, :cond_f

    .line 352
    .line 353
    if-nez v3, :cond_e

    .line 354
    .line 355
    if-nez v6, :cond_e

    .line 356
    .line 357
    if-eqz v7, :cond_a

    .line 358
    .line 359
    goto/16 :goto_1

    .line 360
    .line 361
    :cond_a
    invoke-static {}, Ll/yvk;->b()I

    .line 362
    .line 363
    .line 364
    move-result v8

    .line 365
    if-gt v8, v0, :cond_e

    .line 366
    .line 367
    if-ne v8, v0, :cond_b

    .line 368
    .line 369
    iget-object v8, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 370
    .line 371
    invoke-static {v8, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 372
    .line 373
    .line 374
    move-result v8

    .line 375
    if-nez v8, :cond_b

    .line 376
    .line 377
    goto/16 :goto_1

    .line 378
    .line 379
    :cond_b
    iget-object v8, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 380
    .line 381
    if-eqz v8, :cond_c

    .line 382
    .line 383
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 384
    .line 385
    if-eqz v8, :cond_c

    .line 386
    .line 387
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 388
    .line 389
    if-eqz v8, :cond_c

    .line 390
    .line 391
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 392
    .line 393
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 394
    .line 395
    .line 396
    move-result v8

    .line 397
    if-nez v8, :cond_c

    .line 398
    .line 399
    iget-object v8, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 400
    .line 401
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 402
    .line 403
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 404
    .line 405
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 406
    .line 407
    invoke-interface {v8, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 408
    .line 409
    .line 410
    move-result v8

    .line 411
    if-nez v8, :cond_c

    .line 412
    .line 413
    iget-object v8, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 414
    .line 415
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 416
    .line 417
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 418
    .line 419
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 420
    .line 421
    invoke-interface {v8, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 422
    .line 423
    .line 424
    move-result-object v8

    .line 425
    check-cast v8, Ljava/lang/CharSequence;

    .line 426
    .line 427
    invoke-static {v8, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 428
    .line 429
    .line 430
    move-result v8

    .line 431
    if-eqz v8, :cond_f

    .line 432
    .line 433
    :cond_c
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 434
    .line 435
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 436
    .line 437
    .line 438
    move-result v8

    .line 439
    if-eqz v8, :cond_f

    .line 440
    .line 441
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 442
    .line 443
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 444
    .line 445
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 446
    .line 447
    .line 448
    move-result v8

    .line 449
    if-eqz v8, :cond_f

    .line 450
    .line 451
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 452
    .line 453
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 454
    .line 455
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 456
    .line 457
    invoke-static {v8}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 458
    .line 459
    .line 460
    move-result v8

    .line 461
    if-eqz v8, :cond_f

    .line 462
    .line 463
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 464
    .line 465
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 466
    .line 467
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 468
    .line 469
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 470
    .line 471
    invoke-static {v8}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 472
    .line 473
    .line 474
    move-result v8

    .line 475
    if-nez v8, :cond_f

    .line 476
    .line 477
    iget-object v8, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 478
    .line 479
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 480
    .line 481
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 482
    .line 483
    iget-object v8, v8, Lcom/p1/mobile/putong/data/Physical;->drink:Ljava/util/List;

    .line 484
    .line 485
    const-string v13, "social"

    .line 486
    .line 487
    invoke-interface {v8, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 488
    .line 489
    .line 490
    move-result v13

    .line 491
    if-nez v13, :cond_d

    .line 492
    .line 493
    const-string v13, "fan"

    .line 494
    .line 495
    invoke-interface {v8, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 496
    .line 497
    .line 498
    move-result v13

    .line 499
    if-nez v13, :cond_d

    .line 500
    .line 501
    const-string v13, "sometime"

    .line 502
    .line 503
    invoke-interface {v8, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 504
    .line 505
    .line 506
    move-result v13

    .line 507
    if-nez v13, :cond_d

    .line 508
    .line 509
    const-string v13, "quit_drink"

    .line 510
    .line 511
    invoke-interface {v8, v13}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 512
    .line 513
    .line 514
    move-result v13

    .line 515
    if-nez v13, :cond_d

    .line 516
    .line 517
    invoke-interface {v8, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 518
    .line 519
    .line 520
    move-result v8

    .line 521
    if-eqz v8, :cond_f

    .line 522
    .line 523
    :cond_d
    return v10

    .line 524
    :cond_e
    :goto_1
    return v1

    .line 525
    :cond_f
    const-string v8, "smoke"

    .line 526
    .line 527
    invoke-static {p0, v8}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 528
    .line 529
    .line 530
    move-result v8

    .line 531
    if-eqz v8, :cond_15

    .line 532
    .line 533
    if-nez v3, :cond_14

    .line 534
    .line 535
    if-nez v5, :cond_14

    .line 536
    .line 537
    if-eqz v7, :cond_10

    .line 538
    .line 539
    goto/16 :goto_2

    .line 540
    .line 541
    :cond_10
    invoke-static {}, Ll/yvk;->l()I

    .line 542
    .line 543
    .line 544
    move-result v7

    .line 545
    if-gt v7, v0, :cond_14

    .line 546
    .line 547
    if-ne v7, v0, :cond_11

    .line 548
    .line 549
    iget-object v7, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 550
    .line 551
    invoke-static {v7, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 552
    .line 553
    .line 554
    move-result v7

    .line 555
    if-nez v7, :cond_11

    .line 556
    .line 557
    goto/16 :goto_2

    .line 558
    .line 559
    :cond_11
    iget-object v7, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 560
    .line 561
    if-eqz v7, :cond_12

    .line 562
    .line 563
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 564
    .line 565
    if-eqz v7, :cond_12

    .line 566
    .line 567
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 568
    .line 569
    if-eqz v7, :cond_12

    .line 570
    .line 571
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 572
    .line 573
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 574
    .line 575
    .line 576
    move-result v7

    .line 577
    if-nez v7, :cond_12

    .line 578
    .line 579
    iget-object v7, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 580
    .line 581
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 582
    .line 583
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 584
    .line 585
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 586
    .line 587
    invoke-interface {v7, v9}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 588
    .line 589
    .line 590
    move-result v7

    .line 591
    if-nez v7, :cond_12

    .line 592
    .line 593
    iget-object v7, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 594
    .line 595
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 596
    .line 597
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 598
    .line 599
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 600
    .line 601
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 602
    .line 603
    .line 604
    move-result-object v7

    .line 605
    check-cast v7, Ljava/lang/CharSequence;

    .line 606
    .line 607
    invoke-static {v7, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 608
    .line 609
    .line 610
    move-result v7

    .line 611
    if-eqz v7, :cond_15

    .line 612
    .line 613
    :cond_12
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 614
    .line 615
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 616
    .line 617
    .line 618
    move-result v7

    .line 619
    if-eqz v7, :cond_15

    .line 620
    .line 621
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 622
    .line 623
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 624
    .line 625
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 626
    .line 627
    .line 628
    move-result v7

    .line 629
    if-eqz v7, :cond_15

    .line 630
    .line 631
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 632
    .line 633
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 634
    .line 635
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 636
    .line 637
    invoke-static {v7}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 638
    .line 639
    .line 640
    move-result v7

    .line 641
    if-eqz v7, :cond_15

    .line 642
    .line 643
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 644
    .line 645
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 646
    .line 647
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 648
    .line 649
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 650
    .line 651
    invoke-static {v7}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 652
    .line 653
    .line 654
    move-result v7

    .line 655
    if-nez v7, :cond_15

    .line 656
    .line 657
    iget-object v7, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 658
    .line 659
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 660
    .line 661
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Extensions;->physical:Lcom/p1/mobile/putong/data/Physical;

    .line 662
    .line 663
    iget-object v7, v7, Lcom/p1/mobile/putong/data/Physical;->smoke:Ljava/util/List;

    .line 664
    .line 665
    const-string v8, "quit_smoke"

    .line 666
    .line 667
    invoke-interface {v7, v8}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 668
    .line 669
    .line 670
    move-result v8

    .line 671
    if-nez v8, :cond_13

    .line 672
    .line 673
    invoke-interface {v7, v12}, Ljava/util/List;->contains(Ljava/lang/Object;)Z

    .line 674
    .line 675
    .line 676
    move-result v7

    .line 677
    if-eqz v7, :cond_15

    .line 678
    .line 679
    :cond_13
    return v10

    .line 680
    :cond_14
    :goto_2
    return v1

    .line 681
    :cond_15
    const-string v7, "game"

    .line 682
    .line 683
    invoke-static {p0, v7}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 684
    .line 685
    .line 686
    move-result p0

    .line 687
    if-eqz p0, :cond_1a

    .line 688
    .line 689
    if-nez v3, :cond_1a

    .line 690
    .line 691
    if-nez v5, :cond_1a

    .line 692
    .line 693
    if-eqz v6, :cond_16

    .line 694
    .line 695
    goto/16 :goto_3

    .line 696
    .line 697
    :cond_16
    invoke-static {}, Ll/yvk;->e()I

    .line 698
    .line 699
    .line 700
    move-result p0

    .line 701
    if-gt p0, v0, :cond_1a

    .line 702
    .line 703
    if-ne p0, v0, :cond_17

    .line 704
    .line 705
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 706
    .line 707
    invoke-static {p0, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 708
    .line 709
    .line 710
    move-result p0

    .line 711
    if-nez p0, :cond_17

    .line 712
    .line 713
    goto/16 :goto_3

    .line 714
    .line 715
    :cond_17
    iget-object p0, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 716
    .line 717
    if-eqz p0, :cond_19

    .line 718
    .line 719
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 720
    .line 721
    if-eqz p0, :cond_19

    .line 722
    .line 723
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 724
    .line 725
    if-eqz p0, :cond_19

    .line 726
    .line 727
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 728
    .line 729
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 730
    .line 731
    .line 732
    move-result p0

    .line 733
    if-nez p0, :cond_18

    .line 734
    .line 735
    iget-object p0, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 736
    .line 737
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 738
    .line 739
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 740
    .line 741
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 742
    .line 743
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 744
    .line 745
    .line 746
    move-result-object p0

    .line 747
    check-cast p0, Ljava/lang/CharSequence;

    .line 748
    .line 749
    invoke-static {p0, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 750
    .line 751
    .line 752
    move-result p0

    .line 753
    if-eqz p0, :cond_1a

    .line 754
    .line 755
    :cond_18
    iget-object p0, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 756
    .line 757
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 758
    .line 759
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 760
    .line 761
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 762
    .line 763
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 764
    .line 765
    .line 766
    move-result p0

    .line 767
    if-nez p0, :cond_19

    .line 768
    .line 769
    iget-object p0, v2, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 770
    .line 771
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 772
    .line 773
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 774
    .line 775
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 776
    .line 777
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 778
    .line 779
    .line 780
    move-result-object p0

    .line 781
    check-cast p0, Ljava/lang/CharSequence;

    .line 782
    .line 783
    invoke-static {p0, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 784
    .line 785
    .line 786
    move-result p0

    .line 787
    if-eqz p0, :cond_1a

    .line 788
    .line 789
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 790
    .line 791
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 792
    .line 793
    .line 794
    move-result p0

    .line 795
    if-eqz p0, :cond_1a

    .line 796
    .line 797
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 798
    .line 799
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 800
    .line 801
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 802
    .line 803
    .line 804
    move-result p0

    .line 805
    if-eqz p0, :cond_1a

    .line 806
    .line 807
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 808
    .line 809
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 810
    .line 811
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 812
    .line 813
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 814
    .line 815
    .line 816
    move-result p0

    .line 817
    if-eqz p0, :cond_1a

    .line 818
    .line 819
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 820
    .line 821
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 822
    .line 823
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 824
    .line 825
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 826
    .line 827
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 828
    .line 829
    .line 830
    move-result p0

    .line 831
    if-nez p0, :cond_1a

    .line 832
    .line 833
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 834
    .line 835
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 836
    .line 837
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 838
    .line 839
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->name:Ljava/util/List;

    .line 840
    .line 841
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 842
    .line 843
    .line 844
    move-result-object p0

    .line 845
    check-cast p0, Ljava/lang/CharSequence;

    .line 846
    .line 847
    invoke-static {p0, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 848
    .line 849
    .line 850
    move-result p0

    .line 851
    if-nez p0, :cond_1a

    .line 852
    .line 853
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 854
    .line 855
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 856
    .line 857
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 858
    .line 859
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 860
    .line 861
    invoke-static {p0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 862
    .line 863
    .line 864
    move-result p0

    .line 865
    if-nez p0, :cond_1a

    .line 866
    .line 867
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 868
    .line 869
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 870
    .line 871
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Extensions;->game:Lcom/p1/mobile/putong/data/ExtensionGame;

    .line 872
    .line 873
    iget-object p0, p0, Lcom/p1/mobile/putong/data/ExtensionGame;->together:Ljava/util/List;

    .line 874
    .line 875
    invoke-interface {p0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 876
    .line 877
    .line 878
    move-result-object p0

    .line 879
    check-cast p0, Ljava/lang/CharSequence;

    .line 880
    .line 881
    invoke-static {p0, v11}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 882
    .line 883
    .line 884
    move-result p0

    .line 885
    if-nez p0, :cond_1a

    .line 886
    .line 887
    return v10

    .line 888
    :cond_1a
    :goto_3
    return v1
.end method

.method public static e()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->V5:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    return v0
.end method

.method public static f(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->likedMe()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->superLikedMe()Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-nez v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/User;->letter()Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_1

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/yvk;->i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isSpecialLike()Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_0

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :cond_0
    const/4 p0, 0x0

    .line 33
    return p0

    .line 34
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 35
    return p0
.end method

.method public static g(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v1, p0, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->id:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ll/dkb;->Pa(Ljava/lang/String;)Lcom/p1/mobile/putong/data/User;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-static {v0, p0}, Ll/yvk;->h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    return p0
.end method

.method public static h(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 3

    .line 1
    invoke-static {}, Ll/gra;->C()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-nez v0, :cond_0

    .line 7
    .line 8
    return v1

    .line 9
    :cond_0
    invoke-static {}, Ll/gra;->K1()Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_1

    .line 14
    .line 15
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 16
    .line 17
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->z2:Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;

    .line 18
    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/core/api/CoreJustVerificationCardApi;->r3()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    return v1

    .line 26
    :cond_1
    iget v0, p0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 27
    .line 28
    const/4 v2, 0x4

    .line 29
    if-ge v0, v2, :cond_2

    .line 30
    .line 31
    return v1

    .line 32
    :cond_2
    invoke-static {p0, p1}, Ll/yvk;->f(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 33
    .line 34
    .line 35
    move-result p1

    .line 36
    if-eqz p1, :cond_3

    .line 37
    .line 38
    return v1

    .line 39
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 40
    .line 41
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBanned()Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    const/4 v2, 0x1

    .line 52
    if-nez v0, :cond_5

    .line 53
    .line 54
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isBannedNew()Z

    .line 55
    .line 56
    .line 57
    move-result p1

    .line 58
    if-eqz p1, :cond_4

    .line 59
    .line 60
    goto :goto_0

    .line 61
    :cond_4
    move p1, v1

    .line 62
    goto :goto_1

    .line 63
    :cond_5
    :goto_0
    move p1, v2

    .line 64
    :goto_1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 65
    .line 66
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 67
    .line 68
    invoke-virtual {v0}, Ll/dkb;->e8()Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez p1, :cond_b

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    goto :goto_2

    .line 77
    :cond_6
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 78
    .line 79
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/c;->o3()Lcom/p1/mobile/putong/data/Counter;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iget-object p1, p1, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 84
    .line 85
    iget p1, p1, Lcom/p1/mobile/putong/data/ProfileLike;->remaining:I

    .line 86
    .line 87
    if-gtz p1, :cond_7

    .line 88
    .line 89
    return v1

    .line 90
    :cond_7
    const-string p1, "fitness"

    .line 91
    .line 92
    invoke-static {p1, p0}, Ll/yvk;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 93
    .line 94
    .line 95
    move-result p1

    .line 96
    if-eqz p1, :cond_8

    .line 97
    .line 98
    return v2

    .line 99
    :cond_8
    const-string p1, "drink"

    .line 100
    .line 101
    invoke-static {p1, p0}, Ll/yvk;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 102
    .line 103
    .line 104
    move-result p1

    .line 105
    if-eqz p1, :cond_9

    .line 106
    .line 107
    return v2

    .line 108
    :cond_9
    const-string p1, "smoke"

    .line 109
    .line 110
    invoke-static {p1, p0}, Ll/yvk;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 111
    .line 112
    .line 113
    move-result p1

    .line 114
    if-eqz p1, :cond_a

    .line 115
    .line 116
    return v2

    .line 117
    :cond_a
    const-string p1, "game"

    .line 118
    .line 119
    invoke-static {p1, p0}, Ll/yvk;->d(Ljava/lang/String;Lcom/p1/mobile/putong/data/User;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_b

    .line 124
    .line 125
    return v2

    .line 126
    :cond_b
    :goto_2
    return v1
.end method

.method public static i(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 2

    .line 1
    sget-object v0, Ll/e760;->INSTANCE:Ll/e760;

    .line 2
    .line 3
    invoke-virtual {v0, p1}, Ll/e760;->c(Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->isUserLikeMe()Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    invoke-interface {v0}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/User;->isFemale()Z

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    if-nez v0, :cond_4

    .line 30
    .line 31
    :cond_1
    invoke-static {p0, p1}, Ll/yvk;->j(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_4

    .line 36
    .line 37
    iget-boolean p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeSlideCardReward:Z

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    invoke-static {}, Ll/wrf0;->g()Z

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    if-eqz p0, :cond_2

    .line 46
    .line 47
    invoke-static {}, Ll/wrf0;->h()Z

    .line 48
    .line 49
    .line 50
    move-result p0

    .line 51
    if-eqz p0, :cond_2

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 55
    .line 56
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    if-eqz p0, :cond_3

    .line 61
    .line 62
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->cardInfos:Lcom/p1/mobile/putong/core/data/CardInfos;

    .line 63
    .line 64
    iget-boolean p0, p0, Lcom/p1/mobile/putong/core/data/CardInfos;->momentLikedYou:Z

    .line 65
    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    return v1

    .line 69
    :cond_3
    const/4 p0, 0x0

    .line 70
    return p0

    .line 71
    :cond_4
    :goto_0
    return v1
.end method

.method public static j(Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;)Z
    .locals 2

    .line 1
    invoke-static {}, Ll/gra;->F1()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x1

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-static {p0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    if-eqz v0, :cond_0

    .line 13
    .line 14
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 15
    .line 16
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    if-eqz v0, :cond_0

    .line 21
    .line 22
    iget-object v0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 23
    .line 24
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 25
    .line 26
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 27
    .line 28
    .line 29
    move-result v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 33
    .line 34
    iget-object p0, p0, Lcom/p1/mobile/putong/data/Relationship;->relationshipExtensions:Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 35
    .line 36
    iget-object p0, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 37
    .line 38
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    if-nez p0, :cond_0

    .line 43
    .line 44
    return v1

    .line 45
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->N()Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-interface {p0}, Lcom/p1/mobile/putong/feed_api/api/serviceprovider/api/FeedService;->Wm()Z

    .line 50
    .line 51
    .line 52
    move-result p0

    .line 53
    if-eqz p0, :cond_1

    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/core/api/CoreSuggested$UserInfo;->hasLikeMeFrom:Ljava/lang/String;

    .line 56
    .line 57
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 58
    .line 59
    .line 60
    move-result p0

    .line 61
    if-nez p0, :cond_1

    .line 62
    .line 63
    return v1

    .line 64
    :cond_1
    const/4 p0, 0x0

    .line 65
    return p0
.end method

.method public static k()J
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->R5:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    return-wide v0
.end method

.method public static l()I
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->U5:Ll/vxd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Integer;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    return v0
.end method

.method public static m()I
    .locals 4

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 4
    .line 5
    iget-object v0, v0, Ll/dkb;->W5:Ll/byd0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    check-cast v0, Ljava/lang/Long;

    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    invoke-static {}, Ll/pzi0;->o()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    invoke-static {v0, v1, v2, v3}, Ll/pzi0;->C(JJ)Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 28
    .line 29
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 30
    .line 31
    iget-object v0, v0, Ll/dkb;->X5:Ll/vxd0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    check-cast v0, Ljava/lang/Integer;

    .line 38
    .line 39
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    return v0

    .line 44
    :cond_0
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 45
    .line 46
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 47
    .line 48
    iget-object v0, v0, Ll/dkb;->W5:Ll/byd0;

    .line 49
    .line 50
    invoke-static {}, Ll/pzi0;->o()J

    .line 51
    .line 52
    .line 53
    move-result-wide v1

    .line 54
    invoke-static {v1, v2}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0, v1}, Ll/byd0;->put(Ljava/lang/Object;)Z

    .line 59
    .line 60
    .line 61
    invoke-static {}, Ll/yvk;->a()V

    .line 62
    .line 63
    .line 64
    const/4 v0, 0x0

    .line 65
    return v0
.end method
