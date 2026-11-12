.class public final Lou3;
.super Llim;
.source "SourceFile"


# instance fields
.field public final a:Lnrl;

.field public b:J

.field public c:J

.field public d:Z

.field public e:Z

.field public f:Z

.field public g:Lcom/opera/android/browser/SessionRestore$State;

.field public h:J

.field public final synthetic i:Lcom/opera/android/BrowserActivity;


# direct methods
.method public constructor <init>(Lcom/opera/android/BrowserActivity;)V
    .registers 3

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lou3;->i:Lcom/opera/android/BrowserActivity;

    new-instance p1, Lnrl;

    const/16 v0, 0x1a

    invoke-direct {p1, v0}, Lnrl;-><init>(B)V

    iput-object p1, p0, Lou3;->a:Lnrl;

    return-void
.end method


# virtual methods
.method public final R(Ljava/util/ArrayList;)Z
    .registers 34

    move-object/from16 v1, p0

    sget-object v0, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-object v2, v1, Lou3;->i:Lcom/opera/android/BrowserActivity;

    iget-object v12, v2, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    invoke-virtual {v2}, Ldx3;->W()Lk6l;

    move-result-object v3

    iget-object v4, v0, Lcom/opera/android/browser/SessionStore;->d:Lqz;

    iget-object v5, v0, Lcom/opera/android/browser/SessionStore;->f:Lk6l;

    if-eq v3, v5, :cond_3a

    if-eqz v5, :cond_17

    invoke-virtual {v5, v0}, Lk6l;->x(Lj6l;)V

    :cond_17
    iget-object v5, v0, Lcom/opera/android/browser/SessionStore;->f:Lk6l;

    if-eqz v5, :cond_25

    iget-object v5, v5, Lk6l;->s:Lg6l;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v5, v5, Lg6l;->a:Lh7f;

    invoke-virtual {v5, v4}, Lh7f;->c(Ljava/lang/Object;)Z

    :cond_25
    iput-object v3, v0, Lcom/opera/android/browser/SessionStore;->f:Lk6l;

    if-eqz v3, :cond_33

    iget-object v3, v3, Lk6l;->s:Lg6l;

    invoke-virtual {v3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v3, v3, Lg6l;->a:Lh7f;

    invoke-virtual {v3, v4}, Lh7f;->b(Ljava/lang/Object;)Z

    :cond_33
    iget-object v3, v0, Lcom/opera/android/browser/SessionStore;->f:Lk6l;

    if-eqz v3, :cond_3a

    invoke-virtual {v3, v0}, Lk6l;->c(Lj6l;)V

    :cond_3a
    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v3

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    const/4 v13, 0x0

    if-nez v0, :cond_44

    move-object v0, v13

    :cond_44
    iget-object v0, v0, Ljl6;->e:Ljava/lang/Object;

    check-cast v0, Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v5, "session.pause.time"

    const-wide/16 v6, -0x1

    invoke-interface {v0, v5, v6, v7}, Landroid/content/SharedPreferences;->getLong(Ljava/lang/String;J)J

    move-result-wide v5

    const-wide/16 v7, 0x0

    cmp-long v0, v5, v7

    if-gez v0, :cond_5d

    move-wide v5, v3

    :cond_5d
    sub-long/2addr v3, v5

    const-wide/32 v5, 0xea60

    div-long/2addr v3, v5

    invoke-virtual/range {p1 .. p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    const/4 v5, 0x2

    const/4 v6, 0x1

    const/4 v7, 0x0

    if-eqz v0, :cond_b2

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/settings/SettingsManager;->y()I

    move-result v0

    invoke-static {v0}, Lvep;->A(I)I

    move-result v0

    if-eqz v0, :cond_84

    if-eq v0, v6, :cond_b2

    if-ne v0, v5, :cond_80

    move v0, v6

    move v14, v7

    goto :goto_b4

    :cond_80
    invoke-static {}, Lh9o;->p()V

    return v7

    :cond_84
    sget-object v0, Lpn7;->b:Lon7;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v0

    invoke-virtual {v0}, Lno7;->i()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lwnh;

    iget-wide v8, v0, Lwnh;->b:J

    sget-object v0, Lun7;->d:Lun7;

    invoke-static {v8, v9, v0}, Lcs5;->y0(JLun7;)J

    move-result-wide v8

    sget-object v0, Lun7;->f:Lun7;

    invoke-static {v8, v9, v0}, Lpn7;->p(JLun7;)J

    move-result-wide v8

    const-wide/16 v10, 0x1

    cmp-long v0, v10, v8

    if-gtz v0, :cond_ae

    cmp-long v0, v8, v3

    if-gtz v0, :cond_ae

    move v0, v6

    goto :goto_af

    :cond_ae
    move v0, v7

    :goto_af
    move v14, v0

    move v0, v7

    goto :goto_b4

    :cond_b2
    move v0, v7

    move v14, v0

    :goto_b4
    iget-object v3, v1, Lou3;->g:Lcom/opera/android/browser/SessionRestore$State;

    if-eqz v3, :cond_2cf

    iget-object v4, v3, Lcom/opera/android/browser/SessionRestore$State;->b:Ln9g;

    iget-object v8, v2, Lcom/opera/android/BrowserActivity;->Q:Lcom/opera/android/RootView;

    if-nez v8, :cond_bf

    move-object v8, v13

    :cond_bf
    iput-boolean v7, v8, Lcom/opera/android/RootView;->h:Z

    iget-object v7, v8, Lcom/opera/android/RootView;->i:Lx7i;

    invoke-static {v7}, Lvml;->a(Ljava/lang/Runnable;)V

    if-eqz v14, :cond_d3

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    if-nez v0, :cond_cd

    move-object v0, v13

    :cond_cd
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-byte v6, v4, Ln9g;->b:B

    goto :goto_df

    :cond_d3
    if-eqz v0, :cond_df

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    if-nez v0, :cond_da

    move-object v0, v13

    :cond_da
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-byte v5, v4, Ln9g;->b:B

    :cond_df
    :goto_df
    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->U:Ldxk;

    if-nez v0, :cond_e4

    move-object v0, v13

    :cond_e4
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MBfPlsNT()V

    invoke-virtual {v2}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    sget-object v4, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iput-object v4, v0, Lxbf;->g:Ljava/lang/Object;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lvzk;

    iput-object v4, v0, Lvzk;->d:Ljava/lang/Object;

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    if-nez v0, :cond_100

    move-object v4, v13

    goto :goto_101

    :cond_100
    move-object v4, v0

    :goto_101
    iget-wide v5, v1, Lou3;->h:J

    const/4 v7, 0x4

    invoke-virtual {v4, v7}, Ljl6;->q(I)V

    :try_start_107
    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v8

    invoke-virtual {v4, v3}, Ljl6;->p(Lcom/opera/android/browser/SessionRestore$State;)V

    invoke-static {}, Ljava/lang/System;->nanoTime()J

    move-result-wide v10

    sub-long/2addr v10, v8

    iget-wide v8, v3, Lcom/opera/android/browser/SessionRestore$State;->a:J

    add-long/2addr v10, v8

    add-long/2addr v10, v5

    iget-object v0, v4, Ljl6;->g:Ljava/lang/Object;

    check-cast v0, Lx5f;

    const-wide/32 v5, 0xf4240

    div-long/2addr v10, v5

    invoke-virtual {v0, v10, v11}, Lx5f;->z0(J)V
    :try_end_122
    .catch Ljava/lang/Exception; {:try_start_107 .. :try_end_122} :catch_123

    goto :goto_12e

    :catch_123
    move-exception v0

    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/opera/android/browser/SessionRestore$State;->b()Lcom/opera/android/browser/SessionRestore$State;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljl6;->p(Lcom/opera/android/browser/SessionRestore$State;)V

    :goto_12e
    const/4 v0, 0x5

    invoke-virtual {v4, v0}, Ljl6;->q(I)V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->U:Ldxk;

    if-nez v0, :cond_137

    move-object v0, v13

    :cond_137
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->Mhw2Tkz0()V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->x0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v0

    if-nez v0, :cond_14d

    const-string v0, "Active tab restored to null"

    invoke-static {v0, v13}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :cond_14d
    iput-object v13, v1, Lou3;->g:Lcom/opera/android/browser/SessionRestore$State;

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->N0()Lctl;

    move-result-object v0

    invoke-virtual {v0}, Lctl;->b()V

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->N0()Lctl;

    move-result-object v0

    iget-object v0, v0, Lctl;->e:Lpde;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lbtl;

    iget-boolean v0, v0, Lbtl;->b:Z

    const/16 v15, 0xe

    if-eqz v0, :cond_1ef

    new-instance v16, Lj1c;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    const v1, 0x7f0a0b2c

    invoke-virtual {v2, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroid/widget/FrameLayout;

    const v1, 0x7f0a0b4b

    invoke-virtual {v2, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Landroidx/recyclerview/widget/RecyclerView;

    const v1, 0x7f0a0b4c

    invoke-virtual {v2, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;

    const v1, 0x7f0a0b2e

    invoke-virtual {v2, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v21

    const v1, 0x7f0a0b2d

    invoke-virtual {v2, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v22

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object v23

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->J0()Lysj;

    move-result-object v24

    new-instance v1, Lmt3;

    invoke-direct {v1, v2, v15}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v3, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v3, :cond_1bb

    move-object/from16 v26, v13

    goto :goto_1bd

    :cond_1bb
    move-object/from16 v26, v3

    :goto_1bd
    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v27

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v28

    iget-object v3, v12, Ltw3;->a:Lhx3;

    iget-object v3, v3, Lhx3;->s:Lfx3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v29, v3

    check-cast v29, Lu4l;

    new-instance v3, Lyu3;

    invoke-direct {v3, v2}, Lyu3;-><init>(Lcom/opera/android/BrowserActivity;)V

    iget-object v4, v2, Lcom/opera/android/BrowserActivity;->b0:Lyqa;

    move-object/from16 v17, v0

    move-object/from16 v25, v1

    move-object/from16 v30, v3

    move-object/from16 v31, v4

    invoke-direct/range {v16 .. v31}, Lj1c;-><init>(Lx5f;Landroid/widget/FrameLayout;Landroidx/recyclerview/widget/RecyclerView;Lcom/opera/android/tabui2/ConfigurationProvidingFrameLayout;Landroid/view/View;Landroid/view/View;Lz77;Lysj;Lmt3;Lk6l;Li53;Lnr8;Lu4l;Lyu3;Lyqa;)V

    :cond_1ef
    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->G:Lr22;

    if-nez v0, :cond_1f4

    move-object v0, v13

    :cond_1f4
    new-instance v1, Lpt3;

    invoke-direct {v1, v2, v7}, Lpt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iput-object v1, v0, Lr22;->d:Ljava/lang/Object;

    invoke-virtual {v0}, Lr22;->P()V

    invoke-virtual {v2}, Lt5d;->e0()Lcom/opera/android/browser/chromium/ChromiumContainerView;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/browser/chromium/ChromiumContainerView;->b:Lzy4;

    iget-object v0, v0, Lzy4;->a:Lb7f;

    iget-object v1, v2, Lt5d;->v:Lb7f;

    iget-object v3, v0, Lb7f;->b:Ljava/lang/Object;

    invoke-virtual {v1, v3}, Lb7f;->d(Ljava/lang/Object;)V

    new-instance v1, Lwa;

    const/4 v3, 0x6

    invoke-direct {v1, v2, v3}, Lwa;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lb7f;->c(Lorg/chromium/base/Callback;)Ljava/lang/Object;

    new-instance v8, Ldu3;

    const/16 v0, 0x17

    invoke-direct {v8, v2, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v1, Lqgf;

    new-instance v3, Ldu3;

    const/16 v0, 0x18

    invoke-direct {v3, v2, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_22c

    move-object v4, v13

    goto :goto_22d

    :cond_22c
    move-object v4, v0

    :goto_22d
    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->A0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lkwf;

    iget-object v0, v12, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->t()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lswf;

    new-instance v7, Ldu3;

    const/16 v0, 0x1a

    invoke-direct {v7, v2, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v0, v2, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v9, v0, Lqim;->g:Loz3;

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v10

    iget-object v0, v12, Ltw3;->a:Lhx3;

    iget-object v11, v0, Lhx3;->g:Lfx3;

    invoke-direct/range {v1 .. v11}, Lqgf;-><init>(Landroid/content/Context;Ldu3;Lk6l;Lkwf;Lswf;Ldu3;Ldu3;Loz3;Lcom/opera/android/settings/SettingsManager;Lcom/opera/android/Lazy;)V

    new-instance v16, Lkdo;

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v17

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v18

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v0, :cond_26d

    move-object/from16 v19, v13

    goto :goto_26f

    :cond_26d
    move-object/from16 v19, v0

    :goto_26f
    new-instance v0, Ldu3;

    const/16 v1, 0x1b

    invoke-direct {v0, v2, v1}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v1, v2, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->g:Loz3;

    iget-object v3, v2, Lcom/opera/android/BrowserActivity;->A0:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v22, v3

    check-cast v22, Lkwf;

    iget-object v3, v12, Ltw3;->a:Lhx3;

    invoke-virtual {v3}, Lhx3;->t()Lcom/opera/android/Lazy;

    move-result-object v3

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v23, v3

    check-cast v23, Lswf;

    new-instance v3, Lqt3;

    invoke-direct {v3, v2, v15}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    move-object/from16 v20, v0

    move-object/from16 v21, v1

    move-object/from16 v25, v3

    move-object/from16 v26, v4

    move-object/from16 v24, v8

    invoke-direct/range {v16 .. v26}, Lkdo;-><init>(Lru9;Lcom/opera/android/settings/SettingsManager;Lk6l;Ldu3;Loz3;Lkwf;Lswf;Ldu3;Lqt3;Lx5f;)V

    iget-object v0, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_2ba

    move-object v13, v0

    :cond_2ba
    new-instance v0, Lmu3;

    invoke-direct {v0, v2}, Lmu3;-><init>(Lcom/opera/android/BrowserActivity;)V

    invoke-virtual {v13, v0}, Lk6l;->c(Lj6l;)V

    sget-object v0, Lava;->a:Lcva;

    new-instance v1, Lqt3;

    const/16 v3, 0xf

    invoke-direct {v1, v2, v3}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v0, v1}, Lcva;->a(Ljava/lang/Runnable;)V

    return v14

    :cond_2cf
    if-eqz v14, :cond_2d5

    invoke-virtual {v2, v7, v6}, Lcom/opera/android/BrowserActivity;->n0(ZZ)V

    return v14

    :cond_2d5
    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v0, :cond_2f1

    if-nez v1, :cond_2dc

    move-object v1, v13

    :cond_2dc
    iget-object v0, v1, Lk6l;->b:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v1, :cond_2e7

    move-object v13, v1

    :cond_2e7
    invoke-virtual {v13}, Lk6l;->q()I

    move-result v1

    if-ne v0, v1, :cond_2fd

    invoke-virtual {v2, v6, v7}, Lcom/opera/android/BrowserActivity;->n0(ZZ)V

    return v14

    :cond_2f1
    if-nez v1, :cond_2f4

    move-object v1, v13

    :cond_2f4
    iget-object v0, v1, Lk6l;->o:Lb2l;

    if-nez v0, :cond_2fd

    const-string v0, "Active tab is null but no session to restore"

    invoke-static {v0, v13}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :cond_2fd
    return v14
.end method

.method public final S()V
    .registers 48

    move-object/from16 v0, p0

    iget-object v2, v0, Lou3;->i:Lcom/opera/android/BrowserActivity;

    iget-object v7, v2, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->L0:Lf1p;

    iget-object v3, v1, Lf1p;->a:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    const/4 v8, 0x0

    if-eqz v4, :cond_15

    const/4 v10, 0x0

    goto :goto_1c

    :cond_15
    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Landroid/content/Intent;

    move-object v10, v3

    :goto_1c
    iget-object v3, v0, Lou3;->g:Lcom/opera/android/browser/SessionRestore$State;

    const/4 v11, 0x1

    if-eqz v3, :cond_23

    move v12, v11

    goto :goto_24

    :cond_23
    move v12, v8

    :goto_24
    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    move-object v13, v3

    check-cast v13, Lcom/opera/android/OperaApplication;

    invoke-virtual {v13}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v3, Li0i;->b:Lnx1;

    invoke-virtual {v3, v13}, Li7c;->d(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lt28;

    iget-object v3, v3, Lt28;->d:Ls28;

    if-eqz v3, :cond_41

    iput-boolean v11, v3, Ls28;->d:Z

    invoke-virtual {v3}, Ls28;->a()V

    :cond_41
    iget-object v15, v2, Lcom/opera/android/BrowserActivity;->d0:Lwth;

    iget-object v3, v2, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v3, :cond_48

    const/4 v3, 0x0

    :cond_48
    invoke-virtual {v2}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v4

    iget-object v4, v4, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v6, v1, Lf1p;->a:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v14

    move v9, v8

    :goto_5f
    if-ge v9, v14, :cond_de8

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v24

    add-int/lit8 v9, v9, 0x1

    move-object/from16 v11, v24

    check-cast v11, Landroid/content/Intent;

    iget-object v8, v1, Lf1p;->b:Ljava/lang/Object;

    check-cast v8, Lp12;

    move-object/from16 v26, v1

    iget-object v1, v8, Lp12;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/BrowserActivity;

    if-nez v11, :cond_8a

    move-object/from16 v44, v4

    move-object/from16 v33, v6

    move-object/from16 v45, v7

    move/from16 v34, v9

    move-object/from16 v40, v10

    move/from16 v42, v12

    move-object/from16 v39, v13

    move/from16 v38, v14

    :catch_87
    :cond_87
    :goto_87
    const/4 v4, 0x0

    goto/16 :goto_dcf

    :cond_8a
    move-object/from16 v27, v4

    invoke-virtual {v11}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    move-object/from16 v33, v6

    const-string v6, "com.opera.android.action.PROTECTED_INTENT"

    invoke-static {v4, v6}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v4

    const-string v6, ""

    if-nez v4, :cond_a5

    move-object/from16 v28, v6

    move/from16 v34, v9

    move/from16 v29, v14

    const/4 v4, 0x0

    goto/16 :goto_13f

    :cond_a5
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    if-nez v4, :cond_b8

    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    move-object/from16 v28, v6

    move/from16 v34, v9

    move/from16 v29, v14

    goto/16 :goto_13f

    :cond_b8
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    move-object/from16 v28, v6

    if-eqz v4, :cond_c7

    const-string v6, "cmd"

    invoke-virtual {v4, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_c8

    :cond_c7
    const/4 v4, 0x0

    :goto_c8
    sget-object v6, Lf8a;->j:Lf8a;

    move/from16 v34, v9

    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v9

    move/from16 v29, v14

    if-eqz v9, :cond_db

    const-string v14, "id"

    invoke-virtual {v9, v14}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v9

    goto :goto_dc

    :cond_db
    const/4 v9, 0x0

    :goto_dc
    if-nez v9, :cond_e0

    move-object/from16 v9, v28

    :cond_e0
    invoke-virtual {v6, v9}, Lf8a;->a(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    const-string v9, "ea82fc7bfb8a05eb224364e911d06f9851e335c0d3c5b2ed69d7558121049c3bcaa2a1e5ce699b425dfe9b80660d9813b0348fc3c1f2592bb90073fd379e14dd"

    invoke-static {v6, v9}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_13a

    if-eqz v4, :cond_13a

    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    sparse-switch v6, :sswitch_data_10bc

    goto :goto_13a

    :sswitch_f6
    const-string v6, "TRIM_MEMORY_COMPLETELY"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13a

    new-instance v4, Lvcb;

    new-instance v6, Lk6h;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-direct {v4, v6}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_13f

    :sswitch_109
    const-string v6, "OSP_UPLOAD"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13a

    new-instance v4, Lrcb;

    const/4 v6, 0x2

    invoke-direct {v4, v1, v6}, Lrcb;-><init>(Ljava/lang/Object;B)V

    goto :goto_13f

    :sswitch_118
    const-string v6, "DUMP_PROFILES"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13a

    new-instance v4, Lrcb;

    const/4 v6, 0x1

    invoke-direct {v4, v11, v6}, Lrcb;-><init>(Ljava/lang/Object;B)V

    goto :goto_13f

    :sswitch_127
    const-string v6, "CRASH_ON_DEMAND"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_13a

    new-instance v4, Lvcb;

    new-instance v6, Lh6h;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    invoke-direct {v4, v6}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_13f

    :cond_13a
    :goto_13a
    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    :goto_13f
    if-eqz v4, :cond_14f

    :goto_141
    move-object/from16 v45, v7

    move-object/from16 v40, v10

    move/from16 v42, v12

    move-object/from16 v39, v13

    :goto_149
    move-object/from16 v44, v27

    move/from16 v38, v29

    goto/16 :goto_dcf

    :cond_14f
    invoke-virtual {v11}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    if-nez v4, :cond_15c

    const/4 v6, 0x1

    invoke-virtual {v8, v11, v15, v6}, Lp12;->r(Landroid/content/Intent;Lwth;Z)Lcdb;

    move-result-object v1

    move-object v4, v1

    goto :goto_141

    :cond_15c
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v6

    const-string v9, "com.opera.android.action.NEW_PRIVATE_TAB"

    sparse-switch v6, :sswitch_data_10ce

    goto/16 :goto_39d

    :sswitch_167
    const-string v6, "ACTION_MAKE_DEFAULT_BROWSER_SHEET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x30

    goto/16 :goto_3a0

    :sswitch_173
    const-string v6, "android.intent.action.WEB_SEARCH"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x2f

    goto/16 :goto_3a0

    :sswitch_17f
    const-string v6, "android.nfc.action.NDEF_DISCOVERED"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x2e

    goto/16 :goto_3a0

    :sswitch_18b
    const-string v6, "android.intent.action.PROCESS_TEXT"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x2d

    goto/16 :goto_3a0

    :sswitch_197
    const-string v6, "ACTION_PREMIUM_ONBOARDING"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x2c

    goto/16 :goto_3a0

    :sswitch_1a3
    const-string v6, "com.opera.android.action.SHOW_REFERRER"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x2b

    goto/16 :goto_3a0

    :sswitch_1af
    const-string v6, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_PIP"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x2a

    goto/16 :goto_3a0

    :sswitch_1bb
    const-string v6, "com.opera.android.action.SHOW_WALLET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x29

    goto/16 :goto_3a0

    :sswitch_1c7
    const-string v6, "com.opera.android.SERVICE_TAB_LAUNCH"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x28

    goto/16 :goto_3a0

    :sswitch_1d3
    const-string v6, "com.opera.android.FREE_DATA"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x27

    goto/16 :goto_3a0

    :sswitch_1df
    const-string v6, "com.opera.android.action.VPN_PRO_WIDGET_OPEN_OFA"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x26

    goto/16 :goto_3a0

    :sswitch_1eb
    const-string v6, "com.opera.android.action.AI_ASSISTANT_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x25

    goto/16 :goto_3a0

    :sswitch_1f7
    const-string v6, "com.opera.android.action.SCAN_QR_CODE_FROM_WIDGET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x24

    goto/16 :goto_3a0

    :sswitch_203
    const-string v6, "com.opera.android.action.SHOW_DOWNLOADS"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x23

    goto/16 :goto_3a0

    :sswitch_20f
    const-string v6, "com.opera.android.INTERNAL_WEB_SEARCH"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x22

    goto/16 :goto_3a0

    :sswitch_21b
    const-string v6, "com.opera.android.settings.SITE_SETTING"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x21

    goto/16 :goto_3a0

    :sswitch_227
    const-string v6, "com.opera.android.settings.AUTOFILL_ADDRESS_SETTING"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x20

    goto/16 :goto_3a0

    :sswitch_233
    const-string v6, "ACTION_SHOW_OMNIBAR"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x1f

    goto/16 :goto_3a0

    :sswitch_23f
    const-string v6, "com.opera.android.action.SCAN_QR_CODE"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x1e

    goto/16 :goto_3a0

    :sswitch_24b
    const-string v6, "ACTION_DEEPLINK_ACTION"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x1d

    goto/16 :goto_3a0

    :sswitch_257
    const-string v6, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_NOTIFICATION"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x1c

    goto/16 :goto_3a0

    :sswitch_263
    const-string v6, "android.speech.action.VOICE_SEARCH_RESULTS"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x1b

    goto/16 :goto_3a0

    :sswitch_26f
    const-string v6, "android.service.quicksettings.action.QS_TILE_PREFERENCES"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x1a

    goto/16 :goto_3a0

    :sswitch_27b
    const-string v6, "ACTION_PREMIUM_GIVEAWAY_ONBOARDING"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x19

    goto/16 :goto_3a0

    :sswitch_287
    const-string v6, "com.opera.android.action.SEARCH"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x18

    goto/16 :goto_3a0

    :sswitch_293
    const-string v6, "com.opera.android.settings.TOGGLE_THEME"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x17

    goto/16 :goto_3a0

    :sswitch_29f
    const-string v6, "com.opera.android.action.SEARCH_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x16

    goto/16 :goto_3a0

    :sswitch_2ab
    const-string v6, "ACTION_DESTINATION_VIEW"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x15

    goto/16 :goto_3a0

    :sswitch_2b7
    const-string v6, "com.opera.android.action.SHOW_MANAGE_SPACE"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x14

    goto/16 :goto_3a0

    :sswitch_2c3
    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x13

    goto/16 :goto_3a0

    :sswitch_2cd
    const-string v6, "com.opera.android.action.VPN_PRO_NOTIFICATION_OPEN_OFA"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x12

    goto/16 :goto_3a0

    :sswitch_2d9
    const-string v6, "ACTION_SHOW_OMNIBAR_WITH_ASK_AI"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x11

    goto/16 :goto_3a0

    :sswitch_2e5
    const-string v6, "com.opera.android.action.ACTIVATE_TAB"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x10

    goto/16 :goto_3a0

    :sswitch_2f1
    const-string v6, "com.opera.android.action.SCAN_QR_CODE_FROM_SHORTCUT_WIDGET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0xf

    goto/16 :goto_3a0

    :sswitch_2fd
    const-string v6, "com.opera.android.settings.AUTOFILL_CARD_SETTING"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0xe

    goto/16 :goto_3a0

    :sswitch_309
    const-string v6, "com.opera.android.action.JUMP_MINIGAME_WIDGET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0xd

    goto/16 :goto_3a0

    :sswitch_315
    const-string v6, "android.intent.action.VIEW"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0xc

    goto/16 :goto_3a0

    :sswitch_321
    const-string v6, "android.intent.action.SEND"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0xb

    goto/16 :goto_3a0

    :sswitch_32d
    const-string v6, "android.intent.action.MAIN"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0xa

    goto/16 :goto_3a0

    :sswitch_339
    const-string v6, "com.opera.android.action.SEARCH_FROM_WIDGET"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x9

    goto :goto_3a0

    :sswitch_344
    const-string v6, "ACTION_MAKE_DEFAULT_BROWSER_SYSTEM"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/16 v6, 0x8

    goto :goto_3a0

    :sswitch_34f
    const-string v6, "com.opera.android.action.NEW_TAB"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x7

    goto :goto_3a0

    :sswitch_359
    const-string v6, "com.opera.android.flow.ACTION_NOTIFICATION"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x6

    goto :goto_3a0

    :sswitch_363
    const-string v6, "com.opera.android.action.PASSWORD_MANAGER"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x5

    goto :goto_3a0

    :sswitch_36d
    const-string v6, "com.opera.android.action.AI_WIDGET_KEYBOARD"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x4

    goto :goto_3a0

    :sswitch_377
    const-string v6, "ACTION_ADD_SPEED_DIAL"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x3

    goto :goto_3a0

    :sswitch_381
    const-string v6, "com.opera.android.settings.PASSWORD_SETTING"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x2

    goto :goto_3a0

    :sswitch_38b
    const-string v6, "ACTION_SHOW_ARIA"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_39d

    const/4 v6, 0x1

    goto :goto_3a0

    :sswitch_395
    const-string v6, "com.opera.android.action.AI_WIDGET_VOICE"

    invoke-virtual {v4, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_39f

    :cond_39d
    :goto_39d
    const/4 v6, -0x1

    goto :goto_3a0

    :cond_39f
    const/4 v6, 0x0

    :goto_3a0
    const-string v14, "TARGET_ID"

    move/from16 v38, v6

    const-string v6, "SOURCE_ID"

    move-object/from16 v39, v13

    const-string v13, "CAMPAIGN_ID"

    move-object/from16 v40, v10

    sget-object v10, Llqm;->s:Llqm;

    const/16 v41, 0xe

    const/16 v19, 0x1

    move/from16 v42, v12

    move/from16 v43, v19

    const/16 v19, 0x2

    move/from16 v44, v19

    const/16 v19, 0x3

    const-string v12, "com.opera.android.extra.ORIGINAL_COMPONENT_CLASS_NAME"

    move-object/from16 v45, v7

    sget-object v7, Llqm;->i:Llqm;

    packed-switch v38, :pswitch_data_1194

    iget-object v6, v8, Lp12;->h:Ljava/lang/Object;

    check-cast v6, Ljava/util/HashMap;

    invoke-virtual {v6, v4}, Ljava/util/HashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lzt3;

    if-eqz v6, :cond_3d9

    new-instance v1, Lvcb;

    invoke-direct {v1, v6, v11}, Lvcb;-><init>(Lzt3;Landroid/content/Intent;)V

    :goto_3d6
    move-object v4, v1

    goto/16 :goto_149

    :cond_3d9
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    if-eqz v6, :cond_494

    iget-object v7, v8, Lp12;->d:Ljava/lang/Object;

    check-cast v7, Lumi;

    :try_start_3e3
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v9

    const v10, -0x7fecefb5

    if-eq v9, v10, :cond_412

    const v10, -0x4b5605fd

    if-eq v9, v10, :cond_404

    const v10, 0x6bb1ccf6

    if-ne v9, v10, :cond_420

    const-string v9, "com.opera.android.action.SHOW_LIVE_SCORE_MATCH"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_420

    new-instance v1, Lrgf;

    invoke-direct {v1, v6}, Lrgf;-><init>(Landroid/os/Bundle;)V

    goto :goto_463

    :cond_404
    const-string v9, "com.opera.android.action.SHOW_ESIM"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_420

    new-instance v1, Lkgf;

    invoke-direct {v1, v6}, Lkgf;-><init>(Landroid/os/Bundle;)V

    goto :goto_463

    :cond_412
    const-string v9, "com.opera.android.action.OPEN_URL"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_420

    new-instance v4, Lwgf;

    invoke-direct {v4, v1, v6}, Lwgf;-><init>(Landroid/content/Context;Landroid/os/Bundle;)V
    :try_end_41f
    .catch Ljava/lang/IllegalArgumentException; {:try_start_3e3 .. :try_end_41f} :catch_462

    goto :goto_45a

    :cond_420
    invoke-virtual {v4}, Ljava/lang/String;->hashCode()I

    move-result v9

    sparse-switch v9, :sswitch_data_11fa

    goto :goto_446

    :sswitch_428
    const-string v9, "com.opera.android.action.SHOW_NEWS_ARTICLE"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_446

    const/16 v37, 0x2

    goto :goto_44b

    :sswitch_433
    const-string v9, "com.opera.android.action.SHOW_NEWSFEED_ARTICLE"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_446

    const/16 v37, 0x1

    goto :goto_44b

    :sswitch_43e
    const-string v9, "com.opera.android.action.SHOW_NEWS"

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-nez v4, :cond_449

    :cond_446
    :goto_446
    const/16 v37, -0x1

    goto :goto_44b

    :cond_449
    const/16 v37, 0x0

    :goto_44b
    packed-switch v37, :pswitch_data_1208

    goto :goto_462

    :pswitch_44f
    :try_start_44f
    new-instance v4, Lvhj;

    invoke-direct {v4, v1, v7, v6}, Lvhj;-><init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V

    goto :goto_45a

    :pswitch_455
    new-instance v4, Leij;

    invoke-direct {v4, v1, v7, v6}, Leij;-><init>(Landroid/content/Context;Lumi;Landroid/os/Bundle;)V

    :goto_45a
    move-object v1, v4

    goto :goto_463

    :pswitch_45c
    new-instance v1, Lxhj;

    invoke-direct {v1, v6}, Lxhj;-><init>(Landroid/os/Bundle;)V
    :try_end_461
    .catch Ljava/lang/IllegalArgumentException; {:try_start_44f .. :try_end_461} :catch_462

    goto :goto_463

    :catch_462
    :goto_462
    const/4 v1, 0x0

    :goto_463
    if-eqz v1, :cond_494

    new-instance v4, Ltcb;

    invoke-direct {v4, v8, v1}, Ltcb;-><init>(Lp12;Ls0f;)V

    goto/16 :goto_149

    :pswitch_46c
    new-instance v4, Lxcb;

    invoke-virtual {v11}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x0

    invoke-direct {v4, v1, v6, v7}, Lxcb;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;B)V

    goto/16 :goto_149

    :pswitch_478
    const/4 v1, 0x1

    invoke-static {v15, v11, v1}, Lp12;->s(Lwth;Landroid/content/Intent;I)Lfdb;

    move-result-object v1

    goto/16 :goto_3d6

    :pswitch_47f
    const/4 v1, 0x1

    invoke-virtual {v11, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "com.opera.android.SearchInOpera"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const-string v6, "android.intent.extra.PROCESS_TEXT"

    if-eqz v4, :cond_4ae

    invoke-virtual {v11, v6}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v4

    if-nez v4, :cond_49a

    :cond_494
    move-object/from16 v44, v27

    move/from16 v38, v29

    goto/16 :goto_87

    :cond_49a
    invoke-interface {v4}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v16

    new-instance v14, Lfdb;

    const/16 v18, 0x1

    move/from16 v17, v1

    move/from16 v38, v29

    invoke-direct/range {v14 .. v19}, Lfdb;-><init>(Lwth;Ljava/lang/String;IZI)V

    :goto_4a9
    move-object v4, v14

    :goto_4aa
    move-object/from16 v44, v27

    goto/16 :goto_dcf

    :cond_4ae
    move/from16 v17, v1

    move/from16 v38, v29

    invoke-virtual {v11, v6}, Landroid/content/Intent;->getCharSequenceExtra(Ljava/lang/String;)Ljava/lang/CharSequence;

    move-result-object v1

    if-nez v1, :cond_4bc

    move-object/from16 v44, v27

    goto/16 :goto_87

    :cond_4bc
    invoke-interface {v1}, Ljava/lang/CharSequence;->toString()Ljava/lang/String;

    move-result-object v16

    new-instance v14, Lfdb;

    const/16 v18, 0x1

    move/from16 v19, v44

    invoke-direct/range {v14 .. v19}, Lfdb;-><init>(Lwth;Ljava/lang/String;IZI)V

    goto :goto_4a9

    :pswitch_4ca
    move/from16 v38, v29

    new-instance v4, Lltg;

    invoke-virtual {v11, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v11, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v14}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v4, v7, v6, v8}, Lltg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-eqz v1, :cond_4eb

    new-instance v6, Ltcb;

    const/4 v7, 0x3

    invoke-direct {v6, v1, v4, v7}, Ltcb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object v1, v6

    goto :goto_4f0

    :cond_4eb
    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :goto_4f0
    move-object v4, v1

    goto :goto_4aa

    :pswitch_4f2
    move/from16 v38, v29

    const-string v1, "opera://referrer"

    const/4 v4, 0x0

    invoke-static {v1, v7, v4}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v1

    const/4 v6, 0x1

    invoke-virtual {v1, v6}, Lvx3;->c(Z)V

    new-instance v4, Lvcb;

    new-instance v6, Lay3;

    invoke-direct {v6, v1}, Lay3;-><init>(Lvx3;)V

    invoke-direct {v4, v6}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_4aa

    :pswitch_50a
    move/from16 v38, v29

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->l1:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfjn;

    invoke-virtual {v1}, Lfjn;->a()Z

    move-result v1

    if-eqz v1, :cond_52c

    new-instance v1, Lmcb;

    const/16 v4, 0x14

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto :goto_4f0

    :cond_52c
    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto :goto_4f0

    :pswitch_532
    move/from16 v38, v29

    new-instance v1, Llsc;

    invoke-virtual {v11}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    invoke-virtual {v4}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v4

    const/4 v7, 0x0

    invoke-direct {v1, v4, v7}, Lksc;-><init>(Ljava/lang/String;I)V

    const-string v4, "com.opera.android.referrerPolicy"

    const/4 v6, 0x1

    invoke-virtual {v11, v4, v6}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const/16 v6, 0x8

    if-ltz v4, :cond_54f

    if-le v4, v6, :cond_550

    :cond_54f
    const/4 v4, 0x1

    :cond_550
    new-instance v7, Lcm;

    const-string v8, "com.opera.android.referrer"

    invoke-virtual {v11, v8}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    invoke-direct {v7, v8, v4, v6}, Lcm;-><init>(Ljava/lang/String;IB)V

    iput-object v7, v1, Lksc;->e:Lcm;

    const-string v4, "com.opera.android.extraHeaders"

    invoke-virtual {v11, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    iput-object v4, v1, Lksc;->g:Ljava/lang/String;

    const-string v4, "com.opera.android.disposition"

    const/4 v7, 0x3

    invoke-virtual {v11, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const/4 v6, 0x2

    if-eq v4, v6, :cond_58f

    if-eq v4, v7, :cond_58f

    const/4 v6, 0x4

    if-eq v4, v6, :cond_58a

    const/4 v7, 0x5

    if-eq v4, v7, :cond_58f

    const/4 v7, 0x6

    if-eq v4, v7, :cond_58f

    const/16 v7, 0x8

    if-eq v4, v7, :cond_585

    new-instance v4, Ltcb;

    invoke-direct {v4, v3, v1, v6}, Ltcb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto/16 :goto_4aa

    :cond_585
    const/16 v17, 0x1

    :goto_587
    const/16 v18, 0x1

    goto :goto_592

    :cond_58a
    const/16 v17, 0x0

    const/16 v18, 0x0

    goto :goto_592

    :cond_58f
    const/16 v17, 0x0

    goto :goto_587

    :goto_592
    new-instance v16, Lj3j;

    const-string v4, "com.opera.android.launchRequestId"

    const/4 v7, 0x0

    invoke-virtual {v11, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v22

    move-object/from16 v19, v1

    move-object/from16 v21, v3

    move-object/from16 v20, v27

    invoke-direct/range {v16 .. v22}, Lj3j;-><init>(ZZLlsc;Lxbf;Lk6l;I)V

    move-object/from16 v44, v20

    move-object/from16 v4, v16

    goto/16 :goto_dcf

    :pswitch_5aa
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_5bc

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    :goto_5b9
    move-object v4, v1

    goto/16 :goto_dcf

    :cond_5bc
    new-instance v4, Ltcb;

    const/4 v6, 0x1

    invoke-direct {v4, v1, v11, v6}, Ltcb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto/16 :goto_dcf

    :pswitch_5c4
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lbdb;

    new-instance v4, Luhj;

    sget-object v6, Lnv0;->b:Lnv0;

    invoke-direct {v4}, Luhj;-><init>()V

    invoke-direct {v1, v4}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_5b9

    :pswitch_5d5
    move-object/from16 v44, v27

    move/from16 v38, v29

    sget v4, Lcom/opera/android/downloads/DownloadNotifierReceiver;->a:I

    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->m()Lsf7;

    move-result-object v1

    iget-object v1, v1, Lsf7;->a:Lrf7;

    iget-object v6, v1, Lrf7;->j:Lnc0;

    if-nez v6, :cond_610

    iget-object v6, v1, Lrf7;->h:Lb59;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Landroid/content/SharedPreferences;

    const-string v7, "last_downloaded_file_type"

    const/4 v8, -0x1

    invoke-interface {v6, v7, v8}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v6

    if-eq v6, v8, :cond_610

    invoke-static {v6}, Lnc0;->a(I)Lnc0;

    move-result-object v6

    iput-object v6, v1, Lrf7;->j:Lnc0;

    :cond_610
    iget-object v1, v1, Lrf7;->j:Lnc0;

    iget-boolean v6, v4, Lx5f;->h:Z

    if-eqz v6, :cond_61b

    sget-object v6, Lqc0;->c:Lqc0;

    invoke-virtual {v4, v6, v1}, Lx5f;->P(Lqc0;Lnc0;)V

    :cond_61b
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    if-eqz v1, :cond_634

    const-string v4, "download"

    invoke-virtual {v1, v4}, Landroid/os/BaseBundle;->containsKey(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_634

    const-wide/16 v6, -0x1

    invoke-virtual {v1, v4, v6, v7}, Landroid/os/BaseBundle;->getLong(Ljava/lang/String;J)J

    move-result-wide v6

    invoke-static {v6, v7}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v1

    goto :goto_635

    :cond_634
    const/4 v1, 0x0

    :goto_635
    new-instance v4, Lbdb;

    new-instance v6, Lyhj;

    invoke-direct {v6, v1}, Lyhj;-><init>(Ljava/lang/Long;)V

    invoke-direct {v4, v6}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_dcf

    :pswitch_641
    move-object/from16 v44, v27

    move/from16 v38, v29

    const/4 v1, 0x2

    invoke-static {v15, v11, v1}, Lp12;->s(Lwth;Landroid/content/Intent;I)Lfdb;

    move-result-object v1

    goto/16 :goto_5b9

    :pswitch_64c
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-virtual {v11}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v1

    invoke-virtual {v1}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v1

    new-instance v4, Lscb;

    const/4 v6, 0x1

    invoke-direct {v4, v8, v1, v6}, Lscb;-><init>(Lp12;Ljava/lang/Object;B)V

    goto/16 :goto_dcf

    :pswitch_660
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lmcb;

    const/4 v7, 0x6

    invoke-direct {v1, v8, v7}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_66c
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_67d

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_67d
    new-instance v4, Lwcb;

    const/4 v6, 0x0

    invoke-direct {v4, v1, v7, v6}, Lwcb;-><init>(Lcom/opera/android/BrowserActivity;Llqm;Leri;)V

    goto/16 :goto_dcf

    :pswitch_685
    move-object/from16 v44, v27

    move/from16 v38, v29

    const-string v4, "ACTION_DEEPLINK_ID"

    const/4 v7, 0x0

    invoke-virtual {v11, v4, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v4

    const/16 v23, 0x3

    invoke-static/range {v23 .. v23}, Lvep;->B(I)[I

    move-result-object v6

    array-length v7, v6

    const/4 v9, 0x0

    :goto_698
    if-ge v9, v7, :cond_6a5

    aget v10, v6, v9

    invoke-static {v10}, Lv0g;->b(I)B

    move-result v11

    if-eq v11, v4, :cond_6a6

    add-int/lit8 v9, v9, 0x1

    goto :goto_698

    :cond_6a5
    const/4 v10, 0x0

    :cond_6a6
    if-nez v10, :cond_6af

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_6af
    invoke-static {v10}, Lvep;->A(I)I

    move-result v4

    if-eqz v4, :cond_6d3

    const/4 v6, 0x1

    if-eq v4, v6, :cond_6ca

    const/4 v6, 0x2

    if-eq v4, v6, :cond_6c2

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_6c2
    new-instance v1, Lmcb;

    const/4 v7, 0x0

    invoke-direct {v1, v8, v7}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :cond_6ca
    new-instance v1, Lmcb;

    const/16 v4, 0x10

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :cond_6d3
    const/4 v7, 0x0

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-eqz v1, :cond_6e1

    new-instance v4, Lucb;

    invoke-direct {v4, v1, v7}, Lucb;-><init>(Lcom/opera/android/BrowserActivity;B)V

    goto/16 :goto_dcf

    :cond_6e1
    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :pswitch_6e8
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_6f9

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_6f9
    new-instance v6, Lycb;

    const-string v7, "com.opera.android.action.SHOW_MEDIA_PLAYER_FROM_NOTIFICATION"

    invoke-virtual {v4, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v7, 0x1

    invoke-direct {v6, v1, v4, v7}, Lycb;-><init>(Lcom/opera/android/BrowserActivity;ZB)V

    :goto_705
    move-object v4, v6

    goto/16 :goto_dcf

    :pswitch_708
    move-object/from16 v44, v27

    move/from16 v38, v29

    const/4 v1, 0x2

    const-string v4, "android.speech.extras.VOICE_SEARCH_RESULT_STRINGS"

    invoke-virtual {v11, v4}, Landroid/content/Intent;->getStringArrayListExtra(Ljava/lang/String;)Ljava/util/ArrayList;

    move-result-object v4

    if-eqz v4, :cond_87

    const/4 v7, 0x0

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-eqz v6, :cond_87

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v16, v4

    check-cast v16, Ljava/lang/String;

    new-instance v14, Lfdb;

    const/16 v18, 0x1

    move/from16 v17, v1

    move/from16 v19, v43

    invoke-direct/range {v14 .. v19}, Lfdb;-><init>(Lwth;Ljava/lang/String;IZI)V

    move-object v4, v14

    goto/16 :goto_dcf

    :pswitch_732
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v4, Lbdb;

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v7

    iget-object v7, v7, Lslk;->i:Lkze;

    invoke-virtual {v7}, Lekc;->g()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lwvg;

    iget v7, v7, Lwvg;->e:I

    const/4 v8, 0x5

    if-ne v7, v8, :cond_754

    const/4 v1, 0x2

    :goto_752
    const/4 v6, 0x0

    goto :goto_78d

    :cond_754
    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v7

    iget-object v7, v7, Lydn;->c:Lgfn;

    invoke-interface {v7}, Lgfn;->isEnabled()Z

    move-result v7

    if-nez v7, :cond_76e

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v7

    invoke-virtual {v7}, Lydn;->p()Lwdn;

    move-result-object v7

    iget-boolean v7, v7, Lwdn;->e:Z

    if-eqz v7, :cond_76e

    const/4 v1, 0x0

    goto :goto_752

    :cond_76e
    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v6

    iget-object v6, v6, Lydn;->c:Lgfn;

    invoke-interface {v6}, Lgfn;->isEnabled()Z

    move-result v6

    if-eqz v6, :cond_78a

    sget v6, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v7, 0x21

    if-lt v6, v7, :cond_78a

    const-string v6, "android.permission.POST_NOTIFICATIONS"

    invoke-static {v1, v6}, Lna2;->o(Landroid/content/Context;Ljava/lang/String;)I

    move-result v1

    if-eqz v1, :cond_78a

    const/4 v1, 0x1

    goto :goto_78b

    :cond_78a
    const/4 v1, 0x0

    :goto_78b
    move v6, v1

    const/4 v1, 0x1

    :goto_78d
    new-instance v7, Lxm8;

    invoke-direct {v7, v1, v6}, Lxm8;-><init>(IZ)V

    invoke-direct {v4, v7}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_dcf

    :pswitch_797
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-eqz v1, :cond_7ca

    new-instance v4, Lfij;

    const-string v7, "GIVEAWAY_CAMPAIGN"

    invoke-virtual {v11, v7}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v7

    if-nez v7, :cond_7ad

    move-object/from16 v7, v28

    :cond_7ad
    const-string v8, "GIVEAWAY_DURATION"

    const/4 v9, 0x0

    invoke-virtual {v11, v8, v9}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v8

    new-instance v9, Lltg;

    invoke-virtual {v11, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v10

    invoke-virtual {v11, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-virtual {v11, v14}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v11

    invoke-direct {v9, v10, v6, v11}, Lltg;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    invoke-direct {v4, v1, v7, v8, v9}, Lfij;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;ILltg;)V

    goto/16 :goto_dcf

    :cond_7ca
    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :pswitch_7d1
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lvcb;

    new-instance v4, Lxrl;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-direct {v1, v4}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_5b9

    :pswitch_7e1
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_7f2

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_7f2
    new-instance v4, Lwcb;

    sget-object v6, Llqm;->r:Llqm;

    const/4 v7, 0x0

    invoke-direct {v4, v1, v6, v7}, Lwcb;-><init>(Lcom/opera/android/BrowserActivity;Llqm;Leri;)V

    goto/16 :goto_dcf

    :pswitch_7fc
    move-object/from16 v44, v27

    move/from16 v38, v29

    iget-object v4, v8, Lp12;->e:Ljava/lang/Object;

    check-cast v4, Lwub;

    const-string v6, "DESTINATION_VIEW_ID"

    const/4 v7, 0x0

    :try_start_807
    invoke-virtual {v11, v6, v7}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    invoke-virtual {v11, v6}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V
    :try_end_80e
    .catch Ljava/lang/Exception; {:try_start_807 .. :try_end_80e} :catch_821

    invoke-static {}, Lj7c;->_values()[I

    move-result-object v6

    array-length v7, v6

    const/4 v10, 0x0

    :goto_814
    if-ge v10, v7, :cond_821

    aget v12, v6, v10

    invoke-static {v12}, Lj7c;->f(I)B

    move-result v13

    if-eq v13, v9, :cond_822

    add-int/lit8 v10, v10, 0x1

    goto :goto_814

    :catch_821
    :cond_821
    const/4 v12, 0x0

    :cond_822
    const-string v6, "VIEWS_TO_HIGHLIGHT"

    invoke-virtual {v11, v6}, Landroid/content/Intent;->getIntArrayExtra(Ljava/lang/String;)[I

    move-result-object v7

    invoke-virtual {v11, v6}, Landroid/content/Intent;->removeExtra(Ljava/lang/String;)V

    if-nez v7, :cond_831

    const/4 v7, 0x0

    new-array v6, v7, [I

    move-object v7, v6

    :cond_831
    if-nez v12, :cond_83a

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_83a
    invoke-static {v12}, Lvep;->A(I)I

    move-result v6

    const-class v9, Ljt2;

    const/16 v10, 0x1003

    packed-switch v6, :pswitch_data_1212

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :pswitch_84c
    const-string v4, "skip_dialog"

    invoke-virtual {v11, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Ljava/lang/Boolean;->parseBoolean(Ljava/lang/String;)Z

    move-result v4

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_863

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_863
    new-instance v6, Ladb;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object v7

    invoke-direct {v6, v1, v7, v4}, Ladb;-><init>(Lcom/opera/android/BrowserActivity;Lnej;Z)V

    goto/16 :goto_9a8

    :pswitch_86e
    new-instance v1, Lmcb;

    const/16 v4, 0xa

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_877
    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_884

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_884
    new-instance v4, Lggf;

    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v6

    sget-object v7, La98;->c:La98;

    if-eqz v6, :cond_8a8

    const-string v8, "ESIM_ATTRIBUTION_RESOLVED"

    const/4 v9, 0x0

    invoke-virtual {v6, v8, v9}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_8a8

    new-instance v7, La98;

    const-string v8, "ESIM_SOURCE"

    invoke-virtual {v6, v8}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v8

    const-string v9, "ESIM_CAMPAIGN"

    invoke-virtual {v6, v9}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v7, v8, v6}, La98;-><init>(Ljava/lang/String;Ljava/lang/String;)V

    :cond_8a8
    const-string v6, "esim_destination"

    const-class v8, Ls88;

    invoke-static {v11, v6, v8}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ls88;

    const/4 v8, 0x0

    invoke-direct {v4, v1, v8, v7, v6}, Lggf;-><init>(Lcom/opera/android/BrowserActivity;Lt88;La98;Ls88;)V

    goto/16 :goto_963

    :pswitch_8b8
    new-instance v1, Lncb;

    const/4 v9, 0x0

    invoke-direct {v1, v8, v7, v9}, Lncb;-><init>(Lp12;[IB)V

    goto/16 :goto_5b9

    :pswitch_8c0
    new-instance v1, Lncb;

    const/4 v4, 0x3

    invoke-direct {v1, v8, v7, v4}, Lncb;-><init>(Lp12;[IB)V

    goto/16 :goto_5b9

    :pswitch_8c8
    new-instance v1, Lmcb;

    const/16 v4, 0xd

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_8d1
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    if-eqz v4, :cond_8de

    const-string v6, "deep_link"

    invoke-virtual {v4, v6}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    goto :goto_8df

    :cond_8de
    const/4 v4, 0x0

    :goto_8df
    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_8ec

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_8ec
    new-instance v6, Lqcb;

    invoke-direct {v6, v8, v1, v4}, Lqcb;-><init>(Lp12;Lcom/opera/android/BrowserActivity;Ljava/lang/String;)V

    goto/16 :goto_9a8

    :pswitch_8f3
    new-instance v1, Lmcb;

    const/4 v6, 0x2

    invoke-direct {v1, v8, v6}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_8fb
    new-instance v1, Lmcb;

    const/16 v4, 0x12

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_904
    new-instance v1, Lmcb;

    const/4 v6, 0x1

    invoke-direct {v1, v8, v6}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_90c
    new-instance v1, Lmcb;

    const/16 v4, 0x9

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_915
    const/4 v6, 0x1

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_923

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_923
    new-instance v4, Lucb;

    invoke-direct {v4, v1, v6}, Lucb;-><init>(Lcom/opera/android/BrowserActivity;B)V

    goto :goto_963

    :pswitch_929
    new-instance v1, Lmcb;

    move/from16 v4, v41

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_932
    new-instance v1, Lmcb;

    const/16 v4, 0x13

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_93b
    new-instance v1, Lmcb;

    const/4 v7, 0x3

    invoke-direct {v1, v8, v7}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_943
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v4

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-eqz v1, :cond_953

    new-instance v6, Ladb;

    invoke-direct {v6, v1, v4}, Ladb;-><init>(Lcom/opera/android/BrowserActivity;Landroid/os/Bundle;)V

    goto :goto_9a8

    :cond_953
    new-instance v6, Lzcb;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    goto :goto_9a8

    :pswitch_959
    invoke-virtual {v11}, Landroid/content/Intent;->getExtras()Landroid/os/Bundle;

    move-result-object v1

    new-instance v4, Lscb;

    const/4 v7, 0x0

    invoke-direct {v4, v8, v1, v7}, Lscb;-><init>(Lp12;Ljava/lang/Object;B)V

    :goto_963
    move-object v1, v4

    goto/16 :goto_5b9

    :pswitch_966
    new-instance v1, Lmcb;

    const/4 v7, 0x5

    invoke-direct {v1, v8, v7}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_96e
    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v4

    if-eqz v4, :cond_9a3

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v6

    invoke-virtual {v6}, Lbf9;->t()Z

    move-result v6

    if-eqz v6, :cond_9a3

    new-instance v6, Lbdb;

    new-instance v7, Lfge;

    sget-object v8, Lvml;->d:Lumi;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    invoke-direct {v7, v4, v8, v1}, Lfge;-><init>(Lcom/opera/android/BrowserActivity;Ltcl;Lx5f;)V

    invoke-static {v7, v10}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v1

    invoke-direct {v6, v1}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_9a8

    :cond_9a3
    new-instance v6, Lzcb;

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    :goto_9a8
    move-object v1, v6

    goto/16 :goto_5b9

    :pswitch_9ab
    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v4, Lbdb;

    new-instance v6, Lnlh;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v7

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-direct {v6, v7, v8, v1}, Lnlh;-><init>(Lglh;Lx5f;Lcom/opera/android/settings/SettingsManager;)V

    invoke-static {v6, v10}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object v1

    invoke-direct {v4, v1}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_963

    :pswitch_9d0
    new-instance v1, Locb;

    const/4 v7, 0x0

    invoke-direct {v1, v8, v11, v7}, Locb;-><init>(Lp12;Landroid/content/Intent;B)V

    goto/16 :goto_5b9

    :pswitch_9d8
    new-instance v1, Lncb;

    const/4 v6, 0x2

    invoke-direct {v1, v8, v7, v6}, Lncb;-><init>(Lp12;[IB)V

    goto/16 :goto_5b9

    :pswitch_9e0
    new-instance v1, Lmcb;

    const/16 v4, 0x18

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_9e9
    new-instance v1, Locb;

    const/4 v6, 0x1

    invoke-direct {v1, v8, v11, v6}, Locb;-><init>(Lp12;Landroid/content/Intent;B)V

    goto/16 :goto_5b9

    :pswitch_9f1
    new-instance v1, Lmcb;

    const/16 v6, 0x8

    invoke-direct {v1, v8, v6}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_9fa
    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-eqz v1, :cond_a07

    new-instance v4, Lbij;

    invoke-direct {v4, v1}, Lbij;-><init>(Lcom/opera/android/BrowserActivity;)V

    goto/16 :goto_963

    :cond_a07
    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_963

    :pswitch_a0e
    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-eqz v1, :cond_a1e

    new-instance v4, Ltcb;

    sget-object v6, Lltg;->d:Lltg;

    const/4 v7, 0x3

    invoke-direct {v4, v1, v6, v7}, Ltcb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto/16 :goto_963

    :cond_a1e
    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_963

    :pswitch_a25
    new-instance v1, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v1}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    invoke-virtual {v4, v9}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v1

    check-cast v1, Ljt2;

    invoke-static {}, LJ/N;->MMr_2O4r()Z

    move-result v4

    if-nez v4, :cond_a3e

    new-instance v4, Lpcb;

    const/4 v6, 0x2

    invoke-direct {v4, v1, v6}, Lpcb;-><init>(Ljt2;B)V

    goto/16 :goto_963

    :cond_a3e
    new-instance v4, Lpcb;

    const/4 v7, 0x3

    invoke-direct {v4, v1, v7}, Lpcb;-><init>(Ljt2;B)V

    goto/16 :goto_963

    :pswitch_a46
    new-instance v1, Lcom/opera/android/autofill/AutofillManager;

    invoke-direct {v1}, Lcom/opera/android/autofill/AutofillManager;-><init>()V

    invoke-virtual {v4, v9}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v1

    check-cast v1, Ljt2;

    invoke-static {}, LJ/N;->M3pTNY7t()Z

    move-result v4

    if-nez v4, :cond_a5f

    new-instance v4, Lpcb;

    const/4 v7, 0x0

    invoke-direct {v4, v1, v7}, Lpcb;-><init>(Ljt2;B)V

    goto/16 :goto_963

    :cond_a5f
    new-instance v4, Lpcb;

    const/4 v6, 0x1

    invoke-direct {v4, v1, v6}, Lpcb;-><init>(Ljt2;B)V

    goto/16 :goto_963

    :pswitch_a67
    new-instance v1, Lmcb;

    const/16 v4, 0x16

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_a70
    new-instance v4, Ltcb;

    const-class v6, Lpte;

    invoke-static {v6}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object v6

    const/4 v7, 0x2

    invoke-direct {v4, v6, v1, v7}, Ltcb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto/16 :goto_963

    :pswitch_a7e
    sget-object v4, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    invoke-virtual {v1}, Lydn;->p()Lwdn;

    move-result-object v1

    iget-boolean v1, v1, Lwdn;->a:Z

    if-nez v1, :cond_a99

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_a99
    new-instance v1, Lmcb;

    const/4 v4, 0x7

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_aa1
    new-instance v1, Lmcb;

    const/16 v4, 0x14

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_aaa
    const-class v1, Ld8j;

    invoke-virtual {v4, v1}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v1

    check-cast v1, Ld8j;

    new-instance v4, Lrcb;

    const/4 v7, 0x0

    invoke-direct {v4, v1, v7}, Lrcb;-><init>(Ljava/lang/Object;B)V

    goto/16 :goto_963

    :pswitch_aba
    new-instance v1, Lncb;

    const/4 v6, 0x4

    invoke-direct {v1, v8, v7, v6}, Lncb;-><init>(Lp12;[IB)V

    goto/16 :goto_5b9

    :pswitch_ac2
    new-instance v1, Lncb;

    const/4 v6, 0x1

    invoke-direct {v1, v8, v7, v6}, Lncb;-><init>(Lp12;[IB)V

    goto/16 :goto_5b9

    :pswitch_aca
    new-instance v1, Lmcb;

    const/16 v4, 0x15

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_ad3
    new-instance v1, Lbdb;

    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-direct {v1, v4}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_5b9

    :pswitch_adf
    new-instance v4, Ltcb;

    const-class v6, Ltc6;

    invoke-static {v6}, Lzhj;->b(Ljava/lang/Class;)Lzhj;

    move-result-object v6

    const/4 v7, 0x2

    invoke-direct {v4, v6, v1, v7}, Ltcb;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    goto/16 :goto_963

    :pswitch_aed
    new-instance v1, Lmcb;

    const/16 v4, 0xf

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_af6
    new-instance v1, Lmcb;

    const/4 v6, 0x4

    invoke-direct {v1, v8, v6}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_afe
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lbdb;

    new-instance v4, Lc8d;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    invoke-direct {v1, v4}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_5b9

    :pswitch_b0e
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lbdb;

    new-instance v4, Lxm8;

    const/4 v6, 0x1

    const/4 v7, 0x0

    invoke-direct {v4, v6, v7}, Lxm8;-><init>(IZ)V

    invoke-direct {v1, v4}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_5b9

    :pswitch_b20
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v4

    if-nez v4, :cond_b31

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_b31
    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v1

    iget-object v1, v1, Lq6e;->a:Ljava/util/ArrayList;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/Collection;->stream()Ljava/util/stream/Stream;

    move-result-object v1

    new-instance v6, Lnn;

    const/16 v8, 0x8

    invoke-direct {v6, v8}, Lnn;-><init>(B)V

    invoke-interface {v1, v6}, Ljava/util/stream/Stream;->filter(Ljava/util/function/Predicate;)Ljava/util/stream/Stream;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/stream/Stream;->findFirst()Ljava/util/Optional;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/Optional;->isPresent()Z

    move-result v6

    if-nez v6, :cond_b63

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_b63
    new-instance v6, Lwcb;

    invoke-virtual {v1}, Ljava/util/Optional;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leri;

    invoke-direct {v6, v4, v7, v1}, Lwcb;-><init>(Lcom/opera/android/BrowserActivity;Llqm;Leri;)V

    goto/16 :goto_705

    :pswitch_b70
    move-object/from16 v44, v27

    move/from16 v38, v29

    const-string v1, "tabId"

    const/4 v8, -0x1

    invoke-virtual {v11, v1, v8}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v1

    invoke-virtual {v3, v1}, Lk6l;->r(I)Lb2l;

    move-result-object v1

    if-eqz v1, :cond_b84

    invoke-virtual {v3, v1}, Lk6l;->B(Lb2l;)V

    :cond_b84
    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :pswitch_b8b
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_b9c

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_b9c
    new-instance v4, Lucb;

    const/4 v6, 0x2

    invoke-direct {v4, v1, v6}, Lucb;-><init>(Lcom/opera/android/BrowserActivity;B)V

    goto/16 :goto_dcf

    :pswitch_ba4
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lmcb;

    const/16 v4, 0xb

    invoke-direct {v1, v8, v4}, Lmcb;-><init>(Lp12;B)V

    goto/16 :goto_5b9

    :pswitch_bb1
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v1, Lbdb;

    const-string v4, "widget"

    const/16 v6, 0xd

    const/4 v7, 0x0

    invoke-static {v6, v4, v7}, Lbtb;->c(ILjava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const/4 v6, 0x1

    invoke-static {v4, v10, v6}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v4

    invoke-virtual {v4, v6}, Lvx3;->c(Z)V

    new-instance v7, Lay3;

    invoke-direct {v7, v4}, Lay3;-><init>(Lvx3;)V

    invoke-direct {v1, v7}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_5b9

    :pswitch_bd2
    move-object/from16 v44, v27

    move/from16 v38, v29

    const/4 v6, 0x1

    invoke-virtual {v8, v11, v15, v6}, Lp12;->r(Landroid/content/Intent;Lwth;Z)Lcdb;

    move-result-object v1

    goto/16 :goto_5b9

    :pswitch_bdd
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-virtual {v11, v12}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    const-string v6, "com.opera.android.MainLauncherActivity"

    invoke-virtual {v6, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_bf4

    const/4 v7, 0x0

    invoke-virtual {v8, v11, v15, v7}, Lp12;->r(Landroid/content/Intent;Lwth;Z)Lcdb;

    move-result-object v1

    goto/16 :goto_5b9

    :cond_bf4
    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_c01

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_c01
    const-string v4, "android.intent.extra.TEXT"

    invoke-virtual {v11, v4}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v4

    if-eqz v4, :cond_87

    new-instance v6, Lxcb;

    const/4 v7, 0x2

    invoke-direct {v6, v1, v4, v7}, Lxcb;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;B)V

    goto/16 :goto_705

    :pswitch_c11
    move/from16 v1, v19

    move/from16 v38, v29

    move/from16 v19, v44

    move-object/from16 v44, v27

    :try_start_c19
    invoke-static {v11}, Lp12;->i(Landroid/content/Intent;)Ljava/lang/String;

    move-result-object v4

    invoke-static {v4}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v6

    if-nez v6, :cond_87

    invoke-static {v4}, Lmdb;->e(Ljava/lang/String;)Z

    move-result v6

    if-eqz v6, :cond_87

    const-string v6, "org.opera.browser.new_tab_referrer"

    const-class v9, Lsqh;

    invoke-static {v11, v6, v9}, Lyi4;->x(Landroid/content/Intent;Ljava/lang/String;Ljava/lang/Class;)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lsqh;

    const-string v9, "org.opera.browser.new_tab_origin"

    invoke-virtual {v11, v9}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v10

    if-eqz v10, :cond_c47

    const/4 v10, -0x1

    invoke-virtual {v11, v9, v10}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    invoke-static {v9}, Llqm;->d(I)Llqm;

    move-result-object v9

    if-eqz v9, :cond_c47

    move-object v7, v9

    :cond_c47
    invoke-virtual {v8, v4, v7, v15}, Lp12;->q(Ljava/lang/String;Llqm;Lwth;)Lcdb;

    move-result-object v8

    if-eqz v8, :cond_c50

    move-object v4, v8

    goto/16 :goto_dcf

    :cond_c50
    const-string v8, "org.opera.browser.new_tab_incognito"

    const/4 v9, 0x0

    invoke-virtual {v11, v8, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_c5c

    move/from16 v1, v19

    goto :goto_c66

    :cond_c5c
    const-string v8, "org.opera.browser.in_active_mode"

    invoke-virtual {v11, v8, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v8

    if-eqz v8, :cond_c66

    move/from16 v1, v43

    :cond_c66
    :goto_c66
    const-string v8, "org.opera.browser.new_tab_disposition"

    const/4 v10, 0x1

    invoke-virtual {v11, v8, v10}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v8

    const-string v10, "org.opera.browser.reuse_existing_tab"

    invoke-virtual {v11, v10, v9}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v10

    const-string v9, "org.opera.browser.new_tab_placement"

    const/high16 v12, -0x80000000

    invoke-virtual {v11, v9, v12}, Landroid/content/Intent;->getIntExtra(Ljava/lang/String;I)I

    move-result v9

    const-string v11, "about:"

    invoke-virtual {v4, v11}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    move-result v11

    if-eqz v11, :cond_c85

    const-string v4, "opera://about/"

    :cond_c85
    const/4 v11, 0x0

    invoke-static {v4, v7, v11}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v4

    iput-object v6, v4, Lvx3;->l:Lsqh;

    iput v9, v4, Lvx3;->g:I

    const/4 v6, 0x1

    invoke-virtual {v4, v6}, Lvx3;->c(Z)V

    iput-boolean v10, v4, Lvx3;->q:Z

    iput v1, v4, Lvx3;->c:I

    if-eqz v8, :cond_c9c

    invoke-virtual {v4, v6}, Lvx3;->a(Z)V

    goto :goto_ca1

    :cond_c9c
    iput v6, v4, Lvx3;->d:I

    invoke-virtual {v4, v6}, Lvx3;->d(Z)V

    :goto_ca1
    sget-object v1, Llqm;->H:Llqm;

    if-ne v7, v1, :cond_ca7

    iput-boolean v6, v4, Lvx3;->s:Z

    :cond_ca7
    new-instance v1, Lvcb;

    new-instance v6, Lay3;

    invoke-direct {v6, v4}, Lay3;-><init>(Lvx3;)V

    invoke-direct {v1, v6}, Lvcb;-><init>(Ljava/lang/Object;)V
    :try_end_cb1
    .catch Ljava/lang/Exception; {:try_start_c19 .. :try_end_cb1} :catch_87

    goto/16 :goto_5b9

    :pswitch_cb3
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_cc4

    new-instance v1, Lzcb;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_5b9

    :cond_cc4
    new-instance v4, Lwcb;

    const/4 v7, 0x0

    invoke-direct {v4, v1, v10, v7}, Lwcb;-><init>(Lcom/opera/android/BrowserActivity;Llqm;Leri;)V

    goto/16 :goto_dcf

    :pswitch_ccc
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v4, Lxcb;

    invoke-virtual {v11}, Landroid/content/Intent;->getDataString()Ljava/lang/String;

    move-result-object v6

    const/4 v7, 0x1

    invoke-direct {v4, v1, v6, v7}, Lxcb;-><init>(Lcom/opera/android/BrowserActivity;Ljava/lang/String;B)V

    goto/16 :goto_dcf

    :pswitch_cdc
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static {v1}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_ced

    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_dcf

    :cond_ced
    new-instance v6, Lycb;

    invoke-virtual {v4, v9}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v4

    const/4 v7, 0x0

    invoke-direct {v6, v1, v4, v7}, Lycb;-><init>(Lcom/opera/android/BrowserActivity;ZB)V

    goto/16 :goto_705

    :pswitch_cf9
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-virtual {v11}, Landroid/content/Intent;->getData()Landroid/net/Uri;

    move-result-object v4

    if-eqz v4, :cond_d4a

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    check-cast v6, Lcom/opera/android/OperaApplication;

    invoke-virtual {v6}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v6

    invoke-virtual {v6}, Lbf9;->q()Lpc9;

    move-result-object v28

    if-nez v28, :cond_d1c

    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_dcf

    :cond_d1c
    const-string v6, "msg"

    invoke-virtual {v4}, Landroid/net/Uri;->getScheme()Ljava/lang/String;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_d43

    :try_start_d28
    invoke-virtual {v4}, Landroid/net/Uri;->getSchemeSpecificPart()Ljava/lang/String;

    move-result-object v6

    invoke-static {v6}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v6

    invoke-virtual {v6}, Ljava/lang/Long;->longValue()J

    move-result-wide v31

    invoke-virtual {v4}, Landroid/net/Uri;->getFragment()Ljava/lang/String;

    move-result-object v29

    new-instance v27, Lfc9;

    move-object/from16 v30, v1

    invoke-direct/range {v27 .. v32}, Lfc9;-><init>(Lpc9;Ljava/lang/String;Lcom/opera/android/BrowserActivity;J)V
    :try_end_d3f
    .catch Ljava/lang/NumberFormatException; {:try_start_d28 .. :try_end_d3f} :catch_d43

    move-object/from16 v4, v27

    goto/16 :goto_dcf

    :catch_d43
    :cond_d43
    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_dcf

    :cond_d4a
    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_dcf

    :pswitch_d51
    move-object/from16 v30, v1

    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-static/range {v30 .. v30}, Lq9n;->o(Landroid/content/Context;)Lcom/opera/android/BrowserActivity;

    move-result-object v1

    if-nez v1, :cond_d64

    new-instance v4, Lzcb;

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    goto/16 :goto_dcf

    :cond_d64
    new-instance v4, Lmcb;

    const/16 v1, 0x11

    invoke-direct {v4, v8, v1}, Lmcb;-><init>(Lp12;B)V

    goto :goto_dcf

    :pswitch_d6c
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v4, Lbdb;

    new-instance v1, Luhj;

    sget-object v6, Lnv0;->b:Lnv0;

    invoke-direct {v1}, Luhj;-><init>()V

    invoke-direct {v4, v1}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto :goto_dcf

    :pswitch_d7d
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v4, Lmcb;

    const/16 v1, 0x17

    invoke-direct {v4, v8, v1}, Lmcb;-><init>(Lp12;B)V

    goto :goto_dcf

    :pswitch_d89
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v4, Lmcb;

    const/16 v1, 0xc

    invoke-direct {v4, v8, v1}, Lmcb;-><init>(Lp12;B)V

    goto :goto_dcf

    :pswitch_d95
    move-object/from16 v44, v27

    move/from16 v38, v29

    invoke-virtual {v11, v13}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v11, v6}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    invoke-virtual {v11, v14}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    const-string v1, "PROMPT"

    invoke-virtual {v11, v1}, Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v4, "INSTANT_SEND"

    const/4 v7, 0x0

    invoke-virtual {v11, v4, v7}, Landroid/content/Intent;->getBooleanExtra(Ljava/lang/String;Z)Z

    move-result v4

    new-instance v6, Lbdb;

    new-instance v8, Luhj;

    sget-object v9, Lnv0;->b:Lnv0;

    invoke-direct {v8, v1, v7, v4}, Luhj;-><init>(Ljava/lang/String;ZZ)V

    invoke-direct {v6, v8}, Lvcb;-><init>(Ljava/lang/Object;)V

    goto/16 :goto_705

    :pswitch_dbd
    move-object/from16 v44, v27

    move/from16 v38, v29

    new-instance v4, Lbdb;

    new-instance v1, Luhj;

    sget-object v6, Lnv0;->b:Lnv0;

    const/16 v6, 0x10

    invoke-direct {v1, v6}, Luhj;-><init>(I)V

    invoke-direct {v4, v1}, Lvcb;-><init>(Ljava/lang/Object;)V

    :goto_dcf
    if-eqz v4, :cond_dd4

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_dd4
    move-object/from16 v1, v26

    move-object/from16 v6, v33

    move/from16 v9, v34

    move/from16 v14, v38

    move-object/from16 v13, v39

    move-object/from16 v10, v40

    move/from16 v12, v42

    move-object/from16 v4, v44

    move-object/from16 v7, v45

    goto/16 :goto_5f

    :cond_de8
    move-object/from16 v33, v6

    move-object/from16 v45, v7

    move-object/from16 v40, v10

    move/from16 v42, v12

    move-object/from16 v39, v13

    invoke-virtual/range {v33 .. v33}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v0, v5}, Lou3;->R(Ljava/util/ArrayList;)Z

    move-result v1

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->w0()Lb2l;

    move-result-object v3

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v4

    if-eqz v4, :cond_e37

    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    if-eqz v4, :cond_e37

    if-eqz v3, :cond_e37

    move-object v4, v3

    check-cast v4, Ld7l;

    iget-object v4, v4, Ld7l;->j:Le7l;

    invoke-interface {v4}, Lb9l;->getUrl()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v2, v4}, Lcom/opera/android/BrowserActivity;->g(Ljava/lang/String;)Z

    move-result v4

    if-eqz v4, :cond_e37

    iget-boolean v4, v2, Lcom/opera/android/BrowserActivity;->j1:Z

    if-nez v4, :cond_e33

    iget v4, v2, Lcom/opera/android/BrowserActivity;->D1:I

    const/4 v6, 0x2

    if-eq v4, v6, :cond_e2f

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/settings/SettingsManager;->N()Z

    move-result v4

    if-eqz v4, :cond_e2f

    iput v6, v2, Lcom/opera/android/BrowserActivity;->D1:I

    :cond_e2f
    iget v4, v2, Lcom/opera/android/BrowserActivity;->D1:I

    if-eq v4, v6, :cond_e37

    :cond_e33
    const/4 v4, 0x1

    :goto_e34
    move-object/from16 v7, v45

    goto :goto_e39

    :cond_e37
    const/4 v4, 0x0

    goto :goto_e34

    :goto_e39
    iget-object v6, v7, Ltw3;->a:Lhx3;

    invoke-virtual {v6}, Lhx3;->q()Lcom/opera/android/Lazy;

    move-result-object v6

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lmm6;

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object v8

    iget-object v9, v2, Ldx3;->o:Lqim;

    invoke-static {v9}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v4, v8, v9}, Lmm6;->e(ZLeej;Lqim;)V

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v6, 0x0

    :goto_e56
    if-ge v6, v4, :cond_e64

    invoke-virtual {v5, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Lcdb;

    invoke-interface {v8}, Lcdb;->execute()V

    goto :goto_e56

    :cond_e64
    if-eqz v3, :cond_e70

    check-cast v3, Ld7l;

    invoke-virtual {v3}, Ld7l;->o0()Z

    move-result v3

    if-eqz v3, :cond_e70

    const/4 v3, 0x1

    goto :goto_e71

    :cond_e70
    const/4 v3, 0x0

    :goto_e71
    invoke-virtual/range {v39 .. v39}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    move-object/from16 v9, v40

    move/from16 v8, v42

    invoke-static {v4, v8, v3, v9}, Lmdb;->g(Lx5f;ZZLandroid/content/Intent;)V

    iget-object v6, v2, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    if-nez v6, :cond_e83

    const/4 v6, 0x0

    :cond_e83
    const/4 v3, 0x5

    invoke-virtual {v6, v3}, Ljl6;->q(I)V

    if-eqz v1, :cond_e9c

    iget-object v1, v6, Ljl6;->e:Ljava/lang/Object;

    check-cast v1, Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "session.pause.time"

    invoke-static {v1, v3}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    :cond_e9c
    invoke-virtual {v5}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    const/16 v25, 0x1

    xor-int/lit8 v6, v1, 0x1

    iget-boolean v1, v2, Lcom/opera/android/BrowserActivity;->j1:Z

    const-string v3, "startpage.upgrade_page_will_be_shown"

    if-nez v1, :cond_f15

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v1

    iget-object v1, v1, Ljk5;->b:Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Leb8;

    if-eqz v1, :cond_ec7

    iget-boolean v1, v1, Leb8;->b:Z

    const/16 v25, 0x1

    xor-int/lit8 v1, v1, 0x1

    goto :goto_ec8

    :cond_ec7
    const/4 v1, 0x0

    :goto_ec8
    if-nez v1, :cond_f15

    iget v1, v2, Lcom/opera/android/BrowserActivity;->D1:I

    const/4 v4, 0x2

    if-eq v1, v4, :cond_edb

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/settings/SettingsManager;->N()Z

    move-result v1

    if-eqz v1, :cond_edb

    iput v4, v2, Lcom/opera/android/BrowserActivity;->D1:I

    :cond_edb
    move-object v1, v5

    iget v5, v2, Lcom/opera/android/BrowserActivity;->D1:I

    if-eqz v5, :cond_f13

    const/4 v10, 0x1

    iput-boolean v10, v2, Lcom/opera/android/BrowserActivity;->j1:Z

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v4

    invoke-virtual {v4}, Lru9;->b()Lnv6;

    move-result-object v4

    iget-object v11, v4, Lnv6;->a:Ljava/lang/Object;

    check-cast v11, Landroid/content/SharedPreferences$Editor;

    invoke-interface {v11, v3, v10}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v4}, Lnv6;->w()V

    move-object v3, v1

    new-instance v1, Lpom;

    move-object v4, v3

    iget-object v3, v2, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v10

    check-cast v10, Lcom/opera/android/OperaApplication;

    invoke-virtual {v10}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v10

    iget-object v10, v10, Ld6j;->c:Lx5f;

    move-object/from16 v46, v10

    move-object v10, v4

    move-object/from16 v4, v46

    invoke-direct/range {v1 .. v6}, Lpom;-><init>(Landroid/content/Context;Lumi;Lx5f;IZ)V

    invoke-virtual {v2, v1}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    goto :goto_f29

    :cond_f13
    move-object v10, v1

    goto :goto_f16

    :cond_f15
    move-object v10, v5

    :goto_f16
    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    invoke-virtual {v1}, Lru9;->b()Lnv6;

    move-result-object v1

    iget-object v4, v1, Lnv6;->a:Ljava/lang/Object;

    check-cast v4, Landroid/content/SharedPreferences$Editor;

    const/4 v11, 0x0

    invoke-interface {v4, v3, v11}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {v1}, Lnv6;->w()V

    :goto_f29
    invoke-virtual/range {v39 .. v39}, Lcom/opera/android/OperaApplication;->d()Le00;

    move-result-object v1

    invoke-virtual {v1}, Le00;->c()V

    sget-object v1, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {}, LJ/N;->MtSfirxP()V

    iget-object v1, v7, Ltw3;->a:Lhx3;

    invoke-virtual {v1}, Lhx3;->d()Lcom/opera/android/Lazy;

    move-result-object v1

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lv00;

    invoke-virtual {v1, v2}, Lv00;->b(Landroid/content/Context;)V

    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->s0:Leac;

    if-eqz v1, :cond_f4b

    invoke-virtual {v1, v9}, Leac;->W(Landroid/content/Intent;)V

    :cond_f4b
    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->C1:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ll98;

    invoke-virtual {v1, v9}, Ll98;->b(Landroid/content/Intent;)V

    iget-object v1, v2, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    if-eqz v9, :cond_f75

    const-string v3, "com.opera.android.action.EXTRA_FORCE_SHOW_FRAGMENT_IMMEDIATELY"

    invoke-virtual {v9, v3}, Landroid/content/Intent;->hasExtra(Ljava/lang/String;)Z

    move-result v3

    if-nez v3, :cond_f71

    const-string v3, "android.service.quicksettings.action.QS_TILE_PREFERENCES"

    invoke-virtual {v9}, Landroid/content/Intent;->getAction()Ljava/lang/String;

    move-result-object v4

    invoke-virtual {v3, v4}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_f75

    :cond_f71
    const/4 v6, 0x1

    const/16 v25, 0x1

    goto :goto_f78

    :cond_f75
    const/4 v6, 0x1

    const/16 v25, 0x0

    :goto_f78
    xor-int/lit8 v3, v25, 0x1

    invoke-virtual {v1, v3}, Lqim;->i(Z)V

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->t1()V

    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->Y:Lm6m;

    if-eqz v1, :cond_f88

    const/4 v9, 0x0

    invoke-virtual {v1, v9}, Lm6m;->b(Z)V

    :cond_f88
    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->l0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq82;

    if-eqz v1, :cond_f95

    invoke-virtual {v1}, Lq82;->e()V

    :cond_f95
    iget-object v1, v2, Lcom/opera/android/BrowserActivity;->p0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lmeg;

    if-eqz v1, :cond_fa2

    invoke-virtual {v1}, Lmeg;->a()V

    :cond_fa2
    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v1

    if-eqz v1, :cond_fbf

    invoke-static {v2}, Lmom;->a(Landroid/content/Context;)Lgom;

    move-result-object v1

    iget-object v3, v1, Lgom;->a:Llom;

    sget-object v4, Llom;->b:Llom;

    if-ne v3, v4, :cond_fbf

    iget-object v1, v1, Lgom;->b:Lkom;

    sget-object v3, Lkom;->b:Lkom;

    if-ne v1, v3, :cond_fbf

    invoke-virtual/range {v39 .. v39}, Lcom/opera/android/OperaApplication;->r()Lg89;

    move-result-object v1

    invoke-virtual {v1, v2}, Lg89;->a(Lt5d;)V

    :cond_fbf
    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v1

    if-eqz v1, :cond_fde

    invoke-virtual/range {v39 .. v39}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v1

    invoke-virtual {v1}, Lydn;->M()Z

    move-result v1

    if-eqz v1, :cond_fde

    iget-object v1, v2, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, v1, Lqim;->c:Lz77;

    new-instance v3, Lyz5;

    invoke-direct {v3}, Lyz5;-><init>()V

    invoke-virtual {v1, v3}, Lr22;->a(Ljjm;)V

    :cond_fde
    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->X0()Z

    move-result v1

    if-eqz v1, :cond_fff

    invoke-virtual {v10}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_fff

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->p1()V

    invoke-static {v2}, Lfsp;->y(Lndc;)Lddc;

    move-result-object v1

    new-instance v3, Lp71;

    move-object/from16 v4, v39

    const/4 v6, 0x0

    const/4 v10, 0x1

    invoke-direct {v3, v4, v2, v6, v10}, Lp71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    const/4 v5, 0x3

    invoke-static {v1, v6, v6, v3, v5}, Lna2;->B(Lnx5;Lkotlin/coroutines/CoroutineContext;Lrx5;Lkotlin/jvm/functions/Function2;I)Ld3k;

    goto :goto_1001

    :cond_fff
    move-object/from16 v4, v39

    :goto_1001
    if-eqz v8, :cond_108b

    new-instance v26, Lven;

    invoke-virtual {v2}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v27

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->n1()Lk6l;

    move-result-object v28

    new-instance v1, Lli;

    const/16 v3, 0x11

    invoke-direct {v1, v4, v3}, Lli;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v3, Lwv1;

    const/4 v6, 0x1

    invoke-direct {v3, v1, v6}, Lwv1;-><init>(Lb6h;B)V

    new-instance v1, Lli;

    const/16 v5, 0x12

    invoke-direct {v1, v4, v5}, Lli;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Lwv1;

    invoke-direct {v5, v1, v6}, Lwv1;-><init>(Lb6h;B)V

    new-instance v1, Lji;

    const/16 v6, 0xd

    invoke-direct {v1, v4, v6}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v6, Lji;

    const/16 v8, 0xe

    invoke-direct {v6, v4, v8}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v7}, Ltw3;->c()Lcom/opera/android/Lazy;

    move-result-object v7

    new-instance v8, Lnu3;

    const/4 v9, 0x0

    invoke-direct {v8, v7, v9}, Lnu3;-><init>(Lcom/opera/android/Lazy;B)V

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->Q()Lorm;

    move-result-object v34

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v35

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object v36

    move-object/from16 v31, v1

    move-object/from16 v29, v3

    move-object/from16 v30, v5

    move-object/from16 v32, v6

    move-object/from16 v33, v8

    invoke-direct/range {v26 .. v36}, Lven;-><init>(Ltcc;Lk6l;Lwv1;Lwv1;Lji;Lji;Lnu3;Lorm;Lru9;Lnej;)V

    move-object/from16 v1, v26

    new-instance v5, Llp9;

    invoke-virtual {v2}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v6

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->n1()Lk6l;

    move-result-object v7

    new-instance v3, Lli;

    const/16 v8, 0x10

    invoke-direct {v3, v4, v8}, Lli;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v8, Lwv1;

    const/4 v10, 0x1

    invoke-direct {v8, v3, v10}, Lwv1;-><init>(Lb6h;B)V

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->Q()Lorm;

    move-result-object v9

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v10

    invoke-virtual {v2}, Lcom/opera/android/BrowserActivity;->I0()Lnej;

    move-result-object v11

    new-instance v12, Lji;

    const/16 v3, 0xf

    invoke-direct {v12, v4, v3}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v13, Lq2;

    invoke-direct {v13, v1}, Lq2;-><init>(Lven;)V

    invoke-direct/range {v5 .. v13}, Llp9;-><init>(Ltcc;Lk6l;Lwv1;Lorm;Lru9;Lnej;Lji;Lq2;)V

    :cond_108b
    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    new-instance v3, Lrl;

    const/4 v6, 0x4

    invoke-direct {v3, v6}, Lrl;-><init>(B)V

    new-instance v4, Lvk2;

    const/4 v7, 0x5

    invoke-direct {v4, v7}, Lvk2;-><init>(B)V

    const/4 v7, 0x0

    invoke-virtual {v1, v7, v3, v4}, Ldb;->g(ZLjava/lang/Runnable;Lcom/opera/api/Callback;)Landroid/os/CancellationSignal;

    sget-object v1, Lava;->a:Lcva;

    new-instance v3, Lqt3;

    const/16 v4, 0xc

    invoke-direct {v3, v2, v4}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v1, v3}, Lcva;->a(Ljava/lang/Runnable;)V

    new-instance v3, Lqt3;

    const/16 v6, 0xd

    invoke-direct {v3, v2, v6}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual {v1, v3}, Lcva;->a(Ljava/lang/Runnable;)V

    iget-object v0, v0, Lou3;->a:Lnrl;

    invoke-virtual {v0}, Lnrl;->K()V

    return-void

    nop

    :sswitch_data_10bc
    .sparse-switch
        -0xbf44e0d -> :sswitch_127
        0xd48dd5 -> :sswitch_118
        0x223eeab4 -> :sswitch_109
        0x2281bba7 -> :sswitch_f6
    .end sparse-switch

    :sswitch_data_10ce
    .sparse-switch
        -0x7a47e583 -> :sswitch_395
        -0x7a4559be -> :sswitch_38b
        -0x76c1c290 -> :sswitch_381
        -0x688193d1 -> :sswitch_377
        -0x6113c964 -> :sswitch_36d
        -0x5f7230a6 -> :sswitch_363
        -0x5e33ea05 -> :sswitch_359
        -0x5b4ae05b -> :sswitch_34f
        -0x55e9eff4 -> :sswitch_344
        -0x4636466d -> :sswitch_339
        -0x45f16402 -> :sswitch_32d
        -0x45ee9a33 -> :sswitch_321
        -0x45ed2f16 -> :sswitch_315
        -0x3c29a2a6 -> :sswitch_309
        -0x39e9e2f6 -> :sswitch_2fd
        -0x33c0a693 -> :sswitch_2f1
        -0x31e46be6 -> :sswitch_2e5
        -0x30dec877 -> :sswitch_2d9
        -0x2ceb4705 -> :sswitch_2cd
        -0x2c279937 -> :sswitch_2c3
        -0x231b57c3 -> :sswitch_2b7
        -0x200844c1 -> :sswitch_2ab
        -0x1899de12 -> :sswitch_29f
        -0x141b101e -> :sswitch_293
        -0x133a0fa7 -> :sswitch_287
        -0x10a2e3b6 -> :sswitch_27b
        -0xb93d81e -> :sswitch_26f
        0x3386097 -> :sswitch_263
        0x4fdc20e -> :sswitch_257
        0x95355a6 -> :sswitch_24b
        0xfc2277a -> :sswitch_23f
        0xff3b561 -> :sswitch_233
        0x119f531c -> :sswitch_227
        0x13fe101c -> :sswitch_21b
        0x1fa2550e -> :sswitch_20f
        0x2477a3ba -> :sswitch_203
        0x280f4734 -> :sswitch_1f7
        0x2d77764f -> :sswitch_1eb
        0x45707542 -> :sswitch_1df
        0x47565216 -> :sswitch_1d3
        0x4f7d534e -> :sswitch_1c7
        0x4fce7b6a -> :sswitch_1bb
        0x541d80f4 -> :sswitch_1af
        0x57b68750 -> :sswitch_1a3
        0x625a31cc -> :sswitch_197
        0x6590ee62 -> :sswitch_18b
        0x6f35f57a -> :sswitch_17f
        0x737c5b98 -> :sswitch_173
        0x79118bc2 -> :sswitch_167
    .end sparse-switch

    :pswitch_data_1194
    .packed-switch 0x0
        :pswitch_dbd
        :pswitch_d95
        :pswitch_d89
        :pswitch_d7d
        :pswitch_d6c
        :pswitch_d51
        :pswitch_cf9
        :pswitch_cdc
        :pswitch_ccc
        :pswitch_cb3
        :pswitch_c11
        :pswitch_bdd
        :pswitch_bd2
        :pswitch_bb1
        :pswitch_ba4
        :pswitch_b8b
        :pswitch_b70
        :pswitch_b20
        :pswitch_b0e
        :pswitch_cdc
        :pswitch_afe
        :pswitch_7fc
        :pswitch_7e1
        :pswitch_7d1
        :pswitch_7e1
        :pswitch_797
        :pswitch_732
        :pswitch_708
        :pswitch_6e8
        :pswitch_685
        :pswitch_b8b
        :pswitch_66c
        :pswitch_660
        :pswitch_64c
        :pswitch_641
        :pswitch_5d5
        :pswitch_b8b
        :pswitch_5c4
        :pswitch_732
        :pswitch_5aa
        :pswitch_532
        :pswitch_50a
        :pswitch_6e8
        :pswitch_4f2
        :pswitch_4ca
        :pswitch_47f
        :pswitch_bd2
        :pswitch_478
        :pswitch_46c
    .end packed-switch

    :sswitch_data_11fa
    .sparse-switch
        -0x4b52217c -> :sswitch_43e
        -0x49bb6847 -> :sswitch_433
        0xeed1a1b -> :sswitch_428
    .end sparse-switch

    :pswitch_data_1208
    .packed-switch 0x0
        :pswitch_45c
        :pswitch_455
        :pswitch_44f
    .end packed-switch

    :pswitch_data_1212
    .packed-switch 0x0
        :pswitch_af6
        :pswitch_aed
        :pswitch_adf
        :pswitch_ad3
        :pswitch_aca
        :pswitch_ac2
        :pswitch_aba
        :pswitch_aaa
        :pswitch_aa1
        :pswitch_a7e
        :pswitch_a70
        :pswitch_aa1
        :pswitch_a67
        :pswitch_a46
        :pswitch_a25
        :pswitch_a0e
        :pswitch_9fa
        :pswitch_9f1
        :pswitch_9e9
        :pswitch_9e0
        :pswitch_9d8
        :pswitch_9d0
        :pswitch_9ab
        :pswitch_96e
        :pswitch_966
        :pswitch_959
        :pswitch_943
        :pswitch_93b
        :pswitch_932
        :pswitch_929
        :pswitch_915
        :pswitch_90c
        :pswitch_904
        :pswitch_8fb
        :pswitch_8f3
        :pswitch_8d1
        :pswitch_8c8
        :pswitch_8c0
        :pswitch_8b8
        :pswitch_877
        :pswitch_86e
        :pswitch_84c
    .end packed-switch
.end method

.method public final W(Lndc;)V
    .registers 40

    move-object/from16 v1, p0

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v3, v1, Lou3;->i:Lcom/opera/android/BrowserActivity;

    const-string v0, "Initializing"

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->q1(Ljava/lang/String;)V

    iget-object v13, v3, Lcom/opera/android/BrowserActivity;->x:Lumi;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->r1()V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/opera/android/OperaApplication;

    iget-object v0, v5, Lcom/opera/android/OperaApplication;->E:Lj4c;

    iget-object v14, v5, Lcom/opera/android/OperaApplication;->J:Lj4c;

    iget-object v15, v5, Lcom/opera/android/OperaApplication;->D:Lj4c;

    iget-object v11, v5, Lcom/opera/android/OperaApplication;->y:Lj4c;

    iget-object v12, v5, Lcom/opera/android/OperaApplication;->G:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lv3e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v3, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v4, v2, Ltw3;->a:Lhx3;

    invoke-virtual {v4}, Lhx3;->p()Lcom/opera/android/Lazy;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lyl6;

    iput-object v4, v0, Lv3e;->b:Lyl6;

    iput-object v3, v0, Lv3e;->c:Lcom/opera/android/BrowserActivity;

    new-instance v0, Ljw0;

    invoke-direct {v0, v3}, Ljw0;-><init>(Lcom/opera/android/BrowserActivity;)V

    sput-object v0, Lcom/opera/android/webcore/AiAssistantUpdateBridge;->a:Ljw0;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    invoke-static {v3}, Le3j;->t(Landroid/content/Context;)Le3j;

    move-result-object v4

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->c:Lx5f;

    sget-object v7, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    new-instance v7, Lvgi;

    invoke-direct {v7, v3, v0, v4, v6}, Lvgi;-><init>(Lfp1;Lcom/opera/android/settings/SettingsManager;Le3j;Lx5f;)V

    sput-object v7, Lcom/opera/android/browser/SafeBrowsingBridge;->a:Lvgi;

    iget-object v0, v2, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->z()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm8l;

    iget-object v4, v3, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/16 v20, 0x0

    if-nez v4, :cond_70

    move-object/from16 v4, v20

    :cond_70
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, v0, Lm8l;->c:Lk6l;

    if-nez v7, :cond_88

    iput-object v4, v0, Lm8l;->c:Lk6l;

    invoke-virtual {v6}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v6

    iput-object v6, v0, Lm8l;->a:Landroid/content/Context;

    invoke-virtual {v4, v0}, Lk6l;->c(Lj6l;)V

    iget-object v0, v0, Lm8l;->b:Lq6l;

    invoke-virtual {v4, v0}, Lk6l;->b(La2l;)V

    :cond_88
    new-instance v0, Lw43;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sget-object v6, Lio7;->q:Lio7;

    sget-object v7, Lb4b;->k:Lpza;

    invoke-static {v4, v6, v7}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v4

    check-cast v4, Lb4b;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->t()Lr9c;

    move-result-object v6

    iget-object v7, v3, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v7, :cond_a2

    move-object/from16 v7, v20

    :cond_a2
    invoke-direct {v0, v4, v6, v7}, Lw43;-><init>(Lb4b;Lr9c;Lk6l;)V

    new-instance v0, Leac;

    invoke-virtual {v5}, Lcom/opera/android/OperaApplication;->t()Lr9c;

    move-result-object v4

    iget-object v6, v3, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v6, :cond_b1

    move-object/from16 v6, v20

    :cond_b1
    new-instance v7, Ldu3;

    const/16 v8, 0x19

    invoke-direct {v7, v3, v8}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct {v0, v4, v6, v7}, Leac;-><init>(Lr9c;Lk6l;Ldu3;)V

    iput-object v0, v3, Lcom/opera/android/BrowserActivity;->s0:Leac;

    new-instance v0, Luw3;

    new-instance v4, Lli;

    const/4 v9, 0x0

    const/16 v10, 0xe

    const-class v6, Lcom/opera/android/OperaApplication;

    const-string v7, "usageReporter"

    const-string v8, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    move-object/from16 v17, v11

    invoke-direct/range {v4 .. v10}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v16, v4

    new-instance v4, Lli;

    const/16 v10, 0xf

    const-string v7, "unfilteredUsageReporter"

    const-string v8, "getUnfilteredUsageReporter()Lcom/opera/android/analytics/UnfilteredUsageReporter;"

    invoke-direct/range {v4 .. v10}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v37, v5

    move-object v5, v4

    move-object/from16 v4, v37

    new-instance v6, Lmt3;

    const/16 v7, 0x1d

    invoke-direct {v6, v3, v7}, Lmt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move v8, v7

    new-instance v7, Llu3;

    invoke-direct {v7, v3, v9}, Llu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move v10, v8

    new-instance v8, Let3;

    const/4 v11, 0x1

    invoke-direct {v8, v4, v11}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v9, v2, Ltw3;->a:Lhx3;

    invoke-virtual {v9}, Lhx3;->o()Lcom/opera/android/Lazy;

    move-result-object v9

    move/from16 v19, v10

    new-instance v10, Llu3;

    invoke-direct {v10, v3, v11}, Llu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object v11, v2

    move-object/from16 v22, v4

    move-object/from16 v23, v14

    move-object/from16 v4, v16

    const/4 v14, 0x0

    move-object v2, v0

    move/from16 v0, v19

    invoke-direct/range {v2 .. v10}, Luw3;-><init>(Landroid/content/Context;Lli;Lli;Lmt3;Llu3;Let3;Lcom/opera/android/Lazy;Llu3;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Lju2;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    invoke-direct {v2, v4, v5, v14}, Lju2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Ld62;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    iget-object v5, v11, Ltw3;->a:Lhx3;

    invoke-virtual {v5}, Lhx3;->l()Lcom/opera/android/Lazy;

    move-result-object v5

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lyu2;

    invoke-direct {v2, v4, v5}, Ld62;-><init>(Lx5f;Lyu2;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Ly4g;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v4

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->c:Lx5f;

    invoke-direct {v2, v4, v5, v6}, Ly4g;-><init>(Lzwk;Lcom/opera/android/settings/SettingsManager;Lx5f;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Lob;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    const/4 v9, 0x5

    invoke-direct {v2, v4, v9}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Lju2;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->d:Lx5f;

    invoke-virtual/range {v17 .. v17}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lv1a;

    const/4 v10, 0x2

    invoke-direct {v2, v4, v5, v6, v10}, Lju2;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Ljvc;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v5

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v6

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v7, v7, Ld6j;->c:Lx5f;

    invoke-direct {v2, v4, v5, v6, v7}, Ljvc;-><init>(Lcom/opera/android/settings/SettingsManager;Lfqe;Lfue;Lx5f;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v2

    invoke-virtual {v2}, Ljtg;->b()Z

    move-result v2

    const/16 v8, 0x11

    if-eqz v2, :cond_1cb

    new-instance v2, Lob;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v4

    invoke-direct {v2, v4, v8}, Lob;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Lblk;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v4

    iget-object v4, v4, Lslk;->h:Lode;

    invoke-direct {v2, v3, v4}, Lblk;-><init>(Landroid/content/Context;Lode;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Ly73;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v4

    invoke-direct {v2, v4, v9}, Ly73;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    :cond_1cb
    new-instance v2, Lva6;

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v5

    iget-object v6, v3, Lhjf;->a:Ldll;

    invoke-virtual {v3}, Lhjf;->u()Lnzk;

    move-result-object v7

    invoke-direct {v2, v4, v5, v6, v7}, Lva6;-><init>(Lx5f;Lcom/opera/android/settings/SettingsManager;Ldll;Lnzk;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Lc47;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->d:Lx5f;

    invoke-virtual {v3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v6

    invoke-direct {v2, v4, v13, v5, v6}, Lc47;-><init>(Landroid/content/Context;Lumi;Lx5f;Ltcc;)V

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    const v4, 0x7f140893

    invoke-virtual {v3, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object v4

    iget-boolean v5, v2, Lx5f;->h:Z

    if-eqz v5, :cond_219

    iget-object v5, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v6

    invoke-virtual {v6, v5}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v5

    const/16 v7, 0x19

    invoke-virtual {v5, v7, v4}, Lb66;->D(ILjava/lang/String;)V

    invoke-virtual {v2, v6}, Lx5f;->U0(Lx56;)V

    :cond_219
    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->c:Lx5f;

    invoke-static {v3}, Ll2c;->a(Landroid/content/Context;)I

    move-result v4

    const/4 v5, 0x0

    const/4 v6, 0x1

    if-ne v4, v6, :cond_229

    move v4, v6

    goto :goto_22a

    :cond_229
    move v4, v5

    :goto_22a
    iget-boolean v7, v2, Lx5f;->h:Z

    if-eqz v7, :cond_240

    iget-object v7, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v8

    invoke-virtual {v8, v7}, Lx56;->F(Lzpa;)Lb66;

    move-result-object v7

    const/16 v9, 0x1b

    invoke-virtual {v7, v9, v6, v4}, Ljf0;->r(IIZ)V

    invoke-virtual {v2, v8}, Lx5f;->U0(Lx56;)V

    :cond_240
    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->d:Lx5f;

    iget-object v4, v2, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v7

    invoke-virtual {v7, v4}, Lx56;->N(Lzpa;)Lzs0;

    move-result-object v4

    invoke-virtual {v4, v10, v6, v6}, Ljf0;->r(IIZ)V

    invoke-virtual {v2, v7}, Lx5f;->U0(Lx56;)V

    iget-object v2, v11, Ltw3;->a:Lhx3;

    iget-object v2, v2, Lhx3;->r:Lfx3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llim;

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v2, Lpse;

    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4}, Lpse;-><init>(Landroid/content/Context;)V

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v2

    iget-object v4, v2, Lfqe;->j:Lndc;

    iget-object v7, v2, Lfqe;->h:Lob;

    if-eq v4, v3, :cond_2a4

    if-eqz v4, :cond_290

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-virtual {v4, v7}, Ltcc;->b(Lmdc;)V

    iget-object v8, v2, Lfqe;->c:Luqe;

    if-eqz v8, :cond_28d

    iget-object v8, v8, Luqe;->y:Lob;

    if-eqz v8, :cond_28d

    invoke-virtual {v4, v8}, Ltcc;->b(Lmdc;)V

    :cond_28d
    const/4 v4, 0x0

    iput-object v4, v2, Lfqe;->j:Lndc;

    :cond_290
    iput-object v3, v2, Lfqe;->j:Lndc;

    invoke-interface {v3}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-virtual {v4, v7}, Ltcc;->a(Lmdc;)V

    iget-object v2, v2, Lfqe;->c:Luqe;

    if-eqz v2, :cond_2a4

    iget-object v2, v2, Luqe;->y:Lob;

    if-eqz v2, :cond_2a4

    invoke-virtual {v4, v2}, Ltcc;->a(Lmdc;)V

    :cond_2a4
    invoke-static {}, Li0l;->g()Z

    move-result v2

    const/4 v9, 0x3

    if-nez v2, :cond_30b

    new-instance v25, Lc1a;

    invoke-virtual {v3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v26

    iget-object v2, v11, Ltw3;->u:Lii;

    const v4, 0x7f0a0a8c

    invoke-virtual {v3, v4}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v4

    move-object/from16 v28, v4

    check-cast v28, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    iget-object v4, v3, Lcom/opera/android/BrowserActivity;->B:Lcom/opera/android/browser/BrowserContainer;

    if-eqz v4, :cond_2c5

    move-object/from16 v29, v4

    goto :goto_2c7

    :cond_2c5
    const/16 v29, 0x0

    :goto_2c7
    invoke-virtual {v3}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    sget-object v7, Lio7;->v:Lio7;

    sget-object v8, Ll1a;->k:Ls49;

    invoke-static {v4, v7, v8}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v4

    move-object/from16 v30, v4

    check-cast v30, Ll1a;

    iget-object v4, v3, Ldx3;->o:Lqim;

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v3}, Ldx3;->S()Leq9;

    move-result-object v32

    iget-object v7, v3, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v7, :cond_2e7

    const/16 v33, 0x0

    goto :goto_2e9

    :cond_2e7
    move-object/from16 v33, v7

    :goto_2e9
    new-instance v7, Lxt3;

    invoke-direct {v7, v3, v9}, Lxt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-virtual/range {v22 .. v22}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->c:Lx5f;

    invoke-virtual/range {v17 .. v17}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v17

    move-object/from16 v36, v17

    check-cast v36, Lv1a;

    move-object/from16 v27, v2

    move-object/from16 v31, v4

    move-object/from16 v34, v7

    move-object/from16 v35, v8

    invoke-direct/range {v25 .. v36}, Lc1a;-><init>(Ltcc;Lii;Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/ViewGroup;Ll1a;Lqim;Leq9;Lk6l;Lxt3;Lx5f;Lv1a;)V

    move-object/from16 v2, v25

    iput-object v2, v3, Lcom/opera/android/BrowserActivity;->e1:Lc1a;

    :cond_30b
    move-object/from16 v8, v22

    iget-object v2, v8, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->I:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lxt8;

    invoke-virtual {v3, v2}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v2

    invoke-virtual {v2}, Ljtg;->b()Z

    move-result v2

    const/16 v4, 0x1c

    const/4 v7, 0x4

    if-eqz v2, :cond_40e

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->G0()Lebh;

    move-result-object v2

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v6, Lt77;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v9

    iget-object v2, v2, Lebh;->a:Lode;

    invoke-direct {v6, v9, v3, v2}, Lt77;-><init>(Lslk;Lndc;Lode;)V

    iget-object v2, v11, Ltw3;->a:Lhx3;

    iget-object v2, v2, Lhx3;->n:Lfx3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lnvg;

    iget-object v6, v2, Lnvg;->c:Lp8f;

    invoke-virtual {v6}, Lp8f;->v()Z

    move-result v9

    if-eqz v9, :cond_34e

    invoke-virtual {v6, v10}, Lp8f;->C(I)V

    :cond_34e
    iget-object v2, v2, Lnvg;->g:Lyvg;

    iget-object v6, v2, Lyvg;->a:Landroid/content/Context;

    invoke-static {v6}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v6

    iget-object v6, v6, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v9, "premium.upgrade_notification.is_pending"

    invoke-interface {v6, v9, v5}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v6

    if-eqz v6, :cond_363

    invoke-virtual {v2}, Lyvg;->c()V

    :cond_363
    new-instance v2, Ldu3;

    invoke-direct {v2, v3, v4}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v6, v3, Ldx3;->o:Lqim;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v6, Lqim;->c:Lz77;

    invoke-static {v3}, Lcxc;->t(Landroid/content/Context;)Lcxc;

    move-result-object v9

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v5

    iget-object v5, v5, Lslk;->i:Lkze;

    new-instance v10, Lc61;

    invoke-direct {v10, v3, v7}, Lc61;-><init>(Landroid/content/Context;B)V

    new-instance v7, Li3j;

    invoke-direct {v7, v10, v6, v9, v4}, Li3j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    move-object v4, v7

    move-object v7, v5

    new-instance v5, Leq6;

    invoke-direct {v5, v2}, Leq6;-><init>(Ljava/lang/Object;)V

    new-instance v6, Lni6;

    invoke-direct {v6, v3, v13}, Lni6;-><init>(Landroid/content/Context;Lumi;)V

    new-instance v2, Lo2g;

    const/16 v10, 0x1c

    invoke-direct/range {v2 .. v7}, Lo2g;-><init>(Lndc;Li3j;Leq6;Lni6;Lkze;)V

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v2

    iget-object v7, v2, Lslk;->i:Lkze;

    iget-object v2, v3, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v2, v2, Lqim;->c:Lz77;

    new-instance v4, Ldu3;

    invoke-direct {v4, v3, v0}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v0, v11, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->m:Lfx3;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v6

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    new-instance v9, Lumk;

    invoke-direct {v9, v3, v13, v14}, Lumk;-><init>(Landroid/content/Context;Lumi;B)V

    new-instance v14, Lw7j;

    invoke-direct {v14, v2, v4, v0, v5}, Lw7j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    new-instance v2, Lo2g;

    move-object v4, v9

    move-object v5, v14

    invoke-direct/range {v2 .. v7}, Lo2g;-><init>(Lndc;Lumk;Lw7j;Ljtg;Lkze;)V

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v2

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v4

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object v5

    new-instance v6, Lghf;

    new-instance v7, Lplk;

    invoke-direct {v7, v0, v2, v4}, Lplk;-><init>(Lydn;Lslk;Ldb;)V

    invoke-direct {v6, v3, v7, v5}, Lghf;-><init>(Lndc;Lplk;Lz77;)V

    new-instance v2, Ldfn;

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v4

    iget-object v0, v3, Ldx3;->o:Lqim;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v5, v0, Lqim;->c:Lz77;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v6, v0, Ld6j;->c:Lx5f;

    invoke-virtual {v8}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v0

    iget-object v7, v0, Lslk;->i:Lkze;

    move-object v9, v8

    new-instance v8, Lqt3;

    const/16 v0, 0x10

    invoke-direct {v8, v3, v0}, Lqt3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    const/16 v0, 0x11

    invoke-direct/range {v2 .. v8}, Ldfn;-><init>(Lndc;Lru9;Lz77;Lx5f;Lkze;Lqt3;)V

    goto :goto_412

    :cond_40e
    move v10, v4

    move-object v9, v8

    const/16 v0, 0x11

    :goto_412
    iget-object v2, v3, Lcom/opera/android/BrowserActivity;->C1:Lzyk;

    invoke-virtual {v2}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ll98;

    iget-object v4, v2, Ll98;->e:Lf1p;

    iget-object v4, v4, Lf1p;->b:Ljava/lang/Object;

    check-cast v4, Lplh;

    new-instance v5, Lvr;

    const/4 v6, 0x0

    invoke-direct {v5, v10, v6, v2}, Lvr;-><init>(BLmt5;Ljava/lang/Object;)V

    new-instance v7, Lz99;

    const/4 v8, 0x2

    invoke-direct {v7, v4, v5, v8}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    iget-object v4, v2, Ll98;->b:Lcom/opera/android/BrowserActivity;

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v17

    sget-object v18, Lqcc;->e:Lqcc;

    new-instance v16, Ls71;

    const/16 v21, 0xf

    move-object/from16 v20, v6

    move-object/from16 v19, v7

    invoke-direct/range {v16 .. v21}, Ls71;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Lmt5;B)V

    move-object/from16 v14, v20

    invoke-static/range {v16 .. v16}, Lf03;->g(Lkotlin/jvm/functions/Function2;)Lj94;

    move-result-object v5

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v6

    invoke-static {v6}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v6

    invoke-static {v5, v6}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    iget-object v5, v2, Ll98;->d:Lgq6;

    invoke-virtual {v5}, Lgq6;->a()Lf99;

    move-result-object v5

    new-instance v6, Lyc1;

    const/16 v7, 0xb

    invoke-direct {v6, v5, v7}, Lyc1;-><init>(Lf99;B)V

    new-instance v7, Lj98;

    const/4 v8, 0x0

    invoke-direct {v7, v2, v14, v8}, Lj98;-><init>(Ll98;Lmt5;B)V

    new-instance v8, Lz99;

    const/4 v10, 0x2

    invoke-direct {v8, v6, v7, v10}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v6

    invoke-static {v8, v6}, Lscd;->D(Lf99;Ltcc;)Lj94;

    move-result-object v6

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v7

    invoke-static {v7}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v7

    invoke-static {v6, v7}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    new-instance v6, Lj98;

    const/4 v7, 0x1

    invoke-direct {v6, v2, v14, v7}, Lj98;-><init>(Ll98;Lmt5;B)V

    new-instance v7, Lz99;

    invoke-direct {v7, v5, v6, v10}, Lz99;-><init>(Lf99;Lkotlin/jvm/functions/Function2;B)V

    iget-object v5, v2, Ll98;->h:Ljg8;

    invoke-static {v7, v5}, Lic4;->r(Lf99;Ldx5;)Lf99;

    move-result-object v5

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v6

    invoke-static {v6}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v6

    invoke-static {v5, v6}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    iget-object v5, v2, Ll98;->l:Ltw2;

    iget-object v5, v5, Ltw2;->b:Ljava/lang/Object;

    check-cast v5, Lg77;

    iget-object v5, v5, Lg77;->c:Ljava/lang/Object;

    check-cast v5, Lzyk;

    invoke-virtual {v5}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lf99;

    iget-object v6, v2, Ll98;->k:Llq6;

    iget-object v6, v6, Llq6;->a:Lip6;

    iget-object v6, v6, Lip6;->e:Lf99;

    new-instance v7, Lk98;

    invoke-direct {v7, v2, v14}, Lk98;-><init>(Ll98;Lmt5;)V

    new-instance v2, Lya9;

    const/4 v8, 0x0

    invoke-direct {v2, v5, v6, v7, v8}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v4}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {v4}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v4

    invoke-static {v2, v4}, Lj14;->Y(Lf99;Lnx5;)Ld3k;

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v2

    invoke-virtual {v2}, Lfqe;->b()Lp1c;

    move-result-object v2

    iget-boolean v4, v2, Lp1c;->r:Z

    if-nez v4, :cond_4d6

    const/4 v7, 0x1

    iput-boolean v7, v2, Lp1c;->r:Z

    invoke-virtual {v2}, Lp1c;->f()V

    :cond_4d6
    sget-object v2, Ldu1;->d:Ldu1;

    iget-object v4, v2, Ldu1;->b:Lf30;

    invoke-virtual {v4}, Ljava/lang/ThreadLocal;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Layl;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v2, Ldu1;->a:Li3j;

    const-string v4, "startup#ui"

    invoke-virtual {v2, v4}, Li3j;->p(Ljava/lang/String;)J

    iget-object v2, v11, Ltw3;->a:Lhx3;

    invoke-virtual {v2}, Lhx3;->p()Lcom/opera/android/Lazy;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lyl6;

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v4

    iget-object v4, v4, Ld6j;->c:Lx5f;

    iget-object v5, v2, Lyl6;->b:Lumi;

    new-instance v6, Lfh4;

    invoke-direct {v6, v2, v4, v0}, Lfh4;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {v5, v6}, Ltcl;->d(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    new-instance v2, Loml;

    invoke-direct {v2, v0}, Loml;-><init>(Lnml;)V

    sget-object v20, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    const/16 v21, 0x0

    const/16 v17, 0x0

    const-wide/16 v18, 0x5

    move-object/from16 v16, v2

    invoke-virtual/range {v16 .. v21}, Loml;->b(Ljava/lang/Object;JLjava/util/concurrent/TimeUnit;Ljri;)V

    iget-object v0, v9, Lcom/opera/android/OperaApplication;->B:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lvbg;

    iget-object v0, v2, Lvbg;->a:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v4, "snapshot"

    invoke-interface {v0, v4, v14}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    if-nez v0, :cond_534

    move-object v0, v14

    goto :goto_578

    :cond_534
    :try_start_534
    sget-object v5, Lt0i;->b:Lp0i;

    sget-object v5, Lvbg;->d:Lcrb;

    invoke-virtual {v5}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v6, Lxcg;->Companion:Ltcg;

    invoke-virtual {v6}, Ltcg;->serializer()Lkotlinx/serialization/KSerializer;

    move-result-object v6

    check-cast v6, Lkotlinx/serialization/KSerializer;

    invoke-virtual {v5, v0, v6}, Lrpb;->a(Ljava/lang/String;Lkotlinx/serialization/KSerializer;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lxcg;
    :try_end_549
    .catchall {:try_start_534 .. :try_end_549} :catchall_54a

    goto :goto_553

    :catchall_54a
    move-exception v0

    sget-object v5, Lt0i;->b:Lp0i;

    new-instance v5, Lq0i;

    invoke-direct {v5, v0}, Lq0i;-><init>(Ljava/lang/Throwable;)V

    move-object v0, v5

    :goto_553
    invoke-static {v0}, Lt0i;->d(Ljava/lang/Object;)Ljava/lang/Throwable;

    move-result-object v5

    if-eqz v5, :cond_56b

    iget-object v5, v2, Lvbg;->a:Lb59;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    invoke-interface {v5}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v4}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_56b
    instance-of v4, v0, Lq0i;

    if-eqz v4, :cond_572

    move-object/from16 v20, v14

    goto :goto_574

    :cond_572
    move-object/from16 v20, v0

    :goto_574
    check-cast v20, Lxcg;

    move-object/from16 v0, v20

    :goto_578
    if-eqz v0, :cond_57e

    const/4 v4, 0x0

    invoke-virtual {v2, v0, v4}, Lvbg;->a(Lxcg;Z)V

    :cond_57e
    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->i()Ljk5;

    move-result-object v0

    iget-object v0, v0, Ljk5;->b:Lode;

    new-instance v2, Lfk5;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->z0()Lz77;

    move-result-object v16

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->O()Leej;

    move-result-object v17

    iget-object v5, v11, Ltw3;->s:Lzv3;

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->t()Lr9c;

    move-result-object v18

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->F()Lcom/opera/android/PushedContentHandler;

    move-result-object v19

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v6

    iget-object v6, v6, Ld6j;->c:Lx5f;

    invoke-virtual {v9}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v7, v7, Ld6j;->d:Lx5f;

    iget-object v8, v11, Ltw3;->a:Lhx3;

    iget-object v8, v8, Lhx3;->a:Lxbf;

    iget-object v8, v8, Lxbf;->e:Ljava/lang/Object;

    move-object/from16 v20, v8

    check-cast v20, Lj4c;

    new-instance v4, Lli;

    move-object v8, v9

    const/4 v9, 0x0

    const/16 v10, 0xc

    move-object/from16 v21, v6

    const-class v6, Lcom/opera/android/OperaApplication;

    move-object/from16 v27, v7

    const-string v7, "pushedSpeedDialFavoriteRepository"

    move-object/from16 v28, v5

    move-object v5, v8

    const-string v8, "getPushedSpeedDialFavoriteRepository()Lcom/opera/android/favorites/data/PushedSpeedDialFavoriteRepository;"

    invoke-direct/range {v4 .. v10}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v24, v5

    move-object/from16 v25, v6

    move-object v5, v12

    new-instance v12, Lwv1;

    const/4 v7, 0x1

    invoke-direct {v12, v4, v7}, Lwv1;-><init>(Lb6h;B)V

    move-object v14, v5

    move v1, v7

    move-object/from16 v4, v16

    move-object/from16 v5, v17

    move-object/from16 v7, v18

    move-object/from16 v8, v19

    move-object/from16 v9, v21

    move-object/from16 v10, v27

    move-object/from16 v6, v28

    move-object/from16 v16, v15

    move-object v15, v11

    move-object/from16 v11, v20

    invoke-direct/range {v2 .. v12}, Lfk5;-><init>(Lt5d;Lz77;Leej;Lzv3;Lr9c;Lcom/opera/android/PushedContentHandler;Lx5f;Lx5f;Lcom/opera/android/Lazy;Lwv1;)V

    invoke-virtual {v0, v3, v2}, Lekc;->j(Lndc;Lf7f;)V

    invoke-static {v3}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    iget-object v2, v15, Ltw3;->a:Lhx3;

    invoke-virtual {v2}, Lhx3;->p()Lcom/opera/android/Lazy;

    move-result-object v2

    iget-object v4, v0, Lru9;->a:Landroid/content/SharedPreferences;

    const-string v5, "default_browser.first_set.timestamp"

    invoke-interface {v4, v5}, Landroid/content/SharedPreferences;->contains(Ljava/lang/String;)Z

    move-result v4

    if-nez v4, :cond_619

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lyl6;

    invoke-virtual {v4}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Ltl6;->a()Z

    move-result v4

    if-eqz v4, :cond_619

    invoke-interface {v3}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    new-instance v5, Lvl6;

    invoke-direct {v5, v13, v0, v2}, Lvl6;-><init>(Lumi;Lru9;Lcom/opera/android/Lazy;)V

    invoke-virtual {v4, v5}, Ltcc;->a(Lmdc;)V

    :cond_619
    iget-object v0, v15, Ltw3;->m:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lij3;

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v0, Lenf;

    invoke-direct {v0, v3}, Lenf;-><init>(Ldx3;)V

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    invoke-static {}, Li0l;->g()Z

    move-result v0

    const/16 v2, 0xe

    if-nez v0, :cond_72b

    new-instance v0, Lvl6;

    new-instance v4, Lli;

    const/4 v9, 0x0

    const/16 v10, 0xd

    const-string v7, "firebaseManager"

    const-string v8, "getFirebaseManager()Lcom/opera/android/firebase/FirebaseManager;"

    move-object/from16 v5, v24

    move-object/from16 v6, v25

    invoke-direct/range {v4 .. v10}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v6, Lwv1;

    invoke-direct {v6, v4, v1}, Lwv1;-><init>(Lb6h;B)V

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lk3i;

    invoke-direct {v0, v6, v4, v14}, Lvl6;-><init>(Lwv1;Lk3i;Lj4c;)V

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v0, Ld62;

    new-instance v4, Ldu3;

    const/16 v6, 0x16

    invoke-direct {v4, v3, v6}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v6, v5, Lcom/opera/android/OperaApplication;->F:Lj4c;

    const/16 v7, 0x9

    invoke-direct {v0, v4, v6, v7}, Ld62;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v0, Lju2;

    invoke-virtual {v14}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Ly3i;

    iget-object v6, v3, Lcom/opera/android/BrowserActivity;->l0:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lq82;

    const/4 v7, 0x5

    invoke-direct {v0, v4, v6, v7}, Lju2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    iget-object v0, v15, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->a:Lxbf;

    iget-object v0, v0, Lxbf;->e:Ljava/lang/Object;

    check-cast v0, Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lw6f;

    new-instance v4, Lu4j;

    invoke-direct {v4, v14}, Lu4j;-><init>(Lj4c;)V

    new-instance v6, Lvme;

    const/16 v7, 0x13

    invoke-direct {v6, v7}, Lvme;-><init>(B)V

    invoke-static {v0, v3, v4, v6}, Laib;->B(Lw6f;Lndc;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;)V

    iget-object v0, v15, Ltw3;->k0:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    iget-object v0, v5, Lcom/opera/android/OperaApplication;->H:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    new-instance v0, Ld62;

    iget-object v4, v15, Ltw3;->a:Lhx3;

    invoke-virtual {v4}, Lhx3;->p()Lcom/opera/android/Lazy;

    move-result-object v4

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lyl6;

    const/4 v5, 0x4

    invoke-direct {v0, v4, v14, v5}, Ld62;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->l1(Llim;)V

    new-instance v0, Lshf;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual/range {v16 .. v16}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lk3i;

    new-instance v7, Lu4h;

    const/16 v8, 0x14

    invoke-direct {v7, v8}, Lu4h;-><init>(B)V

    const-string v8, "eula_accepted.gdpr"

    invoke-static {v4, v8, v7}, Luyg;->e(Lcom/opera/android/settings/SettingsManager;Ljava/lang/String;Lkotlin/jvm/functions/Function1;)Ltsd;

    move-result-object v4

    invoke-virtual {v6}, Lk3i;->a()Likc;

    move-result-object v6

    invoke-interface {v3}, Lndc;->getLifecycle()Ltcc;

    move-result-object v7

    invoke-static {v7}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v7

    invoke-direct {v0}, Ljava/lang/Object;-><init>()V

    iput-object v14, v0, Lshf;->a:Ljava/lang/Object;

    iput-object v7, v0, Lshf;->b:Ljava/lang/Object;

    sget-object v7, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    new-instance v8, Lrag;

    const/16 v9, 0x17

    invoke-direct {v8, v9}, Lrag;-><init>(B)V

    invoke-static {v7, v6, v4, v8}, Lxf8;->Y(Ljava/lang/Object;Lekc;Lekc;Lkotlin/jvm/functions/Function2;)Lwnm;

    move-result-object v4

    invoke-static {v4}, Lxf8;->B(Likc;)Ltsd;

    move-result-object v4

    new-instance v6, Lqzg;

    invoke-direct {v6, v0, v5}, Lqzg;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v3, v6}, Lekc;->j(Lndc;Lf7f;)V

    new-instance v0, Ll5b;

    iget-object v4, v15, Ltw3;->a:Lhx3;

    iget-object v4, v4, Lhx3;->a:Lxbf;

    iget-object v4, v4, Lxbf;->g:Ljava/lang/Object;

    check-cast v4, Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lx4i;

    invoke-virtual {v3}, Lcom/opera/android/BrowserActivity;->Q0()Lqln;

    move-result-object v6

    const/16 v7, 0x8

    invoke-direct {v0, v7}, Ll5b;-><init>(B)V

    iget-object v4, v4, Lx4i;->h:Lode;

    new-instance v7, Lvvf;

    invoke-direct {v7, v0, v6, v2}, Lvvf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v0, Lw4i;

    invoke-direct {v0, v7, v1}, Lw4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v3, v0}, Lekc;->j(Lndc;Lf7f;)V

    goto :goto_72c

    :cond_72b
    const/4 v5, 0x4

    :goto_72c
    invoke-virtual/range {v23 .. v23}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llz6;

    new-instance v4, Ll45;

    new-instance v6, Ls6h;

    invoke-virtual {v0}, Llz6;->a()Lpad;

    move-result-object v7

    invoke-virtual {v0}, Llz6;->c()Lft6;

    move-result-object v8

    const/4 v14, 0x0

    invoke-direct {v6, v7, v8, v14}, Ls6h;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    iget-object v0, v0, Llz6;->n:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldq6;

    invoke-direct {v4, v14, v3, v6, v0}, Ll45;-><init>(ZLjava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    invoke-virtual {v4}, Ll45;->L()V

    invoke-virtual/range {v23 .. v23}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llz6;

    invoke-interface {v3}, Lndc;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-static {v4}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v7

    new-instance v6, Lga6;

    invoke-virtual {v0}, Llz6;->a()Lpad;

    move-result-object v8

    invoke-virtual {v0}, Llz6;->b()Lwx6;

    move-result-object v9

    new-instance v10, Lole;

    invoke-virtual {v0}, Llz6;->c()Lft6;

    move-result-object v4

    invoke-direct {v10, v4}, Lole;-><init>(Ljava/lang/Object;)V

    new-instance v11, Lxm5;

    iget-object v0, v0, Llz6;->i:Lzyk;

    invoke-virtual {v0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lau6;

    invoke-direct {v11, v0}, Lxm5;-><init>(Ljava/lang/Object;)V

    invoke-direct/range {v6 .. v11}, Lga6;-><init>(Lddc;Lpad;Lwx6;Lole;Lxm5;)V

    iget-object v4, v4, Lft6;->c:Lyc1;

    iget-object v0, v0, Lau6;->e:Lyc1;

    new-instance v9, Lkm4;

    const/4 v10, 0x3

    const/4 v14, 0x0

    invoke-direct {v9, v10, v14, v5}, Lkm4;-><init>(ILmt5;B)V

    new-instance v11, Lya9;

    const/4 v12, 0x0

    invoke-direct {v11, v4, v0, v9, v12}, Lya9;-><init>(Lf99;Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v8}, Lpad;->k()Lf99;

    move-result-object v0

    new-instance v4, Lzp6;

    const/4 v8, 0x5

    invoke-direct {v4, v8, v14, v11}, Lzp6;-><init>(BLmt5;Ljava/lang/Object;)V

    invoke-static {v0, v4}, Lma9;->b(Lf99;Lcr9;)Lbs4;

    move-result-object v0

    invoke-static {v0}, Lqbe;->t(Lf99;)Lf99;

    move-result-object v0

    new-instance v4, Ltx6;

    invoke-direct {v4, v6, v14}, Ltx6;-><init>(Lga6;Lmt5;)V

    invoke-static {v0, v7, v4}, Lw7d;->i(Lf99;Lnx5;Lkotlin/jvm/functions/Function2;)Ld3k;

    const-string v0, "Initialized"

    invoke-virtual {v3, v0}, Lcom/opera/android/BrowserActivity;->q1(Ljava/lang/String;)V

    new-instance v4, Ld5o;

    invoke-virtual {v3}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v0

    invoke-virtual {v3}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v6

    const v7, 0x7f1410aa

    invoke-virtual {v6, v7}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-direct {v4}, Ljava/lang/Object;-><init>()V

    iput-object v3, v4, Ld5o;->c:Ljava/lang/Object;

    iput-object v6, v4, Ld5o;->a:Ljava/lang/Object;

    iget-object v0, v0, Lcom/opera/android/browser/BrowserFragment;->f:Lrc6;

    iget-object v0, v0, Lrc6;->a:Ljava/util/HashMap;

    invoke-virtual {v0}, Ljava/util/HashMap;->keySet()Ljava/util/Set;

    move-result-object v0

    iput-object v0, v4, Ld5o;->b:Ljava/lang/Object;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    if-nez v0, :cond_7d9

    const/4 v6, 0x0

    goto :goto_7da

    :cond_7d9
    move-object v6, v0

    :goto_7da
    new-instance v0, Lc5o;

    const/4 v7, 0x6

    invoke-direct {v0, v3, v7}, Lc5o;-><init>(Landroid/content/Context;B)V

    sget-object v7, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    invoke-virtual {v3}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v8

    iget-object v8, v8, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    iget-object v9, v6, Ljl6;->d:Ljava/lang/Object;

    check-cast v9, Landroid/content/Context;

    iget-object v11, v6, Ljl6;->e:Ljava/lang/Object;

    check-cast v11, Lb59;

    const-string v12, "phase"

    invoke-virtual {v6, v12}, Ljl6;->l(Ljava/lang/String;)I

    move-result v12

    iput v12, v6, Ljl6;->b:I

    const-string v12, "previous_phase"

    invoke-virtual {v6, v12}, Ljl6;->l(Ljava/lang/String;)I

    move-result v14

    iput v14, v6, Ljl6;->c:I

    iget v14, v6, Ljl6;->b:I

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, Landroid/content/SharedPreferences;

    invoke-interface {v15}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v15

    invoke-static {v14}, Lvep;->A(I)I

    move-result v14

    invoke-interface {v15, v12, v14}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v15}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {v6, v1}, Ljl6;->q(I)V

    iget v1, v6, Ljl6;->b:I

    const/4 v12, 0x2

    if-eq v1, v12, :cond_820

    if-ne v1, v5, :cond_826

    :cond_820
    iget v1, v6, Ljl6;->c:I

    if-eq v1, v12, :cond_828

    if-eq v1, v5, :cond_828

    :cond_826
    const/4 v1, 0x0

    goto :goto_829

    :cond_828
    const/4 v1, 0x1

    :goto_829
    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v14

    check-cast v14, Landroid/content/SharedPreferences;

    const-string v15, "discard_session_at_startup"

    const/4 v2, 0x0

    invoke-interface {v14, v15, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v14

    if-eqz v14, :cond_839

    const/4 v1, 0x1

    :cond_839
    const-string v14, "using_session_db"

    const-string v10, "appstate.bin"

    if-eqz v1, :cond_860

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v16

    check-cast v16, Landroid/content/SharedPreferences;

    invoke-interface/range {v16 .. v16}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v5

    invoke-interface {v5, v15, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v5}, Landroid/content/SharedPreferences$Editor;->commit()Z

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Landroid/content/SharedPreferences;

    const/4 v15, 0x0

    invoke-interface {v5, v14, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v5

    if-nez v5, :cond_861

    invoke-virtual {v9, v10}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    goto :goto_861

    :cond_860
    const/4 v15, 0x0

    :cond_861
    :goto_861
    if-nez v1, :cond_9c4

    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    invoke-interface {v1, v14, v15}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v1

    if-nez v1, :cond_988

    invoke-virtual {v9, v10}, Landroid/content/Context;->getFileStreamPath(Ljava/lang/String;)Ljava/io/File;

    move-result-object v1

    invoke-virtual {v1}, Ljava/io/File;->exists()Z

    move-result v1

    if-eqz v1, :cond_97e

    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Lcom/opera/android/browser/SessionStore;->a(Z)V

    :try_start_87d
    invoke-virtual {v6, v12}, Ljl6;->q(I)V

    new-instance v15, Ljava/io/DataInputStream;

    new-instance v2, Ljava/io/BufferedInputStream;

    invoke-virtual {v9, v10}, Landroid/content/Context;->openFileInput(Ljava/lang/String;)Ljava/io/FileInputStream;

    move-result-object v12

    invoke-direct {v2, v12}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v15, v2}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_88e
    .catch Ljava/io/IOException; {:try_start_87d .. :try_end_88e} :catch_8a6
    .catchall {:try_start_87d .. :try_end_88e} :catchall_8a1

    :try_start_88e
    invoke-static {v15, v4, v0}, Lcom/opera/android/browser/SessionRestore$State;->a(Ljava/io/DataInputStream;Ld5o;Lc5o;)Lcom/opera/android/browser/SessionRestore$State;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/browser/SessionRestore$State;->b:Ln9g;
    :try_end_894
    .catch Ljava/io/IOException; {:try_start_88e .. :try_end_894} :catch_89d
    .catchall {:try_start_88e .. :try_end_894} :catchall_898

    invoke-static {v15}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_8b5

    :catchall_898
    move-exception v0

    move-object/from16 v20, v15

    goto/16 :goto_97a

    :catch_89d
    move-exception v0

    move-object/from16 v20, v15

    goto :goto_8a9

    :catchall_8a1
    move-exception v0

    const/16 v20, 0x0

    goto/16 :goto_97a

    :catch_8a6
    move-exception v0

    const/16 v20, 0x0

    :goto_8a9
    :try_start_8a9
    invoke-static {v0}, Lks3;->D(Ljava/lang/Throwable;)V

    invoke-static {}, Lcom/opera/android/browser/SessionRestore$State;->b()Lcom/opera/android/browser/SessionRestore$State;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/browser/SessionRestore$State;->b:Ln9g;
    :try_end_8b2
    .catchall {:try_start_8a9 .. :try_end_8b2} :catchall_979

    invoke-static/range {v20 .. v20}, Lxvg;->l(Ljava/io/Closeable;)V

    :goto_8b5
    iget-object v2, v0, Ln9g;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/List;

    new-instance v12, Ljava/util/HashSet;

    invoke-direct {v12}, Ljava/util/HashSet;-><init>()V

    iget-object v8, v8, Lxbf;->b:Ljava/lang/Object;

    check-cast v8, Lvzk;

    iget-object v8, v8, Lvzk;->a:Ljava/lang/Object;

    check-cast v8, Lb59;

    sget-object v15, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    move-object/from16 v16, v2

    iget-wide v1, v15, Lcom/opera/android/browser/SessionStore;->a:J

    const/4 v15, 0x0

    invoke-static {v1, v2, v15, v8}, LJ/N;->MRAgGFuI(JZLjava/lang/Object;)I

    move-result v1

    invoke-interface/range {v16 .. v16}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    const/high16 v8, -0x80000000

    :goto_8d7
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v15

    if-eqz v15, :cond_945

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v15

    check-cast v15, La9l;

    invoke-interface {v15}, La9l;->j()I

    move-result v5

    move-object/from16 v20, v2

    if-ltz v5, :cond_8f1

    invoke-interface {v15}, La9l;->d()I

    move-result v2

    if-lt v5, v2, :cond_8f4

    :cond_8f1
    move v5, v1

    const/4 v15, 0x0

    goto :goto_93c

    :cond_8f4
    invoke-interface {v15}, La9l;->m()I

    move-result v2

    const/high16 v5, -0x80000000

    if-eq v2, v5, :cond_934

    if-gt v2, v1, :cond_934

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    invoke-virtual {v12, v5}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v5

    if-nez v5, :cond_910

    const-string v2, "Skipping tab state with duplicated tab id"

    const/4 v5, 0x0

    invoke-static {v2, v5}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    move v5, v1

    goto :goto_941

    :cond_910
    check-cast v15, Lcom/opera/android/browser/BrowserTabState;

    move v5, v1

    move/from16 v21, v2

    iget-wide v1, v7, Lcom/opera/android/browser/SessionStore;->a:J

    iget v8, v15, Lcom/opera/android/browser/BrowserTabState;->a:I

    move-wide/from16 v24, v1

    iget v1, v15, Lcom/opera/android/browser/BrowserTabState;->b:I

    iget-object v2, v15, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v28

    move/from16 v27, v1

    move/from16 v26, v8

    move-object/from16 v29, v15

    const/16 v30, 0x0

    invoke-static/range {v24 .. v30}, LJ/N;->MyMrKhmY(JIIILjava/lang/Object;Z)V

    move v1, v5

    move-object/from16 v2, v20

    move/from16 v8, v21

    goto :goto_8d7

    :cond_934
    move v5, v1

    const-string v1, "Skipping tab state with invalid tab id"

    const/4 v15, 0x0

    invoke-static {v1, v15}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    goto :goto_941

    :goto_93c
    const-string v1, "Skipping tab state with current entry index out of range"

    invoke-static {v1, v15}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :goto_941
    move v1, v5

    move-object/from16 v2, v20

    goto :goto_8d7

    :cond_945
    const/4 v2, 0x0

    const/4 v15, 0x0

    iget v0, v0, Ln9g;->a:I

    move-object/from16 v1, v16

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La9l;

    invoke-interface {v0}, La9l;->m()I

    move-result v0

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v12, v1}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v1

    if-nez v1, :cond_967

    const-string v0, "Migrated state has dangling active tab"

    invoke-static {v0, v15}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :goto_964
    const/high16 v5, -0x80000000

    goto :goto_969

    :cond_967
    move v8, v0

    goto :goto_964

    :goto_969
    if-eq v8, v5, :cond_970

    iget-wide v0, v7, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1, v8}, LJ/N;->MvqRhr_p(JI)V

    :cond_970
    const-string v0, "appstate.bin.tmp"

    invoke-virtual {v9, v0}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    invoke-virtual {v9, v10}, Landroid/content/Context;->deleteFile(Ljava/lang/String;)Z

    goto :goto_97e

    :catchall_979
    move-exception v0

    :goto_97a
    invoke-static/range {v20 .. v20}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :cond_97e
    :goto_97e
    invoke-virtual {v11}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const/4 v1, 0x1

    invoke-static {v0, v14, v1}, Lcom/appsflyer/internal/j;->d(Landroid/content/SharedPreferences;Ljava/lang/String;Z)V

    :cond_988
    iget-wide v0, v7, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {v0, v1}, LJ/N;->McBHMtVd(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/browser/SessionRestore$State;

    iget v1, v6, Ljl6;->b:I

    const/4 v8, 0x2

    if-eq v1, v8, :cond_998

    const/4 v5, 0x4

    if-ne v1, v5, :cond_9c1

    :cond_998
    iget-object v5, v0, Lcom/opera/android/browser/SessionRestore$State;->b:Ln9g;

    const/4 v7, 0x1

    iput-byte v7, v5, Ln9g;->b:B

    sget-object v5, Ljava/util/Locale;->US:Ljava/util/Locale;

    packed-switch v1, :pswitch_data_b36

    const-string v1, "null"

    goto :goto_9b6

    :pswitch_9a5
    const-string v1, "NOT_RUNNING"

    goto :goto_9b6

    :pswitch_9a8
    const-string v1, "RUNNING"

    goto :goto_9b6

    :pswitch_9ab
    const-string v1, "RESTORE_STATE"

    goto :goto_9b6

    :pswitch_9ae
    const-string v1, "LOADED"

    goto :goto_9b6

    :pswitch_9b1
    const-string v1, "DESERIALIZE"

    goto :goto_9b6

    :pswitch_9b4
    const-string v1, "INITIALIZE"

    :goto_9b6
    const-string v5, "Last phase: "

    invoke-virtual {v5, v1}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    const-string v5, "SessionRestore fail"

    invoke-static {v5, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    :cond_9c1
    const/4 v1, 0x1

    :goto_9c2
    const/4 v10, 0x3

    goto :goto_9cd

    :cond_9c4
    const/4 v1, 0x1

    invoke-virtual {v7, v1}, Lcom/opera/android/browser/SessionStore;->a(Z)V

    invoke-static {}, Lcom/opera/android/browser/SessionRestore$State;->b()Lcom/opera/android/browser/SessionRestore$State;

    move-result-object v0

    goto :goto_9c2

    :goto_9cd
    invoke-virtual {v6, v10}, Ljl6;->q(I)V

    move-object/from16 v5, p0

    iput-object v0, v5, Lou3;->g:Lcom/opera/android/browser/SessionRestore$State;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->C:Lfnh;

    if-nez v0, :cond_9d9

    const/4 v0, 0x0

    :cond_9d9
    invoke-virtual {v3}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v5

    iget-object v5, v5, Lcom/opera/android/browser/BrowserFragment;->h:Lxbf;

    iget-object v6, v0, Lfnh;->a:Lcom/opera/android/BrowserActivity;

    iget-object v7, v0, Lfnh;->b:Lb59;

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Landroid/content/SharedPreferences;

    const-string v9, "recently_closed_migrated"

    invoke-interface {v8, v9, v2}, Landroid/content/SharedPreferences;->getBoolean(Ljava/lang/String;Z)Z

    move-result v10

    if-eqz v10, :cond_9f5

    move-object/from16 v16, v3

    goto/16 :goto_b22

    :cond_9f5
    iget-object v5, v5, Lxbf;->b:Ljava/lang/Object;

    check-cast v5, Lvzk;

    iget-object v5, v5, Lvzk;->a:Ljava/lang/Object;

    check-cast v5, Lb59;

    sget-object v10, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-wide v10, v10, Lcom/opera/android/browser/SessionStore;->a:J

    const/4 v14, 0x0

    invoke-static {v10, v11, v14, v5}, LJ/N;->MRAgGFuI(JZLjava/lang/Object;)I

    move-result v5

    invoke-virtual {v7}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Landroid/content/SharedPreferences;

    invoke-interface {v7}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v7

    const/16 v10, 0xe

    :goto_a12
    const-string v11, "/recently_closed_tabs"

    if-ltz v10, :cond_aeb

    new-instance v12, Ljava/lang/StringBuilder;

    const-string v14, "recently_closed_tabs_item_tab_id_"

    invoke-direct {v12, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v12, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v12}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v12

    const/high16 v15, -0x80000000

    invoke-interface {v8, v12, v15}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v12

    if-eq v12, v15, :cond_aa9

    if-gt v12, v5, :cond_aa9

    new-instance v1, Ljava/io/File;

    new-instance v2, Ljava/io/File;

    new-instance v15, Ljava/lang/StringBuilder;

    invoke-direct {v15}, Ljava/lang/StringBuilder;-><init>()V

    move-object/from16 v16, v3

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v15, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v15, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v15}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-direct {v2, v3}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    const-string v3, "state"

    invoke-static {v12, v3}, Lsko;->i(ILjava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-direct {v1, v2, v3}, Ljava/io/File;-><init>(Ljava/io/File;Ljava/lang/String;)V

    :try_start_a53
    new-instance v2, Ljava/io/FileInputStream;

    invoke-direct {v2, v1}, Ljava/io/FileInputStream;-><init>(Ljava/io/File;)V

    new-instance v1, Ljava/io/DataInputStream;

    new-instance v3, Ljava/io/BufferedInputStream;

    invoke-direct {v3, v2}, Ljava/io/BufferedInputStream;-><init>(Ljava/io/InputStream;)V

    invoke-direct {v1, v3}, Ljava/io/DataInputStream;-><init>(Ljava/io/InputStream;)V
    :try_end_a62
    .catch Ljava/io/IOException; {:try_start_a53 .. :try_end_a62} :catch_aa0
    .catchall {:try_start_a53 .. :try_end_a62} :catchall_a99

    const/4 v15, 0x0

    :try_start_a63
    invoke-static {v1, v4, v15}, Lcom/opera/android/browser/BrowserTabState;->b(Ljava/io/DataInputStream;Ld5o;Lc5o;)Lcom/opera/android/browser/BrowserTabState;

    move-result-object v2

    iget-object v3, v0, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    iget-wide v11, v3, Lcom/opera/android/browser/SessionStore;->a:J

    iget v3, v2, Lcom/opera/android/browser/BrowserTabState;->a:I

    iget v15, v2, Lcom/opera/android/browser/BrowserTabState;->b:I
    :try_end_a6f
    .catch Ljava/io/IOException; {:try_start_a63 .. :try_end_a6f} :catch_a95
    .catchall {:try_start_a63 .. :try_end_a6f} :catchall_a93

    move-object/from16 v19, v0

    :try_start_a71
    iget-object v0, v2, Lcom/opera/android/browser/BrowserTabState;->c:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v28
    :try_end_a77
    .catch Ljava/io/IOException; {:try_start_a71 .. :try_end_a77} :catch_a97
    .catchall {:try_start_a71 .. :try_end_a77} :catchall_a93

    move-object/from16 v29, v2

    move/from16 v26, v3

    move-wide/from16 v24, v11

    move/from16 v27, v15

    const/16 v30, 0x1

    :try_start_a81
    invoke-static/range {v24 .. v30}, LJ/N;->MyMrKhmY(JIIILjava/lang/Object;Z)V
    :try_end_a84
    .catch Ljava/io/IOException; {:try_start_a81 .. :try_end_a84} :catch_a8a
    .catchall {:try_start_a81 .. :try_end_a84} :catchall_a93

    move/from16 v2, v30

    invoke-static {v1}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_aae

    :catch_a8a
    move/from16 v2, v30

    goto :goto_a90

    :goto_a8d
    move-object/from16 v20, v1

    goto :goto_a9c

    :goto_a90
    move-object/from16 v20, v1

    goto :goto_aa5

    :catchall_a93
    move-exception v0

    goto :goto_a8d

    :catch_a95
    move-object/from16 v19, v0

    :catch_a97
    const/4 v2, 0x1

    goto :goto_a90

    :catchall_a99
    move-exception v0

    const/16 v20, 0x0

    :goto_a9c
    invoke-static/range {v20 .. v20}, Lxvg;->l(Ljava/io/Closeable;)V

    throw v0

    :catch_aa0
    move-object/from16 v19, v0

    const/4 v2, 0x1

    const/16 v20, 0x0

    :goto_aa5
    invoke-static/range {v20 .. v20}, Lxvg;->l(Ljava/io/Closeable;)V

    goto :goto_aae

    :cond_aa9
    move-object/from16 v19, v0

    move v2, v1

    move-object/from16 v16, v3

    :goto_aae
    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "recently_closed_tabs_item_title_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    new-instance v0, Ljava/lang/StringBuilder;

    const-string v1, "recently_closed_tabs_item_url_"

    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    new-instance v0, Ljava/lang/StringBuilder;

    invoke-direct {v0, v14}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0, v10}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v0

    invoke-interface {v7, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->commit()Z

    add-int/lit8 v10, v10, -0x1

    move v1, v2

    move-object/from16 v3, v16

    move-object/from16 v0, v19

    goto/16 :goto_a12

    :cond_aeb
    move v2, v1

    move-object/from16 v16, v3

    new-instance v0, Ljava/io/File;

    new-instance v1, Ljava/lang/StringBuilder;

    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    invoke-virtual {v6}, Landroid/content/Context;->getFilesDir()Ljava/io/File;

    move-result-object v3

    invoke-virtual {v1, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/Object;)Ljava/lang/StringBuilder;

    invoke-virtual {v1, v11}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    invoke-direct {v0, v1}, Ljava/io/File;-><init>(Ljava/lang/String;)V

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v1

    if-eqz v1, :cond_b1c

    invoke-virtual {v0}, Ljava/io/File;->listFiles()[Ljava/io/File;

    move-result-object v0

    array-length v1, v0

    const/4 v5, 0x0

    :goto_b12
    if-ge v5, v1, :cond_b1c

    aget-object v3, v0, v5

    invoke-virtual {v3}, Ljava/io/File;->delete()Z

    add-int/lit8 v5, v5, 0x1

    goto :goto_b12

    :cond_b1c
    invoke-interface {v7, v9, v2}, Landroid/content/SharedPreferences$Editor;->putBoolean(Ljava/lang/String;Z)Landroid/content/SharedPreferences$Editor;

    invoke-interface {v7}, Landroid/content/SharedPreferences$Editor;->apply()V

    :goto_b22
    new-instance v0, Lc9d;

    invoke-virtual/range {v16 .. v16}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    const/4 v14, 0x0

    invoke-direct {v0, v1, v14}, Lc9d;-><init>(Landroid/content/Context;B)V

    invoke-interface {v13, v0}, Ltcl;->c(Ljava/lang/Runnable;)Lnml;

    move-result-object v0

    const/4 v14, 0x0

    invoke-virtual {v0, v14}, Lnml;->a(Ljava/lang/Object;)Loml;

    return-void

    nop

    :pswitch_data_b36
    .packed-switch 0x1
        :pswitch_9b4
        :pswitch_9b1
        :pswitch_9ae
        :pswitch_9ab
        :pswitch_9a8
        :pswitch_9a5
    .end packed-switch
.end method

.method public final onDestroy(Lndc;)V
    .registers 12

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    invoke-virtual {p1, p0}, Ltcc;->b(Lmdc;)V

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p0, p0, Lou3;->i:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->O0:Lev3;

    iget-object v1, p0, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    check-cast p1, Lcom/opera/android/OperaApplication;

    iget-object v2, p1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->D:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lag7;

    const/4 v3, 0x0

    if-eqz v2, :cond_2a

    iget-object v4, p0, Lcom/opera/android/BrowserActivity;->R0:Lcv3;

    iget-object v5, v2, Lag7;->e:Lcv3;

    if-ne v5, v4, :cond_2a

    iput-object v3, v2, Lag7;->e:Lcv3;

    :cond_2a
    iget-object v2, p1, Lcom/opera/android/OperaApplication;->m:Lcbk;

    iget-object v4, p0, Lcom/opera/android/BrowserActivity;->M0:Luu3;

    iget-object v5, v2, Lcbk;->c:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/BrowserActivity;

    if-ne v5, p0, :cond_3b

    iput-object v3, v2, Lcbk;->c:Ljava/lang/Object;

    iput-object v3, v2, Lcbk;->d:Ljava/lang/Object;

    invoke-static {v4}, Lac8;->d(Ljava/lang/Object;)V

    :cond_3b
    sget-object v2, Lhj;->a:Li7f;

    invoke-virtual {v2, v0}, Li7f;->c(Ljava/lang/Object;)Z

    sget-object v2, Llx3;->a:Li7f;

    invoke-virtual {v2, v0}, Li7f;->c(Ljava/lang/Object;)Z

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v0

    iget-object v2, v0, Lydn;->l:Landroid/content/Context;

    iget-object v4, v0, Lydn;->z:Lvy;

    iput-object v3, v0, Lydn;->L:Lpt3;

    iput-object v3, v0, Lydn;->P:Lw7j;

    iget-wide v5, v0, Lydn;->j:J

    const-wide/16 v7, 0x0

    cmp-long v9, v5, v7

    if-eqz v9, :cond_5e

    invoke-static {v5, v6}, LJ/N;->MGPkZqxB(J)V

    iput-wide v7, v0, Lydn;->j:J

    :cond_5e
    iget-object v5, v0, Lydn;->g:Li9c;

    iget-object v6, v5, Li9c;->g:Ljava/lang/Object;

    check-cast v6, Lgkj;

    if-eqz v6, :cond_6b

    sget-object v7, Lhjm;->b:Lhjm;

    invoke-interface {v6, v7}, Ljjm;->finish(Lhjm;)V

    :cond_6b
    iput-object v3, v5, Li9c;->f:Ljava/lang/Object;

    iget-object v5, v0, Lydn;->m:Lcom/opera/android/settings/SettingsManager;

    iget-object v6, v0, Lydn;->C:Lj25;

    invoke-virtual {v5, v6}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v5, v0, Lydn;->o:Lufn;

    invoke-virtual {v5, v4}, Lno7;->p(Lmo7;)V

    iget-object v5, v0, Lydn;->p:Ltvg;

    invoke-virtual {v5, v4}, Lno7;->p(Lmo7;)V

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v4

    iget-object v5, v0, Lydn;->y:Lkv1;

    invoke-virtual {v4, v5}, Lq6e;->m(Lkri;)V

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v4, v0, Lydn;->D:Lx53;

    invoke-virtual {v2, v4}, Lru9;->d(Ln1;)V

    iput-object v3, v0, Lydn;->i:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->T()Lyen;

    move-result-object v0

    iget-object v2, v0, Lyen;->l:Lcom/opera/android/BrowserActivity;

    if-eqz v2, :cond_ab

    invoke-static {v2}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v2

    iget-object v4, v0, Lyen;->k:Lx53;

    invoke-virtual {v2, v4}, Lru9;->d(Ln1;)V

    iput-object v3, v0, Lyen;->l:Lcom/opera/android/BrowserActivity;

    :cond_ab
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->P0:Lgu3;

    if-eqz v0, :cond_b4

    invoke-static {v0}, Lac8;->d(Ljava/lang/Object;)V

    iput-object v3, p0, Lcom/opera/android/BrowserActivity;->P0:Lgu3;

    :cond_b4
    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v0

    iget-object v2, v0, Lfqe;->j:Lndc;

    if-ne v2, p0, :cond_d2

    invoke-interface {v2}, Lndc;->getLifecycle()Ltcc;

    move-result-object v2

    iget-object v4, v0, Lfqe;->h:Lob;

    invoke-virtual {v2, v4}, Ltcc;->b(Lmdc;)V

    iget-object v4, v0, Lfqe;->c:Luqe;

    if-eqz v4, :cond_d0

    iget-object v4, v4, Luqe;->y:Lob;

    if-eqz v4, :cond_d0

    invoke-virtual {v2, v4}, Ltcc;->b(Lmdc;)V

    :cond_d0
    iput-object v3, v0, Lfqe;->j:Lndc;

    :cond_d2
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->T:Ld5k;

    if-nez v0, :cond_d7

    move-object v0, v3

    :cond_d7
    iget-boolean v2, v0, Ld5k;->a:Z

    if-nez v2, :cond_107

    const/4 v2, 0x1

    iput-boolean v2, v0, Ld5k;->a:Z

    iget-object v2, v0, Ld5k;->b:Lm4k;

    iget-object v2, v2, Ln1;->b:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/Lazy;

    new-instance v4, Lvk2;

    const/4 v5, 0x4

    invoke-direct {v4, v5}, Lvk2;-><init>(B)V

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v2

    if-eqz v2, :cond_f3

    invoke-virtual {v4, v2}, Lvk2;->run(Ljava/lang/Object;)V

    :cond_f3
    iget-object v0, v0, Ld5k;->c:Lm4k;

    iget-object v0, v0, Ln1;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/Lazy;

    new-instance v2, Lvk2;

    invoke-direct {v2, v5}, Lvk2;-><init>(B)V

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_107

    invoke-virtual {v2, v0}, Lvk2;->run(Ljava/lang/Object;)V

    :cond_107
    iget-object v0, v1, Ltw3;->a:Lhx3;

    invoke-virtual {v0}, Lhx3;->z()Lcom/opera/android/Lazy;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lm8l;

    iget-object v2, p0, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-nez v2, :cond_118

    move-object v2, v3

    :cond_118
    iget-object v4, v0, Lm8l;->c:Lk6l;

    if-eqz v4, :cond_128

    iput-object v3, v0, Lm8l;->c:Lk6l;

    invoke-virtual {v2, v0}, Lk6l;->x(Lj6l;)V

    iget-object v4, v0, Lm8l;->b:Lq6l;

    invoke-virtual {v2, v4}, Lk6l;->v(La2l;)V

    iput-object v3, v0, Lm8l;->a:Landroid/content/Context;

    :cond_128
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->U0:Lpyl;

    iget-object v2, v0, Lpyl;->d:Ljava/lang/Object;

    check-cast v2, Lk6l;

    if-eqz v2, :cond_13b

    iget-object v4, v0, Lpyl;->f:Ljava/lang/Object;

    check-cast v4, Lf6l;

    if-eqz v4, :cond_13b

    invoke-virtual {v2, v4}, Lk6l;->x(Lj6l;)V

    iput-object v3, v0, Lpyl;->f:Ljava/lang/Object;

    :cond_13b
    iput-object v3, v0, Lpyl;->d:Ljava/lang/Object;

    iget-object v2, v0, Lpyl;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/LoadingView;

    if-eqz v2, :cond_148

    invoke-virtual {v2, v3}, Lcom/opera/android/LoadingView;->b(Ltah;)V

    iput-object v3, v0, Lpyl;->c:Ljava/lang/Object;

    :cond_148
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->V0:Ligi;

    if-eqz v0, :cond_157

    iget-object v2, v0, Ligi;->e:Ljava/lang/Object;

    check-cast v2, Lrf7;

    iget-object v0, v0, Ligi;->f:Ljava/lang/Object;

    check-cast v0, Lag;

    invoke-virtual {v2, v0}, Lrf7;->u(Lqf7;)V

    :cond_157
    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->b1:Lsjh;

    if-eqz v0, :cond_169

    iget-object v2, v0, Lsjh;->h:Lxi5;

    iget-object v4, v0, Lsjh;->j:Lrjh;

    iget-object v2, v2, Lxi5;->i:Lh7f;

    invoke-virtual {v2, v4}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, v0, Lsjh;->b:Lk6l;

    invoke-virtual {v0, v4}, Lk6l;->v(La2l;)V

    :cond_169
    iput-object v3, p0, Lcom/opera/android/BrowserActivity;->b1:Lsjh;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->Y:Lm6m;

    if-eqz v0, :cond_18b

    iget-object v2, v0, Lm6m;->i:Lq6e;

    iget-object v4, v0, Lm6m;->o:Lkv1;

    invoke-virtual {v2, v4}, Lq6e;->m(Lkri;)V

    iget-object v2, v0, Lm6m;->j:Lcom/opera/android/settings/SettingsManager;

    iget-object v4, v0, Lm6m;->n:Lj25;

    invoke-virtual {v2, v4}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v2, v0, Lm6m;->l:Ll6m;

    iget-object v4, v2, Ll6m;->b:Lno7;

    invoke-virtual {v4, v2}, Lno7;->p(Lmo7;)V

    iget-object v0, v0, Lm6m;->m:Ll6m;

    iget-object v2, v0, Ll6m;->b:Lno7;

    invoke-virtual {v2, v0}, Lno7;->p(Lmo7;)V

    :cond_18b
    iput-object v3, p0, Lcom/opera/android/BrowserActivity;->Y:Lm6m;

    iget-object v0, p0, Lcom/opera/android/BrowserActivity;->O:Ls28;

    if-eqz v0, :cond_1a5

    iget-boolean v2, v0, Ls28;->d:Z

    if-eqz v2, :cond_1a0

    iget-object v2, v0, Ls28;->f:Ljava/lang/Object;

    check-cast v2, Lk6l;

    iget-object v4, v0, Ls28;->g:Ljava/lang/Object;

    check-cast v4, Lqz;

    invoke-virtual {v2, v4}, Lk6l;->v(La2l;)V

    :cond_1a0
    iget-object v2, v0, Ls28;->c:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {v2, v0}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    :cond_1a5
    iput-object v3, p0, Lcom/opera/android/BrowserActivity;->O:Ls28;

    iget-object p0, p0, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-nez p0, :cond_1ac

    move-object p0, v3

    :cond_1ac
    iget-object v0, p0, Lz43;->h:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-virtual {v0}, Li7f;->clear()V

    iget-object p0, p0, Lz43;->i:Ljava/lang/Object;

    check-cast p0, Lgbf;

    iget-object v0, p0, Lgbf;->s:Lay;

    new-instance v2, Lvk2;

    const/16 v4, 0x10

    invoke-direct {v2, v4}, Lvk2;-><init>(B)V

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object v0

    if-eqz v0, :cond_1c9

    invoke-virtual {v2, v0}, Lvk2;->run(Ljava/lang/Object;)V

    :cond_1c9
    iget-object p0, p0, Lgbf;->j:Lvbf;

    iget-object v0, p0, Lvbf;->g:Lp8f;

    iget-object v2, p0, Lvbf;->h:Lsbf;

    iget-object v0, v0, Lp8f;->b:Ljava/lang/Object;

    check-cast v0, Li7f;

    invoke-virtual {v0, v2}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lvbf;->i:Lxg;

    iget-object v2, p0, Lvbf;->j:Lpbf;

    iget-object v0, v0, Lxg;->b:Ljava/lang/Iterable;

    check-cast v0, Lh7f;

    invoke-virtual {v0, v2}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lvbf;->f:Lswf;

    iget-object v2, p0, Lvbf;->k:Lrbf;

    iget-object v0, v0, Lswf;->g:Li7f;

    invoke-virtual {v0, v2}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lvbf;->d:Ls9g;

    invoke-virtual {v0, p0}, Ls9g;->m(Lq9g;)V

    iget-object v0, p0, Lvbf;->e:Lydn;

    iget-object v2, p0, Lvbf;->I:Lvc7;

    invoke-virtual {v0, v2}, Lydn;->A(Ltdn;)V

    iget-object v0, p0, Lvbf;->b:Lcom/opera/android/settings/SettingsManager;

    iget-object v2, p0, Lvbf;->H:Lj25;

    invoke-virtual {v0, v2}, Lcom/opera/android/settings/SettingsManager;->T(Lp5j;)V

    iget-object v0, p0, Lvbf;->l:Lin3;

    iget-object v2, p0, Lvbf;->m:Lqbf;

    iget-object v0, v0, Lin3;->c:Li7f;

    invoke-virtual {v0, v2}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lvbf;->z:Lubf;

    iget-object v0, v0, Lubf;->b:Llgf;

    iget-object v0, v0, Llgf;->b:Ljava/lang/Object;

    check-cast v0, Lhp2;

    iget-wide v4, v0, Lhp2;->b:J

    invoke-static {v4, v5}, LJ/N;->MyxmjvsL(J)V

    iget-object v0, p0, Lvbf;->K:Lpde;

    iget-object p0, p0, Lvbf;->L:Ld8d;

    invoke-virtual {v0, p0}, Lekc;->p(Lf7f;)V

    iget-object p0, v1, Ltw3;->s:Lzv3;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lbk5;

    if-eqz p0, :cond_245

    invoke-virtual {p0}, Lbk5;->a()Z

    move-result v0

    if-eqz v0, :cond_245

    iget-object v0, p0, Lbk5;->g:Llh4;

    if-eqz v0, :cond_232

    iput-object v3, v0, Llh4;->b:Lcom/opera/api/Callback;

    iput-object v3, p0, Lbk5;->g:Llh4;

    :cond_232
    iget-object v0, p0, Lbk5;->a:Ljk5;

    iget-object v2, v0, Ljk5;->d:Ljava/lang/Object;

    monitor-enter v2

    :try_start_237
    iput-object v3, v0, Ljk5;->e:Ljava/lang/String;
    :try_end_239
    .catchall {:try_start_237 .. :try_end_239} :catchall_242

    monitor-exit v2

    iput-object v3, p0, Lbk5;->h:Lzj5;

    sget-object v0, Lak5;->a:Lak5;

    invoke-virtual {p0, v0}, Lbk5;->d(Lak5;)V

    goto :goto_245

    :catchall_242
    move-exception p0

    monitor-exit v2

    throw p0

    :cond_245
    :goto_245
    iget-object p0, v1, Ltw3;->a:Lhx3;

    invoke-virtual {p0}, Lhx3;->i()Lcom/opera/android/Lazy;

    move-result-object p0

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lrs2;

    if-eqz p0, :cond_25d

    iget-object v0, p0, Lrs2;->c:Lcom/opera/android/autofill/PasswordDataMonitor;

    invoke-virtual {v0}, Lcom/opera/android/autofill/PasswordDataMonitor;->a()V

    iget-object p0, p0, Lrs2;->e:Lcom/opera/android/autofill/PersonalDataMonitor;

    invoke-virtual {p0}, Lcom/opera/android/autofill/PersonalDataMonitor;->a()V

    :cond_25d
    iget-object p0, p1, Lcom/opera/android/OperaApplication;->E:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lv3e;

    iput-object v3, p0, Lv3e;->b:Lyl6;

    iput-object v3, p0, Lv3e;->c:Lcom/opera/android/BrowserActivity;

    sget-object p0, Lcom/opera/android/browser/SessionStore;->j:Lcom/opera/android/browser/SessionStore;

    iget-wide p0, p0, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {p0, p1}, LJ/N;->Ml0K9PX$(J)V

    return-void
.end method

.method public final onPause(Lndc;)V
    .registers 8

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lou3;->i:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    const/4 v1, 0x0

    iput-boolean v1, v0, Lcom/opera/android/OperaApplication;->o:Z

    iget-object v2, v0, Lcom/opera/android/OperaApplication;->c:Ljava/lang/Object;

    monitor-enter v2

    const/4 v3, 0x0

    :try_start_11
    iput-object v3, v0, Lcom/opera/android/OperaApplication;->b:Lsl6;
    :try_end_13
    .catchall {:try_start_11 .. :try_end_13} :catchall_ae

    monitor-exit v2

    iput-boolean v1, p0, Lou3;->e:Z

    iget-object p0, p1, Ldx3;->o:Lqim;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    const/4 v0, 0x1

    iput-boolean v0, p0, Lqim;->p:Z

    iget-object p0, p0, Lqim;->b:Lll9;

    iget v2, p0, Lll9;->h:I

    add-int/2addr v2, v0

    iput v2, p0, Lll9;->h:I

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p0

    check-cast p0, Lcom/opera/android/OperaApplication;

    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/e;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MYJauVto()Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-static {}, LJ/N;->MH$FqgDA()V

    :cond_3f
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v0

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, LJ/N;->MyZx5kBs()Z

    move-result v0

    if-eqz v0, :cond_53

    sget-object v0, Lcom/opera/android/bookmarks/BookmarksBridge;->a:Li7f;

    invoke-static {}, LJ/N;->MCmcRACL()V

    :cond_53
    invoke-virtual {p0}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object p0

    iget-object p0, p0, Ldb;->c:Lcom/opera/android/oauth2/OAuth2Account;

    if-eqz p0, :cond_60

    iget-wide v4, p0, Lcom/opera/android/oauth2/OAuth2Account;->g:J

    invoke-static {v4, v5}, LJ/N;->MZQJlG4L(J)V

    :cond_60
    iget-object p0, p1, Lcom/opera/android/BrowserActivity;->s0:Leac;

    if-eqz p0, :cond_66

    iput-boolean v1, p0, Leac;->e:Z

    :cond_66
    sget-object p0, Lcom/opera/android/browser/obml/Platform;->a:Landroid/content/Context;

    invoke-static {}, LJ/N;->MYWkcpdj()V

    iget-object p0, p1, Lcom/opera/android/BrowserActivity;->R:Ljl6;

    if-eqz p0, :cond_70

    move-object v3, p0

    :cond_70
    const/4 p0, 0x6

    invoke-virtual {v3, p0}, Ljl6;->q(I)V

    iget-object p0, v3, Ljl6;->e:Ljava/lang/Object;

    check-cast p0, Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    invoke-interface {p0}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string v0, "session.pause.time"

    invoke-static {p0, v0}, Lam2;->x(Landroid/content/SharedPreferences$Editor;Ljava/lang/String;)V

    iget-object p0, p1, Lcom/opera/android/BrowserActivity;->l0:Lj4c;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->f()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lq82;

    if-eqz p0, :cond_ad

    iput-boolean v1, p0, Lq82;->d:Z

    iget-boolean p1, p0, Lq82;->c:Z

    if-eqz p1, :cond_ad

    iget-object p0, p0, Lq82;->a:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :goto_9d
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result p1

    if-eqz p1, :cond_ad

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lr82;

    invoke-interface {p1}, Lr82;->e()V

    goto :goto_9d

    :cond_ad
    return-void

    :catchall_ae
    move-exception p0

    monitor-exit v2

    throw p0
.end method

.method public final onResume(Lndc;)V
    .registers 3

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lou3;->i:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    const/4 v0, 0x1

    iput-boolean v0, p1, Lcom/opera/android/OperaApplication;->o:Z

    iput-boolean v0, p0, Lou3;->e:Z

    iget-boolean p1, p0, Lou3;->d:Z

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Lou3;->S()V

    :cond_16
    return-void
.end method

.method public final onStart(Lndc;)V
    .registers 4

    invoke-static {}, Ljava/lang/System;->currentTimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lou3;->b:J

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iput-wide v0, p0, Lou3;->c:J

    const/4 p1, 0x0

    iput-boolean p1, p0, Lou3;->f:Z

    return-void
.end method

.method public final onStop(Lndc;)V
    .registers 11

    invoke-static {}, Landroid/os/SystemClock;->uptimeMillis()J

    move-result-wide v0

    iget-wide v2, p0, Lou3;->c:J

    sub-long/2addr v0, v2

    sget-object p1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object p1, p0, Lou3;->i:Lcom/opera/android/BrowserActivity;

    invoke-virtual {p1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object p1

    iget-wide v2, p0, Lou3;->b:J

    iget-object v4, p1, Lfqe;->a:Landroid/content/Context;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v4

    check-cast v4, Lcom/opera/android/OperaApplication;

    invoke-virtual {v4}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v4

    invoke-virtual {v4}, Lfue;->d()V

    iget-object v4, v4, Lfue;->a:Lcue;

    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    move-result v4

    const/4 v5, 0x1

    if-ne v4, v5, :cond_72

    iget-object p1, p1, Lfqe;->c:Luqe;

    if-eqz p1, :cond_72

    iget-object p1, p1, Luqe;->h:Luy8;

    iget-object v4, p1, Luy8;->p:Lqy8;

    new-instance v6, Lyx8;

    const-wide/16 v7, 0x3e8

    div-long/2addr v2, v7

    div-long/2addr v0, v7

    invoke-direct {v6, v2, v3, v0, v1}, Lyx8;-><init>(JJ)V

    invoke-virtual {p1, v6}, Luy8;->c(Ldy8;)V

    iget v0, p1, Luy8;->l:I

    if-lez v0, :cond_5a

    iget-object v0, p1, Luy8;->g:Lue2;

    const/4 v1, 0x3

    invoke-virtual {v0, v1}, Landroid/os/Handler;->removeMessages(I)V

    new-instance v0, Lpy8;

    iget v1, p1, Luy8;->l:I

    invoke-direct {v0, p1, v1}, Lpy8;-><init>(Luy8;I)V

    const/4 v1, 0x0

    new-array v1, v1, [Ljava/lang/Void;

    invoke-static {v0, v1}, Lhe2;->a(Landroid/os/AsyncTask;[Ljava/lang/Object;)Z

    :cond_5a
    iget-object p1, p1, Luy8;->o:Lqy8;

    invoke-virtual {p1, v5}, Lqy8;->c(Z)V

    invoke-virtual {v4}, Lqy8;->a()J

    move-result-wide v0

    invoke-static {v0, v1}, Landroid/text/format/DateUtils;->isToday(J)Z

    move-result p1

    if-eqz p1, :cond_72

    iget-object p1, v4, Lqy8;->h:Luy8;

    iget-object p1, p1, Luy8;->g:Lue2;

    iget-byte v0, v4, Lqy8;->b:B

    invoke-virtual {p1, v0}, Landroid/os/Handler;->removeMessages(I)V

    :cond_72
    iput-boolean v5, p0, Lou3;->f:Z

    return-void
.end method
