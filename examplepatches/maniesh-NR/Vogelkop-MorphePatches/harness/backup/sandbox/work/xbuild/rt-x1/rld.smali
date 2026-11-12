.class public final Lrld;
.super Lk24;
.source "SourceFile"

# interfaces
.implements Landroid/view/View$OnClickListener;


# instance fields
.field public final f:Ltkd;

.field public final g:Lmig;

.field public final h:Lb2o;

.field public final i:Lga6;

.field public final j:Lald;

.field public final k:Lyn4;

.field public l:Lsjg;

.field public m:Lhld;

.field public n:Lxbf;

.field public o:Lakg;

.field public p:Lnld;

.field public q:Lwld;

.field public r:Z

.field public s:Z

.field public t:I

.field public u:F


# direct methods
.method public constructor <init>(Lyn4;)V
    .registers 5

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Ltkd;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Ltkd;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lrld;->f:Ltkd;

    new-instance v0, Lmig;

    new-instance v1, Ljld;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Ljld;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-direct {v0, v1}, Lmig;-><init>(Llig;)V

    iput-object v0, p0, Lrld;->g:Lmig;

    new-instance v0, Lb2o;

    new-instance v1, Lvx;

    const/16 v2, 0x18

    invoke-direct {v1, p0, v2}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1}, Lb2o;-><init>(Lvx;)V

    iput-object v0, p0, Lrld;->h:Lb2o;

    new-instance v0, Lga6;

    const/16 v1, 0x1b

    invoke-direct {v0, v1}, Lga6;-><init>(B)V

    iput-object v0, p0, Lrld;->i:Lga6;

    new-instance v0, Lald;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lald;-><init>(Lk24;B)V

    iput-object v0, p0, Lrld;->j:Lald;

    const/high16 v0, -0x40800000    # -1.0f

    iput v0, p0, Lrld;->u:F

    iput-object p1, p0, Lrld;->k:Lyn4;

    return-void
.end method


# virtual methods
.method public final h0(Landroidx/fragment/app/w;)V
    .registers 5

    iget-boolean v0, p0, Lrld;->r:Z

    const/4 v1, 0x1

    if-nez v0, :cond_19

    iput-boolean v1, p0, Lrld;->r:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget-object v2, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_19
    iget-boolean v0, p0, Lrld;->s:Z

    if-nez v0, :cond_21

    invoke-super {p0, p1}, Lk24;->h0(Landroidx/fragment/app/w;)V

    return-void

    :cond_21
    const-string v0, "media-player"

    const/4 v2, -0x1

    invoke-virtual {p1, v2, v1, v0}, Landroidx/fragment/app/w;->Y(IILjava/lang/String;)Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-super {p0, p1}, Lk24;->h0(Landroidx/fragment/app/w;)V

    :cond_2d
    return-void
.end method

.method public final j()Z
    .registers 1

    invoke-virtual {p0}, Lryl;->g0()V

    const/4 p0, 0x1

    return p0
.end method

