.class final Lcom/google/common/collect/CompactHashMap$EntrySetView;
.super Ljava/util/AbstractSet;
.source "CompactHashMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/CompactHashMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EntrySetView"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/CompactHashMap;


# direct methods
.method private constructor <init>(Lcom/google/common/collect/CompactHashMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 741
    iput-object p1, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/collect/CompactHashMap;Lcom/google/common/collect/CompactHashMap$1;)V
    .registers 3

    .line 741
    invoke-direct {p0, p1}, Lcom/google/common/collect/CompactHashMap$EntrySetView;-><init>(Lcom/google/common/collect/CompactHashMap;)V

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 749
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->clear()V

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 759
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {v0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 761
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 762
    :cond_0
    instance-of v0, p1, Ljava/util/Map$Entry;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 763
    check-cast p1, Ljava/util/Map$Entry;

    .line 764
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    # invokes: Lcom/google/common/collect/CompactHashMap;->indexOf(Ljava/lang/Object;)I
    invoke-static {v0, v2}, Lcom/google/common/collect/CompactHashMap;->access$700(Lcom/google/common/collect/CompactHashMap;Ljava/lang/Object;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_1

    .line 765
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    # invokes: Lcom/google/common/collect/CompactHashMap;->value(I)Ljava/lang/Object;
    invoke-static {p0, v0}, Lcom/google/common/collect/CompactHashMap;->access$800(Lcom/google/common/collect/CompactHashMap;I)Ljava/lang/Object;

    move-result-object p0

    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;>;"
        }
    .end annotation

    .line 754
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->entrySetIterator()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public final remove(Ljava/lang/Object;)Z
    .registers 11
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 772
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {v0}, Lcom/google/common/collect/CompactHashMap;->delegateOrNull()Ljava/util/Map;

    move-result-object v0

    if-eqz v0, :cond_0

    .line 774
    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    move-result p0

    return p0

    .line 775
    :cond_0
    instance-of v0, p1, Ljava/util/Map$Entry;

    const/4 v1, 0x0

    if-eqz v0, :cond_3

    .line 776
    check-cast p1, Ljava/util/Map$Entry;

    .line 777
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {v0}, Lcom/google/common/collect/CompactHashMap;->needsAllocArrays()Z

    move-result v0

    if-eqz v0, :cond_1

    return v1

    .line 780
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    # invokes: Lcom/google/common/collect/CompactHashMap;->hashTableMask()I
    invoke-static {v0}, Lcom/google/common/collect/CompactHashMap;->access$900(Lcom/google/common/collect/CompactHashMap;)I

    move-result v4

    .line 783
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v2

    .line 784
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v3

    iget-object p1, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    .line 786
    # invokes: Lcom/google/common/collect/CompactHashMap;->requireTable()Ljava/lang/Object;
    invoke-static {p1}, Lcom/google/common/collect/CompactHashMap;->access$1000(Lcom/google/common/collect/CompactHashMap;)Ljava/lang/Object;

    move-result-object v5

    iget-object p1, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    .line 787
    # invokes: Lcom/google/common/collect/CompactHashMap;->requireEntries()[I
    invoke-static {p1}, Lcom/google/common/collect/CompactHashMap;->access$1100(Lcom/google/common/collect/CompactHashMap;)[I

    move-result-object v6

    iget-object p1, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    .line 788
    # invokes: Lcom/google/common/collect/CompactHashMap;->requireKeys()[Ljava/lang/Object;
    invoke-static {p1}, Lcom/google/common/collect/CompactHashMap;->access$1200(Lcom/google/common/collect/CompactHashMap;)[Ljava/lang/Object;

    move-result-object v7

    iget-object p1, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    .line 789
    # invokes: Lcom/google/common/collect/CompactHashMap;->requireValues()[Ljava/lang/Object;
    invoke-static {p1}, Lcom/google/common/collect/CompactHashMap;->access$1300(Lcom/google/common/collect/CompactHashMap;)[Ljava/lang/Object;

    move-result-object v8

    .line 782
    invoke-static/range {v2 .. v8}, Lcom/google/common/collect/CompactHashing;->remove(Ljava/lang/Object;Ljava/lang/Object;ILjava/lang/Object;[I[Ljava/lang/Object;[Ljava/lang/Object;)I

    move-result p1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_2

    return v1

    .line 794
    :cond_2
    iget-object v0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {v0, p1, v4}, Lcom/google/common/collect/CompactHashMap;->moveLastEntry(II)V

    .line 795
    iget-object p1, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    # operator-- for: Lcom/google/common/collect/CompactHashMap;->size:I
    invoke-static {p1}, Lcom/google/common/collect/CompactHashMap;->access$1410(Lcom/google/common/collect/CompactHashMap;)I

    .line 796
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->incrementModCount()V

    const/4 p0, 0x1

    return p0

    :cond_3
    return v1
.end method

.method public size()I
    .registers 1

    .line 744
    iget-object p0, p0, Lcom/google/common/collect/CompactHashMap$EntrySetView;->this$0:Lcom/google/common/collect/CompactHashMap;

    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashMap;->size()I

    move-result p0

    return p0
.end method
