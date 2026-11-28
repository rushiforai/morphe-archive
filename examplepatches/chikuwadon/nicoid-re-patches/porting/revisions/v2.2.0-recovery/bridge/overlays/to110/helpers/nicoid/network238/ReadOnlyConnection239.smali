.class public final Lnicoid/network238/ReadOnlyConnection239;
.super Ljava/net/HttpURLConnection;
.source "ReadOnlyConnection239.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/ReadOnlyConnection239$Shared;
    }
.end annotation


# instance fields
.field private final apiMode:Z

.field private bodyGuard:Lnicoid/network238/GuardedBody277;

.field private call:Lnicoid/network238/okhttp3/Call;

.field private cancelled:Z

.field private executing:Z

.field private failure:Ljava/io/IOException;

.field private final requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

.field private response:Lnicoid/network238/okhttp3/Response;


# direct methods
.method private constructor <init>(Ljava/net/URL;)V
    .registers 3

    .line 18
    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lnicoid/network238/ReadOnlyConnection239;-><init>(Ljava/net/URL;Z)V

    return-void
.end method

.method private constructor <init>(Ljava/net/URL;Z)V
    .registers 3

    .line 19
    invoke-direct {p0, p1}, Ljava/net/HttpURLConnection;-><init>(Ljava/net/URL;)V

    .line 11
    new-instance p1, Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-direct {p1}, Lnicoid/network238/okhttp3/Headers$Builder;-><init>()V

    iput-object p1, p0, Lnicoid/network238/ReadOnlyConnection239;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    .line 19
    iput-boolean p2, p0, Lnicoid/network238/ReadOnlyConnection239;->apiMode:Z

    return-void
.end method

