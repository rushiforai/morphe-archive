.class public final Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/Authenticator;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator$WhenMappings;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0018\u00002\u00020\u0001B\u0011\u0012\u0008\u0008\u0002\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u001c\u0010\u0006\u001a\u0004\u0018\u00010\u00072\u0008\u0010\u0008\u001a\u0004\u0018\u00010\t2\u0006\u0010\n\u001a\u00020\u000bH\u0016J\u001c\u0010\u000c\u001a\u00020\r*\u00020\u000e2\u0006\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u0011\u001a\u00020\u0003H\u0002R\u000e\u0010\u0002\u001a\u00020\u0003X\u0082\u0004\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0012"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;",
        "Lnicoid/network238/okhttp3/Authenticator;",
        "defaultDns",
        "Lnicoid/network238/okhttp3/Dns;",
        "<init>",
        "(Lnicoid/network238/okhttp3/Dns;)V",
        "authenticate",
        "Lnicoid/network238/okhttp3/Request;",
        "route",
        "Lnicoid/network238/okhttp3/Route;",
        "response",
        "Lnicoid/network238/okhttp3/Response;",
        "connectToInetAddress",
        "Ljava/net/InetAddress;",
        "Ljava/net/Proxy;",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "dns",
        "okhttp"
    }
    k = 0x1
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private final defaultDns:Lnicoid/network238/okhttp3/Dns;


