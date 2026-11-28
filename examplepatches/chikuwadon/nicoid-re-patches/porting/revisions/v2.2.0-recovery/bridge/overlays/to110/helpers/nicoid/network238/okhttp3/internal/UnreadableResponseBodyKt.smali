.class public final Lnicoid/network238/okhttp3/internal/UnreadableResponseBodyKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0008\n\u0000\n\u0002\u0018\u0002\n\u0000\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0001\u00a8\u0006\u0002"
    }
    d2 = {
        "stripBody",
        "Lnicoid/network238/okhttp3/Response;",
        "okhttp"
    }
    k = 0x2
    mv = {
        0x2,
        0x1,
        0x0
    }
    xi = 0x30
.end annotation


# direct methods
.method public static final stripBody(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/Response;
    .registers 6

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 60
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->newBuilder()Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object v0

    .line 61
    new-instance v1, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object v2

    invoke-virtual {v2}, Lnicoid/network238/okhttp3/ResponseBody;->contentType()Lnicoid/network238/okhttp3/MediaType;

    move-result-object v2

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->body()Lnicoid/network238/okhttp3/ResponseBody;

    move-result-object p0

    invoke-virtual {p0}, Lnicoid/network238/okhttp3/ResponseBody;->contentLength()J

    move-result-wide v3

    invoke-direct {v1, v2, v3, v4}, Lnicoid/network238/okhttp3/internal/UnreadableResponseBody;-><init>(Lnicoid/network238/okhttp3/MediaType;J)V

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Response$Builder;->body(Lnicoid/network238/okhttp3/ResponseBody;)Lnicoid/network238/okhttp3/Response$Builder;

    move-result-object p0

    .line 62
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response$Builder;->build()Lnicoid/network238/okhttp3/Response;

    move-result-object p0

    return-object p0
.end method
