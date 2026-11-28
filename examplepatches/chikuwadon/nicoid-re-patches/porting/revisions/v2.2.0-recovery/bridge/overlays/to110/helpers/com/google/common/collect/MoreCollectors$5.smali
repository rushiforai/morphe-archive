.class public final synthetic Lcom/google/common/collect/MoreCollectors$5;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 3

    .line 0
    check-cast p1, Lcom/google/common/collect/MoreCollectors$ToOptionalState;

    invoke-static {p1, p2}, Lcom/google/common/collect/MoreCollectors;->lambda$static$2(Lcom/google/common/collect/MoreCollectors$ToOptionalState;Ljava/lang/Object;)V

    return-void
.end method
