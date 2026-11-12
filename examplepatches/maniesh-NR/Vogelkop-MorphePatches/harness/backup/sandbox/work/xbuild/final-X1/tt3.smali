.class public final synthetic Ltt3;
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

    iput-byte p2, p0, Ltt3;->a:B

    iput-object p1, p0, Ltt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final get()Ljava/lang/Object;
    .registers 31

    move-object/from16 v0, p0

    iget-byte v1, v0, Ltt3;->a:B

    const/4 v3, 0x0

    iget-object v4, v0, Ltt3;->b:Lcom/opera/android/BrowserActivity;

    packed-switch v1, :pswitch_data_224

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_11
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->O0()Lntl;

    move-result-object v0

    return-object v0

    :pswitch_18
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_1f
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->O0()Lntl;

    move-result-object v0

    return-object v0

    :pswitch_26
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_2d
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_34
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->O0()Lntl;

    move-result-object v0

    return-object v0

    :pswitch_3b
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    iget-object v3, v0, Ltt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v3}, Ldx3;->P()Lcom/opera/android/browser/BrowserFragment;

    move-result-object v0

    invoke-virtual {v0}, Lcom/opera/android/browser/BrowserFragment;->f0()Lcom/opera/android/browser/BrowserFragmentFrameLayout;

    move-result-object v0

    new-instance v2, Linn;

    iget-object v4, v0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->b:Lpde;

    iget-object v5, v0, Lcom/opera/android/browser/BrowserFragmentFrameLayout;->c:Lpde;

    iget-object v0, v3, Lcom/opera/android/BrowserActivity;->s1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lykn;

    iget-object v7, v3, Lcom/opera/android/BrowserActivity;->z1:Lj4c;

    invoke-direct/range {v2 .. v7}, Linn;-><init>(Lndc;Lpde;Lpde;Lykn;Lj4c;)V

    return-object v2

    :pswitch_5c
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_63
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->E:Lt82;

    if-eqz v0, :cond_68

    move-object v3, v0

    :cond_68
    return-object v3

    :pswitch_69
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->E:Lt82;

    if-eqz v0, :cond_6e

    move-object v3, v0

    :cond_6e
    return-object v3

    :pswitch_6f
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->A1:Lj4c;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ldq9;

    iget-object v0, v0, Ldq9;->b:Ljze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/Boolean;

    return-object v0

    :pswitch_80
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_87
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_8e
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_95
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_9c
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_a3
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_aa
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_b1
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_b8
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_bf
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_c6
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_cd
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_d4
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_db
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v0, Ltt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/OperaApplication;

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->A:Lcom/opera/android/bar/BottomBar;

    iget-object v1, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    if-nez v0, :cond_ef

    move-object v0, v3

    :cond_ef
    const v4, 0x7f0a0112

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v4, 0x7f0a0111

    invoke-virtual {v0, v4}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/view/ViewStub;

    invoke-virtual {v4}, Landroid/view/ViewStub;->inflate()Landroid/view/View;

    move-result-object v4

    move-object v6, v4

    new-instance v4, Lb22;

    iget-object v8, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v8, :cond_10b

    move-object v3, v8

    :cond_10b
    invoke-virtual {v5}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v13

    iget-object v14, v5, Lhjf;->a:Ldll;

    iget-object v15, v1, Ltw3;->r0:Lzv3;

    iget-object v8, v1, Ltw3;->a:Lhx3;

    iget-object v9, v1, Ltw3;->e:Lzv3;

    new-instance v10, Ldu3;

    const/4 v11, 0x7

    invoke-direct {v10, v5, v11}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v12, Ldu3;

    const/16 v2, 0x8

    invoke-direct {v12, v5, v2}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v17, v13

    new-instance v13, Ldu3;

    const/16 v2, 0x9

    invoke-direct {v13, v5, v2}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object v2, v14

    new-instance v14, Lji;

    invoke-direct {v14, v7, v11}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    move-object/from16 v18, v15

    iget-object v15, v1, Ltw3;->c0:Lzv3;

    const/16 v19, 0x1

    invoke-virtual {v8}, Lhx3;->e()Lcom/opera/android/Lazy;

    move-result-object v16

    invoke-static {v6}, Lrvg;->a(Landroid/view/View;)Lrvg;

    move-result-object v20

    iget-object v6, v8, Lhx3;->q:Lfx3;

    check-cast v0, Landroid/view/ViewGroup;

    move-object v8, v6

    new-instance v6, Lli;

    const/4 v11, 0x0

    move-object/from16 v21, v12

    const/16 v12, 0x13

    move-object/from16 v22, v8

    const-class v8, Lcom/opera/android/OperaApplication;

    move-object/from16 v23, v9

    const-string v9, "usageReporter"

    move-object/from16 v24, v10

    const-string v10, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v6 .. v12}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v8, Lwv1;

    move/from16 v9, v19

    invoke-direct {v8, v6, v9}, Lwv1;-><init>(Lb6h;B)V

    move-object/from16 v12, v21

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v21

    iget-object v6, v1, Ltw3;->f0:Lrw3;

    new-instance v9, Ldu3;

    const/16 v10, 0xa

    invoke-direct {v9, v5, v10}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v11, v24

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v24

    iget-object v10, v1, Ltw3;->t0:Lhw3;

    move-object/from16 v19, v0

    iget-object v0, v1, Ltw3;->u0:Lii;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    move-object/from16 v26, v0

    check-cast v26, Ly22;

    new-instance v0, Lji;

    move-object/from16 v25, v2

    const/16 v2, 0x8

    invoke-direct {v0, v7, v2}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v1, v1, Ltw3;->h:Lj4c;

    iget-object v2, v5, Ldx3;->o:Lqim;

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    move-object/from16 v27, v0

    move-object/from16 v28, v1

    move-object/from16 v29, v2

    move-object/from16 v7, v17

    move-object/from16 v17, v20

    move-object/from16 v20, v8

    move-object/from16 v8, v25

    move-object/from16 v25, v10

    move-object/from16 v10, v23

    move-object/from16 v23, v9

    move-object/from16 v9, v18

    move-object/from16 v18, v22

    move-object/from16 v22, v6

    move-object v6, v3

    invoke-direct/range {v4 .. v29}, Lb22;-><init>(Lcom/opera/android/BrowserActivity;Lk6l;Ltcc;Ldll;Lzv3;Lzv3;Ldu3;Ldu3;Ldu3;Lji;Lzv3;Lcom/opera/android/Lazy;Lrvg;Lcom/opera/android/Lazy;Landroid/view/ViewGroup;Lwv1;Lj4c;Lrw3;Ldu3;Lgjm;Lhw3;Ly22;Lji;Lj4c;Lqim;)V

    return-object v4

    :pswitch_1b5
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_1bc
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-static {v4}, Lru9;->c(Landroid/content/Context;)Lru9;

    move-result-object v0

    return-object v0

    :pswitch_1c3
    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {v4}, Lcom/opera/android/BrowserActivity;->H0()Lcom/opera/android/settings/SettingsManager;

    move-result-object v0

    return-object v0

    :pswitch_1ca
    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v0, Ltt3;->b:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/OperaApplication;

    iget-object v0, v5, Lcom/opera/android/BrowserActivity;->z:Lz43;

    if-eqz v0, :cond_1dd

    move-object v4, v0

    goto :goto_1de

    :cond_1dd
    move-object v4, v3

    :goto_1de
    new-instance v6, Lpv3;

    const/4 v11, 0x0

    const/16 v12, 0x16

    const-class v8, Lcom/opera/android/OperaApplication;

    const-string v9, "settingsManager"

    const-string v10, "getSettingsManager()Lcom/opera/android/settings/SettingsManager;"

    invoke-direct/range {v6 .. v12}, Lpv3;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v0, Lwv1;

    const/4 v9, 0x1

    invoke-direct {v0, v6, v9}, Lwv1;-><init>(Lb6h;B)V

    move-object v1, v7

    new-instance v7, Ldu3;

    const/16 v2, 0xb

    invoke-direct {v7, v5, v2}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    iget-object v2, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v2, v2, Ltw3;->E:Lhw3;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    move-object v8, v2

    check-cast v8, Lnue;

    new-instance v9, Ldu3;

    const/16 v2, 0xd

    invoke-direct {v9, v5, v2}, Ldu3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    new-instance v10, Lnwf;

    new-instance v2, Lhv3;

    invoke-direct {v2, v5}, Lhv3;-><init>(Lcom/opera/android/BrowserActivity;)V

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v1

    iget-object v1, v1, Ld6j;->c:Lx5f;

    const/4 v3, 0x1

    invoke-direct {v10, v2, v1, v3}, Lnwf;-><init>(Lhv3;Ljava/lang/Object;B)V

    move-object v6, v0

    invoke-virtual/range {v4 .. v10}, Lz43;->c(Landroid/content/Context;Lwv1;Ldu3;Lnue;Ldu3;Lnwf;)Ldbl;

    move-result-object v0

    return-object v0

    nop

    :pswitch_data_224
    .packed-switch 0x0
        :pswitch_1ca
        :pswitch_1c3
        :pswitch_1bc
        :pswitch_1b5
        :pswitch_db
        :pswitch_d4
        :pswitch_cd
        :pswitch_c6
        :pswitch_bf
        :pswitch_b8
        :pswitch_b1
        :pswitch_aa
        :pswitch_a3
        :pswitch_9c
        :pswitch_95
        :pswitch_8e
        :pswitch_87
        :pswitch_80
        :pswitch_6f
        :pswitch_69
        :pswitch_63
        :pswitch_5c
        :pswitch_3b
        :pswitch_34
        :pswitch_2d
        :pswitch_26
        :pswitch_1f
        :pswitch_18
        :pswitch_11
    .end packed-switch
.end method
