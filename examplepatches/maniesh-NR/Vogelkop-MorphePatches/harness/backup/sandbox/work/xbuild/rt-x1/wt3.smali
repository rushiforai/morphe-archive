.class public final synthetic Lwt3;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lesk;


# instance fields
.field public final synthetic a:B

.field public final synthetic b:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Lwt3;->a:B

    iput-object p1, p0, Lwt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 27

    move-object/from16 v0, p0

    iget-byte v1, v0, Lwt3;->a:B

    const/4 v2, 0x1

    iget-object v4, v0, Lwt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v1, :pswitch_data_2d2

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object v0

    return-object v0

    :pswitch_11
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->D:Ljvj;

    if-eqz v0, :cond_19

    move-object v3, v0

    goto :goto_1a

    :cond_19
    const/4 v3, 0x0

    :goto_1a
    return-object v3

    :pswitch_1b
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    const v0, 0x7f0a090a

    invoke-virtual {v4, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    return-object v0

    :pswitch_27
    const-class v0, Lg0c;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v1, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lg0c;

    return-object v0

    :pswitch_32
    const-class v0, Lsyl;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v1, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lsyl;

    return-object v0

    :pswitch_3d
    new-instance v1, Lc8l;

    iget-object v2, v0, Lwt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v3, v2, Lcom/opera/android/BrowserActivity;->x:Lumi;

    sget-object v4, Lyne;->b:Ldeg;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->f1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Ln7l;

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->t0:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lv4b;

    invoke-direct/range {v1 .. v6}, Lc8l;-><init>(Landroid/content/Context;Lumi;Ldeg;Ln7l;Lv4b;)V

    return-object v1

    :pswitch_65
    const-class v0, Lrj;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v1, v0}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v0

    check-cast v0, Lrj;

    return-object v0

    :pswitch_70
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v4, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    return-object v0

    :pswitch_78
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Ljbf;->t(Landroid/content/Context;)Ljbf;

    move-result-object v0

    return-object v0

    :pswitch_7f
    new-instance v1, Lv6d;

    iget-object v5, v0, Lwt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->u1:Lqq6;

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    invoke-direct {v1, v0}, Lv6d;-><init>(Lqq6;)V

    new-instance v0, Lf1p;

    iget-object v8, v5, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v5, v0, Lf1p;->a:Ljava/lang/Object;

    iput-object v8, v0, Lf1p;->b:Ljava/lang/Object;

    sget-object v4, Lava;->a:Lcva;

    new-instance v6, Ldnb;

    const/16 v7, 0x8

    invoke-direct {v6, v0, v7}, Ldnb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v6}, Lcva;->a(Ljava/lang/Runnable;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v4, Lv9l;

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v6

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v7, v7, Ld6j;->c:Lx5f;

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object v9

    iget-object v10, v5, Ldx3;->o:Lqim;

    invoke-static {v10}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v10, v10, Lqim;->h:Lp77;

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object v11

    iget-object v12, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v12, :cond_c9

    const/4 v12, 0x0

    :cond_c9
    iget-object v13, v2, Ltw3;->a:Lhx3;

    iget-object v13, v13, Lhx3;->s:Lfx3;

    invoke-virtual {v13}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v13

    check-cast v13, Lu4l;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v14

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v15

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v16

    iget-object v0, v2, Ltw3;->R:Lhw3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v17, v0

    check-cast v17, Lc4l;

    new-instance v0, Lmt3;

    const/16 v2, 0x1a

    invoke-direct {v0, v5, v2}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v2, Lmt3;

    const/16 v3, 0x1b

    invoke-direct {v2, v5, v3}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v3, Lmt3;

    move-object/from16 p0, v0

    const/16 v0, 0x1c

    invoke-direct {v3, v5, v0}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v0, Leme;

    invoke-direct {v0, v5}, Leme;-><init>(Ljava/lang/Object;)V

    move-object/from16 v21, v0

    new-instance v0, Ljo3;

    move-object/from16 v19, v2

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    if-nez v2, :cond_110

    const/4 v2, 0x0

    :cond_110
    invoke-direct {v0, v2}, Ljo3;-><init>(Lcom/opera/android/bar/BottomBar;)V

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->b0:Lyqa;

    move-object/from16 v22, v0

    new-instance v0, Lx77;

    move-object/from16 v23, v2

    iget-object v2, v5, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v20, v3

    new-instance v3, Lc37;

    invoke-direct {v3, v1, v5}, Lc37;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    move-object/from16 v24, v4

    const/16 v4, 0x9

    invoke-direct {v0, v2, v3, v4}, Lx77;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lgb3;

    const/4 v3, 0x6

    invoke-direct {v2, v5, v1, v3}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v18, p0

    move-object/from16 v25, v2

    move-object/from16 v4, v24

    move-object/from16 v24, v0

    invoke-direct/range {v4 .. v25}, Lv9l;-><init>(Lndc;Lgjm;Lx5f;Lumi;Lz77;Lp77;Lysj;Lk6l;Lu4l;Li53;Lnr8;Lcom/opera/android/settings/SettingsManager;Lc4l;Lmt3;Lmt3;Lmt3;Leme;Ljo3;Lyqa;Lx77;Lgb3;)V

    return-object v4

    :pswitch_140
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v3, v0, Lwt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/browser/BrowserFragment;->f0()Lcom/opera/android/browser/BrowserFragmentFrameLayout;

    move-result-object v0

    new-instance v2, Ln03;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->Q0()Lqln;

    move-result-object v1

    iget-object v5, v1, Lqln;->h:Lkze;

    iget-object v1, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v1, v1, Ltw3;->a:Lhx3;

    invoke-virtual {v1}, Lhx3;->o()Lcom/opera/android/Lazy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Likc;

    iget-object v7, v0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->c:Lpde;

    move-object v4, v3

    invoke-direct/range {v2 .. v7}, Ln03;-><init>(Landroid/content/Context;Lndc;Lkze;Likc;Lpde;)V

    return-object v2

    :pswitch_16a
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Lmeg;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->q1:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Levn;

    invoke-direct {v0, v1}, Lmeg;-><init>(Levn;)V

    return-object v0

    :pswitch_184
    new-instance v0, Lq82;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v1, :cond_18c

    const/4 v3, 0x0

    goto :goto_18d

    :cond_18c
    move-object v3, v1

    :goto_18d
    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->e0:Lc5o;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-direct {v0, v4, v3, v1}, Lq82;-><init>(Lcom/opera/android/BrowserActivity;Lk6l;Lc5o;)V

    return-object v0

    :pswitch_1a1
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-eqz v0, :cond_1a7

    move-object v3, v0

    goto :goto_1a8

    :cond_1a7
    const/4 v3, 0x0

    :goto_1a8
    iget-object v0, v3, Lz43;->i:Ljava/lang/Object;

    check-cast v0, Lgbf;

    iget-object v0, v0, Lgbf;->j:Lvbf;

    invoke-virtual {v0}, Lvbf;->p()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_1b7
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->I:Lhw3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le4i;

    return-object v0

    :pswitch_1c2
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Ldq9;

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    iget-object v2, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v2, v2, Ltw3;->r:Lzv3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljt3;

    iget-object v2, v2, Ljt3;->g:Lkze;

    iget-object v3, v4, Lcom/opera/android/BrowserActivity;->z1:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lt8l;

    iget-object v3, v3, Lt8l;->c:Lpde;

    invoke-direct {v0, v1, v2, v3}, Ldq9;-><init>(Lcom/opera/android/settings/SettingsManager;Lkze;Lpde;)V

    return-object v0

    :pswitch_1e4
    new-instance v0, Lt8l;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v1, :cond_1ec

    const/4 v3, 0x0

    goto :goto_1ed

    :cond_1ec
    move-object v3, v1

    :goto_1ed
    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->y1:Lpde;

    invoke-direct {v0, v4, v3, v1}, Lt8l;-><init>(Lndc;Lk6l;Lpde;)V

    return-object v0

    :pswitch_1f3
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Lmo3;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->I:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lu8k;

    invoke-virtual {v1}, Lu8k;->b()Lt8k;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->G:Lr22;

    if-nez v1, :cond_210

    const/4 v3, 0x0

    goto :goto_211

    :cond_210
    move-object v3, v1

    :goto_211
    invoke-virtual {v3}, Lr22;->O()Z

    move-result v1

    invoke-direct {v0, v1}, Lmo3;-><init>(Z)V

    return-object v0

    :pswitch_219
    new-instance v2, Lyu4;

    iget-object v3, v0, Lwt3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v4, v3, Lcom/opera/android/BrowserActivity;->x:Lumi;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v5, v0, Ltw3;->v0:Lhw3;

    sget-object v0, Lvml;->e:Lwjh;

    iget-object v1, v0, Lwjh;->b:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ld7a;

    iget-object v0, v0, Lwjh;->d:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljg8;

    invoke-direct/range {v2 .. v7}, Lyu4;-><init>(Landroid/content/Context;Lumi;Lhw3;Ldx5;Ljg8;)V

    return-object v2

    :pswitch_233
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    new-instance v0, Lykn;

    new-instance v1, Ldu3;

    const/16 v2, 0x13

    invoke-direct {v1, v4, v2}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v2, Ldu3;

    const/16 v3, 0x14

    invoke-direct {v2, v4, v3}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct {v0, v1, v2}, Lykn;-><init>(Ldu3;Ldu3;)V

    return-object v0

    :pswitch_249
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v4, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v0, v0, Lqim;->e:Lysj;

    return-object v0

    :pswitch_253
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->F:Lhw3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lmbf;

    return-object v0

    :pswitch_25e
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->F0:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm0a;

    return-object v0

    :pswitch_269
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-eqz v0, :cond_27f

    check-cast v0, Ld7l;

    invoke-virtual {v0}, Ld7l;->n0()Z

    move-result v0

    if-eqz v0, :cond_27f

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v0

    if-nez v0, :cond_280

    :cond_27f
    const/4 v2, 0x0

    :cond_280
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_285
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->x0()Lwy;

    move-result-object v0

    iget-object v0, v0, Lwy;->d:Lwjh;

    return-object v0

    :pswitch_28e
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->M:Lgbf;

    if-nez v0, :cond_294

    const/4 v3, 0x0

    goto :goto_295

    :cond_294
    move-object v3, v0

    :goto_295
    invoke-virtual {v3}, Lgbf;->p()Landroid/view/View;

    move-result-object v0

    return-object v0

    :pswitch_29a
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v0

    invoke-static {v0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v0

    return-object v0

    :pswitch_2a5
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_2ad

    const/4 v3, 0x0

    goto :goto_2ae

    :cond_2ad
    move-object v3, v0

    :goto_2ae
    return-object v3

    :pswitch_2af
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->q0()Lh73;

    move-result-object v0

    iget-boolean v1, v4, Lcom/opera/android/BrowserActivity;->o1:Z

    new-instance v3, Li7d;

    invoke-direct {v3, v0, v1, v2}, Li7d;-><init>(Lh73;ZZ)V

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v1, Ljw0;

    const/4 v2, 0x2

    invoke-direct {v1, v4, v2}, Ljw0;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    return-object v3

    :pswitch_2ca
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->O0()Lntl;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_2d2
    .packed-switch 0x0
        :pswitch_2ca
        :pswitch_2af
        :pswitch_2a5
        :pswitch_29a
        :pswitch_28e
        :pswitch_285
        :pswitch_269
        :pswitch_25e
        :pswitch_253
        :pswitch_249
        :pswitch_233
        :pswitch_219
        :pswitch_1f3
        :pswitch_1e4
        :pswitch_1c2
        :pswitch_1b7
        :pswitch_1a1
        :pswitch_184
        :pswitch_16a
        :pswitch_140
        :pswitch_7f
        :pswitch_78
        :pswitch_70
        :pswitch_65
        :pswitch_3d
        :pswitch_32
        :pswitch_27
        :pswitch_1b
        :pswitch_11
    .end packed-switch
.end method
