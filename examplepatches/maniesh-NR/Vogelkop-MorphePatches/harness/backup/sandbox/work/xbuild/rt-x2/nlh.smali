.class public final Lnlh;
.super Lyyi;
.source "SourceFile"

# interfaces
.implements Ljvk;


# instance fields
.field public A:Z

.field public B:Lb59;

.field public C:I

.field public final D:Lglh;

.field public final E:Lcom/opera/android/settings/SettingsManager;

.field public F:Lblh;

.field public G:Lcom/opera/android/undo/UndoBar;

.field public final H:Lvi7;

.field public final I:Lmvk;

.field public J:Ljava/lang/String;

.field public K:Lxbf;

.field public L:Lyz7;

.field public x:Ly83;

.field public final y:Lv8f;

.field public final z:Lzg7;


# direct methods
.method public constructor <init>(Lglh;Lx5f;Lcom/opera/android/settings/SettingsManager;)V
    .registers 11

    const v0, 0x7f10002c

    const v1, 0x7f10002d

    const v2, 0x7f0d0091

    const v3, 0x7f140d5d

    invoke-direct {p0, v2, v3, v0, v1}, Lyyi;-><init>(IIII)V

    const/4 v0, 0x1

    iput v0, p0, Lnlh;->C:I

    const v0, 0x7f140564

    invoke-static {v0}, Lnvk;->v(I)Lmvk;

    move-result-object v0

    iput-object v0, p0, Lnlh;->I:Lmvk;

    iput-object p1, p0, Lnlh;->D:Lglh;

    iput-object p3, p0, Lnlh;->E:Lcom/opera/android/settings/SettingsManager;

    new-instance p3, Lv8f;

    invoke-direct {p3, p1}, Lv8f;-><init>(Lglh;)V

    iput-object p3, p0, Lnlh;->y:Lv8f;

    new-instance p1, Lzg7;

    invoke-direct {p1, p3, p2}, Lzg7;-><init>(Lv8f;Lx5f;)V

    iput-object p1, p0, Lnlh;->z:Lzg7;

    new-instance v0, Lvi7;

    sget-object v1, Lvml;->d:Lumi;

    const/4 v5, 0x0

    const/4 v6, 0x0

    const/4 v2, 0x0

    const/4 v3, 0x0

    const/4 v4, 0x0

    invoke-direct/range {v0 .. v6}, Lvi7;-><init>(Lumi;IZILns8;Z)V

    iput-object v0, p0, Lnlh;->H:Lvi7;

    const/4 p0, 0x0

    iput-boolean p0, v0, Lvi7;->t:Z

    return-void
.end method


# virtual methods
.method public final G0()Z
    .registers 2

    iget-object v0, p0, Lnlh;->z:Lzg7;

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

