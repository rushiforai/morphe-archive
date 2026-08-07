.class public final Ll/yn50$d;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/yn50;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        "R:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public final f:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;"
        }
    .end annotation
.end field

.field public final g:I

.field public final h:Ll/xk90;

.field public final i:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final k:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Ll/wqe0;

.field public volatile m:Z

.field public volatile n:Z


# direct methods
.method public constructor <init>(Ll/gcg0;Ll/qcj;II)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;II)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/yn50$d;->f:Ll/qcj;

    .line 7
    .line 8
    iput p4, p0, Ll/yn50$d;->g:I

    .line 9
    .line 10
    new-instance p1, Ll/xk90;

    .line 11
    .line 12
    invoke-direct {p1}, Ll/xk90;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Ll/yn50$d;->h:Ll/xk90;

    .line 16
    .line 17
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Ll/yn50$d;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 25
    .line 26
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 30
    .line 31
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 32
    .line 33
    .line 34
    move-result p1

    .line 35
    if-eqz p1, :cond_0

    .line 36
    .line 37
    new-instance p1, Lrx/internal/util/unsafe/SpscArrayQueue;

    .line 38
    .line 39
    invoke-direct {p1, p3}, Lrx/internal/util/unsafe/SpscArrayQueue;-><init>(I)V

    .line 40
    .line 41
    .line 42
    goto :goto_0

    .line 43
    :cond_0
    new-instance p1, Ll/ozf0;

    .line 44
    .line 45
    invoke-direct {p1, p3}, Ll/ozf0;-><init>(I)V

    .line 46
    .line 47
    .line 48
    :goto_0
    iput-object p1, p0, Ll/yn50$d;->i:Ljava/util/Queue;

    .line 49
    .line 50
    new-instance p1, Ll/wqe0;

    .line 51
    .line 52
    invoke-direct {p1}, Ll/wqe0;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Ll/yn50$d;->l:Ll/wqe0;

    .line 56
    .line 57
    int-to-long p1, p3

    .line 58
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 59
    .line 60
    .line 61
    return-void
.end method


