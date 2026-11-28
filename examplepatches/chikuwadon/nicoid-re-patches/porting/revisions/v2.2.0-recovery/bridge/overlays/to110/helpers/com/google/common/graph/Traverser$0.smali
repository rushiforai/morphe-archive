.class public final synthetic Lcom/google/common/graph/Traverser$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Iterable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/graph/Traverser;

.field public final synthetic f$1:Lcom/google/common/collect/ImmutableSet;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/graph/Traverser;Lcom/google/common/collect/ImmutableSet;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/graph/Traverser$0;->f$0:Lcom/google/common/graph/Traverser;

    iput-object p2, p0, Lcom/google/common/graph/Traverser$0;->f$1:Lcom/google/common/collect/ImmutableSet;

    return-void
.end method


# virtual methods
.method public final iterator()Ljava/util/Iterator;
    .registers 2

    .line 0
    iget-object v0, p0, Lcom/google/common/graph/Traverser$0;->f$0:Lcom/google/common/graph/Traverser;

    iget-object p0, p0, Lcom/google/common/graph/Traverser$0;->f$1:Lcom/google/common/collect/ImmutableSet;

    invoke-virtual {v0, p0}, Lcom/google/common/graph/Traverser;->lambda$depthFirstPreOrder$0$com-google-common-graph-Traverser(Lcom/google/common/collect/ImmutableSet;)Ljava/util/Iterator;

    move-result-object p0

    return-object p0
.end method
