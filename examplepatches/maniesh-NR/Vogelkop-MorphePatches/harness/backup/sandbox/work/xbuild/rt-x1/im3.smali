.class public final Lim3;
.super Lyyi;
.source "SourceFile"

# interfaces
.implements Lon9;


# instance fields
.field public final A:Lgm3;

.field public final B:Lpm3;

.field public final C:Lhxk;

.field public final D:Lgjm;

.field public final E:Lua7;

.field public final F:Lrn9;

.field public G:Landroid/view/MenuItem;

.field public H:Lcom/opera/android/custom_views/ActionBarSearchView;

.field public I:Ly83;

.field public J:Lzwk;

.field public K:Lcq5;

.field public L:Lxw;

.field public x:Lgn3;

.field public y:I

.field public z:Lb59;


# direct methods
.method public constructor <init>(Lpm3;Lhxk;Lgjm;)V
    .registers 8

    const v0, 0x7f100028

    const v1, 0x7f100029

    const v2, 0x7f0d0091

    const v3, 0x7f140d5a

    invoke-direct {p0, v2, v3, v0, v1}, Lyyi;-><init>(IIII)V

    new-instance v0, Lgm3;

    invoke-direct {v0, p0}, Lgm3;-><init>(Lim3;)V

    iput-object v0, p0, Lim3;->A:Lgm3;

    new-instance v0, Lrn9;

    const/4 v1, 0x0

    invoke-direct {v0, p0, p0, v1}, Lrn9;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iput-object v0, p0, Lim3;->F:Lrn9;

    iput-object p1, p0, Lim3;->B:Lpm3;

    iput-object p2, p0, Lim3;->C:Lhxk;

    iput-object p3, p0, Lim3;->D:Lgjm;

    new-instance p1, Lua7;

    invoke-direct {p1, p0, p3}, Lua7;-><init>(Landroidx/fragment/app/Fragment;Lgjm;)V

    iput-object p1, p0, Lim3;->E:Lua7;

    return-void
.end method


# virtual methods
.method public final G0()Z
    .registers 2

    iget-object v0, p0, Lim3;->x:Lgn3;

    iget-boolean v0, v0, Lgn3;->I:Z

    if-nez v0, :cond_e

    iget-object p0, p0, Lyyi;->r:Ltzi;

    iget p0, p0, Ltzi;->f:I

    if-lez p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final H()Lqe6;
    .registers 1

    iget-object p0, p0, Lltl;->j:Lqe6;

    return-object p0
.end method

