.class public final Lcom/google/common/collect/ImmutableSetMultimap$Builder;
.super Lcom/google/common/collect/ImmutableMultimap$Builder;
.source "ImmutableSetMultimap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableSetMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableMultimap$Builder<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .registers 1

    .line 264
    invoke-direct {p0}, Lcom/google/common/collect/ImmutableMultimap$Builder;-><init>()V

    return-void
.end method

.method constructor <init>(I)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedKeys"
        }
    .end annotation

    .line 267
    invoke-direct {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;-><init>(I)V

    return-void
.end method


# virtual methods
.method public bridge synthetic build()Lcom/google/common/collect/ImmutableMultimap;
    .registers 1

    .line 259
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->build()Lcom/google/common/collect/ImmutableSetMultimap;

    move-result-object p0

    return-object p0
.end method

.method public build()Lcom/google/common/collect/ImmutableSetMultimap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSetMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 398
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->builderMap:Ljava/util/Map;

    if-nez v0, :cond_0

    .line 399
    invoke-static {}, Lcom/google/common/collect/ImmutableSetMultimap;->of()Lcom/google/common/collect/ImmutableSetMultimap;

    move-result-object p0

    return-object p0

    .line 401
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->builderMap:Ljava/util/Map;

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    .line 402
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->keyComparator:Ljava/util/Comparator;

    if-eqz v1, :cond_1

    .line 403
    iget-object v1, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->keyComparator:Ljava/util/Comparator;

    invoke-static {v1}, Lcom/google/common/collect/Ordering;->from(Ljava/util/Comparator;)Lcom/google/common/collect/Ordering;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/Ordering;->onKeys()Lcom/google/common/collect/Ordering;

    move-result-object v1

    invoke-virtual {v1, v0}, Lcom/google/common/collect/Ordering;->immutableSortedCopy(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableList;

    move-result-object v0

    .line 405
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->valueComparator:Ljava/util/Comparator;

    invoke-static {v0, p0}, Lcom/google/common/collect/ImmutableSetMultimap;->fromMapBuilderEntries(Ljava/util/Collection;Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap;

    move-result-object p0

    return-object p0
.end method

.method bridge synthetic combine(Lcom/google/common/collect/ImmutableMultimap$Builder;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "other"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->combine(Lcom/google/common/collect/ImmutableMultimap$Builder;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method combine(Lcom/google/common/collect/ImmutableMultimap$Builder;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "other"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableMultimap$Builder<",
            "TK;TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 361
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->combine(Lcom/google/common/collect/ImmutableMultimap$Builder;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method expectedValueCollectionSize(ILjava/lang/Iterable;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "defaultExpectedValues",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Iterable<",
            "*>;)I"
        }
    .end annotation

    .line 280
    instance-of p0, p2, Ljava/util/Set;

    if-eqz p0, :cond_0

    .line 281
    check-cast p2, Ljava/util/Set;

    .line 282
    invoke-interface {p2}, Ljava/util/Set;->size()I

    move-result p0

    invoke-static {p1, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0

    :cond_0
    return p1
.end method

.method public bridge synthetic expectedValuesPerKey(I)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "expectedValuesPerKey"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->expectedValuesPerKey(I)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public expectedValuesPerKey(I)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedValuesPerKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 299
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->expectedValuesPerKey(I)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method newValueCollectionBuilderWithExpectedSize(I)Lcom/google/common/collect/ImmutableCollection$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedSize"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/collect/ImmutableCollection$Builder<",
            "TV;>;"
        }
    .end annotation

    .line 272
    iget-object v0, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->valueComparator:Ljava/util/Comparator;

    if-nez v0, :cond_0

    .line 273
    invoke-static {p1}, Lcom/google/common/collect/ImmutableSet;->builderWithExpectedSize(I)Lcom/google/common/collect/ImmutableSet$Builder;

    move-result-object p0

    return-object p0

    .line 274
    :cond_0
    new-instance v0, Lcom/google/common/collect/ImmutableSortedSet$Builder;

    iget-object p0, p0, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->valueComparator:Ljava/util/Comparator;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/ImmutableSortedSet$Builder;-><init>(Ljava/util/Comparator;I)V

    return-object v0
.end method

.method public bridge synthetic orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "keyComparator"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "keyComparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TK;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 373
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->orderKeysBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method public bridge synthetic orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "valueComparator"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "valueComparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 391
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->orderValuesBy(Ljava/util/Comparator;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method public bridge synthetic put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entry"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 3
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
            "(TK;TV;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 307
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/ImmutableMultimap$Builder;->put(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method public put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 2
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
            "+TK;+TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 319
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->put(Ljava/util/Map$Entry;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method public bridge synthetic putAll(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "multimap"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entries"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putAll(Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableMultimap$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .line 259
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method

.method public putAll(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "multimap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/Multimap<",
            "+TK;+TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 352
    invoke-interface {p1}, Lcom/google/common/collect/Multimap;->asMap()Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 353
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v1

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    invoke-virtual {p0, v1, v0}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    goto :goto_0

    :cond_0
    return-object p0
.end method

.method public putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entries"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Iterable<",
            "+",
            "Ljava/util/Map$Entry<",
            "+TK;+TV;>;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 331
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableMultimap$Builder;->putAll(Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method public putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;",
            "Ljava/lang/Iterable<",
            "+TV;>;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 338
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/ImmutableMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableMultimap$Builder;

    return-object p0
.end method

.method public varargs putAll(Ljava/lang/Object;[Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "values"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;[TV;)",
            "Lcom/google/common/collect/ImmutableSetMultimap$Builder<",
            "TK;TV;>;"
        }
    .end annotation

    .line 345
    invoke-static {p2}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableSetMultimap$Builder;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Lcom/google/common/collect/ImmutableSetMultimap$Builder;

    move-result-object p0

    return-object p0
.end method
