.class final Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;
.super Ljava/lang/Object;
.source "CallbackToFutureAdapter.java"

# interfaces
.implements Lcom/google/common/util/concurrent/ListenableFuture;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Landroidx/concurrent/futures/CallbackToFutureAdapter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "SafeFuture"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Lcom/google/common/util/concurrent/ListenableFuture<",
        "TT;>;"
    }
.end annotation


# instance fields
.field final completerWeakReference:Ljava/lang/ref/WeakReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/lang/ref/WeakReference<",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field private final delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Landroidx/concurrent/futures/AbstractResolvableFuture<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;)V
    .registers 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer<",
            "TT;>;)V"
        }
    .end annotation

    .line 141
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 145
    new-instance v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture$1;

    invoke-direct {v0, p0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture$1;-><init>(Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;)V

    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    .line 142
    new-instance v0, Ljava/lang/ref/WeakReference;

    invoke-direct {v0, p1}, Ljava/lang/ref/WeakReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->completerWeakReference:Ljava/lang/ref/WeakReference;

    return-void
.end method


# virtual methods
.method public addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V
    .registers 3

    .line 208
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0, p1, p2}, Landroidx/concurrent/futures/AbstractResolvableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method public cancel(Z)Z
    .registers 3

    .line 162
    iget-object v0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->completerWeakReference:Ljava/lang/ref/WeakReference;

    invoke-virtual {v0}, Ljava/lang/ref/WeakReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;

    .line 163
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0, p1}, Landroidx/concurrent/futures/AbstractResolvableFuture;->cancel(Z)Z

    move-result p0

    if-eqz p0, :cond_0

    if-eqz v0, :cond_0

    .line 166
    invoke-virtual {v0}, Landroidx/concurrent/futures/CallbackToFutureAdapter$Completer;->fireCancellationListeners()V

    :cond_0
    return p0
.end method

.method cancelWithoutNotifyingCompleter(Z)Z
    .registers 2

    .line 172
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0, p1}, Landroidx/concurrent/futures/AbstractResolvableFuture;->cancel(Z)Z

    move-result p0

    return p0
.end method

.method public get()Ljava/lang/Object;
    .registers 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;
        }
    .end annotation

    .line 197
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->get()Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(J",
            "Ljava/util/concurrent/TimeUnit;",
            ")TT;"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/InterruptedException;,
            Ljava/util/concurrent/ExecutionException;,
            Ljava/util/concurrent/TimeoutException;
        }
    .end annotation

    .line 203
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0, p1, p2, p3}, Landroidx/concurrent/futures/AbstractResolvableFuture;->get(JLjava/util/concurrent/TimeUnit;)Ljava/lang/Object;

    move-result-object p0

    return-object p0
.end method

.method public isCancelled()Z
    .registers 1

    .line 187
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->isCancelled()Z

    move-result p0

    return p0
.end method

.method public isDone()Z
    .registers 1

    .line 192
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->isDone()Z

    move-result p0

    return p0
.end method

.method set(Ljava/lang/Object;)Z
    .registers 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)Z"
        }
    .end annotation

    .line 178
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0, p1}, Landroidx/concurrent/futures/AbstractResolvableFuture;->set(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method setException(Ljava/lang/Throwable;)Z
    .registers 2

    .line 182
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0, p1}, Landroidx/concurrent/futures/AbstractResolvableFuture;->setException(Ljava/lang/Throwable;)Z

    move-result p0

    return p0
.end method

.method public toString()Ljava/lang/String;
    .registers 1

    .line 213
    iget-object p0, p0, Landroidx/concurrent/futures/CallbackToFutureAdapter$SafeFuture;->delegate:Landroidx/concurrent/futures/AbstractResolvableFuture;

    invoke-virtual {p0}, Landroidx/concurrent/futures/AbstractResolvableFuture;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
