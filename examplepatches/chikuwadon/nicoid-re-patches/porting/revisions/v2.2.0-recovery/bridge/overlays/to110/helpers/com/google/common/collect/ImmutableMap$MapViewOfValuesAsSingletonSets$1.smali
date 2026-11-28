.class Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;
.super Lcom/google/common/collect/UnmodifiableIterator;
.source "ImmutableMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets;->entryIterator()Lcom/google/common/collect/UnmodifiableIterator;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/UnmodifiableIterator<",
        "Ljava/util/Map$Entry<",
        "TK;",
        "Lcom/google/common/collect/ImmutableSet<",
        "TV;>;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets;

.field final synthetic val$backingIterator:Ljava/util/Iterator;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets;Ljava/util/Iterator;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$1",
            "val$backingIterator"
        }
    .end annotation

    .line 1072
    iput-object p2, p0, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;->val$backingIterator:Ljava/util/Iterator;

    iput-object p1, p0, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;->this$1:Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets;

    invoke-direct {p0}, Lcom/google/common/collect/UnmodifiableIterator;-><init>()V

    return-void
.end method


# virtual methods
.method public hasNext()Z
    .registers 1

    .line 1075
    iget-object p0, p0, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;->val$backingIterator:Ljava/util/Iterator;

    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result p0

    return p0
.end method

.method public bridge synthetic next()Ljava/lang/Object;
    .registers 1

    .line 1072
    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;->next()Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public next()Ljava/util/Map$Entry;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Map$Entry<",
            "TK;",
            "Lcom/google/common/collect/ImmutableSet<",
            "TV;>;>;"
        }
    .end annotation

    .line 1080
    iget-object v0, p0, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;->val$backingIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/util/Map$Entry;

    .line 1081
    new-instance v1, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1$1;

    invoke-direct {v1, p0, v0}, Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1$1;-><init>(Lcom/google/common/collect/ImmutableMap$MapViewOfValuesAsSingletonSets$1;Ljava/util/Map$Entry;)V

    return-object v1
.end method
