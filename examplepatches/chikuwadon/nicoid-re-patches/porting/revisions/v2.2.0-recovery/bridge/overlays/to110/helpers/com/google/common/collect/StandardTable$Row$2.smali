.class Lcom/google/common/collect/StandardTable$Row$2;
.super Lcom/google/common/collect/ForwardingMapEntry;
.source "StandardTable.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/StandardTable$Row;->wrapEntry(Ljava/util/Map$Entry;)Ljava/util/Map$Entry;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ForwardingMapEntry<",
        "TC;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/StandardTable$Row;

.field final synthetic val$entry:Ljava/util/Map$Entry;


# direct methods
.method constructor <init>(Lcom/google/common/collect/StandardTable$Row;Ljava/util/Map$Entry;)V
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

    .line 409
    iput-object p2, p0, Lcom/google/common/collect/StandardTable$Row$2;->val$entry:Ljava/util/Map$Entry;

    iput-object p1, p0, Lcom/google/common/collect/StandardTable$Row$2;->this$1:Lcom/google/common/collect/StandardTable$Row;

    invoke-direct {p0}, Lcom/google/common/collect/ForwardingMapEntry;-><init>()V

    return-void
.end method


# virtual methods
.method protected bridge synthetic delegate()Ljava/lang/Object;
    .registers 1

    .line 409
    invoke-virtual {p0}, Lcom/google/common/collect/StandardTable$Row$2;->delegate()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method protected delegate()Ljava/util/Map$Entry;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TC;TV;>;"
        }
    .end annotation

    .line 412
    iget-object p0, p0, Lcom/google/common/collect/StandardTable$Row$2;->val$entry:Ljava/util/Map$Entry;

    return-object p0
.end method

.method public equals(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "object"
        }
    .end annotation

    .line 423
    invoke-virtual {p0, p1}, Lcom/google/common/collect/StandardTable$Row$2;->standardEquals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public setValue(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "value"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TV;)TV;"
        }
    .end annotation

    .line 417
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-super {p0, p1}, Lcom/google/common/collect/ForwardingMapEntry;->setValue(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
