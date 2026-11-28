.class public final Lcom/google/common/graph/ValueGraphBuilder;
.super Lcom/google/common/graph/AbstractGraphBuilder;
.source "ValueGraphBuilder.java"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        "V:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/graph/AbstractGraphBuilder<",
        "TN;>;"
    }
.end annotation


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

    .line 77
    invoke-direct {p0, p1}, Lcom/google/common/graph/AbstractGraphBuilder;-><init>(Z)V

    return-void
.end method

.method private cast()Lcom/google/common/graph/ValueGraphBuilder;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;V1:TV;>()",
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN1;TV1;>;"
        }
    .end annotation

    return-object p0
.end method

.method public static directed()Lcom/google/common/graph/ValueGraphBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 82
    new-instance v0, Lcom/google/common/graph/ValueGraphBuilder;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lcom/google/common/graph/ValueGraphBuilder;-><init>(Z)V

    return-object v0
.end method

.method public static from(Lcom/google/common/graph/ValueGraph;)Lcom/google/common/graph/ValueGraphBuilder;
    .registers 3
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
            "<N:",
            "Ljava/lang/Object;",
            "V:",
            "Ljava/lang/Object;",
            ">(",
            "Lcom/google/common/graph/ValueGraph<",
            "TN;TV;>;)",
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN;TV;>;"
        }
    .end annotation

    .line 99
    new-instance v0, Lcom/google/common/graph/ValueGraphBuilder;

    invoke-interface {p0}, Lcom/google/common/graph/ValueGraph;->isDirected()Z

    move-result v1

    invoke-direct {v0, v1}, Lcom/google/common/graph/ValueGraphBuilder;-><init>(Z)V

    .line 100
    invoke-interface {p0}, Lcom/google/common/graph/ValueGraph;->allowsSelfLoops()Z

    move-result v1

    invoke-virtual {v0, v1}, Lcom/google/common/graph/ValueGraphBuilder;->allowsSelfLoops(Z)Lcom/google/common/graph/ValueGraphBuilder;

    move-result-object v0

    .line 101
    invoke-interface {p0}, Lcom/google/common/graph/ValueGraph;->nodeOrder()Lcom/google/common/graph/ElementOrder;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/google/common/graph/ValueGraphBuilder;->nodeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/ValueGraphBuilder;

    move-result-object v0

    .line 102
    invoke-interface {p0}, Lcom/google/common/graph/ValueGraph;->incidentEdgeOrder()Lcom/google/common/graph/ElementOrder;

    move-result-object p0

    invoke-virtual {v0, p0}, Lcom/google/common/graph/ValueGraphBuilder;->incidentEdgeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/ValueGraphBuilder;

    move-result-object p0

    return-object p0
.end method

.method public static undirected()Lcom/google/common/graph/ValueGraphBuilder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "Ljava/lang/Object;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 87
    new-instance v0, Lcom/google/common/graph/ValueGraphBuilder;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lcom/google/common/graph/ValueGraphBuilder;-><init>(Z)V

    return-object v0
.end method


# virtual methods
.method public allowsSelfLoops(Z)Lcom/google/common/graph/ValueGraphBuilder;
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
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN;TV;>;"
        }
    .end annotation

    .line 130
    iput-boolean p1, p0, Lcom/google/common/graph/ValueGraphBuilder;->allowsSelfLoops:Z

    return-object p0
.end method

.method public build()Lcom/google/common/graph/MutableValueGraph;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;V1:TV;>()",
            "Lcom/google/common/graph/MutableValueGraph<",
            "TN1;TV1;>;"
        }
    .end annotation

    .line 187
    new-instance v0, Lcom/google/common/graph/StandardMutableValueGraph;

    invoke-direct {v0, p0}, Lcom/google/common/graph/StandardMutableValueGraph;-><init>(Lcom/google/common/graph/AbstractGraphBuilder;)V

    return-object v0
.end method

