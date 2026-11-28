.class public final Lnicoid/network238/StreamConnection256;
.super Ljava/net/HttpURLConnection;
.source "StreamConnection256.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/StreamConnection256$Shared;,
        Lnicoid/network238/StreamConnection256$LockedStream;
    }
.end annotation


# instance fields
.field private bodyStream:Ljava/io/InputStream;

.field private call:Lnicoid/network238/okhttp3/Call;

.field private cancelled:Z

.field private executing:Z

.field private failure:Ljava/io/IOException;

.field private final requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

.field private response:Lnicoid/network238/okhttp3/Response;

.field private final streamLock:Ljava/lang/Object;


# direct methods
.method private constructor <init>(Ljava/net/URL;)V
    .registers 2

    .line 31
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 11
    new-instance p1, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    iput-object p1, p0, Lnicoid/network238/StreamConnection256;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    .line 12
    new-instance p1, Ljava/lang/Object;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/StreamConnection256;->streamLock:Ljava/lang/Object;

    .line 31
    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnicoid/network238/StreamConnection256;->setInstanceFollowRedirects(Z)V

    return-void
.end method

.method public static open(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 33
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_1

    :cond_0
    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-static {}, Ljava/net/ResponseCache;->getDefault()Ljava/net/ResponseCache;

    move-result-object v0

    if-nez v0, :cond_1

    .line 34
    new-instance v0, Lnicoid/network238/StreamConnection256;

    invoke-direct {v0, p0}, Lnicoid/network238/StreamConnection256;-><init>(Ljava/net/URL;)V

    return-object v0

    .line 33
    :cond_1
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public connect()V
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 61
    monitor-enter p0

    .line 62
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/StreamConnection256;->cancelled:Z

    if-nez v0, :cond_6

    .line 63
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 64
    :cond_0
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->failure:Ljava/io/IOException;

    if-nez v0, :cond_5

    .line 65
    iget-boolean v0, p0, Lnicoid/network238/StreamConnection256;->executing:Z

    if-nez v0, :cond_4

    .line 66
    const-string v0, "GET"

    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->getDoOutput()Z

    move-result v0

    if-nez v0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->getInstanceFollowRedirects()Z

    move-result v0

    if-nez v0, :cond_3

    .line 67
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    const-string v1, "Range"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    const-string v1, "Accept-Encoding"

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    const-string v1, "Accept-Encoding"

    const-string v2, "identity"

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;

    .line 68
    :cond_1
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->url:Ljava/net/URL;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Ljava/net/URL;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 69
    sget-object v1, Lnicoid/network238/StreamConnection256$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->getConnectTimeout()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 70
    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->getReadTimeout()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 71
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v0

    .line 72
    iput-object v0, p0, Lnicoid/network238/StreamConnection256;->call:Lnicoid/network238/okhttp3/Call;

    .line 73
    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/StreamConnection256;->connected:Z

    .line 74
    iput-boolean v1, p0, Lnicoid/network238/StreamConnection256;->executing:Z

    .line 75
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 77
    const/4 v1, 0x0

    :try_start_1
    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 78
    nop

    .line 79
    monitor-enter p0

    .line 80
    :try_start_2
    iput-boolean v1, p0, Lnicoid/network238/StreamConnection256;->executing:Z

    .line 81
    iget-boolean v1, p0, Lnicoid/network238/StreamConnection256;->cancelled:Z

    if-nez v1, :cond_2

    .line 82
    iput-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    .line 83
    monitor-exit p0

    .line 84
    return-void

    .line 81
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->close()V

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 83
    :goto_0
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0

    .line 78
    :catch_0
    move-exception v0

    monitor-enter p0

    :try_start_3
    iput-object v0, p0, Lnicoid/network238/StreamConnection256;->failure:Ljava/io/IOException;

    iput-boolean v1, p0, Lnicoid/network238/StreamConnection256;->executing:Z

    monitor-exit p0

    goto :goto_2

    :goto_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_2
    throw v0

    :catchall_1
    move-exception v0

    goto :goto_1

    .line 66
    :cond_3
    :try_start_4
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Only manual redirect GET supported"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 65
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Concurrent connect"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 64
    :cond_5
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->failure:Ljava/io/IOException;

    throw v0

    .line 62
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 75
    :goto_3
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_3
.end method

.method public disconnect()V
    .registers 4

    .line 102
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/StreamConnection256;->cancelled:Z

    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->call:Lnicoid/network238/okhttp3/Call;

    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    const/4 v2, 0x0

    iput-object v2, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 103
    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->cancel()V

    .line 104
    :cond_0
    if-eqz v1, :cond_1

    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->streamLock:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    monitor-exit v0

    goto :goto_1

    :goto_0
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v1

    :catchall_0
    move-exception v1

    goto :goto_0

    .line 105
    :cond_1
    :goto_1
    return-void

    .line 102
    :goto_2
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2
.end method

.method public getContentEncoding()Ljava/lang/String;
    .registers 2

    .line 36
    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Lnicoid/network238/StreamConnection256;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()I
    .registers 5

    .line 50
    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->getContentLengthLong()J

    move-result-wide v0

    .line 51
    const-wide/16 v2, 0x0

    cmp-long v2, v0, v2

    if-ltz v2, :cond_0

    const-wide/32 v2, 0x7fffffff

    cmp-long v2, v0, v2

    if-gtz v2, :cond_0

    long-to-int v0, v0

    goto :goto_0

    :cond_0
    const/4 v0, -0x1

    :goto_0
    return v0
.end method

.method public getContentLengthLong()J
    .registers 8

    .line 44
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lnicoid/network238/StreamConnection256;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    const-wide/16 v1, -0x1

    if-nez v0, :cond_0

    return-wide v1

    .line 46
    :cond_0
    :try_start_0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-ltz v0, :cond_1

    move-wide v1, v3

    :cond_1
    return-wide v1

    .line 47
    :catch_0
    move-exception v0

    return-wide v1
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .line 53
    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lnicoid/network238/StreamConnection256;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 39
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 40
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 41
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_1
    monitor-exit p0

    return-object v0

    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0

    .line 40
    :catch_0
    move-exception p1

    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 87
    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->connect()V

    .line 88
    monitor-enter p0

    .line 89
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_3

    .line 90
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    .line 91
    const/16 v1, 0x190

    if-lt v0, v1, :cond_1

    .line 92
    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 93
    const/16 v1, 0x194

    if-eq v0, v1, :cond_0

    const/16 v1, 0x19a

    if-eq v0, v1, :cond_0

    .line 94
    new-instance v1, Ljava/io/IOException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HTTP "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 93
    :cond_0
    new-instance v1, Ljava/io/FileNotFoundException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    const-string v3, "HTTP "

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v2

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/io/FileNotFoundException;-><init>(Ljava/lang/String;)V

    throw v1

    .line 96
    :cond_1
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->bodyStream:Ljava/io/InputStream;

    if-nez v0, :cond_2

    new-instance v0, Lnicoid/network238/StreamConnection256$LockedStream;

    iget-object v1, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v1

    iget-object v2, p0, Lnicoid/network238/StreamConnection256;->streamLock:Ljava/lang/Object;

    invoke-direct {v0, v1, v2}, Lnicoid/network238/StreamConnection256$LockedStream;-><init>(Ljava/io/InputStream;Ljava/lang/Object;)V

    iput-object v0, p0, Lnicoid/network238/StreamConnection256;->bodyStream:Ljava/io/InputStream;

    .line 97
    :cond_2
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->bodyStream:Ljava/io/InputStream;

    monitor-exit p0

    return-object v0

    .line 89
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 98
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public getResponseCode()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 85
    invoke-virtual {p0}, Lnicoid/network238/StreamConnection256;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    monitor-exit p0

    return v0

    :cond_0
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public declared-synchronized setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    monitor-enter p0

    .line 55
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/StreamConnection256;->connected:Z

    if-nez v0, :cond_1

    iget-boolean v0, p0, Lnicoid/network238/StreamConnection256;->cancelled:Z

    if-nez v0, :cond_1

    .line 56
    const-string v0, "Authorization"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Proxy-Authorization"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    .line 57
    iget-object v0, p0, Lnicoid/network238/StreamConnection256;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 58
    monitor-exit p0

    return-void

    .line 56
    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Authenticated request requires dedicated transport"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 55
    :cond_1
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already connected"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 54
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public usingProxy()Z
    .registers 2

    .line 106
    const/4 v0, 0x0

    return v0
.end method
