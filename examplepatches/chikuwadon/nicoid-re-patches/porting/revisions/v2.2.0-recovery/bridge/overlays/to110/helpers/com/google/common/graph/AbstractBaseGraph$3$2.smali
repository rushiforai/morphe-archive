.class Lcom/google/common/graph/AbstractBaseGraph$3$2;
.super Lcom/google/common/graph/IncidentEdgeSet;
.source "AbstractBaseGraph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/AbstractBaseGraph$3;->outEdges(Ljava/lang/Object;)Ljava/util/Set;
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
.field final synthetic this$1:Lcom/google/common/graph/AbstractBaseGraph$3;


# direct methods
.method constructor <init>(Lcom/google/common/graph/AbstractBaseGraph$3;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0
        }
        names = {
            "this$1",
            "graph",
            "node",
            "edgeType"
        }
    .end annotation

    .line 273
    iput-object p1, p0, Lcom/google/common/graph/AbstractBaseGraph$3$2;->this$1:Lcom/google/common/graph/AbstractBaseGraph$3;

    invoke-direct {p0, p2, p3, p4}, Lcom/google/common/graph/IncidentEdgeSet;-><init>(Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    return-void
.end method


# virtual methods
.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 276
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$2;->graph:Lcom/google/common/graph/ArchetypeGraph;

    iget-object v1, p0, Lcom/google/common/graph/AbstractBaseGraph$3$2;->node:Ljava/lang/Object;

    .line 278
    invoke-interface {v0, v1}, Lcom/google/common/graph/ArchetypeGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    new-instance v1, Lcom/google/common/graph/AbstractBaseGraph$3$2$0;

    invoke-direct {v1, p0}, Lcom/google/common/graph/AbstractBaseGraph$3$2$0;-><init>(Lcom/google/common/graph/AbstractBaseGraph$3$2;)V

    .line 277
    invoke-static {v0, v1}, Lcom/google/common/collect/Iterators;->transform(Ljava/util/Iterator;Lcom/google/common/base/Function;)Ljava/util/Iterator;

    move-result-object p0

    .line 276
    invoke-static {p0}, Lcom/google/common/collect/Iterators;->unmodifiableIterator(Ljava/util/Iterator;)Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 273
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph$3$2;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$iterator$0$com-google-common-graph-AbstractBaseGraph$3$2(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;
    .registers 3

    .line 280
    iget-object v0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$2;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ArchetypeGraph;->isDirected()Z

    move-result v0

    .line 282
    iget-object p0, p0, Lcom/google/common/graph/AbstractBaseGraph$3$2;->node:Ljava/lang/Object;

    if-eqz v0, :cond_0

    .line 281
    invoke-static {p0, p1}, Lcom/google/common/graph/EndpointPair;->ordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0

    .line 282
    :cond_0
    invoke-static {p0, p1}, Lcom/google/common/graph/EndpointPair;->unordered(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    return-object p0
.end method
