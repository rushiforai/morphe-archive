.class public Ll/qyj0;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field private static final a:Ljava/lang/String; = "qyj0"

.field private static final b:[Ljava/lang/String;


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const-string v0, "../"

    .line 2
    .line 3
    const-string v1, "~/"

    .line 4
    .line 5
    filled-new-array {v0, v1}, [Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    sput-object v0, Ll/qyj0;->b:[Ljava/lang/String;

    .line 10
    .line 11
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static a()V
    .locals 0

    .line 1
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/io/File;Ljava/lang/String;ZLl/okj;)Z
    .locals 2

    .line 1
    invoke-virtual {p1}, Ljava/io/File;->getName()Ljava/lang/String;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ".7z"

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    invoke-static {p1, p2}, Lcom/hellogroup/common/file/FileUtil;->u(Ljava/io/File;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0

    .line 18
    :cond_0
    invoke-virtual {p1}, Ljava/io/File;->getAbsolutePath()Ljava/lang/String;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p0, p1, p2, p3, p4}, Ll/qyj0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/okj;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    return p0
.end method

.method public static c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/okj;)Z
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    :try_start_0
    invoke-static {p0, p1, p2, p3, p4}, Ll/qyj0;->d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/okj;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 3
    .line 4
    .line 5
    return v0

    .line 6
    :catch_0
    move-exception p0

    .line 7
    sget-object p1, Ll/qyj0;->a:Ljava/lang/String;

    .line 8
    .line 9
    const-string p2, ""

    .line 10
    .line 11
    invoke-static {p1, p2, p0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 12
    .line 13
    .line 14
    const/4 p0, 0x0

    .line 15
    return p0
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;ZLl/okj;)V
    .locals 19
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    move-object/from16 v1, p2

    .line 2
    .line 3
    const-string v2, ""

    .line 4
    .line 5
    const/4 v3, 0x2

    .line 6
    const/4 v4, 0x1

    .line 7
    const/4 v5, 0x0

    .line 8
    const/4 v6, 0x0

    .line 9
    :try_start_0
    new-instance v7, Ljava/util/zip/ZipFile;

    .line 10
    .line 11
    move-object/from16 v0, p1

    .line 12
    .line 13
    invoke-direct {v7, v0}, Ljava/util/zip/ZipFile;-><init>(Ljava/lang/String;)V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 14
    .line 15
    .line 16
    :try_start_1
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->size()I

    .line 17
    .line 18
    .line 19
    move-result v0

    .line 20
    invoke-virtual {v7}, Ljava/util/zip/ZipFile;->entries()Ljava/util/Enumeration;

    .line 21
    .line 22
    .line 23
    move-result-object v8

    .line 24
    move v9, v5

    .line 25
    :cond_0
    :goto_0
    invoke-interface {v8}, Ljava/util/Enumeration;->hasMoreElements()Z

    .line 26
    .line 27
    .line 28
    move-result v10

    .line 29
    if-eqz v10, :cond_8

    .line 30
    .line 31
    if-eqz p4, :cond_1

    .line 32
    .line 33
    int-to-long v10, v0

    .line 34
    add-int/lit8 v9, v9, 0x1

    .line 35
    .line 36
    int-to-long v12, v9

    .line 37
    move-wide/from16 v17, v12

    .line 38
    .line 39
    const/4 v13, 0x1

    .line 40
    const/4 v14, 0x0

    .line 41
    move-object/from16 v12, p0

    .line 42
    .line 43
    move-wide v15, v10

    .line 44
    move-object/from16 v11, p4

    .line 45
    .line 46
    invoke-interface/range {v11 .. v18}, Ll/okj;->a(Ljava/lang/String;IIJJ)V

    .line 47
    .line 48
    .line 49
    goto :goto_3

    .line 50
    :catchall_0
    move-exception v0

    .line 51
    move-object v10, v6

    .line 52
    :goto_1
    move-object v6, v7

    .line 53
    goto/16 :goto_7

    .line 54
    .line 55
    :catch_0
    move-exception v0

    .line 56
    move-object v10, v6

    .line 57
    :goto_2
    move-object v6, v7

    .line 58
    goto/16 :goto_6

    .line 59
    .line 60
    :cond_1
    :goto_3
    invoke-interface {v8}, Ljava/util/Enumeration;->nextElement()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v10

    .line 64
    check-cast v10, Ljava/util/zip/ZipEntry;

    .line 65
    .line 66
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->getName()Ljava/lang/String;

    .line 67
    .line 68
    .line 69
    move-result-object v11

    .line 70
    invoke-static {v11}, Ll/qyj0;->e(Ljava/lang/String;)Z

    .line 71
    .line 72
    .line 73
    move-result v12

    .line 74
    if-eqz v12, :cond_7

    .line 75
    .line 76
    invoke-virtual {v7, v10}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    .line 77
    .line 78
    .line 79
    move-result-object v12

    .line 80
    new-instance v13, Ljava/io/File;

    .line 81
    .line 82
    invoke-direct {v13, v1, v11}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 83
    .line 84
    .line 85
    invoke-virtual {v13}, Ljava/io/File;->getCanonicalPath()Ljava/lang/String;

    .line 86
    .line 87
    .line 88
    move-result-object v11

    .line 89
    invoke-virtual {v11, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 90
    .line 91
    .line 92
    move-result v11

    .line 93
    if-nez v11, :cond_2

    .line 94
    .line 95
    invoke-static {}, Ll/qyj0;->a()V

    .line 96
    .line 97
    .line 98
    :cond_2
    invoke-virtual {v10}, Ljava/util/zip/ZipEntry;->isDirectory()Z

    .line 99
    .line 100
    .line 101
    move-result v10

    .line 102
    if-eqz v10, :cond_3

    .line 103
    .line 104
    invoke-virtual {v13}, Ljava/io/File;->exists()Z

    .line 105
    .line 106
    .line 107
    move-result v10

    .line 108
    if-nez v10, :cond_0

    .line 109
    .line 110
    invoke-virtual {v13}, Ljava/io/File;->mkdirs()Z

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_3
    new-instance v10, Ljava/io/File;

    .line 115
    .line 116
    invoke-virtual {v13}, Ljava/io/File;->getParent()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v11

    .line 120
    invoke-direct {v10, v11}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 121
    .line 122
    .line 123
    invoke-virtual {v10}, Ljava/io/File;->exists()Z

    .line 124
    .line 125
    .line 126
    move-result v11

    .line 127
    if-nez v11, :cond_4

    .line 128
    .line 129
    invoke-virtual {v10}, Ljava/io/File;->mkdirs()Z

    .line 130
    .line 131
    .line 132
    :cond_4
    if-eqz p3, :cond_5

    .line 133
    .line 134
    new-instance v11, Ljava/io/File;

    .line 135
    .line 136
    const-string v14, ".nomedia"

    .line 137
    .line 138
    invoke-direct {v11, v10, v14}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v11}, Ljava/io/File;->exists()Z

    .line 142
    .line 143
    .line 144
    move-result v10

    .line 145
    if-nez v10, :cond_5

    .line 146
    .line 147
    invoke-virtual {v11}, Ljava/io/File;->createNewFile()Z
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 148
    .line 149
    .line 150
    :cond_5
    :try_start_2
    new-instance v10, Ljava/io/BufferedOutputStream;

    .line 151
    .line 152
    new-instance v11, Ljava/io/FileOutputStream;

    .line 153
    .line 154
    invoke-direct {v11, v13}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V

    .line 155
    .line 156
    .line 157
    const/16 v14, 0x1000

    .line 158
    .line 159
    invoke-direct {v10, v11, v14}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;I)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    .line 160
    .line 161
    .line 162
    const/16 v6, 0x2000

    .line 163
    .line 164
    :try_start_3
    new-array v6, v6, [B

    .line 165
    .line 166
    :goto_4
    invoke-virtual {v12, v6, v5, v14}, Ljava/io/InputStream;->read([BII)I

    .line 167
    .line 168
    .line 169
    move-result v11

    .line 170
    const/4 v15, -0x1

    .line 171
    if-eq v11, v15, :cond_6

    .line 172
    .line 173
    invoke-virtual {v10, v6, v5, v11}, Ljava/io/BufferedOutputStream;->write([BII)V

    .line 174
    .line 175
    .line 176
    goto :goto_4

    .line 177
    :catchall_1
    move-exception v0

    .line 178
    move-object v6, v10

    .line 179
    goto :goto_5

    .line 180
    :cond_6
    invoke-virtual {v10}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 181
    .line 182
    .line 183
    :try_start_4
    invoke-static {v12}, Ll/n1m;->b(Ljava/io/Closeable;)V

    .line 184
    .line 185
    .line 186
    invoke-static {v10}, Ll/n1m;->b(Ljava/io/Closeable;)V

    .line 187
    .line 188
    .line 189
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 190
    .line 191
    .line 192
    move-result-wide v11

    .line 193
    invoke-virtual {v13, v11, v12}, Ljava/io/File;->setLastModified(J)Z
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 194
    .line 195
    .line 196
    move-object v6, v10

    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :catchall_2
    move-exception v0

    .line 200
    goto/16 :goto_1

    .line 201
    .line 202
    :catch_1
    move-exception v0

    .line 203
    goto/16 :goto_2

    .line 204
    .line 205
    :catchall_3
    move-exception v0

    .line 206
    :goto_5
    :try_start_5
    sget-object v8, Ll/qyj0;->a:Ljava/lang/String;

    .line 207
    .line 208
    invoke-static {v8, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 209
    .line 210
    .line 211
    throw v0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_4

    .line 212
    :catchall_4
    move-exception v0

    .line 213
    :try_start_6
    invoke-static {v12}, Ll/n1m;->b(Ljava/io/Closeable;)V

    .line 214
    .line 215
    .line 216
    invoke-static {v6}, Ll/n1m;->b(Ljava/io/Closeable;)V

    .line 217
    .line 218
    .line 219
    throw v0

    .line 220
    :cond_7
    new-instance v0, Ljava/lang/IllegalArgumentException;

    .line 221
    .line 222
    const-string v8, "unsecurity zipfile!"

    .line 223
    .line 224
    invoke-direct {v0, v8}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    .line 225
    .line 226
    .line 227
    throw v0
    :try_end_6
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_0
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    .line 228
    :cond_8
    new-instance v0, Ljava/io/File;

    .line 229
    .line 230
    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 231
    .line 232
    .line 233
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 234
    .line 235
    .line 236
    move-result-wide v1

    .line 237
    invoke-virtual {v0, v1, v2}, Ljava/io/File;->setLastModified(J)Z

    .line 238
    .line 239
    .line 240
    new-array v0, v3, [Ljava/io/Closeable;

    .line 241
    .line 242
    aput-object v7, v0, v5

    .line 243
    .line 244
    aput-object v6, v0, v4

    .line 245
    .line 246
    invoke-static {v0}, Ll/n1m;->a([Ljava/io/Closeable;)V

    .line 247
    .line 248
    .line 249
    return-void

    .line 250
    :catchall_5
    move-exception v0

    .line 251
    move-object v10, v6

    .line 252
    goto :goto_7

    .line 253
    :catch_2
    move-exception v0

    .line 254
    move-object v10, v6

    .line 255
    :goto_6
    :try_start_7
    const-string v7, "MK"

    .line 256
    .line 257
    invoke-static {v7, v2, v0}, Landroid/util/Log;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)I

    .line 258
    .line 259
    .line 260
    throw v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_6

    .line 261
    :catchall_6
    move-exception v0

    .line 262
    :goto_7
    new-instance v2, Ljava/io/File;

    .line 263
    .line 264
    invoke-direct {v2, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 265
    .line 266
    .line 267
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 268
    .line 269
    .line 270
    move-result-wide v7

    .line 271
    invoke-virtual {v2, v7, v8}, Ljava/io/File;->setLastModified(J)Z

    .line 272
    .line 273
    .line 274
    new-array v1, v3, [Ljava/io/Closeable;

    .line 275
    .line 276
    aput-object v6, v1, v5

    .line 277
    .line 278
    aput-object v10, v1, v4

    .line 279
    .line 280
    invoke-static {v1}, Ll/n1m;->a([Ljava/io/Closeable;)V

    .line 281
    .line 282
    .line 283
    throw v0
.end method

.method private static e(Ljava/lang/String;)Z
    .locals 5
    .param p0    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    sget-object v0, Ll/qyj0;->b:[Ljava/lang/String;

    .line 2
    .line 3
    array-length v1, v0

    .line 4
    const/4 v2, 0x0

    .line 5
    move v3, v2

    .line 6
    :goto_0
    if-ge v3, v1, :cond_1

    .line 7
    .line 8
    aget-object v4, v0, v3

    .line 9
    .line 10
    invoke-virtual {p0, v4}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    if-eqz v4, :cond_0

    .line 15
    .line 16
    return v2

    .line 17
    :cond_0
    add-int/lit8 v3, v3, 0x1

    .line 18
    .line 19
    goto :goto_0

    .line 20
    :cond_1
    const/4 p0, 0x1

    .line 21
    return p0
.end method
