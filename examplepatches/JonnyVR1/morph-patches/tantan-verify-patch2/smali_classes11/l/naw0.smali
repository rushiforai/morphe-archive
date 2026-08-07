.class public final Ll/naw0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/gaw0;

.field public final b:Ll/hpr;

.field public c:Z

.field public d:Z


# direct methods
.method public constructor <init>(Ll/h9w0;Ll/faw0;Ll/gaw0;)V
    .locals 2

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x0

    .line 5
    iput-boolean v0, p0, Ll/naw0;->c:Z

    .line 6
    .line 7
    iput-boolean v0, p0, Ll/naw0;->d:Z

    .line 8
    .line 9
    iput-object p3, p0, Ll/naw0;->a:Ll/gaw0;

    .line 10
    .line 11
    invoke-interface {p2, p3}, Ll/faw0;->b(Ll/gaw0;)Ll/hpr;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/law0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p2, p1, p3}, Ll/law0;-><init>(Ll/naw0;Ll/faw0;Ll/h9w0;Ll/gaw0;)V

    .line 18
    .line 19
    .line 20
    invoke-interface {p3}, Ll/gaw0;->zzb()Ljava/util/concurrent/Executor;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    invoke-static {v0, v1, p1}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    new-instance v0, Ll/maw0;

    .line 29
    .line 30
    invoke-direct {v0, p0, p2}, Ll/maw0;-><init>(Ll/naw0;Ll/faw0;)V

    .line 31
    .line 32
    .line 33
    invoke-interface {p3}, Ll/gaw0;->zzb()Ljava/util/concurrent/Executor;

    .line 34
    .line 35
    .line 36
    move-result-object p2

    .line 37
    const-class p3, Ljava/lang/Exception;

    .line 38
    .line 39
    invoke-static {p1, p3, v0, p2}, Ll/pvw0;->f(Ll/hpr;Ljava/lang/Class;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Ll/naw0;->b:Ll/hpr;

    .line 44
    .line 45
    return-void
.end method


# virtual methods
.method public final declared-synchronized a(Ll/gaw0;)Ll/hpr;
    .locals 1

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-boolean v0, p0, Ll/naw0;->d:Z

    .line 3
    .line 4
    if-nez v0, :cond_1

    .line 5
    .line 6
    iget-boolean v0, p0, Ll/naw0;->c:Z

    .line 7
    .line 8
    if-eqz v0, :cond_0

    .line 9
    .line 10
    goto :goto_0

    .line 11
    :cond_0
    iget-object v0, p0, Ll/naw0;->a:Ll/gaw0;

    .line 12
    .line 13
    invoke-interface {v0}, Ll/gaw0;->zza()Ll/v9w0;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    if-eqz v0, :cond_1

    .line 18
    .line 19
    invoke-interface {p1}, Ll/gaw0;->zza()Ll/v9w0;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz v0, :cond_1

    .line 24
    .line 25
    iget-object v0, p0, Ll/naw0;->a:Ll/gaw0;

    .line 26
    .line 27
    invoke-interface {v0}, Ll/gaw0;->zza()Ll/v9w0;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-interface {p1}, Ll/gaw0;->zza()Ll/v9w0;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    invoke-virtual {v0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_1

    .line 40
    .line 41
    const/4 p1, 0x1

    .line 42
    iput-boolean p1, p0, Ll/naw0;->c:Z

    .line 43
    .line 44
    iget-object p1, p0, Ll/naw0;->b:Ll/hpr;
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    monitor-exit p0

    .line 47
    return-object p1

    .line 48
    :catchall_0
    move-exception p1

    .line 49
    goto :goto_1

    .line 50
    :cond_1
    :goto_0
    monitor-exit p0

    .line 51
    const/4 p0, 0x0

    .line 52
    return-object p0

    .line 53
    :goto_1
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 54
    throw p1
.end method

.method public final synthetic b(Ll/faw0;Ll/h9w0;Ll/gaw0;Ll/u9w0;)Ll/hpr;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 v0, 0x1

    .line 3
    :try_start_0
    iput-boolean v0, p0, Ll/naw0;->d:Z

    .line 4
    .line 5
    invoke-interface {p1, p4}, Ll/faw0;->a(Ll/u9w0;)V

    .line 6
    .line 7
    .line 8
    iget-boolean p1, p0, Ll/naw0;->c:Z

    .line 9
    .line 10
    if-nez p1, :cond_0

    .line 11
    .line 12
    invoke-interface {p3}, Ll/gaw0;->zza()Ll/v9w0;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    invoke-interface {p2, p1, p4}, Ll/h9w0;->b(Ll/v9w0;Ll/u9w0;)Z

    .line 17
    .line 18
    .line 19
    const/4 p1, 0x0

    .line 20
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    monitor-exit p0

    .line 25
    return-object p1

    .line 26
    :catchall_0
    move-exception p1

    .line 27
    goto :goto_0

    .line 28
    :cond_0
    new-instance p1, Ll/eaw0;

    .line 29
    .line 30
    invoke-direct {p1, p4, p3}, Ll/eaw0;-><init>(Ll/u9w0;Ll/gaw0;)V

    .line 31
    .line 32
    .line 33
    invoke-static {p1}, Ll/pvw0;->h(Ljava/lang/Object;)Ll/hpr;

    .line 34
    .line 35
    .line 36
    move-result-object p1

    .line 37
    monitor-exit p0

    .line 38
    return-object p1

    .line 39
    :goto_0
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 40
    throw p1
.end method

.method public final synthetic c(Ll/faw0;Ljava/lang/Exception;)Ll/hpr;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/lang/Exception;
        }
    .end annotation

    .line 1
    monitor-enter p0

    .line 2
    const/4 p1, 0x1

    .line 3
    :try_start_0
    iput-boolean p1, p0, Ll/naw0;->d:Z

    .line 4
    .line 5
    throw p2

    .line 6
    :catchall_0
    move-exception p1

    .line 7
    monitor-exit p0
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 8
    throw p1
.end method

.method public final declared-synchronized d(Ll/lvw0;)V
    .locals 3

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/naw0;->a:Ll/gaw0;

    .line 3
    .line 4
    iget-object v1, p0, Ll/naw0;->b:Ll/hpr;

    .line 5
    .line 6
    sget-object v2, Ll/kaw0;->a:Ll/kaw0;

    .line 7
    .line 8
    invoke-interface {v0}, Ll/gaw0;->zzb()Ljava/util/concurrent/Executor;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-static {v1, v2, v0}, Ll/pvw0;->n(Ll/hpr;Ll/xuw0;Ljava/util/concurrent/Executor;)Ll/hpr;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v1, p0, Ll/naw0;->a:Ll/gaw0;

    .line 17
    .line 18
    invoke-interface {v1}, Ll/gaw0;->zzb()Ljava/util/concurrent/Executor;

    .line 19
    .line 20
    .line 21
    move-result-object v1

    .line 22
    invoke-static {v0, p1, v1}, Ll/pvw0;->r(Ll/hpr;Ll/lvw0;Ljava/util/concurrent/Executor;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 23
    .line 24
    .line 25
    monitor-exit p0

    .line 26
    return-void

    .line 27
    :catchall_0
    move-exception p1

    .line 28
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 29
    throw p1
.end method
