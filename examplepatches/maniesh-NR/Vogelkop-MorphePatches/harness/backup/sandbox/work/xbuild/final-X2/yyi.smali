.class public abstract Lyyi;
.super Lltl;
.source "SourceFile"

# interfaces
.implements Lqzi;


# instance fields
.field public final r:Ltzi;

.field public final s:Z

.field public t:Landroid/view/MenuItem;

.field public final u:I

.field public v:Lcom/google/android/material/appbar/CollapsingToolbarLayout;

.field public w:Lkf;


# direct methods
.method public constructor <init>(IIII)V
    .registers 7

    invoke-static {p1}, Lu7k;->j(I)Lu7k;

    move-result-object p1

    iget-object v0, p1, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const/4 v1, 0x1

    iput-boolean v1, v0, Litl;->e:Z

    invoke-virtual {p1, p2}, Lu7k;->s(I)V

    if-nez p3, :cond_13

    const p3, 0x7f100032

    :cond_13
    iput p3, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    new-instance p1, Ltzi;

    invoke-direct {p1}, Ltzi;-><init>()V

    iput-object p1, p0, Lyyi;->r:Ltzi;

    iput-boolean v1, p0, Lyyi;->s:Z

    iput p4, p0, Lyyi;->u:I

    iget-object p2, p1, Ltzi;->c:Lh7f;

    invoke-virtual {p2, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    iget-object p1, p1, Ltzi;->d:Lh7f;

    invoke-virtual {p1, p0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method


# virtual methods
.method public G0()Z
    .registers 1

    const/4 p0, 0x0

    return p0
.end method

.method public H0(Landroid/view/MenuItem;)Z
    .registers 10

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a069c

    const/4 v2, 0x0

    iget-object p0, p0, Lyyi;->r:Ltzi;

    const/4 v3, 0x1

    if-ne v0, v1, :cond_5c

    iget-object p1, p0, Ltzi;->a:Le5d;

    iget-object v0, p0, Ltzi;->e:Lxph;

    if-eqz v0, :cond_5b

    iget-object v0, p1, Le5d;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/LinkedHashSet;

    invoke-virtual {v0}, Ljava/util/AbstractCollection;->size()I

    move-result v0

    iput-boolean v3, p0, Ltzi;->h:Z

    move v1, v2

    :goto_1e
    iget-object v4, p0, Ltzi;->e:Lxph;

    iget-object v4, v4, Lxph;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {v4}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result v4

    if-ge v1, v4, :cond_4c

    iget-object v4, p0, Ltzi;->e:Lxph;

    invoke-virtual {v4, v1}, Lxph;->a(I)Z

    move-result v4

    if-eqz v4, :cond_49

    iget-object v4, p0, Ltzi;->e:Lxph;

    iget-object v4, v4, Lxph;->a:Landroidx/recyclerview/widget/d;

    invoke-virtual {v4, v1}, Landroidx/recyclerview/widget/d;->getItemId(I)J

    move-result-wide v4

    iget-object v6, p1, Le5d;->c:Ljava/lang/Object;

    check-cast v6, Ljava/util/LinkedHashSet;

    invoke-static {v4, v5}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v7

    invoke-virtual {v6, v7}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_49

    invoke-virtual {p1, v4, v5, v3}, Le5d;->c(JZ)V

    :cond_49
    add-int/lit8 v1, v1, 0x1

    goto :goto_1e

    :cond_4c
    iput-boolean v2, p0, Ltzi;->h:Z

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/LinkedHashSet;

    invoke-virtual {p1}, Ljava/util/AbstractCollection;->size()I

    move-result p1

    if-eq v0, p1, :cond_5b

    invoke-virtual {p0}, Ltzi;->a()V

    :cond_5b
    return v3

    :cond_5c
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0692

    if-ne p1, v0, :cond_69

    invoke-virtual {p0}, Ltzi;->d()V

    return v3

    :cond_69
    return v2
.end method

.method public I0()V
    .registers 2

    iget-object v0, p0, Lyyi;->t:Landroid/view/MenuItem;

    if-eqz v0, :cond_b

    invoke-virtual {p0}, Lyyi;->G0()Z

    move-result p0

    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_b
    return-void
.end method

.method public J0(Litd;I)V
    .registers 7

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-lez p2, :cond_6

    move v2, v1

    goto :goto_7

    :cond_6
    move v2, v0

    :goto_7
    const v3, 0x7f0a0697

    invoke-virtual {p1, v3, v2}, Litd;->setGroupVisible(IZ)V

    const v2, 0x7f0a035e

    invoke-virtual {p1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-ne p2, v1, :cond_18

    move v3, v1

    goto :goto_19

    :cond_18
    move v3, v0

    :goto_19
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v2, 0x7f0a02c9

    invoke-virtual {p1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-lez p2, :cond_27

    move v3, v1

    goto :goto_28

    :cond_27
    move v3, v0

    :goto_28
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v2, 0x7f0a069a

    invoke-virtual {p1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v2

    if-lez p2, :cond_36

    move v3, v1

    goto :goto_37

    :cond_36
    move v3, v0

    :goto_37
    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    if-le p2, v1, :cond_47

    const v3, 0x7f140be9

    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_51

    :cond_47
    const v3, 0x7f1404fc

    invoke-virtual {p0, v3}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v3

    invoke-interface {v2, v3}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :goto_51
    const v2, 0x7f0a0699

    invoke-virtual {p1, v2}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    if-lez p2, :cond_5b

    move v0, v1

    :cond_5b
    invoke-interface {p1, v0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    if-le p2, v1, :cond_6b

    const p2, 0x7f140a37

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    return-void

    :cond_6b
    const p2, 0x7f1404fe

    invoke-virtual {p0, p2}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object p0

    invoke-interface {p1, p0}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    return-void
.end method

.method public final W(Z)V
    .registers 6

    if-nez p1, :cond_a

    iget-object p0, p0, Lltl;->m:Lse;

    if-eqz p0, :cond_14

    invoke-virtual {p0}, Lse;->a()V

    return-void

    :cond_a
    new-instance p1, Lrii;

    const/4 v0, 0x2

    invoke-direct {p1, p0, v0}, Lrii;-><init>(Ljava/lang/Object;B)V

    iget-object v0, p0, Lltl;->m:Lse;

    if-eqz v0, :cond_15

    :cond_14
    return-void

    :cond_15
    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v0

    sget v1, Lcom/opera/android/BrowserActivity;->E1:I

    check-cast v0, Lcom/opera/android/BrowserActivity;

    new-instance v1, Livg;

    const/16 v2, 0xa

    const/4 v3, 0x0

    invoke-direct {v1, v2, p0, p1, v3}, Livg;-><init>(BLjava/lang/Object;Ljava/lang/Object;Z)V

    invoke-virtual {v0, v1}, Lfp1;->startSupportActionMode(Lre;)Lse;

    move-result-object p1

    iput-object p1, p0, Lltl;->m:Lse;

    return-void
.end method

.method public onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 3

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a069b

    if-ne p1, v0, :cond_10

    iget-object p0, p0, Lyyi;->r:Ltzi;

    invoke-virtual {p0}, Ltzi;->c()V

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public x0(Litd;)V
    .registers 5

    iget-boolean v0, p0, Lyyi;->s:Z

    if-eqz v0, :cond_1c

    iget-object v0, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v1, Llsk;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v2

    invoke-direct {v1, v2}, Llsk;-><init>(Landroid/content/Context;)V

    invoke-virtual {v0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object v0

    const v2, 0x7f100032

    invoke-virtual {v1, v2, v0}, Llsk;->inflate(ILandroid/view/Menu;)V

    :cond_1c
    const v0, 0x7f0a069b

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p1

    iput-object p1, p0, Lyyi;->t:Landroid/view/MenuItem;

    invoke-virtual {p0}, Lyyi;->I0()V

    return-void
.end method
