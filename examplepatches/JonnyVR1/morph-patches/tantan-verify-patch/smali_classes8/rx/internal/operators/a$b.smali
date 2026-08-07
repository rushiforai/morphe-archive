.class public final Lrx/internal/operators/a$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/a;
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
            "Ljava/lang/Iterable<",
            "+TR;>;>;"
        }
    .end annotation
.end field

.field public final g:J

.field public final h:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final i:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Ljava/util/concurrent/atomic/AtomicLong;

.field public final k:Ljava/util/concurrent/atomic/AtomicInteger;

.field public final l:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public volatile m:Z

.field public n:J

.field public o:Ljava/util/Iterator;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Iterator<",
            "+TR;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;Ll/qcj;I)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/qcj<",
            "-TT;+",
            "Ljava/lang/Iterable<",
            "+TR;>;>;I)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/a$b;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/a$b;->f:Ll/qcj;

    .line 7
    .line 8
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 9
    .line 10
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 11
    .line 12
    .line 13
    iput-object p1, p0, Lrx/internal/operators/a$b;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 14
    .line 15
    new-instance p1, Ljava/util/concurrent/atomic/AtomicInteger;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicInteger;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Lrx/internal/operators/a$b;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 21
    .line 22
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 23
    .line 24
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 25
    .line 26
    .line 27
    iput-object p1, p0, Lrx/internal/operators/a$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 28
    .line 29
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    iput-object p1, p0, Lrx/internal/operators/a$b;->l:Lrx/internal/operators/NotificationLite;

    .line 34
    .line 35
    const p1, 0x7fffffff

    .line 36
    .line 37
    .line 38
    if-ne p3, p1, :cond_0

    .line 39
    .line 40
    const-wide p1, 0x7fffffffffffffffL

    .line 41
    .line 42
    .line 43
    .line 44
    .line 45
    iput-wide p1, p0, Lrx/internal/operators/a$b;->g:J

    .line 46
    .line 47
    new-instance p1, Ll/pzf0;

    .line 48
    .line 49
    sget p2, Ll/urd0;->g:I

    .line 50
    .line 51
    invoke-direct {p1, p2}, Ll/pzf0;-><init>(I)V

    .line 52
    .line 53
    .line 54
    iput-object p1, p0, Lrx/internal/operators/a$b;->h:Ljava/util/Queue;

    .line 55
    .line 56
    goto :goto_0

    .line 57
    :cond_0
    shr-int/lit8 p1, p3, 0x2

    .line 58
    .line 59
    sub-int p1, p3, p1

    .line 60
    .line 61
    int-to-long p1, p1

    .line 62
    iput-wide p1, p0, Lrx/internal/operators/a$b;->g:J

    .line 63
    .line 64
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 65
    .line 66
    .line 67
    move-result p1

    .line 68
    if-eqz p1, :cond_1

    .line 69
    .line 70
    new-instance p1, Lrx/internal/util/unsafe/SpscArrayQueue;

    .line 71
    .line 72
    invoke-direct {p1, p3}, Lrx/internal/util/unsafe/SpscArrayQueue;-><init>(I)V

    .line 73
    .line 74
    .line 75
    iput-object p1, p0, Lrx/internal/operators/a$b;->h:Ljava/util/Queue;

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_1
    new-instance p1, Ll/ozf0;

    .line 79
    .line 80
    invoke-direct {p1, p3}, Ll/ozf0;-><init>(I)V

    .line 81
    .line 82
    .line 83
    iput-object p1, p0, Lrx/internal/operators/a$b;->h:Ljava/util/Queue;

    .line 84
    .line 85
    :goto_0
    int-to-long p1, p3

    .line 86
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 87
    .line 88
    .line 89
    return-void
.end method


