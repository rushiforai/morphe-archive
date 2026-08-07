.class public final Ll/r360$b;
.super Ll/gcg0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Ll/r360;
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
            "-TT;+TR;>;"
        }
    .end annotation
.end field

.field public final g:Ll/qcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+TR;>;"
        }
    .end annotation
.end field

.field public final h:Ll/pcj;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/pcj<",
            "+TR;>;"
        }
    .end annotation
.end field

.field public final i:Ljava/util/concurrent/atomic/AtomicLong;

.field public final j:Ljava/util/concurrent/atomic/AtomicLong;

.field public final k:Ljava/util/concurrent/atomic/AtomicReference;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/concurrent/atomic/AtomicReference<",
            "Ll/vk90;",
            ">;"
        }
    .end annotation
.end field

.field public l:J

.field public m:Ljava/lang/Object;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "TR;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/gcg0;Ll/qcj;Ll/qcj;Ll/pcj;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/qcj<",
            "-TT;+TR;>;",
            "Ll/qcj<",
            "-",
            "Ljava/lang/Throwable;",
            "+TR;>;",
            "Ll/pcj<",
            "+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ll/gcg0;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 5
    .line 6
    iput-object p2, p0, Ll/r360$b;->f:Ll/qcj;

    .line 7
    .line 8
    iput-object p3, p0, Ll/r360$b;->g:Ll/qcj;

    .line 9
    .line 10
    iput-object p4, p0, Ll/r360$b;->h:Ll/pcj;

    .line 11
    .line 12
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 13
    .line 14
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 15
    .line 16
    .line 17
    iput-object p1, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 18
    .line 19
    new-instance p1, Ljava/util/concurrent/atomic/AtomicLong;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/r360$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 25
    .line 26
    new-instance p1, Ljava/util/concurrent/atomic/AtomicReference;

    .line 27
    .line 28
    invoke-direct {p1}, Ljava/util/concurrent/atomic/AtomicReference;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/r360$b;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 32
    .line 33
    return-void
.end method


