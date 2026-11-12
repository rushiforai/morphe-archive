.class public final Lcom/opera/android/esim/ui/EsimActivity;
.super Lrz4;
.source "SourceFile"


# annotations
.annotation runtime Lkotlin/Metadata;
    d1 = {
        "\u0000\u000c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0008\u0006\u0008\u0007\u0018\u00002\u00020\u0001:\u0003\u0004\u0005\u0006B\u0007\u00a2\u0006\u0004\u0008\u0002\u0010\u0003\u00a8\u0006\u0007"
    }
    d2 = {
        "Lcom/opera/android/esim/ui/EsimActivity;",
        "Lrz4;",
        "<init>",
        "()V",
        "wy3",
        "fz4",
        "cv3",
        "app"
    }
    k = 0x1
    mv = {
        0x2,
        0x4,
        0x0
    }
    xi = 0x30
.end annotation


# static fields
.field public static final synthetic f0:I


# instance fields
.field public final O:Lw6j;

.field public final P:Lga6;

.field public final Q:Lcv3;

.field public final R:Lzyk;

.field public final S:Lzyk;

.field public final T:Lay;

.field public U:Lv78;

.field public V:Ld06;

.field public W:Lala;

.field public X:Leyi;

.field public Y:Ls9i;

.field public Z:Lor2;

.field public a0:Lgha;

.field public b0:Lwy3;

.field public c0:Lfz4;

.field public d0:Z

.field public e0:Landroid/net/Uri;


