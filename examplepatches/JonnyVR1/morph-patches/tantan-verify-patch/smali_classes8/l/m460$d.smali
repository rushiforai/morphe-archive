.class public final Ll/m460$d;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/m460;
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
.field public static final r:Ljava/lang/Throwable;


# instance fields
.field public final e:Ll/gcg0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/gcg0<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public final f:Ll/wqe0;

.field public final g:Z

.field public final h:Ljava/util/concurrent/atomic/AtomicLong;

.field public final i:Ll/pzf0;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pzf0<",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation
.end field

.field public final j:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public k:Z

.field public l:Z

.field public m:J

.field public n:Ll/vk90;

.field public volatile o:Z

.field public p:Ljava/lang/Throwable;

.field public q:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/Throwable;

    .line 2
    .line 3
    const-string v1, "Terminal error"

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/Throwable;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    sput-object v0, Ll/m460$d;->r:Ljava/lang/Throwable;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Ll/gcg0;Z)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TT;>;Z)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/m460$d;->e:Ll/gcg0;

    .line 5
    .line 6
    new-instance p1, Ll/wqe0;

    .line 7
    .line 8
    invoke-direct {p1}, Ll/wqe0;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object p1, p0, Ll/m460$d;->f:Ll/wqe0;

    .line 12
    .line 13
    iput-boolean p2, p0, Ll/m460$d;->g:Z

    .line 14
    .line 15
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 16
    .line 17
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 18
    .line 19
    .line 20
    iput-object p1, p0, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 21
    .line 22
    new-instance p1, Ll/pzf0;

    .line 23
    .line 24
    sget p2, Ll/urd0;->g:I

    .line 25
    .line 26
    invoke-direct {p1, p2}, Ll/pzf0;-><init>(I)V

    .line 27
    .line 28
    .line 29
    iput-object p1, p0, Ll/m460$d;->i:Ll/pzf0;

    .line 30
    .line 31
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    iput-object p1, p0, Ll/m460$d;->j:Lrx/internal/operators/NotificationLite;

    .line 36
    .line 37
    return-void
.end method


# virtual methods
.method public g(ZZLjava/lang/Throwable;Ll/pzf0;Ll/gcg0;Z)Z
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(ZZ",
            "Ljava/lang/Throwable;",
            "Ll/pzf0<",
            "Ljava/lang/Object;",
            ">;",
            "Ll/gcg0<",
            "-TT;>;Z)Z"
        }
    .end annotation

    .line 1
    iget-boolean p0, p0, Ll/m460$d;->g:Z

    .line 2
    .line 3
    const/4 v0, 0x1

    .line 4
    if-eqz p0, :cond_1

    .line 5
    .line 6
    if-eqz p1, :cond_3

    .line 7
    .line 8
    if-nez p2, :cond_3

    .line 9
    .line 10
    if-eqz p6, :cond_3

    .line 11
    .line 12
    if-eqz p3, :cond_0

    .line 13
    .line 14
    invoke-interface {p5, p3}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 15
    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_0
    invoke-interface {p5}, Ll/bb50;->onCompleted()V

    .line 19
    .line 20
    .line 21
    :goto_0
    return v0

    .line 22
    :cond_1
    if-eqz p3, :cond_2

    .line 23
    .line 24
    invoke-virtual {p4}, Ll/pzf0;->clear()V

    .line 25
    .line 26
    .line 27
    invoke-interface {p5, p3}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 28
    .line 29
    .line 30
    return v0

    .line 31
    :cond_2
    if-eqz p1, :cond_3

    .line 32
    .line 33
    if-nez p2, :cond_3

    .line 34
    .line 35
    if-eqz p6, :cond_3

    .line 36
    .line 37
    invoke-interface {p5}, Ll/bb50;->onCompleted()V

    .line 38
    .line 39
    .line 40
    return v0

    .line 41
    :cond_3
    const/4 p0, 0x0

    .line 42
    return p0
.end method

