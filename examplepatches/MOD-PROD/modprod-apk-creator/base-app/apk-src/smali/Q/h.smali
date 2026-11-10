.class public final LQ/h;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:I

.field public b:Ljava/lang/Object;

.field public c:Ljava/lang/Object;

.field public d:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>()V
    .locals 1

    const/4 v0, 0x2

    iput v0, p0, LQ/h;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public constructor <init>(LR/h;LQ/k;LQ/c;)V
    .locals 1

    const/4 v0, 0x0

    iput v0, p0, LQ/h;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ/h;->b:Ljava/lang/Object;

    iput-object p2, p0, LQ/h;->c:Ljava/lang/Object;

    iput-object p3, p0, LQ/h;->d:Ljava/lang/Object;

    return-void
.end method

.method public constructor <init>(LT/g;Ljava/lang/String;)V
    .locals 1

    const/4 v0, 0x1

    iput v0, p0, LQ/h;->a:I

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, LQ/h;->d:Ljava/lang/Object;

    iput-object p2, p0, LQ/h;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final run()V
    .locals 7

    iget v0, p0, LQ/h;->a:I

    packed-switch v0, :pswitch_data_0

    :try_start_0
    iget-object v0, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v0, Lv/c;

    invoke-virtual {v0}, Lv/c;->call()Ljava/lang/Object;

    move-result-object v0
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    goto :goto_0

    :catch_0
    const/4 v0, 0x0

    :goto_0
    new-instance v1, LQ/c;

    iget-object v2, p0, LQ/h;->c:Ljava/lang/Object;

    check-cast v2, Lv/d;

    const/4 v3, 0x5

    invoke-direct {v1, v2, v3, v0}, LQ/c;-><init>(Ljava/lang/Object;ILjava/lang/Object;)V

    iget-object v0, p0, LQ/h;->d:Ljava/lang/Object;

    check-cast v0, Landroid/os/Handler;

    invoke-virtual {v0, v1}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    return-void

    :pswitch_0
    iget-object v0, p0, LQ/h;->d:Ljava/lang/Object;

    check-cast v0, LT/g;

    iget-boolean v1, v0, LT/g;->e:Z

    const/4 v2, 0x0

    if-nez v1, :cond_1

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, v0, LT/g;->s:Ljava/lang/Boolean;

    iget-object v1, v0, LT/g;->i:Ljava/lang/String;

    const-string v3, "false"

    invoke-virtual {v1, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_0

    goto :goto_1

    :cond_0
    iget-object v1, v0, LT/g;->b:Lstart/MainActivity;

    invoke-static {v1}, LD/g;->C(Lstart/MainActivity;)LQ/n;

    move-result-object v1

    new-instance v3, LR/h;

    new-instance v4, LC/j;

    const/4 v5, 0x7

    invoke-direct {v4, v5, p0}, LC/j;-><init>(ILjava/lang/Object;)V

    new-instance v5, LF/d;

    const/16 v6, 0xc

    invoke-direct {v5, v6}, LF/d;-><init>(I)V

    iget-object v6, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v6, Ljava/lang/String;

    invoke-direct {v3, v2, v6, v4, v5}, LR/h;-><init>(ILjava/lang/String;LQ/o;LF/d;)V

    invoke-virtual {v1, v3}, LQ/n;->a(LR/h;)V

    goto :goto_1

    :cond_1
    iget v1, v0, LT/g;->f:I

    iput v1, v0, LT/g;->c:I

    iput-boolean v2, v0, LT/g;->e:Z

    :goto_1
    iget-object v1, v0, LT/g;->d:Landroid/os/Handler;

    iget v2, v0, LT/g;->c:I

    int-to-long v2, v2

    invoke-virtual {v1, p0, v2, v3}, Landroid/os/Handler;->postDelayed(Ljava/lang/Runnable;J)Z

    iget v1, v0, LT/g;->c:I

    iget v2, v0, LT/g;->f:I

    if-ne v1, v2, :cond_2

    iget v1, v0, LT/g;->g:I

    iput v1, v0, LT/g;->c:I

    :cond_2
    return-void

    :pswitch_1
    iget-object v0, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v0, LR/h;

    iget-object v0, v0, LR/h;->e:Ljava/lang/Object;

    monitor-enter v0

    :try_start_1
    monitor-exit v0
    :try_end_1
    .catchall {:try_start_1 .. :try_end_1} :catchall_2

    iget-object v0, p0, LQ/h;->c:Ljava/lang/Object;

    check-cast v0, LQ/k;

    iget-object v1, v0, LQ/k;->d:Ljava/lang/Object;

    check-cast v1, LQ/p;

    if-nez v1, :cond_3

    iget-object v1, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v1, LR/h;

    iget-object v0, v0, LQ/k;->b:Ljava/io/Serializable;

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v1, LR/h;->n:Ljava/lang/Object;

    monitor-enter v2

    :try_start_2
    iget-object v1, v1, LR/h;->o:LQ/o;

    monitor-exit v2
    :try_end_2
    .catchall {:try_start_2 .. :try_end_2} :catchall_0

    if-eqz v1, :cond_4

    invoke-interface {v1, v0}, LQ/o;->u(Ljava/lang/String;)V

    goto :goto_2

    :catchall_0
    move-exception v0

    :try_start_3
    monitor-exit v2
    :try_end_3
    .catchall {:try_start_3 .. :try_end_3} :catchall_0

    throw v0

    :cond_3
    iget-object v0, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v0, LR/h;

    iget-object v2, v0, LR/h;->e:Ljava/lang/Object;

    monitor-enter v2

    :try_start_4
    iget-object v0, v0, LR/h;->f:LF/d;

    monitor-exit v2
    :try_end_4
    .catchall {:try_start_4 .. :try_end_4} :catchall_1

    if-eqz v0, :cond_4

    iget v0, v0, LF/d;->a:I

    packed-switch v0, :pswitch_data_1

    :pswitch_2
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Error:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error Get JSON"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :pswitch_3
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Error:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error Get JSON"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :pswitch_4
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Error:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error click"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    goto :goto_2

    :pswitch_5
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v2, "Error:"

    invoke-direct {v0, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    const-string v1, "Error Get JSON"

    invoke-static {v1, v0}, Landroid/util/Log;->d(Ljava/lang/String;Ljava/lang/String;)I

    :cond_4
    :goto_2
    iget-object v0, p0, LQ/h;->c:Ljava/lang/Object;

    check-cast v0, LQ/k;

    iget-boolean v0, v0, LQ/k;->a:Z

    if-eqz v0, :cond_5

    iget-object v0, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v0, LR/h;

    const-string v1, "intermediate-response"

    invoke-virtual {v0, v1}, LR/h;->a(Ljava/lang/String;)V

    goto :goto_3

    :cond_5
    iget-object v0, p0, LQ/h;->b:Ljava/lang/Object;

    check-cast v0, LR/h;

    const-string v1, "done"

    invoke-virtual {v0, v1}, LR/h;->b(Ljava/lang/String;)V

    :goto_3
    iget-object v0, p0, LQ/h;->d:Ljava/lang/Object;

    check-cast v0, LQ/c;

    if-eqz v0, :cond_6

    invoke-virtual {v0}, LQ/c;->run()V

    :cond_6
    return-void

    :catchall_1
    move-exception v0

    :try_start_5
    monitor-exit v2
    :try_end_5
    .catchall {:try_start_5 .. :try_end_5} :catchall_1

    throw v0

    :catchall_2
    move-exception v1

    :try_start_6
    monitor-exit v0
    :try_end_6
    .catchall {:try_start_6 .. :try_end_6} :catchall_2

    throw v1

    nop

    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
    .end packed-switch

    :pswitch_data_1
    .packed-switch 0x9
        :pswitch_5
        :pswitch_2
        :pswitch_4
        :pswitch_3
    .end packed-switch
.end method
