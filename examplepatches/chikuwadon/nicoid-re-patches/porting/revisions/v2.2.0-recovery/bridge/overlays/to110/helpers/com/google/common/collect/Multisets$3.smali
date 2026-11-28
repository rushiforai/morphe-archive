.class Lcom/google/common/collect/Multisets$3;
.super Lcom/google/common/collect/Multisets$ViewMultiset;
.source "Multisets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Multisets;->sum(Lcom/google/common/collect/Multiset;Lcom/google/common/collect/Multiset;)Lcom/google/common/collect/Multiset;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Multisets$ViewMultiset<",
        "TE;>;"
    }
.end annotation


# instance fields
.field final synthetic val$multiset1:Lcom/google/common/collect/Multiset;

.field final synthetic val$multiset2:Lcom/google/common/collect/Multiset;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Multiset;Lcom/google/common/collect/Multiset;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$multiset1",
            "val$multiset2"
        }
    .end annotation

    .line 536
    iput-object p1, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    iput-object p2, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/common/collect/Multisets$ViewMultiset;-><init>(Lcom/google/common/collect/Multisets$1;)V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .line 539
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multiset;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Multiset;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_0

    const/4 p0, 0x0

    return p0

    :cond_0
    const/4 p0, 0x1

    return p0
.end method

.method public count(Ljava/lang/Object;)I
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "element"
        }
    .end annotation

    .line 554
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    invoke-interface {v0, p1}, Lcom/google/common/collect/Multiset;->count(Ljava/lang/Object;)I

    move-result v0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    invoke-interface {p0, p1}, Lcom/google/common/collect/Multiset;->count(Ljava/lang/Object;)I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0
.end method

.method elementIterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "TE;>;"
        }
    .end annotation

    .line 564
    new-instance p0, Ljava/lang/AssertionError;

    const-string v0, "should never be called"

    invoke-direct {p0, v0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p0
.end method

.method public elementSet()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 559
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->elementSet()Ljava/util/Set;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    invoke-interface {p0}, Lcom/google/common/collect/Multiset;->elementSet()Ljava/util/Set;

    move-result-object p0

    invoke-static {v0, p0}, Lcom/google/common/collect/Sets;->union(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object p0

    return-object p0
.end method

.method internalEntryIterator()Ljava/util/Iterator;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/collect/Multiset$Entry<",
            "TE;>;>;"
        }
    .end annotation

    .line 569
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 570
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 571
    new-instance v1, Lcom/google/common/collect/Multisets$3$1;

    iget-object v4, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    iget-object v6, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/common/collect/Multisets$3$1;-><init>(Lcom/google/common/collect/Multisets$3;Ljava/util/Iterator;Lcom/google/common/collect/Multiset;Ljava/util/Iterator;Lcom/google/common/collect/Multiset;)V

    return-object v1
.end method

.method public isEmpty()Z
    .registers 2

    .line 544
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    invoke-interface {p0}, Lcom/google/common/collect/Multiset;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public size()I
    .registers 2

    .line 549
    iget-object v0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset1:Lcom/google/common/collect/Multiset;

    invoke-interface {v0}, Lcom/google/common/collect/Multiset;->size()I

    move-result v0

    iget-object p0, p0, Lcom/google/common/collect/Multisets$3;->val$multiset2:Lcom/google/common/collect/Multiset;

    invoke-interface {p0}, Lcom/google/common/collect/Multiset;->size()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0
.end method
