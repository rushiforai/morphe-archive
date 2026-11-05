.class public final Le/e/a/PlaybackRequest217;
.super Ljava/lang/Object;
.source "PlaybackRequest217.java"


# static fields
.field private static final LIMIT:I = 0x2000000


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 11
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static request(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;
    .registers 20
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    move-object/from16 v0, p3

    .line 19
    const-string v1, "https://www.nicovideo.jp"

    new-instance v2, Ljava/net/URL;

    move-object/from16 v3, p1

    invoke-direct {v2, v3}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-static {v2}, Le/e/a/PlaybackRequest217;->validate(Ljava/net/URL;)V

    invoke-virtual {v2}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v3

    .line 20
    invoke-virtual/range {p0 .. p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v4

    const-string v5, "I"

    invoke-virtual {v4, v5}, Ljava/lang/Class;->getField(Ljava/lang/String;)Ljava/lang/reflect/Field;

    move-result-object v4

    move-object/from16 v5, p0

    invoke-virtual {v4, v5}, Ljava/lang/reflect/Field;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v4

    .line 21
    const-string v5, "e.e.a.v0"

    invoke-static {v5}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v5

    const/4 v6, 0x1

    new-array v7, v6, [Ljava/lang/Class;

    const-string v8, "org.apache.http.client.CookieStore"

    invoke-static {v8}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v8

    const/4 v9, 0x0

    aput-object v8, v7, v9

    const-string v8, "a"

    invoke-virtual {v5, v8, v7}, Ljava/lang/Class;->getMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v5

    new-array v7, v6, [Ljava/lang/Object;

    aput-object v4, v7, v9

    const/4 v4, 0x0

    invoke-virtual {v5, v4, v7}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/String;

    .line 22
    const-string v7, "e.e.a.ModernPlayback"

    invoke-static {v7}, Ljava/lang/Class;->forName(Ljava/lang/String;)Ljava/lang/Class;

    move-result-object v7

    new-array v8, v6, [Ljava/lang/Class;

    const-class v10, Ljava/net/HttpURLConnection;

    aput-object v10, v8, v9

    const-string v10, "captureCookie"

    invoke-virtual {v7, v10, v8}, Ljava/lang/Class;->getDeclaredMethod(Ljava/lang/String;[Ljava/lang/Class;)Ljava/lang/reflect/Method;

    move-result-object v7

    invoke-virtual {v7, v6}, Ljava/lang/reflect/Method;->setAccessible(Z)V

    move-object v8, v2

    const/4 v10, 0x0

    move-object/from16 v2, p2

    .line 24
    :goto_5e
    invoke-static {v8}, Le/e/a/PlaybackRequest217;->validate(Ljava/net/URL;)V

    .line 25
    invoke-virtual {v8}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v11

    check-cast v11, Ljava/net/HttpURLConnection;

    const/16 v12, 0x1f40

    .line 27
    :try_start_69
    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-virtual {v11, v9}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 28
    const-string v12, "User-Agent"

    const-string v13, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    const-string v12, "X-Frontend-Id"

    const-string v13, "6"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "X-Frontend-Version"

    const-string v13, "0"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    const-string v12, "Origin"

    invoke-virtual {v11, v12, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "Referer"

    const-string v13, "https://www.nicovideo.jp/"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v5, :cond_a0

    .line 31
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_a0

    const-string v12, "Cookie"

    invoke-virtual {v11, v12, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_a0
    if-eqz v2, :cond_10d

    .line 33
    const-string v12, "POST"

    invoke-virtual {v11, v12}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    invoke-virtual {v11, v6}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string v12, "Accept"

    const-string v13, "application/json;charset=utf-8"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 34
    const-string v12, "Content-Type"

    invoke-virtual {v8}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object v13

    const-string v14, "/v1/threads"

    invoke-virtual {v13, v14}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v13

    if-eqz v13, :cond_c2

    const-string v13, "application/json;charset=UTF-8"

    goto :goto_c4

    :cond_c2
    const-string v13, "application/json"

    :goto_c4
    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v12, "X-Request-With"

    invoke-virtual {v11, v12, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "X-Client-Os-Type"

    const-string v13, "others"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_e4

    .line 36
    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_e4

    const-string v12, "X-Access-Right-Key"

    invoke-virtual {v11, v12, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    :cond_e4
    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v12}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v12

    array-length v13, v12

    invoke-virtual {v11, v13}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_ee
    .catchall {:try_start_69 .. :try_end_ee} :catchall_1e4

    .line 38
    :try_start_ee
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13
    :try_end_f2
    .catchall {:try_start_ee .. :try_end_f2} :catchall_103

    :try_start_f2
    invoke-virtual {v13, v12}, Ljava/io/OutputStream;->write([B)V
    :try_end_f5
    .catchall {:try_start_f2 .. :try_end_f5} :catchall_fb

    if-eqz v13, :cond_10d

    :try_start_f7
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    goto :goto_10d

    :catchall_fb
    move-exception v0

    move-object v4, v0

    if-eqz v13, :cond_102

    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    :cond_102
    throw v4
    :try_end_103
    .catchall {:try_start_f7 .. :try_end_103} :catchall_103

    :catchall_103
    move-exception v0

    if-eqz v4, :cond_10c

    if-eq v4, v0, :cond_10b

    :try_start_108
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_10b
    move-object v0, v4

    :cond_10c
    throw v0

    .line 40
    :cond_10d
    :goto_10d
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    const/16 v13, 0x12f

    const/16 v14, 0x12e

    const/16 v15, 0x12d

    if-eq v12, v15, :cond_1b7

    if-eq v12, v14, :cond_1b7

    if-eq v12, v13, :cond_1b7

    const/16 v14, 0x133

    if-eq v12, v14, :cond_1b7

    const/16 v14, 0x134

    if-eq v12, v14, :cond_1b7

    .line 48
    new-array v0, v6, [Ljava/lang/Object;

    aput-object v11, v0, v9

    invoke-virtual {v7, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v0, 0x190

    if-lt v12, v0, :cond_135

    .line 49
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_136

    :cond_135
    move-object v0, v4

    :goto_136
    if-nez v0, :cond_13c

    .line 50
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_13c
    .catchall {:try_start_108 .. :try_end_13c} :catchall_1e4

    :cond_13c
    move-object v1, v0

    .line 51
    :try_start_13d
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_142
    .catchall {:try_start_13d .. :try_end_142} :catchall_19d

    .line 52
    :try_start_142
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v5
    :try_end_146
    .catchall {:try_start_142 .. :try_end_146} :catchall_197

    const-wide/32 v7, 0x2000000

    const-string v0, "Playback API response too large"

    cmp-long v3, v5, v7

    if-gtz v3, :cond_191

    const/16 v3, 0x2000

    .line 53
    :try_start_151
    new-array v3, v3, [B

    .line 54
    :goto_153
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_16c

    .line 59
    const-string v0, "UTF-8"

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_160
    .catchall {:try_start_151 .. :try_end_160} :catchall_197

    .line 60
    :try_start_160
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_163
    .catchall {:try_start_160 .. :try_end_163} :catchall_19d

    if-eqz v1, :cond_168

    :try_start_165
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_168
    .catchall {:try_start_165 .. :try_end_168} :catchall_1ad

    .line 61
    :cond_168
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    .line 55
    :cond_16c
    :try_start_16c
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_189

    .line 56
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x2000000

    if-gt v6, v7, :cond_183

    .line 57
    invoke-virtual {v2, v3, v9, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_153

    .line 56
    :cond_183
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 55
    :cond_189
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v3, "Playback API cancelled"

    invoke-direct {v0, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_191
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_197
    .catchall {:try_start_16c .. :try_end_197} :catchall_197

    :catchall_197
    move-exception v0

    move-object v4, v0

    .line 60
    :try_start_199
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v4
    :try_end_19d
    .catchall {:try_start_199 .. :try_end_19d} :catchall_19d

    :catchall_19d
    move-exception v0

    if-nez v4, :cond_1a2

    move-object v4, v0

    goto :goto_1a7

    :cond_1a2
    if-eq v4, v0, :cond_1a7

    :try_start_1a4
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1a7
    :goto_1a7
    if-eqz v1, :cond_1ac

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_1ac
    throw v4
    :try_end_1ad
    .catchall {:try_start_1a4 .. :try_end_1ad} :catchall_1ad

    :catchall_1ad
    move-exception v0

    if-eqz v4, :cond_1b6

    if-eq v4, v0, :cond_1b5

    :try_start_1b2
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_1b5
    move-object v0, v4

    :cond_1b6
    throw v0

    .line 42
    :cond_1b7
    const-string v14, "Location"

    invoke-virtual {v11, v14}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const/4 v4, 0x5

    if-ge v10, v4, :cond_1dc

    if-eqz v14, :cond_1dc

    .line 44
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v8, v14}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-static {v4}, Le/e/a/PlaybackRequest217;->validate(Ljava/net/URL;)V
    :try_end_1ca
    .catchall {:try_start_1b2 .. :try_end_1ca} :catchall_1e4

    if-eq v12, v13, :cond_1d2

    if-eq v12, v15, :cond_1d2

    const/16 v8, 0x12e

    if-ne v12, v8, :cond_1d3

    :cond_1d2
    const/4 v2, 0x0

    .line 61
    :cond_1d3
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    add-int/lit8 v10, v10, 0x1

    move-object v8, v4

    const/4 v4, 0x0

    goto/16 :goto_5e

    .line 43
    :cond_1dc
    :try_start_1dc
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Playback API redirect failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_1e4
    .catchall {:try_start_1dc .. :try_end_1e4} :catchall_1e4

    :catchall_1e4
    move-exception v0

    .line 61
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    throw v0
.end method

.method private static validate(Ljava/net/URL;)V
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 13
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 14
    const-string v1, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2d

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_2d

    .line 15
    const-string p0, "nicovideo.jp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_2c

    const-string p0, ".nicovideo.jp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_2d

    :cond_2c
    return-void

    .line 16
    :cond_2d
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Unsupported playback API URL"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
