.class public final synthetic Lcom/google/common/util/concurrent/Futures$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/Futures$InCompletionOrderState;

.field public final synthetic f$1:Lcom/google/common/collect/ImmutableList;

.field public final synthetic f$2:I


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/Futures$InCompletionOrderState;Lcom/google/common/collect/ImmutableList;I)V
    .registers 4

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/Futures$0;->f$0:Lcom/google/common/util/concurrent/Futures$InCompletionOrderState;

    iput-object p2, p0, Lcom/google/common/util/concurrent/Futures$0;->f$1:Lcom/google/common/collect/ImmutableList;

    iput p3, p0, Lcom/google/common/util/concurrent/Futures$0;->f$2:I

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/Futures$0;->f$0:Lcom/google/common/util/concurrent/Futures$InCompletionOrderState;

    iget-object v1, p0, Lcom/google/common/util/concurrent/Futures$0;->f$1:Lcom/google/common/collect/ImmutableList;

    iget p0, p0, Lcom/google/common/util/concurrent/Futures$0;->f$2:I

    invoke-static {v0, v1, p0}, Lcom/google/common/util/concurrent/Futures;->lambda$inCompletionOrder$0(Lcom/google/common/util/concurrent/Futures$InCompletionOrderState;Lcom/google/common/collect/ImmutableList;I)V

    return-void
.end method
