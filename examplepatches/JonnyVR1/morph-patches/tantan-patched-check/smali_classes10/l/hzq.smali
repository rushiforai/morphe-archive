.class public Ll/hzq;
.super Ll/bzm;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Ll/hzq$a;
    }
.end annotation


# instance fields
.field public b:Ll/hzq$a;

.field public c:Ll/l4f;


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/bzm;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public a(Ll/ur4;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/smc0;->g()Ll/l4f;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/hzq;->g(Ll/l4f;)V

    .line 10
    .line 11
    .line 12
    iget-object p0, p0, Ll/hzq;->b:Ll/hzq$a;

    .line 13
    .line 14
    if-eqz p0, :cond_0

    .line 15
    .line 16
    const/4 v0, 0x0

    .line 17
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 18
    .line 19
    .line 20
    :cond_0
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-virtual {p0}, Ll/yc60;->b()Ll/ftf0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/ftf0;->h()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-nez p0, :cond_1

    .line 33
    .line 34
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 35
    .line 36
    .line 37
    move-result-object p0

    .line 38
    invoke-interface {p1, p0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 39
    .line 40
    .line 41
    :cond_1
    return-void
.end method

.method public b(Ll/ur4;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    invoke-interface {p1}, Ll/ur4;->b()Ll/smc0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/smc0;->g()Ll/l4f;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-virtual {p0, v0}, Ll/hzq;->g(Ll/l4f;)V

    .line 10
    .line 11
    .line 12
    iget-object v0, p0, Ll/hzq;->b:Ll/hzq$a;

    .line 13
    .line 14
    invoke-virtual {p0}, Ll/hzq;->f()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    mul-int/lit16 p0, p0, 0x3e8

    .line 19
    .line 20
    int-to-long v1, p0

    .line 21
    const/4 p0, 0x0

    .line 22
    invoke-virtual {v0, p0, v1, v2}, Landroid/os/Handler;->sendEmptyMessageDelayed(IJ)Z

    .line 23
    .line 24
    .line 25
    invoke-interface {p1}, Ll/ur4;->c()Ll/yc60;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-interface {p1, p0}, Ll/ur4;->a(Ll/yc60;)Ll/ur4;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public d()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/bzm;->d()V

    .line 2
    .line 3
    .line 4
    const-string v0, "[live][longlink]"

    .line 5
    .line 6
    const-string v1, "KeepAliveInterceptor onDisconnected"

    .line 7
    .line 8
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 9
    .line 10
    .line 11
    iget-object p0, p0, Ll/hzq;->b:Ll/hzq$a;

    .line 12
    .line 13
    const/4 v0, 0x0

    .line 14
    invoke-virtual {p0, v0}, Landroid/os/Handler;->removeMessages(I)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public declared-synchronized e()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/hzq;->b:Ll/hzq$a;

    .line 3
    .line 4
    if-eqz v0, :cond_0

    .line 5
    .line 6
    const/4 v1, 0x0

    .line 7
    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeCallbacksAndMessages(Ljava/lang/Object;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception v0

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    :goto_0
    monitor-exit p0

    .line 14
    return-void

    .line 15
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 16
    throw v0
.end method

.method public f()I
    .locals 0

    .line 1
    const/16 p0, 0x28

    .line 2
    .line 3
    return p0
.end method

.method public final declared-synchronized g(Ll/l4f;)V
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/hzq;->c:Ll/l4f;

    .line 3
    .line 4
    if-nez v0, :cond_0

    .line 5
    .line 6
    if-eqz p1, :cond_0

    .line 7
    .line 8
    iput-object p1, p0, Ll/hzq;->c:Ll/l4f;

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :catchall_0
    move-exception p1

    .line 12
    goto :goto_1

    .line 13
    :cond_0
    :goto_0
    iget-object p1, p0, Ll/hzq;->b:Ll/hzq$a;

    .line 14
    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    new-instance p1, Ll/hzq$a;

    .line 18
    .line 19
    iget-object v0, p0, Ll/hzq;->c:Ll/l4f;

    .line 20
    .line 21
    invoke-direct {p1, v0}, Ll/hzq$a;-><init>(Ll/l4f;)V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Ll/hzq;->b:Ll/hzq$a;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 25
    .line 26
    :cond_1
    monitor-exit p0

    .line 27
    return-void

    .line 28
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method
