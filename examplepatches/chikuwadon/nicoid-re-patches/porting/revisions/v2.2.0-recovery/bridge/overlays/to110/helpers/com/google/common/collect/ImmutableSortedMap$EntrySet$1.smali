.class Lcom/google/common/collect/ImmutableSortedMap$EntrySet$1;
.super Lcom/google/common/collect/ImmutableList;
.source "ImmutableSortedMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/ImmutableSortedMap$EntrySet;->createAsList()Lcom/google/common/collect/ImmutableList;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/ImmutableList<",
        "Ljava/util/Map$Entry<",
        "TK;TV;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$1:Lcom/google/common/collect/ImmutableSortedMap$EntrySet;


# direct methods
.method constructor <init>(Lcom/google/common/collect/ImmutableSortedMap$EntrySet;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$1"
        }
    .end annotation

    .line 893
    iput-object p1, p0, Lcom/google/common/collect/ImmutableSortedMap$EntrySet$1;->this$1:Lcom/google/common/collect/ImmutableSortedMap$EntrySet;

    invoke-direct {p0}, Lcom/google/common/collect/ImmutableList;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic get(I)Ljava/lang/Object;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "index"
        }
    .end annotation

    .line 893
    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableSortedMap$EntrySet$1;->get(I)Ljava/util/Map$Entry;

    move-result-object p0

    return-object p0
.end method

.method public get(I)Ljava/util/Map$Entry;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "index"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Ljava/util/Map$Entry<",
            "TK;TV;>;"
        }
    .end annotation

    .line 896
    new-instance v0, Ljava/util/AbstractMap$SimpleImmutableEntry;

    iget-object v1, p0, Lcom/google/common/collect/ImmutableSortedMap$EntrySet$1;->this$1:Lcom/google/common/collect/ImmutableSortedMap$EntrySet;

    iget-object v1, v1, Lcom/google/common/collect/ImmutableSortedMap$EntrySet;->this$0:Lcom/google/common/collect/ImmutableSortedMap;

    .line 897
    # getter for: Lcom/google/common/collect/ImmutableSortedMap;->keySet:Lcom/google/common/collect/RegularImmutableSortedSet;
    invoke-static {v1}, Lcom/google/common/collect/ImmutableSortedMap;->access$200(Lcom/google/common/collect/ImmutableSortedMap;)Lcom/google/common/collect/RegularImmutableSortedSet;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/RegularImmutableSortedSet;->asList()Lcom/google/common/collect/ImmutableList;

    move-result-object v1

    invoke-virtual {v1, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object v1

    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$EntrySet$1;->this$1:Lcom/google/common/collect/ImmutableSortedMap$EntrySet;

    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$EntrySet;->this$0:Lcom/google/common/collect/ImmutableSortedMap;

    # getter for: Lcom/google/common/collect/ImmutableSortedMap;->valueList:Lcom/google/common/collect/ImmutableList;
    invoke-static {p0}, Lcom/google/common/collect/ImmutableSortedMap;->access$300(Lcom/google/common/collect/ImmutableSortedMap;)Lcom/google/common/collect/ImmutableList;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/collect/ImmutableList;->get(I)Ljava/lang/Object;

    move-result-object p0

    invoke-direct {v0, v1, p0}, Ljava/util/AbstractMap$SimpleImmutableEntry;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method isPartialView()Z
    .registers 1

    const/4 p0, 0x1

    return p0
.end method

.method public size()I
    .registers 1

    .line 907
    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$EntrySet$1;->this$1:Lcom/google/common/collect/ImmutableSortedMap$EntrySet;

    iget-object p0, p0, Lcom/google/common/collect/ImmutableSortedMap$EntrySet;->this$0:Lcom/google/common/collect/ImmutableSortedMap;

    invoke-virtual {p0}, Lcom/google/common/collect/ImmutableSortedMap;->size()I

    move-result p0

    return p0
.end method

.method writeReplace()Ljava/lang/Object;
    .registers 1

    .line 916
    invoke-super {p0}, Lcom/google/common/collect/ImmutableList;->writeReplace()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
