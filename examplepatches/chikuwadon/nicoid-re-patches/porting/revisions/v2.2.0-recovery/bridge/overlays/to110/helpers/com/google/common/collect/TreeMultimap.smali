.class public final Lcom/google/common/collect/TreeMultimap;
.super Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;
.source "TreeMultimap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field private transient keyComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TK;>;"
        }
    .end annotation
.end field

.field private transient valueComparator:Ljava/util/Comparator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Comparator<",
            "-TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Comparator;Ljava/util/Comparator;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyComparator",
            "valueComparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TK;>;",
            "Ljava/util/Comparator<",
            "-TV;>;)V"
        }
    .end annotation

    .line 113
    new-instance v0, Ljava/util/TreeMap;

    invoke-direct {v0, p1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    invoke-direct {p0, v0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;-><init>(Ljava/util/SortedMap;)V

    .line 114
    iput-object p1, p0, Lcom/google/common/collect/TreeMultimap;->keyComparator:Ljava/util/Comparator;

    .line 115
    iput-object p2, p0, Lcom/google/common/collect/TreeMultimap;->valueComparator:Ljava/util/Comparator;

    return-void
.end method

.method private constructor <init>(Ljava/util/Comparator;Ljava/util/Comparator;Lcom/google/common/collect/Multimap;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "keyComparator",
            "valueComparator",
            "multimap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Comparator<",
            "-TK;>;",
            "Ljava/util/Comparator<",
            "-TV;>;",
            "Lcom/google/common/collect/Multimap<",
            "+TK;+TV;>;)V"
        }
    .end annotation

    .line 122
    invoke-direct {p0, p1, p2}, Lcom/google/common/collect/TreeMultimap;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    .line 123
    invoke-virtual {p0, p3}, Lcom/google/common/collect/TreeMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    return-void
.end method

.method public static create()Lcom/google/common/collect/TreeMultimap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K::",
            "Ljava/lang/Comparable;",
            "V::",
            "Ljava/lang/Comparable;",
            ">()",
            "Lcom/google/common/collect/TreeMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 85
    new-instance v0, Lcom/google/common/collect/TreeMultimap;

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v1

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/TreeMultimap;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    return-object v0
.end method

.method public static create(Lcom/google/common/collect/Multimap;)Lcom/google/common/collect/TreeMultimap;
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
            "<K::",
            "Ljava/lang/Comparable;",
            "V::",
            "Ljava/lang/Comparable;",
            ">(",
            "Lcom/google/common/collect/Multimap<",
            "+TK;+TV;>;)",
            "Lcom/google/common/collect/TreeMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 109
    new-instance v0, Lcom/google/common/collect/TreeMultimap;

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v1

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v2

    invoke-direct {v0, v1, v2, p0}, Lcom/google/common/collect/TreeMultimap;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;Lcom/google/common/collect/Multimap;)V

    return-object v0
.end method

.method public static create(Ljava/util/Comparator;Ljava/util/Comparator;)Lcom/google/common/collect/TreeMultimap;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "keyComparator",
            "valueComparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<K:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Comparator<",
            "-TK;>;",
            "Ljava/util/Comparator<",
            "-TV;>;)",
            "Lcom/google/common/collect/TreeMultimap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 97
    new-instance v0, Lcom/google/common/collect/TreeMultimap;

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Comparator;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/Comparator;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/TreeMultimap;-><init>(Ljava/util/Comparator;Ljava/util/Comparator;)V

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 215
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 216
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    iput-object v0, p0, Lcom/google/common/collect/TreeMultimap;->keyComparator:Ljava/util/Comparator;

    .line 217
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Comparator;

    iput-object v0, p0, Lcom/google/common/collect/TreeMultimap;->valueComparator:Ljava/util/Comparator;

    .line 218
    new-instance v0, Ljava/util/TreeMap;

    iget-object v1, p0, Lcom/google/common/collect/TreeMultimap;->keyComparator:Ljava/util/Comparator;

    invoke-direct {v0, v1}, Ljava/util/TreeMap;-><init>(Ljava/util/Comparator;)V

    invoke-virtual {p0, v0}, Lcom/google/common/collect/TreeMultimap;->setMap(Ljava/util/Map;)V

    .line 219
    invoke-static {p0, p1}, Lcom/google/common/collect/Serialization;->populateMultimap(Lcom/google/common/collect/Multimap;Ljava/io/ObjectInputStream;)V

    return-void
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "stream"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 205
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 206
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->keyComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 207
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->valueComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-virtual {p1, v0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    .line 208
    invoke-static {p0, p1}, Lcom/google/common/collect/Serialization;->writeMultimap(Lcom/google/common/collect/Multimap;Ljava/io/ObjectOutputStream;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic asMap()Ljava/util/Map;
    .registers 1

    .line 74
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->asMap()Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public asMap()Ljava/util/NavigableMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableMap<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;"
        }
    .end annotation

    .line 195
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->asMap()Ljava/util/SortedMap;

    move-result-object p0

    check-cast p0, Ljava/util/NavigableMap;

    return-object p0
.end method

.method public bridge synthetic asMap()Ljava/util/SortedMap;
    .registers 1

    .line 74
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->asMap()Ljava/util/NavigableMap;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z
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

    .line 74
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->containsEntry(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic containsValue(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "value"
        }
    .end annotation

    .line 74
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method bridge synthetic createCollection()Ljava/util/Collection;
    .registers 1

    .line 74
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->createCollection()Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method createCollection(Ljava/lang/Object;)Ljava/util/Collection;
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
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 141
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->keyComparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-interface {v0, p1, p1}, Ljava/util/Comparator;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    .line 143
    :cond_0
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->createCollection(Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method bridge synthetic createCollection()Ljava/util/Set;
    .registers 1

    .line 74
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->createCollection()Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method createCollection()Ljava/util/SortedSet;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet<",
            "TV;>;"
        }
    .end annotation

    .line 135
    new-instance v0, Ljava/util/TreeSet;

    iget-object p0, p0, Lcom/google/common/collect/TreeMultimap;->valueComparator:Ljava/util/Comparator;

    invoke-direct {v0, p0}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    return-object v0
.end method

.method public bridge synthetic entries()Ljava/util/Set;
    .registers 1

    .line 74
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->entries()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 74
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeMultimap;->get(Ljava/lang/Object;)Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/util/NavigableSet;
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
            "Ljava/util/NavigableSet<",
            "TV;>;"
        }
    .end annotation

    .line 167
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->get(Ljava/lang/Object;)Ljava/util/SortedSet;

    move-result-object p0

    check-cast p0, Ljava/util/NavigableSet;

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 74
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeMultimap;->get(Ljava/lang/Object;)Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic get(Ljava/lang/Object;)Ljava/util/SortedSet;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "key"
        }
    .end annotation

    .line 74
    invoke-virtual {p0, p1}, Lcom/google/common/collect/TreeMultimap;->get(Ljava/lang/Object;)Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic hashCode()I
    .registers 1

    .line 74
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->hashCode()I

    move-result p0

    return p0
.end method

.method public bridge synthetic isEmpty()Z
    .registers 1

    .line 74
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public keyComparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-TK;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 153
    iget-object p0, p0, Lcom/google/common/collect/TreeMultimap;->keyComparator:Ljava/util/Comparator;

    return-object p0
.end method

.method public keySet()Ljava/util/NavigableSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/NavigableSet<",
            "TK;>;"
        }
    .end annotation

    .line 181
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->keySet()Ljava/util/SortedSet;

    move-result-object p0

    check-cast p0, Ljava/util/NavigableSet;

    return-object p0
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .registers 1

    .line 74
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->keySet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic keySet()Ljava/util/SortedSet;
    .registers 1

    .line 74
    invoke-virtual {p0}, Lcom/google/common/collect/TreeMultimap;->keySet()Ljava/util/NavigableSet;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic keys()Lcom/google/common/collect/Multiset;
    .registers 1

    .line 74
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->keys()Lcom/google/common/collect/Multiset;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic putAll(Lcom/google/common/collect/Multimap;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "multimap"
        }
    .end annotation

    .line 74
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->putAll(Lcom/google/common/collect/Multimap;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z
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

    .line 74
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->putAll(Ljava/lang/Object;Ljava/lang/Iterable;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic remove(Ljava/lang/Object;Ljava/lang/Object;)Z
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

    .line 74
    invoke-super {p0, p1, p2}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public valueComparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "-TV;>;"
        }
    .end annotation

    .line 158
    iget-object p0, p0, Lcom/google/common/collect/TreeMultimap;->valueComparator:Ljava/util/Comparator;

    return-object p0
.end method
