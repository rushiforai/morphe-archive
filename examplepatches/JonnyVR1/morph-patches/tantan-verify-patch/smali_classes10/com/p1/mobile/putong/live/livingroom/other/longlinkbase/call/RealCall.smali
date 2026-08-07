.class public abstract Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/qy3;


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall$TimeoutException;
    }
.end annotation


# instance fields
.field public a:Z

.field public b:Ll/smc0;

.field public c:Ll/yc60;


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a:Z

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public a(Ll/smc0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/smc0;->d()Ll/t24;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p1, p0}, Ll/t24;->d(Ll/qy3;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public b()V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a:Z

    .line 3
    .line 4
    return-void
.end method

.method public c()Ll/smc0;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 2
    .line 3
    return-object p0
.end method

.method public abstract d()Ll/yc60;
.end method

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
    new-instance v0, Ll/umc0;

    .line 13
    .line 14
    invoke-direct {v0}, Ll/umc0;-><init>()V

    .line 15
    .line 16
    .line 17
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->b:Ll/smc0;

    .line 18
    .line 19
    const/4 v3, 0x0

    .line 20
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 21
    .line 22
    .line 23
    move-result-object v4

    .line 24
    move-object v5, p0

    .line 25
    invoke-virtual/range {v0 .. v5}, Ll/umc0;->d(Ll/smc0;Ljava/util/List;ILl/yc60;Ll/qy3;)Ll/umc0;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v5}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->f()Ll/yc60;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    invoke-interface {p0, v0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 34
    .line 35
    .line 36
    return-void
.end method

.method public execute()V
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
    iget-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a:Z

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    const/4 v0, 0x1

    .line 7
    iput-boolean v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->a:Z

    .line 8
    .line 9
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 10
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->d()Ll/yc60;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->c:Ll/yc60;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->e()V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :catchall_0
    move-exception v0

    .line 21
    goto :goto_0

    .line 22
    :cond_0
    :try_start_1
    new-instance v0, Ljava/lang/IllegalStateException;

    .line 23
    .line 24
    const-string v1, "Already Executed"

    .line 25
    .line 26
    invoke-direct {v0, v1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    .line 27
    .line 28
    .line 29
    throw v0

    .line 30
    :goto_0
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 31
    throw v0
.end method

.method public f()Ll/yc60;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/other/longlinkbase/call/RealCall;->c:Ll/yc60;

    .line 2
    .line 3
    return-object p0
.end method
