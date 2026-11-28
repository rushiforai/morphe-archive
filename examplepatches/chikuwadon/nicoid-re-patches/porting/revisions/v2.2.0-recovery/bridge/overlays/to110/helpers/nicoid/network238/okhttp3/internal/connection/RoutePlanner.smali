.class public interface abstract Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;,
        Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    }
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00006\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0003\u0008g\u0018\u00002\u00020\u0001:\u0002\u0014\u0015J\u0008\u0010\u000b\u001a\u00020\u000cH&J\u0008\u0010\r\u001a\u00020\u0008H&J\u0014\u0010\u000e\u001a\u00020\u000c2\n\u0008\u0002\u0010\u000f\u001a\u0004\u0018\u00010\u0010H&J\u0010\u0010\u0011\u001a\u00020\u000c2\u0006\u0010\u0012\u001a\u00020\u0013H&R\u0012\u0010\u0002\u001a\u00020\u0003X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0004\u0010\u0005R\u0018\u0010\u0006\u001a\u0008\u0012\u0004\u0012\u00020\u00080\u0007X\u00a6\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\t\u0010\n\u00f8\u0001\u0000\u0082\u0002\u0006\n\u0004\u0008!0\u0001\u00a8\u0006\u0016\u00c0\u0006\u0001"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;",
        "",
        "address",
        "Lnicoid/network238/okhttp3/Address;",
        "getAddress",
        "()Lnicoid/network238/okhttp3/Address;",
        "deferredPlans",
        "Lnicoid/network238/kotlin/collections/ArrayDeque;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "getDeferredPlans",
        "()Lnicoid/network238/kotlin/collections/ArrayDeque;",
        "isCanceled",
        "",
        "plan",
        "hasNext",
        "failedConnection",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "sameHostAndPort",
        "url",
        "Lnicoid/network238/okhttp3/HttpUrl;",
        "Plan",
        "ConnectResult",
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


# direct methods
.method public static synthetic hasNext$default(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;Lnicoid/network238/okhttp3/internal/connection/RealConnection;ILjava/lang/Object;)Z
    .registers 4

    if-nez p3, :cond_1

    and-int/lit8 p2, p2, 0x1

    if-eqz p2, :cond_0

    const/4 p1, 0x0

    .line 69
    :cond_0
    invoke-interface {p0, p1}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner;->hasNext(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Z

    move-result p0

    return p0

    :cond_1
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    const-string p1, "Super calls with default arguments not supported in this target, function: hasNext"

    invoke-direct {p0, p1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p0
.end method


# virtual methods
.method public abstract getAddress()Lnicoid/network238/okhttp3/Address;
.end method

.method public abstract getDeferredPlans()Lnicoid/network238/kotlin/collections/ArrayDeque;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lnicoid/network238/kotlin/collections/ArrayDeque;"
        }
    .end annotation
.end method

.method public abstract hasNext(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)Z
.end method

.method public abstract isCanceled()Z
.end method

.method public abstract plan()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation
.end method

.method public abstract sameHostAndPort(Lnicoid/network238/okhttp3/HttpUrl;)Z
.end method
