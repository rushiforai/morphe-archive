.class public final synthetic Lcom/google/common/util/concurrent/ClosingFuture$State$1;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/ClosingFuture$State;

.field public final synthetic f$1:Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/ClosingFuture$State;Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State$1;->f$0:Lcom/google/common/util/concurrent/ClosingFuture$State;

    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$State$1;->f$1:Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 2

    .line 0
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State$1;->f$0:Lcom/google/common/util/concurrent/ClosingFuture$State;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State$1;->f$1:Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;

    invoke-virtual {v0, p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->lambda$finishToValueAndCloser$0$com-google-common-util-concurrent-ClosingFuture$State(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;)V

    return-void
.end method
