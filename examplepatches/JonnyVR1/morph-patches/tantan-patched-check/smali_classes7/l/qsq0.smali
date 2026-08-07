.class public Ll/qsq0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(Landroid/content/Context;Ljava/lang/String;J)Z
    .locals 5

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    new-instance v2, Ljava/io/File;

    .line 4
    .line 5
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 6
    .line 7
    .line 8
    move-result-object v3

    .line 9
    const-string v4, "/.vdevdir/"

    .line 10
    .line 11
    invoke-direct {v2, v3, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    invoke-static {v2}, Ll/e6r0;->b(Ljava/io/File;)Z

    .line 15
    .line 16
    .line 17
    move-result v3
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 18
    if-nez v3, :cond_0

    .line 19
    .line 20
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 21
    .line 22
    .line 23
    return v0

    .line 24
    :cond_0
    :try_start_1
    new-instance v3, Ljava/io/File;

    .line 25
    .line 26
    const-string v4, "lcfp.lock"

    .line 27
    .line 28
    invoke-direct {v3, v2, v4}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    invoke-static {v3}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 32
    .line 33
    .line 34
    new-instance v2, Ljava/io/RandomAccessFile;

    .line 35
    .line 36
    const-string v4, "rw"

    .line 37
    .line 38
    invoke-direct {v2, v3, v4}, Ljava/io/RandomAccessFile;-><init>(Ljava/io/File;Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 39
    .line 40
    .line 41
    :try_start_2
    invoke-virtual {v2}, Ljava/io/RandomAccessFile;->getChannel()Ljava/nio/channels/FileChannel;

    .line 42
    .line 43
    .line 44
    move-result-object v3

    .line 45
    invoke-virtual {v3}, Ljava/nio/channels/FileChannel;->lock()Ljava/nio/channels/FileLock;

    .line 46
    .line 47
    .line 48
    move-result-object v1

    .line 49
    invoke-static {p0, p1, p2, p3}, Ll/qsq0;->b(Landroid/content/Context;Ljava/lang/String;J)Z

    .line 50
    .line 51
    .line 52
    move-result p0
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 53
    if-eqz v1, :cond_1

    .line 54
    .line 55
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-eqz p1, :cond_1

    .line 60
    .line 61
    :try_start_3
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_0

    .line 62
    .line 63
    .line 64
    :catch_0
    :cond_1
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 65
    .line 66
    .line 67
    return p0

    .line 68
    :catchall_0
    move-exception p0

    .line 69
    goto :goto_1

    .line 70
    :catch_1
    move-exception p0

    .line 71
    goto :goto_0

    .line 72
    :catchall_1
    move-exception p0

    .line 73
    move-object v2, v1

    .line 74
    goto :goto_1

    .line 75
    :catch_2
    move-exception p0

    .line 76
    move-object v2, v1

    .line 77
    :goto_0
    :try_start_4
    invoke-virtual {p0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 78
    .line 79
    .line 80
    if-eqz v1, :cond_2

    .line 81
    .line 82
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 83
    .line 84
    .line 85
    move-result p0

    .line 86
    if-eqz p0, :cond_2

    .line 87
    .line 88
    :try_start_5
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_3

    .line 89
    .line 90
    .line 91
    :catch_3
    :cond_2
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 92
    .line 93
    .line 94
    return v0

    .line 95
    :goto_1
    if-eqz v1, :cond_3

    .line 96
    .line 97
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->isValid()Z

    .line 98
    .line 99
    .line 100
    move-result p1

    .line 101
    if-eqz p1, :cond_3

    .line 102
    .line 103
    :try_start_6
    invoke-virtual {v1}, Ljava/nio/channels/FileLock;->release()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4

    .line 104
    .line 105
    .line 106
    :catch_4
    :cond_3
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 107
    .line 108
    .line 109
    throw p0
.end method

.method private static b(Landroid/content/Context;Ljava/lang/String;J)Z
    .locals 17

    .line 1
    new-instance v0, Ljava/io/File;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    const-string v2, "/.vdevdir/"

    .line 8
    .line 9
    invoke-direct {v0, v1, v2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-static {v0}, Ll/e6r0;->b(Ljava/io/File;)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    const/4 v2, 0x1

    .line 17
    if-nez v1, :cond_0

    .line 18
    .line 19
    return v2

    .line 20
    :cond_0
    new-instance v1, Ljava/io/File;

    .line 21
    .line 22
    const-string v3, "lcfp"

    .line 23
    .line 24
    invoke-direct {v1, v0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    new-instance v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 30
    .line 31
    .line 32
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 33
    .line 34
    .line 35
    move-result-wide v3

    .line 36
    new-instance v5, Ljava/lang/StringBuilder;

    .line 37
    .line 38
    invoke-direct {v5}, Ljava/lang/StringBuilder;-><init>()V

    .line 39
    .line 40
    .line 41
    move-object/from16 v6, p1

    .line 42
    .line 43
    invoke-virtual {v5, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 44
    .line 45
    .line 46
    const-string v7, ":"

    .line 47
    .line 48
    invoke-virtual {v5, v7}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 49
    .line 50
    .line 51
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v8

    .line 55
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 56
    .line 57
    .line 58
    const-string v8, ","

    .line 59
    .line 60
    invoke-virtual {v5, v8}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    .line 62
    .line 63
    invoke-virtual {v5, v3, v4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 64
    .line 65
    .line 66
    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v5

    .line 70
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    .line 71
    .line 72
    .line 73
    move-result v9

    .line 74
    const/4 v10, 0x0

    .line 75
    if-eqz v9, :cond_6

    .line 76
    .line 77
    :try_start_0
    new-instance v9, Ljava/io/BufferedReader;

    .line 78
    .line 79
    new-instance v11, Ljava/io/FileReader;

    .line 80
    .line 81
    invoke-direct {v11, v1}, Ljava/io/FileReader;-><init>(Ljava/io/File;)V

    .line 82
    .line 83
    .line 84
    invoke-direct {v9, v11}, Ljava/io/BufferedReader;-><init>(Ljava/io/Reader;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_1
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 85
    .line 86
    .line 87
    :goto_0
    :try_start_1
    invoke-virtual {v9}, Ljava/io/BufferedReader;->readLine()Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    move-result-object v11

    .line 91
    if-eqz v11, :cond_5

    .line 92
    .line 93
    invoke-virtual {v11, v7}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v12

    .line 97
    array-length v13, v12

    .line 98
    const/4 v14, 0x2

    .line 99
    if-eq v13, v14, :cond_1

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :cond_1
    const/4 v13, 0x0

    .line 103
    aget-object v15, v12, v13
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 104
    .line 105
    move/from16 v16, v2

    .line 106
    .line 107
    :try_start_2
    invoke-static {v6}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    invoke-static {v15, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 112
    .line 113
    .line 114
    move-result v2

    .line 115
    if-eqz v2, :cond_4

    .line 116
    .line 117
    aget-object v2, v12, v16

    .line 118
    .line 119
    invoke-virtual {v2, v8}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    array-length v11, v2

    .line 124
    if-eq v11, v14, :cond_3

    .line 125
    .line 126
    :cond_2
    :goto_1
    move/from16 v2, v16

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_3
    aget-object v11, v2, v16

    .line 130
    .line 131
    invoke-static {v11}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    .line 132
    .line 133
    .line 134
    move-result-wide v11

    .line 135
    aget-object v2, v2, v13

    .line 136
    .line 137
    invoke-virtual/range {p0 .. p0}, Landroid/content/Context;->getPackageName()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v14

    .line 141
    invoke-static {v2, v14}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    if-nez v2, :cond_2

    .line 146
    .line 147
    sub-long v11, v3, v11

    .line 148
    .line 149
    invoke-static {v11, v12}, Ljava/lang/Math;->abs(J)J

    .line 150
    .line 151
    .line 152
    move-result-wide v11
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 153
    long-to-float v2, v11

    .line 154
    const-wide/16 v11, 0x3e8

    .line 155
    .line 156
    mul-long v11, v11, p2

    .line 157
    .line 158
    long-to-float v11, v11

    .line 159
    const v12, 0x3f666666    # 0.9f

    .line 160
    .line 161
    .line 162
    mul-float/2addr v11, v12

    .line 163
    cmpg-float v2, v2, v11

    .line 164
    .line 165
    if-gez v2, :cond_2

    .line 166
    .line 167
    invoke-static {v9}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 168
    .line 169
    .line 170
    return v13

    .line 171
    :catchall_0
    move-exception v0

    .line 172
    move-object v10, v9

    .line 173
    goto :goto_4

    .line 174
    :cond_4
    :try_start_3
    invoke-interface {v0, v11}, Ljava/util/List;->add(Ljava/lang/Object;)Z
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 175
    .line 176
    .line 177
    goto :goto_1

    .line 178
    :catch_0
    move/from16 v16, v2

    .line 179
    .line 180
    goto :goto_3

    .line 181
    :cond_5
    move/from16 v16, v2

    .line 182
    .line 183
    :goto_2
    invoke-static {v9}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 184
    .line 185
    .line 186
    goto :goto_5

    .line 187
    :catchall_1
    move-exception v0

    .line 188
    goto :goto_4

    .line 189
    :catch_1
    move/from16 v16, v2

    .line 190
    .line 191
    move-object v9, v10

    .line 192
    :catch_2
    :goto_3
    :try_start_4
    invoke-interface {v0}, Ljava/util/List;->clear()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 193
    .line 194
    .line 195
    goto :goto_2

    .line 196
    :goto_4
    invoke-static {v10}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 197
    .line 198
    .line 199
    throw v0

    .line 200
    :cond_6
    move/from16 v16, v2

    .line 201
    .line 202
    invoke-static {v1}, Ll/j6r0;->f(Ljava/io/File;)Z

    .line 203
    .line 204
    .line 205
    move-result v2

    .line 206
    if-nez v2, :cond_7

    .line 207
    .line 208
    return v16

    .line 209
    :cond_7
    :goto_5
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 210
    .line 211
    .line 212
    :try_start_5
    new-instance v2, Ljava/io/BufferedWriter;

    .line 213
    .line 214
    new-instance v3, Ljava/io/FileWriter;

    .line 215
    .line 216
    invoke-direct {v3, v1}, Ljava/io/FileWriter;-><init>(Ljava/io/File;)V

    .line 217
    .line 218
    .line 219
    invoke-direct {v2, v3}, Ljava/io/BufferedWriter;-><init>(Ljava/io/Writer;)V
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_4
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 220
    .line 221
    .line 222
    :try_start_6
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 223
    .line 224
    .line 225
    move-result-object v0

    .line 226
    :goto_6
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    if-eqz v1, :cond_8

    .line 231
    .line 232
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v1

    .line 236
    check-cast v1, Ljava/lang/String;

    .line 237
    .line 238
    invoke-virtual {v2, v1}, Ljava/io/Writer;->write(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->newLine()V

    .line 242
    .line 243
    .line 244
    invoke-virtual {v2}, Ljava/io/BufferedWriter;->flush()V
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_3
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 245
    .line 246
    .line 247
    goto :goto_6

    .line 248
    :catchall_2
    move-exception v0

    .line 249
    move-object v10, v2

    .line 250
    goto :goto_9

    .line 251
    :catch_3
    move-exception v0

    .line 252
    move-object v10, v2

    .line 253
    goto :goto_7

    .line 254
    :cond_8
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 255
    .line 256
    .line 257
    goto :goto_8

    .line 258
    :catchall_3
    move-exception v0

    .line 259
    goto :goto_9

    .line 260
    :catch_4
    move-exception v0

    .line 261
    :goto_7
    :try_start_7
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v0

    .line 265
    invoke-static {v0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 266
    .line 267
    .line 268
    invoke-static {v10}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 269
    .line 270
    .line 271
    :goto_8
    return v16

    .line 272
    :goto_9
    invoke-static {v10}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 273
    .line 274
    .line 275
    throw v0
.end method
