.class public abstract Ll2b;
.super Lcom/opera/android/FullscreenWebActivity;
.source "SourceFile"


# instance fields
.field public J:Lk2b;

.field public final K:Lcv3;

.field public final L:Lqe6;

.field public M:Lyl8;

.field public N:Lj3b;

.field public O:Z

.field public P:Z

.field public Q:Z

.field public R:Lcom/opera/android/browser/chromium/ChromiumContent;

.field public S:Landroid/view/View;

.field public T:Landroid/view/View;

.field public U:Lx5f;

.field public V:Lx5f;

.field public final W:Ljava/lang/StringBuilder;

.field public X:Z

.field public Y:Ljava/lang/String;

.field public final Z:Lq65;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Lcom/opera/android/FullscreenWebActivity;-><init>()V

    new-instance v0, Lcv3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lcv3;-><init>(Ldx3;B)V

    iput-object v0, p0, Ll2b;->K:Lcv3;

    new-instance v0, Lqe6;

    const/16 v1, 0x13

    invoke-direct {v0, p0, v1}, Lqe6;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ll2b;->L:Lqe6;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    iput-object v0, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    sget-object v0, Lw2b;->b:Lhv5;

    const-string v0, "deeplink"

    iput-object v0, p0, Ll2b;->Y:Ljava/lang/String;

    new-instance v0, Lq65;

    const/4 v1, 0x3

    invoke-direct {v0, p0, v1}, Lq65;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Ll2b;->Z:Lq65;

    return-void
.end method


# virtual methods
.method public final B0()V
    .registers 1

    iget-object p0, p0, Ll2b;->Z:Lq65;

    invoke-virtual {p0}, Ln1;->S()V

    return-void
.end method

.method public C0(Ljava/io/File;)V
    .registers 2

    return-void
.end method

.method public D0()V
    .registers 4

    new-instance v0, Lj3b;

    iget-object v1, p0, Lhjf;->a:Ldll;

    invoke-direct {v0, p0, v1}, Lj3b;-><init>(Ll2b;Ldll;)V

    iput-object v0, p0, Ll2b;->N:Lj3b;

    new-instance v1, Lsma;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lsma;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public E0(I)V
    .registers 2

    invoke-virtual {p0}, Ll2b;->M0()V

    invoke-virtual {p0}, Ll2b;->B0()V

    iget-object p0, p0, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_13

    iget-object p0, p0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    :cond_13
    return-void
.end method

