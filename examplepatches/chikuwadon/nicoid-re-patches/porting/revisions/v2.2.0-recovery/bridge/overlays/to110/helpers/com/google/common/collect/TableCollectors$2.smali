.class public final synthetic Lcom/google/common/collect/TableCollectors$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/util/function/BiConsumer;


# instance fields
.field public final synthetic f$0:Ljava/util/function/Function;

.field public final synthetic f$1:Ljava/util/function/Function;

.field public final synthetic f$2:Ljava/util/function/Function;

.field public final synthetic f$3:Ljava/util/function/BinaryOperator;


# direct methods
.method public synthetic constructor <init>(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;)V
    .registers 5

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/collect/TableCollectors$2;->f$0:Ljava/util/function/Function;

    iput-object p2, p0, Lcom/google/common/collect/TableCollectors$2;->f$1:Ljava/util/function/Function;

    iput-object p3, p0, Lcom/google/common/collect/TableCollectors$2;->f$2:Ljava/util/function/Function;

    iput-object p4, p0, Lcom/google/common/collect/TableCollectors$2;->f$3:Ljava/util/function/BinaryOperator;

    return-void
.end method


# virtual methods
.method public final accept(Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 9

    .line 0
    iget-object v0, p0, Lcom/google/common/collect/TableCollectors$2;->f$0:Ljava/util/function/Function;

    iget-object v1, p0, Lcom/google/common/collect/TableCollectors$2;->f$1:Ljava/util/function/Function;

    iget-object v2, p0, Lcom/google/common/collect/TableCollectors$2;->f$2:Ljava/util/function/Function;

    iget-object v3, p0, Lcom/google/common/collect/TableCollectors$2;->f$3:Ljava/util/function/BinaryOperator;

    move-object v4, p1

    check-cast v4, Lcom/google/common/collect/Table;

    move-object v5, p2

    invoke-static/range {v0 .. v5}, Lcom/google/common/collect/TableCollectors;->lambda$toTable$1(Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/Function;Ljava/util/function/BinaryOperator;Lcom/google/common/collect/Table;Ljava/lang/Object;)V

    return-void
.end method
