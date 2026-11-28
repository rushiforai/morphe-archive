.class public final synthetic Lcom/google/common/collect/CollectCollectors$14;
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
    invoke-static {}, Lcom/google/common/collect/CollectCollectors;->lambda$toImmutableEnumSetGeneric$0()Lcom/google/common/collect/CollectCollectors$EnumSetAccumulator;

    move-result-object p0

    return-object p0
.end method
