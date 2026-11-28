.class public Lnicoid/network238/okio/ForwardingTimeout;
.super Lnicoid/network238/okio/Timeout;
.source "SourceFile"


# annotations
.annotation runtime Lnicoid/network238/kotlin/Metadata;
    d1 = {
        "\u00008\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\n\u0002\u0010\t\n\u0000\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u000b\n\u0002\u0008\u0004\n\u0002\u0010\u0002\n\u0002\u0008\u0003\n\u0002\u0018\u0002\n\u0002\u0008\u0002\n\u0002\u0010\u0000\n\u0000\u0008\u0016\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0001\u00a2\u0006\u0004\u0008\u0003\u0010\u0004J\u000e\u0010\u0006\u001a\u00020\u00002\u0006\u0010\u0002\u001a\u00020\u0001J\u0018\u0010\u0007\u001a\u00020\u00012\u0006\u0010\u0007\u001a\u00020\u00082\u0006\u0010\t\u001a\u00020\nH\u0016J\u0008\u0010\u000b\u001a\u00020\u0008H\u0016J\u0008\u0010\u000c\u001a\u00020\rH\u0016J\u0008\u0010\u000e\u001a\u00020\u0008H\u0016J\u0010\u0010\u000e\u001a\u00020\u00012\u0006\u0010\u000e\u001a\u00020\u0008H\u0016J\u0008\u0010\u000f\u001a\u00020\u0001H\u0016J\u0008\u0010\u0010\u001a\u00020\u0001H\u0016J\u0008\u0010\u0011\u001a\u00020\u0012H\u0016J\u0008\u0010\u0013\u001a\u00020\u0012H\u0016J\u0010\u0010\u0014\u001a\u00020\u00122\u0006\u0010\u0015\u001a\u00020\u0016H\u0016J\u0010\u0010\u0017\u001a\u00020\u00122\u0006\u0010\u0018\u001a\u00020\u0019H\u0016R\u001c\u0010\u0002\u001a\u00020\u00018\u0007X\u0086\u000e\u00a2\u0006\u000e\n\u0000\u001a\u0004\u0008\u0002\u0010\u0005\"\u0004\u0008\u0006\u0010\u0004\u00a8\u0006\u001a"
    }
    d2 = {
        "Lnicoid/network238/okio/ForwardingTimeout;",
        "Lnicoid/network238/okio/Timeout;",
        "delegate",
        "<init>",
        "(Lnicoid/network238/okio/Timeout;)V",
        "()Lnicoid/network238/okio/Timeout;",
        "setDelegate",
        "timeout",
        "",
        "unit",
        "Ljava/util/concurrent/TimeUnit;",
        "timeoutNanos",
        "hasDeadline",
        "",
        "deadlineNanoTime",
        "clearTimeout",
        "clearDeadline",
        "throwIfReached",
        "",
        "cancel",
        "awaitSignal",
        "condition",
        "Ljava/util/concurrent/locks/Condition;",
        "waitUntilNotified",
        "monitor",
        "",
        "okio"
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
.field private delegate:Lnicoid/network238/okio/Timeout;


# direct methods
.method public constructor <init>(Lnicoid/network238/okio/Timeout;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 23
    invoke-direct {p0}, Lnicoid/network238/okio/Timeout;-><init>()V

    .line 24
    iput-object p1, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    return-void
.end method


# virtual methods
.method public awaitSignal(Ljava/util/concurrent/locks/Condition;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 56
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Timeout;->awaitSignal(Ljava/util/concurrent/locks/Condition;)V

    return-void
.end method

.method public cancel()V
    .registers 2

    .line 54
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->cancel()V

    return-void
.end method

.method public clearDeadline()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 49
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->clearDeadline()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public clearTimeout()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 47
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->clearTimeout()Lnicoid/network238/okio/Timeout;

    move-result-object v0

    return-object v0
.end method

.method public deadlineNanoTime()J
    .registers 3

    .line 41
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime()J

    move-result-wide v0

    return-wide v0
.end method

.method public deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;
    .registers 4

    .line 43
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0, p1, p2}, Lnicoid/network238/okio/Timeout;->deadlineNanoTime(J)Lnicoid/network238/okio/Timeout;

    move-result-object p1

    return-object p1
.end method

.method public final delegate()Lnicoid/network238/okio/Timeout;
    .registers 2

    .line 26
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    return-object v0
.end method

.method public hasDeadline()Z
    .registers 2

    .line 39
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->hasDeadline()Z

    move-result v0

    return v0
.end method

.method public final setDelegate(Lnicoid/network238/okio/Timeout;)Lnicoid/network238/okio/ForwardingTimeout;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 31
    iput-object p1, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    return-object p0
.end method

.method public final synthetic setDelegate(Lnicoid/network238/okio/Timeout;)V
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 26
    iput-object p1, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    return-void
.end method

.method public throwIfReached()V
    .registers 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 52
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->throwIfReached()V

    return-void
.end method

.method public timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;
    .registers 5

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 35
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0, p1, p2, p3}, Lnicoid/network238/okio/Timeout;->timeout(JLjava/util/concurrent/TimeUnit;)Lnicoid/network238/okio/Timeout;

    move-result-object p1

    return-object p1
.end method

.method public timeoutNanos()J
    .registers 3

    .line 37
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0}, Lnicoid/network238/okio/Timeout;->timeoutNanos()J

    move-result-wide v0

    return-wide v0
.end method

.method public waitUntilNotified(Ljava/lang/Object;)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    iget-object v0, p0, Lnicoid/network238/okio/ForwardingTimeout;->delegate:Lnicoid/network238/okio/Timeout;

    invoke-virtual {v0, p1}, Lnicoid/network238/okio/Timeout;->waitUntilNotified(Ljava/lang/Object;)V

    return-void
.end method
