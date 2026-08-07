.class public abstract Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;
.super Ll/rme0;
.source "SourceFile"


# instance fields
.field public volatile e:Ll/yc60;

.field public f:J


# direct methods
.method public constructor <init>(Ljava/lang/Object;J)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/rme0;-><init>(Ljava/lang/Object;)V

    .line 2
    .line 3
    .line 4
    iput-wide p2, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->f:J

    .line 5
    .line 6
    return-void
.end method


# virtual methods
.method public e()V
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    new-instance v2, Ljava/util/ArrayList;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/smc0;->j()Ljava/util/List;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-direct {v2, v0}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 13
    .line 14
    invoke-virtual {v0}, Ll/smc0;->b()Ll/a10;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 19
    .line 20
    .line 21
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 22
    .line 23
    invoke-virtual {v0}, Ll/smc0;->k()Ll/t0q;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    invoke-interface {v2, v0}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    new-instance v0, Ll/umc0;

    .line 31
    .line 32
    invoke-direct {v0}, Ll/umc0;-><init>()V

    .line 33
    .line 34
    .line 35
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 36
    .line 37
    const/4 v3, 0x0

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 39
    .line 40
    .line 41
    move-result-object v4

    .line 42
    move-object v5, p0

    .line 43
    invoke-virtual/range {v0 .. v5}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 44
    .line 45
    .line 46
    move-result-object p0

    .line 47
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 48
    .line 49
    .line 50
    move-result-object v0

    .line 51
    invoke-interface {p0, v0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 52
    .line 53
    .line 54
    return-void
.end method

.method public h()Ll/yc60;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->e:Ll/yc60;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    iget-wide v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->f:J

    .line 7
    .line 8
    invoke-virtual {p0, v0, v1}, Ljava/lang/Object;->wait(J)V

    .line 9
    .line 10
    .line 11
    goto :goto_0

    .line 12
    :catchall_0
    move-exception v0

    .line 13
    goto :goto_1

    .line 14
    :cond_0
    :goto_0
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->e:Ll/yc60;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    iget-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->e:Ll/yc60;
    :try_end_0
    .catch Ljava/lang/InterruptedException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 19
    .line 20
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 21
    return-object v0

    .line 22
    :cond_1
    :try_start_2
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall$TimeoutException;

    .line 23
    .line 24
    const-string v1, "get ack fail"

    .line 25
    .line 26
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall$TimeoutException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw v0
    :try_end_2
    .catch Ljava/lang/InterruptedException; {:try_start_2 .. :try_end_2} :catch_0
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 30
    :catch_0
    :try_start_3
    new-instance v0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall$TimeoutException;

    .line 31
    .line 32
    const-string v1, "get ack time out"

    .line 33
    .line 34
    invoke-direct {v0, v1}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall$TimeoutException;-><init>(Ljava/lang/String;)V

    .line 35
    .line 36
    .line 37
    throw v0

    .line 38
    :goto_1
    monitor-exit p0
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    .line 39
    throw v0
.end method

.method public i(Ll/yc60;)V
    .locals 0

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/a;->e:Ll/yc60;

    .line 3
    .line 4
    invoke-virtual {p0}, Ljava/lang/Object;->notifyAll()V

    .line 5
    .line 6
    .line 7
    monitor-exit p0

    .line 8
    return-void

    .line 9
    :catchall_0
    move-exception p1

    .line 10
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 11
    throw p1
.end method
