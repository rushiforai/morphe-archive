.class public final synthetic Li61;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;

.field public final synthetic c:Ljava/lang/Object;

.field public final synthetic d:Ljava/lang/Object;

.field public final synthetic e:Ljava/lang/Object;

.field public final synthetic f:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    iput-byte p6, p0, Li61;->a:B

    iput-object p1, p0, Li61;->b:Ljava/lang/Object;

    iput-object p2, p0, Li61;->c:Ljava/lang/Object;

    iput-object p3, p0, Li61;->d:Ljava/lang/Object;

    iput-object p4, p0, Li61;->e:Ljava/lang/Object;

    iput-object p5, p0, Li61;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/String;Ljava/lang/Object;Ljava/lang/Object;B)V
    .registers 7

    .line 16
    iput-byte p6, p0, Li61;->a:B

    iput-object p1, p0, Li61;->b:Ljava/lang/Object;

    iput-object p2, p0, Li61;->d:Ljava/lang/Object;

    iput-object p3, p0, Li61;->c:Ljava/lang/Object;

    iput-object p4, p0, Li61;->e:Ljava/lang/Object;

    iput-object p5, p0, Li61;->f:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 15

    iget-byte v0, p0, Li61;->a:B

    sget-object v1, Lijm;->b:Lijm;

    const/16 v2, 0xf

    const/4 v3, 0x0

    iget-object v4, p0, Li61;->f:Ljava/lang/Object;

    iget-object v5, p0, Li61;->e:Ljava/lang/Object;

    iget-object v6, p0, Li61;->d:Ljava/lang/Object;

    iget-object v7, p0, Li61;->c:Ljava/lang/Object;

    iget-object p0, p0, Li61;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1ae

    check-cast p0, Lw6j;

    check-cast v7, Landroid/widget/ProgressBar;

    check-cast v6, Lcom/opera/ad/interstitial/AdActivity;

    check-cast v5, Lobn;

    check-cast v4, Lg94;

    invoke-static {v6}, Lbbp;->g(Landroid/content/Context;)Landroid/graphics/drawable/StateListDrawable;

    move-result-object v0

    invoke-virtual {v7, v0}, Landroid/widget/ProgressBar;->setProgressDrawable(Landroid/graphics/drawable/Drawable;)V

    invoke-virtual {v7, v3}, Landroid/view/View;->setBackgroundColor(I)V

    invoke-virtual {v7, v5}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p0, p0, Lw6j;->e:Ljava/lang/Object;

    check-cast p0, Luuj;

    iget-object p0, p0, Luuj;->b:Ljava/lang/Object;

    check-cast p0, Lahb;

    invoke-interface {v4, p0}, Lg94;->l(Ljava/lang/Object;)V

    return-void

    :pswitch_37
    check-cast p0, Lqln;

    check-cast v7, Lx5f;

    move-object v9, v6

    check-cast v9, Leej;

    check-cast v5, Lwt3;

    move-object v8, v4

    check-cast v8, Ld8j;

    sget-object v0, Lpk5;->n:Lxq3;

    if-nez v0, :cond_71

    invoke-virtual {v5}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    sget-object v4, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v0, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_71

    new-instance v0, Lcpj;

    const/16 v4, 0x9

    invoke-direct {v0, v4}, Lcpj;-><init>(B)V

    new-instance v5, Lpk5;

    iget-object v10, v9, Leej;->c:Lgjm;

    move-object v6, p0

    invoke-direct/range {v5 .. v10}, Lpk5;-><init>(Lqln;Lx5f;Ld8j;Leej;Lgjm;)V

    new-instance p0, Lxq3;

    invoke-direct {p0, v2, v5, v0, v3}, Lxq3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v0, v9, Leej;->a:Lnej;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    sput-object p0, Lpk5;->n:Lxq3;

    :cond_71
    return-void

    :pswitch_72
    check-cast p0, Lx79;

    check-cast v6, Lr2g;

    move-object v9, v7

    check-cast v9, Ljava/lang/String;

    move-object v10, v5

    check-cast v10, Ljava/lang/String;

    check-cast v4, Lv1;

    new-instance v8, Lx2g;

    iget-object v0, p0, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Landroid/content/Context;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    const-string v2, "personalized_ads"

    invoke-virtual {v1, v2}, Lcom/opera/android/settings/SettingsManager;->u(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_a5

    iget-object p0, p0, Lx79;->b:Ljava/lang/Object;

    check-cast p0, Le00;

    invoke-virtual {p0}, Le00;->b()Lc00;

    move-result-object p0

    iget-boolean p0, p0, Lc00;->b:Z

    if-nez p0, :cond_a5

    const/4 v3, 0x1

    :cond_a5
    move v13, v3

    invoke-virtual {v4}, Lv1;->x()Ljava/lang/String;

    move-result-object v11

    invoke-static {}, Li0l;->g()Z

    move-result p0

    if-eqz p0, :cond_b4

    const-string p0, "chromebook"

    :goto_b2
    move-object v12, p0

    goto :goto_c0

    :cond_b4
    invoke-static {v0}, Lcom/opera/android/utilities/DisplayUtil;->e(Landroid/content/Context;)Z

    move-result p0

    if-eqz p0, :cond_bd

    const-string p0, "tablet"

    goto :goto_b2

    :cond_bd
    const-string p0, "mobile"

    goto :goto_b2

    :goto_c0
    invoke-direct/range {v8 .. v13}, Lx2g;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    invoke-virtual {v6, v8}, Lr2g;->run(Ljava/lang/Object;)V

    return-void

    :pswitch_c7
    check-cast p0, Lydp;

    check-cast v7, Ljava/lang/String;

    check-cast v6, Lkotlin/jvm/functions/Function0;

    check-cast v5, Lode;

    check-cast v4, Ll94;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Landroid/os/Trace;->isEnabled()Z

    move-result p0

    if-eqz p0, :cond_ee

    :try_start_da
    invoke-virtual {v7}, Ljava/lang/String;->length()I

    move-result v0

    const/16 v1, 0x7f

    if-gt v0, v1, :cond_e4

    move-object v0, v7

    goto :goto_e5

    :cond_e4
    const/4 v0, 0x0

    :goto_e5
    if-nez v0, :cond_eb

    invoke-virtual {v7, v3, v1}, Ljava/lang/String;->substring(II)Ljava/lang/String;

    move-result-object v0

    :cond_eb
    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V
    :try_end_ee
    .catchall {:try_start_da .. :try_end_ee} :catchall_10c

    :cond_ee
    :try_start_ee
    invoke-interface {v6}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    sget-object v0, Lzpa;->h:Lwqf;

    invoke-virtual {v5, v0}, Lekc;->n(Ljava/lang/Object;)V

    invoke-virtual {v4, v0}, Ll94;->b(Ljava/lang/Object;)Z
    :try_end_f9
    .catchall {:try_start_ee .. :try_end_f9} :catchall_fa

    goto :goto_106

    :catchall_fa
    move-exception v0

    :try_start_fb
    new-instance v1, Lvqf;

    invoke-direct {v1, v0}, Lvqf;-><init>(Ljava/lang/Throwable;)V

    invoke-virtual {v5, v1}, Lekc;->n(Ljava/lang/Object;)V

    invoke-virtual {v4, v0}, Ll94;->d(Ljava/lang/Throwable;)Z
    :try_end_106
    .catchall {:try_start_fb .. :try_end_106} :catchall_10c

    :goto_106
    if-eqz p0, :cond_10b

    invoke-static {}, Landroid/os/Trace;->endSection()V

    :cond_10b
    return-void

    :catchall_10c
    move-exception v0

    if-eqz p0, :cond_112

    invoke-static {}, Landroid/os/Trace;->endSection()V

    :cond_112
    throw v0

    :pswitch_113
    check-cast p0, Lcom/leanplum/ActionContext;

    check-cast v6, Landroid/content/Context;

    check-cast v7, Ljava/lang/String;

    check-cast v5, Lorm;

    check-cast v4, Lskm;

    invoke-static {p0, v6, v7, v5, v4}, Lcom/leanplum/messagetemplates/OperaSheet;->c(Lcom/leanplum/ActionContext;Landroid/content/Context;Ljava/lang/String;Lorm;Lskm;)V

    return-void

    :pswitch_121
    check-cast p0, Lm7m;

    check-cast v7, Lc5j;

    check-cast v6, Lcom/google/common/util/concurrent/ListenableFuture;

    check-cast v5, Lcom/google/common/util/concurrent/ListenableFuture;

    check-cast v4, Lgg8;

    invoke-virtual {p0}, Lm4;->isDone()Z

    move-result v0

    if-eqz v0, :cond_135

    invoke-virtual {v7, v6}, Lm4;->setFutureInternal(Lcom/google/common/util/concurrent/ListenableFuture;)Z

    goto :goto_14a

    :cond_135
    invoke-interface {v5}, Ljava/util/concurrent/Future;->isCancelled()Z

    move-result v0

    if-eqz v0, :cond_14a

    sget v0, Lgg8;->e:I

    sget-object v0, Lfg8;->a:Lfg8;

    sget-object v1, Lfg8;->b:Lfg8;

    invoke-virtual {v4, v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->compareAndSet(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_14a

    invoke-virtual {p0, v3}, Lm4;->cancel(Z)Z

    :cond_14a
    :goto_14a
    return-void

    :pswitch_14b
    check-cast p0, Lvzk;

    check-cast v7, Lvl5;

    check-cast v6, Ljava/util/concurrent/atomic/AtomicBoolean;

    check-cast v5, Lwl5;

    move-object v8, v4

    check-cast v8, Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-interface {v7}, Lvl5;->run()Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v0

    new-instance v4, Lqn;

    const/4 v9, 0x6

    move-object v7, v5

    move-object v5, p0

    invoke-direct/range {v4 .. v9}, Lqn;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object p0, Lm97;->a:Lm97;

    invoke-interface {v0, v4, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    return-void

    :pswitch_168
    check-cast p0, Lok5;

    move-object v9, v7

    check-cast v9, Lqln;

    move-object v11, v6

    check-cast v11, Lorm;

    move-object v10, v5

    check-cast v10, Lnk5;

    check-cast v4, Lcom/leanplum/messagetemplates/OperaConfigBundleSheet$initializeSheetRequest$2$1;

    new-instance v0, Lf1p;

    invoke-direct {v0, v9, v4}, Lf1p;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v12, p0

    check-cast v12, Leej;

    new-instance v8, Lpk5;

    iget-object v13, v12, Leej;->c:Lgjm;

    invoke-direct/range {v8 .. v13}, Lpk5;-><init>(Lqln;Lnk5;Lorm;Leej;Lgjm;)V

    new-instance p0, Lxq3;

    invoke-direct {p0, v2, v8, v0, v3}, Lxq3;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v0, v12, Leej;->a:Lnej;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {v0, p0, v1}, Lr22;->b(Ljjm;Lijm;)V

    sput-object p0, Lpk5;->m:Lxq3;

    return-void

    :pswitch_194
    check-cast p0, Lj61;

    check-cast v7, Ljava/lang/String;

    check-cast v6, Lorg/chromium/mojo/system/impl/CoreImpl;

    check-cast v5, Ljava/util/concurrent/Executor;

    check-cast v4, Ln61;

    invoke-virtual {p0, v7, v6}, Lj61;->l(Ljava/lang/String;Lorg/chromium/mojo/system/impl/CoreImpl;)Lqkh;

    move-result-object p0

    new-instance v0, Lxa;

    const/16 v1, 0xd

    invoke-direct {v0, v4, p0, v1}, Lxa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v5, v0}, Ljava/util/concurrent/Executor;->execute(Ljava/lang/Runnable;)V

    return-void

    nop

    :pswitch_data_1ae
    .packed-switch 0x0
        :pswitch_194
        :pswitch_168
        :pswitch_14b
        :pswitch_121
        :pswitch_113
        :pswitch_c7
        :pswitch_72
        :pswitch_37
    .end packed-switch
.end method
