.class public abstract Lcom/google/common/collect/ForwardingQueue;
.super Lcom/google/common/collect/ForwardingCollection;
.source "ForwardingQueue.java"

# interfaces
.implements Ljava/util/Queue;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingCollection<",
        "TE;>;",
        "Ljava/util/Queue<",
        "TE;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 52
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingCollection;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 47
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .registers 1

    .line 47
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    return-object p0
.end method

.method protected abstract delegate()Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue<",
            "TE;>;"
        }
    .end annotation
.end method

.method public element()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 84
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Queue;->element()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public offer(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)Z"
        }
    .end annotation

    .line 60
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public peek()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 78
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public poll()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 66
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 73
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->delegate()Ljava/util/Queue;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected standardOffer(Ljava/lang/Object;)Z
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
            "(TE;)Z"
        }
    .end annotation

    .line 95
    :try_start_0
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingQueue;->add(Ljava/lang/Object;)Z

    move-result p0
    :try_end_0
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    return p0

    :catch_0
    const/4 p0, 0x0

    return p0
.end method

.method protected standardPeek()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 109
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->element()Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method

.method protected standardPoll()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 123
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingQueue;->remove()Ljava/lang/Object;

    move-result-object p0
    :try_end_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    return-object p0

    :catch_0
    const/4 p0, 0x0

    return-object p0
.end method
