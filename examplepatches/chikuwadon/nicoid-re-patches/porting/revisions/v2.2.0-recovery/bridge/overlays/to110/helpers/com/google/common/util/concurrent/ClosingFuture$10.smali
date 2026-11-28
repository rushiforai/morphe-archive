.class public final synthetic Lcom/google/common/util/concurrent/ClosingFuture$10;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/util/concurrent/ClosingFuture$AsyncClosingFunction;


# instance fields
.field public final synthetic f$0:Lcom/google/common/util/concurrent/AsyncFunction;


# direct methods
.method public synthetic constructor <init>(Lcom/google/common/util/concurrent/AsyncFunction;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$10;->f$0:Lcom/google/common/util/concurrent/AsyncFunction;

    return-void
.end method


# virtual methods
.method public final apply(Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ClosingFuture;
    .registers 3

    .line 0
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$10;->f$0:Lcom/google/common/util/concurrent/AsyncFunction;

    invoke-static {p0, p1, p2}, Lcom/google/common/util/concurrent/ClosingFuture;->lambda$withoutCloser$0(Lcom/google/common/util/concurrent/AsyncFunction;Lcom/google/common/util/concurrent/ClosingFuture$DeferredCloser;Ljava/lang/Object;)Lcom/google/common/util/concurrent/ClosingFuture;

    move-result-object p0

    return-object p0
.end method
