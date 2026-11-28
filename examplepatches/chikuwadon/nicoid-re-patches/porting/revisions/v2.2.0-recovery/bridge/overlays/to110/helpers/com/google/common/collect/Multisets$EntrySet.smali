.class abstract Lcom/google/common/collect/Multisets$EntrySet;
.super Lcom/google/common/collect/Sets$ImprovedAbstractSet;
.source "Multisets.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Multisets;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x408
    name = "EntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/Sets$ImprovedAbstractSet<",
        "Lcom/google/common/collect/Multiset$Entry<",
        "TE;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 1028
    invoke-direct {p0}, Lcom/google/common/collect/Sets$ImprovedAbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public final clear()V
    .registers 1

    .line 1064
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$EntrySet;->multiset()Lcom/google/common/collect/Multiset;

    move-result-object p0

    invoke-interface {p0}, Lcom/google/common/collect/Multiset;->clear()V

    return-void
.end method

.method public final contains(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1034
    instance-of v0, p1, Lcom/google/common/collect/Multiset$Entry;

    const/4 v1, 0x0

    if-eqz v0, :cond_1

    .line 1035
    check-cast p1, Lcom/google/common/collect/Multiset$Entry;

    .line 1036
    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result v0

    if-gtz v0, :cond_0

    return v1

    .line 1039
    :cond_0
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$EntrySet;->multiset()Lcom/google/common/collect/Multiset;

    move-result-object p0

    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    invoke-interface {p0, v0}, Lcom/google/common/collect/Multiset;->count(Ljava/lang/Object;)I

    move-result p0

    .line 1040
    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result p1

    if-ne p0, p1, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method abstract multiset()Lcom/google/common/collect/Multiset;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/Multiset<",
            "TE;>;"
        }
    .end annotation
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 1047
    instance-of v0, p1, Lcom/google/common/collect/Multiset$Entry;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1048
    check-cast p1, Lcom/google/common/collect/Multiset$Entry;

    .line 1049
    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getElement()Ljava/lang/Object;

    move-result-object v0

    .line 1050
    invoke-interface {p1}, Lcom/google/common/collect/Multiset$Entry;->getCount()I

    move-result p1

    if-eqz p1, :cond_0

    .line 1055
    invoke-virtual {p0}, Lcom/google/common/collect/Multisets$EntrySet;->multiset()Lcom/google/common/collect/Multiset;

    move-result-object p0

    .line 1056
    invoke-interface {p0, v0, p1, v1}, Lcom/google/common/collect/Multiset;->setCount(Ljava/lang/Object;II)Z

    move-result p0

    return p0

    :cond_0
    return v1
.end method
