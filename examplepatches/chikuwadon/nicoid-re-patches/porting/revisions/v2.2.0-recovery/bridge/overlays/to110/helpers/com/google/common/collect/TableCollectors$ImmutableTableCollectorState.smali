.class final Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;
.super Ljava/lang/Object;
.source "TableCollectors.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/TableCollectors;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "ImmutableTableCollectorState"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<R:",
        "Ljava/lang/Object;",
        "C:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final insertionOrder:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lcom/google/common/collect/TableCollectors$MutableCell<",
            "TR;TC;TV;>;>;"
        }
    .end annotation
.end field

.field final table:Lcom/google/common/collect/Table;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Table<",
            "TR;TC;",
            "Lcom/google/common/collect/TableCollectors$MutableCell<",
            "TR;TC;TV;>;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>()V
    .registers 2

    .line 138
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 139
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iput-object v0, p0, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->insertionOrder:Ljava/util/List;

    .line 140
    invoke-static {}, Lcom/google/common/collect/HashBasedTable;->create()Lcom/google/common/collect/HashBasedTable;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->table:Lcom/google/common/collect/Table;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/TableCollectors$1;)V
    .registers 2

    .line 138
    invoke-direct {p0}, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;-><init>()V

    return-void
.end method


# virtual methods
.method combine(Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;Ljava/util/function/BinaryOperator;)Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "other",
            "merger"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState<",
            "TR;TC;TV;>;",
            "Ljava/util/function/BinaryOperator<",
            "TV;>;)",
            "Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState<",
            "TR;TC;TV;>;"
        }
    .end annotation

    .line 161
    iget-object p1, p1, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->insertionOrder:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TableCollectors$MutableCell;

    .line 162
    invoke-virtual {v0}, Lcom/google/common/collect/TableCollectors$MutableCell;->getRowKey()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/common/collect/TableCollectors$MutableCell;->getColumnKey()Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {v0}, Lcom/google/common/collect/TableCollectors$MutableCell;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v1, v2, v0, p2}, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BinaryOperator;)V

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/util/function/BinaryOperator;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "row",
            "column",
            "value",
            "merger"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;TC;TV;",
            "Ljava/util/function/BinaryOperator<",
            "TV;>;)V"
        }
    .end annotation

    .line 143
    iget-object v0, p0, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->table:Lcom/google/common/collect/Table;

    invoke-interface {v0, p1, p2}, Lcom/google/common/collect/Table;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/TableCollectors$MutableCell;

    if-nez v0, :cond_0

    .line 145
    new-instance p4, Lcom/google/common/collect/TableCollectors$MutableCell;

    invoke-direct {p4, p1, p2, p3}, Lcom/google/common/collect/TableCollectors$MutableCell;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    .line 146
    iget-object p3, p0, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->insertionOrder:Ljava/util/List;

    invoke-interface {p3, p4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 147
    iget-object p0, p0, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->table:Lcom/google/common/collect/Table;

    invoke-interface {p0, p1, p2, p4}, Lcom/google/common/collect/Table;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 149
    :cond_0
    invoke-virtual {v0, p3, p4}, Lcom/google/common/collect/TableCollectors$MutableCell;->merge(Ljava/lang/Object;Ljava/util/function/BinaryOperator;)V

    return-void
.end method

.method toTable()Lcom/google/common/collect/ImmutableTable;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableTable<",
            "TR;TC;TV;>;"
        }
    .end annotation

    .line 168
    iget-object p0, p0, Lcom/google/common/collect/TableCollectors$ImmutableTableCollectorState;->insertionOrder:Ljava/util/List;

    invoke-static {p0}, Lcom/google/common/collect/ImmutableTable;->copyOf(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableTable;

    move-result-object p0

    return-object p0
.end method
