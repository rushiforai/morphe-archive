.class final Lcom/google/common/collect/HashBiMap$EntrySet;
.super Lcom/google/common/collect/HashBiMap$View;
.source "HashBiMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/HashBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x12
    name = "EntrySet"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/HashBiMap$View<",
        "TK;TV;",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/collect/HashBiMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/HashBiMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 857
    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    .line 858
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

    .line 863
    instance-of v0, p1, Ljava/util/Map$Entry;

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    .line 864
    check-cast p1, Ljava/util/Map$Entry;

    .line 865
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 866
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    .line 867
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;)I
    invoke-static {v2, v0}, Lcom/google/common/collect/HashBiMap;->access$1100(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 868
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {p0}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object p0

    aget-object p0, p0, v0

    invoke-static {p1, p0}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

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

    .line 856
    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap$EntrySet;->forEntry(I)Ljava/util/Map$Entry;

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
            "TK;TV;>;"
        }
    .end annotation

    .line 892
    new-instance v0, Lcom/google/common/collect/HashBiMap$EntryForKey;

    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    invoke-direct {v0, p0, p1}, Lcom/google/common/collect/HashBiMap$EntryForKey;-><init>(Lcom/google/common/collect/HashBiMap;I)V

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

    .line 876
    instance-of v0, p1, Ljava/util/Map$Entry;

    if-eqz v0, :cond_0

    .line 877
    check-cast p1, Ljava/util/Map$Entry;

    .line 878
    invoke-interface {p1}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v0

    .line 879
    invoke-interface {p1}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p1

    .line 880
    invoke-static {v0}, Lcom/google/common/collect/Hashing;->smearedHash(Ljava/lang/Object;)I

    move-result v1

    .line 881
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    # invokes: Lcom/google/common/collect/HashBiMap;->findEntryByKey(Ljava/lang/Object;I)I
    invoke-static {v2, v0, v1}, Lcom/google/common/collect/HashBiMap;->access$600(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;I)I

    move-result v0

    const/4 v2, -0x1

    if-eq v0, v2, :cond_0

    .line 882
    iget-object v2, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->values:[Ljava/lang/Object;
    invoke-static {v2}, Lcom/google/common/collect/HashBiMap;->access$800(Lcom/google/common/collect/HashBiMap;)[Ljava/lang/Object;

    move-result-object v2

    aget-object v2, v2, v0

    invoke-static {p1, v2}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 883
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$EntrySet;->this$0:Lcom/google/common/collect/HashBiMap;

    # invokes: Lcom/google/common/collect/HashBiMap;->removeEntryKeyHashKnown(II)V
    invoke-static {p0, v0, v1}, Lcom/google/common/collect/HashBiMap;->access$700(Lcom/google/common/collect/HashBiMap;II)V

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method
