.class public final Li7d;
.super Lk24;
.source "SourceFile"

# interfaces
.implements Ljbl;


# instance fields
.field public final f:Lh73;

.field public g:Z

.field public final h:Z

.field public i:Z

.field public j:Z

.field public k:Lvl6;

.field public l:Lpt1;

.field public m:Lh7d;

.field public n:Lqm9;

.field public o:Ly53;

.field public p:Lnga;

.field public final q:Lv6d;


# direct methods
.method public constructor <init>(Lh73;ZZ)V
    .registers 4

    invoke-direct {p0}, Lk24;-><init>()V

    iput-object p1, p0, Li7d;->f:Lh73;

    iput-boolean p2, p0, Li7d;->g:Z

    iput-boolean p3, p0, Li7d;->h:Z

    new-instance p2, Lv6d;

    iget-object p1, p1, Lh73;->b:Lqq6;

    invoke-direct {p2, p1}, Lv6d;-><init>(Lqq6;)V

    iput-object p2, p0, Li7d;->q:Lv6d;

    return-void
.end method

.method public static s0(Landroid/content/res/Configuration;)Z
    .registers 4

    iget v0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v1, 0x2

    const/4 v2, 0x1

    if-ne v0, v1, :cond_7

    return v2

    :cond_7
    iget p0, p0, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v0, 0x258

    if-lt p0, v0, :cond_e

    return v2

    :cond_e
    const/4 p0, 0x0

    return p0
.end method


# virtual methods
.method public final L()V
    .registers 3

    iget-object v0, p0, Li7d;->q:Lv6d;

    sget-object v1, Lt6d;->a:Lt6d;

    invoke-virtual {v0, v1}, Lv6d;->b(Lt6d;)V

    invoke-super {p0}, Lk24;->L()V

    return-void
.end method

.method public final l()V
    .registers 2

    invoke-super {p0}, Lk24;->l()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isRemoving()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object p0, p0, Li7d;->q:Lv6d;

    sget-object v0, Lt6d;->b:Lt6d;

    invoke-virtual {p0, v0}, Lv6d;->b(Lt6d;)V

    :cond_10
    return-void
.end method

.method public final l0(Z)V
    .registers 2

    invoke-virtual {p0}, Li7d;->o0()V

    return-void
.end method

.method public final m0()V
    .registers 1

    invoke-virtual {p0}, Li7d;->o0()V

    return-void
.end method

