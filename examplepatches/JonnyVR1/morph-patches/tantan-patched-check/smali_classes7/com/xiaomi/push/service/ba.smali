.class public Lcom/xiaomi/push/service/ba;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static final a:Ljava/lang/Object;


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    new-instance v0, Ljava/lang/Object;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    sput-object v0, Lcom/xiaomi/push/service/ba;->a:Ljava/lang/Object;

    .line 7
    .line 8
    return-void
.end method

.method public static a(Landroid/content/Context;Lcom/xiaomi/push/gj;)V
    .locals 2

    .line 39
    invoke-virtual {p1}, Lcom/xiaomi/push/gj;->e()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lcom/xiaomi/push/service/az;->a(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    .line 40
    :cond_0
    invoke-static {p0}, Ll/tsq0;->f(Landroid/content/Context;)Ll/tsq0;

    move-result-object v0

    new-instance v1, Lcom/xiaomi/push/service/ba$1;

    invoke-direct {v1, p0, p1}, Lcom/xiaomi/push/service/ba$1;-><init>(Landroid/content/Context;Lcom/xiaomi/push/gj;)V

    invoke-virtual {v0, v1}, Ll/tsq0;->g(Ljava/lang/Runnable;)V

    return-void
.end method

.method public static a(Landroid/content/Context;)[B
    .locals 4

    .line 1
    invoke-static {p0}, Ll/g5r0;->d(Landroid/content/Context;)Ll/g5r0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const-string v1, ""

    .line 6
    .line 7
    const-string v2, "mipush"

    .line 8
    .line 9
    const-string v3, "td_key"

    .line 10
    .line 11
    invoke-virtual {v0, v2, v3, v1}, Ll/g5r0;->c(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    const/16 v0, 0x14

    .line 22
    .line 23
    invoke-static {v0}, Ll/bvq0;->a(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-static {p0}, Ll/g5r0;->d(Landroid/content/Context;)Ll/g5r0;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    invoke-virtual {p0, v2, v3, v0}, Ll/g5r0;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    :cond_0
    invoke-static {v0}, Lcom/xiaomi/push/service/ba;->a(Ljava/lang/String;)[B

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    return-object p0
.end method

.method private static a(Ljava/lang/String;)[B
    .locals 2

    .line 41
    invoke-static {p0}, Ll/ptq0;->b(Ljava/lang/String;)[B

    move-result-object p0

    const/16 v0, 0x10

    .line 42
    invoke-static {p0, v0}, Ljava/util/Arrays;->copyOf([BI)[B

    move-result-object p0

    const/4 v0, 0x0

    const/16 v1, 0x44

    .line 43
    aput-byte v1, p0, v0

    const/16 v0, 0xf

    const/16 v1, 0x54

    .line 44
    aput-byte v1, p0, v0

    return-object p0
.end method

.method public static synthetic b(Landroid/content/Context;Lcom/xiaomi/push/gj;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/ba;->c(Landroid/content/Context;Lcom/xiaomi/push/gj;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method private static c(Landroid/content/Context;Lcom/xiaomi/push/gj;)V
    .locals 10

    .line 1
    const-string v0, "TinyData write to cache file failed cause io exception item:"

    .line 2
    .line 3
    const-string v1, "TinyData write to cache file  failed item:"

    .line 4
    .line 5
    const-string v2, "TinyData write to cache file failed case encryption fail item:"

    .line 6
    .line 7
    const-string v3, "TinyData write to cache file failed case too much data content item:"

    .line 8
    .line 9
    invoke-static {p0}, Lcom/xiaomi/push/service/ba;->a(Landroid/content/Context;)[B

    .line 10
    .line 11
    .line 12
    move-result-object v4

    .line 13
    const/4 v5, 0x0

    .line 14
    :try_start_0
    invoke-static {p1}, Lcom/xiaomi/push/m;->e(Lcom/xiaomi/push/hq;)[B

    .line 15
    .line 16
    .line 17
    move-result-object v6

    .line 18
    invoke-static {v4, v6}, Ll/g3r0;->c([B[B)[B

    .line 19
    .line 20
    .line 21
    move-result-object v4
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 22
    const-string v6, "  ts:"

    .line 23
    .line 24
    if-eqz v4, :cond_2

    .line 25
    .line 26
    :try_start_1
    array-length v7, v4

    .line 27
    const/4 v8, 0x1

    .line 28
    if-ge v7, v8, :cond_0

    .line 29
    .line 30
    goto/16 :goto_0

    .line 31
    .line 32
    :cond_0
    array-length v2, v4

    .line 33
    const/16 v7, 0x7800

    .line 34
    .line 35
    if-le v2, v7, :cond_1

    .line 36
    .line 37
    new-instance p0, Ljava/lang/StringBuilder;

    .line 38
    .line 39
    invoke-direct {p0, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 40
    .line 41
    .line 42
    invoke-virtual {p1}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 47
    .line 48
    .line 49
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 50
    .line 51
    .line 52
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 53
    .line 54
    .line 55
    move-result-wide v2

    .line 56
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 57
    .line 58
    .line 59
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 60
    .line 61
    .line 62
    move-result-object p0

    .line 63
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 64
    .line 65
    .line 66
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 67
    .line 68
    .line 69
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :catchall_0
    move-exception p0

    .line 74
    move-object v0, v5

    .line 75
    goto/16 :goto_4

    .line 76
    .line 77
    :catch_0
    move-exception p0

    .line 78
    move-object v0, v5

    .line 79
    goto :goto_1

    .line 80
    :catch_1
    move-exception p0

    .line 81
    move-object v1, v5

    .line 82
    goto/16 :goto_2

    .line 83
    .line 84
    :cond_1
    :try_start_2
    new-instance v2, Ljava/io/File;

    .line 85
    .line 86
    invoke-virtual {p0}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    .line 87
    .line 88
    .line 89
    move-result-object p0

    .line 90
    const-string v3, "tiny_data.data"

    .line 91
    .line 92
    invoke-direct {v2, p0, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 93
    .line 94
    .line 95
    new-instance p0, Ljava/io/BufferedOutputStream;

    .line 96
    .line 97
    new-instance v3, Ljava/io/FileOutputStream;

    .line 98
    .line 99
    invoke-direct {v3, v2, v8}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;Z)V

    .line 100
    .line 101
    .line 102
    invoke-direct {p0, v3}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 103
    .line 104
    .line 105
    :try_start_3
    array-length v2, v4

    .line 106
    invoke-static {v2}, Ll/p6r0;->b(I)[B

    .line 107
    .line 108
    .line 109
    move-result-object v2

    .line 110
    invoke-virtual {p0, v2}, Ljava/io/OutputStream;->write([B)V

    .line 111
    .line 112
    .line 113
    invoke-virtual {p0, v4}, Ljava/io/OutputStream;->write([B)V

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ljava/io/BufferedOutputStream;->flush()V
    :try_end_3
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 117
    .line 118
    .line 119
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 120
    .line 121
    .line 122
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 123
    .line 124
    .line 125
    return-void

    .line 126
    :catchall_1
    move-exception p1

    .line 127
    move-object v0, p0

    .line 128
    move-object p0, p1

    .line 129
    goto :goto_4

    .line 130
    :catch_2
    move-exception v0

    .line 131
    move-object v9, v0

    .line 132
    move-object v0, p0

    .line 133
    move-object p0, v9

    .line 134
    goto :goto_1

    .line 135
    :catch_3
    move-exception v1

    .line 136
    move-object v9, v1

    .line 137
    move-object v1, p0

    .line 138
    move-object p0, v9

    .line 139
    goto :goto_2

    .line 140
    :cond_2
    :goto_0
    :try_start_4
    new-instance p0, Ljava/lang/StringBuilder;

    .line 141
    .line 142
    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 143
    .line 144
    .line 145
    invoke-virtual {p1}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    invoke-virtual {p0, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 150
    .line 151
    .line 152
    invoke-virtual {p0, v6}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 153
    .line 154
    .line 155
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 156
    .line 157
    .line 158
    move-result-wide v2

    .line 159
    invoke-virtual {p0, v2, v3}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 160
    .line 161
    .line 162
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_4
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_1
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 167
    .line 168
    .line 169
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 170
    .line 171
    .line 172
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 173
    .line 174
    .line 175
    return-void

    .line 176
    :goto_1
    :try_start_5
    new-instance v2, Ljava/lang/StringBuilder;

    .line 177
    .line 178
    invoke-direct {v2, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 179
    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 186
    .line 187
    .line 188
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    invoke-static {p1, p0}, Ll/ouq0;->o(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 193
    .line 194
    .line 195
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 196
    .line 197
    .line 198
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 199
    .line 200
    .line 201
    goto :goto_3

    .line 202
    :catchall_2
    move-exception p0

    .line 203
    goto :goto_4

    .line 204
    :goto_2
    :try_start_6
    new-instance v2, Ljava/lang/StringBuilder;

    .line 205
    .line 206
    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 207
    .line 208
    .line 209
    invoke-virtual {p1}, Lcom/xiaomi/push/gj;->d()Ljava/lang/String;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    invoke-virtual {v2, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 214
    .line 215
    .line 216
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object p1

    .line 220
    invoke-static {p1, p0}, Ll/ouq0;->o(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_3

    .line 221
    .line 222
    .line 223
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 224
    .line 225
    .line 226
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 227
    .line 228
    .line 229
    :goto_3
    return-void

    .line 230
    :catchall_3
    move-exception p0

    .line 231
    move-object v0, v1

    .line 232
    :goto_4
    invoke-static {v5}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 233
    .line 234
    .line 235
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 236
    .line 237
    .line 238
    throw p0
.end method
