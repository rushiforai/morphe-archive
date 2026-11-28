.class final Lcom/google/common/graph/MapRetrievalCache;
.super Lcom/google/common/graph/MapIteratorCache;
.source "MapRetrievalCache.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/graph/MapRetrievalCache$CacheEntry;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<K:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/graph/MapIteratorCache<",
        "TK;TV;>;"
    }
.end annotation


# instance fields
.field private volatile cacheEntry1:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/MapRetrievalCache$CacheEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field

.field private volatile cacheEntry2:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/MapRetrievalCache$CacheEntry<",
            "TK;TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Ljava/util/Map;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "backingMap"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Map<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 36
    invoke-direct {p0, p1}, Lcom/google/common/graph/MapIteratorCache;-><init>(Ljava/util/Map;)V

    return-void
.end method

.method private addToCache(Lcom/google/common/graph/MapRetrievalCache$CacheEntry;)V
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
            "(",
            "Lcom/google/common/graph/MapRetrievalCache$CacheEntry<",
            "TK;TV;>;)V"
        }
    .end annotation

    .line 97
    iget-object v0, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry1:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    iput-object v0, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry2:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    .line 98
    iput-object p1, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry1:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    return-void
.end method

.method private addToCache(Ljava/lang/Object;Ljava/lang/Object;)V
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
            "(TK;TV;)V"
        }
    .end annotation

    .line 92
    new-instance v0, Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    invoke-direct {v0, p1, p2}, Lcom/google/common/graph/MapRetrievalCache$CacheEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-direct {p0, v0}, Lcom/google/common/graph/MapRetrievalCache;->addToCache(Lcom/google/common/graph/MapRetrievalCache$CacheEntry;)V

    return-void
.end method


# virtual methods
.method clearCache()V
    .registers 2

    .line 86
    invoke-super {p0}, Lcom/google/common/graph/MapIteratorCache;->clearCache()V

    const/4 v0, 0x0

    .line 87
    iput-object v0, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry1:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    .line 88
    iput-object v0, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry2:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    return-void
.end method

.method get(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 3
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
            ")TV;"
        }
    .end annotation

    .line 42
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 43
    invoke-virtual {p0, p1}, Lcom/google/common/graph/MapRetrievalCache;->getIfCached(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 48
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/MapRetrievalCache;->getWithoutCaching(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1

    .line 50
    invoke-direct {p0, p1, v0}, Lcom/google/common/graph/MapRetrievalCache;->addToCache(Ljava/lang/Object;Ljava/lang/Object;)V

    :cond_1
    return-object v0
.end method

.method getIfCached(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 4
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
            ")TV;"
        }
    .end annotation

    .line 60
    invoke-super {p0, p1}, Lcom/google/common/graph/MapIteratorCache;->getIfCached(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_0

    return-object v0

    .line 70
    :cond_0
    iget-object v0, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry1:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    if-eqz v0, :cond_1

    .line 71
    iget-object v1, v0, Lcom/google/common/graph/MapRetrievalCache$CacheEntry;->key:Ljava/lang/Object;

    if-ne v1, p1, :cond_1

    .line 72
    iget-object p0, v0, Lcom/google/common/graph/MapRetrievalCache$CacheEntry;->value:Ljava/lang/Object;

    return-object p0

    .line 74
    :cond_1
    iget-object v0, p0, Lcom/google/common/graph/MapRetrievalCache;->cacheEntry2:Lcom/google/common/graph/MapRetrievalCache$CacheEntry;

    if-eqz v0, :cond_2

    .line 75
    iget-object v1, v0, Lcom/google/common/graph/MapRetrievalCache$CacheEntry;->key:Ljava/lang/Object;

    if-ne v1, p1, :cond_2

    .line 78
    invoke-direct {p0, v0}, Lcom/google/common/graph/MapRetrievalCache;->addToCache(Lcom/google/common/graph/MapRetrievalCache$CacheEntry;)V

    .line 79
    iget-object p0, v0, Lcom/google/common/graph/MapRetrievalCache$CacheEntry;->value:Ljava/lang/Object;

    return-object p0

    :cond_2
    const/4 p0, 0x0

    return-object p0
.end method