.method public h(J)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m460$d;->n:Ll/vk90;

    .line 3
    .line 4
    iget-wide v1, p0, Ll/m460$d;->m:J

    .line 5
    .line 6
    invoke-static {v1, v2, p1, p2}, Ll/rc2;->a(JJ)J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    iput-wide v1, p0, Ll/m460$d;->m:J

    .line 11
    .line 12
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-interface {v0, p1, p2}, Ll/vk90;->request(J)V

    .line 16
    .line 17
    .line 18
    :cond_0
    invoke-virtual {p0}, Ll/m460$d;->k()V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :catchall_0
    move-exception p1

    .line 23
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 24
    throw p1
.end method

.method public i()V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x0

    .line 3
    :try_start_0
    iput-object v0, p0, Ll/m460$d;->n:Ll/vk90;

    .line 4
    .line 5
    monitor-exit p0

    .line 6
    return-void

    .line 7
    :catchall_0
    move-exception v0

    .line 8
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 9
    throw v0
.end method

.method public j(J)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    cmp-long p1, v0, p1

    .line 9
    .line 10
    if-eqz p1, :cond_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const/4 p1, 0x0

    .line 17
    iput-boolean p1, p0, Ll/m460$d;->q:Z

    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    iput-object p1, p0, Ll/m460$d;->n:Ll/vk90;

    .line 21
    .line 22
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    invoke-virtual {p0}, Ll/m460$d;->k()V

    .line 24
    .line 25
    .line 26
    return-void

    .line 27
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 28
    throw p1
.end method

