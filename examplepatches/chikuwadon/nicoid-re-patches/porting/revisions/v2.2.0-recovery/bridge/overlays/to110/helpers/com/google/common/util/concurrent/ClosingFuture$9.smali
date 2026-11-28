.class public final synthetic Lcom/google/common/util/concurrent/ClosingFuture$9;
.super Ljava/lang/Object;
.source "D8$$SyntheticClass"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic f$0:Ljava/lang/AutoCloseable;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/AutoCloseable;)V
    .registers 2

    .line 0
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$9;->f$0:Ljava/lang/AutoCloseable;

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 1

    .line 0
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$9;->f$0:Ljava/lang/AutoCloseable;

    invoke-static {p0}, Lcom/google/common/util/concurrent/ClosingFuture;->lambda$closeQuietly$0(Ljava/lang/AutoCloseable;)V

    return-void
.end method
