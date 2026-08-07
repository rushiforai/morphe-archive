.class final Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;
.super Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OnSubscribeFromAsync;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "BufferAsyncEmitter"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter<",
        "TT;>;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x21aef8f9f7f1cbc3L


# instance fields
.field volatile done:Z

.field error:Ljava/lang/Throwable;

.field final nl:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field final queue:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field final wip:Ljava/util/concurrent/atomic/AtomicInteger;


# direct methods
.method public constructor <init>(Ll/gcg0;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;-><init>(Ll/gcg0;)V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 5
    .line 6
    .line 7
    move-result p1

    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    new-instance p1, Lrx/internal/util/unsafe/SpscUnboundedArrayQueue;

    .line 11
    .line 12
    invoke-direct {p1, p2}, Lrx/internal/util/unsafe/SpscUnboundedArrayQueue;-><init>(I)V

    .line 13
    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    new-instance p1, Ll/rzf0;

    .line 17
    .line 18
    invoke-direct {p1, p2}, Ll/rzf0;-><init>(I)V

    .line 19
    .line 20
    .line 21
    :goto_0
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->queue:Ljava/util/Queue;

    .line 22
    .line 23
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 29
    .line 30
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->nl:Lrx/internal/operators/NotificationLite;

    .line 35
    .line 36
    return-void
.end method


# virtual methods
.method public drain()V
    .locals 14

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto/16 :goto_3

    .line 10
    .line 11
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;->actual:Ll/gcg0;

    .line 12
    .line 13
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->queue:Ljava/util/Queue;

    .line 14
    .line 15
    const/4 v2, 0x1

    .line 16
    move v3, v2

    .line 17
    :cond_1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 18
    .line 19
    .line 20
    move-result-wide v4

    .line 21
    const-wide/16 v6, 0x0

    .line 22
    .line 23
    move-wide v8, v6

    .line 24
    :goto_0
    cmp-long v10, v8, v4

    .line 25
    .line 26
    if-eqz v10, :cond_7

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 29
    .line 30
    .line 31
    move-result v11

    .line 32
    if-eqz v11, :cond_2

    .line 33
    .line 34
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    iget-boolean v11, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->done:Z

    .line 39
    .line 40
    invoke-interface {v1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 41
    .line 42
    .line 43
    move-result-object v12

    .line 44
    if-nez v12, :cond_3

    .line 45
    .line 46
    move v13, v2

    .line 47
    goto :goto_1

    .line 48
    :cond_3
    const/4 v13, 0x0

    .line 49
    :goto_1
    if-eqz v11, :cond_5

    .line 50
    .line 51
    if-eqz v13, :cond_5

    .line 52
    .line 53
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    invoke-super {p0, v0}, Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_4
    invoke-super {p0}, Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;->onCompleted()V

    .line 62
    .line 63
    .line 64
    return-void

    .line 65
    :cond_5
    if-eqz v13, :cond_6

    .line 66
    .line 67
    goto :goto_2

    .line 68
    :cond_6
    iget-object v10, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->nl:Lrx/internal/operators/NotificationLite;

    .line 69
    .line 70
    invoke-virtual {v10, v12}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v10

    .line 74
    invoke-interface {v0, v10}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 75
    .line 76
    .line 77
    const-wide/16 v10, 0x1

    .line 78
    .line 79
    add-long/2addr v8, v10

    .line 80
    goto :goto_0

    .line 81
    :cond_7
    :goto_2
    if-nez v10, :cond_a

    .line 82
    .line 83
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 84
    .line 85
    .line 86
    move-result v4

    .line 87
    if-eqz v4, :cond_8

    .line 88
    .line 89
    invoke-interface {v1}, Ljava/util/Collection;->clear()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_8
    iget-boolean v4, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->done:Z

    .line 94
    .line 95
    invoke-interface {v1}, Ljava/util/Collection;->isEmpty()Z

    .line 96
    .line 97
    .line 98
    move-result v5

    .line 99
    if-eqz v4, :cond_a

    .line 100
    .line 101
    if-eqz v5, :cond_a

    .line 102
    .line 103
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 104
    .line 105
    if-eqz v0, :cond_9

    .line 106
    .line 107
    invoke-super {p0, v0}, Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;->onError(Ljava/lang/Throwable;)V

    .line 108
    .line 109
    .line 110
    return-void

    .line 111
    :cond_9
    invoke-super {p0}, Lrx/internal/operators/OnSubscribeFromAsync$BaseAsyncEmitter;->onCompleted()V

    .line 112
    .line 113
    .line 114
    return-void

    .line 115
    :cond_a
    cmp-long v4, v8, v6

    .line 116
    .line 117
    if-eqz v4, :cond_b

    .line 118
    .line 119
    invoke-static {p0, v8, v9}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 120
    .line 121
    .line 122
    :cond_b
    iget-object v4, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 123
    .line 124
    neg-int v3, v3

    .line 125
    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 126
    .line 127
    .line 128
    move-result v3

    .line 129
    if-nez v3, :cond_1

    .line 130
    .line 131
    :goto_3
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->done:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->drain()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->error:Ljava/lang/Throwable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->done:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->drain()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->queue:Ljava/util/Queue;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->nl:Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->drain()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public onRequested()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->drain()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public onUnsubscribed()V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->wip:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object p0, p0, Lrx/internal/operators/OnSubscribeFromAsync$BufferAsyncEmitter;->queue:Ljava/util/Queue;

    .line 10
    .line 11
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method
