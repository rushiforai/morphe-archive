.class public final Lnicoid/network238/ApiConnection254;
.super Ljava/net/HttpURLConnection;
.source "ApiConnection254.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/ApiConnection254$Shared;,
        Lnicoid/network238/ApiConnection254$BufferBody;,
        Lnicoid/network238/ApiConnection254$OneShot;
    }
.end annotation


# static fields
.field static final LIMIT:I = 0x100000


# instance fields
.field private call:Lnicoid/network238/okhttp3/Call;

.field private cancelled:Z

.field private final client:Lnicoid/network238/okhttp3/OkHttpClient;

.field private executing:Z

.field private failure:Ljava/io/IOException;

.field private final headers:Lnicoid/network238/okhttp3/Headers$Builder;

.field private final payload:Lnicoid/network238/ApiConnection254$BufferBody;

.field private requestedOutput:Z

.field private response:Lnicoid/network238/okhttp3/Response;


# direct methods
.method constructor <init>(Ljava/net/URL;Lnicoid/network238/okhttp3/OkHttpClient;)V
    .registers 4

    .line 50
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 12
    new-instance p1, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    iput-object p1, p0, Lnicoid/network238/ApiConnection254;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    .line 13
    new-instance p1, Lnicoid/network238/ApiConnection254$BufferBody;

    const/4 v0, 0x0

    invoke-direct {p1, v0}, Lnicoid/network238/ApiConnection254$BufferBody;-><init>(Lnicoid/network238/ApiConnection254$1;)V

    iput-object p1, p0, Lnicoid/network238/ApiConnection254;->payload:Lnicoid/network238/ApiConnection254$BufferBody;

    .line 50
    iput-object p2, p0, Lnicoid/network238/ApiConnection254;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lnicoid/network238/ApiConnection254;->setInstanceFollowRedirects(Z)V

    return-void
.end method

