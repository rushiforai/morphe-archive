.class public Lcom/opera/android/browser/BrowserFragment;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"


# instance fields
.field public a:Lcom/opera/android/settings/SettingsManager;

.field public final b:Lsv3;

.field public final c:Ltx3;

.field public final d:Lb7f;

.field public e:Lvp5;

.field public final f:Lrc6;

.field public g:Lk6l;

.field public h:Lxbf;

.field public i:Lhz4;

.field public j:Laz3;

.field public k:Laal;

.field public l:Landroid/widget/FrameLayout;

.field public m:I

.field public n:I

.field public o:I

.field public p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

.field public q:Z

.field public r:Lami;

.field public final s:Lpx3;

.field public t:Loml;

.field public u:Lcom/opera/android/browser/BannerBlockerHelper;

.field public v:Lcom/opera/android/browser/chromium/ChromiumAdDelegate;

.field public w:Lujp;

.field public x:Lsx3;


# direct methods
.method public constructor <init>()V
    .registers 4

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lsv3;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lsv3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->b:Lsv3;

    new-instance v0, Ltx3;

    invoke-direct {v0, p0}, Ltx3;-><init>(Lcom/opera/android/browser/BrowserFragment;)V

    iput-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->c:Ltx3;

    new-instance v0, Lb7f;

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lb7f;-><init>(Ljava/lang/Object;Z)V

    iput-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->d:Lb7f;

    new-instance v0, Lrc6;

    const/4 v1, 0x1

    invoke-direct {v0, v1}, Lrc6;-><init>(B)V

    iput-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->f:Lrc6;

    new-instance v0, Lpx3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lpx3;-><init>(Lcom/opera/android/browser/BrowserFragment;B)V

    iput-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->s:Lpx3;

    return-void
.end method


# virtual methods
.method public final f0()Lcom/opera/android/browser/BrowserFragmentFrameLayout;
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;

    return-object p0
.end method

.method public final g0()V
    .registers 2

    iget-boolean v0, p0, Lcom/opera/android/browser/BrowserFragment;->q:Z

    if-nez v0, :cond_10

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Lcom/opera/android/browser/BrowserFragment;->i0(Z)V

    :cond_10
    return-void
.end method

.method public final getView()Landroid/view/View;
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;

    return-object p0
.end method

.method public final h0(Z)V
    .registers 8

    iget-boolean v0, p0, Lcom/opera/android/browser/BrowserFragment;->q:Z

    if-eq v0, p1, :cond_28

    iput-boolean p1, p0, Lcom/opera/android/browser/BrowserFragment;->q:Z

    if-eqz p1, :cond_d

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Lcom/opera/android/browser/BrowserFragment;->i0(Z)V

    return-void

    :cond_d
    sget-object p1, Lvml;->d:Lumi;

    new-instance v0, Lfv2;

    const/16 v1, 0x15

    invoke-direct {v0, p0, v1}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p0

    new-instance v0, Loml;

    invoke-direct {v0, p0}, Loml;-><init>(Lnml;)V

    sget-object v4, Ljava/util/concurrent/TimeUnit;->MILLISECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x64

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_28
    return-void
.end method

