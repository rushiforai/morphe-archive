.class final Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Itr"
.end annotation


# instance fields
.field private expectedModCount:I

.field private index:I

.field private lastIndex:I

.field private final list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;I)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 558
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 559
    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    .line 560
    iput p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    .line 562
    const/4 p2, -0x1

    iput p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 563
    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getModCount$p$s1462993667(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    return-void
.end method

.method private final checkForComodification()V
    .registers 3

    .line 608
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getRoot$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    move-result-object v0

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result v0

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    if-ne v0, v1, :cond_0

    return-void

    .line 609
    :cond_0
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 5

    .line 592
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 593
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->add(ILjava/lang/Object;)V

    .line 594
    const/4 p1, -0x1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 595
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getModCount$p$s1462993667(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    return-void
.end method

.method public hasNext()Z
    .registers 3

    .line 566
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getLength$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    if-ge v0, v1, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public hasPrevious()Z
    .registers 2

    .line 565
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 4

    .line 579
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 580
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getLength$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 581
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 582
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)[Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getOffset$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    add-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0

    .line 580
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public nextIndex()I
    .registers 2

    .line 569
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .registers 4

    .line 572
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 573
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 574
    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 575
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)[Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getOffset$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    add-int/2addr v1, v2

    aget-object v0, v0, v1

    return-object v0

    .line 573
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .registers 2

    .line 568
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public remove()V
    .registers 4

    .line 599
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 600
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 601
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    invoke-virtual {v2, v0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->remove(I)Ljava/lang/Object;

    .line 602
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    .line 603
    iput v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 604
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->access$getModCount$p$s1462993667(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v0

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    return-void

    .line 600
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call next() or previous() before removing element from the iterator."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 4

    .line 586
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 587
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 588
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    invoke-virtual {v1, v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 587
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Call next() or previous() before replacing element from the iterator."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
