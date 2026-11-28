.class Lcom/google/common/collect/Iterators$4;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "Iterators.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterators;->partitionImpl(Ljava/util/Iterator;IZ)Lcom/google/common/collect/UnmodifiableIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/UnmodifiableIterator<",
        "Ljava/util/List<",
        "TT;>;>;"
    }
.end annotation


# instance fields
.field final synthetic val$iterator:Ljava/util/Iterator;

.field final synthetic val$pad:Z

.field final synthetic val$size:I


# direct methods
.method constructor <init>(Ljava/util/Iterator;IZ)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010,
            0x1010
        }
        names = {
            "val$iterator",
            "val$size",
            "val$pad"
        }
    .end annotation

    .line 635
    iput-object p1, p0, Lcom/google/common/collect/Iterators$4;->val$iterator:Ljava/util/Iterator;

    iput p2, p0, Lcom/google/common/collect/Iterators$4;->val$size:I

    iput-boolean p3, p0, Lcom/google/common/collect/Iterators$4;->val$pad:Z

    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 638
    iget-object p0, p0, Lcom/google/common/collect/Iterators$4;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 635
    invoke-virtual {p0}, Lcom/google/common/collect/Iterators$4;->next()Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/util/List;
    .registers 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/List<",
            "TT;>;"
        }
    .end annotation

    .line 643
    invoke-virtual {p0}, Lcom/google/common/collect/Iterators$4;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3

    .line 647
    iget v0, p0, Lcom/google/common/collect/Iterators$4;->val$size:I

    new-array v0, v0, [Ljava/lang/Object;

    const/4 v1, 0x0

    move v2, v1

    .line 649
    :goto_0
    iget v3, p0, Lcom/google/common/collect/Iterators$4;->val$size:I

    if-ge v2, v3, :cond_0

    iget-object v3, p0, Lcom/google/common/collect/Iterators$4;->val$iterator:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_0

    .line 650
    iget-object v3, p0, Lcom/google/common/collect/Iterators$4;->val$iterator:Ljava/util/Iterator;

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    aput-object v3, v0, v2

    add-int/lit8 v2, v2, 0x1

    goto :goto_0

    :cond_0
    move v3, v2

    .line 652
    :goto_1
    iget v4, p0, Lcom/google/common/collect/Iterators$4;->val$size:I

    if-ge v3, v4, :cond_1

    const/4 v4, 0x0

    .line 653
    aput-object v4, v0, v3

    add-int/lit8 v3, v3, 0x1

    goto :goto_1

    .line 656
    :cond_1
    invoke-static {v0}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    .line 658
    iget-boolean v3, p0, Lcom/google/common/collect/Iterators$4;->val$pad:Z

    if-nez v3, :cond_2

    iget p0, p0, Lcom/google/common/collect/Iterators$4;->val$size:I

    if-eq v2, p0, :cond_2

    .line 661
    invoke-interface {v0, v1, v2}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object p0

    return-object p0

    :cond_2
    return-object v0

    .line 644
    :cond_3
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method
