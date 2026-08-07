.class public Lcom/mm/mmfile/MMFileUtil;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final FILE_SUFFIX:Ljava/lang/String; = ".xlog"


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

.method public static getFileCounts(Lcom/mm/mmfile/core/FileWriteConfig;)I
    .locals 2

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const/4 p0, -0x1

    .line 4
    return p0

    .line 5
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/mm/mmfile/core/FileWriteConfig;->getLogDir()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    const/4 v1, 0x0

    .line 19
    if-eqz p0, :cond_3

    .line 20
    .line 21
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    if-eqz p0, :cond_3

    .line 33
    .line 34
    array-length v0, p0

    .line 35
    if-nez v0, :cond_2

    .line 36
    .line 37
    goto :goto_0

    .line 38
    :cond_2
    array-length p0, p0

    .line 39
    return p0

    .line 40
    :cond_3
    :goto_0
    return v1
.end method

.method public static getFiles(Lcom/mm/mmfile/core/FileWriteConfig;)[Ljava/io/File;
    .locals 2
    .annotation build Lcom/mm/mmfile/Nullable;
    .end annotation

    .line 349
    sget-object v0, Lcom/mm/mmfile/SortType;->POSITIVE:Lcom/mm/mmfile/SortType;

    const/4 v1, -0x1

    invoke-static {p0, v0, v1, v1}, Lcom/mm/mmfile/MMFileUtil;->getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;II)[Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;II)[Ljava/io/File;
    .locals 6
    .annotation build Lcom/mm/mmfile/Nullable;
    .end annotation

    const/4 v4, 0x0

    const/4 v5, 0x0

    move-object v0, p0

    move-object v1, p1

    move v2, p2

    move v3, p3

    .line 348
    invoke-static/range {v0 .. v5}, Lcom/mm/mmfile/MMFileUtil;->getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;IIZZ)[Ljava/io/File;

    move-result-object p0

    return-object p0
.end method

.method public static getFiles(Lcom/mm/mmfile/core/FileWriteConfig;Lcom/mm/mmfile/SortType;IIZZ)[Ljava/io/File;
    .locals 16
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "LogUse"
        }
    .end annotation

    .annotation build Lcom/mm/mmfile/Nullable;
    .end annotation

    .line 1
    move-object/from16 v1, p1

    .line 2
    .line 3
    move/from16 v2, p3

    .line 4
    .line 5
    const/4 v3, 0x0

    .line 6
    if-nez p0, :cond_0

    .line 7
    .line 8
    return-object v3

    .line 9
    :cond_0
    new-instance v0, Ljava/io/File;

    .line 10
    .line 11
    invoke-virtual/range {p0 .. p0}, Lcom/mm/mmfile/core/FileWriteConfig;->getLogDir()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v4

    .line 15
    invoke-direct {v0, v4}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 19
    .line 20
    .line 21
    move-result v4

    .line 22
    if-eqz v4, :cond_11

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/io/File;->isDirectory()Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-nez v4, :cond_1

    .line 29
    .line 30
    goto/16 :goto_8

    .line 31
    .line 32
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    if-eqz v0, :cond_11

    .line 37
    .line 38
    array-length v4, v0

    .line 39
    if-nez v4, :cond_2

    .line 40
    .line 41
    goto/16 :goto_8

    .line 42
    .line 43
    :cond_2
    new-instance v4, Ljava/lang/StringBuilder;

    .line 44
    .line 45
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual/range {p0 .. p0}, Lcom/mm/mmfile/core/FileWriteConfig;->getFilePrefix()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v5

    .line 52
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 53
    .line 54
    .line 55
    const-string v5, "_"

    .line 56
    .line 57
    invoke-virtual {v4, v5}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 58
    .line 59
    .line 60
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object v4

    .line 64
    new-instance v5, Ljava/util/ArrayList;

    .line 65
    .line 66
    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    .line 67
    .line 68
    .line 69
    array-length v6, v0

    .line 70
    const/4 v7, 0x0

    .line 71
    move v8, v7

    .line 72
    :goto_0
    if-ge v8, v6, :cond_4

    .line 73
    .line 74
    aget-object v9, v0, v8

    .line 75
    .line 76
    invoke-virtual {v9}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object v10

    .line 80
    invoke-virtual {v10, v4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 81
    .line 82
    .line 83
    move-result v11

    .line 84
    if-eqz v11, :cond_3

    .line 85
    .line 86
    const-string v11, ".xlog"

    .line 87
    .line 88
    invoke-virtual {v10, v11}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 89
    .line 90
    .line 91
    move-result v10

    .line 92
    if-eqz v10, :cond_3

    .line 93
    .line 94
    invoke-interface {v5, v9}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 95
    .line 96
    .line 97
    :cond_3
    add-int/lit8 v8, v8, 0x1

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    if-eqz v0, :cond_5

    .line 105
    .line 106
    return-object v3

    .line 107
    :cond_5
    invoke-virtual {v4}, Ljava/lang/String;->length()I

    .line 108
    .line 109
    .line 110
    move-result v4

    .line 111
    add-int/lit8 v6, v4, 0x8

    .line 112
    .line 113
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 118
    .line 119
    .line 120
    move-result v8

    .line 121
    if-eqz v8, :cond_6

    .line 122
    .line 123
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v8

    .line 127
    check-cast v8, Ljava/io/File;

    .line 128
    .line 129
    :try_start_0
    invoke-virtual {v8}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v8

    .line 133
    invoke-virtual {v8, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v8

    .line 137
    invoke-static {v8}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 138
    .line 139
    .line 140
    goto :goto_1

    .line 141
    :catchall_0
    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 142
    .line 143
    .line 144
    goto :goto_1

    .line 145
    :cond_6
    const-string v8, "MMFile"

    .line 146
    .line 147
    if-ltz p2, :cond_9

    .line 148
    .line 149
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 150
    .line 151
    .line 152
    move-result-wide v9

    .line 153
    const v0, 0x5265c00

    .line 154
    .line 155
    .line 156
    mul-int v0, v0, p2

    .line 157
    .line 158
    int-to-long v11, v0

    .line 159
    sub-long/2addr v9, v11

    .line 160
    new-instance v0, Ljava/text/SimpleDateFormat;

    .line 161
    .line 162
    const-string v11, "yyyyMMdd"

    .line 163
    .line 164
    invoke-direct {v0, v11}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 165
    .line 166
    .line 167
    new-instance v11, Ljava/util/Date;

    .line 168
    .line 169
    invoke-direct {v11, v9, v10}, Ljava/util/Date;-><init>(J)V

    .line 170
    .line 171
    .line 172
    invoke-virtual {v0, v11}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 173
    .line 174
    .line 175
    move-result-object v9

    .line 176
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 177
    .line 178
    .line 179
    move-result-object v10

    .line 180
    :goto_2
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    .line 181
    .line 182
    .line 183
    move-result v0

    .line 184
    if-eqz v0, :cond_9

    .line 185
    .line 186
    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    move-object v11, v0

    .line 191
    check-cast v11, Ljava/io/File;

    .line 192
    .line 193
    invoke-virtual {v11}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    :try_start_1
    invoke-virtual {v0, v4, v6}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v0

    .line 201
    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 202
    .line 203
    .line 204
    move-result-wide v12

    .line 205
    invoke-static {v9}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 206
    .line 207
    .line 208
    move-result-wide v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 209
    cmp-long v0, v12, v14

    .line 210
    .line 211
    if-ltz v0, :cond_7

    .line 212
    .line 213
    goto :goto_2

    .line 214
    :catchall_1
    move-exception v0

    .line 215
    invoke-static {v8, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 216
    .line 217
    .line 218
    :cond_7
    if-eqz p4, :cond_8

    .line 219
    .line 220
    :try_start_2
    invoke-virtual {v11}, Ljava/io/File;->delete()Z
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0

    .line 221
    .line 222
    .line 223
    goto :goto_3

    .line 224
    :catch_0
    move-exception v0

    .line 225
    invoke-static {v8, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 226
    .line 227
    .line 228
    :cond_8
    :goto_3
    invoke-interface {v10}, Ljava/util/Iterator;->remove()V

    .line 229
    .line 230
    .line 231
    goto :goto_2

    .line 232
    :cond_9
    add-int/lit8 v0, v4, 0x9

    .line 233
    .line 234
    sget-object v9, Lcom/mm/mmfile/SortType;->POSITIVE:Lcom/mm/mmfile/SortType;

    .line 235
    .line 236
    if-eq v1, v9, :cond_a

    .line 237
    .line 238
    sget-object v9, Lcom/mm/mmfile/SortType;->FLASHBACK:Lcom/mm/mmfile/SortType;

    .line 239
    .line 240
    if-ne v1, v9, :cond_b

    .line 241
    .line 242
    :cond_a
    new-instance v9, Lcom/mm/mmfile/MMFileUtil$1;

    .line 243
    .line 244
    invoke-direct {v9, v4, v6, v1, v0}, Lcom/mm/mmfile/MMFileUtil$1;-><init>(IILcom/mm/mmfile/SortType;I)V

    .line 245
    .line 246
    .line 247
    invoke-static {v5, v9}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    .line 248
    .line 249
    .line 250
    :cond_b
    if-lez v2, :cond_f

    .line 251
    .line 252
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 253
    .line 254
    .line 255
    move-result v0

    .line 256
    if-le v0, v2, :cond_f

    .line 257
    .line 258
    sget-object v0, Lcom/mm/mmfile/SortType;->FLASHBACK:Lcom/mm/mmfile/SortType;

    .line 259
    .line 260
    if-ne v1, v0, :cond_d

    .line 261
    .line 262
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    add-int/lit8 v0, v0, -0x1

    .line 267
    .line 268
    move v1, v0

    .line 269
    :goto_4
    if-lt v1, v2, :cond_f

    .line 270
    .line 271
    if-eqz p5, :cond_c

    .line 272
    .line 273
    :try_start_3
    invoke-interface {v5, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    check-cast v0, Ljava/io/File;

    .line 278
    .line 279
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1

    .line 280
    .line 281
    .line 282
    goto :goto_5

    .line 283
    :catch_1
    move-exception v0

    .line 284
    invoke-static {v8, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 285
    .line 286
    .line 287
    :cond_c
    :goto_5
    invoke-interface {v5, v1}, Ljava/util/List;->remove(I)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    add-int/lit8 v1, v1, -0x1

    .line 291
    .line 292
    goto :goto_4

    .line 293
    :cond_d
    invoke-interface {v5}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    sub-int v2, v0, v2

    .line 302
    .line 303
    :goto_6
    if-ge v7, v2, :cond_f

    .line 304
    .line 305
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v0

    .line 309
    check-cast v0, Ljava/io/File;

    .line 310
    .line 311
    if-eqz p5, :cond_e

    .line 312
    .line 313
    :try_start_4
    invoke-virtual {v0}, Ljava/io/File;->delete()Z
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_2

    .line 314
    .line 315
    .line 316
    goto :goto_7

    .line 317
    :catch_2
    move-exception v0

    .line 318
    invoke-static {v8, v0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 319
    .line 320
    .line 321
    :cond_e
    :goto_7
    invoke-interface {v1}, Ljava/util/Iterator;->remove()V

    .line 322
    .line 323
    .line 324
    add-int/lit8 v7, v7, 0x1

    .line 325
    .line 326
    goto :goto_6

    .line 327
    :cond_f
    invoke-interface {v5}, Ljava/util/List;->isEmpty()Z

    .line 328
    .line 329
    .line 330
    move-result v0

    .line 331
    if-eqz v0, :cond_10

    .line 332
    .line 333
    goto :goto_8

    .line 334
    :cond_10
    invoke-interface {v5}, Ljava/util/List;->size()I

    .line 335
    .line 336
    .line 337
    move-result v0

    .line 338
    new-array v0, v0, [Ljava/io/File;

    .line 339
    .line 340
    invoke-interface {v5, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v0

    .line 344
    move-object v3, v0

    .line 345
    check-cast v3, [Ljava/io/File;

    .line 346
    .line 347
    :cond_11
    :goto_8
    return-object v3
.end method

.method public static getProcessNameInternal(Landroid/content/Context;)Ljava/lang/String;
    .locals 8

    .line 1
    invoke-static {}, Landroid/os/Process;->myPid()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    if-eqz p0, :cond_9

    .line 8
    .line 9
    if-gtz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_6

    .line 12
    .line 13
    :cond_0
    const-string v2, "activity"

    .line 14
    .line 15
    invoke-virtual {p0, v2}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    check-cast p0, Landroid/app/ActivityManager;

    .line 20
    .line 21
    const/4 v2, 0x0

    .line 22
    if-eqz p0, :cond_3

    .line 23
    .line 24
    invoke-virtual {p0}, Landroid/app/ActivityManager;->getRunningAppProcesses()Ljava/util/List;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    if-eqz p0, :cond_3

    .line 29
    .line 30
    :try_start_0
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 31
    .line 32
    .line 33
    move-result-object p0

    .line 34
    :cond_1
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 35
    .line 36
    .line 37
    move-result v3

    .line 38
    if-eqz v3, :cond_2

    .line 39
    .line 40
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v3

    .line 44
    check-cast v3, Landroid/app/ActivityManager$RunningAppProcessInfo;

    .line 45
    .line 46
    iget v4, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->pid:I
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 47
    .line 48
    if-ne v4, v0, :cond_1

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :catch_0
    :cond_2
    move-object v3, v2

    .line 52
    :goto_0
    if-eqz v3, :cond_3

    .line 53
    .line 54
    iget-object p0, v3, Landroid/app/ActivityManager$RunningAppProcessInfo;->processName:Ljava/lang/String;

    .line 55
    .line 56
    return-object p0

    .line 57
    :cond_3
    const/16 p0, 0x80

    .line 58
    .line 59
    new-array v3, p0, [B

    .line 60
    .line 61
    :try_start_1
    new-instance v4, Ljava/io/FileInputStream;

    .line 62
    .line 63
    new-instance v5, Ljava/lang/StringBuilder;

    .line 64
    .line 65
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 66
    .line 67
    .line 68
    const-string v6, "/proc/"

    .line 69
    .line 70
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 71
    .line 72
    .line 73
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 74
    .line 75
    .line 76
    const-string v0, "/cmdline"

    .line 77
    .line 78
    invoke-virtual {v5, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 79
    .line 80
    .line 81
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-direct {v4, v0}, Ljava/io/FileInputStream;-><init>(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_4
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 86
    .line 87
    .line 88
    :try_start_2
    invoke-virtual {v4, v3}, Ljava/io/FileInputStream;->read([B)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    if-lez v0, :cond_7

    .line 93
    .line 94
    const/4 v2, 0x0

    .line 95
    move v5, v2

    .line 96
    :goto_1
    if-ge v5, v0, :cond_6

    .line 97
    .line 98
    aget-byte v6, v3, v5

    .line 99
    .line 100
    and-int/lit16 v7, v6, 0xff

    .line 101
    .line 102
    if-gt v7, p0, :cond_5

    .line 103
    .line 104
    if-gtz v6, :cond_4

    .line 105
    .line 106
    goto :goto_2

    .line 107
    :cond_4
    add-int/lit8 v5, v5, 0x1

    .line 108
    .line 109
    goto :goto_1

    .line 110
    :cond_5
    :goto_2
    move v0, v5

    .line 111
    goto :goto_3

    .line 112
    :catchall_0
    move-exception p0

    .line 113
    move-object v2, v4

    .line 114
    goto :goto_4

    .line 115
    :catch_1
    move-object v2, v4

    .line 116
    goto :goto_5

    .line 117
    :cond_6
    :goto_3
    new-instance p0, Ljava/lang/String;

    .line 118
    .line 119
    invoke-direct {p0, v3, v2, v0}, Ljava/lang/String;-><init>([BII)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 120
    .line 121
    .line 122
    :try_start_3
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2

    .line 123
    .line 124
    .line 125
    :catch_2
    return-object p0

    .line 126
    :cond_7
    :try_start_4
    invoke-virtual {v4}, Ljava/io/FileInputStream;->close()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_5

    .line 127
    .line 128
    .line 129
    goto :goto_6

    .line 130
    :catchall_1
    move-exception p0

    .line 131
    :goto_4
    if-eqz v2, :cond_8

    .line 132
    .line 133
    :try_start_5
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_5
    .catch Ljava/lang/Exception; {:try_start_5 .. :try_end_5} :catch_3

    .line 134
    .line 135
    .line 136
    :catch_3
    :cond_8
    throw p0

    .line 137
    :catch_4
    :goto_5
    if-eqz v2, :cond_9

    .line 138
    .line 139
    :try_start_6
    invoke-virtual {v2}, Ljava/io/FileInputStream;->close()V
    :try_end_6
    .catch Ljava/lang/Exception; {:try_start_6 .. :try_end_6} :catch_5

    .line 140
    .line 141
    .line 142
    :catch_5
    :cond_9
    :goto_6
    return-object v1
.end method

.method public static getUploadConfigByFile(Ljava/lang/String;)Lcom/mm/mmfile/FileUploadConfig;
    .locals 4

    .line 1
    :try_start_0
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    sget-object v0, Lcom/mm/mmfile/MMFileRegister;->strategies:Ljava/util/HashSet;

    .line 11
    .line 12
    invoke-virtual {v0}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    :cond_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 17
    .line 18
    .line 19
    move-result v1

    .line 20
    if-eqz v1, :cond_1

    .line 21
    .line 22
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    check-cast v1, Lcom/mm/mmfile/Strategy;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/mm/mmfile/Strategy;->getFileWriteConfig()Lcom/mm/mmfile/core/FileWriteConfig;

    .line 29
    .line 30
    .line 31
    move-result-object v2

    .line 32
    invoke-virtual {v2}, Lcom/mm/mmfile/core/FileWriteConfig;->getFilePrefix()Ljava/lang/String;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    new-instance v3, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v3}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 42
    .line 43
    .line 44
    const-string v2, "_"

    .line 45
    .line 46
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object v2

    .line 53
    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    if-eqz v2, :cond_0

    .line 58
    .line 59
    invoke-virtual {v1}, Lcom/mm/mmfile/Strategy;->getFileUploadConfig()Lcom/mm/mmfile/FileUploadConfig;

    .line 60
    .line 61
    .line 62
    move-result-object p0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 63
    return-object p0

    .line 64
    :catch_0
    move-exception p0

    .line 65
    const-string v0, "MMFile"

    .line 66
    .line 67
    invoke-static {v0, p0}, Lcom/mm/mmfile/Logger;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 68
    .line 69
    .line 70
    :cond_1
    const/4 p0, 0x0

    .line 71
    return-object p0
.end method
