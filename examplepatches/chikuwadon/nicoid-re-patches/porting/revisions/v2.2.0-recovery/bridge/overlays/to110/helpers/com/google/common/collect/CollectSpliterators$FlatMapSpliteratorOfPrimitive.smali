.class abstract Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;
.super Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;
.source "CollectSpliterators.java"

# interfaces
.implements Ljava/util/Spliterator$OfPrimitive;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CollectSpliterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "FlatMapSpliteratorOfPrimitive"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<InElementT:",
        "Ljava/lang/Object;",
        "OutElementT:",
        "Ljava/lang/Object;",
        "OutConsumerT:",
        "Ljava/lang/Object;",
        "OutSpliteratorT::",
        "Ljava/util/Spliterator$OfPrimitive<",
        "TOutElementT;TOutConsumerT;TOutSpliteratorT;>;>",
        "Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator<",
        "TInElementT;TOutElementT;TOutSpliteratorT;>;",
        "Ljava/util/Spliterator$OfPrimitive<",
        "TOutElementT;TOutConsumerT;TOutSpliteratorT;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/Spliterator$OfPrimitive;Ljava/util/Spliterator;Ljava/util/function/Function;Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;IJ)V
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "prefix",
            "from",
            "function",
            "factory",
            "characteristics",
            "estimatedSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TOutSpliteratorT;",
            "Ljava/util/Spliterator<",
            "TInElementT;>;",
            "Ljava/util/function/Function<",
            "-TInElementT;TOutSpliteratorT;>;",
            "Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory<",
            "TInElementT;TOutSpliteratorT;>;IJ)V"
        }
    .end annotation

    .line 477
    invoke-direct/range {p0 .. p7}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;-><init>(Ljava/util/Spliterator;Ljava/util/Spliterator;Ljava/util/function/Function;Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;IJ)V

    return-void
.end method


# virtual methods
.method public final forEachRemaining(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "action"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TOutConsumerT;)V"
        }
    .end annotation

    .line 499
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    if-eqz v0, :cond_0

    .line 500
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    check-cast v0, Ljava/util/Spliterator$OfPrimitive;

    invoke-interface {v0, p1}, Ljava/util/Spliterator$OfPrimitive;->forEachRemaining(Ljava/lang/Object;)V

    const/4 v0, 0x0

    .line 501
    iput-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    .line 503
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->from:Ljava/util/Spliterator;

    new-instance v1, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$0;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$0;-><init>(Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;Ljava/lang/Object;)V

    invoke-interface {v0, v1}, Ljava/util/Spliterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    const-wide/16 v0, 0x0

    .line 510
    iput-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->estimatedSize:J

    return-void
.end method

.method synthetic lambda$forEachRemaining$0$com-google-common-collect-CollectSpliterators$FlatMapSpliteratorOfPrimitive(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 505
    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->function:Ljava/util/function/Function;

    invoke-interface {p0, p2}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Spliterator$OfPrimitive;

    if-eqz p0, :cond_0

    .line 507
    invoke-interface {p0, p1}, Ljava/util/Spliterator$OfPrimitive;->forEachRemaining(Ljava/lang/Object;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$tryAdvance$0$com-google-common-collect-CollectSpliterators$FlatMapSpliteratorOfPrimitive(Ljava/lang/Object;)V
    .registers 3

    .line 491
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->function:Ljava/util/function/Function;

    invoke-interface {v0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Spliterator;

    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    return-void
.end method

.method public final tryAdvance(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "action"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TOutConsumerT;)Z"
        }
    .end annotation

    .line 483
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    if-eqz v0, :cond_2

    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    check-cast v0, Ljava/util/Spliterator$OfPrimitive;

    invoke-interface {v0, p1}, Ljava/util/Spliterator$OfPrimitive;->tryAdvance(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 484
    iget-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->estimatedSize:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long p1, v0, v2

    if-eqz p1, :cond_1

    .line 485
    iget-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->estimatedSize:J

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    iput-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->estimatedSize:J

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 v0, 0x0

    .line 489
    iput-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->prefix:Ljava/util/Spliterator;

    .line 491
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->from:Ljava/util/Spliterator;

    new-instance v1, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$1;

    invoke-direct {v1, p0}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$1;-><init>(Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;)V

    invoke-interface {v0, v1}, Ljava/util/Spliterator;->tryAdvance(Ljava/util/function/Consumer;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic trySplit()Ljava/util/Spliterator$OfPrimitive;
    .registers 1

    .line 460
    invoke-super {p0}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->trySplit()Ljava/util/Spliterator;

    move-result-object p0

    check-cast p0, Ljava/util/Spliterator$OfPrimitive;

    return-object p0
.end method
