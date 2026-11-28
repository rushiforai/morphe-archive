.class public abstract Lcom/google/common/util/concurrent/ForwardingBlockingQueue;
.super Lcom/google/common/collect/ForwardingQueue;
.source "ForwardingBlockingQueue.java"

# interfaces
.implements Ljava/util/concurrent/BlockingQueue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingQueue<",
        "TE;>;",
        "Ljava/util/concurrent/BlockingQueue<",
        "TE;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 46
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingQueue;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 40
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .registers 1

    .line 40
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Queue;
    .registers 1

    .line 40
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    return-object p0
.end method

.method protected abstract delegate()Ljava/util/concurrent/BlockingQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/concurrent/BlockingQueue<",
            "TE;>;"
        }
    .end annotation
.end method

.method public drainTo(Ljava/util/Collection;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "-TE;>;)I"
        }
    .end annotation

    .line 60
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/concurrent/BlockingQueue;->drainTo(Ljava/util/Collection;)I

    move-result p0

    return p0
.end method

.method public drainTo(Ljava/util/Collection;I)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "c",
            "maxElements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "-TE;>;I)I"
        }
    .end annotation

    .line 54
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/BlockingQueue;->drainTo(Ljava/util/Collection;I)I

    move-result p0

    return p0
.end method

.method public offer(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "e",
            "timeout",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;J",
            "Ljava/util/concurrent/TimeUnit;",
            ")Z"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 66
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/concurrent/BlockingQueue;->offer(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;)Z

    move-result p0

    return p0
.end method

.method public poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "timeout",
            "unit"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 72
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3}, Ljava/util/concurrent/BlockingQueue;->poll(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/Object;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "e"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 77
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/concurrent/BlockingQueue;->put(Ljava/lang/Object;)V

    return-void
.end method

.method public remainingCapacity()I
    .registers 1

    .line 82
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/BlockingQueue;->remainingCapacity()I

    move-result p0

    return p0
.end method

.method public take()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;
        }
    .end annotation

    .line 88
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ForwardingBlockingQueue;->delegate()Ljava/util/concurrent/BlockingQueue;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/concurrent/BlockingQueue;->take()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
