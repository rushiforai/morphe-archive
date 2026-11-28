.class public final synthetic Lcom/google/common/collect/CollectCollectors$31;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BinaryOperator;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3

    .line 0
    check-cast p1, Lcom/google/common/collect/Multimap;

    check-cast p2, Lcom/google/common/collect/Multimap;

    invoke-static {p1, p2}, Lcom/google/common/collect/CollectCollectors;->lambda$flatteningToMultimap$1(Lcom/google/common/collect/Multimap;Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/Multimap;

    move-result-object p0

    return-object p0
.end method
