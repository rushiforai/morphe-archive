.class public abstract Ly9k;
.super Landroidx/fragment/app/Fragment;
.source "SourceFile"

# interfaces
.implements Leak;


# instance fields
.field public final a:Lpde;

.field public b:Landroid/widget/FrameLayout;

.field public c:Lr9i;

.field public d:Lghf;

.field public e:Lx9k;

.field public f:Lwzg;

.field public g:Ljava/util/List;


# direct methods
.method public constructor <init>()V
    .registers 3

    invoke-direct {p0}, Landroidx/fragment/app/Fragment;-><init>()V

    new-instance v0, Lpde;

    const/4 v1, 0x0

    invoke-direct {v0, v1}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v0, p0, Ly9k;->a:Lpde;

    return-void
.end method


# virtual methods
.method public final T()Likc;
    .registers 1

    iget-object p0, p0, Ly9k;->a:Lpde;

    return-object p0
.end method

.method public abstract f0()V
.end method

.method public abstract g0(Landroid/content/Context;)Ljava/util/List;
.end method

.method public abstract h0()I
.end method

.method public final i0()V
    .registers 16

    iget-object v0, p0, Ly9k;->c:Lr9i;

    const/4 v1, 0x0

    if-nez v0, :cond_7

    move v0, v1

    goto :goto_f

    :cond_7
    iget-object v0, v0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v0

    :goto_f
    iget-object v2, p0, Ly9k;->b:Landroid/widget/FrameLayout;

    invoke-virtual {v2}, Landroid/view/ViewGroup;->removeAllViews()V

    iget-object v2, p0, Ly9k;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Ly9k;->j0()Z

    move-result v3

    const-string v4, "Missing required view with ID: "

    const v5, 0x7f0a0c93

    const v6, 0x7f0a0c92

    const v7, 0x7f0a0a82

    const v8, 0x7f0a086c

    if-eqz v3, :cond_7e

    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v9, 0x7f0d03ce

    invoke-virtual {v3, v9, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v11, :cond_6d

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v12, :cond_6b

    invoke-static {v6, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    if-eqz v13, :cond_69

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/view/TouchIgnoringViewPager;

    if-eqz v14, :cond_6e

    move-object v10, v3

    check-cast v10, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v9, Lr9i;

    invoke-direct/range {v9 .. v14}, Lr9i;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Lcom/opera/android/view/TouchIgnoringViewPager;)V

    goto :goto_bc

    :cond_69
    move v5, v6

    goto :goto_6e

    :cond_6b
    move v5, v7

    goto :goto_6e

    :cond_6d
    move v5, v8

    :cond_6e
    :goto_6e
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_7e
    invoke-virtual {v2}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v3

    invoke-static {v3}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v3

    const v9, 0x7f0d03cd

    invoke-virtual {v3, v9, v2, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    invoke-static {v8, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v11, v2

    check-cast v11, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v11, :cond_190

    invoke-static {v7, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v12, v2

    check-cast v12, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz v12, :cond_18e

    invoke-static {v6, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v13, v2

    check-cast v13, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    if-eqz v13, :cond_18c

    invoke-static {v5, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v2

    move-object v14, v2

    check-cast v14, Lcom/opera/android/view/TouchIgnoringViewPager;

    if-eqz v14, :cond_191

    move-object v10, v3

    check-cast v10, Landroidx/constraintlayout/widget/ConstraintLayout;

    new-instance v9, Lr9i;

    invoke-direct/range {v9 .. v14}, Lr9i;-><init>(Landroidx/constraintlayout/widget/ConstraintLayout;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Lcom/opera/android/view/TouchIgnoringViewPager;)V

    :goto_bc
    iput-object v9, p0, Ly9k;->c:Lr9i;

    new-instance v2, Lx9k;

    iget-object v3, p0, Ly9k;->g:Ljava/util/List;

    invoke-virtual {p0}, Ly9k;->j0()Z

    move-result v4

    invoke-direct {v2, v3, v4}, Lx9k;-><init>(Ljava/util/List;Z)V

    iput-object v2, p0, Ly9k;->e:Lx9k;

    iget-object v3, p0, Ly9k;->c:Lr9i;

    iget-object v3, v3, Lr9i;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v3, v2}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->setAdapter(Landroidx/viewpager/widget/PagerAdapter;)V

    iget-object v2, p0, Ly9k;->c:Lr9i;

    iget-object v2, v2, Lr9i;->d:Ljava/lang/Object;

    invoke-virtual {p0}, Ly9k;->m0()Z

    move-result v2

    iget-object v3, p0, Ly9k;->c:Lr9i;

    if-eqz v2, :cond_f6

    iget-object v2, v3, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    iget-object v3, v3, Lr9i;->e:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {p0}, Ly9k;->h0()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    new-instance v5, Lro9;

    invoke-direct {v5, v2, v3, v4}, Lro9;-><init>(Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;Lcom/opera/android/view/TouchIgnoringViewPager;Ljava/lang/Integer;)V

    goto :goto_fe

    :cond_f6
    iget-object v2, v3, Lr9i;->d:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaProgressIndicator;

    const/4 v3, 0x4

    invoke-virtual {v2, v3}, Landroid/view/View;->setVisibility(I)V

    :goto_fe
    iget-object v2, p0, Ly9k;->f:Lwzg;

    if-eqz v2, :cond_10e

    iget-object v3, v2, Lwzg;->c:Ljava/lang/Object;

    check-cast v3, Landroid/view/ViewPropertyAnimator;

    const/4 v4, 0x0

    iput-object v4, v2, Lwzg;->c:Ljava/lang/Object;

    if-eqz v3, :cond_10e

    invoke-virtual {v3}, Landroid/view/ViewPropertyAnimator;->cancel()V

    :cond_10e
    new-instance v2, Lwzg;

    iget-object v3, p0, Ly9k;->c:Lr9i;

    iget-object v3, v3, Lr9i;->b:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-direct {v2, v3}, Lwzg;-><init>(Landroid/widget/TextView;)V

    iput-object v2, p0, Ly9k;->f:Lwzg;

    new-instance v2, Lv9k;

    invoke-direct {v2, p0, v1}, Lv9k;-><init>(Ly9k;B)V

    invoke-virtual {v3, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, p0, Ly9k;->c:Lr9i;

    iget-object v2, v2, Lr9i;->c:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    new-instance v3, Lv9k;

    const/4 v4, 0x1

    invoke-direct {v3, p0, v4}, Lv9k;-><init>(Ly9k;B)V

    invoke-virtual {v2, v3}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object v2, p0, Ly9k;->e:Lx9k;

    iget-object v2, v2, Lx9k;->a:Ljava/util/List;

    invoke-interface {v2, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lz65;

    invoke-virtual {p0, v2, v1}, Ly9k;->n0(Lz65;Z)V

    new-instance v1, Lghf;

    iget-object v2, p0, Ly9k;->c:Lr9i;

    iget-object v2, v2, Lr9i;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/view/TouchIgnoringViewPager;

    sget-object v3, Lye1;->a:Landroid/view/animation/PathInterpolator;

    invoke-direct {v1, v2, v3}, Lghf;-><init>(Landroidx/viewpager/widget/ViewPager;Landroid/view/animation/PathInterpolator;)V

    iput-object v1, p0, Ly9k;->d:Lghf;

    iget-object v1, p0, Ly9k;->c:Lr9i;

    iget-object v1, v1, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v1, v0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->r(I)I

    move-result v0

    iget-object v1, p0, Ly9k;->c:Lr9i;

    iget-object v1, v1, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v1, v0}, Landroidx/viewpager/widget/ViewPager;->setCurrentItem(I)V

    iget-object v1, p0, Ly9k;->g:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz65;

    iget-object v1, p0, Ly9k;->a:Lpde;

    iget-object v2, v0, Lz65;->f:Lkl0;

    invoke-virtual {v1, v2}, Lekc;->r(Ljava/lang/Object;)V

    iget-object v0, v0, Lz65;->g:Lpn;

    if-eqz v0, :cond_177

    invoke-virtual {v0}, Lpn;->run()V

    :cond_177
    iget-object v0, p0, Ly9k;->c:Lr9i;

    iget-object v0, v0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/view/TouchIgnoringViewPager;

    new-instance v1, Lr93;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v2}, Lr93;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lr2c;

    invoke-direct {p0, v0, v1}, Lr2c;-><init>(Lcom/opera/android/custom_views/LayoutDirectionViewPager;Le8n;)V

    invoke-virtual {v0, p0}, Landroidx/viewpager/widget/ViewPager;->addOnPageChangeListener(Le8n;)V

    return-void

    :cond_18c
    move v5, v6

    goto :goto_191

    :cond_18e
    move v5, v7

    goto :goto_191

    :cond_190
    move v5, v8

    :cond_191
    :goto_191
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, v5}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    invoke-virtual {v4, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public j0()Z
    .registers 2

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object p0

    iget p0, p0, Landroid/content/res/Configuration;->orientation:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_e

    return v0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final k0(Z)V
    .registers 7

    iget-object v0, p0, Ly9k;->f:Lwzg;

    iget-object v0, v0, Lwzg;->c:Ljava/lang/Object;

    check-cast v0, Landroid/view/ViewPropertyAnimator;

    if-nez v0, :cond_47

    iget-object v0, p0, Ly9k;->c:Lr9i;

    iget-object v0, v0, Lr9i;->e:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v0}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v0

    iget-object v1, p0, Ly9k;->e:Lx9k;

    iget-object v1, v1, Lx9k;->a:Ljava/util/List;

    invoke-interface {v1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz65;

    iget-boolean v1, v0, Lz65;->h:Z

    iget-object v2, v0, Lz65;->c:Ljava/lang/Runnable;

    const/4 v3, 0x1

    if-eqz v1, :cond_48

    new-instance v1, Ljava/lang/StringBuilder;

    const-string v4, "Page step="

    invoke-direct {v1, v4}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    iget-object v4, v0, Lz65;->f:Lkl0;

    iget-byte v4, v4, Lkl0;->a:B

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    const-string v4, " done but user still stuck in it."

    invoke-virtual {v1, v4}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object v1

    const-string v4, "User stuck on onboarding"

    invoke-static {v4, v1}, Lks3;->B(Ljava/lang/String;Ljava/lang/String;)V

    if-nez p1, :cond_47

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0, v0, v3}, Ly9k;->l0(Lz65;Z)V

    :cond_47
    return-void

    :cond_48
    if-eqz p1, :cond_5e

    iget-boolean p1, v0, Lz65;->i:Z

    if-eqz p1, :cond_53

    const/4 p1, 0x0

    invoke-virtual {p0, v0, p1}, Ly9k;->l0(Lz65;Z)V

    return-void

    :cond_53
    iget-object p1, v0, Lz65;->b:Lcom/opera/api/Callback;

    new-instance v1, Lw9k;

    invoke-direct {v1, p0, v0}, Lw9k;-><init>(Ly9k;Lz65;)V

    invoke-interface {p1, v1}, Lcom/opera/api/Callback;->run(Ljava/lang/Object;)V

    return-void

    :cond_5e
    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    invoke-virtual {p0, v0, v3}, Ly9k;->l0(Lz65;Z)V

    return-void
.end method

.method public final l0(Lz65;Z)V
    .registers 7

    const/4 v0, 0x1

    if-nez p2, :cond_5

    iput-boolean v0, p1, Lz65;->i:Z

    :cond_5
    iget-object v1, p0, Ly9k;->c:Lr9i;

    if-eqz v1, :cond_5b

    iget-object v1, v1, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v1

    iget-object v2, p0, Ly9k;->e:Lx9k;

    iget-object v2, v2, Lx9k;->a:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->size()I

    move-result v2

    sub-int/2addr v2, v0

    iget-object v3, p0, Ly9k;->c:Lr9i;

    if-lt v1, v2, :cond_4b

    iget-object v1, v3, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v1, p2}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    iget-object v1, p0, Ly9k;->c:Lr9i;

    iget-object v1, v1, Lr9i;->c:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    if-eqz p2, :cond_2f

    const/4 v2, 0x0

    goto :goto_31

    :cond_2f
    const/16 v2, 0x8

    :goto_31
    invoke-virtual {v1, v2}, Landroid/view/View;->setVisibility(I)V

    iget-object v1, p0, Ly9k;->c:Lr9i;

    iget-object v1, v1, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    xor-int/2addr p2, v0

    invoke-virtual {v1, p2}, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;->R(Z)V

    iget-object v1, p0, Ly9k;->c:Lr9i;

    iget-object v1, v1, Lr9i;->b:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    invoke-virtual {v1, p2}, Landroid/view/View;->setEnabled(Z)V

    invoke-virtual {p0}, Ly9k;->f0()V

    goto :goto_6a

    :cond_4b
    iget-object p2, v3, Lr9i;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {p2}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result p2

    iget-object v1, p0, Ly9k;->d:Lghf;

    invoke-virtual {v1}, Lghf;->G()Z

    move-result v1

    if-nez v1, :cond_5c

    :cond_5b
    return-void

    :cond_5c
    iget-object v1, p0, Ly9k;->e:Lx9k;

    iget-object v1, v1, Lx9k;->a:Ljava/util/List;

    add-int/2addr p2, v0

    invoke-interface {v1, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lz65;

    invoke-virtual {p0, p2, v0}, Ly9k;->n0(Lz65;Z)V

    :goto_6a
    iput-boolean v0, p1, Lz65;->h:Z

    return-void
.end method

.method public abstract m0()Z
.end method

.method public final n0(Lz65;Z)V
    .registers 8

    iget-object v0, p0, Ly9k;->f:Lwzg;

    if-eqz v0, :cond_5f

    iget-object v1, v0, Lwzg;->b:Ljava/lang/Object;

    check-cast v1, Landroid/widget/TextView;

    iget-object v2, p0, Ly9k;->c:Lr9i;

    if-eqz v2, :cond_5f

    if-eqz p2, :cond_3d

    iget-object p2, p1, Lz65;->a:Ljava/lang/String;

    new-instance v2, Ljri;

    const/16 v3, 0xf

    invoke-direct {v2, v0, p2, v3}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p2, v0, Lwzg;->c:Ljava/lang/Object;

    check-cast p2, Landroid/view/ViewPropertyAnimator;

    if-nez p2, :cond_4e

    invoke-virtual {v1}, Landroid/view/View;->animate()Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    iput-object p2, v0, Lwzg;->c:Ljava/lang/Object;

    const-wide/16 v3, 0x15e

    invoke-virtual {p2, v3, v4}, Landroid/view/ViewPropertyAnimator;->setDuration(J)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    new-instance v1, Ljri;

    const/16 v3, 0x10

    invoke-direct {v1, v0, v2, v3}, Ljri;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {p2, v1}, Landroid/view/ViewPropertyAnimator;->withEndAction(Ljava/lang/Runnable;)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/ViewPropertyAnimator;->alpha(F)Landroid/view/ViewPropertyAnimator;

    move-result-object p2

    invoke-virtual {p2}, Landroid/view/ViewPropertyAnimator;->start()V

    goto :goto_4e

    :cond_3d
    iget-object p2, p1, Lz65;->a:Ljava/lang/String;

    iget-object v2, v0, Lwzg;->c:Ljava/lang/Object;

    check-cast v2, Landroid/view/ViewPropertyAnimator;

    const/4 v3, 0x0

    iput-object v3, v0, Lwzg;->c:Ljava/lang/Object;

    if-eqz v2, :cond_4b

    invoke-virtual {v2}, Landroid/view/ViewPropertyAnimator;->cancel()V

    :cond_4b
    invoke-virtual {v1, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4e
    :goto_4e
    iget-object p0, p0, Ly9k;->c:Lr9i;

    iget-object p0, p0, Lr9i;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/ui/catalog/widget/OperaMaterialButton;

    iget-boolean p1, p1, Lz65;->e:Z

    if-eqz p1, :cond_5a

    const/4 p1, 0x0

    goto :goto_5c

    :cond_5a
    const/16 p1, 0x8

    :goto_5c
    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    :cond_5f
    return-void
.end method

.method public onConfigurationChanged(Landroid/content/res/Configuration;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onConfigurationChanged(Landroid/content/res/Configuration;)V

    invoke-virtual {p0}, Ly9k;->i0()V

    return-void
.end method

.method public final onCreate(Landroid/os/Bundle;)V
    .registers 2

    invoke-super {p0, p1}, Landroidx/fragment/app/Fragment;->onCreate(Landroid/os/Bundle;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object p1

    invoke-virtual {p0, p1}, Ly9k;->g0(Landroid/content/Context;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Ly9k;->g:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_16

    invoke-virtual {p0}, Ly9k;->f0()V

    :cond_16
    return-void
.end method

.method public onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;
    .registers 4

    new-instance p2, Landroid/widget/FrameLayout;

    invoke-virtual {p1}, Landroid/view/LayoutInflater;->getContext()Landroid/content/Context;

    move-result-object p1

    invoke-direct {p2, p1}, Landroid/widget/FrameLayout;-><init>(Landroid/content/Context;)V

    iput-object p2, p0, Ly9k;->b:Landroid/widget/FrameLayout;

    invoke-virtual {p0}, Ly9k;->i0()V

    iget-object p0, p0, Ly9k;->b:Landroid/widget/FrameLayout;

    return-object p0
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onDestroyView()V

    const/4 v0, 0x0

    iput-object v0, p0, Ly9k;->c:Lr9i;

    return-void
.end method

.method public final onStop()V
    .registers 3

    iget-object v0, p0, Ly9k;->e:Lx9k;

    iget-object v0, v0, Lx9k;->a:Ljava/util/List;

    iget-object v1, p0, Ly9k;->c:Lr9i;

    iget-object v1, v1, Lr9i;->e:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/view/TouchIgnoringViewPager;

    invoke-virtual {v1}, Lcom/opera/android/custom_views/LayoutDirectionViewPager;->q()I

    move-result v1

    invoke-interface {v0, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lz65;

    iget-object v0, v0, Lz65;->d:Lyqd;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Lyqd;->run()V

    :cond_1b
    invoke-super {p0}, Landroidx/fragment/app/Fragment;->onStop()V

    return-void
.end method