.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 30

    move-object/from16 v1, p0

    const v0, 0x7f0d025b

    const/4 v2, 0x0

    move-object/from16 v3, p1

    move-object/from16 v4, p2

    invoke-virtual {v3, v0, v4, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v0

    const v2, 0x7f0a0271

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    check-cast v3, Lcom/jensdriller/libs/undobar/MaxWidthLinearLayout;

    const/4 v7, 0x0

    const-string v4, "Missing required view with ID: "

    if-eqz v3, :cond_2e9

    const v2, 0x7f0a0630

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v3

    if-eqz v3, :cond_2e9

    const v2, 0x7f0a0514

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_2d9

    const v2, 0x7f0a0131

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_2c9

    const v2, 0x7f0a0134

    invoke-static {v2, v6}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v8

    check-cast v8, Lcom/opera/android/custom_views/CircleImageView;

    if-eqz v8, :cond_2b9

    new-instance v11, Lg7d;

    check-cast v6, Landroid/widget/FrameLayout;

    invoke-direct {v11, v6, v8}, Lg7d;-><init>(Landroid/widget/FrameLayout;Lcom/opera/android/custom_views/CircleImageView;)V

    const v2, 0x7f0a0216

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroidx/constraintlayout/widget/ConstraintLayout;

    if-eqz v6, :cond_2c9

    const v2, 0x7f0a02f1

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v12, :cond_2c9

    const v2, 0x7f0a03c7

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v13, v6

    check-cast v13, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v13, :cond_2c9

    const v2, 0x7f0a03c8

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    if-eqz v14, :cond_2c9

    const v2, 0x7f0a09cc

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v15, :cond_2c9

    const v2, 0x7f0a0b19

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v16, v6

    check-cast v16, Lcom/opera/android/ui/catalog/widget/OperaChip;

    if-eqz v16, :cond_2c9

    const v2, 0x7f0a0c6e

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v17, v6

    check-cast v17, Landroidx/cardview/widget/CardView;

    if-eqz v17, :cond_2c9

    const v2, 0x7f0a0a94

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v18, v6

    check-cast v18, Lcom/opera/android/custom_views/FadingTextView;

    if-eqz v18, :cond_2c9

    const v2, 0x7f0a0cb7

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v19, v6

    check-cast v19, Lcom/opera/android/ui/catalog/widget/OperaChip;

    if-eqz v19, :cond_2c9

    new-instance v22, Lrf2;

    move-object v10, v5

    check-cast v10, Landroid/widget/LinearLayout;

    move-object/from16 v9, v22

    invoke-direct/range {v9 .. v19}, Lrf2;-><init>(Landroid/widget/LinearLayout;Lg7d;Lcom/opera/android/custom_views/StylingTextView;Lcom/opera/android/custom_views/StylingImageButton;Lcom/google/android/material/progressindicator/CircularProgressIndicator;Lcom/opera/android/custom_views/StylingImageButton;Lcom/opera/android/ui/catalog/widget/OperaChip;Landroidx/cardview/widget/CardView;Lcom/opera/android/custom_views/FadingTextView;Lcom/opera/android/ui/catalog/widget/OperaChip;)V

    const v2, 0x7f0a0994

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_2d9

    const v2, 0x7f0a0856

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v10, v6

    check-cast v10, Landroid/view/ViewStub;

    if-eqz v10, :cond_2a9

    const v2, 0x7f0a0858

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v11, v6

    check-cast v11, Landroid/view/ViewStub;

    if-eqz v11, :cond_2a9

    const v2, 0x7f0a09a0

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v12, v6

    check-cast v12, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v12, :cond_2a9

    const v2, 0x7f0a09a6

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v13, v6

    check-cast v13, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v13, :cond_2a9

    const v2, 0x7f0a09ad

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v14, v6

    check-cast v14, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v14, :cond_2a9

    const v2, 0x7f0a09e5

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object v15, v6

    check-cast v15, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v15, :cond_2a9

    const v2, 0x7f0a0a02

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    move-object/from16 v16, v6

    check-cast v16, Lcom/opera/android/widget/MenuSettingsListItem;

    if-eqz v16, :cond_2a9

    new-instance v23, Lei;

    move-object v9, v5

    check-cast v9, Landroid/widget/LinearLayout;

    const/16 v17, 0x5

    move-object/from16 v8, v23

    invoke-direct/range {v8 .. v17}, Lei;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    const v2, 0x7f0a0b91

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    if-eqz v5, :cond_2d9

    const v2, 0x7f0a0b8b

    invoke-static {v2, v5}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    if-eqz v6, :cond_299

    new-instance v2, Lkf;

    check-cast v5, Landroid/widget/RelativeLayout;

    const/16 v8, 0x12

    invoke-direct {v2, v8, v5, v6}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    const v5, 0x7f0a0bb3

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    if-eqz v6, :cond_297

    invoke-static {v6}, Lor2;->c(Landroid/view/View;)Lor2;

    move-result-object v25

    new-instance v20, Lor2;

    move-object/from16 v21, v3

    check-cast v21, Landroid/widget/LinearLayout;

    const/16 v26, 0xf

    move-object/from16 v24, v2

    invoke-direct/range {v20 .. v26}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    move-object/from16 v3, v20

    const v2, 0x7f0a0a45

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v11, v5

    check-cast v11, Lcom/opera/android/custom_views/FadingNestedScrollView;

    if-eqz v11, :cond_2e9

    const v2, 0x7f0a0a48

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v12, v5

    check-cast v12, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    if-eqz v12, :cond_2e9

    const v2, 0x7f0a0adb

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    move-object v13, v5

    check-cast v13, Lcom/opera/android/StatusBarDrawingFrameLayout;

    if-eqz v13, :cond_2e9

    const v2, 0x7f0a0bcd

    invoke-static {v2, v0}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v14

    if-eqz v14, :cond_2e9

    new-instance v8, Lpt1;

    move-object v9, v0

    check-cast v9, Landroid/widget/FrameLayout;

    const/16 v15, 0x8

    move-object v10, v3

    invoke-direct/range {v8 .. v15}, Lpt1;-><init>(Landroid/widget/FrameLayout;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;B)V

    move-object v4, v11

    iput-object v8, v1, Li7d;->l:Lpt1;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v5

    new-instance v6, Lx79;

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingNestedScrollView;

    invoke-static {v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v2

    invoke-direct {v6}, Ljava/lang/Object;-><init>()V

    new-instance v8, Lcan;

    invoke-direct {v8}, Lcan;-><init>()V

    iput-object v8, v6, Lx79;->a:Ljava/lang/Object;

    new-instance v8, Lza3;

    const/4 v9, 0x1

    invoke-direct {v8, v6, v9}, Lza3;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v6, Lx79;->c:Ljava/lang/Object;

    new-instance v8, Lr42;

    invoke-direct {v8, v6, v9}, Lr42;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v6, Lx79;->d:Ljava/lang/Object;

    new-instance v8, Lz22;

    const/16 v9, 0x9

    invoke-direct {v8, v6, v9}, Lz22;-><init>(Ljava/lang/Object;B)V

    iput-object v8, v6, Lx79;->e:Ljava/lang/Object;

    iput-object v2, v6, Lx79;->b:Ljava/lang/Object;

    new-instance v2, Ltu4;

    invoke-direct {v2, v6, v0}, Ltu4;-><init>(Lx79;Landroid/view/View;)V

    invoke-static {v0, v2}, Lq9n;->g(Landroid/view/View;Landroid/view/View$OnAttachStateChangeListener;)V

    new-instance v2, Lbm8;

    const/16 v8, 0x17

    invoke-direct {v2, v6, v8}, Lbm8;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    new-instance v0, Ly53;

    iget-object v2, v1, Li7d;->f:Lh73;

    invoke-direct/range {v0 .. v6}, Ly53;-><init>(Li7d;Lh73;Lor2;Lcom/opera/android/custom_views/FadingNestedScrollView;Ltcc;Lx79;)V

    invoke-virtual {v5, v0}, Ltcc;->a(Lmdc;)V

    iput-object v0, v1, Li7d;->o:Ly53;

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    new-instance v2, Lsma;

    const/16 v3, 0x15

    invoke-direct {v2, v1, v3}, Lsma;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-static {v2}, Li7d;->s0(Landroid/content/res/Configuration;)Z

    move-result v2

    if-eqz v2, :cond_21e

    const v2, 0x106000d

    goto :goto_221

    :cond_21e
    const v2, 0x7f0600ab

    :goto_221
    invoke-virtual {v0, v2}, Landroid/view/View;->setBackgroundResource(I)V

    iget-object v0, v1, Li7d;->f:Lh73;

    iget-object v0, v0, Lh73;->w:Likc;

    invoke-virtual {v1}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v2

    new-instance v3, Lks6;

    const/16 v4, 0x1d

    invoke-direct {v3, v1, v4}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2, v3}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lrf2;

    iget-object v0, v0, Lrf2;->d:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    new-instance v2, Llzb;

    invoke-direct {v2, v1, v9}, Llzb;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v2}, Lq9n;->e(Landroid/view/View;Lr8n;)V

    invoke-virtual {v2, v0}, Llzb;->a(Landroid/view/View;)V

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {v0, v7}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingNestedScrollView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    invoke-virtual {v1}, Li7d;->q0()V

    new-instance v0, Lqm9;

    iget-object v2, v1, Li7d;->l:Lpt1;

    iget-object v2, v2, Lpt1;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/FadingNestedScrollView;

    invoke-direct {v0, v2}, Lqm9;-><init>(Landroid/view/View;)V

    iput-object v0, v1, Li7d;->n:Lqm9;

    new-instance v0, Lqfb;

    const/4 v2, 0x6

    invoke-direct {v0, v1, v2}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v0, v1, Lryl;->b:Lbtj;

    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    invoke-static {v0}, Lxug;->k(Landroid/view/View;)Latj;

    move-result-object v2

    if-nez v2, :cond_290

    new-instance v2, Latj;

    invoke-direct {v2, v0}, Latj;-><init>(Landroid/view/View;)V

    const v3, 0x7f0a0a8f

    invoke-virtual {v0, v3, v2}, Landroid/view/View;->setTag(ILjava/lang/Object;)V

    :cond_290
    iget-object v0, v1, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->b:Landroid/view/View;

    check-cast v0, Landroid/widget/FrameLayout;

    return-object v0

    :cond_297
    move v2, v5

    goto :goto_2d9

    :cond_299
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_2a9
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_2b9
    invoke-virtual {v6}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_2c9
    invoke-virtual {v5}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_2d9
    :goto_2d9
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7

    :cond_2e9
    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v4, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-object v7
