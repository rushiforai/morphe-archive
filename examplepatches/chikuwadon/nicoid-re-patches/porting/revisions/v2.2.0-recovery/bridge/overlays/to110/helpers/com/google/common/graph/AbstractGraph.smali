.class public abstract Lcom/google/common/graph/AbstractGraph;
.super Lcom/google/common/graph/AbstractBaseGraph;
.source "AbstractGraph.java"

# interfaces
.implements Lcom/google/common/graph/Graph;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/graph/AbstractBaseGraph<",
        "TN;>;",
        "Lcom/google/common/graph/Graph<",
        "TN;>;"
    }
.end annotation


# direct methods
.method protected constructor <init>()V
    .registers 1

    .line 31
    invoke-direct {p0}, Lcom/google/common/graph/AbstractBaseGraph;-><init>()V

    return-void
.end method


# virtual methods
.method public bridge synthetic asNetwork()Lcom/google/common/graph/Network;
    .registers 1

    .line 29
    invoke-super {p0}, Lcom/google/common/graph/AbstractBaseGraph;->asNetwork()Lcom/google/common/graph/Network;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic degree(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "node"
        }
    .end annotation

    .line 29
    invoke-super {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->degree(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public bridge synthetic edges()Ljava/util/Set;
    .registers 1

    .line 29
    invoke-super {p0}, Lcom/google/common/graph/AbstractBaseGraph;->edges()Ljava/util/Set;

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

    .line 38
    :cond_0
    instance-of v1, p1, Lcom/google/common/graph/Graph;

    const/4 v2, 0x0

    if-nez v1, :cond_1

    return v2

    .line 41
    :cond_1
    check-cast p1, Lcom/google/common/graph/Graph;

    .line 43
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->isDirected()Z

    move-result v1

    invoke-interface {p1}, Lcom/google/common/graph/Graph;->isDirected()Z

    move-result v3

    if-ne v1, v3, :cond_2

    .line 44
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->nodes()Ljava/util/Set;

    move-result-object v1

    invoke-interface {p1}, Lcom/google/common/graph/Graph;->nodes()Ljava/util/Set;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_2

    .line 45
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->edges()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p1}, Lcom/google/common/graph/Graph;->edges()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p0, p1}, Ljava/util/Set;->equals(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2

    return v0

    :cond_2
    return v2
.end method

.method public bridge synthetic hasEdgeConnecting(Lcom/google/common/graph/EndpointPair;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "endpoints"
        }
    .end annotation

    .line 29
    invoke-super {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->hasEdgeConnecting(Lcom/google/common/graph/EndpointPair;)Z

    move-result p0

    return p0
.end method

.method public bridge synthetic hasEdgeConnecting(Ljava/lang/Object;Ljava/lang/Object;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000,
            0x1000
        }
        names = {
            "nodeU",
            "nodeV"
        }
    .end annotation

    .line 29
    invoke-super {p0, p1, p2}, Lcom/google/common/graph/AbstractBaseGraph;->hasEdgeConnecting(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public final hashCode()I
    .registers 1

    .line 50
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->edges()Ljava/util/Set;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Set;->hashCode()I

    move-result p0

    return p0
.end method

.method public bridge synthetic inDegree(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "node"
        }
    .end annotation

    .line 29
    invoke-super {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->inDegree(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public bridge synthetic incidentEdgeOrder()Lcom/google/common/graph/ElementOrder;
    .registers 1

    .line 29
    invoke-super {p0}, Lcom/google/common/graph/AbstractBaseGraph;->incidentEdgeOrder()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic incidentEdges(Ljava/lang/Object;)Ljava/util/Set;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "node"
        }
    .end annotation

    .line 29
    invoke-super {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->incidentEdges(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object p0

    return-object p0
.end method

.method public bridge synthetic outDegree(Ljava/lang/Object;)I
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x1000
        }
        names = {
            "node"
        }
    .end annotation

    .line 29
    invoke-super {p0, p1}, Lcom/google/common/graph/AbstractBaseGraph;->outDegree(Ljava/lang/Object;)I

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 3

    .line 56
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "isDirected: "

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 57
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->isDirected()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", allowsSelfLoops: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 59
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->allowsSelfLoops()Z

    move-result v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Z)Ljava/lang/StringBuilder;

    const-string v1, ", nodes: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 61
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->nodes()Ljava/util/Set;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    const-string v1, ", edges: "

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 63
    invoke-virtual {p0}, Lcom/google/common/graph/AbstractGraph;->edges()Ljava/util/Set;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
