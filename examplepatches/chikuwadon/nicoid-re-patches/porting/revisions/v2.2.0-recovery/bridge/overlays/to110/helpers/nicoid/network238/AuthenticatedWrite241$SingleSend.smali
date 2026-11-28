.class final Lnicoid/network238/AuthenticatedWrite241$SingleSend;
.super Ljava/lang/Object;
.source "AuthenticatedWrite241.java"

# interfaces
.implements Lnicoid/network238/okhttp3/Interceptor;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/AuthenticatedWrite241;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "SingleSend"
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 38
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public intercept(Lnicoid/network238/okhttp3/Interceptor$Chain;)Lnicoid/network238/okhttp3/Response;
    .registers 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 40
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    const-class v1, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v0, v1}, Lnicoid/network238/okhttp3/Request;->tag(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 41
    if-eqz v0, :cond_0

    const/4 v1, 0x0

    const/4 v2, 0x1

    invoke-virtual {v0, v1, v2}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 42
    invoke-interface {p1}, Lnicoid/network238/okhttp3/Interceptor$Chain;->request()Lnicoid/network238/okhttp3/Request;

    move-result-object v0

    invoke-interface {p1, v0}, Lnicoid/network238/okhttp3/Interceptor$Chain;->proceed(Lnicoid/network238/okhttp3/Request;)Lnicoid/network238/okhttp3/Response;

    move-result-object p1

    return-object p1

    .line 41
    :cond_0
    new-instance p1, Ljava/io/IOException;

    const-string v0, "Mutation replay blocked"

    invoke-direct {p1, v0}, Ljava/io/IOException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
