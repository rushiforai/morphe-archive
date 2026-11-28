.class public final synthetic Lcom/google/common/graph/AbstractNetwork$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Predicate;


# instance fields
.field public final synthetic f$0:Lcom/google/common/graph/AbstractNetwork;

.field public final synthetic f$1:Ljava/lang/Object;

.field public final synthetic f$2:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/graph/AbstractNetwork;Ljava/lang/Object;Ljava/lang/Object;)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/graph/AbstractNetwork$0;->f$0:Lcom/google/common/graph/AbstractNetwork;

    iput-object p2, p0, Lcom/google/common/graph/AbstractNetwork$0;->f$1:Ljava/lang/Object;

    iput-object p3, p0, Lcom/google/common/graph/AbstractNetwork$0;->f$2:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Z
    .registers 4

    .line 0
    iget-object v0, p0, Lcom/google/common/graph/AbstractNetwork$0;->f$0:Lcom/google/common/graph/AbstractNetwork;

    iget-object v1, p0, Lcom/google/common/graph/AbstractNetwork$0;->f$1:Ljava/lang/Object;

    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$0;->f$2:Ljava/lang/Object;

    invoke-virtual {v0, v1, p0, p1}, Lcom/google/common/graph/AbstractNetwork;->lambda$connectedPredicate$0$com-google-common-graph-AbstractNetwork(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method
