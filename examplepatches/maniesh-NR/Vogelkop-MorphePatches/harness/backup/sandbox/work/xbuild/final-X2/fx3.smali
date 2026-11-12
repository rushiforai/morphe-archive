.class public final Lfx3;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lhx3;


# direct methods
.method public synthetic constructor <init>(Lhx3;B)V
    .registers 3

    iput-byte p2, p0, Lfx3;->e:B

    iput-object p1, p0, Lfx3;->f:Lhx3;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 28

    move-object/from16 v0, p0

    iget-byte v1, v0, Lfx3;->e:B

    const/4 v2, 0x4

    const/16 v3, 0x19

    const/16 v4, 0x18

    const/4 v5, 0x1

    const/16 v6, 0x1a

    const/4 v7, 0x5

    const/4 v8, 0x6

    const/16 v9, 0x8

    const/4 v10, 0x7

    iget-object v0, v0, Lfx3;->f:Lhx3;

    packed-switch v1, :pswitch_data_31c

    new-instance v1, Lcdn;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v0}, Ldx3;->W()Lk6l;

    move-result-object v3

    invoke-virtual {v0}, Ldx3;->O()Leej;

    move-result-object v0

    invoke-direct {v1, v2, v3, v0}, Lcdn;-><init>(Landroid/content/Context;Lk6l;Leej;)V

    return-object v1

    :pswitch_2a
    new-instance v10, Ljbn;

    iget-object v12, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v12}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v11

    new-instance v13, Loc2;

    invoke-direct {v13, v0, v6}, Loc2;-><init>(Ljava/lang/Object;B)V

    new-instance v14, Lumk;

    invoke-virtual {v12}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    sget-object v2, Lvml;->d:Lumi;

    invoke-direct {v14, v1, v2, v5}, Lumk;-><init>(Landroid/content/Context;Lumi;B)V

    new-instance v15, Ll45;

    invoke-direct {v15, v12, v4}, Ll45;-><init>(Landroid/content/Context;B)V

    invoke-direct/range {v10 .. v15}, Ljbn;-><init>(Landroid/content/Context;Loi;Loc2;Lumk;Ll45;)V

    iget-object v1, v0, Lhx3;->c:Lumi;

    new-instance v2, Lgb3;

    invoke-direct {v2, v10, v0, v9}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v2}, Lfac;->C(Lumi;Lkotlin/jvm/functions/Function0;)Loml;

    return-object v10

    :pswitch_55
    new-instance v1, Lgjm;

    iget-object v4, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v4}, Landroidx/fragment/app/r;->getSupportFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    invoke-virtual {v4}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v10

    new-instance v2, Lr2;

    const/4 v8, 0x0

    const/16 v9, 0xe

    const/4 v3, 0x1

    const-class v5, Ldx3;

    const-string v6, "resolveFragmentProperties"

    const-string v7, "resolveFragmentProperties(Ljava/lang/Class;)Lcom/opera/android/ui/navigation/UiNavigatorImpl$FragmentProperties;"

    invoke-direct/range {v2 .. v9}, Lr2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v1, v0, v10, v2}, Lgjm;-><init>(Landroidx/fragment/app/w;Ltcc;Lkotlin/jvm/functions/Function1;)V

    return-object v1

    :pswitch_74
    new-instance v1, Lu4l;

    iget-object v0, v0, Lhx3;->c:Lumi;

    invoke-direct {v1, v0}, Lu4l;-><init>(Lumi;)V

    return-object v1

    :pswitch_7c
    new-instance v1, Ltgi;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object v0

    iget v0, v0, Landroid/util/DisplayMetrics;->density:F

    invoke-direct {v1, v0}, Ltgi;-><init>(F)V

    return-object v1

    :pswitch_8e
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v3, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lyvg;

    invoke-virtual {v3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v4

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object v5

    iget-object v6, v3, Ldx3;->o:Lqim;

    invoke-static {v6}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v6, v6, Lqim;->c:Lz77;

    iget-object v7, v0, Lhx3;->c:Lumi;

    new-instance v8, Lc1a;

    invoke-virtual {v3}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v9

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->R()Lydn;

    move-result-object v10

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->M()Lslk;

    move-result-object v11

    iget-object v12, v3, Ldx3;->o:Lqim;

    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v12, v12, Lqim;->c:Lz77;

    iget-object v0, v0, Lhx3;->p:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v13, v0

    check-cast v13, Lgjm;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v14, v0, Ld6j;->c:Lx5f;

    invoke-direct/range {v8 .. v14}, Lc1a;-><init>(Ltcc;Lydn;Lslk;Lz77;Lgjm;Lx5f;)V

    invoke-direct/range {v2 .. v8}, Lyvg;-><init>(Landroid/content/Context;Ltcc;Lgmk;Lz77;Lumi;Lc1a;)V

    return-object v2

    :pswitch_d6
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v3, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v3}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lnvg;

    iget-object v4, v0, Lhx3;->p:Lfx3;

    new-instance v5, Lki;

    invoke-direct {v5, v4, v10}, Lki;-><init>(Ljava/lang/Object;B)V

    move-object v4, v5

    new-instance v5, Lp8f;

    iget-object v6, v0, Lhx3;->c:Lumi;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v7

    iget-object v7, v7, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v8

    iget-object v8, v8, Ld6j;->d:Lx5f;

    invoke-direct {v5, v3, v6, v7, v8}, Lp8f;-><init>(Landroid/content/Context;Lumi;Lx5f;Lx5f;)V

    iget-object v6, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v6, v6, Lxv1;->u0:Lj4c;

    invoke-virtual {v6}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lvvg;

    iget-object v0, v0, Lhx3;->o:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lyvg;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->E()Lgmk;

    move-result-object v8

    new-instance v9, Lnw3;

    const/16 v0, 0x1b

    invoke-direct {v9, v1, v0}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    invoke-direct/range {v2 .. v9}, Lnvg;-><init>(Landroidx/fragment/app/r;Lki;Lp8f;Lvvg;Lyvg;Lgmk;Lnw3;)V

    return-object v2

    :pswitch_11f
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v2, Lyug;

    new-instance v3, Let3;

    invoke-direct {v3, v1, v10}, Let3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v11, Lq2;

    iget-object v13, v0, Lhx3;->p:Lfx3;

    const/16 v17, 0x0

    const/16 v18, 0xe

    const/4 v12, 0x0

    const-class v22, Lcom/opera/android/Lazy;

    const-string v15, "get"

    const-string v16, "get()Ljava/lang/Object;"

    move-object/from16 v14, v22

    invoke-direct/range {v11 .. v18}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v19, Lq2;

    iget-object v0, v0, Lhx3;->n:Lfx3;

    const/16 v25, 0x0

    const/16 v26, 0xf

    const/16 v20, 0x0

    const-string v23, "get"

    const-string v24, "get()Ljava/lang/Object;"

    move-object/from16 v21, v0

    invoke-direct/range {v19 .. v26}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    move-object/from16 v0, v19

    invoke-direct {v2, v3, v11, v0}, Lyug;-><init>(Let3;Lq2;Lq2;)V

    return-object v2

    :pswitch_15d
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    new-instance v3, Liv7;

    invoke-virtual {v1}, Ldx3;->W()Lk6l;

    move-result-object v4

    invoke-static {v4}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v2

    iget-object v0, v0, Lhx3;->d:Lfx3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llg;

    invoke-direct {v3, v1, v4, v2, v0}, Liv7;-><init>(Lndc;Lk6l;Lq6e;Llg;)V

    return-object v3

    :pswitch_180
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v11, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v11}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v10, Lxg7;

    new-instance v12, Lnw3;

    const/16 v2, 0x17

    invoke-direct {v12, v1, v2}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v13, Lnw3;

    invoke-direct {v13, v1, v4}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v14, Lnw3;

    invoke-direct {v14, v1, v3}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    new-instance v15, Lgx3;

    invoke-direct {v15, v0, v9}, Lgx3;-><init>(Lhx3;B)V

    new-instance v2, Lnw3;

    invoke-direct {v2, v1, v6}, Lnw3;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v0, v0, Lhx3;->p:Lfx3;

    move-object/from16 v17, v0

    move-object/from16 v16, v2

    invoke-direct/range {v10 .. v17}, Lxg7;-><init>(Landroid/content/Context;Lnw3;Lnw3;Lnw3;Lgx3;Lnw3;Lfx3;)V

    return-object v10

    :pswitch_1b1
    new-instance v1, Li9c;

    move-object v2, v1

    iget-object v1, v0, Lhx3;->c:Lumi;

    sget-object v4, Lngh;->a:Lr16;

    move-object v4, v2

    iget-object v2, v0, Lhx3;->b:Ldx3;

    new-instance v0, Lkw3;

    invoke-direct {v0, v8}, Lkw3;-><init>(B)V

    sget-object v5, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v5

    check-cast v5, Lcom/opera/android/OperaApplication;

    iget-object v5, v5, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v5}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Llpe;

    iget-object v5, v5, Llpe;->o:Lplh;

    invoke-static {v5}, Lxf8;->u(Lf99;)Lhx5;

    move-result-object v5

    move-object v6, v0

    move-object v0, v4

    move-object v4, v5

    new-instance v5, Lydp;

    invoke-direct {v5, v3}, Lydp;-><init>(B)V

    move-object v3, v6

    sget-object v6, Lxne;->b:Lii;

    invoke-direct/range {v0 .. v6}, Li9c;-><init>(Lumi;Lndc;Lkw3;Lhx5;Lydp;Lii;)V

    return-object v0

    :pswitch_1e5
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v2, v0

    check-cast v2, Lcom/opera/android/OperaApplication;

    new-instance v0, Leq9;

    sget-object v8, Lvml;->d:Lumi;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v10, v1, Ld6j;->c:Lx5f;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v11, v1, Ld6j;->e:Lhd;

    new-instance v1, Lpw3;

    const/4 v6, 0x0

    const/4 v7, 0x2

    const-class v3, Lcom/opera/android/OperaApplication;

    const-string v4, "vpnManager"

    const-string v5, "getVpnManager()Lcom/opera/android/vpn/VpnManager;"

    invoke-direct/range {v1 .. v7}, Lpw3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v2, Lki;

    invoke-direct {v2, v1, v9}, Lki;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v8, v10, v11, v2}, Leq9;-><init>(Lumi;Lx5f;Lhd;Lki;)V

    return-object v0

    :pswitch_216
    new-instance v1, Ltz8;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-direct {v1}, Ljava/lang/Object;-><init>()V

    iput-object v0, v1, Ltz8;->a:Landroid/app/Activity;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    return-object v1

    :pswitch_227
    new-instance v1, Lvo7;

    new-instance v3, Lgx3;

    const/4 v4, 0x2

    invoke-direct {v3, v0, v4}, Lgx3;-><init>(Lhx3;B)V

    new-instance v4, Lgx3;

    const/4 v5, 0x3

    invoke-direct {v4, v0, v5}, Lgx3;-><init>(Lhx3;B)V

    new-instance v5, Lmr3;

    invoke-direct {v5, v10}, Lmr3;-><init>(B)V

    new-instance v6, Lyqa;

    new-instance v9, Lgx3;

    invoke-direct {v9, v0, v2}, Lgx3;-><init>(Lhx3;B)V

    new-instance v2, Lgx3;

    invoke-direct {v2, v0, v7}, Lgx3;-><init>(Lhx3;B)V

    const/16 v11, 0xd

    invoke-direct {v6, v9, v2, v11}, Lyqa;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance v2, Lkw3;

    invoke-direct {v2, v7}, Lkw3;-><init>(B)V

    new-instance v7, Lqq6;

    new-instance v9, Lgx3;

    invoke-direct {v9, v0, v8}, Lgx3;-><init>(Lhx3;B)V

    invoke-direct {v7, v9, v10}, Lqq6;-><init>(Ljava/lang/Object;B)V

    new-instance v9, Lgx3;

    invoke-direct {v9, v0, v10}, Lgx3;-><init>(Lhx3;B)V

    move-object v8, v7

    move-object v7, v2

    move-object v2, v1

    invoke-direct/range {v2 .. v9}, Lvo7;-><init>(Lesk;Lesk;Lkotlin/jvm/functions/Function1;Lyqa;Lesk;Lqq6;Lesk;)V

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v0}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v0

    invoke-virtual {v0, v2}, Ltcc;->a(Lmdc;)V

    return-object v2

    :pswitch_26f
    new-instance v3, Lmm6;

    iget-object v9, v0, Lhx3;->b:Ldx3;

    iget-object v1, v9, Ldx3;->o:Lqim;

    invoke-static {v1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v4, Lki;

    invoke-direct {v4, v1, v2}, Lki;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Lhx3;->a:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Lmi;

    iget-object v5, v0, Lmi;->m:Lhi;

    invoke-static {v9}, Lu59;->C(Landroid/content/Context;)Lu59;

    move-result-object v0

    new-instance v6, Lki;

    invoke-direct {v6, v0, v7}, Lki;-><init>(Ljava/lang/Object;B)V

    invoke-static {v9}, Lxnh;->t(Landroid/content/Context;)Lxnh;

    move-result-object v0

    new-instance v7, Lki;

    invoke-direct {v7, v0, v8}, Lki;-><init>(Ljava/lang/Object;B)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v9}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    iget-object v0, v0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Llpe;

    iget-object v8, v0, Llpe;->c:Lcq5;

    invoke-virtual {v9}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v10, v0, Ld6j;->c:Lx5f;

    invoke-direct/range {v3 .. v10}, Lmm6;-><init>(Lki;Lcom/opera/android/Lazy;Lki;Lki;Lcq5;Loi;Lx5f;)V

    return-object v3

    :pswitch_2b9
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v1, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v1}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    new-instance v6, Lul3;

    iget-object v2, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->r:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v7, v2

    check-cast v7, Lin3;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v2

    iget-object v8, v2, Ld6j;->c:Lx5f;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v9

    iget-object v1, v0, Lhx3;->a:Lxbf;

    iget-object v1, v1, Lxbf;->b:Ljava/lang/Object;

    check-cast v1, Lmi;

    iget-object v10, v1, Lmi;->z:Lhi;

    new-instance v11, Lgx3;

    const/4 v1, 0x0

    invoke-direct {v11, v0, v1}, Lgx3;-><init>(Lhx3;B)V

    new-instance v12, Lgx3;

    invoke-direct {v12, v0, v5}, Lgx3;-><init>(Lhx3;B)V

    iget-object v13, v0, Lhx3;->p:Lfx3;

    invoke-direct/range {v6 .. v13}, Lul3;-><init>(Lin3;Lx5f;Li53;Lcom/opera/android/Lazy;Lgx3;Lgx3;Lfx3;)V

    return-object v6

    :pswitch_2f3
    iget-object v0, v0, Lhx3;->b:Ldx3;

    const v1, 0x7f0a0129

    invoke-virtual {v0, v1}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v1

    check-cast v1, Landroid/view/ViewGroup;

    if-eqz v1, :cond_306

    new-instance v2, Lbt2;

    invoke-direct {v2, v0, v1}, Lbt2;-><init>(Ldx3;Landroid/view/ViewGroup;)V

    goto :goto_307

    :cond_306
    const/4 v2, 0x0

    :goto_307
    return-object v2

    :pswitch_308
    new-instance v1, Llg;

    sget-object v2, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v0, v0, Lhx3;->b:Ldx3;

    invoke-virtual {v0}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->I()Lq6e;

    move-result-object v0

    invoke-direct {v1, v0}, Llg;-><init>(Lq6e;)V

    return-object v1

    :pswitch_data_31c
    .packed-switch 0x0
        :pswitch_308
        :pswitch_2f3
        :pswitch_2b9
        :pswitch_26f
        :pswitch_227
        :pswitch_216
        :pswitch_1e5
        :pswitch_1b1
        :pswitch_180
        :pswitch_15d
        :pswitch_11f
        :pswitch_d6
        :pswitch_8e
        :pswitch_7c
        :pswitch_74
        :pswitch_55
        :pswitch_2a
    .end packed-switch
.end method
