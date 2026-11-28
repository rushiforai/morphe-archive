.class final Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;
.super Ljava/lang/Object;
.source "LinkedListMultimap.java"

# interfaces
.implements Ljava/util/ListIterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/LinkedListMultimap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "ValueForKeyIterator"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/ListIterator<",
        "TV;>;"
    }
.end annotation


# instance fields
.field current:Lcom/google/common/collect/LinkedListMultimap$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/LinkedListMultimap$Node<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field final key:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TK;"
        }
    .end annotation
.end field

.field next:Lcom/google/common/collect/LinkedListMultimap$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/LinkedListMultimap$Node<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field nextIndex:I

.field previous:Lcom/google/common/collect/LinkedListMultimap$Node;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/LinkedListMultimap$Node<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field final synthetic this$0:Lcom/google/common/collect/LinkedListMultimap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/LinkedListMultimap;Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0
        }
        names = {
            "this$0",
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;)V"
        }
    .end annotation

    .line 465
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 466
    iput-object p2, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->key:Ljava/lang/Object;

    .line 467
    # getter for: Lcom/google/common/collect/LinkedListMultimap;->keyToKeyList:Ljava/util/Map;
    invoke-static {p1}, Lcom/google/common/collect/LinkedListMultimap;->access$500(Lcom/google/common/collect/LinkedListMultimap;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/LinkedListMultimap$KeyList;

    if-nez p1, :cond_0

    const/4 p1, 0x0

    goto :goto_0

    .line 468
    :cond_0
    iget-object p1, p1, Lcom/google/common/collect/LinkedListMultimap$KeyList;->head:Lcom/google/common/collect/LinkedListMultimap$Node;

    :goto_0
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    return-void
.end method

.method constructor <init>(Lcom/google/common/collect/LinkedListMultimap;Ljava/lang/Object;I)V
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "key",
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TK;I)V"
        }
    .end annotation

    .line 479
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 480
    # getter for: Lcom/google/common/collect/LinkedListMultimap;->keyToKeyList:Ljava/util/Map;
    invoke-static {p1}, Lcom/google/common/collect/LinkedListMultimap;->access$500(Lcom/google/common/collect/LinkedListMultimap;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p1, p2}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/collect/LinkedListMultimap$KeyList;

    if-nez p1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    .line 481
    :cond_0
    iget v0, p1, Lcom/google/common/collect/LinkedListMultimap$KeyList;->count:I

    .line 482
    :goto_0
    invoke-static {p3, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndex(II)I

    .line 483
    div-int/lit8 v1, v0, 0x2

    const/4 v2, 0x0

    if-lt p3, v1, :cond_2

    if-nez p1, :cond_1

    move-object p1, v2

    goto :goto_1

    .line 484
    :cond_1
    iget-object p1, p1, Lcom/google/common/collect/LinkedListMultimap$KeyList;->tail:Lcom/google/common/collect/LinkedListMultimap$Node;

    :goto_1
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 485
    iput v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    :goto_2
    add-int/lit8 p1, p3, 0x1

    if-ge p3, v0, :cond_4

    .line 487
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous()Ljava/lang/Object;

    move p3, p1

    goto :goto_2

    :cond_2
    if-nez p1, :cond_3

    move-object p1, v2

    goto :goto_3

    .line 490
    :cond_3
    iget-object p1, p1, Lcom/google/common/collect/LinkedListMultimap$KeyList;->head:Lcom/google/common/collect/LinkedListMultimap$Node;

    :goto_3
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    :goto_4
    add-int/lit8 p1, p3, -0x1

    if-lez p3, :cond_4

    .line 492
    invoke-virtual {p0}, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next()Ljava/lang/Object;

    move p3, p1

    goto :goto_4

    .line 495
    :cond_4
    iput-object p2, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->key:Ljava/lang/Object;

    .line 496
    iput-object v2, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    return-void
.end method


# virtual methods
.method public add(Ljava/lang/Object;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 566
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    iget-object v1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->key:Ljava/lang/Object;

    iget-object v2, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    # invokes: Lcom/google/common/collect/LinkedListMultimap;->addNode(Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/collect/LinkedListMultimap$Node;)Lcom/google/common/collect/LinkedListMultimap$Node;
    invoke-static {v0, v1, p1, v2}, Lcom/google/common/collect/LinkedListMultimap;->access$600(Lcom/google/common/collect/LinkedListMultimap;Ljava/lang/Object;Ljava/lang/Object;Lcom/google/common/collect/LinkedListMultimap$Node;)Lcom/google/common/collect/LinkedListMultimap$Node;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 567
    iget p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    add-int/lit8 p1, p1, 0x1

    iput p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    const/4 p1, 0x0

    .line 568
    iput-object p1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    return-void
.end method

.method public hasNext()Z
    .registers 1

    .line 501
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public hasPrevious()Z
    .registers 1

    .line 519
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 508
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    if-eqz v0, :cond_0

    .line 511
    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 512
    iget-object v0, v0, Lcom/google/common/collect/LinkedListMultimap$Node;->nextSibling:Lcom/google/common/collect/LinkedListMultimap$Node;

    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 513
    iget v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    .line 514
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    invoke-virtual {p0}, Lcom/google/common/collect/LinkedListMultimap$Node;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 509
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public nextIndex()I
    .registers 1

    .line 537
    iget p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    return p0
.end method

.method public previous()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TV;"
        }
    .end annotation

    .line 526
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    if-eqz v0, :cond_0

    .line 529
    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 530
    iget-object v0, v0, Lcom/google/common/collect/LinkedListMultimap$Node;->previousSibling:Lcom/google/common/collect/LinkedListMultimap$Node;

    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 531
    iget v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    add-int/lit8 v0, v0, -0x1

    iput v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    .line 532
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    invoke-virtual {p0}, Lcom/google/common/collect/LinkedListMultimap$Node;->getValue()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 527
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public previousIndex()I
    .registers 1

    .line 542
    iget p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    add-int/lit8 p0, p0, -0x1

    return p0
.end method

.method public remove()V
    .registers 4

    .line 547
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    const/4 v1, 0x1

    if-eqz v0, :cond_0

    move v0, v1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    const-string v2, "no calls to next() since the last call to remove()"

    invoke-static {v0, v2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/Object;)V

    .line 548
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    iget-object v2, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    if-eq v0, v2, :cond_1

    .line 549
    iget-object v0, v0, Lcom/google/common/collect/LinkedListMultimap$Node;->previousSibling:Lcom/google/common/collect/LinkedListMultimap$Node;

    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->previous:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 550
    iget v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    sub-int/2addr v0, v1

    iput v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->nextIndex:I

    goto :goto_1

    .line 552
    :cond_1
    iget-object v0, v0, Lcom/google/common/collect/LinkedListMultimap$Node;->nextSibling:Lcom/google/common/collect/LinkedListMultimap$Node;

    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->next:Lcom/google/common/collect/LinkedListMultimap$Node;

    .line 554
    :goto_1
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->this$0:Lcom/google/common/collect/LinkedListMultimap;

    iget-object v1, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    # invokes: Lcom/google/common/collect/LinkedListMultimap;->removeNode(Lcom/google/common/collect/LinkedListMultimap$Node;)V
    invoke-static {v0, v1}, Lcom/google/common/collect/LinkedListMultimap;->access$300(Lcom/google/common/collect/LinkedListMultimap;Lcom/google/common/collect/LinkedListMultimap$Node;)V

    const/4 v0, 0x0

    .line 555
    iput-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    return-void
.end method

.method public set(Ljava/lang/Object;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)V"
        }
    .end annotation

    .line 560
    iget-object v0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    if-eqz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 561
    iget-object p0, p0, Lcom/google/common/collect/LinkedListMultimap$ValueForKeyIterator;->current:Lcom/google/common/collect/LinkedListMultimap$Node;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/LinkedListMultimap$Node;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    return-void
.end method
