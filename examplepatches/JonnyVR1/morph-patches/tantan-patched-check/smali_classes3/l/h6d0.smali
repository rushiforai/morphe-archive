.class public Ll/h6d0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic a()Ll/uxj0;
    .locals 4

    .line 1
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 2
    .line 3
    if-nez v0, :cond_0

    .line 4
    .line 5
    new-instance v0, Ll/l2;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/l2;-><init>()V

    .line 8
    .line 9
    .line 10
    sput-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 11
    .line 12
    :cond_0
    invoke-static {}, Ll/h6d0;->j()Z

    .line 13
    .line 14
    .line 15
    move-result v0

    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 19
    .line 20
    invoke-virtual {v0}, Ll/l2;->a0()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    const-wide/16 v1, 0x5dc

    .line 25
    .line 26
    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    .line 27
    .line 28
    invoke-virtual {v0, v1, v2, v3}, Lrx/c;->take(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {v0}, Lrx/c;->toBlocking()Ll/o43;

    .line 33
    .line 34
    .line 35
    move-result-object v0

    .line 36
    const/4 v1, 0x0

    .line 37
    invoke-virtual {v0, v1}, Ll/o43;->c(Ljava/lang/Object;)Ljava/lang/Object;

    .line 38
    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 42
    .line 43
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    if-eqz v0, :cond_2

    .line 48
    .line 49
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/l2;->U()V

    .line 52
    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_2
    sget-object v0, Ll/uqb0;->Q:Ll/l2;

    .line 56
    .line 57
    invoke-virtual {v0}, Ll/l2;->T()V

    .line 58
    .line 59
    .line 60
    :goto_0
    sget-object v0, Ll/uxj0;->a:Ll/uxj0;

    .line 61
    .line 62
    return-object v0
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-static {}, Ll/yx0;->d()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic c(Landroid/app/Activity;Lcom/p1/mobile/putong/data/AuthData;Ljava/util/HashMap;)V
    .locals 0

    .line 1
    :try_start_0
    invoke-static {p0, p2}, Ll/h6d0;->i(Landroid/app/Activity;Ljava/util/HashMap;)V
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0
    .catchall {:try_start_0 .. :try_end_0} :catchall_0

    .line 2
    .line 3
    .line 4
    :catch_0
    sget-object p0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 5
    .line 6
    invoke-virtual {p0, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 7
    .line 8
    .line 9
    return-void

    .line 10
    :catchall_0
    move-exception p0

    .line 11
    sget-object p2, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Ll/eyd0;->l(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    throw p0
.end method

.method public static synthetic d(Ll/uxj0;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic e(Ljava/util/HashMap;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {}, Ll/uqb0;->f0()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic f(Ll/uxj0;)Ljava/util/HashMap;
    .locals 0

    .line 1
    invoke-static {}, Lcom/p1/mobile/android/app/Act;->globalLifeCycle_()Ljava/util/HashMap;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic g(Landroid/app/Activity;Ll/uxj0;)V
    .locals 0

    .line 1
    sget-object p1, Lcom/p1/mobile/android/app/App;->e:Landroid/app/Application;

    .line 2
    .line 3
    invoke-static {p1}, Lcom/p1/mobile/putong/ui/splash/SplashProxyAct;->l(Landroid/content/Context;)Landroid/content/Intent;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Landroid/app/Activity;->startActivity(Landroid/content/Intent;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static synthetic h(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static i(Landroid/app/Activity;Ljava/util/HashMap;)V
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Landroid/app/Activity;",
            "Ljava/util/HashMap<",
            "Ljava/lang/Integer;",
            "Ljava/util/ArrayList<",
            "Lcom/p1/mobile/android/app/Act$r;",
            ">;>;)V"
        }
    .end annotation

    .line 1
    if-eqz p1, :cond_2

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/util/HashMap;->size()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-lez v0, :cond_2

    .line 8
    .line 9
    invoke-virtual {p1}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    .line 14
    .line 15
    .line 16
    move-result-object p1

    .line 17
    :cond_0
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_2

    .line 22
    .line 23
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    check-cast v0, Ljava/util/ArrayList;

    .line 28
    .line 29
    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    :cond_1
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 34
    .line 35
    .line 36
    move-result v1

    .line 37
    if-eqz v1, :cond_0

    .line 38
    .line 39
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    check-cast v1, Lcom/p1/mobile/android/app/Act$r;

    .line 44
    .line 45
    iget-object v2, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 48
    .line 49
    .line 50
    move-result-object v2

    .line 51
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v2

    .line 55
    if-eqz v2, :cond_1

    .line 56
    .line 57
    iget-object v2, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 58
    .line 59
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v2

    .line 63
    if-eq v2, p0, :cond_1

    .line 64
    .line 65
    iget-object v2, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 66
    .line 67
    invoke-virtual {v2}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 68
    .line 69
    .line 70
    move-result-object v2

    .line 71
    instance-of v2, v2, Lcom/p1/mobile/android/app/Act;

    .line 72
    .line 73
    if-eqz v2, :cond_1

    .line 74
    .line 75
    iget-object v1, v1, Lcom/p1/mobile/android/app/Act$r;->a:Ljava/lang/ref/WeakReference;

    .line 76
    .line 77
    invoke-virtual {v1}, Ljava/lang/ref/Reference;->get()Ljava/lang/Object;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    check-cast v1, Lcom/p1/mobile/android/app/Act;

    .line 82
    .line 83
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finishWithoutCustomAnimation()V

    .line 84
    .line 85
    .line 86
    goto :goto_0

    .line 87
    :cond_2
    return-void
.end method

.method public static j()Z
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->e:Ll/gxd0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/eyd0;->b()Ljava/lang/Object;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/putong/app/TantanApp;->d:Ll/kxd0;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/bzd0;->b()Ljava/lang/Object;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ljava/lang/Boolean;

    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-eqz v0, :cond_0

    .line 22
    .line 23
    const/4 v0, 0x1

    .line 24
    return v0

    .line 25
    :cond_0
    const/4 v0, 0x0

    .line 26
    return v0
.end method

.method public static k(Landroid/app/Activity;Lcom/p1/mobile/putong/data/AuthData;)V
    .locals 3
    .param p0    # Landroid/app/Activity;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    const/4 v0, 0x0

    .line 2
    const/4 v1, 0x0

    .line 3
    const/4 v2, 0x1

    .line 4
    invoke-static {v2, v0, v1, v2, v1}, Ll/uqb0;->Y0(ZLjava/lang/Class;ZZZ)Lrx/c;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    new-instance v1, Ll/c6d0;

    .line 9
    .line 10
    invoke-direct {v1}, Ll/c6d0;-><init>()V

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    new-instance v1, Ll/d6d0;

    .line 18
    .line 19
    invoke-direct {v1, p0, p1}, Ll/d6d0;-><init>(Landroid/app/Activity;Lcom/p1/mobile/putong/data/AuthData;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    new-instance v0, Ll/e6d0;

    .line 27
    .line 28
    invoke-direct {v0}, Ll/e6d0;-><init>()V

    .line 29
    .line 30
    .line 31
    invoke-virtual {p1, v0}, Lrx/c;->flatMap(Ll/qcj;)Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    new-instance v0, Ll/f6d0;

    .line 36
    .line 37
    invoke-direct {v0, p0}, Ll/f6d0;-><init>(Landroid/app/Activity;)V

    .line 38
    .line 39
    .line 40
    new-instance p0, Ll/g6d0;

    .line 41
    .line 42
    invoke-direct {p0}, Ll/g6d0;-><init>()V

    .line 43
    .line 44
    .line 45
    invoke-static {v0, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static l()V
    .locals 3

    .line 1
    new-instance v0, Ll/z5d0;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/z5d0;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->fromCallable(Ljava/util/concurrent/Callable;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    new-instance v1, Ll/a6d0;

    .line 19
    .line 20
    invoke-direct {v1}, Ll/a6d0;-><init>()V

    .line 21
    .line 22
    .line 23
    new-instance v2, Ll/b6d0;

    .line 24
    .line 25
    invoke-direct {v2}, Ll/b6d0;-><init>()V

    .line 26
    .line 27
    .line 28
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 33
    .line 34
    .line 35
    return-void
.end method