.method copy()Lcom/google/common/graph/ValueGraphBuilder;
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN;TV;>;"
        }
    .end annotation

    .line 191
    new-instance v0, Lcom/google/common/graph/ValueGraphBuilder;

    iget-boolean v1, p0, Lcom/google/common/graph/ValueGraphBuilder;->directed:Z

    invoke-direct {v0, v1}, Lcom/google/common/graph/ValueGraphBuilder;-><init>(Z)V

    .line 192
    iget-boolean v1, p0, Lcom/google/common/graph/ValueGraphBuilder;->allowsSelfLoops:Z

    iput-boolean v1, v0, Lcom/google/common/graph/ValueGraphBuilder;->allowsSelfLoops:Z

    .line 193
    iget-object v1, p0, Lcom/google/common/graph/ValueGraphBuilder;->nodeOrder:Lcom/google/common/graph/ElementOrder;

    iput-object v1, v0, Lcom/google/common/graph/ValueGraphBuilder;->nodeOrder:Lcom/google/common/graph/ElementOrder;

    .line 194
    iget-object v1, p0, Lcom/google/common/graph/ValueGraphBuilder;->expectedNodeCount:Ljava/lang/Integer;

    iput-object v1, v0, Lcom/google/common/graph/ValueGraphBuilder;->expectedNodeCount:Ljava/lang/Integer;

    .line 195
    iget-object p0, p0, Lcom/google/common/graph/ValueGraphBuilder;->incidentEdgeOrder:Lcom/google/common/graph/ElementOrder;

    iput-object p0, v0, Lcom/google/common/graph/ValueGraphBuilder;->incidentEdgeOrder:Lcom/google/common/graph/ElementOrder;

    return-object v0
.end method

.method public expectedNodeCount(I)Lcom/google/common/graph/ValueGraphBuilder;
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
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN;TV;>;"
        }
    .end annotation

    .line 141
    invoke-static {p1}, Lcom/google/common/graph/Graphs;->checkNonNegative(I)I

    move-result p1

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/graph/ValueGraphBuilder;->expectedNodeCount:Ljava/lang/Integer;

    return-object p0
.end method

.method public immutable()Lcom/google/common/graph/ImmutableValueGraph$Builder;
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;V1:TV;>()",
            "Lcom/google/common/graph/ImmutableValueGraph$Builder<",
            "TN1;TV1;>;"
        }
    .end annotation

    .line 117
    invoke-direct {p0}, Lcom/google/common/graph/ValueGraphBuilder;->cast()Lcom/google/common/graph/ValueGraphBuilder;

    move-result-object p0

    .line 118
    new-instance v0, Lcom/google/common/graph/ImmutableValueGraph$Builder;

    invoke-direct {v0, p0}, Lcom/google/common/graph/ImmutableValueGraph$Builder;-><init>(Lcom/google/common/graph/ValueGraphBuilder;)V

    return-object v0
.end method

.method public incidentEdgeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/ValueGraphBuilder;
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "incidentEdgeOrder"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<N1:TN;>(",
            "Lcom/google/common/graph/ElementOrder<",
            "TN1;>;)",
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN1;TV;>;"
        }
    .end annotation

    .line 172
    invoke-virtual {p1}, Lcom/google/common/graph/ElementOrder;->type()Lcom/google/common/graph/ElementOrder$Type;

    move-result-object v0

    sget-object v1, Lcom/google/common/graph/ElementOrder$Type;->UNORDERED:Lcom/google/common/graph/ElementOrder$Type;

    if-eq v0, v1, :cond_0

    .line 173
    invoke-virtual {p1}, Lcom/google/common/graph/ElementOrder;->type()Lcom/google/common/graph/ElementOrder$Type;

    move-result-object v0

    sget-object v1, Lcom/google/common/graph/ElementOrder$Type;->STABLE:Lcom/google/common/graph/ElementOrder$Type;

    if-eq v0, v1, :cond_0

    const/4 v0, 0x0

    goto :goto_0

    :cond_0
    const/4 v0, 0x1

    :goto_0
    const-string v1, "The given elementOrder (%s) is unsupported. incidentEdgeOrder() only supports ElementOrder.unordered() and ElementOrder.stable()."

    .line 171
    invoke-static {v0, v1, p1}, Lcom/google/common/base/Preconditions;->checkArgument(ZLjava/lang/String;Ljava/lang/Object;)V

    .line 177
    invoke-direct {p0}, Lcom/google/common/graph/ValueGraphBuilder;->cast()Lcom/google/common/graph/ValueGraphBuilder;

    move-result-object p0

    .line 178
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/graph/ElementOrder;

    iput-object p1, p0, Lcom/google/common/graph/ValueGraphBuilder;->incidentEdgeOrder:Lcom/google/common/graph/ElementOrder;

    return-object p0
.end method

.method public nodeOrder(Lcom/google/common/graph/ElementOrder;)Lcom/google/common/graph/ValueGraphBuilder;
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
            "Lcom/google/common/graph/ValueGraphBuilder<",
            "TN1;TV;>;"
        }
    .end annotation

    .line 151
    invoke-direct {p0}, Lcom/google/common/graph/ValueGraphBuilder;->cast()Lcom/google/common/graph/ValueGraphBuilder;

    move-result-object p0

    .line 152
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/graph/ElementOrder;

    iput-object p1, p0, Lcom/google/common/graph/ValueGraphBuilder;->nodeOrder:Lcom/google/common/graph/ElementOrder;

    return-object p0
.end method
