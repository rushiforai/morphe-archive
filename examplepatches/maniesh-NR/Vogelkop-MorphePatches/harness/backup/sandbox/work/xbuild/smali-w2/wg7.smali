.class public final Lwg7;
.super Lyyi;
.source "SourceFile"

# interfaces
.implements Lssl;
.implements Ljvk;
.implements Lon9;


# instance fields
.field public A:Lyz7;

.field public B:Ligi;

.field public final C:Lbg;

.field public final D:Lsf7;

.field public final E:Lorm;

.field public final F:Lah7;

.field public final G:Lzg7;

.field public H:Z

.field public I:Lpt1;

.field public J:Ljv0;

.field public K:Ljg7;

.field public L:Lcom/opera/android/undo/UndoBar;

.field public M:Lvvj;

.field public final N:Lmvk;

.field public final O:Lmvk;

.field public P:Z

.field public Q:I

.field public final R:Ld8j;

.field public final S:Lrn9;

.field public x:Lb59;

.field public y:Lrf7;

.field public z:Lze7;


# direct methods
.method public constructor <init>(Lsf7;Lorm;Ld8j;)V
    .registers 13

    const v0, 0x7f100016

    const v1, 0x7f100017

    const v2, 0x7f0d0114

    const v3, 0x7f140d5b

    invoke-direct {p0, v2, v3, v0, v1}, Lyyi;-><init>(IIII)V

    new-instance v0, Lbg;

    const/4 v1, 0x1

    invoke-direct {v0, p0, v1}, Lbg;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lwg7;->C:Lbg;

    const v0, 0x7f140564

    invoke-static {v0}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Lwg7;->N:Lmvk;

    new-instance v2, Lmvk;

    new-instance v0, Li3d;

    sget-object v3, Lk3d;->a:Landroid/graphics/PointF;

    const v3, 0x7f0402c2

    const-string v4, "states/on success"

    const/4 v8, 0x0

    invoke-direct {v0, v3, v1, v4, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v5, Li3d;

    const/4 v6, 0x2

    invoke-direct {v5, v3, v6, v4, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v3, Li3d;

    const v4, 0x7f0402eb

    const-string v7, "states/success"

    invoke-direct {v3, v4, v1, v7, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    new-instance v1, Li3d;

    invoke-direct {v1, v4, v6, v7, v8}, Li3d;-><init>(IILjava/lang/String;Z)V

    filled-new-array {v0, v5, v3, v1}, [Li3d;

    move-result-object v7

    const v3, 0x7f040926

    const v4, 0x7f140826

    const v5, 0x7f040927

    const v6, 0x7f13003e

    invoke-direct/range {v2 .. v7}, Lmvk;-><init>(IIII[Li3d;)V

    iput-object v2, p0, Lwg7;->O:Lmvk;

    new-instance v0, Lrn9;

    invoke-direct {v0, p0, p0, v8}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lwg7;->S:Lrn9;

    iput-object p1, p0, Lwg7;->D:Lsf7;

    iput-object p2, p0, Lwg7;->E:Lorm;

    new-instance v0, Lah7;

    iget-object p1, p1, Lsf7;->a:Lrf7;

    new-instance v1, Lvx;

    const/16 v2, 0x12

    invoke-direct {v1, p0, v2}, Lvx;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v1}, Lah7;-><init>(Lrf7;Lvx;)V

    iput-object v0, p0, Lwg7;->F:Lah7;

    new-instance p1, Lzg7;

    invoke-direct {p1, v0, p2}, Lzg7;-><init>(Lah7;Lorm;)V

    iput-object p1, p0, Lwg7;->G:Lzg7;

    iput-object p3, p0, Lwg7;->R:Ld8j;

    return-void
.end method


# virtual methods
.method public final G0()Z
    .registers 2

    iget-object v0, p0, Lwg7;->G:Lzg7;

    invoke-virtual {v0}, Loy;->e()Z

    move-result v0

    if-nez v0, :cond_10

    iget-object p0, p0, Lyyi;->r:Ltzi;

    iget p0, p0, Ltzi;->f:I

    if-lez p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final H()Lqe6;
    .registers 1

    iget-object p0, p0, Lltl;->j:Lqe6;

    return-object p0
.end method

.method public final H0(Landroid/view/MenuItem;)Z
    .registers 3

    iget-object v0, p0, Lwg7;->K:Ljg7;

    invoke-virtual {v0, p1}, Ljg7;->d(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_a

    const/4 p0, 0x1

    return p0

    :cond_a
    invoke-super {p0, p1}, Lyyi;->H0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final J0(Litd;I)V
    .registers 10

    const v0, 0x7f0a032d

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-lez p2, :cond_d

    move v3, v1

    goto :goto_e

    :cond_d
    move v3, v2

    :goto_e
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a0330

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v3, p0, Lwg7;->K:Ljg7;

    invoke-virtual {v3}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v2

    :cond_23
    if-ge v5, v4, :cond_35

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lre7;

    invoke-virtual {v6}, Lre7;->l()Z

    move-result v6

    if-nez v6, :cond_23

    move v3, v2

    goto :goto_3a

    :cond_35
    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v3

    xor-int/2addr v3, v1

    :goto_3a
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    if-lez p2, :cond_41

    move v0, v1

    goto :goto_42

    :cond_41
    move v0, v2

    :goto_42
    iget-object v3, p0, Lwg7;->K:Ljg7;

    invoke-virtual {v3}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object v3

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v2

    :cond_4d
    if-ge v5, v4, :cond_62

    invoke-virtual {v3, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lre7;

    invoke-static {v6}, Lrf7;->g(Lre7;)Lo29;

    move-result-object v6

    invoke-virtual {v6}, Lo29;->d()Z

    move-result v6

    if-nez v6, :cond_4d

    move v0, v2

    :cond_62
    const v3, 0x7f0a032e

    invoke-virtual {p1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v3, 0x7f0a032f

    invoke-virtual {p1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v3

    invoke-interface {v3, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    iget-object v0, p0, Lwg7;->J:Ljv0;

    const v3, 0x7f0a032c

    if-eqz v0, :cond_b4

    invoke-interface {v0}, Ljv0;->v()Z

    move-result v0

    if-eqz v0, :cond_b4

    if-lez p2, :cond_88

    const/4 v0, 0x3

    if-le p2, v0, :cond_89

    :cond_88
    move v1, v2

    :cond_89
    iget-object p0, p0, Lwg7;->K:Ljg7;

    invoke-virtual {p0}, Ljg7;->c()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p2

    move v0, v2

    :cond_94
    if-ge v0, p2, :cond_ab

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v0, v0, 0x1

    check-cast v4, Lre7;

    invoke-virtual {v4}, Lre7;->k()Z

    move-result v5

    if-eqz v5, :cond_ac

    invoke-static {v4}, Ljg7;->a(Lre7;)Lu92;

    move-result-object v4

    if-nez v4, :cond_94

    goto :goto_ac

    :cond_ab
    move v2, v1

    :cond_ac
    :goto_ac
    invoke-virtual {p1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :cond_b4
    invoke-virtual {p1, v3}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    invoke-interface {p0, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final K0()V
    .registers 5

    iget-boolean v0, p0, Lwg7;->P:Z

    iget-object v1, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v2, 0x0

    if-eqz v0, :cond_2d

    const/4 v0, 0x1

    invoke-virtual {v1, v0}, Lcom/opera/android/StatusBarDrawingFrameLayout;->d(Z)V

    iget-object v0, p0, Lwg7;->I:Lpt1;

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget-object v3, p0, Lwg7;->I:Lpt1;

    iget-object v3, v3, Lpt1;->c:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingTop()I

    move-result v3

    iget-object p0, p0, Lwg7;->I:Lpt1;

    iget-object p0, p0, Lpt1;->c:Landroid/view/View;

    check-cast p0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Landroid/view/View;->getPaddingRight()I

    move-result p0

    invoke-virtual {v0, v1, v3, p0, v2}, Landroid/view/View;->setPadding(IIII)V

    return-void

    :cond_2d
    invoke-virtual {v1, v2}, Lcom/opera/android/StatusBarDrawingFrameLayout;->d(Z)V

    iget-object v0, p0, Lwg7;->I:Lpt1;

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0}, Landroid/view/View;->getPaddingLeft()I

    move-result v1

    iget-object v2, p0, Lwg7;->I:Lpt1;

    iget-object v2, v2, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v2}, Landroid/view/View;->getPaddingTop()I

    move-result v2

    iget-object v3, p0, Lwg7;->I:Lpt1;

    iget-object v3, v3, Lpt1;->c:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v3}, Landroid/view/View;->getPaddingRight()I

    move-result v3

    iget p0, p0, Lwg7;->Q:I

    invoke-virtual {v0, v1, v2, v3, p0}, Landroid/view/View;->setPadding(IIII)V

    return-void
.end method

.method public final L0()Lvvj;
    .registers 7

    iget-object v0, p0, Lwg7;->M:Lvvj;

    if-nez v0, :cond_29

    iget-object v0, p0, Lwg7;->x:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const/4 v1, 0x2

    const-string v2, "downloads_sort_order"

    invoke-interface {v0, v2, v1}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    invoke-static {}, Lvvj;->values()[Lvvj;

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_19
    if-ge v3, v2, :cond_24

    aget-object v4, v1, v3

    iget-byte v5, v4, Lvvj;->a:B

    if-eq v5, v0, :cond_26

    add-int/lit8 v3, v3, 0x1

    goto :goto_19

    :cond_24
    sget-object v4, Lvvj;->e:Lvvj;

    :cond_26
    iput-object v4, p0, Lwg7;->M:Lvvj;

    return-object v4

    :cond_29
    return-object v0
.end method

.method public final synthetic M0()Lqm9;
    .registers 1

    iget-object p0, p0, Lltl;->n:Lqm9;

    return-object p0
.end method

.method public final a()Loba;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 7

    iget-object v0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {v0}, Lcs5;->W(Landroid/view/View;)Z

    move-result v0

    iget-object v1, p0, Lwg7;->z:Lze7;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemId()J

    move-result-wide v2

    invoke-virtual {v1, v2, v3}, Lze7;->I(J)Lre7;

    move-result-object p1

    const/4 v1, 0x0

    if-eqz p1, :cond_1b

    invoke-virtual {p1}, Lre7;->l()Z

    move-result p1

    if-eqz p1, :cond_1b

    iget-object v1, p0, Lwg7;->O:Lmvk;

    :cond_1b
    iget-object p0, p0, Lwg7;->N:Lmvk;

    if-eqz v0, :cond_21

    move-object p1, v1

    goto :goto_22

    :cond_21
    move-object p1, p0

    :goto_22
    const/4 v2, 0x0

    aput-object p1, p2, v2

    if-eqz v0, :cond_28

    move-object v1, p0

    :cond_28
    const/4 p0, 0x1

    aput-object v1, p2, p0

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 6

    iget-object v0, p0, Lwg7;->z:Lze7;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemId()J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Lze7;->I(J)Lre7;

    move-result-object p1

    if-nez p1, :cond_d

    return-void

    :cond_d
    iget-object v0, p0, Lwg7;->N:Lmvk;

    iget-object v1, p0, Lwg7;->E:Lorm;

    if-ne p2, v0, :cond_29

    invoke-virtual {p1}, Lre7;->c()Lnc0;

    move-result-object p2

    check-cast v1, Lx5f;

    sget-object v0, Loc0;->e:Loc0;

    invoke-virtual {v1, v0, p2}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p0, p0, Lwg7;->K:Ljg7;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x1

    invoke-virtual {p0, p1, p2}, Ljg7;->g(Ljava/util/List;Z)V

    return-void

    :cond_29
    invoke-virtual {p1}, Lre7;->c()Lnc0;

    move-result-object p2

    check-cast v1, Lx5f;

    sget-object v0, Loc0;->c:Loc0;

    invoke-virtual {v1, v0, p2}, Lx5f;->O(Loc0;Lnc0;)V

    iget-object p0, p0, Lwg7;->K:Ljg7;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    const/4 p2, 0x0

    invoke-virtual {p0, p1, p2}, Ljg7;->g(Ljava/util/List;Z)V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-object v0, p0, Lwg7;->G:Lzg7;

    invoke-virtual {v0}, Loy;->c()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 3

    iget-object v0, p0, Lwg7;->A:Lyz7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Lxz7;

    if-nez v0, :cond_18

    iget-object v0, p0, Lltl;->m:Lse;

    if-nez v0, :cond_18

    iget-object p0, p0, Lwg7;->z:Lze7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p0, p1, Lqg7;

    if-eqz p0, :cond_18

    const/4 p0, 0x1

    return p0

    :cond_18
    const/4 p0, 0x0

    return p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 7

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v2, v1, [Lbg1;

    const-string v3, "downloads"

    invoke-static {p1, v0, v3, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lwg7;->x:Lb59;

    iget-object p0, p0, Lwg7;->D:Lsf7;

    iget-object p1, p0, Lsf7;->b:Ligi;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {}, Lvf7;->values()[Lvf7;

    move-result-object v0

    array-length v2, v0

    move v3, v1

    :goto_1d
    if-ge v3, v2, :cond_27

    aget-object v4, v0, v3

    invoke-virtual {p1, v4}, Ligi;->q(Lvf7;)V

    add-int/lit8 v3, v3, 0x1

    goto :goto_1d

    :cond_27
    iget-object p0, p0, Lsf7;->e:Ljnm;

    iget-object p1, p0, Ljnm;->a:Lb59;

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Landroid/content/SharedPreferences;

    invoke-interface {p1}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    const-string v0, "unseen_download_ids"

    invoke-interface {p1, v0}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p1

    invoke-interface {p1}, Landroid/content/SharedPreferences$Editor;->apply()V

    invoke-virtual {p0, v1}, Ljnm;->c(Z)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 10

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lwg7;->I:Lpt1;

    iget-object v0, v0, Lpt1;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/downloads/DownloadsPanel;

    iget-object v0, v0, Lcom/opera/android/downloads/DownloadsPanel;->a:Landroidx/recyclerview/widget/RecyclerView;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, p0, Lwg7;->z:Lze7;

    iget-object v2, v0, Lze7;->g:Lwe7;

    iget-object v0, v0, Lze7;->h:Lxbf;

    invoke-virtual {v2, v0}, Lhkg;->b(Lxbf;)V

    iget-object v0, p0, Lwg7;->y:Lrf7;

    iget-object v2, p0, Lwg7;->F:Lah7;

    invoke-virtual {v0, v2}, Lrf7;->u(Lqf7;)V

    iget-object v0, p0, Lwg7;->G:Lzg7;

    invoke-virtual {v0, v1}, Loy;->i(Lj1c;)V

    iget-object v0, p0, Lwg7;->z:Lze7;

    iput-object v1, v0, Lze7;->l:Ldg7;

    iget-object v0, p0, Lwg7;->B:Ligi;

    iget-object v0, v0, Ligi;->d:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/chip/ChipGroup;

    iput-object v1, v0, Lcom/google/android/material/chip/ChipGroup;->g:Lvx4;

    iput-object v1, p0, Lwg7;->B:Ligi;

    iget-object v0, p0, Lwg7;->L:Lcom/opera/android/undo/UndoBar;

    const/4 v2, 0x1

    invoke-virtual {v0, v2}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iput-object v1, p0, Lwg7;->K:Ljg7;

    iput-object v1, p0, Lwg7;->L:Lcom/opera/android/undo/UndoBar;

    iget-object v0, p0, Lwg7;->D:Lsf7;

    iget-object v0, v0, Lsf7;->c:Lfg7;

    iget-object v0, v0, Lfg7;->b:Ljava/util/ArrayList;

    iget-object v2, p0, Lwg7;->C:Lbg;

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-wide/16 v4, 0x0

    const-wide/16 v6, 0x0

    iget-object v3, p0, Lwg7;->C:Lbg;

    const/4 v8, 0x0

    invoke-virtual/range {v3 .. v8}, Lbg;->c(JJZ)V

    iput-object v1, p0, Lwg7;->A:Lyz7;

    iput-object v1, p0, Lwg7;->z:Lze7;

    iput-object v1, p0, Lwg7;->y:Lrf7;

    iput-object v1, p0, Lwg7;->I:Lpt1;

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0338

    const/4 v2, 0x1

    if-ne v0, v1, :cond_15

    const/4 p1, 0x0

    new-array p1, p1, [I

    iget-object p0, p0, Lwg7;->R:Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0, p1}, Lg8j;->e([I)V

    return v2

    :cond_15
    iget-object v0, p0, Lwg7;->K:Ljg7;

    invoke-virtual {v0, p1}, Ljg7;->d(Landroid/view/MenuItem;)Z

    move-result v0

    if-eqz v0, :cond_1e

    return v2

    :cond_1e
    invoke-super {p0, p1}, Lyyi;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 18

    move-object/from16 v0, p2

    const v2, 0x7f0a02a9

    invoke-virtual {v0, v2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v2

    const v3, 0x7f0a010b

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v7, v4

    check-cast v7, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    const-string v12, "Missing required view with ID: "

    if-eqz v7, :cond_22b

    const v3, 0x7f0a0269

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_22b

    move-object v6, v2

    check-cast v6, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const v3, 0x7f0a0336

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v8, v4

    check-cast v8, Lcom/opera/android/downloads/DownloadsPanel;

    if-eqz v8, :cond_22b

    const v3, 0x7f0a0337

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v9, v4

    check-cast v9, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v9, :cond_22b

    const v3, 0x7f0a0491

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    move-object v10, v4

    check-cast v10, Landroid/widget/FrameLayout;

    if-eqz v10, :cond_22b

    const v3, 0x7f0a06c2

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/FrameLayout;

    if-eqz v4, :cond_22b

    const v3, 0x7f0a0944

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v11

    if-eqz v11, :cond_22b

    const v3, 0x7f0a0bba

    invoke-static {v3, v2}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroidx/appcompat/widget/Toolbar;

    if-eqz v4, :cond_22b

    new-instance v5, Lpt1;

    invoke-direct/range {v5 .. v11}, Lpt1;-><init>(Landroidx/coordinatorlayout/widget/CoordinatorLayout;Lcom/opera/android/StatusBarDrawerAppBarLayout;Lcom/opera/android/downloads/DownloadsPanel;Lcom/opera/android/custom_views/FadingRecyclerView;Landroid/widget/FrameLayout;Landroid/view/View;)V

    iput-object v5, p0, Lwg7;->I:Lpt1;

    new-instance v7, Lze7;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->x()Ltjg;

    move-result-object v2

    iget-object v2, v2, Ltjg;->o:Lxbf;

    iget-object v13, p0, Lyyi;->r:Ltzi;

    invoke-direct {v7, v13, v2}, Lze7;-><init>(Ltzi;Lxbf;)V

    iput-object v7, p0, Lwg7;->z:Lze7;

    new-instance v6, Lyz7;

    const v10, 0x7f13001b

    const/4 v8, 0x2

    const v9, 0x7f140613

    const/4 v11, 0x0

    invoke-direct/range {v6 .. v11}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    iput-object v6, p0, Lwg7;->A:Lyz7;

    iget-object v14, p0, Lwg7;->D:Lsf7;

    iget-object v2, v14, Lsf7;->a:Lrf7;

    iput-object v2, p0, Lwg7;->y:Lrf7;

    iget-object v2, p0, Lwg7;->I:Lpt1;

    iget-object v2, v2, Lpt1;->c:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, v0, v2}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    new-instance v3, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v4

    iget-object v5, p0, Lltl;->n:Lqm9;

    new-instance v6, Lxm5;

    invoke-direct {v6, p0}, Lxm5;-><init>(Ljava/lang/Object;)V

    iget-object v7, p0, Lwg7;->z:Lze7;

    const/4 v8, 0x0

    invoke-direct/range {v3 .. v8}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v3, p0, Lwg7;->L:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Lq9n;->p(Landroid/content/Context;)Ldx3;

    move-result-object v0

    if-eqz v0, :cond_d4

    invoke-virtual {v0}, Ldx3;->H()Lg1j;

    move-result-object v2

    invoke-virtual {v0}, Ldx3;->F()Ljv0;

    move-result-object v0

    iput-object v0, p0, Lwg7;->J:Ljv0;

    move-object v9, v0

    move-object v8, v2

    goto :goto_d9

    :cond_d4
    const/4 v2, 0x0

    iput-object v2, p0, Lwg7;->J:Ljv0;

    move-object v8, v2

    move-object v9, v8

    :goto_d9
    new-instance v0, Ljg7;

    iget-object v3, p0, Lwg7;->y:Lrf7;

    iget-object v5, p0, Lwg7;->z:Lze7;

    iget-object v6, p0, Lwg7;->L:Lcom/opera/android/undo/UndoBar;

    iget-object v7, p0, Lltl;->n:Lqm9;

    iget-object v10, p0, Lwg7;->E:Lorm;

    iget-object v2, p0, Lyyi;->r:Ltzi;

    iget-object v4, p0, Lwg7;->G:Lzg7;

    move-object v1, p0

    invoke-direct/range {v0 .. v10}, Ljg7;-><init>(Lwg7;Ltzi;Lrf7;Lzg7;Lze7;Lcom/opera/android/undo/UndoBar;Lvwh;Lg1j;Ljv0;Lorm;)V

    iput-object v0, p0, Lwg7;->K:Ljg7;

    new-instance v0, Liy0;

    iget-object v2, p0, Lwg7;->z:Lze7;

    invoke-direct {v0, p0, v2}, Liy0;-><init>(Lwg7;Landroidx/recyclerview/widget/d;)V

    invoke-virtual {v13, v0}, Ltzi;->b(Lxph;)V

    iget-object v0, p0, Lwg7;->z:Lze7;

    iget-object v2, p0, Lwg7;->K:Ljg7;

    iput-object v2, v0, Lze7;->c:Ljg7;

    iget-object v2, v0, Lze7;->g:Lwe7;

    iget-object v0, v0, Lze7;->h:Lxbf;

    invoke-virtual {v2, v0}, Lhkg;->a(Lxbf;)V

    iget-object v0, p0, Lwg7;->y:Lrf7;

    iget-object v2, p0, Lwg7;->F:Lah7;

    invoke-virtual {v0, v2}, Lrf7;->b(Lqf7;)V

    iget-object v0, p0, Lwg7;->G:Lzg7;

    iget-object v2, v0, Loy;->f:Ljava/lang/Object;

    check-cast v2, Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v4, Lks6;

    const/4 v5, 0x1

    invoke-direct {v4, p0, v5}, Lks6;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v4}, Lekc;->j(Lndc;Lf7f;)V

    iget-object v2, p0, Lwg7;->I:Lpt1;

    iget-object v2, v2, Lpt1;->f:Ljava/lang/Object;

    check-cast v2, Lcom/opera/android/downloads/DownloadsPanel;

    new-instance v3, Lug7;

    invoke-direct {v3, p0}, Lug7;-><init>(Lwg7;)V

    iput-object v3, v2, Lcom/opera/android/downloads/DownloadsPanel;->c:Lug7;

    iget-object v2, v14, Lsf7;->c:Lfg7;

    iget-object v3, p0, Lwg7;->C:Lbg;

    invoke-virtual {v2, v3}, Lfg7;->a(Lbg;)V

    new-instance v2, Lflb;

    new-instance v3, Lnvk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v4

    invoke-direct {v3, v4, p0}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    invoke-direct {v2, v3}, Lflb;-><init>(Lblb;)V

    iget-object v3, p0, Lwg7;->I:Lpt1;

    iget-object v3, v3, Lpt1;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/downloads/DownloadsPanel;

    iget-object v3, v3, Lcom/opera/android/downloads/DownloadsPanel;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v2, v3}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object v2, p0, Lwg7;->I:Lpt1;

    iget-object v2, v2, Lpt1;->b:Landroid/view/View;

    check-cast v2, Landroid/widget/FrameLayout;

    const v3, 0x7f0d01b4

    move-object/from16 v4, p1

    invoke-virtual {v4, v3, v2, v11}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object v3

    invoke-virtual {v2, v3}, Landroid/view/ViewGroup;->addView(Landroid/view/View;)V

    const v2, 0x7f0a010c

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v4, :cond_21b

    const v2, 0x7f0a010e

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v4, :cond_21b

    const v2, 0x7f0a0117

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v4, :cond_21b

    const v2, 0x7f0a020c

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v4

    check-cast v4, Landroid/widget/LinearLayout;

    if-eqz v4, :cond_21b

    const v2, 0x7f0a020d

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v6

    check-cast v6, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v6, :cond_21b

    const v2, 0x7f0a02fe

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v7, :cond_21b

    const v2, 0x7f0a054f

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Landroid/widget/HorizontalScrollView;

    if-eqz v7, :cond_21b

    const v2, 0x7f0a0574

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v7, :cond_21b

    const v2, 0x7f0a07cd

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v7, :cond_21b

    const v2, 0x7f0a081e

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v7, :cond_21b

    const v2, 0x7f0a0c8a

    invoke-static {v2, v3}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v7

    check-cast v7, Lcom/opera/android/downloads/DownloadFilterChip;

    if-eqz v7, :cond_21b

    check-cast v3, Lcom/opera/android/custom_views/SideMarginContainer;

    new-instance v2, Ligi;

    iget-object v3, p0, Lwg7;->z:Lze7;

    invoke-direct {v2, v3, v6, v4}, Ligi;-><init>(Lze7;Lcom/google/android/material/chip/ChipGroup;Landroid/widget/LinearLayout;)V

    iput-object v2, p0, Lwg7;->B:Ligi;

    iget-object v3, p0, Lwg7;->z:Lze7;

    new-instance v4, Ldg7;

    invoke-direct {v4, v2, v5}, Ldg7;-><init>(Ljava/lang/Object;B)V

    iput-object v4, v3, Lze7;->l:Ldg7;

    const v2, 0x7f0a0932

    invoke-virtual {p0, v2}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v3, p0, Lwg7;->I:Lpt1;

    iget-object v3, v3, Lpt1;->c:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/FadingRecyclerView;

    const v4, 0x7f140082

    invoke-virtual {v0, v2, v3, v4, v5}, Loy;->j(Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;II)V

    new-instance v6, Lj1c;

    iget-object v7, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v2, p0, Lwg7;->I:Lpt1;

    iget-object v3, v2, Lpt1;->e:Ljava/lang/Object;

    move-object v8, v3

    check-cast v8, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iget-object v9, v2, Lpt1;->g:Landroid/view/View;

    iget-object v2, v2, Lpt1;->c:Landroid/view/View;

    move-object v10, v2

    check-cast v10, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v12, p0, Lwg7;->A:Lyz7;

    move-object v11, v10

    invoke-direct/range {v6 .. v12}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;)V

    invoke-virtual {v0, v6}, Loy;->i(Lj1c;)V

    return-void

    :cond_21b
    invoke-virtual {v3}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void

    :cond_22b
    invoke-virtual {v2}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-virtual {v0, v3}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {v12, v0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final z0()V
    .registers 4

    iget-object v0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    new-instance v1, Lpc5;

    const/4 v2, 0x4

    invoke-direct {v1, p0, v2}, Lpc5;-><init>(Ljava/lang/Object;B)V

    invoke-static {v0, v1}, Lq9n;->f(Landroid/view/View;Lr8n;)V

    iget-object v0, p0, Lwg7;->I:Lpt1;

    iget-object v0, v0, Lpt1;->c:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v1, Lug7;

    invoke-direct {v1, p0}, Lug7;-><init>(Lwg7;)V

    sget-object p0, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-static {v0, v1}, Lh5n;->c(Landroid/view/View;Lbcf;)V

    return-void
.end method
