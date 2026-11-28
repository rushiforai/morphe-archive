.class final Lcom/google/common/util/concurrent/ClosingFuture$State;
.super Ljava/lang/Object;
.source "ClosingFuture.java"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/google/common/util/concurrent/ClosingFuture;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1a
    name = "State"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<V:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;"
    }
.end annotation


# instance fields
.field final closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

.field final future:Lcom/google/common/util/concurrent/FluentFuture;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lcom/google/common/util/concurrent/FluentFuture<",
            "TV;>;"
        }
    .end annotation
.end field

.field final status:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Lcom/google/common/util/concurrent/ClosingFuture$Status;",
            ">;"
        }
    .end annotation
.end field


# direct methods
.method constructor <init>(Lcom/google/common/util/concurrent/FluentFuture;Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "future",
            "closeables"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/FluentFuture<",
            "TV;>;",
            "Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;",
            ")V"
        }
    .end annotation

    .line 2092
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2088
    new-instance v0, Ljava/util/concurrent/atomic/AtomicReference;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-direct {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2093
    iput-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    .line 2094
    iput-object p2, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    return-void
.end method


# virtual methods
.method becomeSubsumedInto(Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "otherCloseables"
        }
    .end annotation

    .line 2115
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->SUBSUMED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V

    .line 2116
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v0

    invoke-virtual {p1, p0, v0}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->add(Ljava/lang/AutoCloseable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method cancel(Z)Z
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0
        }
        names = {
            "mayInterruptIfRunning"
        }
    .end annotation

    .line 2178
    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->logger:Lcom/google/common/util/concurrent/LazyLogger;
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v2, "cancelling {0}"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2179
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    invoke-virtual {v0, p1}, Lcom/google/common/util/concurrent/FluentFuture;->cancel(Z)Z

    move-result p1

    if-eqz p1, :cond_0

    .line 2181
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->close()V

    :cond_0
    return p1
.end method

.method checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V
    .registers 4
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldStatus",
            "newStatus"
        }
    .end annotation

    .line 2099
    invoke-virtual {p0, p1, p2}, Lcom/google/common/util/concurrent/ClosingFuture$State;->compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z

    move-result p0

    const-string v0, "Expected status to be %s, but it was %s"

    .line 2098
    invoke-static {p0, v0, p1, p2}, Lcom/google/common/base/Preconditions;->checkState(ZLjava/lang/String;Ljava/lang/Object;Ljava/lang/Object;)V

    return-void
.end method

.method close()V
    .registers 4

    .line 2110
    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->logger:Lcom/google/common/util/concurrent/LazyLogger;
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v2, "closing {0}"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2111
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->closeables:Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;

    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$CloseableList;->close()V

    return-void
.end method

.method closeIfLeaked()V
    .registers 4

    .line 2187
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2188
    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->logger:Lcom/google/common/util/concurrent/LazyLogger;
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    .line 2189
    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->SEVERE:Ljava/util/logging/Level;

    const-string v2, "Uh oh! An open ClosingFuture has leaked and will close: {0}"

    .line 2190
    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2191
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->finishToFuture()Lcom/google/common/util/concurrent/FluentFuture;

    :cond_0
    return-void
.end method

.method compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z
    .registers 3
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "oldStatus",
            "newStatus"
        }
    .end annotation

    .line 2106
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-static {p0, p1, p2}, Lcom/google/common/util/concurrent/ClosingFuture$0;->m(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method

.method finishToFuture()Lcom/google/common/util/concurrent/FluentFuture;
    .registers 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lcom/google/common/util/concurrent/FluentFuture<",
            "TV;>;"
        }
    .end annotation

    .line 2120
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z

    move-result v0

    if-eqz v0, :cond_0

    .line 2121
    # getter for: Lcom/google/common/util/concurrent/ClosingFuture;->logger:Lcom/google/common/util/concurrent/LazyLogger;
    invoke-static {}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3000()Lcom/google/common/util/concurrent/LazyLogger;

    move-result-object v0

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/LazyLogger;->get()Ljava/util/logging/Logger;

    move-result-object v0

    sget-object v1, Ljava/util/logging/Level;->FINER:Ljava/util/logging/Level;

    const-string v2, "will close {0}"

    invoke-virtual {v0, v1, v2, p0}, Ljava/util/logging/Logger;->log(Ljava/util/logging/Level;Ljava/lang/String;Ljava/lang/Object;)V

    .line 2122
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    new-instance v1, Lcom/google/common/util/concurrent/ClosingFuture$State$2;

    invoke-direct {v1, p0}, Lcom/google/common/util/concurrent/ClosingFuture$State$2;-><init>(Lcom/google/common/util/concurrent/ClosingFuture$State;)V

    .line 2128
    invoke-static {}, Lcom/google/common/util/concurrent/MoreExecutors;->directExecutor()Ljava/util/concurrent/Executor;

    move-result-object v2

    .line 2122
    invoke-virtual {v0, v1, v2}, Lcom/google/common/util/concurrent/FluentFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    goto :goto_0

    .line 2130
    :cond_0
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {v0}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->ordinal()I

    move-result v0

    if-eqz v0, :cond_4

    const/4 v1, 0x1

    if-eq v0, v1, :cond_3

    const/4 v1, 0x2

    if-eq v0, v1, :cond_2

    const/4 v1, 0x3

    if-eq v0, v1, :cond_2

    const/4 v1, 0x4

    if-eq v0, v1, :cond_2

    const/4 v1, 0x5

    if-eq v0, v1, :cond_1

    .line 2148
    :goto_0
    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    return-object p0

    .line 2136
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot call finishToFuture() after calling finishToValueAndCloser()"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2142
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot call finishToFuture() twice"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2132
    :cond_3
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Cannot call finishToFuture() after deriving another step"

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2145
    :cond_4
    new-instance p0, Ljava/lang/AssertionError;

    invoke-direct {p0}, Ljava/lang/AssertionError;-><init>()V

    throw p0
