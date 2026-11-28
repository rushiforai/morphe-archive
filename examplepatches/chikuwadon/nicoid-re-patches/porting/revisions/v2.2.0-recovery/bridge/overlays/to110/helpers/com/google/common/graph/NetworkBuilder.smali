.class public final Lcom/google/common/graph/NetworkBuilder;
.super Lcom/google/common/graph/AbstractGraphBuilder;
.source "NetworkBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        "E:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/graph/AbstractGraphBuilder<",
        "TN;>;"
    }
.end annotation


# instance fields
.field allowsParallelEdges:Z

.field edgeOrder:Lcom/google/common/graph/ElementOrder;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/ElementOrder<",
            "-TE;>;"
        }
    .end annotation
.end field

.field expectedEdgeCount:Ljava/lang/Integer;


# direct methods
.method private constructor <init>(Z)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "directed"
        }
    .end annotation

    .line 81
    invoke-direct {p0, p1}, Lcom/google/common/graph/AbstractGraphBuilder;-><init>(Z)V

    const/4 p1, 0x0

    .line 75
    iput-boolean p1, p0, Lcom/google/common/graph/NetworkBuilder;->allowsParallelEdges:Z

    .line 76
    invoke-static {}, Lcom/google/common/graph/ElementOrder;->insertion()Lcom/google/common/graph/ElementOrder;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/graph/NetworkBuilder;->edgeOrder:Lcom/google/common/graph/ElementOrder;

    const/4 p1, 0x0

    .line 77
    iput-object p1, p0, Lcom/google/common/graph/NetworkBuilder;->expectedEdgeCount:Ljava/lang/Integer;

    return-void
.end method

.method private cast()Lcom/google/common/graph/NetworkBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;E1:TE;>()",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN1;TE1;>;"
        }
    .end annotation

    return-object p0
.end method

.method public static directed()Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/NetworkBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 86
    new-instance v0, Lcom/google/common/graph/NetworkBuilder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/common/graph/NetworkBuilder;-><init>(Z)V

    return-object v0
.end method

.method public static from(Lcom/google/common/graph/Network;)Lcom/google/common/graph/NetworkBuilder;
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
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN;TE;>;"
        }
    .end annotation

    .line 103
    new-instance v0, Lcom/google/common/graph/NetworkBuilder;

    invoke-interface {p0}, Lcom/google/common/graph/Network;->isDirected()Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/common/graph/NetworkBuilder;-><init>(Z)V

    .line 104
    invoke-interface {p0}, Lcom/google/common/graph/Network;->allowsParallelEdges()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/common/graph/NetworkBuilder;->allowsParallelEdges(Z)Lcom/google/common/graph/NetworkBuilder;

    move-result-object v0

    .line 105
    invoke-interface {p0}, Lcom/google/common/graph/Network;->allowsSelfLoops()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/common/graph/NetworkBuilder;->allowsSelfLoops(Z)Lcom/google/common/graph/NetworkBuilder;

    move-result-object v0

    .line 106
    invoke-interface {p0}, Lcom/google/common/graph/Network;->nodeOrder()Lcom/google/common/graph/ElementOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/graph/NetworkBuilder;->nodeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/NetworkBuilder;

    move-result-object v0

    .line 107
    invoke-interface {p0}, Lcom/google/common/graph/Network;->edgeOrder()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/common/graph/NetworkBuilder;->edgeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/NetworkBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static undirected()Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/NetworkBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 91
    new-instance v0, Lcom/google/common/graph/NetworkBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/graph/NetworkBuilder;-><init>(Z)V

    return-object v0
.end method


# virtual methods
.method public allowsParallelEdges(Z)Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "allowsParallelEdges"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN;TE;>;"
        }
    .end annotation

    .line 130
    iput-boolean p1, p0, Lcom/google/common/graph/NetworkBuilder;->allowsParallelEdges:Z

    return-object p0
.end method

.method public allowsSelfLoops(Z)Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "allowsSelfLoops"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(Z)",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN;TE;>;"
        }
    .end annotation

    .line 143
    iput-boolean p1, p0, Lcom/google/common/graph/NetworkBuilder;->allowsSelfLoops:Z

    return-object p0
.end method

.method public build()Lcom/google/common/graph/MutableNetwork;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;E1:TE;>()",
            "Lcom/google/common/graph/MutableNetwork<",
            "TN1;TE1;>;"
        }
    .end annotation

    .line 193
    new-instance v0, Lcom/google/common/graph/StandardMutableNetwork;

    invoke-direct {v0, p0}, Lcom/google/common/graph/StandardMutableNetwork;-><init>(Lcom/google/common/graph/NetworkBuilder;)V

    return-object v0
.end method

.method public edgeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "edgeOrder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<E1:TE;>(",
            "Lcom/google/common/graph/ElementOrder<",
            "TE1;>;)",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN;TE1;>;"
        }
    .end annotation

    .line 186
    invoke-direct {p0}, Lcom/google/common/graph/NetworkBuilder;->cast()Lcom/google/common/graph/NetworkBuilder;

    move-result-object p0

    .line 187
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/graph/ElementOrder;

    iput-object p1, p0, Lcom/google/common/graph/NetworkBuilder;->edgeOrder:Lcom/google/common/graph/ElementOrder;

    return-object p0
.end method

.method public expectedEdgeCount(I)Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedEdgeCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN;TE;>;"
        }
    .end annotation

    .line 165
    invoke-static {p1}, Lcom/google/common/graph/Graphs;->checkNonNegative(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/graph/NetworkBuilder;->expectedEdgeCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public expectedNodeCount(I)Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "expectedNodeCount"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(I)",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN;TE;>;"
        }
    .end annotation

    .line 154
    invoke-static {p1}, Lcom/google/common/graph/Graphs;->checkNonNegative(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/graph/NetworkBuilder;->expectedNodeCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public immutable()Lcom/google/common/graph/ImmutableNetwork$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;E1:TE;>()",
            "Lcom/google/common/graph/ImmutableNetwork$Builder<",
            "TN1;TE1;>;"
        }
    .end annotation

    .line 118
    invoke-direct {p0}, Lcom/google/common/graph/NetworkBuilder;->cast()Lcom/google/common/graph/NetworkBuilder;

    move-result-object p0

    .line 119
    new-instance v0, Lcom/google/common/graph/ImmutableNetwork$Builder;

    invoke-direct {v0, p0}, Lcom/google/common/graph/ImmutableNetwork$Builder;-><init>(Lcom/google/common/graph/NetworkBuilder;)V

    return-object v0
.end method

.method public nodeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/NetworkBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "nodeOrder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;>(",
            "Lcom/google/common/graph/ElementOrder<",
            "TN1;>;)",
            "Lcom/google/common/graph/NetworkBuilder<",
            "TN1;TE;>;"
        }
    .end annotation

    .line 175
    invoke-direct {p0}, Lcom/google/common/graph/NetworkBuilder;->cast()Lcom/google/common/graph/NetworkBuilder;

    move-result-object p0

    .line 176
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/graph/ElementOrder;

    iput-object p1, p0, Lcom/google/common/graph/NetworkBuilder;->nodeOrder:Lcom/google/common/graph/ElementOrder;

    return-object p0
.end method
