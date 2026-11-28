.class Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;
.super Lcom/google/common/collect/ForwardingMapEntry;
.source "Synchronized.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1;->transform(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ForwardingMapEntry<",
        "TK;",
        "Ljava/util/Collection<",
        "TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1;

.field final synthetic val$entry:Ljava/util/Map$Entry;


# direct methods
.method constructor <init>(Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1;Ljava/util/Map$Entry;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$entry"
        }
    .end annotation

    .line 928
    iput-object p2, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->val$entry:Ljava/util/Map$Entry;

    iput-object p1, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->this$1:Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1;

    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMapEntry;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 928
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected delegate()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;",
            "Ljava/util/Collection<",
            "TV;>;>;"
        }
    .end annotation

    .line 931
    iget-object p0, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->val$entry:Ljava/util/Map$Entry;

    return-object p0
.end method

.method public bridge synthetic getValue()Ljava/lang/Object;
    .registers 1

    .line 928
    invoke-virtual {p0}, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->getValue()Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method

.method public getValue()Ljava/util/Collection;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Collection<",
            "TV;>;"
        }
    .end annotation

    .line 936
    iget-object v0, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->val$entry:Ljava/util/Map$Entry;

    invoke-interface {v0}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Collection;

    iget-object p0, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1$1;->this$1:Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1;

    iget-object p0, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries$1;->this$0:Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries;

    iget-object p0, p0, Lcom/google/common/collect/Synchronized$SynchronizedAsMapEntries;->mutex:Ljava/lang/Object;

    # invokes: Lcom/google/common/collect/Synchronized;->typePreservingCollection(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/Collection;
    invoke-static {v0, p0}, Lcom/google/common/collect/Synchronized;->access$400(Ljava/util/Collection;Ljava/lang/Object;)Ljava/util/Collection;

    move-result-object p0

    return-object p0
.end method
