.class public final Ljv3;
.super Lcom/opera/android/Lazy;
.source "SourceFile"


# instance fields
.field public final synthetic e:B

.field public final synthetic f:Lcom/opera/android/BrowserActivity;


# direct methods
.method public synthetic constructor <init>(Lcom/opera/android/BrowserActivity;B)V
    .registers 3

    iput-byte p2, p0, Ljv3;->e:B

    iput-object p1, p0, Ljv3;->f:Lcom/opera/android/BrowserActivity;

    invoke-direct {p0}, Lcom/opera/android/Lazy;-><init>()V

    return-void
.end method


# virtual methods
.method public final d()Ljava/lang/Object;
    .registers 29

    move-object/from16 v0, p0

    iget-byte v1, v0, Ljv3;->e:B

    const/4 v2, 0x1

    const/4 v3, 0x0

    iget-object v4, v0, Ljv3;->f:Lcom/opera/android/BrowserActivity;

    packed-switch v1, :pswitch_data_188

    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->G0:Lhw3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Le7k;

    return-object v0

    :pswitch_16
    iget-object v0, v4, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    iget-object v0, v0, Ltw3;->r:Lzv3;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljt3;

    iget-object v0, v0, Ljt3;->f:Lfd;

    return-object v0

    :pswitch_23
    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    iget-object v5, v0, Ljv3;->f:Lcom/opera/android/BrowserActivity;

    invoke-virtual {v5}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v0

    iget-object v1, v5, Lcom/opera/android/BrowserActivity;->y:Ltw3;

    move-object v7, v0

    check-cast v7, Lcom/opera/android/OperaApplication;

    new-instance v4, Lt42;

    const v0, 0x7f0a00d0

    invoke-virtual {v5, v0}, Lfp1;->findViewById(I)Landroid/view/View;

    move-result-object v0

    const v6, 0x7f0a008b

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v8, :cond_15c

    const v6, 0x7f0a00d1

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v11, v8

    check-cast v11, Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;

    if-eqz v11, :cond_15c

    const v6, 0x7f0a00d2

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v12, v8

    check-cast v12, Lcom/opera/android/widget/MeasurableHeightScrollView;

    if-eqz v12, :cond_15c

    move-object v10, v0

    check-cast v10, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    const v6, 0x7f0a00d4

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v13, v8

    check-cast v13, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v13, :cond_15c

    const v6, 0x7f0a022f

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v8, :cond_15c

    const v6, 0x7f0a04c3

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    if-eqz v8, :cond_15c

    invoke-static {v8}, Lrvg;->a(Landroid/view/View;)Lrvg;

    move-result-object v14

    const v6, 0x7f0a05f1

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object v15, v8

    check-cast v15, Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;

    if-eqz v15, :cond_15c

    const v6, 0x7f0a0753

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v8, :cond_15c

    const v6, 0x7f0a0b86

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v16

    if-eqz v16, :cond_15c

    const v6, 0x7f0a0cda

    invoke-static {v6, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    move-object/from16 v17, v8

    check-cast v17, Lcom/opera/android/webcore/FastResizeWebViewContainer;

    if-eqz v17, :cond_15c

    new-instance v6, Lei;

    move-object v9, v6

    invoke-direct/range {v9 .. v17}, Lei;-><init>(Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;Lcom/opera/android/webaiassistant/WebAiAssistantSheetContentWrapper;Lcom/opera/android/widget/MeasurableHeightScrollView;Landroidx/constraintlayout/widget/ConstraintLayout;Lrvg;Lcom/opera/android/webaiassistant/WebAiAssistantLayoutSwitcher;Landroid/view/View;Lcom/opera/android/webcore/FastResizeWebViewContainer;)V

    move-object v0, v9

    iget-object v6, v5, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v6, :cond_bc

    move-object v3, v6

    :cond_bc
    invoke-virtual {v5}, Lxd5;->getLifecycle()Ltcc;

    move-result-object v13

    iget-object v14, v5, Lhjf;->a:Ldll;

    iget-object v15, v1, Ltw3;->r0:Lzv3;

    iget-object v6, v1, Ltw3;->e:Lzv3;

    new-instance v8, Lgv3;

    const/4 v9, 0x2

    invoke-direct {v8, v5, v9}, Lgv3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v16, v13

    new-instance v13, Lgv3;

    const/4 v9, 0x3

    invoke-direct {v13, v5, v9}, Lgv3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v17, v14

    new-instance v14, Lgv3;

    const/4 v9, 0x4

    invoke-direct {v14, v5, v9}, Lgv3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v18, v15

    new-instance v15, Lji;

    const/16 v9, 0x10

    invoke-direct {v15, v7, v9}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v9, v1, Ltw3;->c0:Lzv3;

    iget-object v10, v1, Ltw3;->a:Lhx3;

    invoke-virtual {v10}, Lhx3;->e()Lcom/opera/android/Lazy;

    iget-object v10, v1, Ltw3;->a:Lhx3;

    iget-object v10, v10, Lhx3;->q:Lfx3;

    move-object v11, v6

    new-instance v6, Lli;

    move-object v12, v11

    const/4 v11, 0x0

    move-object/from16 v19, v12

    const/16 v12, 0x14

    move-object/from16 v20, v8

    const-class v8, Lcom/opera/android/OperaApplication;

    move-object/from16 v21, v9

    const-string v9, "usageReporter"

    move-object/from16 v22, v10

    const-string v10, "getUsageReporter()Lcom/opera/android/analytics/UsageReporter;"

    invoke-direct/range {v6 .. v12}, Lli;-><init>(Ljava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    new-instance v8, Lwv1;

    invoke-direct {v8, v6, v2}, Lwv1;-><init>(Lb6h;B)V

    move-object/from16 v11, v19

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->e()Lj4c;

    move-result-object v19

    iget-object v2, v1, Ltw3;->f0:Lrw3;

    new-instance v6, Lgv3;

    const/4 v9, 0x5

    invoke-direct {v6, v5, v9}, Lgv3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    move-object/from16 v9, v17

    move-object/from16 v17, v22

    invoke-virtual {v5}, Lcom/opera/android/BrowserActivity;->P0()Lgjm;

    move-result-object v22

    iget-object v10, v1, Ltw3;->t0:Lhw3;

    iget-object v10, v1, Ltw3;->u0:Lii;

    invoke-virtual {v10}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v10

    move-object/from16 v23, v10

    check-cast v23, Ly22;

    new-instance v10, Lji;

    const/16 v12, 0x11

    invoke-direct {v10, v7, v12}, Lji;-><init>(Lcom/opera/android/OperaApplication;B)V

    iget-object v1, v1, Ltw3;->h:Lj4c;

    iget-object v12, v5, Ldx3;->o:Lqim;

    invoke-static {v12}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v7}, Lcom/opera/android/OperaApplication;->B()Lqwe;

    move-result-object v27

    move-object/from16 v25, v1

    move-object v7, v3

    move-object/from16 v24, v10

    move-object/from16 v26, v12

    move-object/from16 v10, v18

    move-object/from16 v12, v20

    move-object/from16 v20, v2

    move-object/from16 v18, v8

    move-object/from16 v8, v16

    move-object/from16 v16, v21

    move-object/from16 v21, v6

    move-object v6, v0

    invoke-direct/range {v4 .. v27}, Lt42;-><init>(Lcom/opera/android/BrowserActivity;Lei;Lk6l;Ltcc;Ldll;Lzv3;Lzv3;Lgv3;Lgv3;Lgv3;Lji;Lzv3;Lcom/opera/android/Lazy;Lwv1;Lj4c;Lrw3;Lgv3;Lgjm;Ly22;Lji;Lj4c;Lqim;Lqwe;)V

    move-object v3, v4

    goto :goto_16d

    :cond_15c
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v6}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    :goto_16d
    return-object v3

    :pswitch_16e
    new-instance v0, Lex0;

    iget-object v1, v4, Lcom/opera/android/BrowserActivity;->C0:Lj4c;

    iget-object v2, v4, Lcom/opera/android/BrowserActivity;->V:Lk6l;

    if-eqz v2, :cond_177

    move-object v3, v2

    :cond_177
    invoke-direct {v0, v4, v1, v3}, Lex0;-><init>(Lndc;Lj4c;Lk6l;)V

    return-object v0

    :pswitch_17b
    new-instance v0, Lzw0;

    sget-object v1, Lyne;->b:Ldeg;

    new-instance v3, Lgv3;

    invoke-direct {v3, v4, v2}, Lgv3;-><init>(Lcom/opera/android/BrowserActivity;B)V

    invoke-direct {v0, v1, v3}, Lzw0;-><init>(Ldeg;Lgv3;)V

    return-object v0

    :pswitch_data_188
    .packed-switch 0x0
        :pswitch_17b
        :pswitch_16e
        :pswitch_23
        :pswitch_16
    .end packed-switch
.end method
