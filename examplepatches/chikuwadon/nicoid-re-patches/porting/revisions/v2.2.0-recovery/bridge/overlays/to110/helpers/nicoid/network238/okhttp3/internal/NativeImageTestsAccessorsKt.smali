.class public final Lnicoid/network238/okhttp3/internal/NativeImageTestsAccessorsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000D\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a \u0010\u0000\u001a\u00020\u00012\u0006\u0010\u0002\u001a\u00020\u00032\u0006\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007H\u0000\u001a\u0018\u0010\u0017\u001a\u00020\u0018*\u00020\u00192\n\u0010\u001a\u001a\u00060\u001bR\u00020\u001cH\u0000\"(\u0010\t\u001a\u00020\u0005*\u00020\n2\u0006\u0010\u0008\u001a\u00020\u00058@@@X\u0080\u000e\u00a2\u0006\u000c\u001a\u0004\u0008\u000b\u0010\u000c\"\u0004\u0008\r\u0010\u000e\"\u001a\u0010\u000f\u001a\u0004\u0018\u00010\u0010*\u00020\u00118@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0012\u0010\u0013\"\u0018\u0010\u0014\u001a\u00020\n*\u00020\u00108@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0015\u0010\u0016\u00a8\u0006\u001d"
    }
    d2 = {
        "buildCache",
        "Lnicoid/network238/okhttp3/Cache;",
        "file",
        "Lnicoid/network238/okio/Path;",
        "maxSize",
        "",
        "fileSystem",
        "Lnicoid/network238/okio/FileSystem;",
        "value",
        "idleAtNsAccessor",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "getIdleAtNsAccessor",
        "(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)J",
        "setIdleAtNsAccessor",
        "(Lnicoid/network238/okhttp3/internal/connection/RealConnection;J)V",
        "exchangeAccessor",
        "Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "Lnicoid/network238/okhttp3/Response;",
        "getExchangeAccessor",
        "(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/internal/connection/Exchange;",
        "connectionAccessor",
        "getConnectionAccessor",
        "(Lnicoid/network238/okhttp3/internal/connection/Exchange;)Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "finishedAccessor",
        "",
        "Lnicoid/network238/okhttp3/Dispatcher;",
        "call",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;",
        "Lnicoid/network238/okhttp3/internal/connection/RealCall;",
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
.method public static final buildCache(Lnicoid/network238/okio/Path;JLnicoid/network238/okio/FileSystem;)Lnicoid/network238/okhttp3/Cache;
    .registers 5

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 33
    new-instance v0, Lnicoid/network238/okhttp3/Cache;

    invoke-direct {v0, p3, p0, p1, p2}, Lnicoid/network238/okhttp3/Cache;-><init>(Lnicoid/network238/okio/FileSystem;Lnicoid/network238/okio/Path;J)V

    return-object v0
.end method

.method public static final finishedAccessor(Lnicoid/network238/okhttp3/Dispatcher;Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V
    .registers 2

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    invoke-virtual {p0, p1}, Lnicoid/network238/okhttp3/Dispatcher;->finished$okhttp(Lnicoid/network238/okhttp3/internal/connection/RealCall$AsyncCall;)V

    return-void
.end method

.method public static final getConnectionAccessor(Lnicoid/network238/okhttp3/internal/connection/Exchange;)Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 45
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/Exchange;->getConnection$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    move-result-object p0

    return-object p0
.end method

.method public static final getExchangeAccessor(Lnicoid/network238/okhttp3/Response;)Lnicoid/network238/okhttp3/internal/connection/Exchange;
    .registers 1

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 42
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/Response;->exchange()Lnicoid/network238/okhttp3/internal/connection/Exchange;

    move-result-object p0

    return-object p0
.end method

.method public static final getIdleAtNsAccessor(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)J
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 36
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->getIdleAtNs()J

    move-result-wide v0

    return-wide v0
.end method

.method public static final setIdleAtNsAccessor(Lnicoid/network238/okhttp3/internal/connection/RealConnection;J)V
    .registers 3

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    invoke-virtual {p0, p1, p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setIdleAtNs(J)V

    return-void
.end method
