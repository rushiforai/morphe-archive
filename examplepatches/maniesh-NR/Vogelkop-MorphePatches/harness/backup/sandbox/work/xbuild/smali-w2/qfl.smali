.class public final synthetic Lqfl;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function1;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 9
    iput-byte p2, p0, Lqfl;->a:B

    iput-object p1, p0, Lqfl;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lqfl;Llrk;)V
    .registers 3

    const/4 p2, 0x2

    iput-byte p2, p0, Lqfl;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lqfl;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke(Ljava/lang/Object;)Ljava/lang/Object;
    .registers 11

    iget-byte v0, p0, Lqfl;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    const/4 v3, 0x0

    iget-object p0, p0, Lqfl;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_3ae

    check-cast p0, Lyzn;

    check-cast p1, Lu65;

    iget-object p0, p0, Lyzn;->l:Lvzn;

    invoke-virtual {p0}, Lvzn;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/api/Callback;

    invoke-interface {p0, p1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c
    check-cast p0, Lcom/opera/android/startup/WelcomeActivity;

    check-cast p1, Lu65;

    sget v0, Lcom/opera/android/startup/WelcomeActivity;->w:I

    invoke-virtual {p0, p1}, Lcom/opera/android/startup/WelcomeActivity;->R(Lu65;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_28
    check-cast p0, Lkxn;

    check-cast p1, Lvb7;

    new-instance p1, Lci;

    const/16 v0, 0xf

    invoke-direct {p1, p0, v0}, Lci;-><init>(Ljava/lang/Object;B)V

    return-object p1

    :pswitch_34
    check-cast p0, Ldwn;

    check-cast p1, Ljava/lang/Throwable;

    sget-object v0, Lhzc;->c:Lgzc;

    const-string v1, "RemoteNode"

    invoke-virtual {v0, v1}, Lhzc;->c(Ljava/lang/String;)Lhzc;

    move-result-object v0

    iget-object v1, v0, Lhzc;->b:Ljava/lang/String;

    sget-object v2, Leaj;->b:Leaj;

    iget-object v4, v0, Lhzc;->a:Letb;

    iget-object v4, v4, Letb;->a:Leaj;

    invoke-virtual {v4, v2}, Ljava/lang/Enum;->compareTo(Ljava/lang/Enum;)I

    move-result v4

    if-gtz v4, :cond_53

    const-string v4, "Closing WS session"

    invoke-virtual {v0, v2, v1, v4, p1}, Lhzc;->b(Leaj;Ljava/lang/String;Ljava/lang/String;Ljava/lang/Throwable;)V

    :cond_53
    iget-object p1, p0, Ldwn;->d:Ljkc;

    invoke-virtual {p1, p0}, Ljkc;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object p1, p0, Ldwn;->b:Lnx5;

    new-instance v0, Lzhl;

    const/4 v1, 0x7

    invoke-direct {v0, v1, v3, p0}, Lzhl;-><init>(BLmt5;Ljava/lang/Object;)V

    const/4 p0, 0x3

    invoke-static {p1, v3, v3, v0, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_67
    check-cast p0, Lsrn;

    move-object v2, p1

    check-cast v2, Lye;

    new-instance v0, Lue;

    iget-object v1, p0, Lsrn;->a:Lcom/opera/android/BrowserActivity;

    new-instance v3, Lyw3;

    invoke-direct {v3, v1}, Lyw3;-><init>(Ldx3;)V

    new-instance v4, Lwth;

    invoke-direct {v4, v1}, Lwth;-><init>(Lcom/opera/android/BrowserActivity;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v5

    iget-object p0, p0, Lsrn;->c:Lnw3;

    invoke-virtual {p0}, Lnw3;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v6, p0

    check-cast v6, Lorm;

    new-instance v7, Lavj;

    const/16 p0, 0x9

    invoke-direct {v7, p0}, Lavj;-><init>(B)V

    sget-object v8, Lte;->Bo:Lqii;

    invoke-direct/range {v0 .. v8}, Lue;-><init>(Landroid/content/Context;Lye;Livn;Lg1j;Lq6e;Lorm;Ljv0;Lte;)V

    return-object v0

    :pswitch_9c
    check-cast p0, Lr2n;

    check-cast p1, Lorb;

    const-string v0, "error"

    iget-object v1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->has(Ljava/lang/String;)Z

    move-result v1

    if-eqz v1, :cond_ca

    invoke-virtual {p1, v0}, Lorb;->c(Ljava/lang/String;)Lorb;

    move-result-object p1

    const-string v0, "code"

    iget-object v1, p1, Lorb;->a:Lorg/json/JSONObject;

    invoke-virtual {v1, v0}, Lorg/json/JSONObject;->getInt(Ljava/lang/String;)I

    move-result v0

    const-string v1, "message"

    invoke-virtual {p1, v1}, Lorb;->e(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    new-instance v1, Lcqb;

    invoke-direct {v1, v0, p1}, Lcqb;-><init>(ILjava/lang/String;)V

    new-instance p1, Lrw7;

    invoke-direct {p1, v1}, Lrw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, p1}, Lr2n;->n(Ltw7;)V

    goto :goto_d4

    :cond_ca
    sget-object p1, Lkotlin/Unit;->a:Lkotlin/Unit;

    new-instance v0, Lsw7;

    invoke-direct {v0, p1}, Lsw7;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p0, v0}, Lr2n;->n(Ltw7;)V

    :goto_d4
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d7
    check-cast p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;

    check-cast p1, Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/weather/ui/WeatherWidgetActivity;->X:Lr9i;

    if-eqz p0, :cond_e0

    move-object v3, p0

    :cond_e0
    iget-object p0, v3, Lr9i;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/webcore/WebcoreRpcBridge;

    invoke-virtual {p0, p1}, Lcom/opera/android/webcore/WebcoreRpcBridge;->a(Ljava/lang/String;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_ea
    check-cast p0, Ljl6;

    check-cast p1, Ls4i;

    iget-object p0, p0, Ljl6;->g:Ljava/lang/Object;

    check-cast p0, Ljmn;

    sget-object v0, Ls4i;->a:Ls4i;

    if-ne p1, v0, :cond_fd

    iget-object v0, p0, Ljmn;->z:Lkmn;

    iget-object v0, v0, Lkmn;->j:Landroid/view/View;

    invoke-virtual {p0, v0}, Ljmn;->I0(Landroid/view/View;)V

    :cond_fd
    sget-object v0, Ls4i;->c:Ls4i;

    if-ne p1, v0, :cond_110

    iget-object p1, p0, Ljmn;->I:Le4i;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    sget-object v0, Lo3i;->e:Lo3i;

    sget-object v1, Lzj6;->b:Lgpm;

    iget-object v1, v1, Lgpm;->g:Ljava/lang/String;

    invoke-virtual {p1, p0, v0, v1}, Le4i;->a(Lndc;Lo3i;Ljava/lang/String;)V

    :cond_110
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_113
    check-cast p0, Lukn;

    check-cast p1, Ljava/lang/Boolean;

    iget-boolean p1, p0, Lukn;->I:Z

    xor-int/2addr p1, v1

    iput-boolean p1, p0, Lukn;->I:Z

    iget-object p0, p0, Lukn;->D:Lqkn;

    if-eqz p0, :cond_123

    invoke-virtual {p0, p1}, Lqkn;->c(Z)V

    :cond_123
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_126
    check-cast p0, Lysm;

    check-cast p1, Lfd4;

    iget-object p0, p0, Lysm;->a:Lqe4;

    iget-object v1, p0, Lqe4;->c:Ljava/lang/Object;

    monitor-enter v1

    :try_start_12f
    iget-boolean v0, p0, Lqe4;->d:Z

    if-nez v0, :cond_157

    new-instance v0, Lld4;

    new-instance v2, Ljava/lang/StringBuilder;

    const-string v3, "CameraGraph-"

    invoke-direct {v2, v3}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    sget-object v3, Lld4;->b:Lbf2;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v4, Lbf2;->b:Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;

    invoke-virtual {v4, v3}, Ljava/util/concurrent/atomic/AtomicIntegerFieldUpdater;->incrementAndGet(Ljava/lang/Object;)I

    move-result v3

    invoke-virtual {v2, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v2

    invoke-direct {v0, v2}, Lld4;-><init>(Ljava/lang/String;)V

    invoke-virtual {p0, p1, v0}, Lqe4;->c(Lfd4;Lld4;)Lnd4;

    move-result-object p0
    :try_end_155
    .catchall {:try_start_12f .. :try_end_155} :catchall_15f

    monitor-exit v1

    return-object p0

    :cond_157
    :try_start_157
    new-instance p0, Ljava/lang/IllegalStateException;

    const-string p1, "Check failed."

    invoke-direct {p0, p1}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V

    throw p0
    :try_end_15f
    .catchall {:try_start_157 .. :try_end_15f} :catchall_15f

    :catchall_15f
    move-exception v0

    move-object p0, v0

    monitor-exit v1

    throw p0

    :pswitch_163
    check-cast p0, Lhjf;

    check-cast p1, Lkotlin/Unit;

    invoke-static {p0}, Lw1h;->n(Landroid/content/ContextWrapper;)Lmlm;

    move-result-object p1

    iget-boolean v0, p1, Lmlm;->b:Z

    iget-boolean p1, p1, Lmlm;->a:Z

    if-eqz p1, :cond_176

    if-eqz v0, :cond_176

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    goto :goto_1aa

    :cond_176
    :try_start_176
    sget-object v1, Lwwc;->a:Ljava/util/Locale;

    invoke-static {p0, v1}, Lw1h;->i(Landroid/content/ContextWrapper;Ljava/util/Locale;)Lnhj;

    move-result-object v3

    invoke-static {p0, v1}, Lwwc;->h(Landroid/content/Context;Ljava/util/Locale;)Landroid/content/Context;

    move-result-object v4

    if-nez p1, :cond_189

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {v4, p1}, Lphj;->u(Landroid/content/Context;Ljava/util/List;)V

    :cond_189
    if-nez v0, :cond_192

    invoke-static {v3}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-static {v4, p1}, Lphj;->O(Landroid/content/Context;Ljava/util/List;)V

    :cond_192
    invoke-virtual {v1}, Ljava/util/Locale;->toString()Ljava/lang/String;

    move-result-object p1

    const-string v0, "uninstall_survey"

    invoke-virtual {p0, v0, v2}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "uninstall_shortcut_last_locale"

    invoke-interface {p0, v0, p1}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V
    :try_end_1a8
    .catch Ljava/lang/IllegalArgumentException; {:try_start_176 .. :try_end_1a8} :catch_1a8
    .catch Ljava/lang/IllegalStateException; {:try_start_176 .. :try_end_1a8} :catch_1a8

    :catch_1a8
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    :goto_1aa
    return-object p0

    :pswitch_1ab
    check-cast p0, Lcom/opera/android/settings/SettingsManager;

    check-cast p1, Lcom/opera/android/settings/SettingsManager;

    const-string p1, "ga_usage_statistics"

    invoke-virtual {p0, p1}, Lcom/opera/android/settings/SettingsManager;->i(Ljava/lang/String;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_1ba
    check-cast p0, Lqfl;

    check-cast p1, Ljava/lang/String;

    invoke-virtual {p0, p1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1c4
    check-cast p0, Lhlm;

    check-cast p1, Lkotlin/Unit;

    iget-object p0, p0, Lhlm;->c:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string p1, "uid"

    invoke-interface {p0, p1, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    return-object p0

    :pswitch_1d7
    check-cast p0, Lp7l;

    check-cast p1, Lt0i;

    invoke-virtual {p0}, Lp7l;->invoke()Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1e1
    check-cast p0, Lw6j;

    check-cast p1, Ljava/lang/String;

    iput-object p1, p0, Lw6j;->e:Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ea
    check-cast p0, Lcom/opera/android/uninstall/UninstallActivity;

    check-cast p1, Landroid/content/Intent;

    sget v0, Lcom/opera/android/uninstall/UninstallActivity;->e:I

    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1f6
    check-cast p0, Llt5;

    check-cast p1, Lt15;

    const-string v0, "first"

    iget-object v1, p0, Llt5;->b:Lkotlinx/serialization/KSerializer;

    invoke-interface {v1}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v1

    invoke-static {p1, v0, v1}, Lt15;->b(Lt15;Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;)V

    const-string v0, "second"

    iget-object v1, p0, Llt5;->c:Ljava/lang/Object;

    check-cast v1, Lkotlinx/serialization/KSerializer;

    invoke-interface {v1}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object v1

    sget-object v2, Ll08;->a:Ll08;

    invoke-virtual {p1, v0, v1, v2}, Lt15;->a(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;)V

    const-string v0, "third"

    iget-object p0, p0, Llt5;->d:Ljava/lang/Object;

    check-cast p0, Lkotlinx/serialization/KSerializer;

    invoke-interface {p0}, Lkotlinx/serialization/KSerializer;->getDescriptor()Lkotlinx/serialization/descriptors/SerialDescriptor;

    move-result-object p0

    invoke-virtual {p1, v0, p0, v2}, Lt15;->a(Ljava/lang/String;Lkotlinx/serialization/descriptors/SerialDescriptor;Ljava/util/List;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_224
    check-cast p0, Ly5g;

    check-cast p1, Ln6j;

    iget-object p0, p0, Ly5g;->i:Lex4;

    check-cast p0, Luj;

    iget-char p0, p0, Lv6j;->a:C

    invoke-virtual {p1, p0}, Ln6j;->a(I)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_234
    check-cast p0, Lkwl;

    check-cast p1, Ljava/lang/Throwable;

    iput-object v3, p0, Lkwl;->j:Lcd5;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_23d
    check-cast p0, Lg7m;

    check-cast p1, Lvul;

    invoke-virtual {p0}, Lg7m;->o()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_247
    check-cast p0, Lwul;

    iget-object v0, p0, Lwul;->a:Landroid/view/View;

    check-cast p1, Lxul;

    iget-object v1, p0, Lwul;->b:Landroid/view/View;

    iget-boolean v3, p1, Lxul;->c:Z

    if-eqz v3, :cond_255

    move v3, v2

    goto :goto_257

    :cond_255
    const/16 v3, 0x8

    :goto_257
    invoke-virtual {v1, v3}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lwul;->c:Lpde;

    new-instance v1, Lvul;

    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v3

    if-nez v3, :cond_269

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v3

    goto :goto_270

    :cond_269
    invoke-virtual {v0, v2, v2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v3

    :goto_270
    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v4

    if-nez v4, :cond_27b

    invoke-virtual {v0}, Landroid/view/View;->getHeight()I

    move-result v2

    goto :goto_282

    :cond_27b
    invoke-virtual {v0, v2, v2}, Landroid/view/View;->measure(II)V

    invoke-virtual {v0}, Landroid/view/View;->getMeasuredHeight()I

    move-result v2

    :goto_282
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v4, 0x7f070a00

    invoke-virtual {v0, v4}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    add-int/2addr v0, v2

    invoke-direct {v1, v3, v0, p1}, Lvul;-><init>(IILxul;)V

    invoke-static {p0, v1}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_297
    check-cast p0, Latl;

    check-cast p1, Lndc;

    iget-object p0, p0, Latl;->b:Lqdc;

    sget-object p1, Lqcc;->a:Lqcc;

    invoke-virtual {p0, p1}, Lqdc;->g(Lqcc;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2a5
    check-cast p0, Lkol;

    check-cast p1, Ldwh;

    new-instance v0, Lc69;

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object v2

    iget-object v2, v2, Lcyj;->d:Lrxj;

    iget v2, v2, Lrxj;->a:I

    invoke-virtual {p0}, Lkol;->a()Lcyj;

    move-result-object p0

    iget-object p0, p0, Lcyj;->d:Lrxj;

    iget p0, p0, Lrxj;->b:I

    invoke-direct {v0, v2, p0, v1}, Lc69;-><init>(IIB)V

    iget-object p0, p1, Ldwh;->b:Lgvh;

    invoke-virtual {p0, v0}, Lgvh;->c(Le2m;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2c6
    check-cast p0, Lzwg;

    check-cast p1, Ldwh;

    invoke-virtual {p0}, Lzwg;->k()Le2m;

    move-result-object p0

    if-eqz p0, :cond_2d5

    iget-object v0, p1, Ldwh;->b:Lgvh;

    invoke-virtual {v0, p0}, Lgvh;->c(Le2m;)V

    :cond_2d5
    sget-object p0, Lkol;->t:Landroid/graphics/Bitmap$Config;

    invoke-virtual {p1, p0}, Ldwh;->c(Landroid/graphics/Bitmap$Config;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_2dd
    check-cast p0, Ltjl;

    check-cast p1, Lrf1;

    iget-object v0, p1, Lrf1;->a:Ljava/lang/Object;

    check-cast v0, Lof1;

    instance-of v1, v0, Lofc;

    const/16 v3, 0xe

    if-eqz v1, :cond_300

    move-object v1, v0

    check-cast v1, Lofc;

    iget-object v4, v1, Lofc;->b:Ltjl;

    if-nez v4, :cond_300

    iget-object v0, v1, Lofc;->a:Ljava/lang/String;

    iget-object v1, v1, Lofc;->c:Ltfc;

    new-instance v4, Lofc;

    invoke-direct {v4, v0, p0, v1}, Lofc;-><init>(Ljava/lang/String;Ltjl;Ltfc;)V

    invoke-static {p1, v4, v2, v3}, Lrf1;->a(Lrf1;Lof1;II)Lrf1;

    move-result-object p1

    goto :goto_317

    :cond_300
    instance-of v1, v0, Lnfc;

    if-eqz v1, :cond_317

    check-cast v0, Lnfc;

    iget-object v1, v0, Lnfc;->b:Ltjl;

    if-nez v1, :cond_317

    iget-object v1, v0, Lnfc;->a:Ljava/lang/String;

    iget-object v0, v0, Lnfc;->c:Lz8k;

    new-instance v4, Lnfc;

    invoke-direct {v4, v1, p0, v0}, Lnfc;-><init>(Ljava/lang/String;Ltjl;Lz8k;)V

    invoke-static {p1, v4, v2, v3}, Lrf1;->a(Lrf1;Lof1;II)Lrf1;

    move-result-object p1

    :cond_317
    :goto_317
    return-object p1

    :pswitch_318
    check-cast p0, Lvhl;

    check-cast p1, Ljava/lang/Float;

    invoke-virtual {p1}, Ljava/lang/Float;->floatValue()F

    move-result p1

    iget-object v0, p0, Lvhl;->a:Lp0g;

    invoke-virtual {v0}, Lp0g;->h()F

    move-result v1

    add-float/2addr v1, p1

    iget-object p0, p0, Lvhl;->b:Lp0g;

    invoke-virtual {p0}, Lp0g;->h()F

    move-result v2

    cmpl-float v2, v1, v2

    if-lez v2, :cond_33c

    invoke-virtual {p0}, Lp0g;->h()F

    move-result p0

    invoke-virtual {v0}, Lp0g;->h()F

    move-result p1

    sub-float p1, p0, p1

    goto :goto_346

    :cond_33c
    const/4 p0, 0x0

    cmpg-float p0, v1, p0

    if-gez p0, :cond_346

    invoke-virtual {v0}, Lp0g;->h()F

    move-result p0

    neg-float p1, p0

    :cond_346
    :goto_346
    invoke-virtual {v0}, Lp0g;->h()F

    move-result p0

    add-float/2addr p0, p1

    invoke-virtual {v0, p0}, Lp0g;->i(F)V

    invoke-static {p1}, Ljava/lang/Float;->valueOf(F)Ljava/lang/Float;

    move-result-object p0

    return-object p0

    :pswitch_353
    check-cast p0, Lqfl;

    check-cast p1, Lu5m;

    instance-of v0, p1, Lcv;

    if-eqz v0, :cond_365

    check-cast p1, Lcv;

    iget-object p1, p1, Lcv;->o:Lz3;

    invoke-virtual {p0, p1}, Lqfl;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object v3, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    goto :goto_36a

    :cond_365
    const-string p0, "TextContextMenuDataNode.TraverseKey key must only be attached to instances of TextContextMenuDataNode."

    invoke-static {p0}, Lqp2;->n(Ljava/lang/String;)V

    :goto_36a
    return-object v3

    :pswitch_36b
    check-cast p0, Lifl;

    check-cast p1, Lkotlin/jvm/functions/Function1;

    invoke-interface {p1, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_375
    check-cast p0, Landroid/graphics/drawable/Drawable;

    check-cast p1, Lmk7;

    invoke-interface {p1}, Lmk7;->s0()Ld5o;

    move-result-object v0

    invoke-virtual {v0}, Ld5o;->A()Lsh4;

    move-result-object v0

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v3

    const/16 v1, 0x20

    shr-long/2addr v3, v1

    long-to-int v1, v3

    invoke-static {v1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result v1

    float-to-int v1, v1

    invoke-interface {p1}, Lmk7;->e()J

    move-result-wide v3

    const-wide v5, 0xffffffffL

    and-long/2addr v3, v5

    long-to-int p1, v3

    invoke-static {p1}, Ljava/lang/Float;->intBitsToFloat(I)F

    move-result p1

    float-to-int p1, p1

    invoke-virtual {p0, v2, v2, v1, p1}, Landroid/graphics/drawable/Drawable;->setBounds(IIII)V

    sget-object p1, Lb31;->a:Landroid/graphics/Canvas;

    check-cast v0, La31;

    iget-object p1, v0, La31;->a:Landroid/graphics/Canvas;

    invoke-virtual {p0, p1}, Landroid/graphics/drawable/Drawable;->draw(Landroid/graphics/Canvas;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    nop

    :pswitch_data_3ae
    .packed-switch 0x0
        :pswitch_375
        :pswitch_36b
        :pswitch_353
        :pswitch_318
        :pswitch_2dd
        :pswitch_2c6
        :pswitch_2a5
        :pswitch_297
        :pswitch_247
        :pswitch_23d
        :pswitch_234
        :pswitch_224
        :pswitch_1f6
        :pswitch_1ea
        :pswitch_1e1
        :pswitch_1d7
        :pswitch_1c4
        :pswitch_1ba
        :pswitch_1ab
        :pswitch_163
        :pswitch_126
        :pswitch_113
        :pswitch_ea
        :pswitch_d7
        :pswitch_9c
        :pswitch_67
        :pswitch_34
        :pswitch_28
        :pswitch_1c
    .end packed-switch
.end method
