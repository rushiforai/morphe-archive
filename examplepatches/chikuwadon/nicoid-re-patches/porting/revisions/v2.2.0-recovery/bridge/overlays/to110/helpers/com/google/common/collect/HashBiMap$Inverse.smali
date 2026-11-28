.class final Lcom/google/common/collect/HashBiMap$Inverse;
.super Ljava/util/AbstractMap;
.source "HashBiMap.java"

# interfaces
.implements Lcom/google/common/collect/BiMap;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/HashBiMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "Inverse"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractMap<",
        "TV;TK;>;",
        "Lcom/google/common/collect/BiMap<",
        "TV;TK;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# instance fields
.field private transient inverseEntrySet:Ljava/util/Set;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TV;TK;>;>;"
        }
    .end annotation
.end field

.field final obverse:Lcom/google/common/collect/HashBiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/HashBiMap;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obverse"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/HashBiMap<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 980
    invoke-direct {p0}, Ljava/util/AbstractMap;-><init>()V

    .line 981
    iput-object p1, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    return-void
.end method

.method private readObject(Ljava/io/ObjectInputStream;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "in"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/ClassNotFoundException;,
            Ljava/io/IOException;
        }
    .end annotation

    .line 1063
    invoke-virtual {p1}, Ljava/io/ObjectInputStream;->defaultReadObject()V

    .line 1064
    iget-object p1, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    # setter for: Lcom/google/common/collect/HashBiMap;->inverse:Lcom/google/common/collect/BiMap;
    invoke-static {p1, p0}, Lcom/google/common/collect/HashBiMap;->access$1502(Lcom/google/common/collect/HashBiMap;Lcom/google/common/collect/BiMap;)Lcom/google/common/collect/BiMap;

    return-void
.end method


# virtual methods
.method public clear()V
    .registers 1

    .line 1037
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap;->clear()V

    return-void
.end method

.method public containsKey(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 992
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap;->containsValue(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public containsValue(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .line 998
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public entrySet()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Ljava/util/Map$Entry<",
            "TV;TK;>;>;"
        }
    .end annotation

    .line 1054
    iget-object v0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->inverseEntrySet:Ljava/util/Set;

    if-nez v0, :cond_0

    .line 1056
    new-instance v0, Lcom/google/common/collect/HashBiMap$InverseEntrySet;

    iget-object v1, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-direct {v0, v1}, Lcom/google/common/collect/HashBiMap$InverseEntrySet;-><init>(Lcom/google/common/collect/HashBiMap;)V

    iput-object v0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->inverseEntrySet:Ljava/util/Set;

    :cond_0
    return-object v0
.end method

.method public forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TK;)TK;"
        }
    .end annotation

    .line 1020
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    const/4 v0, 0x1

    # invokes: Lcom/google/common/collect/HashBiMap;->putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    invoke-static {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->access$1300(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    .line 1004
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0, p1}, Lcom/google/common/collect/HashBiMap;->getInverse(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public inverse()Lcom/google/common/collect/BiMap;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/BiMap<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1032
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    return-object p0
.end method

.method public keySet()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 1042
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap;->values()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "key",
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;TK;)TK;"
        }
    .end annotation

    .line 1012
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    const/4 v0, 0x0

    # invokes: Lcom/google/common/collect/HashBiMap;->putInverse(Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;
    invoke-static {p0, p1, p2, v0}, Lcom/google/common/collect/HashBiMap;->access$1300(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public remove(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/Object;",
            ")TK;"
        }
    .end annotation

    .line 1027
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    # invokes: Lcom/google/common/collect/HashBiMap;->removeInverse(Ljava/lang/Object;)Ljava/lang/Object;
    invoke-static {p0, p1}, Lcom/google/common/collect/HashBiMap;->access$1400(Lcom/google/common/collect/HashBiMap;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 986
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    # getter for: Lcom/google/common/collect/HashBiMap;->size:I
    invoke-static {p0}, Lcom/google/common/collect/HashBiMap;->access$200(Lcom/google/common/collect/HashBiMap;)I

    move-result p0

    return p0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 1

    .line 976
    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap$Inverse;->values()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public values()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TK;>;"
        }
    .end annotation

    .line 1047
    iget-object p0, p0, Lcom/google/common/collect/HashBiMap$Inverse;->obverse:Lcom/google/common/collect/HashBiMap;

    invoke-virtual {p0}, Lcom/google/common/collect/HashBiMap;->keySet()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
