.class public Ll/yqe0;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/bb50;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/yqe0$a;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ljava/lang/Object;",
        ">",
        "Ljava/lang/Object;",
        "Ll/bb50<",
        "TT;>;"
    }
.end annotation


# instance fields
.field public final a:Ll/bb50;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/bb50<",
            "-TT;>;"
        }
    .end annotation
.end field

.field public b:Z

.field public volatile c:Z

.field public d:Ll/yqe0$a;

.field public final e:Lrx/internal/operators/NotificationLite;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/internal/operators/NotificationLite<",
            "TT;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/bb50;)V
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/bb50<",
            "-TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/internal/operators/NotificationLite;->f()Lrx/internal/operators/NotificationLite;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/yqe0;->e:Lrx/internal/operators/NotificationLite;

    .line 9
    .line 10
    iput-object p1, p0, Ll/yqe0;->a:Ll/bb50;

    .line 11
    .line 12
    return-void
.end method


# virtual methods
.method public onCompleted()V
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/yqe0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter p0

    .line 7
    :try_start_0
    iget-boolean v0, p0, Ll/yqe0;->c:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception v0

    .line 14
    goto :goto_0

    .line 15
    :cond_1
    const/4 v0, 0x1

    .line 16
    iput-boolean v0, p0, Ll/yqe0;->c:Z

    .line 17
    .line 18
    iget-boolean v1, p0, Ll/yqe0;->b:Z

    .line 19
    .line 20
    if-eqz v1, :cond_3

    .line 21
    .line 22
    iget-object v0, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 23
    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    new-instance v0, Ll/yqe0$a;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/yqe0$a;-><init>()V

    .line 29
    .line 30
    .line 31
    iput-object v0, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 32
    .line 33
    :cond_2
    iget-object v1, p0, Ll/yqe0;->e:Lrx/internal/operators/NotificationLite;

    .line 34
    .line 35
    invoke-virtual {v1}, Lrx/internal/operators/NotificationLite;->b()Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Ll/yqe0$a;->a(Ljava/lang/Object;)V

    .line 40
    .line 41
    .line 42
    monitor-exit p0

    .line 43
    return-void

    .line 44
    :cond_3
    iput-boolean v0, p0, Ll/yqe0;->b:Z

    .line 45
    .line 46
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 47
    iget-object p0, p0, Ll/yqe0;->a:Ll/bb50;

    .line 48
    .line 49
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 50
    .line 51
    .line 52
    return-void

    .line 53
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw v0
.end method

