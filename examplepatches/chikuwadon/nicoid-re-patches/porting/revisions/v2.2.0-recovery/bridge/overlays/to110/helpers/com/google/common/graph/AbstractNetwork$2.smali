.class public final synthetic Lcom/google/common/graph/AbstractNetwork$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Supplier;


# instance fields
.field public final synthetic f$0:Lcom/google/common/graph/AbstractNetwork;

.field public final synthetic f$1:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/graph/AbstractNetwork;Ljava/lang/Object;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/graph/AbstractNetwork$2;->f$0:Lcom/google/common/graph/AbstractNetwork;

    iput-object p2, p0, Lcom/google/common/graph/AbstractNetwork$2;->f$1:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object v0, p0, Lcom/google/common/graph/AbstractNetwork$2;->f$0:Lcom/google/common/graph/AbstractNetwork;

    iget-object p0, p0, Lcom/google/common/graph/AbstractNetwork$2;->f$1:Ljava/lang/Object;

    invoke-virtual {v0, p0}, Lcom/google/common/graph/AbstractNetwork;->lambda$nodeInvalidatableSet$0$com-google-common-graph-AbstractNetwork(Ljava/lang/Object;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method
