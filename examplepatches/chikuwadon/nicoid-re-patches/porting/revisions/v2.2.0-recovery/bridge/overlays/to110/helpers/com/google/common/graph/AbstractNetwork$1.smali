.class Lcom/google/common/graph/AbstractNetwork$1;
.super Lcom/google/common/graph/AbstractGraph;
.source "AbstractNetwork.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/AbstractNetwork;->asGraph()Lcom/google/common/graph/Graph;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/graph/AbstractGraph<",
        "TN;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/graph/AbstractNetwork;

.field final synthetic val$network:Lcom/google/common/graph/Network;


# direct methods
.method constructor <init>(Lcom/google/common/graph/AbstractNetwork;Lcom/google/common/graph/Network;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x1010
        }
        names = {
            "this$0",
            "val$network"
        }
    .end annotation

    .line 61
    iput-object p2, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    iput-object p1, p0, Lcom/google/common/graph/AbstractNetwork$1;->this$0:Lcom/google/common/graph/AbstractNetwork;

    invoke-direct {p0}, Lcom/google/common/graph/AbstractGraph;-><init>()V

    return-void
.end method


# virtual methods
.method public adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)",
            "Ljava/util/Set<",
            "TN;>;"
        }
    .end annotation

    .line 125
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0, p1}, Lcom/google/common/graph/Network;->adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public allowsSelfLoops()Z
    .registers 1

    .line 120
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0}, Lcom/google/common/graph/Network;->allowsSelfLoops()Z

    move-result p0

    return p0
.end method

.method public edges()Ljava/util/Set;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 69
    iget-object v0, p0, Lcom/google/common/graph/AbstractNetwork$1;->this$0:Lcom/google/common/graph/AbstractNetwork;

    invoke-virtual {v0}, Lcom/google/common/graph/AbstractNetwork;->allowsParallelEdges()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 70
    invoke-super {p0}, Lcom/google/common/graph/AbstractGraph;->edges()Ljava/util/Set;

    move-result-object p0

    return-object p0

    .line 74
    :cond_0
    new-instance v0, Lcom/google/common/graph/AbstractNetwork$1$1;

    iget-object v1, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-direct {v0, p0, v1}, Lcom/google/common/graph/AbstractNetwork$1$1;-><init>(Lcom/google/common/graph/AbstractNetwork$1;Lcom/google/common/graph/Network;)V

    return-object v0
.end method

.method public incidentEdgeOrder()Lcom/google/common/graph/ElementOrder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ElementOrder<",
            "TN;>;"
        }
    .end annotation

    .line 110
    invoke-static {}, Lcom/google/common/graph/ElementOrder;->unordered()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    return-object p0
.end method

.method public isDirected()Z
    .registers 1

    .line 115
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0}, Lcom/google/common/graph/Network;->isDirected()Z

    move-result p0

    return p0
.end method

.method public nodeOrder()Lcom/google/common/graph/ElementOrder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ElementOrder<",
            "TN;>;"
        }
    .end annotation

    .line 104
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0}, Lcom/google/common/graph/Network;->nodeOrder()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    return-object p0
.end method

.method public nodes()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "TN;>;"
        }
    .end annotation

    .line 64
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0}, Lcom/google/common/graph/Network;->nodes()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic predecessors(Ljava/lang/Object;)Ljava/lang/Iterable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "node"
        }
    .end annotation

    .line 61
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork$1;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public predecessors(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)",
            "Ljava/util/Set<",
            "TN;>;"
        }
    .end annotation

    .line 130
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0, p1}, Lcom/google/common/graph/Network;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic successors(Ljava/lang/Object;)Ljava/lang/Iterable;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "node"
        }
    .end annotation

    .line 61
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork$1;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public successors(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;)",
            "Ljava/util/Set<",
            "TN;>;"
        }
    .end annotation

    .line 135
    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$1;->val$network:Lcom/google/common/graph/Network;

    invoke-interface {p0, p1}, Lcom/google/common/graph/Network;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
