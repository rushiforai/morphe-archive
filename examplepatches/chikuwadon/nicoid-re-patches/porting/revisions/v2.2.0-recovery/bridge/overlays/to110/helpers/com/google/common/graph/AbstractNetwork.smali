.class public abstract Lcom/google/common/graph/AbstractNetwork;
.super Ljava/lang/Object;
.source "AbstractNetwork.java"

# interfaces
.implements Lcom/google/common/graph/Network;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        "E:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/graph/Network<",
        "TN;TE;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 56
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private connectedPredicate(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/base/Predicate;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "nodePresent",
            "nodeToCheck"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TN;TN;)",
            "Lcom/google/common/base/Predicate<",
            "TE;>;"
        }
    .end annotation

    .line 190
    new-instance v0, Lcom/google/common/graph/AbstractNetwork$0;

    invoke-direct {v0, p0, p1, p2}, Lcom/google/common/graph/AbstractNetwork$0;-><init>(Lcom/google/common/graph/AbstractNetwork;Ljava/lang/Object;Ljava/lang/Object;)V

    return-object v0
.end method

.method private static edgeIncidentNodesMap(Lcom/google/common/graph/Network;)Ljava/util/Map;
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "network"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N:",
            "Ljava/lang/Object;",
            "E:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/graph/Network<",
            "TN;TE;>;)",
            "Ljava/util/Map<",
            "TE;",
            "Lcom/google/common/graph/EndpointPair<",
            "TN;>;>;"
        }
    .end annotation

    .line 316
    invoke-interface {p0}, Lcom/google/common/graph/Network;->edges()Ljava/util/Set;

    move-result-object v0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v1, Lcom/google/common/graph/AbstractNetwork$8;

    invoke-direct {v1, p0}, Lcom/google/common/graph/AbstractNetwork$8;-><init>(Lcom/google/common/graph/Network;)V

    invoke-static {v0, v1}, Lcom/google/common/collect/Maps;->asMap(Ljava/util/Set;Lcom/google/common/base/Function;)Ljava/util/Map;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$edgeInvalidatableSet$1(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 285
    const-string v0, "Edge %s that was used to generate this set is no longer in the graph."

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$nodeInvalidatableSet$1(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    .line 297
    const-string v0, "Node %s that was used to generate this set is no longer in the graph."

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method static synthetic lambda$nodePairInvalidatableSet$1(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    .line 312
    const-string v0, "Node %s or node %s that were used to generate this set are no longer in the graph."

    filled-new-array {p0, p1}, [Ljava/lang/Object;

    move-result-object p0

    invoke-static {v0, p0}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public adjacentEdges(Ljava/lang/Object;)Ljava/util/Set;
    .registers 4
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
            "(TE;)",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 163
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->incidentNodes(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object v0

    .line 165
    invoke-virtual {v0}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {p0, v1}, Lcom/google/common/graph/AbstractNetwork;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v0}, Lcom/google/common/graph/AbstractNetwork;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/common/collect/Sets;->union(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v0

    .line 166
    invoke-static {p1}, Lcom/google/common/collect/ImmutableSet;->of(Ljava/lang/Object;)Lcom/google/common/collect/ImmutableSet;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/collect/Sets;->difference(Ljava/util/Set;Ljava/util/Set;)Lcom/google/common/collect/Sets$SetView;

    move-result-object v0

    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractNetwork;->edgeInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public asGraph()Lcom/google/common/graph/Graph;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/Graph<",
            "TN;>;"
        }
    .end annotation

    .line 61
    new-instance v0, Lcom/google/common/graph/AbstractNetwork$1;

    invoke-direct {v0, p0, p0}, Lcom/google/common/graph/AbstractNetwork$1;-><init>(Lcom/google/common/graph/AbstractNetwork;Lcom/google/common/graph/Network;)V

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

    .line 144
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    .line 145
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->inEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->outEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0

    .line 147
    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v0

    invoke-virtual {p0, p1, p1}, Lcom/google/common/graph/AbstractNetwork;->edgesConnecting(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    invoke-static {v0, p0}, Lcom/google/common/math/IntMath;->saturatedAdd(II)I

    move-result p0

    return p0
.end method

.method public edgeConnectingOrNull(Lcom/google/common/graph/EndpointPair;)Ljava/lang/Object;
    .registers 3
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
            "TN;>;)TE;"
        }
    .end annotation

    .line 208
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->validateEndpoints(Lcom/google/common/graph/EndpointPair;)V

    .line 209
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractNetwork;->edgeConnectingOrNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public edgeConnectingOrNull(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;
    .registers 5
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
            "(TN;TN;)TE;"
        }
    .end annotation

    .line 195
    invoke-virtual {p0, p1, p2}, Lcom/google/common/graph/AbstractNetwork;->edgesConnecting(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    .line 196
    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result v0

    if-eqz v0, :cond_1

    const/4 v1, 0x1

    if-ne v0, v1, :cond_0

    .line 200
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p0

    return-object p0

    .line 202
    :cond_0
    new-instance p0, Ljava/lang/IllegalArgumentException;

    const-string v0, "Cannot call edgeConnecting() when parallel edges exist between %s and %s. Consider calling edgesConnecting() instead."

    filled-new-array {p1, p2}, [Ljava/lang/Object;

    move-result-object p1

    invoke-static {v0, p1}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {p0, p1}, Ljava/lang/IllegalArgumentException;-><init>(Ljava/lang/String;)V

    throw p0

    :cond_1
    const/4 p0, 0x0

    return-object p0
.end method

.method protected final edgeInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;)Ljava/util/Set;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "set",
            "edge"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/Set<",
            "TT;>;TE;)",
            "Ljava/util/Set<",
            "TT;>;"
        }
    .end annotation

    .line 283
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 284
    new-instance v0, Lcom/google/common/graph/AbstractNetwork$6;

    invoke-direct {v0, p0, p2}, Lcom/google/common/graph/AbstractNetwork$6;-><init>(Lcom/google/common/graph/AbstractNetwork;Ljava/lang/Object;)V

    new-instance p0, Lcom/google/common/graph/AbstractNetwork$7;

    invoke-direct {p0, p2}, Lcom/google/common/graph/AbstractNetwork$7;-><init>(Ljava/lang/Object;)V

    invoke-static {p1, v0, p0}, Lcom/google/common/graph/InvalidatableSet;->of(Ljava/util/Set;Lcom/google/common/base/Supplier;Lcom/google/common/base/Supplier;)Lcom/google/common/graph/InvalidatableSet;

    move-result-object p0

    return-object p0
.end method

.method public edgesConnecting(Lcom/google/common/graph/EndpointPair;)Ljava/util/Set;
    .registers 3
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
            "TN;>;)",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 185
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->validateEndpoints(Lcom/google/common/graph/EndpointPair;)V

    .line 186
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractNetwork;->edgesConnecting(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public edgesConnecting(Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;
    .registers 7
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
            "(TN;TN;)",
            "Ljava/util/Set<",
            "TE;>;"
        }
    .end annotation

    .line 171
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 172
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 173
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->outEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    .line 174
    invoke-virtual {p0, p2}, Lcom/google/common/graph/AbstractNetwork;->inEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v1

    .line 176
    invoke-interface {v0}, Ljava/util/Set;->size()I

    move-result v2

    invoke-interface {v1}, Ljava/util/Set;->size()I

    move-result v3

    if-gt v2, v3, :cond_0

    .line 177
    invoke-direct {p0, p1, p2}, Lcom/google/common/graph/AbstractNetwork;->connectedPredicate(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/base/Predicate;

    move-result-object v1

    invoke-static {v0, v1}, Lcom/google/common/collect/Sets;->filter(Ljava/util/Set;Lcom/google/common/base/Predicate;)Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    goto :goto_0

    .line 178
    :cond_0
    invoke-direct {p0, p2, p1}, Lcom/google/common/graph/AbstractNetwork;->connectedPredicate(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/base/Predicate;

    move-result-object v0

    invoke-static {v1, v0}, Lcom/google/common/collect/Sets;->filter(Ljava/util/Set;Lcom/google/common/base/Predicate;)Ljava/util/Set;

    move-result-object v0

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    .line 175
    :goto_0
    invoke-virtual {p0, v0, p1, p2}, Lcom/google/common/graph/AbstractNetwork;->nodePairInvalidatableSet(Ljava/util/Set;Ljava/lang/Object;Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    const/4 v0, 0x1

    if-ne p1, p0, :cond_0

    return v0

    .line 246
    :cond_0
    instance-of v1, p1, Lcom/google/common/graph/Network;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 249
    :cond_1
    check-cast p1, Lcom/google/common/graph/Network;

    .line 251
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->isDirected()Z

    move-result v1

    invoke-interface {p1}, Lcom/google/common/graph/Network;->isDirected()Z

    move-result v3

    if-ne v1, v3, :cond_2

    .line 252
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->nodes()Ljava/util/Set;

    move-result-object v1

    invoke-interface {p1}, Lcom/google/common/graph/Network;->nodes()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 253
    invoke-static {p0}, Lcom/google/common/graph/AbstractNetwork;->edgeIncidentNodesMap(Lcom/google/common/graph/Network;)Ljava/util/Map;

    move-result-object p0

    invoke-static {p1}, Lcom/google/common/graph/AbstractNetwork;->edgeIncidentNodesMap(Lcom/google/common/graph/Network;)Ljava/util/Map;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Map;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public hasEdgeConnecting(Lcom/google/common/graph/EndpointPair;)Z
    .registers 3
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

    .line 221
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 222
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->isOrderingCompatible(Lcom/google/common/graph/EndpointPair;)Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 225
    :cond_0
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeU()Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->nodeV()Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, v0, p1}, Lcom/google/common/graph/AbstractNetwork;->hasEdgeConnecting(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
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

    .line 214
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 215
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 216
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->successors(Ljava/lang/Object;)Ljava/util/Set;

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

.method public final hashCode()I
    .registers 1

    .line 258
    invoke-static {p0}, Lcom/google/common/graph/AbstractNetwork;->edgeIncidentNodesMap(Lcom/google/common/graph/Network;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->hashCode()I

    move-result p0

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
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->inEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->degree(Ljava/lang/Object;)I

    move-result p0

    return p0
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

    .line 238
    invoke-virtual {p1}, Lcom/google/common/graph/EndpointPair;->isOrdered()Z

    move-result p1

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->isDirected()Z

    move-result p0

    if-ne p1, p0, :cond_0

    const/4 p0, 0x1

    return p0

    :cond_0
    const/4 p0, 0x0

    return p0
.end method

.method synthetic lambda$connectedPredicate$0$com-google-common-graph-AbstractNetwork(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 4

    .line 190
    invoke-virtual {p0, p3}, Lcom/google/common/graph/AbstractNetwork;->incidentNodes(Ljava/lang/Object;)Lcom/google/common/graph/EndpointPair;

    move-result-object p0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/EndpointPair;->adjacentNode(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    invoke-virtual {p0, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method synthetic lambda$edgeInvalidatableSet$0$com-google-common-graph-AbstractNetwork(Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 2

    .line 285
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->edges()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$nodeInvalidatableSet$0$com-google-common-graph-AbstractNetwork(Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 2

    .line 297
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->nodes()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method synthetic lambda$nodePairInvalidatableSet$0$com-google-common-graph-AbstractNetwork(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Boolean;
    .registers 4

    .line 311
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->nodes()Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_0

    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->nodes()Ljava/util/Set;

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

    .line 295
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 296
    new-instance v0, Lcom/google/common/graph/AbstractNetwork$2;

    invoke-direct {v0, p0, p2}, Lcom/google/common/graph/AbstractNetwork$2;-><init>(Lcom/google/common/graph/AbstractNetwork;Ljava/lang/Object;)V

    new-instance p0, Lcom/google/common/graph/AbstractNetwork$3;

    invoke-direct {p0, p2}, Lcom/google/common/graph/AbstractNetwork$3;-><init>(Ljava/lang/Object;)V

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

    .line 307
    invoke-static {p2}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 308
    invoke-static {p3}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 309
    new-instance v0, Lcom/google/common/graph/AbstractNetwork$4;

    invoke-direct {v0, p0, p2, p3}, Lcom/google/common/graph/AbstractNetwork$4;-><init>(Lcom/google/common/graph/AbstractNetwork;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance p0, Lcom/google/common/graph/AbstractNetwork$5;

    invoke-direct {p0, p2, p3}, Lcom/google/common/graph/AbstractNetwork$5;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

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
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->isDirected()Z

    move-result v0

    if-eqz v0, :cond_0

    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->outEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->size()I

    move-result p0

    return p0

    :cond_0
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->degree(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 264
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "isDirected: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 265
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->isDirected()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", allowsParallelEdges: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 267
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->allowsParallelEdges()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", allowsSelfLoops: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 269
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->allowsSelfLoops()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", nodes: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 271
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractNetwork;->nodes()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", edges: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 273
    invoke-static {p0}, Lcom/google/common/graph/AbstractNetwork;->edgeIncidentNodesMap(Lcom/google/common/graph/Network;)Ljava/util/Map;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
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

    .line 233
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 234
    invoke-virtual {p0, p1}, Lcom/google/common/graph/AbstractNetwork;->isOrderingCompatible(Lcom/google/common/graph/EndpointPair;)Z

    move-result p0

    const-string p1, "Mismatch: endpoints\' ordering is not compatible with directionality of the graph"

    invoke-static {p0, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/Object;)V

    return-void
.end method