.method static eligible(Ljava/net/URL;)Z
    .registers 5

    .line 21
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Ljava/net/URL;->getRef()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_c

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/16 v2, 0x1bb

    if-ne v0, v2, :cond_c

    .line 22
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    .line 24
    const-string v2, ".."

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    const-string v2, "\\"

    invoke-virtual {p0, v2}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "%2f"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "%2e"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v2

    const-string v3, "%5c"

    invoke-virtual {v2, v3}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v2

    if-nez v2, :cond_b

    .line 25
    const-string v2, "nvapi.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    const/4 v3, 0x1

    if-eqz v2, :cond_2

    const-string v0, "/v1/users/me/likes/items"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/users/me/mylists/[0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/watch/[A-Za-z0-9]+/access-rights/hls"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/comment/keys/nicoru"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/comment/keys/post"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/users/me/ng-comments/client"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/users/me/nicoru/send/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v1/users/me/watch-later"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "/v4/watch/lazy/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    move v1, v3

    :goto_0
    return v1

    .line 26
    :cond_2
    const-string v2, "www.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_4

    const-string v0, "/watch/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_3

    const-string v0, "/api/watch/v3(?:_guest)?/[A-Za-z0-9]+"

    invoke-virtual {p0, v0}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_3

    goto :goto_1

    :cond_3
    move v1, v3

    :goto_1
    return v1

    .line 27
    :cond_4
    const-string v2, "live2.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_7

    const-string v0, "/api/v2/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_6

    const-string v0, "/timeshift/reservation"

    invoke-virtual {p0, v0}, Ljava/lang/String;->contains(Ljava/lang/CharSequence;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "/api/v2/timeshift/reservations"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_6

    :cond_5
    move v1, v3

    :cond_6
    return v1

    .line 28
    :cond_7
    const-string v2, "nvcomment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "nv-comment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "public.nvcomment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_8

    const-string v2, "public.nv-comment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_9

    :cond_8
    const-string v0, "/v1/threads"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_a

    const-string v0, "/v1/threads/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_a

    :cond_9
    goto :goto_2

    :cond_a
    move v1, v3

    :goto_2
    return v1

    .line 24
    :cond_b
    return v1

    .line 21
    :cond_c
    return v1
.end method

.method static synthetic lambda$connect$0(Ljava/util/concurrent/atomic/AtomicBoolean;Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 86
    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result p0

    if-eqz p0, :cond_0

    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object p0

    invoke-interface {p1, p0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    return-object p0

    :cond_0
    new-instance p0, Ljava/io/IOException;

    const-string p1, "API request replay blocked"

    invoke-direct {p0, p1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method private mutable()V
    .registers 3

    .line 51
    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254;->connected:Z

    if-nez v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254;->cancelled:Z

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Already connected or cancelled"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public static open(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 31
    invoke-static {p0}, Lnicoid/network238/ApiConnection254;->eligible(Ljava/net/URL;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_3

    invoke-static {}, Ljava/net/ResponseCache;->getDefault()Ljava/net/ResponseCache;

    move-result-object v0

    if-nez v0, :cond_3

    .line 32
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 33
    if-eqz v0, :cond_2

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_2

    .line 34
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x20

    if-lt v2, v3, :cond_0

    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v3, 0x7e

    if-gt v2, v3, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 35
    :cond_1
    new-instance v1, Lnicoid/network238/ApiConnection254;

    sget-object v2, Lnicoid/network238/ApiConnection254$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-direct {v1, p0, v2}, Lnicoid/network238/ApiConnection254;-><init>(Ljava/net/URL;Lnicoid/network238/okhttp3/OkHttpClient;)V

    const-string p0, "User-Agent"

    invoke-virtual {v1, p0, v0}, Lnicoid/network238/ApiConnection254;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-object v1

    .line 33
    :cond_2
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 31
    :cond_3
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static openPlayback(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 39
    invoke-static {p0}, Lnicoid/network238/ApiConnection254;->playbackEligible(Ljava/net/URL;)Z

    move-result v0

    if-eqz v0, :cond_1

    if-eqz p1, :cond_0

    sget-object v0, Ljava/nio/charset/StandardCharsets;->UTF_8:Ljava/nio/charset/Charset;

    invoke-virtual {p1, v0}, Ljava/lang/String;->getBytes(Ljava/nio/charset/Charset;)[B

    move-result-object p1

    array-length p1, p1

    const/high16 v0, 0x100000

    if-gt p1, v0, :cond_1

    .line 40
    :cond_0
    invoke-static {p0}, Lnicoid/network238/ApiConnection254;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 39
    :cond_1
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method static playbackEligible(Ljava/net/URL;)Z
    .registers 4

    .line 43
    invoke-static {p0}, Lnicoid/network238/ApiConnection254;->eligible(Ljava/net/URL;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 44
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v2, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v2}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p0}, Ljava/net/URL;->getPath()Ljava/lang/String;

    move-result-object p0

    .line 45
    const-string v2, "nvapi.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    const-string v2, "/v1/watch/[A-Za-z0-9]+/access-rights/hls"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_1

    goto :goto_0

    .line 46
    :cond_1
    const-string v2, "www.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_2

    const-string v2, "/api/watch/v3(?:_guest)?/[A-Za-z0-9]+"

    invoke-virtual {p0, v2}, Ljava/lang/String;->matches(Ljava/lang/String;)Z

    move-result v2

    if-eqz v2, :cond_2

    goto :goto_0

    .line 47
    :cond_2
    const-string v2, "nvcomment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "nv-comment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "public.nvcomment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_3

    const-string v2, "public.nv-comment.nicovideo.jp"

    invoke-virtual {v0, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_4

    :cond_3
    const-string v0, "/v1/threads"

    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_5

    const-string v0, "/v1/threads/"

    invoke-virtual {p0, v0}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result p0

    if-nez p0, :cond_5

    :cond_4
    goto :goto_1

    :cond_5
    :goto_0
    const/4 v1, 0x1

    .line 45
    :goto_1
    return v1
.end method


# virtual methods
.method public connect()V
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 73
    monitor-enter p0

    .line 74
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254;->cancelled:Z

    if-nez v0, :cond_c

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    :cond_0
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->failure:Ljava/io/IOException;

    if-nez v0, :cond_b

    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254;->executing:Z

    if-nez v0, :cond_a

    .line 75
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->getInstanceFollowRedirects()Z

    move-result v0

    if-nez v0, :cond_9

    .line 76
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->payload:Lnicoid/network238/ApiConnection254$BufferBody;

    invoke-virtual {v0}, Lnicoid/network238/ApiConnection254$BufferBody;->seal()[B

    move-result-object v0

    iget-wide v1, p0, Lnicoid/network238/ApiConnection254;->fixedContentLengthLong:J

    const-wide/16 v3, 0x0

    cmp-long v1, v1, v3

    if-ltz v1, :cond_1

    iget-wide v1, p0, Lnicoid/network238/ApiConnection254;->fixedContentLengthLong:J

    goto :goto_0

    :cond_1
    iget v1, p0, Lnicoid/network238/ApiConnection254;->fixedContentLength:I

    int-to-long v1, v1

    .line 77
    :goto_0
    cmp-long v3, v1, v3

    if-ltz v3, :cond_2

    array-length v3, v0

    int-to-long v3, v3

    cmp-long v1, v1, v3

    if-eqz v1, :cond_2

    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Invalid fixed body length"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 78
    :cond_2
    const-string v1, "GET"

    iget-object v2, p0, Lnicoid/network238/ApiConnection254;->method:Ljava/lang/String;

    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_4

    iget-boolean v1, p0, Lnicoid/network238/ApiConnection254;->requestedOutput:Z

    if-nez v1, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->getDoOutput()Z

    move-result v1

    if-eqz v1, :cond_4

    :cond_3
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "GET output not supported"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 79
    :cond_4
    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    const-string v2, "Content-Type"

    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/Headers$Builder;->get(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const/4 v2, 0x0

    if-nez v1, :cond_5

    move-object v1, v2

    goto :goto_1

    :cond_5
    invoke-static {v1}, Lnicoid/network238/okhttp3/MediaType;->parse(Ljava/lang/String;)Lnicoid/network238/okhttp3/MediaType;

    move-result-object v1

    .line 80
    :goto_1
    const-string v3, "POST"

    iget-object v4, p0, Lnicoid/network238/ApiConnection254;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    const-string v3, "PUT"

    iget-object v4, p0, Lnicoid/network238/ApiConnection254;->method:Ljava/lang/String;

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_6

    iget-boolean v3, p0, Lnicoid/network238/ApiConnection254;->requestedOutput:Z

    if-nez v3, :cond_6

    move-object v3, v2

    goto :goto_2

    :cond_6
    new-instance v3, Lnicoid/network238/ApiConnection254$OneShot;

    invoke-direct {v3, v0, v1}, Lnicoid/network238/ApiConnection254$OneShot;-><init>([BLnicoid/network238/okhttp3/MediaType;)V

    .line 81
    :goto_2
    const-string v0, "DELETE"

    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_7

    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254;->requestedOutput:Z

    if-nez v0, :cond_7

    goto :goto_3

    .line 82
    :cond_7
    move-object v2, v3

    :goto_3
    new-instance v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-direct {v0}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 83
    new-instance v1, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v1}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    iget-object v3, p0, Lnicoid/network238/ApiConnection254;->url:Ljava/net/URL;

    invoke-virtual {v1, v3}, Lnicoid/network238/okhttp3/Request$Builder;->url(Ljava/net/URL;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    iget-object v3, p0, Lnicoid/network238/ApiConnection254;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v3}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v3

    invoke-virtual {v1, v3}, Lnicoid/network238/okhttp3/Request$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    iget-object v3, p0, Lnicoid/network238/ApiConnection254;->method:Ljava/lang/String;

    invoke-virtual {v1, v3, v2}, Lnicoid/network238/okhttp3/Request$Builder;->method(Ljava/lang/String;Lnicoid/network238/okhttp3/RequestBody;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    .line 84
    iget-object v2, p0, Lnicoid/network238/ApiConnection254;->client:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    const/4 v3, 0x0

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followSslRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {v2, v3}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->retryOnConnectionFailure(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    .line 85
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->getConnectTimeout()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v4, v5, v6}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->getReadTimeout()I

    move-result v4

    int-to-long v4, v4

    sget-object v6, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v2, v4, v5, v6}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v2

    new-instance v4, Lnicoid/network238/ApiConnection254$0;

    invoke-direct {v4, v0}, Lnicoid/network238/ApiConnection254$0;-><init>(Ljava/util/concurrent/atomic/AtomicBoolean;)V

    .line 86
    invoke-virtual {v2, v4}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->addNetworkInterceptor(Lnicoid/network238/okhttp3/Interceptor;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v0

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v0

    .line 87
    iput-object v0, p0, Lnicoid/network238/ApiConnection254;->call:Lnicoid/network238/okhttp3/Call;

    const/4 v1, 0x1

    iput-boolean v1, p0, Lnicoid/network238/ApiConnection254;->connected:Z

    iput-boolean v1, p0, Lnicoid/network238/ApiConnection254;->executing:Z

    .line 88
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 90
    :try_start_1
    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 91
    monitor-enter p0

    :try_start_2
    iput-boolean v3, p0, Lnicoid/network238/ApiConnection254;->executing:Z

    iget-boolean v1, p0, Lnicoid/network238/ApiConnection254;->cancelled:Z

    if-nez v1, :cond_8

    iput-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    monitor-exit p0

    .line 92
    return-void

    .line 91
    :cond_8
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->close()V

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_4
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_4

    .line 90
    :catch_0
    move-exception v0

    monitor-enter p0

    :try_start_3
    iput-object v0, p0, Lnicoid/network238/ApiConnection254;->failure:Ljava/io/IOException;

    iput-boolean v3, p0, Lnicoid/network238/ApiConnection254;->executing:Z

    monitor-exit p0

    goto :goto_6

    :goto_5
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_6
    throw v0

    :catchall_1
    move-exception v0

    goto :goto_5

    .line 75
    :cond_9
    :try_start_4
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Automatic redirects not supported"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 74
    :cond_a
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Concurrent connect"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    goto :goto_7

    :cond_b
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->failure:Ljava/io/IOException;

    goto :goto_7

    :cond_c
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_7
    throw v0

    .line 88
    :goto_8
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_8
.end method

.method public disconnect()V
    .registers 4

    .line 107
    monitor-enter p0

    const/4 v0, 0x1

    :try_start_0
    iput-boolean v0, p0, Lnicoid/network238/ApiConnection254;->cancelled:Z

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->call:Lnicoid/network238/okhttp3/Call;

    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    const/4 v2, 0x0

    iput-object v2, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    iget-object v2, p0, Lnicoid/network238/ApiConnection254;->payload:Lnicoid/network238/ApiConnection254$BufferBody;

    invoke-virtual {v2}, Lnicoid/network238/ApiConnection254$BufferBody;->close()V

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->cancel()V

    :cond_0
    if-eqz v1, :cond_1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    :cond_1
    return-void

    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_0
.end method

.method public getContentLength()I
    .registers 5

    .line 106
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->getContentLengthLong()J

    move-result-wide v0

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

    .line 105
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lnicoid/network238/ApiConnection254;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-wide/16 v1, -0x1

    if-eqz v0, :cond_0

    :try_start_0
    invoke-virtual {v0}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Ljava/lang/Long;->parseLong(Ljava/lang/String;)J

    move-result-wide v3
    :try_end_0
    .catch Ljava/lang/NumberFormatException; {:try_start_0 .. :try_end_0} :catch_0

    const-wide/16 v5, 0x0

    cmp-long v0, v3, v5

    if-ltz v0, :cond_0

    move-wide v1, v3

    goto :goto_0

    :catch_0
    move-exception v0

    :cond_0
    :goto_0
    return-wide v1
.end method

.method public declared-synchronized getErrorStream()Ljava/io/InputStream;
    .registers 3

    monitor-enter p0

    .line 95
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x190

    if-lt v0, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    monitor-exit p0

    return-object v0

    .line 95
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public getHeaderField(I)Ljava/lang/String;
    .registers 4

    .line 102
    const/4 v0, 0x0

    if-ltz p1, :cond_3

    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 103
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v1, :cond_2

    if-nez p1, :cond_1

    new-instance p1, Ljava/lang/StringBuilder;

    invoke-direct {p1}, Ljava/lang/StringBuilder;-><init>()V

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->protocol()Lnicoid/network238/okhttp3/Protocol;

    move-result-object v0

    sget-object v1, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    if-ne v0, v1, :cond_0

    const-string v0, "HTTP/2"

    goto :goto_0

    :cond_0
    const-string v0, "HTTP/1.1"

    :goto_0
    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    move-result-object p1

    const-string v0, " "

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->message()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    monitor-exit p0

    return-object p1

    :cond_1
    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    if-gt p1, v1, :cond_2

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers;->value(I)Ljava/lang/String;

    move-result-object v0

    :cond_2
    monitor-exit p0

    return-object v0

    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_1

    .line 102
    :catch_0
    move-exception p1

    :cond_3
    return-object v0
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 96
    const/4 v0, 0x0

    if-eqz p1, :cond_1

    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Response;->header(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :cond_0
    monitor-exit p0

    goto :goto_1

    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0

    :catch_0
    move-exception p1

    :cond_1
    :goto_1
    return-object v0
.end method

.method public getHeaderFieldKey(I)Ljava/lang/String;
    .registers 4

    .line 98
    const/4 v0, 0x0

    if-lez p1, :cond_1

    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 99
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v1, :cond_0

    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers;->size()I

    move-result v1

    if-gt p1, v1, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->headers()Lnicoid/network238/okhttp3/Headers;

    move-result-object v0

    add-int/lit8 p1, p1, -0x1

    invoke-virtual {v0, p1}, Lnicoid/network238/okhttp3/Headers;->name(I)Ljava/lang/String;

    move-result-object v0

    :cond_0
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

    .line 98
    :catch_0
    move-exception p1

    :cond_1
    return-object v0
.end method

.method public getInputStream()Ljava/io/InputStream;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 94
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    const/16 v1, 0x190

    if-lt v0, v1, :cond_1

    const/16 v1, 0x194

    if-eq v0, v1, :cond_0

    const/16 v1, 0x19a

    if-eq v0, v1, :cond_0

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

    goto :goto_0

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

    :goto_0
    throw v1

    :cond_1
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    monitor-exit p0

    return-object v0

    :cond_2
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public declared-synchronized getOutputStream()Ljava/io/OutputStream;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    monitor-enter p0

    .line 54
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/ApiConnection254;->cancelled:Z

    if-nez v0, :cond_1

    invoke-direct {p0}, Lnicoid/network238/ApiConnection254;->mutable()V

    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->getDoOutput()Z

    move-result v0

    if-eqz v0, :cond_0

    const-string v0, "GET"

    iget-object v1, p0, Lnicoid/network238/ApiConnection254;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/ApiConnection254;->requestedOutput:Z

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->payload:Lnicoid/network238/ApiConnection254$BufferBody;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-object v0

    :cond_0
    :try_start_1
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Invalid output method"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    goto :goto_0

    :cond_1
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    :goto_0
    throw v0

    .line 54
    :goto_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1
.end method

.method public getResponseCode()I
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 93
    invoke-virtual {p0}, Lnicoid/network238/ApiConnection254;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->response:Lnicoid/network238/okhttp3/Response;

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

.method public declared-synchronized setRequestMethod(Ljava/lang/String;)V
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/ProtocolException;
        }
    .end annotation

    monitor-enter p0

    .line 53
    :try_start_0
    invoke-direct {p0}, Lnicoid/network238/ApiConnection254;->mutable()V

    const-string v0, "GET"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "POST"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "PUT"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "DELETE"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    new-instance p1, Ljava/net/ProtocolException;

    const-string v0, "Unsupported method"

    invoke-direct {p1, v0}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw p1

    :cond_0
    invoke-super {p0, p1}, Ljava/net/HttpURLConnection;->setRequestMethod(Ljava/lang/String;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    .line 53
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    throw p1

    :catchall_0
    move-exception p1

    goto :goto_0
.end method

.method public declared-synchronized setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V
    .registers 4

    monitor-enter p0

    .line 52
    :try_start_0
    invoke-direct {p0}, Lnicoid/network238/ApiConnection254;->mutable()V

    const-string v0, "Authorization"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "Proxy-Authorization"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/ApiConnection254;->headers:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    monitor-exit p0

    return-void

    :cond_0
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Unsupported credential header"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 52
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

    .line 108
    const/4 v0, 0x0

    return v0
.end method
