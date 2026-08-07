.class public abstract Ll/rsg0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a()Ljava/lang/String;
    .locals 6

    .line 1
    sget-object v0, Landroid/os/Build;->CPU_ABI:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "x86_64"

    .line 4
    .line 5
    const-string v2, "x86"

    .line 6
    .line 7
    const-string v3, "armeabi-v7a"

    .line 8
    .line 9
    const-string v4, "arm64-v8a"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result v5

    .line 17
    if-nez v5, :cond_0

    .line 18
    .line 19
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v5

    .line 23
    if-nez v5, :cond_0

    .line 24
    .line 25
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-nez v5, :cond_0

    .line 30
    .line 31
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result v5

    .line 35
    if-eqz v5, :cond_1

    .line 36
    .line 37
    :cond_0
    return-object v0

    .line 38
    :cond_1
    sget-object v0, Landroid/os/Build;->CPU_ABI2:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    invoke-virtual {v0, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 43
    .line 44
    .line 45
    move-result v3

    .line 46
    if-nez v3, :cond_2

    .line 47
    .line 48
    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-nez v3, :cond_2

    .line 53
    .line 54
    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v2

    .line 58
    if-nez v2, :cond_2

    .line 59
    .line 60
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    if-eqz v1, :cond_3

    .line 65
    .line 66
    :cond_2
    return-object v0

    .line 67
    :cond_3
    return-object v4
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;)Ll/vgg0;
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v2, p1

    .line 4
    .line 5
    new-instance v0, Ljava/io/File;

    .line 6
    .line 7
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 11
    .line 12
    .line 13
    move-result v3

    .line 14
    if-eqz v3, :cond_0

    .line 15
    .line 16
    invoke-virtual {v0}, Ljava/io/File;->delete()Z

    .line 17
    .line 18
    .line 19
    :cond_0
    const-string v3, "copyIfNotExist error:"

    .line 20
    .line 21
    const-string v4, "File copy failed: "

    .line 22
    .line 23
    new-instance v5, Ll/vgg0;

    .line 24
    .line 25
    invoke-direct {v5}, Ll/vgg0;-><init>()V

    .line 26
    .line 27
    .line 28
    const/4 v0, 0x0

    .line 29
    iput v0, v5, Ll/vgg0;->a:I

    .line 30
    .line 31
    new-instance v0, Ljava/io/File;

    .line 32
    .line 33
    invoke-direct {v0, v2}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {v0}, Ljava/io/File;->exists()Z

    .line 37
    .line 38
    .line 39
    move-result v6

    .line 40
    if-eqz v6, :cond_1

    .line 41
    .line 42
    return-object v5

    .line 43
    :cond_1
    invoke-virtual {v0}, Ljava/io/File;->getParentFile()Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object v6

    .line 47
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 48
    .line 49
    .line 50
    move-result v7

    .line 51
    const-string v8, "SudRuntimeUtils"

    .line 52
    .line 53
    if-nez v7, :cond_2

    .line 54
    .line 55
    invoke-virtual {v6}, Ljava/io/File;->mkdirs()Z

    .line 56
    .line 57
    .line 58
    move-result v7

    .line 59
    if-nez v7, :cond_2

    .line 60
    .line 61
    const/4 v0, -0x1

    .line 62
    iput v0, v5, Ll/vgg0;->a:I

    .line 63
    .line 64
    const-string v0, "Make dir failed"

    .line 65
    .line 66
    iput-object v0, v5, Ll/vgg0;->b:Ljava/lang/String;

    .line 67
    .line 68
    new-instance v0, Ljava/lang/StringBuilder;

    .line 69
    .line 70
    const-string v1, "Make dir failed: "

    .line 71
    .line 72
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v6}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v1

    .line 79
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 80
    .line 81
    .line 82
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    invoke-static {v8, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 87
    .line 88
    .line 89
    return-object v5

    .line 90
    :cond_2
    new-instance v6, Ljava/io/File;

    .line 91
    .line 92
    invoke-direct {v6, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    invoke-virtual {v6}, Ljava/io/File;->exists()Z

    .line 96
    .line 97
    .line 98
    move-result v7

    .line 99
    const/16 v9, -0x28a1

    .line 100
    .line 101
    if-nez v7, :cond_3

    .line 102
    .line 103
    iput v9, v5, Ll/vgg0;->a:I

    .line 104
    .line 105
    const-string v0, "File not exist"

    .line 106
    .line 107
    iput-object v0, v5, Ll/vgg0;->b:Ljava/lang/String;

    .line 108
    .line 109
    new-instance v0, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    const-string v2, "File not exist: "

    .line 112
    .line 113
    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-static {v8, v0}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 124
    .line 125
    .line 126
    return-object v5

    .line 127
    :cond_3
    const/4 v7, 0x0

    .line 128
    :try_start_0
    new-instance v10, Ljava/io/FileInputStream;

    .line 129
    .line 130
    invoke-direct {v10, v6}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_4
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 131
    .line 132
    .line 133
    :try_start_1
    new-instance v6, Ljava/io/FileOutputStream;

    .line 134
    .line 135
    invoke-direct {v6, v0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_3
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 136
    .line 137
    .line 138
    :try_start_2
    invoke-virtual {v10}, Ljava/io/FileInputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 139
    .line 140
    .line 141
    move-result-object v11
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 142
    :try_start_3
    invoke-virtual {v6}, Ljava/io/FileOutputStream;->getChannel()Ljava/nio/channels/FileChannel;

    .line 143
    .line 144
    .line 145
    move-result-object v16
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 146
    :try_start_4
    invoke-virtual {v11}, Ljava/nio/channels/FileChannel;->size()J

    .line 147
    .line 148
    .line 149
    move-result-wide v14

    .line 150
    const-wide/16 v12, 0x0

    .line 151
    .line 152
    invoke-virtual/range {v11 .. v16}, Ljava/nio/channels/FileChannel;->transferTo(JJLjava/nio/channels/WritableByteChannel;)J
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 153
    .line 154
    .line 155
    invoke-static {v10}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 156
    .line 157
    .line 158
    invoke-static {v11}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 159
    .line 160
    .line 161
    invoke-static {v6}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 162
    .line 163
    .line 164
    invoke-static/range {v16 .. v16}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 165
    .line 166
    .line 167
    return-object v5

    .line 168
    :catchall_0
    move-exception v0

    .line 169
    :goto_0
    move-object v7, v11

    .line 170
    goto :goto_2

    .line 171
    :catch_0
    move-exception v0

    .line 172
    :goto_1
    move-object v7, v11

    .line 173
    goto :goto_3

    .line 174
    :catchall_1
    move-exception v0

    .line 175
    move-object/from16 v16, v7

    .line 176
    .line 177
    goto :goto_0

    .line 178
    :catch_1
    move-exception v0

    .line 179
    move-object/from16 v16, v7

    .line 180
    .line 181
    goto :goto_1

    .line 182
    :catchall_2
    move-exception v0

    .line 183
    move-object/from16 v16, v7

    .line 184
    .line 185
    :goto_2
    move-object v1, v7

    .line 186
    move-object/from16 v7, v16

    .line 187
    .line 188
    goto/16 :goto_8

    .line 189
    .line 190
    :catch_2
    move-exception v0

    .line 191
    move-object/from16 v16, v7

    .line 192
    .line 193
    :goto_3
    move-object v11, v10

    .line 194
    move-object v10, v7

    .line 195
    move-object/from16 v7, v16

    .line 196
    .line 197
    goto :goto_6

    .line 198
    :catchall_3
    move-exception v0

    .line 199
    goto :goto_4

    .line 200
    :catch_3
    move-exception v0

    .line 201
    goto :goto_5

    .line 202
    :goto_4
    move-object v1, v7

    .line 203
    move-object v6, v1

    .line 204
    goto :goto_8

    .line 205
    :goto_5
    move-object v6, v7

    .line 206
    move-object v11, v10

    .line 207
    move-object v10, v6

    .line 208
    goto :goto_6

    .line 209
    :catchall_4
    move-exception v0

    .line 210
    move-object v1, v7

    .line 211
    move-object v6, v1

    .line 212
    move-object v11, v6

    .line 213
    goto :goto_7

    .line 214
    :catch_4
    move-exception v0

    .line 215
    move-object v6, v7

    .line 216
    move-object v10, v6

    .line 217
    move-object v11, v10

    .line 218
    :goto_6
    :try_start_5
    iput v9, v5, Ll/vgg0;->a:I

    .line 219
    .line 220
    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v9

    .line 224
    iput-object v9, v5, Ll/vgg0;->b:Ljava/lang/String;

    .line 225
    .line 226
    new-instance v9, Ljava/lang/StringBuilder;

    .line 227
    .line 228
    invoke-direct {v9, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 229
    .line 230
    .line 231
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    const-string v1, " -> "

    .line 235
    .line 236
    invoke-virtual {v9, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 237
    .line 238
    .line 239
    invoke-virtual {v9, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 240
    .line 241
    .line 242
    invoke-virtual {v9}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 243
    .line 244
    .line 245
    move-result-object v1

    .line 246
    invoke-static {v8, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 247
    .line 248
    .line 249
    new-instance v1, Ljava/lang/StringBuilder;

    .line 250
    .line 251
    invoke-direct {v1, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 252
    .line 253
    .line 254
    invoke-static {v0}, Ltech/sud/logger/LogUtils;->getErrorInfo(Ljava/lang/Throwable;)Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 259
    .line 260
    .line 261
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 262
    .line 263
    .line 264
    move-result-object v1

    .line 265
    invoke-static {v8, v1}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 266
    .line 267
    .line 268
    invoke-virtual {v0}, Ljava/lang/Throwable;->printStackTrace()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_5

    .line 269
    .line 270
    .line 271
    invoke-static {v11}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 272
    .line 273
    .line 274
    invoke-static {v10}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 275
    .line 276
    .line 277
    invoke-static {v6}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 278
    .line 279
    .line 280
    invoke-static {v7}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 281
    .line 282
    .line 283
    return-object v5

    .line 284
    :catchall_5
    move-exception v0

    .line 285
    move-object v1, v7

    .line 286
    move-object v7, v10

    .line 287
    :goto_7
    move-object v10, v7

    .line 288
    move-object v7, v1

    .line 289
    move-object v1, v10

    .line 290
    move-object v10, v11

    .line 291
    :goto_8
    invoke-static {v10}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 292
    .line 293
    .line 294
    invoke-static {v1}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 295
    .line 296
    .line 297
    invoke-static {v6}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 298
    .line 299
    .line 300
    invoke-static {v7}, Ll/rsg0;->c(Ljava/io/Closeable;)V

    .line 301
    .line 302
    .line 303
    throw v0
.end method

.method public static c(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p0}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    :cond_0
    return-void
.end method

.method public static d(Ljava/io/File;)V
    .locals 5

    .line 1
    invoke-virtual {p0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    if-eqz p0, :cond_6

    .line 6
    .line 7
    array-length v0, p0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    goto :goto_2

    .line 11
    :cond_0
    array-length v0, p0

    .line 12
    const/4 v1, 0x0

    .line 13
    :goto_0
    if-ge v1, v0, :cond_6

    .line 14
    .line 15
    aget-object v2, p0, v1

    .line 16
    .line 17
    if-nez v2, :cond_1

    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_1
    invoke-virtual {v2}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 21
    .line 22
    .line 23
    move-result-object v3

    .line 24
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 25
    .line 26
    .line 27
    move-result v4

    .line 28
    if-eqz v4, :cond_2

    .line 29
    .line 30
    goto :goto_1

    .line 31
    :cond_2
    const-string v4, ".prof"

    .line 32
    .line 33
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result v4

    .line 37
    if-eqz v4, :cond_3

    .line 38
    .line 39
    goto :goto_1

    .line 40
    :cond_3
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 41
    .line 42
    .line 43
    move-result v4

    .line 44
    if-eqz v4, :cond_4

    .line 45
    .line 46
    const-string v4, "oat"

    .line 47
    .line 48
    invoke-virtual {v3, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 49
    .line 50
    .line 51
    move-result v3

    .line 52
    if-eqz v3, :cond_4

    .line 53
    .line 54
    goto :goto_1

    .line 55
    :cond_4
    invoke-virtual {v2}, Ljava/io/File;->isDirectory()Z

    .line 56
    .line 57
    .line 58
    move-result v3

    .line 59
    if-eqz v3, :cond_5

    .line 60
    .line 61
    invoke-static {v2}, Ll/rsg0;->d(Ljava/io/File;)V

    .line 62
    .line 63
    .line 64
    goto :goto_1

    .line 65
    :cond_5
    invoke-virtual {v2}, Ljava/io/File;->setReadOnly()Z

    .line 66
    .line 67
    .line 68
    move-result v2

    .line 69
    new-instance v3, Ljava/lang/StringBuilder;

    .line 70
    .line 71
    const-string v4, "setCoreFileReadOnly:"

    .line 72
    .line 73
    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    invoke-virtual {v3, v2}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 80
    .line 81
    .line 82
    move-result-object v2

    .line 83
    const-string v3, "SudRuntimeUtils"

    .line 84
    .line 85
    invoke-static {v3, v2}, Ltech/sud/logger/LogUtils;->file(Ljava/lang/String;Ljava/lang/Object;)V

    .line 86
    .line 87
    .line 88
    :goto_1
    add-int/lit8 v1, v1, 0x1

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :cond_6
    :goto_2
    return-void
.end method
