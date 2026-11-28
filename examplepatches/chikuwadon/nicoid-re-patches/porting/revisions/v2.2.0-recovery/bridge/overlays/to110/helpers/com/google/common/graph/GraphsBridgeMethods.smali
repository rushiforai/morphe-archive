.class abstract Lcom/google/common/graph/GraphsBridgeMethods;
.super Ljava/lang/Object;
.source "GraphsBridgeMethods.java"


# direct methods
.method constructor <init>()V
    .registers 1

    .line 9
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public static reachableNodes(Lcom/google/common/graph/Graph;Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "graph",
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/graph/Graph<",
            "TN;>;TN;)",
            "Ljava/util/Set<",
            "TN;>;"
        }
    .end annotation

    .line 18
    invoke-static {p0, p1}, Lcom/google/common/graph/Graphs;->reachableNodes(Lcom/google/common/graph/Graph;Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0
.end method

.method public static transitiveClosure(Lcom/google/common/graph/Graph;)Lcom/google/common/graph/Graph;
    .registers 1
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "graph"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/graph/Graph<",
            "TN;>;)",
            "Lcom/google/common/graph/Graph<",
            "TN;>;"
        }
    .end annotation

    .line 13
    invoke-static {p0}, Lcom/google/common/graph/Graphs;->transitiveClosure(Lcom/google/common/graph/Graph;)Lcom/google/common/graph/ImmutableGraph;

    move-result-object p0

    return-object p0
.end method