.end method

.method public final o0()V
    .registers 2

    iget-object v0, p0, Li7d;->k:Lvl6;

    if-eqz v0, :cond_b

    invoke-virtual {v0}, Lvl6;->S()Z

    move-result v0

    if-eqz v0, :cond_b

    return-void

    :cond_b
    invoke-virtual {p0}, Li7d;->p0()V

    return-void
.end method

.method public final onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 8

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    iget-object v0, p0, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->c:Landroid/view/View;

    check-cast v0, Landroid/widget/LinearLayout;

    new-instance v1, Lq53;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Lq53;-><init>(Li7d;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->post(Ljava/lang/Runnable;)Z

    iget-object v0, p0, Li7d;->m:Lh7d;

    if-eqz v0, :cond_5a

    iget-boolean v1, v0, Lh7d;->e:Z

    if-eqz v1, :cond_32

    iget-object v1, v0, Lh7d;->a:Lvl6;

    iget-object v1, v1, Lvl6;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    iget v1, v1, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->q:I

    const/4 v3, 0x4

    if-eq v1, v2, :cond_30

    const/4 v4, 0x2

    if-eq v1, v4, :cond_30

    const/4 v4, 0x3

    if-ne v1, v4, :cond_30

    move v3, v4

    :cond_30
    iput-byte v3, v0, Lh7d;->f:B

    :cond_32
    invoke-static {p1}, Li7d;->s0(Landroid/content/res/Configuration;)Z

    move-result v1

    invoke-virtual {v0, v1}, Lh7d;->a(Z)V

    iget-object v1, v0, Lh7d;->d:Lyzb;

    new-instance v3, Ly0a;

    const/16 v4, 0x13

    invoke-direct {v3, v0, v4}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v1, Lyzb;->b:Ljava/lang/Object;

    check-cast v0, Li7d;

    iget-object v1, v0, Li7d;->l:Lpt1;

    iget-object v1, v1, Lpt1;->d:Ljava/lang/Object;

    check-cast v1, Lor2;

    iget-object v1, v1, Lor2;->c:Landroid/view/View;

    check-cast v1, Landroid/widget/LinearLayout;

    new-instance v4, Lzr9;

    const/16 v5, 0x16

    invoke-direct {v4, v0, v3, v5}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v4}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_5a
    iget-object v0, p0, Li7d;->n:Lqm9;

    if-eqz v0, :cond_65

    iget-object v0, v0, Lqm9;->d:Lgtj;

    if-eqz v0, :cond_65

    invoke-virtual {v0}, Lgtj;->k()V

    :cond_65
    iget-object p0, p0, Li7d;->o:Ly53;

    if-eqz p0, :cond_92

    iget-object v0, p0, Ly53;->e:Lqm9;

    iget-object v0, v0, Lqm9;->d:Lgtj;

    if-eqz v0, :cond_72

    invoke-virtual {v0}, Lgtj;->k()V

    :cond_72
    iget-object v0, p0, Ly53;->k:Lzol;

    iget p1, p1, Landroid/content/res/Configuration;->screenWidthDp:I

    const/16 v1, 0x168

    if-lt p1, v1, :cond_7b

    const/4 v2, 0x0

    :cond_7b
    iget-boolean p1, v0, Lzol;->f:Z

    if-ne v2, p1, :cond_80

    return-void

    :cond_80
    iput-boolean v2, v0, Lzol;->f:Z

    invoke-virtual {v0}, Ltx7;->h()V

    iget-object p0, p0, Ly53;->c:Lor2;

    iget-object p0, p0, Lor2;->f:Ljava/lang/Object;

    check-cast p0, Lkf;

    iget-object p0, p0, Lkf;->c:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->invalidate()V

    :cond_92
    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lk24;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Lryl;->b:Lbtj;

    iput-object v0, p0, Li7d;->n:Lqm9;

    iput-object v0, p0, Li7d;->o:Ly53;

    iput-object v0, p0, Li7d;->l:Lpt1;

    iput-object v0, p0, Li7d;->p:Lnga;

    iput-object v0, p0, Li7d;->k:Lvl6;

    iput-object v0, p0, Li7d;->m:Lh7d;

    const/4 v0, 0x1

    iput-boolean v0, p0, Li7d;->j:Z

    iget-object p0, p0, Li7d;->q:Lv6d;

    sget-object v0, Lt6d;->a:Lt6d;

    invoke-virtual {p0, v0}, Lv6d;->b(Lt6d;)V

    return-void