# direct methods
.method public constructor <init>()V
    .registers 3

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-direct {p0, v0, v1, v0}, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;-><init>(Lnicoid/network238/okhttp3/Dns;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/Dns;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 34
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 35
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;->defaultDns:Lnicoid/network238/okhttp3/Dns;

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/okhttp3/Dns;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 4

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    .line 35
    sget-object p1, Lnicoid/network238/okhttp3/Dns;->SYSTEM:Lnicoid/network238/okhttp3/Dns;

    .line 34
    :cond_0
    invoke-direct {p0, p1}, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;-><init>(Lnicoid/network238/okhttp3/Dns;)V

    return-void
.end method

.method private final connectToInetAddress(Ljava/net/Proxy;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Dns;)Ljava/net/InetAddress;
    .registers 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 103
    invoke-virtual {p1}, Ljava/net/Proxy;->type()Ljava/net/Proxy$Type;

    move-result-object v0

    if-nez v0, :cond_0

    const/4 v0, -0x1

    goto :goto_0

    :cond_0
    sget-object v1, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator$WhenMappings;->$EnumSwitchMapping$0:[I

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    aget v0, v1, v0

    :goto_0
    const/4 v1, 0x1

    if-ne v0, v1, :cond_1

    .line 104
    invoke-virtual {p2}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object p1

    invoke-interface {p3, p1}, Lnicoid/network238/okhttp3/Dns;->lookup(Ljava/lang/String;)Ljava/util/List;

    move-result-object p1

    invoke-static {p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->first(Ljava/util/List;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/net/InetAddress;

    return-object p1

    .line 105
    :cond_1
    invoke-virtual {p1}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p1, Ljava/net/InetSocketAddress;

    invoke-virtual {p1}, Ljava/net/InetSocketAddress;->getAddress()Ljava/net/InetAddress;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1
.end method


# virtual methods
.method public authenticate(Lnicoid/network238/okhttp3/Route;Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Request;
    .registers 21
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    move-object/from16 v0, p0

    invoke-virtual/range {p2 .. p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-virtual/range {p2 .. p2}, Lnicoid/network238/okhttp3/Response;->challenges()Ljava/util/List;

    move-result-object v1

    .line 43
    invoke-virtual/range {p2 .. p2}, Lnicoid/network238/okhttp3/Response;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v2

    .line 44
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object v3

    .line 45
    invoke-virtual/range {p2 .. p2}, Lnicoid/network238/okhttp3/Response;->code()I

    move-result v4

    const/16 v5, 0x197

    const/4 v6, 0x1

    if-ne v4, v5, :cond_0

    move v4, v6

    goto :goto_0

    :cond_0
    const/4 v4, 0x0

    :goto_0
    if-eqz p1, :cond_1

    .line 46
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->proxy()Ljava/net/Proxy;

    move-result-object v5

    if-nez v5, :cond_2

    :cond_1
    sget-object v5, Ljava/net/Proxy;->NO_PROXY:Ljava/net/Proxy;

    .line 48
    :cond_2
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_3
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_7

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lnicoid/network238/okhttp3/Challenge;

    .line 49
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Challenge;->scheme()Ljava/lang/String;

    move-result-object v8

    const-string v9, "Basic"

    invoke-static {v9, v8, v6}, Lnicoid/network238/kotlin/text/StringsKt;->equals(Ljava/lang/String;Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_3

    if-eqz p1, :cond_4

    .line 53
    invoke-virtual/range {p1 .. p1}, Lnicoid/network238/okhttp3/Route;->address()Lnicoid/network238/okhttp3/Address;

    move-result-object v8

    if-eqz v8, :cond_4

    invoke-virtual {v8}, Lnicoid/network238/okhttp3/Address;->dns()Lnicoid/network238/okhttp3/Dns;

    move-result-object v8

    if-eqz v8, :cond_4

    goto :goto_1

    :cond_4
    iget-object v8, v0, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;->defaultDns:Lnicoid/network238/okhttp3/Dns;

    :goto_1
    if-eqz v4, :cond_5

    .line 56
    invoke-virtual {v5}, Ljava/net/Proxy;->address()Ljava/net/SocketAddress;

    move-result-object v9

    invoke-virtual {v9}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast v9, Ljava/net/InetSocketAddress;

    .line 58
    invoke-virtual {v9}, Ljava/net/InetSocketAddress;->getHostName()Ljava/lang/String;

    move-result-object v10

    .line 59
    invoke-direct {v0, v5, v3, v8}, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;->connectToInetAddress(Ljava/net/Proxy;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Dns;)Ljava/net/InetAddress;

    move-result-object v11

    .line 60
    invoke-virtual {v9}, Ljava/net/InetSocketAddress;->getPort()I

    move-result v12

    .line 61
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v13

    .line 62
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Challenge;->realm()Ljava/lang/String;

    move-result-object v14

    .line 63
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Challenge;->scheme()Ljava/lang/String;

    move-result-object v15

    .line 64
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v16

    .line 65
    sget-object v17, Ljava/net/Authenticator$RequestorType;->PROXY:Ljava/net/Authenticator$RequestorType;

    .line 57
    invoke-static/range {v10 .. v17}, Ljava/net/Authenticator;->requestPasswordAuthentication(Ljava/lang/String;Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;Ljava/net/Authenticator$RequestorType;)Ljava/net/PasswordAuthentication;

    move-result-object v8

    goto :goto_2

    .line 69
    :cond_5
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->host()Ljava/lang/String;

    move-result-object v9

    .line 70
    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-direct {v0, v5, v3, v8}, Lnicoid/network238/okhttp3/internal/authenticator/JavaNetAuthenticator;->connectToInetAddress(Ljava/net/Proxy;Lnicoid/network238/okhttp3/HttpUrl;Lnicoid/network238/okhttp3/Dns;)Ljava/net/InetAddress;

    move-result-object v10

    .line 71
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->port()I

    move-result v11

    .line 72
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->scheme()Ljava/lang/String;

    move-result-object v12

    .line 73
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Challenge;->realm()Ljava/lang/String;

    move-result-object v13

    .line 74
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Challenge;->scheme()Ljava/lang/String;

    move-result-object v14

    .line 75
    invoke-virtual {v3}, Lnicoid/network238/okhttp3/HttpUrl;->url()Ljava/net/URL;

    move-result-object v15

    .line 76
    sget-object v16, Ljava/net/Authenticator$RequestorType;->SERVER:Ljava/net/Authenticator$RequestorType;

    .line 68
    invoke-static/range {v9 .. v16}, Ljava/net/Authenticator;->requestPasswordAuthentication(Ljava/lang/String;Ljava/net/InetAddress;ILjava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/net/URL;Ljava/net/Authenticator$RequestorType;)Ljava/net/PasswordAuthentication;

    move-result-object v8

    :goto_2
    if-eqz v8, :cond_3

    if-eqz v4, :cond_6

    .line 81
    const-string v1, "Proxy-Authorization"

    goto :goto_3

    :cond_6
    const-string v1, "Authorization"

    .line 84
    :goto_3
    invoke-virtual {v8}, Ljava/net/PasswordAuthentication;->getUserName()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 85
    invoke-virtual {v8}, Ljava/net/PasswordAuthentication;->getPassword()[C

    move-result-object v4

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ljava/lang/String;

    invoke-direct {v5, v4}, Ljava/lang/String;-><init>([C)V

    .line 86
    invoke-virtual {v7}, Lnicoid/network238/okhttp3/Challenge;->charset()Ljava/nio/charset/Charset;

    move-result-object v4

    .line 83
    invoke-static {v3, v5, v4}, Lnicoid/network238/okhttp3/Credentials;->basic(Ljava/lang/String;Ljava/lang/String;Ljava/nio/charset/Charset;)Ljava/lang/String;

    move-result-object v3

    .line 89
    invoke-virtual {v2}, Lnicoid/network238/okhttp3/Request;->newBuilder()Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v2

    .line 90
    invoke-virtual {v2, v1, v3}, Lnicoid/network238/okhttp3/Request$Builder;->header(Ljava/lang/String;Ljava/lang/String;)Lnicoid/network238/okhttp3/Request$Builder;

    move-result-object v1

    .line 91
    invoke-virtual {v1}, Lnicoid/network238/okhttp3/Request$Builder;->build()Lnicoid/network238/okhttp3/Request;

    move-result-object v1

    return-object v1

    :cond_7
    const/4 v1, 0x0

    return-object v1
.end method