# virtual methods
.method public f(Ll/vk90;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/r360$b;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-static {v0, v1, p1}, Ll/m31;->a(Ljava/util/concurrent/atomic/AtomicReference;Ljava/lang/Object;Ljava/lang/Object;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    iget-object p0, p0, Ll/r360$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 11
    .line 12
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    .line 15
    .line 16
    .line 17
    move-result-wide v2

    .line 18
    cmp-long p0, v2, v0

    .line 19
    .line 20
    if-eqz p0, :cond_0

    .line 21
    .line 22
    invoke-interface {p1, v2, v3}, Ll/vk90;->request(J)V

    .line 23
    .line 24
    .line 25
    :cond_0
    return-void

    .line 26
    :cond_1
    const-string p0, "Producer already set!"

    .line 27
    .line 28
    invoke-static {p0}, Ll/wtq0;->a(Ljava/lang/String;)V

    .line 29
    .line 30
    .line 31
    return-void
.end method

.method public g()V
    .locals 4

    .line 1
    iget-wide v0, p0, Ll/r360$b;->l:J

    .line 2
    .line 3
    const-wide/16 v2, 0x0

    .line 4
    .line 5
    cmp-long v2, v0, v2

    .line 6
    .line 7
    if-eqz v2, :cond_0

    .line 8
    .line 9
    iget-object v2, p0, Ll/r360$b;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 10
    .line 11
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v2

    .line 15
    if-eqz v2, :cond_0

    .line 16
    .line 17
    iget-object p0, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 18
    .line 19
    invoke-static {p0, v0, v1}, Ll/rc2;->i(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 20
    .line 21
    .line 22
    :cond_0
    return-void
.end method

.method public h(J)V
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-ltz v2, :cond_5

    .line 6
    .line 7
    if-nez v2, :cond_0

    .line 8
    .line 9
    goto/16 :goto_0

    .line 10
    .line 11
    :cond_0
    iget-object v2, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 12
    .line 13
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 14
    .line 15
    .line 16
    move-result-wide v2

    .line 17
    const-wide/high16 v4, -0x8000000000000000L

    .line 18
    .line 19
    and-long v6, v2, v4

    .line 20
    .line 21
    cmp-long v6, v6, v0

    .line 22
    .line 23
    if-eqz v6, :cond_2

    .line 24
    .line 25
    const-wide v6, 0x7fffffffffffffffL

    .line 26
    .line 27
    .line 28
    .line 29
    .line 30
    and-long/2addr v6, v2

    .line 31
    invoke-static {v6, v7, p1, p2}, Ll/rc2;->a(JJ)J

    .line 32
    .line 33
    .line 34
    move-result-wide v8

    .line 35
    or-long/2addr v4, v8

    .line 36
    iget-object v8, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 37
    .line 38
    invoke-virtual {v8, v2, v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 39
    .line 40
    .line 41
    move-result v2

    .line 42
    if-eqz v2, :cond_0

    .line 43
    .line 44
    cmp-long p1, v6, v0

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    iget-object p1, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 49
    .line 50
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 51
    .line 52
    .line 53
    move-result p1

    .line 54
    if-nez p1, :cond_1

    .line 55
    .line 56
    iget-object p1, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 57
    .line 58
    iget-object p2, p0, Ll/r360$b;->m:Ljava/lang/Object;

    .line 59
    .line 60
    invoke-interface {p1, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 61
    .line 62
    .line 63
    :cond_1
    iget-object p1, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 64
    .line 65
    invoke-virtual {p1}, Ll/gcg0;->isUnsubscribed()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_4

    .line 70
    .line 71
    iget-object p0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 72
    .line 73
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 74
    .line 75
    .line 76
    return-void

    .line 77
    :cond_2
    invoke-static {v2, v3, p1, p2}, Ll/rc2;->a(JJ)J

    .line 78
    .line 79
    .line 80
    move-result-wide v4

    .line 81
    iget-object v6, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 82
    .line 83
    invoke-virtual {v6, v2, v3, v4, v5}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 84
    .line 85
    .line 86
    move-result v2

    .line 87
    if-eqz v2, :cond_0

    .line 88
    .line 89
    iget-object v2, p0, Ll/r360$b;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 90
    .line 91
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 92
    .line 93
    .line 94
    move-result-object v3

    .line 95
    check-cast v3, Ll/vk90;

    .line 96
    .line 97
    if-eqz v3, :cond_3

    .line 98
    .line 99
    invoke-interface {v3, p1, p2}, Ll/vk90;->request(J)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_3
    iget-object v3, p0, Ll/r360$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 104
    .line 105
    invoke-static {v3, p1, p2}, Ll/rc2;->b(Ljava/util/concurrent/atomic/AtomicLong;J)J

    .line 106
    .line 107
    .line 108
    invoke-virtual {v2}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    check-cast p1, Ll/vk90;

    .line 113
    .line 114
    if-eqz p1, :cond_4

    .line 115
    .line 116
    iget-object p0, p0, Ll/r360$b;->j:Ljava/util/concurrent/atomic/AtomicLong;

    .line 117
    .line 118
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->getAndSet(J)J

    .line 119
    .line 120
    .line 121
    move-result-wide v2

    .line 122
    cmp-long p0, v2, v0

    .line 123
    .line 124
    if-eqz p0, :cond_4

    .line 125
    .line 126
    invoke-interface {p1, v2, v3}, Ll/vk90;->request(J)V

    .line 127
    .line 128
    .line 129
    :cond_4
    :goto_0
    return-void

    .line 130
    :cond_5
    const-string p0, "n >= 0 required but it was "

    .line 131
    .line 132
    invoke-static {p0, p1, p2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 133
    .line 134
    .line 135
    return-void
.end method

.method public i()V
    .locals 8

    .line 1
    :cond_0
    iget-object v0, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 2
    .line 3
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 4
    .line 5
    .line 6
    move-result-wide v0

    .line 7
    const-wide/high16 v2, -0x8000000000000000L

    .line 8
    .line 9
    and-long v4, v0, v2

    .line 10
    .line 11
    const-wide/16 v6, 0x0

    .line 12
    .line 13
    cmp-long v4, v4, v6

    .line 14
    .line 15
    if-eqz v4, :cond_1

    .line 16
    .line 17
    goto :goto_0

    .line 18
    :cond_1
    iget-object v4, p0, Ll/r360$b;->i:Ljava/util/concurrent/atomic/AtomicLong;

    .line 19
    .line 20
    or-long/2addr v2, v0

    .line 21
    invoke-virtual {v4, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 22
    .line 23
    .line 24
    move-result v2

    .line 25
    if-eqz v2, :cond_0

    .line 26
    .line 27
    cmp-long v0, v0, v6

    .line 28
    .line 29
    if-nez v0, :cond_2

    .line 30
    .line 31
    iget-object v0, p0, Ll/r360$b;->k:Ljava/util/concurrent/atomic/AtomicReference;

    .line 32
    .line 33
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicReference;->get()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    if-nez v0, :cond_4

    .line 38
    .line 39
    :cond_2
    iget-object v0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    if-nez v0, :cond_3

    .line 46
    .line 47
    iget-object v0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 48
    .line 49
    iget-object v1, p0, Ll/r360$b;->m:Ljava/lang/Object;

    .line 50
    .line 51
    invoke-interface {v0, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 52
    .line 53
    .line 54
    :cond_3
    iget-object v0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 55
    .line 56
    invoke-virtual {v0}, Ll/gcg0;->isUnsubscribed()Z

    .line 57
    .line 58
    .line 59
    move-result v0

    .line 60
    if-nez v0, :cond_4

    .line 61
    .line 62
    iget-object p0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 63
    .line 64
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 65
    .line 66
    .line 67
    :cond_4
    :goto_0
    return-void
.end method

.method public onCompleted()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/r360$b;->g()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/r360$b;->h:Ll/pcj;

    .line 5
    .line 6
    invoke-interface {v0}, Ll/pcj;->call()Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/r360$b;->m:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    iget-object v1, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 15
    .line 16
    invoke-static {v0, v1}, Ll/j6f;->f(Ljava/lang/Throwable;Ll/bb50;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0}, Ll/r360$b;->i()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/r360$b;->g()V

    .line 2
    .line 3
    .line 4
    :try_start_0
    iget-object v0, p0, Ll/r360$b;->g:Ll/qcj;

    .line 5
    .line 6
    invoke-interface {v0, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    iput-object v0, p0, Ll/r360$b;->m:Ljava/lang/Object;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    .line 12
    goto :goto_0

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    iget-object v1, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 15
    .line 16
    invoke-static {v0, v1, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    :goto_0
    invoke-virtual {p0}, Ll/r360$b;->i()V

    .line 20
    .line 21
    .line 22
    return-void
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    :try_start_0
    iget-wide v0, p0, Ll/r360$b;->l:J

    .line 2
    .line 3
    const-wide/16 v2, 0x1

    .line 4
    .line 5
    add-long/2addr v0, v2

    .line 6
    iput-wide v0, p0, Ll/r360$b;->l:J

    .line 7
    .line 8
    iget-object v0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/r360$b;->f:Ll/qcj;

    .line 11
    .line 12
    invoke-interface {v1, p1}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 13
    .line 14
    .line 15
    move-result-object v1

    .line 16
    invoke-interface {v0, v1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    iget-object p0, p0, Ll/r360$b;->e:Ll/gcg0;

    .line 22
    .line 23
    invoke-static {v0, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 24
    .line 25
    .line 26
    return-void
.end method
