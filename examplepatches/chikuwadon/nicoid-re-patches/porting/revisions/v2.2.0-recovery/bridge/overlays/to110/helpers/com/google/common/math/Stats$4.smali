.class public final synthetic Lcom/google/common/math/Stats$4;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/ObjDoubleConsumer;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;D)V
    .registers 4

    .line 0
    check-cast p1, Lcom/google/common/math/StatsAccumulator;

    invoke-virtual {p1, p2, p3}, Lcom/google/common/math/StatsAccumulator;->add(D)V

    return-void
.end method
