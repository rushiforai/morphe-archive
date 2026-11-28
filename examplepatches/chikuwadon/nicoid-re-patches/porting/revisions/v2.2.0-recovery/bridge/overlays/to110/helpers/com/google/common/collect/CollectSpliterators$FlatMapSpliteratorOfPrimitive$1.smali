.class public final synthetic Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Consumer;


# instance fields
.field public final synthetic f$0:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$1;->f$0:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;)V
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive$1;->f$0:Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/CollectSpliterators$FlatMapSpliteratorOfPrimitive;->lambda$tryAdvance$0$com-google-common-collect-CollectSpliterators$FlatMapSpliteratorOfPrimitive(Ljava/lang/Object;)V

    return-void
.end method
