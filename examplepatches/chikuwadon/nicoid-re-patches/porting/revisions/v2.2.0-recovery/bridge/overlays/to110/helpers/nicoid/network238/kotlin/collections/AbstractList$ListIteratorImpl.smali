.class Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;
.super Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;
.source "SourceFile"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/collections/AbstractList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x2
    name = "ListIteratorImpl"
.end annotation


# instance fields
.field final synthetic this$0:Lnicoid/network238/kotlin/collections/AbstractList;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/collections/AbstractList;I)V
    .registers 4

    .line 91
    iput-object p1, p0, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;->this$0:Lnicoid/network238/kotlin/collections/AbstractList;

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;-><init>(Lnicoid/network238/kotlin/collections/AbstractList;)V

    .line 94
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    invoke-virtual {p1}, Lnicoid/network238/kotlin/collections/AbstractCollection;->size()I

    move-result p1

    invoke-virtual {v0, p2, p1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 95
    invoke-virtual {p0, p2}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->setIndex(I)V

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method

.method public hasPrevious()Z
    .registers 2

    .line 98
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->getIndex()I

    move-result v0

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public nextIndex()I
    .registers 2

    .line 100
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->getIndex()I

    move-result v0

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .registers 3

    .line 103
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;->hasPrevious()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 104
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/AbstractList$ListIteratorImpl;->this$0:Lnicoid/network238/kotlin/collections/AbstractList;

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->getIndex()I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {p0, v1}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->setIndex(I)V

    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->getIndex()I

    move-result v1

    invoke-virtual {v0, v1}, Lnicoid/network238/kotlin/collections/AbstractList;->get(I)Ljava/lang/Object;

    move-result-object v0

    return-object v0

    .line 103
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .registers 2

    .line 107
    invoke-virtual {p0}, Lnicoid/network238/kotlin/collections/AbstractList$IteratorImpl;->getIndex()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 3

    new-instance p1, Ljava/lang/UnsupportedOperationException;

    const-string v0, "Operation is not supported for read-only collection"

    invoke-direct {p1, v0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
