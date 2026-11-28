.class abstract Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;
.super Lcom/google/common/collect/AbstractSortedSetMultimap;
.source "AbstractSortedKeySortedSetMultimap.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractSortedSetMultimap<",
        "TK;TV;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x501778724945e3faL


# direct methods
.method constructor <init>(Ljava/util/SortedMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "map"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/SortedMap<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;)V"
        }
    .end annotation

    .line 41
    invoke-direct {p0, p1}, Lcom/google/common/collect/AbstractSortedSetMultimap;-><init>(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public bridge synthetic asMap()Ljava/util/Map;
    .registers 1

    .line 35
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->asMap()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method public asMap()Ljava/util/SortedMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;"
        }
    .end annotation

    .line 46
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->createMaybeNavigableAsMap()Ljava/util/Map;

    move-result-object p0

    check-cast p0, Ljava/util/SortedMap;

    return-object p0
.end method

.method bridge synthetic backingMap()Ljava/util/Map;
    .registers 1

    .line 35
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->backingMap()Ljava/util/SortedMap;

    move-result-object p0

    return-object p0
.end method

.method final backingMap()Ljava/util/SortedMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedMap<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;"
        }
    .end annotation

    .line 51
    invoke-super {p0}, Lcom/google/common/collect/AbstractSortedSetMultimap;->backingMap()Ljava/util/Map;

    move-result-object p0

    check-cast p0, Ljava/util/SortedMap;

    return-object p0
.end method

.method public bridge synthetic keySet()Ljava/util/Set;
    .registers 1

    .line 35
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->keySet()Ljava/util/SortedSet;

    move-result-object p0

    return-object p0
.end method

.method public keySet()Ljava/util/SortedSet;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/SortedSet<",
            "TK;>;"
        }
    .end annotation

    .line 56
    invoke-virtual {p0}, Lcom/google/common/collect/AbstractSortedKeySortedSetMultimap;->createMaybeNavigableKeySet()Ljava/util/Set;

    move-result-object p0

    check-cast p0, Ljava/util/SortedSet;

    return-object p0
.end method
