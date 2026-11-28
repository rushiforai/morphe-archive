.class public abstract Lcom/google/common/collect/ForwardingSortedMultiset;
.super Lcom/google/common/collect/ForwardingMultiset;
.source "ForwardingSortedMultiset.java"

# interfaces
.implements Lcom/google/common/collect/SortedMultiset;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ForwardingSortedMultiset$StandardDescendingMultiset;,
        Lcom/google/common/collect/ForwardingSortedMultiset$StandardElementSet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMultiset<",
        "TE;>;",
        "Lcom/google/common/collect/SortedMultiset<",
        "TE;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 49
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMultiset;-><init>()V

    return-void
.end method


# virtual methods
.method public comparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-TE;>;"
        }
    .end annotation

    .line 81
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->comparator()Ljava/util/Comparator;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Lcom/google/common/collect/Multiset;
    .registers 1

    .line 45
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method protected abstract delegate()Lcom/google/common/collect/SortedMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 45
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Collection;
    .registers 1

    .line 45
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method public descendingMultiset()Lcom/google/common/collect/SortedMultiset;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 86
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->descendingMultiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method public elementSet()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TE;>;"
        }
    .end annotation

    .line 56
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->elementSet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic elementSet()Ljava/util/Set;
    .registers 1

    .line 45
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->elementSet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic elementSet()Ljava/util/SortedSet;
    .registers 1

    .line 45
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->elementSet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public firstEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 113
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->firstEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method public headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "upperBound",
            "boundType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 199
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/common/collect/SortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method public lastEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 133
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->lastEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method public pollFirstEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 154
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->pollFirstEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method public pollLastEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 176
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->pollLastEntry()Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardFirstEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 123
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 124
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 127
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/Multiset$Entry;

    .line 128
    invoke-interface {p0}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardLastEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 144
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->descendingMultiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 145
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 148
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/google/common/collect/Multiset$Entry;

    .line 149
    invoke-interface {p0}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardPollFirstEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 164
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 165
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 168
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Multiset$Entry;

    .line 169
    invoke-interface {v0}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v0

    invoke-static {v1, v0}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    .line 170
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    return-object v0
.end method

.method protected standardPollLastEntry()Lcom/google/common/collect/Multiset$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;"
        }
    .end annotation

    .line 187
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->descendingMultiset()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/SortedMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    .line 188
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 191
    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/collect/Multiset$Entry;

    .line 192
    invoke-interface {v0}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v0

    invoke-static {v1, v0}, Lcom/google/common/collect/Multisets;->immutableEntry(Ljava/lang/Object;I)Lcom/google/common/collect/Multiset$Entry;

    move-result-object v0

    .line 193
    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    return-object v0
.end method

.method protected standardSubMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "lowerBound",
            "lowerBoundType",
            "upperBound",
            "upperBoundType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            "TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 224
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ForwardingSortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0, p3, p4}, Lcom/google/common/collect/SortedMultiset;->headMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method public subMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "lowerBound",
            "lowerBoundType",
            "upperBound",
            "upperBoundType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            "TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 208
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3, p4}, Lcom/google/common/collect/SortedMultiset;->subMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method

.method public tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "lowerBound",
            "boundType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;",
            "Lcom/google/common/collect/BoundType;",
            ")",
            "Lcom/google/common/collect/SortedMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 229
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingSortedMultiset;->delegate()Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Lcom/google/common/collect/SortedMultiset;->tailMultiset(Ljava/lang/Object;Lcom/google/common/collect/BoundType;)Lcom/google/common/collect/SortedMultiset;

    move-result-object p0

    return-object p0
.end method
