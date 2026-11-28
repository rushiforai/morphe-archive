.class abstract Lcom/google/common/graph/AbstractBaseGraph;
.super Ljava/lang/Object;
.source "AbstractBaseGraph.java"

# interfaces
.implements Lcom/google/common/graph/BaseGraph;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/graph/BaseGraph<",
        "TN;>;"
    }
.end annotation


# direct methods
.method constructor <init>()V
    .registers 1

    .line 49
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method static synthetic lambda$nodeInvalidatableSet$1(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 332
    const-string v0, "Node %s that was used to generate this set is no longer in the graph."

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$nodePairInvalidatableSet$1(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 341
    const-string v0, "Node %s or node %s that were used to generate this set are no longer in the graph."

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public asNetwork()Lcom/google/common/graph/Network;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/Network<",
            "TN;",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 181
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$3;

    invoke-direct {v0, p0}, Lcom/google/common/graph/AbstractBaseGraph$3;-><init>(Lcom/google/common/graph/AbstractBaseGraph;)V

    return-object v0
.end method

.method public degree(Ljava/lang/Object;)I
    .registers 3
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

    .line 142
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 143
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0

    .line 145
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->adjacentNodes(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 146
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->allowsSelfLoops()Z

    move-result p0

    if-eqz p0, :cond_1

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    goto :goto_0

    :cond_1
    const/4 p0, 0x0

    .line 147
    :goto_0
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result p1

    invoke-static {p1, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0
.end method

.method protected edgeCount()J
    .registers 8

    .line 58
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const-wide/16 v1, 0x0

    move-wide v3, v1

    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_0

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    .line 59
    invoke-virtual {p0, v5}, Lcom/google/common/graph/AbstractBaseGraph;->degree(Ljava/lang/Object;)I

    move-result v5

    int-to-long v5, v5

    add-long/2addr v3, v5

    goto :goto_0

    :cond_0
    const-wide/16 v5, 0x1

    and-long/2addr v5, v3

    cmp-long p0, v5, v1

    const/4 v0, 0x1

    if-nez p0, :cond_1

    move p0, v0

    goto :goto_1

    :cond_1
    const/4 p0, 0x0

    .line 62
    :goto_1
    invoke-static {p0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    ushr-long/2addr v3, v0

    return-wide v3
.end method

.method public edges()Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Set<",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 72
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$1;

    invoke-direct {v0, p0}, Lcom/google/common/graph/AbstractBaseGraph$1;-><init>(Lcom/google/common/graph/AbstractBaseGraph;)V

    return-object v0
.end method

.method public hasEdgeConnecting(Lcom/google/common/graph/EndpointPair;)Z
    .registers 5
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

    .line 170
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 171
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->isOrderingCompatible(Lcom/google/common/graph/EndpointPair;)Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_0

    return v1

    .line 174
    :cond_0
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v0

    .line 175
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object p1

    .line 176
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object v2

    invoke-interface {v2, v0}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v2

    if-eqz v2, :cond_1

    invoke-virtual {p0, v0}, Lcom/google/common/graph/AbstractBaseGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_1

    const/4 p0, 0x1

    return p0

    :cond_1
    return v1
.end method

.method public hasEdgeConnecting(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4
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

    .line 163
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 164
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 165
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method public inDegree(Ljava/lang/Object;)I
    .registers 3
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

    .line 153
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->predecessors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->degree(Ljava/lang/Object;)I

    move-result p0

    return p0
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

    .line 107
    invoke-static {}, Lcom/google/common/graph/ElementOrder;->unordered()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    return-object p0
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

    .line 112
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 113
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    const-string v1, "Node %s is not an element of this graph."

    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 114
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$2;

    sget-object v1, Lcom/google/common/graph/IncidentEdgeSet$EdgeType;->BOTH:Lcom/google/common/graph/IncidentEdgeSet$EdgeType;

    invoke-direct {v0, p0, p0, p1, v1}, Lcom/google/common/graph/AbstractBaseGraph$2;-><init>(Lcom/google/common/graph/AbstractBaseGraph;Lcom/google/common/graph/ArchetypeGraph;Ljava/lang/Object;Lcom/google/common/graph/IncidentEdgeSet$EdgeType;)V

    .line 137
    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->nodeInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method protected final isOrderingCompatible(Lcom/google/common/graph/EndpointPair;)Z
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
            "*>;)Z"
        }
    .end annotation

    .line 326
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->isOrdered()Z

    move-result p1

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->isDirected()Z

    move-result p0

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method synthetic lambda$nodeInvalidatableSet$0$com-google-common-graph-AbstractBaseGraph(Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 2

    .line 332
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$nodePairInvalidatableSet$0$com-google-common-graph-AbstractBaseGraph(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 4

    .line 340
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->nodes()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p2}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_0

    const/4 p0, 0x1

    goto :goto_0

    :cond_0
    const/4 p0, 0x0

    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method protected final nodeInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "set",
            "node"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;TN;)",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    .line 330
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 331
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$5;

    invoke-direct {v0, p0, p2}, Lcom/google/common/graph/AbstractBaseGraph$5;-><init>(Lcom/google/common/graph/AbstractBaseGraph;Ljava/lang/Object;)V

    new-instance p0, Lcom/google/common/graph/AbstractBaseGraph$6;

    invoke-direct {p0, p2}, Lcom/google/common/graph/AbstractBaseGraph$6;-><init>(Ljava/lang/Object;)V

    invoke-static {p1, v0, p0}, Lcom/google/common/graph/InvalidatableSet;->of(Ljava/util/Set;Lcom/google/common/base/Supplier;Lcom/google/common/base/Supplier;)Lcom/google/common/graph/InvalidatableSet;

    move-result-object p0

    return-object p0
.end method

.method protected final nodePairInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0,
            0x0
        }
        names = {
            "set",
            "nodeU",
            "nodeV"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;TN;TN;)",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    .line 336
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 337
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 338
    new-instance v0, Lcom/google/common/graph/AbstractBaseGraph$0;

    invoke-direct {v0, p0, p2, p3}, Lcom/google/common/graph/AbstractBaseGraph$0;-><init>(Lcom/google/common/graph/AbstractBaseGraph;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Lcom/google/common/graph/AbstractBaseGraph$4;

    invoke-direct {p0, p2, p3}, Lcom/google/common/graph/AbstractBaseGraph$4;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-static {p1, v0, p0}, Lcom/google/common/graph/InvalidatableSet;->of(Ljava/util/Set;Lcom/google/common/base/Supplier;Lcom/google/common/base/Supplier;)Lcom/google/common/graph/InvalidatableSet;

    move-result-object p0

    return-object p0
.end method

.method public outDegree(Ljava/lang/Object;)I
    .registers 3
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

    .line 158
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractBaseGraph;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->degree(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method protected final validateEndpoints(Lcom/google/common/graph/EndpointPair;)V
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
            "*>;)V"
        }
    .end annotation

    .line 317
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 318
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->isOrderingCompatible(Lcom/google/common/graph/EndpointPair;)Z

    move-result p0

    const-string p1, "Mismatch: endpoints\' ordering is not compatible with directionality of the graph"

    invoke-static {p0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    return-void
.end method
