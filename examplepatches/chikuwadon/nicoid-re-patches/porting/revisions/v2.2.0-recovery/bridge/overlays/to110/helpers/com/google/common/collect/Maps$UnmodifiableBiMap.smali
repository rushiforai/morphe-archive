.class final Lcom/google/common/collect/Maps$UnmodifiableBiMap;
.super Lcom/google/common/collect/ForwardingMap;
.source "Maps.java"

# interfaces
.implements Lcom/google/common/collect/BiMap;
.implements Ljava/io/Serializable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/collect/Maps;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "UnmodifiableBiMap"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/ForwardingMap<",
        "TK;TV;>;",
        "Lcom/google/common/collect/BiMap<",
        "TK;TV;>;",
        "Ljava/io/Serializable;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J


# instance fields
.field final delegate:Lcom/google/common/collect/BiMap;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap<",
            "+TK;+TV;>;"
        }
    .end annotation
.end field

.field inverse:Lcom/google/common/collect/BiMap;
    .annotation runtime Lcom/google/errorprone/annotations/concurrent/LazyInit;
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/collect/BiMap<",
            "TV;TK;>;"
        }
    .end annotation
.end field

.field final unmodifiableMap:Ljava/util/Map;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/collect/BiMap;Lcom/google/common/collect/BiMap;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "delegate",
            "inverse"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/collect/BiMap<",
            "+TK;+TV;>;",
            "Lcom/google/common/collect/BiMap<",
            "TV;TK;>;)V"
        }
    .end annotation

    .line 1669
    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMap;-><init>()V

    .line 1670
    invoke-static {p1}, Ljava/util/Collections;->unmodifiableMap(Ljava/util/Map;)Ljava/util/Map;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->unmodifiableMap:Ljava/util/Map;

    .line 1671
    iput-object p1, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->delegate:Lcom/google/common/collect/BiMap;

    .line 1672
    iput-object p2, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->inverse:Lcom/google/common/collect/BiMap;

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 1662
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->delegate()Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method protected delegate()Ljava/util/Map;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map<",
            "TK;TV;>;"
        }
    .end annotation

    .line 1677
    iget-object p0, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->unmodifiableMap:Ljava/util/Map;

    return-object p0
.end method

.method public forcePut(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
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
            "(TK;TV;)TV;"
        }
    .end annotation

    .line 1682
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public inverse()Lcom/google/common/collect/BiMap;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/BiMap<",
            "TV;TK;>;"
        }
    .end annotation

    .line 1687
    iget-object v0, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->inverse:Lcom/google/common/collect/BiMap;

    if-nez v0, :cond_0

    .line 1689
    new-instance v0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;

    iget-object v1, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->delegate:Lcom/google/common/collect/BiMap;

    invoke-interface {v1}, Lcom/google/common/collect/BiMap;->inverse()Lcom/google/common/collect/BiMap;

    move-result-object v1

    invoke-direct {v0, v1, p0}, Lcom/google/common/collect/Maps$UnmodifiableBiMap;-><init>(Lcom/google/common/collect/BiMap;Lcom/google/common/collect/BiMap;)V

    iput-object v0, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->inverse:Lcom/google/common/collect/BiMap;

    :cond_0
    return-object v0
.end method

.method public bridge synthetic values()Ljava/util/Collection;
    .registers 1

    .line 1662
    invoke-virtual {p0}, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->values()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public values()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TV;>;"
        }
    .end annotation

    .line 1696
    iget-object p0, p0, Lcom/google/common/collect/Maps$UnmodifiableBiMap;->delegate:Lcom/google/common/collect/BiMap;

    invoke-interface {p0}, Lcom/google/common/collect/BiMap;->values()Ljava/util/Set;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
