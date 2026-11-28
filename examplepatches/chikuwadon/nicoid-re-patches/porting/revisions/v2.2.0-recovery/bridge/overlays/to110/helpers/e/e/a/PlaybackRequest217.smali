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
    :goto_0
    invoke-static {v8}, Le/e/a/PlaybackRequest217;->validate(Ljava/net/URL;)V

    .line 25
    invoke-static {v8, v2}, Lnicoid/network238/ApiConnection254;->openPlayback(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;

    move-result-object v11

    check-cast v11, Ljava/net/HttpURLConnection;

    const/16 v12, 0x1f40

    .line 27
    :try_start_0
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

    if-eqz v5, :cond_0

    .line 31
    invoke-virtual {v5}, Ljava/lang/String;->isEmpty()Z

    move-result v12

    if-nez v12, :cond_0

    const-string v12, "Cookie"

    invoke-virtual {v11, v12, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    :cond_0
    if-eqz v2, :cond_6

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

    if-eqz v13, :cond_1

    const-string v13, "application/json;charset=UTF-8"

    goto :goto_1

    :cond_1
    const-string v13, "application/json"

    :goto_1
    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 35
    const-string v12, "X-Request-With"

    invoke-virtual {v11, v12, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string v12, "X-Client-Os-Type"

    const-string v13, "others"

    invoke-virtual {v11, v12, v13}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    if-eqz v0, :cond_2

    .line 36
    invoke-virtual {v8}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v12

    invoke-virtual {v3, v12}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v12

    if-eqz v12, :cond_2

    const-string v12, "X-Access-Right-Key"

    invoke-virtual {v11, v12, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    :cond_2
    sget-object v12, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {v2, v12}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object v12

    array-length v13, v12

    invoke-virtual {v11, v13}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_5

    .line 38
    :try_start_1
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v13
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    :try_start_2
    invoke-virtual {v13, v12}, Ljava/io/OutputStream;->write([B)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v13, :cond_6

    :try_start_3
    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    goto :goto_2

    :catchall_0
    move-exception v0

    move-object v4, v0

    if-eqz v13, :cond_3

    invoke-virtual {v13}, Ljava/io/OutputStream;->close()V

    :cond_3
    throw v4
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :catchall_1
    move-exception v0

    if-eqz v4, :cond_5

    if-eq v4, v0, :cond_4

    :try_start_4
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_4
    move-object v0, v4

    :cond_5
    throw v0

    .line 40
    :cond_6
    :goto_2
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v12

    const/16 v13, 0x12f

    const/16 v14, 0x12e

    const/16 v15, 0x12d

    if-eq v12, v15, :cond_13

    if-eq v12, v14, :cond_13

    if-eq v12, v13, :cond_13

    const/16 v14, 0x133

    if-eq v12, v14, :cond_13

    const/16 v14, 0x134

    if-eq v12, v14, :cond_13

    .line 48
    new-array v0, v6, [Ljava/lang/Object;

    aput-object v11, v0, v9

    invoke-virtual {v7, v4, v0}, Ljava/lang/reflect/Method;->invoke(Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;

    const/16 v0, 0x190

    if-lt v12, v0, :cond_7

    .line 49
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v0

    goto :goto_3

    :cond_7
    move-object v0, v4

    :goto_3
    if-nez v0, :cond_8

    .line 50
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_5

    :cond_8
    move-object v1, v0

    .line 51
    :try_start_5
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 52
    :try_start_6
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->getContentLengthLong()J

    move-result-wide v5
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    const-wide/32 v7, 0x2000000

    const-string v0, "Playback API response too large"

    cmp-long v3, v5, v7

    if-gtz v3, :cond_d

    const/16 v3, 0x2000

    .line 53
    :try_start_7
    new-array v3, v3, [B

    .line 54
    :goto_4
    invoke-virtual {v1, v3}, Ljava/io/InputStream;->read([B)I

    move-result v5

    const/4 v6, -0x1

    if-ne v5, v6, :cond_a

    .line 59
    const-string v0, "UTF-8"

    invoke-virtual {v2, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_2

    .line 60
    :try_start_8
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_3

    if-eqz v1, :cond_9

    :try_start_9
    invoke-virtual {v1}, Ljava/io/InputStream;->close()V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_4

    .line 61
    :cond_9
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object v0

    .line 55
    :cond_a
    :try_start_a
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v6

    if-nez v6, :cond_c

    .line 56
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    add-int/2addr v6, v5

    const/high16 v7, 0x2000000

    if-gt v6, v7, :cond_b

    .line 57
    invoke-virtual {v2, v3, v9, v5}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_4

    .line 56
    :cond_b
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3

    .line 55
    :cond_c
    new-instance v0, Ljava/io/InterruptedIOException;

    const-string v3, "Playback API cancelled"

    invoke-direct {v0, v3}, Ljava/io/InterruptedIOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 52
    :cond_d
    new-instance v3, Ljava/io/IOException;

    invoke-direct {v3, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v3
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_2

    :catchall_2
    move-exception v0

    move-object v4, v0

    .line 60
    :try_start_b
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v4
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_3

    :catchall_3
    move-exception v0

    if-nez v4, :cond_e

    move-object v4, v0

    goto :goto_5

    :cond_e
    if-eq v4, v0, :cond_f

    :try_start_c
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_f
    :goto_5
    if-eqz v1, :cond_10

    invoke-virtual {v1}, Ljava/io/InputStream;->close()V

    :cond_10
    throw v4
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_4

    :catchall_4
    move-exception v0

    if-eqz v4, :cond_12

    if-eq v4, v0, :cond_11

    :try_start_d
    invoke-virtual {v4, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_11
    move-object v0, v4

    :cond_12
    throw v0

    .line 42
    :cond_13
    const-string v14, "Location"

    invoke-virtual {v11, v14}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v14

    const/4 v4, 0x5

    if-ge v10, v4, :cond_16

    if-eqz v14, :cond_16

    .line 44
    new-instance v4, Ljava/net/URL;

    invoke-direct {v4, v8, v14}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V

    invoke-static {v4}, Le/e/a/PlaybackRequest217;->validate(Ljava/net/URL;)V
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_5

    if-eq v12, v13, :cond_14

    if-eq v12, v15, :cond_14

    const/16 v8, 0x12e

    if-ne v12, v8, :cond_15

    :cond_14
    const/4 v2, 0x0

    .line 61
    :cond_15
    invoke-virtual {v11}, Ljava/net/HttpURLConnection;->disconnect()V

    add-int/lit8 v10, v10, 0x1

    move-object v8, v4

    const/4 v4, 0x0

    goto/16 :goto_0

    .line 43
    :cond_16
    :try_start_e
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Playback API redirect failed"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_5

    :catchall_5
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

    if-eqz v1, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object p0

    if-nez p0, :cond_1

    .line 15
    const-string p0, "nicovideo.jp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const-string p0, ".nicovideo.jp"

    invoke-virtual {v0, p0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_1

    :cond_0
    return-void

    .line 16
    :cond_1
    new-instance p0, Ljava/io/IOException;

    const-string v0, "Unsupported playback API URL"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
