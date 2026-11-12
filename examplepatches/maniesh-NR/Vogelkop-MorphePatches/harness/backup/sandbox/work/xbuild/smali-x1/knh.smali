.class public final Lknh;
.super Lltl;
.source "SourceFile"


# static fields
.field public static final I:Lixh;

.field public static final J:Lixh;


# instance fields
.field public A:Ly83;

.field public B:Lvl6;

.field public C:Lgnh;

.field public D:Lghf;

.field public E:Lflb;

.field public F:Lumh;

.field public G:Z

.field public H:Z

.field public final r:Lfnh;

.field public final s:Lu4l;

.field public final t:Lyqa;

.field public final u:Lysj;

.field public final v:Linh;

.field public final w:Lua7;

.field public final x:Lpde;

.field public final y:Lro9;

.field public final z:Lyc3;


# direct methods
.method static constructor <clinit>()V
    .registers 2

    new-instance v0, Lixh;

    const/high16 v1, 0x42200000    # 40.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lknh;->I:Lixh;

    new-instance v0, Lixh;

    const/high16 v1, 0x41a00000    # 20.0f

    invoke-direct {v0, v1}, Lixh;-><init>(F)V

    sput-object v0, Lknh;->J:Lixh;

    return-void
.end method

.method public constructor <init>(Lgjm;Lfnh;Lu4l;Lyqa;Lysj;Linh;)V
    .registers 9

    const v0, 0x7f0d0361

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x0

    iput-boolean v1, v0, Litl;->h:Z

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->f:Z

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p2, p0, Lknh;->r:Lfnh;

    iput-object p3, p0, Lknh;->s:Lu4l;

    iput-object p4, p0, Lknh;->t:Lyqa;

    iput-object p5, p0, Lknh;->u:Lysj;

    iput-object p6, p0, Lknh;->v:Linh;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lknh;->w:Lua7;

    new-instance p1, Lpde;

    sget-object p2, Log;->a:Log;

    invoke-direct {p1, p2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p1, p0, Lknh;->x:Lpde;

    new-instance p1, Lro9;

    const/16 p2, 0x1c

    invoke-direct {p1, p2}, Lro9;-><init>(B)V

    iput-object p1, p0, Lknh;->y:Lro9;

    new-instance p1, Lyc3;

    const/4 p2, 0x4

    invoke-direct {p1, p0, p2}, Lyc3;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Lknh;->z:Lyc3;

    return-void
.end method


# virtual methods
.method public final G0(Ljava/lang/String;Z)V
    .registers 5

    if-nez p2, :cond_b

    iget-object p2, p0, Lknh;->v:Linh;

    invoke-interface {p2}, Linh;->g()Z

    move-result p2

    if-eqz p2, :cond_b

    return-void

    :cond_b
    iget-object p2, p0, Lknh;->A:Ly83;

    const/4 v0, 0x0

    if-nez p2, :cond_11

    move-object p2, v0

    :cond_11
    iget-object p2, p2, Ly83;->b:Landroid/view/ViewGroup;

    check-cast p2, Landroid/widget/LinearLayout;

    invoke-virtual {p2}, Landroid/view/View;->getParent()Landroid/view/ViewParent;

    move-result-object p2

    instance-of v1, p2, Landroid/view/View;

    if-eqz v1, :cond_20

    move-object v0, p2

    check-cast v0, Landroid/view/View;

    :cond_20
    if-nez v0, :cond_33

    new-instance p2, Lnm2;

    const/4 v0, 0x1

    invoke-direct {p2, p1, v0}, Lnm2;-><init>(Ljava/lang/String;B)V

    iget-object p0, p0, Lknh;->u:Lysj;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, p2, p1}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_33
    const/16 p0, 0x9c4

    invoke-static {v0, p1, p0}, Lgtj;->e(Landroid/view/View;Ljava/lang/CharSequence;I)Lgtj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lgtj;->b(Landroid/view/View;)V

    invoke-virtual {p0}, Lgtj;->j()V

    return-void
