.class final Lcom/google/common/collect/ConsumingQueueIterator;
.super Lcom/google/common/collect/AbstractIterator;
.source "ConsumingQueueIterator.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractIterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field private final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Queue;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "queue"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Queue<",
            "TT;>;)V"
        }
    .end annotation

    .line 31
    invoke-direct {p0}, Lcom/google/common/collect/AbstractIterator;-><init>()V

    .line 32
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Queue;

    iput-object p1, p0, Lcom/google/common/collect/ConsumingQueueIterator;->queue:Ljava/util/Queue;

    return-void
.end method


# virtual methods
.method protected computeNext()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 38
    iget-object v0, p0, Lcom/google/common/collect/ConsumingQueueIterator;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 39
    invoke-virtual {p0}, Lcom/google/common/collect/ConsumingQueueIterator;->endOfData()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 41
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/ConsumingQueueIterator;->queue:Ljava/util/Queue;

    invoke-interface {p0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
