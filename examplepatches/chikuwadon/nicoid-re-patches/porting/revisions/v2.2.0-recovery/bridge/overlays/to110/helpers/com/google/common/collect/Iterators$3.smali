.class Lcom/google/common/collect/Iterators$3;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "Iterators.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterators;->consumingForArray([Ljava/util/Iterator;)Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/UnmodifiableIterator<",
        "TI;>;"
    }
.end annotation


# instance fields
.field index:I

.field final synthetic val$elements:[Ljava/util/Iterator;


# direct methods
.method constructor <init>([Ljava/util/Iterator;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "val$elements"
        }
    .end annotation

    .line 471
    iput-object p1, p0, Lcom/google/common/collect/Iterators$3;->val$elements:[Ljava/util/Iterator;

    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    const/4 p1, 0x0

    .line 472
    iput p1, p0, Lcom/google/common/collect/Iterators$3;->index:I

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 2

    .line 476
    iget v0, p0, Lcom/google/common/collect/Iterators$3;->index:I

    iget-object p0, p0, Lcom/google/common/collect/Iterators$3;->val$elements:[Ljava/util/Iterator;

    array-length p0, p0

    if-ge v0, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 471
    invoke-virtual {p0}, Lcom/google/common/collect/Iterators$3;->next()Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/util/Iterator;
    .registers 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TI;"
        }
    .end annotation

    .line 481
    invoke-virtual {p0}, Lcom/google/common/collect/Iterators$3;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 488
    iget-object v0, p0, Lcom/google/common/collect/Iterators$3;->val$elements:[Ljava/util/Iterator;

    iget v1, p0, Lcom/google/common/collect/Iterators$3;->index:I

    aget-object v0, v0, v1

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Iterator;

    .line 489
    iget-object v1, p0, Lcom/google/common/collect/Iterators$3;->val$elements:[Ljava/util/Iterator;

    iget v2, p0, Lcom/google/common/collect/Iterators$3;->index:I

    const/4 v3, 0x0

    aput-object v3, v1, v2

    add-int/lit8 v2, v2, 0x1

    .line 490
    iput v2, p0, Lcom/google/common/collect/Iterators$3;->index:I

    return-object v0

    .line 482
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method
