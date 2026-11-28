.class Lcom/google/common/graph/AbstractBaseGraph$3;
.super Lcom/google/common/graph/AbstractNetwork;
.source "AbstractBaseGraph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/AbstractBaseGraph;->asNetwork()Lcom/google/common/graph/Network;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/graph/AbstractNetwork<",
        "TN;",
        "Lcom/google/common/graph/EndpointPair<",
        "TN;>;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/graph/AbstractBaseGraph;


# direct methods
.method constructor <init>(Lcom/google/common/graph/AbstractBaseGraph;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 181
    iput-object p1, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-direct {p0}, Lcom/google/common/graph/AbstractNetwork;-><init>()V

    return-void
.end method


# virtual methods
.method public adjacentEdges(Lcom/google/common/graph/EndpointPair;)Ljava/util/Set;
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "edge"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;)",
            "Ljava/util/Set<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 290
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 291
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$3;->edges()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 292
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v0

    .line 293
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object v1

    .line 295
    invoke-virtual {p0, v0}, Lcom/google/common/graph/AbstractBaseGraph$3;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v2

    invoke-virtual {p0, v1}, Lcom/google/common/graph/AbstractBaseGraph$3;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-static {v2, v3}, Lcom/google/common/collect/Sets;->union(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v2

    .line 297
    invoke-static {p1}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object p1

    invoke-static {v2, p1}, Lcom/google/common/collect/Sets;->difference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object p1

    .line 296
    invoke-virtual {p0, p1, v0, v1}, Lcom/google/common/graph/AbstractBaseGraph$3;->nodePairInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic adjacentEdges(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "edge"
        }
    .end annotation

    .line 181
    check-cast p1, Lcom/google/common/graph/EndpointPair;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph$3;->adjacentEdges(Lcom/google/common/graph/EndpointPair;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

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

    .line 230
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public allowsParallelEdges()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public allowsSelfLoops()Z
    .registers 1

    .line 215
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->allowsSelfLoops()Z

    move-result p0

    return p0
.end method

.method public asGraph()Lcom/google/common/graph/Graph;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/Graph<",
            "TN;>;"
        }
    .end annotation

    .line 194
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    instance-of v1, v0, Lcom/google/common/graph/Graph;

    if-eqz v1, :cond_0

    .line 195
    check-cast v0, Lcom/google/common/graph/Graph;

    return-object v0

    .line 196
    :cond_0
    instance-of v1, v0, Lcom/google/common/graph/ValueGraph;

    if-eqz v1, :cond_1

    .line 197
    check-cast v0, Lcom/google/common/graph/ValueGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ValueGraph;->asGraph()Lcom/google/common/graph/Graph;

    move-result-object p0

    return-object p0

    .line 199
    :cond_1
    new-instance v0, Ljava/lang/UnsupportedOperationException;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Unexpected graph type: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    .line 200
    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object p0

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-direct {v0, p0}, Ljava/lang/UnsupportedOperationException;-><init>(Ljava/lang/String;)V

    throw v0
.end method

.method public edgeOrder()Lcom/google/common/graph/ElementOrder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ElementOrder<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 225
    invoke-static {}, Lcom/google/common/graph/ElementOrder;->unordered()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    return-object p0
.end method

.method public edges()Ljava/util/Set;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 189
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->edges()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public inEdges(Ljava/lang/Object;)Ljava/util/Set;
    .registers 4
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
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 250
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 251
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$3;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 252
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$3$1;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->INCOMING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    invoke-direct {v0, p0, p0, p1, v1}, Lcom/google/common/graph/AbstractBaseGraph$3$1;-><init>(Lcom/google/common/graph/AbstractBaseGraph$3;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    .line 265
    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractBaseGraph$3;->nodeInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public incidentEdges(Ljava/lang/Object;)Ljava/util/Set;
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
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 245
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public incidentNodes(Lcom/google/common/graph/EndpointPair;)Lcom/google/common/graph/EndpointPair;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "edge"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;)",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;"
        }
    .end annotation

    .line 302
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 303
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$3;->edges()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    return-object p1
.end method

.method public bridge synthetic incidentNodes(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "edge"
        }
    .end annotation

    .line 181
    check-cast p1, Lcom/google/common/graph/EndpointPair;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph$3;->incidentNodes(Lcom/google/common/graph/EndpointPair;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0
.end method

.method public isDirected()Z
    .registers 1

    .line 205
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->isDirected()Z

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

    .line 220
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodeOrder()Lcom/google/common/graph/ElementOrder;

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

    .line 184
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public outEdges(Ljava/lang/Object;)Ljava/util/Set;
    .registers 4
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
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 270
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 271
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$3;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkArgument(Z)V

    .line 272
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$3$2;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->OUTGOING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    invoke-direct {v0, p0, p0, p1, v1}, Lcom/google/common/graph/AbstractBaseGraph$3$2;-><init>(Lcom/google/common/graph/AbstractBaseGraph$3;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    .line 285
    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractBaseGraph$3;->nodeInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/Set;

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

    .line 181
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph$3;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

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

    .line 235
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

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

    .line 181
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph$3;->successors(Ljava/lang/Object;)Ljava/util/Set;

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

    .line 240
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
