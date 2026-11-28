.class final Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;
.super Ljava/lang/Object;
.source "AbstractFuture.java"

# interfaces
.implements Ljava/lang/Runnable;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/AbstractFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "DelegatingToFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ljava/lang/Runnable;"
    }
.end annotation


# instance fields
.field final future:Lcom/google/common/util/concurrent/ListenableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TV;>;"
        }
    .end annotation
.end field

.field final owner:Lcom/google/common/util/concurrent/AbstractFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/AbstractFuture<",
            "TV;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/AbstractFuture;Lcom/google/common/util/concurrent/ListenableFuture;)V
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "owner",
            "future"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/AbstractFuture<",
            "TV;>;",
            "Lcom/google/common/util/concurrent/ListenableFuture<",
            "+TV;>;)V"
        }
    .end annotation

    .line 208
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 209
    iput-object p1, p0, Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;->owner:Lcom/google/common/util/concurrent/AbstractFuture;

    .line 210
    iput-object p2, p0, Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;->future:Lcom/google/common/util/concurrent/ListenableFuture;

    return-void
.end method


# virtual methods
.method public run()V
    .registers 3

    .line 215
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;->owner:Lcom/google/common/util/concurrent/AbstractFuture;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->value()Ljava/lang/Object;

    move-result-object v0

    if-ne v0, p0, :cond_0

    .line 219
    iget-object v0, p0, Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;->future:Lcom/google/common/util/concurrent/ListenableFuture;

    # invokes: Lcom/google/common/util/concurrent/AbstractFuture;->getFutureValue(Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;
    invoke-static {v0}, Lcom/google/common/util/concurrent/AbstractFuture;->access$000(Lcom/google/common/util/concurrent/ListenableFuture;)Ljava/lang/Object;

    move-result-object v0

    .line 220
    iget-object v1, p0, Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;->owner:Lcom/google/common/util/concurrent/AbstractFuture;

    invoke-static {v1, p0, v0}, Lcom/google/common/util/concurrent/AbstractFutureState;->casValue(Lcom/google/common/util/concurrent/AbstractFutureState;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 221
    iget-object p0, p0, Lcom/google/common/util/concurrent/AbstractFuture$DelegatingToFuture;->owner:Lcom/google/common/util/concurrent/AbstractFuture;

    const/4 v0, 0x0

    # invokes: Lcom/google/common/util/concurrent/AbstractFuture;->complete(Lcom/google/common/util/concurrent/AbstractFuture;Z)V
    invoke-static {p0, v0}, Lcom/google/common/util/concurrent/AbstractFuture;->access$100(Lcom/google/common/util/concurrent/AbstractFuture;Z)V

    :cond_0
    return-void
.end method
