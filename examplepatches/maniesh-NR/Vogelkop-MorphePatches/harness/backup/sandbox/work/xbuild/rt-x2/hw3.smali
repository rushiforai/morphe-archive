.class public final Lhw3;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Ltw3;


# direct methods
.method public synthetic constructor <init>(Ltw3;B)V
    .registers 3

    iput-byte p2, p0, Lhw3;->e:B

    iput-object p1, p0, Lhw3;->f:Ltw3;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 123

    move-object/from16 v0, p0

    iget-byte v1, v0, Lhw3;->e:B

    const/16 v4, 0xa

    const/16 v5, 0x9

    const/16 v6, 0x8

    const/16 v7, 0x1b

    const/16 v8, 0x1a

    const/16 v9, 0x1d

    const/16 v10, 0x1c

    const/4 v11, 0x7

    const/16 v12, 0xe

    const/16 v13, 0xd

    const/16 v14, 0xf

    const/16 v15, 0xc

    const/16 v2, 0x10

    iget-object v3, v0, Lhw3;->f:Ltw3;

    packed-switch v1, :pswitch_data_990

    new-instance v0, Lxg7;

    iget-object v1, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v1

    invoke-direct {v0, v1}, Lxg7;-><init>(Lgjm;)V

    return-object v0

    :pswitch_2e
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v4, Lnw3;

    invoke-direct {v4, v1, v14}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v5, v3, Ltw3;->a:Lhx3;

    iget-object v6, v5, Lhx3;->a:Lxbf;

    iget-object v6, v6, Lxbf;->e:Ljava/lang/Object;

    move-object/from16 v17, v6

    check-cast v17, Lj4c;

    invoke-virtual {v5}, Lhx3;->B()Lcom/opera/android/Lazy;

    move-result-object v18

    iget-object v0, v0, Lcom/opera/android/BrowserActivity;->a0:Lj4c;

    new-instance v6, Lmw3;

    invoke-direct {v6, v3, v10}, Lmw3;-><init>(Ltw3;B)V

    new-instance v7, Lnw3;

    invoke-direct {v7, v1, v2}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Lmw3;

    invoke-direct {v2, v3, v9}, Lmw3;-><init>(Ltw3;B)V

    iget-object v8, v3, Ltw3;->c:Lumi;

    iget-object v9, v5, Lhx3;->p:Lfx3;

    invoke-virtual {v9}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v9

    move-object/from16 v24, v9

    check-cast v24, Lgjm;

    iget-object v3, v3, Ltw3;->I:Lhw3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    move-object/from16 v27, v3

    check-cast v27, Le4i;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->D:Lj4c;

    iget-object v3, v5, Lhx3;->a:Lxbf;

    iget-object v3, v3, Lxbf;->g:Ljava/lang/Object;

    move-object/from16 v26, v3

    check-cast v26, Lj4c;

    new-instance v15, Lxg7;

    move-object/from16 v19, v0

    move-object/from16 v25, v1

    move-object/from16 v22, v2

    move-object/from16 v16, v4

    move-object/from16 v20, v6

    move-object/from16 v21, v7

    move-object/from16 v23, v8

    invoke-direct/range {v15 .. v27}, Lxg7;-><init>(Lnw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lj4c;Lmw3;Lnw3;Lmw3;Lumi;Lgjm;Lj4c;Lcom/opera/android/Lazy;Le4i;)V

    return-object v15

    :pswitch_90
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v1, v3, Ltw3;->a:Lhx3;

    invoke-virtual {v1}, Lhx3;->n()Lcom/opera/android/Lazy;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v6, v2

    check-cast v6, Laf3;

    new-instance v7, Lqb7;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v2, v2, Ld6j;->d:Lx5f;

    invoke-direct {v7, v6, v2}, Lqb7;-><init>(Laf3;Lskm;)V

    invoke-virtual {v1}, Lhx3;->a()Lxb;

    move-result-object v8

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v9

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v2, v2, Ltw3;->a:Lhx3;

    invoke-virtual {v2}, Lhx3;->y()Lcom/opera/android/Lazy;

    move-result-object v2

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v10, v2

    check-cast v10, Lfmk;

    invoke-static {v5}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v11

    iget-object v2, v5, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v12, v2, Lqim;->c:Lz77;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->D()Ljtg;

    move-result-object v13

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v15, v0, Ld6j;->c:Lx5f;

    new-instance v16, Lq2;

    iget-object v0, v1, Lhx3;->m:Lfx3;

    const/16 v22, 0x0

    const/16 v23, 0xd

    const/16 v17, 0x0

    const-class v19, Lcom/opera/android/Lazy;

    const-string v20, "get"

    const-string v21, "get()Ljava/lang/Object;"

    move-object/from16 v18, v0

    invoke-direct/range {v16 .. v23}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v4, Lpfn;

    move-object/from16 v14, v16

    invoke-direct/range {v4 .. v15}, Lpfn;-><init>(Landroid/content/Context;Laf3;Lqb7;Lxb;Lslk;Lfmk;Lru9;Lz77;Ljtg;Lq2;Lx5f;)V

    return-object v4

    :pswitch_fb
    new-instance v0, Lmen;

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v2

    iget-object v2, v2, Lslk;->i:Lkze;

    const-class v4, Lben;

    iget-object v5, v1, Lcom/opera/android/BrowserActivity;->g0:Lwub;

    invoke-virtual {v5, v4}, Lwub;->E(Ljava/lang/Class;)Ljnf;

    move-result-object v4

    check-cast v4, Lben;

    invoke-static {v1}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v1

    iget-object v3, v3, Ltw3;->a:Lhx3;

    invoke-virtual {v3}, Lhx3;->w()Lcom/opera/android/settings/SettingsManager;

    move-result-object v3

    invoke-direct {v0, v2, v4, v1, v3}, Lmen;-><init>(Lkze;Lben;Lru9;Lcom/opera/android/settings/SettingsManager;)V

    return-object v0

    :pswitch_125
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v22, Lzdn;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v23

    new-instance v0, Lmw3;

    const/16 v2, 0x17

    invoke-direct {v0, v3, v2}, Lmw3;-><init>(Ltw3;B)V

    new-instance v2, Lnw3;

    invoke-direct {v2, v1, v15}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v9, Lnw3;

    invoke-direct {v9, v1, v13}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v10, Lnw3;

    invoke-direct {v10, v1, v12}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v12, Lmw3;

    invoke-direct {v12, v3, v8}, Lmw3;-><init>(Ltw3;B)V

    new-instance v8, Lmw3;

    invoke-direct {v8, v3, v7}, Lmw3;-><init>(Ltw3;B)V

    iget-object v7, v3, Ltw3;->a:Lhx3;

    iget-object v13, v7, Lhx3;->a:Lxbf;

    iget-object v13, v13, Lxbf;->b:Ljava/lang/Object;

    check-cast v13, Lmi;

    iget-object v13, v13, Lmi;->s:Lhi;

    iget-object v7, v7, Lhx3;->m:Lfx3;

    new-instance v14, Lnw3;

    invoke-direct {v14, v1, v11}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v11, Lnw3;

    invoke-direct {v11, v1, v6}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v6, Lmw3;

    const/16 v15, 0x18

    invoke-direct {v6, v3, v15}, Lmw3;-><init>(Ltw3;B)V

    new-instance v15, Lnw3;

    invoke-direct {v15, v1, v5}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Lnw3;

    invoke-direct {v5, v1, v4}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lmw3;

    move-object/from16 v24, v0

    const/16 v0, 0x19

    invoke-direct {v4, v3, v0}, Lmw3;-><init>(Ltw3;B)V

    new-instance v0, Lnw3;

    move-object/from16 v25, v2

    const/16 v2, 0xb

    invoke-direct {v0, v1, v2}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Lkw3;

    move-object/from16 v38, v0

    const/4 v0, 0x4

    invoke-direct {v2, v0}, Lkw3;-><init>(B)V

    iget-object v0, v3, Ltw3;->V:Lhw3;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    move-object/from16 v40, v0

    move-object/from16 v41, v1

    move-object/from16 v39, v2

    move-object/from16 v37, v4

    move-object/from16 v36, v5

    move-object/from16 v34, v6

    move-object/from16 v31, v7

    move-object/from16 v29, v8

    move-object/from16 v26, v9

    move-object/from16 v27, v10

    move-object/from16 v33, v11

    move-object/from16 v28, v12

    move-object/from16 v30, v13

    move-object/from16 v32, v14

    move-object/from16 v35, v15

    invoke-direct/range {v22 .. v41}, Lzdn;-><init>(Lgjm;Lmw3;Lnw3;Lnw3;Lnw3;Lmw3;Lmw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lnw3;Lnw3;Lmw3;Lnw3;Lnw3;Lmw3;Lnw3;Lkw3;Lhw3;Lx5f;)V

    return-object v22

    :pswitch_1c0
    new-instance v0, Lv78;

    iget-object v1, v3, Ltw3;->y:Lzv3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lh1b;

    const/4 v2, 0x1

    invoke-direct {v0, v1, v2}, Lv78;-><init>(Ljava/lang/Object;B)V

    return-object v0

    :pswitch_1cf
    new-instance v0, Lkul;

    iget-object v1, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    sget-object v2, Lvml;->e:Lwjh;

    invoke-direct {v0, v1, v2}, Lkul;-><init>(Landroid/content/Context;Lwjh;)V

    new-instance v4, Lqw3;

    invoke-direct {v4, v3, v0}, Lqw3;-><init>(Ltw3;Lkul;)V

    iget-object v5, v0, Lkul;->e:Li7f;

    invoke-virtual {v5, v4}, Li7f;->b(Ljava/lang/Object;)Z

    new-instance v4, Lc65;

    new-instance v6, Lmw3;

    const/16 v7, 0x16

    invoke-direct {v6, v3, v7}, Lmw3;-><init>(Ltw3;B)V

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v1

    iget-object v2, v2, Lwjh;->c:Ljava/lang/Object;

    check-cast v2, Lcv6;

    invoke-direct {v4, v6, v1, v2}, Lc65;-><init>(Lmw3;Lddc;Ldx5;)V

    invoke-virtual {v5, v4}, Li7f;->b(Ljava/lang/Object;)Z

    return-object v0

    :pswitch_1fe
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lc4l;

    new-instance v2, Lnw3;

    const/4 v3, 0x4

    invoke-direct {v2, v0, v3}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v3, Lnw3;

    const/4 v4, 0x5

    invoke-direct {v3, v0, v4}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lnw3;

    const/4 v5, 0x6

    invoke-direct {v4, v0, v5}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct {v1, v2, v3, v4}, Lc4l;-><init>(Lnw3;Lnw3;Lnw3;)V

    return-object v1

    :pswitch_220
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lgyk;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v3

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v4

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v1

    invoke-direct {v2, v0, v3, v4, v1}, Lgyk;-><init>(Lxd5;Lnr8;Lcom/opera/android/settings/SettingsManager;Ldb;)V

    return-object v2

    :pswitch_23c
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lojn;

    iget-object v3, v3, Ltw3;->c:Lumi;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->l1:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lfjn;

    invoke-direct {v2, v0, v3, v1}, Lojn;-><init>(Lfp1;Lumi;Lfjn;)V

    return-object v2

    :pswitch_258
    new-instance v0, Lob6;

    iget-object v1, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v1

    new-instance v2, Lgw3;

    const/4 v4, 0x4

    invoke-direct {v2, v3, v4}, Lgw3;-><init>(Ltw3;B)V

    iget-object v3, v3, Ltw3;->Q:Lhw3;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lojn;

    invoke-direct {v0, v1, v2, v3}, Lob6;-><init>(Lgjm;Lgw3;Lojn;)V

    return-object v0

    :pswitch_272
    new-instance v0, Le8k;

    new-instance v1, Lmw3;

    const/16 v2, 0x15

    invoke-direct {v1, v3, v2}, Lmw3;-><init>(Ltw3;B)V

    sget-object v2, Lk7k;->k:Lj7k;

    iget-object v2, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    sget-object v3, Lk7k;->l:Lio7;

    sget-object v4, Lk7k;->n:La3j;

    invoke-static {v2, v3, v4}, Lno7;->n(Landroid/content/Context;Lio7;Llo7;)Lno7;

    move-result-object v3

    check-cast v3, Lk7k;

    new-instance v4, Lpo7;

    invoke-direct {v4, v3}, Lpo7;-><init>(Lno7;)V

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    iget-object v3, v3, Lcom/opera/android/OperaApplication;->I:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lu8k;

    invoke-direct {v0, v1, v4, v3}, Le8k;-><init>(Lmw3;Lpo7;Lu8k;)V

    invoke-virtual {v2}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-virtual {v1, v0}, Ltcc;->a(Lmdc;)V

    return-object v0

    :pswitch_2a9
    new-instance v0, Le7k;

    new-instance v1, Lcw3;

    invoke-direct {v1, v3, v12}, Lcw3;-><init>(Ltw3;B)V

    new-instance v4, Lcw3;

    invoke-direct {v4, v3, v14}, Lcw3;-><init>(Ltw3;B)V

    new-instance v5, Lcw3;

    invoke-direct {v5, v3, v2}, Lcw3;-><init>(Ltw3;B)V

    new-instance v6, Lpw3;

    iget-object v7, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    const/4 v11, 0x0

    const/4 v12, 0x1

    const-class v8, Lcom/opera/android/BrowserActivity;

    const-string v9, "isUiClean"

    const-string v10, "isUiClean()Z"

    invoke-direct/range {v6 .. v12}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, v1, v4, v5, v6}, Le7k;-><init>(Lcw3;Lcw3;Lcw3;Lpw3;)V

    return-object v0

    :pswitch_2cd
    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    sget-object v2, Lxne;->b:Lii;

    new-instance v3, Lt1;

    const/4 v1, 0x2

    invoke-direct {v3, v0, v1}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v4, Lt1;

    const/4 v1, 0x3

    invoke-direct {v4, v0, v1}, Lt1;-><init>(Landroid/content/Context;B)V

    new-instance v5, Lkw3;

    invoke-direct {v5, v1}, Lkw3;-><init>(B)V

    sget-object v0, Lvml;->e:Lwjh;

    iget-object v1, v0, Lwjh;->b:Ljava/lang/Object;

    move-object v6, v1

    check-cast v6, Ld7a;

    iget-object v0, v0, Lwjh;->f:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Ljg8;

    new-instance v1, Lehj;

    invoke-direct/range {v1 .. v7}, Lehj;-><init>(Lii;Lt1;Lt1;Lkw3;Ldx5;Ljg8;)V

    return-object v1

    :pswitch_2f8
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v4, Lhnh;

    new-instance v6, Lcw3;

    const/16 v2, 0xb

    invoke-direct {v6, v3, v2}, Lcw3;-><init>(Ltw3;B)V

    iget-object v7, v3, Ltw3;->c:Lumi;

    new-instance v8, Lcw3;

    invoke-direct {v8, v3, v15}, Lcw3;-><init>(Ltw3;B)V

    new-instance v9, Lcw3;

    invoke-direct {v9, v3, v13}, Lcw3;-><init>(Ltw3;B)V

    new-instance v10, Let3;

    const/4 v1, 0x6

    invoke-direct {v10, v0, v1}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    const/4 v11, 0x1

    invoke-direct/range {v4 .. v11}, Lhnh;-><init>(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;B)V

    return-object v4

    :pswitch_322
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lhw3;->f:Ltw3;

    iget-object v1, v0, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v3

    check-cast v3, Lcom/opera/android/OperaApplication;

    iget-object v2, v1, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    new-instance v32, Lx7j;

    invoke-virtual {v1}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v33

    new-instance v9, Lew3;

    const/16 v10, 0x13

    invoke-direct {v9, v0, v10}, Lew3;-><init>(Ltw3;B)V

    new-instance v10, Lew3;

    const/16 v7, 0x15

    invoke-direct {v10, v0, v7}, Lew3;-><init>(Ltw3;B)V

    new-instance v7, Lew3;

    const/16 v12, 0x19

    invoke-direct {v7, v0, v12}, Lew3;-><init>(Ltw3;B)V

    new-instance v12, Lmw3;

    const/4 v13, 0x3

    invoke-direct {v12, v0, v13}, Lmw3;-><init>(Ltw3;B)V

    new-instance v13, Lmw3;

    invoke-direct {v13, v0, v4}, Lmw3;-><init>(Ltw3;B)V

    new-instance v8, Lmw3;

    invoke-direct {v8, v0, v14}, Lmw3;-><init>(Ltw3;B)V

    iget-object v14, v0, Ltw3;->a:Lhx3;

    iget-object v15, v14, Lhx3;->a:Lxbf;

    iget-object v15, v15, Lxbf;->e:Ljava/lang/Object;

    check-cast v15, Lj4c;

    new-instance v4, Lmw3;

    const/16 v5, 0x11

    invoke-direct {v4, v0, v5}, Lmw3;-><init>(Ltw3;B)V

    new-instance v5, Lmw3;

    const/16 v6, 0x12

    invoke-direct {v5, v0, v6}, Lmw3;-><init>(Ltw3;B)V

    new-instance v6, Lmw3;

    const/16 v11, 0x13

    invoke-direct {v6, v0, v11}, Lmw3;-><init>(Ltw3;B)V

    new-instance v11, Lmw3;

    move-object/from16 v46, v1

    const/16 v1, 0x14

    invoke-direct {v11, v0, v1}, Lmw3;-><init>(Ltw3;B)V

    new-instance v1, Lew3;

    move-object/from16 p0, v4

    const/16 v4, 0x17

    invoke-direct {v1, v0, v4}, Lew3;-><init>(Ltw3;B)V

    new-instance v4, Lmw3;

    move-object/from16 v47, v1

    const/4 v1, 0x0

    invoke-direct {v4, v0, v1}, Lmw3;-><init>(Ltw3;B)V

    new-instance v1, Lmw3;

    move-object/from16 v48, v4

    const/4 v4, 0x6

    invoke-direct {v1, v0, v4}, Lmw3;-><init>(Ltw3;B)V

    new-instance v4, Llw3;

    move-object/from16 v25, v0

    const/16 v0, 0x18

    invoke-direct {v4, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v14, Lhx3;->a:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lmi;

    iget-object v0, v0, Lmi;->t:Lii;

    move-object/from16 v17, v0

    new-instance v0, Lnw3;

    move-object/from16 v49, v1

    const/4 v1, 0x0

    invoke-direct {v0, v3, v1}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v1, Lnw3;

    move-object/from16 v50, v0

    const/4 v0, 0x1

    invoke-direct {v1, v3, v0}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v14}, Lhx3;->i()Lcom/opera/android/Lazy;

    move-result-object v0

    new-instance v24, Lpw3;

    const/16 v29, 0x0

    const/16 v30, 0x0

    const-class v26, Ltw3;

    const-string v27, "accountStatusProvider"

    const-string v28, "getAccountStatusProvider()Lcom/opera/android/account/AccountStatusProvider;"

    invoke-direct/range {v24 .. v30}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v26, v0

    move-object/from16 v0, v24

    move-object/from16 v24, v1

    move-object/from16 v1, v25

    move-object/from16 v25, v4

    new-instance v4, Lwv1;

    move-object/from16 v27, v5

    const/4 v5, 0x2

    invoke-direct {v4, v0, v5}, Lwv1;-><init>(Lb6h;B)V

    new-instance v0, Lnw3;

    invoke-direct {v0, v3, v5}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Lnw3;

    move-object/from16 v28, v0

    const/4 v0, 0x3

    invoke-direct {v5, v3, v0}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Low3;

    move-object/from16 v29, v4

    const/4 v4, 0x0

    invoke-direct {v0, v1, v3, v4}, Low3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v4, Lew3;

    move-object/from16 v16, v0

    const/16 v0, 0x14

    invoke-direct {v4, v1, v0}, Lew3;-><init>(Ltw3;B)V

    iget-object v0, v3, Lcom/opera/android/OperaApplication;->z:Lg92;

    move-object/from16 v51, v0

    new-instance v0, Llw3;

    move-object/from16 v30, v4

    const/4 v4, 0x7

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Llw3;

    move-object/from16 v52, v0

    const/16 v0, 0x8

    invoke-direct {v4, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Lkw3;

    move-object/from16 v53, v4

    const/4 v4, 0x1

    invoke-direct {v0, v1, v4}, Lkw3;-><init>(Ljava/lang/Object;B)V

    move-object/from16 v54, v0

    new-instance v0, Lkw3;

    invoke-direct {v0, v1, v4}, Lkw3;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Lew3;

    move-object/from16 v55, v0

    const/16 v0, 0x16

    invoke-direct {v4, v1, v0}, Lew3;-><init>(Ltw3;B)V

    invoke-virtual {v3}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v57

    new-instance v0, Llw3;

    move-object/from16 v56, v4

    const/16 v4, 0x9

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Llw3;

    move-object/from16 v58, v0

    const/16 v0, 0xa

    invoke-direct {v4, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Llw3;

    move-object/from16 v59, v4

    const/16 v4, 0xb

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v14}, Lhx3;->p()Lcom/opera/android/Lazy;

    move-result-object v61

    iget-object v4, v14, Lhx3;->u:Lfx3;

    move-object/from16 v60, v0

    new-instance v0, Llw3;

    move-object/from16 v62, v4

    const/16 v4, 0xc

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lew3;

    move-object/from16 v63, v0

    const/16 v0, 0x18

    invoke-direct {v4, v1, v0}, Lew3;-><init>(Ltw3;B)V

    iget-object v0, v1, Ltw3;->c:Lumi;

    move-object/from16 v65, v0

    iget-object v0, v1, Ltw3;->d:Lwjh;

    move-object/from16 v66, v0

    new-instance v0, Lew3;

    move-object/from16 v64, v4

    const/16 v4, 0x1a

    invoke-direct {v0, v1, v4}, Lew3;-><init>(Ltw3;B)V

    invoke-virtual {v14}, Lhx3;->t()Lcom/opera/android/Lazy;

    move-result-object v68

    new-instance v4, Llw3;

    move-object/from16 v67, v0

    const/16 v0, 0xd

    invoke-direct {v4, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Llw3;

    move-object/from16 v69, v4

    const/16 v4, 0xe

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v4, v1, Ltw3;->q:Lzv3;

    move-object/from16 v70, v0

    new-instance v0, Lew3;

    move-object/from16 v71, v4

    const/16 v4, 0x1b

    invoke-direct {v0, v1, v4}, Lew3;-><init>(Ltw3;B)V

    new-instance v4, Lkw3;

    move-object/from16 v72, v0

    const/4 v0, 0x2

    invoke-direct {v4, v0}, Lkw3;-><init>(B)V

    new-instance v0, Llw3;

    move-object/from16 v73, v4

    const/16 v4, 0xf

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lew3;

    move-object/from16 v74, v0

    const/16 v0, 0x1c

    invoke-direct {v4, v1, v0}, Lew3;-><init>(Ltw3;B)V

    new-instance v0, Lew3;

    move-object/from16 v75, v4

    const/16 v4, 0x1d

    invoke-direct {v0, v1, v4}, Lew3;-><init>(Ltw3;B)V

    new-instance v4, Lmw3;

    move-object/from16 v76, v0

    const/4 v0, 0x1

    invoke-direct {v4, v1, v0}, Lmw3;-><init>(Ltw3;B)V

    new-instance v0, Lmw3;

    move-object/from16 v77, v4

    const/4 v4, 0x2

    invoke-direct {v0, v1, v4}, Lmw3;-><init>(Ltw3;B)V

    new-instance v4, Lmw3;

    move-object/from16 v78, v0

    const/4 v0, 0x4

    invoke-direct {v4, v1, v0}, Lmw3;-><init>(Ltw3;B)V

    new-instance v0, Llw3;

    move-object/from16 v79, v4

    const/16 v4, 0x10

    invoke-direct {v0, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Llw3;

    move-object/from16 v80, v0

    const/16 v0, 0x11

    invoke-direct {v4, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v3, Lcom/opera/android/OperaApplication;->r:Lxv1;

    move-object/from16 v81, v4

    iget-object v4, v0, Lxv1;->L0:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v4

    move-object/from16 v82, v4

    check-cast v82, Lsqi;

    new-instance v4, Llw3;

    move-object/from16 v21, v5

    const/16 v5, 0x12

    invoke-direct {v4, v3, v5}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Llw3;

    move-object/from16 v83, v4

    const/16 v4, 0x13

    invoke-direct {v5, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Llw3;

    move-object/from16 v84, v5

    const/16 v5, 0x14

    invoke-direct {v4, v3, v5}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-virtual {v14}, Lhx3;->s()Lcom/opera/android/Lazy;

    move-result-object v86

    new-instance v5, Lmw3;

    move-object/from16 v85, v4

    const/4 v4, 0x5

    invoke-direct {v5, v1, v4}, Lmw3;-><init>(Ltw3;B)V

    new-instance v4, Lmw3;

    move-object/from16 v87, v5

    const/4 v5, 0x7

    invoke-direct {v4, v1, v5}, Lmw3;-><init>(Ltw3;B)V

    iget-object v5, v14, Lhx3;->q:Lfx3;

    move-object/from16 v88, v4

    iget-object v4, v1, Ltw3;->r:Lzv3;

    move-object/from16 v90, v4

    new-instance v4, Lmw3;

    move-object/from16 v89, v5

    const/16 v5, 0x8

    invoke-direct {v4, v1, v5}, Lmw3;-><init>(Ltw3;B)V

    new-instance v5, Lmw3;

    move-object/from16 v91, v4

    const/16 v4, 0x9

    invoke-direct {v5, v1, v4}, Lmw3;-><init>(Ltw3;B)V

    iget-object v4, v3, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v4}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v22

    move-object/from16 v23, v4

    move-object/from16 v4, v22

    check-cast v4, Llpe;

    iget-object v4, v4, Llpe;->b:Lcq5;

    move-object/from16 v93, v4

    new-instance v4, Lmw3;

    move-object/from16 v92, v5

    const/16 v5, 0xb

    invoke-direct {v4, v1, v5}, Lmw3;-><init>(Ltw3;B)V

    new-instance v5, Llw3;

    move-object/from16 v94, v4

    const/16 v4, 0x15

    invoke-direct {v5, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lmw3;

    move-object/from16 v95, v5

    const/16 v5, 0xc

    invoke-direct {v4, v1, v5}, Lmw3;-><init>(Ltw3;B)V

    new-instance v5, Lmw3;

    move-object/from16 v96, v4

    const/16 v4, 0xd

    invoke-direct {v5, v1, v4}, Lmw3;-><init>(Ltw3;B)V

    new-instance v4, Llw3;

    move-object/from16 v97, v5

    const/16 v5, 0x16

    invoke-direct {v4, v3, v5}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v5, Llw3;

    move-object/from16 v98, v4

    const/16 v4, 0x17

    invoke-direct {v5, v3, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lmw3;

    move-object/from16 v99, v5

    const/16 v5, 0xe

    invoke-direct {v4, v1, v5}, Lmw3;-><init>(Ltw3;B)V

    iget-object v2, v2, Ltw3;->a:Lhx3;

    iget-object v2, v2, Lhx3;->g:Lfx3;

    new-instance v5, Lgw3;

    move-object/from16 v101, v2

    const/4 v2, 0x3

    invoke-direct {v5, v1, v2}, Lgw3;-><init>(Ltw3;B)V

    iget-object v0, v0, Lxv1;->l0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v103, v0

    check-cast v103, Lx0f;

    new-instance v0, Llw3;

    const/16 v2, 0x19

    invoke-direct {v0, v3, v2}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v2, v1, Ltw3;->l0:Lhw3;

    move-object/from16 v104, v0

    iget-object v0, v1, Ltw3;->I:Lhw3;

    move-object/from16 v106, v0

    iget-object v0, v3, Lcom/opera/android/OperaApplication;->D:Lj4c;

    move-object/from16 v107, v0

    new-instance v0, Let3;

    move-object/from16 v105, v2

    const/4 v2, 0x5

    invoke-direct {v0, v3, v2}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Llw3;

    move-object/from16 v108, v0

    const/16 v0, 0x1a

    invoke-direct {v2, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v1, Ltw3;->C0:Lzv3;

    move-object/from16 v110, v0

    iget-object v0, v1, Ltw3;->f:Lj4c;

    move-object/from16 v111, v0

    iget-object v0, v1, Ltw3;->i:Lj4c;

    move-object/from16 v112, v0

    iget-object v0, v3, Lcom/opera/android/OperaApplication;->J:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llz6;

    move-object/from16 v109, v2

    new-instance v2, Leq6;

    iget-object v0, v0, Llz6;->a:Lu7k;

    invoke-direct {v2, v0}, Leq6;-><init>(Ljava/lang/Object;)V

    invoke-virtual/range {v23 .. v23}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v0, v0, Llpe;->q:Lplh;

    invoke-virtual/range {v23 .. v23}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v18

    move-object/from16 v114, v0

    move-object/from16 v0, v18

    check-cast v0, Llpe;

    iget-object v0, v0, Llpe;->x:Lplh;

    move-object/from16 v115, v0

    new-instance v0, Llw3;

    move-object/from16 v113, v2

    const/16 v2, 0x1b

    invoke-direct {v0, v3, v2}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Lmw3;

    move-object/from16 v116, v0

    const/16 v0, 0x10

    invoke-direct {v2, v1, v0}, Lmw3;-><init>(Ltw3;B)V

    invoke-virtual {v14}, Lhx3;->o()Lcom/opera/android/Lazy;

    move-result-object v118

    new-instance v0, Llw3;

    const/16 v14, 0x1c

    invoke-direct {v0, v3, v14}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v14, Llw3;

    move-object/from16 v119, v0

    const/16 v0, 0x1d

    invoke-direct {v14, v3, v0}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v1, Ltw3;->p:Lj4c;

    move-object/from16 v34, p0

    move-object/from16 v121, v0

    move-object/from16 v117, v2

    move-object/from16 v100, v4

    move-object/from16 v102, v5

    move-object/from16 v36, v6

    move-object/from16 v37, v11

    move-object/from16 v31, v13

    move-object/from16 v120, v14

    move-object/from16 v42, v17

    move-object/from16 v44, v24

    move-object/from16 v41, v25

    move-object/from16 v45, v26

    move-object/from16 v35, v27

    move-object/from16 v24, v32

    move-object/from16 v26, v33

    move-object/from16 v25, v46

    move-object/from16 v38, v47

    move-object/from16 v39, v48

    move-object/from16 v40, v49

    move-object/from16 v43, v50

    move-object/from16 v32, v8

    move-object/from16 v27, v9

    move-object/from16 v33, v15

    move-object/from16 v49, v16

    move-object/from16 v48, v21

    move-object/from16 v47, v28

    move-object/from16 v46, v29

    move-object/from16 v50, v30

    move-object/from16 v29, v7

    move-object/from16 v28, v10

    move-object/from16 v30, v12

    invoke-direct/range {v24 .. v121}, Lx7j;-><init>(Landroid/app/Activity;Lgjm;Lew3;Lew3;Lew3;Lmw3;Lmw3;Lmw3;Lcom/opera/android/Lazy;Lmw3;Lmw3;Lmw3;Lmw3;Lew3;Lmw3;Lmw3;Llw3;Lcom/opera/android/Lazy;Lnw3;Lnw3;Lcom/opera/android/Lazy;Lwv1;Lnw3;Lnw3;Low3;Lew3;Lg92;Llw3;Llw3;Lkw3;Lkw3;Lew3;Lj4c;Llw3;Llw3;Llw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Llw3;Lew3;Lumi;Lwjh;Lew3;Lcom/opera/android/Lazy;Llw3;Llw3;Lzv3;Lew3;Lkw3;Llw3;Lew3;Lew3;Lmw3;Lmw3;Lmw3;Llw3;Llw3;Lsqi;Llw3;Llw3;Llw3;Lcom/opera/android/Lazy;Lmw3;Lmw3;Lcom/opera/android/Lazy;Lzv3;Lmw3;Lmw3;Lcq5;Lmw3;Llw3;Lmw3;Lmw3;Llw3;Llw3;Lmw3;Lcom/opera/android/Lazy;Lgw3;Lx0f;Llw3;Lhw3;Lhw3;Lj4c;Let3;Llw3;Lzv3;Lj4c;Lj4c;Leq6;Lplh;Lplh;Llw3;Lmw3;Lcom/opera/android/Lazy;Llw3;Llw3;Lj4c;)V

    return-object v24

    :pswitch_666
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v4, Lf1j;

    iget-object v6, v3, Ltw3;->c:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->s()Lbf9;

    move-result-object v7

    iget-object v1, v3, Ltw3;->a:Lhx3;

    invoke-virtual {v1}, Lhx3;->w()Lcom/opera/android/settings/SettingsManager;

    move-result-object v8

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v9, v0, Ld6j;->c:Lx5f;

    iget-object v0, v3, Ltw3;->u0:Lii;

    new-instance v10, Lki;

    const/4 v1, 0x3

    invoke-direct {v10, v0, v1}, Lki;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v4 .. v10}, Lf1j;-><init>(Lcom/opera/android/BrowserActivity;Lumi;Lbf9;Lcom/opera/android/settings/SettingsManager;Lx5f;Lki;)V

    return-object v4

    :pswitch_690
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v1, v3, Ltw3;->a:Lhx3;

    iget-object v1, v1, Lhx3;->p:Lfx3;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgjm;

    new-instance v2, Le4i;

    iget-object v3, v0, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v3}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lk3i;

    new-instance v4, Lf4i;

    new-instance v5, Llw3;

    const/4 v6, 0x6

    invoke-direct {v5, v0, v6}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Lyhe;

    const/16 v6, 0x10

    invoke-direct {v0, v1, v6}, Lyhe;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v4, v5, v0}, Lf4i;-><init>(Llw3;Lyhe;)V

    invoke-direct {v2, v3, v4, v1}, Le4i;-><init>(Lk3i;Lf4i;Lgjm;)V

    return-object v2

    :pswitch_6c4
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v5

    new-instance v10, Lew3;

    const/16 v0, 0x12

    invoke-direct {v10, v3, v0}, Lew3;-><init>(Ltw3;B)V

    iget-object v6, v1, Lcom/opera/android/OperaApplication;->G:Lj4c;

    iget-object v8, v3, Ltw3;->l0:Lhw3;

    iget-object v0, v3, Ltw3;->a:Lhx3;

    iget-object v0, v0, Lhx3;->a:Lxbf;

    iget-object v0, v0, Lxbf;->g:Ljava/lang/Object;

    move-object v7, v0

    check-cast v7, Lj4c;

    new-instance v9, Lgw3;

    const/4 v0, 0x2

    invoke-direct {v9, v3, v0}, Lgw3;-><init>(Ltw3;B)V

    new-instance v11, Llw3;

    const/4 v4, 0x5

    invoke-direct {v11, v1, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v4, Lx7j;

    const/4 v12, 0x2

    invoke-direct/range {v4 .. v12}, Lx7j;-><init>(Ljava/lang/Object;Ljava/lang/Object;Lesk;Lesk;Ljava/lang/Object;Lesk;Lesk;B)V

    return-object v4

    :pswitch_6f9
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v2, v1, Lcom/opera/android/OperaApplication;->G:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ly3i;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v3

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->D:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lk3i;

    invoke-virtual {v1}, Lk3i;->a()Likc;

    move-result-object v1

    new-instance v4, Lr2i;

    invoke-direct {v4, v2, v1, v3, v0}, Lr2i;-><init>(Ly3i;Likc;Lru9;Lndc;)V

    return-object v4

    :pswitch_721
    new-instance v5, Lhnh;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v6

    new-instance v7, Lcw3;

    const/4 v1, 0x6

    invoke-direct {v7, v3, v1}, Lcw3;-><init>(Ltw3;B)V

    new-instance v8, Lcw3;

    const/4 v4, 0x7

    invoke-direct {v8, v3, v4}, Lcw3;-><init>(Ltw3;B)V

    new-instance v9, Lcw3;

    const/16 v0, 0x8

    invoke-direct {v9, v3, v0}, Lcw3;-><init>(Ltw3;B)V

    new-instance v10, Lcw3;

    const/16 v4, 0x9

    invoke-direct {v10, v3, v4}, Lcw3;-><init>(Ltw3;B)V

    new-instance v11, Lcw3;

    const/16 v0, 0xa

    invoke-direct {v11, v3, v0}, Lcw3;-><init>(Ltw3;B)V

    const/4 v12, 0x0

    invoke-direct/range {v5 .. v12}, Lhnh;-><init>(Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Ljava/lang/Object;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;Lkotlin/jvm/functions/Function0;B)V

    return-object v5

    :pswitch_74f
    new-instance v0, Lqjh;

    iget-object v1, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    new-instance v2, Lew3;

    const/16 v4, 0x11

    invoke-direct {v2, v3, v4}, Lew3;-><init>(Ltw3;B)V

    new-instance v4, Lgw3;

    const/4 v5, 0x1

    invoke-direct {v4, v3, v5}, Lgw3;-><init>(Ltw3;B)V

    invoke-direct {v0, v1, v2, v4}, Lqjh;-><init>(Landroid/app/Activity;Lew3;Lgw3;)V

    return-object v0

    :pswitch_764
    const/4 v5, 0x1

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v7, v0, Lhw3;->f:Ltw3;

    iget-object v0, v7, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v41, Llm3;

    new-instance v2, Llw3;

    invoke-direct {v2, v1, v5}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v6, Lpv3;

    const/4 v11, 0x0

    const/16 v12, 0x1b

    const-class v8, Ltw3;

    const-string v9, "accountStatusProvider"

    const-string v10, "getAccountStatusProvider()Lcom/opera/android/account/AccountStatusProvider;"

    invoke-direct/range {v6 .. v12}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v3, Lwv1;

    const/4 v4, 0x2

    invoke-direct {v3, v6, v4}, Lwv1;-><init>(Lb6h;B)V

    new-instance v5, Lew3;

    const/16 v6, 0xe

    invoke-direct {v5, v7, v6}, Lew3;-><init>(Ltw3;B)V

    new-instance v6, Lew3;

    const/16 v8, 0xf

    invoke-direct {v6, v7, v8}, Lew3;-><init>(Ltw3;B)V

    new-instance v15, Llw3;

    invoke-direct {v15, v1, v4}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v4, v7, Ltw3;->a:Lhx3;

    iget-object v4, v4, Lhx3;->n:Lfx3;

    iget-object v8, v7, Ltw3;->a:Lhx3;

    invoke-virtual {v8}, Lhx3;->y()Lcom/opera/android/Lazy;

    move-result-object v48

    invoke-virtual {v8}, Lhx3;->n()Lcom/opera/android/Lazy;

    move-result-object v49

    new-instance v9, Llw3;

    const/4 v13, 0x3

    invoke-direct {v9, v1, v13}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v10, Llw3;

    const/4 v11, 0x4

    invoke-direct {v10, v1, v11}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-static {v0}, Ltvg;->t(Landroid/content/Context;)Ltvg;

    move-result-object v52

    move-object v11, v8

    new-instance v8, Lpv3;

    const/4 v13, 0x0

    const/16 v14, 0x1c

    move-object/from16 v51, v10

    const-class v10, Lcom/opera/android/BrowserActivity;

    move-object v12, v11

    const-string v11, "purchasesProvider"

    move-object/from16 v16, v12

    const-string v12, "getPurchasesProvider()Lcom/opera/android/premium/ui/PurchasesProvider;"

    move-object/from16 v50, v9

    move-object v9, v0

    move-object/from16 v0, v16

    invoke-direct/range {v8 .. v14}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v9, Lwv1;

    const/4 v10, 0x2

    invoke-direct {v9, v8, v10}, Lwv1;-><init>(Lb6h;B)V

    iget-object v8, v0, Lhx3;->p:Lfx3;

    iget-object v10, v1, Lcom/opera/android/OperaApplication;->C:Lj4c;

    iget-object v11, v0, Lhx3;->o:Lfx3;

    move-object/from16 v54, v8

    new-instance v8, Lpv3;

    const/16 v14, 0x1d

    move-object/from16 v55, v10

    const-class v10, Lcom/opera/android/OperaApplication;

    move-object/from16 v56, v11

    const-string v11, "usageReporter"

    const-string v12, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    move-object/from16 v53, v9

    move-object v9, v1

    invoke-direct/range {v8 .. v14}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v1, Lwv1;

    const/4 v10, 0x2

    invoke-direct {v1, v8, v10}, Lwv1;-><init>(Lb6h;B)V

    new-instance v8, Lew3;

    const/16 v9, 0x10

    invoke-direct {v8, v7, v9}, Lew3;-><init>(Ltw3;B)V

    iget-object v0, v0, Lhx3;->m:Lfx3;

    new-instance v7, Lnu3;

    const/4 v9, 0x1

    invoke-direct {v7, v0, v9}, Lnu3;-><init>(Lcom/opera/android/Lazy;B)V

    move-object/from16 v57, v1

    move-object/from16 v42, v2

    move-object/from16 v43, v3

    move-object/from16 v47, v4

    move-object/from16 v44, v5

    move-object/from16 v45, v6

    move-object/from16 v59, v7

    move-object/from16 v58, v8

    move-object/from16 v46, v15

    invoke-direct/range {v41 .. v59}, Llm3;-><init>(Llw3;Lwv1;Lew3;Lew3;Llw3;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Lcom/opera/android/Lazy;Llw3;Llw3;Ltvg;Lwv1;Lcom/opera/android/Lazy;Lj4c;Lcom/opera/android/Lazy;Lwv1;Lew3;Lnu3;)V

    return-object v41

    :pswitch_823
    const/4 v10, 0x2

    new-instance v0, Lbmg;

    iget-object v1, v3, Ltw3;->k:Lzv3;

    new-instance v2, Lki;

    invoke-direct {v2, v1, v10}, Lki;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v2}, Lbmg;-><init>(Lki;)V

    return-object v0

    :pswitch_831
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v4, Ltlg;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v5

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v6

    iget-object v2, v3, Ltw3;->O:Lhw3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Le8k;

    invoke-static {v1}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object v8

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->G()Lmdh;

    move-result-object v9

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->I:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    move-object v10, v1

    check-cast v10, Lu8k;

    invoke-direct/range {v4 .. v10}, Ltlg;-><init>(Lnr8;Lcom/opera/android/settings/SettingsManager;Le8k;Lu59;Lmdh;Lu8k;)V

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, v4}, Ltcc;->a(Lmdc;)V

    return-object v4

    :pswitch_86a
    new-instance v0, Lmbf;

    iget-object v1, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    iget-object v2, v1, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    const/4 v3, 0x0

    if-nez v2, :cond_874

    move-object v2, v3

    :cond_874
    iget-object v4, v1, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-eqz v4, :cond_879

    move-object v3, v4

    :cond_879
    invoke-direct {v0, v2, v3}, Lmbf;-><init>(Lk6l;Lz43;)V

    invoke-virtual {v1}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-virtual {v1, v0}, Ltcc;->a(Lmdc;)V

    return-object v0

    :pswitch_884
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/OperaApplication;

    new-instance v4, Lsze;

    sget-object v6, Lvml;->e:Lwjh;

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    invoke-static {v1}, Lcqp;->V(Ltcc;)Lddc;

    move-result-object v7

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v8

    new-instance v9, Lmr3;

    const/4 v1, 0x6

    invoke-direct {v9, v1}, Lmr3;-><init>(B)V

    new-instance v10, Ltze;

    new-instance v0, Ljw3;

    const/4 v1, 0x0

    invoke-direct {v0, v5, v1}, Ljw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Ldw3;

    const/16 v11, 0x1a

    invoke-direct {v2, v5, v11}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v11, Ldw3;

    const/16 v12, 0x1b

    invoke-direct {v11, v5, v12}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v12, Llld;

    invoke-static {v5}, Ldj9;->t(Landroid/content/Context;)Ldj9;

    move-result-object v13

    const/4 v14, 0x7

    invoke-direct {v12, v13, v14}, Llld;-><init>(Ljava/lang/Object;B)V

    new-instance v13, Lix5;

    const/16 v14, 0xc

    invoke-direct {v13, v14}, Lix5;-><init>(B)V

    new-instance v14, Lkw3;

    invoke-direct {v14, v1}, Lkw3;-><init>(B)V

    new-instance v1, Ljw3;

    const/4 v15, 0x1

    invoke-direct {v1, v5, v15}, Ljw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object/from16 v47, v0

    new-instance v0, Liab;

    invoke-direct {v0, v5, v15}, Ls75;-><init>(Landroid/content/Context;I)V

    new-instance v15, Liab;

    move-object/from16 v54, v0

    const/4 v0, 0x4

    invoke-direct {v15, v5, v0}, Ls75;-><init>(Landroid/content/Context;I)V

    new-instance v0, Lhga;

    move-object/from16 v53, v1

    const/4 v1, 0x1

    invoke-direct {v0, v5, v1}, Lhga;-><init>(Ljava/lang/Object;B)V

    new-instance v1, Ldw3;

    move-object/from16 v56, v0

    const/16 v0, 0x1c

    invoke-direct {v1, v5, v0}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v0, Ldw3;

    move-object/from16 v57, v1

    const/16 v1, 0x1d

    invoke-direct {v0, v5, v1}, Ldw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v1, Lpjn;

    move-object/from16 v58, v0

    invoke-static {v5}, Lv1;->u(Landroid/content/Context;)Lv1;

    move-result-object v0

    move-object/from16 v48, v2

    const/4 v2, 0x4

    invoke-direct {v1, v0, v2}, Lpjn;-><init>(Ljava/lang/Object;B)V

    new-instance v0, Llw3;

    const/4 v2, 0x0

    invoke-direct {v0, v5, v2}, Llw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v2, Lew3;

    move-object/from16 v60, v0

    const/16 v0, 0xd

    invoke-direct {v2, v3, v0}, Lew3;-><init>(Ltw3;B)V

    move-object/from16 v59, v1

    move-object/from16 v61, v2

    move-object/from16 v46, v10

    move-object/from16 v49, v11

    move-object/from16 v50, v12

    move-object/from16 v51, v13

    move-object/from16 v52, v14

    move-object/from16 v55, v15

    invoke-direct/range {v46 .. v61}, Ltze;-><init>(Ljw3;Ldw3;Ldw3;Llld;Lix5;Lkw3;Ljw3;Liab;Liab;Lhga;Ldw3;Ldw3;Lpjn;Llw3;Lew3;)V

    iget-object v0, v5, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v0, v0, Lxv1;->h0:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v11, v0

    check-cast v11, Lbr6;

    invoke-direct/range {v4 .. v11}, Lsze;-><init>(Lcom/opera/android/OperaApplication;Lwjh;Lddc;Ltcc;Lmr3;Ltze;Lbr6;)V

    return-object v4

    :pswitch_93f
    new-instance v0, Liw3;

    invoke-direct {v0, v3}, Liw3;-><init>(Ltw3;)V

    return-object v0

    :pswitch_945
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v4, Lmue;

    invoke-static {v0}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v5

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->z()Lfue;

    move-result-object v6

    iget-object v2, v3, Ltw3;->a:Lhx3;

    invoke-virtual {v2}, Lhx3;->w()Lcom/opera/android/settings/SettingsManager;

    move-result-object v7

    invoke-virtual {v0}, Lcom/opera/android/BrowserActivity;->E0()Ldyf;

    move-result-object v8

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->o()Lnr8;

    move-result-object v9

    invoke-direct/range {v4 .. v9}, Lmue;-><init>(Lru9;Lfue;Lcom/opera/android/settings/SettingsManager;Ldyf;Lnr8;)V

    return-object v4

    :pswitch_96b
    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v3, Ltw3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v4, Lrte;

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v6

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->y()Lfqe;

    move-result-object v7

    new-instance v8, Lew3;

    const/16 v14, 0xc

    invoke-direct {v8, v3, v14}, Lew3;-><init>(Ltw3;B)V

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v9, v0, Ld6j;->c:Lx5f;

    invoke-direct/range {v4 .. v9}, Lrte;-><init>(Lcom/opera/android/BrowserActivity;Lgjm;Lfqe;Lew3;Lx5f;)V

    return-object v4

    :pswitch_data_990
    .packed-switch 0x0
        :pswitch_96b
        :pswitch_945
        :pswitch_93f
        :pswitch_884
        :pswitch_86a
        :pswitch_831
        :pswitch_823
        :pswitch_764
        :pswitch_74f
        :pswitch_721
        :pswitch_6f9
        :pswitch_6c4
        :pswitch_690
        :pswitch_666
        :pswitch_322
        :pswitch_2f8
        :pswitch_2cd
        :pswitch_2a9
        :pswitch_272
        :pswitch_258
        :pswitch_23c
        :pswitch_220
        :pswitch_1fe
        :pswitch_1cf
        :pswitch_1c0
        :pswitch_125
        :pswitch_fb
        :pswitch_90
        :pswitch_2e
    .end packed-switch
.end method