.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 36

    move-object/from16 v0, p0

    const v1, 0x7f0d0286

    const/4 v2, 0x0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-virtual {v3, v1, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v1

    const v3, 0x7f0a0199

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/opera/android/custom_views/VerticalSeekBar;

    const/4 v4, 0x0

    if-eqz v7, :cond_2e9

    const v3, 0x7f0a019a

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v8, v5

    check-cast v8, Landroid/widget/LinearLayout;

    if-eqz v8, :cond_2e9

    const v3, 0x7f0a0262

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_2e9

    invoke-static {v5}, Lcc6;->a(Landroid/view/View;)Lcc6;

    const v3, 0x7f0a0670

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v9, v5

    check-cast v9, Landroidx/mediarouter/app/OperaMediaRouteButton;

    if-eqz v9, :cond_2e9

    const v3, 0x7f0a0672

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v10

    if-eqz v10, :cond_2e9

    const v3, 0x7f0a0673

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v11, :cond_2e9

    const v3, 0x7f0a0674

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v12, :cond_2e9

    const v3, 0x7f0a0675

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_2e9

    const v3, 0x7f0a0676

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v14, v5

    check-cast v14, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v14, :cond_2e9

    const v3, 0x7f0a0677

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v15, v5

    check-cast v15, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v15, :cond_2e9

    const v3, 0x7f0a067f

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v16, v5

    check-cast v16, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v16, :cond_2e9

    const v3, 0x7f0a0748

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v17, v5

    check-cast v17, Landroid/widget/LinearLayout;

    if-eqz v17, :cond_2e9

    const v3, 0x7f0a083e

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v18, v5

    check-cast v18, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v18, :cond_2e9

    const v3, 0x7f0a0845

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v19, v5

    check-cast v19, Lcom/opera/android/media/PlayerContainerView;

    if-eqz v19, :cond_2e9

    const v3, 0x7f0a0847

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v20, v5

    check-cast v20, Landroidx/media3/ui/PlayerView;

    if-eqz v20, :cond_2e9

    const v3, 0x7f0a0894

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_2e9

    invoke-static {v5}, Lpt1;->a(Landroid/view/View;)Lpt1;

    move-result-object v21

    const v3, 0x7f0a0895

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v22, v5

    check-cast v22, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v22, :cond_2e9

    const v3, 0x7f0a0896

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v23, v5

    check-cast v23, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v23, :cond_2e9

    const v3, 0x7f0a095a

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v24, v5

    check-cast v24, Landroidx/appcompat/widget/AppCompatSeekBar;

    if-eqz v24, :cond_2e9

    const v3, 0x7f0a0b08

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v25, v5

    check-cast v25, Landroid/widget/LinearLayout;

    if-eqz v25, :cond_2e9

    const v3, 0x7f0a0b09

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v26, v5

    check-cast v26, Landroid/widget/ImageView;

    if-eqz v26, :cond_2e9

    const v3, 0x7f0a0b0a

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v27, v5

    check-cast v27, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v27, :cond_2e9

    const v3, 0x7f0a0bd8

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v28, v5

    check-cast v28, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v28, :cond_2e9

    const v3, 0x7f0a0bd9

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v29, v5

    check-cast v29, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v29, :cond_2e9

    const v3, 0x7f0a0ca8

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v30, v5

    check-cast v30, Lcom/opera/android/custom_views/VerticalSeekBar;

    if-eqz v30, :cond_2e9

    const v3, 0x7f0a0caa

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v31, v5

    check-cast v31, Landroid/widget/LinearLayout;

    if-eqz v31, :cond_2e9

    const v3, 0x7f0a0cab

    invoke-static {v3, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object/from16 v32, v5

    check-cast v32, Landroid/widget/ImageView;

    if-eqz v32, :cond_2e9

    new-instance v5, Lhld;

    move-object v6, v1

    check-cast v6, Lcom/opera/android/custom_views/InterceptableFrameLayout;

    invoke-direct/range {v5 .. v32}, Lhld;-><init>(Lcom/opera/android/custom_views/InterceptableFrameLayout;Lcom/opera/android/custom_views/VerticalSeekBar;Landroid/widget/LinearLayout;Landroidx/mediarouter/app/OperaMediaRouteButton;Landroid/view/View;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingTextView;Landroid/widget/LinearLayout;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/media/PlayerContainerView;Landroidx/media3/ui/PlayerView;Lpt1;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Landroidx/appcompat/widget/AppCompatSeekBar;Landroid/widget/LinearLayout;Landroid/widget/ImageView;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/custom_views/VerticalSeekBar;Landroid/widget/LinearLayout;Landroid/widget/ImageView;)V

    iput-object v5, v0, Lrld;->m:Lhld;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    invoke-virtual {v1}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v1

    iget-object v1, v1, Ltjg;->o:Lxbf;

    iput-object v1, v0, Lrld;->n:Lxbf;

    iget-object v1, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Luuj;

    iget-object v1, v1, Luuj;->b:Ljava/lang/Object;

    check-cast v1, Lh7f;

    iget-object v3, v0, Lrld;->j:Lald;

    invoke-virtual {v1, v3}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v1, v0, Lrld;->n:Lxbf;

    iget-object v1, v1, Lxbf;->c:Ljava/lang/Object;

    check-cast v1, Lode;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lgig;

    if-eqz v1, :cond_19f

    iget-object v3, v0, Lrld;->f:Ltkd;

    invoke-interface {v1, v3}, Lgig;->S(Leig;)V

    :cond_19f
    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    invoke-virtual {v1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v1

    check-cast v1, Lcom/opera/android/OperaApplication;

    iget-object v1, v1, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v1, v1, Lxv1;->b0:Lj4c;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lwld;

    iput-object v1, v0, Lrld;->q:Lwld;

    iget-object v1, v0, Lrld;->k:Lyn4;

    iget-object v3, v1, Lyn4;->h:Ldod;

    if-eqz v3, :cond_1bd

    iget-object v4, v1, Lyn4;->e:Lvnd;

    :cond_1bd
    if-eqz v4, :cond_1d1

    iget-object v1, v0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    invoke-virtual {v1, v4}, Landroidx/mediarouter/app/OperaMediaRouteButton;->e(Lvnd;)V

    iget-object v1, v0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->d:Landroidx/mediarouter/app/OperaMediaRouteButton;

    new-instance v3, Lao4;

    invoke-direct {v3}, Ljava/lang/Object;-><init>()V

    iput-object v3, v1, Landroidx/mediarouter/app/OperaMediaRouteButton;->d:Lcnd;

    :cond_1d1
    iget-object v6, v0, Lrld;->m:Lhld;

    iget-object v1, v0, Lrld;->n:Lxbf;

    iget-object v1, v1, Lxbf;->g:Ljava/lang/Object;

    move-object v8, v1

    check-cast v8, Luuj;

    new-instance v9, Leme;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-direct {v9, v1}, Leme;-><init>(Ljava/lang/Object;)V

    const/4 v1, 0x1

    if-eqz v4, :cond_1ec

    move v10, v1

    goto :goto_1ed

    :cond_1ec
    move v10, v2

    :goto_1ed
    new-instance v5, Lnld;

    iget-object v7, v0, Lrld;->g:Lmig;

    invoke-direct/range {v5 .. v10}, Lnld;-><init>(Lhld;Lmig;La0n;Leme;Z)V

    new-instance v2, Lkld;

    iget-object v3, v6, Lhld;->a:Lcom/opera/android/custom_views/InterceptableFrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v2, v4, v5, v5}, Lkld;-><init>(Landroid/content/Context;Lnld;Lnld;)V

    iget-object v4, v6, Lhld;->e:Landroid/view/View;

    invoke-virtual {v4, v1}, Landroid/view/View;->setClickable(Z)V

    new-instance v7, Lm42;

    const/4 v8, 0x4

    invoke-direct {v7, v2, v8}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v4, v7}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v2, v6, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    new-instance v4, Lm42;

    const/4 v6, 0x5

    invoke-direct {v4, v5, v6}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v4}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    new-instance v2, Lild;

    invoke-direct {v2, v5}, Lild;-><init>(Lnld;)V

    iput-object v2, v3, Lcom/opera/android/custom_views/InterceptableFrameLayout;->a:Lceb;

    iput-object v5, v0, Lrld;->p:Lnld;

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->o:Landroidx/media3/ui/PlayerView;

    invoke-virtual {v2}, Landroidx/media3/ui/PlayerView;->e()V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->n:Lcom/opera/android/media/PlayerContainerView;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v3

    invoke-static {v3}, Lp92;->a(Landroid/content/res/Resources;)Lp92;

    move-result-object v3

    iput-object v3, v2, Lcom/opera/android/media/PlayerContainerView;->f:Lp92;

    invoke-virtual {v2}, Lcom/opera/android/media/PlayerContainerView;->a()V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->o:Landroidx/media3/ui/PlayerView;

    new-instance v3, Lyzb;

    const/16 v4, 0x1b

    invoke-direct {v3, v0, v4}, Lyzb;-><init>(Ljava/lang/Object;B)V

    iget-object v2, v2, Landroidx/media3/ui/PlayerView;->b:Landroidx/media3/ui/AspectRatioFrameLayout;

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iput-object v3, v2, Landroidx/media3/ui/AspectRatioFrameLayout;->b:Lpa2;

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->x:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->q:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->m:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->r:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->w:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->s:Landroidx/appcompat/widget/AppCompatSeekBar;

    iget-object v3, v0, Lrld;->g:Lmig;

    iget-object v4, v3, Lmig;->i:Lkig;

    invoke-virtual {v2, v4}, Landroid/widget/SeekBar;->setOnSeekBarChangeListener(Landroid/widget/SeekBar$OnSeekBarChangeListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, v0, Lrld;->m:Lhld;

    iget-object v2, v2, Lhld;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v2, Lakg;

    iget-object v4, v0, Lrld;->n:Lxbf;

    new-instance v5, Ldnb;

    const/16 v7, 0x1c

    invoke-direct {v5, v0, v7}, Ldnb;-><init>(Ljava/lang/Object;B)V

    iget-object v7, v0, Lrld;->i:Lga6;

    invoke-direct {v2, v4, v1, v5, v7}, Lakg;-><init>(Lxbf;ZLjava/lang/Runnable;Lga6;)V

    iput-object v2, v0, Lrld;->o:Lakg;

    new-instance v2, Lsjg;

    iget-object v4, v0, Lrld;->m:Lhld;

    iget-object v4, v4, Lhld;->o:Landroidx/media3/ui/PlayerView;

    invoke-direct {v2, v8, v4}, Lsjg;-><init>(ILandroidx/media3/ui/PlayerView;)V

    iput-object v2, v0, Lrld;->l:Lsjg;

    iget-object v4, v0, Lrld;->n:Lxbf;

    iget-object v4, v4, Lxbf;->b:Ljava/lang/Object;

    check-cast v4, Ltjg;

    invoke-virtual {v4, v2, v1}, Ltjg;->b(Lsjg;Z)V

    iget-object v1, v0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->n:Lcom/opera/android/media/PlayerContainerView;

    iget-object v2, v0, Lrld;->n:Lxbf;

    invoke-virtual {v1, v2}, Lcom/opera/android/media/PlayerContainerView;->b(Lxbf;)V

    iget-object v1, v0, Lrld;->n:Lxbf;

    invoke-virtual {v3, v1}, Lmig;->a(Lxbf;)V

    iget-object v1, v0, Lrld;->n:Lxbf;

    iget-object v1, v1, Lxbf;->g:Ljava/lang/Object;

    check-cast v1, Luuj;

    invoke-virtual {v1}, Luuj;->i()I

    move-result v1

    invoke-virtual {v0, v1}, Lrld;->o0(I)V

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v1

    new-instance v2, Ld8d;

    invoke-direct {v2, v0, v6}, Ld8d;-><init>(Ljava/lang/Object;B)V

    iget-object v3, v0, Lrld;->h:Lb2o;

    invoke-virtual {v3, v1, v2}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->a:Lcom/opera/android/custom_views/InterceptableFrameLayout;

    return-object v0

    :cond_2e9
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    const-string v1, "Missing required view with ID: "

    invoke-virtual {v1, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v4
.end method

.method public final o0(I)V
    .registers 3

    if-nez p1, :cond_6

    const p1, 0x7f080629

    goto :goto_9

    :cond_6
    const p1, 0x7f080626

    :goto_9
    iget v0, p0, Lrld;->t:I

    if-ne v0, p1, :cond_e

    return-void

    :cond_e
    iput p1, p0, Lrld;->t:I

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0, p1}, Landroidx/appcompat/widget/AppCompatImageView;->setImageResource(I)V

    iget-object p0, p0, Lrld;->m:Lhld;

    iget-object p0, p0, Lhld;->A:Landroid/widget/ImageView;

    invoke-virtual {p0, p1}, Landroid/widget/ImageView;->setImageResource(I)V

    return-void
.end method

.method public final onClick(Landroid/view/View;)V
    .registers 5

    iget-object v0, p0, Lrld;->m:Lhld;

    if-eqz v0, :cond_f0

    iget-object v0, p0, Lrld;->p:Lnld;

    invoke-virtual {v0}, Lnld;->c()V

    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->m:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    iget-object v2, p0, Lrld;->g:Lmig;

    if-ne v0, v1, :cond_1d

    invoke-virtual {v2}, Lmig;->e()Z

    return-void

    :cond_1d
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->q:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_33

    invoke-virtual {v2}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->p0()V

    return-void

    :cond_33
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->r:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_54

    invoke-virtual {v2}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->getPlaybackState()I

    move-result p0

    const/4 p1, 0x4

    if-eq p0, p1, :cond_f0

    invoke-virtual {v2}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->o0()V

    return-void

    :cond_54
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->x:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_6a

    invoke-virtual {v2}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->r()V

    return-void

    :cond_6a
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->w:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_80

    invoke-virtual {v2}, Lhkg;->c()Lgig;

    move-result-object p0

    invoke-interface {p0}, Lgig;->M()V

    return-void

    :cond_80
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->g:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, 0x0

    if-ne v0, v1, :cond_93

    invoke-virtual {p0, v2}, Lk24;->l0(Z)V

    return-void

    :cond_93
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->j:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    if-ne v0, v1, :cond_b9

    iget-object p0, p0, Lrld;->n:Lxbf;

    iget-object p0, p0, Lxbf;->g:Ljava/lang/Object;

    check-cast p0, Luuj;

    invoke-virtual {p0}, Luuj;->i()I

    move-result p1

    if-lez p1, :cond_b3

    iput p1, p0, Luuj;->a:I

    invoke-virtual {p0, v2}, Luuj;->m(I)V

    return-void

    :cond_b3
    iget p1, p0, Luuj;->a:I

    invoke-virtual {p0, p1}, Luuj;->m(I)V

    return-void

    :cond_b9
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result v0

    iget-object v1, p0, Lrld;->m:Lhld;

    iget-object v1, v1, Lhld;->i:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v1}, Landroid/view/View;->getId()I

    move-result v1

    const/4 v2, 0x1

    if-ne v0, v1, :cond_ce

    iput-boolean v2, p0, Lrld;->s:Z

    invoke-virtual {p0}, Lryl;->g0()V

    return-void

    :cond_ce
    invoke-virtual {p1}, Landroid/view/View;->getId()I

    move-result p1

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {v0}, Landroid/view/View;->getId()I

    move-result v0

    if-ne p1, v0, :cond_f0

    iget-object p1, p0, Lrld;->o:Lakg;

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->h:Lcom/opera/android/custom_views/StylingImageButton;

    invoke-virtual {p1, v0}, Lo73;->p(Landroid/view/View;)V

    iget-object p0, p0, Lrld;->p:Lnld;

    iput-boolean v2, p0, Lnld;->n:Z

    iget-boolean p1, p0, Lnld;->l:Z

    if-eqz p1, :cond_f0

    invoke-virtual {p0}, Lnld;->c()V

    :cond_f0
    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-super {p0}, Lk24;->onDestroyView()V

    iget-boolean v0, p0, Lrld;->r:Z

    if-nez v0, :cond_1c

    const/4 v0, 0x1

    iput-boolean v0, p0, Lrld;->r:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_1c
    iget-object v0, p0, Lrld;->g:Lmig;

    iget-object v1, p0, Lrld;->n:Lxbf;

    invoke-virtual {v0, v1}, Lmig;->b(Lxbf;)V

    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->n:Lcom/opera/android/media/PlayerContainerView;

    iget-object v1, p0, Lrld;->n:Lxbf;

    invoke-virtual {v0, v1}, Lcom/opera/android/media/PlayerContainerView;->c(Lxbf;)V

    iget-object v0, p0, Lrld;->n:Lxbf;

    iget-object v0, v0, Lxbf;->b:Ljava/lang/Object;

    check-cast v0, Ltjg;

    iget-object v1, p0, Lrld;->l:Lsjg;

    invoke-virtual {v0, v1}, Ltjg;->j(Lsjg;)V

    iget-object v0, p0, Lrld;->n:Lxbf;

    iget-object v0, v0, Lxbf;->g:Ljava/lang/Object;

    check-cast v0, Luuj;

    iget-object v0, v0, Luuj;->b:Ljava/lang/Object;

    check-cast v0, Lh7f;

    iget-object v1, p0, Lrld;->j:Lald;

    invoke-virtual {v0, v1}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object v0, p0, Lrld;->n:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    if-eqz v0, :cond_59

    iget-object v1, p0, Lrld;->f:Ltkd;

    invoke-interface {v0, v1}, Lgig;->g0(Leig;)V

    :cond_59
    const/4 v0, 0x0

    iput-object v0, p0, Lrld;->l:Lsjg;

    iput-object v0, p0, Lrld;->n:Lxbf;

    iput-object v0, p0, Lrld;->o:Lakg;

    iget-object v1, p0, Lrld;->i:Lga6;

    iget-object v1, v1, Lga6;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    iput-object v0, p0, Lrld;->p:Lnld;

    iput-object v0, p0, Lrld;->m:Lhld;

    iput-object v0, p0, Lrld;->q:Lwld;

    return-void
