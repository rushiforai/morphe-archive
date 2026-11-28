.class public final Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u0000\u0010\n\u0000\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0012\u0010\u0000\u001a\u0008\u0012\u0004\u0012\u00020\u00020\u0001*\u00020\u0003H\u0007\u00a8\u0006\u0004"
    }
    d2 = {
        "execute",
        "",
        "Lnicoid/network238/okhttp3/Dns$Record;",
        "Lnicoid/network238/okhttp3/Dns$Call;",
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
.method public static final execute(Lnicoid/network238/okhttp3/Dns$Call;)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lnicoid/network238/okhttp3/Dns$Call;",
            ")",
            "Ljava/util/List<",
            "Lnicoid/network238/okhttp3/Dns$Record;",
            ">;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/net/UnknownHostException;
        }
    .end annotation

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 38
    new-instance v0, Ljava/util/concurrent/LinkedBlockingQueue;

    invoke-direct {v0}, Ljava/util/concurrent/LinkedBlockingQueue;-><init>()V

    .line 41
    new-instance v1, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;

    invoke-direct {v1, p0, v0}, Lnicoid/network238/okhttp3/internal/dns/_ExecuteDnsKt$execute$1;-><init>(Lnicoid/network238/okhttp3/Dns$Call;Ljava/util/concurrent/LinkedBlockingQueue;)V

    .line 40
    invoke-interface {p0, v1}, Lnicoid/network238/okhttp3/Dns$Call;->enqueue(Lnicoid/network238/okhttp3/Dns$Callback;)V

    .line 80
    invoke-virtual {v0}, Ljava/util/concurrent/LinkedBlockingQueue;->take()Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    check-cast p0, Lnicoid/network238/kotlin/Result;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/Result;->unbox-impl()Ljava/lang/Object;

    move-result-object p0

    invoke-static {p0}, Lnicoid/network238/kotlin/ResultKt;->throwOnFailure(Ljava/lang/Object;)V

    check-cast p0, Ljava/util/List;

    return-object p0
.end method