.method public k()V
    .locals 17

    .line 1
    move-object/from16 v1, p0

    .line 2
    .line 3
    monitor-enter p0

    .line 4
    :try_start_0
    iget-boolean v0, v1, Ll/m460$d;->k:Z

    .line 5
    .line 6
    const/4 v2, 0x1

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iput-boolean v2, v1, Ll/m460$d;->l:Z

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto/16 :goto_6

    .line 15
    .line 16
    :cond_0
    iput-boolean v2, v1, Ll/m460$d;->k:Z

    .line 17
    .line 18
    iget-boolean v0, v1, Ll/m460$d;->q:Z

    .line 19
    .line 20
    iget-wide v2, v1, Ll/m460$d;->m:J

    .line 21
    .line 22
    iget-object v4, v1, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 23
    .line 24
    if-eqz v4, :cond_1

    .line 25
    .line 26
    sget-object v5, Ll/m460$d;->r:Ljava/lang/Throwable;

    .line 27
    .line 28
    if-eq v4, v5, :cond_1

    .line 29
    .line 30
    iget-boolean v6, v1, Ll/m460$d;->g:Z

    .line 31
    .line 32
    if-nez v6, :cond_1

    .line 33
    .line 34
    iput-object v5, v1, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 35
    .line 36
    :cond_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    iget-object v5, v1, Ll/m460$d;->i:Ll/pzf0;

    .line 38
    .line 39
    iget-object v8, v1, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 40
    .line 41
    iget-object v6, v1, Ll/m460$d;->e:Ll/gcg0;

    .line 42
    .line 43
    iget-boolean v7, v1, Ll/m460$d;->o:Z

    .line 44
    .line 45
    move-wide v9, v2

    .line 46
    move v2, v7

    .line 47
    move v3, v0

    .line 48
    :goto_0
    const-wide/16 v11, 0x0

    .line 49
    .line 50
    :cond_2
    :goto_1
    cmp-long v0, v11, v9

    .line 51
    .line 52
    if-eqz v0, :cond_6

    .line 53
    .line 54
    invoke-virtual {v6}, Ll/gcg0;->isUnsubscribed()Z

    .line 55
    .line 56
    .line 57
    move-result v7

    .line 58
    if-eqz v7, :cond_3

    .line 59
    .line 60
    goto :goto_3

    .line 61
    :cond_3
    invoke-virtual {v5}, Ll/pzf0;->isEmpty()Z

    .line 62
    .line 63
    .line 64
    move-result v7

    .line 65
    invoke-virtual/range {v1 .. v7}, Ll/m460$d;->g(ZZLjava/lang/Throwable;Ll/pzf0;Ll/gcg0;Z)Z

    .line 66
    .line 67
    .line 68
    move-result v13

    .line 69
    if-eqz v13, :cond_4

    .line 70
    .line 71
    goto :goto_3

    .line 72
    :cond_4
    if-eqz v7, :cond_5

    .line 73
    .line 74
    goto :goto_2

    .line 75
    :cond_5
    invoke-virtual {v5}, Ll/pzf0;->poll()Ljava/lang/Object;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    check-cast v0, Ll/m460$c;

    .line 80
    .line 81
    iget-object v7, v1, Ll/m460$d;->j:Lrx/internal/operators/NotificationLite;

    .line 82
    .line 83
    invoke-virtual {v5}, Ll/pzf0;->poll()Ljava/lang/Object;

    .line 84
    .line 85
    .line 86
    move-result-object v13

    .line 87
    invoke-virtual {v7, v13}, Lrx/internal/operators/NotificationLite;->e(Ljava/lang/Object;)Ljava/lang/Object;

    .line 88
    .line 89
    .line 90
    move-result-object v7

    .line 91
    invoke-virtual {v8}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 92
    .line 93
    .line 94
    move-result-wide v13

    .line 95
    invoke-static {v0}, Ll/m460$c;->g(Ll/m460$c;)J

    .line 96
    .line 97
    .line 98
    move-result-wide v15

    .line 99
    cmp-long v0, v13, v15

    .line 100
    .line 101
    if-nez v0, :cond_2

    .line 102
    .line 103
    invoke-interface {v6, v7}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 104
    .line 105
    .line 106
    const-wide/16 v13, 0x1

    .line 107
    .line 108
    add-long/2addr v11, v13

    .line 109
    goto :goto_1

    .line 110
    :cond_6
    :goto_2
    if-nez v0, :cond_8

    .line 111
    .line 112
    invoke-virtual {v6}, Ll/gcg0;->isUnsubscribed()Z

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    goto :goto_3

    .line 119
    :cond_7
    iget-boolean v2, v1, Ll/m460$d;->o:Z

    .line 120
    .line 121
    invoke-virtual {v5}, Ll/pzf0;->isEmpty()Z

    .line 122
    .line 123
    .line 124
    move-result v7

    .line 125
    invoke-virtual/range {v1 .. v7}, Ll/m460$d;->g(ZZLjava/lang/Throwable;Ll/pzf0;Ll/gcg0;Z)Z

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    if-eqz v0, :cond_8

    .line 130
    .line 131
    :goto_3
    return-void

    .line 132
    :cond_8
    monitor-enter p0

    .line 133
    :try_start_1
    iget-wide v2, v1, Ll/m460$d;->m:J

    .line 134
    .line 135
    const-wide v9, 0x7fffffffffffffffL

    .line 136
    .line 137
    .line 138
    .line 139
    .line 140
    cmp-long v0, v2, v9

    .line 141
    .line 142
    if-eqz v0, :cond_9

    .line 143
    .line 144
    sub-long/2addr v2, v11

    .line 145
    iput-wide v2, v1, Ll/m460$d;->m:J

    .line 146
    .line 147
    :cond_9
    move-wide v9, v2

    .line 148
    goto :goto_4

    .line 149
    :catchall_1
    move-exception v0

    .line 150
    goto :goto_5

    .line 151
    :goto_4
    iget-boolean v0, v1, Ll/m460$d;->l:Z

    .line 152
    .line 153
    const/4 v2, 0x0

    .line 154
    if-nez v0, :cond_a

    .line 155
    .line 156
    iput-boolean v2, v1, Ll/m460$d;->k:Z

    .line 157
    .line 158
    monitor-exit p0

    .line 159
    return-void

    .line 160
    :cond_a
    iput-boolean v2, v1, Ll/m460$d;->l:Z

    .line 161
    .line 162
    iget-boolean v2, v1, Ll/m460$d;->o:Z

    .line 163
    .line 164
    iget-boolean v3, v1, Ll/m460$d;->q:Z

    .line 165
    .line 166
    iget-object v4, v1, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 167
    .line 168
    if-eqz v4, :cond_b

    .line 169
    .line 170
    sget-object v0, Ll/m460$d;->r:Ljava/lang/Throwable;

    .line 171
    .line 172
    if-eq v4, v0, :cond_b

    .line 173
    .line 174
    iget-boolean v7, v1, Ll/m460$d;->g:Z

    .line 175
    .line 176
    if-nez v7, :cond_b

    .line 177
    .line 178
    iput-object v0, v1, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 179
    .line 180
    :cond_b
    monitor-exit p0

    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :goto_5
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 184
    throw v0

    .line 185
    :goto_6
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 186
    throw v0
