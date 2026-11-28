.class final Lnicoid/network238/kotlin/collections/ArrayAsCollection;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/Collection;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# instance fields
.field private final isVarargs:Z

.field private final values:[Ljava/lang/Object;


# direct methods
.method public constructor <init>([Ljava/lang/Object;Z)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 58
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->values:[Ljava/lang/Object;

    iput-boolean p2, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->isVarargs:Z

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)Z
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public clear()V
    .registers 3

    new-instance v0, Ljava/lang/UnsupportedOperationException;

    const-string v1, "Operation is not supported for read-only collection"

    invoke-direct {v0, v1}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public contains(Ljava/lang/Object;)Z
    .registers 3

    .line 61
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->values:[Ljava/lang/Object;

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/collections/ArraysKt___ArraysKt;->contains([Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    return p1
.end method

.method public containsAll(Ljava/util/Collection;)Z
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 527
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    goto :goto_0

    .line 528
    :cond_0
    invoke-interface {p1}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_1
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_2

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    .line 62
    invoke-virtual {p0, v0}, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    :cond_2
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public getSize()I
    .registers 2

    .line 59
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->values:[Ljava/lang/Object;

    array-length v0, v0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .line 60
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->values:[Ljava/lang/Object;

    array-length v0, v0

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 63
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->values:[Ljava/lang/Object;

    invoke-static {v0}, Lnicoid/network238/kotlin/jvm/internal/ArrayIteratorKt;->iterator([Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object v0

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public final bridge size()I
    .registers 2

    .line 58
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->getSize()I

    move-result v0

    return v0
.end method

.method public final toArray()[Ljava/lang/Object;
    .registers 3

    .line 65
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->values:[Ljava/lang/Object;

    iget-boolean v1, p0, Lnicoid/network238/kotlin/collections/ArrayAsCollection;->isVarargs:Z

    invoke-static {v0, v1}, Lnicoid/network238/kotlin/collections/CollectionsKt__CollectionsJVMKt;->copyToArrayOfAny([Ljava/lang/Object;Z)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 2

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0, p1}, Lnicoid/network238/kotlin/jvm/internal/CollectionToArray;->toArray(Ljava/util/Collection;[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method
