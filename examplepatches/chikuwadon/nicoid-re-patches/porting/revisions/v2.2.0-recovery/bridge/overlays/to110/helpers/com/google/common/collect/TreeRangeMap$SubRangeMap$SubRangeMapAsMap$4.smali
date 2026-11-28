.class Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap$4;
.super Lcom/google/common/collect/Maps$Values;
.source "TreeRangeMap.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;->values()Ljava/util/Collection;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/collect/Maps$Values<",
        "Lcom/google/common/collect/Range<",
        "TK;>;TV;>;"
    }
.end annotation


# instance fields
.field final synthetic this$2:Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;


# direct methods
.method constructor <init>(Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;Ljava/util/Map;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0
        }
        names = {
            "this$2",
            "map"
        }
    .end annotation

    .line 694
    iput-object p1, p0, Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap$4;->this$2:Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;

    invoke-direct {p0, p2}, Lcom/google/common/collect/Maps$Values;-><init>(Ljava/util/Map;)V

    return-void
.end method


# virtual methods
.method public removeAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 697
    iget-object p0, p0, Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap$4;->this$2:Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;

    invoke-static {p1}, Lcom/google/common/base/Predicates;->in(Ljava/util/Collection;)Lcom/google/common/base/Predicate;

    move-result-object p1

    new-instance v0, Lcom/google/common/collect/ImmutableMap$Builder$0;

    invoke-direct {v0}, Lcom/google/common/collect/ImmutableMap$Builder$0;-><init>()V

    invoke-static {p1, v0}, Lcom/google/common/base/Predicates;->compose(Lcom/google/common/base/Predicate;Lcom/google/common/base/Function;)Lcom/google/common/base/Predicate;

    move-result-object p1

    # invokes: Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;->removeEntryIf(Lcom/google/common/base/Predicate;)Z
    invoke-static {p0, p1}, Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;->access$400(Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;Lcom/google/common/base/Predicate;)Z

    move-result p0

    return p0
.end method

.method public retainAll(Ljava/util/Collection;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "c"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/Collection<",
            "*>;)Z"
        }
    .end annotation

    .line 702
    iget-object p0, p0, Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap$4;->this$2:Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;

    invoke-static {p1}, Lcom/google/common/base/Predicates;->in(Ljava/util/Collection;)Lcom/google/common/base/Predicate;

    move-result-object p1

    invoke-static {p1}, Lcom/google/common/base/Predicates;->not(Lcom/google/common/base/Predicate;)Lcom/google/common/base/Predicate;

    move-result-object p1

    new-instance v0, Lcom/google/common/collect/ImmutableMap$Builder$0;

    invoke-direct {v0}, Lcom/google/common/collect/ImmutableMap$Builder$0;-><init>()V

    invoke-static {p1, v0}, Lcom/google/common/base/Predicates;->compose(Lcom/google/common/base/Predicate;Lcom/google/common/base/Function;)Lcom/google/common/base/Predicate;

    move-result-object p1

    # invokes: Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;->removeEntryIf(Lcom/google/common/base/Predicate;)Z
    invoke-static {p0, p1}, Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;->access$400(Lcom/google/common/collect/TreeRangeMap$SubRangeMap$SubRangeMapAsMap;Lcom/google/common/base/Predicate;)Z

    move-result p0

    return p0
.end method
