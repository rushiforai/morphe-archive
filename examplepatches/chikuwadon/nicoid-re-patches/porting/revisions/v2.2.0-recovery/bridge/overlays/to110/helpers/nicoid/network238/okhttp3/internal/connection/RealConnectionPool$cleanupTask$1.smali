.class public final Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;
.super Lnicoid/network238/okhttp3/internal/concurrent/Task;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;-><init>(Lnicoid/network238/okhttp3/internal/concurrent/TaskRunner;IJLjava/util/concurrent/TimeUnit;Lnicoid/network238/okhttp3/internal/connection/ConnectionListener;)V
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = null
.end annotation

.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0011\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0000*\u0001\u0000\u0008\n\u0018\u00002\u00020\u0001J\u0008\u0010\u0002\u001a\u00020\u0003H\u0016\u00a8\u0006\u0004"
    }
    d2 = {
        "nicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1",
        "Lnicoid/network238/okhttp3/internal/concurrent/Task;",
        "runOnce",
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
.field final synthetic this$0:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;


# direct methods
.method constructor <init>(Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;Ljava/lang/String;)V
    .registers 5

    iput-object p1, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    .line 49
    const/4 p1, 0x0

    const/4 v0, 0x2

    const/4 v1, 0x0

    invoke-direct {p0, p2, p1, v0, v1}, Lnicoid/network238/okhttp3/internal/concurrent/Task;-><init>(Ljava/lang/String;ZILnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    return-void
.end method


# virtual methods
.method public runOnce()J
    .registers 4

    .line 50
    iget-object v0, p0, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool$cleanupTask$1;->this$0:Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lnicoid/network238/okhttp3/internal/connection/RealConnectionPool;->closeConnections(J)J

    move-result-wide v0

    return-wide v0
.end method
