.class final Lrx/internal/operators/CachedObservable$ReplayProducer;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "SourceFile"

# interfaces
.implements Ll/vk90;
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/CachedObservable;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "ReplayProducer"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/util/concurrent/atomic/AtomicLong;",
        "Ll/vk90;",
        "Ll/kcg0;"
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = -0x237e491daced6e1dL


# instance fields
.field final child:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field currentBuffer:[Ljava/lang/Object;

.field currentIndexInBuffer:I

.field emitting:Z

.field index:I

.field missed:Z

.field final state:Lrx/internal/operators/CachedObservable$a;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/CachedObservable$a<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;Lrx/internal/operators/CachedObservable$a;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;",
            "Lrx/internal/operators/CachedObservable$a<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/CachedObservable$ReplayProducer;->child:Ll/gcg0;

    .line 5
    .line 6
    iput-object p2, p0, Lrx/internal/operators/CachedObservable$ReplayProducer;->state:Lrx/internal/operators/CachedObservable$a;

    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public isUnsubscribed()Z
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long p0, v0, v2

    .line 8
    .line 9
    if-gez p0, :cond_0

    .line 10
    .line 11
    const/4 p0, 0x1

    .line 12
    return p0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    return p0
.end method

.method public produced(J)J
    .locals 0

    .line 1
    neg-long p1, p1

    .line 2
    invoke-virtual {p0, p1, p2}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 3
    .line 4
    .line 5
    move-result-wide p0

    .line 6
    return-wide p0
.end method

.method public replay()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-boolean v0, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->emitting:Z

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput-boolean v2, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->missed:Z

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto/16 :goto_7

    .line 15
    .line 16
    :cond_0
    iput-boolean v2, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->emitting:Z

    .line 17
    .line 18
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    const/4 v3, 0x0

    .line 20
    :try_start_1
    iget-object v0, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->state:Lrx/internal/operators/CachedObservable$a;

    .line 21
    .line 22
    iget-object v4, v0, Lrx/internal/operators/CachedObservable$a;->i:Lrx/internal/operators/NotificationLite;

    .line 23
    .line 24
    iget-object v5, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->child:Ll/gcg0;

    .line 25
    .line 26
    :goto_0
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 27
    .line 28
    .line 29
    move-result-wide v6

    .line 30
    const-wide/16 v8, 0x0

    .line 31
    .line 32
    cmp-long v0, v6, v8

    .line 33
    .line 34
    if-gez v0, :cond_1

    .line 35
    .line 36
    return-void

    .line 37
    :cond_1
    iget-object v10, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->state:Lrx/internal/operators/CachedObservable$a;

    .line 38
    .line 39
    invoke-virtual {v10}, Ll/uor;->c()I

    .line 40
    .line 41
    .line 42
    move-result v10

    .line 43
    if-eqz v10, :cond_b

    .line 44
    .line 45
    iget-object v11, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->currentBuffer:[Ljava/lang/Object;

    .line 46
    .line 47
    if-nez v11, :cond_2

    .line 48
    .line 49
    iget-object v11, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->state:Lrx/internal/operators/CachedObservable$a;

    .line 50
    .line 51
    invoke-virtual {v11}, Ll/uor;->b()[Ljava/lang/Object;

    .line 52
    .line 53
    .line 54
    move-result-object v11

    .line 55
    iput-object v11, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->currentBuffer:[Ljava/lang/Object;

    .line 56
    .line 57
    goto :goto_1

    .line 58
    :catchall_1
    move-exception v0

    .line 59
    move v2, v3

    .line 60
    goto/16 :goto_5

    .line 61
    .line 62
    :cond_2
    :goto_1
    array-length v12, v11

    .line 63
    sub-int/2addr v12, v2

    .line 64
    iget v13, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->index:I

    .line 65
    .line 66
    iget v14, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->currentIndexInBuffer:I

    .line 67
    .line 68
    if-nez v0, :cond_4

    .line 69
    .line 70
    aget-object v0, v11, v14

    .line 71
    .line 72
    invoke-virtual {v4, v0}, Lrx/internal/operators/NotificationLite;->g(Ljava/lang/Object;)Z

    .line 73
    .line 74
    .line 75
    move-result v6

    .line 76
    if-eqz v6, :cond_3

    .line 77
    .line 78
    invoke-interface {v5}, Ll/bb50;->onCompleted()V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 79
    .line 80
    .line 81
    :try_start_2
    invoke-virtual {v1}, Lrx/internal/operators/CachedObservable$ReplayProducer;->unsubscribe()V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 82
    .line 83
    .line 84
    return-void

    .line 85
    :catchall_2
    move-exception v0

    .line 86
    goto/16 :goto_5

    .line 87
    .line 88
    :cond_3
    :try_start_3
    invoke-virtual {v4, v0}, Lrx/internal/operators/NotificationLite;->h(Ljava/lang/Object;)Z

    .line 89
    .line 90
    .line 91
    move-result v6

    .line 92
    if-eqz v6, :cond_b

    .line 93
    .line 94
    invoke-virtual {v4, v0}, Lrx/internal/operators/NotificationLite;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 95
    .line 96
    .line 97
    move-result-object v0

    .line 98
    invoke-interface {v5, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 99
    .line 100
    .line 101
    :try_start_4
    invoke-virtual {v1}, Lrx/internal/operators/CachedObservable$ReplayProducer;->unsubscribe()V
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 102
    .line 103
    .line 104
    return-void

    .line 105
    :cond_4
    if-lez v0, :cond_b

    .line 106
    .line 107
    move v0, v3

    .line 108
    :goto_2
    if-ge v13, v10, :cond_9

    .line 109
    .line 110
    cmp-long v15, v6, v8

    .line 111
    .line 112
    if-lez v15, :cond_9

    .line 113
    .line 114
    :try_start_5
    invoke-virtual {v5}, Ll/gcg0;->isUnsubscribed()Z

    .line 115
    .line 116
    .line 117
    move-result v15

    .line 118
    if-eqz v15, :cond_5

    .line 119
    .line 120
    return-void

    .line 121
    :cond_5
    if-ne v14, v12, :cond_6

    .line 122
    .line 123
    aget-object v11, v11, v12

    .line 124
    .line 125
    check-cast v11, [Ljava/lang/Object;

    .line 126
    .line 127
    move v14, v3

    .line 128
    :cond_6
    aget-object v15, v11, v14
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    .line 129
    .line 130
    :try_start_6
    invoke-virtual {v4, v5, v15}, Lrx/internal/operators/NotificationLite;->a(Ll/bb50;Ljava/lang/Object;)Z

    .line 131
    .line 132
    .line 133
    move-result v16
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 134
    if-eqz v16, :cond_7

    .line 135
    .line 136
    :try_start_7
    invoke-virtual {v1}, Lrx/internal/operators/CachedObservable$ReplayProducer;->unsubscribe()V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 137
    .line 138
    .line 139
    return-void

    .line 140
    :catchall_3
    move-exception v0

    .line 141
    move v6, v2

    .line 142
    goto :goto_3

    .line 143
    :cond_7
    add-int/lit8 v14, v14, 0x1

    .line 144
    .line 145
    add-int/lit8 v13, v13, 0x1

    .line 146
    .line 147
    const-wide/16 v15, 0x1

    .line 148
    .line 149
    sub-long/2addr v6, v15

    .line 150
    add-int/lit8 v0, v0, 0x1

    .line 151
    .line 152
    goto :goto_2

    .line 153
    :catchall_4
    move-exception v0

    .line 154
    move v6, v3

    .line 155
    :goto_3
    :try_start_8
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_5

    .line 156
    .line 157
    .line 158
    :try_start_9
    invoke-virtual {v1}, Lrx/internal/operators/CachedObservable$ReplayProducer;->unsubscribe()V

    .line 159
    .line 160
    .line 161
    invoke-virtual {v4, v15}, Lrx/internal/operators/NotificationLite;->h(Ljava/lang/Object;)Z

    .line 162
    .line 163
    .line 164
    move-result v6

    .line 165
    if-nez v6, :cond_8

    .line 166
    .line 167
    invoke-virtual {v4, v15}, Lrx/internal/operators/NotificationLite;->g(Ljava/lang/Object;)Z

    .line 168
    .line 169
    .line 170
    move-result v6

    .line 171
    if-nez v6, :cond_8

    .line 172
    .line 173
    invoke-virtual {v4, v15}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 174
    .line 175
    .line 176
    move-result-object v4

    .line 177
    invoke-static {v0, v4}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    invoke-interface {v5, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 182
    .line 183
    .line 184
    :cond_8
    return-void

    .line 185
    :catchall_5
    move-exception v0

    .line 186
    move v2, v6

    .line 187
    goto :goto_5

    .line 188
    :cond_9
    :try_start_a
    invoke-virtual {v5}, Ll/gcg0;->isUnsubscribed()Z

    .line 189
    .line 190
    .line 191
    move-result v6

    .line 192
    if-eqz v6, :cond_a

    .line 193
    .line 194
    return-void

    .line 195
    :cond_a
    iput v13, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->index:I

    .line 196
    .line 197
    iput v14, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->currentIndexInBuffer:I

    .line 198
    .line 199
    iput-object v11, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->currentBuffer:[Ljava/lang/Object;

    .line 200
    .line 201
    int-to-long v6, v0

    .line 202
    invoke-virtual {v1, v6, v7}, Lrx/internal/operators/CachedObservable$ReplayProducer;->produced(J)J

    .line 203
    .line 204
    .line 205
    :cond_b
    monitor-enter p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_1

    .line 206
    :try_start_b
    iget-boolean v0, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->missed:Z

    .line 207
    .line 208
    if-nez v0, :cond_c

    .line 209
    .line 210
    iput-boolean v3, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->emitting:Z
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_7

    .line 211
    .line 212
    :try_start_c
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 213
    return-void

    .line 214
    :catchall_6
    move-exception v0

    .line 215
    goto :goto_4

    .line 216
    :catchall_7
    move-exception v0

    .line 217
    move v2, v3

    .line 218
    goto :goto_4

    .line 219
    :cond_c
    :try_start_d
    iput-boolean v3, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->missed:Z

    .line 220
    .line 221
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_7

    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :goto_4
    :try_start_e
    monitor-exit p0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_6

    .line 225
    :try_start_f
    throw v0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_2

    .line 226
    :goto_5
    if-nez v2, :cond_d

    .line 227
    .line 228
    monitor-enter p0

    .line 229
    :try_start_10
    iput-boolean v3, v1, Lrx/internal/operators/CachedObservable$ReplayProducer;->emitting:Z

    .line 230
    .line 231
    monitor-exit p0

    .line 232
    goto :goto_6

    .line 233
    :catchall_8
    move-exception v0

    .line 234
    monitor-exit p0
    :try_end_10
    .catchall {:try_start_10 .. :try_end_10} :catchall_8

    .line 235
    throw v0

    .line 236
    :cond_d
    :goto_6
    throw v0

    .line 237
    :goto_7
    :try_start_11
    monitor-exit p0
    :try_end_11
    .catchall {:try_start_11 .. :try_end_11} :catchall_0

    .line 238
    throw v0
.end method

.method public request(J)V
    .locals 6

    .line 1
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v4, v0, v2

    .line 8
    .line 9
    if-gez v4, :cond_1

    .line 10
    .line 11
    return-void

    .line 12
    :cond_1
    add-long v4, v0, p1

    .line 13
    .line 14
    cmp-long v2, v4, v2

    .line 15
    .line 16
    if-gez v2, :cond_2

    .line 17
    .line 18
    const-wide v4, 0x7fffffffffffffffL

    .line 19
    .line 20
    .line 21
    .line 22
    .line 23
    :cond_2
    invoke-virtual {p0, v0, v1, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    invoke-virtual {p0}, Lrx/internal/operators/CachedObservable$ReplayProducer;->replay()V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public unsubscribe()V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/16 v2, 0x0

    .line 6
    .line 7
    cmp-long v0, v0, v2

    .line 8
    .line 9
    if-ltz v0, :cond_0

    .line 10
    .line 11
    const-wide/16 v0, -0x1

    .line 12
    .line 13
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    .line 14
    .line 15
    .line 16
    move-result-wide v0

    .line 17
    cmp-long v0, v0, v2

    .line 18
    .line 19
    if-ltz v0, :cond_0

    .line 20
    .line 21
    iget-object v0, p0, Lrx/internal/operators/CachedObservable$ReplayProducer;->state:Lrx/internal/operators/CachedObservable$a;

    .line 22
    .line 23
    invoke-virtual {v0, p0}, Lrx/internal/operators/CachedObservable$a;->h(Lrx/internal/operators/CachedObservable$ReplayProducer;)V

    .line 24
    .line 25
    .line 26
    :cond_0
    return-void
.end method
