.class Lcom/google/common/collect/StandardTable$Row$1;
.super Ljava/lang/Object;
.source "StandardTable.java"

# interfaces
.implements Ljava/util/Iterator;


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/StandardTable$Row;->entryIterator()Ljava/util/Iterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/lang/Object;",
        "Ljava/util/Iterator<",
        "Ljava/util/Map$Entry<",
        "TC;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/StandardTable$Row;

.field final synthetic val$iterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/StandardTable$Row;Ljava/util/Iterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$iterator"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()V"
        }
    .end annotation

    .line 389
    iput-object p2, p0, Lcom/google/common/collect/StandardTable$Row$1;->val$iterator:Ljava/util/Iterator;

    iput-object p1, p0, Lcom/google/common/collect/StandardTable$Row$1;->this$1:Lcom/google/common/collect/StandardTable$Row;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 392
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row$1;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 389
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row$1;->next()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/util/Map$Entry;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TC;TV;>;"
        }
    .end annotation

    .line 397
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row$1;->this$1:Lcom/google/common/collect/StandardTable$Row;

    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row$1;->val$iterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/Map$Entry;

    invoke-virtual {v0, p0}, Lcom/google/common/collect/StandardTable$Row;->wrapEntry(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public remove()V
    .registers 2

    .line 402
    iget-object v0, p0, Lcom/google/common/collect/StandardTable$Row$1;->val$iterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->remove()V

    .line 403
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row$1;->this$1:Lcom/google/common/collect/StandardTable$Row;

    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row;->maintainEmptyInvariant()V

    return-void
.end method
