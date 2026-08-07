.class public Lcom/tencent/could/component/common/ai/log/c;
.super Landroid/os/Handler;
.source "SourceFile"


# instance fields
.field public a:Ljava/text/SimpleDateFormat;

.field public b:Ljava/util/Date;

.field public c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

.field public d:Lcom/tencent/could/component/common/ai/log/f;

.field public e:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroid/content/Context;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Landroid/os/Looper;Lcom/tencent/could/component/common/ai/log/AiLogConfig;Landroid/content/Context;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Lcom/tencent/could/component/common/ai/log/c;->c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 5
    .line 6
    new-instance p1, Ljava/lang/ref/WeakReference;

    .line 7
    .line 8
    invoke-direct {p1, p3}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Lcom/tencent/could/component/common/ai/log/c;->e:Ljava/lang/ref/WeakReference;

    .line 12
    .line 13
    return-void
.end method


# virtual methods
.method public final a(Lcom/tencent/could/component/common/ai/log/d;)Ljava/lang/String;
    .locals 4

    .line 373
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/c;->c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    invoke-virtual {v0}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isRecordLogContentOnly()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 374
    iget-object p0, p1, Lcom/tencent/could/component/common/ai/log/d;->d:Ljava/lang/String;

    return-object p0

    .line 375
    :cond_0
    iget-wide v0, p1, Lcom/tencent/could/component/common/ai/log/d;->b:J

    .line 376
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/log/c;->a:Ljava/text/SimpleDateFormat;

    if-nez v2, :cond_1

    .line 377
    new-instance v2, Ljava/text/SimpleDateFormat;

    const-string v3, "yyyy-MM-dd HH:mm:ss.SSS"

    invoke-direct {v2, v3}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    iput-object v2, p0, Lcom/tencent/could/component/common/ai/log/c;->a:Ljava/text/SimpleDateFormat;

    .line 378
    :cond_1
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/log/c;->b:Ljava/util/Date;

    if-nez v2, :cond_2

    .line 379
    new-instance v2, Ljava/util/Date;

    invoke-direct {v2}, Ljava/util/Date;-><init>()V

    iput-object v2, p0, Lcom/tencent/could/component/common/ai/log/c;->b:Ljava/util/Date;

    .line 380
    :cond_2
    iget-object v2, p0, Lcom/tencent/could/component/common/ai/log/c;->b:Ljava/util/Date;

    invoke-virtual {v2, v0, v1}, Ljava/util/Date;->setTime(J)V

    .line 381
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/c;->a:Ljava/text/SimpleDateFormat;

    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/c;->b:Ljava/util/Date;

    invoke-virtual {v0, p0}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    .line 382
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 383
    const-string p0, " "

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 384
    iget-object v1, p1, Lcom/tencent/could/component/common/ai/log/d;->e:Ljava/lang/String;

    .line 385
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 386
    const-string v1, "/"

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 387
    iget-object v2, p1, Lcom/tencent/could/component/common/ai/log/d;->f:Ljava/lang/String;

    .line 388
    invoke-virtual {v0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 389
    iget v2, p1, Lcom/tencent/could/component/common/ai/log/d;->a:I

    .line 390
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, p0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    packed-switch v2, :pswitch_data_0

    const-string p0, "null"

    .line 391
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_0
    const-string p0, "ASSERT"

    .line 392
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_1
    const-string p0, "ERROR"

    .line 393
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_2
    const-string p0, "WARN"

    .line 394
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_3
    const-string p0, "INFO"

    .line 395
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_4
    const-string p0, "DEBUG"

    .line 396
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    goto :goto_0

    :pswitch_5
    const-string p0, "VERBOSE"

    .line 397
    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 398
    :goto_0
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    .line 399
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 400
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 401
    iget-object p0, p1, Lcom/tencent/could/component/common/ai/log/d;->c:Ljava/lang/String;

    .line 402
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, ": "

    .line 403
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 404
    iget-object p0, p1, Lcom/tencent/could/component/common/ai/log/d;->d:Ljava/lang/String;

    .line 405
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 406
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_data_0
    .packed-switch 0x2
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final a(Ljava/lang/String;)V
    .locals 11

    .line 1
    const-string v0, "create log dir error! dir: "

    .line 2
    .line 3
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/log/c;->e:Ljava/lang/ref/WeakReference;

    .line 4
    .line 5
    if-nez v1, :cond_0

    .line 6
    .line 7
    const/4 v1, 0x0

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 10
    .line 11
    .line 12
    move-result-object v1

    .line 13
    check-cast v1, Landroid/content/Context;

    .line 14
    .line 15
    :goto_0
    const-string v2, "FileWriteHandler"

    .line 16
    .line 17
    if-nez v1, :cond_1

    .line 18
    .line 19
    const-string p0, "current context is null!"

    .line 20
    .line 21
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_1
    iget-object v3, p0, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 26
    .line 27
    if-nez v3, :cond_2

    .line 28
    .line 29
    new-instance v3, Lcom/tencent/could/component/common/ai/log/f;

    .line 30
    .line 31
    invoke-direct {v3, v1}, Lcom/tencent/could/component/common/ai/log/f;-><init>(Landroid/content/Context;)V

    .line 32
    .line 33
    .line 34
    iput-object v3, p0, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 37
    .line 38
    const-string v3, "writer is null!"

    .line 39
    .line 40
    if-nez v1, :cond_3

    .line 41
    .line 42
    invoke-static {v2, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :cond_3
    iget-object v4, v1, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 47
    .line 48
    const-string v5, "LogWriter"

    .line 49
    .line 50
    if-eqz v4, :cond_4

    .line 51
    .line 52
    iget-object v1, v1, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 53
    .line 54
    if-eqz v1, :cond_4

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    if-eqz v1, :cond_4

    .line 61
    .line 62
    goto/16 :goto_4

    .line 63
    .line 64
    :cond_4
    iget-object v1, p0, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 65
    .line 66
    iget-object v4, p0, Lcom/tencent/could/component/common/ai/log/c;->c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 67
    .line 68
    invoke-virtual {v4}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isUseExternalFile()Z

    .line 69
    .line 70
    .line 71
    move-result v4

    .line 72
    iget-object v6, p0, Lcom/tencent/could/component/common/ai/log/c;->c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 73
    .line 74
    invoke-virtual {v6}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getDirLog()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v6

    .line 78
    iget-object v7, p0, Lcom/tencent/could/component/common/ai/log/c;->c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 79
    .line 80
    invoke-virtual {v7}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->getLogName()Ljava/lang/String;

    .line 81
    .line 82
    .line 83
    move-result-object v7

    .line 84
    iget-object v8, p0, Lcom/tencent/could/component/common/ai/log/c;->c:Lcom/tencent/could/component/common/ai/log/AiLogConfig;

    .line 85
    .line 86
    invoke-virtual {v8}, Lcom/tencent/could/component/common/ai/log/AiLogConfig;->isUseOriginFileName()Z

    .line 87
    .line 88
    .line 89
    move-result v8

    .line 90
    iget-object v9, v1, Lcom/tencent/could/component/common/ai/log/f;->c:Ljava/lang/ref/WeakReference;

    .line 91
    .line 92
    if-nez v9, :cond_5

    .line 93
    .line 94
    const-string p0, "contextReference is null"

    .line 95
    .line 96
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 97
    .line 98
    .line 99
    goto/16 :goto_5

    .line 100
    .line 101
    :cond_5
    if-eqz v4, :cond_6

    .line 102
    .line 103
    invoke-virtual {v9}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    check-cast v4, Landroid/content/Context;

    .line 108
    .line 109
    invoke-static {v4}, Lcom/tencent/could/component/common/ai/utils/a;->a(Landroid/content/Context;)Z

    .line 110
    .line 111
    .line 112
    move-result v4

    .line 113
    if-nez v4, :cond_6

    .line 114
    .line 115
    const-string p0, "no write file permission! "

    .line 116
    .line 117
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 118
    .line 119
    .line 120
    goto/16 :goto_5

    .line 121
    .line 122
    :cond_6
    if-nez v8, :cond_7

    .line 123
    .line 124
    new-instance v4, Ljava/lang/StringBuilder;

    .line 125
    .line 126
    invoke-direct {v4}, Ljava/lang/StringBuilder;-><init>()V

    .line 127
    .line 128
    .line 129
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 130
    .line 131
    .line 132
    const-string v7, "-"

    .line 133
    .line 134
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 135
    .line 136
    .line 137
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 138
    .line 139
    .line 140
    move-result-wide v7

    .line 141
    new-instance v9, Ljava/text/SimpleDateFormat;

    .line 142
    .line 143
    const-string v10, "yyyy-MM-dd"

    .line 144
    .line 145
    invoke-direct {v9, v10}, Ljava/text/SimpleDateFormat;-><init>(Ljava/lang/String;)V

    .line 146
    .line 147
    .line 148
    new-instance v10, Ljava/util/Date;

    .line 149
    .line 150
    invoke-direct {v10, v7, v8}, Ljava/util/Date;-><init>(J)V

    .line 151
    .line 152
    .line 153
    invoke-virtual {v9, v10}, Ljava/text/DateFormat;->format(Ljava/util/Date;)Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v7

    .line 157
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 158
    .line 159
    .line 160
    const-string v7, ".ailog"

    .line 161
    .line 162
    invoke-virtual {v4, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 163
    .line 164
    .line 165
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v7

    .line 169
    :cond_7
    new-instance v4, Ljava/io/File;

    .line 170
    .line 171
    invoke-direct {v4, v6, v7}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 172
    .line 173
    .line 174
    iput-object v4, v1, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 175
    .line 176
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 177
    .line 178
    .line 179
    move-result v4

    .line 180
    if-nez v4, :cond_9

    .line 181
    .line 182
    :try_start_0
    new-instance v4, Ljava/io/File;

    .line 183
    .line 184
    invoke-direct {v4, v6}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 185
    .line 186
    .line 187
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 188
    .line 189
    .line 190
    move-result v7

    .line 191
    if-nez v7, :cond_8

    .line 192
    .line 193
    invoke-virtual {v4}, Ljava/io/File;->mkdirs()Z

    .line 194
    .line 195
    .line 196
    move-result v4

    .line 197
    if-nez v4, :cond_8

    .line 198
    .line 199
    new-instance v4, Ljava/lang/StringBuilder;

    .line 200
    .line 201
    invoke-direct {v4, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 202
    .line 203
    .line 204
    invoke-virtual {v4, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 205
    .line 206
    .line 207
    invoke-virtual {v4}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v0

    .line 211
    invoke-static {v5, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 212
    .line 213
    .line 214
    goto :goto_1

    .line 215
    :catch_0
    move-exception p0

    .line 216
    goto :goto_2

    .line 217
    :cond_8
    :goto_1
    iget-object v0, v1, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 218
    .line 219
    invoke-virtual {v0}, Ljava/io/File;->createNewFile()Z
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 220
    .line 221
    .line 222
    goto :goto_3

    .line 223
    :goto_2
    new-instance v0, Ljava/lang/StringBuilder;

    .line 224
    .line 225
    const-string v3, "create log file error! e: "

    .line 226
    .line 227
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 228
    .line 229
    .line 230
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 231
    .line 232
    .line 233
    move-result-object p0

    .line 234
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 235
    .line 236
    .line 237
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 238
    .line 239
    .line 240
    move-result-object p0

    .line 241
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 242
    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/log/f;->a()V

    .line 245
    .line 246
    .line 247
    goto :goto_5

    .line 248
    :cond_9
    :goto_3
    :try_start_1
    new-instance v0, Ljava/io/BufferedWriter;

    .line 249
    .line 250
    new-instance v4, Ljava/io/FileWriter;

    .line 251
    .line 252
    iget-object v6, v1, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 253
    .line 254
    const/4 v7, 0x1

    .line 255
    invoke-direct {v4, v6, v7}, Ljava/io/FileWriter;-><init>(Ljava/io/File;Z)V

    .line 256
    .line 257
    .line 258
    invoke-direct {v0, v4}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V

    .line 259
    .line 260
    .line 261
    iput-object v0, v1, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2

    .line 262
    .line 263
    :goto_4
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 264
    .line 265
    if-eqz v0, :cond_b

    .line 266
    .line 267
    iget-object v1, v0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 268
    .line 269
    if-eqz v1, :cond_b

    .line 270
    .line 271
    iget-object v0, v0, Lcom/tencent/could/component/common/ai/log/f;->a:Ljava/io/File;

    .line 272
    .line 273
    if-eqz v0, :cond_b

    .line 274
    .line 275
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    if-eqz v0, :cond_b

    .line 280
    .line 281
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/c;->d:Lcom/tencent/could/component/common/ai/log/f;

    .line 282
    .line 283
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 284
    .line 285
    if-nez v0, :cond_a

    .line 286
    .line 287
    invoke-static {v5, v3}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 288
    .line 289
    .line 290
    return-void

    .line 291
    :cond_a
    :try_start_2
    iget-object v0, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 292
    .line 293
    invoke-virtual {v0, p1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 294
    .line 295
    .line 296
    iget-object p1, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 297
    .line 298
    invoke-virtual {p1}, Ljava/io/BufferedWriter;->newLine()V

    .line 299
    .line 300
    .line 301
    iget-object p0, p0, Lcom/tencent/could/component/common/ai/log/f;->b:Ljava/io/BufferedWriter;

    .line 302
    .line 303
    invoke-virtual {p0}, Ljava/io/BufferedWriter;->flush()V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1

    .line 304
    .line 305
    .line 306
    return-void

    .line 307
    :catch_1
    move-exception p0

    .line 308
    new-instance p1, Ljava/lang/StringBuilder;

    .line 309
    .line 310
    const-string v0, "writer not work e: "

    .line 311
    .line 312
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 316
    .line 317
    .line 318
    move-result-object p0

    .line 319
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 320
    .line 321
    .line 322
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object p0

    .line 326
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 327
    .line 328
    .line 329
    :cond_b
    return-void

    .line 330
    :catch_2
    move-exception p0

    .line 331
    new-instance v0, Ljava/lang/StringBuilder;

    .line 332
    .line 333
    const-string v3, "create writer error! e: "

    .line 334
    .line 335
    invoke-direct {v0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 336
    .line 337
    .line 338
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object p0

    .line 342
    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 343
    .line 344
    .line 345
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 346
    .line 347
    .line 348
    move-result-object p0

    .line 349
    invoke-static {v5, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 350
    .line 351
    .line 352
    invoke-virtual {v1}, Lcom/tencent/could/component/common/ai/log/f;->a()V

    .line 353
    .line 354
    .line 355
    :goto_5
    new-instance p0, Ljava/lang/StringBuilder;

    .line 356
    .line 357
    const-string v0, "writer open is fail! can not write : "

    .line 358
    .line 359
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 360
    .line 361
    .line 362
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 363
    .line 364
    .line 365
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 366
    .line 367
    .line 368
    move-result-object p0

    .line 369
    invoke-static {v2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 370
    .line 371
    .line 372
    return-void
.end method

.method public handleMessage(Landroid/os/Message;)V
    .locals 4

    .line 1
    const-string v0, "deal with logInfo string error! e: "

    .line 2
    .line 3
    const-string v1, "FileWriteHandler"

    .line 4
    .line 5
    if-nez p1, :cond_0

    .line 6
    .line 7
    const-string p0, "msg is null!"

    .line 8
    .line 9
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget v2, p1, Landroid/os/Message;->what:I

    .line 14
    .line 15
    const/4 v3, 0x1

    .line 16
    if-ne v2, v3, :cond_2

    .line 17
    .line 18
    iget-object p1, p1, Landroid/os/Message;->obj:Ljava/lang/Object;

    .line 19
    .line 20
    instance-of v2, p1, Lcom/tencent/could/component/common/ai/log/d;

    .line 21
    .line 22
    if-eqz v2, :cond_2

    .line 23
    .line 24
    const/4 v2, 0x0

    .line 25
    :try_start_0
    check-cast p1, Lcom/tencent/could/component/common/ai/log/d;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 26
    .line 27
    :try_start_1
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/log/c;->a(Lcom/tencent/could/component/common/ai/log/d;)Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {p0, v2}, Lcom/tencent/could/component/common/ai/log/c;->a(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    move-object v2, p1

    .line 37
    goto :goto_2

    .line 38
    :catch_0
    move-exception p0

    .line 39
    move-object v2, p1

    .line 40
    goto :goto_0

    .line 41
    :catchall_1
    move-exception p0

    .line 42
    goto :goto_2

    .line 43
    :catch_1
    move-exception p0

    .line 44
    :goto_0
    :try_start_2
    new-instance p1, Ljava/lang/StringBuilder;

    .line 45
    .line 46
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 57
    .line 58
    .line 59
    move-result-object p0

    .line 60
    invoke-static {v1, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;)I
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 61
    .line 62
    .line 63
    if-eqz v2, :cond_2

    .line 64
    .line 65
    move-object p1, v2

    .line 66
    :goto_1
    sget-object p0, Lcom/tencent/could/component/common/ai/log/e$a;->a:Lcom/tencent/could/component/common/ai/log/e;

    .line 67
    .line 68
    invoke-virtual {p0, p1}, Lcom/tencent/could/component/common/ai/log/e;->a(Lcom/tencent/could/component/common/ai/log/d;)V

    .line 69
    .line 70
    .line 71
    goto :goto_3

    .line 72
    :goto_2
    if-eqz v2, :cond_1

    .line 73
    .line 74
    sget-object p1, Lcom/tencent/could/component/common/ai/log/e$a;->a:Lcom/tencent/could/component/common/ai/log/e;

    .line 75
    .line 76
    invoke-virtual {p1, v2}, Lcom/tencent/could/component/common/ai/log/e;->a(Lcom/tencent/could/component/common/ai/log/d;)V

    .line 77
    .line 78
    .line 79
    :cond_1
    throw p0

    .line 80
    :cond_2
    :goto_3
    return-void
.end method