.end method

.method public final H0(Lcom/opera/android/sheet/OperaBottomSheetBehavior;)V
    .registers 11

    iget-object v0, p0, Lknh;->A:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-virtual {v0}, Landroid/view/View;->isLaidOut()Z

    move-result v2

    if-eqz v2, :cond_5b

    invoke-virtual {v0}, Landroid/view/View;->isLayoutRequested()Z

    move-result v2

    if-nez v2, :cond_5b

    iget-object v0, p0, Lknh;->A:Ly83;

    if-nez v0, :cond_1b

    move-object v0, v1

    :cond_1b
    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    iget-object p0, p0, Lknh;->A:Ly83;

    if-eqz p0, :cond_28

    move-object v1, p0

    :cond_28
    iget-object p0, v1, Ly83;->g:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-virtual {p0}, Landroid/view/View;->getHeight()I

    move-result p0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0709f8

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    int-to-double v1, v0

    const-wide/high16 v3, 0x401b000000000000L    # 6.75

    mul-double/2addr v3, v1

    if-lez p0, :cond_56

    :goto_41
    int-to-double v5, p0

    div-double v5, v3, v5

    const-wide v7, 0x3feb333333333333L    # 0.85

    cmpl-double v5, v5, v7

    if-lez v5, :cond_56

    shl-int/lit8 v5, v0, 0x1

    int-to-double v5, v5

    cmpl-double v5, v3, v5

    if-lez v5, :cond_56

    sub-double/2addr v3, v1

    goto :goto_41

    :cond_56
    double-to-int p0, v3

    invoke-virtual {p1, p0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->H(I)V

    return-void

    :cond_5b
    new-instance v1, Lkq2;

    const/4 v2, 0x2

    invoke-direct {v1, p1, p0, v2}, Lkq2;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    return-void
.end method

.method public final I0()V
    .registers 4

    iget-boolean v0, p0, Lknh;->H:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_17

    iget-object v0, p0, Lknh;->A:Ly83;

    if-nez v0, :cond_a

    move-object v0, v1

    :cond_a
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    const/4 v2, -0x1

    invoke-virtual {v0, v2}, Landroid/view/View;->canScrollVertically(I)Z

    move-result v0

    if-nez v0, :cond_17

    const/4 v0, 0x1

    goto :goto_18

    :cond_17
    const/4 v0, 0x0

    :goto_18
    iget-object v2, p0, Lknh;->A:Ly83;

    if-nez v2, :cond_1d

    move-object v2, v1

    :cond_1d
    iget-object v2, v2, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/RecyclerView;->Y()Ls14;

    move-result-object v2

    iget-boolean v2, v2, Ls14;->b:Z

    if-eq v0, v2, :cond_38

    iget-object v2, p0, Lknh;->A:Ly83;

    if-eqz v2, :cond_2e

    move-object v1, v2

    :cond_2e
    iget-object v1, v1, Ly83;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->setNestedScrollingEnabled(Z)V

    invoke-virtual {p0}, Lknh;->J0()V

    :cond_38
    return-void
.end method

.method public final J0()V
    .registers 4

    iget-object v0, p0, Lknh;->A:Ly83;

    const/4 v1, 0x0

    if-nez v0, :cond_7

    move-object v2, v1

    goto :goto_8

    :cond_7
    move-object v2, v0

    :goto_8
    iget-object v2, v2, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    if-nez v0, :cond_f

    move-object v0, v1

    :cond_f
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->Y()Ls14;

    move-result-object v0

    iget-boolean v0, v0, Ls14;->b:Z

    if-nez v0, :cond_25

    iget-boolean v0, p0, Lknh;->G:Z

    if-nez v0, :cond_25

    iget-boolean p0, p0, Lknh;->H:Z

    if-eqz p0, :cond_25

    const/4 p0, 0x0

    goto :goto_26

    :cond_25
    const/4 p0, 0x1

    :goto_26
    iput-boolean p0, v2, Lcom/opera/android/widget/MeasurableHeightScrollView;->L:Z

    return-void
.end method

.method public final l0(Z)V
    .registers 2

    iget-object p0, p0, Lknh;->B:Lvl6;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    invoke-virtual {p0}, Lvl6;->S()Z

    return-void
.end method

.method public final onDestroy()V
    .registers 2

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object v0, p0, Lknh;->A:Ly83;

    if-nez v0, :cond_8

    const/4 v0, 0x0

    :cond_8
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    iget-object p0, p0, Lknh;->z:Lyc3;

    invoke-virtual {v0, p0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    return-void
.end method

.method public final onStart()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStart()V

    iget-object p0, p0, Lknh;->x:Lpde;

    sget-object v0, Lng;->a:Lng;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final onStop()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/i;->onStop()V

    iget-object p0, p0, Lknh;->x:Lpde;

    sget-object v0, Log;->a:Log;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 27

    move-object/from16 v6, p0

    move-object/from16 v7, p1

    invoke-super/range {p0 .. p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance v0, Lca;

    const/4 v1, 0x5

    invoke-direct {v0, v7, v1}, Lca;-><init>(Landroid/view/View;B)V

    invoke-virtual {v7, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    new-instance v0, Lnga;

    iget-object v1, v6, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v2, 0x0

    invoke-direct {v0, v1, v2}, Lnga;-><init>(Lcom/opera/android/StatusBarDrawingFrameLayout;I)V

    iget-object v1, v6, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    new-instance v3, Le73;

    const/16 v4, 0xb

    invoke-direct {v3, v0, v6, v4}, Le73;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-static {v1, v3}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object v0, v6, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v1, Landroid/graphics/drawable/ColorDrawable;

    iget-object v3, v6, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v3}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    const v4, 0x7f0600ab

    invoke-virtual {v3, v4}, Landroid/content/Context;->getColor(I)I

    move-result v3

    invoke-direct {v1, v3}, Landroid/graphics/drawable/ColorDrawable;-><init>(I)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setBackground(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, v6, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-virtual {v0}, Landroid/view/View;->getBackground()Landroid/graphics/drawable/Drawable;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/graphics/drawable/Drawable;->setAlpha(I)V

    iget-object v0, v6, Lknh;->A:Ly83;

    const/4 v8, 0x0

    if-nez v0, :cond_4a

    move-object v0, v8

    :cond_4a
    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-static {v0}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->C(Landroid/view/View;)Lcom/opera/android/sheet/OperaBottomSheetBehavior;

    move-result-object v0

    new-instance v1, Lr42;

    const/4 v2, 0x3

    invoke-direct {v1, v6, v2}, Lr42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Lcom/opera/android/sheet/OperaBottomSheetBehavior;->x(Lnjf;)V

    invoke-virtual {v6, v0}, Lknh;->H0(Lcom/opera/android/sheet/OperaBottomSheetBehavior;)V

    iget-object v1, v6, Lknh;->A:Ly83;

    if-nez v1, :cond_63

    move-object v1, v8

    :cond_63
    iget-object v1, v1, Ly83;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance v2, Lvs7;

    const/4 v3, 0x1

    invoke-direct {v2, v6, v0, v3}, Lvs7;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroid/view/View;->addOnLayoutChangeListener(Landroid/view/View$OnLayoutChangeListener;)V

    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    const v1, 0x7f0700a3

    invoke-virtual {v0, v1}, Landroid/content/res/Resources;->getDimensionPixelSize(I)I

    move-result v0

    new-instance v1, Lm9f;

    iget-object v2, v6, Lknh;->A:Ly83;

    if-nez v2, :cond_82

    move-object v2, v8

    :cond_82
    iget-object v2, v2, Ly83;->g:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/widget/MeasurableHeightScrollView;

    invoke-direct {v1, v2, v0}, Lm9f;-><init>(Landroid/view/View;I)V

    const/high16 v0, 0x3f800000    # 1.0f

    invoke-virtual {v1, v0}, Lm9f;->v(F)V

    new-instance v0, Lvl6;

    iget-object v1, v6, Lknh;->A:Ly83;

    if-nez v1, :cond_95

    move-object v1, v8

    :cond_95
    iget-object v1, v1, Ly83;->g:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance v2, Llld;

    const/16 v3, 0x10

    invoke-direct {v2, v6, v3}, Llld;-><init>(Ljava/lang/Object;B)V

    const/4 v9, 0x6

    invoke-direct {v0, v1, v9, v2}, Lvl6;-><init>(Landroidx/core/widget/NestedScrollView;ILnj8;)V

    iput-object v0, v6, Lknh;->B:Lvl6;

    invoke-virtual {v6}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    invoke-interface {v0}, Lndc;->getLifecycle()Ltcc;

    move-result-object v0

    iget-object v1, v6, Lknh;->B:Lvl6;

    if-nez v1, :cond_b3

    move-object v1, v8

    :cond_b3
    invoke-virtual {v0, v1}, Ltcc;->a(Lmdc;)V

    new-instance v0, Lgnh;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    iget-object v1, v6, Lknh;->v:Linh;

    invoke-interface {v1}, Linh;->j()Lb2l;

    move-result-object v5

    iget-object v1, v6, Lknh;->x:Lpde;

    iget-object v3, v6, Lknh;->r:Lfnh;

    iget-object v4, v6, Lknh;->s:Lu4l;

    invoke-direct/range {v0 .. v6}, Lgnh;-><init>(Lpde;Landroid/content/Context;Lfnh;Lu4l;Lb2l;Lknh;)V

    iput-object v0, v6, Lknh;->C:Lgnh;

    new-instance v2, Lghf;

    invoke-direct {v2, v0}, Lghf;-><init>(Lgnh;)V

    iput-object v2, v6, Lknh;->D:Lghf;

    new-instance v0, Lflb;

    new-instance v2, Lnvk;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    iget-object v4, v6, Lknh;->D:Lghf;

    if-nez v4, :cond_e1

    move-object v4, v8

    :cond_e1
    invoke-direct {v2, v3, v4}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    invoke-direct {v0, v2}, Lflb;-><init>(Lblb;)V

    iput-object v0, v6, Lknh;->E:Lflb;

    new-instance v13, Likc;

    sget-object v15, Ljsc;->d:Ljsc;

    new-instance v0, Luxj;

    new-instance v2, Lixh;

    const/4 v3, 0x0

    invoke-direct {v2, v3}, Lixh;-><init>(F)V

    const/16 v4, 0x3b

    invoke-direct {v0, v2, v4}, Luxj;-><init>(Lixh;I)V

    new-instance v2, Lqxj;

    new-instance v4, Llxh;

    const v5, 0x7f080570

    invoke-direct {v4, v5}, Llxh;-><init>(I)V

    const/16 v5, 0xfe

    invoke-direct {v2, v4, v8, v8, v5}, Lqxj;-><init>(Llxh;Lgxh;Lcxh;I)V

    new-instance v4, Lrxj;

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v5

    sget-object v10, Lknh;->I:Lixh;

    invoke-virtual {v10, v5}, Ly7h;->k(Landroid/content/Context;)I

    move-result v5

    invoke-virtual {v7}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v7

    invoke-virtual {v10, v7}, Ly7h;->k(Landroid/content/Context;)I

    move-result v7

    invoke-direct {v4, v5, v7}, Lrxj;-><init>(II)V

    new-instance v5, Lzxj;

    sget-object v20, Lumj;->c:Lumj;

    new-instance v7, Lixh;

    invoke-direct {v7, v3}, Lixh;-><init>(F)V

    new-instance v16, Layj;

    const/16 v21, 0x1

    move-object/from16 v18, v10

    move-object/from16 v19, v7

    move-object/from16 v17, v10

    invoke-direct/range {v16 .. v21}, Layj;-><init>(Lixh;Lixh;Lixh;Lumj;Z)V

    move-object/from16 v3, v16

    invoke-direct {v5, v3}, Lzxj;-><init>(Ly7h;)V

    new-instance v14, Lcyj;

    const/16 v22, 0x0

    const/16 v23, 0x84

    sget-object v16, Lknh;->J:Lixh;

    const/16 v17, 0x0

    move-object/from16 v20, v0

    move-object/from16 v21, v2

    move-object/from16 v18, v4

    move-object/from16 v19, v5

    invoke-direct/range {v14 .. v23}, Lcyj;-><init>(Ljsc;Ly7h;Lhxh;Lrxj;Lzxj;Luxj;Lqxj;Lpxj;I)V

    invoke-direct {v13, v14}, Lekc;-><init>(Ljava/lang/Object;)V

    new-instance v10, Lumh;

    iget-object v0, v6, Lknh;->C:Lgnh;

    if-nez v0, :cond_15b

    move-object v12, v8

    goto :goto_15c

    :cond_15b
    move-object v12, v0

    :goto_15c
    iget-object v0, v6, Lknh;->D:Lghf;

    if-nez v0, :cond_162

    move-object v15, v8

    goto :goto_163

    :cond_162
    move-object v15, v0

    :goto_163
    iget-object v14, v6, Lknh;->t:Lyqa;

    iget-object v0, v6, Lknh;->y:Lro9;

    move-object/from16 v16, v0

    move-object v11, v1

    invoke-direct/range {v10 .. v16}, Lumh;-><init>(Lpde;Lgnh;Likc;Lyqa;Ljvk;Lro9;)V

    iput-object v10, v6, Lknh;->F:Lumh;

    iget-object v2, v6, Lknh;->A:Ly83;

    if-nez v2, :cond_174

    move-object v2, v8

    :cond_174
    iget-object v2, v2, Ly83;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->D0(Lro9;)V

    new-instance v0, Lij8;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-direct {v0, v3}, Lij8;-><init>(Landroid/content/Context;)V

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    new-instance v0, Lk56;

    invoke-direct {v0}, Lk56;-><init>()V

    invoke-virtual {v2, v0}, Lcom/opera/android/custom_views/RecyclerViewForScreenshot;->B0(Landroidx/recyclerview/widget/e;)V

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v0, v6, Lknh;->F:Lumh;

    if-nez v0, :cond_19f

    move-object v0, v8

    :cond_19f
    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, v6, Lknh;->E:Lflb;

    if-nez v0, :cond_1a7

    move-object v0, v8

    :cond_1a7
    invoke-virtual {v0, v2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Ls6h;

    const/16 v2, 0xc

    invoke-direct {v0, v2}, Ls6h;-><init>(B)V

    iget-object v2, v6, Lknh;->A:Ly83;

    if-nez v2, :cond_1b6

    move-object v2, v8

    :cond_1b6
    iget-object v2, v2, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v2, Landroid/widget/LinearLayout;

    new-instance v3, Lj5g;

    invoke-direct {v3, v0, v6, v9}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v0, v6, Lknh;->A:Ly83;

    if-nez v0, :cond_1c7

    move-object v0, v8

    :cond_1c7
    iget-object v0, v0, Ly83;->h:Ljava/lang/Object;

    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    new-instance v2, Lm42;

    const/4 v3, 0x7

    invoke-direct {v2, v6, v3}, Lm42;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnTouchListener(Landroid/view/View$OnTouchListener;)V

    iget-object v0, v6, Lknh;->A:Ly83;

    if-nez v0, :cond_1d9

    move-object v0, v8

    :cond_1d9
    iget-object v0, v0, Ly83;->d:Ljava/lang/Object;

    check-cast v0, Lkf;

    iget-object v0, v0, Lkf;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageButton;

    new-instance v2, Lzvd;

    const/16 v3, 0x1d

    invoke-direct {v2, v6, v3}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    invoke-virtual {v6}, Lknh;->J0()V

    invoke-virtual {v6}, Lknh;->I0()V

    iget-object v0, v6, Lknh;->A:Ly83;

    if-nez v0, :cond_1f6

    move-object v0, v8

    :cond_1f6
    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    iget-object v2, v6, Lknh;->z:Lyc3;

    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    iget-object v0, v6, Lknh;->A:Ly83;

    if-nez v0, :cond_204

    move-object v0, v8

    :cond_204
    iget-object v0, v0, Ly83;->g:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/MeasurableHeightScrollView;

    new-instance v2, Lr9g;

    const/16 v3, 0x14

    invoke-direct {v2, v6, v3}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-static {v2, v0}, Lq9n;->d(Lm9n;Landroid/view/View;)V

    iget-object v0, v6, Lknh;->C:Lgnh;

    if-eqz v0, :cond_217

    move-object v8, v0

    :cond_217
    iget-object v0, v8, Lgnh;->i:Lpde;

    new-instance v2, Liwa;

    const/16 v3, 0x18

    invoke-direct {v2, v6, v3}, Liwa;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1, v2}, La26;->T(Lekc;Likc;Lf7f;)V

    return-void
.end method

.method public final t0(Landroid/content/Context;)I
    .registers 2

    const/4 p0, 0x0

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 13

    const p1, 0x7f0a04d0

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a0269

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetContentWrapper;

    const-string v0, "Missing required view with ID: "

    if-eqz v3, :cond_a1

    move-object v2, p1

    check-cast v2, Landroid/widget/LinearLayout;

    const p2, 0x7f0a0514

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    if-eqz v1, :cond_a1

    const p2, 0x7f0a02cb

    invoke-static {p2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/custom_views/StylingImageButton;

    if-eqz v4, :cond_91

    const p2, 0x7f0a0341

    invoke-static {p2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v5, :cond_91

    const p2, 0x7f0a06c5

    invoke-static {p2, v1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v5

    check-cast v5, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v5, :cond_91

    move-object v5, v4

    new-instance v4, Lkf;

    check-cast v1, Landroidx/constraintlayout/widget/ConstraintLayout;

    const/16 p2, 0x19

    invoke-direct {v4, p2, v1, v5}, Lkf;-><init>(BLandroid/view/View;Ljava/lang/Object;)V

    const p2, 0x7f0a05f1

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/tabui2/recently_closed_tabs/RecentlyClosedTabsSheetLayoutSwitcher;

    if-eqz v5, :cond_a1

    const p2, 0x7f0a08a3

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/custom_views/ExactHeightRecyclerView;

    if-eqz v6, :cond_a1

    const p2, 0x7f0a0a45

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/widget/MeasurableHeightScrollView;

    if-eqz v7, :cond_a1

    const p2, 0x7f0a0a48

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    check-cast v1, Lcom/opera/android/sheet/VelocityTrackingCoordinatorLayout;

    if-eqz v1, :cond_a1

    const p2, 0x7f0a0bba

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Landroidx/appcompat/widget/Toolbar;

    if-eqz v8, :cond_a1

    new-instance v1, Ly83;

    const/16 v9, 0x8

    invoke-direct/range {v1 .. v9}, Ly83;-><init>(Landroid/view/ViewGroup;Ljava/lang/Object;Ljava/lang/Object;Landroid/view/View;Landroid/view/View;Ljava/lang/Object;Landroid/view/View;B)V

    iput-object v1, p0, Lknh;->A:Ly83;

    return-void

    :cond_91
    invoke-virtual {v1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_a1
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v0, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
