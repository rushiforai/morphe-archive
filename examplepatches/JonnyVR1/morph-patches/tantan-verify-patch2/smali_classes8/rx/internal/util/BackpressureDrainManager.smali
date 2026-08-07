.class public final Lrx/internal/util/BackpressureDrainManager;
.super Ljava/util/concurrent/atomic/AtomicLong;
.source "SourceFile"

# interfaces
.implements Ll/vk90;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lrx/internal/util/BackpressureDrainManager$a;
    }
.end annotation


# static fields
.field private static final serialVersionUID:J = 0x2738d34f11cd4869L


# instance fields
.field final actual:Lrx/internal/util/BackpressureDrainManager$a;

.field emitting:Z

.field exception:Ljava/lang/Throwable;

.field volatile terminated:Z


# direct methods
.method public constructor <init>(Lrx/internal/util/BackpressureDrainManager$a;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/util/concurrent/atomic/AtomicLong;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Lrx/internal/util/BackpressureDrainManager;->actual:Lrx/internal/util/BackpressureDrainManager$a;

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public drain()V
    .locals 13

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Lrx/internal/util/BackpressureDrainManager;->emitting:Z

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    monitor-exit p0

    .line 7
    return-void

    .line 8
    :catchall_0
    move-exception v0

    .line 9
    goto/16 :goto_9

    .line 10
    .line 11
    :cond_0
    const/4 v0, 0x1

    .line 12
    iput-boolean v0, p0, Lrx/internal/util/BackpressureDrainManager;->emitting:Z

    .line 13
    .line 14
    iget-boolean v1, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 15
    .line 16
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 17
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 18
    .line 19
    .line 20
    move-result-wide v2

    .line 21
    const/4 v4, 0x0

    .line 22
    :try_start_1
    iget-object v5, p0, Lrx/internal/util/BackpressureDrainManager;->actual:Lrx/internal/util/BackpressureDrainManager$a;

    .line 23
    .line 24
    :goto_0
    move v6, v4

    .line 25
    :goto_1
    const-wide/16 v7, 0x0

    .line 26
    .line 27
    cmp-long v9, v2, v7

    .line 28
    .line 29
    if-gtz v9, :cond_1

    .line 30
    .line 31
    if-eqz v1, :cond_4

    .line 32
    .line 33
    :cond_1
    if-eqz v1, :cond_3

    .line 34
    .line 35
    invoke-interface {v5}, Lrx/internal/util/BackpressureDrainManager$a;->peek()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v10
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    .line 39
    if-nez v10, :cond_2

    .line 40
    .line 41
    :try_start_2
    iget-object v1, p0, Lrx/internal/util/BackpressureDrainManager;->exception:Ljava/lang/Throwable;

    .line 42
    .line 43
    invoke-interface {v5, v1}, Lrx/internal/util/BackpressureDrainManager$a;->a(Ljava/lang/Throwable;)V
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :catchall_1
    move-exception v1

    .line 48
    goto/16 :goto_7

    .line 49
    .line 50
    :cond_2
    if-nez v9, :cond_3

    .line 51
    .line 52
    goto :goto_2

    .line 53
    :catchall_2
    move-exception v1

    .line 54
    move v0, v4

    .line 55
    goto :goto_7

    .line 56
    :cond_3
    :try_start_3
    invoke-interface {v5}, Lrx/internal/util/BackpressureDrainManager$a;->poll()Ljava/lang/Object;

    .line 57
    .line 58
    .line 59
    move-result-object v9

    .line 60
    if-nez v9, :cond_b

    .line 61
    .line 62
    :cond_4
    :goto_2
    monitor-enter p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 63
    :try_start_4
    iget-boolean v1, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 64
    .line 65
    invoke-interface {v5}, Lrx/internal/util/BackpressureDrainManager$a;->peek()Ljava/lang/Object;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    if-eqz v2, :cond_5

    .line 70
    .line 71
    move v2, v0

    .line 72
    goto :goto_3

    .line 73
    :cond_5
    move v2, v4

    .line 74
    :goto_3
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 75
    .line 76
    .line 77
    move-result-wide v9
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_4

    .line 78
    const-wide v11, 0x7fffffffffffffffL

    .line 79
    .line 80
    .line 81
    .line 82
    .line 83
    cmp-long v3, v9, v11

    .line 84
    .line 85
    if-nez v3, :cond_7

    .line 86
    .line 87
    if-nez v2, :cond_6

    .line 88
    .line 89
    if-nez v1, :cond_6

    .line 90
    .line 91
    :try_start_5
    iput-boolean v4, p0, Lrx/internal/util/BackpressureDrainManager;->emitting:Z

    .line 92
    .line 93
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_3

    .line 94
    return-void

    .line 95
    :catchall_3
    move-exception v1

    .line 96
    goto :goto_6

    .line 97
    :cond_6
    move-wide v2, v11

    .line 98
    goto :goto_4

    .line 99
    :cond_7
    neg-int v3, v6

    .line 100
    int-to-long v9, v3

    .line 101
    :try_start_6
    invoke-virtual {p0, v9, v10}, Ljava/util/concurrent/atomic/AtomicLong;->addAndGet(J)J

    .line 102
    .line 103
    .line 104
    move-result-wide v9

    .line 105
    cmp-long v3, v9, v7

    .line 106
    .line 107
    if-eqz v3, :cond_8

    .line 108
    .line 109
    if-nez v2, :cond_9

    .line 110
    .line 111
    :cond_8
    if-eqz v1, :cond_a

    .line 112
    .line 113
    if-eqz v2, :cond_9

    .line 114
    .line 115
    goto :goto_5

    .line 116
    :cond_9
    move-wide v2, v9

    .line 117
    :goto_4
    monitor-exit p0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_4

    .line 118
    goto :goto_0

    .line 119
    :catchall_4
    move-exception v1

    .line 120
    move v0, v4

    .line 121
    goto :goto_6

    .line 122
    :cond_a
    :goto_5
    :try_start_7
    iput-boolean v4, p0, Lrx/internal/util/BackpressureDrainManager;->emitting:Z

    .line 123
    .line 124
    monitor-exit p0

    .line 125
    return-void

    .line 126
    :goto_6
    monitor-exit p0
    :try_end_7
    .catchall {:try_start_7 .. :try_end_7} :catchall_3

    .line 127
    :try_start_8
    throw v1
    :try_end_8
    .catchall {:try_start_8 .. :try_end_8} :catchall_1

    .line 128
    :cond_b
    :try_start_9
    invoke-interface {v5, v9}, Lrx/internal/util/BackpressureDrainManager$a;->accept(Ljava/lang/Object;)Z

    .line 129
    .line 130
    .line 131
    move-result v7
    :try_end_9
    .catchall {:try_start_9 .. :try_end_9} :catchall_2

    .line 132
    if-eqz v7, :cond_c

    .line 133
    .line 134
    return-void

    .line 135
    :cond_c
    const-wide/16 v7, 0x1

    .line 136
    .line 137
    sub-long/2addr v2, v7

    .line 138
    add-int/lit8 v6, v6, 0x1

    .line 139
    .line 140
    goto :goto_1

    .line 141
    :goto_7
    if-nez v0, :cond_d

    .line 142
    .line 143
    monitor-enter p0

    .line 144
    :try_start_a
    iput-boolean v4, p0, Lrx/internal/util/BackpressureDrainManager;->emitting:Z

    .line 145
    .line 146
    monitor-exit p0

    .line 147
    goto :goto_8

    .line 148
    :catchall_5
    move-exception v0

    .line 149
    monitor-exit p0
    :try_end_a
    .catchall {:try_start_a .. :try_end_a} :catchall_5

    .line 150
    throw v0

    .line 151
    :cond_d
    :goto_8
    throw v1

    .line 152
    :goto_9
    :try_start_b
    monitor-exit p0
    :try_end_b
    .catchall {:try_start_b .. :try_end_b} :catchall_0

    .line 153
    throw v0
.end method

.method public isTerminated()Z
    .locals 0

    .line 1
    iget-boolean p0, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 2
    .line 3
    return p0
.end method

.method public request(J)V
    .locals 10

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    cmp-long v2, p1, v0

    .line 4
    .line 5
    if-nez v2, :cond_0

    .line 6
    .line 7
    goto :goto_4

    .line 8
    :cond_0
    invoke-virtual {p0}, Ljava/util/concurrent/atomic/AtomicLong;->get()J

    .line 9
    .line 10
    .line 11
    move-result-wide v2

    .line 12
    cmp-long v4, v2, v0

    .line 13
    .line 14
    const/4 v5, 0x1

    .line 15
    if-nez v4, :cond_1

    .line 16
    .line 17
    move v4, v5

    .line 18
    goto :goto_0

    .line 19
    :cond_1
    const/4 v4, 0x0

    .line 20
    :goto_0
    const-wide v6, 0x7fffffffffffffffL

    .line 21
    .line 22
    .line 23
    .line 24
    .line 25
    cmp-long v8, v2, v6

    .line 26
    .line 27
    if-nez v8, :cond_2

    .line 28
    .line 29
    goto :goto_3

    .line 30
    :cond_2
    cmp-long v8, p1, v6

    .line 31
    .line 32
    if-nez v8, :cond_3

    .line 33
    .line 34
    move-wide v6, p1

    .line 35
    goto :goto_2

    .line 36
    :cond_3
    sub-long v8, v6, p1

    .line 37
    .line 38
    cmp-long v5, v2, v8

    .line 39
    .line 40
    if-lez v5, :cond_4

    .line 41
    .line 42
    :goto_1
    move v5, v4

    .line 43
    goto :goto_2

    .line 44
    :cond_4
    add-long v6, v2, p1

    .line 45
    .line 46
    goto :goto_1

    .line 47
    :goto_2
    invoke-virtual {p0, v2, v3, v6, v7}, Ljava/util/concurrent/atomic/AtomicLong;->compareAndSet(JJ)Z

    .line 48
    .line 49
    .line 50
    move-result v2

    .line 51
    if-eqz v2, :cond_0

    .line 52
    .line 53
    move v4, v5

    .line 54
    :goto_3
    if-eqz v4, :cond_5

    .line 55
    .line 56
    invoke-virtual {p0}, Lrx/internal/util/BackpressureDrainManager;->drain()V

    .line 57
    .line 58
    .line 59
    :cond_5
    :goto_4
    return-void
.end method

.method public terminate()V
    .locals 1

    const/4 v0, 0x1

    .line 11
    iput-boolean v0, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    return-void
.end method

.method public terminate(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lrx/internal/util/BackpressureDrainManager;->exception:Ljava/lang/Throwable;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 9
    .line 10
    :cond_0
    return-void
.end method

.method public terminateAndDrain()V
    .locals 1

    const/4 v0, 0x1

    .line 14
    iput-boolean v0, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 15
    invoke-virtual {p0}, Lrx/internal/util/BackpressureDrainManager;->drain()V

    return-void
.end method

.method public terminateAndDrain(Ljava/lang/Throwable;)V
    .locals 1

    .line 1
    iget-boolean v0, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    iput-object p1, p0, Lrx/internal/util/BackpressureDrainManager;->exception:Ljava/lang/Throwable;

    .line 6
    .line 7
    const/4 p1, 0x1

    .line 8
    iput-boolean p1, p0, Lrx/internal/util/BackpressureDrainManager;->terminated:Z

    .line 9
    .line 10
    invoke-virtual {p0}, Lrx/internal/util/BackpressureDrainManager;->drain()V

    .line 11
    .line 12
    .line 13
    :cond_0
    return-void
.end method
