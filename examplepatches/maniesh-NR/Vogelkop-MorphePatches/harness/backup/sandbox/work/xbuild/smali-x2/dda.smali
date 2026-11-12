.class public final Ldda;
.super Lyyi;
.source "SourceFile"

# interfaces
.implements Ljvk;
.implements Lo37;


# instance fields
.field public A:Lztn;

.field public B:Lcom/opera/android/undo/UndoBar;

.field public C:Ljy0;

.field public D:Lcom/opera/android/undo/UndoBar;

.field public E:Lcda;

.field public F:Lqf2;

.field public final G:Lzyk;

.field public final H:La83;

.field public final I:Lmvk;

.field public J:Z

.field public final x:Lua7;

.field public y:Lei;

.field public z:Lbca;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 6

    const v0, 0x7f10002a

    const v1, 0x7f10002b

    const v2, 0x7f0d0205

    const v3, 0x7f140d5c

    invoke-direct {p0, v2, v3, v0, v1}, Lyyi;-><init>(IIII)V

    new-instance v0, Lua7;

    invoke-direct {v0, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object v0, p0, Ldda;->x:Lua7;

    new-instance p1, Lt2;

    const/16 v0, 0x17

    invoke-direct {p1, p0, v0}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Ldda;->G:Lzyk;

    new-instance p1, La83;

    const/16 v0, 0x8

    invoke-direct {p1, p0, v0}, La83;-><init>(Ljava/lang/Object;B)V

    iput-object p1, p0, Ldda;->H:La83;

    const p1, 0x7f140564

    invoke-static {p1}, Lnvk;->v(I)Lmvk;

    move-result-object p1

    iput-object p1, p0, Ldda;->I:Lmvk;

    return-void
.end method


# virtual methods
.method public final H0(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a053c

    const/4 v2, 0x1

    iget-object v3, p0, Lyyi;->r:Ltzi;

    if-ne v0, v1, :cond_28

    iget-object p0, p0, Ldda;->z:Lbca;

    if-nez p0, :cond_11

    const/4 p0, 0x0

    :cond_11
    iget-object p1, v3, Ltzi;->a:Le5d;

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object p1

    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lbca;->L(Ljava/util/List;)V

    invoke-virtual {v3}, Ltzi;->d()V

    return v2

    :cond_28
    const v1, 0x7f0a053e

    if-ne v0, v1, :cond_3d

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    invoke-virtual {p0}, Ldda;->K0()Ljava/util/ArrayList;

    move-result-object p0

    const/4 v0, 0x0

    invoke-virtual {p1, p0, v0}, Lcom/opera/android/history/f;->h(Ljava/util/List;Z)V

    invoke-virtual {v3}, Ltzi;->d()V

    return v2

    :cond_3d
    const v1, 0x7f0a053d

    if-ne v0, v1, :cond_51

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    invoke-virtual {p0}, Ldda;->K0()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p1, p0, v2}, Lcom/opera/android/history/f;->h(Ljava/util/List;Z)V

    invoke-virtual {v3}, Ltzi;->d()V

    return v2

    :cond_51
    invoke-super {p0, p1}, Lyyi;->H0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final J0(Litd;I)V
    .registers 7

    const v0, 0x7f0a053c

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-lez p2, :cond_d

    move v3, v2

    goto :goto_e

    :cond_d
    move v3, v1

    :goto_e
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a053e

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    if-lez p2, :cond_1c

    move v3, v2

    goto :goto_1d

    :cond_1c
    move v3, v1

    :goto_1d
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    if-le p2, v2, :cond_2a

    const v3, 0x7f140be9

    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    goto :goto_31

    :cond_2a
    const v3, 0x7f1404fc

    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    :goto_31
    invoke-interface {v0, v3}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    const v0, 0x7f0a053d

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-lez p2, :cond_3e

    move v1, v2

    :cond_3e
    invoke-interface {p1, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    if-le p2, v2, :cond_4b

    const p2, 0x7f140a37

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    goto :goto_52

    :cond_4b
    const p2, 0x7f1404fe

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    :goto_52
    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    return-void
.end method

.method public final K0()Ljava/util/ArrayList;
    .registers 7

    iget-object v0, p0, Lyyi;->r:Ltzi;

    iget-object v0, v0, Ltzi;->a:Le5d;

    iget-object v0, v0, Le5d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-static {v0}, Ljava/util/Collections;->unmodifiableSet(Ljava/util/Set;)Ljava/util/Set;

    move-result-object v0

    check-cast v0, Ljava/lang/Iterable;

    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_17
    :goto_17
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_36

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Long;

    iget-object v3, p0, Ldda;->z:Lbca;

    if-nez v3, :cond_28

    const/4 v3, 0x0

    :cond_28
    invoke-virtual {v2}, Ljava/lang/Long;->longValue()J

    move-result-wide v4

    invoke-virtual {v3, v4, v5}, Lbca;->H(J)Laca;

    move-result-object v2

    if-eqz v2, :cond_17

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_17

    :cond_36
    return-object v1
.end method

.method public final L0()Lcom/opera/android/history/f;
    .registers 1

    iget-object p0, p0, Ldda;->G:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lcom/opera/android/history/f;

    return-object p0
.end method

.method public final M0(Lbca;)V
    .registers 16

    iget-object v0, p0, Ldda;->z:Lbca;

    iget-object v1, p0, Lyyi;->r:Ltzi;

    iget-object v2, p0, Ldda;->H:La83;

    if-eqz v0, :cond_11

    if-ne v0, p1, :cond_b

    return-void

    :cond_b
    invoke-virtual {v0, v2}, Landroidx/recyclerview/widget/d;->unregisterAdapterDataObserver(Lgph;)V

    invoke-virtual {v1}, Ltzi;->d()V

    :cond_11
    iput-object p1, p0, Ldda;->z:Lbca;

    new-instance v0, Lcda;

    const/4 v3, 0x0

    if-nez p1, :cond_19

    move-object p1, v3

    :cond_19
    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object v4

    iget-object v4, v4, Lcom/opera/android/history/f;->g:Lwnm;

    invoke-virtual {v4}, Lekc;->g()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lkea;

    iget-boolean v4, v4, Lkea;->a:Z

    invoke-direct {v0, p1, v4}, Lcda;-><init>(Lbca;Z)V

    iput-object v0, p0, Ldda;->E:Lcda;

    iget-object p1, p0, Ldda;->z:Lbca;

    if-nez p1, :cond_31

    move-object p1, v3

    :cond_31
    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    iget-object p1, p1, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    new-instance v4, Lj1c;

    iget-object v5, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v0, p0, Ldda;->y:Lei;

    if-nez v0, :cond_44

    move-object v2, v3

    goto :goto_45

    :cond_44
    move-object v2, v0

    :goto_45
    iget-object v2, v2, Lei;->c:Landroid/view/View;

    move-object v6, v2

    check-cast v6, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    if-nez v0, :cond_4e

    move-object v2, v3

    goto :goto_4f

    :cond_4e
    move-object v2, v0

    :goto_4f
    iget-object v8, v2, Lei;->i:Landroid/view/View;

    if-nez v0, :cond_54

    move-object v0, v3

    :cond_54
    iget-object v0, v0, Lei;->h:Landroid/view/View;

    move-object v9, v0

    check-cast v9, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v0, p0, Ldda;->E:Lcda;

    if-nez v0, :cond_5e

    move-object v0, v3

    :cond_5e
    iget-object v0, v0, Lcda;->d:Ljava/lang/Object;

    move-object v11, v0

    check-cast v11, Lyz7;

    new-instance v12, Lbda;

    const/4 v0, 0x1

    invoke-direct {v12, p0, v0}, Lbda;-><init>(Ldda;B)V

    const/16 v13, 0x24

    const/4 v7, 0x0

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v13}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/appbar/CollapsingToolbarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;Lxsi;I)V

    invoke-virtual {p1, v4}, Loy;->i(Lj1c;)V

    iget-object p1, p0, Ldda;->z:Lbca;

    if-nez p1, :cond_78

    move-object p1, v3

    :cond_78
    invoke-virtual {p1}, Lbca;->I()Lj4c;

    move-result-object p1

    invoke-virtual {p1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lxph;

    invoke-virtual {v1, p1}, Ltzi;->b(Lxph;)V

    iget-object p1, p0, Ldda;->y:Lei;

    if-nez p1, :cond_8a

    move-object p1, v3

    :cond_8a
    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object p0, p0, Ldda;->E:Lcda;

    if-eqz p0, :cond_93

    move-object v3, p0

    :cond_93
    iget-object p0, v3, Lcda;->d:Ljava/lang/Object;

    check-cast p0, Lyz7;

    iget-object p0, p0, Lyz7;->c:Lx93;

    invoke-virtual {p1, p0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public final N0(Landroid/view/MenuItem;Z)V
    .registers 8

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0932

    const/4 v2, 0x1

    const/4 v3, 0x0

    if-ne v0, v1, :cond_19

    iget-object p0, p0, Ldda;->z:Lbca;

    if-eqz p0, :cond_10

    move-object v3, p0

    :cond_10
    invoke-virtual {v3}, Lbca;->J()Z

    move-result p0

    xor-int/2addr p0, v2

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :cond_19
    const v1, 0x7f0a053c

    const/4 v4, 0x0

    if-ne v0, v1, :cond_31

    if-nez p2, :cond_2c

    iget-object p0, p0, Ldda;->z:Lbca;

    if-eqz p0, :cond_26

    move-object v3, p0

    :cond_26
    invoke-virtual {v3}, Lbca;->J()Z

    move-result p0

    if-eqz p0, :cond_2d

    :cond_2c
    move v2, v4

    :cond_2d
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :cond_31
    const v1, 0x7f0a053f

    if-ne v0, v1, :cond_47

    if-nez p2, :cond_43

    iget-object p0, p0, Ldda;->z:Lbca;

    if-eqz p0, :cond_3d

    move-object v3, p0

    :cond_3d
    invoke-virtual {v3}, Lbca;->J()Z

    move-result p0

    if-eqz p0, :cond_44

    :cond_43
    move v2, v4

    :cond_44
    invoke-interface {p1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_47
    return-void
.end method

.method public final g0()V
    .registers 2

    invoke-super {p0}, Lryl;->g0()V

    iget-object p0, p0, Ldda;->x:Lua7;

    sget-object v0, Lkotlin/Unit;->a:Lkotlin/Unit;

    invoke-static {p0, v0}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Ldda;->I:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 3

    iget-object p0, p0, Ldda;->z:Lbca;

    if-nez p0, :cond_5

    const/4 p0, 0x0

    :cond_5
    invoke-virtual {p0, p1}, Lbca;->K(Landroidx/recyclerview/widget/i;)V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    invoke-virtual {v0}, Loy;->c()Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-object v0, p0, Ldda;->E:Lcda;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lcda;->d:Ljava/lang/Object;

    check-cast v0, Lyz7;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of v0, p1, Lxz7;

    if-eqz v0, :cond_13

    const/4 p0, 0x0

    return p0

    :cond_13
    iget-object p0, p0, Ldda;->z:Lbca;

    if-eqz p0, :cond_18

    move-object v1, p0

    :cond_18
    invoke-virtual {v1, p1}, Lbca;->n(Landroidx/recyclerview/widget/i;)Z

    move-result p0

    return p0
.end method

.method public final onDestroyView()V
    .registers 4

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    iget-object v1, p0, Ldda;->F:Lqf2;

    const/4 v2, 0x0

    if-nez v1, :cond_a

    move-object v1, v2

    :cond_a
    invoke-virtual {v0, v1}, Landroid/content/Context;->unregisterReceiver(Landroid/content/BroadcastReceiver;)V

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object v0

    iget-object v0, v0, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    invoke-virtual {v0, v2}, Loy;->i(Lj1c;)V

    iget-object v0, p0, Ldda;->B:Lcom/opera/android/undo/UndoBar;

    if-nez v0, :cond_1b

    move-object v0, v2

    :cond_1b
    const/4 v1, 0x1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iget-object v0, p0, Ldda;->D:Lcom/opera/android/undo/UndoBar;

    if-nez v0, :cond_24

    move-object v0, v2

    :cond_24
    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iget-object v0, p0, Ldda;->A:Lztn;

    if-eqz v0, :cond_2c

    move-object v2, v0

    :cond_2c
    invoke-virtual {v2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a053c

    const/4 v2, 0x1

    if-ne v0, v1, :cond_4a

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    iget-object p1, p1, Lcom/opera/android/history/f;->g:Lwnm;

    invoke-virtual {p1}, Lekc;->g()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lkea;

    iget-object p1, p1, Lkea;->b:Laea;

    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    move-result p1

    const/4 v0, 0x0

    const v1, 0x7f140bbb

    if-eqz p1, :cond_3a

    if-ne p1, v2, :cond_36

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p1

    new-instance v3, Lsk;

    const/16 v4, 0x8

    invoke-direct {v3, p0, v4}, Lsk;-><init>(Ljava/lang/Object;B)V

    const p0, 0x7f140565

    invoke-static {p1, v0, p0, v1, v3}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    return v2

    :cond_36
    invoke-static {}, Lh9o;->p()V

    return v0

    :cond_3a
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    new-instance p1, Lada;

    invoke-direct {p1, v0}, Lada;-><init>(B)V

    const v3, 0x7f140577

    invoke-static {p0, v0, v3, v1, p1}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    return v2

    :cond_4a
    const v1, 0x7f0a053f

    if-ne v0, v1, :cond_55

    iget-object p0, p0, Lyyi;->r:Ltzi;

    invoke-virtual {p0}, Ltzi;->c()V

    return v2

    :cond_55
    invoke-super {p0, p1}, Lyyi;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final r()Lua7;
    .registers 1

    iget-object p0, p0, Ldda;->x:Lua7;

    return-object p0
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 14

    const p1, 0x7f0a02a9

    invoke-virtual {p2, p1}, Landroid/view/View;->requireViewById(I)Landroid/view/View;

    move-result-object p1

    const p2, 0x7f0a00f9

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v3, v0

    check-cast v3, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    if-eqz v3, :cond_1a2

    const p2, 0x7f0a020a

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v4, v0

    check-cast v4, Lcom/opera/android/ui/catalog/widget/OperaChip;

    if-eqz v4, :cond_1a2

    const p2, 0x7f0a020d

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v5, v0

    check-cast v5, Lcom/google/android/material/chip/ChipGroup;

    if-eqz v5, :cond_1a2

    const p2, 0x7f0a020e

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v6, v0

    check-cast v6, Lcom/opera/android/custom_views/SideMarginContainer;

    if-eqz v6, :cond_1a2

    const p2, 0x7f0a0215

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v7, v0

    check-cast v7, Lcom/opera/android/ui/catalog/widget/OperaChip;

    if-eqz v7, :cond_1a2

    move-object v2, p1

    check-cast v2, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    const p2, 0x7f0a08ae

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz v8, :cond_1a2

    const p2, 0x7f0a0944

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v9

    if-eqz v9, :cond_1a2

    const p2, 0x7f0a0bba

    invoke-static {p2, p1}, Lw1h;->j(ILandroid/view/View;)Landroid/view/View;

    move-result-object v0

    check-cast v0, Landroidx/appcompat/widget/Toolbar;

    if-eqz v0, :cond_1a2

    new-instance v1, Lei;

    const/4 v10, 0x4

    invoke-direct/range {v1 .. v10}, Lei;-><init>(Landroid/view/ViewGroup;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;Landroid/view/View;B)V

    iput-object v1, p0, Ldda;->y:Lei;

    new-instance v2, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v3

    iget-object v4, p0, Lltl;->n:Lqm9;

    new-instance v5, Lbda;

    const/4 p1, 0x2

    invoke-direct {v5, p0, p1}, Lbda;-><init>(Ldda;B)V

    new-instance v6, Leq6;

    invoke-direct {v6, p0}, Leq6;-><init>(Ljava/lang/Object;)V

    const/4 v7, 0x1

    invoke-direct/range {v2 .. v7}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v2, p0, Ldda;->B:Lcom/opera/android/undo/UndoBar;

    const p1, 0x7f120052

    invoke-virtual {v2, p1}, Lcom/opera/android/undo/UndoBar;->e(I)V

    new-instance v3, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v4

    iget-object v5, p0, Lltl;->n:Lqm9;

    new-instance v6, Lbda;

    const/4 p2, 0x3

    invoke-direct {v6, p0, p2}, Lbda;-><init>(Ldda;B)V

    new-instance v7, Lqq6;

    const/16 p2, 0x11

    invoke-direct {v7, p0, p2}, Lqq6;-><init>(Ljava/lang/Object;B)V

    const/4 v8, 0x1

    invoke-direct/range {v3 .. v8}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v3, p0, Ldda;->D:Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v3, p1}, Lcom/opera/android/undo/UndoBar;->e(I)V

    new-instance p1, Lztn;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p2

    new-instance v0, Lga6;

    const/16 v1, 0x10

    invoke-direct {v0, p0, v1}, Lga6;-><init>(Ljava/lang/Object;B)V

    iget-object v1, p0, Lyyi;->r:Ltzi;

    invoke-direct {p1, p2, v1, v0}, Lztn;-><init>(Landroidx/fragment/app/r;Ltzi;Lga6;)V

    iput-object p1, p0, Ldda;->A:Lztn;

    const/4 p2, 0x1

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance p1, Ljy0;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v0

    new-instance v2, Lnv6;

    invoke-direct {v2, p0}, Lnv6;-><init>(Ljava/lang/Object;)V

    invoke-direct {p1, v0, v1, v2}, Ljy0;-><init>(Landroidx/fragment/app/r;Ltzi;Lnv6;)V

    iput-object p1, p0, Ldda;->C:Ljy0;

    invoke-virtual {p1, p2}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    iget-object p1, p0, Ldda;->A:Lztn;

    const/4 v0, 0x0

    if-nez p1, :cond_dc

    move-object p1, v0

    :cond_dc
    new-instance v1, Lqf2;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v2

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object v3

    invoke-direct {v1, v2, p1, v3}, Lqf2;-><init>(Landroidx/fragment/app/r;Lztn;Lcom/opera/android/history/f;)V

    iput-object v1, p0, Ldda;->F:Lqf2;

    new-instance p1, Landroid/content/IntentFilter;

    invoke-direct {p1}, Landroid/content/IntentFilter;-><init>()V

    const-string v1, "android.intent.action.TIMEZONE_CHANGED"

    invoke-virtual {p1, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.TIME_SET"

    invoke-virtual {p1, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    const-string v1, "android.intent.action.DATE_CHANGED"

    invoke-virtual {p1, v1}, Landroid/content/IntentFilter;->addAction(Ljava/lang/String;)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    iget-object v2, p0, Ldda;->F:Lqf2;

    if-nez v2, :cond_108

    move-object v2, v0

    :cond_108
    invoke-virtual {v1, v2, p1}, Landroid/content/Context;->registerReceiver(Landroid/content/BroadcastReceiver;Landroid/content/IntentFilter;)Landroid/content/Intent;

    new-instance p1, Lnvk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object v1

    invoke-direct {p1, v1, p0}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance v1, Lflb;

    invoke-direct {v1, p1}, Lflb;-><init>(Lblb;)V

    iget-object p1, p0, Ldda;->y:Lei;

    if-nez p1, :cond_11e

    move-object p1, v0

    :cond_11e
    iget-object p1, p1, Lei;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v3, 0x0

    invoke-direct {v2, p2, v3}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {p1, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v2, p1, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    check-cast v2, Lxkj;

    iput-boolean v3, v2, Lxkj;->g:Z

    invoke-virtual {v1, p1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p1, p0, Ldda;->y:Lei;

    if-nez p1, :cond_13c

    move-object p1, v0

    :cond_13c
    iget-object p1, p1, Lei;->e:Landroid/view/View;

    check-cast p1, Lcom/google/android/material/chip/ChipGroup;

    new-instance v1, Lbda;

    invoke-direct {v1, p0, v3}, Lbda;-><init>(Ldda;B)V

    iput-object v1, p1, Lcom/google/android/material/chip/ChipGroup;->g:Lvx4;

    iget-boolean p1, p0, Ldda;->J:Z

    if-nez p1, :cond_16f

    iput-boolean p2, p0, Ldda;->J:Z

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    iget-object v1, p0, Ldda;->x:Lua7;

    invoke-virtual {v1}, Lua7;->p()Ln37;

    move-result-object v1

    check-cast v1, Ltca;

    iget-object v1, v1, Ltca;->a:Lsca;

    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    move-result v1

    if-eqz v1, :cond_16a

    if-ne v1, p2, :cond_166

    sget-object p2, Laea;->b:Laea;

    goto :goto_16c

    :cond_166
    invoke-static {}, Lh9o;->p()V

    return-void

    :cond_16a
    sget-object p2, Laea;->a:Laea;

    :goto_16c
    invoke-virtual {p1, p2}, Lcom/opera/android/history/f;->i(Laea;)V

    :cond_16f
    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    iget-object p1, p1, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    const p2, 0x7f0a0932

    invoke-virtual {p0, p2}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p2

    iget-object v1, p0, Ldda;->y:Lei;

    if-eqz v1, :cond_181

    move-object v0, v1

    :cond_181
    iget-object v0, v0, Lei;->h:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {p1, p2, v0}, Loy;->k(Loy;Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;)V

    invoke-virtual {p0}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object p1

    iget-object p1, p1, Lcom/opera/android/history/f;->g:Lwnm;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    new-instance v0, Ltu7;

    const/16 v1, 0x1c

    invoke-direct {v0, p0, v1}, Ltu7;-><init>(Ljava/lang/Object;B)V

    new-instance p0, Lcl4;

    invoke-direct {p0, v0, v1}, Lcl4;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, p2, p0}, Lekc;->j(Lndc;Lf7f;)V

    return-void

    :cond_1a2
    invoke-virtual {p1}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object p0

    invoke-virtual {p0, p2}, Landroid/content/res/Resources;->getResourceName(I)Ljava/lang/String;

    move-result-object p0

    const-string p1, "Missing required view with ID: "

    invoke-virtual {p1, p0}, Ljava/lang/String;->concat(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p0

    invoke-static {p0}, Lt3p;->q(Ljava/lang/String;)V

    return-void
.end method

.method public final z0()V
    .registers 3

    iget-object v0, p0, Ldda;->y:Lei;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    move-object v0, v1

    :cond_6
    iget-object v0, v0, Lei;->h:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    invoke-static {p0, v1}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
