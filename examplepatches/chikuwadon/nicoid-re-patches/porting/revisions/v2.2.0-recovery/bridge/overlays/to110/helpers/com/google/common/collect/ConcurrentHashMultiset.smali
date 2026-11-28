.class public final Lcom/google/common/collect/ConcurrentHashMultiset;
.super Lcom/google/common/collect/AbstractMultiset;
.source "ConcurrentHashMultiset.java"

# interfaces
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractMultiset<",
        "TE;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x1L


# instance fields
.field private final transient countMap:Ljava/util/concurrent/ConcurrentMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentMap<",
            "TE;",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;"
        }
    .end annotation
.end field

.field private transient deserializationReplacement:Lcom/google/common/collect/ConcurrentHashMultiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/ConcurrentHashMultiset<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Ljava/util/concurrent/ConcurrentMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "countMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/concurrent/ConcurrentMap<",
            "TE;",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;)V"
        }
    .end annotation

    .line 142
    invoke-direct {p0}, Lcom/google/common/collect/AbstractMultiset;-><init>()V

    .line 143
    iput-object p1, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    return-void
.end method

.method static synthetic access$100(Lcom/google/common/collect/ConcurrentHashMultiset;)Ljava/util/concurrent/ConcurrentMap;
    .registers 1

    .line 62
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    return-object p0
.end method

.method public static create()Lcom/google/common/collect/ConcurrentHashMultiset;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">()",
            "Lcom/google/common/collect/ConcurrentHashMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 106
    new-instance v0, Ljava/util/concurrent/ConcurrentHashMap;

    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentHashMap;-><init>()V

    invoke-static {v0}, Lcom/google/common/collect/ConcurrentHashMultiset;->create(Ljava/util/concurrent/ConcurrentMap;)Lcom/google/common/collect/ConcurrentHashMultiset;

    move-result-object v0

    return-object v0
.end method

.method public static create(Ljava/lang/Iterable;)Lcom/google/common/collect/ConcurrentHashMultiset;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "elements"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/lang/Iterable<",
            "+TE;>;)",
            "Lcom/google/common/collect/ConcurrentHashMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 118
    invoke-static {}, Lcom/google/common/collect/ConcurrentHashMultiset;->create()Lcom/google/common/collect/ConcurrentHashMultiset;

    move-result-object v0

    .line 119
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterables;->addAll(Ljava/util/Collection;Ljava/lang/Iterable;)Z

    return-object v0
.end method

.method public static create(Ljava/util/concurrent/ConcurrentMap;)Lcom/google/common/collect/ConcurrentHashMultiset;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "countMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/ConcurrentMap<",
            "TE;",
            "Ljava/util/concurrent/atomic/AtomicInteger;",
            ">;)",
            "Lcom/google/common/collect/ConcurrentHashMultiset<",
            "TE;>;"
        }
    .end annotation

    .line 138
    invoke-interface {p0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result v0

    const-string v1, "the backing map (%s) must be empty"

    invoke-static {v0, v1, p0}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 139
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ConcurrentHashMultiset;-><init>(Ljava/util/concurrent/ConcurrentMap;)V

    return-object v0
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
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
            Ljava/io/IOException;,
            Ljava/lang/ClassNotFoundException;
        }
    .end annotation

    .line 627
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 630
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->readObject()Ljava/lang/Object;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Ljava/util/concurrent/ConcurrentMap;

    .line 631
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset;

    invoke-direct {v0, p1}, Lcom/google/common/collect/ConcurrentHashMultiset;-><init>(Ljava/util/concurrent/ConcurrentMap;)V

    iput-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->deserializationReplacement:Lcom/google/common/collect/ConcurrentHashMultiset;

    return-void
.end method

