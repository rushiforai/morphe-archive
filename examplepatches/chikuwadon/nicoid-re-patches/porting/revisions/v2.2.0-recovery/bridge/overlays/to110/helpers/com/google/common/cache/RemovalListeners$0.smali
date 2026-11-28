.class public final synthetic Lcom/google/common/cache/RemovalListeners$0;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Lcom/google/common/cache/RemovalListener;


# instance fields
.field public final synthetic f$0:Ljava/util/concurrent/Executor;

.field public final synthetic f$1:Lcom/google/common/cache/RemovalListener;


# direct methods
.method public synthetic constructor <init>(Ljava/util/concurrent/Executor;Lcom/google/common/cache/RemovalListener;)V
    .registers 3

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/cache/RemovalListeners$0;->f$0:Ljava/util/concurrent/Executor;

    iput-object p2, p0, Lcom/google/common/cache/RemovalListeners$0;->f$1:Lcom/google/common/cache/RemovalListener;

    return-void
.end method


# virtual methods
.method public final onRemoval(Lcom/google/common/cache/RemovalNotification;)V
    .registers 3

    .line 0
    iget-object v0, p0, Lcom/google/common/cache/RemovalListeners$0;->f$0:Ljava/util/concurrent/Executor;

    iget-object p0, p0, Lcom/google/common/cache/RemovalListeners$0;->f$1:Lcom/google/common/cache/RemovalListener;

    invoke-static {v0, p0, p1}, Lcom/google/common/cache/RemovalListeners;->lambda$asynchronous$0(Ljava/util/concurrent/Executor;Lcom/google/common/cache/RemovalListener;Lcom/google/common/cache/RemovalNotification;)V

    return-void
.end method
