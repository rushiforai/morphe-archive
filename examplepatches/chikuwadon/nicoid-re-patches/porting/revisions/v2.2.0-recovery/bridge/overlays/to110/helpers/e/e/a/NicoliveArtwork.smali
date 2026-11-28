.class final Le/e/a/NicoliveArtwork;
.super Ljava/lang/Object;
.source "NicoliveArtwork.java"


# static fields
.field private static final LIMIT:I = 0x200000


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 12
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static fetch(Ljava/lang/String;)Landroid/graphics/Bitmap;
    .registers 10

    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x3

    const/4 v3, 0x0

    if-lt v1, v2, :cond_0

    return-object v3

    .line 27
    :cond_0
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v2

    if-nez v2, :cond_16

    invoke-static {p0}, Le/e/a/NicoliveArtwork;->isTrusted(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_16

    .line 30
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 31
    invoke-virtual {p0}, Ljava/net/URI;->toURL()Ljava/net/URL;

    move-result-object v2

    invoke-static {v2}, Lnicoid/network238/ReadOnlyConnection239;->openHeaders(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_4

    .line 32
    :try_start_1
    invoke-virtual {v2, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/16 v4, 0x1f40

    .line 33
    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 34
    const-string v4, "User-Agent"

    const-string v5, "Mozilla/5.0"

    invoke-virtual {v2, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v4, "Referer"

    const-string v5, "https://live.nicovideo.jp/"

    invoke-virtual {v2, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    const/16 v5, 0x12c

    if-lt v4, v5, :cond_4

    const/16 v5, 0x190

    if-ge v4, v5, :cond_4

    .line 38
    const-string v4, "Location"

    invoke-virtual {v2, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    if-nez v4, :cond_2

    if-eqz v2, :cond_1

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_1
    return-object v3

    .line 40
    :cond_2
    :try_start_2
    invoke-virtual {p0, v4}, Ljava/net/URI;->resolve(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    invoke-virtual {p0}, Ljava/net/URI;->toString()Ljava/lang/String;

    move-result-object p0
    :try_end_2
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_2} :catch_1
    .catchall {:try_start_2 .. :try_end_2} :catchall_3

    if-eqz v2, :cond_3

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_3
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_4
    const/16 p0, 0xc8

    if-ne v4, p0, :cond_13

    .line 43
    :try_start_3
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v4

    const-wide/32 v6, 0x200000

    cmp-long p0, v4, v6

    if-gtz p0, :cond_13

    .line 44
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getContentType()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_6

    .line 45
    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    const-string v1, "image/"

    invoke-virtual {p0, v1}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_3
    .catch Ljava/lang/Exception; {:try_start_3 .. :try_end_3} :catch_1
    .catchall {:try_start_3 .. :try_end_3} :catchall_3

    if-nez p0, :cond_6

    if-eqz v2, :cond_5

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_5
    return-object v3

    .line 46
    :cond_6
    :try_start_4
    new-instance p0, Ljava/io/ByteArrayOutputStream;

    invoke-direct {p0}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_4
    .catch Ljava/lang/Exception; {:try_start_4 .. :try_end_4} :catch_1
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 47
    :try_start_5
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v1
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_2

    const/16 v4, 0x2000

    .line 48
    :try_start_6
    new-array v4, v4, [B

    .line 49
    :goto_1
    invoke-virtual {v1, v4}, Ljava/io/InputStream;->read([B)I

    move-result v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_0

    const/4 v6, -0x1

    if-ne v5, v6, :cond_c

    if-eqz v1, :cond_7

    .line 53
    :try_start_7
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 54
    :cond_7
    :try_start_8
    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    .line 55
    new-instance v1, Landroid/graphics/BitmapFactory$Options;

    invoke-direct {v1}, Landroid/graphics/BitmapFactory$Options;-><init>()V

    const/4 v4, 0x1

    .line 56
    iput-boolean v4, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 57
    array-length v5, p0

    invoke-static {p0, v0, v5, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    .line 58
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    if-lt v5, v4, :cond_a

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    if-lt v5, v4, :cond_a

    .line 59
    iput v4, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    .line 60
    :goto_2
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outWidth:I

    iget v6, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v5, v6

    const/16 v6, 0x200

    if-gt v5, v6, :cond_9

    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->outHeight:I

    iget v6, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    div-int/2addr v5, v6

    const/16 v6, 0x120

    if-gt v5, v6, :cond_9

    .line 63
    iput-boolean v0, v1, Landroid/graphics/BitmapFactory$Options;->inJustDecodeBounds:Z

    .line 64
    array-length v4, p0

    invoke-static {p0, v0, v4, v1}, Landroid/graphics/BitmapFactory;->decodeByteArray([BIILandroid/graphics/BitmapFactory$Options;)Landroid/graphics/Bitmap;

    move-result-object p0
    :try_end_8
    .catch Ljava/lang/Exception; {:try_start_8 .. :try_end_8} :catch_1
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-eqz v2, :cond_8

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_8
    return-object p0

    .line 61
    :cond_9
    :try_start_9
    iget v5, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I

    shl-int/2addr v5, v4

    iput v5, v1, Landroid/graphics/BitmapFactory$Options;->inSampleSize:I
    :try_end_9
    .catch Ljava/lang/Exception; {:try_start_9 .. :try_end_9} :catch_1
    .catchall {:try_start_9 .. :try_end_9} :catchall_3

    goto :goto_2

    :cond_a
    if-eqz v2, :cond_b

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_b
    return-object v3

    .line 50
    :cond_c
    :try_start_a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_d

    invoke-virtual {p0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x200000

    if-gt v6, v7, :cond_d

    .line 51
    invoke-virtual {p0, v4, v0, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_0

    goto :goto_1

    :cond_d
    if-eqz v1, :cond_e

    .line 53
    :try_start_b
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_2

    :cond_e
    if-eqz v2, :cond_f

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_f
    return-object v3

    :catchall_0
    move-exception p0

    if-eqz v1, :cond_10

    .line 53
    :try_start_c
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_10
    throw p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_1

    :catchall_1
    move-exception v0

    move-object v8, v0

    move-object v0, p0

    move-object p0, v8

    goto :goto_3

    :catchall_2
    move-exception p0

    move-object v0, v3

    :goto_3
    if-eqz v0, :cond_12

    if-eq v0, p0, :cond_11

    :try_start_d
    invoke-virtual {v0, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_11
    move-object p0, v0

    :cond_12
    throw p0
    :try_end_d
    .catch Ljava/lang/Exception; {:try_start_d .. :try_end_d} :catch_1
    .catchall {:try_start_d .. :try_end_d} :catchall_3

    :cond_13
    if-eqz v2, :cond_14

    .line 66
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_14
    return-object v3

    :catchall_3
    move-exception p0

    move-object v3, v2

    goto :goto_4

    :catchall_4
    move-exception p0

    :goto_4
    if-eqz v3, :cond_15

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_15
    throw p0

    :catch_0
    move-object v2, v3

    :catch_1
    if-eqz v2, :cond_16

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    :cond_16
    return-object v3
.end method

.method static isTrusted(Ljava/lang/String;)Z
    .registers 5

    const/4 v0, 0x0

    if-eqz p0, :cond_1

    .line 14
    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v1

    const/16 v2, 0x800

    if-gt v1, v2, :cond_1

    .line 16
    :try_start_0
    invoke-static {p0}, Ljava/net/URI;->create(Ljava/lang/String;)Ljava/net/URI;

    move-result-object p0

    .line 17
    invoke-virtual {p0}, Ljava/net/URI;->getHost()Ljava/lang/String;

    move-result-object v1

    .line 18
    const-string v2, "https"

    invoke-virtual {p0}, Ljava/net/URI;->getScheme()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v2, v3}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Ljava/net/URI;->getUserInfo()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_1

    .line 19
    sget-object p0, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v1, p0}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 20
    const-string v1, "nimg.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".nimg.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_0

    .line 21
    const-string v1, "nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, ".nicovideo.jp"

    invoke-virtual {p0, v1}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalArgumentException; {:try_start_0 .. :try_end_0} :catch_0

    if-nez p0, :cond_0

    return v0

    :cond_0
    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_1
    return v0
.end method
