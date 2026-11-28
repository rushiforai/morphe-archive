.class public final Lnicoid/network238/okhttp3/internal/connection/ReusePlan;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0002\n\u0002\u0010\u0001\n\u0002\u0008\u0005\u0008\u0001\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\u000b\u001a\u00020\u000cH\u0016J\u0008\u0010\r\u001a\u00020\u000cH\u0016J\u0008\u0010\u000e\u001a\u00020\u0003H\u0016J\u0008\u0010\u000f\u001a\u00020\u000cH\u0016J\u0008\u0010\u0010\u001a\u00020\u000cH\u0016R\u0011\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0006\u0010\u0007R\u0014\u0010\u0008\u001a\u00020\tX\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\n\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/ReusePlan;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "connection",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V",
        "getConnection",
        "()Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "isReady",
        "",
        "()Z",
        "connectTcp",
        "",
        "connectTlsEtc",
        "handleSuccess",
        "cancel",
        "retry",
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
.field private final connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

.field private final isReady:Z


# direct methods
.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealConnection;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 21
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 23
    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 25
    const/4 p1, 0x1

    iput-boolean p1, p0, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->isReady:Z

    return-void
.end method


# virtual methods
.method public cancel()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 33
    const-string v1, "unexpected cancel"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic cancel()V
    .registers 1

    .line 21
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->cancel()Ljava/lang/Void;

    return-void
.end method

.method public connectTcp()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 27
    const-string v1, "already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic connectTcp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 2

    .line 21
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->connectTcp()Ljava/lang/Void;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    return-object v0
.end method

.method public connectTlsEtc()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 29
    const-string v1, "already connected"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic connectTlsEtc()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 2

    .line 21
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->connectTlsEtc()Ljava/lang/Void;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    return-object v0
.end method

.method public final getConnection()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 2

    .line 23
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    return-object v0
.end method

.method public handleSuccess()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 2

    .line 31
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->connection:Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    return-object v0
.end method

.method public isReady()Z
    .registers 2

    .line 25
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->isReady:Z

    return v0
.end method

.method public retry()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 35
    const-string v1, "unexpected retry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic retry()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 2

    .line 21
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/ReusePlan;->retry()Ljava/lang/Void;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0
.end method