# virtual methods
.method public g()V
    .locals 7

    .line 1
    iget-object v0, p0, Ll/yn50$d;->j:Ljava/util/concurrent/atomic/AtomicInteger;

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
    goto/16 :goto_4

    .line 10
    .line 11
    :cond_0
    iget v0, p0, Ll/yn50$d;->g:I

    .line 12
    .line 13
    :cond_1
    :goto_0
    iget-object v1, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/gcg0;->isUnsubscribed()Z

    .line 16
    .line 17
    .line 18
    move-result v1

    .line 19
    if-eqz v1, :cond_2

    .line 20
    .line 21
    goto/16 :goto_4

    .line 22
    .line 23
    :cond_2
    iget-boolean v1, p0, Ll/yn50$d;->n:Z

    .line 24
    .line 25
    if-nez v1, :cond_a

    .line 26
    .line 27
    const/4 v1, 0x1

    .line 28
    if-ne v0, v1, :cond_3

    .line 29
    .line 30
    iget-object v2, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 31
    .line 32
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object v2

    .line 36
    if-eqz v2, :cond_3

    .line 37
    .line 38
    iget-object v0, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 39
    .line 40
    invoke-static {v0}, Lrx/internal/util/ExceptionsUtils;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    invoke-static {v0}, Lrx/internal/util/ExceptionsUtils;->isTerminated(Ljava/lang/Throwable;)Z

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    if-nez v1, :cond_b

    .line 49
    .line 50
    iget-object p0, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 51
    .line 52
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :cond_3
    iget-boolean v2, p0, Ll/yn50$d;->m:Z

    .line 57
    .line 58
    iget-object v3, p0, Ll/yn50$d;->i:Ljava/util/Queue;

    .line 59
    .line 60
    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v3

    .line 64
    if-nez v3, :cond_4

    .line 65
    .line 66
    move v4, v1

    .line 67
    goto :goto_1

    .line 68
    :cond_4
    const/4 v4, 0x0

    .line 69
    :goto_1
    if-eqz v2, :cond_6

    .line 70
    .line 71
    if-eqz v4, :cond_6

    .line 72
    .line 73
    iget-object v0, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 74
    .line 75
    invoke-static {v0}, Lrx/internal/util/ExceptionsUtils;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    if-nez v0, :cond_5

    .line 80
    .line 81
    iget-object p0, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 82
    .line 83
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 84
    .line 85
    .line 86
    return-void

    .line 87
    :cond_5
    invoke-static {v0}, Lrx/internal/util/ExceptionsUtils;->isTerminated(Ljava/lang/Throwable;)Z

    .line 88
    .line 89
    .line 90
    move-result v1

    .line 91
    if-nez v1, :cond_b

    .line 92
    .line 93
    iget-object p0, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 94
    .line 95
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 96
    .line 97
    .line 98
    return-void

    .line 99
    :cond_6
    if-nez v4, :cond_a

    .line 100
    .line 101
    :try_start_0
    iget-object v2, p0, Ll/yn50$d;->f:Ll/qcj;

    .line 102
    .line 103
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 104
    .line 105
    .line 106
    move-result-object v4

    .line 107
    invoke-virtual {v4, v3}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-interface {v2, v3}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    check-cast v2, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 116
    .line 117
    if-nez v2, :cond_7

    .line 118
    .line 119
    new-instance v0, Ljava/lang/NullPointerException;

    .line 120
    .line 121
    const-string v1, "The source returned by the mapper was null"

    .line 122
    .line 123
    invoke-direct {v0, v1}, Ljava/lang/NullPointerException;-><init>(Ljava/lang/String;)V

    .line 124
    .line 125
    .line 126
    invoke-virtual {p0, v0}, Ll/yn50$d;->h(Ljava/lang/Throwable;)V

    .line 127
    .line 128
    .line 129
    return-void

    .line 130
    :cond_7
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 131
    .line 132
    .line 133
    move-result-object v3

    .line 134
    const-wide/16 v4, 0x1

    .line 135
    .line 136
    if-eq v2, v3, :cond_9

    .line 137
    .line 138
    instance-of v3, v2, Lrx/internal/util/ScalarSynchronousObservable;

    .line 139
    .line 140
    if-eqz v3, :cond_8

    .line 141
    .line 142
    check-cast v2, Lrx/internal/util/ScalarSynchronousObservable;

    .line 143
    .line 144
    iput-boolean v1, p0, Ll/yn50$d;->n:Z

    .line 145
    .line 146
    iget-object v1, p0, Ll/yn50$d;->h:Ll/xk90;

    .line 147
    .line 148
    new-instance v3, Ll/yn50$b;

    .line 149
    .line 150
    invoke-virtual {v2}, Lrx/internal/util/ScalarSynchronousObservable;->c()Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    invoke-direct {v3, v2, p0}, Ll/yn50$b;-><init>(Ljava/lang/Object;Ll/yn50$d;)V

    .line 155
    .line 156
    .line 157
    invoke-virtual {v1, v3}, Ll/xk90;->c(Ll/vk90;)V

    .line 158
    .line 159
    .line 160
    goto :goto_2

    .line 161
    :cond_8
    new-instance v3, Ll/yn50$c;

    .line 162
    .line 163
    invoke-direct {v3, p0}, Ll/yn50$c;-><init>(Ll/yn50$d;)V

    .line 164
    .line 165
    .line 166
    iget-object v6, p0, Ll/yn50$d;->l:Ll/wqe0;

    .line 167
    .line 168
    invoke-virtual {v6, v3}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 169
    .line 170
    .line 171
    invoke-virtual {v3}, Ll/gcg0;->isUnsubscribed()Z

    .line 172
    .line 173
    .line 174
    move-result v6

    .line 175
    if-nez v6, :cond_b

    .line 176
    .line 177
    iput-boolean v1, p0, Ll/yn50$d;->n:Z

    .line 178
    .line 179
    invoke-virtual {v2, v3}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 180
    .line 181
    .line 182
    :goto_2
    invoke-virtual {p0, v4, v5}, Ll/gcg0;->e(J)V

    .line 183
    .line 184
    .line 185
    goto :goto_3

    .line 186
    :cond_9
    invoke-virtual {p0, v4, v5}, Ll/gcg0;->e(J)V

    .line 187
    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :catchall_0
    move-exception v0

    .line 192
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 193
    .line 194
    .line 195
    invoke-virtual {p0, v0}, Ll/yn50$d;->h(Ljava/lang/Throwable;)V

    .line 196
    .line 197
    .line 198
    return-void

    .line 199
    :cond_a
    :goto_3
    iget-object v1, p0, Ll/yn50$d;->j:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 200
    .line 201
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->decrementAndGet()I

    .line 202
    .line 203
    .line 204
    move-result v1

    .line 205
    if-nez v1, :cond_1

    .line 206
    .line 207
    :cond_b
    :goto_4
    return-void
.end method

