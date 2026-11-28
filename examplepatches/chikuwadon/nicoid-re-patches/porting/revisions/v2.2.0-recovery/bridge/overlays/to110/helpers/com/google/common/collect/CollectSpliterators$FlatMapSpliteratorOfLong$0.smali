.class public final synthetic Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfLong$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$Factory;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final newFlatMapSpliterator(Ljava/util/Spliterator;Ljava/util/Spliterator;Ljava/util/function/Function;IJ)Ljava/util/Spliterator;
    .registers 7

    .line 0
    new-instance p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfLong;

    check-cast p1, Ljava/util/Spliterator$OfLong;

    invoke-direct/range {p0 .. p6}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfLong;-><init>(Ljava/util/Spliterator$OfLong;Ljava/util/Spliterator;Ljava/util/function/Function;IJ)V

    check-cast p0, Ljava/util/Spliterator$OfLong;

    return-object p0
.end method
