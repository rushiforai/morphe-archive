.class public final Lt5g;
.super Lh53;
.source "SourceFile"


# instance fields
.field public final t:Lulp;

.field public u:Ln5g;

.field public v:Lrf2;

.field public final w:Lua7;

.field public final x:Lzyk;


# direct methods
.method public constructor <init>(Lgjm;Lyu2;)V
    .registers 7

    const v0, 0x7f0d01e8

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    const v3, 0x7f140c73

    invoke-virtual {v0, v3}, Lu7k;->s(I)V

    const v0, 0x7f100026

    iput v0, v1, Litl;->b:I

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget p2, Landroid/os/Build$VERSION;->SDK_INT:I

    const/16 v0, 0x1e

    if-lt p2, v0, :cond_24

    move p2, v2

    goto :goto_25

    :cond_24
    const/4 p2, 0x0

    :goto_25
    iput-boolean p2, v1, Litl;->c:Z

    invoke-direct {p0, v1, v2}, Li93;-><init>(Litl;Z)V

    sget-object p2, Lulp;->b:Lulp;

    iput-object p2, p0, Lt5g;->t:Lulp;

    new-instance p2, Lua7;

    invoke-direct {p2, p0, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p2, p0, Lt5g;->w:Lua7;

    new-instance p1, Lyse;

    const/4 p2, 0x3

    invoke-direct {p1, p0, p2}, Lyse;-><init>(Landroidx/fragment/app/Fragment;B)V

    invoke-static {p1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p1

    iput-object p1, p0, Lt5g;->x:Lzyk;

    return-void
.end method


# virtual methods
.method public final A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    new-instance v0, Lzvd;

    const/16 v1, 0xd

    invoke-direct {v0, p0, v1}, Lzvd;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Lt5g;->t:Lulp;

    return-object p0
.end method

.method public final H0()Ln5g;
    .registers 5

    iget-object v0, p0, Lt5g;->u:Ln5g;

    if-nez v0, :cond_1e

    new-instance v0, Ln5g;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireContext()Landroid/content/Context;

    move-result-object v1

    new-instance v2, Lqfb;

    const/16 v3, 0x14

    invoke-direct {v2, p0, v3}, Lqfb;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object v3

    iget-object v3, v3, Lt6g;->d:Lx5g;

    iget-object v3, v3, Lx5g;->d:Lw4g;

    invoke-direct {v0, v1, v2, v3}, Ln5g;-><init>(Landroid/content/Context;Lqfb;Lw4g;)V

    iput-object v0, p0, Lt5g;->u:Ln5g;

    :cond_1e
    return-object v0
.end method

.method public final I0()Lt6g;
    .registers 1

    iget-object p0, p0, Lt5g;->x:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lt6g;

    return-object p0
.end method

.method public final l0(Z)V
    .registers 3

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object v0

    iget-object v0, v0, Lt6g;->e:Lzg7;

    invoke-virtual {v0}, Loy;->c()Z

    move-result v0

    if-eqz v0, :cond_d

    return-void

    :cond_d
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p0, p0, Lt6g;->e:Lzg7;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Loy;->i(Lj1c;)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 6

    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result v0

    const/4 v1, 0x1

    if-eqz v0, :cond_8

    return v1

    :cond_8
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v2, 0x7f0a0819

    const/4 v3, 0x0

    if-ne v0, v2, :cond_1e

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    iget-object p0, p0, Lt6g;->b:Lot2;

    new-array p1, v3, [I

    invoke-virtual {p0, p1}, Lot2;->e([I)V

    return v1

    :cond_1e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0096

    if-ne p1, v0, :cond_3d

    new-instance p1, Lku;

    invoke-direct {p1}, Lku;-><init>()V

    new-instance v0, Ls5g;

    invoke-direct {v0, p0, v3}, Ls5g;-><init>(Lt5g;B)V

    new-instance v2, Lt7d;

    const/4 v3, 0x3

    invoke-direct {v2, v0, v3}, Lt7d;-><init>(Lkotlin/jvm/functions/Function1;B)V

    iget-object p0, p0, Lt5g;->w:Lua7;

    invoke-virtual {p0, p1, v2}, Lua7;->E(Lr37;Lf7f;)V

    return v1

    :cond_3d
    return v3
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Lltl;->onResume()V

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p0

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lsl6;

    sget-object v1, Lt8;->a:Landroid/content/Context;

    invoke-direct {v0, v1}, Lsl6;-><init>(Landroid/content/Context;)V

    iput-object v0, p0, Lt6g;->m:Lsl6;

    iget-object v0, p0, Lt6g;->s:Ltsd;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lq6g;

    if-eqz v1, :cond_36

    iget-boolean v1, v1, Lq6g;->a:Z

    invoke-virtual {p0}, Lt6g;->g()Z

    move-result v2

    if-ne v1, v2, :cond_36

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lq6g;

    if-eqz v0, :cond_36

    iget-boolean v0, v0, Lq6g;->f:Z

    invoke-virtual {p0}, Lt6g;->f()Z

    move-result v1

    if-ne v0, v1, :cond_36

    return-void

    :cond_36
    invoke-virtual {p0}, Lt6g;->h()V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 14

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p1

    const p2, 0x7f0a0932

    invoke-virtual {p0, p2}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p2

    iget-object v0, p0, Lt5g;->v:Lrf2;

    iget-object v1, p1, Lt6g;->e:Lzg7;

    iget-object v2, v0, Lrf2;->h:Landroid/view/View;

    check-cast v2, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v1, p2, v2}, Loy;->k(Loy;Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p1, p1, Lt6g;->e:Lzg7;

    new-instance v1, Lj1c;

    iget-object p2, v0, Lrf2;->j:Landroid/view/View;

    move-object v2, p2

    check-cast v2, Landroidx/appcompat/widget/Toolbar;

    iget-object p2, v0, Lrf2;->c:Landroid/view/View;

    move-object v3, p2

    check-cast v3, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iget-object p2, v0, Lrf2;->i:Ljava/lang/Object;

    move-object v5, p2

    check-cast v5, Landroid/view/View;

    iget-object p2, v0, Lrf2;->h:Landroid/view/View;

    move-object v6, p2

    check-cast v6, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v9, Lodf;

    const/16 p2, 0xe

    invoke-direct {v9, p2}, Lodf;-><init>(B)V

    const/16 v10, 0x64

    const/4 v4, 0x0

    const/4 v7, 0x0

    const/4 v8, 0x0

    invoke-direct/range {v1 .. v10}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/appbar/CollapsingToolbarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;Lxsi;I)V

    invoke-virtual {p1, v1}, Loy;->i(Lj1c;)V

    invoke-virtual {p0}, Lt5g;->I0()Lt6g;

    move-result-object p1

    iget-object p1, p1, Lt6g;->s:Ltsd;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v0

    iget-object v1, p0, Lt5g;->v:Lrf2;

    iget-object v1, v1, Lrf2;->b:Ljava/lang/Object;

    check-cast v1, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v2, Liwa;

    invoke-direct {v2, p0, p2}, Liwa;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    invoke-static {p1, v0, v1, p0, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 4

    const p1, 0x7f0a02a9

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lrf2;->a(Landroid/view/View;)Lrf2;

    move-result-object p1

    iput-object p1, p0, Lt5g;->v:Lrf2;

    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Lt5g;->v:Lrf2;

    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0}, Lt5g;->H0()Ln5g;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Lt5g;->v:Lrf2;

    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, p2, p1}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
