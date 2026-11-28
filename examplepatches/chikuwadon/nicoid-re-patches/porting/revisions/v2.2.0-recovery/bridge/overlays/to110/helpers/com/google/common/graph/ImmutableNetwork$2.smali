.class public final synthetic Lcom/google/common/graph/ImmutableNetwork$2;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/base/Function;


# instance fields
.field public final synthetic f$0:Lcom/google/common/graph/Network;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/graph/Network;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/graph/ImmutableNetwork$2;->f$0:Lcom/google/common/graph/Network;

    return-void
.end method


# virtual methods
.method public final apply(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 2

    .line 0
    iget-object p0, p0, Lcom/google/common/graph/ImmutableNetwork$2;->f$0:Lcom/google/common/graph/Network;

    invoke-static {p0, p1}, Lcom/google/common/graph/ImmutableNetwork;->lambda$targetNodeFn$0(Lcom/google/common/graph/Network;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method
