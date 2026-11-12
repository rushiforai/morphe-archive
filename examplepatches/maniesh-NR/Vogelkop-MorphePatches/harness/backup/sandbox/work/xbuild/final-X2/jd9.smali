.class public Ljd9;
.super Ls63;
.source "SourceFile"


# instance fields
.field public l:Z

.field public m:Z

.field public n:Z

.field public o:Z

.field public p:Lx79;

.field public q:Llfh;

.field public final r:Lhd9;


# direct methods
.method public constructor <init>()V
    .registers 2

    invoke-direct {p0}, Ls63;-><init>()V

    new-instance v0, Lhd9;

    invoke-direct {v0, p0}, Lhd9;-><init>(Ljd9;)V

    iput-object v0, p0, Ljd9;->r:Lhd9;

    return-void
.end method


# virtual methods
.method public final onAttach(Landroid/content/Context;)V
    .registers 2

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p1

    iget-object p0, p0, Ljd9;->r:Lhd9;

    iget-object p1, p1, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {p1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void
.end method

.method public final onDetach()V
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    iget-object v1, p0, Ljd9;->r:Lhd9;

    iget-object v0, v0, Landroidx/fragment/app/w;->o:Ljava/util/ArrayList;

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-super {p0}, Lk24;->onDetach()V

    return-void
.end method

.method public final s0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Lepj;)Ldgh;
    .registers 27

    move-object/from16 v0, p0

    move-object/from16 v1, p1

    move-object/from16 v2, p2

    invoke-virtual/range {p3 .. p3}, Ljava/lang/Enum;->ordinal()I

    move-result v3

    const/4 v5, 0x2

    const/4 v6, 0x1

    const-string v8, "parent"

    const-string v9, "Missing required view with ID: "

    const v10, 0x7f0a0bd6

    const v11, 0x7f0a0aad

    const v12, 0x7f0a07c5

    const v13, 0x7f0a06b5

    const v14, 0x7f0a0619

    const v15, 0x7f0a0549

    const/16 p3, 0x0

    const v7, 0x7f0a02a3

    const/16 v16, 0x0

    const v4, 0x7f0a01c5

    if-eqz v3, :cond_c4

    if-eq v3, v6, :cond_3c

    if-eq v3, v5, :cond_3c

    const/4 v5, 0x3

    if-eq v3, v5, :cond_3c

    const/4 v5, 0x4

    if-eq v3, v5, :cond_3c

    invoke-static {}, Lh9o;->p()V

    return-object p3

    :cond_3c
    if-eqz v2, :cond_c0

    const v3, 0x7f0d01ca

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroidx/camera/view/PreviewView;

    if-eqz v18, :cond_af

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_ad

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_ab

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v22, :cond_a9

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_a7

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/google/android/material/button/MaterialButton;

    if-eqz v19, :cond_a5

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/Spinner;

    if-eqz v1, :cond_a3

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_b0

    new-instance v17, Lx79;

    new-instance v1, Lhck;

    new-instance v3, Lgxh;

    const/high16 v4, -0x1000000

    invoke-direct {v3, v4}, Lgxh;-><init>(I)V

    invoke-direct {v1, v3}, Lhck;-><init>(Lcxh;)V

    move-object/from16 v21, v1

    invoke-direct/range {v17 .. v22}, Lx79;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    :goto_9f
    move-object/from16 v1, v17

    goto/16 :goto_142

    :cond_a3
    move v10, v11

    goto :goto_b0

    :cond_a5
    move v10, v12

    goto :goto_b0

    :cond_a7
    move v10, v13

    goto :goto_b0

    :cond_a9
    move v10, v14

    goto :goto_b0

    :cond_ab
    move v10, v15

    goto :goto_b0

    :cond_ad
    move v10, v7

    goto :goto_b0

    :cond_af
    move v10, v4

    :cond_b0
    :goto_b0
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_c0
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_c4
    if-eqz v2, :cond_1aa

    const v3, 0x7f0d01cb

    invoke-virtual {v1, v3, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    invoke-static {v4, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v18, v1

    check-cast v18, Landroidx/camera/view/PreviewView;

    if-eqz v18, :cond_199

    invoke-static {v7, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/touch/CurveOverlayView;

    if-eqz v1, :cond_197

    const v1, 0x7f0a0390

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Landroid/widget/LinearLayout;

    if-eqz v3, :cond_195

    invoke-static {v15, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    if-eqz v1, :cond_193

    invoke-static {v14, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v22, v1

    check-cast v22, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v22, :cond_191

    invoke-static {v13, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v1, :cond_18f

    invoke-static {v12, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v19, v1

    check-cast v19, Lcom/google/android/material/button/MaterialButton;

    if-eqz v19, :cond_18d

    invoke-static {v11, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/custom_views/Spinner;

    if-eqz v1, :cond_18b

    const v1, 0x7f0a0aca

    invoke-static {v1, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_195

    invoke-static {v10, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object/from16 v20, v1

    check-cast v20, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v20, :cond_19a

    new-instance v17, Lx79;

    new-instance v1, Lkck;

    new-array v5, v5, [Landroid/view/ViewGroup;

    aput-object v4, v5, v16

    aput-object v3, v5, v6

    invoke-static {v5}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v3

    invoke-direct {v1, v3}, Lkck;-><init>(Ljava/util/List;)V

    move-object/from16 v21, v1

    invoke-direct/range {v17 .. v22}, Lx79;-><init>(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)V

    goto/16 :goto_9f

    :goto_142
    iput-object v1, v0, Ljd9;->p:Lx79;

    iget-object v1, v1, Lx79;->b:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    new-instance v3, Lyk4;

    const/16 v4, 0x1b

    invoke-direct {v3, v0, v4}, Lyk4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v1, Lgd9;

    move/from16 v3, v16

    invoke-direct {v1, v0, v3}, Lgd9;-><init>(Ljd9;B)V

    const-wide/16 v3, 0x12c

    invoke-virtual {v2, v1, v3, v4}, Landroid/view/View;->postOnAnimationDelayed(Ljava/lang/Runnable;J)V

    iget-object v1, v0, Ljd9;->p:Lx79;

    iget-object v1, v1, Lx79;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/StylingTextView;

    new-instance v2, Lkd9;

    invoke-virtual {v1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v2, v3}, Lagc;-><init>(Landroid/content/Context;)V

    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    const v4, 0x7f14120e

    invoke-virtual {v3, v4}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v4

    const v5, 0x7f14120d

    invoke-virtual {v3, v5}, Landroid/content/res/Resources;->getString(I)Ljava/lang/String;

    move-result-object v3

    const-string v5, "%1$s"

    invoke-static {v1, v4, v5, v3, v2}, Lphj;->c0(Landroid/widget/TextView;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Lagc;)V

    iget-object v0, v0, Ljd9;->p:Lx79;

    iget-object v0, v0, Lx79;->d:Ljava/lang/Object;

    check-cast v0, Ldgh;

    return-object v0

    :cond_18b
    move v10, v11

    goto :goto_19a

    :cond_18d
    move v10, v12

    goto :goto_19a

    :cond_18f
    move v10, v13

    goto :goto_19a

    :cond_191
    move v10, v14

    goto :goto_19a

    :cond_193
    move v10, v15

    goto :goto_19a

    :cond_195
    move v10, v1

    goto :goto_19a

    :cond_197
    move v10, v7

    goto :goto_19a

    :cond_199
    move v10, v4

    :cond_19a
    :goto_19a
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v10}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v9, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3

    :cond_1aa
    invoke-static {v8}, Lt3p;->q(Ljava/lang/String;)V

    return-object p3
.end method

.method public final u0()V
    .registers 2

    const/4 v0, 0x0

    iput-boolean v0, p0, Ljd9;->l:Z

    invoke-virtual {p0}, Ljd9;->z0()V

    return-void
.end method

.method public final v0()V
    .registers 5

    const/4 v0, 0x1

    iput-boolean v0, p0, Ljd9;->l:Z

    invoke-virtual {p0}, Ljd9;->y0()V

    iget-boolean v1, p0, Ljd9;->o:Z

    if-nez v1, :cond_27

    invoke-static {}, Lcom/google/android/gms/common/GoogleApiAvailability;->getInstance()Lcom/google/android/gms/common/GoogleApiAvailability;

    move-result-object v1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-virtual {v1, v2}, Lcom/google/android/gms/common/GoogleApiAvailability;->isGooglePlayServicesAvailable(Landroid/content/Context;)I

    move-result v2

    if-nez v2, :cond_1b

    iput-boolean v0, p0, Ljd9;->o:Z

    goto :goto_27

    :cond_1b
    iget-boolean v0, p0, Ljd9;->m:Z

    if-eqz v0, :cond_27

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    const/4 v3, 0x0

    invoke-virtual {v1, v0, v2, v3}, Lcom/google/android/gms/common/GoogleApiAvailability;->showErrorDialogFragment(Landroid/app/Activity;II)Z

    :cond_27
    :goto_27
    invoke-virtual {p0}, Ljd9;->z0()V

    return-void
.end method

.method public final y0()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    check-cast v0, Ldx3;

    const-string v1, "android.permission.CAMERA"

    invoke-static {v0, v1}, Lfr3;->Q(Landroid/content/Context;Ljava/lang/String;)Z

    move-result v2

    if-nez v2, :cond_1c

    const/4 v2, 0x0

    iput-boolean v2, p0, Ljd9;->m:Z

    iget-object v0, v0, Ldx3;->j:Lqi;

    new-instance v2, Lid9;

    invoke-direct {v2, p0}, Lid9;-><init>(Ljd9;)V

    invoke-static {v0, v1, v2}, Lf03;->U(Lorg/chromium/ui/base/WindowAndroid;Ljava/lang/String;Lbag;)V

    return-void

    :cond_1c
    const/4 v0, 0x1

    iput-boolean v0, p0, Ljd9;->m:Z

    return-void
.end method

.method public final z0()V
    .registers 6

    iget-boolean v0, p0, Ljd9;->l:Z

    const/4 v1, 0x1

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Ljd9;->m:Z

    if-eqz v0, :cond_13

    iget-boolean v0, p0, Ljd9;->n:Z

    if-nez v0, :cond_13

    iget-boolean v0, p0, Ljd9;->o:Z

    if-eqz v0, :cond_13

    move v0, v1

    goto :goto_14

    :cond_13
    const/4 v0, 0x0

    :goto_14
    iget-object v2, p0, Ljd9;->q:Llfh;

    if-eqz v0, :cond_45

    if-nez v2, :cond_51

    new-instance v0, Llfh;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    sget-object v2, Lvml;->a:Ljava/util/concurrent/ScheduledExecutorService;

    iget-object v2, p0, Ljd9;->p:Lx79;

    iget-object v2, v2, Lx79;->a:Ljava/lang/Object;

    check-cast v2, Landroidx/camera/view/PreviewView;

    new-instance v3, Lbe8;

    const/16 v4, 0x8

    invoke-direct {v3, v4}, Lbe8;-><init>(B)V

    invoke-direct {v0, v1, v2, v3}, Llfh;-><init>(Lndc;Landroidx/camera/view/PreviewView;Lkotlin/jvm/functions/Function0;)V

    iput-object v0, p0, Ljd9;->q:Llfh;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Lks6;

    const/16 v3, 0xe

    invoke-direct {v2, p0, v3}, Lks6;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Llfh;->j:Lpde;

    invoke-virtual {p0, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :cond_45
    if-eqz v2, :cond_51

    iget-object v0, v2, Llfh;->c:Lfe5;

    iput-boolean v1, v0, Lfe5;->d:Z

    invoke-virtual {v0}, Lfe5;->b()V

    const/4 v0, 0x0

    iput-object v0, p0, Ljd9;->q:Llfh;

    :cond_51
    return-void
.end method