.method private readResolve()Ljava/lang/Object;
    .registers 1

    .line 635
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->deserializationReplacement:Lcom/google/common/collect/ConcurrentHashMultiset;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method private snapshotElementsToList()Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TE;>;"
        }
    .end annotation

    .line 206
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->size()I

    move-result v0

    invoke-static {v0}, Lcom/google/common/collect/Lists;->newArrayListWithExpectedSize(I)Ljava/util/ArrayList;

    move-result-object v0

    .line 207
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/google/common/collect/Multiset$Entry;

    .line 208
    invoke-interface {v1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v2

    .line 209
    invoke-interface {v1}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v1

    :goto_0
    if-lez v1, :cond_0

    .line 210
    invoke-interface {v0, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    add-int/lit8 v1, v1, -0x1

    goto :goto_0

    :cond_1
    return-object v0
.end method

.method private writeObject(Ljava/io/ObjectOutputStream;)V
    .registers 2
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

    .line 622
    invoke-virtual {p1}, Ljava/io/ObjectOutputStream;->defaultWriteObject()V

    .line 623
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-virtual {p1, p0}, Ljava/io/ObjectOutputStream;->writeObject(Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;I)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .line 230
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-nez p2, :cond_0

    .line 232
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ConcurrentHashMultiset;->count(Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 234
    :cond_0
    const-string v0, "occurrences"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkPositive(ILjava/lang/String;)V

    .line 237
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v0, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    .line 239
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {v0, p1, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    if-nez v0, :cond_2

    return v1

    .line 247
    :cond_2
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-eqz v2, :cond_3

    .line 250
    :try_start_0
    invoke-static {v2, p2}, Ljava/lang/Math;->addExact(II)I

    move-result v3

    .line 251
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3
    :try_end_0
    .catch Ljava/lang/ArithmeticException; {:try_start_0 .. :try_end_0} :catch_0

    if-eqz v3, :cond_2

    return v2

    .line 256
    :catch_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v0, "Overflow adding "

    invoke-direct {p1, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string p2, " occurrences to a count of "

    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 263
    :cond_3
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 264
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, p1, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    .line 265
    invoke-interface {v3, p1, v0, v2}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_1

    :cond_4
    return v1
.end method

.method public clear()V
    .registers 1

    .line 585
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0}, Ljava/util/concurrent/ConcurrentMap;->clear()V

    return-void
.end method

.method public bridge synthetic contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "element"
        }
    .end annotation

    .line 60
    invoke-super {p0, p1}, Lcom/google/common/collect/AbstractMultiset;->contains(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public count(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .line 156
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {p0, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/atomic/AtomicInteger;

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 157
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result p0

    return p0
.end method

.method public createEntrySet()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .annotation runtime Ljava/lang/Deprecated;
    .end annotation

    .line 514
    invoke-virtual {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->entrySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method elementIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 506
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "should never be called"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public elementSet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 475
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v0}, Ljava/util/concurrent/ConcurrentMap;->keySet()Ljava/util/Set;

    move-result-object v0

    .line 476
    new-instance v1, Lcom/google/common/collect/ConcurrentHashMultiset$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/ConcurrentHashMultiset$1;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;Ljava/util/Set;)V

    return-object v1
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 519
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lcom/google/common/collect/ConcurrentHashMultiset$EntrySet;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;Lcom/google/common/collect/ConcurrentHashMultiset$1;)V

    return-object v0
.end method

.method internalDistinctElements()I
    .registers 1

    .line 524
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0}, Ljava/util/concurrent/ConcurrentMap;->size()I

    move-result p0

    return p0
.end method

.method internalEntryIterator()Ljava/util/Iterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 536
    new-instance v0, Lcom/google/common/collect/ConcurrentHashMultiset$2;

    invoke-direct {v0, p0}, Lcom/google/common/collect/ConcurrentHashMultiset$2;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;)V

    .line 555
    new-instance v1, Lcom/google/common/collect/ConcurrentHashMultiset$3;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/ConcurrentHashMultiset$3;-><init>(Lcom/google/common/collect/ConcurrentHashMultiset;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public isEmpty()Z
    .registers 1

    .line 529
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0}, Ljava/util/concurrent/ConcurrentMap;->isEmpty()Z

    move-result p0

    return p0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 580
    invoke-static {p0}, Lcom/google/common/collect/Multisets;->iteratorImpl(Lcom/google/common/collect/Multiset;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;I)I
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    if-nez p2, :cond_0

    .line 298
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ConcurrentHashMultiset;->count(Ljava/lang/Object;)I

    move-result p0

    return p0

    .line 300
    :cond_0
    const-string v0, "occurrences"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkPositive(ILjava/lang/String;)V

    .line 302
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v0, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    if-nez v0, :cond_1

    return v1

    .line 307
    :cond_1
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-eqz v2, :cond_3

    sub-int v3, v2, p2

    .line 309
    invoke-static {v1, v3}, Ljava/lang/Math;->max(II)I

    move-result v3

    .line 310
    invoke-virtual {v0, v2, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v4

    if-eqz v4, :cond_1

    if-nez v3, :cond_2

    .line 314
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_2
    return v2

    :cond_3
    return v1
.end method

.method public removeExactly(Ljava/lang/Object;I)Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "occurrences"
        }
    .end annotation

    const/4 v0, 0x1

    if-nez p2, :cond_0

    return v0

    .line 341
    :cond_0
    const-string v1, "occurrences"

    invoke-static {p2, v1}, Lcom/google/common/collect/CollectPreconditions;->checkPositive(ILjava/lang/String;)V

    .line 343
    iget-object v1, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v1, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 348
    :cond_1
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-ge v3, p2, :cond_2

    return v2

    :cond_2
    sub-int v4, v3, p2

    .line 353
    invoke-virtual {v1, v3, v4}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_1

    if-nez v4, :cond_3

    .line 357
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0, p1, v1}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_3
    return v0
.end method

.method public setCount(Ljava/lang/Object;I)I
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "element",
            "count"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;I)I"
        }
    .end annotation

    .line 374
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 375
    const-string v0, "count"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 377
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v0, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    if-nez v0, :cond_2

    if-nez p2, :cond_1

    return v1

    .line 382
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {v0, p1, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    if-nez v0, :cond_2

    return v1

    .line 391
    :cond_2
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    if-nez v2, :cond_5

    if-nez p2, :cond_3

    return v1

    .line 396
    :cond_3
    new-instance v2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 397
    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {v3, p1, v2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    if-eqz v3, :cond_4

    iget-object v3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    .line 398
    invoke-interface {v3, p1, v0, v2}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    :cond_4
    return v1

    .line 404
    :cond_5
    invoke-virtual {v0, v2, p2}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result v3

    if-eqz v3, :cond_2

    if-nez p2, :cond_6

    .line 408
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_6
    return v2
.end method

.method public setCount(Ljava/lang/Object;II)Z
    .registers 8
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "element",
            "expectedOldCount",
            "newCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;II)Z"
        }
    .end annotation

    .line 430
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 431
    const-string v0, "oldCount"

    invoke-static {p2, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 432
    const-string v0, "newCount"

    invoke-static {p3, v0}, Lcom/google/common/collect/CollectPreconditions;->checkNonnegative(ILjava/lang/String;)I

    .line 434
    iget-object v0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-static {v0, p1}, Lcom/google/common/collect/Maps;->safeGet(Ljava/util/Map;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/concurrent/atomic/AtomicInteger;

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-nez v0, :cond_3

    if-eqz p2, :cond_0

    return v1

    :cond_0
    if-nez p3, :cond_1

    return v2

    .line 442
    :cond_1
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    invoke-interface {p0, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    if-nez p0, :cond_2

    return v2

    :cond_2
    return v1

    .line 445
    :cond_3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v3

    if-ne v3, p2, :cond_8

    if-nez v3, :cond_6

    if-nez p3, :cond_4

    .line 450
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    return v2

    .line 453
    :cond_4
    new-instance p2, Ljava/util/concurrent/atomic/AtomicInteger;

    invoke-direct {p2, p3}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>(I)V

    .line 454
    iget-object p3, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p3, p1, p2}, Ljava/util/concurrent/ConcurrentMap;->putIfAbsent(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p3

    if-eqz p3, :cond_5

    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    .line 455
    invoke-interface {p0, p1, v0, p2}, Ljava/util/concurrent/ConcurrentMap;->replace(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_5

    return v1

    :cond_5
    return v2

    .line 458
    :cond_6
    invoke-virtual {v0, v3, p3}, Ljava/util/concurrent/atomic/AtomicInteger;->compareAndSet(II)Z

    move-result p2

    if-eqz p2, :cond_8

    if-nez p3, :cond_7

    .line 462
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0, p1, v0}, Ljava/util/concurrent/ConcurrentMap;->remove(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_7
    return v2

    :cond_8
    return v1
.end method

.method public size()I
    .registers 5

    .line 169
    iget-object p0, p0, Lcom/google/common/collect/ConcurrentHashMultiset;->countMap:Ljava/util/concurrent/ConcurrentMap;

    invoke-interface {p0}, Ljava/util/concurrent/ConcurrentMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    const-wide/16 v0, 0x0

    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 170
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicInteger;->get()I

    move-result v2

    int-to-long v2, v2

    add-long/2addr v0, v2

    goto :goto_0

    .line 172
    :cond_0
    invoke-static {v0, v1}, Lcom/google/common/primitives/Ints;->saturatedCast(J)I

    move-result p0

    return p0
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 1

    .line 192
    invoke-direct {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->snapshotElementsToList()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/List;->toArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "array"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">([TT;)[TT;"
        }
    .end annotation

    .line 198
    invoke-direct {p0}, Lcom/google/common/collect/ConcurrentHashMultiset;->snapshotElementsToList()Ljava/util/List;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
