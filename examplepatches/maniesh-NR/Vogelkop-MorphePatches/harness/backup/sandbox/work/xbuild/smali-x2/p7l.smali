.class public final synthetic Lp7l;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Ljava/lang/Object;


# direct methods
.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 10
    iput-byte p2, p0, Lp7l;->a:B

    iput-object p1, p0, Lp7l;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method

.method public synthetic constructor <init>(Lmhk;Lve4;)V
    .registers 3

    const/16 p1, 0x9

    iput-byte p1, p0, Lp7l;->a:B

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lp7l;->b:Ljava/lang/Object;

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 6

    iget-byte v0, p0, Lp7l;->a:B

    const/4 v1, 0x0

    const/4 v2, 0x0

    iget-object p0, p0, Lp7l;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_1e6

    check-cast p0, Lw0n;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    iget-object p0, p0, Lw0n;->i:Lt0g;

    invoke-virtual {p0, v0}, Lt0g;->setValue(Ljava/lang/Object;)V

    return-object v0

    :pswitch_13
    check-cast p0, Lplk;

    iget-object p0, p0, Lplk;->a:Ljava/lang/Object;

    check-cast p0, Lgf4;

    invoke-virtual {p0}, Lgf4;->a()Lygh;

    move-result-object p0

    const-class v0, Landroidx/camera/camera2/compat/quirk/UltraWideFlashCaptureUnderexposureQuirk;

    invoke-virtual {p0, v0}, Lygh;->a(Ljava/lang/Class;)Z

    move-result p0

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0

    :pswitch_28
    check-cast p0, Lrlm;

    iput-boolean v1, p0, Lrlm;->g:Z

    iget-object v0, p0, Lrlm;->c:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lnlm;

    invoke-static {v1}, Lrlm;->g(Lnlm;)Lr22;

    move-result-object v1

    sget-object v2, Lv08;->a:Lv08;

    invoke-virtual {p0, v1, v2}, Lrlm;->f(Lr22;Ljava/util/Set;)Lnlm;

    move-result-object p0

    invoke-virtual {v0, p0}, Lekc;->r(Ljava/lang/Object;)V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_44
    check-cast p0, Lhlm;

    iget-object p0, p0, Lhlm;->b:Landroid/content/Context;

    const-string v0, "usp"

    invoke-virtual {p0, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object p0

    return-object p0

    :pswitch_4f
    check-cast p0, Lcom/opera/android/uninstall/UninstallActivity;

    sget v0, Lcom/opera/android/uninstall/UninstallActivity;->e:I

    invoke-virtual {p0}, Landroid/app/Activity;->finish()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_59
    check-cast p0, Lgjm;

    iget-object p0, p0, Lgjm;->e:Lejm;

    iget-object v0, p0, Lejm;->s:Landroid/os/Handler;

    invoke-virtual {v0, p0}, Landroid/os/Handler;->removeCallbacks(Ljava/lang/Runnable;)V

    invoke-virtual {v0, p0}, Landroid/os/Handler;->post(Ljava/lang/Runnable;)Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_68
    check-cast p0, Lini;

    const-class v0, Landroid/content/Context;

    invoke-static {v0}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v0

    invoke-virtual {p0, v0, v2, v2}, Lini;->a(Ls15;Lrhk;Lkotlin/jvm/functions/Function0;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/Context;

    new-instance v0, Lbp;

    const/16 v1, 0x17

    invoke-direct {v0, v1}, Lbp;-><init>(B)V

    :try_start_7d
    const-class v1, Landroid/app/ActivityManager;

    invoke-virtual {p0, v1}, Landroid/content/Context;->getSystemService(Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/app/ActivityManager;

    invoke-virtual {p0}, Landroid/content/Context;->getApplicationInfo()Landroid/content/pm/ApplicationInfo;

    move-result-object p0

    iget p0, p0, Landroid/content/pm/ApplicationInfo;->flags:I

    const/high16 v2, 0x100000

    and-int/2addr p0, v2

    if-eqz p0, :cond_95

    invoke-virtual {v1}, Landroid/app/ActivityManager;->getLargeMemoryClass()I

    move-result p0

    goto :goto_9c

    :cond_95
    invoke-virtual {v1}, Landroid/app/ActivityManager;->getMemoryClass()I

    move-result p0
    :try_end_99
    .catch Ljava/lang/Exception; {:try_start_7d .. :try_end_99} :catch_9a

    goto :goto_9c

    :catch_9a
    const/16 p0, 0x100

    :goto_9c
    int-to-long v1, p0

    const/16 p0, 0x14

    shl-long/2addr v1, p0

    long-to-double v1, v1

    const-wide/high16 v3, 0x3fd0000000000000L    # 0.25

    mul-double/2addr v3, v1

    double-to-long v1, v3

    new-instance p0, Lqq8;

    invoke-direct {p0, v1, v2, v0}, Lqq8;-><init>(JLbp;)V

    new-instance v1, Lamh;

    invoke-direct {v1, p0, v0}, Lamh;-><init>(Lqq8;Lbp;)V

    return-object v1

    :pswitch_b0
    check-cast p0, Lr4m;

    invoke-virtual {p0}, Lr4m;->f0()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_b8
    check-cast p0, Lcom/opera/android/translate_web_pages/TranslateWebPagesDatabase_Impl;

    new-instance v0, Lo3m;

    invoke-direct {v0, p0}, Lo3m;-><init>(Ly5i;)V

    return-object v0

    :pswitch_c0
    check-cast p0, Lmt3;

    invoke-virtual {p0}, Lmt3;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lwul;

    return-object p0

    :pswitch_c9
    check-cast p0, Luvl;

    invoke-virtual {p0}, Luvl;->a()Z

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d1
    check-cast p0, Lpvl;

    invoke-virtual {p0}, Lpvl;->E()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_d9
    check-cast p0, Lcom/opera/android/aiassistant/db/TopAiActivityDatabase_Impl;

    new-instance v0, Lmul;

    invoke-direct {v0, p0}, Lmul;-><init>(Ly5i;)V

    return-object v0

    :pswitch_e1
    check-cast p0, Lctl;

    invoke-virtual {p0}, Lctl;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_e9
    check-cast p0, Lasl;

    iget-object v0, p0, Lasl;->N:Lkotlin/jvm/functions/Function1;

    iget-boolean p0, p0, Lasl;->M:Z

    xor-int/lit8 p0, p0, 0x1

    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {v0, p0}, Lkotlin/jvm/functions/Function1;->invoke(Ljava/lang/Object;)Ljava/lang/Object;

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_fb
    check-cast p0, Lyqa;

    iget-object p0, p0, Lyqa;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/BrowserActivity;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->z0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqjn;

    return-object p0

    :pswitch_10a
    check-cast p0, Lkol;

    invoke-virtual {p0}, Lkol;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_112
    check-cast p0, Lknl;

    iput-object v2, p0, Lknl;->c:Loml;

    invoke-virtual {p0}, Lknl;->c()V

    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_11c
    check-cast p0, Leek;

    invoke-virtual {p0}, Leek;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/concurrent/Executor;

    return-object p0

    :pswitch_125
    check-cast p0, Lp7l;

    invoke-virtual {p0}, Lp7l;->invoke()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/os/Handler;

    return-object p0

    :pswitch_12e
    check-cast p0, Lve4;

    new-instance v0, Landroid/os/HandlerThread;

    const-string v1, "CXCP-Camera-H"

    const/4 v2, -0x3

    invoke-direct {v0, v1, v2}, Landroid/os/HandlerThread;-><init>(Ljava/lang/String;I)V

    invoke-virtual {v0}, Ljava/lang/Thread;->start()V

    sget-object v1, Lte4;->c:Lte4;

    new-instance v2, Lcbl;

    const/4 v3, 0x7

    invoke-direct {v2, v0, v3}, Lcbl;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, v1, v2}, Lve4;->a(Lte4;Ljava/lang/Runnable;)V

    new-instance p0, Landroid/os/Handler;

    invoke-virtual {v0}, Landroid/os/HandlerThread;->getLooper()Landroid/os/Looper;

    move-result-object v0

    invoke-direct {p0, v0}, Landroid/os/Handler;-><init>(Landroid/os/Looper;)V

    return-object p0

    :pswitch_150
    check-cast p0, Lhkl;

    iput-object v2, p0, Lhkl;->y:Lgkl;

    invoke-static {p0}, Laoh;->j(Li0j;)V

    invoke-static {p0}, Lnb6;->F(Le3c;)V

    invoke-static {p0}, Lc26;->y(Llk7;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_160
    check-cast p0, Ldkl;

    iget-object p0, p0, Ldkl;->a:Ljava/lang/String;

    sget-object v0, Lwqm;->a:[Ljava/lang/String;

    invoke-static {p0}, La26;->e0(Ljava/lang/String;)Ljava/net/URL;

    move-result-object p0

    if-eqz p0, :cond_17f

    invoke-virtual {p0}, Ljava/net/URL;->getHost()Ljava/lang/String;

    move-result-object p0

    if-eqz p0, :cond_17f

    invoke-static {p0, v1}, LJ/N;->MnEPjazD(Ljava/lang/Object;Z)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-virtual {p0}, Ljava/lang/String;->length()I

    move-result v0

    if-lez v0, :cond_17f

    move-object v2, p0

    :cond_17f
    return-object v2

    :pswitch_180
    check-cast p0, Lccb;

    invoke-virtual {p0}, Lccb;->c()J

    move-result-wide v0

    new-instance p0, Lybb;

    invoke-direct {p0, v0, v1}, Lybb;-><init>(J)V

    return-object p0

    :pswitch_18c
    check-cast p0, Lcjl;

    new-instance v0, Landroid/view/inputmethod/BaseInputConnection;

    iget-object p0, p0, Lcjl;->a:Lv31;

    invoke-direct {v0, p0, v1}, Landroid/view/inputmethod/BaseInputConnection;-><init>(Landroid/view/View;Z)V

    return-object v0

    :pswitch_196
    check-cast p0, Lagl;

    iget-boolean v0, p0, Lb8e;->n:Z

    if-eqz v0, :cond_1a1

    invoke-static {p0}, Lj7h;->d(Lf17;)Lkfl;

    move-result-object p0

    goto :goto_1a3

    :cond_1a1
    sget-object p0, Lkfl;->b:Lkfl;

    :goto_1a3
    return-object p0

    :pswitch_1a4
    check-cast p0, Landroid/app/RemoteAction;

    invoke-virtual {p0}, Landroid/app/RemoteAction;->getActionIntent()Landroid/app/PendingIntent;

    move-result-object p0

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v1, 0x22

    if-lt v0, v1, :cond_1b4

    invoke-static {p0}, Lg8;->K(Landroid/app/PendingIntent;)V

    goto :goto_1b7

    :cond_1b4
    invoke-virtual {p0}, Landroid/app/PendingIntent;->send()V

    :goto_1b7
    sget-object p0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object p0

    :pswitch_1ba
    check-cast p0, Lvel;

    iput-object v2, p0, Lvel;->C:Luel;

    invoke-static {p0}, Laoh;->j(Li0j;)V

    invoke-static {p0}, Lnb6;->F(Le3c;)V

    invoke-static {p0}, Lc26;->y(Llk7;)V

    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    return-object p0

    :pswitch_1ca
    check-cast p0, Lu8l;

    iget-object v0, p0, Lu8l;->b:Ljava/lang/String;

    invoke-static {v0}, Lz5i;->a0(Ljava/lang/String;)Z

    move-result v1

    if-nez v1, :cond_1dd

    iget-object p0, p0, Lu8l;->c:Lsy3;

    invoke-virtual {p0}, Lsy3;->get()Ljava/lang/Object;

    move-result-object p0

    move-object v0, p0

    check-cast v0, Ljava/lang/String;

    :cond_1dd
    return-object v0

    :pswitch_1de
    check-cast p0, Lcom/opera/android/tabui2/screenshots/TabScreenshotEntryDatabase_Impl;

    new-instance v0, Lf58;

    invoke-direct {v0, p0}, Lf58;-><init>(Ly5i;)V

    return-object v0

    :pswitch_data_1e6
    .packed-switch 0x0
        :pswitch_1de
        :pswitch_1ca
        :pswitch_1ba
        :pswitch_1a4
        :pswitch_196
        :pswitch_18c
        :pswitch_180
        :pswitch_160
        :pswitch_150
        :pswitch_12e
        :pswitch_125
        :pswitch_11c
        :pswitch_112
        :pswitch_10a
        :pswitch_fb
        :pswitch_e9
        :pswitch_e1
        :pswitch_d9
        :pswitch_d1
        :pswitch_c9
        :pswitch_c0
        :pswitch_b8
        :pswitch_b0
        :pswitch_68
        :pswitch_59
        :pswitch_4f
        :pswitch_44
        :pswitch_28
        :pswitch_13
    .end packed-switch
.end method
