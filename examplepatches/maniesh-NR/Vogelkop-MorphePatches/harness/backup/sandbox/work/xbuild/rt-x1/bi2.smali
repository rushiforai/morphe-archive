.class public final synthetic Lbi2;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 4

    iput-byte p3, p0, Lbi2;->a:B

    iput-object p1, p0, Lbi2;->b:Ljava/lang/Object;

    iput-object p2, p0, Lbi2;->c:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 4

    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lhf4;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lzd4;

    iget-object v1, v0, Lhf4;->a:Ljava/lang/Object;

    monitor-enter v1

    :try_start_b
    iget-object v2, v0, Lhf4;->c:Ljava/util/HashSet;

    invoke-virtual {v2, p0}, Ljava/util/HashSet;->remove(Ljava/lang/Object;)Z

    iget-object p0, v0, Lhf4;->c:Ljava/util/HashSet;

    invoke-virtual {p0}, Ljava/util/HashSet;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_27

    iget-object p0, v0, Lhf4;->e:Ll94;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, v0, Lhf4;->e:Ll94;

    const/4 v2, 0x0

    invoke-virtual {p0, v2}, Ll94;->b(Ljava/lang/Object;)Z

    iput-object v2, v0, Lhf4;->e:Ll94;

    iput-object v2, v0, Lhf4;->d:Lo94;

    :cond_27
    monitor-exit v1

    return-void

    :goto_29
    monitor-exit v1
    :try_end_2a
    .catchall {:try_start_b .. :try_end_2a} :catchall_2b

    throw p0

    :catchall_2b
    move-exception p0

    goto :goto_29
.end method