.end method

.method finishToValueAndCloser(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;Ljava/util/concurrent/Executor;)V
    .registers 5
    .annotation system Ldalvik/annotation/MethodParameters;
        accessFlags = {
            0x0,
            0x0
        }
        names = {
            "consumer",
            "executor"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer<",
            "-TV;>;",
            "Ljava/util/concurrent/Executor;",
            ")V"
        }
    .end annotation

    .line 2152
    invoke-static {p1}, Lcom/google/common/base/Preconditions;->checkNotNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 2153
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->OPEN:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CREATE_VALUE_AND_CLOSER:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->compareAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)Z

    move-result v0

    if-nez v0, :cond_3

    .line 2154
    iget-object p1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p1}, Lcom/google/common/util/concurrent/ClosingFuture$Status;->ordinal()I

    move-result p1

    const/4 p2, 0x1

    if-eq p1, p2, :cond_2

    const/4 p2, 0x2

    if-eq p1, p2, :cond_1

    const/4 p2, 0x3

    if-eq p1, p2, :cond_1

    const/4 p2, 0x4

    if-eq p1, p2, :cond_1

    const/4 p2, 0x5

    if-eq p1, p2, :cond_0

    .line 2171
    new-instance p1, Ljava/lang/AssertionError;

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    invoke-direct {p1, p0}, Ljava/lang/AssertionError;-><init>(Ljava/lang/Object;)V

    throw p1

    .line 2166
    :cond_0
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call finishToValueAndCloser() twice"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2162
    :cond_1
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call finishToValueAndCloser() after calling finishToFuture()"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2156
    :cond_2
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Cannot call finishToValueAndCloser() after deriving another step"

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0

    .line 2173
    :cond_3
    iget-object v0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    new-instance v1, Lcom/google/common/util/concurrent/ClosingFuture$State$1;

    invoke-direct {v1, p0, p1}, Lcom/google/common/util/concurrent/ClosingFuture$State$1;-><init>(Lcom/google/common/util/concurrent/ClosingFuture$State;Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;)V

    invoke-virtual {v0, v1, p2}, Lcom/google/common/util/concurrent/FluentFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void
.end method

.method synthetic lambda$finishToFuture$0$com-google-common-util-concurrent-ClosingFuture$State()V
    .registers 3

    .line 2124
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->WILL_CLOSE:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V

    .line 2125
    invoke-virtual {p0}, Lcom/google/common/util/concurrent/ClosingFuture$State;->close()V

    .line 2126
    sget-object v0, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSING:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    sget-object v1, Lcom/google/common/util/concurrent/ClosingFuture$Status;->CLOSED:Lcom/google/common/util/concurrent/ClosingFuture$Status;

    invoke-virtual {p0, v0, v1}, Lcom/google/common/util/concurrent/ClosingFuture$State;->checkAndUpdateStatus(Lcom/google/common/util/concurrent/ClosingFuture$Status;Lcom/google/common/util/concurrent/ClosingFuture$Status;)V

    return-void
.end method

.method synthetic lambda$finishToValueAndCloser$0$com-google-common-util-concurrent-ClosingFuture$State(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;)V
    .registers 2

    .line 2173
    # invokes: Lcom/google/common/util/concurrent/ClosingFuture;->provideValueAndCloser(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;Lcom/google/common/util/concurrent/ClosingFuture$State;)V
    invoke-static {p1, p0}, Lcom/google/common/util/concurrent/ClosingFuture;->access$3100(Lcom/google/common/util/concurrent/ClosingFuture$ValueAndCloserConsumer;Lcom/google/common/util/concurrent/ClosingFuture$State;)V

    return-void
.end method

.method public toString()Ljava/lang/String;
    .registers 4

    .line 2198
    const-string v0, "ClosingFuture"

    invoke-static {v0}, Lcom/google/common/base/MoreObjects;->toStringHelper(Ljava/lang/String;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object v1, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->status:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2199
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    move-result-object v1

    const-string v2, "status"

    invoke-virtual {v0, v2, v1}, Lcom/google/common/base/MoreObjects$ToStringHelper;->add(Ljava/lang/String;Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object v0

    iget-object p0, p0, Lcom/google/common/util/concurrent/ClosingFuture$State;->future:Lcom/google/common/util/concurrent/FluentFuture;

    .line 2200
    invoke-virtual {v0, p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->addValue(Ljava/lang/Object;)Lcom/google/common/base/MoreObjects$ToStringHelper;

    move-result-object p0

    .line 2201
    invoke-virtual {p0}, Lcom/google/common/base/MoreObjects$ToStringHelper;->toString()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method
