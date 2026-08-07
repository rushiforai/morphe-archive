.class public final Lrx/internal/operators/OperatorEagerConcatMap$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorEagerConcatMap;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "b"
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
.field public final e:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;"
        }
    .end annotation
.end field

.field public final f:I

.field public final g:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TR;>;"
        }
    .end annotation
.end field

.field public final h:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Lrx/internal/operators/OperatorEagerConcatMap$a<",
            "TR;>;>;"
        }
    .end annotation
.end field

.field public volatile i:Z

.field public j:Ljava/lang/Throwable;

.field public volatile k:Z

.field public final l:Ljava/util/concurrent/atomic/AtomicInteger;

.field public m:Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;


# direct methods
.method public constructor <init>(Ll/qcj;IILl/gcg0;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/qcj<",
            "-TT;+",
            "Lrx/c<",
            "+TR;>;>;II",
            "Ll/gcg0<",
            "-TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->e:Ll/qcj;

    .line 5
    .line 6
    iput p2, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->f:I

    .line 7
    .line 8
    iput-object p4, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->g:Ll/gcg0;

    .line 9
    .line 10
    new-instance p1, Ljava/util/LinkedList;

    .line 11
    .line 12
    invoke-direct {p1}, Ljava/util/LinkedList;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 16
    .line 17
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 23
    .line 24
    const p1, 0x7fffffff

    .line 25
    .line 26
    .line 27
    if-ne p3, p1, :cond_0

    .line 28
    .line 29
    const-wide p1, 0x7fffffffffffffffL

    .line 30
    .line 31
    .line 32
    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_0
    int-to-long p1, p3

    .line 36
    :goto_0
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 37
    .line 38
    .line 39
    return-void
.end method


# virtual methods
.method public g()V
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    new-instance v1, Ljava/util/ArrayList;

    .line 5
    .line 6
    iget-object v2, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 7
    .line 8
    invoke-direct {v1, v2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 12
    .line 13
    invoke-interface {p0}, Ljava/util/Collection;->clear()V

    .line 14
    .line 15
    .line 16
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    :goto_0
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/kcg0;

    .line 32
    .line 33
    invoke-interface {v0}, Ll/kcg0;->unsubscribe()V

    .line 34
    .line 35
    .line 36
    goto :goto_0

    .line 37
    :cond_0
    return-void

    .line 38
    :catchall_0
    move-exception p0

    .line 39
    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 40
    throw p0
.end method

.method public h()V
    .locals 19

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    iget-object v1, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 6
    .line 7
    .line 8
    move-result v1

    .line 9
    if-eqz v1, :cond_0

    .line 10
    .line 11
    goto/16 :goto_6

    .line 12
    .line 13
    :cond_0
    iget-object v1, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->m:Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;

    .line 14
    .line 15
    iget-object v2, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->g:Ll/gcg0;

    .line 16
    .line 17
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 18
    .line 19
    .line 20
    move-result-object v3

    .line 21
    const/4 v5, 0x1

    .line 22
    :cond_1
    :goto_0
    iget-boolean v6, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->k:Z

    .line 23
    .line 24
    if-eqz v6, :cond_2

    .line 25
    .line 26
    invoke-virtual {v0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->g()V

    .line 27
    .line 28
    .line 29
    return-void

    .line 30
    :cond_2
    iget-boolean v6, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->i:Z

    .line 31
    .line 32
    iget-object v7, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 33
    .line 34
    monitor-enter v7

    .line 35
    :try_start_0
    iget-object v8, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 36
    .line 37
    invoke-interface {v8}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    move-result-object v8

    .line 41
    check-cast v8, Lrx/internal/operators/OperatorEagerConcatMap$a;

    .line 42
    .line 43
    monitor-exit v7
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 44
    const/4 v7, 0x0

    .line 45
    if-nez v8, :cond_3

    .line 46
    .line 47
    const/4 v9, 0x1

    .line 48
    goto :goto_1

    .line 49
    :cond_3
    move v9, v7

    .line 50
    :goto_1
    if-eqz v6, :cond_5

    .line 51
    .line 52
    iget-object v6, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->j:Ljava/lang/Throwable;

    .line 53
    .line 54
    if-eqz v6, :cond_4

    .line 55
    .line 56
    invoke-virtual {v0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->g()V

    .line 57
    .line 58
    .line 59
    invoke-interface {v2, v6}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_4
    if-eqz v9, :cond_5

    .line 64
    .line 65
    invoke-interface {v2}, Ll/bb50;->onCompleted()V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_5
    if-nez v9, :cond_d

    .line 70
    .line 71
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 72
    .line 73
    .line 74
    move-result-wide v9

    .line 75
    iget-object v6, v8, Lrx/internal/operators/OperatorEagerConcatMap$a;->f:Ljava/util/Queue;

    .line 76
    .line 77
    const-wide/16 v13, 0x0

    .line 78
    .line 79
    :goto_2
    iget-boolean v15, v8, Lrx/internal/operators/OperatorEagerConcatMap$a;->h:Z

    .line 80
    .line 81
    invoke-interface {v6}, Ljava/util/Queue;->peek()Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    move-result-object v4

    .line 85
    if-nez v4, :cond_6

    .line 86
    .line 87
    const/16 v16, 0x1

    .line 88
    .line 89
    :goto_3
    const-wide/16 v17, 0x0

    .line 90
    .line 91
    goto :goto_4

    .line 92
    :cond_6
    move/from16 v16, v7

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :goto_4
    const-wide/16 v11, 0x1

    .line 96
    .line 97
    if-eqz v15, :cond_8

    .line 98
    .line 99
    iget-object v15, v8, Lrx/internal/operators/OperatorEagerConcatMap$a;->i:Ljava/lang/Throwable;

    .line 100
    .line 101
    if-eqz v15, :cond_7

    .line 102
    .line 103
    invoke-virtual {v0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->g()V

    .line 104
    .line 105
    .line 106
    invoke-interface {v2, v15}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 107
    .line 108
    .line 109
    return-void

    .line 110
    :cond_7
    if-eqz v16, :cond_8

    .line 111
    .line 112
    iget-object v15, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 113
    .line 114
    monitor-enter v15

    .line 115
    :try_start_1
    iget-object v4, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 116
    .line 117
    invoke-interface {v4}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    monitor-exit v15
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 121
    invoke-virtual {v8}, Ll/gcg0;->unsubscribe()V

    .line 122
    .line 123
    .line 124
    invoke-virtual {v0, v11, v12}, Ll/gcg0;->e(J)V

    .line 125
    .line 126
    .line 127
    const/4 v7, 0x1

    .line 128
    goto :goto_5

    .line 129
    :catchall_0
    move-exception v0

    .line 130
    :try_start_2
    monitor-exit v15
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 131
    throw v0

    .line 132
    :cond_8
    if-eqz v16, :cond_9

    .line 133
    .line 134
    goto :goto_5

    .line 135
    :cond_9
    cmp-long v15, v9, v13

    .line 136
    .line 137
    if-nez v15, :cond_c

    .line 138
    .line 139
    :goto_5
    cmp-long v4, v13, v17

    .line 140
    .line 141
    if-eqz v4, :cond_b

    .line 142
    .line 143
    const-wide v11, 0x7fffffffffffffffL

    .line 144
    .line 145
    .line 146
    .line 147
    .line 148
    cmp-long v4, v9, v11

    .line 149
    .line 150
    if-eqz v4, :cond_a

    .line 151
    .line 152
    invoke-static {v1, v13, v14}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 153
    .line 154
    .line 155
    :cond_a
    if-nez v7, :cond_b

    .line 156
    .line 157
    invoke-virtual {v8, v13, v14}, Lrx/internal/operators/OperatorEagerConcatMap$a;->g(J)V

    .line 158
    .line 159
    .line 160
    :cond_b
    if-eqz v7, :cond_d

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_c
    invoke-interface {v6}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    :try_start_3
    invoke-virtual {v3, v4}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v15

    .line 171
    invoke-interface {v2, v15}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 172
    .line 173
    .line 174
    add-long/2addr v13, v11

    .line 175
    goto :goto_2

    .line 176
    :catchall_1
    move-exception v0

    .line 177
    invoke-static {v0, v2, v4}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 178
    .line 179
    .line 180
    return-void

    .line 181
    :cond_d
    iget-object v4, v0, Lrx/internal/operators/OperatorEagerConcatMap$b;->l:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 182
    .line 183
    neg-int v5, v5

    .line 184
    invoke-virtual {v4, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 185
    .line 186
    .line 187
    move-result v5

    .line 188
    if-nez v5, :cond_1

    .line 189
    .line 190
    :goto_6
    return-void

    .line 191
    :catchall_2
    move-exception v0

    .line 192
    :try_start_4
    monitor-exit v7
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 193
    throw v0
.end method

.method public i()V
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;-><init>(Lrx/internal/operators/OperatorEagerConcatMap$b;)V

    .line 4
    .line 5
    .line 6
    iput-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->m:Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;

    .line 7
    .line 8
    new-instance v0, Lrx/internal/operators/OperatorEagerConcatMap$b$a;

    .line 9
    .line 10
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorEagerConcatMap$b$a;-><init>(Lrx/internal/operators/OperatorEagerConcatMap$b;)V

    .line 11
    .line 12
    .line 13
    invoke-static {v0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    invoke-virtual {p0, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->g:Ll/gcg0;

    .line 21
    .line 22
    invoke-virtual {v0, p0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 23
    .line 24
    .line 25
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->g:Ll/gcg0;

    .line 26
    .line 27
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->m:Lrx/internal/operators/OperatorEagerConcatMap$EagerOuterProducer;

    .line 28
    .line 29
    invoke-virtual {v0, p0}, Ll/gcg0;->f(Ll/vk90;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->i:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->j:Ljava/lang/Throwable;

    .line 2
    .line 3
    const/4 p1, 0x1

    .line 4
    iput-boolean p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->i:Z

    .line 5
    .line 6
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->h()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->e:Ll/qcj;

    .line 2
    .line 3
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    check-cast v0, Lrx/c;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_1

    .line 8
    .line 9
    iget-boolean p1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->k:Z

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_0
    new-instance p1, Lrx/internal/operators/OperatorEagerConcatMap$a;

    .line 15
    .line 16
    iget v1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->f:I

    .line 17
    .line 18
    invoke-direct {p1, p0, v1}, Lrx/internal/operators/OperatorEagerConcatMap$a;-><init>(Lrx/internal/operators/OperatorEagerConcatMap$b;I)V

    .line 19
    .line 20
    .line 21
    iget-object v1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 22
    .line 23
    monitor-enter v1

    .line 24
    :try_start_1
    iget-boolean v2, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->k:Z

    .line 25
    .line 26
    if-eqz v2, :cond_1

    .line 27
    .line 28
    monitor-exit v1

    .line 29
    return-void

    .line 30
    :catchall_0
    move-exception p0

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    iget-object v2, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->h:Ljava/util/Queue;

    .line 33
    .line 34
    invoke-interface {v2, p1}, Ljava/util/Queue;->add(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    monitor-exit v1
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    iget-boolean v1, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->k:Z

    .line 39
    .line 40
    if-eqz v1, :cond_2

    .line 41
    .line 42
    :goto_0
    return-void

    .line 43
    :cond_2
    invoke-virtual {v0, p1}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lrx/internal/operators/OperatorEagerConcatMap$b;->h()V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :goto_1
    :try_start_2
    monitor-exit v1
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 51
    throw p0

    .line 52
    :catchall_1
    move-exception v0

    .line 53
    iget-object p0, p0, Lrx/internal/operators/OperatorEagerConcatMap$b;->g:Ll/gcg0;

    .line 54
    .line 55
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void
.end method
