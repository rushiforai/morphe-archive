.class Lcom/google/common/graph/StandardValueGraph$1;
.super Lcom/google/common/graph/IncidentEdgeSet;
.source "StandardValueGraph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/StandardValueGraph;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;
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
.field final synthetic this$0:Lcom/google/common/graph/StandardValueGraph;

.field final synthetic val$connections:Lcom/google/common/graph/GraphConnections;


# direct methods
.method constructor <init>(Lcom/google/common/graph/StandardValueGraph;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;Lcom/google/common/graph/GraphConnections;)V
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010,
            0x0,
            0x0,
            0x0,
            0x1010
        }
        names = {
            "this$0",
            "graph",
            "node",
            "edgeType",
            "val$connections"
        }
    .end annotation

    .line 122
    iput-object p5, p0, Lcom/google/common/graph/StandardValueGraph$1;->val$connections:Lcom/google/common/graph/GraphConnections;

    iput-object p1, p0, Lcom/google/common/graph/StandardValueGraph$1;->this$0:Lcom/google/common/graph/StandardValueGraph;

    invoke-direct {p0, p2, p3, p4}, Lcom/google/common/graph/IncidentEdgeSet;-><init>(Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    return-void
.end method


# virtual methods
.method public iterator()Ljava/util/Iterator;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Iterator<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 125
    iget-object v0, p0, Lcom/google/common/graph/StandardValueGraph$1;->val$connections:Lcom/google/common/graph/GraphConnections;

    iget-object p0, p0, Lcom/google/common/graph/StandardValueGraph$1;->node:Ljava/lang/Object;

    invoke-interface {v0, p0}, Lcom/google/common/graph/GraphConnections;->incidentEdgeIterator(Ljava/lang/Object;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
