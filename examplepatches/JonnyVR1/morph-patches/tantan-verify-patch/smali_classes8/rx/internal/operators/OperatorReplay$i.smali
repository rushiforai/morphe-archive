.class public final Lrx/internal/operators/OperatorReplay$i;
.super Ll/gcg0;
.source "SourceFile"

# interfaces
.implements Ll/kcg0;


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lrx/internal/operators/OperatorReplay;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x19
    name = "i"
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ll/gcg0<",
        "TT;>;",
        "Ll/kcg0;"
    }
.end annotation


# static fields
.field public static final u:[Lrx/internal/operators/OperatorReplay$InnerProducer;

.field public static final v:[Lrx/internal/operators/OperatorReplay$InnerProducer;


# instance fields
.field public final e:Lrx/internal/operators/OperatorReplay$h;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;"
        }
    .end annotation
.end field

.field public final f:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field

.field public g:Z

.field public volatile h:Z

.field public final i:Ll/qx50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qx50<",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public j:[Lrx/internal/operators/OperatorReplay$InnerProducer;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "[",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;"
        }
    .end annotation
.end field

.field public volatile k:J

.field public l:J

.field public final m:Ljava/util/concurrent/atomic/AtomicBoolean;

.field public n:Z

.field public o:Z

.field public p:J

.field public q:J

.field public volatile r:Ll/vk90;

.field public s:Ljava/util/List;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/List<",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;>;"
        }
    .end annotation
.end field

.field public t:Z