.method public final H0(Landroid/view/MenuItem;)Z
    .registers 14

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0169

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-eq v0, v1, :cond_59

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a016c

    if-eq v0, v1, :cond_59

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0167

    if-ne v0, v1, :cond_27

    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0}, Lgn3;->c()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lgn3;->p(Ljava/util/List;)V

    return v3

    :cond_27
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a016f

    if-ne v0, v1, :cond_3d

    iget-object p1, p0, Lim3;->x:Lgn3;

    invoke-virtual {p1, v2}, Lgn3;->t(Z)V

    iget-object p0, p0, Lltl;->m:Lse;

    if-eqz p0, :cond_4f

    invoke-virtual {p0}, Lse;->a()V

    return v3

    :cond_3d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0170

    if-ne v0, v1, :cond_54

    iget-object p1, p0, Lim3;->x:Lgn3;

    invoke-virtual {p1, v3}, Lgn3;->t(Z)V

    iget-object p0, p0, Lltl;->m:Lse;

    if-nez p0, :cond_50

    :cond_4f
    return v3

    :cond_50
    invoke-virtual {p0}, Lse;->a()V

    return v3

    :cond_54
    invoke-super {p0, p1}, Lyyi;->H0(Landroid/view/MenuItem;)Z

    move-result p0

    return p0

    :cond_59
    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0}, Lgn3;->c()Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-le v0, v3, :cond_a1

    new-instance v0, Lfl3;

    iget-object v1, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    new-instance v4, Lwx;

    const/16 v5, 0x13

    invoke-direct {v4, p0, p1, v5}, Lwx;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v4}, Lfl3;-><init>(Li53;Lcom/opera/api/Callback;)V

    invoke-static {p1}, Lalo;->j(Ljava/util/ArrayList;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0}, Lgn3;->a()Lml3;

    move-result-object v1

    invoke-static {p1, v1, v2}, Lfl3;->G0(Ljava/util/List;Lml3;I)Landroid/os/Bundle;

    move-result-object p1

    invoke-virtual {v0, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    new-array p1, v2, [Ln6h;

    new-instance v5, Lwzg;

    const-class v1, Lfl3;

    const/4 v2, 0x4

    invoke-direct {v5, v0, v1, v2}, Lwzg;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object v0, p0, Lgn3;->p:Landroidx/fragment/app/r;

    new-instance v4, Lzhj;

    const/4 v9, 0x0

    invoke-static {p1}, Ljava/util/Arrays;->asList([Ljava/lang/Object;)Ljava/util/List;

    move-result-object v11

    const/4 v6, 0x0

    const/4 v7, 0x2

    const/16 v8, 0x1001

    const/4 v10, 0x0

    invoke-direct/range {v4 .. v11}, Lzhj;-><init>(Lwzg;Landroid/os/Bundle;IILjava/lang/String;ZLjava/util/List;)V

    invoke-virtual {v4, v0}, Lzhj;->c(Landroid/content/Context;)V

    goto :goto_ac

    :cond_a1
    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lqhc;

    iget-object p1, p1, Lqhc;->a:Lal3;

    invoke-virtual {p0, p1}, Lgn3;->r(Lal3;)V

    :goto_ac
    iget-object p0, p0, Lgn3;->u:Ltzi;

    invoke-virtual {p0}, Ltzi;->d()V

    return v3
.end method

.method public final I0()V
    .registers 3

    const v0, 0x7f0a0171

    invoke-virtual {p0}, Lim3;->G0()Z

    move-result v1

    invoke-virtual {p0, v0, v1}, Lim3;->O0(IZ)V

    return-void
.end method

.method public final J0(Litd;I)V
    .registers 11

    iget-object v0, p0, Lim3;->x:Lgn3;

    invoke-virtual {v0}, Lgn3;->c()Ljava/util/ArrayList;

    move-result-object v0

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    move v3, v2

    :cond_c
    const/4 v4, 0x1

    if-ge v3, v1, :cond_1d

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v3, v3, 0x1

    check-cast v5, Lqhc;

    iget v5, v5, Lqhc;->b:I

    if-eq v5, v4, :cond_c

    move v0, v2

    goto :goto_1e

    :cond_1d
    move v0, v4

    :goto_1e
    iget-object v1, p0, Lim3;->x:Lgn3;

    invoke-virtual {v1}, Lgn3;->c()Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v3

    move v5, v2

    :cond_29
    if-ge v5, v3, :cond_43

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Lqhc;

    iget-object v6, v6, Lqhc;->a:Lal3;

    new-instance v7, Ll5b;

    invoke-direct {v7, v4}, Ll5b;-><init>(B)V

    invoke-interface {v6, v7}, Lal3;->c(Lzk3;)Z

    iget-boolean v6, v7, Ll5b;->b:Z

    if-eqz v6, :cond_29

    move v1, v4

    goto :goto_44

    :cond_43
    move v1, v2

    :goto_44
    move v3, v2

    :goto_45
    iget-object v5, p1, Litd;->f:Ljava/util/ArrayList;

    invoke-virtual {v5}, Ljava/util/ArrayList;->size()I

    move-result v5

    if-ge v3, v5, :cond_c4

    invoke-virtual {p1, v3}, Litd;->getItem(I)Landroid/view/MenuItem;

    move-result-object v5

    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a0169

    if-ne v6, v7, :cond_5f

    if-eqz v0, :cond_7a

    if-ne p2, v4, :cond_7a

    goto :goto_78

    :cond_5f
    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a016c

    if-ne v6, v7, :cond_6d

    if-eqz v0, :cond_7a

    if-le p2, v4, :cond_7a

    goto :goto_78

    :cond_6d
    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a0167

    if-ne v6, v7, :cond_7c

    if-lez p2, :cond_7a

    :goto_78
    move v6, v4

    goto :goto_be

    :cond_7a
    move v6, v2

    goto :goto_be

    :cond_7c
    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a016f

    if-ne v6, v7, :cond_9d

    if-le p2, v4, :cond_92

    const v6, 0x7f140be9

    invoke-virtual {p0, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_bd

    :cond_92
    const v6, 0x7f1404fc

    invoke-virtual {p0, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_bd

    :cond_9d
    invoke-interface {v5}, Landroid/view/MenuItem;->getItemId()I

    move-result v6

    const v7, 0x7f0a0170

    if-ne v6, v7, :cond_c1

    if-le p2, v4, :cond_b3

    const v6, 0x7f140a37

    invoke-virtual {p0, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    goto :goto_bd

    :cond_b3
    const v6, 0x7f1404fe

    invoke-virtual {p0, v6}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v6

    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setTitle(Ljava/lang/CharSequence;)Landroid/view/MenuItem;

    :goto_bd
    move v6, v1

    :goto_be
    invoke-interface {v5, v6}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_c1
    add-int/lit8 v3, v3, 0x1

    goto :goto_45

    :cond_c4
    return-void
.end method

.method public final K0()V
    .registers 2

    iget-object v0, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-static {v0}, Lq9n;->u(Landroid/view/View;)Z

    iget-object v0, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->clearFocus()V

    iget-object v0, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {v0}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object v0, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-virtual {v0}, Landroidx/appcompat/widget/SearchView;->getQuery()Ljava/lang/CharSequence;

    move-result-object v0

    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    move-result v0

    if-eqz v0, :cond_23

    iget-object p0, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_23
    return-void
.end method

.method public final L0()I
    .registers 7

    iget v0, p0, Lim3;->y:I

    if-nez v0, :cond_2b

    iget-object v0, p0, Lim3;->z:Lb59;

    invoke-virtual {v0}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Landroid/content/SharedPreferences;

    const-string v1, "bookmarks_sort_order"

    const/4 v2, 0x1

    invoke-interface {v0, v1, v2}, Landroid/content/SharedPreferences;->getInt(Ljava/lang/String;I)I

    move-result v0

    const/4 v1, 0x6

    invoke-static {v1}, Lvep;->B(I)[I

    move-result-object v1

    array-length v2, v1

    const/4 v3, 0x0

    :goto_1a
    if-ge v3, v2, :cond_27

    aget v4, v1, v3

    invoke-static {v4}, Lfki;->i(I)I

    move-result v5

    if-eq v5, v0, :cond_28

    add-int/lit8 v3, v3, 0x1

    goto :goto_1a

    :cond_27
    const/4 v4, 0x3

    :cond_28
    iput v4, p0, Lim3;->y:I

    return v4

    :cond_2b
    return v0
.end method

.method public final M0(I)Z
    .registers 2

    invoke-virtual {p0, p1}, Lim3;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_e

    invoke-interface {p0}, Landroid/view/MenuItem;->isVisible()Z

    move-result p0

    if-eqz p0, :cond_e

    const/4 p0, 0x1

    return p0

    :cond_e
    const/4 p0, 0x0

    return p0
.end method

.method public final N0()V
    .registers 4

    invoke-virtual {p0}, Lim3;->I0()V

    iget-object v0, p0, Lim3;->x:Lgn3;

    iget-object v0, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->d()Z

    move-result v0

    const/4 v1, 0x1

    xor-int/2addr v0, v1

    const v2, 0x7f0a0172

    invoke-virtual {p0, v2, v0}, Lim3;->O0(IZ)V

    invoke-virtual {p0}, Lim3;->Q0()V

    invoke-virtual {p0}, Lim3;->R0()V

    const v0, 0x7f0a016b

    invoke-virtual {p0, v0}, Lim3;->M0(I)Z

    move-result v0

    const v2, 0x7f0a016a

    invoke-virtual {p0, v2}, Lim3;->M0(I)Z

    move-result v2

    if-nez v0, :cond_2c

    if-nez v2, :cond_2c

    const/4 v1, 0x0

    :cond_2c
    const v0, 0x7f0a0165

    invoke-virtual {p0, v0, v1}, Lim3;->O0(IZ)V

    return-void
.end method

.method public final O0(IZ)V
    .registers 3

    invoke-virtual {p0, p1}, Lim3;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz p0, :cond_9

    invoke-interface {p0, p2}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_9
    return-void
.end method

.method public final P0(Lml3;)V
    .registers 4

    const v0, 0x7f0a0694

    invoke-virtual {p0, v0}, Lim3;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    const v1, 0x7f0a0691

    invoke-virtual {p0, v1}, Lim3;->r0(I)Landroid/view/MenuItem;

    move-result-object p0

    if-eqz v0, :cond_35

    if-eqz p0, :cond_35

    if-eqz p1, :cond_2e

    invoke-interface {p1}, Lml3;->h()Z

    move-result v1

    if-nez v1, :cond_2e

    invoke-static {p1}, Lalo;->S(Lml3;)Z

    move-result v1

    if-nez v1, :cond_2e

    invoke-static {p1}, Lalo;->T(Lml3;)Z

    move-result p1

    if-nez p1, :cond_2e

    const/4 p1, 0x1

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void

    :cond_2e
    const/4 p1, 0x0

    invoke-interface {v0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    invoke-interface {p0, p1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    :cond_35
    return-void
.end method

.method public final Q0()V
    .registers 3

    iget-object v0, p0, Lim3;->K:Lcq5;

    invoke-virtual {v0}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lf8f;

    invoke-virtual {v0}, Lf8f;->f()Z

    move-result v0

    if-nez v0, :cond_1a

    iget-object v0, p0, Lim3;->x:Lgn3;

    iget-object v0, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->d()Z

    move-result v0

    if-nez v0, :cond_1a

    const/4 v0, 0x1

    goto :goto_1b

    :cond_1a
    const/4 v0, 0x0

    :goto_1b
    const v1, 0x7f0a016a

    invoke-virtual {p0, v1, v0}, Lim3;->O0(IZ)V

    return-void
.end method

.method public final R0()V
    .registers 5

    const v0, 0x7f0a0171

    invoke-virtual {p0, v0}, Lim3;->M0(I)Z

    move-result v0

    const v1, 0x7f0a0694

    invoke-virtual {p0, v1}, Lim3;->M0(I)Z

    move-result v1

    const v2, 0x7f0a0691

    invoke-virtual {p0, v2}, Lim3;->M0(I)Z

    move-result v2

    const v3, 0x7f0a0172

    invoke-virtual {p0, v3}, Lim3;->M0(I)Z

    move-result v3

    if-nez v0, :cond_26

    if-nez v1, :cond_26

    if-nez v2, :cond_26

    if-nez v3, :cond_26

    const/4 v0, 0x0

    goto :goto_27

    :cond_26
    const/4 v0, 0x1

    :goto_27
    const v1, 0x7f0a0164

    invoke-virtual {p0, v1, v0}, Lim3;->O0(IZ)V

    return-void
.end method

.method public final a()Loba;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final l0(Z)V
    .registers 2

    iget-object p1, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->isActionViewExpanded()Z

    move-result p1

    if-eqz p1, :cond_e

    iget-object p0, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    return-void

    :cond_e
    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0}, Lgn3;->d()V

    return-void
.end method

.method public final onAttach(Landroid/content/Context;)V
    .registers 17

    invoke-super/range {p0 .. p1}, Lk24;->onAttach(Landroid/content/Context;)V

    sget-object v0, Lvml;->d:Lumi;

    const/4 v2, 0x0

    new-array v2, v2, [Lbg1;

    const-string v3, "bookmarks"

    move-object/from16 v4, p1

    invoke-static {v4, v0, v3, v2}, Lw1h;->l(Landroid/content/Context;Ltcl;Ljava/lang/String;[Lbg1;)Lb59;

    move-result-object v0

    iput-object v0, p0, Lim3;->z:Lb59;

    sget-object v0, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v4}, Landroid/content/Context;->getApplicationContext()Landroid/content/Context;

    move-result-object v0

    check-cast v0, Lcom/opera/android/OperaApplication;

    invoke-virtual {v0}, Lcom/opera/android/OperaApplication;->N()Lzwk;

    move-result-object v2

    iput-object v2, p0, Lim3;->J:Lzwk;

    iget-object v2, v0, Lcom/opera/android/OperaApplication;->A:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Llpe;

    iget-object v2, v2, Llpe;->c:Lcq5;

    iput-object v2, p0, Lim3;->K:Lcq5;

    move-object v2, v0

    new-instance v0, Lgn3;

    new-instance v3, Lvx;

    const/16 v4, 0xd

    invoke-direct {v3, p0, v4}, Lvx;-><init>(Ljava/lang/Object;B)V

    new-instance v4, Liu2;

    const/4 v5, 0x4

    invoke-direct {v4, p0, v5}, Liu2;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->L()Ld6j;

    move-result-object v5

    iget-object v5, v5, Ld6j;->c:Lx5f;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->g()Li53;

    move-result-object v6

    iget-object v7, p0, Lim3;->J:Lzwk;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->b()Ldb;

    move-result-object v8

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->J()Lcom/opera/android/settings/SettingsManager;

    move-result-object v9

    iget-object v10, p0, Lim3;->K:Lcq5;

    invoke-virtual {v2}, Lcom/opera/android/OperaApplication;->k()Lsl6;

    move-result-object v13

    iget-object v14, p0, Lim3;->D:Lgjm;

    iget-object v2, p0, Lyyi;->r:Ltzi;

    iget-object v11, p0, Lim3;->B:Lpm3;

    iget-object v12, p0, Lim3;->C:Lhxk;

    move-object v1, p0

    invoke-direct/range {v0 .. v14}, Lgn3;-><init>(Lim3;Ltzi;Lvx;Liu2;Lx5f;Li53;Lzwk;Ldb;Lcom/opera/android/settings/SettingsManager;Lcq5;Lom3;Lhxk;Lsl6;Lgjm;)V

    iput-object v0, p0, Lim3;->x:Lgn3;

    new-instance v0, Lxw;

    invoke-direct {v0, p0}, Lxw;-><init>(Lim3;)V

    iput-object v0, p0, Lim3;->L:Lxw;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getLifecycle()Ltcc;

    move-result-object v0

    new-instance v2, Lmxk;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v3

    check-cast v3, Lcom/opera/android/BrowserActivity;

    iget-object v3, v3, Lcom/opera/android/BrowserActivity;->U:Ldxk;

    if-nez v3, :cond_7c

    const/4 v3, 0x0

    :cond_7c
    iget-object v1, p0, Lim3;->J:Lzwk;

    invoke-direct {v2, v3, v1}, Lmxk;-><init>(Ldxk;Lzwk;)V

    invoke-virtual {v0, v2}, Ltcc;->a(Lmdc;)V

    return-void
.end method

.method public final onDestroy()V
    .registers 5

    invoke-super {p0}, Lryl;->onDestroy()V

    iget-object p0, p0, Lim3;->x:Lgn3;

    iget-object v0, p0, Lgn3;->f:Lne5;

    iget-object v1, v0, Lne5;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/bookmarks/h;

    iget-object v2, v0, Lne5;->f:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Runnable;

    if-eqz v2, :cond_23

    iget-object v3, v1, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    iget-object v3, v3, Lnrl;->b:Ljava/lang/Object;

    check-cast v3, Lvl9;

    iget-object v3, v3, Lvl9;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    if-eqz v3, :cond_20

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_20
    const/4 v2, 0x0

    iput-object v2, v0, Lne5;->f:Ljava/lang/Object;

    :cond_23
    iget-object v0, v0, Lne5;->e:Ljava/lang/Object;

    check-cast v0, Lhn3;

    invoke-virtual {v1, v0}, Lcom/opera/android/bookmarks/h;->f(Lql3;)V

    iget-object v0, p0, Lgn3;->h:Lzwk;

    iget-object p0, p0, Lgn3;->l:Lfn3;

    invoke-virtual {v0, p0}, Lzwk;->j(Lywk;)V

    return-void
.end method

.method public final onDestroyView()V
    .registers 6

    iget-object v0, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    const/4 v1, 0x0

    if-eqz v0, :cond_f

    invoke-virtual {v0, v1}, Lcom/opera/android/custom_views/ActionBarSearchView;->setActionViewObserver(Landroid/view/CollapsibleActionView;)V

    iget-object v0, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    invoke-virtual {v0, v1}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    iput-object v1, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    :cond_f
    iget-object v0, p0, Lim3;->G:Landroid/view/MenuItem;

    if-eqz v0, :cond_18

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    iput-object v1, p0, Lim3;->G:Landroid/view/MenuItem;

    :cond_18
    iget-object v0, p0, Lim3;->x:Lgn3;

    iget-object v2, v0, Lgn3;->A:Lum3;

    const/4 v3, 0x1

    invoke-virtual {v2, v3}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    iget-object v2, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v3, v0, Lgn3;->c:Ldl3;

    invoke-virtual {v2, v3}, Lcom/opera/android/bookmarks/h;->f(Lql3;)V

    iget-object v3, v0, Lgn3;->o:Ljava/lang/Runnable;

    if-eqz v3, :cond_3c

    iget-object v4, v2, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    iget-object v4, v4, Lnrl;->b:Ljava/lang/Object;

    check-cast v4, Lvl9;

    iget-object v4, v4, Lvl9;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    if-eqz v4, :cond_3a

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_3a
    iput-object v1, v0, Lgn3;->o:Ljava/lang/Runnable;

    :cond_3c
    iget-object v3, v0, Lgn3;->s:Lxm3;

    if-eqz v3, :cond_43

    invoke-virtual {v2, v3}, Lcom/opera/android/bookmarks/h;->f(Lql3;)V

    :cond_43
    iget-object v2, v0, Lgn3;->d:Lzm3;

    invoke-static {v2}, Lac8;->d(Ljava/lang/Object;)V

    iput-object v1, v0, Lgn3;->q:Ly83;

    iput-object v1, v0, Lgn3;->s:Lxm3;

    iput-object v1, v0, Lgn3;->G:Lbm3;

    iput-object v1, v0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v1, v0, Lgn3;->E:Landroidx/recyclerview/widget/e;

    iput-object v1, v0, Lgn3;->H:Lsom;

    iget-object v2, v0, Lgn3;->F:Lflb;

    if-eqz v2, :cond_5d

    invoke-virtual {v2, v1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v1, v0, Lgn3;->F:Lflb;

    :cond_5d
    iget-object v0, p0, Lim3;->A:Lgm3;

    iget-object v2, v0, Lgm3;->a:Lim3;

    iget-object v2, v2, Lim3;->J:Lzwk;

    invoke-virtual {v2, v0}, Lzwk;->j(Lywk;)V

    iput-object v1, p0, Lim3;->I:Ly83;

    invoke-super {p0}, Lltl;->onDestroyView()V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 16

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0173

    const/4 v2, 0x0

    const/4 v3, 0x1

    if-ne v0, v1, :cond_2e

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getView()Landroid/view/View;

    move-result-object v0

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    invoke-virtual {v0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    if-nez p1, :cond_1a

    return v3

    :cond_1a
    new-instance v0, Lsm3;

    invoke-virtual {p0}, Lim3;->L0()I

    move-result v1

    new-instance v4, Lva2;

    const/16 v5, 0x12

    invoke-direct {v4, p0, v5}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v4, v2}, Lsm3;-><init>(ILjava/lang/Object;B)V

    invoke-virtual {v0, p1}, Lo73;->o(Landroid/view/View;)V

    return v3

    :cond_2e
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0168

    if-ne v0, v1, :cond_43

    iget-object p1, p0, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p1, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lim3;->L:Lxw;

    invoke-virtual {p0, p1}, Lo73;->p(Landroid/view/View;)V

    return v3

    :cond_43
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a016e

    const-string v4, "dialog-source"

    const-string v5, "show-snackbar"

    const-string v6, "bookmark-parent"

    const/16 v7, 0x1001

    const/4 v8, 0x0

    if-ne v0, v1, :cond_85

    iget-object p0, p0, Lim3;->x:Lgn3;

    iget-object p1, p0, Lgn3;->x:Lgjm;

    invoke-virtual {p0}, Lgn3;->a()Lml3;

    move-result-object v0

    new-instance v1, Las;

    invoke-direct {v1, p1}, Las;-><init>(Lgjm;)V

    new-instance p1, Landroid/os/Bundle;

    invoke-direct {p1}, Landroid/os/Bundle;-><init>()V

    if-eqz v0, :cond_70

    invoke-interface {v0}, Lal3;->getId()J

    move-result-wide v9

    invoke-virtual {p1, v6, v9, v10}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :cond_70
    invoke-virtual {p1, v5, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {p1, v4, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v1, p1}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iput-object v8, v1, Lss7;->x:Lole;

    invoke-static {v1, v7}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return v3

    :cond_85
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a016d

    if-ne v0, v1, :cond_e2

    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const-string p1, ""

    const-wide/16 v0, -0x1

    invoke-static {v0, v1, p1, p1}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object p1

    invoke-virtual {p0}, Lgn3;->a()Lml3;

    move-result-object v9

    new-instance v10, Lyr;

    invoke-direct {v10}, Lyr;-><init>()V

    new-instance v11, Landroid/os/Bundle;

    invoke-direct {v11}, Landroid/os/Bundle;-><init>()V

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v12

    cmp-long v0, v12, v0

    if-nez v0, :cond_bb

    const-string v0, "bookmark"

    invoke-static {p1}, Ljkj;->j(Lal3;)Ljkj;

    move-result-object p1

    invoke-virtual {v11, v0, p1}, Landroid/os/Bundle;->putParcelable(Ljava/lang/String;Landroid/os/Parcelable;)V

    goto :goto_c4

    :cond_bb
    const-string v0, "bookmark-id"

    invoke-interface {p1}, Lal3;->getId()J

    move-result-wide v12

    invoke-virtual {v11, v0, v12, v13}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :goto_c4
    if-eqz v9, :cond_cd

    invoke-interface {v9}, Lal3;->getId()J

    move-result-wide v0

    invoke-virtual {v11, v6, v0, v1}, Landroid/os/BaseBundle;->putLong(Ljava/lang/String;J)V

    :cond_cd
    invoke-virtual {v11, v5, v2}, Landroid/os/BaseBundle;->putBoolean(Ljava/lang/String;Z)V

    invoke-virtual {v11, v4, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V

    invoke-virtual {v10, v11}, Landroidx/fragment/app/Fragment;->setArguments(Landroid/os/Bundle;)V

    iput-object v8, v10, Lss7;->x:Lole;

    invoke-static {v10, v7}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p1

    iget-object p0, p0, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-virtual {p1, p0}, Lzhj;->c(Landroid/content/Context;)V

    return v3

    :cond_e2
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0179

    if-ne v0, v1, :cond_f3

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getParentFragmentManager()Landroidx/fragment/app/w;

    move-result-object p0

    invoke-static {p0}, Lxih;->u(Landroidx/fragment/app/w;)V

    return v3

    :cond_f3
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0171

    if-ne v0, v1, :cond_102

    iget-object p0, p0, Lyyi;->r:Ltzi;

    invoke-virtual {p0}, Ltzi;->c()V

    return v3

    :cond_102
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0694

    if-ne v0, v1, :cond_11d

    iget-object p1, p0, Lim3;->x:Lgn3;

    invoke-virtual {p1}, Lgn3;->a()Lml3;

    move-result-object p1

    if-eqz p1, :cond_151

    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0}, Lgn3;->a()Lml3;

    move-result-object p1

    invoke-virtual {p0, p1}, Lgn3;->r(Lal3;)V

    return v3

    :cond_11d
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0691

    if-ne v0, v1, :cond_142

    iget-object p1, p0, Lim3;->x:Lgn3;

    invoke-virtual {p1}, Lgn3;->a()Lml3;

    move-result-object p1

    if-eqz p1, :cond_151

    invoke-virtual {p0, v3}, Lim3;->l0(Z)V

    iget-object p0, p0, Lim3;->x:Lgn3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {p1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object p1

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lgn3;->p(Ljava/util/List;)V

    return v3

    :cond_142
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a0172

    if-ne v0, v1, :cond_164

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p0

    if-nez p0, :cond_152

    :cond_151
    return v2

    :cond_152
    sget-object p1, Lq9n;->c:Ll5b;

    const p1, 0x7f0a05bd

    invoke-virtual {p0, p1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    check-cast p0, Landroidx/appcompat/widget/SwitchCompat;

    invoke-virtual {p0}, Landroidx/appcompat/widget/SwitchCompat;->toggle()V

    return v3

    :cond_164
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a016b

    iget-object v4, p0, Lim3;->B:Lpm3;

    if-ne v0, v1, :cond_175

    new-array p0, v2, [I

    invoke-virtual {v4, p0}, Lpm3;->a([I)V

    return v3

    :cond_175
    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result v0

    const v1, 0x7f0a016a

    if-ne v0, v1, :cond_19f

    new-instance p1, Lqj2;

    invoke-direct {p1, p0, v3}, Lqj2;-><init>(Ljava/lang/Object;B)V

    iget-object p0, v4, Lpm3;->b:Lwt3;

    invoke-virtual {p0}, Lwt3;->get()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lz77;

    new-instance v0, Lwen;

    new-instance v1, Lgb3;

    const/4 v2, 0x3

    invoke-direct {v1, v4, p1, v2}, Lgb3;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    invoke-direct {v0, v1, v3}, Lwen;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object p1, Lijm;->b:Lijm;

    invoke-virtual {p0, v0, p1}, Lr22;->b(Ljjm;Lijm;)V

    return v3

    :cond_19f
    invoke-super {p0, p1}, Lyyi;->onMenuItemClick(Landroid/view/MenuItem;)Z

    move-result p0

    return p0
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 7

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    iget-object p1, p0, Lim3;->E:Lua7;

    invoke-virtual {p1}, Lua7;->p()Ln37;

    move-result-object p1

    check-cast p1, Lxl3;

    iget-object p1, p1, Lxl3;->a:Ljava/lang/Long;

    if-nez p1, :cond_10

    return-void

    :cond_10
    iget-object p2, p0, Lim3;->x:Lgn3;

    invoke-virtual {p1}, Ljava/lang/Long;->longValue()J

    move-result-wide v0

    iget-object p1, p2, Lgn3;->s:Lxm3;

    const/4 p2, 0x0

    :goto_19
    iget-object v2, p1, Lxm3;->e:Lxvj;

    iget v2, v2, Lxvj;->h:I

    if-ge p2, v2, :cond_30

    invoke-virtual {p1, p2}, Lxm3;->H(I)Lqhc;

    move-result-object v2

    iget-object v2, v2, Lqhc;->a:Lal3;

    invoke-interface {v2}, Lal3;->getId()J

    move-result-wide v2

    cmp-long v2, v2, v0

    if-eqz v2, :cond_31

    add-int/lit8 p2, p2, 0x1

    goto :goto_19

    :cond_30
    const/4 p2, -0x1

    :cond_31
    iget-object p1, p0, Lim3;->I:Ly83;

    iget-object p1, p1, Ly83;->f:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object p0, p0, Lim3;->F:Lrn9;

    invoke-virtual {p0, p1, p2}, Lrn9;->E(Landroidx/recyclerview/widget/RecyclerView;I)V

    return-void
.end method

.method public final r0(I)Landroid/view/MenuItem;
    .registers 3

    invoke-super {p0, p1}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    if-eqz v0, :cond_7

    return-object v0

    :cond_7
    iget-object p0, p0, Lim3;->L:Lxw;

    iget-object p0, p0, Lxw;->k:Ljava/lang/Object;

    check-cast p0, Lm66;

    if-eqz p0, :cond_14

    invoke-virtual {p0, p1}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object p0

    return-object p0

    :cond_14
    const/4 p0, 0x0

    return-object p0
.end method

.method public final x0(Litd;)V
    .registers 4

    invoke-super {p0, p1}, Lyyi;->x0(Litd;)V

    const v0, 0x7f0a0932

    invoke-virtual {p1, v0}, Litd;->findItem(I)Landroid/view/MenuItem;

    move-result-object v0

    iput-object v0, p0, Lim3;->G:Landroid/view/MenuItem;

    new-instance v1, Lz73;

    invoke-direct {v1, p0, p1}, Lz73;-><init>(Lim3;Litd;)V

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setOnActionExpandListener(Landroid/view/MenuItem$OnActionExpandListener;)Landroid/view/MenuItem;

    iget-object p1, p0, Lim3;->G:Landroid/view/MenuItem;

    invoke-interface {p1}, Landroid/view/MenuItem;->getActionView()Landroid/view/View;

    move-result-object p1

    check-cast p1, Lcom/opera/android/custom_views/ActionBarSearchView;

    iput-object p1, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    new-instance v0, Lfm3;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lfm3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Lcom/opera/android/custom_views/ActionBarSearchView;->setActionViewObserver(Landroid/view/CollapsibleActionView;)V

    iget-object p1, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    const v0, 0x7f140082

    invoke-virtual {p0, v0}, Landroidx/fragment/app/Fragment;->getString(I)Ljava/lang/String;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setQueryHint(Ljava/lang/CharSequence;)V

    iget-object p1, p0, Lim3;->H:Lcom/opera/android/custom_views/ActionBarSearchView;

    new-instance v0, Lwth;

    const/16 v1, 0x11

    invoke-direct {v0, p0, v1}, Lwth;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p1, v0}, Landroidx/appcompat/widget/SearchView;->setOnQueryTextListener(Lhti;)V

    return-void
.end method

.method public final y0(Landroid/view/LayoutInflater;Lcom/opera/android/StatusBarDrawingFrameLayout;)V
    .registers 22

    move-object/from16 v0, p0

    const v1, 0x7f0a02a9

    move-object/from16 v2, p2

    invoke-virtual {v2, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object v1

    invoke-static {v1}, Ly83;->a(Landroid/view/View;)Ly83;

    move-result-object v1

    iput-object v1, v0, Lim3;->I:Ly83;

    new-instance v2, Lqe6;

    iget-object v1, v1, Ly83;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-direct {v2, v1}, Lqe6;-><init>(Landroidx/recyclerview/widget/RecyclerView;)V

    iput-object v2, v0, Lltl;->j:Lqe6;

    iget-object v1, v0, Lim3;->I:Ly83;

    iget-object v1, v1, Ly83;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Lem3;

    const/4 v3, 0x0

    invoke-direct {v2, v0, v3}, Lem3;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->n(Lnph;)V

    iget-object v5, v0, Lim3;->x:Lgn3;

    iget-object v1, v0, Lim3;->I:Ly83;

    invoke-virtual {v0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v2

    invoke-virtual {v0}, Lim3;->L0()I

    move-result v4

    iget-object v7, v0, Lltl;->n:Lqm9;

    iput-object v2, v5, Lgn3;->p:Landroidx/fragment/app/r;

    iget-object v0, v5, Lgn3;->n:Lsl6;

    sget-object v6, Lcom/opera/android/OperaApplication;->K:[Ljava/lang/String;

    invoke-virtual {v2}, Landroid/app/Activity;->getApplication()Landroid/app/Application;

    move-result-object v2

    check-cast v2, Lcom/opera/android/OperaApplication;

    iget-object v2, v2, Lcom/opera/android/OperaApplication;->r:Lxv1;

    iget-object v2, v2, Lxv1;->b1:Lj4c;

    invoke-virtual {v2}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lsom;

    iput-object v2, v5, Lgn3;->H:Lsom;

    iput-object v1, v5, Lgn3;->q:Ly83;

    iget-object v1, v1, Ly83;->f:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/custom_views/FadingRecyclerView;

    iput-object v1, v5, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v2, v1, Landroidx/recyclerview/widget/RecyclerView;->M:Landroidx/recyclerview/widget/e;

    check-cast v2, Lxkj;

    iput-boolean v3, v2, Lxkj;->g:Z

    new-instance v2, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-direct {v2}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object v1, v5, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    new-instance v2, Lvm3;

    invoke-direct {v2, v5}, Lvm3;-><init>(Lgn3;)V

    invoke-virtual {v1, v2}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    new-instance v1, Lxm3;

    iget-object v2, v5, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-direct {v1, v5, v2, v4}, Lxm3;-><init>(Lgn3;Li53;I)V

    iput-object v1, v5, Lgn3;->s:Lxm3;

    iget-object v10, v5, Lgn3;->u:Ltzi;

    new-instance v4, Liy0;

    invoke-direct {v4, v5, v1}, Liy0;-><init>(Lgn3;Lxm3;)V

    invoke-virtual {v10, v4}, Ltzi;->b(Lxph;)V

    iget-object v1, v5, Lgn3;->s:Lxm3;

    sget-object v4, Lcm3;->d:Lcm3;

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->s()Z

    move-result v4

    const/4 v6, 0x1

    if-eqz v4, :cond_97

    invoke-virtual {v0}, Lsl6;->b()Z

    move-result v4

    if-eqz v4, :cond_97

    move v12, v6

    goto :goto_98

    :cond_97
    move v12, v3

    :goto_98
    iget-object v4, v5, Lgn3;->k:Lcq5;

    invoke-virtual {v4}, Lcq5;->getValue()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lf8f;

    invoke-virtual {v4}, Lf8f;->f()Z

    move-result v4

    if-nez v4, :cond_ae

    invoke-virtual {v0}, Lsl6;->b()Z

    move-result v0

    if-nez v0, :cond_ae

    move v13, v6

    goto :goto_af

    :cond_ae
    move v13, v3

    :goto_af
    invoke-virtual {v5}, Lgn3;->q()Z

    move-result v14

    iget-object v15, v5, Lgn3;->e:Lom3;

    iget-object v0, v5, Lgn3;->m:Lhxk;

    iget-object v4, v5, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v6, v5, Lgn3;->g:Lx5f;

    new-instance v8, Lbm3;

    new-instance v11, Lam3;

    move-object/from16 v16, v0

    move-object/from16 v17, v4

    move-object/from16 v18, v6

    invoke-direct/range {v11 .. v18}, Lam3;-><init>(ZZZLom3;Lhxk;Lcom/opera/android/bookmarks/h;Lx5f;)V

    invoke-direct {v8, v1, v11}, Lyz7;-><init>(Landroidx/recyclerview/widget/d;Lwz7;)V

    iput-object v8, v5, Lgn3;->G:Lbm3;

    iget-object v0, v5, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    iget-object v1, v8, Lyz7;->c:Lx93;

    invoke-virtual {v0, v1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    iget-object v0, v5, Lgn3;->C:Lvi7;

    iput-boolean v3, v0, Lvi7;->t:Z

    iget-object v0, v0, Lvi7;->g:Lflb;

    iget-object v1, v5, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v0, v1}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Lnvk;

    iget-object v1, v5, Lgn3;->p:Landroidx/fragment/app/r;

    invoke-direct {v0, v1, v5}, Lnvk;-><init>(Landroid/content/Context;Ljvk;)V

    new-instance v1, Lflb;

    invoke-direct {v1, v0}, Lflb;-><init>(Lblb;)V

    iput-object v1, v5, Lgn3;->F:Lflb;

    iget-object v0, v5, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, v0}, Lflb;->e(Landroidx/recyclerview/widget/RecyclerView;)V

    new-instance v0, Lig;

    invoke-direct {v0, v5}, Lig;-><init>(Lgn3;)V

    iget-object v1, v2, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    invoke-virtual {v1, v0}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v0

    iput-object v0, v5, Lgn3;->o:Ljava/lang/Runnable;

    iget-object v0, v5, Lgn3;->c:Ldl3;

    invoke-virtual {v2, v0}, Lcom/opera/android/bookmarks/h;->a(Lql3;)V

    iget-object v0, v5, Lgn3;->f:Lne5;

    iget-object v1, v0, Lne5;->a:Ljava/lang/Object;

    check-cast v1, Lcom/opera/android/bookmarks/h;

    iget-object v2, v0, Lne5;->e:Ljava/lang/Object;

    check-cast v2, Lhn3;

    invoke-virtual {v1, v2}, Lcom/opera/android/bookmarks/h;->a(Lql3;)V

    new-instance v2, Lfv2;

    const/16 v3, 0x10

    invoke-direct {v2, v0, v3}, Lfv2;-><init>(Ljava/lang/Object;B)V

    iget-object v1, v1, Lcom/opera/android/bookmarks/h;->a:Lnrl;

    invoke-virtual {v1, v2}, Lnrl;->d(Ljava/lang/Runnable;)Ljava/lang/Runnable;

    move-result-object v1

    iput-object v1, v0, Lne5;->f:Ljava/lang/Object;

    iget-object v0, v5, Lgn3;->h:Lzwk;

    iget-object v1, v5, Lgn3;->l:Lfn3;

    invoke-virtual {v0, v1}, Lzwk;->a(Lywk;)V

    iget-object v0, v5, Lgn3;->d:Lzm3;

    invoke-static {v0}, Lac8;->c(Ljava/lang/Object;)V

    iget-object v0, v5, Lgn3;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_137

    invoke-virtual {v5}, Lgn3;->g()V

    :cond_137
    iget-object v9, v5, Lgn3;->s:Lxm3;

    new-instance v4, Lum3;

    iget-object v6, v5, Lgn3;->p:Landroidx/fragment/app/r;

    new-instance v8, Lva2;

    const/16 v0, 0x13

    invoke-direct {v8, v5, v0}, Lva2;-><init>(Ljava/lang/Object;B)V

    invoke-direct/range {v4 .. v9}, Lum3;-><init>(Lgn3;Landroidx/fragment/app/r;Lvwh;Lva2;Lxm3;)V

    iput-object v4, v5, Lgn3;->A:Lum3;

    new-instance v0, Ltm3;

    invoke-direct {v0, v5}, Ltm3;-><init>(Lgn3;)V

    iget-object v1, v10, Ltzi;->c:Lh7f;

    invoke-virtual {v1, v0}, Lh7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final z0()V
    .registers 2

    iget-object v0, p0, Lim3;->I:Ly83;

    iget-object v0, v0, Ly83;->f:Ljava/lang/Object;

    check-cast v0, Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-static {v0}, Lz4o;->q0(Landroid/view/View;)V

    iget-object p0, p0, Lltl;->k:Lcom/opera/android/StatusBarDrawingFrameLayout;

    const/4 v0, 0x0

    invoke-static {p0, v0}, Lz4o;->r0(Lcom/opera/android/StatusBarDrawingFrameLayout;Ldxh;)V

    return-void
.end method
