.class public final synthetic Le6g;
.super Lnr9;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B


# direct methods
.method public synthetic constructor <init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V
    .registers 8

    iput-byte p7, p0, Le6g;->a:B

    invoke-direct/range {p0 .. p6}, Lmr9;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;I)V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 12

    iget-byte v0, p0, Le6g;->a:B

    sget-object v1, Liz5;->a:Liz5;

    const-string v2, "rewards.onboarding_seen"

    const/4 v3, 0x1

    const/4 v4, 0x3

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_352

    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    check-cast p0, Lg1k;

    iget-object v0, p0, Lg1k;->f:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lb2h;

    if-nez v0, :cond_25

    invoke-virtual {p0, v5}, Lg1k;->h(Ljava/lang/Throwable;)V

    iget-object p0, p0, Lg1k;->h:Lnak;

    invoke-virtual {p0, v5}, Lnak;->j(Ljava/lang/Object;)V

    goto :goto_33

    :cond_25
    invoke-static {p0}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v1

    new-instance v2, Lr8h;

    const/16 v3, 0x10

    invoke-direct {v2, p0, v0, v5, v3}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v1, v5, v5, v2, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :goto_33
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_36
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    check-cast p0, Lg1k;

    iget-object p0, p0, Lg1k;->h:Lnak;

    invoke-virtual {p0, v5}, Lnak;->j(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_44
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    move-object v6, p0

    check-cast v6, Lg1k;

    iget-object p0, v6, Lg1k;->e:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v8, p0

    check-cast v8, Ld2h;

    iget-object p0, v6, Lg1k;->f:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v7, p0

    check-cast v7, Lb2h;

    const/4 v9, 0x0

    if-eqz v8, :cond_71

    if-eqz v7, :cond_71

    invoke-static {v6}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object p0

    new-instance v5, Lmz9;

    const/16 v10, 0x1b

    invoke-direct/range {v5 .. v10}, Lmz9;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {p0, v9, v9, v5, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_74

    :cond_71
    invoke-virtual {v6, v9}, Lg1k;->h(Ljava/lang/Throwable;)V

    :goto_74
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_77
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lb1k;

    check-cast p0, Lg1k;

    iget-object p0, p0, Lg1k;->c:Lc1k;

    iget-object p0, p0, Lc1k;->a:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_87
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lvcj;

    iget-object v0, p0, Lvcj;->e:Lqn;

    if-eqz v0, :cond_95

    invoke-virtual {p0}, Ldej;->b()V

    invoke-virtual {v0}, Lqn;->run()V

    :cond_95
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_98
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    iget-object p0, p0, Lqsi;->b:Lg8j;

    iget-object p0, p0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserAppWidget;->b:I

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {p0}, Lcom/opera/android/BrowserAppWidget;->d(Landroid/content/Context;)I

    move-result p0

    const v1, 0x7f0d039e

    const-class v2, Lcom/opera/android/BrowserAppWidget;

    invoke-static {v0, v2, p0, v1}, Lkfo;->c0(Landroid/content/Context;Ljava/lang/Class;II)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b5
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    iget-object p0, p0, Lqsi;->b:Lg8j;

    const v0, 0x7f0a09be

    filled-new-array {v0}, [I

    move-result-object v0

    invoke-virtual {p0, v0}, Lg8j;->c([I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_c8
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    iget-object v0, p0, Lqsi;->b:Lg8j;

    iget-object p0, p0, Lqsi;->d:Lpsi;

    iget-object p0, p0, Lpsi;->m:Lr9g;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lg8j;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v1

    const-string v2, "com.opera.android.FRAGMENT_MANAGER_SERVICE"

    invoke-virtual {v0, v2}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/w;

    if-eqz v2, :cond_11f

    iget-object v2, v2, Landroidx/fragment/app/w;->c:Landroidx/fragment/app/a0;

    invoke-virtual {v2}, Landroidx/fragment/app/a0;->f()Ljava/util/List;

    move-result-object v2

    if-eqz v2, :cond_11f

    invoke-static {v2}, Lkotlin/collections/CollectionsKt;->Q(Ljava/util/List;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroidx/fragment/app/Fragment;

    if-eqz v2, :cond_11f

    invoke-static {v2}, Lvtp;->M(Landroidx/fragment/app/Fragment;)Z

    move-result v2

    if-nez v2, :cond_11f

    const-string v2, "com.opera.android.ui.SHEET_QUEUE_SERVICE"

    invoke-virtual {v0, v2}, Lt5d;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnej;

    const v4, 0x7f140fc2

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    new-instance v4, Lim6;

    invoke-direct {v4, v0, v1, p0, v3}, Lim6;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p0, Lijm;->b:Lijm;

    invoke-virtual {v2, v4, p0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_11f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_122
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lqsi;

    iget-object p0, p0, Lqsi;->b:Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_12e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lisi;

    invoke-virtual {p0}, Lisi;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_138
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ly5i;

    iget-object v0, p0, Ly5i;->a:La64;

    if-nez v0, :cond_141

    move-object v0, v5

    :cond_141
    invoke-static {v0, v5}, Lsgb;->k(Lnx5;Ljava/util/concurrent/CancellationException;)V

    iget-object v0, p0, Ly5i;->f:Lpjb;

    if-nez v0, :cond_149

    move-object v0, v5

    :cond_149
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Ly5i;->e:Lxbf;

    if-eqz p0, :cond_151

    move-object v5, p0

    :cond_151
    iget-object p0, v5, Lxbf;->e:Ljava/lang/Object;

    check-cast p0, Ll3g;

    invoke-interface {p0}, Ljava/lang/AutoCloseable;->close()V

    iget-object p0, v5, Lxbf;->f:Ljava/lang/Object;

    check-cast p0, Lqsk;

    if-eqz p0, :cond_161

    invoke-interface {p0}, Ljava/io/Closeable;->close()V

    :cond_161
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_164
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lf4i;

    iget-object p0, p0, Lf4i;->a:Llw3;

    iget-object p0, p0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_181
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lf4i;

    iget-object p0, p0, Lf4i;->a:Llw3;

    iget-object p0, p0, Llw3;->b:Lcom/opera/android/OperaApplication;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v0, v2, v3}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_19e
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object p0, p0, Lh3i;->c:Lu2i;

    iget-object p0, p0, Lu2i;->b:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ae
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object p0, p0, Lh3i;->g:Lnak;

    invoke-virtual {p0, v5}, Lnak;->j(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1bc
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object v0, p0, Lh3i;->f:Lnak;

    invoke-virtual {v0, v5}, Lnak;->j(Ljava/lang/Object;)V

    iget-object p0, p0, Lh3i;->c:Lu2i;

    iget-object p0, p0, Lu2i;->d:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1d1
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object p0, p0, Lh3i;->f:Lnak;

    invoke-virtual {p0, v5}, Lnak;->j(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1df
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object v0, p0, Lh3i;->h:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v1

    instance-of v2, v1, Lhz5;

    if-eqz v2, :cond_1f2

    check-cast v1, Lhz5;

    goto :goto_1f3

    :cond_1f2
    move-object v1, v5

    :goto_1f3
    if-eqz v1, :cond_238

    iget-object v2, v1, Lhz5;->b:Lnz5;

    iget-object v2, v2, Lnz5;->f:Lec;

    if-eqz v2, :cond_238

    iget-object v3, v2, Lec;->b:Lgpm;

    sget-object v4, Lje8;->g:Lje8;

    iget-object v1, v1, Lhz5;->a:Ljava/lang/String;

    invoke-virtual {p0, v4, v1}, Lh3i;->k(Lje8;Ljava/lang/String;)V

    invoke-virtual {v0, v5}, Lnak;->j(Ljava/lang/Object;)V

    iget-object v0, p0, Lh3i;->c:Lu2i;

    iget-object v0, v0, Lu2i;->a:Lo7i;

    iget-object v1, v2, Lec;->c:Lcc;

    invoke-virtual {v0, v3, v1}, Lo7i;->invoke(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lt0i;

    iget-object v0, v0, Lt0i;->a:Ljava/lang/Object;

    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v0

    if-eqz v0, :cond_238

    iget-object p0, p0, Lh3i;->l:Lnak;

    sget-object v1, Lahk;->d0:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lshk;

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v2

    new-instance v3, Ludk;

    invoke-direct {v3, v1, v2}, Ludk;-><init>(Lshk;Ljava/util/List;)V

    invoke-static {v3, v0}, Lhn9;->v(Lsdk;Ljava/lang/Throwable;)Ldum;

    move-result-object v0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, v5, v0}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    :cond_238
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23b
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object v0, p0, Lh3i;->h:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    instance-of v1, v0, Lhz5;

    if-eqz v1, :cond_24e

    move-object v5, v0

    check-cast v5, Lhz5;

    :cond_24e
    if-eqz v5, :cond_257

    sget-object v0, Lje8;->f:Lje8;

    iget-object v1, v5, Lhz5;->a:Ljava/lang/String;

    invoke-virtual {p0, v0, v1}, Lh3i;->k(Lje8;Ljava/lang/String;)V

    :cond_257
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_25a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object v0, p0, Lh3i;->h:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v2

    instance-of v3, v2, Ljz5;

    if-eqz v3, :cond_26d

    check-cast v2, Ljz5;

    goto :goto_26e

    :cond_26d
    move-object v2, v5

    :goto_26e
    if-eqz v2, :cond_287

    sget-object v3, Lje8;->b:Lje8;

    iget-object v6, v2, Ljz5;->a:Ljava/lang/String;

    invoke-virtual {p0, v3, v6}, Lh3i;->k(Lje8;Ljava/lang/String;)V

    invoke-virtual {v0, v5, v1}, Lnak;->k(Ljava/lang/Object;Ljava/lang/Object;)Z

    invoke-static {p0}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v0

    new-instance v1, Lr8h;

    const/4 v3, 0x5

    invoke-direct {v1, p0, v2, v5, v3}, Lr8h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v0, v5, v5, v1, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_287
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_28a
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lt2i;

    check-cast p0, Lh3i;

    iget-object p0, p0, Lh3i;->h:Lnak;

    invoke-virtual {p0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    invoke-static {v0, v1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_29f

    invoke-virtual {p0, v5}, Lnak;->j(Ljava/lang/Object;)V

    :cond_29f
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a2
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Ls3i;

    invoke-virtual {p0}, Lryl;->g0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2ac
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lbng;

    check-cast p0, Lhng;

    iget-object p0, p0, Lhng;->e:Lt3e;

    new-instance v0, Lza8;

    sget-object v1, Lve8;->b:Lve8;

    invoke-direct {v0, v1}, Lza8;-><init>(Lve8;)V

    check-cast p0, Lh5e;

    invoke-virtual {p0, v0}, Lh5e;->t(Lfb8;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c3
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lbng;

    check-cast p0, Lhng;

    iget-object v0, p0, Lhng;->q:Lnak;

    :cond_2cb
    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object p0

    move-object v1, p0

    check-cast v1, Lfum;

    invoke-virtual {v0, p0, v5}, Lnak;->h(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_2cb

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2db
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lbng;

    check-cast p0, Lhng;

    iget-object p0, p0, Lhng;->n:Lnak;

    invoke-virtual {p0, v5}, Lnak;->j(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2e9
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lbng;

    check-cast p0, Lhng;

    iget-object v0, p0, Lhng;->m:Lhdg;

    iget-object v1, v0, Lhdg;->b:Lt0g;

    invoke-virtual {v1}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ley5;

    if-eqz v1, :cond_2fe

    iget-object v1, v1, Ley5;->b:Ljava/lang/String;

    goto :goto_300

    :cond_2fe
    const-string v1, ""

    :goto_300
    iget-object v0, v0, Lhdg;->a:Lt0g;

    invoke-virtual {v0}, Lt0g;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-static {v1, v0}, Lsko;->j(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {p0}, Lo0g;->Q(Lae5;)Lnx5;

    move-result-object v1

    new-instance v2, Lhz1;

    const/16 v3, 0x17

    invoke-direct {v2, p0, v0, v5, v3}, Lhz1;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    invoke-static {v1, v5, v5, v2, v4}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_31d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lbng;

    check-cast p0, Lhng;

    iget-object p0, p0, Lhng;->c:Ldng;

    iget-object p0, p0, Ldng;->a:Ln7i;

    invoke-virtual {p0}, Ln7i;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_32d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lwf5;

    check-cast p0, Lxf5;

    iget-object p0, p0, Lxf5;->a:Lyf5;

    sget-object v0, Lhjm;->b:Lhjm;

    invoke-virtual {p0, v0}, Ld63;->finish(Lhjm;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_33d
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lk6g;

    invoke-virtual {p0}, Lk6g;->a()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_347
    iget-object p0, p0, Lz84;->receiver:Ljava/lang/Object;

    check-cast p0, Lf6g;

    invoke-virtual {p0}, Lf6g;->H0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_352
    .packed-switch 0x0
        :pswitch_347
        :pswitch_33d
        :pswitch_32d
        :pswitch_31d
        :pswitch_2e9
        :pswitch_2db
        :pswitch_2c3
        :pswitch_2ac
        :pswitch_2a2
        :pswitch_28a
        :pswitch_25a
        :pswitch_23b
        :pswitch_1df
        :pswitch_1d1
        :pswitch_1bc
        :pswitch_1ae
        :pswitch_19e
        :pswitch_181
        :pswitch_164
        :pswitch_138
        :pswitch_12e
        :pswitch_122
        :pswitch_c8
        :pswitch_b5
        :pswitch_98
        :pswitch_87
        :pswitch_77
        :pswitch_44
        :pswitch_36
    .end packed-switch
.end method
