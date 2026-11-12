.class public final Ljh3;
.super Lh53;
.source "SourceFile"

# interfaces
.implements Ljvk;


# instance fields
.field public final A:Lyu2;

.field public final B:Lw4g;

.field public C:Landroid/view/MenuItem;

.field public D:Landroidx/appcompat/widget/SearchView;

.field public E:Z

.field public final F:Ly73;

.field public G:Lyz7;

.field public final H:Lz77;

.field public final t:I

.field public final u:Z

.field public final v:Ld83;

.field public final w:Lmvk;

.field public final x:I

.field public final y:I

.field public final z:Lpsp;


# direct methods
.method public constructor <init>(Lpsp;Lqp2;Ld8j;Lyu2;Lw4g;Lz77;)V
    .registers 9

    invoke-static {}, Lu7k;->e()Lu7k;

    move-result-object p3

    const v0, 0x7f1406dc

    invoke-virtual {p3, v0}, Lu7k;->s(I)V

    iget-object p3, p3, Lu7k;->a:Ljava/lang/Object;

    check-cast p3, Litl;

    const v0, 0x7f100025

    iput v0, p3, Litl;->b:I

    const/4 v0, 0x1

    invoke-direct {p0, p3, v0}, Li93;-><init>(Litl;Z)V

    new-instance p3, Ld83;

    invoke-direct {p3, p0}, Ld83;-><init>(Ljh3;)V

    iput-object p3, p0, Ljh3;->v:Ld83;

    const v1, 0x7f1406db

    iput v1, p0, Ljh3;->t:I

    iput-boolean v0, p0, Ljh3;->u:Z

    new-instance v0, La83;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, La83;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p3, v0}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    const p3, 0x7f140e9f

    invoke-static {p3}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Ljh3;->w:Lmvk;

    const v0, 0x7f140c61

    iput v0, p0, Ljh3;->x:I

    iput p3, p0, Ljh3;->y:I

    iput-object p1, p0, Ljh3;->z:Lpsp;

    new-instance p1, Ly73;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object p3

    invoke-direct {p1, p0, p3, p2}, Ly73;-><init>(Ljh3;Ltcc;Lqp2;)V

    iput-object p1, p0, Ljh3;->F:Ly73;

    iput-object p4, p0, Ljh3;->A:Lyu2;

    iput-object p5, p0, Ljh3;->B:Lw4g;

    iput-object p6, p0, Ljh3;->H:Lz77;

    return-void
.end method


# virtual methods
.method public final B0(Landroid/view/LayoutInflater;Lcom/opera/android/custom_views/FadingRecyclerView;)V
    .registers 9

    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v0, Lyz7;

    const/4 v5, 0x0

    const/4 v2, 0x2

    iget-object v1, p0, Ljh3;->v:Ld83;

    const v3, 0x7f140b46

    const v4, 0x7f130033

    invoke-direct/range {v0 .. v5}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    iput-object v0, p0, Ljh3;->G:Lyz7;

    iget-object p1, v0, Lyz7;->c:Lx93;

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    new-instance p1, Lnvk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    invoke-direct {p1, v0, p0}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance p0, Lflb;

    invoke-direct {p0, p1}, Lflb;-><init>(Lblb;)V

    invoke-virtual {p0, p2}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    return-void
.end method

