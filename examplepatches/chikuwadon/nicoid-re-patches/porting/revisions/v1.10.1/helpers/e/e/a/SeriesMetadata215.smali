.class public final Le/e/a/SeriesMetadata215;
.super Ljava/lang/Object;
.source "SeriesMetadata215.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Le/e/a/SeriesMetadata215$Entry;,
        Le/e/a/SeriesMetadata215$Expired;
    }
.end annotation


# static fields
.field static final CACHE:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Le/e/a/SeriesMetadata215$Entry;",
            ">;"
        }
    .end annotation
.end field

.field static final META:Ljava/util/regex/Pattern;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    .line 5
    const-string v0, "<meta\\b[^>]*\\bname=[\"\']server-response[\"\'][^>]*\\bcontent=\"([^\"]*)\""

    const/4 v1, 0x2

    invoke-static {v0, v1}, Ljava/util/regex/Pattern;->compile(Ljava/lang/String;I)Ljava/util/regex/Pattern;

    move-result-object v0

    sput-object v0, Le/e/a/SeriesMetadata215;->META:Ljava/util/regex/Pattern;

    .line 6
    new-instance v0, Ljava/util/LinkedHashMap;

    invoke-direct {v0}, Ljava/util/LinkedHashMap;-><init>()V

    sput-object v0, Le/e/a/SeriesMetadata215;->CACHE:Ljava/util/Map;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 4
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static bootstrap(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 21
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "https://www.nicovideo.jp/watch/"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const/4 v1, 0x0

    invoke-static {v0, v1, p1}, Le/e/a/SeriesMetadata215;->transfer(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/lang/String;

    move-result-object p1

    sget-object v0, Le/e/a/SeriesMetadata215;->META:Ljava/util/regex/Pattern;

    invoke-virtual {v0, p1}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/regex/Matcher;->find()Z

    move-result v0

    if-eqz v0, :cond_66

    .line 22
    new-instance v0, Lorg/json/JSONObject;

    const/4 v1, 0x1

    invoke-virtual {p1, v1}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object p1

    invoke-static {p1}, Landroid/text/Html;->fromHtml(Ljava/lang/String;)Landroid/text/Spanned;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, p1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p1, "data"

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "response"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "$watchV4"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    invoke-virtual {v0, p1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p1

    .line 23
    const-string v0, "video"

    invoke-virtual {p1, v0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    const-string v1, "id"

    invoke-virtual {v0, v1}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_5e

    return-object p1

    :cond_5e
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Mismatched V4 video"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 21
    :cond_66
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Missing V4 metadata"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static cached(Ljava/lang/String;)Lorg/json/JSONObject;
    .registers 7

    .line 9
    sget-object v0, Le/e/a/SeriesMetadata215;->CACHE:Ljava/util/Map;

    monitor-enter v0

    :try_start_3
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Le/e/a/SeriesMetadata215$Entry;

    if-eqz p0, :cond_1c

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v1

    iget-wide v3, p0, Le/e/a/SeriesMetadata215$Entry;->at:J

    sub-long/2addr v1, v3

    const-wide/32 v3, 0xea60

    cmp-long v5, v1, v3

    if-gez v5, :cond_1c

    iget-object p0, p0, Le/e/a/SeriesMetadata215$Entry;->data:Lorg/json/JSONObject;

    goto :goto_1d

    :cond_1c
    const/4 p0, 0x0

    :goto_1d
    monitor-exit v0

    return-object p0

    :goto_1f
    monitor-exit v0
    :try_end_20
    .catchall {:try_start_3 .. :try_end_20} :catchall_21

    throw p0

    :catchall_21
    move-exception p0

    goto :goto_1f
.end method

.method static transfer(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/lang/String;
    .registers 14
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 11
    const-string v0, "https://www.nicovideo.jp"

    new-instance v1, Ljava/net/URL;

    invoke-direct {v1, p0}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object v1

    check-cast v1, Ljava/net/HttpURLConnection;

    invoke-virtual {p2, v1}, Le/e/a/NetworkTask;->bind(Ljava/net/HttpURLConnection;)Z

    move-result v2

    if-eqz v2, :cond_12f

    if-nez p1, :cond_18

    .line 12
    :try_start_15
    const-string v2, "GET"

    goto :goto_1a

    :cond_18
    const-string v2, "POST"

    :goto_1a
    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V

    const/16 v2, 0x2710

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setConnectTimeout(I)V

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setReadTimeout(I)V

    const/4 v2, 0x0

    invoke-virtual {v1, v2}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    invoke-static {v1, p0}, Le/e/a/WatchRequestHeaders;->apply(Ljava/net/HttpURLConnection;Ljava/lang/String;)V

    const-string p0, "User-Agent"

    const-string v3, "Mozilla/5.0"

    invoke-virtual {v1, p0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 13
    const-string p0, "X-Frontend-Id"

    const-string v3, "6"

    invoke-virtual {v1, p0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Frontend-Version"

    const-string v3, "0"

    invoke-virtual {v1, p0, v3}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "X-Request-With"

    invoke-virtual {v1, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Origin"

    invoke-virtual {v1, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    const-string p0, "Cookie"

    invoke-static {}, Le/e/a/VideoDetails;->cookie()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, p0, v0}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    :try_end_54
    .catchall {:try_start_15 .. :try_end_54} :catchall_127

    const/4 p0, 0x0

    .line 14
    const-string v0, "UTF-8"

    if-eqz p1, :cond_8b

    :try_start_59
    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/lang/String;)[B

    move-result-object p1

    const/4 v3, 0x1

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setDoOutput(Z)V

    const-string v3, "Content-Type"

    const-string v4, "application/json"

    invoke-virtual {v1, v3, v4}, Ljava/net/HttpURLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    array-length v3, p1

    invoke-virtual {v1, v3}, Ljava/net/HttpURLConnection;->setFixedLengthStreamingMode(I)V
    :try_end_6c
    .catchall {:try_start_59 .. :try_end_6c} :catchall_127

    :try_start_6c
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getOutputStream()Ljava/io/OutputStream;

    move-result-object v3
    :try_end_70
    .catchall {:try_start_6c .. :try_end_70} :catchall_80

    :try_start_70
    invoke-virtual {v3, p1}, Ljava/io/OutputStream;->write([B)V
    :try_end_73
    .catchall {:try_start_70 .. :try_end_73} :catchall_79

    if-eqz v3, :cond_8b

    :try_start_75
    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    goto :goto_8b

    :catchall_79
    move-exception p0

    if-eqz v3, :cond_7f

    invoke-virtual {v3}, Ljava/io/OutputStream;->close()V

    :cond_7f
    throw p0
    :try_end_80
    .catchall {:try_start_75 .. :try_end_80} :catchall_80

    :catchall_80
    move-exception p1

    if-eqz p0, :cond_89

    if-eq p0, p1, :cond_8a

    :try_start_85
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_8a

    :cond_89
    move-object p0, p1

    :cond_8a
    :goto_8a
    throw p0

    .line 15
    :cond_8b
    :goto_8b
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getResponseCode()I

    move-result p1

    const/16 v3, 0x12c

    const/16 v4, 0xc8

    if-lt p1, v4, :cond_9c

    if-ge p1, v3, :cond_9c

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getInputStream()Ljava/io/InputStream;

    move-result-object v5

    goto :goto_a0

    :cond_9c
    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->getErrorStream()Ljava/io/InputStream;

    move-result-object v5

    :goto_a0
    new-instance v6, Ljava/io/ByteArrayOutputStream;

    invoke-direct {v6}, Ljava/io/ByteArrayOutputStream;-><init>()V
    :try_end_a5
    .catchall {:try_start_85 .. :try_end_a5} :catchall_127

    if-eqz v5, :cond_e5

    const/16 v7, 0x2000

    .line 16
    :try_start_a9
    new-array v7, v7, [B

    :goto_ab
    invoke-virtual {v5, v7}, Ljava/io/InputStream;->read([B)I

    move-result v8
    :try_end_af
    .catchall {:try_start_a9 .. :try_end_af} :catchall_d3

    const/4 v9, -0x1

    if-ne v8, v9, :cond_b8

    if-eqz v5, :cond_e5

    :try_start_b4
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V
    :try_end_b7
    .catchall {:try_start_b4 .. :try_end_b7} :catchall_da

    goto :goto_e5

    :cond_b8
    :try_start_b8
    invoke-virtual {p2}, Le/e/a/NetworkTask;->cancelled()Z

    move-result v9

    if-nez v9, :cond_cb

    invoke-virtual {v6}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v9

    add-int/2addr v9, v8

    const/high16 v10, 0x200000

    if-gt v9, v10, :cond_cb

    invoke-virtual {v6, v7, v2, v8}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_ab

    :cond_cb
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Request cancelled or oversized"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_d3
    .catchall {:try_start_b8 .. :try_end_d3} :catchall_d3

    :catchall_d3
    move-exception p0

    if-eqz v5, :cond_d9

    :try_start_d6
    invoke-virtual {v5}, Ljava/io/InputStream;->close()V

    :cond_d9
    throw p0
    :try_end_da
    .catchall {:try_start_d6 .. :try_end_da} :catchall_da

    :catchall_da
    move-exception p1

    if-eqz p0, :cond_e3

    if-eq p0, p1, :cond_e4

    :try_start_df
    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    goto :goto_e4

    :cond_e3
    move-object p0, p1

    :cond_e4
    :goto_e4
    throw p0

    .line 17
    :cond_e5
    :goto_e5
    invoke-virtual {v6, v0}, Ljava/io/ByteArrayOutputStream;->toString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0
    :try_end_e9
    .catchall {:try_start_df .. :try_end_e9} :catchall_127

    if-lt p1, v4, :cond_f4

    if-ge p1, v3, :cond_f4

    .line 18
    invoke-virtual {p2, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    return-object p0

    .line 17
    :cond_f4
    :try_start_f4
    const-string v0, "KEY_EXPIRED"

    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2, p0}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string p0, "meta"

    invoke-virtual {v2, p0}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object p0

    const-string v2, "errorCode"

    invoke-virtual {p0, v2}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_113

    new-instance p0, Le/e/a/SeriesMetadata215$Expired;

    invoke-direct {p0}, Le/e/a/SeriesMetadata215$Expired;-><init>()V

    throw p0
    :try_end_113
    .catch Lorg/json/JSONException; {:try_start_f4 .. :try_end_113} :catch_113
    .catchall {:try_start_f4 .. :try_end_113} :catchall_127

    :catch_113
    :cond_113
    :try_start_113
    new-instance p0, Ljava/io/IOException;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Series metadata HTTP "

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_127
    .catchall {:try_start_113 .. :try_end_127} :catchall_127

    :catchall_127
    move-exception p0

    .line 18
    invoke-virtual {p2, v1}, Le/e/a/NetworkTask;->release(Ljava/net/HttpURLConnection;)V

    invoke-virtual {v1}, Ljava/net/HttpURLConnection;->disconnect()V

    throw p0

    .line 11
    :cond_12f
    new-instance p0, Ljava/io/InterruptedIOException;

    invoke-direct {p0}, Ljava/io/InterruptedIOException;-><init>()V

    throw p0
.end method

.method public static watch(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    if-eqz p0, :cond_147

    .line 26
    const-string v0, "(?:sm|nm|so|ss)?[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_147

    invoke-static {p0}, Le/e/a/SeriesMetadata215;->cached(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v0

    if-eqz v0, :cond_11

    return-object v0

    :cond_11
    const/4 v0, 0x0

    :goto_12
    const/4 v1, 0x2

    if-ge v0, v1, :cond_13f

    .line 28
    :try_start_15
    invoke-static {p0, p1}, Le/e/a/SeriesMetadata215;->bootstrap(Ljava/lang/String;Le/e/a/NetworkTask;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "lazy"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "authKey"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "client"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v3, "watchTrackId"

    invoke-virtual {v1, v3}, Lorg/json/JSONObject;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v2}, Ljava/lang/String;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_127

    .line 29
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "https://nvapi.nicovideo.jp/v4/watch/lazy/"

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-static {p0}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    const-string v4, "?actionTrackId="

    invoke-virtual {v3, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-static {v1}, Landroid/net/Uri;->encode(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    .line 30
    new-instance v3, Lorg/json/JSONObject;

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "keyToken"

    invoke-virtual {v4, v5, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    invoke-virtual {v2}, Lorg/json/JSONObject;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-static {v1, v2, p1}, Le/e/a/SeriesMetadata215;->transfer(Ljava/lang/String;Ljava/lang/String;Le/e/a/NetworkTask;)Ljava/lang/String;

    move-result-object v1

    invoke-direct {v3, v1}, Lorg/json/JSONObject;-><init>(Ljava/lang/String;)V

    const-string v1, "meta"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->optJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    if-eqz v1, :cond_11f

    const-string v2, "status"

    const/16 v4, 0x1f4

    invoke-virtual {v1, v2, v4}, Lorg/json/JSONObject;->optInt(Ljava/lang/String;I)I

    move-result v1

    const/16 v2, 0xc8

    if-ne v1, v2, :cond_11f

    .line 31
    const-string v1, "data"

    invoke-virtual {v3, v1}, Lorg/json/JSONObject;->getJSONObject(Ljava/lang/String;)Lorg/json/JSONObject;

    move-result-object v1

    const-string v2, "series"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_117

    const-string v2, "series"

    invoke-virtual {v1, v2}, Lorg/json/JSONObject;->get(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v1

    .line 32
    sget-object v2, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-eq v1, v2, :cond_b6

    instance-of v2, v1, Lorg/json/JSONObject;

    if-eqz v2, :cond_ae

    move-object v2, v1

    check-cast v2, Lorg/json/JSONObject;

    const-string v3, "id"

    invoke-virtual {v2, v3}, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "[0-9]+"

    invoke-virtual {v2, v3}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_b6

    :cond_ae
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Invalid V4 series"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 33
    :cond_b6
    new-instance v2, Lorg/json/JSONObject;

    invoke-direct {v2}, Lorg/json/JSONObject;-><init>()V

    const-string v3, "video"

    new-instance v4, Lorg/json/JSONObject;

    invoke-direct {v4}, Lorg/json/JSONObject;-><init>()V

    const-string v5, "id"

    invoke-virtual {v4, v5, p0}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v4

    invoke-virtual {v2, v3, v4}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    const-string v3, "series"

    invoke-virtual {v2, v3, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    move-result-object v2

    sget-object v3, Le/e/a/SeriesMetadata215;->CACHE:Ljava/util/Map;

    monitor-enter v3
    :try_end_d5
    .catch Le/e/a/SeriesMetadata215$Expired; {:try_start_15 .. :try_end_d5} :catch_12f

    :try_start_d5
    new-instance v4, Le/e/a/SeriesMetadata215$Entry;

    invoke-direct {v4, v2}, Le/e/a/SeriesMetadata215$Entry;-><init>(Lorg/json/JSONObject;)V

    invoke-interface {v3, p0, v4}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :goto_dd
    sget-object v4, Le/e/a/SeriesMetadata215;->CACHE:Ljava/util/Map;

    invoke-interface {v4}, Ljava/util/Map;->size()I

    move-result v5

    const/16 v6, 0x10

    if-gt v5, v6, :cond_103

    monitor-exit v3
    :try_end_e8
    .catchall {:try_start_d5 .. :try_end_e8} :catchall_115

    .line 34
    :try_start_e8
    new-instance v3, Ljava/lang/StringBuilder;

    const-string v4, "Series V4 received: "

    invoke-direct {v3, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v4, Lorg/json/JSONObject;->NULL:Ljava/lang/Object;

    if-ne v1, v4, :cond_f6

    const-string v1, "none"

    goto :goto_f8

    :cond_f6
    const-string v1, "present"

    :goto_f8
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v3}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Le/e/a/ModernDebug;->record(Ljava/lang/String;)V
    :try_end_102
    .catch Le/e/a/SeriesMetadata215$Expired; {:try_start_e8 .. :try_end_102} :catch_12f

    return-object v2

    .line 33
    :cond_103
    :try_start_103
    invoke-interface {v4}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    invoke-interface {v4, v5}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_dd

    :goto_113
    monitor-exit v3
    :try_end_114
    .catchall {:try_start_103 .. :try_end_114} :catchall_115

    :try_start_114
    throw v1

    :catchall_115
    move-exception v1

    goto :goto_113

    .line 31
    :cond_117
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Missing V4 series field"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 30
    :cond_11f
    new-instance v1, Ljava/io/IOException;

    const-string v2, "V4 request rejected"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 28
    :cond_127
    new-instance v1, Ljava/io/IOException;

    const-string v2, "Missing V4 key"

    invoke-direct {v1, v2}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_12f
    .catch Le/e/a/SeriesMetadata215$Expired; {:try_start_114 .. :try_end_12f} :catch_12f

    :catch_12f
    nop

    const/4 v1, 0x1

    if-eq v0, v1, :cond_137

    add-int/lit8 v0, v0, 0x1

    goto/16 :goto_12

    .line 35
    :cond_137
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Series V4 key expired"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 36
    :cond_13f
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Unable to load V4 series"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 26
    :cond_147
    new-instance p0, Ljava/io/IOException;

    const-string p1, "Invalid video id"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