# direct methods
.method public constructor <init>()V
    .registers 8

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Lrz4;-><init>(I)V

    new-instance v1, Lt68;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Lt68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v3, Lw6j;

    const-class v4, Lu78;

    invoke-static {v4}, Luqh;->a(Ljava/lang/Class;)Ls15;

    move-result-object v4

    new-instance v5, Ld78;

    invoke-direct {v5, p0, v2}, Ld78;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v6, Ld78;

    invoke-direct {v6, p0, v0}, Ld78;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    invoke-direct {v3, v4, v5, v1, v6}, Lw6j;-><init>(Ls15;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;)V

    iput-object v3, p0, Lcom/opera/android/esim/ui/EsimActivity;->O:Lw6j;

    new-instance v1, Lga6;

    const/16 v3, 0x11

    invoke-direct {v1, v3, v2}, Lga6;-><init>(BZ)V

    iput-object v1, p0, Lcom/opera/android/esim/ui/EsimActivity;->P:Lga6;

    new-instance v1, Lcv3;

    invoke-direct {v1, p0, v0}, Lcv3;-><init>(Ldx3;B)V

    iput-object v1, p0, Lcom/opera/android/esim/ui/EsimActivity;->Q:Lcv3;

    new-instance v1, Lt68;

    invoke-direct {v1, p0, v0}, Lt68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->R:Lzyk;

    new-instance v0, Lt68;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lt68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    invoke-static {v0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object v0

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->S:Lzyk;

    new-instance v0, Lay;

    const/4 v1, 0x6

    invoke-direct {v0, p0, v1}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->T:Lay;

    return-void
.end method

.method public static final synthetic F0(Lcom/opera/android/esim/ui/EsimActivity;)V
    .registers 1

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    return-void
.end method


# virtual methods
.method public final C()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->X:Leyi;

    if-nez v0, :cond_5

    const/4 v0, 0x0

    :cond_5
    iget-object v1, v0, Leyi;->d:Ljava/lang/Object;

    check-cast v1, Lkze;

    iget-object v2, v0, Leyi;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/settings/SettingsManager;

    iget-boolean v0, v0, Leyi;->b:Z

    if-eqz v0, :cond_14

    const-string v0, "ofa-private-mode"

    goto :goto_20

    :cond_14
    invoke-virtual {v2}, Lcom/opera/android/settings/SettingsManager;->g()Lg7j;

    move-result-object v0

    iget-object v0, v0, Lg7j;->d:Ljava/lang/String;

    const-string v2, "ofa-"

    invoke-virtual {v2, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    :goto_20
    invoke-static {v1, v0}, Lxf8;->G0(Lkze;Ljava/lang/Object;)Z

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->C()V

    invoke-virtual {p0}, Lxd5;->invalidateMenu()V

    return-void
.end method

.method public final C0(Lcom/opera/android/browser/chromium/ChromiumContent;)Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;
    .registers 4

    sget-object v0, Ll08;->a:Ll08;

    new-instance v1, Laeb;

    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->T:Lay;

    invoke-direct {v1, p1, p0, v0}, Laeb;-><init>(Lcom/opera/android/browser/chromium/ChromiumContent;Lcom/opera/android/Lazy;Ljava/util/List;)V

    iget-object p0, v1, Laeb;->g:Lzdb;

    return-object p0
.end method

.method public final D0(Lorg/chromium/content_public/browser/WebContents;)V
    .registers 13

    new-instance v0, Ls9i;

    iget-object v1, p0, Lcom/opera/android/esim/ui/EsimActivity;->W:Lala;

    const/4 v2, 0x0

    if-nez v1, :cond_8

    move-object v1, v2

    :cond_8
    invoke-direct {v0, p0, p1, v1}, Ls9i;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lorg/chromium/content_public/browser/WebContents;Lala;)V

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->Y:Ls9i;

    iget-object p1, p0, Lcom/opera/android/esim/ui/EsimActivity;->V:Ld06;

    if-nez p1, :cond_12

    move-object p1, v2

    :cond_12
    iget-object p1, p1, Ld06;->a:Ljava/lang/Object;

    check-cast p1, Lplh;

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {p1, v0}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object p1

    invoke-static {p1}, Lqbe;->t(Lf99;)Lf99;

    move-result-object p1

    new-instance v3, Lte5;

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->Y:Ls9i;

    if-nez v0, :cond_29

    move-object v0, v2

    :cond_29
    iget-object v0, v0, Ls9i;->e:Ljava/lang/Object;

    move-object v5, v0

    check-cast v5, Ls98;

    const/4 v9, 0x4

    const/4 v10, 0x1

    const/4 v4, 0x2

    const-class v6, Ls98;

    const-string v7, "viewsV1NotifyHostStateChanged"

    const-string v8, "viewsV1NotifyHostStateChanged(Lcom/opera/android/genapi/esimrpc/HostState;)V"

    invoke-direct/range {v3 .. v10}, Lte5;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v0, Lz99;

    const/4 v1, 0x2

    invoke-direct {v0, p1, v3, v1}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-static {p1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object p1

    invoke-static {v0, p1}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    iget-object p1, p0, Lcom/opera/android/esim/ui/EsimActivity;->X:Leyi;

    if-eqz p1, :cond_50

    move-object v2, p1

    :cond_50
    iget-object p1, v2, Leyi;->d:Ljava/lang/Object;

    check-cast p1, Lkze;

    new-instance v0, Lu68;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lu68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;B)V

    new-instance v1, Lcl4;

    const/16 v2, 0x10

    invoke-direct {v1, v0, v2}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p0, v1}, Lekc;->j(Lndc;Lf7f;)V

    return-void
.end method

.method public final G0()Lu78;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->O:Lw6j;

    invoke-virtual {p0}, Lw6j;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lu78;

    return-object p0
.end method

.method public final finish()V
    .registers 3

    invoke-static {p0}, Ljoh;->p(Landroid/app/Activity;)Z

    move-result v0

    if-eqz v0, :cond_1c

    new-instance v0, Landroid/content/Intent;

    const-class v1, Lcom/opera/android/BrowserActivity;

    invoke-direct {v0, p0, v1}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    const-string v1, "android.intent.action.MAIN"

    invoke-virtual {v0, v1}, Landroid/content/Intent;->setAction(Ljava/lang/String;)Landroid/content/Intent;

    move-result-object v0

    const/high16 v1, 0x10000000

    invoke-virtual {v0, v1}, Landroid/content/Intent;->addFlags(I)Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    :cond_1c
    invoke-super {p0}, Landroid/app/Activity;->finish()V

    return-void
