.class final Lcom/google/common/collect/Iterators$MergingIterator;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "Iterators.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Iterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "MergingIterator"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/UnmodifiableIterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator<",
            "TT;>;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/lang/Iterable;Ljava/util/Comparator;)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "iterators",
            "itemComparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/util/Iterator<",
            "+TT;>;>;",
            "Ljava/util/Comparator<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1336
    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    .line 1339
    new-instance v0, Lcom/google/common/collect/Iterators$MergingIterator$0;

    invoke-direct {v0, p2}, Lcom/google/common/collect/Iterators$MergingIterator$0;-><init>(Ljava/util/Comparator;)V

    .line 1347
    new-instance p2, Ljava/util/PriorityQueue;

    const/4 v1, 0x2

    invoke-direct {p2, v1, v0}, Ljava/util/PriorityQueue;-><init>(ILjava/util/Comparator;)V

    iput-object p2, p0, Lcom/google/common/collect/Iterators$MergingIterator;->queue:Ljava/util/Queue;

    .line 1350
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    const/4 p2, 0x0

    :cond_0
    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Iterator;

    .line 1351
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1352
    iget-object v1, p0, Lcom/google/common/collect/Iterators$MergingIterator;->queue:Ljava/util/Queue;

    new-instance v2, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;

    invoke-static {v0}, Lcom/google/common/collect/Iterators;->peekingIterator(Ljava/util/Iterator;)Lcom/google/common/collect/PeekingIterator;

    move-result-object v0

    add-int/lit8 v3, p2, 0x1

    invoke-direct {v2, v0, p2}, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;-><init>(Lcom/google/common/collect/PeekingIterator;I)V

    invoke-interface {v1, v2}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    move p2, v3

    goto :goto_0

    :cond_1
    return-void
.end method

.method static synthetic lambda$new$0(Ljava/util/Comparator;Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;)I
    .registers 6

    .line 1341
    invoke-static {}, Lcom/google/common/collect/ComparisonChain;->start()Lcom/google/common/collect/ComparisonChain;

    move-result-object v0

    iget-object v1, p1, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    .line 1342
    invoke-interface {v1}, Lcom/google/common/collect/PeekingIterator;->peek()Ljava/lang/Object;

    move-result-object v1

    iget-object v2, p2, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    invoke-interface {v2}, Lcom/google/common/collect/PeekingIterator;->peek()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0, v1, v2, p0}, Lcom/google/common/collect/ComparisonChain;->compare(Ljava/lang/Object;Ljava/lang/Object;Ljava/util/Comparator;)Lcom/google/common/collect/ComparisonChain;

    move-result-object p0

    iget p1, p1, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->index:I

    iget p2, p2, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->index:I

    .line 1344
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ComparisonChain;->compare(II)Lcom/google/common/collect/ComparisonChain;

    move-result-object p0

    .line 1345
    invoke-virtual {p0}, Lcom/google/common/collect/ComparisonChain;->result()I

    move-result p0

    return p0
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 1359
    iget-object p0, p0, Lcom/google/common/collect/Iterators$MergingIterator;->queue:Ljava/util/Queue;

    invoke-interface {p0}, Ljava/util/Queue;->isEmpty()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .line 1365
    iget-object v0, p0, Lcom/google/common/collect/Iterators$MergingIterator;->queue:Ljava/util/Queue;

    invoke-interface {v0}, Ljava/util/Queue;->remove()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;

    .line 1366
    iget-object v1, v0, Lcom/google/common/collect/Iterators$MergingIterator$IndexedIterator;->iterator:Lcom/google/common/collect/PeekingIterator;

    .line 1367
    invoke-interface {v1}, Lcom/google/common/collect/PeekingIterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1368
    invoke-interface {v1}, Lcom/google/common/collect/PeekingIterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 1369
    iget-object p0, p0, Lcom/google/common/collect/Iterators$MergingIterator;->queue:Ljava/util/Queue;

    invoke-interface {p0, v0}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    :cond_0
    return-object v2
.end method
