.class Lcom/google/common/graph/AbstractBaseGraph$2;
.super Lcom/google/common/graph/IncidentEdgeSet;
.source "AbstractBaseGraph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/AbstractBaseGraph;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/google/common/graph/IncidentEdgeSet<",
        "TN;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/graph/AbstractBaseGraph;


# direct methods
.method constructor <init>(Lcom/google/common/graph/AbstractBaseGraph;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            "this$0",
            "graph",
            "node",
            "edgeType"
        }
    .end annotation

    .line 115
    iput-object p1, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->this$0:Lcom/google/common/graph/AbstractBaseGraph;

    invoke-direct {p0, p2, p3, p4}, Lcom/google/common/graph/IncidentEdgeSet;-><init>(Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    return-void
.end method


# virtual methods
.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 118
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ArchetypeGraph;->isDirected()Z

    move-result v0

    .line 130
    iget-object v1, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->graph:Lcom/google/common/graph/ArchetypeGraph;

    if-eqz v0, :cond_0

    .line 119
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    .line 122
    invoke-interface {v1, v0}, Lcom/google/common/graph/ArchetypeGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Lcom/google/common/graph/AbstractBaseGraph$2$0;

    invoke-direct {v1, p0}, Lcom/google/common/graph/AbstractBaseGraph$2$0;-><init>(Lcom/google/common/graph/AbstractBaseGraph$2;)V

    .line 121
    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->graph:Lcom/google/common/graph/ArchetypeGraph;

    iget-object v2, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    .line 127
    invoke-interface {v1, v2}, Lcom/google/common/graph/ArchetypeGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    iget-object v2, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    invoke-static {v2}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v2

    invoke-static {v1, v2}, Lcom/google/common/collect/Sets;->difference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v1

    invoke-virtual {v1}, Lcom/google/common/collect/Sets$SetView;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v1

    new-instance v2, Lcom/google/common/graph/AbstractBaseGraph$2$1;

    invoke-direct {v2, p0}, Lcom/google/common/graph/AbstractBaseGraph$2$1;-><init>(Lcom/google/common/graph/AbstractBaseGraph$2;)V

    .line 124
    invoke-static {v1, v2}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object p0

    .line 120
    invoke-static {v0, p0}, Lcom/google/common/collect/Iterators;->concat(Ljava/util/Iterator;Ljava/util/Iterator;)Ljava/util/Iterator;

    move-result-object p0

    .line 119
    invoke-static {p0}, Lcom/google/common/collect/Iterators;->unmodifiableIterator(Ljava/util/Iterator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0

    .line 130
    :cond_0
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    .line 132
    invoke-interface {v1, v0}, Lcom/google/common/graph/ArchetypeGraph;->adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Lcom/google/common/graph/AbstractBaseGraph$2$2;

    invoke-direct {v1, p0}, Lcom/google/common/graph/AbstractBaseGraph$2$2;-><init>(Lcom/google/common/graph/AbstractBaseGraph$2;)V

    .line 131
    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object p0

    .line 130
    invoke-static {p0}, Lcom/google/common/collect/Iterators;->unmodifiableIterator(Ljava/util/Iterator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 115
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$2;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$iterator$0$com-google-common-graph-AbstractBaseGraph$2(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;
    .registers 2

    .line 123
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    invoke-static {p1, p0}, Lcom/google/common/graph/EndpointPair;->ordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$iterator$1$com-google-common-graph-AbstractBaseGraph$2(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;
    .registers 2

    .line 128
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/google/common/graph/EndpointPair;->ordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$iterator$2$com-google-common-graph-AbstractBaseGraph$2(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;
    .registers 2

    .line 133
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$2;->node:Ljava/lang/Object;

    invoke-static {p0, p1}, Lcom/google/common/graph/EndpointPair;->unordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0
.end method
