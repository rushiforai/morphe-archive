.class public final Lxwe;
.super Lk24;
.source "SourceFile"


# instance fields
.field public f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

.field public g:Lvwe;

.field public h:Lghf;

.field public i:Ltni;

.field public final j:Z

.field public final k:Lgjm;

.field public l:Z

.field public final m:Lit3;


# direct methods
.method public constructor <init>(ZLgjm;)V
    .registers 5

    invoke-direct {p0}, Lk24;-><init>()V

    new-instance v0, Lit3;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lit3;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lxwe;->m:Lit3;

    iput-boolean p1, p0, Lxwe;->j:Z

    iput-object p2, p0, Lxwe;->k:Lgjm;

    return-void
.end method


# virtual methods
.method public final dismiss()V
    .registers 1

    invoke-virtual {p0}, Lxwe;->g0()V

    return-void
.end method

.method public final g0()V
    .registers 10

    invoke-super {p0}, Lryl;->g0()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v0

    iget-object v0, v0, Ld6j;->c:Lx5f;

    iget-boolean v1, p0, Lxwe;->l:Z

    if-eqz v1, :cond_1c

    sget-object v1, Lvb0;->b:Lvb0;

    goto :goto_1e

    :cond_1c
    sget-object v1, Lvb0;->d:Lvb0;

    :goto_1e
    iget-object p0, p0, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    const/4 v2, 0x0

    if-nez p0, :cond_25

    move p0, v2

    goto :goto_29

    :cond_25
    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result p0

    :goto_29
    iget-boolean v3, v0, Lx5f;->h:Z

    if-nez v3, :cond_2e

    return-void

    :cond_2e
    iget-object v3, v0, Lx5f;->d:Lzpa;

    invoke-static {}, Lzpa;->F()Lx56;

    move-result-object v4

    new-instance v5, Lpj0;

    const/4 v6, -0x1

    const/4 v7, 0x2

    const/16 v8, 0x98b

    invoke-direct {v5, v8, v6, v7}, Ljf0;-><init>(III)V

    const/4 v6, 0x1

    invoke-virtual {v5, v2, v6, v1}, Ljf0;->q(IILjava/lang/Object;)V

    int-to-long v1, p0

    invoke-virtual {v5, v6, v6, v1, v2}, Ljf0;->p(IIJ)V

    invoke-virtual {v4, v3}, Lx56;->B(Lzpa;)Lqd0;

    move-result-object p0

    const/16 v1, 0x21

    invoke-virtual {p0, v1}, Ljf0;->n(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    if-eqz v2, :cond_5f

    invoke-interface {v2}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_5f

    new-instance v3, Lhf0;

    invoke-direct {v3, p0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    goto :goto_68

    :cond_5f
    invoke-static {p0, v1, v6}, Lvep;->t(Lqd0;II)Ljava/util/ArrayList;

    move-result-object v2

    new-instance v3, Lhf0;

    invoke-direct {v3, p0, v1, v2}, Lhf0;-><init>(Ljf0;ILjava/util/List;)V

    :goto_68
    invoke-virtual {v3, v5}, Ljava/util/AbstractList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v4}, Lx5f;->U0(Lx56;)V

    return-void
.end method

.method public final n0(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Landroid/view/View;
    .registers 5

    iget-boolean v0, p0, Lxwe;->j:Z

    const/4 v1, 0x0

    if-eqz v0, :cond_21

    const v0, 0x7f0d02e9

    invoke-virtual {p1, v0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    sget-object p2, Lr5n;->a:Ljava/util/WeakHashMap;

    const p2, 0x7f0a02f0

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    new-instance v0, Ltwe;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Ltwe;-><init>(Lxwe;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p1

    :cond_21
    const p0, 0x7f0d02e7

    invoke-virtual {p1, p0, p2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 3

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    sget v0, Lcom/opera/android/BrowserActivity;->E1:I

    check-cast p1, Lcom/opera/android/BrowserActivity;

    iget-object p1, p1, Ldx3;->l:Ltni;

    iput-object p1, p0, Lxwe;->i:Ltni;

    iget-object p0, p0, Lxwe;->m:Lit3;

    invoke-virtual {p1, p0}, Ltni;->a(Lsni;)V

    return-void
.end method

.method public final onDetach()V
    .registers 3

    invoke-super {p0}, Lk24;->onDetach()V

    iget-object v0, p0, Lxwe;->i:Ltni;

    if-eqz v0, :cond_f

    iget-object v1, p0, Lxwe;->m:Lit3;

    invoke-virtual {v0, v1}, Ltni;->c(Lsni;)V

    const/4 v0, 0x0

    iput-object v0, p0, Lxwe;->i:Ltni;

    :cond_f
    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    const p2, 0x7f0a0769

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Landroid/view/View;

    check-cast p2, Landroid/widget/TextView;

    new-instance v0, Ltwe;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Ltwe;-><init>(Lxwe;B)V

    invoke-virtual {p2, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    const v0, 0x7f0a0a82

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    new-instance v1, Ltwe;

    const/4 v2, 0x1

    invoke-direct {v1, p0, v2}, Ltwe;-><init>(Lxwe;B)V

    invoke-virtual {v0, v1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance v0, Lvwe;

    invoke-direct {v0, p0}, Lvwe;-><init>(Lxwe;)V

    iput-object v0, p0, Lxwe;->g:Lvwe;

    const v0, 0x7f0a0c93

    invoke-static {p1, v0}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    iput-object v0, p0, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    iget-object v1, p0, Lxwe;->g:Lvwe;

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    iget-object v0, p0, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    new-instance v1, Luwe;

    invoke-direct {v1, p0, p2}, Luwe;-><init>(Lxwe;Landroid/widget/TextView;)V

    invoke-virtual {v0, v1}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    new-instance p2, Lghf;

    iget-object v0, p0, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    sget-object v1, Lye1;->a:Landroid/view/animation/PathInterpolator;

    invoke-direct {p2, v0, v1}, Lghf;-><init>(Landroidx/viewpager/widget/ViewPager;Landroid/view/animation/PathInterpolator;)V

    iput-object p2, p0, Lxwe;->h:Lghf;

    const p2, 0x7f0a0c92

    invoke-static {p1, p2}, Lm5n;->f(Landroid/view/View;I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/PageDotIndicator;

    iget-object p0, p0, Lxwe;->f:Lcom/opera/android/custom_views/LayoutDirectionViewPager;

    iput-object p0, p1, Lcom/opera/android/custom_views/PageDotIndicator;->b:Landroidx/viewpager/widget/ViewPager;

    iget-object p1, p1, Lcom/opera/android/custom_views/PageDotIndicator;->a:Lwwf;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0, p1}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getAdapter()Landroidx/viewpager/widget/PagerAdapter;

    move-result-object p2

    new-instance v0, Ll46;

    const/4 v1, 0x3

    invoke-direct {v0, p1, v1}, Ll46;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, v0}, Landroidx/viewpager/widget/PagerAdapter;->registerDataSetObserver(Landroid/database/DataSetObserver;)V

    invoke-virtual {p0}, Landroidx/viewpager/widget/ViewPager;->getCurrentItem()I

    move-result p0

    iput p0, p1, Lwwf;->b:I

    int-to-float p0, p0

    iput p0, p1, Lwwf;->c:F

    iget-object p0, p1, Lwwf;->a:Lvwf;

    invoke-interface {p0}, Lvwf;->m()V

    return-void
.end method
