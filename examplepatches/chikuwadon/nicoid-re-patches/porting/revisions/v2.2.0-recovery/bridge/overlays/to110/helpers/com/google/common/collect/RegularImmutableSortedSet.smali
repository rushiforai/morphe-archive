.class final Lcom/google/common/collect/RegularImmutableSortedSet;
.super Lcom/google/common/collect/ImmutableSortedSet;
.source "RegularImmutableSortedSet.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ImmutableSortedSet<",
        "TE;>;"
    }
.end annotation


# static fields
.field static final NATURAL_EMPTY_SET:Lcom/google/common/collect/RegularImmutableSortedSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/RegularImmutableSortedSet<",
            "Ljava/lang/Comparable;",
            ">;"
        }
    .end annotation
.end field


# instance fields
.field final transient elements:Lcom/google/common/collect/ImmutableList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ImmutableList<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method static constructor <clinit>()V
    .registers 3

    .line 43
    new-instance v0, Lcom/google/common/collect/RegularImmutableSortedSet;

    .line 44
    invoke-static {}, Lcom/google/common/collect/ImmutableList;->of()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-static {}, Lcom/google/common/collect/Ordering;->natural()Lcom/google/common/collect/Ordering;

    move-result-object v2

    invoke-direct {v0, v1, v2}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    sput-object v0, Lcom/google/common/collect/RegularImmutableSortedSet;->NATURAL_EMPTY_SET:Lcom/google/common/collect/RegularImmutableSortedSet;

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "elements",
            "comparator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/ImmutableList<",
            "TE;>;",
            "Ljava/util/Comparator<",
            "-TE;>;)V"
        }
    .end annotation

    .line 49
    invoke-direct {p0, p2}, Lcom/google/common/collect/ImmutableSortedSet;-><init>(Ljava/util/Comparator;)V

    .line 50
    iput-object p1, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    return-void
.end method

.method private unsafeBinarySearch(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 146
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->unsafeComparator()Ljava/util/Comparator;

    move-result-object p0

    invoke-static {v0, p1, p0}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result p0

    return p0
.end method


# virtual methods
.method public asList()Lcom/google/common/collect/ImmutableList;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableList<",
            "TE;>;"
        }
    .end annotation

    .line 305
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    return-object p0
.end method

