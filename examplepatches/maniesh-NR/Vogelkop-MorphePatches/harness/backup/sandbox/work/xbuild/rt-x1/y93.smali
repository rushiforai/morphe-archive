.class public abstract Ly93;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Lywk;
.implements Lmm9;


# instance fields
.field public A:Z

.field public B:Landroid/view/LayoutInflater;

.field public C:Z

.field public r:Lor2;

.field public s:Z

.field public final t:Lr93;

.field public u:Landroid/view/ViewGroup;

.field public v:Landroidx/viewpager/widget/ViewPager;

.field public w:Lcom/opera/android/custom_views/FadingRecyclerView;

.field public x:Lcom/google/android/material/appbar/AppBarLayout;

.field public y:Lt93;

.field public z:Lzwk;


# direct methods
.method public constructor <init>(II)V
    .registers 6

    const v0, 0x7f0d03ec

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    invoke-virtual {v0, p1}, Lu7k;->s(I)V

    iput p2, v1, Litl;->b:I

    invoke-direct {p0, v1}, Lltl;-><init>(Litl;)V

    new-instance p1, Lr93;

    const/4 p2, 0x0

    invoke-direct {p1, p0, p2}, Lr93;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ly93;->t:Lr93;

    iput-boolean v2, p0, Ly93;->A:Z

    return-void
.end method


# virtual methods
.method public final G(I)V
    .registers 2

    return-void
.end method

.method public abstract G0(Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)Landroidx/recyclerview/widget/d;
.end method

