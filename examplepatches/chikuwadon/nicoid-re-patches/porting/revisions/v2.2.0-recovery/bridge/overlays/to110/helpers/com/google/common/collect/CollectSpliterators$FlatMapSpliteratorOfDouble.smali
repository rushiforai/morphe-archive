.class final Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfDouble;
.super Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;
.source "CollectSpliterators.java"

# interfaces
.implements Ljava/util/Spliterator$OfDouble;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CollectSpliterators;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x18
    name = "FlatMapSpliteratorOfDouble"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<InElementT:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive<",
        "TInElementT;",
        "Ljava/lang/Double;",
        "Ljava/util/function/DoubleConsumer;",
        "Ljava/util/Spliterator$OfDouble;",
        ">;",
        "Ljava/util/Spliterator$OfDouble;"
    }
.end annotation


# direct methods
.method constructor <init>(Ljava/util/Spliterator$OfDouble;Ljava/util/Spliterator;Ljava/util/function/Function;IJ)V
    .registers 15
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
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
            "characteristics",
            "estimatedSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Spliterator$OfDouble;",
            "Ljava/util/Spliterator<",
            "TInElementT;>;",
            "Ljava/util/function/Function<",
            "-TInElementT;",
            "Ljava/util/Spliterator$OfDouble;",
            ">;IJ)V"
        }
    .end annotation

    .line 556
    new-instance v4, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfDouble$0;

    invoke-direct {v4}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfDouble$0;-><init>()V

    move-object v0, p0

    move-object v1, p1

    move-object v2, p2

    move-object v3, p3

    move v5, p4

    move-wide v6, p5

    invoke-direct/range {v0 .. v7}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;-><init>(Ljava/util/Spliterator$OfPrimitive;Ljava/util/Spliterator;Ljava/util/function/Function;Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;IJ)V

    return-void
.end method


# virtual methods
.method public bridge synthetic forEachRemaining(Ljava/util/function/DoubleConsumer;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "action"
        }
    .end annotation

    .line 545
    invoke-super {p0, p1}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->forEachRemaining(Ljava/lang/Object;)V

    return-void
.end method

.method public bridge synthetic tryAdvance(Ljava/util/function/DoubleConsumer;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "action"
        }
    .end annotation

    .line 545
    invoke-super {p0, p1}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->tryAdvance(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic trySplit()Ljava/util/Spliterator$OfDouble;
    .registers 1

    .line 545
    invoke-super {p0}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->trySplit()Ljava/util/Spliterator;

    move-result-object p0

    check-cast p0, Ljava/util/Spliterator$OfDouble;

    return-object p0
.end method