.method public ceiling(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 226
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/RegularImmutableSortedSet;->tailIndex(Ljava/lang/Object;Z)I

    move-result p1

    .line 227
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    const/4 v0, 0x0

    if-eqz p1, :cond_0

    .line 87
    :try_start_0
    invoke-direct {p0, p1}, Lcom/google/common/collect/RegularImmutableSortedSet;->unsafeBinarySearch(Ljava/lang/Object;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :catch_0
    :cond_0
    return v0
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "targets"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 99
    instance-of v0, p1, Lcom/google/common/collect/Multiset;

    if-eqz v0, :cond_0

    .line 100
    check-cast p1, Lcom/google/common/collect/Multiset;

    invoke-interface {p1}, Lcom/google/common/collect/Multiset;->elementSet()Ljava/util/Set;

    move-result-object p1

    .line 102
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator()Ljava/util/Comparator;

    move-result-object v0

    invoke-static {v0, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v0

    if-eqz v0, :cond_7

    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    const/4 v1, 0x1

    if-le v0, v1, :cond_7

    .line 110
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    .line 112
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 115
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v3, 0x0

    if-nez v2, :cond_1

    return v3

    .line 119
    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 120
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    .line 123
    :cond_2
    :goto_0
    :try_start_0
    invoke-virtual {p0, v4, v2}, Lcom/google/common/collect/RegularImmutableSortedSet;->unsafeCompare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v5

    if-gez v5, :cond_4

    .line 126
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-nez v4, :cond_3

    return v3

    .line 129
    :cond_3
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    goto :goto_0

    :cond_4
    if-nez v5, :cond_6

    .line 131
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-nez v2, :cond_5

    return v1

    .line 134
    :cond_5
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2
    :try_end_0
    .catch Ljava/lang/NullPointerException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :cond_6
    if-lez v5, :cond_2

    :catch_0
    return v3

    .line 103
    :cond_7
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableSortedSet;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method copyIntoArray([Ljava/lang/Object;I)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "dst",
            "offset"
        }
    .end annotation

    .line 156
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableList;->copyIntoArray([Ljava/lang/Object;I)I

    move-result p0

    return p0
.end method

.method createDescendingSet()Lcom/google/common/collect/ImmutableSortedSet;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 310
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator:Ljava/util/Comparator;

    invoke-static {v0}, Ljava/util/Collections;->reverseOrder(Ljava/util/Comparator;)Ljava/util/Comparator;

    move-result-object v0

    .line 311
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_0

    .line 312
    invoke-static {v0}, Lcom/google/common/collect/RegularImmutableSortedSet;->emptySet(Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableSortedSet;

    move-result-object p0

    return-object p0

    .line 313
    :cond_0
    new-instance v1, Lcom/google/common/collect/RegularImmutableSortedSet;

    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->reverse()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    return-object v1
.end method

.method public descendingIterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TE;>;"
        }
    .end annotation

    .line 76
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->reverse()Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic descendingIterator()Ljava/util/Iterator;
    .registers 1

    .line 40
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->descendingIterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 164
    :cond_0
    instance-of v1, p1, Ljava/util/Set;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 168
    :cond_1
    check-cast p1, Ljava/util/Set;

    .line 169
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result v1

    invoke-interface {p1}, Ljava/util/Set;->size()I

    move-result v3

    if-eq v1, v3, :cond_2

    return v2

    .line 171
    :cond_2
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_3

    return v0

    .line 175
    :cond_3
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator:Ljava/util/Comparator;

    invoke-static {v1, p1}, Lcom/google/common/collect/SortedIterables;->hasSameComparator(Ljava/util/Comparator;Ljava/lang/Iterable;)Z

    move-result v1

    if-eqz v1, :cond_7

    .line 176
    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    .line 178
    :try_start_0
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v1

    .line 179
    :cond_4
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_6

    .line 180
    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    .line 181
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    if-eqz v4, :cond_5

    .line 182
    invoke-virtual {p0, v3, v4}, Lcom/google/common/collect/RegularImmutableSortedSet;->unsafeCompare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v3
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0
    .catch Ljava/util/NoSuchElementException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_4

    :cond_5
    return v2

    :cond_6
    return v0

    :catch_0
    return v2

    .line 193
    :cond_7
    invoke-virtual {p0, p1}, Lcom/google/common/collect/RegularImmutableSortedSet;->containsAll(Ljava/util/Collection;)Z

    move-result p0

    return p0
.end method

.method public first()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 198
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 201
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 199
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public floor(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    const/4 v0, 0x1

    .line 220
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/RegularImmutableSortedSet;->headIndex(Ljava/lang/Object;Z)I

    move-result p1

    sub-int/2addr p1, v0

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 221
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method getSubSet(II)Lcom/google/common/collect/RegularImmutableSortedSet;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "newFromIndex",
            "newToIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/collect/RegularImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    if-nez p1, :cond_0

    .line 279
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result v0

    if-ne p2, v0, :cond_0

    return-object p0

    :cond_0
    if-ge p1, p2, :cond_1

    .line 282
    new-instance v0, Lcom/google/common/collect/RegularImmutableSortedSet;

    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    .line 283
    invoke-virtual {v1, p1, p2}, Lcom/google/common/collect/ImmutableList;->subList(II)Lcom/google/common/collect/ImmutableList;

    move-result-object p1

    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator:Ljava/util/Comparator;

    invoke-direct {v0, p1, p0}, Lcom/google/common/collect/RegularImmutableSortedSet;-><init>(Lcom/google/common/collect/ImmutableList;Ljava/util/Comparator;)V

    return-object v0

    .line 285
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator:Ljava/util/Comparator;

    invoke-static {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->emptySet(Ljava/util/Comparator;)Lcom/google/common/collect/RegularImmutableSortedSet;

    move-result-object p0

    return-object p0
.end method

.method headIndex(Ljava/lang/Object;Z)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "toElement",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)I"
        }
    .end annotation

    .line 242
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator()Ljava/util/Comparator;

    move-result-object p0

    invoke-static {v0, p1, p0}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result p0

    if-ltz p0, :cond_1

    if-eqz p2, :cond_0

    add-int/lit8 p0, p0, 0x1

    :cond_0
    return p0

    :cond_1
    not-int p0, p0

    return p0
.end method

.method headSetImpl(Ljava/lang/Object;Z)Lcom/google/common/collect/ImmutableSortedSet;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "toElement",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 238
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableSortedSet;->headIndex(Ljava/lang/Object;Z)I

    move-result p1

    invoke-virtual {p0, v0, p1}, Lcom/google/common/collect/RegularImmutableSortedSet;->getSubSet(II)Lcom/google/common/collect/RegularImmutableSortedSet;

    move-result-object p0

    return-object p0
.end method

.method public higher(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 232
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/RegularImmutableSortedSet;->tailIndex(Ljava/lang/Object;Z)I

    move-result p1

    .line 233
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result v0

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method indexOf(Ljava/lang/Object;)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "target"
        }
    .end annotation

    const/4 v0, -0x1

    if-nez p1, :cond_0

    return v0

    .line 296
    :cond_0
    :try_start_0
    iget-object v1, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->unsafeComparator()Ljava/util/Comparator;

    move-result-object p0

    invoke-static {v1, p1, p0}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result p0
    :try_end_0
    .catch Ljava/lang/ClassCastException; {:try_start_0 .. :try_end_0} :catch_0

    if-ltz p0, :cond_1

    return p0

    :catch_0
    :cond_1
    return v0
.end method

.method internalArray()[Ljava/lang/Object;
    .registers 1

    .line 55
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method internalArrayEnd()I
    .registers 1

    .line 65
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArrayEnd()I

    move-result p0

    return p0
.end method

.method internalArrayStart()I
    .registers 1

    .line 60
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArrayStart()I

    move-result p0

    return p0
.end method

.method isPartialView()Z
    .registers 1

    .line 151
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->isPartialView()Z

    move-result p0

    return p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TE;>;"
        }
    .end annotation

    .line 70
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 40
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public last()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 206
    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_0

    .line 209
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result p0

    add-int/lit8 p0, p0, -0x1

    invoke-virtual {v0, p0}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 207
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public lower(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)TE;"
        }
    .end annotation

    const/4 v0, 0x0

    .line 214
    invoke-virtual {p0, p1, v0}, Lcom/google/common/collect/RegularImmutableSortedSet;->headIndex(Ljava/lang/Object;Z)I

    move-result p1

    add-int/lit8 p1, p1, -0x1

    const/4 v0, -0x1

    if-ne p1, v0, :cond_0

    const/4 p0, 0x0

    return-object p0

    .line 215
    :cond_0
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 81
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->size()I

    move-result p0

    return p0
.end method

.method subSetImpl(Ljava/lang/Object;ZLjava/lang/Object;Z)Lcom/google/common/collect/ImmutableSortedSet;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0,
            0x0
        }
        names = {
            "fromElement",
            "fromInclusive",
            "toElement",
            "toInclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;ZTE;Z)",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 253
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableSortedSet;->tailSetImpl(Ljava/lang/Object;Z)Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object p0

    invoke-virtual {p0, p3, p4}, Lcom/google/common/collect/ImmutableSortedSet;->headSetImpl(Ljava/lang/Object;Z)Lcom/google/common/collect/ImmutableSortedSet;

    move-result-object p0

    return-object p0
.end method

.method tailIndex(Ljava/lang/Object;Z)I
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromElement",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)I"
        }
    .end annotation

    .line 262
    iget-object v0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->elements:Lcom/google/common/collect/ImmutableList;

    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator()Ljava/util/Comparator;

    move-result-object p0

    invoke-static {v0, p1, p0}, Ljava/util/Collections;->binarySearch(Ljava/util/List;Ljava/lang/Object;Ljava/util/Comparator;)I

    move-result p0

    if-ltz p0, :cond_1

    if-eqz p2, :cond_0

    return p0

    :cond_0
    add-int/lit8 p0, p0, 0x1

    return p0

    :cond_1
    not-int p0, p0

    return p0
.end method

.method tailSetImpl(Ljava/lang/Object;Z)Lcom/google/common/collect/ImmutableSortedSet;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromElement",
            "inclusive"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;Z)",
            "Lcom/google/common/collect/ImmutableSortedSet<",
            "TE;>;"
        }
    .end annotation

    .line 258
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableSortedSet;->tailIndex(Ljava/lang/Object;Z)I

    move-result p1

    invoke-virtual {p0}, Lcom/google/common/collect/RegularImmutableSortedSet;->size()I

    move-result p2

    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/RegularImmutableSortedSet;->getSubSet(II)Lcom/google/common/collect/RegularImmutableSortedSet;

    move-result-object p0

    return-object p0
.end method

.method unsafeComparator()Ljava/util/Comparator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Comparator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 275
    iget-object p0, p0, Lcom/google/common/collect/RegularImmutableSortedSet;->comparator:Ljava/util/Comparator;

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 322
    invoke-super {p0}, Lcom/google/common/collect/ImmutableSortedSet;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