.end method

.method public final onPause()V
    .registers 5

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onPause()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v1, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    const/high16 v2, -0x40800000    # -1.0f

    cmpl-float v3, v1, v2

    if-eqz v3, :cond_26

    iput v1, p0, Lrld;->u:F

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_26
    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->n:Lcom/opera/android/media/PlayerContainerView;

    iget-object p0, p0, Lrld;->k:Lyn4;

    iget-object v1, p0, Lyn4;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-eqz p0, :cond_39

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    :cond_39
    return-void
.end method

.method public final onPictureInPictureModeChanged(Z)V
    .registers 4

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onPictureInPictureModeChanged(Z)V

    iget-object v0, p0, Lrld;->n:Lxbf;

    iget-object v0, v0, Lxbf;->c:Ljava/lang/Object;

    check-cast v0, Lode;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lgig;

    if-eqz v0, :cond_19

    invoke-interface {v0}, Lgig;->e0()Z

    move-result v0

    if-eqz v0, :cond_19

    const/4 v0, 0x1

    goto :goto_1a

    :cond_19
    const/4 v0, 0x0

    :goto_1a
    iget-object v1, p0, Lrld;->q:Lwld;

    iget-object p0, p0, Lrld;->n:Lxbf;

    iget-object p0, p0, Lxbf;->d:Ljava/lang/Object;

    check-cast p0, Lpod;

    invoke-virtual {v1, p0, p1, v0}, Lsc;->l(Ljava/lang/Object;ZZ)V

    return-void
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-boolean v0, p0, Lrld;->r:Z

    if-nez v0, :cond_1a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    sget-object v1, Lq9n;->c:Ll5b;

    invoke-virtual {v0}, Landroid/view/Window;->getDecorView()Landroid/view/View;

    move-result-object v0

    const/16 v1, 0x1606

    invoke-virtual {v0, v1}, Landroid/view/View;->setSystemUiVisibility(I)V

    :cond_1a
    iget v0, p0, Lrld;->u:F

    const/high16 v1, -0x40800000    # -1.0f

    cmpl-float v0, v0, v1

    if-eqz v0, :cond_3f

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-virtual {v0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/Window;->getAttributes()Landroid/view/WindowManager$LayoutParams;

    move-result-object v0

    iget v2, p0, Lrld;->u:F

    iput v2, v0, Landroid/view/WindowManager$LayoutParams;->screenBrightness:F

    iput v1, p0, Lrld;->u:F

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-virtual {v1}, Landroid/app/Activity;->getWindow()Landroid/view/Window;

    move-result-object v1

    invoke-virtual {v1, v0}, Landroid/view/Window;->setAttributes(Landroid/view/WindowManager$LayoutParams;)V

    :cond_3f
    iget-object v0, p0, Lrld;->m:Lhld;

    iget-object v0, v0, Lhld;->n:Lcom/opera/android/media/PlayerContainerView;

    iget-object p0, p0, Lrld;->k:Lyn4;

    iget-object v1, p0, Lyn4;->c:Li7f;

    invoke-virtual {v1, v0}, Li7f;->b(Ljava/lang/Object;)Z

    iget-object p0, p0, Lyn4;->j:Lcom/google/android/gms/cast/framework/CastSession;

    if-eqz p0, :cond_51

    invoke-virtual {v0, p0}, Lcom/opera/android/media/PlayerContainerView;->e(Lcom/google/android/gms/cast/framework/CastSession;)V

    :cond_51
    return-void
.end method
