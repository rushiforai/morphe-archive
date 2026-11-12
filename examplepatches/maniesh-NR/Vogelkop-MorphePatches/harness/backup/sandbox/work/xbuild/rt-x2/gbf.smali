.class public final Lgbf;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lczj;
.implements Lw6f;


# instance fields
.field public final A:Lode;

.field public final B:Liuh;

.field public final a:Lcom/opera/android/BrowserActivity;

.field public final b:Lz43;

.field public final c:Lcom/opera/android/settings/SettingsManager;

.field public final d:Ls9g;

.field public final e:Z

.field public final f:Lydn;

.field public final g:Lyz9;

.field public final h:Lk6l;

.field public final i:Landroid/view/View;

.field public final j:Lvbf;

.field public final k:Lhz4;

.field public final l:Lzaf;

.field public final m:Ldbf;

.field public final n:Lshf;

.field public final o:Lb7f;

.field public final p:Li7f;

.field public final q:Li7f;

.field public final r:Lpt3;

.field public final s:Lay;

.field public final t:Lbpd;

.field public u:Lcom/opera/android/bar/FindInPage;

.field public final v:Lkze;

.field public w:Lhh4;

.field public x:Z

.field public y:I

.field public z:Lqt3;


# direct methods
.method public constructor <init>(Lz43;ILwt3;Lcom/opera/android/settings/SettingsManager;Ls9g;Lydn;Lin3;Llg;Lswf;Ls28;Lyz9;Lk6l;Landroid/view/View;Lhv3;Lgjm;Lz77;Lnej;Lcdn;Lx5f;Lp8f;Lxg;Lpt3;Lwth;Lcom/opera/android/BrowserActivity;Lumi;Lpt3;Lmdh;Lqdh;Lcul;Lk5o;Ligi;Lpde;Lvx;Lwt3;Lwt3;Lwcd;Losf;Lwok;Lu0a;)V
    .registers 73

    move-object/from16 v1, p0

    move-object/from16 v11, p12

    move-object/from16 v12, p13

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-static {v0}, Luup;->m(Ljava/lang/Object;)Lb7f;

    move-result-object v2

    iput-object v2, v1, Lgbf;->o:Lb7f;

    new-instance v2, Li7f;

    invoke-direct {v2}, Li7f;-><init>()V

    iput-object v2, v1, Lgbf;->p:Li7f;

    new-instance v2, Li7f;

    invoke-direct {v2}, Li7f;-><init>()V

    iput-object v2, v1, Lgbf;->q:Li7f;

    new-instance v13, Lay;

    const/16 v14, 0x8

    invoke-direct {v13, v1, v14}, Lay;-><init>(Ljava/lang/Object;B)V

    iput-object v13, v1, Lgbf;->s:Lay;

    new-instance v15, Lbpd;

    invoke-direct {v15, v1}, Lbpd;-><init>(Lgbf;)V

    iput-object v15, v1, Lgbf;->t:Lbpd;

    new-instance v2, Lkze;

    invoke-direct {v2, v0}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v2, v1, Lgbf;->v:Lkze;

    new-instance v0, Lode;

    invoke-direct {v0}, Lekc;-><init>()V

    iput-object v0, v1, Lgbf;->A:Lode;

    move-object/from16 v0, p24

    iput-object v0, v1, Lgbf;->a:Lcom/opera/android/BrowserActivity;

    move-object/from16 v2, p1

    iput-object v2, v1, Lgbf;->b:Lz43;

    move-object/from16 v3, p4

    iput-object v3, v1, Lgbf;->c:Lcom/opera/android/settings/SettingsManager;

    move-object/from16 v4, p5

    iput-object v4, v1, Lgbf;->d:Ls9g;

    invoke-virtual {v3}, Lcom/opera/android/settings/SettingsManager;->c()Lb7j;

    move-result-object v5

    iget-boolean v5, v5, Lb7j;->b:Z

    iput-boolean v5, v1, Lgbf;->e:Z

    move-object/from16 v6, p6

    iput-object v6, v1, Lgbf;->f:Lydn;

    move-object/from16 v7, p11

    iput-object v7, v1, Lgbf;->g:Lyz9;

    iput-object v11, v1, Lgbf;->h:Lk6l;

    iput-object v12, v1, Lgbf;->i:Landroid/view/View;

    new-instance v17, Ldbf;

    move-object/from16 v3, p14

    move-object/from16 v4, p15

    move-object/from16 v6, p17

    move-object/from16 v7, p18

    move-object/from16 v8, p19

    move-object/from16 v2, p25

    move-object/from16 v9, p34

    move-object/from16 v10, p35

    move/from16 v30, v5

    move-object/from16 v0, v17

    move-object/from16 v5, p16

    invoke-direct/range {v0 .. v10}, Ldbf;-><init>(Lgbf;Lumi;Lhv3;Lgjm;Lz77;Lnej;Lcdn;Lx5f;Lwt3;Lwt3;)V

    move-object v3, v0

    move-object v0, v1

    iput-object v3, v0, Lgbf;->m:Ldbf;

    const v1, 0x7f0a0793

    invoke-virtual {v12, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/widget/FrameLayout;

    const v2, 0x7f0a0794

    invoke-virtual {v12, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/bar/OmniBoxRoot;

    new-instance v4, Liuh;

    new-instance v5, Lole;

    move-object/from16 v6, p37

    invoke-direct {v5, v6}, Lole;-><init>(Ljava/lang/Object;)V

    invoke-direct {v4, v5}, Liuh;-><init>(Lole;)V

    iput-object v4, v0, Lgbf;->B:Liuh;

    new-instance v0, Lvbf;

    const v5, 0x7f0a0c65

    invoke-virtual {v2, v5}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/widget/UrlFieldEditText;

    invoke-virtual/range {p1 .. p1}, Lz43;->p()Z

    move-result v14

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-object v7, v15

    invoke-virtual/range {p1 .. p1}, Lz43;->o()Z

    move-result v15

    move-object/from16 v8, p31

    iget-object v9, v8, Ligi;->e:Ljava/lang/Object;

    move-object/from16 v25, v9

    check-cast v25, Lsw0;

    move-object/from16 v16, p1

    move-object/from16 v21, p4

    move-object/from16 v18, p6

    move-object/from16 v23, p7

    move-object/from16 v20, p8

    move-object/from16 v22, p23

    move-object/from16 v19, p24

    move-object/from16 v24, p30

    move-object/from16 v26, p39

    move-object/from16 v17, v2

    invoke-virtual/range {v16 .. v26}, Lz43;->b(Lcom/opera/android/bar/OmniBoxRoot;Lydn;Lcom/opera/android/BrowserActivity;Llg;Lcom/opera/android/settings/SettingsManager;Lwth;Lin3;Lk5o;Likc;Lu0a;)Lv73;

    move-result-object v16

    move-object/from16 v18, v3

    move-object/from16 v2, p4

    move-object/from16 v9, p7

    move-object/from16 v6, p9

    move-object/from16 v10, p10

    move-object/from16 v19, p22

    move-object/from16 v20, p25

    move-object/from16 v21, p27

    move-object/from16 v22, p28

    move-object/from16 v23, p29

    move-object/from16 v25, p32

    move-object/from16 v26, p33

    move-object/from16 v27, p36

    move-object/from16 v29, p38

    move-object/from16 v28, v4

    move-object/from16 v32, v7

    move-object/from16 v24, v8

    move-object v4, v11

    move-object/from16 v31, v13

    move-object/from16 v12, v17

    move-object/from16 v7, p20

    move-object/from16 v8, p21

    move-object v11, v1

    move-object/from16 v17, v3

    move-object v13, v5

    move/from16 v1, p2

    move-object/from16 v3, p5

    move-object/from16 v5, p6

    invoke-direct/range {v0 .. v29}, Lvbf;-><init>(ILcom/opera/android/settings/SettingsManager;Ls9g;Lk6l;Lydn;Lswf;Lp8f;Lxg;Lin3;Ls28;Landroid/widget/FrameLayout;Lcom/opera/android/bar/OmniBoxRoot;Lcom/opera/android/widget/UrlFieldEditText;ZZLv73;Ldbf;Ldbf;Lpt3;Lumi;Lmdh;Lqdh;Lcul;Ligi;Lpde;Lvx;Lwcd;Liuh;Lwok;)V

    move-object v1, v0

    move-object/from16 v3, v17

    move-object/from16 v0, p0

    move-object/from16 v17, v12

    iput-object v1, v0, Lgbf;->j:Lvbf;

    new-instance v0, Lhz4;

    new-instance v2, Ld8e;

    const/4 v1, 0x6

    move-object/from16 v4, p3

    invoke-direct {v2, v4, v1}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-virtual/range {v17 .. v17}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v15

    new-instance v1, Ld8e;

    const/4 v4, 0x7

    move-object/from16 v5, p39

    invoke-direct {v1, v5, v4}, Ld8e;-><init>(Ljava/lang/Object;B)V

    move-object v4, v3

    move-object v5, v3

    move-object/from16 v16, v3

    move-object/from16 v8, p4

    move-object/from16 v9, p10

    move-object/from16 v7, p12

    move-object/from16 v11, p22

    move-object/from16 v10, p25

    move-object/from16 v12, p27

    move-object/from16 v13, p28

    move-object/from16 v14, p29

    move-object/from16 v17, p36

    move-object/from16 v19, p38

    move-object/from16 v20, v1

    move-object/from16 v18, v28

    move/from16 v1, v30

    move-object/from16 v6, v32

    invoke-direct/range {v0 .. v20}, Lhz4;-><init>(ILd8e;Ldbf;Ldbf;Ldbf;Lbpd;Lk6l;Lcom/opera/android/settings/SettingsManager;Ls28;Lumi;Lpt3;Lmdh;Lqdh;Lcul;Lxnh;Ldbf;Lwcd;Liuh;Lwok;Ld8e;)V

    move-object v1, v0

    move-object v11, v7

    move-object/from16 v0, p0

    iput-object v1, v0, Lgbf;->k:Lhz4;

    const v1, 0x7f0a04f5

    move-object/from16 v12, p13

    invoke-virtual {v12, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    check-cast v2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    if-nez v2, :cond_17d

    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v3

    instance-of v3, v3, Landroid/view/ViewGroup;

    if-eqz v3, :cond_17d

    invoke-virtual {v12}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object v2

    check-cast v2, Landroid/view/ViewGroup;

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lcom/opera/android/custom_views/ToolbarProgressBar;

    :cond_17d
    new-instance v1, Lshf;

    invoke-direct {v1, v2}, Lshf;-><init>(Lcom/opera/android/custom_views/ToolbarProgressBar;)V

    iput-object v1, v0, Lgbf;->n:Lshf;

    move-object/from16 v1, p26

    iput-object v1, v0, Lgbf;->r:Lpt3;

    new-instance v1, Lzaf;

    invoke-direct {v1, v0}, Lzaf;-><init>(Lgbf;)V

    iput-object v1, v0, Lgbf;->l:Lzaf;

    iget-object v2, v11, Lk6l;->w:Lxg;

    new-instance v3, Ld8e;

    const/16 v6, 0x8

    invoke-direct {v3, v0, v6}, Ld8e;-><init>(Ljava/lang/Object;B)V

    invoke-interface/range {p24 .. p24}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-static {v2, v0, v1, v3}, Laib;->A(Lw6f;Ltcc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    sget-object v0, Lava;->a:Lcva;

    new-instance v1, Lyqd;

    const/16 v2, 0x18

    move-object/from16 v3, v31

    invoke-direct {v1, v3, v2}, Lyqd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcva;->a(Ljava/lang/Runnable;)V

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lxvl;

    iget-object p0, p0, Lgbf;->q:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lxvl;

    iget-object p0, p0, Lgbf;->q:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final b()V
    .registers 1

    iget-object p0, p0, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lczj;->b()V

    return-void
.end method

.method public final f()V
    .registers 1

    iget-object p0, p0, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lczj;->f()V

    return-void
.end method

.method public final i()Z
    .registers 1

    iget-object p0, p0, Lgbf;->t:Lbpd;

    invoke-virtual {p0}, Lbpd;->y()Lupm;

    move-result-object p0

    invoke-interface {p0}, Lczj;->i()Z

    move-result p0

    return p0
.end method

.method public final k(Ljava/lang/String;)V
    .registers 3

    iget-object p0, p0, Lgbf;->t:Lbpd;

    iget-object v0, p0, Lbpd;->c:Ljava/lang/Object;

    check-cast v0, Lgbf;

    iget-object v0, v0, Lgbf;->j:Lvbf;

    invoke-virtual {v0, p1}, Lvbf;->k(Ljava/lang/String;)V

    iget-object p0, p0, Lbpd;->b:Ljava/lang/Object;

    check-cast p0, Lupm;

    if-eqz p0, :cond_14

    invoke-interface {p0, p1}, Lupm;->k(Ljava/lang/String;)V

    :cond_14
    return-void
.end method

.method public final l(Lbsi;Lhbf;)V
    .registers 7

    if-eqz p1, :cond_5

    iget-object v0, p1, Lbsi;->f:Lqt3;

    goto :goto_6

    :cond_5
    const/4 v0, 0x0

    :goto_6
    iput-object v0, p0, Lgbf;->z:Lqt3;

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p1, :cond_12

    iget-boolean v2, p1, Lbsi;->g:Z

    if-eqz v2, :cond_12

    move v2, v1

    goto :goto_13

    :cond_12
    move v2, v0

    :goto_13
    iput-boolean v2, p0, Lgbf;->x:Z

    if-eqz p1, :cond_19

    iget v0, p1, Lbsi;->c:I

    :cond_19
    iput v0, p0, Lgbf;->y:I

    iget-object v0, p0, Lgbf;->m:Ldbf;

    iget-object v0, v0, Ldbf;->k:Lwt3;

    invoke-virtual {v0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmbf;

    iget-object v2, v0, Lmbf;->e:Lpde;

    invoke-virtual {v2, p2}, Lekc;->r(Ljava/lang/Object;)V

    iget-boolean v2, v0, Lmbf;->h:Z

    invoke-virtual {p2}, Ljava/lang/Enum;->ordinal()I

    move-result p2

    if-eqz p2, :cond_46

    if-eq p2, v1, :cond_3e

    const/4 v3, 0x2

    if-eq p2, v3, :cond_3e

    const/4 v3, 0x3

    if-eq p2, v3, :cond_3e

    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_3e
    if-eqz v2, :cond_43

    sget-object p2, Ltk0;->d:Ltk0;

    goto :goto_48

    :cond_43
    sget-object p2, Ltk0;->e:Ltk0;

    goto :goto_48

    :cond_46
    sget-object p2, Ltk0;->c:Ltk0;

    :goto_48
    iput-object p2, v0, Lmbf;->g:Ltk0;

    iget-object v0, v0, Lmbf;->c:Lpde;

    invoke-static {v0, p2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    iget-object p2, p0, Lgbf;->B:Liuh;

    iget-object p2, p2, Liuh;->c:Ljava/lang/Object;

    check-cast p2, Ljava/util/LinkedHashSet;

    invoke-interface {p2}, Ljava/util/Set;->clear()V

    iget-object p2, p0, Lgbf;->j:Lvbf;

    invoke-virtual {p2}, Lvbf;->p()Z

    move-result v0

    if-eq v0, v1, :cond_6e

    invoke-virtual {p2}, Lvbf;->q()V

    const-wide/16 v2, 0x1

    invoke-virtual {p2, v2, v3, v1}, Lvbf;->r(JZ)V

    invoke-virtual {p2}, Lvbf;->l()V

    invoke-virtual {p2}, Lvbf;->u()V

    :cond_6e
    iget-object p2, p0, Lgbf;->b:Lz43;

    invoke-virtual {p2}, Lz43;->s()V

    iget-object v0, p0, Lgbf;->o:Lb7f;

    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    invoke-virtual {v0, v1}, Lb7f;->d(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lgbf;->s()V

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p0, p0, Lgbf;->s:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lzqi;

    iget-object p2, p2, Lzqi;->b:Lmrk;

    invoke-virtual {p2}, Lmrk;->f()V

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lzqi;

    iget-object p2, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p2}, Lmrk;->d()Z

    move-result p2

    if-nez p2, :cond_a0

    iget-object p0, p0, Lzqi;->b:Lmrk;

    invoke-virtual {p0, p1}, Lmrk;->h(Lbsi;)V

    :cond_a0
    return-void
.end method

.method public final m(Z)V
    .registers 9

    iget-object v0, p0, Lgbf;->z:Lqt3;

    const/4 v1, 0x0

    iput-object v1, p0, Lgbf;->z:Lqt3;

    iget-object v2, p0, Lgbf;->b:Lz43;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, p0, Lgbf;->s:Lay;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lzqi;

    const/4 v4, 0x0

    if-eqz v3, :cond_aa

    iget-object v3, v3, Lzqi;->b:Lmrk;

    invoke-virtual {v3}, Lmrk;->d()Z

    move-result v5

    if-eqz v5, :cond_aa

    invoke-virtual {v3}, Lmrk;->d()Z

    move-result v5

    if-eqz v5, :cond_aa

    iget-object v5, v3, Lmrk;->W:Lqt6;

    iput-boolean v4, v5, Lqt6;->a:Z

    iget-object v5, v5, Lqt6;->e:Ljava/lang/Object;

    check-cast v5, Ljrk;

    invoke-static {v5}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-object v5, v3, Lmrk;->y:Lw6j;

    iget-object v5, v5, Lw6j;->a:Ljava/lang/Object;

    check-cast v5, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const/16 v6, 0x8

    invoke-virtual {v5, v6}, Landroidx/coordinatorlayout/widget/CoordinatorLayout;->setVisibility(I)V

    iget-object v5, v3, Lmrk;->v:Ligi;

    invoke-virtual {v5}, Ligi;->y0()V

    iget-object v5, v3, Lmrk;->u:Lfe5;

    invoke-virtual {v5, v4}, Lfe5;->a(Z)V

    iget-object v5, v3, Lmrk;->P:Lc1f;

    if-eqz v5, :cond_4a

    invoke-virtual {v5, v4}, Lc1f;->f(Z)V

    :cond_4a
    iget-object v5, v3, Lmrk;->O:Lrn9;

    iput-boolean v4, v5, Lrn9;->b:Z

    iget-object v5, v3, Lmrk;->G:Lrv7;

    iget-object v5, v5, Lrv7;->d:Lhz4;

    iget-object v5, v5, Lhz4;->c:Ljava/lang/Object;

    check-cast v5, Ld8e;

    invoke-virtual {v5}, Ld8e;->invoke()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lm0a;

    sget-object v6, Lv08;->a:Lv08;

    iput-object v6, v5, Lm0a;->d:Ljava/util/Set;

    iget-object v6, v5, Lm0a;->a:Ltah;

    invoke-virtual {v6}, Ltah;->k()V

    invoke-virtual {v5}, Lm0a;->b()V

    iget-object v5, v3, Lmrk;->q:Lx77;

    iget-object v6, v5, Lx77;->c:Ljava/lang/Object;

    check-cast v6, Lgm8;

    invoke-interface {v6}, Lgm8;->e()V

    iget-object v6, v5, Lx77;->d:Ljava/lang/Object;

    check-cast v6, Leq6;

    if-eqz v6, :cond_7a

    invoke-virtual {v6}, Leq6;->K()V

    :cond_7a
    iput-object v1, v5, Lx77;->d:Ljava/lang/Object;

    iget-object v5, v3, Lmrk;->J:Lcom/opera/android/suggestion/SuggestionManagerBridge;

    iget-wide v5, v5, Lcom/opera/android/suggestion/SuggestionManagerBridge;->a:J

    invoke-static {v5, v6}, LJ/N;->MfA86TKh(J)V

    iget-object v5, v3, Lmrk;->h:Liv7;

    iget v6, v5, Liv7;->l:I

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Liv7;->l:I

    iget-boolean v6, v3, Lmrk;->U:Z

    if-nez v6, :cond_92

    invoke-virtual {v5}, Liv7;->f()V

    :cond_92
    iput-boolean v4, v3, Lmrk;->U:Z

    iget-object v3, v3, Lmrk;->z:Leyi;

    iget-boolean v5, v3, Leyi;->b:Z

    if-nez v5, :cond_aa

    const/4 v5, 0x1

    iput-boolean v5, v3, Leyi;->b:Z

    iget-object v5, v3, Leyi;->d:Ljava/lang/Object;

    check-cast v5, Lmrk;

    iget-object v5, v5, Lmrk;->b:Landroid/view/ViewGroup;

    iget-object v3, v3, Leyi;->c:Ljava/lang/Object;

    check-cast v3, Lqlk;

    invoke-virtual {v5, v3}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    :cond_aa
    iget-object v3, p0, Lgbf;->j:Lvbf;

    invoke-virtual {v3}, Lvbf;->p()Z

    move-result v5

    if-eqz v5, :cond_c2

    invoke-virtual {v3}, Lvbf;->q()V

    const-wide/16 v5, 0x1

    invoke-virtual {v3, v5, v6, v4}, Lvbf;->r(JZ)V

    if-eqz p1, :cond_bf

    invoke-virtual {v3}, Lvbf;->l()V

    :cond_bf
    invoke-virtual {v3}, Lvbf;->u()V

    :cond_c2
    iget-object v3, p0, Lgbf;->h:Lk6l;

    iget-object v3, v3, Lk6l;->o:Lb2l;

    invoke-virtual {p0, v3}, Lgbf;->u(Lb2l;)V

    invoke-virtual {v2}, Lz43;->u()V

    iget-object v2, p0, Lgbf;->o:Lb7f;

    sget-object v3, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    invoke-virtual {v2, v3}, Lb7f;->d(Ljava/lang/Object;)V

    invoke-virtual {p0}, Lgbf;->s()V

    iget-object p0, p0, Lgbf;->m:Ldbf;

    iget-object p0, p0, Ldbf;->k:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lmbf;

    iget-object v2, p0, Lmbf;->e:Lpde;

    invoke-virtual {v2, v1}, Lekc;->r(Ljava/lang/Object;)V

    iput-object v1, p0, Lmbf;->g:Ltk0;

    iget-object v1, p0, Lmbf;->c:Lpde;

    iget-boolean p0, p0, Lmbf;->h:Z

    if-eqz p0, :cond_f0

    sget-object p0, Ltk0;->d:Ltk0;

    goto :goto_f2

    :cond_f0
    sget-object p0, Ltk0;->e:Ltk0;

    :goto_f2
    invoke-static {v1, p0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    if-eqz p1, :cond_fc

    if-eqz v0, :cond_fc

    invoke-virtual {v0}, Lqt3;->run()V

    :cond_fc
    return-void
.end method

.method public final n()V
    .registers 4

    iget-object v0, p0, Lgbf;->i:Landroid/view/View;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v1

    if-nez v1, :cond_19

    invoke-static {v0}, Lq9n;->x(Landroid/view/View;)Z

    move-result v1

    if-eqz v1, :cond_19

    new-instance v1, Lkqd;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lkqd;-><init>(Ljava/lang/Object;B)V

    invoke-static {v1, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    return-void

    :cond_19
    iget-object v0, p0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->n()V

    iget-object p0, p0, Lgbf;->s:Lay;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    if-eqz p0, :cond_6d

    check-cast p0, Lzqi;

    iget-object p0, p0, Lzqi;->b:Lmrk;

    iget-object v0, p0, Lmrk;->P:Lc1f;

    if-eqz v0, :cond_62

    iget-object v1, v0, Lc1f;->g:Ljava/lang/Object;

    check-cast v1, Lvqk;

    const/4 v2, 0x0

    iput-boolean v2, v1, Lvqk;->w:Z

    iget-object v0, v0, Lc1f;->a:Ljava/lang/Object;

    check-cast v0, Lnga;

    iget-object v1, v0, Lnga;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    invoke-virtual {v1}, Landroid/view/ViewPropertyAnimator;->cancel()V

    iget-object v1, v0, Lnga;->c:Ljava/lang/Object;

    check-cast v1, Landroid/view/ViewGroup;

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object v1

    iget v0, v0, Lnga;->a:I

    int-to-float v0, v0

    invoke-virtual {v1, v0}, Landroid/view/ViewPropertyAnimator;->translationY(F)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    sget-object v1, Llf1;->l:Landroid/view/animation/PathInterpolator;

    invoke-virtual {v0, v1}, Landroid/view/ViewPropertyAnimator;->setInterpolator(Landroid/animation/TimeInterpolator;)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    const-wide/16 v1, 0x0

    invoke-virtual {v0, v1, v2}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/ViewPropertyAnimator;->start()V

    :cond_62
    iget-object p0, p0, Lmrk;->G:Lrv7;

    iget-object p0, p0, Lrv7;->w:Lpv7;

    if-eqz p0, :cond_6d

    iget-object p0, p0, Lpv7;->d:Lwt7;

    invoke-virtual {p0}, Lwt7;->a()V

    :cond_6d
    return-void
.end method

.method public final o()Lcom/opera/android/bar/FindInPage;
    .registers 5

    iget-object v0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    if-nez v0, :cond_28

    iget-object v0, p0, Lgbf;->i:Landroid/view/View;

    const v1, 0x7f0a0497

    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewStub;

    invoke-virtual {v0}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bar/FindInPage;

    iput-object v0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    new-instance v1, Lqie;

    const/4 v2, 0x2

    invoke-direct {v1, p0, v2}, Lqie;-><init>(Ljava/lang/Object;B)V

    iput-object v1, v0, Lcom/opera/android/bar/FindInPage;->v:Lqie;

    new-instance v1, La49;

    iget-object v2, p0, Lgbf;->a:Lcom/opera/android/BrowserActivity;

    iget-object v3, p0, Lgbf;->h:Lk6l;

    invoke-direct {v1, v2, v0, v3}, La49;-><init>(Lcom/opera/android/BrowserActivity;Lcom/opera/android/bar/FindInPage;Lk6l;)V

    :cond_28
    iget-object p0, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    return-object p0
.end method

.method public final p()Landroid/view/View;
    .registers 4

    iget-object v0, p0, Lgbf;->b:Lz43;

    invoke-virtual {v0}, Lz43;->h()Landroid/view/View;

    move-result-object v0

    if-eqz v0, :cond_9

    return-object v0

    :cond_9
    iget-object p0, p0, Lgbf;->j:Lvbf;

    iget-object p0, p0, Lvbf;->r:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/EnumMap;

    invoke-virtual {p0}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_19
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_34

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bar/OmniButtonView;

    iget-object v1, v0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v1, :cond_19

    iget-object v1, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Luaf;

    iget-object v1, v1, Luaf;->a:Ltaf;

    sget-object v2, Ltaf;->i:Ltaf;

    if-ne v1, v2, :cond_19

    return-object v0

    :cond_34
    const/4 p0, 0x0

    return-object p0
.end method

.method public final q()Lcom/opera/android/bar/OmniButtonView;
    .registers 4

    iget-object p0, p0, Lgbf;->j:Lvbf;

    iget-object p0, p0, Lvbf;->r:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/EnumMap;

    invoke-virtual {p0}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_33

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bar/OmniButtonView;

    iget-object v1, v0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v1, :cond_10

    iget-object v1, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Luaf;

    iget-object v1, v1, Luaf;->a:Ltaf;

    sget-object v2, Ltaf;->l:Ltaf;

    if-eq v1, v2, :cond_32

    sget-object v2, Ltaf;->m:Ltaf;

    if-eq v1, v2, :cond_32

    sget-object v2, Ltaf;->n:Ltaf;

    if-ne v1, v2, :cond_10

    :cond_32
    return-object v0

    :cond_33
    const/4 p0, 0x0

    return-object p0
.end method

.method public final r()Landroid/view/View;
    .registers 4

    iget-object p0, p0, Lgbf;->j:Lvbf;

    iget-object p0, p0, Lvbf;->r:Lqfb;

    iget-object p0, p0, Lqfb;->b:Ljava/lang/Object;

    check-cast p0, Ljava/util/EnumMap;

    invoke-virtual {p0}, Ljava/util/EnumMap;->values()Ljava/util/Collection;

    move-result-object p0

    invoke-interface {p0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object p0

    :cond_10
    invoke-interface {p0}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_37

    invoke-interface {p0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bar/OmniButtonView;

    iget-object v1, v0, Lcom/opera/android/bar/OmniButtonView;->g:Lbp;

    if-eqz v1, :cond_10

    iget-object v1, v1, Lbp;->b:Ljava/lang/Object;

    check-cast v1, Luaf;

    iget-object v1, v1, Luaf;->a:Ltaf;

    sget-object v2, Ltaf;->o:Ltaf;

    if-eq v1, v2, :cond_36

    sget-object v2, Ltaf;->p:Ltaf;

    if-eq v1, v2, :cond_36

    sget-object v2, Ltaf;->r:Ltaf;

    if-eq v1, v2, :cond_36

    sget-object v2, Ltaf;->q:Ltaf;

    if-ne v1, v2, :cond_10

    :cond_36
    return-object v0

    :cond_37
    const/4 p0, 0x0

    return-object p0
.end method

.method public final s()V
    .registers 2

    iget-object p0, p0, Lgbf;->p:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_6
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_16

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcz3;

    invoke-interface {v0}, Lcz3;->b()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public final t(Z)V
    .registers 4

    iget-object v0, p0, Lgbf;->v:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    if-eq v1, p1, :cond_42

    iget-object v1, p0, Lgbf;->w:Lhh4;

    if-eqz v1, :cond_18

    invoke-interface {v1}, Lhh4;->cancel()V

    const/4 v1, 0x0

    iput-object v1, p0, Lgbf;->w:Lhh4;

    :cond_18
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v1

    invoke-virtual {v0, v1}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, p0, Lgbf;->h:Lk6l;

    iget-object v0, v0, Lk6l;->o:Lb2l;

    if-eqz p1, :cond_37

    new-instance p1, Lhpd;

    const/16 v1, 0x16

    invoke-direct {p1, p0, v0, v1}, Lhpd;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    check-cast v0, Ld7l;

    iget-object v0, v0, Ld7l;->j:Le7l;

    invoke-interface {v0, p1}, Lb9l;->D(Ljava/lang/Runnable;)Lhh4;

    move-result-object p1

    iput-object p1, p0, Lgbf;->w:Lhh4;

    return-void

    :cond_37
    iget-object p1, p0, Lgbf;->u:Lcom/opera/android/bar/FindInPage;

    if-eqz p1, :cond_42

    invoke-virtual {p0}, Lgbf;->o()Lcom/opera/android/bar/FindInPage;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/bar/FindInPage;->f()V

    :cond_42
    return-void
.end method

.method public final u(Lb2l;)V
    .registers 3

    iget-object v0, p0, Lgbf;->b:Lz43;

    iget-object v0, v0, Lz43;->f:Ljava/lang/Object;

    check-cast v0, Lv43;

    invoke-virtual {v0, p1}, Lv43;->c(Lb2l;)V

    iget-object p0, p0, Lgbf;->q:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    :goto_f
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_21

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxvl;

    iget-object p1, p1, Lxvl;->a:Lg7m;

    invoke-virtual {p1}, Lg7m;->o()V

    goto :goto_f

    :cond_21
    return-void
.end method