.end method

.method public final h0()Ljava/lang/String;
    .registers 1

    const-string p0, "android.intent.action.VIEW"

    return-object p0
.end method

.method public final i0(Lcom/opera/android/FullscreenWebActivity;)I
    .registers 3

    const p0, 0x7f0402f0

    const v0, 0x7f061084

    invoke-static {p0, p1, v0}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p0

    return p0
.end method

.method public final j0()I
    .registers 1

    const p0, 0x7f0d0126

    return p0
.end method

.method public final k0()Landroid/net/Uri;
    .registers 2

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->e0:Landroid/net/Uri;

    if-nez v0, :cond_d

    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->S:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/net/Uri;

    return-object p0

    :cond_d
    return-object v0
.end method

.method public final l0(Landroid/content/Context;)Landroid/graphics/drawable/Drawable;
    .registers 4

    const p0, 0x7f0804f2

    invoke-static {p0, p1}, Lj14;->i0(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object p0

    const v0, 0x7f040216

    const v1, 0x7f061084

    invoke-static {v0, p1, v1}, Lf03;->t(ILandroid/content/Context;I)I

    move-result p1

    invoke-static {p0, p1}, Lj14;->n0(Landroid/graphics/drawable/Drawable;I)V

    return-object p0
.end method

.method public final m0()Ljava/lang/CharSequence;
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v0

    iget-object v0, v0, Lu78;->n:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li78;

    iget-object v0, v0, Li78;->a:Lh78;

    iget-object v0, v0, Lh78;->a:Lpxh;

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {v0, p0}, Lpxh;->a(Landroid/content/res/Resources;)Ljava/lang/CharSequence;

    move-result-object p0

    return-object p0
.end method

.method public final o0(Lorg/chromium/content_public/browser/NavigationController;)Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v0

    iget-object v0, v0, Lu78;->n:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li78;

    iget-object v0, v0, Li78;->a:Lh78;

    iget-object v0, v0, Lh78;->c:Lg78;

    invoke-virtual {v0}, Ljava/lang/Enum;->ordinal()I

    move-result v0

    if-eqz v0, :cond_22

    const/4 p0, 0x1

    if-ne v0, p0, :cond_1d

    const/4 p0, 0x0

    return p0

    :cond_1d
    invoke-static {}, Lh9o;->p()V

    const/4 p0, 0x0

    return p0

    :cond_22
    invoke-super {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->o0(Lorg/chromium/content_public/browser/NavigationController;)Z

    move-result p0

    return p0
.end method

.method public final onDestroy()V
    .registers 3

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onDestroy()V

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->b0:Lwy3;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lrtn;->g()V

    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->b0:Lwy3;

    iget-object v1, p0, Lcom/opera/android/esim/ui/EsimActivity;->c0:Lfz4;

    if-eqz v1, :cond_14

    invoke-virtual {v1}, Lrtn;->g()V

    :cond_14
    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->c0:Lfz4;

    iget-object v1, p0, Lcom/opera/android/esim/ui/EsimActivity;->Q:Lcv3;

    invoke-virtual {p0, v1}, Ldx3;->b0(Lcv3;)V

    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->a0:Lgha;

    if-eqz p0, :cond_22

    invoke-virtual {p0, v0}, Lgha;->c(Lxc0;)V

    :cond_22
    return-void
.end method

.method public final onNewIntent(Landroid/content/Intent;)V
    .registers 5

    invoke-super {p0, p1}, Lhjf;->onNewIntent(Landroid/content/Intent;)V

    iget-object p0, p0, Lcom/opera/android/esim/ui/EsimActivity;->a0:Lgha;

    if-eqz p0, :cond_2b

    invoke-virtual {p1}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object p1

    sget-object v0, La98;->c:La98;

    if-eqz p1, :cond_29

    const-string v1, "ESIM_ATTRIBUTION_RESOLVED"

    const/4 v2, 0x0

    invoke-virtual {p1, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-eqz v1, :cond_29

    new-instance v0, La98;

    const-string v1, "ESIM_SOURCE"

    invoke-virtual {p1, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v2, "ESIM_CAMPAIGN"

    invoke-virtual {p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p1

    invoke-direct {v0, v1, p1}, La98;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_29
    iput-object v0, p0, Lgha;->c:La98;

    :cond_2b
    return-void
.end method

.method public final onResume()V
    .registers 2

    invoke-super {p0}, Lrz4;->onResume()V

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v0

    iget-object v0, v0, Lu78;->n:Lrlh;

    iget-object v0, v0, Lrlh;->a:Lnak;

    invoke-virtual {v0}, Lnak;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Li78;

    iget-object v0, v0, Li78;->b:Lm78;

    instance-of v0, v0, Lk78;

    if-eqz v0, :cond_1f

    iget-object p0, p0, Lrz4;->N:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p0, :cond_1f

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/browser/chromium/ChromiumContent;->x(Z)V

    :cond_1f
    return-void
.end method

.method public final onSupportNavigateUp()Z
    .registers 3

    invoke-virtual {p0}, Lcom/opera/android/FullscreenWebActivity;->n0()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v0

    if-eqz v0, :cond_b

    invoke-interface {v0}, Lorg/chromium/content_public/browser/WebContents;->q()Lorg/chromium/content_public/browser/NavigationController;

    move-result-object v0

    goto :goto_c

    :cond_b
    const/4 v0, 0x0

    :goto_c
    invoke-virtual {p0, v0}, Lcom/opera/android/esim/ui/EsimActivity;->o0(Lorg/chromium/content_public/browser/NavigationController;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_14

    return v1

    :cond_14
    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->finish()V

    return v1
.end method

.method public final p0()V
    .registers 5

    iget-boolean v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->d0:Z

    if-eqz v0, :cond_5

    return-void

    :cond_5
    const/4 v0, 0x1

    iput-boolean v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->d0:Z

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->e0:Landroid/net/Uri;

    if-nez v0, :cond_20

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v0}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v0

    new-instance v1, Lw68;

    const/4 v2, 0x0

    const/4 v3, 0x0

    invoke-direct {v1, p0, v3, v2}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    const/4 p0, 0x3

    invoke-static {v0, v3, v3, v1, p0}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :cond_20
    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .registers 20

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    new-instance v2, Lv78;

    iget-object v3, v0, Lcom/opera/android/esim/ui/EsimActivity;->R:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldp6;

    const/4 v4, 0x0

    invoke-direct {v2, v3, v4}, Lv78;-><init>(Ljava/lang/Object;B)V

    iput-object v2, v0, Lcom/opera/android/esim/ui/EsimActivity;->U:Lv78;

    invoke-virtual {v0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v2

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v2}, Lp7n;->a(Ll7n;)Lf65;

    move-result-object v3

    new-instance v5, Lq78;

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-direct {v5, v2, v7, v6}, Lq78;-><init>(Lu78;Lmt5;B)V

    const/4 v2, 0x3

    invoke-static {v3, v7, v7, v5, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    move-object v9, v1

    check-cast v9, Landroid/widget/FrameLayout;

    const v3, 0x7f0a0129

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Landroid/widget/FrameLayout;

    const-string v6, "Missing required view with ID: "

    if-eqz v5, :cond_1b3

    const v3, 0x7f0a03b5

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1b3

    const v3, 0x7f0a01a4

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v12, v8

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaIconedMessage;

    if-eqz v12, :cond_1a3

    const v3, 0x7f0a0102

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v13, v8

    check-cast v13, Lcom/google/android/material/button/MaterialButton;

    if-eqz v13, :cond_1a3

    const v3, 0x7f0a02eb

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v14, v8

    check-cast v14, Landroid/widget/TextView;

    if-eqz v14, :cond_1a3

    const v3, 0x7f0a079b

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_1a3

    const v3, 0x7f0a0af4

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v16, v8

    check-cast v16, Landroid/widget/TextView;

    if-eqz v16, :cond_1a3

    new-instance v10, Lpt1;

    move-object v11, v5

    check-cast v11, Landroid/widget/LinearLayout;

    const/16 v17, 0x6

    invoke-direct/range {v10 .. v17}, Lpt1;-><init>(Landroid/widget/LinearLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    const v3, 0x7f0a03b6

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1b3

    const v3, 0x7f0a03ad

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v13, v8

    check-cast v13, Landroid/widget/TextView;

    if-eqz v13, :cond_193

    const v3, 0x7f0a0322

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v14, v8

    check-cast v14, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v14, :cond_193

    const v3, 0x7f0a06b5

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Landroid/widget/TextView;

    if-eqz v15, :cond_193

    const v3, 0x7f0a08f0

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v16, v8

    check-cast v16, Lcom/google/android/material/button/MaterialButton;

    if-eqz v16, :cond_193

    new-instance v11, Lv88;

    move-object v12, v5

    check-cast v12, Landroid/widget/LinearLayout;

    const/16 v17, 0x0

    invoke-direct/range {v11 .. v17}, Lv88;-><init>(Landroid/widget/LinearLayout;Landroid/widget/TextView;Lcom/opera/android/custom_views/StylingImageView;Landroid/widget/TextView;Lcom/google/android/material/button/MaterialButton;B)V

    const v3, 0x7f0a0617

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_1b3

    const v3, 0x7f0a0aad

    invoke-static {v3, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v8, :cond_183

    new-instance v12, Lb98;

    check-cast v5, Landroid/widget/FrameLayout;

    invoke-direct {v12, v5, v4}, Lb98;-><init>(Landroid/widget/FrameLayout;B)V

    const v3, 0x7f0a07d6

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v13, v4

    check-cast v13, Landroid/widget/FrameLayout;

    if-eqz v13, :cond_1b3

    const v3, 0x7f0a04f5

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/ToolbarProgressBar;

    if-eqz v4, :cond_1b3

    const v3, 0x7f0a0bba

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/LayoutDirectionToolbar;

    if-eqz v4, :cond_1b3

    const v3, 0x7f0a0bbb

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_1b3

    const v3, 0x7f0a0cda

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_1b3

    new-instance v8, Lor2;

    const/16 v14, 0x8

    invoke-direct/range {v8 .. v14}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v8, v0, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v1

    iget-object v3, v0, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez v3, :cond_13b

    move-object v3, v7

    :cond_13b
    iget-object v3, v3, Lor2;->b:Ljava/lang/Object;

    check-cast v3, Landroid/widget/FrameLayout;

    invoke-virtual {v1, v3}, Lqwe;->b(Landroid/view/View;)V

    iget-object v1, v0, Lcom/opera/android/esim/ui/EsimActivity;->Z:Lor2;

    if-nez v1, :cond_147

    move-object v1, v7

    :cond_147
    iget-object v1, v1, Lor2;->e:Ljava/lang/Object;

    check-cast v1, Lv88;

    iget-object v1, v1, Lv88;->f:Lcom/google/android/material/button/MaterialButton;

    new-instance v3, Lyk4;

    const/16 v4, 0x15

    invoke-direct {v3, v0, v4}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Ly68;

    invoke-direct {v1, v0}, Ly68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;)V

    sget-object v3, Lqcc;->e:Lqcc;

    invoke-virtual {v0, v1, v0, v3}, Lxd5;->addMenuProvider(Lmud;Lndc;Lqcc;)V

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v1

    new-instance v3, Lw68;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v7, v4}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    invoke-static {v1, v7, v7, v3, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v1

    new-instance v3, Lw68;

    invoke-direct {v3, v0, v7, v2}, Lw68;-><init>(Lcom/opera/android/esim/ui/EsimActivity;Lmt5;B)V

    invoke-static {v1, v7, v7, v3, v2}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    return-void

    :cond_183
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_193
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1a3
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_1b3
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v6, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final v0()V
    .registers 20

    move-object/from16 v0, p0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v2, v0, Lcom/opera/android/esim/ui/EsimActivity;->R:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldp6;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {v4}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v4

    new-instance v5, Ld06;

    new-instance v8, Leq6;

    iget-object v6, v3, Ldp6;->a:Li88;

    invoke-direct {v8, v6}, Leq6;-><init>(Ljava/lang/Object;)V

    new-instance v9, Lxm5;

    invoke-direct {v9, v6}, Lxm5;-><init>(Ljava/lang/Object;)V

    iget-object v10, v3, Ldp6;->b:Lx77;

    new-instance v11, Lqe6;

    iget-object v6, v3, Ldp6;->t:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/telephony/euicc/EuiccManager;

    const/4 v14, 0x3

    invoke-direct {v11, v6, v14}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iget-object v6, v3, Ldp6;->u:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lgq6;

    iget-object v7, v3, Ldp6;->f:Li06;

    new-instance v12, Lbp6;

    invoke-direct {v12, v3}, Lbp6;-><init>(Ldp6;)V

    iget-object v13, v3, Ldp6;->m:Lk5o;

    new-instance v15, Li3j;

    move/from16 v16, v14

    invoke-virtual {v3}, Ldp6;->b()Lole;

    move-result-object v14

    move-object/from16 v17, v2

    iget-object v2, v3, Ldp6;->j:Lbpd;

    move-object/from16 v18, v6

    iget-object v6, v3, Ldp6;->l:Llv1;

    invoke-direct {v15, v14, v2, v6}, Li3j;-><init>(Lole;Lbpd;Llv1;)V

    new-instance v2, Ljq6;

    invoke-virtual {v3}, Ldp6;->d()Lip6;

    move-result-object v3

    invoke-direct {v2, v3}, Ljq6;-><init>(Lip6;)V

    invoke-direct {v5}, Ljava/lang/Object;-><init>()V

    iget-object v3, v12, Lbp6;->a:Ldp6;

    iget-object v3, v3, Ldp6;->g:Liv1;

    invoke-virtual {v3}, Liv1;->invoke()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lf99;

    invoke-virtual/range {v18 .. v18}, Lgq6;->a()Lf99;

    move-result-object v14

    iget-object v6, v15, Li3j;->d:Ljava/lang/Object;

    check-cast v6, Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Lf99;

    iget-object v2, v2, Ljq6;->a:Lip6;

    iget-object v2, v2, Lip6;->f:Lf99;

    new-instance v6, Lyq6;

    move-object v12, v13

    const/4 v13, 0x0

    invoke-direct/range {v6 .. v13}, Lyq6;-><init>(Li06;Leq6;Lxm5;Lx77;Lqe6;Lk5o;Lmt5;)V

    const/4 v7, 0x4

    new-array v7, v7, [Lf99;

    const/4 v8, 0x0

    aput-object v3, v7, v8

    const/4 v3, 0x1

    aput-object v14, v7, v3

    const/4 v9, 0x2

    aput-object v15, v7, v9

    aput-object v2, v7, v16

    new-instance v2, Lcw;

    const/16 v9, 0x8

    invoke-direct {v2, v7, v6, v9}, Lcw;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    sget-object v6, Laej;->b:Lauj;

    invoke-static {v2, v4, v6, v3}, La26;->l0(Lf99;Lnx5;Lbej;I)Lplh;

    move-result-object v2

    iput-object v2, v5, Ld06;->a:Ljava/lang/Object;

    iput-object v5, v0, Lcom/opera/android/esim/ui/EsimActivity;->V:Ld06;

    new-instance v2, Lgha;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v3

    iget-object v3, v3, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->d:Lx5f;

    invoke-virtual {v0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v5

    invoke-virtual {v5}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v5

    sget-object v6, La98;->c:La98;

    if-eqz v5, :cond_de

    const-string v7, "ESIM_ATTRIBUTION_RESOLVED"

    invoke-virtual {v5, v7, v8}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v7

    if-eqz v7, :cond_de

    new-instance v6, La98;

    const-string v7, "ESIM_SOURCE"

    invoke-virtual {v5, v7}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    const-string v9, "ESIM_CAMPAIGN"

    invoke-virtual {v5, v9}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    invoke-direct {v6, v7, v5}, La98;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_de
    invoke-direct {v2, v3, v4, v6}, Lgha;-><init>(Lx5f;Lx5f;La98;)V

    iput-object v2, v0, Lcom/opera/android/esim/ui/EsimActivity;->a0:Lgha;

    invoke-virtual/range {v17 .. v17}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ldp6;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {v4}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v4

    iget-object v5, v0, Lcom/opera/android/esim/ui/EsimActivity;->V:Ld06;

    if-nez v5, :cond_f6

    const/4 v5, 0x0

    :cond_f6
    iget-object v6, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v6, v6, Lxv1;->m1:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lwyn;

    new-instance v7, Lala;

    new-instance v9, Ls9i;

    iget-object v10, v3, Ldp6;->b:Lx77;

    new-instance v11, Leq6;

    iget-object v12, v3, Ldp6;->a:Li88;

    invoke-direct {v11, v12}, Leq6;-><init>(Ljava/lang/Object;)V

    iget-object v12, v3, Ldp6;->h:Lj4c;

    iget-object v13, v3, Ldp6;->l:Llv1;

    const/16 v14, 0xb

    const/4 v15, 0x0

    invoke-direct/range {v9 .. v15}, Ls9i;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;BZ)V

    new-instance v10, Llq6;

    invoke-virtual {v3}, Ldp6;->d()Lip6;

    move-result-object v11

    invoke-direct {v10, v11}, Llq6;-><init>(Lip6;)V

    new-instance v11, Lbp6;

    invoke-direct {v11, v3}, Lbp6;-><init>(Ldp6;)V

    new-instance v12, Lqb7;

    invoke-virtual {v3}, Ldp6;->d()Lip6;

    move-result-object v13

    invoke-virtual {v3}, Ldp6;->a()Lne5;

    move-result-object v14

    invoke-direct {v12, v13, v4, v14}, Lqb7;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v13, Leq6;

    invoke-virtual {v3}, Ldp6;->d()Lip6;

    move-result-object v14

    invoke-direct {v13, v14}, Leq6;-><init>(Ljava/lang/Object;)V

    new-instance v14, Ld06;

    invoke-virtual {v3}, Ldp6;->d()Lip6;

    move-result-object v3

    invoke-direct {v14, v3}, Ld06;-><init>(Ljava/lang/Object;)V

    invoke-direct {v7}, Ljava/lang/Object;-><init>()V

    iput-object v0, v7, Lala;->a:Ljava/lang/Object;

    iput-object v4, v7, Lala;->b:Ljava/lang/Object;

    iput-object v5, v7, Lala;->c:Ljava/lang/Object;

    iget-object v3, v0, Lcom/opera/android/esim/ui/EsimActivity;->P:Lga6;

    iput-object v3, v7, Lala;->d:Ljava/lang/Object;

    iput-object v2, v7, Lala;->e:Ljava/lang/Object;

    iput-object v6, v7, Lala;->f:Ljava/lang/Object;

    iput-object v9, v7, Lala;->g:Ljava/lang/Object;

    iput-object v10, v7, Lala;->h:Ljava/lang/Object;

    iput-object v11, v7, Lala;->i:Ljava/lang/Object;

    iput-object v12, v7, Lala;->j:Ljava/lang/Object;

    iput-object v13, v7, Lala;->k:Ljava/lang/Object;

    iput-object v14, v7, Lala;->l:Ljava/lang/Object;

    iput-object v7, v0, Lcom/opera/android/esim/ui/EsimActivity;->W:Lala;

    new-instance v2, Leyi;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-direct {v2, v8, v1}, Leyi;-><init>(ZLcom/opera/android/settings/SettingsManager;)V

    iput-object v2, v0, Lcom/opera/android/esim/ui/EsimActivity;->X:Leyi;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    iget-object v3, v0, Lcom/opera/android/esim/ui/EsimActivity;->S:Lzyk;

    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Landroid/net/Uri;

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v4

    const-string v5, ""

    if-nez v4, :cond_18d

    move-object v4, v5

    :cond_18d
    invoke-virtual {v3}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->getHost()Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_19a

    move-object v5, v3

    :cond_19a
    const v3, 0x7f050013

    invoke-virtual {v2, v3}, Landroid/content/res/Resources;->getBoolean(I)Z

    move-result v2

    invoke-virtual {v4}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1cd

    invoke-virtual {v5}, Ljava/lang/String;->length()I

    move-result v3

    if-eqz v3, :cond_1cd

    if-eqz v2, :cond_1b2

    const/16 v2, 0xc8

    goto :goto_1b4

    :cond_1b2
    const/16 v2, 0x82

    :goto_1b4
    const-string v3, "default_webpage_zoom"

    invoke-virtual {v1, v3}, Lcom/opera/android/settings/SettingsManager;->n(Ljava/lang/String;)I

    move-result v1

    const/16 v3, 0x32

    invoke-static {v1, v3, v2}, Ldjh;->c(III)I

    move-result v1

    invoke-static {}, LJ/N;->M4QvXpDD()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/browser/chromium/OperaBrowserContextHandle;

    invoke-static {v1}, Loup;->n0(I)D

    move-result-wide v6

    invoke-static {v2, v4, v5, v6, v7}, LJ/N;->MdX$dmbm(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;D)V

    :cond_1cd
    invoke-super {v0}, Lcom/opera/android/FullscreenWebActivity;->v0()V

    iget-object v1, v0, Lcom/opera/android/esim/ui/EsimActivity;->Q:Lcv3;

    invoke-virtual {v0, v1}, Ldx3;->Y(Lcv3;)V

    return-void
.end method

.method public final x0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 5

    invoke-super {p0, p1}, Lrz4;->x0(Lcom/opera/android/browser/WebContentsWrapper;)V

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->b0:Lwy3;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Lrtn;->g()V

    :cond_a
    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->b0:Lwy3;

    iget-object v1, p0, Lcom/opera/android/esim/ui/EsimActivity;->c0:Lfz4;

    if-eqz v1, :cond_14

    invoke-virtual {v1}, Lrtn;->g()V

    :cond_14
    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->c0:Lfz4;

    if-eqz p1, :cond_53

    new-instance v0, Lwy3;

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v1

    iget-object v2, p0, Lcom/opera/android/esim/ui/EsimActivity;->S:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Landroid/net/Uri;

    invoke-direct {v0, p1, v1, v2}, Lwy3;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lu78;Landroid/net/Uri;)V

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->b0:Lwy3;

    new-instance v0, Lfz4;

    invoke-virtual {p0}, Lcom/opera/android/esim/ui/EsimActivity;->G0()Lu78;

    move-result-object v1

    invoke-direct {v0, p1, v1}, Lfz4;-><init>(Lcom/opera/android/browser/WebContentsWrapper;Lu78;)V

    iput-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->c0:Lfz4;

    new-instance p1, Ld06;

    new-instance v0, Lj04;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lj04;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, v0}, Ld06;-><init>(Ljava/lang/Object;)V

    iget-object v0, p0, Lcom/opera/android/esim/ui/EsimActivity;->P:Lga6;

    iput-object p1, v0, Lga6;->b:Ljava/lang/Object;

    invoke-interface {p0}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    new-instance v1, Lqs2;

    const/4 v2, 0x3

    invoke-direct {v1, v0, p1, v2}, Lqs2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p0, v1}, Ltcc;->a(Lmdc;)V

    :cond_53
    return-void
.end method