.method public F0()V
    .registers 2

    const-string v0, "Google Takeout"

    invoke-virtual {p0, v0}, Landroid/app/Activity;->setTitle(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public G0()V
    .registers 3

    const-string v0, "https://takeout.google.com"

    const/4 v1, 0x0

    invoke-virtual {p0, v1, v0}, Lcom/opera/android/FullscreenWebActivity;->r0(ILjava/lang/String;)V

    return-void
.end method

.method public H0()V
    .registers 1

    return-void
.end method

.method public I0()V
    .registers 1

    return-void
.end method

.method public J0()V
    .registers 1

    return-void
.end method

.method public abstract K0()V
.end method

.method public final L0(Lv2b;J)V
    .registers 11

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    sget-object v0, Leb0;->d:Leb0;

    sget-object v1, Leb0;->b:Leb0;

    const/4 v2, 0x0

    const-wide/16 v3, 0x0

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-eqz p1, :cond_58

    if-ne p1, v6, :cond_54

    cmp-long p1, p2, v3

    if-lez p1, :cond_16

    move v2, v6

    :cond_16
    if-eqz v2, :cond_22

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-nez p1, :cond_1d

    move-object p1, v5

    :cond_1d
    const/16 p2, 0x13

    invoke-virtual {p1, p2}, Lx5f;->S(I)V

    :cond_22
    iget-object p1, p0, Ll2b;->V:Lx5f;

    if-nez p1, :cond_27

    move-object p1, v5

    :cond_27
    invoke-virtual {p1, v2}, Lx5f;->m0(Z)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-nez p1, :cond_2f

    move-object p1, v5

    :cond_2f
    if-eqz v2, :cond_34

    sget-object p2, Lgm0;->j:Lgm0;

    goto :goto_36

    :cond_34
    sget-object p2, Lgm0;->k:Lgm0;

    :goto_36
    invoke-virtual {p1, p2}, Lx5f;->l0(Lgm0;)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-eqz p1, :cond_3e

    move-object v5, p1

    :cond_3e
    sget-object p1, Lw2b;->b:Lhv5;

    iget-object p0, p0, Ll2b;->Y:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhv5;->I(Ljava/lang/String;)Lw2b;

    move-result-object p0

    sget-object p1, Lc3b;->c:Lc3b;

    sget-object p2, Lv2b;->c:Lv2b;

    if-eqz v2, :cond_50

    move-object v0, v1

    :cond_50
    invoke-virtual {v5, p0, p1, p2, v0}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    return-void

    :cond_54
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_58
    cmp-long p1, p2, v3

    if-lez p1, :cond_5d

    move v2, v6

    :cond_5d
    if-eqz v2, :cond_69

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-nez p1, :cond_64

    move-object p1, v5

    :cond_64
    const/16 p2, 0x10

    invoke-virtual {p1, p2}, Lx5f;->S(I)V

    :cond_69
    iget-object p1, p0, Ll2b;->V:Lx5f;

    if-nez p1, :cond_6e

    move-object p1, v5

    :cond_6e
    iget-object p2, p1, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object p3

    invoke-virtual {p3, p2}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object p2

    const/4 v3, 0x5

    invoke-virtual {p2, v3, v6, v2}, Ljf0;->r(IIZ)V

    invoke-virtual {p1, p3}, Lx5f;->U0(Lx56;)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-nez p1, :cond_84

    move-object p1, v5

    :cond_84
    if-eqz v2, :cond_89

    sget-object p2, Lz80;->g:Lz80;

    goto :goto_8b

    :cond_89
    sget-object p2, Lz80;->h:Lz80;

    :goto_8b
    invoke-virtual {p1, p2}, Lx5f;->X(Lz80;)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    if-eqz p1, :cond_93

    move-object v5, p1

    :cond_93
    sget-object p1, Lw2b;->b:Lhv5;

    iget-object p0, p0, Ll2b;->Y:Ljava/lang/String;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p0}, Lhv5;->I(Ljava/lang/String;)Lw2b;

    move-result-object p0

    sget-object p1, Lc3b;->c:Lc3b;

    sget-object p2, Lv2b;->b:Lv2b;

    if-eqz v2, :cond_a5

    move-object v0, v1

    :cond_a5
    invoke-virtual {v5, p0, p1, p2, v0}, Lx5f;->I(Lw2b;Lc3b;Lv2b;Leb0;)V

    return-void
.end method

.method public final M0()V
    .registers 3

    const/4 v0, 0x0

    iput-boolean v0, p0, Ll2b;->Q:Z

    iput-boolean v0, p0, Ll2b;->P:Z

    iput-boolean v0, p0, Ll2b;->O:Z

    iget-object v0, p0, Ll2b;->M:Lyl8;

    if-eqz v0, :cond_10

    iget-object v1, v0, Lyl8;->d:Ltcc;

    invoke-virtual {v0, v1}, Lxl8;->b(Ltcc;)V

    :cond_10
    const/4 v0, 0x0

    iput-object v0, p0, Ll2b;->M:Lyl8;

    return-void
.end method

.method public N0(Lre7;)V
    .registers 4

    new-instance v0, Lcx3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, p1, v1}, Lcx3;-><init>(Ldx3;Lre7;B)V

    return-void
.end method

.method public final O0()V
    .registers 5

    sget-object v0, Lvml;->d:Lumi;

    iget-boolean v1, p0, Ll2b;->X:Z

    if-eqz v1, :cond_10

    sget-object v1, Lpn7;->b:Lon7;

    const/4 v1, 0x2

    :goto_9
    sget-object v2, Lun7;->f:Lun7;

    invoke-static {v1, v2}, Lcs5;->x0(ILun7;)J

    move-result-wide v1

    goto :goto_14

    :cond_10
    sget-object v1, Lpn7;->b:Lon7;

    const/4 v1, 0x1

    goto :goto_9

    :goto_14
    invoke-static {v1, v2}, Lpn7;->f(J)J

    move-result-wide v1

    sget-object v3, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    iget-object p0, p0, Ll2b;->Z:Lq65;

    invoke-virtual {p0, v0, v1, v2, v3}, Ln1;->B0(Ltcl;JLjava/util/concurrent/TimeUnit;)V

    return-void
.end method

