.class public final synthetic Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;

.field public final synthetic f$1:Ljava/util/function/Consumer;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;Ljava/util/function/Consumer;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;->f$0:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;

    iput-object p2, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;->f$1:Ljava/util/function/Consumer;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;->f$0:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;

    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator$0;->f$1:Ljava/util/function/Consumer;

    invoke-virtual {v0, p0, p1}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliterator;->lambda$forEachRemaining$0$com-google-common-collect-CollectSpliterators$FlatMapSpliterator(Ljava/util/function/Consumer;Ljava/lang/Object;)V

    return-void
.end method