.method public final i0(Z)V
    .registers 3

    iput-boolean p1, p0, Lcom/opera/android/browser/BrowserFragment;->q:Z

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->l:Landroid/widget/FrameLayout;

    const v0, 0x7f0a0144

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    if-eqz p1, :cond_f

    const/4 p1, 0x0

    goto :goto_11

    :cond_f
    const/16 p1, 0x8

    :goto_11
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final j0(Lb2l;I)V
    .registers 9

    const/4 v0, 0x2

    if-eq p2, v0, :cond_44

    check-cast p1, Ld7l;

    invoke-virtual {p1}, Ld7l;->O()Z

    move-result p2

    if-nez p2, :cond_44

    iget-object p2, p1, Ld7l;->j:Le7l;

    invoke-interface {p2}, Lb9l;->c0()Z

    move-result p2

    if-nez p2, :cond_44

    const/4 p2, 0x1

    invoke-virtual {p0, p2}, Lcom/opera/android/browser/BrowserFragment;->h0(Z)V

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->s:Lpx3;

    invoke-virtual {p1, p2}, Ld7l;->s0(La2l;)V

    invoke-virtual {p1, p2}, Ld7l;->e0(La2l;)V

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->t:Loml;

    if-eqz p2, :cond_27

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Loml;->cancel(Z)Z

    :cond_27
    sget-object p2, Lvml;->d:Lumi;

    new-instance v0, Lbi2;

    const/16 v1, 0x15

    invoke-direct {v0, p0, p1, v1}, Lbi2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p2, v0}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object p1

    new-instance v0, Loml;

    invoke-direct {v0, p1}, Loml;-><init>(Lnml;)V

    iput-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->t:Loml;

    sget-object v4, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/4 v5, 0x0

    const/4 v1, 0x0

    const-wide/16 v2, 0x5

    invoke-virtual/range {v0 .. v5}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    :cond_44
    return-void
.end method

