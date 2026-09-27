.class final Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;
.super Ljava/lang/Object;
.source "ListBuilder.kt"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lkotlin/jvm/internal/markers/KMutableListIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lkotlin/collections/builders/ListBuilder$BuilderSubList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Itr"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator<",
        "TE;>;",
        "Lkotlin/jvm/internal/markers/KMutableListIterator;"
    }
.end annotation

.annotation system Ldalvik/annotation/SourceDebugExtension;
    value = "SMAP\nListBuilder.kt\nKotlin\n*S Kotlin\n*F\n+ 1 ListBuilder.kt\nkotlin/collections/builders/ListBuilder$BuilderSubList$Itr\n+ 2 fake.kt\nkotlin/jvm/internal/FakeKt\n*L\n1#1,724:1\n1#2:725\n*E\n"
.end annotation

.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000*\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010+\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0008\n\u0002\u0008\u0005\n\u0002\u0010\u000b\n\u0002\u0008\u0007\n\u0002\u0010\u0002\n\u0002\u0008\u0006\u0008\u0002\u0018\u0000*\u0004\u0008\u0002\u0010\u00012\u0008\u0012\u0004\u0012\u0002H\u00010\u0002B\u001f\u0008F\u0012\u000c\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00020\u0004\u0012\u0006\u0010\u0005\u001a\u00020\u0006\u00a2\u0006\u0004\u0008\u0007\u0010\u0008J\n\u0010\u000b\u001a\u00020\u000cH\u0096\u0080\u0004J\n\u0010\r\u001a\u00020\u000cH\u0096\u0082\u0004J\n\u0010\u000e\u001a\u00020\u0006H\u0096\u0080\u0004J\n\u0010\u000f\u001a\u00020\u0006H\u0096\u0080\u0004J\u000f\u0010\u0010\u001a\u00028\u0002H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u0011J\u000f\u0010\u0012\u001a\u00028\u0002H\u0096\u0082\u0004\u00a2\u0006\u0002\u0010\u0011J\u0017\u0010\u0013\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00028\u0002H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u0016J\u0017\u0010\u0017\u001a\u00020\u00142\u0006\u0010\u0015\u001a\u00028\u0002H\u0096\u0080\u0004\u00a2\u0006\u0002\u0010\u0016J\n\u0010\u0018\u001a\u00020\u0014H\u0096\u0080\u0004J\n\u0010\u0019\u001a\u00020\u0014H\u0082\u0080\u0004R\u0015\u0010\u0003\u001a\u0008\u0012\u0004\u0012\u00028\u00020\u0004X\u0082\u0084\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\u0005\u001a\u00020\u0006X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\t\u001a\u00020\u0006X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000R\u000f\u0010\n\u001a\u00020\u0006X\u0082\u008e\u0008\u00a2\u0006\u0002\n\u0000\u00a8\u0006\u001a"
    }
    d2 = {
        "Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;",
        "E",
        "",
        "list",
        "Lkotlin/collections/builders/ListBuilder$BuilderSubList;",
        "index",
        "",
        "<init>",
        "(Lkotlin/collections/builders/ListBuilder$BuilderSubList;I)V",
        "lastIndex",
        "expectedModCount",
        "hasPrevious",
        "",
        "hasNext",
        "previousIndex",
        "nextIndex",
        "previous",
        "()Ljava/lang/Object;",
        "next",
        "set",
        "",
        "element",
        "(Ljava/lang/Object;)V",
        "add",
        "remove",
        "checkForComodification",
        "kotlin-stdlib"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# instance fields
.field private expectedModCount:I

.field private index:I

.field private lastIndex:I

.field private final list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lkotlin/collections/builders/ListBuilder$BuilderSubList<",
            "TE;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Lkotlin/collections/builders/ListBuilder$BuilderSubList;I)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lkotlin/collections/builders/ListBuilder$BuilderSubList<",
            "TE;>;I)V"
        }
    .end annotation

    const-string v0, "list"

    invoke-static {p1, v0}, Lkotlin/jvm/internal/Intrinsics;->checkNotNullParameter(Ljava/lang/Object;Ljava/lang/String;)V

    .line 564
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 565
    iput-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    .line 566
    iput p2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    const/4 p2, -0x1

    .line 568
    iput p2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 569
    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I
    invoke-static {p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getModCount$p$s1462993667(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result p1

    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    return-void
.end method

.method private final checkForComodification()V
    .registers 2

    .line 614
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lkotlin/collections/builders/ListBuilder;
    invoke-static {v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getRoot$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)Lkotlin/collections/builders/ListBuilder;

    move-result-object v0

    # getter for: Lkotlin/collections/builders/ListBuilder;->modCount:I
    invoke-static {v0}, Lkotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lkotlin/collections/builders/ListBuilder;)I

    move-result v0

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    if-ne v0, p0, :cond_f

    return-void

    .line 615
    :cond_f
    new-instance p0, Ljava/util/ConcurrentModificationException;

    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw p0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 598
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 599
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    iget v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    invoke-virtual {v0, v1, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->add(ILjava/lang/Object;)V

    const/4 p1, -0x1

    .line 600
    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 601
    iget-object p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I
    invoke-static {p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getModCount$p$s1462993667(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result p1

    iput p1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    return-void
.end method

.method public hasNext()Z
    .registers 2

    .line 572
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iget-object p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I
    invoke-static {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getLength$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result p0

    if-ge v0, p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public hasPrevious()Z
    .registers 1

    .line 571
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    if-lez p0, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 585
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 586
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iget-object v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->length:I
    invoke-static {v1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getLength$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    if-ge v0, v1, :cond_27

    .line 587
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 588
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;
    invoke-static {v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getBacking$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)[Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I
    invoke-static {v1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getOffset$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    add-int/2addr v1, p0

    aget-object p0, v0, v1

    return-object p0

    .line 586
    :cond_27
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public nextIndex()I
    .registers 1

    .line 575
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    return p0
.end method

.method public previous()Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 578
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 579
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    if-lez v0, :cond_1f

    add-int/lit8 v0, v0, -0x1

    .line 580
    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 581
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;
    invoke-static {v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getBacking$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)[Ljava/lang/Object;

    move-result-object v0

    iget-object v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I
    invoke-static {v1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getOffset$p(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v1

    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    add-int/2addr v1, p0

    aget-object p0, v0, v1

    return-object p0

    .line 579
    :cond_1f
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public previousIndex()I
    .registers 1

    .line 574
    iget p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public remove()V
    .registers 4

    .line 605
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 606
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_1c

    .line 607
    iget-object v2, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    invoke-virtual {v2, v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->removeAt(I)Ljava/lang/Object;

    .line 608
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->index:I

    .line 609
    iput v1, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    .line 610
    iget-object v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    # getter for: Lkotlin/collections/builders/ListBuilder$BuilderSubList;->modCount:I
    invoke-static {v0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->access$getModCount$p$s1462993667(Lkotlin/collections/builders/ListBuilder$BuilderSubList;)I

    move-result v0

    iput v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->expectedModCount:I

    return-void

    .line 606
    :cond_1c
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Call next() or previous() before removing element from the iterator."

    invoke-virtual {v0}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TE;)V"
        }
    .end annotation

    .line 592
    invoke-direct {p0}, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->checkForComodification()V

    .line 593
    iget v0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->lastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_e

    .line 594
    iget-object p0, p0, Lkotlin/collections/builders/ListBuilder$BuilderSubList$Itr;->list:Lkotlin/collections/builders/ListBuilder$BuilderSubList;

    invoke-virtual {p0, v0, p1}, Lkotlin/collections/builders/ListBuilder$BuilderSubList;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 593
    :cond_e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Call next() or previous() before replacing element from the iterator."

    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
.end method
