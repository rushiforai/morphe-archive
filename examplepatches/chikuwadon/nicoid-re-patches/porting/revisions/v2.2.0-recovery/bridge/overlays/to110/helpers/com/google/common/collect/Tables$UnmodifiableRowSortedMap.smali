.class final Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;
.super Lcom/google/common/collect/Tables$UnmodifiableTable;
.source "Tables.java"

# interfaces
.implements Lcom/google/common/collect/RowSortedTable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Tables;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnmodifiableRowSortedMap"
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
        "Lcom/google/common/collect/Tables$UnmodifiableTable<",
        "TR;TC;TV;>;",
        "Lcom/google/common/collect/RowSortedTable<",
        "TR;TC;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# direct methods
.method constructor <init>(Lcom/google/common/collect/RowSortedTable;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "delegate"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/RowSortedTable<",
            "TR;+TC;+TV;>;)V"
        }
    .end annotation

    .line 644
    invoke-direct {p0, p1}, Lcom/google/common/collect/Tables$UnmodifiableTable;-><init>(Lcom/google/common/collect/Table;)V

    return-void
.end method


# virtual methods
.method protected delegate()Lcom/google/common/collect/RowSortedTable;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/RowSortedTable<",
            "TR;TC;TV;>;"
        }
    .end annotation

    .line 649
    invoke-super {p0}, Lcom/google/common/collect/Tables$UnmodifiableTable;->delegate()Lcom/google/common/collect/Table;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/RowSortedTable;

    return-object p0
.end method

.method protected bridge synthetic delegate()Lcom/google/common/collect/Table;
    .registers 1

    .line 639
    invoke-virtual {p0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;->delegate()Lcom/google/common/collect/RowSortedTable;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 639
    invoke-virtual {p0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;->delegate()Lcom/google/common/collect/RowSortedTable;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic rowKeySet()Ljava/util/Set;
    .registers 1

    .line 639
    invoke-virtual {p0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;->rowKeySet()Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public rowKeySet()Ljava/util/SortedSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet<",
            "TR;>;"
        }
    .end annotation

    .line 660
    invoke-virtual {p0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;->delegate()Lcom/google/common/collect/RowSortedTable;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/RowSortedTable;->rowKeySet()Ljava/util/SortedSet;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSortedSet(Ljava/util/SortedSet;)Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic rowMap()Ljava/util/Map;
    .registers 1

    .line 639
    invoke-virtual {p0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;->rowMap()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public rowMap()Ljava/util/SortedMap;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TR;",
            "Ljava/util/Map<",
            "TC;TV;>;>;"
        }
    .end annotation

    .line 655
    invoke-virtual {p0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap;->delegate()Lcom/google/common/collect/RowSortedTable;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/RowSortedTable;->rowMap()Ljava/util/SortedMap;

    move-result-object p0

    new-instance v0, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap$0;

    invoke-direct {v0}, Lcom/google/common/collect/Tables$UnmodifiableRowSortedMap$0;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->transformValues(Ljava/util/SortedMap;Lcom/google/common/base/Function;)Ljava/util/SortedMap;

    move-result-object p0

    .line 654
    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSortedMap(Ljava/util/SortedMap;)Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method
