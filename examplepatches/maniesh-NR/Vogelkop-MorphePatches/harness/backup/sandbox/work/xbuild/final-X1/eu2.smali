.class public final Leu2;
.super Lh53;
.source "SourceFile"


# instance fields
.field public final t:Lulp;

.field public final u:Lzyk;

.field public v:Lrf2;

.field public final w:Lua7;

.field public final x:Lzyk;


# direct methods
.method public constructor <init>(Lgjm;)V
    .registers 11

    const v0, 0x7f0d01e8

    invoke-static {v0}, Lu7k;->j(I)Lu7k;

    move-result-object v0

    iget-object v1, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v1, Litl;

    const/4 v2, 0x1

    iput-boolean v2, v1, Litl;->e:Z

    const v3, 0x7f140c73

    invoke-virtual {v0, v3}, Lu7k;->s(I)V

    const v0, 0x7f10000b

    iput v0, v1, Litl;->b:I

    iput-boolean v2, v1, Litl;->c:Z

    invoke-direct {p0, v1, v2}, Li93;-><init>(Litl;Z)V

    sget-object v0, Lulp;->b:Lulp;

    iput-object v0, p0, Leu2;->t:Lulp;

    new-instance v1, Lq2;

    const/4 v7, 0x0

    const/16 v8, 0xa

    const/4 v2, 0x0

    const-class v4, Leu2;

    const-string v5, "createAdapter"

    const-string v6, "createAdapter()Lcom/opera/android/autofill/passwords/picker/AutofillPasswordPickerAdapter;"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lq2;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-static {v1}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p0

    iput-object p0, v3, Leu2;->u:Lzyk;

    new-instance p0, Lua7;

    invoke-direct {p0, v3, p1}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p0, v3, Leu2;->w:Lua7;

    new-instance p0, Lt2;

    const/16 p1, 0xd

    invoke-direct {p0, v3, p1}, Lt2;-><init>(Ljava/lang/Object;B)V

    invoke-static {p0}, Lz4c;->b(Lkotlin/jvm/functions/Function0;)Lzyk;

    move-result-object p0

    iput-object p0, v3, Leu2;->x:Lzyk;

    return-void
.end method


# virtual methods
.method public final A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V
    .registers 4

    invoke-super {p0, p1}, Lltl;->A0(Lcom/google/android/material/floatingactionbutton/FloatingActionButton;)V

    new-instance v0, Lgf;

    const/16 v1, 0x12

    invoke-direct {v0, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-void
.end method

.method public final G0()Lh93;
    .registers 1

    iget-object p0, p0, Leu2;->t:Lulp;

    return-object p0
.end method

.method public final H0()Lhu2;
    .registers 1

    iget-object p0, p0, Leu2;->x:Lzyk;

    invoke-virtual {p0}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lhu2;

    return-object p0
.end method

.method public final l0(Z)V
    .registers 3

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object v0

    iget-object v0, v0, Lhu2;->f:Lzg7;

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

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p0

    iget-object p0, p0, Lhu2;->f:Lzg7;

    const/4 v0, 0x0

    invoke-virtual {p0, v0}, Loy;->i(Lj1c;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 15

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p1

    const p2, 0x7f0a0932

    invoke-virtual {p0, p2}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p2

    iget-object v0, p0, Leu2;->v:Lrf2;

    const/4 v1, 0x0

    if-nez v0, :cond_14

    move-object v0, v1

    :cond_14
    iget-object v2, p1, Lhu2;->f:Lzg7;

    iget-object v3, v0, Lrf2;->h:Landroid/view/View;

    check-cast v3, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v2, p2, v3}, Loy;->k(Loy;Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object p1, p1, Lhu2;->f:Lzg7;

    new-instance v2, Lj1c;

    iget-object p2, v0, Lrf2;->j:Landroid/view/View;

    move-object v3, p2

    check-cast v3, Landroidx/appcompat/widget/Toolbar;

    iget-object p2, v0, Lrf2;->c:Landroid/view/View;

    move-object v4, p2

    check-cast v4, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iget-object p2, v0, Lrf2;->i:Ljava/lang/Object;

    move-object v6, p2

    check-cast v6, Landroid/view/View;

    iget-object p2, v0, Lrf2;->h:Landroid/view/View;

    move-object v7, p2

    check-cast v7, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v10, Lqp2;

    const/4 p2, 0x5

    invoke-direct {v10, p2}, Lqp2;-><init>(B)V

    const/16 v11, 0x64

    const/4 v5, 0x0

    const/4 v8, 0x0

    const/4 v9, 0x0

    invoke-direct/range {v2 .. v11}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Lcom/google/android/material/appbar/CollapsingToolbarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;Lxsi;I)V

    invoke-virtual {p1, v2}, Loy;->i(Lj1c;)V

    invoke-virtual {p0}, Leu2;->H0()Lhu2;

    move-result-object p1

    iget-object p1, p1, Lhu2;->j:Lh42;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    iget-object v0, p0, Leu2;->v:Lrf2;

    if-nez v0, :cond_55

    move-object v0, v1

    :cond_55
    iget-object v0, v0, Lrf2;->b:Ljava/lang/Object;

    check-cast v0, Landroidx/coordinatorlayout/widget/CoordinatorLayout;

    new-instance v2, Lpb;

    const/16 v3, 0x11

    invoke-direct {v2, p0, v3}, Lpb;-><init>(Ljava/lang/Object;B)V

    invoke-static {p1, p2, v0, v1, v2}, Lxf8;->i0(Lekc;Lndc;Landroid/view/ViewGroup;Ljava/util/List;Lf7f;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 5

    const p1, 0x7f0a02a9

    invoke-virtual {p2, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p1}, Lrf2;->a(Landroid/view/View;)Lrf2;

    move-result-object p1

    iput-object p1, p0, Leu2;->v:Lrf2;

    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p1, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, p0, Leu2;->v:Lrf2;

    const/4 v0, 0x0

    if-nez p1, :cond_22

    move-object p1, v0

    :cond_22
    iget-object p1, p1, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v1, p0, Leu2;->u:Lzyk;

    invoke-virtual {v1}, Lzyk;->getValue()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lau2;

    invoke-virtual {p1, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object p1, p0, Leu2;->v:Lrf2;

    if-eqz p1, :cond_36

    move-object v0, p1

    :cond_36
    iget-object p1, v0, Lrf2;->h:Landroid/view/View;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, p2, p1}, Lltl;->p0(Landroid/view/View;Landroid/view/View;)V

    return-void
.end method
