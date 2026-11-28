.class final Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/util/ListIterator;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMappedMarker;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/collections/builders/ListBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Itr"
.end annotation


# instance fields
.field private expectedModCount:I

.field private index:I

.field private lastIndex:I

.field private final list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;


# direct methods
.method public constructor <init>(Lnicoid/network238/kotlin/collections/builders/ListBuilder;I)V
    .registers 3

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 250
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 251
    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    .line 252
    iput p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    .line 254
    const/4 p2, -0x1

    iput p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    .line 255
    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->expectedModCount:I

    return-void
.end method

.method private final checkForComodification()V
    .registers 3

    .line 300
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result v0

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->expectedModCount:I

    if-ne v0, v1, :cond_0

    return-void

    .line 301
    :cond_0
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 5

    .line 284
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->checkForComodification()V

    .line 285
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    add-int/lit8 v2, v1, 0x1

    iput v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    invoke-virtual {v0, v1, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->add(ILjava/lang/Object;)V

    .line 286
    const/4 p1, -0x1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    .line 287
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result p1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->expectedModCount:I

    return-void
.end method

.method public hasNext()Z
    .registers 3

    .line 258
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getLength$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

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

    .line 257
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    if-lez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public next()Ljava/lang/Object;
    .registers 3

    .line 271
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->checkForComodification()V

    .line 272
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->length:I
    invoke-static {v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getLength$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result v1

    if-ge v0, v1, :cond_0

    .line 273
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    add-int/lit8 v1, v0, 0x1

    iput v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    .line 274
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    aget-object v0, v0, v1

    return-object v0

    .line 272
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public nextIndex()I
    .registers 2

    .line 261
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    return v0
.end method

.method public previous()Ljava/lang/Object;
    .registers 3

    .line 264
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->checkForComodification()V

    .line 265
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    if-lez v0, :cond_0

    add-int/lit8 v0, v0, -0x1

    .line 266
    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    .line 267
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;

    move-result-object v0

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    aget-object v0, v0, v1

    return-object v0

    .line 265
    :cond_0
    new-instance v0, Ljava/util/NoSuchElementException;

    invoke-direct {v0}, Ljava/util/NoSuchElementException;-><init>()V

    throw v0
.end method

.method public previousIndex()I
    .registers 2

    .line 260
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    add-int/lit8 v0, v0, -0x1

    return v0
.end method

.method public remove()V
    .registers 4

    .line 291
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->checkForComodification()V

    .line 292
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 293
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    invoke-virtual {v2, v0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->remove(I)Ljava/lang/Object;

    .line 294
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->index:I

    .line 295
    iput v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    .line 296
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result v0

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->expectedModCount:I

    return-void

    .line 292
    :cond_0
    new-instance v0, Ljava/lang/IllegalStateException;

    const-string v1, "Call next() or previous() before removing element from the iterator."

    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public set(Ljava/lang/Object;)V
    .registers 4

    .line 278
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->checkForComodification()V

    .line 279
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->lastIndex:I

    const/4 v1, -0x1

    if-eq v0, v1, :cond_0

    .line 280
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$Itr;->list:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    invoke-virtual {v1, v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->set(ILjava/lang/Object;)Ljava/lang/Object;

    return-void

    .line 279
    :cond_0
    new-instance p1, Ljava/lang/IllegalStateException;

    const-string v0, "Call next() or previous() before replacing element from the iterator."

    invoke-direct {p1, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p1
.end method
