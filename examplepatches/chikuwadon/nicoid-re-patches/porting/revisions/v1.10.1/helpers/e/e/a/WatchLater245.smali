.class public final Le/e/a/WatchLater245;
.super Ljava/lang/Object;
.source "WatchLater245.java"


# static fields
.field static final PREFIX:Ljava/lang/String; = "https://nvapi.nicovideo.jp/v1/users/me/watch-later?itemIds="


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static code(Lorg/json/JSONObject;)Ljava/lang/String;
    .registers 5

    .line 6
    const-string v0, "meta"

    invoke-virtual {p0, v0}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "data"

    invoke-virtual {p0, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v1, ""

    if-nez v0, :cond_12

    move-object v0, v1

    goto :goto_1e

    :cond_12
    const-string v2, "code"

    invoke-virtual {v0, v2, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "errorCode"

    invoke-virtual {v0, v3, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_1e
    const-string v2, "[A-Z][A-Z0-9_]{1,47}"

    invoke-virtual {v0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_27

    move-object v0, v1

    :cond_27
    if-nez p0, :cond_2a

    goto :goto_30

    :cond_2a
    const-string v3, "errorDetail"

    invoke-virtual {p0, v3, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    :goto_30
    invoke-virtual {v1, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_5d

    new-instance p0, Ljava/lang/StringBuilder;

    invoke-static {v0}, Ljava/lang/String;->valueOf(Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v2

    invoke-direct {p0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_46

    goto :goto_55

    :cond_46
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "/"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    :goto_55
    invoke-virtual {p0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :cond_5d
    return-object v0
.end method

.method static failure(I[B)Ljava/lang/String;
    .registers 6

    .line 7
    const-string v0, ""

    :try_start_2
    new-instance v1, Lorg/json/JSONObject;

    new-instance v2, Ljava/lang/String;

    const-string v3, "UTF-8"

    invoke-direct {v2, p1, v3}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v1, v2}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    invoke-static {v1}, Le/e/a/WatchLater245;->code(Lorg/json/JSONObject;)Ljava/lang/String;

    move-result-object p1
    :try_end_12
    .catch Ljava/lang/Exception; {:try_start_2 .. :try_end_12} :catch_13

    goto :goto_15

    :catch_13
    move-exception p1

    move-object p1, v0

    :goto_15
    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "HTTP "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_27

    goto :goto_36

    :cond_27
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, " "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    :goto_36
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static read(Ljava/io/InputStream;)[B
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 8
    const/4 v0, 0x0

    if-nez p0, :cond_6

    new-array p0, v0, [B

    return-object p0

    :cond_6
    const/4 v1, 0x0

    :try_start_7
    new-instance v2, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v2}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_c
    .catchall {:try_start_7 .. :try_end_c} :catchall_3f

    const/16 v3, 0x800

    :try_start_e
    new-array v3, v3, [B

    :goto_10
    invoke-virtual {p0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-ne v4, v5, :cond_24

    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object v0
    :try_end_1b
    .catchall {:try_start_e .. :try_end_1b} :catchall_39

    :try_start_1b
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V
    :try_end_1e
    .catchall {:try_start_1b .. :try_end_1e} :catchall_3f

    if-eqz p0, :cond_23

    :try_start_20
    invoke-virtual {p0}, Ljava/io/InputStream;->close()V
    :try_end_23
    .catchall {:try_start_20 .. :try_end_23} :catchall_4a

    :cond_23
    return-object v0

    :cond_24
    :try_start_24
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v5

    add-int/2addr v5, v4

    const/high16 v6, 0x10000

    if-gt v5, v6, :cond_31

    invoke-virtual {v2, v3, v0, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_10

    :cond_31
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Oversized API response"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_39
    .catchall {:try_start_24 .. :try_end_39} :catchall_39

    :catchall_39
    move-exception v0

    move-object v1, v0

    :try_start_3b
    invoke-virtual {v2}, Ljava/io/ByteArrayOutputStream;->close()V

    throw v1
    :try_end_3f
    .catchall {:try_start_3b .. :try_end_3f} :catchall_3f

    :catchall_3f
    move-exception v0

    if-nez v1, :cond_44

    move-object v1, v0

    goto :goto_4c

    :cond_44
    if-eq v1, v0, :cond_4c

    :try_start_46
    invoke-virtual {v1, v0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_4c

    :catchall_4a
    move-exception p0

    goto :goto_52

    :cond_4c
    :goto_4c
    if-eqz p0, :cond_51

    invoke-virtual {p0}, Ljava/io/InputStream;->close()V

    :cond_51
    throw v1
    :try_end_52
    .catchall {:try_start_46 .. :try_end_52} :catchall_4a

    :goto_52
    if-eqz v1, :cond_5a

    if-eq v1, p0, :cond_59

    invoke-virtual {v1, p0}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_59
    move-object p0, v1

    :cond_5a
    throw p0
.end method

.method static remove(Ljava/lang/String;)V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 9
    const-string v0, "status"

    const-string v1, "https://www.nicovideo.jp"

    const-string v2, "https://nvapi.nicovideo.jp/v1/users/me/watch-later?itemIds="

    invoke-virtual {p0, v2}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v3

    if-eqz v3, :cond_c0

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    invoke-virtual {p0, v2}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    move-result-object v2

    const-string v3, "[0-9]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_c0

    new-instance v2, Ljava/net/URL;

    invoke-direct {v2, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v2

    check-cast v2, Ljava/net/HttpURLConnection;

    :try_start_27
    const-string v3, "DELETE"

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    const/16 v3, 0x2710

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v2, v3}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    invoke-static {v2, p0}, Le/e/a/WatchRequestHeaders;->apply(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    const-string p0, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {v2, p0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {v2, p0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Request-With"

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Origin"

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Accept"

    const-string v1, "application/json"

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Cookie"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2, p0, v1}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p0

    const/16 v1, 0xc8

    if-lt p0, v1, :cond_a9

    const/16 v3, 0x12c

    if-ge p0, v3, :cond_a9

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object p0

    invoke-static {p0}, Le/e/a/WatchLater245;->read(Ljava/io/InputStream;)[B

    move-result-object p0

    array-length v4, p0

    if-lez v4, :cond_a5

    new-instance v4, Lorg/json/JSONObject;

    new-instance v5, Ljava/lang/String;

    const-string v6, "UTF-8"

    invoke-direct {v5, p0, v6}, Ljava/lang/String;-><init>([BLjava/lang/String;)V

    invoke-direct {v4, v5}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v5, "meta"

    invoke-virtual {v4, v5}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v4

    if-eqz v4, :cond_a5

    invoke-virtual {v4, v0, v1}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    if-ge v1, v3, :cond_95

    goto :goto_a5

    :cond_95
    new-instance v1, Ljava/io/IOException;

    const/16 v3, 0x190

    invoke-virtual {v4, v0, v3}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {v0, p0}, Le/e/a/WatchLater245;->failure(I[B)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v1, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_a5
    .catchall {:try_start_27 .. :try_end_a5} :catchall_bb

    :cond_a5
    :goto_a5
    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    return-void

    :cond_a9
    :try_start_a9
    new-instance v0, Ljava/io/IOException;

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v1

    invoke-static {v1}, Le/e/a/WatchLater245;->read(Ljava/io/InputStream;)[B

    move-result-object v1

    invoke-static {p0, v1}, Le/e/a/WatchLater245;->failure(I[B)Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_bb
    .catchall {:try_start_a9 .. :try_end_bb} :catchall_bb

    :catchall_bb
    move-exception p0

    invoke-virtual {v2}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    :cond_c0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Invalid membership identifier"

    invoke-direct {p0, v0}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
