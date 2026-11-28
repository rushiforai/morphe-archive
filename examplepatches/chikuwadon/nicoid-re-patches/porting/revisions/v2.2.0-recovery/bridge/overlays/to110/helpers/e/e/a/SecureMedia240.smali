.class public final Le/e/a/SecureMedia240;
.super Ljava/lang/Object;
.source "SecureMedia240.java"


# direct methods
.method private constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static connect(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/net/HttpURLConnection;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 11
    const/4 v0, 0x1

    invoke-static {p0, p1, p2, v0}, Le/e/a/SecureMedia240;->connect(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Z)Ljava/net/HttpURLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static connect(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;Z)Ljava/net/HttpURLConnection;
    .registers 11
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 14
    if-eqz p2, :cond_1

    const-string v0, "[0-9]+-[0-9]*"

    invoke-virtual {p2, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid byte range"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 15
    :cond_1
    :goto_0
    const/4 v0, 0x0

    move v1, v0

    :goto_1
    const/4 v2, 0x5

    if-gt v1, v2, :cond_e

    .line 16
    invoke-static {}, Ljava/lang/Thread;->currentThread()Ljava/lang/Thread;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Thread;->isInterrupted()Z

    move-result v3

    if-nez v3, :cond_d

    .line 17
    invoke-static {p0}, Le/e/a/SecurityPolicy240;->secure(Ljava/net/URL;)Z

    move-result v3

    if-eqz v3, :cond_c

    .line 18
    invoke-static {p0}, Lnicoid/network238/StreamConnection256;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object v3

    check-cast v3, Ljava/net/HttpURLConnection;

    .line 19
    nop

    .line 21
    if-eqz p3, :cond_2

    :try_start_0
    invoke-static {v3}, Le/e/a/CacheControl110;->connection(Ljava/net/HttpURLConnection;)V

    .line 22
    :cond_2
    invoke-virtual {v3, v0}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 23
    const/16 v4, 0x1f40

    if-eqz p3, :cond_3

    const/16 v5, 0x2ee0

    goto :goto_2

    :cond_3
    move v5, v4

    :goto_2
    invoke-virtual {v3, v5}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    if-eqz p3, :cond_4

    const/16 v4, 0x4e20

    :cond_4
    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    .line 24
    const-string v4, "User-Agent"

    const-string v5, "Mozilla/5.0 (Linux; Android) AppleWebKit/537.36 Chrome/120.0 Mobile Safari/537.36"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    const-string v4, "Referer"

    const-string v5, "https://www.nicovideo.jp/"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    const-string v4, "Origin"

    const-string v5, "https://www.nicovideo.jp"

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 27
    invoke-virtual {p0}, Ljava/net/URL;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v5, 0x0

    invoke-static {v4, p1, v5}, Le/e/a/SecurityPolicy240;->cookie(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 28
    invoke-virtual {v4}, Ljava/lang/String;->isEmpty()Z

    move-result v5

    if-nez v5, :cond_5

    const-string v5, "Cookie"

    invoke-virtual {v3, v5, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 29
    :cond_5
    if-eqz p2, :cond_6

    const-string v4, "Range"

    new-instance v5, Ljava/lang/StringBuilder;

    const-string v6, "bytes="

    invoke-direct {v5, v6}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v5, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v5

    invoke-virtual {v5}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v5

    invoke-virtual {v3, v4, v5}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    :cond_6
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result v4

    .line 31
    const/16 v5, 0x12d

    if-eq v4, v5, :cond_a

    const/16 v5, 0x12e

    if-eq v4, v5, :cond_a

    const/16 v5, 0x12f

    if-eq v4, v5, :cond_a

    const/16 v5, 0x133

    if-eq v4, v5, :cond_a

    const/16 v5, 0x134

    if-ne v4, v5, :cond_7

    goto :goto_3

    .line 36
    :cond_7
    const/16 p0, 0xc8

    if-lt v4, p0, :cond_9

    const/16 p0, 0x12c

    if-ge v4, p0, :cond_9

    if-eqz p3, :cond_8

    if-eqz p2, :cond_8

    const/16 p0, 0xce

    if-ne v4, p0, :cond_9

    .line 38
    :cond_8
    nop

    .line 39
    return-object v3

    .line 37
    :cond_9
    new-instance p0, Ljava/io/IOException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string p2, "Media HTTP "

    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 32
    :cond_a
    :goto_3
    const-string v4, "Location"

    invoke-virtual {v3, v4}, Ljava/net/HttpURLConnection;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    .line 33
    if-eqz v4, :cond_b

    if-eq v1, v2, :cond_b

    .line 34
    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0, v4}, Ljava/net/URL;-><init>(Ljava/net/URL;Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 39
    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    .line 34
    nop

    .line 15
    add-int/lit8 v1, v1, 0x1

    move-object p0, v2

    goto/16 :goto_1

    .line 33
    :cond_b
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid media redirect"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 39
    :catchall_0
    move-exception p0

    invoke-virtual {v3}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    .line 17
    :cond_c
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid secure media destination"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 16
    :cond_d
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0

    .line 41
    :cond_e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Too many media redirects"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
