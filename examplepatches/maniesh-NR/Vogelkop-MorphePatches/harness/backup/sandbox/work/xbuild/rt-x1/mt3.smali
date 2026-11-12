.class public final synthetic Lmt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lkotlin/jvm/functions/Function0;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lmt3;->a:B

    iput-object p1, p0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final invoke()Ljava/lang/Object;
    .registers 17

    move-object/from16 v0, p0

    iget-byte v1, v0, Lmt3;->a:B

    const/16 v2, 0xe

    const v3, 0x7f0a0b49

    const/4 v4, 0x0

    iget-object v5, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v1, :pswitch_data_324

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_14
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-eqz v0, :cond_1b

    move-object v4, v0

    :cond_1b
    return-object v4

    :pswitch_1c
    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->y0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwv3;

    iget-object v0, v0, Lwv3;->a:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0, v3}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v1

    iget v2, v1, Landroid/graphics/Rect;->top:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->M0()Lysl;

    move-result-object v3

    invoke-interface {v3}, Lysl;->h()I

    move-result v3

    add-int/2addr v3, v2

    iput v3, v1, Landroid/graphics/Rect;->top:I

    iget v2, v1, Landroid/graphics/Rect;->bottom:I

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->M0()Lysl;

    move-result-object v0

    invoke-interface {v0}, Lysl;->g()I

    move-result v0

    sub-int/2addr v2, v0

    iput v2, v1, Landroid/graphics/Rect;->bottom:I

    new-instance v0, Landroid/util/Size;

    invoke-virtual {v1}, Landroid/graphics/Rect;->width()I

    move-result v2

    invoke-virtual {v1}, Landroid/graphics/Rect;->height()I

    move-result v1

    invoke-direct {v0, v2, v1}, Landroid/util/Size;-><init>(II)V

    return-object v0

    :pswitch_56
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v5, v3}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0

    :pswitch_5f
    new-instance v1, Lpgf;

    iget-object v5, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_68

    move-object v4, v0

    :cond_68
    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->a:Lhx3;

    iget-object v3, v0, Lhx3;->g:Lfx3;

    move-object v0, v4

    iget-object v4, v5, Lcom/opera/android/BrowserActivity;->x:Lumi;

    iget-object v6, v5, Lcom/opera/android/BrowserActivity;->a1:Lzyk;

    invoke-virtual {v6}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lmu6;

    new-instance v7, Ldu3;

    invoke-direct {v7, v5, v2}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object v2, v0

    invoke-direct/range {v1 .. v7}, Lpgf;-><init>(Lk6l;Lcom/opera/android/Lazy;Lumi;Landroid/content/Context;Lmu6;Ldu3;)V

    return-object v1

    :pswitch_83
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Lv4b;

    invoke-virtual {v5}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    sget-object v2, Lyne;->a:Lnr5;

    sget-object v3, Lzsd;->b:Lzsd;

    invoke-direct {v0, v1, v2, v3}, Lv4b;-><init>(Ltcc;Lnr5;Lzsd;)V

    return-object v0

    :pswitch_93
    new-instance v4, Lbuj;

    iget-object v5, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v6, v5, Lcom/opera/android/BrowserActivity;->x:Lumi;

    new-instance v7, Ldu3;

    const/16 v0, 0x10

    invoke-direct {v7, v5, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object v8

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v9, v0, Ld6j;->c:Lx5f;

    invoke-direct/range {v4 .. v9}, Lbuj;-><init>(Lcom/opera/android/BrowserActivity;Lumi;Ldu3;Lysj;Lx5f;)V

    return-object v4

    :pswitch_b6
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Ll98;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->v:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ldp6;

    invoke-direct {v0, v5, v1}, Ll98;-><init>(Lcom/opera/android/BrowserActivity;Ldp6;)V

    return-object v0

    :pswitch_ce
    new-instance v0, Lyz9;

    iget-object v1, v5, Lcom/opera/android/BrowserActivity;->d0:Lwth;

    invoke-direct {v0, v1}, Lyz9;-><init>(Lwth;)V

    return-object v0

    :pswitch_d6
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v3, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v7

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lipk;

    iget-object v4, v3, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-static {v1}, Lwok;->t(Landroid/content/Context;)Lwok;

    move-result-object v5

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v8

    invoke-virtual {v3}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v9

    const v10, 0x7f140bb4

    invoke-virtual {v9, v10}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v10

    iget-object v11, v3, Lcom/opera/android/BrowserActivity;->m0:Lzyk;

    invoke-virtual {v11}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v11

    check-cast v11, Lf35;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v12

    new-instance v13, Ldu3;

    const/16 v0, 0xf

    invoke-direct {v13, v3, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v14, Lt1;

    const/4 v0, 0x1

    invoke-direct {v14, v1, v0}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v15, Lkw0;

    invoke-direct {v15, v1}, Lkw0;-><init>(Landroid/content/Context;)V

    invoke-direct/range {v2 .. v15}, Lipk;-><init>(Landroid/content/Context;Lumi;Lwok;Lx5f;Lnr8;Lglh;Ljava/lang/String;Ltcc;Lf35;Le00;Ldu3;Lt1;Lkw0;)V

    return-object v2

    :pswitch_12d
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v3, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v2, Lv1f;

    iget-object v4, v3, Lcom/opera/android/BrowserActivity;->x:Lumi;

    iget-object v1, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v5, v1, Ltw3;->a:Lhx3;

    invoke-virtual {v5}, Lhx3;->s()Lcom/opera/android/Lazy;

    move-result-object v5

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lxc9;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v6

    iget-object v6, v6, Lsf7;->e:Ljnm;

    iget-object v1, v1, Ltw3;->Q:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lojn;

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v8

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lk3i;

    invoke-virtual {v0}, Lk3i;->a()Likc;

    move-result-object v9

    invoke-direct/range {v2 .. v9}, Lv1f;-><init>(Lcom/opera/android/BrowserActivity;Lumi;Lxc9;Ljnm;Lojn;Lru9;Likc;)V

    return-object v2

    :pswitch_16e
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v4, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v3, Lf7d;

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v5

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v6, v1, Ltw3;->I:Lhw3;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Le4i;

    iget-object v7, v4, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->c:Lx5f;

    iget-object v1, v1, Ltw3;->a:Lhx3;

    invoke-virtual {v1}, Lhx3;->a()Lxb;

    move-result-object v9

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v10

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v11

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v12

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->F0()Lyug;

    move-result-object v13

    new-instance v14, Lpt3;

    invoke-direct {v14, v4, v2}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct/range {v3 .. v14}, Lf7d;-><init>(Lcom/opera/android/BrowserActivity;Lgjm;Le4i;Lumi;Lx5f;Lxb;Ldb;Ljtg;Lslk;Lyug;Lpt3;)V

    return-object v3

    :pswitch_1b1
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Lan;

    invoke-direct {v0}, Lan;-><init>()V

    invoke-virtual {v5, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    return-object v0

    :pswitch_1bc
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v3, v0, Lmt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v2, Lwy;

    iget-object v4, v3, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    iget-object v1, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v6, v1, Ltw3;->a:Lhx3;

    iget-object v6, v6, Lhx3;->g:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v7, v7, Ld6j;->c:Lx5f;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v8

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object v9

    iget-object v10, v0, Lcom/opera/android/OperaApplication;->p:Lrr3;

    iget-object v11, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v12, v11, Lxv1;->O:Lj4c;

    invoke-virtual {v12}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lzv9;

    sget-object v13, Lio7;->k:Lio7;

    sget-object v14, Lgy;->k:Lrbe;

    invoke-static {v3, v13, v14}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v13

    check-cast v13, Lgy;

    iget-object v1, v1, Ltw3;->a:Lhx3;

    move-object v14, v12

    move-object v12, v13

    invoke-virtual {v1}, Lhx3;->r()Lcom/opera/android/Lazy;

    move-result-object v13

    invoke-virtual {v1}, Lhx3;->x()Lcom/opera/android/Lazy;

    move-result-object v1

    iget-object v11, v11, Lxv1;->f:Lg92;

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v11

    move-object v15, v11

    check-cast v15, Lesk;

    move-object v11, v14

    move-object v14, v1

    invoke-direct/range {v2 .. v15}, Lwy;-><init>(Lxd5;Lumi;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;Lx5f;Ljtg;Lgmk;Lrr3;Lzv9;Lgy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lesk;)V

    new-instance v1, Lyy;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-static {v4}, Lfue;->c(Landroid/content/Context;)Lcue;

    move-result-object v4

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v5

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v0

    invoke-direct {v1, v4, v2, v5, v0}, Lyy;-><init>(Lcue;Lwy;Lfqe;Lfue;)V

    invoke-virtual {v3, v1}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    return-object v2

    :pswitch_22d
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->t1:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf7d;

    invoke-virtual {v0}, Lf7d;->b()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_23d
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-eqz v0, :cond_244

    move-object v4, v0

    :cond_244
    return-object v4

    :pswitch_245
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->t1:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf7d;

    invoke-virtual {v0}, Lf7d;->b()V

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_255
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v5}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v0

    iget-object v1, v0, Lgom;->a:Llom;

    sget-object v2, Llom;->d:Llom;

    if-ne v1, v2, :cond_264

    invoke-static {v5, v0}, Lmom;->b(Lt5d;Lgom;)V

    :cond_264
    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    return-object v0

    :pswitch_267
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Leej;

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object v1

    iget-object v2, v5, Ldx3;->o:Lqim;

    iget-object v2, v2, Lqim;->f:Laal;

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v3

    invoke-direct {v0, v1, v2, v3}, Leej;-><init>(Lnej;Laal;Lgjm;)V

    return-object v0

    :pswitch_27b
    new-instance v0, Lwul;

    new-instance v1, Lrii;

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->F:Lw6j;

    if-nez v2, :cond_284

    move-object v2, v4

    :cond_284
    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->N0()Lctl;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Lrii;-><init>(Lw6j;Lctl;)V

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->W:Lcom/opera/android/bar/TopToolbarContainer;

    if-nez v2, :cond_291

    move-object v2, v4

    goto :goto_292

    :cond_291
    move-object v4, v2

    :goto_292
    const v3, 0x7f0a0bd5

    invoke-virtual {v4, v3}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v3

    invoke-direct {v0, v5, v1, v2, v3}, Lwul;-><init>(Lndc;Lrii;Landroid/view/View;Landroid/view/View;)V

    return-object v0

    :pswitch_29d
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Ldyf;

    invoke-direct {v0, v5}, Ldyf;-><init>(Landroid/content/Context;)V

    iget-object v1, v0, Ldyf;->k:Lju2;

    invoke-virtual {v5, v1}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    return-object v0

    :pswitch_2aa
    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_2af

    move-object v4, v0

    :cond_2af
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lmu6;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v2

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->e:Lhd;

    invoke-direct {v1, v2, v4, v0}, Lmu6;-><init>(Lydn;Lk6l;Lhd;)V

    return-object v1

    :pswitch_2c7
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v5}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_2ce
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v6, Lulg;

    sget-object v7, Lxne;->b:Lii;

    invoke-virtual {v5}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    invoke-static {v1}, Lbml;->u(Landroid/content/Context;)Lbml;

    move-result-object v8

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->u()Lm9c;

    move-result-object v9

    new-instance v10, Lji;

    const/16 v1, 0x9

    invoke-direct {v10, v0, v1}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v11, Lxt3;

    const/4 v0, 0x2

    invoke-direct {v11, v5, v0}, Lxt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct/range {v6 .. v11}, Lulg;-><init>(Lii;Lbml;Lm9c;Lji;Lxt3;)V

    return-object v6

    :pswitch_2f9
    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->W:Lcom/opera/android/bar/TopToolbarContainer;

    if-eqz v0, :cond_2fe

    move-object v4, v0

    :cond_2fe
    return-object v4

    :pswitch_2ff
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_306

    move-object v4, v0

    :cond_306
    return-object v4

    :pswitch_307
    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz v0, :cond_30c

    move-object v4, v0

    :cond_30c
    return-object v4

    :pswitch_30d
    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-eqz v0, :cond_312

    move-object v4, v0

    :cond_312
    return-object v4

    :pswitch_313
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_31a

    move-object v4, v0

    :cond_31a
    return-object v4

    :pswitch_31b
    const-string v0, "browser_action_stats"

    const/4 v1, 0x0

    invoke-virtual {v5, v0, v1}, Landroid/content/Context;->getSharedPreferences(Ljava/lang/String;I)Landroid/content/SharedPreferences;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_324
    .packed-switch 0x0
        :pswitch_31b
        :pswitch_313
        :pswitch_30d
        :pswitch_307
        :pswitch_2ff
        :pswitch_2f9
        :pswitch_2ce
        :pswitch_2c7
        :pswitch_2aa
        :pswitch_29d
        :pswitch_27b
        :pswitch_267
        :pswitch_255
        :pswitch_245
        :pswitch_23d
        :pswitch_22d
        :pswitch_1bc
        :pswitch_1b1
        :pswitch_16e
        :pswitch_12d
        :pswitch_d6
        :pswitch_ce
        :pswitch_b6
        :pswitch_93
        :pswitch_83
        :pswitch_5f
        :pswitch_56
        :pswitch_1c
        :pswitch_14
    .end packed-switch
.end method
