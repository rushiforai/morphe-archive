.class public final Lrx/internal/operators/OperatorMerge$d;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorMerge;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "d"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "Lrx/c<",
        "+TT;>;>;"
    }
.end annotation


# static fields
.field public static final w:[Lrx/internal/operators/OperatorMerge$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lrx/internal/operators/OperatorMerge$c<",
            "*>;"
        }
    .end annotation
.end field


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final f:Z

.field public final g:I

.field public h:Lrx/internal/operators/OperatorMerge$MergeProducer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorMerge$MergeProducer<",
            "TT;>;"
        }
    .end annotation
.end field

.field public volatile i:Ljava/util/Queue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/Queue<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public volatile j:Ll/ft5;

.field public volatile k:Ljava/util/concurrent/ConcurrentLinkedQueue;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/ConcurrentLinkedQueue<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation
.end field

.field public final l:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public volatile m:Z

.field public n:Z

.field public o:Z

.field public final p:Ljava/lang/Object;

.field public volatile q:[Lrx/internal/operators/OperatorMerge$c;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lrx/internal/operators/OperatorMerge$c<",
            "*>;"
        }
    .end annotation
.end field

.field public r:J

.field public s:J

.field public t:I

.field public final u:I

.field public v:I


# direct methods
.method static constructor <clinit>()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v0, v0, [Lrx/internal/operators/OperatorMerge$c;

    .line 3
    .line 4
    sput-object v0, Lrx/internal/operators/OperatorMerge$d;->w:[Lrx/internal/operators/OperatorMerge$c;

    .line 5
    .line 6
    return-void
.end method

.method public constructor <init>(Ll/gcg0;ZI)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;ZI)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$d;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-boolean p2, p0, Lrx/internal/operators/OperatorMerge$d;->f:Z

    .line 7
    .line 8
    iput p3, p0, Lrx/internal/operators/OperatorMerge$d;->g:I

    .line 9
    .line 10
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$d;->l:Lrx/internal/operators/NotificationLite;

    .line 15
    .line 16
    new-instance p1, Ljava/lang/Object;

    .line 17
    .line 18
    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    .line 19
    .line 20
    .line 21
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$d;->p:Ljava/lang/Object;

    .line 22
    .line 23
    sget-object p1, Lrx/internal/operators/OperatorMerge$d;->w:[Lrx/internal/operators/OperatorMerge$c;

    .line 24
    .line 25
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 26
    .line 27
    const p1, 0x7fffffff

    .line 28
    .line 29
    .line 30
    if-ne p3, p1, :cond_0

    .line 31
    .line 32
    iput p1, p0, Lrx/internal/operators/OperatorMerge$d;->u:I

    .line 33
    .line 34
    const-wide p1, 0x7fffffffffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 40
    .line 41
    .line 42
    return-void

    .line 43
    :cond_0
    shr-int/lit8 p1, p3, 0x1

    .line 44
    .line 45
    const/4 p2, 0x1

    .line 46
    invoke-static {p2, p1}, Ljava/lang/Math;->max(II)I

    .line 47
    .line 48
    .line 49
    move-result p1

    .line 50
    iput p1, p0, Lrx/internal/operators/OperatorMerge$d;->u:I

    .line 51
    .line 52
    int-to-long p1, p3

    .line 53
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 54
    .line 55
    .line 56
    return-void
.end method


# virtual methods
.method public g(Lrx/internal/operators/OperatorMerge$c;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->n()Ll/ft5;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0, p1}, Ll/ft5;->a(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->p:Ljava/lang/Object;

    .line 9
    .line 10
    monitor-enter v0

    .line 11
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 12
    .line 13
    array-length v2, v1

    .line 14
    add-int/lit8 v3, v2, 0x1

    .line 15
    .line 16
    new-array v3, v3, [Lrx/internal/operators/OperatorMerge$c;

    .line 17
    .line 18
    const/4 v4, 0x0

    .line 19
    invoke-static {v1, v4, v3, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 20
    .line 21
    .line 22
    aput-object p1, v3, v2

    .line 23
    .line 24
    iput-object v3, p0, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 25
    .line 26
    monitor-exit v0

    .line 27
    return-void

    .line 28
    :catchall_0
    move-exception p0

    .line 29
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 30
    throw p0
.end method

.method public h()Z
    .locals 3

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->e:Ll/gcg0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    return v1

    .line 11
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 12
    .line 13
    iget-boolean v2, p0, Lrx/internal/operators/OperatorMerge$d;->f:Z

    .line 14
    .line 15
    if-nez v2, :cond_1

    .line 16
    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-nez v0, :cond_1

    .line 24
    .line 25
    :try_start_0
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->t()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 26
    .line 27
    .line 28
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 29
    .line 30
    .line 31
    return v1

    .line 32
    :catchall_0
    move-exception v0

    .line 33
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 34
    .line 35
    .line 36
    throw v0

    .line 37
    :cond_1
    const/4 p0, 0x0

    .line 38
    return p0
.end method

.method public i()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 3
    .line 4
    const/4 v1, 0x1

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->o:Z

    .line 8
    .line 9
    monitor-exit p0

    .line 10
    return-void

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 14
    .line 15
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 16
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->k()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    throw v0
.end method

.method public j()V
    .locals 2

    .line 1
    iget v0, p0, Lrx/internal/operators/OperatorMerge$d;->v:I

    .line 2
    .line 3
    add-int/lit8 v0, v0, 0x1

    .line 4
    .line 5
    iget v1, p0, Lrx/internal/operators/OperatorMerge$d;->u:I

    .line 6
    .line 7
    if-ne v0, v1, :cond_0

    .line 8
    .line 9
    const/4 v1, 0x0

    .line 10
    iput v1, p0, Lrx/internal/operators/OperatorMerge$d;->v:I

    .line 11
    .line 12
    int-to-long v0, v0

    .line 13
    invoke-virtual {p0, v0, v1}, Lrx/internal/operators/OperatorMerge$d;->u(J)V

    .line 14
    .line 15
    .line 16
    return-void

    .line 17
    :cond_0
    iput v0, p0, Lrx/internal/operators/OperatorMerge$d;->v:I

    .line 18
    .line 19
    return-void
.end method

.method public k()V
    .locals 22

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    const/4 v2, 0x0

    .line 4
    :try_start_0
    iget-object v3, v1, Lrx/internal/operators/OperatorMerge$d;->e:Ll/gcg0;

    .line 5
    .line 6
    :goto_0
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->h()Z

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    return-void

    .line 13
    :cond_0
    iget-object v4, v1, Lrx/internal/operators/OperatorMerge$d;->i:Ljava/util/Queue;

    .line 14
    .line 15
    iget-object v0, v1, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 18
    .line 19
    .line 20
    move-result-wide v5

    .line 21
    const-wide v7, 0x7fffffffffffffffL

    .line 22
    .line 23
    .line 24
    .line 25
    .line 26
    cmp-long v0, v5, v7

    .line 27
    .line 28
    if-nez v0, :cond_1

    .line 29
    .line 30
    const/4 v10, 0x1

    .line 31
    goto :goto_1

    .line 32
    :cond_1
    move v10, v2

    .line 33
    :goto_1
    const-wide/16 v11, 0x1

    .line 34
    .line 35
    const-wide/16 v14, 0x0

    .line 36
    .line 37
    if-eqz v4, :cond_9

    .line 38
    .line 39
    move v0, v2

    .line 40
    :goto_2
    move-wide/from16 v16, v5

    .line 41
    .line 42
    move v5, v0

    .line 43
    move v6, v2

    .line 44
    const/4 v0, 0x0

    .line 45
    :goto_3
    cmp-long v18, v16, v14

    .line 46
    .line 47
    if-lez v18, :cond_5

    .line 48
    .line 49
    invoke-interface {v4}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    move-result-object v7

    .line 53
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->h()Z

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    if-eqz v0, :cond_2

    .line 58
    .line 59
    return-void

    .line 60
    :cond_2
    if-nez v7, :cond_3

    .line 61
    .line 62
    move-object v0, v7

    .line 63
    goto :goto_5

    .line 64
    :cond_3
    iget-object v0, v1, Lrx/internal/operators/OperatorMerge$d;->l:Lrx/internal/operators/NotificationLite;

    .line 65
    .line 66
    invoke-virtual {v0, v7}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 67
    .line 68
    .line 69
    move-result-object v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_2

    .line 70
    :try_start_1
    invoke-interface {v3, v0}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 71
    .line 72
    .line 73
    goto :goto_4

    .line 74
    :catchall_0
    move-exception v0

    .line 75
    :try_start_2
    iget-boolean v8, v1, Lrx/internal/operators/OperatorMerge$d;->f:Z

    .line 76
    .line 77
    if-nez v8, :cond_4

    .line 78
    .line 79
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_2

    .line 80
    .line 81
    .line 82
    :try_start_3
    invoke-virtual {v1}, Ll/gcg0;->unsubscribe()V

    .line 83
    .line 84
    .line 85
    invoke-interface {v3, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_1

    .line 86
    .line 87
    .line 88
    goto/16 :goto_13

    .line 89
    .line 90
    :catchall_1
    move-exception v0

    .line 91
    const/4 v9, 0x1

    .line 92
    goto/16 :goto_15

    .line 93
    .line 94
    :catchall_2
    move-exception v0

    .line 95
    move v9, v2

    .line 96
    goto/16 :goto_15

    .line 97
    .line 98
    :cond_4
    :try_start_4
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->o()Ljava/util/Queue;

    .line 99
    .line 100
    .line 101
    move-result-object v8

    .line 102
    invoke-interface {v8, v0}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 103
    .line 104
    .line 105
    :goto_4
    add-int/lit8 v5, v5, 0x1

    .line 106
    .line 107
    add-int/lit8 v6, v6, 0x1

    .line 108
    .line 109
    sub-long v16, v16, v11

    .line 110
    .line 111
    move-object v0, v7

    .line 112
    const-wide v7, 0x7fffffffffffffffL

    .line 113
    .line 114
    .line 115
    .line 116
    .line 117
    goto :goto_3

    .line 118
    :cond_5
    :goto_5
    if-lez v6, :cond_7

    .line 119
    .line 120
    if-eqz v10, :cond_6

    .line 121
    .line 122
    const-wide v16, 0x7fffffffffffffffL

    .line 123
    .line 124
    .line 125
    .line 126
    .line 127
    goto :goto_6

    .line 128
    :cond_6
    iget-object v7, v1, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 129
    .line 130
    invoke-virtual {v7, v6}, Lrx/internal/operators/OperatorMerge$MergeProducer;->produced(I)J

    .line 131
    .line 132
    .line 133
    move-result-wide v6

    .line 134
    move-wide/from16 v16, v6

    .line 135
    .line 136
    :cond_7
    :goto_6
    cmp-long v6, v16, v14

    .line 137
    .line 138
    if-eqz v6, :cond_a

    .line 139
    .line 140
    if-nez v0, :cond_8

    .line 141
    .line 142
    goto :goto_7

    .line 143
    :cond_8
    move v0, v5

    .line 144
    move-wide/from16 v5, v16

    .line 145
    .line 146
    const-wide v7, 0x7fffffffffffffffL

    .line 147
    .line 148
    .line 149
    .line 150
    .line 151
    goto :goto_2

    .line 152
    :cond_9
    move-wide/from16 v16, v5

    .line 153
    .line 154
    move v5, v2

    .line 155
    :cond_a
    :goto_7
    iget-boolean v0, v1, Lrx/internal/operators/OperatorMerge$d;->m:Z

    .line 156
    .line 157
    iget-object v4, v1, Lrx/internal/operators/OperatorMerge$d;->i:Ljava/util/Queue;

    .line 158
    .line 159
    iget-object v6, v1, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 160
    .line 161
    array-length v7, v6

    .line 162
    if-eqz v0, :cond_e

    .line 163
    .line 164
    if-eqz v4, :cond_b

    .line 165
    .line 166
    invoke-interface {v4}, Ljava/util/Collection;->isEmpty()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    if-eqz v0, :cond_e

    .line 171
    .line 172
    :cond_b
    if-nez v7, :cond_e

    .line 173
    .line 174
    iget-object v0, v1, Lrx/internal/operators/OperatorMerge$d;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 175
    .line 176
    if-eqz v0, :cond_d

    .line 177
    .line 178
    invoke-interface {v0}, Ljava/util/Collection;->isEmpty()Z

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    if-eqz v0, :cond_c

    .line 183
    .line 184
    goto :goto_8

    .line 185
    :cond_c
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->t()V

    .line 186
    .line 187
    .line 188
    goto :goto_9

    .line 189
    :cond_d
    :goto_8
    invoke-interface {v3}, Ll/bb50;->onCompleted()V

    .line 190
    .line 191
    .line 192
    :goto_9
    return-void

    .line 193
    :cond_e
    if-lez v7, :cond_24

    .line 194
    .line 195
    move v4, v10

    .line 196
    iget-wide v9, v1, Lrx/internal/operators/OperatorMerge$d;->s:J

    .line 197
    .line 198
    iget v0, v1, Lrx/internal/operators/OperatorMerge$d;->t:I

    .line 199
    .line 200
    if-le v7, v0, :cond_f

    .line 201
    .line 202
    aget-object v8, v6, v0

    .line 203
    .line 204
    move-wide/from16 v19, v11

    .line 205
    .line 206
    iget-wide v11, v8, Lrx/internal/operators/OperatorMerge$c;->f:J

    .line 207
    .line 208
    cmp-long v8, v11, v9

    .line 209
    .line 210
    if-eqz v8, :cond_14

    .line 211
    .line 212
    goto :goto_a

    .line 213
    :cond_f
    move-wide/from16 v19, v11

    .line 214
    .line 215
    :goto_a
    if-gt v7, v0, :cond_10

    .line 216
    .line 217
    move v0, v2

    .line 218
    :cond_10
    move v8, v2

    .line 219
    :goto_b
    if-ge v8, v7, :cond_13

    .line 220
    .line 221
    aget-object v11, v6, v0

    .line 222
    .line 223
    iget-wide v11, v11, Lrx/internal/operators/OperatorMerge$c;->f:J

    .line 224
    .line 225
    cmp-long v11, v11, v9

    .line 226
    .line 227
    if-nez v11, :cond_11

    .line 228
    .line 229
    goto :goto_c

    .line 230
    :cond_11
    add-int/lit8 v0, v0, 0x1

    .line 231
    .line 232
    if-ne v0, v7, :cond_12

    .line 233
    .line 234
    move v0, v2

    .line 235
    :cond_12
    add-int/lit8 v8, v8, 0x1

    .line 236
    .line 237
    goto :goto_b

    .line 238
    :cond_13
    :goto_c
    iput v0, v1, Lrx/internal/operators/OperatorMerge$d;->t:I

    .line 239
    .line 240
    aget-object v8, v6, v0

    .line 241
    .line 242
    iget-wide v8, v8, Lrx/internal/operators/OperatorMerge$c;->f:J

    .line 243
    .line 244
    iput-wide v8, v1, Lrx/internal/operators/OperatorMerge$d;->s:J

    .line 245
    .line 246
    :cond_14
    move v8, v2

    .line 247
    move v9, v8

    .line 248
    :goto_d
    if-ge v8, v7, :cond_23

    .line 249
    .line 250
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->h()Z

    .line 251
    .line 252
    .line 253
    move-result v10

    .line 254
    if-eqz v10, :cond_15

    .line 255
    .line 256
    return-void

    .line 257
    :cond_15
    aget-object v10, v6, v0

    .line 258
    .line 259
    const/4 v11, 0x0

    .line 260
    :cond_16
    move v12, v2

    .line 261
    :goto_e
    cmp-long v21, v16, v14

    .line 262
    .line 263
    if-lez v21, :cond_1a

    .line 264
    .line 265
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->h()Z

    .line 266
    .line 267
    .line 268
    move-result v21

    .line 269
    if-eqz v21, :cond_17

    .line 270
    .line 271
    return-void

    .line 272
    :cond_17
    iget-object v13, v10, Lrx/internal/operators/OperatorMerge$c;->h:Ll/urd0;

    .line 273
    .line 274
    if-nez v13, :cond_18

    .line 275
    .line 276
    goto :goto_f

    .line 277
    :cond_18
    invoke-virtual {v13}, Ll/urd0;->i()Ljava/lang/Object;

    .line 278
    .line 279
    .line 280
    move-result-object v11

    .line 281
    if-nez v11, :cond_19

    .line 282
    .line 283
    goto :goto_f

    .line 284
    :cond_19
    iget-object v13, v1, Lrx/internal/operators/OperatorMerge$d;->l:Lrx/internal/operators/NotificationLite;

    .line 285
    .line 286
    invoke-virtual {v13, v11}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 287
    .line 288
    .line 289
    move-result-object v13
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_2

    .line 290
    :try_start_5
    invoke-interface {v3, v13}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 291
    .line 292
    .line 293
    sub-long v16, v16, v19

    .line 294
    .line 295
    add-int/lit8 v12, v12, 0x1

    .line 296
    .line 297
    goto :goto_e

    .line 298
    :catchall_3
    move-exception v0

    .line 299
    :try_start_6
    invoke-static {v0}, Ll/j6f;->e(Ljava/lang/Throwable;)V
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 300
    .line 301
    .line 302
    :try_start_7
    invoke-interface {v3, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 303
    .line 304
    .line 305
    :try_start_8
    invoke-virtual {v1}, Ll/gcg0;->unsubscribe()V

    .line 306
    .line 307
    .line 308
    goto :goto_13

    .line 309
    :catchall_4
    move-exception v0

    .line 310
    invoke-virtual {v1}, Ll/gcg0;->unsubscribe()V

    .line 311
    .line 312
    .line 313
    throw v0
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 314
    :cond_1a
    :goto_f
    if-lez v12, :cond_1c

    .line 315
    .line 316
    if-nez v4, :cond_1b

    .line 317
    .line 318
    :try_start_9
    iget-object v13, v1, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 319
    .line 320
    invoke-virtual {v13, v12}, Lrx/internal/operators/OperatorMerge$MergeProducer;->produced(I)J

    .line 321
    .line 322
    .line 323
    move-result-wide v16

    .line 324
    goto :goto_10

    .line 325
    :cond_1b
    const-wide v16, 0x7fffffffffffffffL

    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    :goto_10
    int-to-long v12, v12

    .line 331
    invoke-virtual {v10, v12, v13}, Lrx/internal/operators/OperatorMerge$c;->g(J)V

    .line 332
    .line 333
    .line 334
    :cond_1c
    cmp-long v12, v16, v14

    .line 335
    .line 336
    if-eqz v12, :cond_1d

    .line 337
    .line 338
    if-nez v11, :cond_16

    .line 339
    .line 340
    :cond_1d
    iget-boolean v11, v10, Lrx/internal/operators/OperatorMerge$c;->g:Z

    .line 341
    .line 342
    iget-object v13, v10, Lrx/internal/operators/OperatorMerge$c;->h:Ll/urd0;

    .line 343
    .line 344
    if-eqz v11, :cond_20

    .line 345
    .line 346
    if-eqz v13, :cond_1e

    .line 347
    .line 348
    invoke-virtual {v13}, Ll/urd0;->e()Z

    .line 349
    .line 350
    .line 351
    move-result v11

    .line 352
    if-eqz v11, :cond_20

    .line 353
    .line 354
    :cond_1e
    invoke-virtual {v1, v10}, Lrx/internal/operators/OperatorMerge$d;->s(Lrx/internal/operators/OperatorMerge$c;)V

    .line 355
    .line 356
    .line 357
    invoke-virtual {v1}, Lrx/internal/operators/OperatorMerge$d;->h()Z

    .line 358
    .line 359
    .line 360
    move-result v9

    .line 361
    if-eqz v9, :cond_1f

    .line 362
    .line 363
    return-void

    .line 364
    :cond_1f
    add-int/lit8 v5, v5, 0x1

    .line 365
    .line 366
    const/4 v9, 0x1

    .line 367
    :cond_20
    if-nez v12, :cond_21

    .line 368
    .line 369
    goto :goto_11

    .line 370
    :cond_21
    add-int/lit8 v0, v0, 0x1

    .line 371
    .line 372
    if-ne v0, v7, :cond_22

    .line 373
    .line 374
    move v0, v2

    .line 375
    :cond_22
    add-int/lit8 v8, v8, 0x1

    .line 376
    .line 377
    goto/16 :goto_d

    .line 378
    .line 379
    :cond_23
    :goto_11
    iput v0, v1, Lrx/internal/operators/OperatorMerge$d;->t:I

    .line 380
    .line 381
    aget-object v0, v6, v0

    .line 382
    .line 383
    iget-wide v6, v0, Lrx/internal/operators/OperatorMerge$c;->f:J

    .line 384
    .line 385
    iput-wide v6, v1, Lrx/internal/operators/OperatorMerge$d;->s:J

    .line 386
    .line 387
    goto :goto_12

    .line 388
    :cond_24
    move v9, v2

    .line 389
    :goto_12
    if-lez v5, :cond_25

    .line 390
    .line 391
    int-to-long v4, v5

    .line 392
    invoke-virtual {v1, v4, v5}, Ll/gcg0;->e(J)V

    .line 393
    .line 394
    .line 395
    :cond_25
    if-eqz v9, :cond_26

    .line 396
    .line 397
    goto/16 :goto_0

    .line 398
    .line 399
    :cond_26
    monitor-enter p0
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 400
    :try_start_a
    iget-boolean v0, v1, Lrx/internal/operators/OperatorMerge$d;->o:Z
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_6

    .line 401
    .line 402
    if-nez v0, :cond_27

    .line 403
    .line 404
    :try_start_b
    iput-boolean v2, v1, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 405
    .line 406
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_5

    .line 407
    :goto_13
    return-void

    .line 408
    :catchall_5
    move-exception v0

    .line 409
    const/4 v9, 0x1

    .line 410
    goto :goto_14

    .line 411
    :cond_27
    :try_start_c
    iput-boolean v2, v1, Lrx/internal/operators/OperatorMerge$d;->o:Z

    .line 412
    .line 413
    monitor-exit p0
    :try_end_c
    .catchall {:try_start_c .. :try_end_c} :catchall_6

    .line 414
    goto/16 :goto_0

    .line 415
    .line 416
    :catchall_6
    move-exception v0

    .line 417
    move v9, v2

    .line 418
    :goto_14
    :try_start_d
    monitor-exit p0
    :try_end_d
    .catchall {:try_start_d .. :try_end_d} :catchall_8

    .line 419
    :try_start_e
    throw v0
    :try_end_e
    .catchall {:try_start_e .. :try_end_e} :catchall_7

    .line 420
    :catchall_7
    move-exception v0

    .line 421
    goto :goto_15

    .line 422
    :catchall_8
    move-exception v0

    .line 423
    goto :goto_14

    .line 424
    :goto_15
    if-nez v9, :cond_28

    .line 425
    .line 426
    monitor-enter p0

    .line 427
    :try_start_f
    iput-boolean v2, v1, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 428
    .line 429
    monitor-exit p0

    .line 430
    goto :goto_16

    .line 431
    :catchall_9
    move-exception v0

    .line 432
    monitor-exit p0
    :try_end_f
    .catchall {:try_start_f .. :try_end_f} :catchall_9

    .line 433
    throw v0

    .line 434
    :cond_28
    :goto_16
    throw v0
.end method

.method public l(Ljava/lang/Object;J)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;J)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$d;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v2, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    :try_start_1
    iget-boolean v2, p0, Lrx/internal/operators/OperatorMerge$d;->f:Z

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 15
    .line 16
    .line 17
    :try_start_2
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$d;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 21
    .line 22
    .line 23
    goto :goto_2

    .line 24
    :catchall_1
    move-exception p1

    .line 25
    goto :goto_4

    .line 26
    :catchall_2
    move-exception p1

    .line 27
    move v0, v1

    .line 28
    goto :goto_4

    .line 29
    :cond_0
    :try_start_3
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->o()Ljava/util/Queue;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v2, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :goto_0
    const-wide v2, 0x7fffffffffffffffL

    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    cmp-long p1, p2, v2

    .line 42
    .line 43
    if-eqz p1, :cond_1

    .line 44
    .line 45
    iget-object p1, p0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 46
    .line 47
    invoke-virtual {p1, v0}, Lrx/internal/operators/OperatorMerge$MergeProducer;->produced(I)J

    .line 48
    .line 49
    .line 50
    :cond_1
    iget p1, p0, Lrx/internal/operators/OperatorMerge$d;->v:I

    .line 51
    .line 52
    add-int/2addr p1, v0

    .line 53
    iget p2, p0, Lrx/internal/operators/OperatorMerge$d;->u:I

    .line 54
    .line 55
    if-ne p1, p2, :cond_2

    .line 56
    .line 57
    iput v1, p0, Lrx/internal/operators/OperatorMerge$d;->v:I

    .line 58
    .line 59
    int-to-long p1, p1

    .line 60
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorMerge$d;->u(J)V

    .line 61
    .line 62
    .line 63
    goto :goto_1

    .line 64
    :cond_2
    iput p1, p0, Lrx/internal/operators/OperatorMerge$d;->v:I

    .line 65
    .line 66
    :goto_1
    monitor-enter p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 67
    :try_start_4
    iget-boolean p1, p0, Lrx/internal/operators/OperatorMerge$d;->o:Z

    .line 68
    .line 69
    if-nez p1, :cond_3

    .line 70
    .line 71
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 72
    .line 73
    monitor-exit p0

    .line 74
    :goto_2
    return-void

    .line 75
    :catchall_3
    move-exception p1

    .line 76
    goto :goto_3

    .line 77
    :cond_3
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->o:Z

    .line 78
    .line 79
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 80
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->k()V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    :goto_3
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 85
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 86
    :goto_4
    if-nez v0, :cond_4

    .line 87
    .line 88
    monitor-enter p0

    .line 89
    :try_start_7
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 90
    .line 91
    monitor-exit p0

    .line 92
    goto :goto_5

    .line 93
    :catchall_4
    move-exception p1

    .line 94
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 95
    throw p1

    .line 96
    :cond_4
    :goto_5
    throw p1
.end method

.method public m(Lrx/internal/operators/OperatorMerge$c;Ljava/lang/Object;J)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$c<",
            "TT;>;TT;J)V"
        }
    .end annotation

    .line 1
    const/4 v0, 0x1

    .line 2
    const/4 v1, 0x0

    .line 3
    :try_start_0
    iget-object v2, p0, Lrx/internal/operators/OperatorMerge$d;->e:Ll/gcg0;

    .line 4
    .line 5
    invoke-interface {v2, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 6
    .line 7
    .line 8
    goto :goto_0

    .line 9
    :catchall_0
    move-exception p2

    .line 10
    :try_start_1
    iget-boolean v2, p0, Lrx/internal/operators/OperatorMerge$d;->f:Z

    .line 11
    .line 12
    if-nez v2, :cond_0

    .line 13
    .line 14
    invoke-static {p2}, Ll/j6f;->e(Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 15
    .line 16
    .line 17
    :try_start_2
    invoke-virtual {p1}, Ll/gcg0;->unsubscribe()V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p1, p2}, Lrx/internal/operators/OperatorMerge$c;->onError(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 21
    .line 22
    .line 23
    goto :goto_1

    .line 24
    :catchall_1
    move-exception p1

    .line 25
    goto :goto_3

    .line 26
    :catchall_2
    move-exception p1

    .line 27
    move v0, v1

    .line 28
    goto :goto_3

    .line 29
    :cond_0
    :try_start_3
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->o()Ljava/util/Queue;

    .line 30
    .line 31
    .line 32
    move-result-object v2

    .line 33
    invoke-interface {v2, p2}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 34
    .line 35
    .line 36
    :goto_0
    const-wide v2, 0x7fffffffffffffffL

    .line 37
    .line 38
    .line 39
    .line 40
    .line 41
    cmp-long p2, p3, v2

    .line 42
    .line 43
    if-eqz p2, :cond_1

    .line 44
    .line 45
    iget-object p2, p0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 46
    .line 47
    invoke-virtual {p2, v0}, Lrx/internal/operators/OperatorMerge$MergeProducer;->produced(I)J

    .line 48
    .line 49
    .line 50
    :cond_1
    const-wide/16 p2, 0x1

    .line 51
    .line 52
    invoke-virtual {p1, p2, p3}, Lrx/internal/operators/OperatorMerge$c;->g(J)V

    .line 53
    .line 54
    .line 55
    monitor-enter p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 56
    :try_start_4
    iget-boolean p1, p0, Lrx/internal/operators/OperatorMerge$d;->o:Z

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 61
    .line 62
    monitor-exit p0

    .line 63
    :goto_1
    return-void

    .line 64
    :catchall_3
    move-exception p1

    .line 65
    goto :goto_2

    .line 66
    :cond_2
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->o:Z

    .line 67
    .line 68
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_3

    .line 69
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->k()V

    .line 70
    .line 71
    .line 72
    return-void

    .line 73
    :goto_2
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 74
    :try_start_6
    throw p1
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_1

    .line 75
    :goto_3
    if-nez v0, :cond_3

    .line 76
    .line 77
    monitor-enter p0

    .line 78
    :try_start_7
    iput-boolean v1, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 79
    .line 80
    monitor-exit p0

    .line 81
    goto :goto_4

    .line 82
    :catchall_4
    move-exception p1

    .line 83
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_4

    .line 84
    throw p1

    .line 85
    :cond_3
    :goto_4
    throw p1
.end method

.method public n()Ll/ft5;
    .locals 2

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->j:Ll/ft5;

    .line 2
    .line 3
    if-nez v0, :cond_2

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->j:Ll/ft5;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ll/ft5;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/ft5;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->j:Ll/ft5;

    .line 16
    .line 17
    const/4 v1, 0x1

    .line 18
    goto :goto_0

    .line 19
    :catchall_0
    move-exception v0

    .line 20
    goto :goto_1

    .line 21
    :cond_0
    const/4 v1, 0x0

    .line 22
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    if-eqz v1, :cond_1

    .line 24
    .line 25
    invoke-virtual {p0, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-object v0

    .line 29
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 30
    throw v0

    .line 31
    :cond_2
    return-object v0
.end method

.method public o()Ljava/util/Queue;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Ljava/util/Queue<",
            "Ljava/lang/Throwable;",
            ">;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 7
    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    new-instance v0, Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 11
    .line 12
    invoke-direct {v0}, Ljava/util/concurrent/ConcurrentLinkedQueue;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    goto :goto_1

    .line 20
    :cond_0
    :goto_0
    monitor-exit p0

    .line 21
    return-object v0

    .line 22
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    throw v0

    .line 24
    :cond_1
    return-object v0
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Lrx/internal/operators/OperatorMerge$d;->m:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->o()Ljava/util/Queue;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-interface {v0, p1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 6
    .line 7
    .line 8
    const/4 p1, 0x1

    .line 9
    iput-boolean p1, p0, Lrx/internal/operators/OperatorMerge$d;->m:Z

    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$d;->p(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Lrx/c;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    return-void

    .line 4
    :cond_0
    invoke-static {}, Lrx/c;->empty()Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-ne p1, v0, :cond_1

    .line 9
    .line 10
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->j()V

    .line 11
    .line 12
    .line 13
    return-void

    .line 14
    :cond_1
    instance-of v0, p1, Lrx/internal/util/ScalarSynchronousObservable;

    .line 15
    .line 16
    if-eqz v0, :cond_2

    .line 17
    .line 18
    check-cast p1, Lrx/internal/util/ScalarSynchronousObservable;

    .line 19
    .line 20
    invoke-virtual {p1}, Lrx/internal/util/ScalarSynchronousObservable;->c()Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$d;->v(Ljava/lang/Object;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_2
    new-instance v0, Lrx/internal/operators/OperatorMerge$c;

    .line 29
    .line 30
    iget-wide v1, p0, Lrx/internal/operators/OperatorMerge$d;->r:J

    .line 31
    .line 32
    const-wide/16 v3, 0x1

    .line 33
    .line 34
    add-long/2addr v3, v1

    .line 35
    iput-wide v3, p0, Lrx/internal/operators/OperatorMerge$d;->r:J

    .line 36
    .line 37
    invoke-direct {v0, p0, v1, v2}, Lrx/internal/operators/OperatorMerge$c;-><init>(Lrx/internal/operators/OperatorMerge$d;J)V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p0, v0}, Lrx/internal/operators/OperatorMerge$d;->g(Lrx/internal/operators/OperatorMerge$c;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p1, v0}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 44
    .line 45
    .line 46
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 47
    .line 48
    .line 49
    return-void
.end method

.method public q(Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->i:Ljava/util/Queue;

    .line 2
    .line 3
    if-nez v0, :cond_3

    .line 4
    .line 5
    iget v0, p0, Lrx/internal/operators/OperatorMerge$d;->g:I

    .line 6
    .line 7
    const v1, 0x7fffffff

    .line 8
    .line 9
    .line 10
    if-ne v0, v1, :cond_0

    .line 11
    .line 12
    new-instance v0, Ll/rzf0;

    .line 13
    .line 14
    sget v1, Ll/urd0;->g:I

    .line 15
    .line 16
    invoke-direct {v0, v1}, Ll/rzf0;-><init>(I)V

    .line 17
    .line 18
    .line 19
    goto :goto_1

    .line 20
    :cond_0
    invoke-static {v0}, Lrx/internal/util/unsafe/Pow2;->isPowerOfTwo(I)Z

    .line 21
    .line 22
    .line 23
    move-result v1

    .line 24
    if-eqz v1, :cond_2

    .line 25
    .line 26
    invoke-static {}, Lrx/internal/util/unsafe/UnsafeAccess;->isUnsafeAvailable()Z

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    if-eqz v1, :cond_1

    .line 31
    .line 32
    new-instance v1, Lrx/internal/util/unsafe/SpscArrayQueue;

    .line 33
    .line 34
    invoke-direct {v1, v0}, Lrx/internal/util/unsafe/SpscArrayQueue;-><init>(I)V

    .line 35
    .line 36
    .line 37
    :goto_0
    move-object v0, v1

    .line 38
    goto :goto_1

    .line 39
    :cond_1
    new-instance v1, Ll/ozf0;

    .line 40
    .line 41
    invoke-direct {v1, v0}, Ll/ozf0;-><init>(I)V

    .line 42
    .line 43
    .line 44
    goto :goto_0

    .line 45
    :cond_2
    new-instance v1, Lrx/internal/util/atomic/SpscExactAtomicArrayQueue;

    .line 46
    .line 47
    invoke-direct {v1, v0}, Lrx/internal/util/atomic/SpscExactAtomicArrayQueue;-><init>(I)V

    .line 48
    .line 49
    .line 50
    goto :goto_0

    .line 51
    :goto_1
    iput-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->i:Ljava/util/Queue;

    .line 52
    .line 53
    :cond_3
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$d;->l:Lrx/internal/operators/NotificationLite;

    .line 54
    .line 55
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    move-result-object v1

    .line 59
    invoke-interface {v0, v1}, Ljava/util/Queue;->offer(Ljava/lang/Object;)Z

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    if-nez v0, :cond_4

    .line 64
    .line 65
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 66
    .line 67
    .line 68
    new-instance v0, Lrx/exceptions/MissingBackpressureException;

    .line 69
    .line 70
    invoke-direct {v0}, Lrx/exceptions/MissingBackpressureException;-><init>()V

    .line 71
    .line 72
    .line 73
    invoke-static {v0, p1}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$d;->onError(Ljava/lang/Throwable;)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_4
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 82
    .line 83
    .line 84
    return-void
.end method

.method public r(Lrx/internal/operators/OperatorMerge$c;Ljava/lang/Object;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$c<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lrx/internal/operators/OperatorMerge$c;->h:Ll/urd0;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    invoke-static {}, Ll/urd0;->b()Ll/urd0;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p1, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 10
    .line 11
    .line 12
    iput-object v0, p1, Lrx/internal/operators/OperatorMerge$c;->h:Ll/urd0;

    .line 13
    .line 14
    :cond_0
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$d;->l:Lrx/internal/operators/NotificationLite;

    .line 15
    .line 16
    invoke-virtual {v1, p2}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object p2

    .line 20
    invoke-virtual {v0, p2}, Ll/urd0;->g(Ljava/lang/Object;)V
    :try_end_0
    .catch Lrx/exceptions/MissingBackpressureException; {:try_start_0 .. :try_end_0} :catch_1
    .catch Ljava/lang/IllegalStateException; {:try_start_0 .. :try_end_0} :catch_0

    .line 21
    .line 22
    .line 23
    invoke-virtual {p0}, Lrx/internal/operators/OperatorMerge$d;->i()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :catch_0
    move-exception p0

    .line 28
    goto :goto_0

    .line 29
    :catch_1
    move-exception p0

    .line 30
    goto :goto_1

    .line 31
    :goto_0
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-nez p2, :cond_1

    .line 36
    .line 37
    invoke-virtual {p1}, Ll/gcg0;->unsubscribe()V

    .line 38
    .line 39
    .line 40
    invoke-virtual {p1, p0}, Lrx/internal/operators/OperatorMerge$c;->onError(Ljava/lang/Throwable;)V

    .line 41
    .line 42
    .line 43
    :cond_1
    return-void

    .line 44
    :goto_1
    invoke-virtual {p1}, Ll/gcg0;->unsubscribe()V

    .line 45
    .line 46
    .line 47
    invoke-virtual {p1, p0}, Lrx/internal/operators/OperatorMerge$c;->onError(Ljava/lang/Throwable;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public s(Lrx/internal/operators/OperatorMerge$c;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lrx/internal/operators/OperatorMerge$c;->h:Ll/urd0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/urd0;->j()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->j:Ll/ft5;

    .line 9
    .line 10
    invoke-virtual {v0, p1}, Ll/ft5;->d(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->p:Ljava/lang/Object;

    .line 14
    .line 15
    monitor-enter v0

    .line 16
    :try_start_0
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 17
    .line 18
    array-length v2, v1

    .line 19
    const/4 v3, 0x0

    .line 20
    move v4, v3

    .line 21
    :goto_0
    if-ge v4, v2, :cond_2

    .line 22
    .line 23
    aget-object v5, v1, v4

    .line 24
    .line 25
    invoke-virtual {p1, v5}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 26
    .line 27
    .line 28
    move-result v5

    .line 29
    if-eqz v5, :cond_1

    .line 30
    .line 31
    goto :goto_1

    .line 32
    :cond_1
    add-int/lit8 v4, v4, 0x1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :catchall_0
    move-exception p0

    .line 36
    goto :goto_2

    .line 37
    :cond_2
    const/4 v4, -0x1

    .line 38
    :goto_1
    if-gez v4, :cond_3

    .line 39
    .line 40
    monitor-exit v0

    .line 41
    return-void

    .line 42
    :cond_3
    const/4 p1, 0x1

    .line 43
    if-ne v2, p1, :cond_4

    .line 44
    .line 45
    sget-object p1, Lrx/internal/operators/OperatorMerge$d;->w:[Lrx/internal/operators/OperatorMerge$c;

    .line 46
    .line 47
    iput-object p1, p0, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 48
    .line 49
    monitor-exit v0

    .line 50
    return-void

    .line 51
    :cond_4
    add-int/lit8 v5, v2, -0x1

    .line 52
    .line 53
    new-array v5, v5, [Lrx/internal/operators/OperatorMerge$c;

    .line 54
    .line 55
    invoke-static {v1, v3, v5, v3, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 56
    .line 57
    .line 58
    add-int/lit8 v3, v4, 0x1

    .line 59
    .line 60
    sub-int/2addr v2, v4

    .line 61
    sub-int/2addr v2, p1

    .line 62
    invoke-static {v1, v3, v5, v4, v2}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 63
    .line 64
    .line 65
    iput-object v5, p0, Lrx/internal/operators/OperatorMerge$d;->q:[Lrx/internal/operators/OperatorMerge$c;

    .line 66
    .line 67
    monitor-exit v0

    .line 68
    return-void

    .line 69
    :goto_2
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 70
    throw p0
.end method

.method public final t()V
    .locals 3

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v1, p0, Lrx/internal/operators/OperatorMerge$d;->k:Ljava/util/concurrent/ConcurrentLinkedQueue;

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 6
    .line 7
    .line 8
    invoke-interface {v0}, Ljava/util/List;->size()I

    .line 9
    .line 10
    .line 11
    move-result v1

    .line 12
    iget-object p0, p0, Lrx/internal/operators/OperatorMerge$d;->e:Ll/gcg0;

    .line 13
    .line 14
    const/4 v2, 0x1

    .line 15
    if-ne v1, v2, :cond_0

    .line 16
    .line 17
    const/4 v1, 0x0

    .line 18
    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    check-cast v0, Ljava/lang/Throwable;

    .line 23
    .line 24
    invoke-interface {p0, v0}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 29
    .line 30
    invoke-direct {v1, v0}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p0, v1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public u(J)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/gcg0;->e(J)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public v(Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    if-eqz v4, :cond_1

    .line 13
    .line 14
    monitor-enter p0

    .line 15
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-boolean v4, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 22
    .line 23
    if-nez v4, :cond_0

    .line 24
    .line 25
    cmp-long v2, v0, v2

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    iput-boolean v5, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit p0

    .line 36
    goto :goto_2

    .line 37
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p1

    .line 39
    :cond_1
    :goto_2
    if-eqz v5, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1, v0, v1}, Lrx/internal/operators/OperatorMerge$d;->l(Ljava/lang/Object;J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorMerge$d;->q(Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method

.method public w(Lrx/internal/operators/OperatorMerge$c;Ljava/lang/Object;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorMerge$c<",
            "TT;>;TT;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/16 v2, 0x0

    .line 8
    .line 9
    cmp-long v4, v0, v2

    .line 10
    .line 11
    const/4 v5, 0x0

    .line 12
    if-eqz v4, :cond_1

    .line 13
    .line 14
    monitor-enter p0

    .line 15
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorMerge$d;->h:Lrx/internal/operators/OperatorMerge$MergeProducer;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    iget-boolean v4, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 22
    .line 23
    if-nez v4, :cond_0

    .line 24
    .line 25
    cmp-long v2, v0, v2

    .line 26
    .line 27
    if-eqz v2, :cond_0

    .line 28
    .line 29
    const/4 v5, 0x1

    .line 30
    iput-boolean v5, p0, Lrx/internal/operators/OperatorMerge$d;->n:Z

    .line 31
    .line 32
    goto :goto_0

    .line 33
    :catchall_0
    move-exception p1

    .line 34
    goto :goto_1

    .line 35
    :cond_0
    :goto_0
    monitor-exit p0

    .line 36
    goto :goto_2

    .line 37
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 38
    throw p1

    .line 39
    :cond_1
    :goto_2
    if-eqz v5, :cond_2

    .line 40
    .line 41
    invoke-virtual {p0, p1, p2, v0, v1}, Lrx/internal/operators/OperatorMerge$d;->m(Lrx/internal/operators/OperatorMerge$c;Ljava/lang/Object;J)V

    .line 42
    .line 43
    .line 44
    return-void

    .line 45
    :cond_2
    invoke-virtual {p0, p1, p2}, Lrx/internal/operators/OperatorMerge$d;->r(Lrx/internal/operators/OperatorMerge$c;Ljava/lang/Object;)V

    .line 46
    .line 47
    .line 48
    return-void
.end method
