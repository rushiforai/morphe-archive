.class public final Ll/rc2;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static a(JJ)J
    .locals 0

    .line 1
    add-long/2addr p0, p2

    .line 2
    const-wide/16 p2, 0x0

    .line 3
    .line 4
    cmp-long p2, p0, p2

    .line 5
    .line 6
    if-gez p2, :cond_0

    .line 7
    .line 8
    const-wide p0, 0x7fffffffffffffffL

    .line 9
    .line 10
    .line 11
    .line 12
    .line 13
    :cond_0
    return-wide p0
.end method

.method public static b(Ljava/util/concurrent/atomic/AtomicLong;J)J
    .locals 4

    .line 1
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    invoke-static {v0, v1, p1, p2}, Ll/rc2;->a(JJ)J

    .line 6
    .line 7
    .line 8
    move-result-wide v2

    .line 9
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    return-wide v0
.end method

.method public static c(JJ)J
    .locals 6

    .line 1
    mul-long v0, p0, p2

    .line 2
    .line 3
    or-long v2, p0, p2

    .line 4
    .line 5
    const/16 v4, 0x1f

    .line 6
    .line 7
    ushr-long/2addr v2, v4

    .line 8
    const-wide/16 v4, 0x0

    .line 9
    .line 10
    cmp-long v2, v2, v4

    .line 11
    .line 12
    if-eqz v2, :cond_0

    .line 13
    .line 14
    cmp-long v2, p2, v4

    .line 15
    .line 16
    if-eqz v2, :cond_0

    .line 17
    .line 18
    div-long p2, v0, p2

    .line 19
    .line 20
    cmp-long p0, p2, p0

    .line 21
    .line 22
    if-eqz p0, :cond_0

    .line 23
    .line 24
    const-wide p0, 0x7fffffffffffffffL

    .line 25
    .line 26
    .line 27
    .line 28
    .line 29
    return-wide p0

    .line 30
    :cond_0
    return-wide v0
.end method

.method public static d(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Ljava/util/Queue<",
            "TT;>;",
            "Ll/gcg0<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-static {p0, p1, p2, v0}, Ll/rc2;->e(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;Ll/qcj;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static e(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;Ll/qcj;)V
    .locals 8
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Ljava/util/Queue<",
            "TT;>;",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/qcj<",
            "-TT;+TR;>;)V"
        }
    .end annotation

    .line 1
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide/high16 v2, -0x8000000000000000L

    .line 6
    .line 7
    and-long v4, v0, v2

    .line 8
    .line 9
    const-wide/16 v6, 0x0

    .line 10
    .line 11
    cmp-long v4, v4, v6

    .line 12
    .line 13
    if-eqz v4, :cond_1

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_1
    or-long/2addr v2, v0

    .line 17
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    cmp-long v0, v0, v6

    .line 24
    .line 25
    if-eqz v0, :cond_2

    .line 26
    .line 27
    invoke-static {p0, p1, p2, p3}, Ll/rc2;->f(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;Ll/qcj;)V

    .line 28
    .line 29
    .line 30
    :cond_2
    :goto_0
    return-void
.end method

