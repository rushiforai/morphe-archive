.class public final synthetic Lcom/google/common/math/Stats$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# direct methods
.method public synthetic constructor <init>()V
    .registers 1

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 1

    .line 0
    new-instance p0, Lcom/google/common/math/StatsAccumulator;

    invoke-direct {p0}, Lcom/google/common/math/StatsAccumulator;-><init>()V

    return-object p0
.end method
