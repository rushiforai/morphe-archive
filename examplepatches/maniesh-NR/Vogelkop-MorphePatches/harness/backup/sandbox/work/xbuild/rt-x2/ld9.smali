.class public final synthetic Lld9;
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

    iput-byte p2, p0, Lld9;->a:B

    iput-object p1, p0, Lld9;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method private final a()V
    .registers 4

    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lwva;

    iget-object v0, p0, Lwva;->w:Ljava/lang/Object;

    monitor-enter v0

    const/4 v1, 0x0

    :try_start_8
    iput-object v1, p0, Lwva;->y:Lvva;

    iget-object v2, p0, Lwva;->x:Lqya;

    if-eqz v2, :cond_13

    iput-object v1, p0, Lwva;->x:Lqya;

    invoke-virtual {p0, v2}, Lwva;->e(Lqya;)V

    :cond_13
    monitor-exit v0

    return-void

    :goto_15
    monitor-exit v0
    :try_end_16
    .catchall {:try_start_8 .. :try_end_16} :catchall_17

    throw p0

    :catchall_17
    move-exception p0

    goto :goto_15
.end method


# virtual methods
.method public final run()V
    .registers 9

    iget-byte v0, p0, Lld9;->a:B

    const/4 v1, 0x5

    const/4 v2, 0x2

    const/4 v3, 0x0

    const/4 v4, 0x1

    const/4 v5, 0x0

    packed-switch v0, :pswitch_data_380

    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lp12;

    iget-object p0, p0, Lp12;->e:Ljava/lang/Object;

    check-cast p0, Lwub;

    const-class v0, Ljt2;

    invoke-virtual {p0, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object p0

    check-cast p0, Ljt2;

    check-cast p0, Lot2;

    invoke-virtual {p0}, Lot2;->d()V

    return-void

    :pswitch_20
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/startup/InitialStartupService;

    sget v0, Lcom/opera/android/startup/InitialStartupService;->b:I

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    new-instance v0, Landroid/content/Intent;

    const-class v2, Lcom/opera/android/startup/WelcomeActivity;

    invoke-direct {v0, p0, v2}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v2, "com.opera.android.startup.INSTALL_COMPLETE_NOTIFICATION"

    invoke-virtual {v0, v2}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    invoke-static {p0, v5, v0, v5, v5}, Lyhe;->f(Landroid/content/Context;ILandroid/content/Intent;IZ)Lyhe;

    move-result-object v0

    const-string v2, "installation"

    new-instance v5, Lcm;

    const v6, 0x7f0a0a19

    invoke-direct {v5, v3, v6, v1}, Lcm;-><init>(Ljava/lang/String;IB)V

    invoke-static {v2, v5}, Lzi4;->t(Ljava/lang/String;Lcm;)Lua7;

    move-result-object v1

    invoke-virtual {v1, v0}, Lua7;->N(Lyhe;)V

    const v0, 0x7f0803bc

    invoke-virtual {v1, v0}, Lua7;->S(I)V

    const v0, 0x7f1401b7

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    const v2, 0x7f14117f

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {p0, v2, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v1, v0}, Lua7;->P(Ljava/lang/CharSequence;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v2, v0, Lx5f;->h:Z

    if-eqz v2, :cond_8c

    iget-object v2, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v3

    invoke-static {v2, v3}, Lam2;->f(Lzpa;Lx56;)Lhi0;

    move-result-object v2

    iget-object v2, v2, Lhi0;->b:Lfi0;

    const/16 v5, 0x1a

    const-wide/16 v6, 0x1

    invoke-virtual {v2, v5, v4, v6, v7}, Ljf0;->p(IIJ)V

    invoke-virtual {v0, v3}, Lx5f;->U0(Lx56;)V

    :cond_8c
    invoke-static {}, Laib;->t()Lwub;

    move-result-object v0

    invoke-virtual {v1}, Lua7;->l()Li16;

    move-result-object v1

    invoke-virtual {v0, v1}, Lwub;->H(Li16;)V

    invoke-virtual {p0}, Landroid/app/Service;->stopSelf()V

    return-void

    :pswitch_9b
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lx79;

    invoke-virtual {p0}, Lx79;->O()V

    return-void

    :pswitch_a3
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/import_data/ImportChromeDataActivity;

    sget v0, Lcom/opera/android/import_data/ImportChromeDataActivity;->d0:I

    sget-object v0, Lj2b;->d:Lj2b;

    sget-object v1, Lnl3;->f:Lnl3;

    iget v1, v1, Lnl3;->a:I

    invoke-virtual {p0, v0, v1}, Lcom/opera/android/import_data/ImportChromeDataActivity;->S0(Lj2b;I)V

    return-void

    :pswitch_b3
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;

    sget v0, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->b0:I

    sget-object v0, Lnl3;->f:Lnl3;

    iget v0, v0, Lnl3;->a:I

    invoke-virtual {p0, v0}, Lcom/opera/android/import_data/ImportChromeBookmarksActivity;->E0(I)V

    return-void

    :pswitch_c1
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lowa;

    iget-object v0, p0, Lowa;->e:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lnxa;

    iget-object v1, p0, Lowa;->f:Lld9;

    invoke-static {v1}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object p0, p0, Lowa;->c:Lfwk;

    invoke-virtual {p0, v0}, Lfwk;->b(Landroid/graphics/drawable/Drawable;)V

    return-void

    :pswitch_d8
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Ljwa;

    iget v0, p0, Ljwa;->d:I

    add-int/2addr v0, v4

    iput v0, p0, Ljwa;->d:I

    invoke-virtual {p0}, Ljwa;->a()V

    invoke-virtual {p0}, Ljwa;->b()V

    return-void

    :pswitch_e8
    invoke-direct {p0}, Lld9;->a()V

    return-void

    :pswitch_ec
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lxm5;

    invoke-virtual {p0}, Lxm5;->B()V

    return-void

    :pswitch_f4
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/history/f;

    iget-object p0, p0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    iget-object p0, p0, Lcom/opera/android/history/d;->l:Lcom/opera/android/history/e;

    iget-object p0, p0, Lcom/opera/android/history/e;->g:Lqde;

    iget-object v0, p0, Lqde;->l:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    invoke-static {v0}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void

    :pswitch_10b
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lx77;

    iget-object v0, p0, Lx77;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/concurrent/atomic/AtomicReference;

    iget-object v1, p0, Lx77;->b:Ljava/lang/Object;

    check-cast v1, Lkotlin/jvm/functions/Function0;

    invoke-interface {v1}, Lkotlin/jvm/functions/Function0;->invoke()Ljava/lang/Object;

    move-result-object v1

    invoke-virtual {v0, v1}, Ljava/util/concurrent/atomic/AtomicReference;->set(Ljava/lang/Object;)V

    iget-object p0, p0, Lx77;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/concurrent/CountDownLatch;

    invoke-virtual {p0}, Ljava/util/concurrent/CountDownLatch;->countDown()V

    return-void

    :pswitch_126
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, La9a;

    iget-object p0, p0, La9a;->c:Lcom/opera/android/custom_views/BestHorizontalFitLayout;

    const/4 v0, 0x4

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {p0, v0}, Landroid/view/View;->setAlpha(F)V

    return-void

    :pswitch_136
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lv8a;

    invoke-virtual {p0}, Lv8a;->b()V

    return-void

    :pswitch_13e
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lj5m;

    new-instance v0, La5m;

    const/4 v1, 0x6

    invoke-direct {v0, v1}, La5m;-><init>(I)V

    invoke-virtual {p0, v0}, Lj5m;->d(Ld5m;)V

    return-void

    :pswitch_14c
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/GpuWorkarounds;

    iget-object p0, p0, Lcom/opera/android/GpuWorkarounds;->a:Landroid/content/Context;

    :try_start_152
    new-instance v0, Ljava/io/File;

    const-string v1, "webview"

    invoke-virtual {p0, v1, v5}, Landroid/content/Context;->getDir(Ljava/lang/String;I)Ljava/io/File;

    move-result-object p0

    const-string v1, "GPUCache"

    invoke-direct {v0, p0, v1}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    new-instance p0, Lltp;

    invoke-direct {p0, v2}, Lltp;-><init>(B)V

    invoke-virtual {v0, p0}, Ljava/io/File;->listFiles(Ljava/io/FileFilter;)[Ljava/io/File;

    move-result-object p0

    if-eqz p0, :cond_175

    array-length v0, p0

    :goto_16b
    if-ge v5, v0, :cond_175

    aget-object v1, p0, v5

    invoke-virtual {v1}, Ljava/io/File;->delete()Z
    :try_end_172
    .catch Ljava/lang/Exception; {:try_start_152 .. :try_end_172} :catch_175

    add-int/lit8 v5, v5, 0x1

    goto :goto_16b

    :catch_175
    :cond_175
    return-void

    :pswitch_176
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lc1a;

    iget-object v0, p0, Lc1a;->h:Ljava/lang/Object;

    check-cast v0, Lb1a;

    iget-object v1, v0, Lb1a;->d:Lz0a;

    iget-object v1, v1, Lz0a;->b:Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getId()I

    move-result v1

    iget-object v2, v0, Lb1a;->e:Landroid/util/SparseBooleanArray;

    invoke-virtual {v2, v1}, Landroid/util/SparseBooleanArray;->delete(I)V

    iget-object v1, v0, Lb1a;->c:Lx5f;

    sget-object v2, Lwe0;->c:Lwe0;

    invoke-virtual {v0}, Lb1a;->W()Lci0;

    move-result-object v0

    invoke-virtual {v1, v2, v0}, Lx5f;->V(Lwe0;Lci0;)V

    iget-object v0, p0, Lc1a;->b:Ljava/lang/Object;

    check-cast v0, Ll1a;

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk1a;

    iget-object v0, v0, Lk1a;->e:Ljava/lang/String;

    iget-object v1, p0, Lc1a;->e:Ljava/lang/Object;

    check-cast v1, Lk6l;

    iget-object v1, v1, Lk6l;->o:Lb2l;

    check-cast v1, Ld7l;

    iget-object v1, v1, Ld7l;->j:Le7l;

    invoke-interface {v1}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, Lcom/opera/android/browser/BrowserUtils;->getRendererUrl(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-static {v1}, La26;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    new-instance v2, Ljava/lang/StringBuffer;

    invoke-virtual {v0}, Ljava/lang/String;->length()I

    move-result v3

    invoke-direct {v2, v3}, Ljava/lang/StringBuffer;-><init>(I)V

    sget-object v3, Leti;->c:Ljava/util/regex/Pattern;

    invoke-virtual {v3, v0}, Ljava/util/regex/Pattern;->matcher(Ljava/lang/CharSequence;)Ljava/util/regex/Matcher;

    move-result-object v0

    :goto_1cd
    invoke-virtual {v0}, Ljava/util/regex/Matcher;->find()Z

    move-result v3

    if-eqz v3, :cond_1fb

    invoke-virtual {v0, v4}, Ljava/util/regex/Matcher;->group(I)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string v5, "locale"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_1ef

    const-string v5, "returnUrl"

    invoke-virtual {v3, v5}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_1ed

    const-string v3, ""

    goto :goto_1f3

    :cond_1ed
    move-object v3, v1

    goto :goto_1f3

    :cond_1ef
    invoke-static {}, Lvsi;->b()Ljava/lang/String;

    move-result-object v3

    :goto_1f3
    invoke-static {v3}, Ljava/util/regex/Matcher;->quoteReplacement(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-virtual {v0, v2, v3}, Ljava/util/regex/Matcher;->appendReplacement(Ljava/lang/StringBuffer;Ljava/lang/String;)Ljava/util/regex/Matcher;

    goto :goto_1cd

    :cond_1fb
    invoke-virtual {v0, v2}, Ljava/util/regex/Matcher;->appendTail(Ljava/lang/StringBuffer;)Ljava/lang/StringBuffer;

    invoke-virtual {v2}, Ljava/lang/StringBuffer;->toString()Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_20b

    iget-object p0, p0, Lc1a;->f:Ljava/lang/Object;

    check-cast p0, Lxt3;

    invoke-virtual {p0, v0}, Lxt3;->run(Ljava/lang/Object;)V

    :cond_20b
    return-void

    :pswitch_20c
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lks3;

    iget-object p0, p0, Lks3;->f:Ljava/lang/Object;

    check-cast p0, Lx0a;

    if-eqz p0, :cond_221

    iget-object p0, p0, Lhi7;->e:Ligi;

    iget-object p0, p0, Ligi;->e:Ljava/lang/Object;

    check-cast p0, Landroid/view/View;

    check-cast p0, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;

    invoke-virtual {p0, v2}, Lcom/google/android/material/floatingactionbutton/ExtendedFloatingActionButton;->Q(I)V

    :cond_221
    return-void

    :pswitch_222
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lh0a;

    iget-object p0, p0, Lh0a;->b:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    return-void

    :pswitch_22c
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lez9;

    invoke-virtual {p0}, Lez9;->n()V

    return-void

    :pswitch_234
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lpy9;

    iget-object v0, p0, Lpy9;->f:Lkze;

    invoke-virtual {p0}, Lpy9;->a()Lwvg;

    move-result-object v1

    invoke-static {v0, v1}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-virtual {p0}, Lpy9;->f()Lqtg;

    return-void

    :pswitch_245
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lwy3;

    iget-object p0, p0, Lwy3;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/FullscreenWebActivity;

    iget-object p0, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    if-eqz p0, :cond_254

    invoke-virtual {p0, v5}, Landroid/view/View;->setVisibility(I)V

    :cond_254
    return-void

    :pswitch_255
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lqt6;

    iput-object v3, p0, Lqt6;->e:Ljava/lang/Object;

    iget-object p0, p0, Lqt6;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p0}, Lcom/opera/android/browser/WebContentsWrapper;->h()Z

    move-result v0

    if-nez v0, :cond_270

    iget-wide v0, p0, Lcom/opera/android/browser/chromium/ChromiumContent;->n:J

    const-wide/16 v2, 0x0

    cmp-long p0, v0, v2

    if-eqz p0, :cond_270

    invoke-static {v0, v1}, LJ/N;->MCqZ2U3N(J)V

    :cond_270
    return-void

    :pswitch_271
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lmn9;

    invoke-virtual {p0}, Lmn9;->f()V

    return-void

    :pswitch_279
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/w;

    iget-object p0, p0, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    :goto_283
    if-ge v5, v0, :cond_291

    invoke-virtual {p0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    add-int/lit8 v5, v5, 0x1

    check-cast v1, Lam9;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    goto :goto_283

    :cond_291
    return-void

    :pswitch_292
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lnrl;

    iget-object v0, p0, Lnrl;->b:Ljava/lang/Object;

    check-cast v0, Lv6d;

    if-eqz v0, :cond_2ab

    iget-boolean p0, p0, Lnrl;->a:Z

    if-eqz p0, :cond_2ab

    iget-object p0, v0, Lv6d;->b:Lt6d;

    sget-object v1, Lt6d;->c:Lt6d;

    if-ne p0, v1, :cond_2ab

    sget-object p0, Lt6d;->d:Lt6d;

    invoke-virtual {v0, p0}, Lv6d;->b(Lt6d;)V

    :cond_2ab
    return-void

    :pswitch_2ac
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/fragment/app/Fragment;

    invoke-static {p0}, Landroidx/fragment/app/Fragment;->e0(Landroidx/fragment/app/Fragment;)V

    return-void

    :pswitch_2b4
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lti9;

    iget-object v0, p0, Lti9;->a:Lnx5;

    new-instance v2, Lrf4;

    invoke-direct {v2, v1, v3, p0}, Lrf4;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v2, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :pswitch_2c4
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Luh9;

    const-string v0, "fetchFonts result is not OK. ("

    iget-object v1, p0, Luh9;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_2cd
    iget-object v3, p0, Luh9;->g:Lo0g;

    if-nez v3, :cond_2d4

    monitor-exit v1

    goto/16 :goto_362

    :cond_2d4
    monitor-exit v1
    :try_end_2d5
    .catchall {:try_start_2cd .. :try_end_2d5} :catchall_369

    :try_start_2d5
    invoke-virtual {p0}, Luh9;->c()Lni9;

    move-result-object v1

    iget v3, v1, Lni9;->f:I

    if-ne v3, v2, :cond_2e6

    iget-object v2, p0, Luh9;->c:Ljava/lang/Object;

    monitor-enter v2
    :try_end_2e0
    .catchall {:try_start_2d5 .. :try_end_2e0} :catchall_353

    :try_start_2e0
    monitor-exit v2

    goto :goto_2e6

    :goto_2e2
    monitor-exit v2
    :try_end_2e3
    .catchall {:try_start_2e0 .. :try_end_2e3} :catchall_2e4

    :try_start_2e3
    throw v0
    :try_end_2e4
    .catchall {:try_start_2e3 .. :try_end_2e4} :catchall_353

    :catchall_2e4
    move-exception v0

    goto :goto_2e2

    :cond_2e6
    :goto_2e6
    if-nez v3, :cond_33c

    :try_start_2e8
    const-string v0, "EmojiCompat.FontRequestEmojiCompatConfig.buildTypeface"

    invoke-static {v0}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    iget-object v0, p0, Luh9;->a:Landroid/content/Context;

    filled-new-array {v1}, [Lni9;

    move-result-object v2

    invoke-static {v0, v2, v5}, Lham;->a(Landroid/content/Context;[Lni9;I)Landroid/graphics/Typeface;

    move-result-object v0

    iget-object v2, p0, Luh9;->a:Landroid/content/Context;

    iget-object v1, v1, Lni9;->a:Landroid/net/Uri;

    invoke-static {v2, v1}, Lynh;->f(Landroid/content/Context;Landroid/net/Uri;)Ljava/nio/MappedByteBuffer;

    move-result-object v1
    :try_end_2ff
    .catchall {:try_start_2e8 .. :try_end_2ff} :catchall_337

    if-eqz v1, :cond_32f

    if-eqz v0, :cond_32f

    :try_start_303
    const-string v2, "EmojiCompat.MetadataRepo.create"

    invoke-static {v2}, Landroid/os/Trace;->beginSection(Ljava/lang/String;)V

    new-instance v2, Lcyd;

    invoke-static {v1}, Lqyn;->c0(Ljava/nio/MappedByteBuffer;)Lwxd;

    move-result-object v1

    invoke-direct {v2, v0, v1}, Lcyd;-><init>(Landroid/graphics/Typeface;Lwxd;)V
    :try_end_311
    .catchall {:try_start_303 .. :try_end_311} :catchall_32a

    :try_start_311
    invoke-static {}, Landroid/os/Trace;->endSection()V
    :try_end_314
    .catchall {:try_start_311 .. :try_end_314} :catchall_337

    :try_start_314
    invoke-static {}, Landroid/os/Trace;->endSection()V

    iget-object v0, p0, Luh9;->c:Ljava/lang/Object;

    monitor-enter v0
    :try_end_31a
    .catchall {:try_start_314 .. :try_end_31a} :catchall_353

    :try_start_31a
    iget-object v1, p0, Luh9;->g:Lo0g;

    if-eqz v1, :cond_321

    invoke-virtual {v1, v2}, Lo0g;->u0(Lcyd;)V

    :cond_321
    monitor-exit v0
    :try_end_322
    .catchall {:try_start_31a .. :try_end_322} :catchall_328

    :try_start_322
    invoke-virtual {p0}, Luh9;->b()V
    :try_end_325
    .catchall {:try_start_322 .. :try_end_325} :catchall_353

    goto :goto_362

    :goto_326
    :try_start_326
    monitor-exit v0
    :try_end_327
    .catchall {:try_start_326 .. :try_end_327} :catchall_328

    :try_start_327
    throw v1
    :try_end_328
    .catchall {:try_start_327 .. :try_end_328} :catchall_353

    :catchall_328
    move-exception v1

    goto :goto_326

    :catchall_32a
    move-exception v0

    :try_start_32b
    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0

    :cond_32f
    new-instance v0, Ljava/lang/RuntimeException;

    const-string v1, "Unable to open file."

    invoke-direct {v0, v1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v0
    :try_end_337
    .catchall {:try_start_32b .. :try_end_337} :catchall_337

    :catchall_337
    move-exception v0

    :try_start_338
    invoke-static {}, Landroid/os/Trace;->endSection()V

    throw v0

    :cond_33c
    new-instance v1, Ljava/lang/RuntimeException;

    new-instance v2, Ljava/lang/StringBuilder;

    invoke-direct {v2, v0}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v0, ")"

    invoke-virtual {v2, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-direct {v1, v0}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;)V

    throw v1
    :try_end_353
    .catchall {:try_start_338 .. :try_end_353} :catchall_353

    :catchall_353
    move-exception v0

    iget-object v2, p0, Luh9;->c:Ljava/lang/Object;

    monitor-enter v2

    :try_start_357
    iget-object v1, p0, Luh9;->g:Lo0g;

    if-eqz v1, :cond_35e

    invoke-virtual {v1, v0}, Lo0g;->t0(Ljava/lang/Throwable;)V

    :cond_35e
    monitor-exit v2
    :try_end_35f
    .catchall {:try_start_357 .. :try_end_35f} :catchall_365

    invoke-virtual {p0}, Luh9;->b()V

    :goto_362
    return-void

    :goto_363
    :try_start_363
    monitor-exit v2
    :try_end_364
    .catchall {:try_start_363 .. :try_end_364} :catchall_365

    throw p0

    :catchall_365
    move-exception p0

    goto :goto_363

    :goto_367
    :try_start_367
    monitor-exit v1
    :try_end_368
    .catchall {:try_start_367 .. :try_end_368} :catchall_369

    throw p0

    :catchall_369
    move-exception p0

    goto :goto_367

    :pswitch_36b
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lhu5;

    if-eqz p0, :cond_376

    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {p0, v0}, Lhu5;->run(Ljava/lang/Object;)V

    :cond_376
    return-void

    :pswitch_377
    iget-object p0, p0, Lld9;->b:Ljava/lang/Object;

    check-cast p0, Lod9;

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    nop

    :pswitch_data_380
    .packed-switch 0x0
        :pswitch_377
        :pswitch_36b
        :pswitch_2c4
        :pswitch_2b4
        :pswitch_2ac
        :pswitch_292
        :pswitch_279
        :pswitch_271
        :pswitch_255
        :pswitch_245
        :pswitch_234
        :pswitch_22c
        :pswitch_222
        :pswitch_20c
        :pswitch_176
        :pswitch_14c
        :pswitch_13e
        :pswitch_136
        :pswitch_126
        :pswitch_10b
        :pswitch_f4
        :pswitch_ec
        :pswitch_e8
        :pswitch_d8
        :pswitch_c1
        :pswitch_b3
        :pswitch_a3
        :pswitch_9b
        :pswitch_20
    .end packed-switch
.end method
