.class Lcom/google/common/collect/Iterables$8;
.super Lcom/google/common/collect/FluentIterable;
.source "Iterables.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterables;->consumingIterable(Ljava/lang/Iterable;)Ljava/lang/Iterable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/FluentIterable<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final synthetic val$iterable:Ljava/lang/Iterable;


# direct methods
.method constructor <init>(Ljava/lang/Iterable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "val$iterable"
        }
    .end annotation

    .line 1017
    iput-object p1, p0, Lcom/google/common/collect/Iterables$8;->val$iterable:Ljava/lang/Iterable;

    invoke-direct {p0}, Lcom/google/common/collect/FluentIterable;-><init>()V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TT;>;"
        }
    .end annotation

    .line 1020
    iget-object v0, p0, Lcom/google/common/collect/Iterables$8;->val$iterable:Ljava/lang/Iterable;

    instance-of v1, v0, Ljava/util/Queue;

    if-eqz v1, :cond_0

    .line 1021
    new-instance v0, Lcom/google/common/collect/ConsumingQueueIterator;

    iget-object p0, p0, Lcom/google/common/collect/Iterables$8;->val$iterable:Ljava/lang/Iterable;

    check-cast p0, Ljava/util/Queue;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ConsumingQueueIterator;-><init>(Ljava/util/Queue;)V

    return-object v0

    .line 1022
    :cond_0
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Iterators;->consumingIterator(Ljava/util/Iterator;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 1027
    const-string p0, "Iterables.consumingIterable(...)"

    return-object p0
.end method
