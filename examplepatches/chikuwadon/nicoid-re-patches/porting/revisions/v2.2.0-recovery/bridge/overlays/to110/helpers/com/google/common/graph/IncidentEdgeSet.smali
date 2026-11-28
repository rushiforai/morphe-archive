.class abstract Lcom/google/common/graph/IncidentEdgeSet;
.super Ljava/util/AbstractSet;
.source "IncidentEdgeSet.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/graph/IncidentEdgeSet$EdgeType;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/AbstractSet<",
        "Lcom/google/common/graph/EndpointPair<",
        "TN;>;>;"
    }
.end annotation


# instance fields
.field final edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

.field final graph:Lcom/google/common/graph/ArchetypeGraph;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/ArchetypeGraph<",
            "TN;>;"
        }
    .end annotation
.end field

.field final node:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TN;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "graph",
            "node",
            "edgeType"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/graph/ArchetypeGraph<",
            "TN;>;TN;",
            "Lcom/google/common/graph/IncidentEdgeSet$EdgeType;",
            ")V"
        }
    .end annotation

    .line 39
    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    .line 40
    iput-object p1, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    .line 41
    iput-object p2, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    .line 42
    iput-object p3, p0, Lcom/google/common/graph/IncidentEdgeSet;->edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    return-void
.end method

.method private predecessorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;
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
            "TN;>;"
        }
    .end annotation

    .line 92
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->INCOMING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    if-eq v0, v1, :cond_0

    .line 95
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0

    .line 93
    :cond_0
    iget-object p0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {p0, p1}, Lcom/google/common/graph/ArchetypeGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method private successorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;
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
            "TN;>;"
        }
    .end annotation

    .line 104
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->OUTGOING:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    if-eq v0, v1, :cond_0

    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    if-eq v0, v1, :cond_0

    .line 107
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object p0

    return-object p0

    .line 105
    :cond_0
    iget-object p0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {p0, p1}, Lcom/google/common/graph/ArchetypeGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final contains(Ljava/lang/Object;)Z
    .registers 7
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 63
    instance-of v0, p1, Lcom/google/common/graph/EndpointPair;

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 66
    :cond_0
    check-cast p1, Lcom/google/common/graph/EndpointPair;

    .line 68
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ArchetypeGraph;->isDirected()Z

    move-result v0

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->isOrdered()Z

    move-result v2

    if-eq v0, v2, :cond_1

    return v1

    .line 72
    :cond_1
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ArchetypeGraph;->isDirected()Z

    move-result v0

    const/4 v2, 0x1

    if-eqz v0, :cond_5

    .line 73
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->source()Ljava/lang/Object;

    move-result-object v0

    .line 74
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->target()Ljava/lang/Object;

    move-result-object p1

    .line 75
    iget-object v3, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-virtual {v3, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2

    iget-object v3, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-direct {p0, v3}, Lcom/google/common/graph/IncidentEdgeSet;->successorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v3

    invoke-interface {v3, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_3

    :cond_2
    iget-object v3, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    .line 76
    invoke-virtual {v3, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_4

    iget-object p1, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-direct {p0, p1}, Lcom/google/common/graph/IncidentEdgeSet;->predecessorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_4

    :cond_3
    return v2

    :cond_4
    return v1

    .line 78
    :cond_5
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    iget-object v3, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-interface {v0, v3}, Lcom/google/common/graph/ArchetypeGraph;->adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 79
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v3

    .line 80
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object p1

    .line 82
    iget-object v4, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-virtual {v4, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_6

    invoke-interface {v0, v3}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_7

    :cond_6
    iget-object p0, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    .line 83
    invoke-virtual {p0, v3}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_8

    :cond_7
    return v2

    :cond_8
    return v1
.end method

.method public final remove(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "o"
        }
    .end annotation

    .line 47
    new-instance p0, Ljava/lang/UnsupportedOperationException;

    invoke-direct {p0}, Ljava/lang/UnsupportedOperationException;-><init>()V

    throw p0
.end method

.method public final size()I
    .registers 4

    .line 52
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    invoke-interface {v0}, Lcom/google/common/graph/ArchetypeGraph;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_1

    .line 53
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-direct {p0, v0}, Lcom/google/common/graph/IncidentEdgeSet;->predecessorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    iget-object v1, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    .line 54
    invoke-direct {p0, v1}, Lcom/google/common/graph/IncidentEdgeSet;->successorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v1

    add-int/2addr v0, v1

    .line 55
    iget-object v1, p0, Lcom/google/common/graph/IncidentEdgeSet;->edgeType:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    sget-object v2, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    if-ne v1, v2, :cond_0

    iget-object v1, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-direct {p0, v1}, Lcom/google/common/graph/IncidentEdgeSet;->predecessorsOrEmpty(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    iget-object p0, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-interface {v1, p0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    sub-int/2addr v0, p0

    return v0

    .line 57
    :cond_1
    iget-object v0, p0, Lcom/google/common/graph/IncidentEdgeSet;->graph:Lcom/google/common/graph/ArchetypeGraph;

    iget-object p0, p0, Lcom/google/common/graph/IncidentEdgeSet;->node:Ljava/lang/Object;

    invoke-interface {v0, p0}, Lcom/google/common/graph/ArchetypeGraph;->adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0
.end method
