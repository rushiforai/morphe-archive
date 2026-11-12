.class public final synthetic Lpjg;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ljava/lang/Runnable;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    iput-byte p2, p0, Lpjg;->a:B

    iput-object p1, p0, Lpjg;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final run()V
    .registers 9

    iget-byte v0, p0, Lpjg;->a:B

    const/4 v1, 0x2

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x1

    iget-object p0, p0, Lpjg;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_2e2

    check-cast p0, Lnii;

    iget-object v0, p0, Lnii;->b:Landroid/view/View;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lnii;->a:Landroid/view/View;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setTranslationY(F)V

    return-void

    :pswitch_1b
    check-cast p0, Lbei;

    iget-wide v0, p0, Lbei;->a:J

    invoke-static {v0, v1, v3, v3}, LJ/N;->MtT_tevO(JLjava/lang/Object;Ljava/lang/Object;)V

    return-void

    :pswitch_23
    check-cast p0, Lghf;

    invoke-virtual {p0}, Lghf;->G()Z

    return-void

    :pswitch_29
    check-cast p0, Ll8i;

    iget-object v0, p0, Ll8i;->b:Lcom/opera/android/view/TouchIgnoringViewPager;

    iget-object p0, p0, Ll8i;->d:Lghf;

    new-instance v1, Lpjg;

    const/16 v2, 0x1b

    invoke-direct {v1, p0, v2}, Lpjg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :pswitch_3a
    check-cast p0, Lb6i;

    invoke-virtual {p0}, Lekc;->h()Z

    move-result v0

    iget-object v5, p0, Lb6i;->p:Ljava/util/concurrent/atomic/AtomicBoolean;

    invoke-virtual {v5, v2, v4}, Ljava/util/concurrent/atomic/AtomicBoolean;->compareAndSet(ZZ)Z

    move-result v4

    if-eqz v4, :cond_5b

    if-eqz v0, :cond_5b

    iget-object v0, p0, Lb6i;->l:Ly5i;

    iget-object v0, v0, Ly5i;->a:La64;

    if-nez v0, :cond_51

    move-object v0, v3

    :cond_51
    iget-object v4, p0, Lb6i;->s:Lkotlin/coroutines/CoroutineContext;

    new-instance v5, Lf6i;

    invoke-direct {v5, p0, v3, v2}, Lf6i;-><init>(Lb6i;Lmt5;B)V

    invoke-static {v0, v4, v3, v5, v1}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    :cond_5b
    return-void

    :pswitch_5c
    check-cast p0, Lm5i;

    iget-object v0, p0, Lm5i;->a:Lumm;

    if-eqz v0, :cond_67

    sget-object v1, Lm5i;->g:[I

    invoke-virtual {v0, v1}, Landroid/graphics/drawable/Drawable;->setState([I)Z

    :cond_67
    iput-object v3, p0, Lm5i;->d:Lpjg;

    return-void

    :pswitch_6a
    check-cast p0, Ll5b;

    iput-boolean v2, p0, Ll5b;->b:Z

    return-void

    :pswitch_6f
    check-cast p0, Lf0i;

    iget-object v0, p0, Lf0i;->f:Ldb;

    invoke-virtual {v0}, Ldb;->f()Z

    move-result v0

    if-eqz v0, :cond_7d

    invoke-virtual {p0, v4}, Lf0i;->o0(I)V

    goto :goto_81

    :cond_7d
    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Lf0i;->o0(I)V

    :goto_81
    return-void

    :pswitch_82
    check-cast p0, Lc0i;

    iget-object v0, p0, Lc0i;->d:Lb0i;

    iget-object v2, p0, Lc0i;->a:Lltl;

    invoke-interface {v2}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    invoke-virtual {v2, p0}, Ltcc;->b(Lmdc;)V

    iget-object v2, p0, Lc0i;->f:Lig;

    if-eqz v2, :cond_95

    iput-object v3, v2, Lig;->b:Ljava/lang/Object;

    :cond_95
    iget-object v2, p0, Lc0i;->e:Lode;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Lekc;->r(Ljava/lang/Object;)V

    iget-object p0, p0, Lc0i;->c:Lslk;

    iget-object p0, p0, Lslk;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwvg;

    invoke-virtual {p0}, Lwvg;->a()Z

    move-result v2

    if-eqz v2, :cond_ba

    invoke-virtual {p0}, Lwvg;->b()Z

    move-result p0

    if-eqz p0, :cond_b6

    invoke-interface {v0, v1}, Lb0i;->J(I)V

    goto :goto_bd

    :cond_b6
    invoke-interface {v0}, Lb0i;->m()V

    goto :goto_bd

    :cond_ba
    invoke-interface {v0, v4}, Lb0i;->J(I)V

    :goto_bd
    return-void

    :pswitch_be
    check-cast p0, Luwh;

    invoke-virtual {p0}, Luwh;->e()V

    return-void

    :pswitch_c4
    check-cast p0, Lijc;

    invoke-virtual {p0}, Lijc;->g()V

    return-void

    :pswitch_ca
    check-cast p0, Ln9h;

    iget-object p0, p0, Ln9h;->c:Ljava/lang/Object;

    check-cast p0, Lkoh;

    iget-boolean v0, p0, Lkoh;->d:Z

    if-nez v0, :cond_f8

    iget-object v0, p0, Lkoh;->a:Lbuk;

    iget-object v1, p0, Lkoh;->b:Lzpl;

    iget-object v2, p0, Lkoh;->g:Lmoh;

    iget-object v3, v2, Lmoh;->s:Lf28;

    invoke-static {v3}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    iget-object v3, v2, Lmoh;->w:Lcyd;

    invoke-virtual {v3}, Lcyd;->a()V

    iget-object v3, v3, Lcyd;->i:Ljava/lang/Object;

    check-cast v3, Lcom/google/common/util/concurrent/ListenableFuture;

    invoke-static {v3}, Lk1g;->O(Lcom/google/common/util/concurrent/ListenableFuture;)Lcom/google/common/util/concurrent/ListenableFuture;

    move-result-object v3

    new-instance v4, Ljbd;

    const/16 v5, 0xf

    invoke-direct {v4, p0, v0, v1, v5}, Ljbd;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v2, Lmoh;->d:Lb2j;

    invoke-interface {v3, v4, p0}, Lcom/google/common/util/concurrent/ListenableFuture;->addListener(Ljava/lang/Runnable;Ljava/util/concurrent/Executor;)V

    :cond_f8
    return-void

    :pswitch_f9
    check-cast p0, Lnlh;

    iget-object v0, p0, Lnlh;->E:Lcom/opera/android/settings/SettingsManager;

    sget v1, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v5, 0x1e

    if-lt v1, v5, :cond_17f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-static {p0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object p0

    if-eqz p0, :cond_17f

    const-string v1, "offline_pages_location"

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->z(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_17f

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->O()Z

    move-result v0

    if-nez v0, :cond_17f

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f1401b7

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v1

    filled-new-array {v1}, [Ljava/lang/Object;

    move-result-object v1

    const v5, 0x7f140bb5

    invoke-virtual {v0, v5, v1}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_13d

    new-instance v1, Lqxh;

    invoke-direct {v1, v0}, Lqxh;-><init>(Ljava/lang/CharSequence;)V

    goto :goto_13e

    :cond_13d
    move-object v1, v3

    :goto_13e
    new-instance v0, Lyw3;

    invoke-direct {v0, p0}, Lyw3;-><init>(Ldx3;)V

    const-string v5, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {p0, v5}, Ldx3;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    new-instance v5, Lgkj;

    invoke-direct {v5, v2, v2}, Lnz0;-><init>(ZZ)V

    iput-object v3, v5, Lgkj;->a:Ljava/lang/String;

    iput-object v3, v5, Lgkj;->b:Ljava/lang/String;

    iput-object v3, v5, Lgkj;->c:Ljava/lang/String;

    iput-object v3, v5, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v3, v5, Lgkj;->e:Lekj;

    iput-object v3, v5, Lgkj;->f:Lfkj;

    iput-object v3, v5, Lgkj;->g:Lqp2;

    iput-object v0, v5, Lgkj;->h:Ldkj;

    iput-object v3, v5, Lgkj;->i:Ldkj;

    iput-object v3, v5, Lgkj;->j:Lql;

    const v0, 0x7f1407b4

    iput v0, v5, Lgkj;->k:I

    const v0, 0x7f1403bf

    iput v0, v5, Lgkj;->l:I

    const v0, 0x7f140bb6

    iput v0, v5, Lgkj;->m:I

    iput-boolean v4, v5, Lgkj;->n:Z

    iput-object v1, v5, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lijm;->b:Lijm;

    invoke-virtual {p0, v5, v0}, Lr22;->b(Ljjm;Lijm;)V

    :cond_17f
    return-void

    :pswitch_180
    check-cast p0, Lf9c;

    iget-object p0, p0, Lf9c;->s:Ljava/lang/Object;

    check-cast p0, Lor2;

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/OperaTextInputEditText;

    sget-object v0, Lq9n;->c:Ll5b;

    invoke-virtual {p0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0, p0}, Lq9n;->G(Landroid/content/Context;Landroid/view/View;)Z

    return-void

    :pswitch_194
    check-cast p0, Lglh;

    iget-object v0, p0, Lglh;->a:Ljlh;

    invoke-virtual {v0}, Landroid/database/sqlite/SQLiteOpenHelper;->getWritableDatabase()Landroid/database/sqlite/SQLiteDatabase;

    new-instance v0, Lvk2;

    const/16 v1, 0x15

    invoke-direct {v0, v1}, Lvk2;-><init>(B)V

    invoke-virtual {p0, v0}, Lglh;->f(Lcom/opera/api/Callback;)V

    return-void

    :pswitch_1a6
    check-cast p0, Loih;

    invoke-virtual {p0}, Loih;->r()V

    return-void

    :pswitch_1ac
    check-cast p0, Lcom/opera/android/PushedContentHandler$Request;

    iput-object v3, p0, Lcom/opera/android/PushedContentHandler$Request;->b:Loml;

    iget-wide v0, p0, Lcom/opera/android/PushedContentHandler$Request;->d:J

    const-wide/16 v5, 0x0

    cmp-long v3, v0, v5

    if-eqz v3, :cond_1bd

    invoke-static {v0, v1}, LJ/N;->MBqsUtXh(J)V

    iput-wide v5, p0, Lcom/opera/android/PushedContentHandler$Request;->d:J

    :cond_1bd
    iget v0, p0, Lcom/opera/android/PushedContentHandler$Request;->c:I

    add-int/2addr v0, v4

    iput v0, p0, Lcom/opera/android/PushedContentHandler$Request;->c:I

    const/4 v1, 0x3

    if-ge v0, v1, :cond_1c9

    invoke-virtual {p0}, Lcom/opera/android/PushedContentHandler$Request;->a()V

    goto :goto_1d5

    :cond_1c9
    iget-object v0, p0, Lcom/opera/android/PushedContentHandler$Request;->e:Lcom/opera/android/PushedContentHandler;

    invoke-static {}, Landroid/os/SystemClock;->elapsedRealtime()J

    move-result-wide v3

    iget-wide v5, p0, Lcom/opera/android/PushedContentHandler$Request;->a:J

    sub-long/2addr v3, v5

    invoke-virtual {v0, v3, v4, v2}, Lcom/opera/android/PushedContentHandler;->e(JZ)V

    :goto_1d5
    return-void

    :pswitch_1d6
    check-cast p0, Lhch;

    invoke-virtual {p0}, Lhch;->f0()V

    return-void

    :pswitch_1dc
    check-cast p0, Lj1h;

    iget-object v0, p0, Lj1h;->f:Lqdc;

    iget v1, p0, Lj1h;->b:I

    if-nez v1, :cond_1eb

    iput-boolean v4, p0, Lj1h;->c:Z

    sget-object v1, Locc;->ON_PAUSE:Locc;

    invoke-virtual {v0, v1}, Lqdc;->e(Locc;)V

    :cond_1eb
    iget v1, p0, Lj1h;->a:I

    if-nez v1, :cond_1fa

    iget-boolean v1, p0, Lj1h;->c:Z

    if-eqz v1, :cond_1fa

    sget-object v1, Locc;->ON_STOP:Locc;

    invoke-virtual {v0, v1}, Lqdc;->e(Locc;)V

    iput-boolean v4, p0, Lj1h;->d:Z

    :cond_1fa
    return-void

    :pswitch_1fb
    check-cast p0, Lq0h;

    iget-object p0, p0, Lq0h;->a:Lcom/opera/android/BrowserActivity;

    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object p0

    invoke-virtual {p0}, Lru9;->b()Lnv6;

    move-result-object p0

    iget-object v0, p0, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v1, "privacy_settings.promotion.can_show"

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p0}, Lnv6;->w()V

    return-void

    :pswitch_214
    check-cast p0, Lorg/chromium/printing/PrintingContext;

    iget-wide v0, p0, Lorg/chromium/printing/PrintingContext;->b:J

    invoke-static {v0, v1}, LJ/N;->Mmq2M8tt(J)V

    return-void

    :pswitch_21c
    check-cast p0, Lswg;

    invoke-virtual {p0}, Lqrm;->r()V

    return-void

    :pswitch_222
    check-cast p0, Lyvg;

    invoke-virtual {p0}, Lyvg;->a()V

    iget-object v0, p0, Lyvg;->b:Ltcc;

    check-cast v0, Lqdc;

    iget-object v0, v0, Lqdc;->i:Lqcc;

    sget-object v1, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v1}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-nez v0, :cond_298

    iget-object v0, p0, Lyvg;->h:Lgkj;

    if-eqz v0, :cond_23e

    sget-object v1, Lhjm;->b:Lhjm;

    invoke-interface {v0, v1}, Ljjm;->finish(Lhjm;)V

    :cond_23e
    iget-object v0, p0, Lyvg;->a:Landroid/content/Context;

    invoke-static {}, Lwub;->D()Lwub;

    move-result-object v1

    new-instance v5, Lcm;

    const v6, 0x7f0a07bd

    const/4 v7, 0x5

    invoke-direct {v5, v3, v6, v7}, Lcm;-><init>(Ljava/lang/String;IB)V

    const-string v3, "account_and_subscriptions"

    invoke-static {v3, v5}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v3

    const v5, 0x7f0803bc

    invoke-virtual {v3, v5}, Lua7;->S(I)V

    iget-object v5, v3, Lua7;->b:Ljava/lang/Object;

    check-cast v5, Ll1f;

    iput-boolean v4, v5, Ll1f;->k:Z

    invoke-virtual {v5, v4}, Ll1f;->d(Z)V

    const v4, 0x7f1413da

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ll1f;->f(Ljava/lang/CharSequence;)V

    const v4, 0x7f1413d9

    invoke-virtual {v0, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v5, v4}, Ll1f;->e(Ljava/lang/CharSequence;)V

    invoke-static {v0}, Lmdb;->b(Landroid/content/Context;)Landroid/content/Intent;

    move-result-object v4

    const-string v5, "DESTINATION_VIEW_ID"

    const/16 v6, 0xa

    invoke-static {v6}, Lj7c;->f(I)B

    move-result v6

    invoke-virtual {v4, v5, v6}, Landroid/content/Intent;->putExtra(Ljava/lang/String;I)Landroid/content/Intent;

    const-string v5, "ACTION_DESTINATION_VIEW"

    invoke-virtual {v4, v5}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {v0, v2, v4, v2, v2}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object v0

    invoke-virtual {v3, v0}, Lua7;->N(Lyhe;)V

    invoke-virtual {v3}, Lua7;->l()Li16;

    move-result-object v0

    invoke-virtual {v1, v0}, Lwub;->H(Li16;)V

    :cond_298
    invoke-virtual {p0}, Lyvg;->d()V

    return-void

    :pswitch_29c
    check-cast p0, Lfmk;

    invoke-virtual {p0}, Lfmk;->b()V

    return-void

    :pswitch_2a2
    check-cast p0, Lcvg;

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :pswitch_2a8
    check-cast p0, Lkng;

    invoke-virtual {p0}, Lkng;->a()V

    return-void

    :pswitch_2ae
    check-cast p0, Lqkg;

    invoke-virtual {p0}, Lqkg;->u()V

    return-void

    :pswitch_2b4
    check-cast p0, Lko7;

    iget-object p0, p0, Lko7;->k:Ljava/lang/Object;

    check-cast p0, Lhd;

    iput-boolean v4, p0, Lhd;->b:Z

    iget-object v0, p0, Lhd;->g:Ljava/lang/Object;

    check-cast v0, Lwe7;

    iget-object p0, p0, Lhd;->d:Ljava/lang/Object;

    check-cast p0, Lxbf;

    invoke-virtual {v0, p0}, Lhkg;->a(Lxbf;)V

    return-void

    :pswitch_2c8
    check-cast p0, Lhd;

    iget-object p0, p0, Lhd;->f:Ljava/lang/Object;

    check-cast p0, Lko7;

    invoke-virtual {p0}, Lldk;->h()V

    return-void

    :pswitch_2d2
    check-cast p0, Lqjg;

    :try_start_2d4
    iget-object p0, p0, Lqjg;->a:Ltjg;

    iget-object p0, p0, Ltjg;->m:Lmhd;

    invoke-interface {p0}, Ljava/util/concurrent/Future;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lghd;

    invoke-virtual {p0}, Lghd;->play()V
    :try_end_2e1
    .catch Ljava/util/concurrent/ExecutionException; {:try_start_2d4 .. :try_end_2e1} :catch_2e1
    .catch Ljava/lang/InterruptedException; {:try_start_2d4 .. :try_end_2e1} :catch_2e1

    :catch_2e1
    return-void

    :pswitch_data_2e2
    .packed-switch 0x0
        :pswitch_2d2
        :pswitch_2c8
        :pswitch_2b4
        :pswitch_2ae
        :pswitch_2a8
        :pswitch_2a2
        :pswitch_29c
        :pswitch_222
        :pswitch_21c
        :pswitch_214
        :pswitch_1fb
        :pswitch_1dc
        :pswitch_1d6
        :pswitch_1ac
        :pswitch_1a6
        :pswitch_194
        :pswitch_180
        :pswitch_f9
        :pswitch_ca
        :pswitch_c4
        :pswitch_be
        :pswitch_82
        :pswitch_6f
        :pswitch_6a
        :pswitch_5c
        :pswitch_3a
        :pswitch_29
        :pswitch_23
        :pswitch_1b
    .end packed-switch
.end method