# virtual methods
.method public final run()V
    .registers 13

    iget-byte v0, p0, Lbi2;->a:B

    const/4 v1, 0x4

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    packed-switch v0, :pswitch_data_418

    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lwg4;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ll94;

    iget-object v1, v0, Lwg4;->g:Ltah;

    iget-object v5, v1, Ltah;->k:Ljava/lang/Object;

    check-cast v5, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->getAndSet(Z)Z

    move-result v5

    if-nez v5, :cond_8a

    iget-object v5, v1, Ltah;->f:Ljava/lang/Object;

    check-cast v5, Ltc4;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-boolean v3, v5, Ltc4;->g:Z

    iget-object v6, v5, Ltc4;->b:Ljava/lang/Object;

    monitor-enter v6

    :try_start_29
    iput-object v2, v5, Ltc4;->c:Lhf4;

    sget-object v7, Ll08;->a:Ll08;

    iput-object v7, v5, Ltc4;->d:Ll08;

    iput-boolean v3, v5, Ltc4;->f:Z

    iget-object v5, v5, Ltc4;->e:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->clear()V
    :try_end_36
    .catchall {:try_start_29 .. :try_end_36} :catchall_b6

    monitor-exit v6

    iget-object v5, v1, Ltah;->g:Ljava/lang/Object;

    check-cast v5, Lxf2;

    iget-object v6, v5, Lxf2;->h:Ljava/lang/Object;

    check-cast v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v6, v4, v3}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v3

    if-eqz v3, :cond_50

    iget-object v3, v5, Lxf2;->i:Ljava/lang/Object;

    check-cast v3, Ld3k;

    if-eqz v3, :cond_4e

    invoke-virtual {v3, v2}, Lxob;->k(Ljava/util/concurrent/CancellationException;)V

    :cond_4e
    iput-object v2, v5, Lxf2;->i:Ljava/lang/Object;

    :cond_50
    iget-object v3, v1, Ltah;->c:Ljava/lang/Object;

    check-cast v3, Lzyk;

    invoke-virtual {v3}, Lzyk;->isInitialized()Z

    move-result v3

    if-eqz v3, :cond_8a

    iget-object v1, v1, Ltah;->c:Ljava/lang/Object;

    check-cast v1, Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqe4;

    iget-object v3, v1, Lqe4;->c:Ljava/lang/Object;

    monitor-enter v3

    :try_start_67
    iget-boolean v5, v1, Lqe4;->d:Z

    if-nez v5, :cond_7e

    iget-object v5, v1, Lqe4;->a:Lia6;

    iget-object v5, v5, Lia6;->e:Ljava/lang/Object;

    check-cast v5, Lm7h;

    invoke-interface {v5}, Ln7h;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lve4;

    invoke-virtual {v5}, Lve4;->b()V

    iput-boolean v4, v1, Lqe4;->d:Z
    :try_end_7c
    .catchall {:try_start_67 .. :try_end_7c} :catchall_86

    monitor-exit v3

    goto :goto_8a

    :cond_7e
    :try_start_7e
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string v0, "Check failed."

    invoke-direct {p0, v0}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_86
    .catchall {:try_start_7e .. :try_end_86} :catchall_86

    :catchall_86
    move-exception v0

    move-object p0, v0

    monitor-exit v3

    throw p0

    :cond_8a
    :goto_8a
    iget-object v1, v0, Lwg4;->f:Landroid/os/HandlerThread;

    if-eqz v1, :cond_b2

    iget-object v1, v0, Lwg4;->d:Ljava/util/concurrent/Executor;

    instance-of v3, v1, Lbd4;

    if-eqz v3, :cond_ad

    check-cast v1, Lbd4;

    iget-object v3, v1, Lbd4;->a:Ljava/lang/Object;

    monitor-enter v3

    :try_start_99
    iget-object v4, v1, Lbd4;->b:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-interface {v4}, Ljava/util/concurrent/ExecutorService;->isShutdown()Z

    move-result v4

    if-nez v4, :cond_a6

    iget-object v1, v1, Lbd4;->b:Ljava/util/concurrent/ScheduledThreadPoolExecutor;

    invoke-virtual {v1}, Ljava/util/concurrent/ScheduledThreadPoolExecutor;->shutdown()V

    :cond_a6
    monitor-exit v3

    goto :goto_ad

    :goto_a8
    monitor-exit v3
    :try_end_a9
    .catchall {:try_start_99 .. :try_end_a9} :catchall_aa

    throw p0

    :catchall_aa
    move-exception v0

    move-object p0, v0

    goto :goto_a8

    :cond_ad
    :goto_ad
    iget-object v0, v0, Lwg4;->f:Landroid/os/HandlerThread;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->quit()Z

    :cond_b2
    invoke-virtual {p0, v2}, Ll94;->b(Ljava/lang/Object;)Z

    return-void

    :catchall_b6
    move-exception v0

    move-object p0, v0

    monitor-exit v6

    throw p0

    :pswitch_ba
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lqp5;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lum2;

    invoke-interface {v0, p0}, Lqp5;->accept(Ljava/lang/Object;)V

    return-void

    :pswitch_c6
    invoke-direct {p0}, Lbi2;->a()V

    return-void

    :pswitch_ca
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lxd4;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lk9;

    invoke-interface {v0}, Lud4;->b()Lekc;

    move-result-object v0

    invoke-virtual {v0, p0}, Lekc;->k(Lf7f;)V

    return-void

    :pswitch_da
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lzd4;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lf7f;

    invoke-interface {v0}, Lzd4;->g()Lxd4;

    move-result-object v0

    invoke-interface {v0}, Lud4;->b()Lekc;

    move-result-object v0

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    return-void

    :pswitch_ee
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Laf4;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/Set;

    iget-object v0, v0, Laf4;->a:Lp12;

    invoke-static {}, Lxug;->i()V

    iget-object v1, v0, Lp12;->b:Ljava/lang/Object;

    monitor-enter v1

    :try_start_fe
    invoke-interface {p0}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_102
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_153

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ltd4;

    iget-object v4, v0, Lp12;->g:Ljava/lang/Object;

    check-cast v4, Ljava/util/HashMap;

    invoke-virtual {v4}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v4

    check-cast v4, Ljava/lang/Iterable;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v4

    :cond_121
    :goto_121
    invoke-interface {v4}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_13c

    invoke-interface {v4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    move-object v7, v6

    check-cast v7, Ltd4;

    iget-object v7, v7, Ltd4;->a:Ljava/util/ArrayList;

    iget-object v8, v2, Ltd4;->a:Ljava/util/ArrayList;

    invoke-virtual {v7, v8}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_121

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_121

    :cond_13c
    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v2

    move v4, v3

    :goto_141
    if-ge v4, v2, :cond_102

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v4, v4, 0x1

    check-cast v6, Ltd4;

    iget-object v7, v0, Lp12;->g:Ljava/lang/Object;

    check-cast v7, Ljava/util/HashMap;

    invoke-virtual {v7, v6}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;
    :try_end_152
    .catchall {:try_start_fe .. :try_end_152} :catchall_155

    goto :goto_141

    :cond_153
    monitor-exit v1

    return-void

    :catchall_155
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :pswitch_159
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Llg4;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Landroid/hardware/camera2/CameraCaptureSession;

    iget-object v0, v0, Llg4;->a:Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;

    const/4 v1, -0x1

    invoke-virtual {v0, p0, v1}, Landroid/hardware/camera2/CameraCaptureSession$CaptureCallback;->onCaptureSequenceAborted(Landroid/hardware/camera2/CameraCaptureSession;I)V

    return-void

    :pswitch_168
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lorg/chromium/base/Callback;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    invoke-interface {v0, p0}, Lorg/chromium/base/Callback;->c(Ljava/lang/Object;)V

    return-void

    :pswitch_172
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/BrowserFragment;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lb2l;

    iget-object v1, v0, Lcom/opera/android/browser/BrowserFragment;->s:Lpx3;

    check-cast p0, Ld7l;

    invoke-virtual {p0, v1}, Ld7l;->s0(La2l;)V

    invoke-virtual {v0, v3}, Lcom/opera/android/browser/BrowserFragment;->h0(Z)V

    return-void

    :pswitch_185
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Ltw3;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lbk5;

    new-instance v1, Lt77;

    iget-object v0, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v3, Lx79;

    iget-object v4, v0, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-eqz v4, :cond_198

    move-object v2, v4

    :cond_198
    iget-object v4, v0, Ldx3;->o:Lqim;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v5, Lhe;

    const/4 v6, 0x2

    invoke-direct {v5, p0, v6}, Lhe;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v2, v3, Lx79;->a:Ljava/lang/Object;

    iput-object v4, v3, Lx79;->b:Ljava/lang/Object;

    iput-object v0, v3, Lx79;->c:Ljava/lang/Object;

    iput-object v5, v3, Lx79;->d:Ljava/lang/Object;

    invoke-direct {v1, v0, p0, v3}, Lt77;-><init>(Lndc;Lbk5;Lx79;)V

    return-void

    :pswitch_1b2
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ldnb;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0, v4}, Lcom/opera/android/BrowserActivity;->o1(I)V

    invoke-virtual {p0}, Ldnb;->run()V

    return-void

    :pswitch_1c3
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lbi2;

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v1

    if-eqz v1, :cond_1e3

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->w0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lc8l;

    new-instance v2, Lrv3;

    invoke-direct {v2, p0, p0, v3}, Lrv3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1, v2}, Lc8l;->b(Lb2l;Lw7l;)V

    :cond_1e3
    return-void

    :pswitch_1e4
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Ld7l;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    if-eqz v0, :cond_200

    iget-boolean v1, v0, Ld7l;->m:Z

    if-nez v1, :cond_200

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0, v4}, Lcom/opera/android/BrowserActivity;->o1(I)V

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz p0, :cond_1fc

    move-object v2, p0

    :cond_1fc
    const/4 p0, 0x3

    invoke-virtual {v2, v0, p0}, Lk6l;->C(Lb2l;I)V

    :cond_200
    return-void

    :pswitch_201
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lp6l;

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->v0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv9l;

    new-instance v2, Lkm5;

    iget-object v5, v0, Lv9l;->a:Lndc;

    invoke-interface {v5}, Lndc;->getLifecycle()Ltcc;

    move-result-object v6

    iget-object v5, v0, Lv9l;->d:Lumi;

    sget-object v7, Lpn7;->b:Lon7;

    const/16 v7, 0xc8

    sget-object v8, Lun7;->d:Lun7;

    invoke-static {v7, v8}, Lcs5;->x0(ILun7;)J

    move-result-wide v7

    new-instance v9, Leek;

    const/16 v10, 0xb

    invoke-direct {v9, v0, p0, v10}, Leek;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    iput-object v9, v2, Lkm5;->c:Ljava/lang/Object;

    new-instance v9, Ldnb;

    const/16 v10, 0x9

    invoke-direct {v9, v2, v10}, Ldnb;-><init>(Ljava/lang/Object;B)V

    new-instance v10, Lq65;

    invoke-direct {v10, v9, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    invoke-static {v7, v8}, Lpn7;->f(J)J

    move-result-wide v7

    sget-object v1, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    invoke-virtual {v10, v5, v7, v8, v1}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    iput-object v10, v2, Lkm5;->d:Ljava/lang/Object;

    new-instance v8, Lwcc;

    invoke-direct {v8, v2, v3}, Lwcc;-><init>(Lkm5;B)V

    new-instance v9, Lwcc;

    invoke-direct {v9, v2, v4}, Lwcc;-><init>(Lkm5;B)V

    const/4 v10, 0x0

    const/16 v11, 0x9

    const/4 v7, 0x0

    invoke-static/range {v6 .. v11}, Loup;->l0(Ltcc;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;Lkotlin/jvm/functions/Function1;I)V

    iget-object v1, v0, Lv9l;->w:Lkm5;

    if-eqz v1, :cond_260

    invoke-virtual {v1}, Lkm5;->cancel()V

    :cond_260
    iput-object v2, v0, Lv9l;->w:Lkm5;

    iget-object v1, v0, Lv9l;->s:Lyqa;

    iget-object v1, v1, Lyqa;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Lcom/opera/android/BrowserActivity;->w0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lc8l;

    iget-object v3, v0, Lv9l;->h:Lk6l;

    invoke-virtual {v3}, Lk6l;->A()Lb2l;

    move-result-object v3

    new-instance v4, Lu9l;

    invoke-direct {v4, v2, v0, p0}, Lu9l;-><init>(Lkm5;Lv9l;Lp6l;)V

    invoke-virtual {v1, v3, v4}, Lc8l;->b(Lb2l;Lw7l;)V

    return-void

    :pswitch_27f
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lesg;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lbn7;

    iget-object v0, v0, Lesg;->c:Ljava/lang/Object;

    check-cast v0, Lhom;

    new-instance v1, Lvy;

    invoke-direct {v1, p0, v4}, Lvy;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lno7;->g(Lmo7;)V

    return-void

    :pswitch_294
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lks3;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v1, "https://crashstats-collector.opera.com/collector/submit"

    new-instance v2, Lhvj;

    invoke-direct {v2, v0}, Lhvj;-><init>(Lks3;)V

    :try_start_2a6
    new-instance v0, Ljava/net/URL;

    invoke-direct {v0, v1}, Ljava/net/URL;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v0}, Lhvj;->h(Ljava/net/URL;)V

    invoke-virtual {v2, p0}, Lhvj;->m(Ljava/util/HashMap;)V

    invoke-virtual {v2}, Lhvj;->l()V
    :try_end_2b4
    .catch Ljava/io/IOException; {:try_start_2a6 .. :try_end_2b4} :catch_2bb
    .catchall {:try_start_2a6 .. :try_end_2b4} :catchall_2b5

    goto :goto_2bb

    :catchall_2b5
    move-exception v0

    move-object p0, v0

    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    throw p0

    :catch_2bb
    :goto_2bb
    invoke-static {v2}, Lxvg;->l(Ljava/io/Closeable;)V

    return-void

    :pswitch_2bf
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lzie;

    iget-object v0, v0, Lcom/opera/android/browser/blocklist/bridge/BlockListRepositoryBridge;->c:Li7f;

    new-instance v1, Lpv1;

    invoke-direct {v1, p0, v4}, Lpv1;-><init>(Ljava/lang/Object;B)V

    invoke-interface {v0, v1}, Ljava/lang/Iterable;->forEach(Ljava/util/function/Consumer;)V

    return-void

    :pswitch_2d2
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lth3;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Llc6;

    iget-boolean v1, v0, Lth3;->e:Z

    if-nez v1, :cond_2fa

    sget-object v1, Lzv5;->a:Lorg/chromium/mojo/system/impl/CoreImpl;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Lorg/chromium/mojo/system/impl/WatcherImpl;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    invoke-static {}, LJ/N;->MXGgOw9k()J

    move-result-wide v2

    iput-wide v2, v1, Lorg/chromium/mojo/system/impl/WatcherImpl;->a:J

    sget-object v2, Lyv5;->b:Lyv5;

    new-instance v3, Lva2;

    const/16 v4, 0xf

    invoke-direct {v3, v0, v4}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, p0, v2, v3}, Lorg/chromium/mojo/system/impl/WatcherImpl;->a(Lw6a;Lyv5;Lpnn;)V

    :cond_2fa
    return-void

    :pswitch_2fb
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lth3;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lk8e;

    iget-boolean v1, v0, Lth3;->e:Z

    if-nez v1, :cond_30c

    iget p0, p0, Lk8e;->a:I

    invoke-virtual {v0, p0}, Lth3;->l(I)V

    :cond_30c
    return-void

    :pswitch_30d
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lp43;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/Runnable;

    iget-boolean v0, v0, Lp43;->e:Z

    if-nez v0, :cond_31c

    invoke-interface {p0}, Ljava/lang/Runnable;->run()V

    :cond_31c
    return-void

    :pswitch_31d
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lp43;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lq43;

    iget-object v0, v0, Lp43;->a:Lcom/opera/api/Callback;

    invoke-interface {v0, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_32b
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lpr;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lli8;

    iget-object v1, v0, Lpr;->f:Ljava/lang/Object;

    invoke-virtual {p0, v1}, Lli8;->apply(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p0

    iput-object p0, v0, Lpr;->f:Ljava/lang/Object;

    new-instance v1, Lw03;

    invoke-direct {v1, v0, p0, v4}, Lw03;-><init>(Lpr;Ljava/lang/Object;B)V

    iget-object p0, v0, Lpr;->c:Ljava/lang/Object;

    check-cast p0, Lszk;

    iget-object v0, p0, Lszk;->a:Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/Handler;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-virtual {v0}, Landroid/os/Looper;->getThread()Ljava/lang/Thread;

    move-result-object v0

    invoke-virtual {v0}, Ljava/lang/Thread;->isAlive()Z

    move-result v0

    if-eqz v0, :cond_357

    invoke-virtual {p0, v1}, Lszk;->c(Ljava/lang/Runnable;)V

    :cond_357
    return-void

    :pswitch_358
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/AutofillManager;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ll25;

    iget-object v1, v0, Lcom/opera/android/autofill/AutofillManager;->a:Lnrl;

    iget-boolean v2, v1, Lnrl;->a:Z

    if-eqz v2, :cond_372

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v0}, LJ/N;->M_nAabU4(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Ll25;->run(Ljava/lang/Object;)V

    goto :goto_37b

    :cond_372
    new-instance v2, Lbi2;

    const/4 v3, 0x7

    invoke-direct {v2, v0, p0, v3}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    :goto_37b
    return-void

    :pswitch_37c
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/AutofillManager;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/autofill/Address;

    invoke-virtual {v0, p0}, Lcom/opera/android/autofill/AutofillManager;->g(Lcom/opera/android/autofill/Address;)V

    return-void

    :pswitch_388
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/autofill/CreditCard;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-static {v0, p0}, LJ/N;->MFIUe29u(Ljava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_394
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Ltw2;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lpzh;

    iget-object v0, v0, Ltw2;->b:Ljava/lang/Object;

    check-cast v0, Lyi2;

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v2, "Error: "

    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget p0, p0, Lpzh;->d:I

    invoke-virtual {v1, p0}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Lyi2;->i(Ljava/lang/String;)V

    return-void

    :pswitch_3b4
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Ltw2;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    iget-object v0, v0, Ltw2;->b:Ljava/lang/Object;

    check-cast v0, Lyi2;

    invoke-virtual {v0, p0}, Lyi2;->i(Ljava/lang/String;)V

    return-void

    :pswitch_3c4
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lli2;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Lei2;

    iput-object v2, v0, Lli2;->i:Lih4;

    iget-boolean p0, p0, Lei2;->b:Z

    if-eqz p0, :cond_3fc

    new-instance p0, Lq02;

    const/16 v2, 0x11

    invoke-direct {p0, v0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    new-instance v2, Lji2;

    invoke-direct {v2, v0, v4}, Lji2;-><init>(Lli2;B)V

    iget-object v3, v0, Lhi2;->a:Lmyk;

    iget-object v3, v3, Lmyk;->b:Ldb;

    invoke-virtual {v3}, Ldb;->f()Z

    move-result v5

    if-eqz v5, :cond_3f2

    invoke-virtual {v3, v4, p0, v2}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    move-result-object p0

    new-instance v2, Lcrk;

    invoke-direct {v2, p0, v1}, Lcrk;-><init>(Ljava/lang/Object;B)V

    goto :goto_3f9

    :cond_3f2
    const-string p0, "Not signed in"

    invoke-virtual {v2, p0}, Lji2;->run(Ljava/lang/Object;)V

    sget-object v2, Lbf9;->A:Lbxl;

    :goto_3f9
    iput-object v2, v0, Lli2;->i:Lih4;

    goto :goto_3ff

    :cond_3fc
    invoke-virtual {v0}, Lli2;->r()V

    :goto_3ff
    return-void

    :pswitch_400
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lkyk;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Llv5;

    invoke-virtual {v0, p0}, Lkyk;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_40c
    iget-object v0, p0, Lbi2;->b:Ljava/lang/Object;

    check-cast v0, Lfi2;

    iget-object p0, p0, Lbi2;->c:Ljava/lang/Object;

    check-cast p0, Ljava/lang/String;

    invoke-virtual {v0, p0}, Lfi2;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_data_418
    .packed-switch 0x0
        :pswitch_40c
        :pswitch_400
        :pswitch_3c4
        :pswitch_3b4
        :pswitch_394
        :pswitch_388
        :pswitch_37c
        :pswitch_358
        :pswitch_32b
        :pswitch_31d
        :pswitch_30d
        :pswitch_2fb
        :pswitch_2d2
        :pswitch_2bf
        :pswitch_294
        :pswitch_27f
        :pswitch_201
        :pswitch_1e4
        :pswitch_1c3
        :pswitch_1b2
        :pswitch_185
        :pswitch_172
        :pswitch_168
        :pswitch_159
        :pswitch_ee
        :pswitch_da
        :pswitch_ca
        :pswitch_c6
        :pswitch_ba
    .end packed-switch
.end method