.method public final H0()Z
    .registers 4

    iget-object v0, p0, Ljh3;->v:Ld83;

    iget-object v1, v0, Ld83;->b:Ljava/lang/Object;

    check-cast v1, La4g;

    const/4 v2, 0x0

    if-nez v1, :cond_b

    move v1, v2

    goto :goto_15

    :cond_b
    iget-object v1, v1, La4g;->a:Ljava/util/List;

    invoke-static {v1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->size()I

    move-result v1

    :goto_15
    if-eqz v1, :cond_2c

    invoke-virtual {v0}, Ld83;->getItemCount()I

    move-result v0

    if-nez v0, :cond_2b

    iget-object p0, p0, Ljh3;->D:Landroidx/appcompat/widget/SearchView;

    if-eqz p0, :cond_2c

    invoke-virtual {p0}, Landroidx/appcompat/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object p0

    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result p0

    if-nez p0, :cond_2c

    :cond_2b
    return v2

    :cond_2c
    const/4 p0, 0x1

    return p0
.end method

.method public final I0(Z)V
    .registers 4

    iget-object v0, p0, Ljh3;->G:Lyz7;

    if-eqz v0, :cond_29

    iget-boolean v1, p0, Ljh3;->E:Z

    if-eq p1, v1, :cond_29

    iput-boolean p1, p0, Ljh3;->E:Z

    if-eqz p1, :cond_1b

    const p1, 0x7f130035

    invoke-virtual {v0, p1}, Lyz7;->a(I)V

    iget-object p0, p0, Ljh3;->G:Lyz7;

    const p1, 0x7f14103c

    invoke-virtual {p0, p1}, Lyz7;->b(I)V

    return-void

    :cond_1b
    const p1, 0x7f130033

    invoke-virtual {v0, p1}, Lyz7;->a(I)V

    iget-object p0, p0, Ljh3;->G:Lyz7;

    const p1, 0x7f140b46

    invoke-virtual {p0, p1}, Lyz7;->b(I)V

    :cond_29
    return-void
.end method

.method public final J0()V
    .registers 4

    iget-object v0, p0, Ljh3;->D:Landroidx/appcompat/widget/SearchView;

    if-nez v0, :cond_5

    return-void

    :cond_5
    invoke-virtual {p0}, Ljh3;->H0()Z

    move-result v0

    const v1, 0x7f0a0932

    invoke-virtual {p0, v1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v1

    xor-int/lit8 v2, v0, 0x1

    invoke-interface {v1, v2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v1, 0x7f0a0817

    invoke-virtual {p0, v1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    xor-int/lit8 v0, v0, 0x1

    invoke-interface {p0, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Ljh3;->w:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 7

    check-cast p1, Le83;

    iget-object p1, p1, Le83;->b:Lw3g;

    if-eqz p1, :cond_4a

    iget-object p0, p0, Ljh3;->v:Ld83;

    iget-object p2, p0, Ld83;->f:Ljava/lang/Object;

    check-cast p2, Ljh3;

    invoke-virtual {p2}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    iget-object v1, p0, Ld83;->b:Ljava/lang/Object;

    check-cast v1, La4g;

    if-eqz v1, :cond_4a

    iget-object v1, p0, Ld83;->c:Ljava/util/List;

    if-eqz v1, :cond_4a

    if-eqz v0, :cond_4a

    iget v1, p2, Ljh3;->x:I

    iget-object v2, p1, Lw3g;->c:Ljava/lang/String;

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    invoke-virtual {p2, v1, v2}, Landroidx/fragment/app/Fragment;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v1

    iget v2, p2, Ljh3;->y:I

    invoke-virtual {p2, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p2

    new-instance v2, Lxj;

    const/16 v3, 0x12

    invoke-direct {v2, p0, p1, v3}, Lxj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lhy4;

    invoke-direct {p0, v1, p2, v2}, Lhy4;-><init>(Ljava/lang/String;Ljava/lang/String;Lb27;)V

    const-string p1, "com.opera.android.ui.DIALOG_QUEUE_SERVICE"

    invoke-virtual {v0, p1}, Landroid/content/Context;->getSystemService(Ljava/lang/String;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lz77;

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p1, p0, p2}, Lr22;->b(Ljjm;Lijm;)V

    :cond_4a
    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-object v0, p0, Ljh3;->C:Landroid/view/MenuItem;

    if-eqz v0, :cond_10

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_10

    iget-object p0, p0, Ljh3;->C:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_10
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    iget-object p0, p0, Ljh3;->G:Lyz7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p0, p1, Lxz7;

    xor-int/lit8 p0, p0, 0x1

    return p0
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 5

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0817

    if-ne v0, v1, :cond_24

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p1

    iget-object v0, p0, Ljh3;->z:Lpsp;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v0, Lsk;

    const/4 v1, 0x2

    invoke-direct {v0, p0, v1}, Lsk;-><init>(Ljava/lang/Object;B)V

    const/4 p0, 0x0

    const v1, 0x7f1400a2

    const v2, 0x7f140e9f

    invoke-static {p1, p0, v1, v2, v0}, Lg25;->b(Landroid/content/Context;IIILandroid/content/DialogInterface$OnClickListener;)Lg25;

    const/4 p0, 0x1

    return p0

    :cond_24
    invoke-super {p0, p1}, Li93;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 6

    invoke-super {p0, p1, p2}, Li93;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Ljh3;->F:Ly73;

    iget-object p1, p1, Ly73;->c:Ljava/lang/Object;

    check-cast p1, Lyqa;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object p2

    sget-object v0, Lqcc;->c:Lqcc;

    new-instance v1, Lva2;

    const/16 v2, 0xd

    invoke-direct {v1, p0, v2}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    check-cast p0, Lqdc;

    iget-object p0, p0, Lqdc;->i:Lqcc;

    sget-object v2, Lqcc;->a:Lqcc;

    if-ne p0, v2, :cond_26

    return-void

    :cond_26
    new-instance p0, Ldl5;

    invoke-direct {p0, p2, v1}, Ldl5;-><init>(Lndc;Lva2;)V

    iget-object v1, p0, Ldl5;->a:Lndc;

    invoke-interface {v1}, Lndc;->getLifecycle()Ltcc;

    move-result-object v1

    check-cast v1, Lqdc;

    iget-object v1, v1, Lqdc;->i:Lqcc;

    invoke-virtual {v1, v0}, Lqcc;->d(Lqcc;)Z

    move-result v0

    if-eqz v0, :cond_3f

    invoke-virtual {p1, p0}, Lyqa;->j(Ldl5;)V

    return-void

    :cond_3f
    new-instance v0, Lel5;

    new-instance v1, Liu2;

    const/16 v2, 0x16

    invoke-direct {v1, p1, v2}, Liu2;-><init>(Ljava/lang/Object;B)V

    const/4 p1, 0x0

    invoke-direct {v0, p0, v1, p1}, Lel5;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-interface {p2}, Lndc;->getLifecycle()Ltcc;

    move-result-object p0

    invoke-virtual {p0, v0}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final x0(Litd;)V
    .registers 4

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Ljh3;->C:Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroidx/appcompat/widget/SearchView;

    iput-object p1, p0, Ljh3;->D:Landroidx/appcompat/widget/SearchView;

    const v0, 0x7f140082

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Ljh3;->D:Landroidx/appcompat/widget/SearchView;

    new-instance v0, Leme;

    invoke-direct {v0, p0}, Leme;-><init>(Ljava/lang/Object;)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    iget-object p1, p0, Ljh3;->C:Landroid/view/MenuItem;

    new-instance v0, Lz73;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lz73;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    invoke-virtual {p0}, Ljh3;->J0()V

    return-void
.end method
