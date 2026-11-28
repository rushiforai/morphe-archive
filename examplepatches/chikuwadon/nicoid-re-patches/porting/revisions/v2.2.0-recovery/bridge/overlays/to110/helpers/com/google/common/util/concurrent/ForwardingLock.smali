.class abstract Lcom/google/common/util/concurrent/ForwardingLock;
.super Ljava/lang/Object;
.source "ForwardingLock.java"

# interfaces
.implements Ljava/util/concurrent/locks/Lock;


# direct methods
.method constructor <init>()V
    .registers 1

    .line 26
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method abstract delegate()Ljava/util/concurrent/locks/Lock;
.end method

.method public lock()V
    .registers 1

    .line 31
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingLock;->delegate()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->lock()V

    return-void
.end method

.method public lockInterruptibly()V
    .registers 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 36
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingLock;->delegate()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->lockInterruptibly()V

    return-void
.end method

.method public newCondition()Ljava/util/concurrent/locks/Condition;
    .registers 1

    .line 56
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingLock;->delegate()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->newCondition()Ljava/util/concurrent/locks/Condition;

    move-result-object p0

    return-object p0
.end method

.method public tryLock()Z
    .registers 1

    .line 41
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingLock;->delegate()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->tryLock()Z

    move-result p0

    return p0
.end method

.method public tryLock(JLjava/util/concurrent/TimeUnit;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "time",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingLock;->delegate()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3}, Ljava/util/concurrent/locks/Lock;->tryLock(JLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public unlock()V
    .registers 1

    .line 51
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingLock;->delegate()Ljava/util/concurrent/locks/Lock;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/locks/Lock;->unlock()V

    return-void
.end method
