.class public abstract Lcom/google/common/collect/ForwardingNavigableMap;
.super Lcom/google/common/collect/ForwardingSortedMap;
.source "ForwardingNavigableMap.java"

# interfaces
.implements Ljava/util/NavigableMap;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ForwardingNavigableMap$StandardNavigableKeySet;,
        Lcom/google/common/collect/ForwardingNavigableMap$StandardDescendingMap;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingSortedMap<",
        "TK;TV;>;",
        "Ljava/util/NavigableMap<",
        "TK;TV;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 61
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingSortedMap;-><init>()V

    return-void
.end method


# virtual methods
.method public ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 124
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 138
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->ceilingKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 56
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method protected bridge synthetic delegate()Ljava/util/Map;
    .registers 1

    .line 56
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method protected abstract delegate()Ljava/util/NavigableMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableMap<",
            "TK;TV;>;"
        }
    .end annotation
.end method

.method protected bridge synthetic delegate()Ljava/util/SortedMap;
    .registers 1

    .line 56
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public descendingKeySet()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TK;>;"
        }
    .end annotation

    .line 348
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->descendingKeySet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public descendingMap()Ljava/util/NavigableMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 263
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public firstEntry()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 180
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 96
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public floorKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 110
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->floorKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "toKey",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;Z)",
            "Ljava/util/NavigableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 384
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Ljava/util/NavigableMap;->headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 152
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public higherKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 166
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->higherKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public lastEntry()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 208
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->lastEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 68
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public lowerKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 82
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/NavigableMap;->lowerKey(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public navigableKeySet()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TK;>;"
        }
    .end annotation

    .line 328
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->navigableKeySet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public pollFirstEntry()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 235
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->pollFirstEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public pollLastEntry()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 249
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->pollLastEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardCeilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 133
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ForwardingNavigableMap;->tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardCeilingKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 147
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingNavigableMap;->ceilingEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Maps;->keyOrNull(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected standardDescendingKeySet()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TK;>;"
        }
    .end annotation

    .line 359
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->navigableKeySet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method protected standardFirstEntry()Ljava/util/Map$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 189
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->snapshotFirst(Ljava/lang/Iterable;Z)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardFirstKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 198
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 202
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 200
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method protected standardFloorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 105
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ForwardingNavigableMap;->headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->lastEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardFloorKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 119
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingNavigableMap;->floorEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Maps;->keyOrNull(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected standardHeadMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "toKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 398
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ForwardingNavigableMap;->headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method protected standardHigherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 161
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ForwardingNavigableMap;->tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->firstEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardHigherKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 175
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingNavigableMap;->higherEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Maps;->keyOrNull(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected standardLastEntry()Ljava/util/Map$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 217
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->snapshotFirst(Ljava/lang/Iterable;Z)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardLastKey()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 225
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->lastEntry()Ljava/util/Map$Entry;

    move-result-object p0

    if-eqz p0, :cond_0

    .line 229
    invoke-interface {p0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 227
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method protected standardLowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;
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
            "(TK;)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 77
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ForwardingNavigableMap;->headMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->lastEntry()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardLowerKey(Ljava/lang/Object;)Ljava/lang/Object;
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
            "(TK;)TK;"
        }
    .end annotation

    .line 91
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ForwardingNavigableMap;->lowerEntry(Ljava/lang/Object;)Ljava/util/Map$Entry;

    move-result-object p0

    invoke-static {p0}, Lcom/google/common/collect/Maps;->keyOrNull(Ljava/util/Map$Entry;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method protected standardPollFirstEntry()Ljava/util/Map$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 244
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->snapshotFirst(Ljava/lang/Iterable;Z)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardPollLastEntry()Ljava/util/Map$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 258
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->descendingMap()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/NavigableMap;->entrySet()Ljava/util/Set;

    move-result-object p0

    const/4 v0, 0x1

    invoke-static {p0, v0}, Lcom/google/common/collect/Maps;->snapshotFirst(Ljava/lang/Iterable;Z)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected standardSubMap(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromKey",
            "toKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;TK;)",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x1

    const/4 v1, 0x0

    .line 370
    invoke-virtual {p0, p1, v0, p2, v1}, Lcom/google/common/collect/ForwardingNavigableMap;->subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method protected standardTailMap(Ljava/lang/Object;)Ljava/util/SortedMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "fromKey"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)",
            "Ljava/util/SortedMap<",
            "TK;TV;>;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 407
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/ForwardingNavigableMap;->tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "fromKey",
            "fromInclusive",
            "toKey",
            "toInclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;ZTK;Z)",
            "Ljava/util/NavigableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 379
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1, p2, p3, p4}, Ljava/util/NavigableMap;->subMap(Ljava/lang/Object;ZLjava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromKey",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;Z)",
            "Ljava/util/NavigableMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 389
    invoke-virtual {p0}, Lcom/google/common/collect/ForwardingNavigableMap;->delegate()Ljava/util/NavigableMap;

    move-result-object p0

    invoke-interface {p0, p1, p2}, Ljava/util/NavigableMap;->tailMap(Ljava/lang/Object;Z)Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method
