.class public final Lam3;
.super Lwz7;
.source "SourceFile"


# instance fields
.field public g:Lcm3;

.field public h:Z

.field public i:Z

.field public j:Z

.field public final k:Lom3;

.field public final l:Lhxk;

.field public final m:Lcom/opera/android/bookmarks/h;

.field public final n:Lx5f;


# direct methods
.method public constructor <init>(ZZZLom3;Lhxk;Lcom/opera/android/bookmarks/h;Lx5f;)V
    .registers 13

    sget-object v0, Lcm3;->d:Lcm3;

    const v1, 0x7f130010

    const/4 v2, 0x0

    const/4 v3, 0x2

    const v4, 0x7f140385

    invoke-direct {p0, v3, v4, v1, v2}, Lwz7;-><init>(IIII)V

    iput-object v0, p0, Lam3;->g:Lcm3;

    iput-boolean p1, p0, Lam3;->h:Z

    iput-boolean p2, p0, Lam3;->i:Z

    iput-boolean p3, p0, Lam3;->j:Z

    iput-object p4, p0, Lam3;->k:Lom3;

    iput-object p5, p0, Lam3;->l:Lhxk;

    iput-object p6, p0, Lam3;->m:Lcom/opera/android/bookmarks/h;

    iput-object p7, p0, Lam3;->n:Lx5f;

    return-void
.end method


