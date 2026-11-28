.class public final Lnicoid/network238/PublicThumb278;
.super Ljava/lang/Object;
.source "PublicThumb278.java"


# static fields
.field private static final CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

.field static final MAX:I = 0x800000


# direct methods
.method static constructor <clinit>()V
    .registers 4

    .line 8
    new-instance v0, Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;-><init>()V

    const-wide/16 v1, 0xd

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const-wide/16 v1, 0xa

    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v0, v1, v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    sput-object v0, Lnicoid/network238/PublicThumb278;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    return-void
.end method

.method public constructor <init>()V
    .registers 1

    .line 6
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z
    .registers 3

    .line 9
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->isHttps()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v0

    const-string v1, "ext.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->username()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->password()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->fragment()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->query()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object p0

    const-string v0, "/api/getthumbinfo/(?:[a-z]{2})?[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    return p0
.end method

.method static fetch(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;)[B
    .registers 9
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 22
    invoke-static {p1}, Lnicoid/network238/PublicThumb278;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v0

    if-eqz v0, :cond_8

    .line 23
    const/4 v0, 0x0

    move v1, v0

    :goto_0
    const/4 v2, 0x5

    if-gt v1, v2, :cond_7

    .line 24
    new-instance v3, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v3}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    invoke-virtual {v3, p1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Lnicoid/network238/okhttp3/HttpUrl;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v3

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v3

    invoke-virtual {p0, v3}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v3

    invoke-interface {v3}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v3

    .line 25
    :try_start_0
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v4

    const-string v5, "Location"

    invoke-virtual {v3, v5}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    .line 26
    const/16 v6, 0x12d

    if-eq v4, v6, :cond_0

    const/16 v6, 0x12e

    if-eq v4, v6, :cond_0

    const/16 v6, 0x12f

    if-eq v4, v6, :cond_0

    const/16 v6, 0x133

    if-eq v4, v6, :cond_0

    const/16 v6, 0x134

    if-ne v4, v6, :cond_3

    :cond_0
    if-eqz v5, :cond_3

    invoke-virtual {p1, v5}, Lnicoid/network238/okhttp3/HttpUrl;->resolve(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/PublicThumb278;->allowed(Lnicoid/network238/okhttp3/HttpUrl;)Z

    move-result v4
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v4, :cond_2

    if-eq v1, v2, :cond_2

    .line 28
    if-eqz v3, :cond_1

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 23
    :cond_1
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 26
    :cond_2
    :try_start_1
    new-instance p0, Ljava/io/IOException;

    const-string p1, "public thumbnail redirect outside scope or limit"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 27
    :cond_3
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    if-nez p0, :cond_4

    new-array p0, v0, [B

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object p1

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v0

    invoke-static {p1, v0, v1}, Lnicoid/network238/PublicThumb278;->readBounded(Ljava/io/InputStream;J)[B

    move-result-object p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    :goto_1
    if-eqz v3, :cond_5

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 27
    :cond_5
    return-object p0

    .line 24
    :catchall_0
    move-exception p0

    if-eqz v3, :cond_6

    :try_start_2
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Response;->close()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    goto :goto_2

    :catchall_1
    move-exception p1

    invoke-virtual {p0, p1}, Ljava/lang/Throwable;->addSuppressed(Ljava/lang/Throwable;)V

    :cond_6
    :goto_2
    throw p0

    .line 29
    :cond_7
    new-instance p0, Ljava/io/IOException;

    const-string p1, "public thumbnail redirect limit"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 22
    :cond_8
    new-instance p0, Ljava/io/IOException;

    const-string p1, "public thumbnail outside scope"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public static get(Ljava/lang/String;)[B
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 10
    if-eqz p0, :cond_0

    const-string v0, "(?:[a-z]{2})?[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    sget-object v0, Lnicoid/network238/PublicThumb278;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    const-string v2, "https://ext.nicovideo.jp/api/getthumbinfo/"

    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v1

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/okhttp3/HttpUrl;->get(Ljava/lang/String;)Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p0

    invoke-static {v0, p0}, Lnicoid/network238/PublicThumb278;->fetch(Lnicoid/network238/okhttp3/OkHttpClient;Lnicoid/network238/okhttp3/HttpUrl;)[B

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string v0, "invalid public video id"

    invoke-direct {p0, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method static readBounded(Ljava/io/InputStream;J)[B
    .registers 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 12
    const-wide/32 v0, 0x800000

    cmp-long v0, p1, v0

    if-gtz v0, :cond_5

    const-wide/16 v0, -0x1

    cmp-long v0, p1, v0

    if-ltz v0, :cond_5

    .line 13
    new-instance v0, Ljava/io/ByteArrayOutputStream;

    const-wide/16 v1, 0x0

    cmp-long v1, p1, v1

    const/16 v2, 0x2000

    if-ltz v1, :cond_0

    const-wide/16 v3, 0x2000

    invoke-static {p1, p2, v3, v4}, Ljava/lang/Math;->min(JJ)J

    move-result-wide v3

    long-to-int v3, v3

    goto :goto_0

    :cond_0
    move v3, v2

    :goto_0
    invoke-direct {v0, v3}, Ljava/io/ByteArrayOutputStream;-><init>(I)V

    .line 14
    new-array v3, v2, [B

    :goto_1
    invoke-virtual {p0, v3}, Ljava/io/InputStream;->read([B)I

    move-result v4

    const/4 v5, -0x1

    if-eq v4, v5, :cond_3

    .line 15
    if-lez v4, :cond_2

    if-gt v4, v2, :cond_2

    const/high16 v5, 0x800000

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v6

    sub-int/2addr v5, v6

    if-gt v4, v5, :cond_2

    if-ltz v1, :cond_1

    int-to-long v5, v4

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result v7

    int-to-long v7, v7

    sub-long v7, p1, v7

    cmp-long v5, v5, v7

    if-gtz v5, :cond_2

    .line 16
    :cond_1
    const/4 v5, 0x0

    invoke-virtual {v0, v3, v5, v4}, Ljava/io/ByteArrayOutputStream;->write([BII)V

    goto :goto_1

    .line 15
    :cond_2
    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid public thumbnail read"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 18
    :cond_3
    if-ltz v1, :cond_4

    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->size()I

    move-result p0

    int-to-long v1, p0

    cmp-long p0, v1, p1

    if-eqz p0, :cond_4

    new-instance p0, Ljava/io/IOException;

    const-string p1, "short public thumbnail body"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 19
    :cond_4
    invoke-virtual {v0}, Ljava/io/ByteArrayOutputStream;->toByteArray()[B

    move-result-object p0

    return-object p0

    .line 12
    :cond_5
    new-instance p0, Ljava/io/IOException;

    const-string p1, "invalid public thumbnail body length"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
