.class public Ll/m2f;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation build Landroidx/annotation/RestrictTo;
    value = {
        .enum Landroidx/annotation/RestrictTo$Scope;->LIBRARY_GROUP:Landroidx/annotation/RestrictTo$Scope;
    }
.end annotation


# static fields
.field public static final a:Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const-string v0, "EnqueueRunnable"

    .line 2
    .line 3
    invoke-static {v0}, Ll/qzv;->i(Ljava/lang/String;)Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    sput-object v0, Ll/m2f;->a:Ljava/lang/String;

    .line 8
    .line 9
    return-void
.end method

.method public static a(Ll/aiq0;)Z
    .locals 2
    .param p0    # Ll/aiq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/aiq0;->h()Ll/xiq0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/xiq0;->u()Landroidx/work/impl/WorkDatabase;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->beginTransaction()V

    .line 10
    .line 11
    .line 12
    :try_start_0
    invoke-virtual {v0}, Ll/xiq0;->n()Landroidx/work/a;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-static {v1, v0, p0}, Ll/n2f;->a(Landroidx/work/impl/WorkDatabase;Landroidx/work/a;Ll/aiq0;)V

    .line 17
    .line 18
    .line 19
    invoke-static {p0}, Ll/m2f;->e(Ll/aiq0;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->setTransactionSuccessful()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 27
    .line 28
    .line 29
    return p0

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    invoke-virtual {v1}, Landroidx/room/RoomDatabase;->endTransaction()V

    .line 32
    .line 33
    .line 34
    throw p0
.end method

.method public static b(Ll/aiq0;)V
    .locals 2
    .param p0    # Ll/aiq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/aiq0;->i()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    invoke-static {p0}, Ll/m2f;->a(Ll/aiq0;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p0}, Ll/m2f;->f(Ll/aiq0;)V

    .line 14
    .line 15
    .line 16
    :cond_0
    return-void

    .line 17
    :cond_1
    const-string v0, "WorkContinuation has cycles ("

    .line 18
    .line 19
    const-string v1, ")"

    .line 20
    .line 21
    invoke-static {v0, p0, v1}, Ll/wmw;->a(Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static c(Ll/aiq0;)Z
    .locals 5
    .param p0    # Ll/aiq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-static {p0}, Ll/aiq0;->m(Ll/aiq0;)Ljava/util/Set;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/aiq0;->h()Ll/xiq0;

    .line 6
    .line 7
    .line 8
    move-result-object v1

    .line 9
    invoke-virtual {p0}, Ll/aiq0;->g()Ljava/util/List;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    const/4 v3, 0x0

    .line 14
    new-array v3, v3, [Ljava/lang/String;

    .line 15
    .line 16
    invoke-interface {v0, v3}, Ljava/util/Set;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, [Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/aiq0;->e()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v3

    .line 26
    invoke-virtual {p0}, Ll/aiq0;->c()Landroidx/work/ExistingWorkPolicy;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    invoke-static {v1, v2, v0, v3, v4}, Ll/m2f;->d(Ll/xiq0;Ljava/util/List;[Ljava/lang/String;Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;)Z

    .line 31
    .line 32
    .line 33
    move-result v0

    .line 34
    invoke-virtual {p0}, Ll/aiq0;->l()V

    .line 35
    .line 36
    .line 37
    return v0
.end method

.method public static d(Ll/xiq0;Ljava/util/List;[Ljava/lang/String;Ljava/lang/String;Landroidx/work/ExistingWorkPolicy;)Z
    .locals 18
    .param p1    # Ljava/util/List;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/xiq0;",
            "Ljava/util/List<",
            "+",
            "Landroidx/work/h;",
            ">;[",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            "Landroidx/work/ExistingWorkPolicy;",
            ")Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    move-object/from16 v1, p3

    .line 4
    .line 5
    move-object/from16 v2, p4

    .line 6
    .line 7
    invoke-virtual/range {p0 .. p0}, Ll/xiq0;->n()Landroidx/work/a;

    .line 8
    .line 9
    .line 10
    move-result-object v3

    .line 11
    invoke-virtual {v3}, Landroidx/work/a;->a()Ll/sa5;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    invoke-interface {v3}, Ll/sa5;->currentTimeMillis()J

    .line 16
    .line 17
    .line 18
    move-result-wide v3

    .line 19
    invoke-virtual/range {p0 .. p0}, Ll/xiq0;->u()Landroidx/work/impl/WorkDatabase;

    .line 20
    .line 21
    .line 22
    move-result-object v5

    .line 23
    const/4 v7, 0x0

    .line 24
    if-eqz v0, :cond_0

    .line 25
    .line 26
    array-length v8, v0

    .line 27
    if-lez v8, :cond_0

    .line 28
    .line 29
    const/4 v8, 0x1

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    move v8, v7

    .line 32
    :goto_0
    if-eqz v8, :cond_5

    .line 33
    .line 34
    array-length v9, v0

    .line 35
    move v10, v7

    .line 36
    move v12, v10

    .line 37
    move v13, v12

    .line 38
    const/4 v11, 0x1

    .line 39
    :goto_1
    if-ge v10, v9, :cond_6

    .line 40
    .line 41
    aget-object v14, v0, v10

    .line 42
    .line 43
    invoke-virtual {v5}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Ll/njq0;

    .line 44
    .line 45
    .line 46
    move-result-object v15

    .line 47
    invoke-interface {v15, v14}, Ll/njq0;->v(Ljava/lang/String;)Ll/mjq0;

    .line 48
    .line 49
    .line 50
    move-result-object v15

    .line 51
    if-nez v15, :cond_1

    .line 52
    .line 53
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    sget-object v1, Ll/m2f;->a:Ljava/lang/String;

    .line 58
    .line 59
    new-instance v2, Ljava/lang/StringBuilder;

    .line 60
    .line 61
    const-string v3, "Prerequisite "

    .line 62
    .line 63
    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 64
    .line 65
    .line 66
    invoke-virtual {v2, v14}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    const-string v3, " doesn\'t exist; not enqueuing"

    .line 70
    .line 71
    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 72
    .line 73
    .line 74
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v2

    .line 78
    invoke-virtual {v0, v1, v2}, Ll/qzv;->c(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    return v7

    .line 82
    :cond_1
    iget-object v14, v15, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 83
    .line 84
    sget-object v15, Landroidx/work/WorkInfo$State;->SUCCEEDED:Landroidx/work/WorkInfo$State;

    .line 85
    .line 86
    if-ne v14, v15, :cond_2

    .line 87
    .line 88
    const/4 v15, 0x1

    .line 89
    goto :goto_2

    .line 90
    :cond_2
    move v15, v7

    .line 91
    :goto_2
    and-int/2addr v11, v15

    .line 92
    sget-object v15, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    .line 93
    .line 94
    if-ne v14, v15, :cond_3

    .line 95
    .line 96
    const/4 v13, 0x1

    .line 97
    goto :goto_3

    .line 98
    :cond_3
    sget-object v15, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    .line 99
    .line 100
    if-ne v14, v15, :cond_4

    .line 101
    .line 102
    const/4 v12, 0x1

    .line 103
    :cond_4
    :goto_3
    add-int/lit8 v10, v10, 0x1

    .line 104
    .line 105
    goto :goto_1

    .line 106
    :cond_5
    move v12, v7

    .line 107
    move v13, v12

    .line 108
    const/4 v11, 0x1

    .line 109
    :cond_6
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 110
    .line 111
    .line 112
    move-result v9

    .line 113
    if-nez v9, :cond_16

    .line 114
    .line 115
    if-nez v8, :cond_16

    .line 116
    .line 117
    invoke-virtual {v5}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Ll/njq0;

    .line 118
    .line 119
    .line 120
    move-result-object v10

    .line 121
    invoke-interface {v10, v1}, Ll/njq0;->z(Ljava/lang/String;)Ljava/util/List;

    .line 122
    .line 123
    .line 124
    move-result-object v10

    .line 125
    invoke-interface {v10}, Ljava/util/List;->isEmpty()Z

    .line 126
    .line 127
    .line 128
    move-result v14

    .line 129
    if-nez v14, :cond_16

    .line 130
    .line 131
    sget-object v14, Landroidx/work/ExistingWorkPolicy;->APPEND:Landroidx/work/ExistingWorkPolicy;

    .line 132
    .line 133
    if-eq v2, v14, :cond_7

    .line 134
    .line 135
    sget-object v14, Landroidx/work/ExistingWorkPolicy;->APPEND_OR_REPLACE:Landroidx/work/ExistingWorkPolicy;

    .line 136
    .line 137
    if-ne v2, v14, :cond_8

    .line 138
    .line 139
    :cond_7
    move-object/from16 v14, p0

    .line 140
    .line 141
    goto :goto_5

    .line 142
    :cond_8
    sget-object v14, Landroidx/work/ExistingWorkPolicy;->KEEP:Landroidx/work/ExistingWorkPolicy;

    .line 143
    .line 144
    if-ne v2, v14, :cond_b

    .line 145
    .line 146
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    :cond_9
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 151
    .line 152
    .line 153
    move-result v14

    .line 154
    if-eqz v14, :cond_b

    .line 155
    .line 156
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v14

    .line 160
    check-cast v14, Ll/mjq0$b;

    .line 161
    .line 162
    iget-object v14, v14, Ll/mjq0$b;->b:Landroidx/work/WorkInfo$State;

    .line 163
    .line 164
    sget-object v15, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    .line 165
    .line 166
    if-eq v14, v15, :cond_a

    .line 167
    .line 168
    sget-object v15, Landroidx/work/WorkInfo$State;->RUNNING:Landroidx/work/WorkInfo$State;

    .line 169
    .line 170
    if-ne v14, v15, :cond_9

    .line 171
    .line 172
    :cond_a
    return v7

    .line 173
    :cond_b
    move-object/from16 v14, p0

    .line 174
    .line 175
    invoke-static {v1, v14}, Landroidx/work/impl/utils/CancelWorkRunnable;->g(Ljava/lang/String;Ll/xiq0;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v5}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Ll/njq0;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 183
    .line 184
    .line 185
    move-result-object v10

    .line 186
    :goto_4
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 187
    .line 188
    .line 189
    move-result v15

    .line 190
    if-eqz v15, :cond_c

    .line 191
    .line 192
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 193
    .line 194
    .line 195
    move-result-object v15

    .line 196
    check-cast v15, Ll/mjq0$b;

    .line 197
    .line 198
    iget-object v15, v15, Ll/mjq0$b;->a:Ljava/lang/String;

    .line 199
    .line 200
    invoke-interface {v2, v15}, Ll/njq0;->delete(Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    goto :goto_4

    .line 204
    :cond_c
    move-object/from16 v17, v5

    .line 205
    .line 206
    const/4 v6, 0x1

    .line 207
    goto/16 :goto_c

    .line 208
    .line 209
    :goto_5
    invoke-virtual {v5}, Landroidx/work/impl/WorkDatabase;->dependencyDao()Ll/mvd;

    .line 210
    .line 211
    .line 212
    move-result-object v8

    .line 213
    new-instance v15, Ljava/util/ArrayList;

    .line 214
    .line 215
    invoke-direct {v15}, Ljava/util/ArrayList;-><init>()V

    .line 216
    .line 217
    .line 218
    invoke-interface {v10}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 219
    .line 220
    .line 221
    move-result-object v10

    .line 222
    :goto_6
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 223
    .line 224
    .line 225
    move-result v16

    .line 226
    if-eqz v16, :cond_11

    .line 227
    .line 228
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 229
    .line 230
    .line 231
    move-result-object v16

    .line 232
    move-object/from16 v6, v16

    .line 233
    .line 234
    check-cast v6, Ll/mjq0$b;

    .line 235
    .line 236
    iget-object v7, v6, Ll/mjq0$b;->a:Ljava/lang/String;

    .line 237
    .line 238
    invoke-interface {v8, v7}, Ll/mvd;->d(Ljava/lang/String;)Z

    .line 239
    .line 240
    .line 241
    move-result v7

    .line 242
    if-nez v7, :cond_10

    .line 243
    .line 244
    iget-object v7, v6, Ll/mjq0$b;->b:Landroidx/work/WorkInfo$State;

    .line 245
    .line 246
    move-object/from16 v17, v5

    .line 247
    .line 248
    sget-object v5, Landroidx/work/WorkInfo$State;->SUCCEEDED:Landroidx/work/WorkInfo$State;

    .line 249
    .line 250
    if-ne v7, v5, :cond_d

    .line 251
    .line 252
    const/4 v5, 0x1

    .line 253
    goto :goto_7

    .line 254
    :cond_d
    const/4 v5, 0x0

    .line 255
    :goto_7
    and-int/2addr v5, v11

    .line 256
    sget-object v11, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    .line 257
    .line 258
    if-ne v7, v11, :cond_e

    .line 259
    .line 260
    const/4 v13, 0x1

    .line 261
    goto :goto_8

    .line 262
    :cond_e
    sget-object v11, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    .line 263
    .line 264
    if-ne v7, v11, :cond_f

    .line 265
    .line 266
    const/4 v12, 0x1

    .line 267
    :cond_f
    :goto_8
    iget-object v6, v6, Ll/mjq0$b;->a:Ljava/lang/String;

    .line 268
    .line 269
    invoke-interface {v15, v6}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 270
    .line 271
    .line 272
    move v11, v5

    .line 273
    goto :goto_9

    .line 274
    :cond_10
    move-object/from16 v17, v5

    .line 275
    .line 276
    :goto_9
    move-object/from16 v5, v17

    .line 277
    .line 278
    const/4 v7, 0x0

    .line 279
    goto :goto_6

    .line 280
    :cond_11
    move-object/from16 v17, v5

    .line 281
    .line 282
    sget-object v5, Landroidx/work/ExistingWorkPolicy;->APPEND_OR_REPLACE:Landroidx/work/ExistingWorkPolicy;

    .line 283
    .line 284
    if-ne v2, v5, :cond_14

    .line 285
    .line 286
    if-nez v12, :cond_12

    .line 287
    .line 288
    if-eqz v13, :cond_14

    .line 289
    .line 290
    :cond_12
    invoke-virtual/range {v17 .. v17}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Ll/njq0;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    invoke-interface {v2, v1}, Ll/njq0;->z(Ljava/lang/String;)Ljava/util/List;

    .line 295
    .line 296
    .line 297
    move-result-object v5

    .line 298
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 299
    .line 300
    .line 301
    move-result-object v5

    .line 302
    :goto_a
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    .line 303
    .line 304
    .line 305
    move-result v6

    .line 306
    if-eqz v6, :cond_13

    .line 307
    .line 308
    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v6

    .line 312
    check-cast v6, Ll/mjq0$b;

    .line 313
    .line 314
    iget-object v6, v6, Ll/mjq0$b;->a:Ljava/lang/String;

    .line 315
    .line 316
    invoke-interface {v2, v6}, Ll/njq0;->delete(Ljava/lang/String;)V

    .line 317
    .line 318
    .line 319
    goto :goto_a

    .line 320
    :cond_13
    sget-object v15, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    .line 321
    .line 322
    const/4 v12, 0x0

    .line 323
    const/4 v13, 0x0

    .line 324
    :cond_14
    invoke-interface {v15, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    check-cast v0, [Ljava/lang/String;

    .line 329
    .line 330
    array-length v2, v0

    .line 331
    if-lez v2, :cond_15

    .line 332
    .line 333
    const/4 v8, 0x1

    .line 334
    goto :goto_b

    .line 335
    :cond_15
    const/4 v8, 0x0

    .line 336
    :goto_b
    const/4 v6, 0x0

    .line 337
    goto :goto_c

    .line 338
    :cond_16
    move-object/from16 v14, p0

    .line 339
    .line 340
    move-object/from16 v17, v5

    .line 341
    .line 342
    goto :goto_b

    .line 343
    :goto_c
    invoke-interface/range {p1 .. p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 344
    .line 345
    .line 346
    move-result-object v2

    .line 347
    :goto_d
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    if-eqz v5, :cond_1d

    .line 352
    .line 353
    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 354
    .line 355
    .line 356
    move-result-object v5

    .line 357
    check-cast v5, Landroidx/work/h;

    .line 358
    .line 359
    invoke-virtual {v5}, Landroidx/work/h;->d()Ll/mjq0;

    .line 360
    .line 361
    .line 362
    move-result-object v7

    .line 363
    if-eqz v8, :cond_19

    .line 364
    .line 365
    if-nez v11, :cond_19

    .line 366
    .line 367
    if-eqz v13, :cond_17

    .line 368
    .line 369
    sget-object v10, Landroidx/work/WorkInfo$State;->FAILED:Landroidx/work/WorkInfo$State;

    .line 370
    .line 371
    iput-object v10, v7, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 372
    .line 373
    goto :goto_e

    .line 374
    :cond_17
    if-eqz v12, :cond_18

    .line 375
    .line 376
    sget-object v10, Landroidx/work/WorkInfo$State;->CANCELLED:Landroidx/work/WorkInfo$State;

    .line 377
    .line 378
    iput-object v10, v7, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 379
    .line 380
    goto :goto_e

    .line 381
    :cond_18
    sget-object v10, Landroidx/work/WorkInfo$State;->BLOCKED:Landroidx/work/WorkInfo$State;

    .line 382
    .line 383
    iput-object v10, v7, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 384
    .line 385
    goto :goto_e

    .line 386
    :cond_19
    iput-wide v3, v7, Ll/mjq0;->n:J

    .line 387
    .line 388
    :goto_e
    iget-object v10, v7, Ll/mjq0;->b:Landroidx/work/WorkInfo$State;

    .line 389
    .line 390
    sget-object v15, Landroidx/work/WorkInfo$State;->ENQUEUED:Landroidx/work/WorkInfo$State;

    .line 391
    .line 392
    if-ne v10, v15, :cond_1a

    .line 393
    .line 394
    const/4 v6, 0x1

    .line 395
    :cond_1a
    invoke-virtual/range {v17 .. v17}, Landroidx/work/impl/WorkDatabase;->workSpecDao()Ll/njq0;

    .line 396
    .line 397
    .line 398
    move-result-object v10

    .line 399
    invoke-virtual {v14}, Ll/xiq0;->s()Ljava/util/List;

    .line 400
    .line 401
    .line 402
    move-result-object v15

    .line 403
    invoke-static {v15, v7}, Ll/n2f;->d(Ljava/util/List;Ll/mjq0;)Ll/mjq0;

    .line 404
    .line 405
    .line 406
    move-result-object v7

    .line 407
    invoke-interface {v10, v7}, Ll/njq0;->o(Ll/mjq0;)V

    .line 408
    .line 409
    .line 410
    if-eqz v8, :cond_1b

    .line 411
    .line 412
    array-length v7, v0

    .line 413
    const/4 v10, 0x0

    .line 414
    :goto_f
    if-ge v10, v7, :cond_1b

    .line 415
    .line 416
    aget-object v15, v0, v10

    .line 417
    .line 418
    move-object/from16 p2, v0

    .line 419
    .line 420
    new-instance v0, Ll/lvd;

    .line 421
    .line 422
    move-object/from16 p1, v2

    .line 423
    .line 424
    invoke-virtual {v5}, Landroidx/work/h;->b()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    invoke-direct {v0, v2, v15}, Ll/lvd;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 429
    .line 430
    .line 431
    invoke-virtual/range {v17 .. v17}, Landroidx/work/impl/WorkDatabase;->dependencyDao()Ll/mvd;

    .line 432
    .line 433
    .line 434
    move-result-object v2

    .line 435
    invoke-interface {v2, v0}, Ll/mvd;->c(Ll/lvd;)V

    .line 436
    .line 437
    .line 438
    add-int/lit8 v10, v10, 0x1

    .line 439
    .line 440
    move-object/from16 v2, p1

    .line 441
    .line 442
    move-object/from16 v0, p2

    .line 443
    .line 444
    goto :goto_f

    .line 445
    :cond_1b
    move-object/from16 p2, v0

    .line 446
    .line 447
    move-object/from16 p1, v2

    .line 448
    .line 449
    invoke-virtual/range {v17 .. v17}, Landroidx/work/impl/WorkDatabase;->workTagDao()Ll/vjq0;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    invoke-virtual {v5}, Landroidx/work/h;->b()Ljava/lang/String;

    .line 454
    .line 455
    .line 456
    move-result-object v2

    .line 457
    invoke-virtual {v5}, Landroidx/work/h;->c()Ljava/util/Set;

    .line 458
    .line 459
    .line 460
    move-result-object v7

    .line 461
    invoke-interface {v0, v2, v7}, Ll/vjq0;->b(Ljava/lang/String;Ljava/util/Set;)V

    .line 462
    .line 463
    .line 464
    if-nez v9, :cond_1c

    .line 465
    .line 466
    invoke-virtual/range {v17 .. v17}, Landroidx/work/impl/WorkDatabase;->workNameDao()Ll/bjq0;

    .line 467
    .line 468
    .line 469
    move-result-object v0

    .line 470
    new-instance v2, Ll/ajq0;

    .line 471
    .line 472
    invoke-virtual {v5}, Landroidx/work/h;->b()Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v5

    .line 476
    invoke-direct {v2, v1, v5}, Ll/ajq0;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    .line 478
    .line 479
    invoke-interface {v0, v2}, Ll/bjq0;->b(Ll/ajq0;)V

    .line 480
    .line 481
    .line 482
    :cond_1c
    move-object/from16 v2, p1

    .line 483
    .line 484
    move-object/from16 v0, p2

    .line 485
    .line 486
    goto/16 :goto_d

    .line 487
    .line 488
    :cond_1d
    return v6
.end method

.method public static e(Ll/aiq0;)Z
    .locals 7
    .param p0    # Ll/aiq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p0}, Ll/aiq0;->f()Ljava/util/List;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_1

    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    if-eqz v2, :cond_1

    .line 17
    .line 18
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    check-cast v2, Ll/aiq0;

    .line 23
    .line 24
    invoke-virtual {v2}, Ll/aiq0;->k()Z

    .line 25
    .line 26
    .line 27
    move-result v3

    .line 28
    if-nez v3, :cond_0

    .line 29
    .line 30
    invoke-static {v2}, Ll/m2f;->e(Ll/aiq0;)Z

    .line 31
    .line 32
    .line 33
    move-result v2

    .line 34
    or-int/2addr v1, v2

    .line 35
    goto :goto_0

    .line 36
    :cond_0
    invoke-static {}, Ll/qzv;->e()Ll/qzv;

    .line 37
    .line 38
    .line 39
    move-result-object v3

    .line 40
    sget-object v4, Ll/m2f;->a:Ljava/lang/String;

    .line 41
    .line 42
    new-instance v5, Ljava/lang/StringBuilder;

    .line 43
    .line 44
    const-string v6, "Already enqueued work ids ("

    .line 45
    .line 46
    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    const-string v6, ", "

    .line 50
    .line 51
    invoke-virtual {v2}, Ll/aiq0;->d()Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    invoke-static {v6, v2}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object v2

    .line 59
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 60
    .line 61
    .line 62
    const-string v2, ")"

    .line 63
    .line 64
    invoke-virtual {v5, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 65
    .line 66
    .line 67
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    invoke-virtual {v3, v4, v2}, Ll/qzv;->k(Ljava/lang/String;Ljava/lang/String;)V

    .line 72
    .line 73
    .line 74
    goto :goto_0

    .line 75
    :cond_1
    invoke-static {p0}, Ll/m2f;->c(Ll/aiq0;)Z

    .line 76
    .line 77
    .line 78
    move-result p0

    .line 79
    or-int/2addr p0, v1

    .line 80
    return p0
.end method

.method public static f(Ll/aiq0;)V
    .locals 2
    .param p0    # Ll/aiq0;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/VisibleForTesting;
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/aiq0;->h()Ll/xiq0;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/xiq0;->n()Landroidx/work/a;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0}, Ll/xiq0;->u()Landroidx/work/impl/WorkDatabase;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    invoke-virtual {p0}, Ll/xiq0;->s()Ljava/util/List;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    invoke-static {v0, v1, p0}, Ll/n2e0;->f(Landroidx/work/a;Landroidx/work/impl/WorkDatabase;Ljava/util/List;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method