.method public h(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 5
    .line 6
    invoke-static {v0, p1}, Lrx/internal/util/ExceptionsUtils;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_1

    .line 11
    .line 12
    iget-object p1, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 13
    .line 14
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    .line 15
    .line 16
    .line 17
    move-result-object p1

    .line 18
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->isTerminated(Ljava/lang/Throwable;)Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    if-nez v0, :cond_0

    .line 23
    .line 24
    iget-object p0, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 25
    .line 26
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 27
    .line 28
    .line 29
    :cond_0
    return-void

    .line 30
    :cond_1
    invoke-virtual {p0, p1}, Ll/yn50$d;->l(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public i(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Ll/yn50$d;->h:Ll/xk90;

    .line 8
    .line 9
    invoke-virtual {v0, p1, p2}, Ll/xk90;->b(J)V

    .line 10
    .line 11
    .line 12
    :cond_0
    const/4 p1, 0x0

    .line 13
    iput-boolean p1, p0, Ll/yn50$d;->n:Z

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/yn50$d;->g()V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public j(Ljava/lang/Throwable;J)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lrx/internal/util/ExceptionsUtils;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/yn50$d;->l(Ljava/lang/Throwable;)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget p1, p0, Ll/yn50$d;->g:I

    .line 14
    .line 15
    if-nez p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 18
    .line 19
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->isTerminated(Ljava/lang/Throwable;)Z

    .line 24
    .line 25
    .line 26
    move-result p2

    .line 27
    if-nez p2, :cond_1

    .line 28
    .line 29
    iget-object p2, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 30
    .line 31
    invoke-interface {p2, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 32
    .line 33
    .line 34
    :cond_1
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_2
    const-wide/16 v0, 0x0

    .line 39
    .line 40
    cmp-long p1, p2, v0

    .line 41
    .line 42
    if-eqz p1, :cond_3

    .line 43
    .line 44
    iget-object p1, p0, Ll/yn50$d;->h:Ll/xk90;

    .line 45
    .line 46
    invoke-virtual {p1, p2, p3}, Ll/xk90;->b(J)V

    .line 47
    .line 48
    .line 49
    :cond_3
    const/4 p1, 0x0

    .line 50
    iput-boolean p1, p0, Ll/yn50$d;->n:Z

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/yn50$d;->g()V

    .line 53
    .line 54
    .line 55
    return-void
.end method

.method public k(Ljava/lang/Object;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TR;)V"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public l(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public m(J)V
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p1, v0

    .line 4
    .line 5
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object p0, p0, Ll/yn50$d;->h:Ll/xk90;

    .line 8
    .line 9
    invoke-virtual {p0, p1, p2}, Ll/xk90;->request(J)V

    .line 10
    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    if-ltz v0, :cond_1

    .line 14
    .line 15
    return-void

    .line 16
    :cond_1
    const-string p0, "n >= 0 required but it was "

    .line 17
    .line 18
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 19
    .line 20
    .line 21
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/yn50$d;->m:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/yn50$d;->g()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lrx/internal/util/ExceptionsUtils;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_2

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/yn50$d;->m:Z

    .line 11
    .line 12
    iget p1, p0, Ll/yn50$d;->g:I

    .line 13
    .line 14
    if-nez p1, :cond_1

    .line 15
    .line 16
    iget-object p1, p0, Ll/yn50$d;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 17
    .line 18
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->isTerminated(Ljava/lang/Throwable;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-nez v0, :cond_0

    .line 27
    .line 28
    iget-object v0, p0, Ll/yn50$d;->e:Ll/gcg0;

    .line 29
    .line 30
    invoke-interface {v0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    iget-object p0, p0, Ll/yn50$d;->l:Ll/wqe0;

    .line 34
    .line 35
    invoke-virtual {p0}, Ll/wqe0;->unsubscribe()V

    .line 36
    .line 37
    .line 38
    return-void

    .line 39
    :cond_1
    invoke-virtual {p0}, Ll/yn50$d;->g()V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_2
    invoke-virtual {p0, p1}, Ll/yn50$d;->l(Ljava/lang/Throwable;)V

    .line 44
    .line 45
    .line 46
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
    iget-object v0, p0, Ll/yn50$d;->i:Ljava/util/Queue;

    .line 2
    .line 3
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 18
    .line 19
    .line 20
    new-instance p1, Lrx/exceptions/MissingBackpressureException;

    .line 21
    .line 22
    invoke-direct {p1}, Lrx/exceptions/MissingBackpressureException;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-virtual {p0, p1}, Ll/yn50$d;->onError(Ljava/lang/Throwable;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    invoke-virtual {p0}, Ll/yn50$d;->g()V

    .line 30
    .line 31
    .line 32
    return-void
.end method