# virtual methods
.method public g(ZZLl/gcg0;Ljava/util/Queue;)Z
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ll/gcg0<",
            "*>;",
            "Ljava/util/Queue<",
            "*>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p3}, Ll/gcg0;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x0

    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-interface {p4}, Ljava/util/Collection;->clear()V

    .line 10
    .line 11
    .line 12
    iput-object v1, p0, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 13
    .line 14
    return v2

    .line 15
    :cond_0
    if-eqz p1, :cond_2

    .line 16
    .line 17
    iget-object p1, p0, Lrx/internal/operators/a$b;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 18
    .line 19
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    check-cast p1, Ljava/lang/Throwable;

    .line 24
    .line 25
    if-eqz p1, :cond_1

    .line 26
    .line 27
    iget-object p1, p0, Lrx/internal/operators/a$b;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 28
    .line 29
    invoke-static {p1}, Lrx/internal/util/ExceptionsUtils;->terminate(Ljava/util/concurrent/atomic/AtomicReference;)Ljava/lang/Throwable;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 34
    .line 35
    .line 36
    invoke-interface {p4}, Ljava/util/Collection;->clear()V

    .line 37
    .line 38
    .line 39
    iput-object v1, p0, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 40
    .line 41
    invoke-interface {p3, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 42
    .line 43
    .line 44
    return v2

    .line 45
    :cond_1
    if-eqz p2, :cond_2

    .line 46
    .line 47
    invoke-interface {p3}, Ll/bb50;->onCompleted()V

    .line 48
    .line 49
    .line 50
    return v2

    .line 51
    :cond_2
    const/4 p0, 0x0

    .line 52
    return p0
.end method

.method public h()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    iget-object v0, v1, Lrx/internal/operators/a$b;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 4
    .line 5
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicInteger;->getAndIncrement()I

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    goto/16 :goto_6

    .line 12
    .line 13
    :cond_0
    iget-object v2, v1, Lrx/internal/operators/a$b;->e:Ll/gcg0;

    .line 14
    .line 15
    iget-object v3, v1, Lrx/internal/operators/a$b;->h:Ljava/util/Queue;

    .line 16
    .line 17
    const/4 v4, 0x1

    .line 18
    move v5, v4

    .line 19
    :cond_1
    :goto_0
    iget-object v0, v1, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 20
    .line 21
    const-wide/16 v6, 0x1

    .line 22
    .line 23
    const-wide/16 v8, 0x0

    .line 24
    .line 25
    const/4 v10, 0x0

    .line 26
    if-nez v0, :cond_6

    .line 27
    .line 28
    iget-boolean v11, v1, Lrx/internal/operators/a$b;->m:Z

    .line 29
    .line 30
    invoke-interface {v3}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 31
    .line 32
    .line 33
    move-result-object v12

    .line 34
    if-nez v12, :cond_2

    .line 35
    .line 36
    move v13, v4

    .line 37
    goto :goto_1

    .line 38
    :cond_2
    move v13, v10

    .line 39
    :goto_1
    invoke-virtual {v1, v11, v13, v2, v3}, Lrx/internal/operators/a$b;->g(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 40
    .line 41
    .line 42
    move-result v11

    .line 43
    if-eqz v11, :cond_3

    .line 44
    .line 45
    goto/16 :goto_6

    .line 46
    .line 47
    :cond_3
    if-nez v13, :cond_6

    .line 48
    .line 49
    iget-wide v13, v1, Lrx/internal/operators/a$b;->n:J

    .line 50
    .line 51
    add-long/2addr v13, v6

    .line 52
    move-wide v15, v6

    .line 53
    iget-wide v6, v1, Lrx/internal/operators/a$b;->g:J

    .line 54
    .line 55
    cmp-long v0, v13, v6

    .line 56
    .line 57
    if-nez v0, :cond_4

    .line 58
    .line 59
    iput-wide v8, v1, Lrx/internal/operators/a$b;->n:J

    .line 60
    .line 61
    invoke-virtual {v1, v13, v14}, Ll/gcg0;->e(J)V

    .line 62
    .line 63
    .line 64
    goto :goto_2

    .line 65
    :cond_4
    iput-wide v13, v1, Lrx/internal/operators/a$b;->n:J

    .line 66
    .line 67
    :goto_2
    :try_start_0
    iget-object v0, v1, Lrx/internal/operators/a$b;->f:Ll/qcj;

    .line 68
    .line 69
    iget-object v6, v1, Lrx/internal/operators/a$b;->l:Lrx/internal/operators/NotificationLite;

    .line 70
    .line 71
    invoke-virtual {v6, v12}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v6

    .line 75
    invoke-interface {v0, v6}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ljava/lang/Iterable;

    .line 80
    .line 81
    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 86
    .line 87
    .line 88
    move-result v6
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 89
    if-nez v6, :cond_5

    .line 90
    .line 91
    goto :goto_0

    .line 92
    :cond_5
    iput-object v0, v1, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 93
    .line 94
    goto :goto_3

    .line 95
    :catchall_0
    move-exception v0

    .line 96
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    invoke-virtual {v1, v0}, Lrx/internal/operators/a$b;->onError(Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    goto :goto_0

    .line 103
    :cond_6
    move-wide v15, v6

    .line 104
    :goto_3
    if-eqz v0, :cond_e

    .line 105
    .line 106
    iget-object v6, v1, Lrx/internal/operators/a$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 107
    .line 108
    invoke-virtual {v6}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 109
    .line 110
    .line 111
    move-result-wide v6

    .line 112
    move-wide v11, v8

    .line 113
    :cond_7
    cmp-long v13, v11, v6

    .line 114
    .line 115
    if-eqz v13, :cond_a

    .line 116
    .line 117
    iget-boolean v13, v1, Lrx/internal/operators/a$b;->m:Z

    .line 118
    .line 119
    invoke-virtual {v1, v13, v10, v2, v3}, Lrx/internal/operators/a$b;->g(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 120
    .line 121
    .line 122
    move-result v13

    .line 123
    if-eqz v13, :cond_8

    .line 124
    .line 125
    goto :goto_6

    .line 126
    :cond_8
    const/4 v13, 0x0

    .line 127
    :try_start_1
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v14
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 131
    invoke-interface {v2, v14}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 132
    .line 133
    .line 134
    iget-boolean v14, v1, Lrx/internal/operators/a$b;->m:Z

    .line 135
    .line 136
    invoke-virtual {v1, v14, v10, v2, v3}, Lrx/internal/operators/a$b;->g(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 137
    .line 138
    .line 139
    move-result v14

    .line 140
    if-eqz v14, :cond_9

    .line 141
    .line 142
    goto :goto_6

    .line 143
    :cond_9
    add-long/2addr v11, v15

    .line 144
    :try_start_2
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 145
    .line 146
    .line 147
    move-result v14
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 148
    if-nez v14, :cond_7

    .line 149
    .line 150
    iput-object v13, v1, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 151
    .line 152
    :goto_4
    move-object v0, v13

    .line 153
    goto :goto_5

    .line 154
    :catchall_1
    move-exception v0

    .line 155
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 156
    .line 157
    .line 158
    iput-object v13, v1, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 159
    .line 160
    invoke-virtual {v1, v0}, Lrx/internal/operators/a$b;->onError(Ljava/lang/Throwable;)V

    .line 161
    .line 162
    .line 163
    goto :goto_4

    .line 164
    :catchall_2
    move-exception v0

    .line 165
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 166
    .line 167
    .line 168
    iput-object v13, v1, Lrx/internal/operators/a$b;->o:Ljava/util/Iterator;

    .line 169
    .line 170
    invoke-virtual {v1, v0}, Lrx/internal/operators/a$b;->onError(Ljava/lang/Throwable;)V

    .line 171
    .line 172
    .line 173
    goto :goto_4

    .line 174
    :cond_a
    :goto_5
    cmp-long v6, v11, v6

    .line 175
    .line 176
    if-nez v6, :cond_c

    .line 177
    .line 178
    iget-boolean v6, v1, Lrx/internal/operators/a$b;->m:Z

    .line 179
    .line 180
    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    .line 181
    .line 182
    .line 183
    move-result v7

    .line 184
    if-eqz v7, :cond_b

    .line 185
    .line 186
    if-nez v0, :cond_b

    .line 187
    .line 188
    move v10, v4

    .line 189
    :cond_b
    invoke-virtual {v1, v6, v10, v2, v3}, Lrx/internal/operators/a$b;->g(ZZLl/gcg0;Ljava/util/Queue;)Z

    .line 190
    .line 191
    .line 192
    move-result v6

    .line 193
    if-eqz v6, :cond_c

    .line 194
    .line 195
    goto :goto_6

    .line 196
    :cond_c
    cmp-long v6, v11, v8

    .line 197
    .line 198
    if-eqz v6, :cond_d

    .line 199
    .line 200
    iget-object v6, v1, Lrx/internal/operators/a$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 201
    .line 202
    invoke-static {v6, v11, v12}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 203
    .line 204
    .line 205
    :cond_d
    if-nez v0, :cond_e

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_e
    iget-object v0, v1, Lrx/internal/operators/a$b;->k:Ljava/util/concurrent/atomic/AtomicInteger;

    .line 210
    .line 211
    neg-int v5, v5

    .line 212
    invoke-virtual {v0, v5}, Ljava/util/concurrent/atomic/AtomicInteger;->addAndGet(I)I

    .line 213
    .line 214
    .line 215
    move-result v5

    .line 216
    if-nez v5, :cond_1

    .line 217
    .line 218
    :goto_6
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
    if-lez v0, :cond_0

    .line 6
    .line 7
    iget-object v0, p0, Lrx/internal/operators/a$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 8
    .line 9
    invoke-static {v0, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 10
    .line 11
    .line 12
    invoke-virtual {p0}, Lrx/internal/operators/a$b;->h()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-ltz v0, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    const-string p0, "n >= 0 required but it was "

    .line 20
    .line 21
    invoke-static {p0, p1, p2}, Ll/qc2;->a(Ljava/lang/String;J)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/a$b;->m:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lrx/internal/operators/a$b;->h()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/a$b;->i:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    invoke-static {v0, p1}, Lrx/internal/util/ExceptionsUtils;->addThrowable(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Throwable;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Lrx/internal/operators/a$b;->m:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Lrx/internal/operators/a$b;->h()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
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
    iget-object v0, p0, Lrx/internal/operators/a$b;->h:Ljava/util/Queue;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/a$b;->l:Lrx/internal/operators/NotificationLite;

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
    move-result p1

    .line 13
    if-nez p1, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    new-instance p1, Lrx/exceptions/MissingBackpressureException;

    .line 19
    .line 20
    invoke-direct {p1}, Lrx/exceptions/MissingBackpressureException;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0, p1}, Lrx/internal/operators/a$b;->onError(Ljava/lang/Throwable;)V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :cond_0
    invoke-virtual {p0}, Lrx/internal/operators/a$b;->h()V

    .line 28
    .line 29
    .line 30
    return-void
.end method
