.class public final Lnicoid/network238/okhttp3/internal/http/RequestLine;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000,\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0000\u0008\u00c6\u0002\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u0016\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tJ\u0018\u0010\n\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\tH\u0002J\u000e\u0010\u000c\u001a\u00020\u00052\u0006\u0010\r\u001a\u00020\u000e\u00a8\u0006\u000f"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/http/RequestLine;",
        "",
        "<init>",
        "()V",
        "get",
        "",
        "request",
        "Lnicoid/network238/okhttp3/Request;",
        "proxyType",
        "Ljava/net/Proxy$Type;",
        "includeAuthorityInRequestLine",
        "",
        "requestPath",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
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


# static fields
.field public static final INSTANCE:Lnicoid/network238/okhttp3/internal/http/RequestLine;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Lnicoid/network238/okhttp3/internal/http/RequestLine;

    invoke-direct {v0}, Lnicoid/network238/okhttp3/internal/http/RequestLine;-><init>()V

    sput-object v0, Lnicoid/network238/okhttp3/internal/http/RequestLine;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/RequestLine;

    return-void
.end method

.method private constructor <init>()V
    .registers 1

    .line 22
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final includeAuthorityInRequestLine(Lnicoid/network238/okhttp3/Request;Ljava/net/Proxy$Type;)Z
    .registers 3

    .line 50
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->isHttps()Z

    move-result p1

    if-nez p1, :cond_0

    sget-object p1, Ljava/net/Proxy$Type;->HTTP:Ljava/net/Proxy$Type;

    if-ne p2, p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method


# virtual methods
.method public final get(Lnicoid/network238/okhttp3/Request;Ljava/net/Proxy$Type;)Ljava/lang/String;
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 33
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->method()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 34
    const/16 v1, 0x20

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    .line 35
    sget-object v1, Lnicoid/network238/okhttp3/internal/http/RequestLine;->INSTANCE:Lnicoid/network238/okhttp3/internal/http/RequestLine;

    invoke-direct {v1, p1, p2}, Lnicoid/network238/okhttp3/internal/http/RequestLine;->includeAuthorityInRequestLine(Lnicoid/network238/okhttp3/Request;Ljava/net/Proxy$Type;)Z

    move-result p2

    if-eqz p2, :cond_0

    .line 36
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    goto :goto_0

    .line 38
    :cond_0
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/Request;->url()Lnicoid/network238/okhttp3/HttpUrl;

    move-result-object p1

    invoke-virtual {v1, p1}, Lnicoid/network238/okhttp3/internal/http/RequestLine;->requestPath(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 40
    :goto_0
    const-string p1, " HTTP/1.1"

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 32
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1
.end method

.method public final requestPath(Lnicoid/network238/okhttp3/HttpUrl;)Ljava/lang/String;
    .registers 4

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 57
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedPath()Ljava/lang/String;

    move-result-object v0

    .line 58
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/HttpUrl;->encodedQuery()Ljava/lang/String;

    move-result-object p1

    if-eqz p1, :cond_0

    .line 59
    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object v0

    const/16 v1, 0x3f

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    move-result-object v0

    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    return-object p1

    :cond_0
    return-object v0
.end method
