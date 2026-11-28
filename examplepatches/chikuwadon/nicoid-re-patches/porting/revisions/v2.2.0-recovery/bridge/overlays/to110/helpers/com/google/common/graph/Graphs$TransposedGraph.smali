.class final Lcom/google/common/graph/Graphs$TransposedGraph;
.super Lcom/google/common/graph/ForwardingGraph;
.source "Graphs.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/graph/Graphs;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "TransposedGraph"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/graph/ForwardingGraph<",
        "TN;>;"
    }
.end annotation


# instance fields
.field private final graph:Lcom/google/common/graph/Graph;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/Graph<",
            "TN;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/graph/Graph;)V
    .registers 2
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
            "(",
            "Lcom/google/common/graph/Graph<",
            "TN;>;)V"
        }
    .end annotation

    .line 346
    invoke-direct {p0}, Lcom/google/common/graph/ForwardingGraph;-><init>()V

    .line 347
    iput-object p1, p0, Lcom/google/common/graph/Graphs$TransposedGraph;->graph:Lcom/google/common/graph/Graph;

    return-void
.end method

.method static synthetic access$000(Lcom/google/common/graph/Graphs$TransposedGraph;)Lcom/google/common/graph/Graph;
    .registers 1

    .line 343
    iget-object p0, p0, Lcom/google/common/graph/Graphs$TransposedGraph;->graph:Lcom/google/common/graph/Graph;

    return-object p0
.end method


# virtual methods
.method bridge synthetic delegate()Lcom/google/common/graph/BaseGraph;
    .registers 1

    .line 343
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    return-object p0
.end method

.method delegate()Lcom/google/common/graph/Graph;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/Graph<",
            "TN;>;"
        }
    .end annotation

    .line 352
    iget-object p0, p0, Lcom/google/common/graph/Graphs$TransposedGraph;->graph:Lcom/google/common/graph/Graph;

    return-object p0
.end method

.method public hasEdgeConnecting(Lcom/google/common/graph/EndpointPair;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "endpoints"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;)Z"
        }
    .end annotation

    .line 394
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    invoke-static {p1}, Lcom/google/common/graph/Graphs;->transpose(Lcom/google/common/graph/EndpointPair;)Lcom/google/common/graph/EndpointPair;

    move-result-object p1

    invoke-interface {p0, p1}, Lcom/google/common/graph/Graph;->hasEdgeConnecting(Lcom/google/common/graph/EndpointPair;)Z

    move-result p0

    return p0
.end method

.method public hasEdgeConnecting(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "nodeU",
            "nodeV"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;TN;)Z"
        }
    .end annotation

    .line 389
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    invoke-interface {p0, p2, p1}, Lcom/google/common/graph/Graph;->hasEdgeConnecting(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public inDegree(Ljava/lang/Object;)I
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
            "(TN;)I"
        }
    .end annotation

    .line 379
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/graph/Graph;->outDegree(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public incidentEdges(Ljava/lang/Object;)Ljava/util/Set;
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

    .line 367
    new-instance v0, Lcom/google/common/graph/Graphs$TransposedGraph$1;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    invoke-direct {v0, p0, p0, p1, v1}, Lcom/google/common/graph/Graphs$TransposedGraph$1;-><init>(Lcom/google/common/graph/Graphs$TransposedGraph;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    return-object v0
.end method

.method public outDegree(Ljava/lang/Object;)I
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
            "(TN;)I"
        }
    .end annotation

    .line 384
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/graph/Graph;->inDegree(Ljava/lang/Object;)I

    move-result p0

    return p0
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

    .line 343
    invoke-virtual {p0, p1}, Lcom/google/common/graph/Graphs$TransposedGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

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

    .line 357
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/graph/Graph;->successors(Ljava/lang/Object;)Ljava/util/Set;

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

    .line 343
    invoke-virtual {p0, p1}, Lcom/google/common/graph/Graphs$TransposedGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

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

    .line 362
    invoke-virtual {p0}, Lcom/google/common/graph/Graphs$TransposedGraph;->delegate()Lcom/google/common/graph/Graph;

    move-result-object p0

    invoke-interface {p0, p1}, Lcom/google/common/graph/Graph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method
