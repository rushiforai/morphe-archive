.class Lcom/google/common/collect/CompactHashSet$1;
.super Ljava/lang/Object;
.source "CompactHashSet.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/CompactHashSet;->iterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TE;>;"
    }
.end annotation


# instance fields
.field currentIndex:I

.field expectedMetadata:I

.field indexToRemove:I

.field final synthetic this$0:Lcom/google/common/collect/CompactHashSet;


# direct methods
.method constructor <init>(Lcom/google/common/collect/CompactHashSet;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 541
    iput-object p1, p0, Lcom/google/common/collect/CompactHashSet$1;->this$0:Lcom/google/common/collect/CompactHashSet;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 542
    # getter for: Lcom/google/common/collect/CompactHashSet;->metadata:I
    invoke-static {p1}, Lcom/google/common/collect/CompactHashSet;->access$000(Lcom/google/common/collect/CompactHashSet;)I

    move-result v0

    iput v0, p0, Lcom/google/common/collect/CompactHashSet$1;->expectedMetadata:I

    .line 543
    invoke-virtual {p1}, Lcom/google/common/collect/CompactHashSet;->firstEntryIndex()I

    move-result p1

    iput p1, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    const/4 p1, -0x1

    .line 544
    iput p1, p0, Lcom/google/common/collect/CompactHashSet$1;->indexToRemove:I

    return-void
.end method


# virtual methods
.method checkForConcurrentModification()V
    .registers 2

    .line 579
    iget-object v0, p0, Lcom/google/common/collect/CompactHashSet$1;->this$0:Lcom/google/common/collect/CompactHashSet;

    # getter for: Lcom/google/common/collect/CompactHashSet;->metadata:I
    invoke-static {v0}, Lcom/google/common/collect/CompactHashSet;->access$000(Lcom/google/common/collect/CompactHashSet;)I

    move-result v0

    iget p0, p0, Lcom/google/common/collect/CompactHashSet$1;->expectedMetadata:I

    if-ne v0, p0, :cond_0

    return-void

    .line 580
    :cond_0
    new-instance p0, Ljava/util/ConcurrentModificationException;

    invoke-direct {p0}, Ljava/util/ConcurrentModificationException;-><init>()V

    throw p0
.end method

.method public hasNext()Z
    .registers 1

    .line 548
    iget p0, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    if-ltz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method incrementExpectedModCount()V
    .registers 2

    .line 575
    iget v0, p0, Lcom/google/common/collect/CompactHashSet$1;->expectedMetadata:I

    add-int/lit8 v0, v0, 0x20

    iput v0, p0, Lcom/google/common/collect/CompactHashSet$1;->expectedMetadata:I

    return-void
.end method

.method public next()Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TE;"
        }
    .end annotation

    .line 554
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet$1;->checkForConcurrentModification()V

    .line 555
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet$1;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 558
    iget v0, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    iput v0, p0, Lcom/google/common/collect/CompactHashSet$1;->indexToRemove:I

    .line 559
    iget-object v1, p0, Lcom/google/common/collect/CompactHashSet$1;->this$0:Lcom/google/common/collect/CompactHashSet;

    # invokes: Lcom/google/common/collect/CompactHashSet;->element(I)Ljava/lang/Object;
    invoke-static {v1, v0}, Lcom/google/common/collect/CompactHashSet;->access$100(Lcom/google/common/collect/CompactHashSet;I)Ljava/lang/Object;

    move-result-object v0

    .line 560
    iget-object v1, p0, Lcom/google/common/collect/CompactHashSet$1;->this$0:Lcom/google/common/collect/CompactHashSet;

    iget v2, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    invoke-virtual {v1, v2}, Lcom/google/common/collect/CompactHashSet;->getSuccessor(I)I

    move-result v1

    iput v1, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    return-object v0

    .line 556
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .registers 4

    .line 566
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet$1;->checkForConcurrentModification()V

    .line 567
    iget v0, p0, Lcom/google/common/collect/CompactHashSet$1;->indexToRemove:I

    if-ltz v0, :cond_0

    const/4 v0, 0x1

    goto :goto_0

    :cond_0
    const/4 v0, 0x0

    :goto_0
    invoke-static {v0}, Lcom/google/common/collect/CollectPreconditions;->checkRemove(Z)V

    .line 568
    invoke-virtual {p0}, Lcom/google/common/collect/CompactHashSet$1;->incrementExpectedModCount()V

    .line 569
    iget-object v0, p0, Lcom/google/common/collect/CompactHashSet$1;->this$0:Lcom/google/common/collect/CompactHashSet;

    iget v1, p0, Lcom/google/common/collect/CompactHashSet$1;->indexToRemove:I

    # invokes: Lcom/google/common/collect/CompactHashSet;->element(I)Ljava/lang/Object;
    invoke-static {v0, v1}, Lcom/google/common/collect/CompactHashSet;->access$100(Lcom/google/common/collect/CompactHashSet;I)Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/collect/CompactHashSet;->remove(Ljava/lang/Object;)Z

    .line 570
    iget-object v0, p0, Lcom/google/common/collect/CompactHashSet$1;->this$0:Lcom/google/common/collect/CompactHashSet;

    iget v1, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    iget v2, p0, Lcom/google/common/collect/CompactHashSet$1;->indexToRemove:I

    invoke-virtual {v0, v1, v2}, Lcom/google/common/collect/CompactHashSet;->adjustAfterRemove(II)I

    move-result v0

    iput v0, p0, Lcom/google/common/collect/CompactHashSet$1;->currentIndex:I

    const/4 v0, -0x1

    .line 571
    iput v0, p0, Lcom/google/common/collect/CompactHashSet$1;->indexToRemove:I

    return-void
.end method
