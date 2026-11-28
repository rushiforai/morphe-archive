.class final Lcom/google/common/collect/Tables$TransposeTable;
.super Lcom/google/common/collect/AbstractTable;
.source "Tables.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Tables;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TransposeTable"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<C:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractTable<",
        "TC;TR;TV;>;"
    }
.end annotation


# instance fields
.field final original:Lcom/google/common/collect/Table;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/Table<",
            "TR;TC;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/Table;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "original"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table<",
            "TR;TC;TV;>;)V"
        }
    .end annotation

    .line 231
    invoke-direct {p0}, Lcom/google/common/collect/AbstractTable;-><init>()V

    .line 232
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/Table;

    iput-object p1, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    return-void
.end method

.method static synthetic lambda$cellIterator$0(Lcom/google/common/collect/Table$Cell;)Lcom/google/common/collect/Table$Cell;
    .registers 1

    .line 325
    # invokes: Lcom/google/common/collect/Tables;->transposeCell(Lcom/google/common/collect/Table$Cell;)Lcom/google/common/collect/Table$Cell;
    invoke-static {p0}, Lcom/google/common/collect/Tables;->access$000(Lcom/google/common/collect/Table$Cell;)Lcom/google/common/collect/Table$Cell;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method cellIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/collect/Table$Cell<",
            "TC;TR;TV;>;>;"
        }
    .end annotation

    .line 325
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->cellSet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    new-instance v0, Lcom/google/common/collect/Tables$TransposeTable$0;

    invoke-direct {v0}, Lcom/google/common/collect/Tables$TransposeTable$0;-><init>()V

    invoke-static {p0, v0}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public clear()V
    .registers 1

    .line 237
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->clear()V

    return-void
.end method

.method public column(Ljava/lang/Object;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "columnKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)",
            "Ljava/util/Map<",
            "TC;TV;>;"
        }
    .end annotation

    .line 242
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Table;->row(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public columnKeySet()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TR;>;"
        }
    .end annotation

    .line 247
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->rowKeySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public columnMap()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TR;",
            "Ljava/util/Map<",
            "TC;TV;>;>;"
        }
    .end annotation

    .line 252
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->rowMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public contains(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rowKey",
            "columnKey"
        }
    .end annotation

    .line 257
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p2, p1}, Lcom/google/common/collect/Table;->contains(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public containsColumn(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "columnKey"
        }
    .end annotation

    .line 262
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Table;->containsRow(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public containsRow(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rowKey"
        }
    .end annotation

    .line 267
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Table;->containsColumn(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 272
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Table;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rowKey",
            "columnKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 277
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p2, p1}, Lcom/google/common/collect/Table;->get(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "rowKey",
            "columnKey",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;TR;TV;)TV;"
        }
    .end annotation

    .line 285
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p2, p1, p3}, Lcom/google/common/collect/Table;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public putAll(Lcom/google/common/collect/Table;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "table"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Table<",
            "+TC;+TR;+TV;>;)V"
        }
    .end annotation

    .line 290
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-static {p1}, Lcom/google/common/collect/Tables;->transpose(Lcom/google/common/collect/Table;)Lcom/google/common/collect/Table;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/common/collect/Table;->putAll(Lcom/google/common/collect/Table;)V

    return-void
.end method

.method public remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "rowKey",
            "columnKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 295
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p2, p1}, Lcom/google/common/collect/Table;->remove(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public row(Ljava/lang/Object;)Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "rowKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;)",
            "Ljava/util/Map<",
            "TR;TV;>;"
        }
    .end annotation

    .line 300
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Table;->column(Ljava/lang/Object;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public rowKeySet()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TC;>;"
        }
    .end annotation

    .line 305
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->columnKeySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public rowMap()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TC;",
            "Ljava/util/Map<",
            "TR;TV;>;>;"
        }
    .end annotation

    .line 310
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->columnMap()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 315
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->size()I

    move-result p0

    return p0
.end method

.method public values()Ljava/util/Collection;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 320
    iget-object p0, p0, Lcom/google/common/collect/Tables$TransposeTable;->original:Lcom/google/common/collect/Table;

    invoke-interface {p0}, Lcom/google/common/collect/Table;->values()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method