# virtual methods
.method public final G(Lxz7;)V
    .registers 7

    instance-of v0, p1, Lyl3;

    if-eqz v0, :cond_7

    check-cast p1, Lyl3;

    goto :goto_8

    :cond_7
    const/4 p1, 0x0

    :goto_8
    if-eqz p1, :cond_76

    iget-object v0, p1, Lyl3;->b:Lwl3;

    iget-object v1, v0, Lwl3;->a:Lpt1;

    iget-object v2, p0, Lam3;->g:Lcm3;

    iget v2, v2, Lcm3;->b:I

    invoke-virtual {p1, v2}, Lyl3;->V(I)V

    iget-object v2, p0, Lam3;->g:Lcm3;

    iget v2, v2, Lcm3;->a:I

    invoke-virtual {p1, v2}, Lyl3;->U(I)V

    iget-object p1, p0, Lam3;->g:Lcm3;

    iget p1, p1, Lcm3;->c:I

    iget-object v2, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/AnimationEmptyListView;

    const/4 v3, -0x1

    if-ge p1, v3, :cond_28

    move p1, v3

    :cond_28
    iput p1, v2, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    invoke-virtual {v2}, Lcom/opera/android/custom_views/AnimationEmptyListView;->a()V

    iget-boolean p1, p0, Lam3;->h:Z

    iget-object v2, v1, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    const/16 v3, 0x8

    const/4 v4, 0x0

    if-eqz p1, :cond_3a

    move p1, v4

    goto :goto_3b

    :cond_3a
    move p1, v3

    :goto_3b
    invoke-virtual {v2, p1}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p1, p0, Lam3;->h:Z

    xor-int/lit8 p1, p1, 0x1

    iput-boolean p1, v0, Lwl3;->b:Z

    iget-object p1, v1, Lpt1;->e:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v2

    invoke-virtual {v2}, Landroid/content/res/Resources;->getConfiguration()Landroid/content/res/Configuration;

    move-result-object v2

    invoke-virtual {v0, v2}, Lwl3;->a(Landroid/content/res/Configuration;)Z

    move-result v0

    if-eqz v0, :cond_58

    move v0, v4

    goto :goto_59

    :cond_58
    move v0, v3

    :goto_59
    invoke-virtual {p1, v0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->setVisibility(I)V

    iget-boolean p1, p0, Lam3;->i:Z

    iget-object v0, v1, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/OrientationFitConstraintLayout;

    if-eqz p1, :cond_66

    move p1, v4

    goto :goto_67

    :cond_66
    move p1, v3

    :goto_67
    invoke-virtual {v0, p1}, Landroid/view/View;->setVisibility(I)V

    iget-boolean p0, p0, Lam3;->j:Z

    iget-object p1, v1, Lpt1;->b:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/button/MaterialButton;

    if-eqz p0, :cond_73

    move v3, v4

    :cond_73
    invoke-virtual {p1, v3}, Landroid/view/View;->setVisibility(I)V

    :cond_76
    return-void
.end method

.method public final H(Landroid/view/ViewGroup;I)Lxz7;
    .registers 7

    iget v0, p0, Lwz7;->a:I

    const/4 v1, 0x2

    if-ne v0, v1, :cond_8e

    sget p2, Lwl3;->c:I

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    iget p2, p0, Lwz7;->d:I

    iget v0, p0, Lwz7;->c:I

    new-instance v1, Lwl3;

    invoke-direct {v1, p1}, Lwl3;-><init>(Landroid/content/Context;)V

    iget-object p1, v1, Lwl3;->a:Lpt1;

    iget-object v2, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {v2, p2}, Lcom/opera/android/custom_views/AnimationEmptyListView;->c(I)V

    iget-object p2, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/AnimationEmptyListView;

    invoke-virtual {p2, v0}, Lcom/opera/android/custom_views/AnimationEmptyListView;->b(I)V

    iget-object p2, p1, Lpt1;->e:Ljava/lang/Object;

    check-cast p2, Lcom/opera/android/custom_views/AnimationEmptyListView;

    const/4 v0, -0x1

    iget v2, p0, Lwz7;->b:I

    if-ge v2, v0, :cond_2e

    move v2, v0

    :cond_2e
    iput v2, p2, Lcom/opera/android/custom_views/AnimationEmptyListView;->c:I

    new-instance p2, Landroid/view/ViewGroup$LayoutParams;

    invoke-direct {p2, v0, v0}, Landroid/view/ViewGroup$LayoutParams;-><init>(II)V

    invoke-virtual {v1, p2}, Landroid/view/View;->setLayoutParams(Landroid/view/ViewGroup$LayoutParams;)V

    new-instance p2, Lgf;

    const/16 v0, 0x18

    invoke-direct {p2, p0, v0}, Lgf;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    iget-object v0, v0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;->a:Lov0;

    iget-object v0, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lnf;

    const/16 v0, 0x11

    invoke-direct {p2, p0, v1, v0}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, p1, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    iget-object v0, v0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;->a:Lov0;

    iget-object v0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {v0, p2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzl3;

    const/4 v0, 0x0

    invoke-direct {p2, p0, v0}, Lzl3;-><init>(Lam3;B)V

    iget-object v0, p1, Lpt1;->g:Landroid/view/View;

    check-cast v0, Lcom/google/android/material/button/MaterialButton;

    new-instance v2, Lgf;

    const/16 v3, 0x16

    invoke-direct {v2, p2, v3}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v0, v2}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p2, Lzl3;

    const/4 v0, 0x1

    invoke-direct {p2, p0, v0}, Lzl3;-><init>(Lam3;B)V

    iget-object p0, p1, Lpt1;->b:Landroid/view/View;

    check-cast p0, Lcom/google/android/material/button/MaterialButton;

    new-instance p1, Lgf;

    const/16 v0, 0x17

    invoke-direct {p1, p2, v0}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p0, Lyl3;

    invoke-direct {p0, v1}, Lyl3;-><init>(Lwl3;)V

    return-object p0

    :cond_8e
    invoke-super {p0, p1, p2}, Lwz7;->H(Landroid/view/ViewGroup;I)Lxz7;

    move-result-object p0

    return-object p0
.end method

.method public final bridge synthetic onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 3

    check-cast p1, Lxz7;

    invoke-virtual {p0, p1}, Lam3;->G(Lxz7;)V

    return-void
.end method

.method public final bridge synthetic onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 3

    invoke-virtual {p0, p1, p2}, Lam3;->H(Landroid/view/ViewGroup;I)Lxz7;

    move-result-object p0

    return-object p0
.end method