# direct methods
.method static constructor <clinit>()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    new-array v1, v0, [Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 3
    .line 4
    sput-object v1, Lrx/internal/operators/OperatorReplay$i;->u:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 5
    .line 6
    new-array v0, v0, [Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 7
    .line 8
    sput-object v0, Lrx/internal/operators/OperatorReplay$i;->v:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 9
    .line 10
    return-void
.end method

.method public constructor <init>(Lrx/internal/operators/OperatorReplay$h;)V
    .locals 2
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorReplay$h<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->e:Lrx/internal/operators/OperatorReplay$h;

    .line 5
    .line 6
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->f:Lrx/internal/operators/NotificationLite;

    .line 11
    .line 12
    new-instance p1, Ll/qx50;

    .line 13
    .line 14
    invoke-direct {p1}, Ll/qx50;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 18
    .line 19
    sget-object p1, Lrx/internal/operators/OperatorReplay$i;->u:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 20
    .line 21
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->j:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 22
    .line 23
    new-instance p1, Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 24
    .line 25
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicBoolean;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->m:Ljava/util/concurrent/atomic/AtomicBoolean;

    .line 29
    .line 30
    const-wide/16 v0, 0x0

    .line 31
    .line 32
    invoke-virtual {p0, v0, v1}, Ll/gcg0;->e(J)V

    .line 33
    .line 34
    .line 35
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 1

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->r:Ll/vk90;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->r:Ll/vk90;

    .line 6
    .line 7
    const/4 p1, 0x0

    .line 8
    invoke-virtual {p0, p1}, Lrx/internal/operators/OperatorReplay$i;->k(Lrx/internal/operators/OperatorReplay$InnerProducer;)V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$i;->m()V

    .line 12
    .line 13
    .line 14
    return-void

    .line 15
    :cond_0
    const-string p0, "Only a single producer can be set on a Subscriber."

    .line 16
    .line 17
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public g(Lrx/internal/operators/OperatorReplay$InnerProducer;)Z
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;)Z"
        }
    .end annotation

    .line 1
    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return v1

    .line 10
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 11
    .line 12
    monitor-enter v0

    .line 13
    :try_start_0
    iget-boolean v2, p0, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return v1

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    goto :goto_0

    .line 21
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 22
    .line 23
    invoke-virtual {v1, p1}, Ll/qx50;->a(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    iget-wide v1, p0, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 27
    .line 28
    const-wide/16 v3, 0x1

    .line 29
    .line 30
    add-long/2addr v1, v3

    .line 31
    iput-wide v1, p0, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 32
    .line 33
    monitor-exit v0

    .line 34
    const/4 p0, 0x1

    .line 35
    return p0

    .line 36
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 37
    throw p0
.end method

.method public h()[Lrx/internal/operators/OperatorReplay$InnerProducer;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()[",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;"
        }
    .end annotation

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 2
    .line 3
    monitor-enter v0

    .line 4
    :try_start_0
    iget-object p0, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/qx50;->g()[Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    array-length v1, p0

    .line 11
    new-array v2, v1, [Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 12
    .line 13
    const/4 v3, 0x0

    .line 14
    invoke-static {p0, v3, v2, v3, v1}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 15
    .line 16
    .line 17
    monitor-exit v0

    .line 18
    return-object v2

    .line 19
    :catchall_0
    move-exception p0

    .line 20
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 21
    throw p0
.end method

.method public i()V
    .locals 1

    .line 1
    new-instance v0, Lrx/internal/operators/OperatorReplay$i$a;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Lrx/internal/operators/OperatorReplay$i$a;-><init>(Lrx/internal/operators/OperatorReplay$i;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/pcg0;->a(Ll/x20;)Ll/kcg0;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0, v0}, Ll/gcg0;->b(Ll/kcg0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public j(JJ)V
    .locals 6

    .line 1
    iget-wide v0, p0, Lrx/internal/operators/OperatorReplay$i;->q:J

    .line 2
    .line 3
    iget-object v2, p0, Lrx/internal/operators/OperatorReplay$i;->r:Ll/vk90;

    .line 4
    .line 5
    sub-long p3, p1, p3

    .line 6
    .line 7
    const-wide/16 v3, 0x0

    .line 8
    .line 9
    cmp-long v5, p3, v3

    .line 10
    .line 11
    if-eqz v5, :cond_3

    .line 12
    .line 13
    iput-wide p1, p0, Lrx/internal/operators/OperatorReplay$i;->p:J

    .line 14
    .line 15
    if-eqz v2, :cond_1

    .line 16
    .line 17
    cmp-long p1, v0, v3

    .line 18
    .line 19
    if-eqz p1, :cond_0

    .line 20
    .line 21
    iput-wide v3, p0, Lrx/internal/operators/OperatorReplay$i;->q:J

    .line 22
    .line 23
    add-long/2addr v0, p3

    .line 24
    invoke-interface {v2, v0, v1}, Ll/vk90;->request(J)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :cond_0
    invoke-interface {v2, p3, p4}, Ll/vk90;->request(J)V

    .line 29
    .line 30
    .line 31
    return-void

    .line 32
    :cond_1
    add-long/2addr v0, p3

    .line 33
    cmp-long p1, v0, v3

    .line 34
    .line 35
    if-gez p1, :cond_2

    .line 36
    .line 37
    const-wide v0, 0x7fffffffffffffffL

    .line 38
    .line 39
    .line 40
    .line 41
    .line 42
    :cond_2
    iput-wide v0, p0, Lrx/internal/operators/OperatorReplay$i;->q:J

    .line 43
    .line 44
    return-void

    .line 45
    :cond_3
    cmp-long p1, v0, v3

    .line 46
    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    if-eqz v2, :cond_4

    .line 50
    .line 51
    iput-wide v3, p0, Lrx/internal/operators/OperatorReplay$i;->q:J

    .line 52
    .line 53
    invoke-interface {v2, v0, v1}, Ll/vk90;->request(J)V

    .line 54
    .line 55
    .line 56
    :cond_4
    return-void
.end method

.method public k(Lrx/internal/operators/OperatorReplay$InnerProducer;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    goto :goto_5

    .line 8
    :cond_0
    monitor-enter p0

    .line 9
    :try_start_0
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->n:Z

    .line 10
    .line 11
    const/4 v1, 0x1

    .line 12
    if-eqz v0, :cond_3

    .line 13
    .line 14
    if-eqz p1, :cond_2

    .line 15
    .line 16
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->s:Ljava/util/List;

    .line 17
    .line 18
    if-nez v0, :cond_1

    .line 19
    .line 20
    new-instance v0, Ljava/util/ArrayList;

    .line 21
    .line 22
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 23
    .line 24
    .line 25
    iput-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->s:Ljava/util/List;

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :catchall_0
    move-exception p1

    .line 29
    goto/16 :goto_9

    .line 30
    .line 31
    :cond_1
    :goto_0
    invoke-interface {v0, p1}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    goto :goto_1

    .line 35
    :cond_2
    iput-boolean v1, p0, Lrx/internal/operators/OperatorReplay$i;->t:Z

    .line 36
    .line 37
    :goto_1
    iput-boolean v1, p0, Lrx/internal/operators/OperatorReplay$i;->o:Z

    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :cond_3
    iput-boolean v1, p0, Lrx/internal/operators/OperatorReplay$i;->n:Z

    .line 42
    .line 43
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    iget-wide v0, p0, Lrx/internal/operators/OperatorReplay$i;->p:J

    .line 45
    .line 46
    const/4 v2, 0x0

    .line 47
    if-eqz p1, :cond_4

    .line 48
    .line 49
    iget-object p1, p1, Lrx/internal/operators/OperatorReplay$InnerProducer;->totalRequested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 50
    .line 51
    invoke-virtual {p1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 52
    .line 53
    .line 54
    move-result-wide v3

    .line 55
    invoke-static {v0, v1, v3, v4}, Ljava/lang/Math;->max(JJ)J

    .line 56
    .line 57
    .line 58
    move-result-wide v3

    .line 59
    goto :goto_3

    .line 60
    :cond_4
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$i;->h()[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    array-length v3, p1

    .line 65
    move-wide v4, v0

    .line 66
    move v6, v2

    .line 67
    :goto_2
    if-ge v6, v3, :cond_6

    .line 68
    .line 69
    aget-object v7, p1, v6

    .line 70
    .line 71
    if-eqz v7, :cond_5

    .line 72
    .line 73
    iget-object v7, v7, Lrx/internal/operators/OperatorReplay$InnerProducer;->totalRequested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 74
    .line 75
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 76
    .line 77
    .line 78
    move-result-wide v7

    .line 79
    invoke-static {v4, v5, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 80
    .line 81
    .line 82
    move-result-wide v4

    .line 83
    :cond_5
    add-int/lit8 v6, v6, 0x1

    .line 84
    .line 85
    goto :goto_2

    .line 86
    :cond_6
    move-wide v3, v4

    .line 87
    :goto_3
    invoke-virtual {p0, v3, v4, v0, v1}, Lrx/internal/operators/OperatorReplay$i;->j(JJ)V

    .line 88
    .line 89
    .line 90
    :goto_4
    invoke-virtual {p0}, Ll/gcg0;->isUnsubscribed()Z

    .line 91
    .line 92
    .line 93
    move-result p1

    .line 94
    if-eqz p1, :cond_7

    .line 95
    .line 96
    :goto_5
    return-void

    .line 97
    :cond_7
    monitor-enter p0

    .line 98
    :try_start_1
    iget-boolean p1, p0, Lrx/internal/operators/OperatorReplay$i;->o:Z

    .line 99
    .line 100
    if-nez p1, :cond_8

    .line 101
    .line 102
    iput-boolean v2, p0, Lrx/internal/operators/OperatorReplay$i;->n:Z

    .line 103
    .line 104
    monitor-exit p0

    .line 105
    return-void

    .line 106
    :catchall_1
    move-exception p1

    .line 107
    goto :goto_8

    .line 108
    :cond_8
    iput-boolean v2, p0, Lrx/internal/operators/OperatorReplay$i;->o:Z

    .line 109
    .line 110
    iget-object p1, p0, Lrx/internal/operators/OperatorReplay$i;->s:Ljava/util/List;

    .line 111
    .line 112
    const/4 v0, 0x0

    .line 113
    iput-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->s:Ljava/util/List;

    .line 114
    .line 115
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->t:Z

    .line 116
    .line 117
    iput-boolean v2, p0, Lrx/internal/operators/OperatorReplay$i;->t:Z

    .line 118
    .line 119
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_1

    .line 120
    iget-wide v3, p0, Lrx/internal/operators/OperatorReplay$i;->p:J

    .line 121
    .line 122
    if-eqz p1, :cond_9

    .line 123
    .line 124
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 125
    .line 126
    .line 127
    move-result-object p1

    .line 128
    move-wide v5, v3

    .line 129
    :goto_6
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 130
    .line 131
    .line 132
    move-result v1

    .line 133
    if-eqz v1, :cond_a

    .line 134
    .line 135
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    check-cast v1, Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 140
    .line 141
    iget-object v1, v1, Lrx/internal/operators/OperatorReplay$InnerProducer;->totalRequested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 142
    .line 143
    invoke-virtual {v1}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 144
    .line 145
    .line 146
    move-result-wide v7

    .line 147
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 148
    .line 149
    .line 150
    move-result-wide v5

    .line 151
    goto :goto_6

    .line 152
    :cond_9
    move-wide v5, v3

    .line 153
    :cond_a
    if-eqz v0, :cond_c

    .line 154
    .line 155
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$i;->h()[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 156
    .line 157
    .line 158
    move-result-object p1

    .line 159
    array-length v0, p1

    .line 160
    move v1, v2

    .line 161
    :goto_7
    if-ge v1, v0, :cond_c

    .line 162
    .line 163
    aget-object v7, p1, v1

    .line 164
    .line 165
    if-eqz v7, :cond_b

    .line 166
    .line 167
    iget-object v7, v7, Lrx/internal/operators/OperatorReplay$InnerProducer;->totalRequested:Ljava/util/concurrent/atomic/AtomicLong;

    .line 168
    .line 169
    invoke-virtual {v7}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 170
    .line 171
    .line 172
    move-result-wide v7

    .line 173
    invoke-static {v5, v6, v7, v8}, Ljava/lang/Math;->max(JJ)J

    .line 174
    .line 175
    .line 176
    move-result-wide v5

    .line 177
    :cond_b
    add-int/lit8 v1, v1, 0x1

    .line 178
    .line 179
    goto :goto_7

    .line 180
    :cond_c
    invoke-virtual {p0, v5, v6, v3, v4}, Lrx/internal/operators/OperatorReplay$i;->j(JJ)V

    .line 181
    .line 182
    .line 183
    goto :goto_4

    .line 184
    :goto_8
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 185
    throw p1

    .line 186
    :goto_9
    :try_start_3
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 187
    throw p1
.end method

.method public l(Lrx/internal/operators/OperatorReplay$InnerProducer;)V
    .locals 5
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lrx/internal/operators/OperatorReplay$InnerProducer<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 7
    .line 8
    monitor-enter v0

    .line 9
    :try_start_0
    iget-boolean v1, p0, Lrx/internal/operators/OperatorReplay$i;->h:Z

    .line 10
    .line 11
    if-eqz v1, :cond_1

    .line 12
    .line 13
    monitor-exit v0

    .line 14
    return-void

    .line 15
    :catchall_0
    move-exception p0

    .line 16
    goto :goto_0

    .line 17
    :cond_1
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 18
    .line 19
    invoke-virtual {v1, p1}, Ll/qx50;->d(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    iget-wide v1, p0, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 23
    .line 24
    const-wide/16 v3, 0x1

    .line 25
    .line 26
    add-long/2addr v1, v3

    .line 27
    iput-wide v1, p0, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 28
    .line 29
    monitor-exit v0

    .line 30
    return-void

    .line 31
    :goto_0
    monitor-exit v0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 32
    throw p0
.end method

.method public m()V
    .locals 6

    .line 1
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->j:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 2
    .line 3
    iget-wide v1, p0, Lrx/internal/operators/OperatorReplay$i;->l:J

    .line 4
    .line 5
    iget-wide v3, p0, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 6
    .line 7
    cmp-long v1, v1, v3

    .line 8
    .line 9
    const/4 v2, 0x0

    .line 10
    if-eqz v1, :cond_1

    .line 11
    .line 12
    iget-object v1, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 13
    .line 14
    monitor-enter v1

    .line 15
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->j:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 16
    .line 17
    iget-object v3, p0, Lrx/internal/operators/OperatorReplay$i;->i:Ll/qx50;

    .line 18
    .line 19
    invoke-virtual {v3}, Ll/qx50;->g()[Ljava/lang/Object;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    array-length v4, v3

    .line 24
    array-length v5, v0

    .line 25
    if-eq v5, v4, :cond_0

    .line 26
    .line 27
    new-array v0, v4, [Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 28
    .line 29
    iput-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->j:[Lrx/internal/operators/OperatorReplay$InnerProducer;

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :catchall_0
    move-exception p0

    .line 33
    goto :goto_1

    .line 34
    :cond_0
    :goto_0
    invoke-static {v3, v2, v0, v2, v4}, Ljava/lang/System;->arraycopy(Ljava/lang/Object;ILjava/lang/Object;II)V

    .line 35
    .line 36
    .line 37
    iget-wide v3, p0, Lrx/internal/operators/OperatorReplay$i;->k:J

    .line 38
    .line 39
    iput-wide v3, p0, Lrx/internal/operators/OperatorReplay$i;->l:J

    .line 40
    .line 41
    monitor-exit v1

    .line 42
    goto :goto_2

    .line 43
    :goto_1
    monitor-exit v1
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 44
    throw p0

    .line 45
    :cond_1
    :goto_2
    iget-object p0, p0, Lrx/internal/operators/OperatorReplay$i;->e:Lrx/internal/operators/OperatorReplay$h;

    .line 46
    .line 47
    array-length v1, v0

    .line 48
    :goto_3
    if-ge v2, v1, :cond_3

    .line 49
    .line 50
    aget-object v3, v0, v2

    .line 51
    .line 52
    if-eqz v3, :cond_2

    .line 53
    .line 54
    invoke-interface {p0, v3}, Lrx/internal/operators/OperatorReplay$h;->replay(Lrx/internal/operators/OperatorReplay$InnerProducer;)V

    .line 55
    .line 56
    .line 57
    :cond_2
    add-int/lit8 v2, v2, 0x1

    .line 58
    .line 59
    goto :goto_3

    .line 60
    :cond_3
    return-void
.end method

.method public onCompleted()V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->g:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->e:Lrx/internal/operators/OperatorReplay$h;

    .line 9
    .line 10
    invoke-interface {v0}, Lrx/internal/operators/OperatorReplay$h;->complete()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$i;->m()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    throw v0

    .line 25
    :cond_0
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    iput-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->g:Z

    .line 7
    .line 8
    :try_start_0
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->e:Lrx/internal/operators/OperatorReplay$h;

    .line 9
    .line 10
    invoke-interface {v0, p1}, Lrx/internal/operators/OperatorReplay$h;->error(Ljava/lang/Throwable;)V

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$i;->m()V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception p1

    .line 21
    invoke-virtual {p0}, Ll/gcg0;->unsubscribe()V

    .line 22
    .line 23
    .line 24
    throw p1

    .line 25
    :cond_0
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Lrx/internal/operators/OperatorReplay$i;->g:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iget-object v0, p0, Lrx/internal/operators/OperatorReplay$i;->e:Lrx/internal/operators/OperatorReplay$h;

    .line 6
    .line 7
    invoke-interface {v0, p1}, Lrx/internal/operators/OperatorReplay$h;->next(Ljava/lang/Object;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Lrx/internal/operators/OperatorReplay$i;->m()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
