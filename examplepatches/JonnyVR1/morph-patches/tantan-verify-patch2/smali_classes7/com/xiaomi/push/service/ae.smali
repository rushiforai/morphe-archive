.class public Lcom/xiaomi/push/service/ae;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/xiaomi/push/service/ae$a;,
        Lcom/xiaomi/push/service/ae$b;
    }
.end annotation


# static fields
.field private static a:J

.field private static a:Z

.field private static b:J


# direct methods
.method static constructor <clinit>()V
    .locals 0

    return-void
.end method

.method private static a(Landroid/content/Context;Ljava/io/InputStream;)I
    .locals 3

    .line 291
    new-instance v0, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v0}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v1, 0x1

    .line 292
    iput-boolean v1, v0, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    const/4 v2, 0x0

    .line 293
    invoke-static {p1, v2, v0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 294
    iget p1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    const/4 v2, -0x1

    if-eq p1, v2, :cond_2

    iget p1, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-ne p1, v2, :cond_0

    goto :goto_0

    .line 295
    :cond_0
    invoke-virtual {p0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->densityDpi:I

    int-to-float p0, p0

    const/high16 p1, 0x43200000    # 160.0f

    div-float/2addr p0, p1

    const/high16 p1, 0x42400000    # 48.0f

    mul-float/2addr p0, p1

    .line 296
    invoke-static {p0}, Ljava/lang/Math;->round(F)I

    move-result p0

    .line 297
    iget p1, v0, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-le p1, p0, :cond_1

    iget v0, v0, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-le v0, p0, :cond_1

    .line 298
    div-int/2addr p1, p0

    div-int/2addr v0, p0

    invoke-static {p1, v0}, Ljava/lang/Math;->min(II)I

    move-result p0

    return p0

    :cond_1
    return v1

    .line 299
    :cond_2
    :goto_0
    const-string p0, "decode dimension failed for bitmap."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return v1
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 3

    .line 276
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    move-result-object p1

    const/4 v0, 0x0

    .line 277
    :try_start_0
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object v1

    invoke-virtual {v1, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object v1
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_2
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 278
    :try_start_1
    invoke-static {p0, v1}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;Ljava/io/InputStream;)I

    move-result v2

    .line 279
    invoke-virtual {p0}, Landroid/content/Context;->getContentResolver()Landroid/content/ContentResolver;

    move-result-object p0

    invoke-virtual {p0, p1}, Landroid/content/ContentResolver;->openInputStream(Landroid/net/Uri;)Ljava/io/InputStream;

    move-result-object p0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 280
    :try_start_2
    new-instance p1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {p1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 281
    iput v2, p1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 282
    invoke-static {p0, v0, p1}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;Landroid/graphics/Rect;Landroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p1
    :try_end_2
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 283
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 284
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-object p1

    :catchall_0
    move-exception p1

    move-object v0, p0

    goto :goto_1

    :catch_0
    move-exception p1

    goto :goto_0

    :catchall_1
    move-exception p1

    goto :goto_1

    :catch_1
    move-exception p1

    move-object p0, v0

    goto :goto_0

    :catchall_2
    move-exception p1

    move-object v1, v0

    goto :goto_1

    :catch_2
    move-exception p1

    move-object p0, v0

    move-object v1, p0

    .line 285
    :goto_0
    :try_start_3
    invoke-static {p1}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 286
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 287
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-object v0

    .line 288
    :goto_1
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 289
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 290
    throw p1
.end method

.method private static a(Ljava/lang/String;Z)Lcom/xiaomi/push/service/ae$a;
    .locals 10

    .line 1
    const-string v0, "Invalid Http Response Code "

    .line 2
    .line 3
    const-string v1, "Bitmap size is too big, max size is 102400  contentLen size is "

    .line 4
    .line 5
    const/4 v2, 0x0

    .line 6
    :try_start_0
    new-instance v3, Ljava/net/URL;

    .line 7
    .line 8
    invoke-direct {v3, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {v3}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    .line 12
    .line 13
    .line 14
    move-result-object v3

    .line 15
    check-cast v3, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/net/SocketTimeoutException; {:try_start_0 .. :try_end_0} :catch_4
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_3
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 16
    .line 17
    const/16 v4, 0x1f40

    .line 18
    .line 19
    :try_start_1
    invoke-virtual {v3, v4}, Ljava/net/URLConnection;->setConnectTimeout(I)V

    .line 20
    .line 21
    .line 22
    const/16 v4, 0x4e20

    .line 23
    .line 24
    invoke-virtual {v3, v4}, Ljava/net/URLConnection;->setReadTimeout(I)V

    .line 25
    .line 26
    .line 27
    const-string v4, "User-agent"

    .line 28
    .line 29
    const-string v5, "Mozilla/5.0 (Linux; U;) AppleWebKit/537.36 (KHTML, like Gecko) Version/4.0 Chrome/71.0.3578.141 Mobile Safari/537.36 XiaoMi/MiuiBrowser"

    .line 30
    .line 31
    invoke-virtual {v3, v4, v5}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    .line 33
    .line 34
    invoke-virtual {v3}, Ljava/net/URLConnection;->connect()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v3}, Ljava/net/URLConnection;->getContentLength()I

    .line 38
    .line 39
    .line 40
    move-result v4

    .line 41
    const v5, 0x19000

    .line 42
    .line 43
    .line 44
    if-eqz p1, :cond_0

    .line 45
    .line 46
    if-le v4, v5, :cond_0

    .line 47
    .line 48
    new-instance p1, Ljava/lang/StringBuilder;

    .line 49
    .line 50
    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 51
    .line 52
    .line 53
    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 54
    .line 55
    .line 56
    const-string v0, " from url "

    .line 57
    .line 58
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    .line 60
    .line 61
    const/4 v0, 0x3

    .line 62
    invoke-static {p0, v0}, Ll/bvq0;->c(Ljava/lang/String;I)Ljava/lang/String;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_1
    .catch Ljava/net/SocketTimeoutException; {:try_start_1 .. :try_end_1} :catch_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 74
    .line 75
    .line 76
    :goto_0
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 77
    .line 78
    .line 79
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 80
    .line 81
    .line 82
    return-object v2

    .line 83
    :catchall_0
    move-exception p0

    .line 84
    goto/16 :goto_8

    .line 85
    .line 86
    :catch_0
    move-exception p0

    .line 87
    move-object v0, v2

    .line 88
    goto/16 :goto_4

    .line 89
    .line 90
    :catch_1
    move-object v0, v2

    .line 91
    goto/16 :goto_6

    .line 92
    .line 93
    :cond_0
    :try_start_2
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    .line 94
    .line 95
    .line 96
    move-result v1

    .line 97
    const/16 v4, 0xc8

    .line 98
    .line 99
    if-eq v1, v4, :cond_1

    .line 100
    .line 101
    new-instance p1, Ljava/lang/StringBuilder;

    .line 102
    .line 103
    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    const-string v0, " received"

    .line 110
    .line 111
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 112
    .line 113
    .line 114
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_1
    invoke-virtual {v3}, Ljava/net/URLConnection;->getInputStream()Ljava/io/InputStream;

    .line 123
    .line 124
    .line 125
    move-result-object v0
    :try_end_2
    .catch Ljava/net/SocketTimeoutException; {:try_start_2 .. :try_end_2} :catch_1
    .catch Ljava/io/IOException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 126
    :try_start_3
    new-instance v1, Ljava/io/ByteArrayOutputStream;

    .line 127
    .line 128
    invoke-direct {v1}, Ljava/io/ByteArrayOutputStream;-><init>()V

    .line 129
    .line 130
    .line 131
    if-eqz p1, :cond_2

    .line 132
    .line 133
    move p1, v5

    .line 134
    goto :goto_1

    .line 135
    :cond_2
    const p1, 0x1f4000

    .line 136
    .line 137
    .line 138
    :goto_1
    const/16 v4, 0x400

    .line 139
    .line 140
    new-array v6, v4, [B

    .line 141
    .line 142
    :goto_2
    if-lez p1, :cond_4

    .line 143
    .line 144
    const/4 v7, 0x0

    .line 145
    invoke-virtual {v0, v6, v7, v4}, Ljava/io/InputStream;->read([BII)I

    .line 146
    .line 147
    .line 148
    move-result v8

    .line 149
    const/4 v9, -0x1

    .line 150
    if-ne v8, v9, :cond_3

    .line 151
    .line 152
    goto :goto_3

    .line 153
    :cond_3
    sub-int/2addr p1, v8

    .line 154
    invoke-virtual {v1, v6, v7, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    .line 155
    .line 156
    .line 157
    goto :goto_2

    .line 158
    :catchall_1
    move-exception p0

    .line 159
    move-object v2, v0

    .line 160
    goto :goto_8

    .line 161
    :catch_2
    move-exception p0

    .line 162
    goto :goto_4

    .line 163
    :cond_4
    :goto_3
    if-gtz p1, :cond_5

    .line 164
    .line 165
    const-string p1, "length 102400 exhausted."

    .line 166
    .line 167
    invoke-static {p1}, Ll/ouq0;->m(Ljava/lang/String;)V

    .line 168
    .line 169
    .line 170
    new-instance p1, Lcom/xiaomi/push/service/ae$a;

    .line 171
    .line 172
    invoke-direct {p1, v2, v5}, Lcom/xiaomi/push/service/ae$a;-><init>([BI)V
    :try_end_3
    .catch Ljava/net/SocketTimeoutException; {:try_start_3 .. :try_end_3} :catch_5
    .catch Ljava/io/IOException; {:try_start_3 .. :try_end_3} :catch_2
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 173
    .line 174
    .line 175
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 176
    .line 177
    .line 178
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 179
    .line 180
    .line 181
    return-object p1

    .line 182
    :cond_5
    :try_start_4
    invoke-virtual {v1}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    new-instance v1, Lcom/xiaomi/push/service/ae$a;

    .line 187
    .line 188
    array-length v4, p1

    .line 189
    invoke-direct {v1, p1, v4}, Lcom/xiaomi/push/service/ae$a;-><init>([BI)V
    :try_end_4
    .catch Ljava/net/SocketTimeoutException; {:try_start_4 .. :try_end_4} :catch_5
    .catch Ljava/io/IOException; {:try_start_4 .. :try_end_4} :catch_2
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 190
    .line 191
    .line 192
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 196
    .line 197
    .line 198
    return-object v1

    .line 199
    :catchall_2
    move-exception p0

    .line 200
    move-object v3, v2

    .line 201
    goto :goto_8

    .line 202
    :catch_3
    move-exception p0

    .line 203
    move-object v0, v2

    .line 204
    move-object v3, v0

    .line 205
    goto :goto_4

    .line 206
    :catch_4
    move-object v0, v2

    .line 207
    move-object v3, v0

    .line 208
    goto :goto_6

    .line 209
    :goto_4
    :try_start_5
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 210
    .line 211
    .line 212
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 213
    .line 214
    .line 215
    if-eqz v3, :cond_6

    .line 216
    .line 217
    :goto_5
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 218
    .line 219
    .line 220
    goto :goto_7

    .line 221
    :catch_5
    :goto_6
    :try_start_6
    new-instance p1, Ljava/lang/StringBuilder;

    .line 222
    .line 223
    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    .line 224
    .line 225
    .line 226
    const-string v1, "Connect timeout to "

    .line 227
    .line 228
    invoke-virtual {p1, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 229
    .line 230
    .line 231
    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 232
    .line 233
    .line 234
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 239
    .line 240
    .line 241
    invoke-static {v0}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 242
    .line 243
    .line 244
    if-eqz v3, :cond_6

    .line 245
    .line 246
    goto :goto_5

    .line 247
    :cond_6
    :goto_7
    return-object v2

    .line 248
    :goto_8
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 249
    .line 250
    .line 251
    if-eqz v3, :cond_7

    .line 252
    .line 253
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 254
    .line 255
    .line 256
    :cond_7
    throw p0
.end method

.method public static a(Landroid/content/Context;Ljava/lang/String;Z)Lcom/xiaomi/push/service/ae$b;
    .locals 6

    .line 257
    new-instance v0, Lcom/xiaomi/push/service/ae$b;

    const-wide/16 v1, 0x0

    const/4 v3, 0x0

    invoke-direct {v0, v3, v1, v2}, Lcom/xiaomi/push/service/ae$b;-><init>(Landroid/graphics/Bitmap;J)V

    .line 258
    :try_start_0
    invoke-static {p0, p1}, Lcom/xiaomi/push/service/ae;->b(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;

    move-result-object v1

    if-eqz v1, :cond_0

    .line 259
    iput-object v1, v0, Lcom/xiaomi/push/service/ae$b;->a:Landroid/graphics/Bitmap;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 260
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-object v0

    :catchall_0
    move-exception p0

    goto :goto_2

    :catch_0
    move-exception p0

    goto :goto_1

    .line 261
    :cond_0
    :try_start_1
    invoke-static {p1, p2}, Lcom/xiaomi/push/service/ae;->a(Ljava/lang/String;Z)Lcom/xiaomi/push/service/ae$a;

    move-result-object v1
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_0
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    if-nez v1, :cond_1

    .line 262
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-object v0

    .line 263
    :cond_1
    :try_start_2
    iget v2, v1, Lcom/xiaomi/push/service/ae$a;->a:I

    int-to-long v4, v2

    iput-wide v4, v0, Lcom/xiaomi/push/service/ae$b;->a:J

    .line 264
    iget-object v2, v1, Lcom/xiaomi/push/service/ae$a;->a:[B

    if-eqz v2, :cond_3

    const/4 v4, 0x0

    if-eqz p2, :cond_2

    .line 265
    new-instance p2, Ljava/io/ByteArrayInputStream;

    invoke-direct {p2, v2}, Ljava/io/ByteArrayInputStream;-><init>([B)V
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 266
    :try_start_3
    invoke-static {p0, p2}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;Ljava/io/InputStream;)I

    move-result v3

    .line 267
    new-instance v5, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v5}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    .line 268
    iput v3, v5, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 269
    array-length v3, v2

    invoke-static {v2, v4, v3, v5}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object v2

    iput-object v2, v0, Lcom/xiaomi/push/service/ae$b;->a:Landroid/graphics/Bitmap;
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    move-object v3, p2

    goto :goto_0

    :catchall_1
    move-exception p0

    move-object v3, p2

    goto :goto_2

    :catch_1
    move-exception p0

    move-object v3, p2

    goto :goto_1

    .line 270
    :cond_2
    :try_start_4
    array-length p2, v2

    invoke-static {v2, v4, p2}, Landroid/graphics/BitmapFactory;->decodeByteArray([BII)Landroid/graphics/Bitmap;

    move-result-object p2

    iput-object p2, v0, Lcom/xiaomi/push/service/ae$b;->a:Landroid/graphics/Bitmap;

    .line 271
    :cond_3
    :goto_0
    iget-object p2, v1, Lcom/xiaomi/push/service/ae$a;->a:[B

    invoke-static {p0, p2, p1}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;[BLjava/lang/String;)V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_0
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    .line 272
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-object v0

    .line 273
    :goto_1
    :try_start_5
    invoke-static {p0}, Ll/ouq0;->q(Ljava/lang/Throwable;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 274
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-object v0

    :goto_2
    invoke-static {v3}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 275
    throw p0
.end method

.method private static a(Landroid/content/Context;)Ljava/lang/String;
    .locals 1

    .line 350
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {p0}, Landroid/content/Context;->getCacheDir()Ljava/io/File;

    move-result-object p0

    invoke-virtual {p0}, Ljava/io/File;->getPath()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    sget-object p0, Ljava/io/File;->separator:Ljava/lang/String;

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string p0, "mipush_icon"

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method private static declared-synchronized a(Landroid/content/Context;)V
    .locals 11

    const-class v0, Lcom/xiaomi/push/service/ae;

    monitor-enter v0

    .line 325
    :try_start_0
    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->b(Landroid/content/Context;)V

    .line 326
    sget-wide v1, Lcom/xiaomi/push/service/ae;->a:J

    const-wide/32 v3, 0x3c00000

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    .line 327
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v1

    sget-wide v3, Lcom/xiaomi/push/service/ae;->b:J
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    sub-long/2addr v1, v3

    const-wide/32 v3, 0x48190800

    cmp-long v1, v1, v3

    if-gez v1, :cond_0

    .line 328
    monitor-exit v0

    return-void

    :catchall_0
    move-exception p0

    goto/16 :goto_5

    .line 329
    :cond_0
    :try_start_1
    new-instance v1, Ljava/io/File;

    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 330
    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_1

    .line 331
    const-string p0, "The pic cache dir do not exists."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 332
    monitor-exit v0

    return-void

    :catchall_1
    move-exception p0

    goto :goto_3

    .line 333
    :cond_1
    :try_start_2
    invoke-virtual {v1}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_6

    .line 334
    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->a([Ljava/io/File;)V

    .line 335
    sget-wide v1, Lcom/xiaomi/push/service/ae;->a:J

    .line 336
    array-length v3, p0

    add-int/lit8 v3, v3, -0x1

    :goto_0
    const-wide/16 v4, 0x0

    if-ltz v3, :cond_5

    .line 337
    aget-object v6, p0, v3

    if-eqz v6, :cond_4

    const-wide/32 v7, 0x1e00000

    cmp-long v7, v1, v7

    if-gtz v7, :cond_3

    .line 338
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v7

    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v9

    sub-long/2addr v7, v9

    const-wide/32 v9, 0x337f9800

    cmp-long v7, v7, v9

    if-lez v7, :cond_2

    goto :goto_1

    .line 339
    :cond_2
    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    move-result-wide v6

    goto :goto_2

    .line 340
    :cond_3
    :goto_1
    invoke-virtual {v6}, Ljava/io/File;->length()J

    move-result-wide v4

    sub-long/2addr v1, v4

    .line 341
    invoke-virtual {v6}, Ljava/io/File;->delete()Z

    :cond_4
    add-int/lit8 v3, v3, -0x1

    goto :goto_0

    :cond_5
    move-wide v6, v4

    .line 342
    :goto_2
    invoke-static {v1, v2, v4, v5}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v1

    sput-wide v1, Lcom/xiaomi/push/service/ae;->a:J

    .line 343
    sput-wide v6, Lcom/xiaomi/push/service/ae;->b:J

    goto :goto_4

    .line 344
    :cond_6
    const-string p0, "The pic cache file list is null."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_4

    .line 345
    :goto_3
    :try_start_3
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "Clear pic cache error: "

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 346
    :goto_4
    monitor-exit v0

    return-void

    :goto_5
    :try_start_4
    monitor-exit v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_0

    throw p0
.end method

.method private static a(Landroid/content/Context;[BLjava/lang/String;)V
    .locals 7

    .line 300
    const-string v0, "Save pic error: "

    if-nez p1, :cond_0

    .line 301
    const-string p0, "cannot save small icon cause bitmap is null"

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V

    return-void

    .line 302
    :cond_0
    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;)V

    const/4 v1, 0x0

    .line 303
    :try_start_0
    new-instance v2, Ljava/io/File;

    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v2, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 304
    invoke-virtual {v2}, Ljava/io/File;->exists()Z

    move-result p0

    if-nez p0, :cond_1

    .line 305
    invoke-virtual {v2}, Ljava/io/File;->mkdirs()Z

    goto :goto_0

    :catchall_0
    move-exception p0

    move-object p2, v1

    goto/16 :goto_3

    :catch_0
    move-exception p0

    move-object p2, v1

    goto :goto_2

    .line 306
    :cond_1
    :goto_0
    new-instance p0, Ljava/io/File;

    invoke-static {p2}, Ll/bvq0;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-direct {p0, v2, p2}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    .line 307
    invoke-virtual {p0}, Ljava/io/File;->exists()Z

    move-result p2

    if-nez p2, :cond_2

    .line 308
    invoke-virtual {p0}, Ljava/io/File;->createNewFile()Z

    .line 309
    :cond_2
    new-instance p2, Ljava/io/FileOutputStream;

    invoke-direct {p2, p0}, Ljava/io/FileOutputStream;-><init>(Ljava/io/File;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 310
    :try_start_1
    new-instance v2, Ljava/io/BufferedOutputStream;

    invoke-direct {v2, p2}, Ljava/io/BufferedOutputStream;-><init>(Ljava/io/OutputStream;)V
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_2
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 311
    :try_start_2
    invoke-virtual {v2, p1}, Ljava/io/OutputStream;->write([B)V

    .line 312
    invoke-virtual {v2}, Ljava/io/BufferedOutputStream;->flush()V

    .line 313
    sget-wide v3, Lcom/xiaomi/push/service/ae;->a:J

    invoke-virtual {p0}, Ljava/io/File;->length()J

    move-result-wide v5

    add-long/2addr v3, v5

    sput-wide v3, Lcom/xiaomi/push/service/ae;->a:J

    .line 314
    sget-wide v3, Lcom/xiaomi/push/service/ae;->b:J

    const-wide/16 v5, 0x0

    cmp-long p1, v3, v5

    if-gtz p1, :cond_3

    .line 315
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide p0

    sput-wide p0, Lcom/xiaomi/push/service/ae;->b:J

    goto :goto_1

    :catchall_1
    move-exception p0

    move-object v1, v2

    goto :goto_3

    :catch_1
    move-exception p0

    move-object v1, v2

    goto :goto_2

    .line 316
    :cond_3
    invoke-virtual {p0}, Ljava/io/File;->lastModified()J

    move-result-wide p0

    invoke-static {v3, v4, p0, p1}, Ljava/lang/Math;->min(JJ)J

    move-result-wide p0

    sput-wide p0, Lcom/xiaomi/push/service/ae;->b:J
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 317
    :goto_1
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 318
    invoke-static {p2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-void

    :catchall_2
    move-exception p0

    goto :goto_3

    :catch_2
    move-exception p0

    .line 319
    :goto_2
    :try_start_3
    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 320
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 321
    invoke-static {p2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    return-void

    .line 322
    :goto_3
    invoke-static {v1}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 323
    invoke-static {p2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 324
    throw p0
.end method

.method private static a([Ljava/io/File;)V
    .locals 2

    if-eqz p0, :cond_0

    .line 347
    :try_start_0
    array-length v0, p0

    const/4 v1, 0x1

    if-le v0, v1, :cond_0

    .line 348
    new-instance v0, Lcom/xiaomi/push/service/ae$1;

    invoke-direct {v0}, Lcom/xiaomi/push/service/ae$1;-><init>()V

    invoke-static {p0, v0}, Ljava/util/Arrays;->sort([Ljava/lang/Object;Ljava/util/Comparator;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    return-void

    :catchall_0
    move-exception p0

    .line 349
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "Sort pic cache error: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V

    :cond_0
    return-void
.end method

.method private static declared-synchronized b(Landroid/content/Context;Ljava/lang/String;)Landroid/graphics/Bitmap;
    .locals 7

    const-string v0, "Load bmp from cache error: "

    const-class v1, Lcom/xiaomi/push/service/ae;

    monitor-enter v1

    const/4 v2, 0x0

    .line 137
    :try_start_0
    new-instance v3, Ljava/io/File;

    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p1}, Ll/bvq0;->b(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v3, p0, p1}, Ljava/io/File;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    .line 138
    invoke-virtual {v3}, Ljava/io/File;->exists()Z

    move-result p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    if-nez p0, :cond_0

    .line 139
    :try_start_1
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 140
    monitor-exit v1

    return-object v2

    :catchall_0
    move-exception p0

    goto :goto_2

    .line 141
    :cond_0
    :try_start_2
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide p0

    invoke-virtual {v3}, Ljava/io/File;->lastModified()J

    move-result-wide v4

    sub-long/2addr p0, v4

    const-wide/32 v4, 0x48190800

    cmp-long p0, p0, v4

    if-lez p0, :cond_1

    .line 142
    const-string p0, "The pic cache has expired."

    invoke-static {p0}, Ll/ouq0;->m(Ljava/lang/String;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 143
    :try_start_3
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 144
    monitor-exit v1

    return-object v2

    :catchall_1
    move-exception p0

    move-object p1, v2

    goto :goto_0

    .line 145
    :cond_1
    :try_start_4
    new-instance p0, Ljava/io/FileInputStream;

    invoke-direct {p0, v3}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 146
    :try_start_5
    invoke-static {p0}, Landroid/graphics/BitmapFactory;->decodeStream(Ljava/io/InputStream;)Landroid/graphics/Bitmap;

    move-result-object v2

    .line 147
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Ljava/io/File;->setLastModified(J)Z
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    .line 148
    :try_start_6
    invoke-static {p0}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    goto :goto_1

    :catchall_2
    move-exception p1

    move-object v6, v2

    move-object v2, p0

    move-object p0, p1

    move-object p1, v6

    .line 149
    :goto_0
    :try_start_7
    new-instance v3, Ljava/lang/StringBuilder;

    invoke-direct {v3, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v3, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 150
    :try_start_8
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    move-object v2, p1

    .line 151
    :goto_1
    monitor-exit v1

    return-object v2

    :catchall_3
    move-exception p0

    .line 152
    :try_start_9
    invoke-static {v2}, Ll/j6r0;->b(Ljava/io/Closeable;)V

    .line 153
    throw p0

    :goto_2
    monitor-exit v1
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_0

    throw p0
.end method

.method private static declared-synchronized b(Landroid/content/Context;)V
    .locals 11

    .line 1
    const-class v0, Lcom/xiaomi/push/service/ae;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    sget-boolean v1, Lcom/xiaomi/push/service/ae;->a:Z
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    monitor-exit v0

    .line 9
    return-void

    .line 10
    :cond_0
    const-wide/16 v1, 0x0

    .line 11
    .line 12
    :try_start_1
    sput-wide v1, Lcom/xiaomi/push/service/ae;->a:J

    .line 13
    .line 14
    sput-wide v1, Lcom/xiaomi/push/service/ae;->b:J
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    :try_start_2
    new-instance v4, Ljava/io/File;

    .line 18
    .line 19
    invoke-static {p0}, Lcom/xiaomi/push/service/ae;->a(Landroid/content/Context;)Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    invoke-direct {v4, p0}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {v4}, Ljava/io/File;->exists()Z

    .line 27
    .line 28
    .line 29
    move-result p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 30
    if-nez p0, :cond_1

    .line 31
    .line 32
    :try_start_3
    sput-boolean v3, Lcom/xiaomi/push/service/ae;->a:Z

    .line 33
    .line 34
    const-string p0, "Init pic cache finish."

    .line 35
    .line 36
    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 37
    .line 38
    .line 39
    monitor-exit v0

    .line 40
    return-void

    .line 41
    :catchall_0
    move-exception p0

    .line 42
    goto :goto_6

    .line 43
    :cond_1
    :try_start_4
    invoke-virtual {v4}, Ljava/io/File;->listFiles()[Ljava/io/File;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    if-eqz p0, :cond_3

    .line 48
    .line 49
    array-length v4, p0

    .line 50
    const/4 v5, 0x0

    .line 51
    :goto_0
    if-ge v5, v4, :cond_3

    .line 52
    .line 53
    aget-object v6, p0, v5

    .line 54
    .line 55
    sget-wide v7, Lcom/xiaomi/push/service/ae;->a:J

    .line 56
    .line 57
    invoke-virtual {v6}, Ljava/io/File;->length()J

    .line 58
    .line 59
    .line 60
    move-result-wide v9

    .line 61
    add-long/2addr v7, v9

    .line 62
    sput-wide v7, Lcom/xiaomi/push/service/ae;->a:J

    .line 63
    .line 64
    sget-wide v7, Lcom/xiaomi/push/service/ae;->b:J

    .line 65
    .line 66
    cmp-long v9, v7, v1

    .line 67
    .line 68
    if-gtz v9, :cond_2

    .line 69
    .line 70
    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    .line 71
    .line 72
    .line 73
    move-result-wide v6

    .line 74
    sput-wide v6, Lcom/xiaomi/push/service/ae;->b:J

    .line 75
    .line 76
    goto :goto_1

    .line 77
    :catchall_1
    move-exception p0

    .line 78
    goto :goto_3

    .line 79
    :cond_2
    invoke-virtual {v6}, Ljava/io/File;->lastModified()J

    .line 80
    .line 81
    .line 82
    move-result-wide v9

    .line 83
    invoke-static {v7, v8, v9, v10}, Ljava/lang/Math;->min(JJ)J

    .line 84
    .line 85
    .line 86
    move-result-wide v6

    .line 87
    sput-wide v6, Lcom/xiaomi/push/service/ae;->b:J
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 88
    .line 89
    :goto_1
    add-int/lit8 v5, v5, 0x1

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_3
    :try_start_5
    sput-boolean v3, Lcom/xiaomi/push/service/ae;->a:Z

    .line 93
    .line 94
    goto :goto_4

    .line 95
    :goto_2
    invoke-static {p0}, Ll/ouq0;->w(Ljava/lang/String;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 96
    .line 97
    .line 98
    goto :goto_5

    .line 99
    :goto_3
    :try_start_6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 100
    .line 101
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 102
    .line 103
    .line 104
    const-string v2, "Init pic cache error: "

    .line 105
    .line 106
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 107
    .line 108
    .line 109
    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 110
    .line 111
    .line 112
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object p0

    .line 116
    invoke-static {p0}, Ll/ouq0;->B(Ljava/lang/String;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    .line 117
    .line 118
    .line 119
    :try_start_7
    sput-boolean v3, Lcom/xiaomi/push/service/ae;->a:Z

    .line 120
    .line 121
    :goto_4
    const-string p0, "Init pic cache finish."
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_0

    .line 122
    .line 123
    goto :goto_2

    .line 124
    :goto_5
    monitor-exit v0

    .line 125
    return-void

    .line 126
    :catchall_2
    move-exception p0

    .line 127
    :try_start_8
    sput-boolean v3, Lcom/xiaomi/push/service/ae;->a:Z

    .line 128
    .line 129
    const-string v1, "Init pic cache finish."

    .line 130
    .line 131
    invoke-static {v1}, Ll/ouq0;->w(Ljava/lang/String;)V

    .line 132
    .line 133
    .line 134
    throw p0

    .line 135
    :goto_6
    monitor-exit v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_0

    .line 136
    throw p0
.end method
