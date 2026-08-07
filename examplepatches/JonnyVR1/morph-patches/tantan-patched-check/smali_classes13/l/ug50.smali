.class public Ll/ug50;
.super Ll/oq2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/ug50$c;
    }
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/oq2<",
        "Ll/ug50$c;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Ll/rg50;

.field public b:Ljava/util/concurrent/Executor;

.field public c:Ll/ukm;

.field public volatile d:Z


# direct methods
.method public constructor <init>(Ll/rg50;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/oq2;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/ug50;->a:Ll/rg50;

    .line 5
    .line 6
    invoke-virtual {p1}, Ll/rg50;->m()Ll/o5e;

    .line 7
    .line 8
    .line 9
    move-result-object p1

    .line 10
    invoke-virtual {p1}, Ll/o5e;->c()Ljava/util/concurrent/ExecutorService;

    .line 11
    .line 12
    .line 13
    move-result-object p1

    .line 14
    iput-object p1, p0, Ll/ug50;->b:Ljava/util/concurrent/Executor;

    .line 15
    .line 16
    return-void
.end method

.method public static bridge synthetic f(Ll/ug50;)Ll/ukm;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ug50;->c:Ll/ukm;

    return-object p0
.end method

.method public static bridge synthetic g(Ll/ug50;)Ljava/util/concurrent/Executor;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ug50;->b:Ljava/util/concurrent/Executor;

    return-object p0
.end method


# virtual methods
.method public bridge synthetic a(Ll/vhi;Ll/vj20$a;)V
    .locals 0

    .line 1
    check-cast p1, Ll/ug50$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ug50;->j(Ll/ug50$c;Ll/vj20$a;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c(Ll/vhi;I)Ljava/util/Map;
    .locals 0

    .line 1
    check-cast p1, Ll/ug50$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ug50;->k(Ll/ug50$c;I)Ljava/util/Map;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public bridge synthetic d(Ll/z06;Ll/yk90;)Ll/vhi;
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ug50;->h(Ll/z06;Ll/yk90;)Ll/ug50$c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public bridge synthetic e(Ll/vhi;I)V
    .locals 0

    .line 1
    check-cast p1, Ll/ug50$c;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ug50;->n(Ll/ug50$c;I)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public h(Ll/z06;Ll/yk90;)Ll/ug50$c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/z06<",
            "Ll/n0f;",
            ">;",
            "Ll/yk90;",
            ")",
            "Ll/ug50$c;"
        }
    .end annotation

    .line 1
    new-instance p0, Ll/ug50$c;

    .line 2
    .line 3
    invoke-direct {p0, p1, p2}, Ll/ug50$c;-><init>(Ll/z06;Ll/yk90;)V

    .line 4
    .line 5
    .line 6
    return-object p0
.end method

.method public i(Ll/ug50$c;Ll/vj20$a;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "enqueue fetchState = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[common][image_net]"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-virtual {p0}, Ll/ug50;->l()Ll/rg50;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    iget-object v1, p1, Ll/ug50$c;->k:Ll/x1d0;

    .line 25
    .line 26
    invoke-virtual {v0, v1}, Ll/rg50;->a(Ll/x1d0;)Ll/ry3;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    invoke-virtual {p1}, Ll/vhi;->b()Ll/yk90;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    new-instance v2, Ll/ug50$a;

    .line 35
    .line 36
    invoke-direct {v2, p0, v0}, Ll/ug50$a;-><init>(Ll/ug50;Ll/ry3;)V

    .line 37
    .line 38
    .line 39
    invoke-interface {v1, v2}, Ll/yk90;->q(Ll/zk90;)V

    .line 40
    .line 41
    .line 42
    new-instance v1, Ll/ug50$b;

    .line 43
    .line 44
    invoke-direct {v1, p0, p1, p2}, Ll/ug50$b;-><init>(Ll/ug50;Ll/ug50$c;Ll/vj20$a;)V

    .line 45
    .line 46
    .line 47
    invoke-interface {v0, v1}, Ll/ry3;->h(Ll/w84;)V

    .line 48
    .line 49
    .line 50
    return-void
.end method

.method public j(Ll/ug50$c;Ll/vj20$a;)V
    .locals 3

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "fetch fetchState = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[common][image_net]"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 21
    .line 22
    .line 23
    move-result-wide v0

    .line 24
    iput-wide v0, p1, Ll/ug50$c;->f:J

    .line 25
    .line 26
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    .line 27
    .line 28
    .line 29
    move-result-wide v0

    .line 30
    iput-wide v0, p1, Ll/ug50$c;->j:J

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/vhi;->g()Landroid/net/Uri;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    :try_start_0
    new-instance v1, Ll/x1d0$a;

    .line 37
    .line 38
    invoke-direct {v1}, Ll/x1d0$a;-><init>()V

    .line 39
    .line 40
    .line 41
    new-instance v2, Ll/yx3$a;

    .line 42
    .line 43
    invoke-direct {v2}, Ll/yx3$a;-><init>()V

    .line 44
    .line 45
    .line 46
    invoke-virtual {v2}, Ll/yx3$a;->d()Ll/yx3$a;

    .line 47
    .line 48
    .line 49
    move-result-object v2

    .line 50
    invoke-virtual {v2}, Ll/yx3$a;->a()Ll/yx3;

    .line 51
    .line 52
    .line 53
    move-result-object v2

    .line 54
    invoke-virtual {v1, v2}, Ll/x1d0$a;->c(Ll/yx3;)Ll/x1d0$a;

    .line 55
    .line 56
    .line 57
    move-result-object v1

    .line 58
    invoke-virtual {v0}, Landroid/net/Uri;->toString()Ljava/lang/String;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v1, v0}, Ll/x1d0$a;->q(Ljava/lang/String;)Ll/x1d0$a;

    .line 63
    .line 64
    .line 65
    move-result-object v0

    .line 66
    invoke-virtual {v0}, Ll/x1d0$a;->f()Ll/x1d0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    invoke-virtual {v0}, Ll/x1d0$a;->b()Ll/x1d0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iget-object v1, p0, Ll/ug50;->c:Ll/ukm;

    .line 75
    .line 76
    if-eqz v1, :cond_0

    .line 77
    .line 78
    sget-object v2, Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;->MEDIA:Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;

    .line 79
    .line 80
    invoke-interface {v1, v0, v2}, Ll/ukm;->b(Ll/x1d0;Lcom/tantanapp/common/network/NetworkTrackInfo$ReportType;)Ll/x1d0;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    goto :goto_0

    .line 85
    :catch_0
    move-exception v0

    .line 86
    goto :goto_1

    .line 87
    :cond_0
    :goto_0
    iput-object v0, p1, Ll/ug50$c;->k:Ll/x1d0;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 88
    .line 89
    invoke-virtual {p0, p1, p2}, Ll/ug50;->i(Ll/ug50$c;Ll/vj20$a;)V

    .line 90
    .line 91
    .line 92
    return-void

    .line 93
    :goto_1
    iget-object v1, p0, Ll/ug50;->c:Ll/ukm;

    .line 94
    .line 95
    if-eqz v1, :cond_1

    .line 96
    .line 97
    iget-object v2, p1, Ll/ug50$c;->k:Ll/x1d0;

    .line 98
    .line 99
    invoke-interface {v1, v2, v0}, Ll/ukm;->c(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 100
    .line 101
    .line 102
    iget-object p0, p0, Ll/ug50;->c:Ll/ukm;

    .line 103
    .line 104
    iget-object p1, p1, Ll/ug50$c;->k:Ll/x1d0;

    .line 105
    .line 106
    invoke-interface {p0, p1}, Ll/ukm;->a(Ll/x1d0;)V

    .line 107
    .line 108
    .line 109
    :cond_1
    invoke-interface {p2, v0}, Ll/vj20$a;->onFailure(Ljava/lang/Throwable;)V

    .line 110
    .line 111
    .line 112
    new-instance p0, Ljava/lang/Exception;

    .line 113
    .line 114
    new-instance p1, Ljava/lang/StringBuilder;

    .line 115
    .line 116
    const-string p2, "fetch exception:"

    .line 117
    .line 118
    invoke-direct {p1, p2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 119
    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 122
    .line 123
    .line 124
    move-result-object p2

    .line 125
    invoke-virtual {p1, p2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 126
    .line 127
    .line 128
    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    invoke-direct {p0, p1, v0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 133
    .line 134
    .line 135
    invoke-static {p0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 136
    .line 137
    .line 138
    return-void
.end method

.method public k(Ll/ug50$c;I)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/ug50$c;",
            "I)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance p0, Ljava/util/HashMap;

    .line 2
    .line 3
    const/4 v0, 0x4

    .line 4
    invoke-direct {p0, v0}, Ljava/util/HashMap;-><init>(I)V

    .line 5
    .line 6
    .line 7
    iget-wide v0, p1, Ll/ug50$c;->g:J

    .line 8
    .line 9
    iget-wide v2, p1, Ll/ug50$c;->f:J

    .line 10
    .line 11
    sub-long/2addr v0, v2

    .line 12
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    const-string v1, "queue_time"

    .line 17
    .line 18
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    iget-wide v0, p1, Ll/ug50$c;->h:J

    .line 22
    .line 23
    iget-wide v2, p1, Ll/ug50$c;->g:J

    .line 24
    .line 25
    sub-long/2addr v0, v2

    .line 26
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    const-string v1, "fetch_time"

    .line 31
    .line 32
    invoke-interface {p0, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget-wide v0, p1, Ll/ug50$c;->h:J

    .line 36
    .line 37
    iget-wide v2, p1, Ll/ug50$c;->f:J

    .line 38
    .line 39
    sub-long/2addr v0, v2

    .line 40
    invoke-static {v0, v1}, Ljava/lang/Long;->toString(J)Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    const-string v0, "total_time"

    .line 45
    .line 46
    invoke-interface {p0, v0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 47
    .line 48
    .line 49
    const-string p1, "image_size"

    .line 50
    .line 51
    invoke-static {p2}, Ljava/lang/Integer;->toString(I)Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object p2

    .line 55
    invoke-interface {p0, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 56
    .line 57
    .line 58
    return-object p0
.end method

.method public l()Ll/rg50;
    .locals 2

    .line 1
    iget-boolean v0, p0, Ll/ug50;->d:Z

    .line 2
    .line 3
    if-eqz v0, :cond_1

    .line 4
    .line 5
    monitor-enter p0

    .line 6
    :try_start_0
    iget-boolean v0, p0, Ll/ug50;->d:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    const-string v0, "[common][image_net]"

    .line 11
    .line 12
    const-string v1, "\u5207\u6362\u94fe\u63a5\u6c60"

    .line 13
    .line 14
    invoke-static {v0, v1}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, p0, Ll/ug50;->a:Ll/rg50;

    .line 18
    .line 19
    invoke-virtual {v0}, Ll/rg50;->v()Ll/rg50$b;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    new-instance v1, Ll/lx5;

    .line 24
    .line 25
    invoke-direct {v1}, Ll/lx5;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/rg50$b;->g(Ll/lx5;)Ll/rg50$b;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Ll/rg50$b;->c()Ll/rg50;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    iput-object v0, p0, Ll/ug50;->a:Ll/rg50;

    .line 37
    .line 38
    const/4 v0, 0x0

    .line 39
    iput-boolean v0, p0, Ll/ug50;->d:Z

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :catchall_0
    move-exception v0

    .line 43
    goto :goto_1

    .line 44
    :cond_0
    :goto_0
    iget-object v0, p0, Ll/ug50;->a:Ll/rg50;

    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-object v0

    .line 48
    :goto_1
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 49
    throw v0

    .line 50
    :cond_1
    iget-object p0, p0, Ll/ug50;->a:Ll/rg50;

    .line 51
    .line 52
    return-object p0
.end method

.method public m(Ll/ug50$c;Ll/ry3;Ljava/lang/Exception;Ll/vj20$a;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "handleException fetchState = "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {v0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    const-string v1, "[common][image_net]"

    .line 16
    .line 17
    invoke-static {v1, v0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 18
    .line 19
    .line 20
    iget-object v0, p0, Ll/ug50;->c:Ll/ukm;

    .line 21
    .line 22
    if-eqz v0, :cond_0

    .line 23
    .line 24
    invoke-interface {p2}, Ll/ry3;->request()Ll/x1d0;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    invoke-interface {v0, v1, p3}, Ll/ukm;->c(Ll/x1d0;Ljava/lang/Throwable;)V

    .line 29
    .line 30
    .line 31
    :cond_0
    invoke-interface {p2}, Ll/ry3;->isCanceled()Z

    .line 32
    .line 33
    .line 34
    move-result p2

    .line 35
    if-eqz p2, :cond_1

    .line 36
    .line 37
    invoke-interface {p4}, Ll/vj20$a;->a()V

    .line 38
    .line 39
    .line 40
    return-void

    .line 41
    :cond_1
    iget p2, p1, Ll/ug50$c;->i:I

    .line 42
    .line 43
    const/4 v0, 0x3

    .line 44
    if-ge p2, v0, :cond_2

    .line 45
    .line 46
    invoke-virtual {p0, p1, p4}, Ll/ug50;->i(Ll/ug50$c;Ll/vj20$a;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_2
    invoke-interface {p4, p3}, Ll/vj20$a;->onFailure(Ljava/lang/Throwable;)V

    .line 51
    .line 52
    .line 53
    invoke-static {p3}, Lcom/tantanapp/common/network/NetReporter;->reportError(Ljava/lang/Throwable;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public n(Ll/ug50$c;I)V
    .locals 3

    .line 1
    new-instance p0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v0, "onFetchCompletion fetchState = "

    .line 4
    .line 5
    invoke-direct {p0, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, p1}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    .line 9
    .line 10
    .line 11
    const-string v0, "\uff0cbyteSize="

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {p0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string v0, "[common][image_net]"

    .line 24
    .line 25
    invoke-static {v0, p0}, Ll/tu2;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    .line 29
    .line 30
    .line 31
    move-result-wide v0

    .line 32
    iput-wide v0, p1, Ll/ug50$c;->h:J

    .line 33
    .line 34
    :try_start_0
    iget-wide p0, p1, Ll/ug50$c;->f:J

    .line 35
    .line 36
    sub-long/2addr v0, p0

    .line 37
    new-instance p0, Ljava/math/BigDecimal;

    .line 38
    .line 39
    invoke-direct {p0, v0, v1}, Ljava/math/BigDecimal;-><init>(J)V

    .line 40
    .line 41
    .line 42
    new-instance p1, Ljava/math/BigDecimal;

    .line 43
    .line 44
    invoke-direct {p1, p2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 45
    .line 46
    .line 47
    new-instance p2, Ljava/math/BigDecimal;

    .line 48
    .line 49
    const/16 v2, 0x400

    .line 50
    .line 51
    invoke-direct {p2, v2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 52
    .line 53
    .line 54
    invoke-virtual {p1, p2}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    new-instance p2, Ljava/math/BigDecimal;

    .line 59
    .line 60
    const/16 v2, 0x3e8

    .line 61
    .line 62
    invoke-direct {p2, v2}, Ljava/math/BigDecimal;-><init>(I)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {p0, p2}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;)Ljava/math/BigDecimal;

    .line 66
    .line 67
    .line 68
    move-result-object p0

    .line 69
    sget-object p2, Ljava/math/RoundingMode;->HALF_UP:Ljava/math/RoundingMode;

    .line 70
    .line 71
    const/4 v2, 0x2

    .line 72
    invoke-virtual {p1, p0, v2, p2}, Ljava/math/BigDecimal;->divide(Ljava/math/BigDecimal;ILjava/math/RoundingMode;)Ljava/math/BigDecimal;

    .line 73
    .line 74
    .line 75
    move-result-object p0

    .line 76
    invoke-static {}, Ll/cjm;->a()Lrx/subjects/a;

    .line 77
    .line 78
    .line 79
    move-result-object p2

    .line 80
    invoke-static {p0, p1, v0, v1}, Ll/cjm;->b(Ljava/math/BigDecimal;Ljava/math/BigDecimal;J)Ll/cjm$a;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    invoke-virtual {p2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-static {p0}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 88
    .line 89
    .line 90
    invoke-virtual {p1}, Ljava/math/BigDecimal;->longValue()J
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 91
    .line 92
    .line 93
    return-void

    .line 94
    :catch_0
    move-exception p0

    .line 95
    new-instance p1, Ljava/lang/Exception;

    .line 96
    .line 97
    new-instance p2, Ljava/lang/StringBuilder;

    .line 98
    .line 99
    const-string v0, "ImageNetSpeedException:"

    .line 100
    .line 101
    invoke-direct {p2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 102
    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Throwable;->getMessage()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    invoke-virtual {p2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 109
    .line 110
    .line 111
    invoke-virtual {p2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object p2

    .line 115
    invoke-direct {p1, p2, p0}, Ljava/lang/Exception;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    .line 116
    .line 117
    .line 118
    invoke-static {p1}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 119
    .line 120
    .line 121
    return-void
.end method

.method public o(Ll/ukm;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ug50;->c:Ll/ukm;

    .line 2
    .line 3
    return-void
.end method

.method public p()V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/ug50;->d:Z

    .line 3
    .line 4
    return-void
.end method