.end method

.method public final onResume()V
    .registers 3

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onResume()V

    iget-boolean v0, p0, Li7d;->i:Z

    if-eqz v0, :cond_13

    const/4 v0, 0x0

    iput-boolean v0, p0, Li7d;->i:Z

    new-instance v0, Lq53;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lq53;-><init>(Li7d;B)V

    invoke-static {v0}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_13
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 8

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Li7d;->l:Lpt1;

    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1}, Landroid/graphics/drawable/Drawable;->mutate()Landroid/graphics/drawable/Drawable;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p1

    const p2, 0x7f0700a3

    invoke-virtual {p1, p2}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result p1

    new-instance p2, Lm9f;

    iget-object v0, p0, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingNestedScrollView;

    invoke-direct {p2, v0, p1}, Lm9f;-><init>(Landroid/view/View;I)V

    new-instance p1, Lvl6;

    iget-object v0, p0, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingNestedScrollView;

    new-instance v1, Lc5o;

    const/4 v2, 0x0

    invoke-direct {v1, p0, p2, v2}, Lc5o;-><init>(Ljava/lang/Object;Ljava/lang/Object;Z)V

    const/4 p2, 0x4

    invoke-direct {p1, v0, p2, v1}, Lvl6;-><init>(Landroidx/core/widget/NestedScrollView;ILnj8;)V

    iput-object p1, p0, Li7d;->k:Lvl6;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p1

    invoke-interface {p1}, Lndc;->getLifecycle()Ltcc;

    move-result-object p1

    iget-object p2, p0, Li7d;->k:Lvl6;

    invoke-virtual {p1, p2}, Ltcc;->a(Lmdc;)V

    new-instance p1, Lh7d;

    iget-object p2, p0, Li7d;->k:Lvl6;

    iget-object v0, p0, Li7d;->l:Lpt1;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    new-instance v3, Lyzb;

    const/16 v4, 0xd

    invoke-direct {v3, p0, v4}, Lyzb;-><init>(Ljava/lang/Object;B)V

    invoke-direct {p1, p2, v0, v1, v3}, Lh7d;-><init>(Lvl6;Lpt1;Landroid/content/res/Resources;Lyzb;)V

    iput-object p1, p0, Li7d;->m:Lh7d;

    iget-boolean p1, p0, Li7d;->j:Z

    if-nez p1, :cond_96

    iget-object p1, p0, Li7d;->l:Lpt1;

    iget-object p1, p1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object p1

    invoke-virtual {p1, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object p1, p0, Li7d;->k:Lvl6;

    invoke-virtual {p1}, Lvl6;->S()Z

    iget-boolean p1, p0, Li7d;->h:Z

    if-nez p1, :cond_96

    iget-object p1, p0, Li7d;->m:Lh7d;

    if-eqz p1, :cond_96

    new-instance p2, Ly0a;

    const/16 v0, 0x13

    invoke-direct {p2, p1, v0}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object p1, p0, Li7d;->l:Lpt1;

    iget-object p1, p1, Lpt1;->d:Ljava/lang/Object;

    check-cast p1, Lor2;

    iget-object p1, p1, Lor2;->c:Landroid/view/View;

    check-cast p1, Landroid/widget/LinearLayout;

    new-instance v0, Lzr9;

    const/16 v1, 0x16

    invoke-direct {v0, p0, p2, v1}, Lzr9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {p1, v0}, Lq9n;->A(Landroid/view/View;Ljava/lang/Runnable;)V

    :cond_96
    return-void
.end method

.method public final p0()V
    .registers 2

    iget-boolean v0, p0, Li7d;->i:Z

    if-nez v0, :cond_10

    const/4 v0, 0x1

    iput-boolean v0, p0, Li7d;->i:Z

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->isResumed()Z

    move-result v0

    if-eqz v0, :cond_10

    invoke-virtual {p0}, Lryl;->g0()V

    :cond_10
    return-void
.end method

.method public final q0()V
    .registers 5

    iget-object v0, p0, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lrf2;

    iget-object v0, v0, Lrf2;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    iget-boolean v1, p0, Li7d;->g:Z

    const/4 v2, 0x0

    const/16 v3, 0x8

    if-eqz v1, :cond_17

    move v1, v3

    goto :goto_18

    :cond_17
    move v1, v2

    :goto_18
    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Li7d;->l:Lpt1;

    iget-object v0, v0, Lpt1;->d:Ljava/lang/Object;

    check-cast v0, Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lrf2;

    iget-object v0, v0, Lrf2;->f:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    iget-boolean p0, p0, Li7d;->g:Z

    if-nez p0, :cond_2e

    move v2, v3

    :cond_2e
    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public final r0()V
    .registers 8

    iget-object v0, p0, Li7d;->l:Lpt1;

    if-nez v0, :cond_5

    return-void

    :cond_5
    iget-object v0, p0, Li7d;->f:Lh73;

    iget-object v1, v0, Lh73;->s:Leu3;

    invoke-virtual {v1}, Leu3;->getAsBoolean()Z

    move-result v1

    iget-object v2, p0, Li7d;->l:Lpt1;

    const/4 v3, 0x0

    if-eqz v1, :cond_35

    iget-object v1, v2, Lpt1;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    invoke-virtual {v1, v3, v3, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    new-instance v1, Lnga;

    iget-object v2, p0, Li7d;->l:Lpt1;

    iget-object v2, v2, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v4

    const v5, 0x7f0402ed

    const v6, 0x7f06063b

    invoke-static {v5, v4, v6}, Lf03;->t(ILandroid/content/Context;I)I

    move-result v4

    invoke-direct {v1, v2, v4}, Lnga;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;I)V

    iput-object v1, p0, Li7d;->p:Lnga;

    goto :goto_52

    :cond_35
    iget-object v1, v2, Lpt1;->b:Landroid/view/View;

    check-cast v1, Landroid/widget/FrameLayout;

    iget-object v2, v0, Lh73;->w:Likc;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lavl;

    iget v2, v2, Lavl;->c:I

    invoke-virtual {v1, v3, v2, v3, v3}, Landroid/view/View;->setPadding(IIII)V

    iget-object v1, p0, Li7d;->l:Lpt1;

    iget-object v1, v1, Lpt1;->c:Landroid/view/View;

    check-cast v1, Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v1, v3}, Lcom/opera/android/StatusBarDrawingFrameLayout;->e(I)V

    const/4 v1, 0x0

    iput-object v1, p0, Li7d;->p:Lnga;

    :goto_52
    iget-object v0, v0, Lh73;->t:Lpt3;

    new-instance v1, Ly0a;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Ly0a;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v0, Lpt3;->b:Lcom/opera/android/BrowserActivity;

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    invoke-virtual {p0}, Lcom/opera/android/BrowserActivity;->u0()Landroid/widget/ImageView;

    move-result-object v0

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    const/4 v4, 0x1

    if-eqz v2, :cond_8f

    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v2

    if-nez v2, :cond_8f

    invoke-static {v0}, Lq9n;->t(Landroid/view/View;)Landroid/graphics/Rect;

    move-result-object v0

    invoke-virtual {v0}, Landroid/graphics/Rect;->centerX()I

    move-result v0

    invoke-virtual {p0}, Lfp1;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getDisplayMetrics()Landroid/util/DisplayMetrics;

    move-result-object p0

    iget p0, p0, Landroid/util/DisplayMetrics;->widthPixels:I

    div-int/lit8 p0, p0, 0x2

    if-ge v0, p0, :cond_87

    move v3, v4

    :cond_87
    invoke-static {v3}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object p0

    invoke-interface {v1, p0}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    goto :goto_97

    :cond_8f
    new-instance v2, Lkq2;

    invoke-direct {v2, v1, p0, v4}, Lkq2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    :goto_97
    return-void
.end method

.method public final y()Ljava/lang/String;
    .registers 1

    const-string p0, "MainMenuFragment"

    return-object p0
.end method
