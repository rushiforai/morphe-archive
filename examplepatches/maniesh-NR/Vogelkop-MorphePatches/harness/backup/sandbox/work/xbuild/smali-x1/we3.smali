.class public final Lwe3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;

.field public final c:Ljava/lang/Object;

.field public final d:Ljava/lang/Object;

.field public final e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public constructor <init>(Laf3;Llh4;Lcf3;Lnsh;Llf3;)V
    .registers 7

    const/4 v0, 0x0

    iput-byte v0, p0, Lwe3;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lwe3;->f:Ljava/lang/Object;

    iput-object p2, p0, Lwe3;->b:Ljava/lang/Object;

    iput-object p3, p0, Lwe3;->c:Ljava/lang/Object;

    iput-object p4, p0, Lwe3;->d:Ljava/lang/Object;

    iput-object p5, p0, Lwe3;->e:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    .line 20
    iput-byte p6, p0, Lwe3;->a:B

    iput-object p1, p0, Lwe3;->b:Ljava/lang/Object;

    iput-object p2, p0, Lwe3;->c:Ljava/lang/Object;

    iput-object p3, p0, Lwe3;->d:Ljava/lang/Object;

    iput-object p4, p0, Lwe3;->e:Ljava/lang/Object;

    iput-object p5, p0, Lwe3;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 6

    iget-byte v0, p0, Lwe3;->a:B

    packed-switch v0, :pswitch_data_d0

    iget-object v0, p0, Lwe3;->b:Ljava/lang/Object;

    check-cast v0, Lmtp;

    iget-object v1, p0, Lwe3;->c:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/gms/tasks/CancellationToken;

    iget-object v2, p0, Lwe3;->d:Ljava/lang/Object;

    check-cast v2, Lcom/google/android/gms/tasks/CancellationTokenSource;

    iget-object v3, p0, Lwe3;->e:Ljava/lang/Object;

    check-cast v3, Ljava/util/concurrent/Callable;

    iget-object p0, p0, Lwe3;->f:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/gms/tasks/TaskCompletionSource;

    invoke-virtual {v1}, Lcom/google/android/gms/tasks/CancellationToken;->isCancellationRequested()Z

    move-result v4

    if-eqz v4, :cond_23

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/CancellationTokenSource;->cancel()V

    goto :goto_73

    :cond_23
    :try_start_23
    iget-object v4, v0, Lmtp;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->get()Z

    move-result v4

    if-nez v4, :cond_40

    monitor-enter v0
    :try_end_2c
    .catch Ljava/lang/RuntimeException; {:try_start_23 .. :try_end_2c} :catch_5c
    .catch Ljava/lang/Exception; {:try_start_23 .. :try_end_2c} :catch_65

    :try_start_2c
    iget-object v4, v0, Lmtp;->e:Lqtp;

    invoke-interface {v4}, Lqtp;->zzc()Z

    move-result v4

    iput-boolean v4, v0, Lmtp;->i:Z
    :try_end_34
    .catchall {:try_start_2c .. :try_end_34} :catchall_3e

    :try_start_34
    monitor-exit v0

    iget-object v0, v0, Lmtp;->c:Ljava/util/concurrent/atomic/AtomicBoolean;

    const/4 v4, 0x1

    invoke-virtual {v0, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
    :try_end_3b
    .catch Ljava/lang/RuntimeException; {:try_start_34 .. :try_end_3b} :catch_5c
    .catch Ljava/lang/Exception; {:try_start_34 .. :try_end_3b} :catch_65

    goto :goto_40

    :goto_3c
    :try_start_3c
    monitor-exit v0
    :try_end_3d
    .catchall {:try_start_3c .. :try_end_3d} :catchall_3e

    :try_start_3d
    throw v3

    :catchall_3e
    move-exception v3

    goto :goto_3c

    :cond_40
    :goto_40
    invoke-virtual {v1}, Lcom/google/android/gms/tasks/CancellationToken;->isCancellationRequested()Z

    move-result v0

    if-eqz v0, :cond_4a

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/CancellationTokenSource;->cancel()V

    goto :goto_73

    :cond_4a
    invoke-interface {v3}, Ljava/util/concurrent/Callable;->call()Ljava/lang/Object;

    move-result-object v0
    :try_end_4e
    .catch Ljava/lang/RuntimeException; {:try_start_3d .. :try_end_4e} :catch_5c
    .catch Ljava/lang/Exception; {:try_start_3d .. :try_end_4e} :catch_65

    :try_start_4e
    invoke-virtual {v1}, Lcom/google/android/gms/tasks/CancellationToken;->isCancellationRequested()Z

    move-result v3

    if-eqz v3, :cond_58

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/CancellationTokenSource;->cancel()V

    goto :goto_73

    :cond_58
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setResult(Ljava/lang/Object;)V

    goto :goto_73

    :catch_5c
    move-exception v0

    new-instance v3, Ll3e;

    const-string v4, "Internal error has occurred when executing ML Kit tasks"

    invoke-direct {v3, v4, v0}, Ll3e;-><init>(Ljava/lang/String;Ljava/lang/Exception;)V

    throw v3
    :try_end_65
    .catch Ljava/lang/Exception; {:try_start_4e .. :try_end_65} :catch_65

    :catch_65
    move-exception v0

    invoke-virtual {v1}, Lcom/google/android/gms/tasks/CancellationToken;->isCancellationRequested()Z

    move-result v1

    if-eqz v1, :cond_70

    invoke-virtual {v2}, Lcom/google/android/gms/tasks/CancellationTokenSource;->cancel()V

    goto :goto_73

    :cond_70
    invoke-virtual {p0, v0}, Lcom/google/android/gms/tasks/TaskCompletionSource;->setException(Ljava/lang/Exception;)V

    :goto_73
    return-void

    :pswitch_74
    iget-object v0, p0, Lwe3;->b:Ljava/lang/Object;

    check-cast v0, Lspp;

    iget-object v0, v0, Lspp;->f:Ltpp;

    invoke-virtual {v0}, Ltpp;->c()V

    iget-object v0, p0, Lwe3;->d:Ljava/lang/Object;

    check-cast v0, Ljava/lang/String;

    iget-object v1, p0, Lwe3;->e:Ljava/lang/Object;

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lwe3;->c:Ljava/lang/Object;

    check-cast v2, Landroid/app/Activity;

    iget-object p0, p0, Lwe3;->f:Ljava/lang/Object;

    check-cast p0, Ljava/util/Map;

    invoke-static {v0, v1, p0}, Ly4h;->t(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)Landroid/content/Intent;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {v2, p0, v0}, Landroid/app/Activity;->startActivityForResult(Landroid/content/Intent;I)V

    return-void

    :pswitch_96
    iget-object v0, p0, Lwe3;->b:Ljava/lang/Object;

    check-cast v0, Llh4;

    iget-object v1, p0, Lwe3;->c:Ljava/lang/Object;

    check-cast v1, Lcf3;

    iget-object v2, p0, Lwe3;->f:Ljava/lang/Object;

    check-cast v2, Laf3;

    iget-object v3, v2, Laf3;->a:Lhjf;

    iget-object v4, p0, Lwe3;->e:Ljava/lang/Object;

    check-cast v4, Llf3;

    invoke-virtual {v1, v3, v4}, Lcf3;->b(Lhjf;Llf3;)Lmf3;

    move-result-object v1

    iget v1, v1, Lmf3;->a:I

    if-eqz v1, :cond_c0

    new-instance p0, Lff3;

    new-instance v1, Lgf3;

    invoke-direct {v1}, Lgf3;-><init>()V

    sget-object v2, Ljf3;->c:Ljf3;

    invoke-direct {p0, v1, v2}, Lk8;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v0, p0}, Llh4;->run(Ljava/lang/Object;)V

    goto :goto_ce

    :cond_c0
    iget-object v1, v2, Laf3;->e:Ljava/util/ArrayList;

    new-instance v2, Lxe3;

    iget-object p0, p0, Lwe3;->d:Ljava/lang/Object;

    check-cast p0, Lnsh;

    invoke-direct {v2, p0, v0}, Lxe3;-><init>(Lnsh;Llh4;)V

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :goto_ce
    return-void

    nop

    :pswitch_data_d0
    .packed-switch 0x0
        :pswitch_96
        :pswitch_74
    .end packed-switch
.end method