.method public H0(Landroid/view/ViewGroup;Ljava/lang/Object;)Lu93;
    .registers 9

    move-object v4, p2

    check-cast v4, Lcom/opera/android/sync/SyncedSession;

    iget-object p2, p0, Ly93;->B:Landroid/view/LayoutInflater;

    const v0, 0x7f0d03ef

    const/4 v1, 0x0

    invoke-virtual {p2, v0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    move-object v2, p1

    check-cast v2, Landroid/view/ViewGroup;

    const p1, 0x7f0a0600

    invoke-virtual {v2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    move-object v3, p1

    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    new-instance v5, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    const/4 p1, 0x1

    invoke-direct {v5, p1, v1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v3, v5}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v0, Lu93;

    move-object v1, p0

    invoke-direct/range {v0 .. v5}, Lu93;-><init>(Ly93;Landroid/view/ViewGroup;Landroidx/recyclerview/widget/RecyclerView;Ljava/lang/Object;Landroidx/recyclerview/widget/LinearLayoutManager;)V

    return-object v0
.end method

.method public final I0(Ljava/lang/Object;)Ljava/lang/String;
    .registers 3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {p0, p1}, Ly93;->J0(Ljava/lang/Object;)Ljava/util/Date;

    move-result-object p0

    invoke-static {p0}, Laik;->e(Ljava/util/Date;)Ljava/lang/String;

    move-result-object p0

    filled-new-array {p0}, [Ljava/lang/Object;

    move-result-object p0

    const p1, 0x7f14121c

    invoke-virtual {v0, p1, p0}, Landroid/content/res/Resources;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public J0(Ljava/lang/Object;)Ljava/util/Date;
    .registers 2

    check-cast p1, Ltq8;

    invoke-virtual {p1}, Ltq8;->z()Ljava/util/Date;

    move-result-object p0

    return-object p0
.end method

.method public K0(Ljava/lang/Object;)Ljava/lang/String;
    .registers 2

    check-cast p1, Ltq8;

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public L0()[Ljava/lang/Object;
    .registers 1

    invoke-static {}, LJ/N;->MENDCTHo()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/opera/android/sync/SyncedSession;

    return-object p0
.end method

.method public M0()V
    .registers 7

    iget-object v0, p0, Ly93;->y:Lt93;

    iget v0, v0, Lt93;->b:I

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_a

    move v0, v1

    goto :goto_b

    :cond_a
    move v0, v2

    :goto_b
    invoke-virtual {p0}, Ly93;->L0()[Ljava/lang/Object;

    move-result-object v3

    array-length v4, v3

    const/16 v5, 0x8

    if-gtz v4, :cond_72

    if-eqz v0, :cond_62

    iget-boolean v0, p0, Ly93;->A:Z

    if-eqz v0, :cond_62

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v1, 0x4

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f141226

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/4 v1, -0x1

    invoke-virtual {v0, v1}, Ln2d;->p(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const v1, 0x7f130040

    invoke-virtual {v0, v1}, Ln2d;->j(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    invoke-virtual {v0}, Lcom/opera/android/widget/LottieAnimationView;->h()V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    goto :goto_65

    :cond_62
    invoke-virtual {p0}, Ly93;->N0()V

    :goto_65
    iget-object v0, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, v5}, Landroid/view/View;->setVisibility(I)V

    iput-boolean v2, p0, Ly93;->A:Z

    return-void

    :cond_72
    iget-object v4, p0, Ly93;->r:Lor2;

    iget-object v4, v4, Lor2;->c:Landroid/view/View;

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {v4, v5}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v4, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v4, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v2, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v2}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object v2

    invoke-virtual {v2}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    iget-object v2, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    invoke-virtual {v2}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    iget-object v2, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-static {v2}, Lcs5;->W(Landroid/view/View;)Z

    move-result v2

    if-eqz v2, :cond_a8

    if-eqz v0, :cond_a8

    iput-boolean v1, p0, Ly93;->s:Z

    iget-object p0, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    array-length v0, v3

    sub-int/2addr v0, v1

    invoke-virtual {p0, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    :cond_a8
    return-void
.end method

.method public N0()V
    .registers 5

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v2, 0x0

    invoke-virtual {v0, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v2, 0x7f14121e

    invoke-virtual {v0, v2}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v2

    const v3, 0x7f0807ae

    invoke-static {v3, v2}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v2

    invoke-virtual {v0, v2}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object p0, p0, Ly93;->r:Lor2;

    iget-object p0, p0, Lor2;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {p0, v1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public O0()V
    .registers 4

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->d:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->b:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingTextView;

    const v1, 0x7f141208

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(I)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    const v2, 0x7f0807ae

    invoke-static {v2, v1}, Lsgb;->F(ILandroid/content/Context;)Landroid/graphics/drawable/Drawable;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/StylingImageView;->setImageDrawable(Landroid/graphics/drawable/Drawable;)V

    iget-object v0, p0, Ly93;->r:Lor2;

    iget-object v0, v0, Lor2;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v1, Lh4i;

    const/16 v2, 0x15

    invoke-direct {v1, p0, v2}, Lh4i;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final X(Landroid/os/Bundle;Ljava/lang/String;)V
    .registers 4

    const-string v0, "SyncAuthPortalFragment_request"

    invoke-virtual {v0, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result p2

    if-eqz p2, :cond_1e

    const-string p2, "result_code"

    invoke-virtual {p1, p2}, Landroid/os/BaseBundle;->getInt(Ljava/lang/String;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_1e

    const/4 p1, 0x1

    iput-boolean p1, p0, Ly93;->C:Z

    new-instance p1, Lfv2;

    const/16 p2, 0xa

    invoke-direct {p1, p0, p2}, Lfv2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lvml;->c(Ljava/lang/Runnable;)V

    :cond_1e
    return-void
.end method

.method public final g()V
    .registers 1

    invoke-virtual {p0}, Ly93;->M0()V

    return-void
.end method

.method public final l0(Z)V
    .registers 4

    if-eqz p1, :cond_14

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getFragmentManager()Landroidx/fragment/app/w;

    move-result-object v0

    const-string v1, "dialog"

    invoke-virtual {v0, v1}, Landroidx/fragment/app/w;->F(Ljava/lang/String;)Landroidx/fragment/app/Fragment;

    move-result-object v0

    check-cast v0, Landroidx/fragment/app/i;

    if-eqz v0, :cond_14

    invoke-virtual {v0}, Landroidx/fragment/app/i;->dismiss()V

    return-void

    :cond_14
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 4

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {p1}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object p1

    check-cast p1, Lcom/opera/android/OperaApplication;

    invoke-virtual {p1}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object p1

    iput-object p1, p0, Ly93;->z:Lzwk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p1

    new-instance v0, Lmxk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    check-cast v1, Lcom/opera/android/BrowserActivity;

    iget-object v1, v1, Lcom/opera/android/BrowserActivity;->U:Ldxk;

    if-nez v1, :cond_22

    const/4 v1, 0x0

    :cond_22
    iget-object p0, p0, Ly93;->z:Lzwk;

    invoke-direct {v0, v1, p0}, Lmxk;-><init>(Ldxk;Lzwk;)V

    invoke-virtual {p1, v0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final onCreateAnimator(IZI)Landroid/animation/Animator;
    .registers 5

    if-nez p2, :cond_15

    iget-boolean v0, p0, Ly93;->C:Z

    if-eqz v0, :cond_15

    const/4 p0, 0x0

    filled-new-array {p0}, [I

    move-result-object p0

    invoke-static {p0}, Landroid/animation/ValueAnimator;->ofInt([I)Landroid/animation/ValueAnimator;

    move-result-object p0

    const-wide/16 p1, 0x0

    invoke-virtual {p0, p1, p2}, Landroid/animation/Animator;->setDuration(J)Landroid/animation/Animator;

    return-object p0

    :cond_15
    invoke-super {p0, p1, p2, p3}, Landroidx/fragment/app/Fragment;->onCreateAnimator(IZI)Landroid/animation/Animator;

    move-result-object p0

    return-object p0
.end method

.method public onDestroyView()V
    .registers 4

    iget-object v0, p0, Ly93;->z:Lzwk;

    invoke-virtual {v0, p0}, Lzwk;->j(Lywk;)V

    iget-object v0, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    const/4 v1, 0x0

    if-eqz v0, :cond_14

    iget-object v2, p0, Ly93;->t:Lr93;

    invoke-virtual {v0, v2}, Landroidx/viewpager/widget/ViewPager;->removeOnPageChangeListener(Le8n;)V

    iget-object v0, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    :cond_14
    iput-object v1, p0, Ly93;->y:Lt93;

    iput-object v1, p0, Ly93;->u:Landroid/view/ViewGroup;

    iput-object v1, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    iput-object v1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v1, p0, Ly93;->x:Lcom/google/android/material/appbar/AppBarLayout;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onDetach()V
    .registers 2

    invoke-super {p0}, Lk24;->onDetach()V

    const/4 v0, 0x0

    iput-object v0, p0, Ly93;->z:Lzwk;

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 13

    new-instance v0, Lt93;

    invoke-direct {v0, p0}, Lt93;-><init>(Ly93;)V

    iput-object v0, p0, Ly93;->y:Lt93;

    iput-object p1, p0, Ly93;->B:Landroid/view/LayoutInflater;

    const v0, 0x7f0a0269

    invoke-virtual {p2, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroid/view/ViewGroup;

    iput-object v0, p0, Ly93;->u:Landroid/view/ViewGroup;

    const v0, 0x7f0d0123

    const/4 v1, 0x0

    const/4 v2, 0x0

    invoke-virtual {p1, v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    const v0, 0x7f0a00f2

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v5, v1

    check-cast v5, Lcom/opera/android/widget/ThemeableLottieAnimationView;

    if-eqz v5, :cond_dc

    const v0, 0x7f0a0378

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v6, v1

    check-cast v6, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v6, :cond_dc

    const v0, 0x7f0a037a

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v7, v1

    check-cast v7, Lcom/opera/android/custom_views/StylingImageView;

    if-eqz v7, :cond_dc

    const v0, 0x7f0a0382

    invoke-static {v0, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v1

    move-object v8, v1

    check-cast v8, Lcom/opera/android/custom_views/StylingTextView;

    if-eqz v8, :cond_dc

    move-object v4, p1

    check-cast v4, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v3, Lor2;

    const/4 v9, 0x7

    invoke-direct/range {v3 .. v9}, Lor2;-><init>(Landroid/view/View;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v3, p0, Ly93;->r:Lor2;

    invoke-virtual {p2, v4}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const p1, 0x7f0a010b

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/google/android/material/appbar/AppBarLayout;

    iput-object p1, p0, Ly93;->x:Lcom/google/android/material/appbar/AppBarLayout;

    const p1, 0x7f0a0b38

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object p1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    const/16 p2, 0x8

    invoke-virtual {p1, p2}, Landroid/view/View;->setVisibility(I)V

    iget-object p1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Lx93;

    invoke-direct {p2, p0, v2}, Lx93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Lw93;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    invoke-direct {p2, v2, v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance p2, Ls93;

    invoke-direct {p2, p0, v2}, Ls93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iget-object p1, p0, Ly93;->w:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p1, v2}, Landroid/view/View;->setLayoutDirection(I)V

    iget-object p1, p0, Ly93;->x:Lcom/google/android/material/appbar/AppBarLayout;

    const/4 p2, -0x1

    invoke-static {p1, p2}, Lltl;->o0(Lcom/google/android/material/appbar/AppBarLayout;I)V

    iget-object p1, p0, Ly93;->u:Landroid/view/ViewGroup;

    const p2, 0x7f0a0c93

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/viewpager/widget/ViewPager;

    iput-object p1, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    iget-object p2, p0, Ly93;->y:Lt93;

    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    iget-object p1, p0, Ly93;->v:Landroidx/viewpager/widget/ViewPager;

    iget-object p2, p0, Ly93;->t:Lr93;

    invoke-virtual {p1, p2}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    iget-object p1, p0, Ly93;->z:Lzwk;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lzwk;->e()Z

    move-result p1

    if-eqz p1, :cond_ca

    invoke-virtual {p0}, Ly93;->M0()V

    goto :goto_d6

    :cond_ca
    invoke-virtual {p0}, Ly93;->O0()V

    iget-object p1, p0, Ly93;->r:Lor2;

    iget-object p1, p1, Lor2;->c:Landroid/view/View;

    check-cast p1, Landroidx/constraintlayout/widget/ConstraintLayout;

    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :goto_d6
    iget-object p1, p0, Ly93;->z:Lzwk;

    invoke-virtual {p1, p0}, Lzwk;->a(Lywk;)V

    return-void

    :cond_dc
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v0}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method
