.class public final Lnicoid/network238/okhttp3/internal/connection/FailedPlan;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0003\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0001\n\u0002\u0008\u0003\u0008\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005J\u0008\u0010\r\u001a\u00020\u0007H\u0016J\u0008\u0010\u000e\u001a\u00020\u0007H\u0016J\u0008\u0010\u000f\u001a\u00020\u0010H\u0016J\u0008\u0010\u0011\u001a\u00020\u0010H\u0016J\u0008\u0010\u0012\u001a\u00020\u0010H\u0016R\u0011\u0010\u0006\u001a\u00020\u0007\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0008\u0010\tR\u0014\u0010\n\u001a\u00020\u000bX\u0096D\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\n\u0010\u000c\u00a8\u0006\u0013"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/FailedPlan;",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;",
        "e",
        "",
        "<init>",
        "(Ljava/lang/Throwable;)V",
        "result",
        "Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;",
        "getResult",
        "()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;",
        "isReady",
        "",
        "()Z",
        "connectTcp",
        "connectTlsEtc",
        "handleSuccess",
        "",
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
.field private final isReady:Z

.field private final result:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;


# direct methods
.method public constructor <init>(Ljava/lang/Throwable;)V
    .registers 8

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 32
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    const/4 v4, 0x2

    const/4 v5, 0x0

    const/4 v2, 0x0

    move-object v1, p0

    move-object v3, p1

    invoke-direct/range {v0 .. v5}, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;-><init>(Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;Ljava/lang/Throwable;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    iput-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->result:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    return-void
.end method


# virtual methods
.method public cancel()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 42
    const-string v1, "unexpected cancel"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic cancel()V
    .registers 1

    .line 29
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->cancel()Ljava/lang/Void;

    return-void
.end method

.method public connectTcp()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 2

    .line 36
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->result:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    return-object v0
.end method

.method public connectTlsEtc()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->result:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    return-object v0
.end method

.method public final getResult()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;
    .registers 2

    .line 32
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->result:Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$ConnectResult;

    return-object v0
.end method

.method public handleSuccess()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 40
    const-string v1, "unexpected call"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic handleSuccess()Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 2

    .line 29
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->handleSuccess()Ljava/lang/Void;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    return-object v0
.end method

.method public isReady()Z
    .registers 2

    .line 34
    iget-boolean v0, p0, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->isReady:Z

    return v0
.end method

.method public retry()Ljava/lang/Void;
    .registers 3

    new-instance v0, Ljava/lang/IllegalStateException;

    .line 44
    const-string v1, "unexpected retry"

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public bridge synthetic retry()Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;
    .registers 2

    .line 29
    invoke-virtual {p0}, Lnicoid/network238/okhttp3/internal/connection/FailedPlan;->retry()Ljava/lang/Void;

    move-result-object v0

    check-cast v0, Lnicoid/network238/okhttp3/internal/connection/RoutePlanner$Plan;

    return-object v0
.end method
