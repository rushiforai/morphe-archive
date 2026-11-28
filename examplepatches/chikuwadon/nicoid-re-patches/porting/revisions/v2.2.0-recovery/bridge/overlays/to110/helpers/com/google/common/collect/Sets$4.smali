.class Lcom/google/common/collect/Sets$4;
.super Lcom/google/common/collect/Sets$SetView;
.source "Sets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Sets;->symmetricDifference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Sets$SetView<",
        "TE;>;"
    }
.end annotation


# instance fields
.field final synthetic val$set1:Ljava/util/Set;

.field final synthetic val$set2:Ljava/util/Set;


# direct methods
.method constructor <init>(Ljava/util/Set;Ljava/util/Set;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010,
            0x1010
        }
        names = {
            "val$set1",
            "val$set2"
        }
    .end annotation

    .line 1062
    iput-object p1, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    iput-object p2, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    const/4 p1, 0x0

    invoke-direct {p0, p1}, Lcom/google/common/collect/Sets$SetView;-><init>(Lcom/google/common/collect/Sets$1;)V

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

    .line 1110
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    iget-object p0, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    xor-int/2addr v0, p0

    return v0
.end method

.method public isEmpty()Z
    .registers 2

    .line 1105
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    iget-object p0, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TE;>;"
        }
    .end annotation

    .line 1065
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v3

    .line 1066
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v5

    .line 1067
    new-instance v1, Lcom/google/common/collect/Sets$4$1;

    iget-object v4, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    iget-object v6, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    move-object v2, p0

    invoke-direct/range {v1 .. v6}, Lcom/google/common/collect/Sets$4$1;-><init>(Lcom/google/common/collect/Sets$4;Ljava/util/Iterator;Ljava/util/Set;Ljava/util/Iterator;Ljava/util/Set;)V

    return-object v1
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 1062
    invoke-virtual {p0}, Lcom/google/common/collect/Sets$4;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method maxSize()I
    .registers 2

    .line 1121
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-static {v0}, Lcom/google/common/collect/Sets$4;->maxSize(Ljava/util/Set;)I

    move-result v0

    iget-object p0, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-static {p0}, Lcom/google/common/collect/Sets$4;->maxSize(Ljava/util/Set;)I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0
.end method

.method minSize()I
    .registers 3

    .line 1115
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-static {v0}, Lcom/google/common/collect/Sets$4;->minSize(Ljava/util/Set;)I

    move-result v0

    iget-object v1, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-static {v1}, Lcom/google/common/collect/Sets$4;->maxSize(Ljava/util/Set;)I

    move-result v1

    sub-int/2addr v0, v1

    if-ltz v0, :cond_0

    return v0

    .line 1116
    :cond_0
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-static {v0}, Lcom/google/common/collect/Sets$4;->minSize(Ljava/util/Set;)I

    move-result v0

    iget-object p0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-static {p0}, Lcom/google/common/collect/Sets$4;->maxSize(Ljava/util/Set;)I

    move-result p0

    sub-int/2addr v0, p0

    const/4 p0, 0x0

    invoke-static {v0, p0}, Ljava/lang/Math;->max(II)I

    move-result p0

    return p0
.end method

.method public size()I
    .registers 5

    .line 1090
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_0
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1091
    iget-object v3, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_0

    add-int/lit8 v1, v1, 0x1

    goto :goto_0

    .line 1095
    :cond_1
    iget-object v0, p0, Lcom/google/common/collect/Sets$4;->val$set2:Ljava/util/Set;

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_2
    :goto_1
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_3

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    .line 1096
    iget-object v3, p0, Lcom/google/common/collect/Sets$4;->val$set1:Ljava/util/Set;

    invoke-interface {v3, v2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-nez v2, :cond_2

    add-int/lit8 v1, v1, 0x1

    goto :goto_1

    :cond_3
    return v1
.end method
