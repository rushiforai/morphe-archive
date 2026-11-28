.class public abstract Lnicoid/network238/kotlin/collections/AbstractList;
.super Lnicoid/network238/kotlin/collections/AbstractCollection;
.source "SourceFile"

# interfaces
.implements Ljava/util/List;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/collections/AbstractList$Companion;,
        Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;,
        Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;,
        Lnicoid/network238/kotlin/collections/AbstractList$SubList;
    }
.end annotation


# static fields
.field public static final Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

.field private static final maxArraySize:I = 0x7ffffff7


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;-><init>(Lnicoid/network238/kotlin/jvm/internal/DefaultConstructorMarker;)V

    sput-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    return-void
.end method

.method protected constructor <init>()V
    .registers 1

    .line 21
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractCollection;-><init>()V

    return-void
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            ")V"
        }
    .end annotation

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Operation is not supported for read-only collection"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/util/Collection<",
            "Ljava/lang/Object;",
            ">;)Z"
        }
    .end annotation

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Operation is not supported for read-only collection"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    if-ne p1, p0, :cond_0

    const/4 p1, 0x1

    return p1

    .line 66
    :cond_0
    instance-of v0, p1, Ljava/util/List;

    if-nez v0, :cond_1

    const/4 p1, 0x0

    return p1

    .line 68
    :cond_1
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    check-cast p1, Ljava/util/Collection;

    invoke-virtual {v0, p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->orderedEquals$kotlin_stdlib(Ljava/util/Collection;Ljava/util/Collection;)Z

    move-result p1

    return p1
.end method

.method public abstract get(I)Ljava/lang/Object;
.end method

.method public hashCode()I
    .registers 2

    .line 74
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {v0, p0}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->orderedHashCode$kotlin_stdlib(Ljava/util/Collection;)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 5

    .line 177
    invoke-interface {p0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 27
    invoke-static {v2, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_0

    return v1

    :cond_0
    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 25
    new-instance v0, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;

    invoke-direct {v0, p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;-><init>(Lnicoid/network238/kotlin/collections/AbstractList;)V

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 4

    .line 183
    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p0, v0}, Ljava/util/List;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    .line 184
    :cond_0
    invoke-interface {v0}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v1

    if-eqz v1, :cond_1

    .line 185
    invoke-interface {v0}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v1

    .line 29
    invoke-static {v1, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    .line 186
    invoke-interface {v0}, Ljava/util/ListIterator;->nextIndex()I

    move-result p1

    return p1

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/ListIterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 31
    new-instance v0, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;-><init>(Lnicoid/network238/kotlin/collections/AbstractList;I)V

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/ListIterator<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 33
    new-instance v0, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;-><init>(Lnicoid/network238/kotlin/collections/AbstractList;I)V

    return-object v0
.end method

.method public remove(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/lang/Object;"
        }
    .end annotation

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I",
            "Ljava/lang/Object;",
            ")",
            "Ljava/lang/Object;"
        }
    .end annotation

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string p2, "Operation is not supported for read-only collection"

    invoke-direct {p1, p2}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public subList(II)Ljava/util/List;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Ljava/util/List<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 35
    new-instance v0, Lnicoid/network238/kotlin/collections/AbstractList$SubList;

    invoke-direct {v0, p0, p1, p2}, Lnicoid/network238/kotlin/collections/AbstractList$SubList;-><init>(Lnicoid/network238/kotlin/collections/AbstractList;II)V

    return-object v0
.end method
