.class public final synthetic Lcom/google/common/collect/CollectCollectors$33;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Function;


# instance fields
.field public final synthetic f$0:Ljava/util/function/Function;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Function;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/CollectCollectors$33;->f$0:Ljava/util/function/Function;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/CollectCollectors$33;->f$0:Ljava/util/function/Function;

    invoke-static {p0, p1}, Lcom/google/common/collect/CollectCollectors;->lambda$flatteningToImmutableListMultimap$1(Ljava/util/function/Function;Ljava/lang/Object;)Ljava/util/stream/Stream;

    move-result-object p0

    return-object p0
.end method
