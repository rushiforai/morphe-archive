.class Lcom/google/common/graph/MapIteratorCache$1;
.super Ljava/util/AbstractSet;
.source "MapIteratorCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/MapIteratorCache;->unmodifiableKeySet()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/graph/MapIteratorCache;


# direct methods
.method constructor <init>(Lcom/google/common/graph/MapIteratorCache;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 103
    iput-object p1, p0, Lcom/google/common/graph/MapIteratorCache$1;->this$0:Lcom/google/common/graph/MapIteratorCache;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "key"
        }
    .end annotation

    .line 130
    iget-object p0, p0, Lcom/google/common/graph/MapIteratorCache$1;->this$0:Lcom/google/common/graph/MapIteratorCache;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/MapIteratorCache;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TK;>;"
        }
    .end annotation

    .line 106
    iget-object v0, p0, Lcom/google/common/graph/MapIteratorCache$1;->this$0:Lcom/google/common/graph/MapIteratorCache;

    # getter for: Lcom/google/common/graph/MapIteratorCache;->backingMap:Ljava/util/Map;
    invoke-static {v0}, Lcom/google/common/graph/MapIteratorCache;->access$000(Lcom/google/common/graph/MapIteratorCache;)Ljava/util/Map;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Map;->entrySet()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 108
    new-instance v1, Lcom/google/common/graph/MapIteratorCache$1$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/graph/MapIteratorCache$1$1;-><init>(Lcom/google/common/graph/MapIteratorCache$1;Ljava/util/Iterator;)V

    return-object v1
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 103
    invoke-virtual {p0}, Lcom/google/common/graph/MapIteratorCache$1;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 125
    iget-object p0, p0, Lcom/google/common/graph/MapIteratorCache$1;->this$0:Lcom/google/common/graph/MapIteratorCache;

    # getter for: Lcom/google/common/graph/MapIteratorCache;->backingMap:Ljava/util/Map;
    invoke-static {p0}, Lcom/google/common/graph/MapIteratorCache;->access$000(Lcom/google/common/graph/MapIteratorCache;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    return p0
.end method
