.class public final Lcom/google/common/graph/ImmutableGraph$Builder;
.super Ljava/lang/Object;
.source "ImmutableGraph.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/graph/ImmutableGraph;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "Builder"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field private final mutableGraph:Lcom/google/common/graph/MutableGraph;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/MutableGraph<",
            "TN;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/graph/GraphBuilder;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "graphBuilder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/graph/GraphBuilder<",
            "TN;>;)V"
        }
    .end annotation

    .line 133
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 136
    invoke-virtual {p1}, Lcom/google/common/graph/GraphBuilder;->copy()Lcom/google/common/graph/GraphBuilder;

    move-result-object p1

    invoke-static {}, Lcom/google/common/graph/ElementOrder;->stable()Lcom/google/common/graph/ElementOrder;

    move-result-object v0

    invoke-virtual {p1, v0}, Lcom/google/common/graph/GraphBuilder;->incidentEdgeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/GraphBuilder;

    move-result-object p1

    invoke-virtual {p1}, Lcom/google/common/graph/GraphBuilder;->build()Lcom/google/common/graph/MutableGraph;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/graph/ImmutableGraph$Builder;->mutableGraph:Lcom/google/common/graph/MutableGraph;

    return-void
.end method


# virtual methods
.method public addNode(Ljava/lang/Object;)Lcom/google/common/graph/ImmutableGraph$Builder;
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
            "(TN;)",
            "Lcom/google/common/graph/ImmutableGraph$Builder<",
            "TN;>;"
        }
    .end annotation

    .line 148
    iget-object v0, p0, Lcom/google/common/graph/ImmutableGraph$Builder;->mutableGraph:Lcom/google/common/graph/MutableGraph;

    invoke-interface {v0, p1}, Lcom/google/common/graph/MutableGraph;->addNode(Ljava/lang/Object;)Z

    return-object p0
.end method

.method public build()Lcom/google/common/graph/ImmutableGraph;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ImmutableGraph<",
            "TN;>;"
        }
    .end annotation

    .line 198
    iget-object p0, p0, Lcom/google/common/graph/ImmutableGraph$Builder;->mutableGraph:Lcom/google/common/graph/MutableGraph;

    invoke-static {p0}, Lcom/google/common/graph/ImmutableGraph;->copyOf(Lcom/google/common/graph/Graph;)Lcom/google/common/graph/ImmutableGraph;

    move-result-object p0

    return-object p0
.end method

.method public putEdge(Lcom/google/common/graph/EndpointPair;)Lcom/google/common/graph/ImmutableGraph$Builder;
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
            "Lcom/google/common/graph/ImmutableGraph$Builder<",
            "TN;>;"
        }
    .end annotation

    .line 190
    iget-object v0, p0, Lcom/google/common/graph/ImmutableGraph$Builder;->mutableGraph:Lcom/google/common/graph/MutableGraph;

    invoke-interface {v0, p1}, Lcom/google/common/graph/MutableGraph;->putEdge(Lcom/google/common/graph/EndpointPair;)Z

    return-object p0
.end method

.method public putEdge(Ljava/lang/Object;Ljava/lang/Object;)Lcom/google/common/graph/ImmutableGraph$Builder;
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
            "(TN;TN;)",
            "Lcom/google/common/graph/ImmutableGraph$Builder<",
            "TN;>;"
        }
    .end annotation

    .line 167
    iget-object v0, p0, Lcom/google/common/graph/ImmutableGraph$Builder;->mutableGraph:Lcom/google/common/graph/MutableGraph;

    invoke-interface {v0, p1, p2}, Lcom/google/common/graph/MutableGraph;->putEdge(Ljava/lang/Object;Ljava/lang/Object;)Z

    return-object p0
.end method
