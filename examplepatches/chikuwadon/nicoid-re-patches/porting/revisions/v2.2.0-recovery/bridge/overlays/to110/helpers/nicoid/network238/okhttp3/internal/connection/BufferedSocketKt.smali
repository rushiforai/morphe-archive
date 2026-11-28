.class public final Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0002\u001a\n\u0010\u0000\u001a\u00020\u0001*\u00020\u0003\u00a8\u0006\u0004"
    }
    d2 = {
        "asBufferedSocket",
        "Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;",
        "Ljava/net/Socket;",
        "Lnicoid/network238/okio/Socket;",
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
.method public static final asBufferedSocket(Ljava/net/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 30
    invoke-static {p0}, Lnicoid/network238/okio/Okio;->socket(Ljava/net/Socket;)Lnicoid/network238/okio/Socket;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt;->asBufferedSocket(Lnicoid/network238/okio/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;

    move-result-object p0

    return-object p0
.end method

.method public static final asBufferedSocket(Lnicoid/network238/okio/Socket;)Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;

    invoke-direct {v0, p0}, Lnicoid/network238/okhttp3/internal/connection/BufferedSocketKt$asBufferedSocket$1;-><init>(Lnicoid/network238/okio/Socket;)V

    return-object v0
.end method
