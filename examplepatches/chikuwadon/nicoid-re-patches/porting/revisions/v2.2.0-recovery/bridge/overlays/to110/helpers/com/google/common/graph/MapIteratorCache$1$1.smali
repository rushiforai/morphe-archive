.class Lcom/google/common/graph/MapIteratorCache$1$1;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "MapIteratorCache.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/MapIteratorCache$1;->iterator()Lcom/google/common/collect/UnmodifiableIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/UnmodifiableIterator<",
        "TK;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/graph/MapIteratorCache$1;

.field final synthetic val$entryIterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/google/common/graph/MapIteratorCache$1;Ljava/util/Iterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$entryIterator"
        }
    .end annotation

    .line 108
    iput-object p2, p0, Lcom/google/common/graph/MapIteratorCache$1$1;->val$entryIterator:Ljava/util/Iterator;

    iput-object p1, p0, Lcom/google/common/graph/MapIteratorCache$1$1;->this$1:Lcom/google/common/graph/MapIteratorCache$1;

    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 111
    iget-object p0, p0, Lcom/google/common/graph/MapIteratorCache$1$1;->val$entryIterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public next()Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TK;"
        }
    .end annotation

    .line 116
    iget-object v0, p0, Lcom/google/common/graph/MapIteratorCache$1$1;->val$entryIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 117
    iget-object p0, p0, Lcom/google/common/graph/MapIteratorCache$1$1;->this$1:Lcom/google/common/graph/MapIteratorCache$1;

    iget-object p0, p0, Lcom/google/common/graph/MapIteratorCache$1;->this$0:Lcom/google/common/graph/MapIteratorCache;

    # setter for: Lcom/google/common/graph/MapIteratorCache;->cacheEntry:Ljava/util/Map$Entry;
    invoke-static {p0, v0}, Lcom/google/common/graph/MapIteratorCache;->access$102(Lcom/google/common/graph/MapIteratorCache;Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    .line 118
    invoke-interface {v0}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
