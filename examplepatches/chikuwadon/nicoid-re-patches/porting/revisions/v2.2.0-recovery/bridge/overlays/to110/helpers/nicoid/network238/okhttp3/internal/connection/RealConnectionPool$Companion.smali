.class public final Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Companion"
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\u0008\u0086\u0003\u0018\u00002\u00020\u0001B\t\u0008\u0002\u00a2\u0006\u0004\u0008\u0002\u0010\u0003J\u000e\u0010\u0004\u001a\u00020\u00052\u0006\u0010\u0006\u001a\u00020\u0007\u00a8\u0006\u0008"
    }
    d2 = {
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;",
        "",
        "<init>",
        "()V",
        "get",
        "Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;",
        "connectionPool",
        "Lnicoid/network238/okhttp3/ConnectionPool;",
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

    .line 330
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V
    .registers 2

    invoke-direct {p0}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$Companion;-><init>()V

    return-void
.end method


# virtual methods
.method public final get(Lnicoid/network238/okhttp3/ConnectionPool;)Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 331
    invoke-virtual {p1}, Lnicoid/network238/okhttp3/ConnectionPool;->getDelegate$okhttp()Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    move-result-object p1

    return-object p1
.end method
