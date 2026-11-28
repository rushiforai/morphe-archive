.class public final synthetic Lcom/google/common/collect/CollectCollectors$52;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic f$0:Ljava/util/function/Function;

.field public final synthetic f$1:Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Function;Ljava/util/function/Function;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/CollectCollectors$52;->f$0:Ljava/util/function/Function;

    iput-object p2, p0, Lcom/google/common/collect/CollectCollectors$52;->f$1:Ljava/util/function/Function;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/google/common/collect/CollectCollectors$52;->f$0:Ljava/util/function/Function;

    iget-object p0, p0, Lcom/google/common/collect/CollectCollectors$52;->f$1:Ljava/util/function/Function;

    check-cast p1, Lcom/google/common/collect/ImmutableMap$Builder;

    invoke-static {v0, p0, p1, p2}, Lcom/google/common/collect/CollectCollectors;->lambda$toImmutableMap$0(Ljava/util/function/Function;Ljava/util/function/Function;Lcom/google/common/collect/ImmutableMap$Builder;Ljava/lang/Object;)V

    return-void
.end method