.method public static f(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;Ll/qcj;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "Ljava/util/Queue<",
            "TT;>;",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/qcj<",
            "-TT;+TR;>;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long v4, v0, v2

    .line 11
    .line 12
    if-nez v4, :cond_2

    .line 13
    .line 14
    :goto_0
    invoke-virtual {p2}, Ll/gcg0;->isUnsubscribed()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    if-eqz p0, :cond_0

    .line 19
    .line 20
    goto :goto_2

    .line 21
    :cond_0
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    if-nez p0, :cond_1

    .line 26
    .line 27
    invoke-interface {p2}, Ll/bb50;->onCompleted()V

    .line 28
    .line 29
    .line 30
    return-void

    .line 31
    :cond_1
    invoke-interface {p3, p0}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-interface {p2, p0}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    goto :goto_0

    .line 39
    :cond_2
    const-wide/high16 v4, -0x8000000000000000L

    .line 40
    .line 41
    :cond_3
    move-wide v6, v4

    .line 42
    :cond_4
    :goto_1
    cmp-long v8, v6, v0

    .line 43
    .line 44
    if-eqz v8, :cond_7

    .line 45
    .line 46
    invoke-virtual {p2}, Ll/gcg0;->isUnsubscribed()Z

    .line 47
    .line 48
    .line 49
    move-result v8

    .line 50
    if-eqz v8, :cond_5

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :cond_5
    invoke-interface {p1}, Ljava/util/Queue;->poll()Ljava/lang/Object;

    .line 54
    .line 55
    .line 56
    move-result-object v8

    .line 57
    if-nez v8, :cond_6

    .line 58
    .line 59
    invoke-interface {p2}, Ll/bb50;->onCompleted()V

    .line 60
    .line 61
    .line 62
    return-void

    .line 63
    :cond_6
    invoke-interface {p3, v8}, Ll/qcj;->call(Ljava/lang/Object;)Ljava/lang/Object;

    .line 64
    .line 65
    .line 66
    move-result-object v8

    .line 67
    invoke-interface {p2, v8}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 68
    .line 69
    .line 70
    const-wide/16 v8, 0x1

    .line 71
    .line 72
    add-long/2addr v6, v8

    .line 73
    goto :goto_1

    .line 74
    :cond_7
    if-nez v8, :cond_9

    .line 75
    .line 76
    invoke-virtual {p2}, Ll/gcg0;->isUnsubscribed()Z

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    if-eqz v0, :cond_8

    .line 81
    .line 82
    goto :goto_2

    .line 83
    :cond_8
    invoke-interface {p1}, Ljava/util/Collection;->isEmpty()Z

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    if-eqz v0, :cond_9

    .line 88
    .line 89
    invoke-interface {p2}, Ll/bb50;->onCompleted()V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :cond_9
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 94
    .line 95
    .line 96
    move-result-wide v0

    .line 97
    cmp-long v8, v0, v6

    .line 98
    .line 99
    if-nez v8, :cond_4

    .line 100
    .line 101
    and-long v0, v6, v2

    .line 102
    .line 103
    neg-long v0, v0

    .line 104
    invoke-virtual {p0, v0, v1}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 105
    .line 106
    .line 107
    move-result-wide v0

    .line 108
    cmp-long v6, v0, v4

    .line 109
    .line 110
    if-nez v6, :cond_3

    .line 111
    .line 112
    :goto_2
    return-void
.end method

.method public static g(Ljava/util/concurrent/atomic/AtomicLong;JLjava/util/Queue;Ll/gcg0;)Z
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "J",
            "Ljava/util/Queue<",
            "TT;>;",
            "Ll/gcg0<",
            "-TT;>;)Z"
        }
    .end annotation

    .line 1
    invoke-static {}, Lrx/internal/util/UtilityFunctions;->b()Ll/qcj;

    .line 2
    .line 3
    .line 4
    move-result-object v5

    .line 5
    move-object v0, p0

    .line 6
    move-wide v1, p1

    .line 7
    move-object v3, p3

    .line 8
    move-object v4, p4

    .line 9
    invoke-static/range {v0 .. v5}, Ll/rc2;->h(Ljava/util/concurrent/atomic/AtomicLong;JLjava/util/Queue;Ll/gcg0;Ll/qcj;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static h(Ljava/util/concurrent/atomic/AtomicLong;JLjava/util/Queue;Ll/gcg0;Ll/qcj;)Z
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "<T:",
            "Ljava/lang/Object;",
            "R:",
            "Ljava/lang/Object;",
            ">(",
            "Ljava/util/concurrent/atomic/AtomicLong;",
            "J",
            "Ljava/util/Queue<",
            "TT;>;",
            "Ll/gcg0<",
            "-TR;>;",
            "Ll/qcj<",
            "-TT;+TR;>;)Z"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-wide/from16 v1, p1

    .line 4
    .line 5
    const-wide/16 v3, 0x0

    .line 6
    .line 7
    cmp-long v5, v1, v3

    .line 8
    .line 9
    const/4 v6, 0x0

    .line 10
    if-ltz v5, :cond_5

    .line 11
    .line 12
    const/4 v7, 0x1

    .line 13
    const-wide/high16 v8, -0x8000000000000000L

    .line 14
    .line 15
    if-nez v5, :cond_1

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 18
    .line 19
    .line 20
    move-result-wide v0

    .line 21
    and-long/2addr v0, v8

    .line 22
    cmp-long v0, v0, v3

    .line 23
    .line 24
    if-nez v0, :cond_0

    .line 25
    .line 26
    return v7

    .line 27
    :cond_0
    return v6

    .line 28
    :cond_1
    :goto_0
    invoke-virtual {v0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 29
    .line 30
    .line 31
    move-result-wide v10

    .line 32
    and-long v12, v10, v8

    .line 33
    .line 34
    const-wide v14, 0x7fffffffffffffffL

    .line 35
    .line 36
    .line 37
    .line 38
    .line 39
    and-long/2addr v14, v10

    .line 40
    invoke-static {v14, v15, v1, v2}, Ll/rc2;->a(JJ)J

    .line 41
    .line 42
    .line 43
    move-result-wide v14

    .line 44
    or-long/2addr v14, v12

    .line 45
    invoke-virtual {v0, v10, v11, v14, v15}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 46
    .line 47
    .line 48
    move-result v5

    .line 49
    if-eqz v5, :cond_4

    .line 50
    .line 51
    cmp-long v1, v10, v8

    .line 52
    .line 53
    if-nez v1, :cond_2

    .line 54
    .line 55
    move-object/from16 v5, p3

    .line 56
    .line 57
    move-object/from16 v10, p4

    .line 58
    .line 59
    move-object/from16 v11, p5

    .line 60
    .line 61
    invoke-static {v0, v5, v10, v11}, Ll/rc2;->f(Ljava/util/concurrent/atomic/AtomicLong;Ljava/util/Queue;Ll/gcg0;Ll/qcj;)V

    .line 62
    .line 63
    .line 64
    return v6

    .line 65
    :cond_2
    cmp-long v0, v12, v3

    .line 66
    .line 67
    if-nez v0, :cond_3

    .line 68
    .line 69
    return v7

    .line 70
    :cond_3
    return v6

    .line 71
    :cond_4
    move-object/from16 v5, p3

    .line 72
    .line 73
    move-object/from16 v10, p4

    .line 74
    .line 75
    move-object/from16 v11, p5

    .line 76
    .line 77
    goto :goto_0

    .line 78
    :cond_5
    const-string v0, "n >= 0 required but it was "

    .line 79
    .line 80
    invoke-static {v0, v1, v2}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 81
    .line 82
    .line 83
    return v6
.end method

.method public static i(Ljava/util/concurrent/atomic/AtomicLong;J)J
    .locals 7

    .line 1
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 2
    .line 3
    .line 4
    move-result-wide v0

    .line 5
    const-wide v2, 0x7fffffffffffffffL

    .line 6
    .line 7
    .line 8
    .line 9
    .line 10
    cmp-long v4, v0, v2

    .line 11
    .line 12
    if-nez v4, :cond_1

    .line 13
    .line 14
    return-wide v2

    .line 15
    :cond_1
    sub-long v2, v0, p1

    .line 16
    .line 17
    const-wide/16 v4, 0x0

    .line 18
    .line 19
    cmp-long v6, v2, v4

    .line 20
    .line 21
    if-ltz v6, :cond_2

    .line 22
    .line 23
    invoke-virtual {p0, v0, v1, v2, v3}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    if-eqz v0, :cond_0

    .line 28
    .line 29
    return-wide v2

    .line 30
    :cond_2
    const-string p0, "More produced than requested: "

    .line 31
    .line 32
    invoke-static {p0, v2, v3}, Ll/qc2;->a(Ljava/lang/String;J)V

    .line 33
    .line 34
    .line 35
    return-wide v4
.end method

.method public static j(J)Z
    .locals 2

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v0, p0, v0

    .line 4
    .line 5
    if-ltz v0, :cond_1

    .line 6
    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    return p0

    .line 13
    :cond_1
    const-string v0, "n >= 0 required but it was "

    .line 14
    .line 15
    invoke-static {v0, p0, p1}, Ll/fcg0;->a(Ljava/lang/String;J)V

    .line 16
    .line 17
    .line 18
    const/4 p0, 0x0

    .line 19
    return p0
.end method