.method static apiEligible(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Z
    .registers 4

    .line 22
    const-string v0, "GET"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    const/4 v0, 0x0

    if-eqz p1, :cond_2

    if-nez p2, :cond_2

    const-string p1, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p1, p2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_2

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object p1

    if-nez p1, :cond_2

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result p1

    const/16 p2, 0x1bb

    if-ne p1, p2, :cond_2

    .line 23
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    sget-object p1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {p0, p1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object p0

    .line 24
    const-string p1, "nvapi.nicovideo.jp"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "www.nicovideo.jp"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "api.feed.nicovideo.jp"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "public-api.ch.nicovideo.jp"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-nez p1, :cond_1

    const-string p1, "user-follow-api.nicovideo.jp"

    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_1

    goto :goto_0

    :cond_1
    const/4 v0, 0x1

    :goto_0
    return v0

    .line 22
    :cond_2
    return v0
.end method

.method public static open(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 36
    const-string v0, "http"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_0

    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_0
    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_1

    .line 37
    new-instance v0, Lnicoid/network238/ReadOnlyConnection239;

    invoke-direct {v0, p0}, Lnicoid/network238/ReadOnlyConnection239;-><init>(Ljava/net/URL;)V

    return-object v0

    .line 36
    :cond_1
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static openApi(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Ljava/net/URLConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 27
    invoke-static {p0, p1, p2}, Lnicoid/network238/ReadOnlyConnection239;->apiEligible(Ljava/net/URL;Ljava/lang/String;Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object p1

    if-nez p1, :cond_1

    .line 28
    new-instance p1, Lnicoid/network238/ReadOnlyConnection239;

    const/4 p2, 0x1

    invoke-direct {p1, p0, p2}, Lnicoid/network238/ReadOnlyConnection239;-><init>(Ljava/net/URL;Z)V

    .line 29
    const/4 p0, 0x0

    invoke-virtual {p1, p0}, Lnicoid/network238/ReadOnlyConnection239;->setInstanceFollowRedirects(Z)V

    .line 30
    const-string p0, "http.agent"

    invoke-static {p0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    .line 31
    if-eqz p0, :cond_0

    invoke-virtual {p0}, Ljava/lang/String;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_0

    const-string p2, "User-Agent"

    invoke-virtual {p1, p2, p0}, Lnicoid/network238/ReadOnlyConnection239;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 32
    :cond_0
    return-object p1

    .line 27
    :cond_1
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static openHeaders(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 41
    invoke-static {p0}, Lnicoid/network238/ReadOnlyConnection239;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    .line 42
    instance-of v0, p0, Lnicoid/network238/ReadOnlyConnection239;

    if-eqz v0, :cond_0

    .line 43
    move-object v0, p0

    check-cast v0, Ljava/net/HttpURLConnection;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Ljava/net/HttpURLConnection;->setInstanceFollowRedirects(Z)V

    .line 44
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 45
    if-eqz v0, :cond_0

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "User-Agent"

    invoke-virtual {p0, v1, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    :cond_0
    return-object p0
.end method

.method public static openImage(Ljava/net/URL;)Ljava/net/URLConnection;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 54
    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_4

    invoke-static {}, Ljava/net/ResponseCache;->getDefault()Ljava/net/ResponseCache;

    move-result-object v0

    if-nez v0, :cond_4

    .line 56
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    if-eqz v0, :cond_3

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_3

    .line 58
    const/4 v1, 0x0

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v1, v2, :cond_1

    .line 59
    invoke-virtual {v0, v1}, Ljava/lang/String;->charAt(I)C

    move-result v2

    .line 60
    const/16 v3, 0x20

    if-lt v2, v3, :cond_0

    const/16 v3, 0x7e

    if-gt v2, v3, :cond_0

    .line 58
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 60
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 62
    :cond_1
    invoke-static {p0}, Lnicoid/network238/ReadOnlyConnection239;->open(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    .line 63
    instance-of v1, p0, Lnicoid/network238/ReadOnlyConnection239;

    if-eqz v1, :cond_2

    const-string v1, "User-Agent"

    invoke-virtual {p0, v1, v0}, Ljava/net/URLConnection;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    .line 64
    :cond_2
    return-object p0

    .line 57
    :cond_3
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 55
    :cond_4
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static openLiveBrowser(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;
    .registers 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 83
    const-string v1, "live.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-nez v1, :cond_0

    const-string v1, "live2.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    move v1, v3

    goto :goto_0

    :cond_0
    move v1, v2

    .line 84
    :goto_0
    const-string v4, "nicovideo.jp"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, ".nicovideo.jp"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, "nimg.jp"

    invoke-virtual {v0, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_1

    const-string v4, ".nimg.jp"

    invoke-virtual {v0, v4}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    move v2, v3

    .line 85
    :cond_1
    if-eqz v2, :cond_5

    const-string v0, "https"

    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v2

    invoke-virtual {v0, v2}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_5

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_5

    .line 86
    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_2

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/16 v2, 0x1bb

    if-ne v0, v2, :cond_5

    :cond_2
    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_5

    invoke-static {}, Ljava/net/ResponseCache;->getDefault()Ljava/net/ResponseCache;

    move-result-object v0

    if-nez v0, :cond_5

    .line 88
    if-eqz v1, :cond_4

    if-eqz p1, :cond_4

    move v0, v3

    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v2

    if-ge v0, v2, :cond_4

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x20

    if-lt v2, v4, :cond_3

    invoke-virtual {p1, v0}, Ljava/lang/String;->charAt(I)C

    move-result v2

    const/16 v4, 0x7e

    if-gt v2, v4, :cond_3

    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_3
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 89
    :cond_4
    new-instance p1, Lnicoid/network238/ReadOnlyConnection239;

    invoke-direct {p1, p0, v1}, Lnicoid/network238/ReadOnlyConnection239;-><init>(Ljava/net/URL;Z)V

    .line 90
    invoke-virtual {p1, v3}, Lnicoid/network238/ReadOnlyConnection239;->setInstanceFollowRedirects(Z)V

    .line 91
    return-object p1

    .line 87
    :cond_5
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static openManualCookieGet(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;
    .registers 8
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    sget-object v1, Ljava/util/Locale;->ROOT:Ljava/util/Locale;

    invoke-virtual {v0, v1}, Ljava/lang/String;->toLowerCase(Ljava/util/Locale;)Ljava/lang/String;

    move-result-object v0

    .line 69
    const-string v1, "api.feed.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_0

    const-string v1, "ch.nicovideo.jp"

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    goto/16 :goto_2

    .line 70
    :cond_0
    invoke-virtual {p0}, Ljava/net/URL;->getProtocol()Ljava/lang/String;

    move-result-object v0

    const-string v1, "https"

    invoke-virtual {v1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-virtual {p0}, Ljava/net/URL;->getUserInfo()Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_7

    .line 71
    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result v0

    const/16 v1, 0x1bb

    if-ne v0, v1, :cond_7

    :cond_1
    invoke-static {}, Ljava/net/CookieHandler;->getDefault()Ljava/net/CookieHandler;

    move-result-object v0

    if-nez v0, :cond_7

    .line 72
    invoke-static {}, Ljava/net/ResponseCache;->getDefault()Ljava/net/ResponseCache;

    move-result-object v0

    if-nez v0, :cond_7

    if-eqz p1, :cond_7

    .line 73
    const-string v0, "http.agent"

    invoke-static {v0}, Ljava/lang/System;->getProperty(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 74
    if-eqz v0, :cond_6

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_6

    .line 75
    const/4 v1, 0x0

    move v2, v1

    :goto_0
    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    const/16 v4, 0x7e

    const/16 v5, 0x20

    if-ge v2, v3, :cond_3

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v5, :cond_2

    invoke-virtual {v0, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-gt v3, v4, :cond_2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_2
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 76
    :cond_3
    move v2, v1

    :goto_1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    move-result v3

    if-ge v2, v3, :cond_5

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-lt v3, v5, :cond_4

    invoke-virtual {p1, v2}, Ljava/lang/String;->charAt(I)C

    move-result v3

    if-gt v3, v4, :cond_4

    add-int/lit8 v2, v2, 0x1

    goto :goto_1

    :cond_4
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 77
    :cond_5
    new-instance p1, Lnicoid/network238/ReadOnlyConnection239;

    const/4 v2, 0x1

    invoke-direct {p1, p0, v2}, Lnicoid/network238/ReadOnlyConnection239;-><init>(Ljava/net/URL;Z)V

    .line 78
    invoke-virtual {p1, v1}, Lnicoid/network238/ReadOnlyConnection239;->setInstanceFollowRedirects(Z)V

    const-string p0, "User-Agent"

    invoke-virtual {p1, p0, v0}, Lnicoid/network238/ReadOnlyConnection239;->setRequestProperty(Ljava/lang/String;Ljava/lang/String;)V

    return-object p1

    .line 74
    :cond_6
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 72
    :cond_7
    :goto_2
    invoke-virtual {p0}, Ljava/net/URL;->openConnection()Ljava/net/URLConnection;

    move-result-object p0

    return-object p0
.end method

.method public static openShortsGet(Ljava/net/URL;Ljava/lang/String;)Ljava/net/URLConnection;
    .registers 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 95
    if-eqz p1, :cond_1

    invoke-virtual {p1}, Ljava/lang/String;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_1

    const-string p1, "nvapi.nicovideo.jp"

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result p1

    if-eqz p1, :cond_1

    .line 96
    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_0

    invoke-virtual {p0}, Ljava/net/URL;->getPort()I

    move-result p1

    const/16 v0, 0x1bb

    if-eq p1, v0, :cond_0

    goto :goto_0

    .line 97
    :cond_0
    invoke-static {p0}, Lnicoid/network238/ReadOnlyConnection239;->openImage(Ljava/net/URL;)Ljava/net/URLConnection;

    move-result-object p0

    return-object p0

    .line 96
    :cond_1
    :goto_0
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

    .line 46
    monitor-enter p0

    .line 47
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/ReadOnlyConnection239;->cancelled:Z

    if-nez v0, :cond_6

    .line 48
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    monitor-exit p0

    return-void

    .line 49
    :cond_0
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->failure:Ljava/io/IOException;

    if-nez v0, :cond_5

    .line 50
    iget-boolean v0, p0, Lnicoid/network238/ReadOnlyConnection239;->executing:Z

    if-nez v0, :cond_4

    .line 51
    const-string v0, "GET"

    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->method:Ljava/lang/String;

    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_3

    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->getDoOutput()Z

    move-result v0

    if-nez v0, :cond_3

    .line 52
    new-instance v0, Lnicoid/network238/okhttp3/Request$Builder;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/Request$Builder;-><init>()V

    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->url:Ljava/net/URL;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->url(Ljava/net/URL;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Headers$Builder;->build()Lnicoid/network238/okhttp3/Headers;

    move-result-object v1

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request$Builder;->headers(Lnicoid/network238/okhttp3/Headers;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->get()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v0

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    .line 53
    sget-object v1, Lnicoid/network238/ReadOnlyConnection239$Shared;->CLIENT:Lnicoid/network238/okhttp3/OkHttpClient;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient;->newBuilder()Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->getConnectTimeout()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->connectTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 54
    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->getReadTimeout()I

    move-result v2

    int-to-long v2, v2

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v1, v2, v3, v4}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->readTimeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    iget-boolean v2, p0, Lnicoid/network238/ReadOnlyConnection239;->apiMode:Z

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-nez v2, :cond_1

    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->getInstanceFollowRedirects()Z

    move-result v2

    if-eqz v2, :cond_1

    move v2, v3

    goto :goto_0

    :cond_1
    move v2, v4

    :goto_0
    invoke-virtual {v1, v2}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->followRedirects(Z)Lnicoid/network238/okhttp3/OkHttpClient$Builder;

    move-result-object v1

    .line 55
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/OkHttpClient$Builder;->build()Lnicoid/network238/okhttp3/OkHttpClient;

    move-result-object v1

    invoke-virtual {v1, v0}, Lnicoid/network238/okhttp3/OkHttpClient;->newCall(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Call;

    move-result-object v0

    .line 56
    iput-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->call:Lnicoid/network238/okhttp3/Call;

    .line 57
    iput-boolean v3, p0, Lnicoid/network238/ReadOnlyConnection239;->connected:Z

    .line 58
    iput-boolean v3, p0, Lnicoid/network238/ReadOnlyConnection239;->executing:Z

    .line 59
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 61
    :try_start_1
    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->execute()Lnicoid/network238/okhttp3/Response;

    move-result-object v0
    :try_end_1
    .catch Ljava/io/IOException; {:try_start_1 .. :try_end_1} :catch_0

    .line 62
    nop

    .line 63
    monitor-enter p0

    .line 64
    :try_start_2
    iput-boolean v4, p0, Lnicoid/network238/ReadOnlyConnection239;->executing:Z

    .line 65
    iget-boolean v1, p0, Lnicoid/network238/ReadOnlyConnection239;->cancelled:Z

    if-nez v1, :cond_2

    .line 66
    iput-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    .line 67
    monitor-exit p0

    .line 68
    return-void

    .line 65
    :cond_2
    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->close()V

    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 67
    :goto_1
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    throw v0

    :catchall_0
    move-exception v0

    goto :goto_1

    .line 62
    :catch_0
    move-exception v0

    monitor-enter p0

    :try_start_3
    iput-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->failure:Ljava/io/IOException;

    iput-boolean v4, p0, Lnicoid/network238/ReadOnlyConnection239;->executing:Z

    monitor-exit p0

    goto :goto_3

    :goto_2
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    :goto_3
    throw v0

    :catchall_1
    move-exception v0

    goto :goto_2

    .line 51
    :cond_3
    :try_start_4
    new-instance v0, Ljava/net/ProtocolException;

    const-string v1, "Only GET supported"

    invoke-direct {v0, v1}, Ljava/net/ProtocolException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 50
    :cond_4
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Concurrent connect"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 49
    :cond_5
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->failure:Ljava/io/IOException;

    throw v0

    .line 47
    :cond_6
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 59
    :goto_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    throw v0

    :catchall_2
    move-exception v0

    goto :goto_4
.end method

.method public disconnect()V
    .registers 5

    monitor-enter p0

    :try_start_0
    const/4 v0, 0x1

    iput-boolean v0, p0, Lnicoid/network238/ReadOnlyConnection239;->cancelled:Z

    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->call:Lnicoid/network238/okhttp3/Call;

    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    iget-object v2, p0, Lnicoid/network238/ReadOnlyConnection239;->bodyGuard:Lnicoid/network238/GuardedBody277;

    const/4 v3, 0x0

    iput-object v3, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    iput-object v3, p0, Lnicoid/network238/ReadOnlyConnection239;->bodyGuard:Lnicoid/network238/GuardedBody277;

    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    if-eqz v0, :cond_0

    invoke-interface {v0}, Lnicoid/network238/okhttp3/Call;->cancel()V

    :cond_0
    invoke-static {v2, v1}, Lnicoid/network238/GuardedBody277;->finish(Lnicoid/network238/GuardedBody277;Lnicoid/network238/okhttp3/Response;)V

    return-void

    :catchall_0
    move-exception v0

    monitor-exit p0

    throw v0
.end method

.method public getContentEncoding()Ljava/lang/String;
    .registers 2

    .line 99
    const-string v0, "Content-Encoding"

    invoke-virtual {p0, v0}, Lnicoid/network238/ReadOnlyConnection239;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getContentLength()I
    .registers 5

    .line 62
    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->getContentLengthLong()J

    move-result-wide v0

    .line 63
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

    .line 56
    const-string v0, "Content-Length"

    invoke-virtual {p0, v0}, Lnicoid/network238/ReadOnlyConnection239;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    .line 57
    const-wide/16 v1, -0x1

    if-nez v0, :cond_0

    return-wide v1

    .line 58
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

    .line 59
    :catch_0
    move-exception v0

    return-wide v1
.end method

.method public getContentType()Ljava/lang/String;
    .registers 2

    .line 65
    const-string v0, "Content-Type"

    invoke-virtual {p0, v0}, Lnicoid/network238/ReadOnlyConnection239;->getHeaderField(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method

.method public getHeaderField(Ljava/lang/String;)Ljava/lang/String;
    .registers 4

    .line 51
    const/4 v0, 0x0

    if-nez p1, :cond_0

    return-object v0

    .line 52
    :cond_0
    :try_start_0
    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->connect()V
    :try_end_0
    .catch Ljava/io/IOException; {:try_start_0 .. :try_end_0} :catch_0

    .line 53
    monitor-enter p0

    :try_start_1
    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v1, :cond_1

    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

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

    .line 52
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

    .line 71
    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->connect()V

    .line 72
    monitor-enter p0

    .line 73
    :try_start_0
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_3

    .line 74
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v0

    .line 75
    const/16 v1, 0x190

    if-lt v0, v1, :cond_1

    .line 76
    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Response;->close()V

    .line 77
    const/16 v1, 0x194

    if-eq v0, v1, :cond_0

    const/16 v1, 0x19a

    if-eq v0, v1, :cond_0

    .line 78
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

    .line 77
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

    .line 80
    :cond_1
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->bodyGuard:Lnicoid/network238/GuardedBody277;

    if-nez v1, :cond_2

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/ResponseBody;->byteStream()Ljava/io/InputStream;

    move-result-object v0

    new-instance v1, Lnicoid/network238/GuardedBody277;

    invoke-direct {v1, v0}, Lnicoid/network238/GuardedBody277;-><init>(Ljava/io/InputStream;)V

    iput-object v1, p0, Lnicoid/network238/ReadOnlyConnection239;->bodyGuard:Lnicoid/network238/GuardedBody277;

    :cond_2
    move-object v0, v1

    monitor-exit p0

    return-object v0

    .line 73
    :cond_3
    new-instance v0, Ljava/io/IOException;

    const-string v1, "Cancelled"

    invoke-direct {v0, v1}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw v0

    .line 81
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

    .line 69
    invoke-virtual {p0}, Lnicoid/network238/ReadOnlyConnection239;->connect()V

    monitor-enter p0

    :try_start_0
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

    if-eqz v0, :cond_0

    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->response:Lnicoid/network238/okhttp3/Response;

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

    .line 40
    :try_start_0
    iget-boolean v0, p0, Lnicoid/network238/ReadOnlyConnection239;->connected:Z

    if-nez v0, :cond_2

    iget-boolean v0, p0, Lnicoid/network238/ReadOnlyConnection239;->cancelled:Z

    if-nez v0, :cond_2

    .line 41
    const-string v0, "Cookie"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_0

    iget-boolean v0, p0, Lnicoid/network238/ReadOnlyConnection239;->apiMode:Z

    if-eqz v0, :cond_1

    :cond_0
    const-string v0, "Authorization"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    const-string v0, "Proxy-Authorization"

    invoke-virtual {v0, p1}, Ljava/lang/String;->equalsIgnoreCase(Ljava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_1

    .line 42
    iget-object v0, p0, Lnicoid/network238/ReadOnlyConnection239;->requestHeaders:Lnicoid/network238/okhttp3/Headers$Builder;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/Headers$Builder;->set(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Headers$Builder;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 43
    monitor-exit p0

    return-void

    .line 41
    :cond_1
    :try_start_1
    new-instance p1, Ljava/lang/IllegalArgumentException;

    const-string p2, "Authenticated request requires dedicated transport"

    invoke-direct {p1, p2}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 40
    :cond_2
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string p2, "Already connected"

    invoke-direct {p1, p2}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1

    .line 39
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

    .line 89
    const/4 v0, 0x0

    return v0
.end method
