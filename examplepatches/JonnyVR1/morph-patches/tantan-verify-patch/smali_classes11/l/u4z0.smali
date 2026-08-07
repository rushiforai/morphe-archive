.class public final Ll/u4z0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public a:Lcom/google/android/gms/internal/measurement/y;

.field public b:Ljava/lang/Long;

.field public c:J

.field public final synthetic d:Ll/pwy0;


# direct methods
.method public constructor <init>(Ll/pwy0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public synthetic constructor <init>(Ll/pwy0;Ll/tdr0;)V
    .locals 0

    .line 7
    invoke-direct {p0, p1}, Ll/u4z0;-><init>(Ll/pwy0;)V

    return-void
.end method


# virtual methods
.method public final a(Ljava/lang/String;Lcom/google/android/gms/internal/measurement/y;)Lcom/google/android/gms/internal/measurement/y;
    .locals 14

    .line 1
    move-object/from16 v6, p2

    .line 2
    .line 3
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/y;->X()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v7

    .line 7
    invoke-virtual {v6}, Lcom/google/android/gms/internal/measurement/y;->Y()Ljava/util/List;

    .line 8
    .line 9
    .line 10
    move-result-object v8

    .line 11
    iget-object v0, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 12
    .line 13
    invoke-virtual {v0}, Ll/qjy0;->i()Ll/vmy0;

    .line 14
    .line 15
    .line 16
    const-string v0, "_eid"

    .line 17
    .line 18
    invoke-static {v6, v0}, Ll/vmy0;->Z(Lcom/google/android/gms/internal/measurement/y;Ljava/lang/String;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ljava/lang/Long;

    .line 23
    .line 24
    if-eqz v2, :cond_0

    .line 25
    .line 26
    const/4 v3, 0x1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const/4 v3, 0x0

    .line 29
    :goto_0
    const-wide/16 v4, 0x0

    .line 30
    .line 31
    if-eqz v3, :cond_a

    .line 32
    .line 33
    const-string v9, "_ep"

    .line 34
    .line 35
    invoke-virtual {v7, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v9

    .line 39
    if-eqz v9, :cond_a

    .line 40
    .line 41
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 42
    .line 43
    .line 44
    iget-object v3, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 45
    .line 46
    invoke-virtual {v3}, Ll/qjy0;->i()Ll/vmy0;

    .line 47
    .line 48
    .line 49
    const-string v3, "_en"

    .line 50
    .line 51
    invoke-static {v6, v3}, Ll/vmy0;->Z(Lcom/google/android/gms/internal/measurement/y;Ljava/lang/String;)Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v3

    .line 55
    move-object v7, v3

    .line 56
    check-cast v7, Ljava/lang/String;

    .line 57
    .line 58
    invoke-static {v7}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 59
    .line 60
    .line 61
    move-result v3

    .line 62
    const/4 v9, 0x0

    .line 63
    if-eqz v3, :cond_1

    .line 64
    .line 65
    iget-object p0, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 66
    .line 67
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 72
    .line 73
    .line 74
    move-result-object p0

    .line 75
    const-string v0, "Extra parameter without an event name. eventId"

    .line 76
    .line 77
    invoke-virtual {p0, v0, v2}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 78
    .line 79
    .line 80
    return-object v9

    .line 81
    :cond_1
    iget-object v3, p0, Ll/u4z0;->a:Lcom/google/android/gms/internal/measurement/y;

    .line 82
    .line 83
    if-eqz v3, :cond_2

    .line 84
    .line 85
    iget-object v3, p0, Ll/u4z0;->b:Ljava/lang/Long;

    .line 86
    .line 87
    if-eqz v3, :cond_2

    .line 88
    .line 89
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    .line 90
    .line 91
    .line 92
    move-result-wide v10

    .line 93
    iget-object v3, p0, Ll/u4z0;->b:Ljava/lang/Long;

    .line 94
    .line 95
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 96
    .line 97
    .line 98
    move-result-wide v12

    .line 99
    cmp-long v3, v10, v12

    .line 100
    .line 101
    if-eqz v3, :cond_4

    .line 102
    .line 103
    :cond_2
    iget-object v3, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 104
    .line 105
    invoke-virtual {v3}, Ll/qjy0;->k()Ll/opr0;

    .line 106
    .line 107
    .line 108
    move-result-object v3

    .line 109
    invoke-virtual {v3, p1, v2}, Ll/opr0;->B(Ljava/lang/String;Ljava/lang/Long;)Landroid/util/Pair;

    .line 110
    .line 111
    .line 112
    move-result-object v3

    .line 113
    if-eqz v3, :cond_9

    .line 114
    .line 115
    iget-object v10, v3, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 116
    .line 117
    if-nez v10, :cond_3

    .line 118
    .line 119
    goto/16 :goto_3

    .line 120
    .line 121
    :cond_3
    check-cast v10, Lcom/google/android/gms/internal/measurement/y;

    .line 122
    .line 123
    iput-object v10, p0, Ll/u4z0;->a:Lcom/google/android/gms/internal/measurement/y;

    .line 124
    .line 125
    iget-object v3, v3, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 126
    .line 127
    check-cast v3, Ljava/lang/Long;

    .line 128
    .line 129
    invoke-virtual {v3}, Ljava/lang/Long;->longValue()J

    .line 130
    .line 131
    .line 132
    move-result-wide v9

    .line 133
    iput-wide v9, p0, Ll/u4z0;->c:J

    .line 134
    .line 135
    iget-object v3, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 136
    .line 137
    invoke-virtual {v3}, Ll/qjy0;->i()Ll/vmy0;

    .line 138
    .line 139
    .line 140
    iget-object v3, p0, Ll/u4z0;->a:Lcom/google/android/gms/internal/measurement/y;

    .line 141
    .line 142
    invoke-static {v3, v0}, Ll/vmy0;->Z(Lcom/google/android/gms/internal/measurement/y;Ljava/lang/String;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Ljava/lang/Long;

    .line 147
    .line 148
    iput-object v0, p0, Ll/u4z0;->b:Ljava/lang/Long;

    .line 149
    .line 150
    :cond_4
    iget-wide v9, p0, Ll/u4z0;->c:J

    .line 151
    .line 152
    const-wide/16 v11, 0x1

    .line 153
    .line 154
    sub-long/2addr v9, v11

    .line 155
    iput-wide v9, p0, Ll/u4z0;->c:J

    .line 156
    .line 157
    cmp-long v0, v9, v4

    .line 158
    .line 159
    iget-object v3, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 160
    .line 161
    if-gtz v0, :cond_5

    .line 162
    .line 163
    invoke-virtual {v3}, Ll/qjy0;->k()Ll/opr0;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    invoke-virtual {v2}, Ll/yyx0;->h()V

    .line 168
    .line 169
    .line 170
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {v0}, Ll/d6x0;->E()Ll/l8x0;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    const-string v3, "Clearing complex main event info. appId"

    .line 179
    .line 180
    invoke-virtual {v0, v3, p1}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 181
    .line 182
    .line 183
    :try_start_0
    invoke-virtual {v2}, Ll/opr0;->v()Landroid/database/sqlite/SQLiteDatabase;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    const-string v3, "delete from main_event_params where app_id=?"

    .line 188
    .line 189
    filled-new-array {p1}, [Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    invoke-virtual {v0, v3, v1}, Landroid/database/sqlite/SQLiteDatabase;->execSQL(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_0
    .catch Landroid/database/sqlite/SQLiteException; {:try_start_0 .. :try_end_0} :catch_0

    .line 194
    .line 195
    .line 196
    goto :goto_1

    .line 197
    :catch_0
    move-exception v0

    .line 198
    invoke-virtual {v2}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    invoke-virtual {v1}, Ll/d6x0;->A()Ll/l8x0;

    .line 203
    .line 204
    .line 205
    move-result-object v1

    .line 206
    const-string v2, "Error clearing complex main event"

    .line 207
    .line 208
    invoke-virtual {v1, v2, v0}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 209
    .line 210
    .line 211
    goto :goto_1

    .line 212
    :cond_5
    invoke-virtual {v3}, Ll/qjy0;->k()Ll/opr0;

    .line 213
    .line 214
    .line 215
    move-result-object v0

    .line 216
    iget-wide v3, p0, Ll/u4z0;->c:J

    .line 217
    .line 218
    iget-object v5, p0, Ll/u4z0;->a:Lcom/google/android/gms/internal/measurement/y;

    .line 219
    .line 220
    move-object v1, p1

    .line 221
    invoke-virtual/range {v0 .. v5}, Ll/opr0;->f0(Ljava/lang/String;Ljava/lang/Long;JLcom/google/android/gms/internal/measurement/y;)Z

    .line 222
    .line 223
    .line 224
    :goto_1
    new-instance v0, Ljava/util/ArrayList;

    .line 225
    .line 226
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 227
    .line 228
    .line 229
    iget-object v1, p0, Ll/u4z0;->a:Lcom/google/android/gms/internal/measurement/y;

    .line 230
    .line 231
    invoke-virtual {v1}, Lcom/google/android/gms/internal/measurement/y;->Y()Ljava/util/List;

    .line 232
    .line 233
    .line 234
    move-result-object v1

    .line 235
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 236
    .line 237
    .line 238
    move-result-object v1

    .line 239
    :cond_6
    :goto_2
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    .line 240
    .line 241
    .line 242
    move-result v2

    .line 243
    if-eqz v2, :cond_7

    .line 244
    .line 245
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v2

    .line 249
    check-cast v2, Lcom/google/android/gms/internal/measurement/a0;

    .line 250
    .line 251
    iget-object v3, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 252
    .line 253
    invoke-virtual {v3}, Ll/qjy0;->i()Ll/vmy0;

    .line 254
    .line 255
    .line 256
    invoke-virtual {v2}, Lcom/google/android/gms/internal/measurement/a0;->Z()Ljava/lang/String;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    invoke-static {v6, v3}, Ll/vmy0;->z(Lcom/google/android/gms/internal/measurement/y;Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/a0;

    .line 261
    .line 262
    .line 263
    move-result-object v3

    .line 264
    if-nez v3, :cond_6

    .line 265
    .line 266
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 267
    .line 268
    .line 269
    goto :goto_2

    .line 270
    :cond_7
    invoke-interface {v0}, Ljava/util/List;->isEmpty()Z

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    if-nez v1, :cond_8

    .line 275
    .line 276
    invoke-interface {v0, v8}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 277
    .line 278
    .line 279
    move-object v8, v0

    .line 280
    goto :goto_4

    .line 281
    :cond_8
    iget-object p0, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 282
    .line 283
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 284
    .line 285
    .line 286
    move-result-object p0

    .line 287
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 288
    .line 289
    .line 290
    move-result-object p0

    .line 291
    const-string v0, "No unique parameters in main event. eventName"

    .line 292
    .line 293
    invoke-virtual {p0, v0, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 294
    .line 295
    .line 296
    goto :goto_4

    .line 297
    :cond_9
    :goto_3
    iget-object p0, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 298
    .line 299
    invoke-virtual {p0}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 300
    .line 301
    .line 302
    move-result-object p0

    .line 303
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 304
    .line 305
    .line 306
    move-result-object p0

    .line 307
    const-string v0, "Extra parameter without existing main event. eventName, eventId"

    .line 308
    .line 309
    invoke-virtual {p0, v0, v7, v2}, Ll/l8x0;->c(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 310
    .line 311
    .line 312
    return-object v9

    .line 313
    :cond_a
    if-eqz v3, :cond_c

    .line 314
    .line 315
    iput-object v2, p0, Ll/u4z0;->b:Ljava/lang/Long;

    .line 316
    .line 317
    iput-object v6, p0, Ll/u4z0;->a:Lcom/google/android/gms/internal/measurement/y;

    .line 318
    .line 319
    iget-object v0, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 320
    .line 321
    invoke-virtual {v0}, Ll/qjy0;->i()Ll/vmy0;

    .line 322
    .line 323
    .line 324
    const-string v0, "_epc"

    .line 325
    .line 326
    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 327
    .line 328
    .line 329
    move-result-object v1

    .line 330
    invoke-static {v6, v0, v1}, Ll/vmy0;->C(Lcom/google/android/gms/internal/measurement/y;Ljava/lang/String;Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    check-cast v0, Ljava/lang/Long;

    .line 335
    .line 336
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 337
    .line 338
    .line 339
    move-result-wide v0

    .line 340
    iput-wide v0, p0, Ll/u4z0;->c:J

    .line 341
    .line 342
    cmp-long v0, v0, v4

    .line 343
    .line 344
    iget-object v1, p0, Ll/u4z0;->d:Ll/pwy0;

    .line 345
    .line 346
    if-gtz v0, :cond_b

    .line 347
    .line 348
    invoke-virtual {v1}, Ll/yyx0;->zzj()Ll/d6x0;

    .line 349
    .line 350
    .line 351
    move-result-object p0

    .line 352
    invoke-virtual {p0}, Ll/d6x0;->C()Ll/l8x0;

    .line 353
    .line 354
    .line 355
    move-result-object p0

    .line 356
    const-string v0, "Complex event with zero extra param count. eventName"

    .line 357
    .line 358
    invoke-virtual {p0, v0, v7}, Ll/l8x0;->b(Ljava/lang/String;Ljava/lang/Object;)V

    .line 359
    .line 360
    .line 361
    goto :goto_4

    .line 362
    :cond_b
    invoke-virtual {v1}, Ll/qjy0;->k()Ll/opr0;

    .line 363
    .line 364
    .line 365
    move-result-object v0

    .line 366
    invoke-static {v2}, Lcom/google/android/gms/common/internal/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 367
    .line 368
    .line 369
    move-result-object v1

    .line 370
    move-object v2, v1

    .line 371
    check-cast v2, Ljava/lang/Long;

    .line 372
    .line 373
    iget-wide v3, p0, Ll/u4z0;->c:J

    .line 374
    .line 375
    move-object v1, p1

    .line 376
    move-object v5, v6

    .line 377
    invoke-virtual/range {v0 .. v5}, Ll/opr0;->f0(Ljava/lang/String;Ljava/lang/Long;JLcom/google/android/gms/internal/measurement/y;)Z

    .line 378
    .line 379
    .line 380
    :cond_c
    :goto_4
    invoke-virtual/range {p2 .. p2}, Lcom/google/android/gms/internal/measurement/u0;->t()Lcom/google/android/gms/internal/measurement/u0$b;

    .line 381
    .line 382
    .line 383
    move-result-object p0

    .line 384
    check-cast p0, Lcom/google/android/gms/internal/measurement/y$a;

    .line 385
    .line 386
    invoke-virtual {p0, v7}, Lcom/google/android/gms/internal/measurement/y$a;->D(Ljava/lang/String;)Lcom/google/android/gms/internal/measurement/y$a;

    .line 387
    .line 388
    .line 389
    move-result-object p0

    .line 390
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/y$a;->M()Lcom/google/android/gms/internal/measurement/y$a;

    .line 391
    .line 392
    .line 393
    move-result-object p0

    .line 394
    invoke-virtual {p0, v8}, Lcom/google/android/gms/internal/measurement/y$a;->C(Ljava/lang/Iterable;)Lcom/google/android/gms/internal/measurement/y$a;

    .line 395
    .line 396
    .line 397
    move-result-object p0

    .line 398
    invoke-virtual {p0}, Lcom/google/android/gms/internal/measurement/u0$b;->H()Ll/m9y0;

    .line 399
    .line 400
    .line 401
    move-result-object p0

    .line 402
    check-cast p0, Lcom/google/android/gms/internal/measurement/u0;

    .line 403
    .line 404
    check-cast p0, Lcom/google/android/gms/internal/measurement/y;

    .line 405
    .line 406
    return-object p0
.end method
