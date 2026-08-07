.class Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/io/FileFilter;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;->run()V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation


# instance fields
.field final synthetic this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;

.field final synthetic val$visitedFiles:Ljava/util/HashMap;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;->this$1:Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2;

    .line 2
    .line 3
    iput-object p2, p0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;->val$visitedFiles:Ljava/util/HashMap;

    .line 4
    .line 5
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public accept(Ljava/io/File;)Z
    .locals 17

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    const-string v2, "Matrix.WarmUpDelegate"

    .line 6
    .line 7
    const/4 v3, 0x0

    .line 8
    :try_start_0
    invoke-virtual {v1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v4

    .line 12
    invoke-virtual {v1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v5

    .line 16
    const-string v6, "_malformed_"

    .line 17
    .line 18
    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 19
    .line 20
    .line 21
    move-result v6

    .line 22
    const-wide/32 v7, 0xf731400

    .line 23
    .line 24
    .line 25
    if-nez v6, :cond_8

    .line 26
    .line 27
    const-string v6, "_temp_"

    .line 28
    .line 29
    invoke-virtual {v4, v6}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 30
    .line 31
    .line 32
    move-result v6

    .line 33
    if-eqz v6, :cond_0

    .line 34
    .line 35
    goto/16 :goto_0

    .line 36
    .line 37
    :cond_0
    invoke-static {v5}, Landroid/system/Os;->lstat(Ljava/lang/String;)Landroid/system/StructStat;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    iget-wide v9, v6, Landroid/system/StructStat;->st_atime:J

    .line 42
    .line 43
    iget-wide v11, v6, Landroid/system/StructStat;->st_mtime:J

    .line 44
    .line 45
    invoke-static {v9, v10, v11, v12}, Ljava/lang/Math;->max(JJ)J

    .line 46
    .line 47
    .line 48
    move-result-wide v9

    .line 49
    const-wide/16 v11, 0x3e8

    .line 50
    .line 51
    mul-long/2addr v9, v11

    .line 52
    const-string v6, "File(%s) last access time %s"

    .line 53
    .line 54
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 55
    .line 56
    .line 57
    move-result-object v11

    .line 58
    filled-new-array {v5, v11}, [Ljava/lang/Object;

    .line 59
    .line 60
    .line 61
    move-result-object v11

    .line 62
    invoke-static {v2, v6, v11}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 63
    .line 64
    .line 65
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 66
    .line 67
    .line 68
    move-result-wide v11

    .line 69
    sub-long/2addr v11, v9

    .line 70
    const-wide v13, 0x134fd9000L

    .line 71
    .line 72
    .line 73
    .line 74
    .line 75
    cmp-long v6, v11, v13

    .line 76
    .line 77
    if-lez v6, :cond_1

    .line 78
    .line 79
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 80
    .line 81
    .line 82
    const-string v0, "Delete long time no access file(%s)"

    .line 83
    .line 84
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 89
    .line 90
    .line 91
    goto/16 :goto_2

    .line 92
    .line 93
    :catchall_0
    move-exception v0

    .line 94
    goto/16 :goto_1

    .line 95
    .line 96
    :cond_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 97
    .line 98
    .line 99
    move-result-wide v11

    .line 100
    cmp-long v6, v9, v11

    .line 101
    .line 102
    if-ltz v6, :cond_2

    .line 103
    .line 104
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 105
    .line 106
    .line 107
    move-result-wide v6

    .line 108
    sub-long/2addr v9, v6

    .line 109
    const-wide v6, 0x9a7ec800L

    .line 110
    .line 111
    .line 112
    .line 113
    .line 114
    cmp-long v0, v9, v6

    .line 115
    .line 116
    if-ltz v0, :cond_9

    .line 117
    .line 118
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 119
    .line 120
    .line 121
    const-string v0, "Delete future file(%s)"

    .line 122
    .line 123
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v1

    .line 127
    invoke-static {v2, v0, v1}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 128
    .line 129
    .line 130
    goto/16 :goto_2

    .line 131
    .line 132
    :cond_2
    const/16 v5, 0x2e

    .line 133
    .line 134
    invoke-virtual {v4, v5}, Ljava/lang/String;->lastIndexOf(I)I

    .line 135
    .line 136
    .line 137
    move-result v5

    .line 138
    const/4 v6, -0x1

    .line 139
    if-ne v5, v6, :cond_3

    .line 140
    .line 141
    return v3

    .line 142
    :cond_3
    invoke-virtual {v4, v3, v5}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v5

    .line 146
    const-string v6, ".hash"

    .line 147
    .line 148
    invoke-virtual {v4, v6}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    if-eqz v6, :cond_4

    .line 153
    .line 154
    return v3

    .line 155
    :cond_4
    iget-object v6, v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;->val$visitedFiles:Ljava/util/HashMap;

    .line 156
    .line 157
    invoke-virtual {v6, v5}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    .line 158
    .line 159
    .line 160
    move-result-object v6

    .line 161
    check-cast v6, Landroid/util/Pair;

    .line 162
    .line 163
    if-eqz v6, :cond_7

    .line 164
    .line 165
    iget-object v11, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 166
    .line 167
    check-cast v11, Ljava/lang/Long;

    .line 168
    .line 169
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    .line 170
    .line 171
    .line 172
    move-result-wide v11
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 173
    cmp-long v11, v9, v11

    .line 174
    .line 175
    const-string v12, "Delete file(%s) cause %s is newer(%s vs %s)."

    .line 176
    .line 177
    if-lez v11, :cond_6

    .line 178
    .line 179
    :try_start_1
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 180
    .line 181
    .line 182
    move-result-wide v13

    .line 183
    iget-object v11, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 184
    .line 185
    check-cast v11, Ljava/lang/Long;

    .line 186
    .line 187
    invoke-virtual {v11}, Ljava/lang/Long;->longValue()J

    .line 188
    .line 189
    .line 190
    move-result-wide v15

    .line 191
    sub-long/2addr v13, v15

    .line 192
    cmp-long v7, v13, v7

    .line 193
    .line 194
    if-ltz v7, :cond_5

    .line 195
    .line 196
    iget-object v7, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 197
    .line 198
    check-cast v7, Ljava/io/File;

    .line 199
    .line 200
    invoke-virtual {v7}, Ljava/io/File;->delete()Z

    .line 201
    .line 202
    .line 203
    iget-object v7, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 204
    .line 205
    check-cast v7, Ljava/io/File;

    .line 206
    .line 207
    invoke-virtual {v7}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v7

    .line 211
    iget-object v6, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 212
    .line 213
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 214
    .line 215
    .line 216
    move-result-object v8

    .line 217
    filled-new-array {v7, v4, v6, v8}, [Ljava/lang/Object;

    .line 218
    .line 219
    .line 220
    move-result-object v4

    .line 221
    invoke-static {v2, v12, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 222
    .line 223
    .line 224
    :cond_5
    iget-object v0, v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;->val$visitedFiles:Ljava/util/HashMap;

    .line 225
    .line 226
    new-instance v4, Landroid/util/Pair;

    .line 227
    .line 228
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 229
    .line 230
    .line 231
    move-result-object v6

    .line 232
    invoke-direct {v4, v1, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 233
    .line 234
    .line 235
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    goto :goto_2

    .line 239
    :cond_6
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 240
    .line 241
    .line 242
    move-result-wide v13

    .line 243
    sub-long/2addr v13, v9

    .line 244
    cmp-long v0, v13, v7

    .line 245
    .line 246
    if-ltz v0, :cond_9

    .line 247
    .line 248
    invoke-virtual {v1}, Ljava/io/File;->delete()Z

    .line 249
    .line 250
    .line 251
    iget-object v0, v6, Landroid/util/Pair;->first:Ljava/lang/Object;

    .line 252
    .line 253
    check-cast v0, Ljava/io/File;

    .line 254
    .line 255
    invoke-virtual {v0}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 260
    .line 261
    .line 262
    move-result-object v1

    .line 263
    iget-object v5, v6, Landroid/util/Pair;->second:Ljava/lang/Object;

    .line 264
    .line 265
    filled-new-array {v4, v0, v1, v5}, [Ljava/lang/Object;

    .line 266
    .line 267
    .line 268
    move-result-object v0

    .line 269
    invoke-static {v2, v12, v0}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 270
    .line 271
    .line 272
    goto :goto_2

    .line 273
    :cond_7
    iget-object v0, v0, Lcom/p1/mobile/backtrace/backtrace/WarmUpDelegate$2$1;->val$visitedFiles:Ljava/util/HashMap;

    .line 274
    .line 275
    new-instance v4, Landroid/util/Pair;

    .line 276
    .line 277
    invoke-static {v9, v10}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 278
    .line 279
    .line 280
    move-result-object v6

    .line 281
    invoke-direct {v4, v1, v6}, Landroid/util/Pair;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 282
    .line 283
    .line 284
    invoke-virtual {v0, v5, v4}, Ljava/util/HashMap;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 285
    .line 286
    .line 287
    goto :goto_2

    .line 288
    :cond_8
    :goto_0
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 289
    .line 290
    .line 291
    move-result-wide v9

    .line 292
    invoke-virtual {v1}, Ljava/io/File;->lastModified()J

    .line 293
    .line 294
    .line 295
    move-result-wide v11

    .line 296
    sub-long/2addr v9, v11

    .line 297
    cmp-long v0, v9, v7

    .line 298
    .line 299
    if-ltz v0, :cond_9

    .line 300
    .line 301
    const-string v0, "Delete malformed and temp file %s"

    .line 302
    .line 303
    filled-new-array {v5}, [Ljava/lang/Object;

    .line 304
    .line 305
    .line 306
    move-result-object v4

    .line 307
    invoke-static {v2, v0, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->i(Ljava/lang/String;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 308
    .line 309
    .line 310
    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 311
    .line 312
    .line 313
    goto :goto_2

    .line 314
    :goto_1
    const-string v1, ""

    .line 315
    .line 316
    new-array v4, v3, [Ljava/lang/Object;

    .line 317
    .line 318
    invoke-static {v2, v0, v1, v4}, Lcom/p1/mobile/backtrace/MatrixLog;->printErrStackTrace(Ljava/lang/String;Ljava/lang/Throwable;Ljava/lang/String;[Ljava/lang/Object;)V

    .line 319
    .line 320
    .line 321
    :cond_9
    :goto_2
    return v3
.end method
