.class Lcom/google/common/collect/StandardTable$Row;
.super Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;
.source "StandardTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/StandardTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = "Row"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$IteratorBasedAbstractMap<",
        "TC;TV;>;"
    }
.end annotation


# instance fields
.field backingRowMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TC;TV;>;"
        }
    .end annotation
.end field

.field final rowKey:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/StandardTable;


# direct methods
.method constructor <init>(Lcom/google/common/collect/StandardTable;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$0",
            "rowKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 309
    iput-object p1, p0, Lcom/google/common/collect/StandardTable$Row;->this$0:Lcom/google/common/collect/StandardTable;

    invoke-direct {p0}, Lcom/google/common/collect/Maps$IteratorBasedAbstractMap;-><init>()V

    .line 310
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/StandardTable$Row;->rowKey:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final clear()V
    .registers 2

    .line 369
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    .line 370
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    .line 371
    invoke-interface {v0}, Ljava/util/Map;->clear()V

    .line 373
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->maintainEmptyInvariant()V

    return-void
.end method

.method computeBackingRowMap()Ljava/util/Map;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TC;TV;>;"
        }
    .end annotation

    .line 322
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row;->rowKey:Ljava/lang/Object;

    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map;

    return-object p0
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 336
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    if-eqz p1, :cond_0

    .line 337
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-eqz p0, :cond_0

    invoke-static {p0, p1}, Lcom/google/common/collect/Maps;->safeContainsKey(Ljava/util/Map;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method final entryIterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TC;TV;>;>;"
        }
    .end annotation

    .line 384
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    .line 385
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 386
    invoke-static {}, Lcom/google/common/collect/Iterators;->emptyModifiableIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0

    .line 388
    :cond_0
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 389
    new-instance v1, Lcom/google/common/collect/StandardTable$Row$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/StandardTable$Row$1;-><init>(Lcom/google/common/collect/StandardTable$Row;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public final get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 342
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    if-eqz p1, :cond_0

    .line 343
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-eqz p0, :cond_0

    invoke-static {p0, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    :cond_0
    const/4 p0, 0x0

    return-object p0
.end method

.method maintainEmptyInvariant()V
    .registers 3

    .line 327
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    .line 328
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 329
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/common/collect/StandardTable$Row;->rowKey:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x0

    .line 330
    iput-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    :cond_0
    return-void
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TC;TV;)TV;"
        }
    .end annotation

    .line 348
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 349
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 350
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-eqz v0, :cond_0

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 351
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 353
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row;->rowKey:Ljava/lang/Object;

    invoke-virtual {v0, p0, p1, p2}, Lcom/google/common/collect/StandardTable;->put(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TV;"
        }
    .end annotation

    .line 358
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    .line 359
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 362
    :cond_0
    invoke-static {v0, p1}, Lcom/google/common/collect/Maps;->safeRemove(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    .line 363
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->maintainEmptyInvariant()V

    return-object p1
.end method

.method public final size()I
    .registers 1

    .line 378
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->updateBackingRowMapField()V

    .line 379
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    return p0
.end method

.method final updateBackingRowMapField()V
    .registers 3

    .line 316
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    if-eqz v0, :cond_1

    invoke-interface {v0}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object v0, v0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    iget-object v1, p0, Lcom/google/common/collect/StandardTable$Row;->rowKey:Ljava/lang/Object;

    invoke-interface {v0, v1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    :cond_0
    return-void

    .line 317
    :cond_1
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->computeBackingRowMap()Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/StandardTable$Row;->backingRowMap:Ljava/util/Map;

    return-void
.end method

.method final wrapEntry(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map$Entry<",
            "TC;TV;>;)",
            "Ljava/util/Map$Entry<",
            "TC;TV;>;"
        }
    .end annotation

    .line 409
    new-instance v0, Lcom/google/common/collect/StandardTable$Row$2;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/StandardTable$Row$2;-><init>(Lcom/google/common/collect/StandardTable$Row;Ljava/util/Map$Entry;)V

    return-object v0
.end method
