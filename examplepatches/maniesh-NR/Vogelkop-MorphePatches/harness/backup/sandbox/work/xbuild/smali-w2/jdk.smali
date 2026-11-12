.class public final synthetic Ljdk;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lhd;


# direct methods
.method public synthetic constructor <init>(Lhd;B)V
    .registers 3

    iput-byte p2, p0, Ljdk;->a:B

    iput-object p1, p0, Ljdk;->b:Lhd;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 8

    iget-byte v0, p0, Ljdk;->a:B

    iget-object p0, p0, Ljdk;->b:Lhd;

    packed-switch v0, :pswitch_data_a8

    invoke-virtual {p0}, Lhd;->f()V

    return-void

    :pswitch_b
    const/4 v0, 0x3

    const/4 v1, 0x0

    const/4 v2, 0x0

    :try_start_e
    iget-object v3, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v3, Lldk;

    invoke-virtual {v3}, Lldk;->a()Ljava/lang/Object;

    move-result-object v3

    iput-object v3, p0, Lhd;->f:Ljava/lang/Object;
    :try_end_18
    .catch Ljava/io/IOException; {:try_start_e .. :try_end_18} :catch_3e
    .catch Ljava/lang/RuntimeException; {:try_start_e .. :try_end_18} :catch_3e
    .catchall {:try_start_e .. :try_end_18} :catchall_80

    iget-object v3, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v3, Loml;

    invoke-virtual {v3, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    iget-object v1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Lldk;

    iget-object v3, v1, Lldk;->d:Ljava/lang/Object;

    monitor-enter v3

    :try_start_2d
    iget-object p0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lldk;

    iput-boolean v2, p0, Lldk;->i:Z

    iput v0, p0, Lldk;->h:I

    invoke-virtual {p0}, Lldk;->e()V

    monitor-exit v3

    goto :goto_78

    :goto_3a
    monitor-exit v3
    :try_end_3b
    .catchall {:try_start_2d .. :try_end_3b} :catchall_3c

    throw p0

    :catchall_3c
    move-exception p0

    goto :goto_3a

    :catch_3e
    move-exception v3

    const/4 v4, 0x1

    :try_start_40
    iget-object v5, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v5, Lldk;

    invoke-virtual {v5}, Lldk;->c()I

    move-result v5
    :try_end_48
    .catchall {:try_start_40 .. :try_end_48} :catchall_4c

    const/4 v6, 0x2

    if-ne v5, v6, :cond_4c

    move v4, v2

    :catchall_4c
    :cond_4c
    :try_start_4c
    sget-object v5, Ly55;->h:Ljava/lang/Object;

    monitor-enter v5
    :try_end_4f
    .catchall {:try_start_4c .. :try_end_4f} :catchall_80

    :try_start_4f
    sget-object v6, Ly55;->i:Lvk2;
    :try_end_51
    .catchall {:try_start_4f .. :try_end_51} :catchall_7d

    :try_start_51
    monitor-exit v5

    if-eqz v6, :cond_57

    invoke-virtual {v6, v3}, Lvk2;->run(Ljava/lang/Object;)V
    :try_end_57
    .catchall {:try_start_51 .. :try_end_57} :catchall_80

    :cond_57
    iget-object v2, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v2, Loml;

    invoke-virtual {v2, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    iget-object v1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Lldk;

    iget-object v3, v1, Lldk;->d:Ljava/lang/Object;

    monitor-enter v3

    :try_start_6c
    iget-object p0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lldk;

    iput-boolean v4, p0, Lldk;->i:Z

    iput v0, p0, Lldk;->h:I

    invoke-virtual {p0}, Lldk;->e()V

    monitor-exit v3

    :goto_78
    return-void

    :goto_79
    monitor-exit v3
    :try_end_7a
    .catchall {:try_start_6c .. :try_end_7a} :catchall_7b

    throw p0

    :catchall_7b
    move-exception p0

    goto :goto_79

    :catchall_7d
    move-exception v3

    :try_start_7e
    monitor-exit v5

    throw v3
    :try_end_80
    .catchall {:try_start_7e .. :try_end_80} :catchall_80

    :catchall_80
    move-exception v3

    iget-object v4, p0, Lhd;->e:Ljava/lang/Object;

    check-cast v4, Loml;

    invoke-virtual {v4, v1, v1}, Loml;->a(Ljava/lang/Object;Ljri;)V

    iget-object v1, p0, Lhd;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {v1}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    iget-object v1, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v1, Lldk;

    iget-object v1, v1, Lldk;->d:Ljava/lang/Object;

    monitor-enter v1

    :try_start_96
    iget-object p0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast p0, Lldk;

    iput-boolean v2, p0, Lldk;->i:Z

    iput v0, p0, Lldk;->h:I

    invoke-virtual {p0}, Lldk;->e()V

    monitor-exit v1
    :try_end_a2
    .catchall {:try_start_96 .. :try_end_a2} :catchall_a5

    throw v3

    :goto_a3
    :try_start_a3
    monitor-exit v1
    :try_end_a4
    .catchall {:try_start_a3 .. :try_end_a4} :catchall_a5

    throw p0

    :catchall_a5
    move-exception p0

    goto :goto_a3

    nop

    :pswitch_data_a8
    .packed-switch 0x0
        :pswitch_b
    .end packed-switch
.end method