.method public final k0()V
    .registers 4

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Lt5d;

    invoke-virtual {p0}, Ldx3;->S()Leq9;

    move-result-object p0

    invoke-virtual {p0}, Leq9;->c()Z

    move-result p0

    iget-object v1, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget-boolean v2, v1, Lzy4;->n:Z

    if-eq p0, v2, :cond_1e

    iput-boolean p0, v1, Lzy4;->n:Z

    invoke-virtual {v1}, Lzy4;->T()V

    invoke-virtual {v0}, Landroid/view/View;->requestApplyInsets()V

    :cond_1e
    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-virtual {p0}, Lk6l;->z()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 25

    move-object/from16 v1, p0

    invoke-super/range {p0 .. p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lt5d;

    new-instance v0, Lujp;

    const/16 v2, 0x19

    invoke-direct {v0, v2}, Lujp;-><init>(B)V

    iput-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->w:Lujp;

    new-instance v0, Laz3;

    invoke-virtual {v3}, Ldx3;->Z()Z

    move-result v2

    invoke-virtual {v3}, Ldx3;->S()Leq9;

    move-result-object v4

    iget-object v5, v3, Lt5d;->v:Lb7f;

    invoke-direct {v0, v2, v4, v5}, Laz3;-><init>(ZLeq9;Lb7f;)V

    iput-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->j:Laz3;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Liga;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    move-object v4, v2

    new-instance v2, Lhz4;

    move-object v5, v4

    invoke-virtual {v3}, Ldx3;->Z()Z

    move-result v4

    move-object v6, v5

    invoke-virtual {v3}, Ldx3;->S()Leq9;

    move-result-object v5

    iget-object v7, v3, Ldx3;->n:Lhx3;

    iget-object v7, v7, Lhx3;->j:Lfx3;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Ltgi;

    move-object v8, v6

    move-object v6, v7

    iget-object v7, v3, Ldx3;->j:Lqi;

    move-object v9, v8

    new-instance v8, Lxw3;

    const/4 v10, 0x0

    invoke-direct {v8, v3, v10}, Lxw3;-><init>(Lt5d;B)V

    move-object v11, v9

    new-instance v9, Lxw3;

    const/4 v12, 0x1

    invoke-direct {v9, v3, v12}, Lxw3;-><init>(Lt5d;B)V

    invoke-virtual {v3}, Ldx3;->K()Livn;

    move-result-object v10

    move-object v14, v11

    invoke-virtual {v3}, Ldx3;->H()Lg1j;

    move-result-object v11

    new-instance v12, Lqp2;

    const/16 v13, 0x14

    invoke-direct {v12, v13}, Lqp2;-><init>(B)V

    invoke-virtual {v14}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v13

    invoke-virtual {v14}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v15

    iget-object v15, v15, Ld6j;->c:Lx5f;

    move-object/from16 v17, v14

    move-object v14, v15

    invoke-virtual {v3}, Ldx3;->O()Leej;

    move-result-object v15

    invoke-virtual {v3}, Ldx3;->T()Lpt3;

    move-result-object v16

    move-object/from16 v19, v17

    invoke-virtual {v3}, Ldx3;->J()Ld7h;

    move-result-object v17

    invoke-virtual {v3}, Ldx3;->F()Ljv0;

    move-result-object v18

    move-object/from16 v21, v19

    invoke-virtual/range {v21 .. v21}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v19

    invoke-virtual/range {v21 .. v21}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v21

    move-object/from16 v22, v0

    move-object/from16 v20, v21

    const/4 v0, 0x0

    invoke-direct/range {v2 .. v20}, Lhz4;-><init>(Lt5d;ZLeq9;Ltgi;Lqi;Lxw3;Lxw3;Livn;Lg1j;Lqp2;Lq6e;Lx5f;Leej;Lpt3;Ld7h;Ljv0;Lcom/opera/android/settings/SettingsManager;Le00;)V

    iput-object v2, v1, Lcom/opera/android/browser/BrowserFragment;->i:Lhz4;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    iput-object v4, v1, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    new-instance v5, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;

    invoke-direct {v5, v4}, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;-><init>(Lcom/opera/android/settings/SettingsManager;)V

    iput-object v5, v1, Lcom/opera/android/browser/BrowserFragment;->v:Lcom/opera/android/browser/chromium/ChromiumAdDelegate;

    new-instance v4, Lcom/opera/android/browser/BannerBlockerHelper;

    iget-object v5, v1, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v4, v5}, Lcom/opera/android/browser/BannerBlockerHelper;-><init>(Lcom/opera/android/settings/SettingsManager;)V

    iput-object v4, v1, Lcom/opera/android/browser/BrowserFragment;->u:Lcom/opera/android/browser/BannerBlockerHelper;

    move-object v4, v3

    new-instance v3, Lxbf;

    new-instance v5, Lvzk;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v6

    sget-object v7, Lvml;->d:Lumi;

    const-string v8, "BrowserFragmentPrefs"

    new-array v9, v0, [Lbg1;

    invoke-static {v6, v7, v8, v9}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v6

    iget-object v8, v1, Lcom/opera/android/browser/BrowserFragment;->i:Lhz4;

    iget-object v9, v1, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v10, Lnx3;

    invoke-direct {v10, v9, v0}, Lnx3;-><init>(Lcom/opera/android/settings/SettingsManager;B)V

    invoke-direct {v5, v6, v8, v10}, Lvzk;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v6, Ltw2;

    const/16 v8, 0xe

    invoke-direct {v6, v1, v8}, Ltw2;-><init>(Ljava/lang/Object;B)V

    iget-object v8, v1, Lcom/opera/android/browser/BrowserFragment;->f:Lrc6;

    move-object/from16 v9, v22

    invoke-direct {v3, v5, v9, v8, v6}, Lxbf;-><init>(Lvzk;Liga;Lrc6;Ltw2;)V

    iput-object v3, v1, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    new-instance v5, Lk6l;

    invoke-virtual {v4}, Ldx3;->N()Lex3;

    move-result-object v6

    invoke-interface {v6}, Lex3;->k()Lcom/opera/android/Lazy;

    move-result-object v6

    move-object v8, v5

    iget-object v5, v1, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    move-object v9, v4

    move-object v4, v6

    new-instance v6, Leq6;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v10

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    sget-object v11, Lio7;->l:Lio7;

    sget-object v12, Lgrf;->k:Ls16;

    invoke-static {v10, v11, v12}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v10

    check-cast v10, Lgrf;

    iput-object v10, v6, Leq6;->a:Ljava/lang/Object;

    move-object v10, v7

    new-instance v7, Lnw3;

    const/16 v11, 0x1c

    invoke-direct {v7, v2, v11}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    sget-object v12, Lio7;->g:Lio7;

    sget-object v13, Lhwf;->k:Lix5;

    invoke-static {v11, v12, v13}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v11

    check-cast v11, Lhwf;

    move-object v12, v9

    new-instance v9, Lnw3;

    const/16 v13, 0x1d

    invoke-direct {v9, v2, v13}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object v13, v10

    invoke-static {v2}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v10

    move-object v14, v8

    move-object v8, v11

    new-instance v11, Lox3;

    invoke-direct {v11, v2, v0}, Lox3;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object v0, v12

    new-instance v12, Lqp2;

    const/16 v15, 0x15

    invoke-direct {v12, v15}, Lqp2;-><init>(B)V

    move-object v15, v13

    new-instance v13, Lox3;

    move-object/from16 p1, v0

    const/4 v0, 0x1

    invoke-direct {v13, v2, v0}, Lox3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v2, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v0, v0, Llpe;->p:Lplh;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v17

    invoke-static/range {v17 .. v17}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v17

    move-object/from16 v18, v0

    iget-object v0, v2, Lcom/opera/android/OperaApplication;->H:Lj4c;

    move-object/from16 v16, v17

    move-object/from16 v17, v2

    move-object v2, v15

    move-object/from16 v15, v16

    move-object/from16 v19, p1

    move-object/from16 v16, v0

    move-object v0, v14

    move-object/from16 v14, v18

    invoke-direct/range {v0 .. v16}, Lk6l;-><init>(Lcom/opera/android/browser/BrowserFragment;Lumi;Lxbf;Lcom/opera/android/Lazy;Lcom/opera/android/settings/SettingsManager;Leq6;Lnw3;Lhwf;Lnw3;Lxnh;Lox3;Lqp2;Lox3;Lplh;Ldj9;Lj4c;)V

    move-object v14, v0

    move-object v15, v2

    iput-object v14, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-virtual/range {v19 .. v19}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->e1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm6l;

    iget-object v2, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object v3, v0, Lm6l;->b:Ll6l;

    iget-object v0, v0, Lm6l;->a:Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk6l;

    if-eqz v4, :cond_199

    invoke-virtual {v4, v3}, Lk6l;->x(Lj6l;)V

    :cond_199
    invoke-virtual {v0, v2}, Lekc;->r(Ljava/lang/Object;)V

    invoke-virtual {v2, v3}, Lk6l;->c(Lj6l;)V

    iget-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    new-instance v2, Lrx3;

    invoke-direct {v2, v1}, Lrx3;-><init>(Lcom/opera/android/browser/BrowserFragment;)V

    invoke-virtual {v0, v2}, Lk6l;->c(Lj6l;)V

    iget-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    new-instance v2, Lpx3;

    const/4 v6, 0x1

    invoke-direct {v2, v1, v6}, Lpx3;-><init>(Lcom/opera/android/browser/BrowserFragment;B)V

    invoke-virtual {v0, v2}, Lk6l;->b(La2l;)V

    new-instance v3, Lvp5;

    iget-object v4, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->j:Laz3;

    iget-object v0, v0, Laz3;->a:Lysl;

    invoke-direct {v3, v4, v0}, Lvp5;-><init>(Lk6l;Lysl;)V

    iput-object v3, v1, Lcom/opera/android/browser/BrowserFragment;->e:Lvp5;

    new-instance v0, Lami;

    new-instance v5, Lvx;

    const/16 v2, 0xf

    move-object/from16 v9, v19

    invoke-direct {v5, v9, v2}, Lvx;-><init>(Ljava/lang/Object;B)V

    move-object v2, v1

    move-object v1, v15

    invoke-direct/range {v0 .. v5}, Lami;-><init>(Lumi;Lcom/opera/android/browser/BrowserFragment;Lvp5;Lk6l;Lvx;)V

    move-object v1, v2

    iput-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->r:Lami;

    new-instance v0, Ly0h;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    iget-object v3, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-virtual/range {v17 .. v17}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-direct {v0, v2, v3, v4}, Ly0h;-><init>(Landroidx/fragment/app/r;Lk6l;Lx5f;)V

    new-instance v0, Lz0h;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    iget-object v3, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    invoke-static {v2}, Lgwi;->a(Landroid/content/Context;)Lgwi;

    move-result-object v2

    iput-object v2, v0, Lz0h;->a:Lgwi;

    invoke-virtual {v3, v0}, Lk6l;->c(Lj6l;)V

    iget-object v2, v3, Lk6l;->o:Lb2l;

    if-eqz v2, :cond_20a

    check-cast v2, Ld7l;

    iget-object v2, v2, Ld7l;->j:Le7l;

    invoke-interface {v2}, Lb9l;->m()Z

    move-result v2

    if-eqz v2, :cond_20a

    invoke-virtual {v0, v6}, Lz0h;->a(Z)V

    :cond_20a
    new-instance v0, Lr9i;

    iget-object v2, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object v3, v1, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v0, v2, v3}, Lr9i;-><init>(Lk6l;Lcom/opera/android/settings/SettingsManager;)V

    new-instance v0, Lsx3;

    iget-object v2, v1, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-direct {v0, v2}, Lsx3;-><init>(Lcom/opera/android/settings/SettingsManager;)V

    iput-object v0, v1, Lcom/opera/android/browser/BrowserFragment;->x:Lsx3;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    iget-object v2, v1, Lcom/opera/android/browser/BrowserFragment;->x:Lsx3;

    invoke-virtual {v0, v2}, Ltcc;->a(Lmdc;)V

    sget v0, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v2, 0x1f

    if-lt v0, v2, :cond_23d

    new-instance v3, Lqx3;

    iget-object v1, v1, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    invoke-direct {v3, v1}, Lqx3;-><init>(Lk6l;)V

    if-lt v0, v2, :cond_23d

    new-instance v0, Lkoi;

    iget-object v1, v3, Lqx3;->a:Lb7f;

    invoke-direct {v0, v1}, Lkoi;-><init>(Lb7f;)V

    iput-object v0, v9, Ldx3;->t:Lkoi;

    :cond_23d
    return-void