.method public onError(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    invoke-static {p1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 2
    .line 3
    .line 4
    iget-boolean v0, p0, Ll/yqe0;->c:Z

    .line 5
    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    return-void

    .line 9
    :cond_0
    monitor-enter p0

    .line 10
    :try_start_0
    iget-boolean v0, p0, Ll/yqe0;->c:Z

    .line 11
    .line 12
    if-eqz v0, :cond_1

    .line 13
    .line 14
    monitor-exit p0

    .line 15
    return-void

    .line 16
    :catchall_0
    move-exception p1

    .line 17
    goto :goto_0

    .line 18
    :cond_1
    const/4 v0, 0x1

    .line 19
    iput-boolean v0, p0, Ll/yqe0;->c:Z

    .line 20
    .line 21
    iget-boolean v1, p0, Ll/yqe0;->b:Z

    .line 22
    .line 23
    if-eqz v1, :cond_3

    .line 24
    .line 25
    iget-object v0, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 26
    .line 27
    if-nez v0, :cond_2

    .line 28
    .line 29
    new-instance v0, Ll/yqe0$a;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/yqe0$a;-><init>()V

    .line 32
    .line 33
    .line 34
    iput-object v0, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 35
    .line 36
    :cond_2
    iget-object v1, p0, Ll/yqe0;->e:Lrx/internal/operators/NotificationLite;

    .line 37
    .line 38
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->c(Ljava/lang/Throwable;)Ljava/lang/Object;

    .line 39
    .line 40
    .line 41
    move-result-object p1

    .line 42
    invoke-virtual {v0, p1}, Ll/yqe0$a;->a(Ljava/lang/Object;)V

    .line 43
    .line 44
    .line 45
    monitor-exit p0

    .line 46
    return-void

    .line 47
    :cond_3
    iput-boolean v0, p0, Ll/yqe0;->b:Z

    .line 48
    .line 49
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 50
    iget-object p0, p0, Ll/yqe0;->a:Ll/bb50;

    .line 51
    .line 52
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 53
    .line 54
    .line 55
    return-void

    .line 56
    :goto_0
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 57
    throw p1
.end method

.method public onNext(Ljava/lang/Object;)V
    .locals 7
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(TT;)V"
        }
    .end annotation

    .line 1
    iget-boolean v0, p0, Ll/yqe0;->c:Z

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    monitor-enter p0

    .line 7
    :try_start_0
    iget-boolean v0, p0, Ll/yqe0;->c:Z

    .line 8
    .line 9
    if-eqz v0, :cond_1

    .line 10
    .line 11
    monitor-exit p0

    .line 12
    return-void

    .line 13
    :catchall_0
    move-exception p1

    .line 14
    goto :goto_4

    .line 15
    :cond_1
    iget-boolean v0, p0, Ll/yqe0;->b:Z

    .line 16
    .line 17
    if-eqz v0, :cond_3

    .line 18
    .line 19
    iget-object v0, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 20
    .line 21
    if-nez v0, :cond_2

    .line 22
    .line 23
    new-instance v0, Ll/yqe0$a;

    .line 24
    .line 25
    invoke-direct {v0}, Ll/yqe0$a;-><init>()V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 29
    .line 30
    :cond_2
    iget-object v1, p0, Ll/yqe0;->e:Lrx/internal/operators/NotificationLite;

    .line 31
    .line 32
    invoke-virtual {v1, p1}, Lrx/internal/operators/NotificationLite;->j(Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-virtual {v0, p1}, Ll/yqe0$a;->a(Ljava/lang/Object;)V

    .line 37
    .line 38
    .line 39
    monitor-exit p0

    .line 40
    return-void

    .line 41
    :cond_3
    const/4 v0, 0x1

    .line 42
    iput-boolean v0, p0, Ll/yqe0;->b:Z

    .line 43
    .line 44
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    :try_start_1
    iget-object v1, p0, Ll/yqe0;->a:Ll/bb50;

    .line 46
    .line 47
    invoke-interface {v1, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_3

    .line 48
    .line 49
    .line 50
    :cond_4
    :goto_0
    monitor-enter p0

    .line 51
    :try_start_2
    iget-object v1, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 52
    .line 53
    const/4 v2, 0x0

    .line 54
    if-nez v1, :cond_5

    .line 55
    .line 56
    iput-boolean v2, p0, Ll/yqe0;->b:Z

    .line 57
    .line 58
    monitor-exit p0

    .line 59
    return-void

    .line 60
    :catchall_1
    move-exception p1

    .line 61
    goto :goto_3

    .line 62
    :cond_5
    const/4 v3, 0x0

    .line 63
    iput-object v3, p0, Ll/yqe0;->d:Ll/yqe0$a;

    .line 64
    .line 65
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_1

    .line 66
    iget-object v1, v1, Ll/yqe0$a;->a:[Ljava/lang/Object;

    .line 67
    .line 68
    array-length v3, v1

    .line 69
    :goto_1
    if-ge v2, v3, :cond_4

    .line 70
    .line 71
    aget-object v4, v1, v2

    .line 72
    .line 73
    if-nez v4, :cond_6

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :cond_6
    :try_start_3
    iget-object v5, p0, Ll/yqe0;->e:Lrx/internal/operators/NotificationLite;

    .line 77
    .line 78
    iget-object v6, p0, Ll/yqe0;->a:Ll/bb50;

    .line 79
    .line 80
    invoke-virtual {v5, v6, v4}, Lrx/internal/operators/NotificationLite;->a(Ll/bb50;Ljava/lang/Object;)Z

    .line 81
    .line 82
    .line 83
    move-result v4

    .line 84
    if-eqz v4, :cond_7

    .line 85
    .line 86
    iput-boolean v0, p0, Ll/yqe0;->c:Z
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_2

    .line 87
    .line 88
    return-void

    .line 89
    :catchall_2
    move-exception v1

    .line 90
    goto :goto_2

    .line 91
    :cond_7
    add-int/lit8 v2, v2, 0x1

    .line 92
    .line 93
    goto :goto_1

    .line 94
    :goto_2
    iput-boolean v0, p0, Ll/yqe0;->c:Z

    .line 95
    .line 96
    invoke-static {v1}, Ll/j6f;->e(Ljava/lang/Throwable;)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p0, Ll/yqe0;->a:Ll/bb50;

    .line 100
    .line 101
    invoke-static {v1, p1}, Lrx/exceptions/OnErrorThrowable;->addValueAsLastCause(Ljava/lang/Throwable;Ljava/lang/Object;)Ljava/lang/Throwable;

    .line 102
    .line 103
    .line 104
    move-result-object p1

    .line 105
    invoke-interface {p0, p1}, Ll/bb50;->onError(Ljava/lang/Throwable;)V

    .line 106
    .line 107
    .line 108
    return-void

    .line 109
    :goto_3
    :try_start_4
    monitor-exit p0
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    .line 110
    throw p1

    .line 111
    :catchall_3
    move-exception v1

    .line 112
    iput-boolean v0, p0, Ll/yqe0;->c:Z

    .line 113
    .line 114
    iget-object p0, p0, Ll/yqe0;->a:Ll/bb50;

    .line 115
    .line 116
    invoke-static {v1, p0, p1}, Ll/j6f;->g(Ljava/lang/Throwable;Ll/bb50;Ljava/lang/Object;)V

    .line 117
    .line 118
    .line 119
    return-void

    .line 120
    :goto_4
    :try_start_5
    monitor-exit p0
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_0

    .line 121
    throw p1
.end method