.method public final H0(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a02c9

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_4c

    iget-object p1, p0, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    iget-object p0, p0, Lnlh;->F:Lblh;

    invoke-virtual {p0}, Lblh;->G()Ljava/util/ArrayList;

    move-result-object p0

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    invoke-virtual {p0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_21

    return v3

    :cond_21
    iput-boolean v3, p1, Lcom/opera/android/undo/UndoBar;->g:Z

    iget-object v1, p1, Lcom/opera/android/undo/UndoBar;->e:Lkkm;

    invoke-interface {v1, p0}, Lkkm;->N(Ljava/util/List;)Le5d;

    move-result-object p0

    iget-object v1, p0, Le5d;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_49

    iget-object v1, p1, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v1, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v1, Lmhk;

    new-instance v4, Lmkm;

    invoke-direct {v4, p0, v0}, Lmkm;-><init>(Le5d;I)V

    invoke-virtual {v1, v4}, Lmhk;->g(Lmkm;)V

    invoke-virtual {p1}, Lcom/opera/android/undo/UndoBar;->f()V

    iget-object p0, p1, Lcom/opera/android/undo/UndoBar;->b:Lami;

    invoke-virtual {p0}, Lami;->u()V

    :cond_49
    iput-boolean v2, p1, Lcom/opera/android/undo/UndoBar;->g:Z

    return v3

    :cond_4c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a035e

    iget-object v4, p0, Lyyi;->r:Ltzi;

    if-ne v0, v1, :cond_7f

    iget-object p1, p0, Lnlh;->F:Lblh;

    invoke-virtual {p1}, Lblh;->G()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lilh;

    invoke-virtual {v4}, Ltzi;->d()V

    new-instance v0, Lf9c;

    new-instance v1, Leof;

    const/16 v2, 0xb

    invoke-direct {v1, p0, p1, v2}, Leof;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, p1, v1}, Lf9c;-><init>(Lilh;Leof;)V

    const/4 p1, -0x1

    invoke-static {v0, p1}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object p0

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return v3

    :cond_7f
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a069a

    if-ne v0, v1, :cond_95

    iget-object p1, p0, Lnlh;->F:Lblh;

    invoke-virtual {p1}, Lblh;->G()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1, v3, v2, v3}, Lnlh;->K0(Ljava/util/List;ZZZ)V

    invoke-virtual {v4}, Ltzi;->d()V

    return v3

    :cond_95
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0699

    if-ne v0, v1, :cond_ab

    iget-object p1, p0, Lnlh;->F:Lblh;

    invoke-virtual {p1}, Lblh;->G()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1, v3, v3, v3}, Lnlh;->K0(Ljava/util/List;ZZZ)V

    invoke-virtual {v4}, Ltzi;->d()V

    return v3

    :cond_ab
    invoke-super {p0, p1}, Lyyi;->H0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final K0(Ljava/util/List;ZZZ)V
    .registers 12

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9f

    const/4 v0, 0x0

    const/4 v1, 0x0

    const/4 v2, 0x1

    if-eqz p4, :cond_a0

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p4

    iget-object v3, p0, Lnlh;->D:Lglh;

    if-ne p4, v2, :cond_77

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Lilh;

    iget-wide v4, p4, Lilh;->a:J

    iget-object p4, v3, Lglh;->g:Ljava/util/HashSet;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v3

    invoke-virtual {p4, v3}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result p4

    if-eqz p4, :cond_a0

    invoke-interface {p1, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lilh;

    new-instance p4, Lrxh;

    const v3, 0x7f140609

    invoke-direct {p4, v3}, Lrxh;-><init>(I)V

    new-instance v3, Loid;

    invoke-direct {v3, p0, p1, p2, p3}, Loid;-><init>(Ljava/lang/Object;Ljava/lang/Object;ZZ)V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->requireActivity()Landroidx/fragment/app/r;

    move-result-object p0

    invoke-static {p0}, Lsfe;->U(Landroid/content/Context;)Lz77;

    move-result-object p0

    new-instance p1, Lgkj;

    invoke-direct {p1, v1, v1}, Lnz0;-><init>(ZZ)V

    iput-object v0, p1, Lgkj;->a:Ljava/lang/String;

    iput-object v0, p1, Lgkj;->b:Ljava/lang/String;

    iput-object v0, p1, Lgkj;->c:Ljava/lang/String;

    iput-object v0, p1, Lgkj;->d:Ljava/lang/CharSequence;

    iput-object v0, p1, Lgkj;->e:Lekj;

    iput-object v0, p1, Lgkj;->f:Lfkj;

    iput-object v0, p1, Lgkj;->g:Lqp2;

    iput-object v3, p1, Lgkj;->h:Ldkj;

    iput-object v0, p1, Lgkj;->i:Ldkj;

    iput-object v0, p1, Lgkj;->j:Lql;

    const p2, 0x7f140608

    iput p2, p1, Lgkj;->k:I

    const p2, 0x7f1403bf

    iput p2, p1, Lgkj;->l:I

    const p2, 0x7f14060a

    iput p2, p1, Lgkj;->m:I

    iput-boolean v2, p1, Lgkj;->n:Z

    iput-object p4, p1, Lgkj;->o:Lpxh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p2, Lijm;->b:Lijm;

    invoke-virtual {p0, p1, p2}, Lr22;->b(Ljjm;Lijm;)V

    return-void

    :cond_77
    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p4

    :cond_7b
    :goto_7b
    invoke-interface {p4}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_99

    invoke-interface {p4}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lilh;

    iget-wide v4, v4, Lilh;->a:J

    iget-object v6, v3, Lglh;->g:Ljava/util/HashSet;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v4

    invoke-virtual {v6, v4}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_7b

    invoke-interface {p4}, Ljava/util/Iterator;->remove()V

    goto :goto_7b

    :cond_99
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result p4

    if-eqz p4, :cond_a0

    :cond_9f
    return-void

    :cond_a0
    move p4, v1

    :goto_a1
    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v3

    if-ge p4, v3, :cond_d7

    invoke-interface {p1, p4}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lilh;

    iget-boolean v4, v3, Lilh;->g:Z

    sget-object v5, Llqm;->m:Llqm;

    if-nez v4, :cond_c4

    iget-boolean v4, v3, Lilh;->h:Z

    if-nez v4, :cond_c4

    iget-object v3, v3, Lilh;->b:Ljava/lang/String;

    if-nez p4, :cond_c0

    invoke-static {v3, v5, v1}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    goto :goto_d4

    :cond_c0
    invoke-virtual {v0, v3, v1}, Lvx3;->b(Ljava/lang/String;Z)V

    goto :goto_d4

    :cond_c4
    iget-object v4, p0, Lnlh;->J:Ljava/lang/String;

    invoke-static {v3, v4}, Lolh;->b(Lilh;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    if-nez p4, :cond_d1

    invoke-static {v3, v5, v2}, Lay3;->a(Ljava/lang/String;Llqm;Z)Lvx3;

    move-result-object v0

    goto :goto_d4

    :cond_d1
    invoke-virtual {v0, v3, v2}, Lvx3;->b(Ljava/lang/String;Z)V

    :goto_d4
    add-int/lit8 p4, p4, 0x1

    goto :goto_a1

    :cond_d7
    iget-object p0, p0, Lnlh;->E:Lcom/opera/android/settings/SettingsManager;

    invoke-virtual {p0}, Lcom/opera/android/settings/SettingsManager;->C()Lq7j;

    move-result-object p0

    sget-object p1, Lq7j;->c:Lq7j;

    if-ne p0, p1, :cond_e3

    move p0, v2

    goto :goto_e4

    :cond_e3
    move p0, v1

    :goto_e4
    if-eqz p2, :cond_e8

    if-eqz p0, :cond_e9

    :cond_e8
    move v1, v2

    :cond_e9
    invoke-virtual {v0, v1}, Lvx3;->a(Z)V

    invoke-virtual {v0, p2}, Lvx3;->d(Z)V

    xor-int/lit8 p0, p2, 0x1

    iput-boolean p0, v0, Lvx3;->f:Z

    invoke-virtual {v0, p2}, Lvx3;->c(Z)V

    invoke-virtual {v0, p3}, Lvx3;->e(Z)V

    new-instance p0, Lay3;

    invoke-direct {p0, v0}, Lay3;-><init>(Lvx3;)V

    invoke-static {p0}, Lac8;->a(Ljava/lang/Object;)V

    return-void
.end method

.method public final L0(Ljava/util/ArrayList;)V
    .registers 3

    const-string v0, ","

    invoke-static {v0, p1}, Landroid/text/TextUtils;->join(Ljava/lang/CharSequence;Ljava/lang/Iterable;)Ljava/lang/String;

    move-result-object p1

    iget-object p0, p0, Lnlh;->B:Lb59;

    invoke-virtual {p0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/content/SharedPreferences;

    const-string v0, "item_order"

    invoke-static {p0, v0, p1}, Lcom/appsflyer/internal/j;->c(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/lang/String;)V

    return-void
.end method

.method public final h(Landroidx/recyclerview/widget/i;[Lhvk;)V
    .registers 3

    const/4 p1, 0x1

    iget-object p0, p0, Lnlh;->I:Lmvk;

    aput-object p0, p2, p1

    const/4 p1, 0x0

    aput-object p0, p2, p1

    return-void
.end method

.method public final k(Landroidx/recyclerview/widget/i;Lhvk;)V
    .registers 3

    iget-object p2, p0, Lnlh;->F:Lblh;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getAdapterPosition()I

    move-result p1

    iget-object p2, p2, Lblh;->e:Lxvj;

    invoke-virtual {p2, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lwkh;

    iget-object p1, p1, Lwkh;->a:Lilh;

    iget-object p0, p0, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    return-void
.end method

.method public final l0(Z)V
    .registers 3

    iget-object v0, p0, Lnlh;->z:Lzg7;

    invoke-virtual {v0}, Loy;->c()Z

    move-result v0

    if-eqz v0, :cond_9

    return-void

    :cond_9
    invoke-super {p0, p1}, Lk24;->l0(Z)V

    return-void
.end method

.method public final n(Landroidx/recyclerview/widget/i;)Z
    .registers 2

    iget-object p0, p0, Lnlh;->L:Lyz7;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    instance-of p0, p1, Lxz7;

    if-eqz p0, :cond_b

    const/4 p0, 0x0

    return p0

    :cond_b
    const/4 p0, 0x1

    return p0
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 5

    invoke-super {p0, p1}, Lk24;->onAttach(Landroid/content/Context;)V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v1, 0x0

    new-array v1, v1, [Lbg1;

    const-string v2, "readinglist"

    invoke-static {p1, v0, v2, v1}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object p1

    iput-object p1, p0, Lnlh;->B:Lb59;

    return-void
.end method

.method public final onDestroyView()V
    .registers 3

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object v0, p0, Lnlh;->z:Lzg7;

    const/4 v1, 0x0

    invoke-virtual {v0, v1}, Loy;->i(Lj1c;)V

    iget-object v0, p0, Lnlh;->y:Lv8f;

    iget-object v1, p0, Lnlh;->D:Lglh;

    iget-object v1, v1, Lglh;->b:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->c(Ljava/lang/Object;)Z

    iget-object p0, p0, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 7

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a06a3

    const/4 v2, 0x1

    if-ne v0, v1, :cond_26

    new-instance v0, Lsm3;

    iget v1, p0, Lnlh;->C:I

    new-instance v3, Lr9g;

    const/16 v4, 0x12

    invoke-direct {v3, p0, v4}, Lr9g;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v3, v2}, Lsm3;-><init>(ILjava/lang/Object;B)V

    iget-object p0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-virtual {v0, p0}, Lo73;->p(Landroid/view/View;)V

    return v2

    :cond_26
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0790

    if-ne v0, v1, :cond_3a

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object p0

    check-cast p0, Ldx3;

    const/4 p1, 0x0

    invoke-static {p0, p1}, Lolh;->d(Ldx3;Z)V

    return v2

    :cond_3a
    invoke-super {p0, p1}, Lyyi;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final onPause()V
    .registers 3

    invoke-super {p0}, Lltl;->onPause()V

    iget-object v0, p0, Lnlh;->K:Lxbf;

    if-eqz v0, :cond_c

    const/4 v1, 0x0

    iput-object v1, v0, Lxbf;->g:Ljava/lang/Object;

    iput-object v1, p0, Lnlh;->K:Lxbf;

    :cond_c
    return-void
.end method

.method public final onResume()V
    .registers 8

    invoke-super {p0}, Lltl;->onResume()V

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    sget-object v1, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v0}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    new-instance v1, Lxbf;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v2

    sget-object v3, Lvml;->d:Lumi;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->H()Lglh;

    move-result-object v5

    new-instance v6, Lpjg;

    const/16 v0, 0x11

    invoke-direct {v6, p0, v0}, Lpjg;-><init>(Ljava/lang/Object;B)V

    iget-object v4, p0, Lnlh;->E:Lcom/opera/android/settings/SettingsManager;

    invoke-direct/range {v1 .. v6}, Lxbf;-><init>(Landroid/content/Context;Lumi;Lcom/opera/android/settings/SettingsManager;Lglh;Lpjg;)V

    iput-object v1, p0, Lnlh;->K:Lxbf;

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 25

    move-object/from16 v4, p0

    const v0, 0x7f0a02a9

    move-object/from16 v1, p2

    invoke-virtual {v1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v0

    invoke-static {v0}, Ly83;->a(Landroid/view/View;)Ly83;

    move-result-object v0

    iput-object v0, v4, Lnlh;->x:Ly83;

    iget-object v0, v0, Ly83;->h:Ljava/lang/Object;

    check-cast v0, Lcom/google/android/material/progressindicator/CircularProgressIndicator;

    const/16 v1, 0x8

    invoke-virtual {v0, v1}, Landroid/view/View;->setVisibility(I)V

    iget-object v0, v4, Lnlh;->x:Ly83;

    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    move-object v8, v0

    check-cast v8, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v5, v4, Lnlh;->H:Lvi7;

    iget-object v0, v5, Lvi7;->g:Lflb;

    invoke-virtual {v0, v8}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object v0, v4, Lnlh;->B:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "sort_order"

    const/4 v14, 0x0

    invoke-interface {v0, v1, v14}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v15, 0x4

    invoke-static {v15}, Lvep;->B(I)[I

    move-result-object v1

    array-length v2, v1

    move v3, v14

    :goto_3e
    const/4 v9, 0x1

    if-ge v3, v2, :cond_4c

    aget v6, v1, v3

    invoke-static {v6}, Lfki;->j(I)B

    move-result v7

    if-eq v7, v0, :cond_4d

    add-int/lit8 v3, v3, 0x1

    goto :goto_3e

    :cond_4c
    move v6, v9

    :cond_4d
    iput v6, v4, Lnlh;->C:I

    new-instance v0, Lblh;

    new-instance v7, Ljava/util/ArrayList;

    invoke-direct {v7}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, v4, Lnlh;->B:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "item_order"

    const-string v3, ""

    invoke-interface {v1, v2, v3}, Landroid/content/SharedPreferences;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v1}, Ljava/lang/String;->isEmpty()Z

    move-result v2

    if-nez v2, :cond_82

    const-string v2, ","

    invoke-virtual {v1, v2}, Ljava/lang/String;->split(Ljava/lang/String;)[Ljava/lang/String;

    move-result-object v1

    array-length v2, v1

    move v3, v14

    :goto_74
    if-ge v3, v2, :cond_82

    aget-object v10, v1, v3

    :try_start_78
    invoke-static {v10}, Ljava/lang/Long;->valueOf(Ljava/lang/String;)Ljava/lang/Long;

    move-result-object v10

    invoke-virtual {v7, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
    :try_end_7f
    .catch Ljava/lang/NumberFormatException; {:try_start_78 .. :try_end_7f} :catch_7f

    :catch_7f
    add-int/lit8 v3, v3, 0x1

    goto :goto_74

    :cond_82
    iget-object v1, v4, Lnlh;->D:Lglh;

    iget-object v2, v4, Lnlh;->z:Lzg7;

    iget-object v3, v4, Lyyi;->r:Ltzi;

    invoke-direct/range {v0 .. v7}, Lblh;-><init>(Lglh;Lzg7;Ltzi;Lnlh;Lvi7;ILjava/util/ArrayList;)V

    iput-object v0, v4, Lnlh;->F:Lblh;

    move v1, v9

    new-instance v9, Lyz7;

    const v13, 0x7f13002d

    const/4 v11, 0x2

    const v12, 0x7f140bb7

    move-object v10, v0

    invoke-direct/range {v9 .. v14}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;IIII)V

    iput-object v9, v4, Lnlh;->L:Lyz7;

    new-instance v0, Lmlh;

    iget-object v2, v4, Lnlh;->F:Lblh;

    const/4 v3, 0x0

    invoke-direct {v0, v2, v3}, Lmlh;-><init>(Landroidx/recyclerview/widget/d;B)V

    iget-object v2, v4, Lyyi;->r:Ltzi;

    invoke-virtual {v2, v0}, Ltzi;->b(Lxph;)V

    new-instance v16, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v17

    iget-object v0, v4, Lltl;->n:Lqm9;

    iget-object v2, v4, Lnlh;->F:Lblh;

    const/16 v21, 0x1

    move-object/from16 v20, v2

    move-object/from16 v18, v0

    move-object/from16 v19, v2

    invoke-direct/range {v16 .. v21}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    move-object/from16 v0, v16

    iput-object v0, v4, Lnlh;->G:Lcom/opera/android/undo/UndoBar;

    const v2, 0x7f120052

    invoke-virtual {v0, v2}, Lcom/opera/android/undo/UndoBar;->e(I)V

    new-instance v0, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {v0, v1, v14}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    invoke-virtual {v8, v0}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    new-instance v0, Lnvk;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    invoke-direct {v0, v2, v4}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance v2, Lflb;

    invoke-direct {v2, v0}, Lflb;-><init>(Lblb;)V

    invoke-virtual {v2, v8}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iget-object v0, v4, Lnlh;->y:Lv8f;

    iget-object v2, v4, Lnlh;->D:Lglh;

    iget-object v2, v2, Lglh;->b:Lh7f;

    invoke-virtual {v2, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object v0, v4, Lnlh;->z:Lzg7;

    iget-object v2, v0, Loy;->f:Ljava/lang/Object;

    check-cast v2, Lh42;

    invoke-virtual {v4}, Landroidx/fragment/app/Fragment;->getViewLifecycleOwner()Lndc;

    move-result-object v3

    new-instance v5, Lwj;

    invoke-direct {v5, v4, v8, v15}, Lwj;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-virtual {v2, v3, v5}, Lekc;->j(Lndc;Lf7f;)V

    const v2, 0x7f140bb4

    invoke-virtual {v4, v2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v2

    iput-object v2, v4, Lnlh;->J:Ljava/lang/String;

    const v2, 0x7f0a0932

    invoke-virtual {v4, v2}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v2

    iget-object v3, v4, Lnlh;->x:Ly83;

    iget-object v3, v3, Ly83;->f:Ljava/lang/Object;

    check-cast v3, Lcom/opera/android/custom_views/FadingRecyclerView;

    const v5, 0x7f140082

    invoke-virtual {v0, v2, v3, v5, v1}, Loy;->j(Landroid/view/MenuItem;Landroidx/recyclerview/widget/RecyclerView;II)V

    new-instance v6, Lj1c;

    iget-object v7, v4, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    iget-object v1, v4, Lnlh;->x:Ly83;

    iget-object v2, v1, Ly83;->c:Ljava/lang/Object;

    move-object v8, v2

    check-cast v8, Lcom/opera/android/StatusBarDrawerAppBarLayout;

    iget-object v2, v1, Ly83;->g:Ljava/lang/Object;

    move-object v9, v2

    check-cast v9, Landroid/view/View;

    iget-object v1, v1, Ly83;->f:Ljava/lang/Object;

    move-object v10, v1

    check-cast v10, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v12, v4, Lnlh;->L:Lyz7;

    move-object v11, v10

    invoke-direct/range {v6 .. v12}, Lj1c;-><init>(Landroidx/appcompat/widget/Toolbar;Lcom/google/android/material/appbar/AppBarLayout;Landroid/view/View;Landroidx/recyclerview/widget/RecyclerView;Landroid/view/View;Lyz7;)V

    invoke-virtual {v0, v6}, Loy;->i(Lj1c;)V

    return-void
.end method

.method public final z0()V
    .registers 2

    iget-object v0, p0, Lnlh;->x:Ly83;

    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