.end method

.method public final onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 15

    const p3, 0x7f0d00a9

    const/4 v0, 0x0

    invoke-virtual {p1, p3, p2, v0}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/FrameLayout;

    iput-object p1, p0, Lcom/opera/android/browser/BrowserFragment;->l:Landroid/widget/FrameLayout;

    new-instance p2, Lu7;

    const/16 p3, 0x18

    invoke-direct {p2, p0, p3}, Lu7;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lt5d;

    invoke-virtual {p1}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object p1

    iput-object p1, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p2

    check-cast p2, Lt5d;

    iget-object p2, p2, Ldx3;->j:Lqi;

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    invoke-virtual {p1, p2}, Lqxe;->f(Lorg/chromium/ui/base/WindowAndroid;)V

    iget-object p1, p1, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object p1, p1, Lc5o;->a:Ljava/lang/Object;

    check-cast p1, Landroid/view/SurfaceView;

    iput-object p1, p2, Lorg/chromium/ui/base/WindowAndroid;->h:Landroid/view/SurfaceView;

    iget-object p1, p0, Lcom/opera/android/browser/BrowserFragment;->i:Lhz4;

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iget-object p3, p0, Lcom/opera/android/browser/BrowserFragment;->j:Laz3;

    iget-object v1, p0, Lcom/opera/android/browser/BrowserFragment;->x:Lsx3;

    iget-object v1, v1, Lsx3;->b:Lb7f;

    iput-object p3, p1, Lhz4;->e:Ljava/lang/Object;

    new-instance v2, Lala;

    iget-object v3, p1, Lhz4;->c:Ljava/lang/Object;

    check-cast v3, Lt5d;

    iget-object p3, p3, Laz3;->a:Lysl;

    iget-object v4, p1, Lhz4;->j:Ljava/lang/Object;

    check-cast v4, Livn;

    iget-object v5, p1, Lhz4;->k:Ljava/lang/Object;

    check-cast v5, Lg1j;

    iget-object v6, p1, Lhz4;->m:Ljava/lang/Object;

    check-cast v6, Lq6e;

    iget-object v7, p1, Lhz4;->n:Ljava/lang/Object;

    check-cast v7, Lx5f;

    iget-object v8, p1, Lhz4;->r:Ljava/lang/Object;

    check-cast v8, Ljv0;

    iget-object v9, p1, Lhz4;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v9, p1, Lhz4;->t:Ljava/lang/Object;

    check-cast v9, Le00;

    invoke-direct {v2}, Ljava/lang/Object;-><init>()V

    new-instance v10, Ljava/util/HashMap;

    invoke-direct {v10}, Ljava/util/HashMap;-><init>()V

    iput-object v10, v2, Lala;->a:Ljava/lang/Object;

    iput-object v3, v2, Lala;->b:Ljava/lang/Object;

    iput-object p3, v2, Lala;->c:Ljava/lang/Object;

    iput-object p2, v2, Lala;->d:Ljava/lang/Object;

    iput-object v4, v2, Lala;->e:Ljava/lang/Object;

    iput-object v5, v2, Lala;->f:Ljava/lang/Object;

    iput-object v6, v2, Lala;->g:Ljava/lang/Object;

    iput-object v7, v2, Lala;->h:Ljava/lang/Object;

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->d:Lb7f;

    iput-object p2, v2, Lala;->i:Ljava/lang/Object;

    iput-object v1, v2, Lala;->j:Ljava/lang/Object;

    iput-object v8, v2, Lala;->k:Ljava/lang/Object;

    iput-object v9, v2, Lala;->l:Ljava/lang/Object;

    iput-object v2, p1, Lhz4;->s:Ljava/lang/Object;

    iget-object p1, p0, Lcom/opera/android/browser/BrowserFragment;->e:Lvp5;

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    iput-object p2, p1, Lvp5;->f:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    invoke-virtual {p2}, Landroid/view/View;->getVisibility()I

    move-result p2

    iput p2, p1, Lvp5;->c:I

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    check-cast p1, Lt5d;

    invoke-virtual {p1}, Ldx3;->S()Leq9;

    move-result-object p1

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->b:Lsv3;

    invoke-virtual {p1, p2}, Leq9;->a(Liq9;)V

    iget-object p1, p0, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object p2, p0, Lcom/opera/android/browser/BrowserFragment;->c:Ltx3;

    invoke-virtual {p1, p2}, Lcom/opera/android/settings/SettingsManager;->a(Lp5j;)V

    invoke-virtual {p2}, Ltx3;->a()I

    move-result p1

    iput p1, p2, Ltx3;->a:I

    iget-object p2, p2, Ltx3;->b:Lcom/opera/android/browser/BrowserFragment;

    iget-object p3, p2, Lcom/opera/android/browser/BrowserFragment;->j:Laz3;

    if-eqz p1, :cond_b9

    const/4 p1, 0x1

    goto :goto_ba

    :cond_b9
    move p1, v0

    :goto_ba
    iget-boolean v1, p3, Laz3;->i:Z

    if-eq v1, p1, :cond_c4

    iput-boolean p1, p3, Laz3;->i:Z

    const/4 p1, 0x3

    invoke-virtual {p3, p1, v0}, Laz3;->N(IZ)Z

    :cond_c4
    iget-object p1, p2, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    if-eqz p1, :cond_df

    iget p3, p2, Lcom/opera/android/browser/BrowserFragment;->m:I

    iget v0, p2, Lcom/opera/android/browser/BrowserFragment;->n:I

    iget v1, p2, Lcom/opera/android/browser/BrowserFragment;->o:I

    iget-object p2, p2, Lcom/opera/android/browser/BrowserFragment;->c:Ltx3;

    iget p2, p2, Ltx3;->a:I

    iget-object p1, p1, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iput p3, p1, Lzy4;->g:I

    iput v0, p1, Lzy4;->h:I

    iput v1, p1, Lzy4;->i:I

    iput p2, p1, Lzy4;->j:I

    invoke-virtual {p1}, Lzy4;->T()V

    :cond_df
    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->l:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method public final onDestroy()V
    .registers 8

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroy()V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->t:Loml;

    const/4 v1, 0x0

    const/4 v2, 0x0

    if-eqz v0, :cond_e

    invoke-virtual {v0, v1}, Loml;->cancel(Z)Z

    iput-object v2, p0, Lcom/opera/android/browser/BrowserFragment;->t:Loml;

    :cond_e
    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object v3, v0, Lk6l;->q:Lh7f;

    invoke-static {v3, v3}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object v4

    :goto_16
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v5

    if-eqz v5, :cond_2b

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lj6l;

    :try_start_22
    invoke-interface {v5}, Lj6l;->onDestroy()V
    :try_end_25
    .catch Ljava/lang/RuntimeException; {:try_start_22 .. :try_end_25} :catch_26

    goto :goto_16

    :catch_26
    move-exception v5

    invoke-static {v5}, Lks3;->D(Ljava/lang/Throwable;)V

    goto :goto_16

    :cond_2b
    invoke-virtual {v3}, Lh7f;->clear()V

    iget-object v3, v0, Lk6l;->f:Lltc;

    if-eqz v3, :cond_37

    iget-object v4, v3, Lltc;->a:Lqke;

    invoke-virtual {v4, v3}, Lqke;->Y(Lpke;)V

    :cond_37
    iget-object v3, v0, Lk6l;->g:Lazn;

    if-eqz v3, :cond_4a

    iget-object v4, v3, Lazn;->d:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v4, v3, Lazn;->a:Lqke;

    invoke-virtual {v4, v3}, Lqke;->Y(Lpke;)V

    iget-object v4, v3, Lazn;->e:Lk6l;

    invoke-virtual {v4, v3}, Lk6l;->v(La2l;)V

    :cond_4a
    iget-object v3, v0, Lk6l;->h:Lz2g;

    if-eqz v3, :cond_58

    iget-object v4, v3, Lz2g;->b:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v4, v3}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v4, v3, Lz2g;->a:Lqke;

    invoke-virtual {v4, v3}, Lqke;->Y(Lpke;)V

    :cond_58
    iget-object v3, v0, Lk6l;->i:Lld7;

    if-eqz v3, :cond_63

    iget-object v4, v3, Lld7;->b:Lqke;

    if-eqz v4, :cond_63

    invoke-virtual {v4, v3}, Lqke;->Y(Lpke;)V

    :cond_63
    iget-object v3, v0, Lk6l;->j:Lwd7;

    const/4 v4, 0x1

    if-eqz v3, :cond_7e

    iput-boolean v4, v3, Lwd7;->h:Z

    iget-boolean v5, v3, Lwd7;->i:Z

    if-eqz v5, :cond_7e

    iput-boolean v1, v3, Lwd7;->i:Z

    iget-object v5, v3, Lwd7;->d:Lqke;

    iget-object v6, v3, Lwd7;->k:Lvd7;

    invoke-virtual {v5, v6}, Lqke;->Y(Lpke;)V

    iget-object v5, v3, Lwd7;->e:Ldj9;

    iget-object v3, v3, Lwd7;->l:Lud7;

    invoke-virtual {v5, v3}, Lno7;->p(Lmo7;)V

    :cond_7e
    iget-object v3, v0, Lk6l;->k:Lld7;

    if-eqz v3, :cond_87

    iget-object v5, v3, Lld7;->b:Lqke;

    invoke-virtual {v5, v3}, Lqke;->Y(Lpke;)V

    :cond_87
    iget-object v3, v0, Lk6l;->s:Lg6l;

    iget-object v3, v3, Lg6l;->a:Lh7f;

    invoke-virtual {v3}, Lh7f;->clear()V

    iget-object v3, v0, Lk6l;->r:Li6l;

    invoke-static {v3}, Lac8;->d(Ljava/lang/Object;)V

    sget-object v3, Lowe;->c:Lowe;

    iget-object v5, v0, Lk6l;->u:Ld6l;

    invoke-virtual {v3, v5}, Lowe;->b(Lnwe;)V

    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v5, v1

    :goto_a1
    if-ge v5, v3, :cond_b1

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lb2l;

    check-cast v6, Ld7l;

    invoke-virtual {v6}, Ld7l;->dispose()V

    goto :goto_a1

    :cond_b1
    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->f:Lrc6;

    iget-object v0, v0, Lrc6;->a:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->clear()V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->u:Lcom/opera/android/browser/BannerBlockerHelper;

    iget-object v3, v0, Lcom/opera/android/browser/BannerBlockerHelper;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->v:Lcom/opera/android/browser/chromium/ChromiumAdDelegate;

    iget-object v3, v0, Lcom/opera/android/browser/chromium/ChromiumAdDelegate;->a:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v3, v0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->r:Lami;

    iget-object v3, v0, Lami;->h:Ljava/lang/Object;

    check-cast v3, Lzz2;

    if-eqz v3, :cond_d3

    invoke-virtual {v3, v4}, Lzz2;->a(Z)V

    iput-object v2, v0, Lami;->h:Ljava/lang/Object;

    :cond_d3
    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->j:Laz3;

    if-eqz v0, :cond_e4

    iget-object v3, v0, Laz3;->f:Lb7f;

    iget-object v4, v0, Laz3;->g:Lwa;

    invoke-virtual {v3, v4}, Lb7f;->a(Lorg/chromium/base/Callback;)V

    iget-object v0, v0, Laz3;->d:Lbz3;

    iput-object v2, v0, Lbz3;->e:Ljava/lang/Object;

    iput-object v2, v0, Lbz3;->f:Ljava/lang/Object;

    :cond_e4
    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    if-eqz v0, :cond_10a

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->a:Lckf;

    iget-object v3, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->c:Lc5o;

    iget-object v4, v3, Lc5o;->a:Ljava/lang/Object;

    check-cast v4, Landroid/view/SurfaceView;

    invoke-virtual {v4}, Landroid/view/SurfaceView;->getHolder()Landroid/view/SurfaceHolder;

    move-result-object v4

    iget-object v3, v3, Lc5o;->b:Ljava/lang/Object;

    check-cast v3, Lyr5;

    invoke-interface {v4, v3}, Landroid/view/SurfaceHolder;->removeCallback(Landroid/view/SurfaceHolder$Callback;)V

    iput-object v2, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->b:Lqi;

    iget-wide v3, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    invoke-static {v3, v4}, LJ/N;->MTwjIV_e(J)V

    const-wide/16 v3, 0x0

    iput-wide v3, v0, Lorg/chromium/components/embedder_support/view/ContentViewRenderView;->a:J

    iput-boolean v1, v0, Lqxe;->j:Z

    iput-object v2, p0, Lcom/opera/android/browser/BrowserFragment;->p:Lcom/opera/android/browser/chromium/ChromiumContainerView;

    :cond_10a
    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->w:Lujp;

    if-eqz v0, :cond_110

    iput-object v2, p0, Lcom/opera/android/browser/BrowserFragment;->w:Lujp;

    :cond_110
    iput-object v2, p0, Lcom/opera/android/browser/BrowserFragment;->x:Lsx3;

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->a:Lcom/opera/android/settings/SettingsManager;

    iget-object v1, p0, Lcom/opera/android/browser/BrowserFragment;->c:Ltx3;

    invoke-virtual {v0, v1}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Lt5d;

    invoke-virtual {v0}, Ldx3;->S()Leq9;

    move-result-object v0

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->b:Lsv3;

    iget-object v0, v0, Leq9;->c:Lh7f;

    invoke-virtual {v0, p0}, Lh7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onPause()V
    .registers 4

    sget-object v0, Lcom/opera/android/browser/chromium/OperaBrowserContext;->b:Lj4c;

    invoke-static {}, LJ/N;->MP_D9iRv()V

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object v0, v0, Lk6l;->b:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_11
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_24

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lb2l;

    const/4 v2, 0x1

    check-cast v1, Ld7l;

    invoke-virtual {v1, v2}, Ld7l;->M(Z)Z

    goto :goto_11

    :cond_24
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    return-void
.end method

.method public final onResume()V
    .registers 1

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-object p0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object p0, p0, Lk6l;->o:Lb2l;

    if-eqz p0, :cond_e

    check-cast p0, Ld7l;

    invoke-virtual {p0}, Ld7l;->show()V

    :cond_e
    return-void
.end method

.method public final onStop()V
    .registers 2

    iget-object v0, p0, Lcom/opera/android/browser/BrowserFragment;->g:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz v0, :cond_b

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->d()V

    :cond_b
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method
