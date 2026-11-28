.class Lcom/google/common/graph/DirectedGraphConnections$1;
.super Ljava/util/AbstractSet;
.source "DirectedGraphConnections.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingMethod;
    value = Lcom/google/common/graph/DirectedGraphConnections;->adjacentNodes()Ljava/util/Set;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x0
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ljava/util/AbstractSet<",
        "TN;>;"
    }
.end annotation


# instance fields
.field final synthetic this$0:Lcom/google/common/graph/DirectedGraphConnections;


# direct methods
.method constructor <init>(Lcom/google/common/graph/DirectedGraphConnections;)V
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x8010
        }
        names = {
            "this$0"
        }
    .end annotation

    .line 239
    iput-object p1, p0, Lcom/google/common/graph/DirectedGraphConnections$1;->this$0:Lcom/google/common/graph/DirectedGraphConnections;

    invoke-direct {p0}, Ljava/util/AbstractSet;-><init>()V

    return-void
.end method


# virtual methods
.method public contains(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "obj"
        }
    .end annotation

    .line 266
    iget-object p0, p0, Lcom/google/common/graph/DirectedGraphConnections$1;->this$0:Lcom/google/common/graph/DirectedGraphConnections;

    # getter for: Lcom/google/common/graph/DirectedGraphConnections;->adjacentNodeValues:Ljava/util/Map;
    invoke-static {p0}, Lcom/google/common/graph/DirectedGraphConnections;->access$100(Lcom/google/common/graph/DirectedGraphConnections;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0, p1}, Ljava/util/Map;->containsKey(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method public iterator()Lcom/google/common/collect/UnmodifiableIterator;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/collect/UnmodifiableIterator<",
            "TN;>;"
        }
    .end annotation

    .line 242
    iget-object v0, p0, Lcom/google/common/graph/DirectedGraphConnections$1;->this$0:Lcom/google/common/graph/DirectedGraphConnections;

    # getter for: Lcom/google/common/graph/DirectedGraphConnections;->orderedNodeConnections:Ljava/util/List;
    invoke-static {v0}, Lcom/google/common/graph/DirectedGraphConnections;->access$000(Lcom/google/common/graph/DirectedGraphConnections;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    .line 243
    new-instance v1, Ljava/util/HashSet;

    invoke-direct {v1}, Ljava/util/HashSet;-><init>()V

    .line 244
    new-instance v2, Lcom/google/common/graph/DirectedGraphConnections$1$1;

    invoke-direct {v2, p0, v0, v1}, Lcom/google/common/graph/DirectedGraphConnections$1$1;-><init>(Lcom/google/common/graph/DirectedGraphConnections$1;Ljava/util/Iterator;Ljava/util/Set;)V

    return-object v2
.end method

.method public bridge synthetic iterator()Ljava/util/Iterator;
    .registers 1

    .line 239
    invoke-virtual {p0}, Lcom/google/common/graph/DirectedGraphConnections$1;->iterator()Lcom/google/common/collect/UnmodifiableIterator;

    move-result-object p0

    return-object p0
.end method

.method public size()I
    .registers 1

    .line 261
    iget-object p0, p0, Lcom/google/common/graph/DirectedGraphConnections$1;->this$0:Lcom/google/common/graph/DirectedGraphConnections;

    # getter for: Lcom/google/common/graph/DirectedGraphConnections;->adjacentNodeValues:Ljava/util/Map;
    invoke-static {p0}, Lcom/google/common/graph/DirectedGraphConnections;->access$100(Lcom/google/common/graph/DirectedGraphConnections;)Ljava/util/Map;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Map;->size()I

    move-result p0

    return p0
.end method