.method public P0()V
    .registers 2

    invoke-virtual {p0}, Ll2b;->Q0()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll2b;->O:Z

    iget-object p0, p0, Ll2b;->N:Lj3b;

    if-eqz p0, :cond_17

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Landroid/view/View;->setVisibility(I)V

    iget-object p0, p0, Lj3b;->b:Lor2;

    iget-object p0, p0, Lor2;->d:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {p0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    :cond_17
    return-void
.end method

.method public final Q0()V
    .registers 6

    iget-object v0, p0, Ll2b;->M:Lyl8;

    if-eqz v0, :cond_5

    return-void

    :cond_5
    sget-boolean v0, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    const v0, 0x7f1401b7

    invoke-virtual {p0, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    new-instance v1, Lsxh;

    const v2, 0x7f140b66

    invoke-direct {v1, v2, v0}, Lsxh;-><init>(I[Ljava/lang/Object;)V

    new-instance v0, Lyl8;

    new-instance v2, Landroid/content/Intent;

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v3

    invoke-direct {v2, v3}, Landroid/content/Intent;-><init>(Landroid/content/Intent;)V

    const/high16 v3, 0x10000000

    invoke-virtual {v2, v3}, Landroid/content/Intent;->setFlags(I)Landroid/content/Intent;

    const/4 v3, 0x0

    const/high16 v4, 0xc000000

    invoke-static {p0, v3, v2, v4}, Landroid/app/PendingIntent;->getActivity(Landroid/content/Context;ILandroid/content/Intent;I)Landroid/app/PendingIntent;

    move-result-object v2

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v3

    invoke-direct {v0, p0, v2, v3, v1}, Lyl8;-><init>(Ll2b;Landroid/app/PendingIntent;Ltcc;Lsxh;)V

    invoke-virtual {p0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->e:Lqcc;

    invoke-virtual {v1, v2}, Lqcc;->d(Lqcc;)Z

    move-result v1

    if-eqz v1, :cond_51

    sget-boolean v1, Lcom/opera/android/browser/external/ExternalAppService;->b:Z

    if-nez v1, :cond_51

    iget-object v1, v0, Lyl8;->e:Lsxh;

    invoke-virtual {v0, v1}, Lxl8;->a(Lsxh;)V

    :cond_51
    iput-object v0, p0, Ll2b;->M:Lyl8;

    return-void
.end method

.method public final f0(Lqi;Lorg/chromium/content_public/browser/WebContents;)Lcom/opera/android/browser/WebContentsWrapper;
    .registers 14

    new-instance v0, Lcom/opera/android/browser/chromium/ChromiumContent;

    const/4 v5, 0x0

    const/4 v6, 0x0

    iget-object v1, p0, Ll2b;->L:Lqe6;

    const/4 v4, 0x0

    move-object v2, p1

    move-object v3, p2

    invoke-direct/range {v0 .. v6}, Lcom/opera/android/browser/chromium/ChromiumContent;-><init>(Ljz4;Lqi;Lorg/chromium/content_public/browser/WebContents;ZZI)V

    new-instance v1, Lqy4;

    new-instance v2, Lvk2;

    const/4 p1, 0x7

    invoke-direct {v2, p1}, Lvk2;-><init>(B)V

    iget-object p1, p0, Ll2b;->U:Lx5f;

    const/4 p2, 0x0

    if-eqz p1, :cond_1b

    move-object v4, p1

    goto :goto_1c

    :cond_1b
    move-object v4, p2

    :goto_1c
    invoke-static {p0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v5

    move-object v3, v0

    move-object v0, v1

    const/4 v1, 0x0

    invoke-direct/range {v0 .. v5}, Lqy4;-><init>(ILcom/opera/api/Callback;Lcom/opera/android/browser/chromium/ChromiumContent;Lx5f;Lru9;)V

    move-object v1, v0

    move-object v0, v3

    new-instance v2, Lrbe;

    const/16 p1, 0x19

    invoke-direct {v2, p1}, Lrbe;-><init>(B)V

    new-instance v9, Lqii;

    invoke-direct {v9}, Ljava/lang/Object;-><init>()V

    new-instance v3, Lqp2;

    const/16 p1, 0x14

    invoke-direct {v3, p1}, Lqp2;-><init>(B)V

    iget-object v4, p0, Ll2b;->U:Lx5f;

    if-eqz v4, :cond_41

    move-object v6, v4

    goto :goto_42

    :cond_41
    move-object v6, p2

    :goto_42
    invoke-virtual {p0}, Ldx3;->O()Leej;

    move-result-object v7

    const/4 v8, 0x0

    move-object v10, v9

    const/4 v9, 0x0

    const/4 v4, 0x0

    const/4 v5, 0x0

    invoke-virtual/range {v0 .. v10}, Lcom/opera/android/browser/chromium/ChromiumContent;->t(Lqy4;Lg1j;Lqp2;Lorg/chromium/components/navigation_interception/InterceptNavigationDelegate;Lype;Lx5f;Leej;Lpt3;Ld7h;Ljv0;)V

    new-instance v1, Loz4;

    const/4 v3, 0x1

    invoke-direct {v1, v3}, Loz4;-><init>(B)V

    iput-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->p:Lcom/opera/android/browser/dialog/DialogDelegate;

    invoke-virtual {v0}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-static {v1}, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->fromWebContents(Lorg/chromium/content_public/browser/WebContents;)Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;

    move-result-object v4

    move-object v6, v2

    new-instance v2, Lue;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Lyw3;

    invoke-direct {v5, p0}, Lyw3;-><init>(Ldx3;)V

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v7

    iget-object v1, p0, Ll2b;->U:Lx5f;

    if-eqz v1, :cond_7c

    move-object v8, v1

    :goto_7a
    move-object v9, v10

    goto :goto_7e

    :cond_7c
    move-object v8, p2

    goto :goto_7a

    :goto_7e
    sget-object v10, Lte;->Bo:Lqii;

    move-object v3, p0

    invoke-direct/range {v2 .. v10}, Lue;-><init>(Landroid/content/Context;Lye;Livn;Lg1j;Lq6e;Lorm;Ljv0;Lte;)V

    iput-object v2, v4, Lorg/chromium/content/browser/selection/SelectionPopupControllerImpl;->f:Lve;

    new-instance p0, Lga6;

    invoke-direct {p0, v3, p1}, Lga6;-><init>(Ljava/lang/Object;B)V

    iput-object p0, v0, Lcom/opera/android/browser/chromium/ChromiumContent;->m:Lez4;

    return-object v0
.end method

.method public final g0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 3

    iget-object v0, p0, Ll2b;->R:Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-static {v0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-eqz v0, :cond_b

    const/4 v0, 0x0

    iput-object v0, p0, Ll2b;->R:Lcom/opera/android/browser/chromium/ChromiumContent;

    :cond_b
    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->s()V

    invoke-virtual {p1}, Lcom/opera/android/browser/chromium/ChromiumContent;->l()V

    return-void
.end method

.method public final onDestroy()V
    .registers 3

    iget-object v0, p0, Ll2b;->J:Lk2b;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lptn;->c(Lorg/chromium/content_public/browser/WebContents;)V

    :cond_8
    iget-object v0, p0, Ll2b;->K:Lcv3;

    invoke-virtual {p0, v0}, Ldx3;->b0(Lcv3;)V

    const/4 v0, 0x0

    invoke-static {v0}, LJ/N;->MDvRMRe9(Z)V

    invoke-virtual {p0}, Ll2b;->M0()V

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onDestroy()V

    return-void
.end method

.method public onNewIntent(Landroid/content/Intent;)V
    .registers 3

    invoke-super {p0, p1}, Lhjf;->onNewIntent(Landroid/content/Intent;)V

    invoke-virtual {p0, p1}, Landroid/app/Activity;->setIntent(Landroid/content/Intent;)V

    iget-boolean p1, p0, Ll2b;->O:Z

    if-eqz p1, :cond_19

    const/4 p1, 0x0

    iput-boolean p1, p0, Ll2b;->O:Z

    iget-object p1, p0, Ll2b;->M:Lyl8;

    if-eqz p1, :cond_16

    iget-object v0, p1, Lyl8;->d:Ltcc;

    invoke-virtual {p1, v0}, Lxl8;->b(Ltcc;)V

    :cond_16
    const/4 p1, 0x0

    iput-object p1, p0, Ll2b;->M:Lyl8;

    :cond_19
    iget-object p1, p0, Ll2b;->N:Lj3b;

    if-eqz p1, :cond_2b

    iget-object v0, p1, Lj3b;->b:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->q()V

    const/16 v0, 0x8

    invoke-virtual {p1, v0}, Landroid/view/View;->setVisibility(I)V

    :cond_2b
    invoke-virtual {p0}, Ll2b;->p0()V

    return-void
.end method

.method public final onPause()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/r;->onPause()V

    iget-object v0, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 v1, 0x50

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqim;->p:Z

    iget-object p0, p0, Lqim;->b:Lll9;

    iget v1, p0, Lll9;->h:I

    add-int/2addr v1, v0

    iput v1, p0, Lll9;->h:I

    return-void
.end method

.method public final onResume()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/r;->onResume()V

    iget-object v0, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 v1, 0x52

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lqim;->i(Z)V

    return-void
.end method

.method public final onStart()V
    .registers 3

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onStart()V

    iget-object v0, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 v1, 0x73

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll2b;->R:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->B()V

    :cond_11
    return-void
.end method

.method public final onStop()V
    .registers 3

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->onStop()V

    iget-object v0, p0, Ll2b;->W:Ljava/lang/StringBuilder;

    const/16 v1, 0x53

    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(C)Ljava/lang/StringBuilder;

    iget-object p0, p0, Ll2b;->R:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->s()V

    :cond_11
    return-void
.end method

.method public p0()V
    .registers 3

    iget-boolean v0, p0, Ll2b;->Q:Z

    if-nez v0, :cond_1e

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->p0()V

    const/4 v0, 0x1

    iput-boolean v0, p0, Ll2b;->Q:Z

    invoke-virtual {p0}, Landroid/app/Activity;->getIntent()Landroid/content/Intent;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v0

    if-eqz v0, :cond_1e

    const-string v1, "extra_import_entry_point"

    invoke-virtual {v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-eqz v0, :cond_1e

    iput-object v0, p0, Ll2b;->Y:Ljava/lang/String;

    :cond_1e
    return-void
.end method

.method public final u0(Landroid/view/View;)V
    .registers 3

    invoke-virtual {p0}, Ll2b;->D0()V

    sget-object v0, Lr5n;->a:Ljava/util/WeakHashMap;

    const v0, 0x7f0a04f5

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    iput-object v0, p0, Ll2b;->S:Landroid/view/View;

    const v0, 0x7f0a0bbe

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    iput-object p1, p0, Ll2b;->T:Landroid/view/View;

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->c:Lx5f;

    iput-object p1, p0, Ll2b;->U:Lx5f;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object p1

    iget-object p1, p1, Ld6j;->d:Lx5f;

    iput-object p1, p0, Ll2b;->V:Lx5f;

    return-void
.end method

.method public final v0()V
    .registers 3

    invoke-super {p0}, Lcom/opera/android/FullscreenWebActivity;->v0()V

    const/4 v0, 0x1

    invoke-static {v0}, LJ/N;->MDvRMRe9(Z)V

    new-instance v0, Lk2b;

    iget-object v1, p0, Lcom/opera/android/FullscreenWebActivity;->v:Lcom/opera/android/browser/WebContentsWrapper;

    invoke-virtual {v1}, Lcom/opera/android/browser/WebContentsWrapper;->e()Lorg/chromium/content_public/browser/WebContents;

    move-result-object v1

    invoke-direct {v0, p0, v1}, Lk2b;-><init>(Ll2b;Lorg/chromium/content_public/browser/WebContents;)V

    iput-object v0, p0, Ll2b;->J:Lk2b;

    iget-object v0, p0, Ll2b;->K:Lcv3;

    invoke-virtual {p0, v0}, Ldx3;->Y(Lcv3;)V

    iget-object v0, p0, Lcom/opera/android/FullscreenWebActivity;->u:Ljq9;

    if-eqz v0, :cond_23

    iget-object p0, p0, Ll2b;->N:Lj3b;

    invoke-virtual {v0, p0}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    return-void

    :cond_23
    invoke-static {}, Lh9o;->e()V

    return-void
.end method

.method public final x0(Lcom/opera/android/browser/WebContentsWrapper;)V
    .registers 4

    iget-object v0, p0, Ll2b;->R:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz v0, :cond_8

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Lcom/opera/android/browser/chromium/ChromiumContent;->z(Z)V

    :cond_8
    invoke-super {p0, p1}, Lcom/opera/android/FullscreenWebActivity;->x0(Lcom/opera/android/browser/WebContentsWrapper;)V

    check-cast p1, Lcom/opera/android/browser/chromium/ChromiumContent;

    iput-object p1, p0, Ll2b;->R:Lcom/opera/android/browser/chromium/ChromiumContent;

    if-eqz p1, :cond_15

    const/4 p0, 0x1

    invoke-virtual {p1, p0}, Lcom/opera/android/browser/chromium/ChromiumContent;->z(Z)V

    :cond_15
    return-void
.end method
