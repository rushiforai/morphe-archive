.class abstract Lcom/google/common/graph/EndpointPairIterator;
.super Lcom/google/common/collect/AbstractIterator;
.source "EndpointPairIterator.java"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/google/common/graph/EndpointPairIterator$Directed;,
        Lcom/google/common/graph/EndpointPairIterator$Undirected;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<N:",
        "Ljava/lang/Object;",
        ">",
        "Lcom/google/common/collect/AbstractIterator<",
        "Lcom/google/common/graph/EndpointPair<",
        "TN;>;>;"
    }
.end annotation


# instance fields
.field private final graph:Lcom/google/common/graph/BaseGraph;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/graph/BaseGraph<",
            "TN;>;"
        }
    .end annotation
.end field

.field node:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TN;"
        }
    .end annotation
.end field

.field private final nodeIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "TN;>;"
        }
    .end annotation
.end field

.field successorIterator:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "TN;>;"
        }
    .end annotation
.end field


# direct methods
.method private constructor <init>(Lcom/google/common/graph/BaseGraph;)V
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
            "(",
            "Lcom/google/common/graph/BaseGraph<",
            "TN;>;)V"
        }
    .end annotation

    .line 46
    invoke-direct {p0}, Lcom/google/common/collect/AbstractIterator;-><init>()V

    const/4 v0, 0x0

    .line 38
    iput-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->node:Ljava/lang/Object;

    .line 40
    invoke-static {}, Lcom/google/common/collect/ImmutableSet;->of()Lcom/google/common/collect/ImmutableSet;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/collect/ImmutableSet;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->successorIterator:Ljava/util/Iterator;

    .line 47
    iput-object p1, p0, Lcom/google/common/graph/EndpointPairIterator;->graph:Lcom/google/common/graph/BaseGraph;

    .line 48
    invoke-interface {p1}, Lcom/google/common/graph/BaseGraph;->nodes()Ljava/util/Set;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p1

    iput-object p1, p0, Lcom/google/common/graph/EndpointPairIterator;->nodeIterator:Ljava/util/Iterator;

    return-void
.end method

.method synthetic constructor <init>(Lcom/google/common/graph/BaseGraph;Lcom/google/common/graph/EndpointPairIterator$1;)V
    .registers 3

    .line 34
    invoke-direct {p0, p1}, Lcom/google/common/graph/EndpointPairIterator;-><init>(Lcom/google/common/graph/BaseGraph;)V

    return-void
.end method

.method static of(Lcom/google/common/graph/BaseGraph;)Lcom/google/common/graph/EndpointPairIterator;
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
            ">(",
            "Lcom/google/common/graph/BaseGraph<",
            "TN;>;)",
            "Lcom/google/common/graph/EndpointPairIterator<",
            "TN;>;"
        }
    .end annotation

    .line 43
    invoke-interface {p0}, Lcom/google/common/graph/BaseGraph;->isDirected()Z

    move-result v0

    const/4 v1, 0x0

    if-eqz v0, :cond_0

    new-instance v0, Lcom/google/common/graph/EndpointPairIterator$Directed;

    invoke-direct {v0, p0, v1}, Lcom/google/common/graph/EndpointPairIterator$Directed;-><init>(Lcom/google/common/graph/BaseGraph;Lcom/google/common/graph/EndpointPairIterator$1;)V

    return-object v0

    :cond_0
    new-instance v0, Lcom/google/common/graph/EndpointPairIterator$Undirected;

    invoke-direct {v0, p0, v1}, Lcom/google/common/graph/EndpointPairIterator$Undirected;-><init>(Lcom/google/common/graph/BaseGraph;Lcom/google/common/graph/EndpointPairIterator$1;)V

    return-object v0
.end method


# virtual methods
.method final advance()Z
    .registers 4

    .line 56
    iget-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->successorIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    invoke-static {v0}, Lcom/google/common/base/Preconditions;->checkState(Z)V

    .line 57
    iget-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->nodeIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-nez v0, :cond_0

    const/4 p0, 0x0

    return p0

    .line 60
    :cond_0
    iget-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->nodeIterator:Ljava/util/Iterator;

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->node:Ljava/lang/Object;

    .line 61
    iget-object v2, p0, Lcom/google/common/graph/EndpointPairIterator;->graph:Lcom/google/common/graph/BaseGraph;

    invoke-interface {v2, v0}, Lcom/google/common/graph/BaseGraph;->successors(Ljava/lang/Object;)Ljava/util/Set;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object v0

    iput-object v0, p0, Lcom/google/common/graph/EndpointPairIterator;->successorIterator:Ljava/util/Iterator;

    return v1
.end method
