.class public final Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;
.super Lnicoid/network238/kotlin/collections/AbstractMutableList;
.source "SourceFile"

# interfaces
.implements Ljava/util/List;
.implements Ljava/util/RandomAccess;
.implements Ljava/io/Serializable;
.implements Lnicoid/network238/kotlin/jvm/internal/markers/KMutableList;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lnicoid/network238/kotlin/collections/builders/ListBuilder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BuilderSubList"
.end annotation

.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;
    }
.end annotation


# instance fields
.field private backing:[Ljava/lang/Object;

.field private length:I

.field private final offset:I

.field private final parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

.field private final root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;


# direct methods
.method public constructor <init>([Ljava/lang/Object;IILnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;Lnicoid/network238/kotlin/collections/builders/ListBuilder;)V
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 311
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/AbstractMutableList;-><init>()V

    .line 306
    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    .line 307
    iput p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    .line 308
    iput p3, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    .line 309
    iput-object p4, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    .line 310
    iput-object p5, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    .line 313
    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {p5}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result p1

    iput p1, p0, Ljava/util/AbstractList;->modCount:I

    return-void
.end method

.method public static final synthetic access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)[Ljava/lang/Object;
    .registers 1

    .line 305
    iget-object p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    return-object p0
.end method

.method public static final synthetic access$getLength$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I
    .registers 1

    .line 305
    iget p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return p0
.end method

.method public static final synthetic access$getModCount$p$s1462993667(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I
    .registers 1

    .line 305
    iget p0, p0, Ljava/util/AbstractList;->modCount:I

    return p0
.end method

.method public static final synthetic access$getOffset$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)I
    .registers 1

    .line 305
    iget p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    return p0
.end method

.method public static final synthetic access$getRoot$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;)Lnicoid/network238/kotlin/collections/builders/ListBuilder;
    .registers 1

    .line 305
    iget-object p0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    return-object p0
.end method

.method private final addAllInternal(ILjava/util/Collection;I)V
    .registers 5

    .line 514
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 515
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_0

    .line 516
    invoke-direct {v0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->addAllInternal(ILjava/util/Collection;I)V

    goto :goto_0

    .line 518
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAllInternal(ILjava/util/Collection;I)V
    invoke-static {v0, p1, p2, p3}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$addAllInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;ILjava/util/Collection;I)V

    .line 520
    :goto_0
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    .line 521
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr p1, p3

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-void
.end method

.method private final addAtInternal(ILjava/lang/Object;)V
    .registers 4

    .line 503
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 504
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_0

    .line 505
    invoke-direct {v0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->addAtInternal(ILjava/lang/Object;)V

    goto :goto_0

    .line 507
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->addAtInternal(ILjava/lang/Object;)V
    invoke-static {v0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$addAtInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;ILjava/lang/Object;)V

    .line 509
    :goto_0
    iget-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->backing:[Ljava/lang/Object;
    invoke-static {p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getBacking$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)[Ljava/lang/Object;

    move-result-object p1

    iput-object p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    .line 510
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-void
.end method

.method private final checkForComodification()V
    .registers 3

    .line 487
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Ljava/util/AbstractList;->modCount:I
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$getModCount$p$s-2084097795(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)I

    move-result v0

    iget v1, p0, Ljava/util/AbstractList;->modCount:I

    if-ne v0, v1, :cond_0

    return-void

    .line 488
    :cond_0
    new-instance v0, Ljava/util/ConcurrentModificationException;

    invoke-direct {v0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw v0
.end method

.method private final checkIsMutable()V
    .registers 2

    .line 492
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->isReadOnly()Z

    move-result v0

    if-nez v0, :cond_0

    return-void

    :cond_0
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {v0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw v0
.end method

.method private final contentEquals(Ljava/util/List;)Z
    .registers 5

    .line 499
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z
    invoke-static {v0, v1, v2, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->access$subarrayContentEquals([Ljava/lang/Object;IILjava/util/List;)Z

    move-result p1

    return p1
.end method

.method private final isReadOnly()Z
    .registers 2

    .line 496
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # getter for: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->isReadOnly:Z
    invoke-static {v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$isReadOnly$p(Lnicoid/network238/kotlin/collections/builders/ListBuilder;)Z

    move-result v0

    return v0
.end method

.method private final registerModification()V
    .registers 2

    .line 483
    iget v0, p0, Ljava/util/AbstractList;->modCount:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Ljava/util/AbstractList;->modCount:I

    return-void
.end method

.method private final removeAtInternal(I)Ljava/lang/Object;
    .registers 3

    .line 525
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 526
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_0

    .line 527
    invoke-direct {v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->removeAtInternal(I)Ljava/lang/Object;

    move-result-object p1

    goto :goto_0

    .line 529
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->removeAtInternal(I)Ljava/lang/Object;
    invoke-static {v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$removeAtInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;I)Ljava/lang/Object;

    move-result-object p1

    .line 531
    :goto_0
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-object p1
.end method

.method private final removeRangeInternal(II)V
    .registers 4

    if-lez p2, :cond_0

    .line 536
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 537
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_1

    .line 538
    invoke-direct {v0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->removeRangeInternal(II)V

    goto :goto_0

    .line 540
    :cond_1
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->removeRangeInternal(II)V
    invoke-static {v0, p1, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$removeRangeInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;II)V

    .line 542
    :goto_0
    iget p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    sub-int/2addr p1, p2

    iput p1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return-void
.end method

.method private final retainOrRemoveAllInternal(IILjava/util/Collection;Z)I
    .registers 6

    .line 548
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->parent:Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    if-eqz v0, :cond_0

    .line 549
    invoke-direct {v0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p1

    goto :goto_0

    .line 551
    :cond_0
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilder;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I
    invoke-static {v0, p1, p2, p3, p4}, Lnicoid/network238/kotlin/collections/builders/ListBuilder;->access$retainOrRemoveAllInternal(Lnicoid/network238/kotlin/collections/builders/ListBuilder;IILjava/util/Collection;Z)I

    move-result p1

    :goto_0
    if-lez p1, :cond_1

    .line 553
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->registerModification()V

    .line 554
    :cond_1
    iget p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    sub-int/2addr p2, p1

    iput p2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return p1
.end method


# virtual methods
.method public add(ILjava/lang/Object;)V
    .registers 5

    .line 385
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 386
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 387
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 388
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0, p2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->addAtInternal(ILjava/lang/Object;)V

    return-void
.end method

.method public add(Ljava/lang/Object;)Z
    .registers 4

    .line 378
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 379
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 380
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr v0, v1

    invoke-direct {p0, v0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->addAtInternal(ILjava/lang/Object;)V

    const/4 p1, 0x1

    return p1
.end method

.method public addAll(ILjava/util/Collection;)Z
    .registers 5

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 400
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 401
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 402
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 403
    invoke-interface {p2}, Ljava/util/Collection;->size()I

    move-result v0

    .line 404
    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, p1

    invoke-direct {p0, v1, p2, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->addAllInternal(ILjava/util/Collection;I)V

    if-lez v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public addAll(Ljava/util/Collection;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 392
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 393
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 394
    invoke-interface {p1}, Ljava/util/Collection;->size()I

    move-result v0

    .line 395
    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr v1, v2

    invoke-direct {p0, v1, p1, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->addAllInternal(ILjava/util/Collection;I)V

    if-lez v0, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public clear()V
    .registers 3

    .line 409
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 410
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 411
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-direct {p0, v0, v1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->removeRangeInternal(II)V

    return-void
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 3

    .line 465
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    if-eq p1, p0, :cond_1

    .line 467
    instance-of v0, p1, Ljava/util/List;

    if-eqz v0, :cond_0

    check-cast p1, Ljava/util/List;

    invoke-direct {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->contentEquals(Ljava/util/List;)Z

    move-result p1

    if-eqz p1, :cond_0

    goto :goto_0

    :cond_0
    const/4 p1, 0x0

    return p1

    :cond_1
    :goto_0
    const/4 p1, 0x1

    return p1
.end method

.method public get(I)Ljava/lang/Object;
    .registers 4

    .line 334
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 335
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 336
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, p1

    aget-object p1, v0, v1

    return-object p1
.end method

.method public getSize()I
    .registers 2

    .line 324
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 325
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    return v0
.end method

.method public hashCode()I
    .registers 4

    .line 471
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 472
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentHashCode([Ljava/lang/Object;II)I
    invoke-static {v0, v1, v2}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->access$subarrayContentHashCode([Ljava/lang/Object;II)I

    move-result v0

    return v0
.end method

.method public indexOf(Ljava/lang/Object;)I
    .registers 5

    .line 349
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    const/4 v0, 0x0

    .line 351
    :goto_0
    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    if-ge v0, v1, :cond_1

    .line 352
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v2, v0

    aget-object v1, v1, v2

    invoke-static {v1, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, 0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public isEmpty()Z
    .registers 2

    .line 329
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 330
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    if-nez v0, :cond_0

    const/4 v0, 0x1

    return v0

    :cond_0
    const/4 v0, 0x0

    return v0
.end method

.method public iterator()Ljava/util/Iterator;
    .registers 2

    .line 368
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public lastIndexOf(Ljava/lang/Object;)I
    .registers 5

    .line 359
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 360
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/lit8 v0, v0, -0x1

    :goto_0
    if-ltz v0, :cond_1

    .line 362
    iget-object v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v2, v0

    aget-object v1, v1, v2

    invoke-static {v1, p1}, Lnicoid/network238/kotlin/jvm/internal/Intrinsics;->areEqual(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    return v0

    :cond_0
    add-int/lit8 v0, v0, -0x1

    goto :goto_0

    :cond_1
    const/4 p1, -0x1

    return p1
.end method

.method public listIterator()Ljava/util/ListIterator;
    .registers 2

    .line 369
    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object v0

    return-object v0
.end method

.method public listIterator(I)Ljava/util/ListIterator;
    .registers 4

    .line 372
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 373
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkPositionIndex$kotlin_stdlib(II)V

    .line 374
    new-instance v0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;

    invoke-direct {v0, p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList$Itr;-><init>(Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;I)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 2

    .line 422
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 423
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 424
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->indexOf(Ljava/lang/Object;)I

    move-result p1

    if-ltz p1, :cond_0

    .line 425
    invoke-virtual {p0, p1}, Lnicoid/network238/kotlin/collections/AbstractMutableList;->remove(I)Ljava/lang/Object;

    const/4 p1, 0x1

    return p1

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public removeAll(Ljava/util/Collection;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 430
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 431
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 432
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    const/4 v2, 0x0

    invoke-direct {p0, v0, v1, p1, v2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p1

    if-lez p1, :cond_0

    const/4 p1, 0x1

    return p1

    :cond_0
    return v2
.end method

.method public removeAt(I)Ljava/lang/Object;
    .registers 4

    .line 415
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 416
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 417
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 418
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v0, p1

    invoke-direct {p0, v0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->removeAtInternal(I)Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 5

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 436
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 437
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 438
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    const/4 v2, 0x1

    invoke-direct {p0, v0, v1, p1, v2}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->retainOrRemoveAllInternal(IILjava/util/Collection;Z)I

    move-result p1

    if-lez p1, :cond_0

    return v2

    :cond_0
    const/4 p1, 0x0

    return p1
.end method

.method public set(ILjava/lang/Object;)Ljava/lang/Object;
    .registers 5

    .line 340
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkIsMutable()V

    .line 341
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 342
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkElementIndex$kotlin_stdlib(II)V

    .line 343
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, p1

    aget-object p1, v0, v1

    .line 344
    aput-object p2, v0, v1

    return-object p1
.end method

.method public subList(II)Ljava/util/List;
    .registers 11

    .line 442
    sget-object v0, Lnicoid/network238/kotlin/collections/AbstractList;->Companion:Lnicoid/network238/kotlin/collections/AbstractList$Companion;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-virtual {v0, p1, p2, v1}, Lnicoid/network238/kotlin/collections/AbstractList$Companion;->checkRangeIndexes$kotlin_stdlib(III)V

    .line 443
    new-instance v2, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;

    iget-object v3, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int v4, v0, p1

    sub-int v5, p2, p1

    iget-object v7, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->root:Lnicoid/network238/kotlin/collections/builders/ListBuilder;

    move-object v6, p0

    invoke-direct/range {v2 .. v7}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;-><init>([Ljava/lang/Object;IILnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;Lnicoid/network238/kotlin/collections/builders/ListBuilder;)V

    return-object v2
.end method

.method public toArray()[Ljava/lang/Object;
    .registers 4

    .line 459
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 461
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    add-int/2addr v2, v1

    invoke-static {v0, v1, v2}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyOfRange([Ljava/lang/Object;II)[Ljava/lang/Object;

    move-result-object v0

    return-object v0
.end method

.method public toArray([Ljava/lang/Object;)[Ljava/lang/Object;
    .registers 6

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 448
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 449
    array-length v0, p1

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    .line 453
    iget-object v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    if-ge v0, v1, :cond_0

    .line 450
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, v0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p1

    invoke-static {v2, v0, v1, p1}, Ljava/util/Arrays;->copyOfRange([Ljava/lang/Object;IILjava/lang/Class;)[Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    return-object p1

    .line 453
    :cond_0
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    add-int/2addr v1, v0

    const/4 v3, 0x0

    invoke-static {v2, p1, v3, v0, v1}, Lnicoid/network238/kotlin/collections/ArraysKt;->copyInto([Ljava/lang/Object;[Ljava/lang/Object;III)[Ljava/lang/Object;

    .line 455
    iget v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    invoke-static {v0, p1}, Lnicoid/network238/kotlin/collections/CollectionsKt;->terminateCollectionToArray(I[Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p1

    return-object p1
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 476
    invoke-direct {p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->checkForComodification()V

    .line 477
    iget-object v0, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->backing:[Ljava/lang/Object;

    iget v1, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->offset:I

    iget v2, p0, Lnicoid/network238/kotlin/collections/builders/ListBuilder$BuilderSubList;->length:I

    # invokes: Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;
    invoke-static {v0, v1, v2, p0}, Lnicoid/network238/kotlin/collections/builders/ListBuilderKt;->access$subarrayContentToString([Ljava/lang/Object;IILjava/util/Collection;)Ljava/lang/String;

    move-result-object v0

    return-object v0
.end method