.end method

.method public l(Ljava/lang/Object;Ll/m460$c;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;",
            "Ll/m460$c<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    invoke-static {p2}, Ll/m460$c;->g(Ll/m460$c;)J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    cmp-long v0, v0, v2

    .line 13
    .line 14
    if-eqz v0, :cond_0

    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception p1

    .line 19
    goto :goto_0

    .line 20
    :cond_0
    iget-object v0, p0, Ll/m460$d;->i:Ll/pzf0;

    .line 21
    .line 22
    iget-object v1, p0, Ll/m460$d;->j:Lrx/internal/operators/NotificationLite;

    .line 23
    .line 24
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    invoke-virtual {v0, p2, p1}, Ll/pzf0;->s(Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    invoke-virtual {p0}, Ll/m460$d;->k()V

    .line 33
    .line 34
    .line 35
    return-void

    .line 36
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 37
    throw p1
.end method

.method public m(Ljava/lang/Throwable;J)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    cmp-long p2, v0, p2

    .line 9
    .line 10
    if-nez p2, :cond_0

    .line 11
    .line 12
    invoke-virtual {p0, p1}, Ll/m460$d;->r(Ljava/lang/Throwable;)Z

    .line 13
    .line 14
    .line 15
    move-result p2

    .line 16
    const/4 p3, 0x0

    .line 17
    iput-boolean p3, p0, Ll/m460$d;->q:Z

    .line 18
    .line 19
    const/4 p3, 0x0

    .line 20
    iput-object p3, p0, Ll/m460$d;->n:Ll/vk90;

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :catchall_0
    move-exception p1

    .line 24
    goto :goto_1

    .line 25
    :cond_0
    const/4 p2, 0x1

    .line 26
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 27
    if-eqz p2, :cond_1

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/m460$d;->k()V

    .line 30
    .line 31
    .line 32
    return-void

    .line 33
    :cond_1
    invoke-virtual {p0, p1}, Ll/m460$d;->q(Ljava/lang/Throwable;)V

    .line 34
    .line 35
    .line 36
    return-void

    .line 37
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 38
    throw p1
.end method

.method public n()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m460$d;->e:Ll/gcg0;

    .line 2
    .line 3
    iget-object v1, p0, Ll/m460$d;->f:Ll/wqe0;

    .line 4
    .line 5
    invoke-virtual {v0, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 6
    .line 7
    .line 8
    iget-object v0, p0, Ll/m460$d;->e:Ll/gcg0;

    .line 9
    .line 10
    new-instance v1, Ll/m460$d$a;

    .line 11
    .line 12
    invoke-direct {v1, p0}, Ll/m460$d$a;-><init>(Ll/m460$d;)V

    .line 13
    .line 14
    .line 15
    invoke-static {v1}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/m460$d;->e:Ll/gcg0;

    .line 23
    .line 24
    new-instance v1, Ll/m460$d$b;

    .line 25
    .line 26
    invoke-direct {v1, p0}, Ll/m460$d$b;-><init>(Ll/m460$d;)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {v0, v1}, Ll/gcg0;->f(Ll/vk90;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public o(Ll/vk90;J)V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 3
    .line 4
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 5
    .line 6
    .line 7
    move-result-wide v0

    .line 8
    cmp-long p2, v0, p2

    .line 9
    .line 10
    if-eqz p2, :cond_0

    .line 11
    .line 12
    monitor-exit p0

    .line 13
    return-void

    .line 14
    :catchall_0
    move-exception p1

    .line 15
    goto :goto_0

    .line 16
    :cond_0
    iget-wide p2, p0, Ll/m460$d;->m:J

    .line 17
    .line 18
    iput-object p1, p0, Ll/m460$d;->n:Ll/vk90;

    .line 19
    .line 20
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    invoke-interface {p1, p2, p3}, Ll/vk90;->request(J)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 26
    throw p1
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/m460$d;->o:Z

    .line 3
    .line 4
    invoke-virtual {p0}, Ll/m460$d;->k()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    invoke-virtual {p0, p1}, Ll/m460$d;->r(Ljava/lang/Throwable;)Z

    .line 3
    .line 4
    .line 5
    move-result v0

    .line 6
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p1, 0x1

    .line 10
    iput-boolean p1, p0, Ll/m460$d;->o:Z

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/m460$d;->k()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    invoke-virtual {p0, p1}, Ll/m460$d;->q(Ljava/lang/Throwable;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 22
    throw p1
.end method

.method public bridge synthetic onNext(Ljava/lang/Object;)V
    .locals 0

    .line 1
    check-cast p1, Lrx/c;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/m460$d;->p(Lrx/c;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public p(Lrx/c;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/c<",
            "+TT;>;)V"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Ll/m460$d;->h:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->incrementAndGet()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    iget-object v2, p0, Ll/m460$d;->f:Ll/wqe0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/wqe0;->a()Ll/kcg0;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    invoke-interface {v2}, Ll/kcg0;->unsubscribe()V

    .line 16
    .line 17
    .line 18
    :cond_0
    monitor-enter p0

    .line 19
    :try_start_0
    new-instance v2, Ll/m460$c;

    .line 20
    .line 21
    invoke-direct {v2, v0, v1, p0}, Ll/m460$c;-><init>(JLl/m460$d;)V

    .line 22
    .line 23
    .line 24
    const/4 v0, 0x1

    .line 25
    iput-boolean v0, p0, Ll/m460$d;->q:Z

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    iput-object v0, p0, Ll/m460$d;->n:Ll/vk90;

    .line 29
    .line 30
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 31
    iget-object p0, p0, Ll/m460$d;->f:Ll/wqe0;

    .line 32
    .line 33
    invoke-virtual {p0, v2}, Ll/wqe0;->b(Ll/kcg0;)V

    .line 34
    .line 35
    .line 36
    invoke-virtual {p1, v2}, Lrx/c;->unsafeSubscribe(Ll/gcg0;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :catchall_0
    move-exception p1

    .line 41
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 42
    throw p1
.end method

.method public q(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {p1}, Ll/hrd0;->j(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public r(Ljava/lang/Throwable;)Z
    .locals 2

    .line 1
    iget-object v0, p0, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 2
    .line 3
    sget-object v1, Ll/m460$d;->r:Ljava/lang/Throwable;

    .line 4
    .line 5
    if-ne v0, v1, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x0

    .line 8
    return p0

    .line 9
    :cond_0
    if-nez v0, :cond_1

    .line 10
    .line 11
    iput-object p1, p0, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 12
    .line 13
    goto :goto_0

    .line 14
    :cond_1
    instance-of v1, v0, Lrx/exceptions/CompositeException;

    .line 15
    .line 16
    if-eqz v1, :cond_2

    .line 17
    .line 18
    new-instance v1, Ljava/util/ArrayList;

    .line 19
    .line 20
    check-cast v0, Lrx/exceptions/CompositeException;

    .line 21
    .line 22
    invoke-virtual {v0}, Lrx/exceptions/CompositeException;->getExceptions()Ljava/util/List;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-direct {v1, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 27
    .line 28
    .line 29
    invoke-interface {v1, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 30
    .line 31
    .line 32
    new-instance p1, Lrx/exceptions/CompositeException;

    .line 33
    .line 34
    invoke-direct {p1, v1}, Lrx/exceptions/CompositeException;-><init>(Ljava/util/Collection;)V

    .line 35
    .line 36
    .line 37
    iput-object p1, p0, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 38
    .line 39
    goto :goto_0

    .line 40
    :cond_2
    new-instance v1, Lrx/exceptions/CompositeException;

    .line 41
    .line 42
    filled-new-array {v0, p1}, [Ljava/lang/Throwable;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-direct {v1, p1}, Lrx/exceptions/CompositeException;-><init>([Ljava/lang/Throwable;)V

    .line 47
    .line 48
    .line 49
    iput-object v1, p0, Ll/m460$d;->p:Ljava/lang/Throwable;

    .line 50
    .line 51
    :goto_0
    const/4 p0, 0x1

    .line 52
    return p0
.end method
