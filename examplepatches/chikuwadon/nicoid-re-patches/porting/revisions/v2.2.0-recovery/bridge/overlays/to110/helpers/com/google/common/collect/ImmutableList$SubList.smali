.class final Lcom/google/common/collect/ImmutableList$SubList;
.super Lcom/google/common/collect/ImmutableList;
.source "ImmutableList.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/ImmutableList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "SubList"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ImmutableList<",
        "TE;>;"
    }
.end annotation


# instance fields
.field final transient length:I

.field final transient offset:I

.field final synthetic this$0:Lcom/google/common/collect/ImmutableList;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableList;II)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "offset",
            "length"
        }
    .end annotation

    .line 459
    iput-object p1, p0, Lcom/google/common/collect/ImmutableList$SubList;->this$0:Lcom/google/common/collect/ImmutableList;

    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList;-><init>()V

    .line 460
    iput p2, p0, Lcom/google/common/collect/ImmutableList$SubList;->offset:I

    .line 461
    iput p3, p0, Lcom/google/common/collect/ImmutableList$SubList;->length:I

    return-void
.end method


# virtual methods
.method public get(I)Ljava/lang/Object;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)TE;"
        }
    .end annotation

    .line 486
    iget v0, p0, Lcom/google/common/collect/ImmutableList$SubList;->length:I

    invoke-static {p1, v0}, Lcom/google/common/base/Preconditions;->checkElementIndex(II)I

    .line 487
    iget-object v0, p0, Lcom/google/common/collect/ImmutableList$SubList;->this$0:Lcom/google/common/collect/ImmutableList;

    iget p0, p0, Lcom/google/common/collect/ImmutableList$SubList;->offset:I

    add-int/2addr p1, p0

    invoke-virtual {v0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method internalArray()[Ljava/lang/Object;
    .registers 1

    .line 471
    iget-object p0, p0, Lcom/google/common/collect/ImmutableList$SubList;->this$0:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableList;->internalArray()[Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method internalArrayEnd()I
    .registers 3

    .line 481
    iget-object v0, p0, Lcom/google/common/collect/ImmutableList$SubList;->this$0:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->internalArrayStart()I

    move-result v0

    iget v1, p0, Lcom/google/common/collect/ImmutableList$SubList;->offset:I

    add-int/2addr v0, v1

    iget p0, p0, Lcom/google/common/collect/ImmutableList$SubList;->length:I

    add-int/2addr v0, p0

    return v0
.end method

.method internalArrayStart()I
    .registers 2

    .line 476
    iget-object v0, p0, Lcom/google/common/collect/ImmutableList$SubList;->this$0:Lcom/google/common/collect/ImmutableList;

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableList;->internalArrayStart()I

    move-result v0

    iget p0, p0, Lcom/google/common/collect/ImmutableList$SubList;->offset:I

    add-int/2addr v0, p0

    return v0
.end method

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 455
    invoke-super {p0}, Lcom/google/common/collect/ImmutableList;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic listIterator()Ljava/util/ListIterator;
    .registers 1

    .line 455
    invoke-super {p0}, Lcom/google/common/collect/ImmutableList;->listIterator()Lcom/google/common/collect/UnmodifiableListIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic listIterator(I)Ljava/util/ListIterator;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 455
    invoke-super {p0, p1}, Lcom/google/common/collect/ImmutableList;->listIterator(I)Lcom/google/common/collect/UnmodifiableListIterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 466
    iget p0, p0, Lcom/google/common/collect/ImmutableList$SubList;->length:I

    return p0
.end method

.method public subList(II)Lcom/google/common/collect/ImmutableList;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "fromIndex",
            "toIndex"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(II)",
            "Lcom/google/common/collect/ImmutableList<",
            "TE;>;"
        }
    .end annotation

    .line 492
    iget v0, p0, Lcom/google/common/collect/ImmutableList$SubList;->length:I

    invoke-static {p1, p2, v0}, Lcom/google/common/base/Preconditions;->checkPositionIndexes(III)V

    .line 493
    iget-object v0, p0, Lcom/google/common/collect/ImmutableList$SubList;->this$0:Lcom/google/common/collect/ImmutableList;

    iget p0, p0, Lcom/google/common/collect/ImmutableList$SubList;->offset:I

    add-int/2addr p1, p0

    add-int/2addr p2, p0

    invoke-virtual {v0, p1, p2}, Lcom/google/common/collect/ImmutableList;->subList(II)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic subList(II)Ljava/util/List;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "fromIndex",
            "toIndex"
        }
    .end annotation

    .line 455
    invoke-virtual {p0, p1, p2}, Lcom/google/common/collect/ImmutableList$SubList;->subList(II)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    return-object p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 507
    invoke-super {p0}, Lcom/google/common/collect/ImmutableList;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
