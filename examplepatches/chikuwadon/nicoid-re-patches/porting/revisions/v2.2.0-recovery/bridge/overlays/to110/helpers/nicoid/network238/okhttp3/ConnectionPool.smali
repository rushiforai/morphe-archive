.class public final Lnicoid/network238/okhttp3/ConnectionPool;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0003\n\u0002\u0010\u0008\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u000b\n\u0002\u0010\u0002\n\u0000\u0018\u00002\u00020\u0001B\u0011\u0008\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u00a2\u0006\u0004\u0008\u0004\u0010\u0005B;\u0008\u0010\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b\u0012\u0008\u0008\u0002\u0010\u000c\u001a\u00020\r\u0012\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0004\u0010\u0010B1\u0008\u0010\u0012\u0008\u0008\u0002\u0010\u0006\u001a\u00020\u0007\u0012\u0008\u0008\u0002\u0010\u0008\u001a\u00020\t\u0012\u0008\u0008\u0002\u0010\n\u001a\u00020\u000b\u0012\u0008\u0008\u0002\u0010\u000e\u001a\u00020\u000f\u00a2\u0006\u0004\u0008\u0004\u0010\u0011B!\u0008\u0016\u0012\u0006\u0010\u0006\u001a\u00020\u0007\u0012\u0006\u0010\u0008\u001a\u00020\t\u0012\u0006\u0010\n\u001a\u00020\u000b\u00a2\u0006\u0004\u0008\u0004\u0010\u0012B\t\u0008\u0016\u00a2\u0006\u0004\u0008\u0004\u0010\u0013J\u0006\u0010\u0016\u001a\u00020\u0007J\u0006\u0010\u0017\u001a\u00020\u0007J\u0006\u0010\u001a\u001a\u00020\u001bR\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004\u00a2\u0006\u0008\n\u0000\u001a\u0004\u0008\u0014\u0010\u0015R\u0014\u0010\u000e\u001a\u00020\u000f8@X\u0080\u0004\u00a2\u0006\u0006\u001a\u0004\u0008\u0018\u0010\u0019\u00a8\u0006\u001c"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/ConnectionPool;",
        "",
        "delegate",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "<init>",
        "(Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;)V",
        "maxIdleConnections",
        "",
        "keepAliveDuration",
        "",
        "timeUnit",
        "Ljava/util/concurrent/TimeUnit;",
        "taskRunner",
        "Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;",
        "connectionListener",
        "Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V",
        "(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V",
        "(IJLjava/util/concurrent/TimeUnit;)V",
        "()V",
        "getDelegate$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "idleConnectionCount",
        "connectionCount",
        "getConnectionListener$okhttp",
        "()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;",
        "evictAll",
        "",
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
.field private final delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;


# direct methods
.method public constructor <init>()V
    .registers 5

    .line 83
    sget-object v0, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    const/4 v1, 0x5

    const-wide/16 v2, 0x5

    invoke-direct {p0, v1, v2, v3, v0}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;)V
    .registers 12

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 79
    sget-object v5, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 80
    sget-object v0, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;->getNONE()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v6

    .line 75
    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V
    .registers 14

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 47
    new-instance v0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    move v2, p1

    move-wide v3, p2

    move-object v5, p4

    move-object v1, p5

    move-object v6, p6

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    .line 46
    invoke-direct {p0, v0}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;)V

    return-void
.end method

.method public synthetic constructor <init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 9

    and-int/lit8 p8, p7, 0x1

    if-eqz p8, :cond_0

    const/4 p1, 0x5

    :cond_0
    and-int/lit8 p8, p7, 0x2

    if-eqz p8, :cond_1

    const-wide/16 p2, 0x5

    :cond_1
    and-int/lit8 p8, p7, 0x4

    if-eqz p8, :cond_2

    .line 43
    sget-object p4, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    :cond_2
    and-int/lit8 p8, p7, 0x8

    if-eqz p8, :cond_3

    .line 44
    sget-object p5, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    :cond_3
    and-int/lit8 p7, p7, 0x10

    if-eqz p7, :cond_4

    .line 45
    sget-object p6, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

    invoke-virtual {p6}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;->getNONE()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object p6

    move-object p8, p6

    goto :goto_0

    .line 44
    :cond_4
    move-object p8, p6

    .line 40
    :goto_0
    move-object p6, p4

    move-object p7, p5

    move-wide p4, p2

    move-object p2, p0

    move p3, p1

    invoke-direct/range {p2 .. p8}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    return-void
.end method

.method public constructor <init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V
    .registers 13

    invoke-virtual {p4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 63
    sget-object v5, Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;->INSTANCE:Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;

    .line 62
    move-object v0, p0

    move v1, p1

    move-wide v2, p2

    move-object v4, p4

    move-object v6, p5

    invoke-direct/range {v0 .. v6}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    return-void
.end method

.method public synthetic constructor <init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;ILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 8

    and-int/lit8 p7, p6, 0x1

    if-eqz p7, :cond_0

    const/4 p1, 0x5

    :cond_0
    and-int/lit8 p7, p6, 0x2

    if-eqz p7, :cond_1

    const-wide/16 p2, 0x5

    :cond_1
    and-int/lit8 p7, p6, 0x4

    if-eqz p7, :cond_2

    .line 60
    sget-object p4, Ljava/util/concurrent/TimeUnit;->MINUTES:Ljava/util/concurrent/TimeUnit;

    :cond_2
    and-int/lit8 p6, p6, 0x8

    if-eqz p6, :cond_3

    .line 61
    sget-object p5, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;->Companion:Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;

    invoke-virtual {p5}, Lnicoid/network238/okhttp3/internal/connection/ConnectionListener$Companion;->getNONE()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object p5

    move-object p7, p5

    goto :goto_0

    .line 60
    :cond_3
    move-object p7, p5

    .line 57
    :goto_0
    move-object p6, p4

    move-wide p4, p2

    move-object p2, p0

    move p3, p1

    invoke-direct/range {p2 .. p7}, Lnicoid/network238/okhttp3/ConnectionPool;-><init>(IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V

    return-void
.end method

.method public constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 37
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 38
    iput-object p1, p0, Lnicoid/network238/okhttp3/ConnectionPool;->delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    return-void
.end method


# virtual methods
.method public final connectionCount()I
    .registers 2

    .line 89
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionPool;->delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->connectionCount()I

    move-result v0

    return v0
.end method

.method public final evictAll()V
    .registers 2

    .line 96
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionPool;->delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->evictAll()V

    return-void
.end method

.method public final getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;
    .registers 2

    .line 92
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionPool;->delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->getConnectionListener$okhttp()Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;

    move-result-object v0

    return-object v0
.end method

.method public final getDelegate$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;
    .registers 2

    .line 38
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionPool;->delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    return-object v0
.end method

.method public final idleConnectionCount()I
    .registers 2

    .line 86
    iget-object v0, p0, Lnicoid/network238/okhttp3/ConnectionPool;->delegate:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-virtual {v0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->idleConnectionCount()I

    move-result v0

    return v0
.end method
