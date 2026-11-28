.class final Lcom/google/common/collect/StandardTable$ColumnKeySet;
.super Lcom/google/common/collect/StandardTable$TableSet;
.source "StandardTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/StandardTable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ColumnKeySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/StandardTable<",
        "TR;TC;TV;>.TableSet<TC;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/StandardTable;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/StandardTable;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 659
    iput-object p1, p0, Lcom/google/common/collect/StandardTable$ColumnKeySet;->this$0:Lcom/google/common/collect/StandardTable;

    const/4 v0, 0x0

    invoke-direct {p0, p1, v0}, Lcom/google/common/collect/StandardTable$TableSet;-><init>(Lcom/google/common/collect/StandardTable;Lcom/google/common/collect/StandardTable$1;)V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/StandardTable;Lcom/google/common/collect/StandardTable$1;)V
    .registers 3

    .line 659
    invoke-direct {p0, p1}, Lcom/google/common/collect/StandardTable$ColumnKeySet;-><init>(Lcom/google/common/collect/StandardTable;)V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 727
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$ColumnKeySet;->this$0:Lcom/google/common/collect/StandardTable;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/StandardTable;->containsColumn(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TC;>;"
        }
    .end annotation

    .line 662
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$ColumnKeySet;->this$0:Lcom/google/common/collect/StandardTable;

    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable;->createColumnKeyIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    const/4 v0, 0x0

    if-nez p1, :cond_0

    return v0

    .line 676
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$ColumnKeySet;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object p0, p0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 677
    :cond_1
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_3

    .line 678
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 679
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    .line 681
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_2

    .line 682
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    :cond_2
    const/4 v0, 0x1

    goto :goto_0

    :cond_3
    return v0
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 691
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 693
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$ColumnKeySet;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object p0, p0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    .line 694
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 695
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 698
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v2

    invoke-static {v2, p1}, Lcom/google/common/collect/Iterators;->removeAll(Ljava/util/Iterator;Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 700
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 701
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 710
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 712
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$ColumnKeySet;->this$0:Lcom/google/common/collect/StandardTable;

    iget-object p0, p0, Lcom/google/common/collect/StandardTable;->backingMap:Ljava/util/Map;

    invoke-interface {p0}, Ljava/util/Map;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const/4 v0, 0x0

    .line 713
    :cond_0
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_2

    .line 714
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/Map;

    .line 715
    invoke-interface {v1}, Ljava/util/Map;->keySet()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, p1}, Ljava/util/Set;->retainAll(Ljava/util/Collection;)Z

    move-result v2

    if-eqz v2, :cond_0

    .line 717
    invoke-interface {v1}, Ljava/util/Map;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 718
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    :cond_1
    const/4 v0, 0x1

    goto :goto_0

    :cond_2
    return v0
.end method

.method public size()I
    .registers 1

    .line 667
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$ColumnKeySet;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Iterators;->size(Ljava/util/Iterator;)I

    move-result p0

    return p0
.end method
