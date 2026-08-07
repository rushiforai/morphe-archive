.class public Ll/vt0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/ylc0$a;


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

.method private b(Ljava/io/Closeable;)V
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    :try_start_0
    invoke-interface {p1}, Ljava/io/Closeable;->close()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 4
    .line 5
    .line 6
    :catch_0
    :cond_0
    return-void
.end method

.method private c(Ljava/io/InputStream;Ljava/io/OutputStream;)J
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/16 p0, 0x1000

    .line 2
    .line 3
    new-array p0, p0, [B

    .line 4
    .line 5
    const-wide/16 v0, 0x0

    .line 6
    .line 7
    :goto_0
    invoke-virtual {p1, p0}, Ljava/io/InputStream;->read([B)I

    .line 8
    .line 9
    .line 10
    move-result v2

    .line 11
    const/4 v3, -0x1

    .line 12
    if-ne v2, v3, :cond_0

    .line 13
    .line 14
    invoke-virtual {p2}, Ljava/io/OutputStream;->flush()V

    .line 15
    .line 16
    .line 17
    return-wide v0

    .line 18
    :cond_0
    const/4 v3, 0x0

    .line 19
    invoke-virtual {p2, p0, v3, v2}, Ljava/io/OutputStream;->write([BII)V

    .line 20
    .line 21
    .line 22
    int-to-long v2, v2

    .line 23
    add-long/2addr v0, v2

    .line 24
    goto :goto_0
.end method


# virtual methods
.method public a(Landroid/content/Context;[Ljava/lang/String;Ljava/lang/String;Ljava/io/File;Ll/zlc0;)V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    move-object/from16 v0, p2

    .line 4
    .line 5
    move-object/from16 v2, p3

    .line 6
    .line 7
    move-object/from16 v3, p4

    .line 8
    .line 9
    move-object/from16 v4, p5

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    :try_start_0
    invoke-virtual/range {p1 .. p1}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    .line 13
    .line 14
    .line 15
    move-result-object v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    const/4 v7, 0x0

    .line 17
    move v8, v7

    .line 18
    :goto_0
    add-int/lit8 v9, v8, 0x1

    .line 19
    .line 20
    const/4 v10, 0x5

    .line 21
    const/4 v11, 0x1

    .line 22
    if-ge v8, v10, :cond_0

    .line 23
    .line 24
    :try_start_1
    new-instance v8, Ljava/util/zip/ZipFile;

    .line 25
    .line 26
    new-instance v12, Ljava/io/File;

    .line 27
    .line 28
    iget-object v13, v6, Landroid/content/pm/ApplicationInfo;->sourceDir:Ljava/lang/String;

    .line 29
    .line 30
    invoke-direct {v12, v13}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    invoke-direct {v8, v12, v11}, Ljava/util/zip/ZipFile;-><init>(Ljava/io/File;I)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 34
    .line 35
    .line 36
    goto :goto_1

    .line 37
    :catchall_0
    move-exception v0

    .line 38
    goto/16 :goto_c

    .line 39
    .line 40
    :catch_0
    move v8, v9

    .line 41
    goto :goto_0

    .line 42
    :cond_0
    move-object v8, v5

    .line 43
    :goto_1
    if-nez v8, :cond_1

    .line 44
    .line 45
    :try_start_2
    const-string v0, "FATAL! Couldn\'t find application APK!"

    .line 46
    .line 47
    invoke-virtual {v4, v0}, Ll/zlc0;->h(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 48
    .line 49
    .line 50
    if-eqz v8, :cond_a

    .line 51
    .line 52
    :goto_2
    :try_start_3
    invoke-virtual {v8}, Ljava/util/zip/ZipFile;->close()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_7

    .line 53
    .line 54
    .line 55
    goto/16 :goto_b

    .line 56
    .line 57
    :catchall_1
    move-exception v0

    .line 58
    move-object v5, v8

    .line 59
    goto/16 :goto_c

    .line 60
    .line 61
    :cond_1
    move v6, v7

    .line 62
    :goto_3
    add-int/lit8 v9, v6, 0x1

    .line 63
    .line 64
    if-ge v6, v10, :cond_9

    .line 65
    .line 66
    :try_start_4
    array-length v6, v0

    .line 67
    move-object v13, v5

    .line 68
    move-object v14, v13

    .line 69
    move v12, v7

    .line 70
    :goto_4
    if-ge v12, v6, :cond_3

    .line 71
    .line 72
    aget-object v13, v0, v12

    .line 73
    .line 74
    new-instance v14, Ljava/lang/StringBuilder;

    .line 75
    .line 76
    invoke-direct {v14}, Ljava/lang/StringBuilder;-><init>()V

    .line 77
    .line 78
    .line 79
    const-string v15, "lib"

    .line 80
    .line 81
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 82
    .line 83
    .line 84
    sget-char v15, Ljava/io/File;->separatorChar:C

    .line 85
    .line 86
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 87
    .line 88
    .line 89
    invoke-virtual {v14, v13}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 90
    .line 91
    .line 92
    invoke-virtual {v14, v15}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 93
    .line 94
    .line 95
    invoke-virtual {v14, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 96
    .line 97
    .line 98
    invoke-virtual {v14}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v13

    .line 102
    invoke-virtual {v8, v13}, Ljava/util/zip/ZipFile;->getEntry(Ljava/lang/String;)Ljava/util/zip/ZipEntry;

    .line 103
    .line 104
    .line 105
    move-result-object v14

    .line 106
    if-eqz v14, :cond_2

    .line 107
    .line 108
    goto :goto_5

    .line 109
    :cond_2
    add-int/lit8 v12, v12, 0x1

    .line 110
    .line 111
    goto :goto_4

    .line 112
    :cond_3
    :goto_5
    if-eqz v13, :cond_4

    .line 113
    .line 114
    const-string v6, "Looking for %s in APK..."

    .line 115
    .line 116
    filled-new-array {v13}, [Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v12

    .line 120
    invoke-virtual {v4, v6, v12}, Ll/zlc0;->i(Ljava/lang/String;[Ljava/lang/Object;)V

    .line 121
    .line 122
    .line 123
    :cond_4
    if-nez v14, :cond_6

    .line 124
    .line 125
    if-eqz v13, :cond_5

    .line 126
    .line 127
    new-instance v0, Lcom/getkeepsafe/relinker/MissingLibraryException;

    .line 128
    .line 129
    invoke-direct {v0, v13}, Lcom/getkeepsafe/relinker/MissingLibraryException;-><init>(Ljava/lang/String;)V

    .line 130
    .line 131
    .line 132
    throw v0

    .line 133
    :cond_5
    new-instance v0, Lcom/getkeepsafe/relinker/MissingLibraryException;

    .line 134
    .line 135
    invoke-direct {v0, v2}, Lcom/getkeepsafe/relinker/MissingLibraryException;-><init>(Ljava/lang/String;)V

    .line 136
    .line 137
    .line 138
    throw v0

    .line 139
    :cond_6
    const-string v6, "Found %s! Extracting..."

    .line 140
    .line 141
    filled-new-array {v13}, [Ljava/lang/Object;

    .line 142
    .line 143
    .line 144
    move-result-object v12

    .line 145
    invoke-virtual {v4, v6, v12}, Ll/zlc0;->i(Ljava/lang/String;[Ljava/lang/Object;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 146
    .line 147
    .line 148
    :try_start_5
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    .line 149
    .line 150
    .line 151
    move-result v6

    .line 152
    if-nez v6, :cond_7

    .line 153
    .line 154
    invoke-virtual {v3}, Ljava/io/File;->createNewFile()Z

    .line 155
    .line 156
    .line 157
    move-result v6
    :try_end_5
    .catch Ljava/io/IOException; {:try_start_5 .. :try_end_5} :catch_6
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 158
    if-nez v6, :cond_7

    .line 159
    .line 160
    goto :goto_a

    .line 161
    :cond_7
    :try_start_6
    invoke-virtual {v8, v14}, Ljava/util/zip/ZipFile;->getInputStream(Ljava/util/zip/ZipEntry;)Ljava/io/InputStream;

    .line 162
    .line 163
    .line 164
    move-result-object v6
    :try_end_6
    .catch Ljava/io/FileNotFoundException; {:try_start_6 .. :try_end_6} :catch_5
    .catch Ljava/io/IOException; {:try_start_6 .. :try_end_6} :catch_4
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 165
    :try_start_7
    new-instance v12, Ljava/io/FileOutputStream;

    .line 166
    .line 167
    invoke-direct {v12, v3}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_7
    .catch Ljava/io/FileNotFoundException; {:try_start_7 .. :try_end_7} :catch_3
    .catch Ljava/io/IOException; {:try_start_7 .. :try_end_7} :catch_2
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 168
    .line 169
    .line 170
    :try_start_8
    invoke-direct {v1, v6, v12}, Ll/vt0;->c(Ljava/io/InputStream;Ljava/io/OutputStream;)J

    .line 171
    .line 172
    .line 173
    move-result-wide v13

    .line 174
    invoke-virtual {v12}, Ljava/io/FileOutputStream;->getFD()Ljava/io/FileDescriptor;

    .line 175
    .line 176
    .line 177
    move-result-object v15

    .line 178
    invoke-virtual {v15}, Ljava/io/FileDescriptor;->sync()V

    .line 179
    .line 180
    .line 181
    invoke-virtual {v3}, Ljava/io/File;->length()J

    .line 182
    .line 183
    .line 184
    move-result-wide v15
    :try_end_8
    .catch Ljava/io/FileNotFoundException; {:try_start_8 .. :try_end_8} :catch_1
    .catch Ljava/io/IOException; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_2

    .line 185
    cmp-long v13, v13, v15

    .line 186
    .line 187
    if-eqz v13, :cond_8

    .line 188
    .line 189
    :catch_1
    :goto_6
    :try_start_9
    invoke-direct {v1, v6}, Ll/vt0;->b(Ljava/io/Closeable;)V

    .line 190
    .line 191
    .line 192
    goto :goto_9

    .line 193
    :cond_8
    invoke-direct {v1, v6}, Ll/vt0;->b(Ljava/io/Closeable;)V

    .line 194
    .line 195
    .line 196
    invoke-direct {v1, v12}, Ll/vt0;->b(Ljava/io/Closeable;)V

    .line 197
    .line 198
    .line 199
    invoke-virtual {v3, v11, v7}, Ljava/io/File;->setReadable(ZZ)Z

    .line 200
    .line 201
    .line 202
    invoke-virtual {v3, v11, v7}, Ljava/io/File;->setExecutable(ZZ)Z

    .line 203
    .line 204
    .line 205
    invoke-virtual {v3, v11}, Ljava/io/File;->setWritable(Z)Z

    .line 206
    .line 207
    .line 208
    goto/16 :goto_2

    .line 209
    .line 210
    :catchall_2
    move-exception v0

    .line 211
    :goto_7
    move-object v5, v6

    .line 212
    goto :goto_8

    .line 213
    :catchall_3
    move-exception v0

    .line 214
    move-object v12, v5

    .line 215
    goto :goto_7

    .line 216
    :catch_2
    move-object v12, v5

    .line 217
    goto :goto_6

    .line 218
    :catch_3
    move-object v12, v5

    .line 219
    goto :goto_6

    .line 220
    :catchall_4
    move-exception v0

    .line 221
    move-object v12, v5

    .line 222
    :goto_8
    invoke-direct {v1, v5}, Ll/vt0;->b(Ljava/io/Closeable;)V

    .line 223
    .line 224
    .line 225
    invoke-direct {v1, v12}, Ll/vt0;->b(Ljava/io/Closeable;)V

    .line 226
    .line 227
    .line 228
    throw v0

    .line 229
    :catch_4
    move-object v6, v5

    .line 230
    move-object v12, v6

    .line 231
    goto :goto_6

    .line 232
    :goto_9
    invoke-direct {v1, v12}, Ll/vt0;->b(Ljava/io/Closeable;)V

    .line 233
    .line 234
    .line 235
    goto :goto_a

    .line 236
    :catch_5
    move-object v6, v5

    .line 237
    move-object v12, v6

    .line 238
    goto :goto_6

    .line 239
    :catch_6
    :goto_a
    move v6, v9

    .line 240
    goto/16 :goto_3

    .line 241
    .line 242
    :cond_9
    const-string v0, "FATAL! Couldn\'t extract the library from the APK!"

    .line 243
    .line 244
    invoke-virtual {v4, v0}, Ll/zlc0;->h(Ljava/lang/String;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_1

    .line 245
    .line 246
    .line 247
    goto/16 :goto_2

    .line 248
    .line 249
    :catch_7
    :cond_a
    :goto_b
    return-void

    .line 250
    :goto_c
    if-eqz v5, :cond_b

    .line 251
    .line 252
    :try_start_a
    invoke-virtual {v5}, Ljava/util/zip/ZipFile;->close()V
    :try_end_a
    .catch Ljava/io/IOException; {:try_start_a .. :try_end_a} :catch_8

    .line 253
    .line 254
    .line 255
    :catch_8
    :cond_b
    throw v0
.end method
