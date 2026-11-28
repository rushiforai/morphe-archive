.class Lcom/google/common/collect/Iterators$7;
.super Ljava/lang/Object;
.source "Iterators.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Iterators;->limit(Ljava/util/Iterator;I)Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "TT;>;"
    }
.end annotation


# instance fields
.field count:I

.field final synthetic val$iterator:Ljava/util/Iterator;

.field final synthetic val$limitSize:I


# direct methods
.method constructor <init>(ILjava/util/Iterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$limitSize",
            "val$iterator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 959
    iput p1, p0, Lcom/google/common/collect/Iterators$7;->val$limitSize:I

    iput-object p2, p0, Lcom/google/common/collect/Iterators$7;->val$iterator:Ljava/util/Iterator;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 3

    .line 964
    iget v0, p0, Lcom/google/common/collect/Iterators$7;->count:I

    iget v1, p0, Lcom/google/common/collect/Iterators$7;->val$limitSize:I

    if-ge v0, v1, :cond_0

    iget-object p0, p0, Lcom/google/common/collect/Iterators$7;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

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
            "()TT;"
        }
    .end annotation

    .line 970
    invoke-virtual {p0}, Lcom/google/common/collect/Iterators$7;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 973
    iget v0, p0, Lcom/google/common/collect/Iterators$7;->count:I

    add-int/lit8 v0, v0, 0x1

    iput v0, p0, Lcom/google/common/collect/Iterators$7;->count:I

    .line 974
    iget-object p0, p0, Lcom/google/common/collect/Iterators$7;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 971
    :cond_0
    new-instance p0, Ljava/util/NoSuchElementException;

    invoke-direct {p0}, Ljava/util/NoSuchElementException;-><init>()V

    throw p0
.end method

.method public remove()V
    .registers 1

    .line 979
    iget-object p0, p0, Lcom/google/common/collect/Iterators$7;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->remove()V

    return-void
.end method
