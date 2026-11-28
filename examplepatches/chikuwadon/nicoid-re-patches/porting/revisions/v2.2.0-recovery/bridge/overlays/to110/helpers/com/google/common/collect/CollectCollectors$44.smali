.class public final synthetic Lcom/google/common/collect/CollectCollectors$44;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/Supplier;


# instance fields
.field public final synthetic f$0:Ljava/util/Comparator;


# direct methods
.method public synthetic constructor <init>(Ljava/util/Comparator;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/CollectCollectors$44;->f$0:Ljava/util/Comparator;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/collect/CollectCollectors$44;->f$0:Ljava/util/Comparator;

    invoke-static {p0}, Lcom/google/common/collect/CollectCollectors;->lambda$toImmutableSortedMap$2(Ljava/util/Comparator;)Ljava/util/TreeMap;

    move-result-object p0

    return-object p0
.end method
