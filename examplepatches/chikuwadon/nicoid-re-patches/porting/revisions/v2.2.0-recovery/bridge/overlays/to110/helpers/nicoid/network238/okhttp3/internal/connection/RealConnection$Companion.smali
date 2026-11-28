.class public final Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RealConnection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00002\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J.\u0010\u0006\u001a\u00020\u00072\u0006\u0010\u0008\u001a\u00020\t2\u0006\u0010\n\u001a\u00020\u000b2\u0006\u0010\u000c\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0005R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u0011"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;",
        "",
        "<init>",
        "()V",
        "IDLE_CONNECTION_HEALTHY_NS",
        "",
        "newTestConnection",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnection;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "connectionPool",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "route",
        "Lnicoid/network238/okhttp3/Route;",
        "socket",
        "Ljava/net/Socket;",
        "idleAtNs",
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
.method private constructor <init>()V
    .registers 1

    .line 428
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final newTestConnection(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Lnicoid/network238/okhttp3/Route;Ljava/net/Socket;J)Lnicoid/network238/okhttp3/internal/connection/RealConnection;
    .registers 18

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 439
    new-instance v8, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;

    invoke-direct {v8}, Lnicoid/network238/okhttp3/internal/connection/RealConnection$Companion$newTestConnection$bufferedSocket$1;-><init>()V

    .line 448
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealConnection;

    .line 452
    new-instance v4, Ljava/net/Socket;

    invoke-direct {v4}, Ljava/net/Socket;-><init>()V

    .line 455
    sget-object v7, Lnicoid/network238/okhttp3/Protocol;->HTTP_2:Lnicoid/network238/okhttp3/Protocol;

    .line 458
    sget-object v1, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

    invoke-virtual {v1}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;->getNONE()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v10

    .line 448
    const/4 v6, 0x0

    const/4 v9, 0x0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move-object v5, p4

    invoke-direct/range {v0 .. v10}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Lnicoid/network238/okhttp3/Route;Ljava/net/Socket;Ljava/net/Socket;Lnicoid/network238/okhttp3/Handshake;Lnicoid/network238/okhttp3/Protocol;Lnicoid/network238/okhttp3/internal/connection/BufferedSocket;ILnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    .line 460
    move-wide/from16 p1, p5

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okhttp3/internal/connection/RealConnection;->setIdleAtNs(J)V

    return-object v0
.end method
