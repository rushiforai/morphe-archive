.class public final Ll/kcs0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:[B

.field public b:I

.field public final synthetic c:Ll/lcs0;


# direct methods
.method public synthetic constructor <init>(Ll/lcs0;[BLl/jcs0;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 2
    .line 3
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 4
    .line 5
    .line 6
    iput-object p2, p0, Ll/kcs0;->a:[B

    .line 7
    .line 8
    return-void
.end method

.method public static synthetic b(Ll/kcs0;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/kcs0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method


# virtual methods
.method public final a(I)Ll/kcs0;
    .locals 0

    .line 1
    iput p1, p0, Ll/kcs0;->b:I

    .line 2
    .line 3
    return-object p0
.end method

.method public final declared-synchronized c()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 3
    .line 4
    invoke-static {v0}, Ll/lcs0;->a(Ll/lcs0;)Ljava/util/concurrent/ExecutorService;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/ics0;

    .line 9
    .line 10
    invoke-direct {v1, p0}, Ll/ics0;-><init>(Ll/kcs0;)V

    .line 11
    .line 12
    .line 13
    invoke-interface {v0, v1}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V
    :try_end_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 14
    .line 15
    .line 16
    monitor-exit p0

    .line 17
    return-void

    .line 18
    :catchall_0
    move-exception v0

    .line 19
    :try_start_1
    monitor-exit p0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 20
    throw v0
.end method

.method public final declared-synchronized d()V
    .locals 2

    .line 1
    monitor-enter p0

    .line 2
    :try_start_0
    iget-object v0, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 3
    .line 4
    iget-boolean v1, v0, Ll/lcs0;->b:Z

    .line 5
    .line 6
    if-eqz v1, :cond_0

    .line 7
    .line 8
    iget-object v0, v0, Ll/lcs0;->a:Ll/u6s0;

    .line 9
    .line 10
    iget-object v1, p0, Ll/kcs0;->a:[B

    .line 11
    .line 12
    invoke-interface {v0, v1}, Ll/u6s0;->r0([B)V

    .line 13
    .line 14
    .line 15
    iget-object v0, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 16
    .line 17
    iget-object v0, v0, Ll/lcs0;->a:Ll/u6s0;

    .line 18
    .line 19
    const/4 v1, 0x0

    .line 20
    invoke-interface {v0, v1}, Ll/u6s0;->n(I)V

    .line 21
    .line 22
    .line 23
    iget-object v0, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 24
    .line 25
    iget-object v0, v0, Ll/lcs0;->a:Ll/u6s0;

    .line 26
    .line 27
    iget v1, p0, Ll/kcs0;->b:I

    .line 28
    .line 29
    invoke-interface {v0, v1}, Ll/u6s0;->zzg(I)V

    .line 30
    .line 31
    .line 32
    iget-object v0, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 33
    .line 34
    iget-object v0, v0, Ll/lcs0;->a:Ll/u6s0;

    .line 35
    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-interface {v0, v1}, Ll/u6s0;->k0([I)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/kcs0;->c:Ll/lcs0;

    .line 41
    .line 42
    iget-object v0, v0, Ll/lcs0;->a:Ll/u6s0;

    .line 43
    .line 44
    invoke-interface {v0}, Ll/u6s0;->zzf()V
    :try_end_0
    .catch Landroid/os/RemoteException; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 45
    .line 46
    .line 47
    monitor-exit p0

    .line 48
    return-void

    .line 49
    :catchall_0
    move-exception v0

    .line 50
    goto :goto_1

    .line 51
    :catch_0
    move-exception v0

    .line 52
    goto :goto_0

    .line 53
    :cond_0
    monitor-exit p0

    .line 54
    return-void

    .line 55
    :goto_0
    :try_start_1
    const-string v1, "Clearcut log failed"

    .line 56
    .line 57
    invoke-static {v1, v0}, Ll/dct0;->c(Ljava/lang/String;Ljava/lang/Throwable;)V
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_0

    .line 58
    .line 59
    .line 60
    monitor-exit p0

    .line 61
    return-void

    .line 62
    :goto_1
    :try_start_2
    monitor-exit p0
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    .line 63
    throw v0
.end method
