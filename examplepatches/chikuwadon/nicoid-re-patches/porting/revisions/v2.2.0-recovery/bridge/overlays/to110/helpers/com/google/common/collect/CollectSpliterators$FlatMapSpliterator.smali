.class abstract Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;
.super Ljava/lang/Object;
.source "CollectSpliterators.java"

# interfaces
.implements Ljava/util/Spliterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CollectSpliterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "FlatMapSpliterator"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<InElementT:",
        "Ljava/lang/Object;",
        "OutElementT:",
        "Ljava/lang/Object;",
        "OutSpliteratorT::",
        "Ljava/util/Spliterator<",
        "TOutElementT;>;>",
        "Ljava/lang/Object;",
        "Ljava/util/Spliterator<",
        "TOutElementT;>;"
    }
.end annotation


# instance fields
.field characteristics:I

.field estimatedSize:J

.field final factory:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory<",
            "TInElementT;TOutSpliteratorT;>;"
        }
    .end annotation
.end field

.field final from:Ljava/util/Spliterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Spliterator<",
            "TInElementT;>;"
        }
    .end annotation
.end field

.field final function:Ljava/util/function/Function;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/function/Function<",
            "-TInElementT;TOutSpliteratorT;>;"
        }
    .end annotation
.end field

.field prefix:Ljava/util/Spliterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TOutSpliteratorT;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Spliterator;Ljava/util/Spliterator;Ljava/util/function/Function;Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;IJ)V
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

    .line 338
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 339
    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    .line 340
    iput-object p2, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->from:Ljava/util/Spliterator;

    .line 341
    iput-object p3, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->function:Ljava/util/function/Function;

    .line 342
    iput-object p4, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->factory:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;

    .line 343
    iput p5, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->characteristics:I

    .line 344
    iput-wide p6, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    return-void
.end method


# virtual methods
.method public final characteristics()I
    .registers 1

    .line 422
    iget p0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->characteristics:I

    return p0
.end method

.method public final estimateSize()J
    .registers 6

    .line 414
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    if-eqz v0, :cond_0

    .line 415
    iget-wide v1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    invoke-interface {v0}, Ljava/util/Spliterator;->estimateSize()J

    move-result-wide v3

    invoke-static {v1, v2, v3, v4}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    iput-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    .line 417
    :cond_0
    iget-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    const-wide/16 v2, 0x0

    invoke-static {v0, v1, v2, v3}, Ljava/lang/Math;->max(JJ)J

    move-result-wide v0

    return-wide v0
.end method

.method public forEachRemaining(Ljava/util/function/Consumer;)V
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
            "(",
            "Ljava/util/function/Consumer<",
            "-TOutElementT;>;)V"
        }
    .end annotation

    .line 373
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    if-eqz v0, :cond_0

    .line 374
    invoke-interface {v0, p1}, Ljava/util/Spliterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    const/4 v0, 0x0

    .line 375
    iput-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    .line 377
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->from:Ljava/util/Spliterator;

    new-instance v1, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;

    invoke-direct {v1, p0, p1}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;-><init>(Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;Ljava/util/function/Consumer;)V

    invoke-interface {v0, v1}, Ljava/util/Spliterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    const-wide/16 v0, 0x0

    .line 384
    iput-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    return-void
.end method

.method synthetic lambda$forEachRemaining$0$com-google-common-collect-CollectSpliterators$FlatMapSpliterator(Ljava/util/function/Consumer;Ljava/lang/Object;)V
    .registers 3

    .line 379
    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->function:Ljava/util/function/Function;

    invoke-interface {p0, p2}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Spliterator;

    if-eqz p0, :cond_0

    .line 381
    invoke-interface {p0, p1}, Ljava/util/Spliterator;->forEachRemaining(Ljava/util/function/Consumer;)V

    :cond_0
    return-void
.end method

.method synthetic lambda$tryAdvance$0$com-google-common-collect-CollectSpliterators$FlatMapSpliterator(Ljava/lang/Object;)V
    .registers 3

    .line 365
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->function:Ljava/util/function/Function;

    invoke-interface {v0, p1}, Ljava/util/function/Function;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Spliterator;

    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    return-void
.end method

.method public tryAdvance(Ljava/util/function/Consumer;)Z
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
            "(",
            "Ljava/util/function/Consumer<",
            "-TOutElementT;>;)Z"
        }
    .end annotation

    .line 357
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    if-eqz v0, :cond_2

    invoke-interface {v0, p1}, Ljava/util/Spliterator;->tryAdvance(Ljava/util/function/Consumer;)Z

    move-result v0

    if-eqz v0, :cond_2

    .line 358
    iget-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    const-wide v2, 0x7fffffffffffffffL

    cmp-long p1, v0, v2

    if-eqz p1, :cond_1

    const-wide/16 v2, 0x1

    sub-long/2addr v0, v2

    .line 359
    iput-wide v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    :cond_1
    const/4 p0, 0x1

    return p0

    :cond_2
    const/4 v0, 0x0

    .line 363
    iput-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    .line 365
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->from:Ljava/util/Spliterator;

    new-instance v1, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$1;

    invoke-direct {v1, p0}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$1;-><init>(Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;)V

    invoke-interface {v0, v1}, Ljava/util/Spliterator;->tryAdvance(Ljava/util/function/Consumer;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0
.end method

.method public final trySplit()Ljava/util/Spliterator;
    .registers 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TOutSpliteratorT;"
        }
    .end annotation

    .line 389
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->from:Ljava/util/Spliterator;

    invoke-interface {v0}, Ljava/util/Spliterator;->trySplit()Ljava/util/Spliterator;

    move-result-object v3

    const/4 v0, 0x0

    if-eqz v3, :cond_1

    .line 391
    iget v1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->characteristics:I

    and-int/lit8 v5, v1, -0x41

    .line 392
    invoke-virtual {p0}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimateSize()J

    move-result-wide v1

    const-wide v6, 0x7fffffffffffffffL

    cmp-long v4, v1, v6

    if-gez v4, :cond_0

    const-wide/16 v6, 0x2

    .line 394
    div-long/2addr v1, v6

    .line 395
    iget-wide v6, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    sub-long/2addr v6, v1

    iput-wide v6, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->estimatedSize:J

    .line 396
    iput v5, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->characteristics:I

    :cond_0
    move-wide v6, v1

    .line 398
    iget-object v1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->factory:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;

    iget-object v2, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    iget-object v4, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->function:Ljava/util/function/Function;

    .line 399
    invoke-interface/range {v1 .. v7}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;->newFlatMapSpliterator(Ljava/util/Spliterator;Ljava/util/Spliterator;Ljava/util/function/Function;IJ)Ljava/util/Spliterator;

    move-result-object v1

    .line 401
    iput-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    return-object v1

    .line 403
    :cond_1
    iget-object v1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    if-eqz v1, :cond_2

    .line 405
    iput-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->prefix:Ljava/util/Spliterator;

    return-object v1

    :cond_2
    return-object v0
.end method
