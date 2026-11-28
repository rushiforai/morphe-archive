.class final Lcom/google/common/collect/HashBiMap$InverseEntrySet;
.super Lcom/google/common/collect/HashBiMap$View;
.source "HashBiMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/HashBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "InverseEntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/HashBiMap$View<",
        "TK;TV;",
        "Ljava/util/Map$Entry<",
        "TV;TK;>;>;"
    }
.end annotation


# direct methods
.method constructor <init>(Lcom/google/common/collect/HashBiMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "biMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 1071
    invoke-direct {p0, p1}, Lcom/google/common/collect/HashBiMap$View;-><init>(Lcom/google/common/collect/HashBiMap;)V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1076
    instance-of v0, p1, Ljava/util/Map$Entry;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 1077
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$InverseEntrySet;->biMap:Lcom/google/common/collect/HashBiMap;

    .line 1078
    check-cast p1, Ljava/util/Map$Entry;

    .line 1079
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 1080
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    .line 1081
    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;)I
    invoke-static {p0, v0}, Lcom/google/common/collect/HashBiMap;->access$1600(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 1082
    # getter for: Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;
    invoke-static {p0}, Lcom/google/common/collect/HashBiMap;->access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object p0

    aget-object p0, p0, v0

    invoke-static {p0, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    return v1
.end method

.method bridge synthetic forEntry(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "entry"
        }
    .end annotation

    .line 1068
    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap$InverseEntrySet;->forEntry(I)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method forEntry(I)Ljava/util/Map$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "entry"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "TV;TK;>;"
        }
    .end annotation

    .line 1106
    new-instance v0, Lcom/google/common/collect/HashBiMap$EntryForValue;

    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$InverseEntrySet;->biMap:Lcom/google/common/collect/HashBiMap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/HashBiMap$EntryForValue;-><init>(Lcom/google/common/collect/HashBiMap;I)V

    return-object v0
.end method

.method public remove(Ljava/lang/Object;)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 1089
    instance-of v0, p1, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    .line 1090
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$InverseEntrySet;->biMap:Lcom/google/common/collect/HashBiMap;

    .line 1091
    check-cast p1, Ljava/util/Map$Entry;

    .line 1092
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 1093
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    .line 1094
    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v1

    .line 1095
    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByValue(Ljava/lang/Object;I)I
    invoke-static {p0, v0, v1}, Lcom/google/common/collect/HashBiMap;->access$900(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 1096
    # getter for: Lcom/google/common/collect/HashBiMap;->keys:[Ljava/lang/Object;
    invoke-static {p0}, Lcom/google/common/collect/HashBiMap;->access$500(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-static {v2, p1}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 1097
    # invokes: Lcom/google/common/collect/HashBiMap;->removeEntryValueHashKnown(II)V
    invoke-static {p0, v0, v1}, Lcom/google/common/collect/HashBiMap;->access$1000(Lcom/google/common/collect/HashBiMap;II)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
