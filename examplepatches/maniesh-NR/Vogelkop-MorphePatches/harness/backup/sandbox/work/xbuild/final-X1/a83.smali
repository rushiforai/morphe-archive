.class public final La83;
.super Lgph;
.source "SourceFile"


# instance fields
.field public final synthetic a:B

.field public final b:Ljava/lang/Object;


# direct methods
.method public constructor <init>(B)V
    .registers 2

    iput-byte p1, p0, La83;->a:B

    packed-switch p1, :pswitch_data_1c

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, La83;->b:Ljava/lang/Object;

    return-void

    :pswitch_10
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance p1, Lh7f;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, La83;->b:Ljava/lang/Object;

    return-void

    nop

    :pswitch_data_1c
    .packed-switch 0xf
        :pswitch_10
    .end packed-switch
.end method

.method public constructor <init>(Ldm8;Ljava/lang/Runnable;)V
    .registers 3

    const/4 p1, 0x5

    iput-byte p1, p0, La83;->a:B

    .line 29
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 30
    iput-object p2, p0, La83;->b:Ljava/lang/Object;

    return-void
.end method

.method public synthetic constructor <init>(Ljava/lang/Object;B)V
    .registers 3

    .line 28
    iput-byte p2, p0, La83;->a:B

    iput-object p1, p0, La83;->b:Ljava/lang/Object;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    return-void
.end method


# virtual methods
.method public final b()V
    .registers 6

    iget-byte v0, p0, La83;->a:B

    const/4 v1, 0x1

    const/4 v2, 0x0

    iget-object v3, p0, La83;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_fe

    :pswitch_9
    return-void

    :pswitch_a
    check-cast v3, Lkok;

    invoke-virtual {v3}, Lkok;->c()V

    return-void

    :pswitch_10
    check-cast v3, Lh7f;

    new-instance p0, Lg7f;

    invoke-direct {p0, v3}, Lg7f;-><init>(Lh7f;)V

    :goto_17
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_29

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lszi;

    iget-object v0, v0, Lszi;->a:Ltzi;

    invoke-virtual {v0}, Ltzi;->e()V

    goto :goto_17

    :cond_29
    return-void

    :pswitch_2a
    check-cast v3, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v3, v2}, Landroidx/recyclerview/widget/RecyclerView;->p(Ljava/lang/String;)V

    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->h0:Lvph;

    iput-boolean v1, p0, Lvph;->f:Z

    invoke-virtual {v3, v1}, Landroidx/recyclerview/widget/RecyclerView;->l0(Z)V

    iget-object p0, v3, Landroidx/recyclerview/widget/RecyclerView;->e:Lpr;

    invoke-virtual {p0}, Lpr;->s()Z

    move-result p0

    if-nez p0, :cond_41

    invoke-virtual {v3}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    :cond_41
    return-void

    :pswitch_42
    check-cast v3, Lxke;

    iget-object p0, v3, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->getItemCount()I

    move-result p0

    iput p0, v3, Lxke;->e:I

    iget-object p0, v3, Lxke;->d:Lrma;

    iget-object v0, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v0, Lx93;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    invoke-virtual {p0}, Lrma;->e()V

    return-void

    :pswitch_59
    check-cast v3, Lm0e;

    invoke-virtual {v3}, Lm0e;->b()V

    return-void

    :pswitch_5f
    check-cast v3, Lzse;

    iget-object p0, v3, Lzse;->t:Ly83;

    if-eqz p0, :cond_66

    move-object v2, p0

    :cond_66
    iget-object p0, v2, Ly83;->e:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;

    invoke-virtual {p0}, Lcom/opera/android/widget/RecyclerViewEmptyViewSwitcher;->b()V

    return-void

    :pswitch_6e
    check-cast v3, Ldda;

    iget-object p0, v3, Lltl;->l:Landroidx/appcompat/widget/Toolbar;

    invoke-virtual {p0}, Landroidx/appcompat/widget/Toolbar;->o()Litd;

    move-result-object p0

    new-instance v0, Laud;

    invoke-direct {v0, p0}, Laud;-><init>(Litd;)V

    :goto_7b
    invoke-virtual {v0}, Laud;->hasNext()Z

    move-result p0

    if-eqz p0, :cond_95

    invoke-virtual {v0}, Laud;->next()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Landroid/view/MenuItem;

    invoke-virtual {v3}, Ldda;->L0()Lcom/opera/android/history/f;

    move-result-object v4

    iget-object v4, v4, Lcom/opera/android/history/f;->f:Lcom/opera/android/history/d;

    invoke-virtual {v4}, Loy;->e()Z

    move-result v4

    invoke-virtual {v3, p0, v4}, Ldda;->N0(Landroid/view/MenuItem;Z)V

    goto :goto_7b

    :cond_95
    iget-object p0, v3, Ldda;->E:Lcda;

    if-eqz p0, :cond_9a

    move-object v2, p0

    :cond_9a
    iget-object p0, v2, Lcda;->d:Ljava/lang/Object;

    check-cast p0, Lyz7;

    iget-boolean v0, v2, Lcda;->b:Z

    if-nez v0, :cond_bd

    iput-boolean v1, v2, Lcda;->b:Z

    invoke-static {v2}, Lvml;->a(Ljava/lang/Runnable;)V

    iget-boolean v0, v2, Lcda;->b:Z

    if-eqz v0, :cond_b4

    iget-object v0, v2, Lcda;->c:Ljava/lang/Object;

    check-cast v0, Lbca;

    invoke-virtual {v0}, Lbca;->G()I

    move-result v0

    goto :goto_b7

    :cond_b4
    const v0, 0x7f140834

    :goto_b7
    invoke-virtual {p0, v0}, Lyz7;->b(I)V

    invoke-virtual {p0}, Lyz7;->c()V

    :cond_bd
    return-void

    :pswitch_be
    check-cast v3, Lvu8;

    invoke-virtual {v3}, Lvu8;->t()V

    return-void

    :pswitch_c4
    check-cast v3, Lar8;

    invoke-virtual {v3}, Lar8;->p0()V

    return-void

    :pswitch_ca
    check-cast v3, Ljava/lang/Runnable;

    invoke-interface {v3}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_d0
    check-cast v3, Lx77;

    invoke-virtual {v3}, Lx77;->p()V

    return-void

    :pswitch_d6
    check-cast v3, Lyz7;

    invoke-virtual {v3}, Lyz7;->d()V

    return-void

    :pswitch_dc
    check-cast v3, Lc76;

    invoke-virtual {v3}, Lc76;->h0()V

    return-void

    :pswitch_e2
    invoke-virtual {p0}, La83;->l()V

    return-void

    :pswitch_e6
    check-cast v3, Ljh3;

    invoke-virtual {v3}, Ljh3;->H0()Z

    move-result p0

    if-eqz p0, :cond_f9

    const/4 p0, 0x0

    invoke-virtual {v3, p0}, Ljh3;->I0(Z)V

    iget-object p0, v3, Ljh3;->C:Landroid/view/MenuItem;

    if-eqz p0, :cond_f9

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_f9
    invoke-virtual {v3}, Ljh3;->J0()V

    return-void

    nop

    :pswitch_data_fe
    .packed-switch 0x0
        :pswitch_e6
        :pswitch_e2
        :pswitch_dc
        :pswitch_d6
        :pswitch_d0
        :pswitch_ca
        :pswitch_c4
        :pswitch_be
        :pswitch_6e
        :pswitch_5f
        :pswitch_59
        :pswitch_9
        :pswitch_42
        :pswitch_9
        :pswitch_2a
        :pswitch_10
        :pswitch_a
    .end packed-switch
.end method

.method public final c(II)V
    .registers 5

    iget-byte v0, p0, La83;->a:B

    iget-object v1, p0, La83;->b:Ljava/lang/Object;

    sparse-switch v0, :sswitch_data_30

    return-void

    :sswitch_8
    invoke-virtual {p0}, La83;->b()V

    return-void

    :sswitch_c
    check-cast v1, Lxke;

    iget-object p0, v1, Lxke;->d:Lrma;

    invoke-virtual {p0, v1}, Lrma;->g(Lxke;)I

    move-result v0

    iget-object p0, p0, Lrma;->c:Ljava/lang/Object;

    check-cast p0, Lx93;

    add-int/2addr p1, v0

    const/4 v0, 0x0

    invoke-virtual {p0, p1, p2, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(IILjava/lang/Object;)V

    return-void

    :sswitch_1e
    check-cast v1, Lm0e;

    invoke-virtual {v1}, Lm0e;->b()V

    return-void

    :sswitch_24
    check-cast v1, Lar8;

    invoke-virtual {v1}, Lar8;->p0()V

    return-void

    :sswitch_2a
    check-cast v1, Lc76;

    invoke-virtual {v1}, Lc76;->h0()V

    return-void

    :sswitch_data_30
    .sparse-switch
        0x2 -> :sswitch_2a
        0x6 -> :sswitch_24
        0xa -> :sswitch_1e
        0xc -> :sswitch_c
        0xf -> :sswitch_8
    .end sparse-switch
.end method

.method public final e(IILjava/lang/Object;)V
    .registers 8

    iget-byte v0, p0, La83;->a:B

    iget-object v1, p0, La83;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_42

    :pswitch_7
    invoke-super {p0, p1, p2, p3}, Lgph;->e(IILjava/lang/Object;)V

    return-void

    :pswitch_b
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->p(Ljava/lang/String;)V

    iget-object v0, v1, Landroidx/recyclerview/widget/RecyclerView;->e:Lpr;

    iget-object v1, v0, Lpr;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    const/4 v2, 0x1

    if-lt p2, v2, :cond_30

    const/4 v3, 0x4

    invoke-virtual {v0, v3, p1, p2, p3}, Lpr;->t(IIILjava/lang/Object;)Lor;

    move-result-object p1

    invoke-virtual {v1, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, v0, Lpr;->a:I

    or-int/2addr p1, v3

    iput p1, v0, Lpr;->a:I

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p1, v2, :cond_30

    invoke-virtual {p0}, La83;->k()V

    :cond_30
    return-void

    :pswitch_31
    check-cast v1, Lxke;

    iget-object p0, v1, Lxke;->d:Lrma;

    invoke-virtual {p0, v1}, Lrma;->g(Lxke;)I

    move-result v0

    iget-object p0, p0, Lrma;->c:Ljava/lang/Object;

    check-cast p0, Lx93;

    add-int/2addr p1, v0

    invoke-virtual {p0, p1, p2, p3}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(IILjava/lang/Object;)V

    return-void

    :pswitch_data_42
    .packed-switch 0xc
        :pswitch_31
        :pswitch_7
        :pswitch_b
    .end packed-switch
.end method

.method public final f(II)V
    .registers 8

    iget-byte v0, p0, La83;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, La83;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_d2

    :pswitch_8
    return-void

    :pswitch_9
    invoke-virtual {p0}, La83;->j()V

    return-void

    :pswitch_d
    check-cast v2, Lkok;

    invoke-virtual {v2}, Lkok;->c()V

    return-void

    :pswitch_13
    check-cast v2, Lh7f;

    new-instance p0, Lg7f;

    invoke-direct {p0, v2}, Lg7f;-><init>(Lh7f;)V

    :cond_1a
    :goto_1a
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_47

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lszi;

    iget-object v0, v0, Lszi;->a:Ltzi;

    iget v2, v0, Ltzi;->f:I

    move v3, p1

    :goto_2b
    add-int v4, p1, p2

    if-ge v3, v4, :cond_3f

    iget-object v4, v0, Ltzi;->e:Lxph;

    invoke-virtual {v4, v3}, Lxph;->a(I)Z

    move-result v4

    if-eqz v4, :cond_3c

    iget v4, v0, Ltzi;->f:I

    add-int/2addr v4, v1

    iput v4, v0, Ltzi;->f:I

    :cond_3c
    add-int/lit8 v3, v3, 0x1

    goto :goto_2b

    :cond_3f
    iget v3, v0, Ltzi;->f:I

    if-eq v2, v3, :cond_1a

    invoke-virtual {v0}, Ltzi;->a()V

    goto :goto_1a

    :cond_47
    return-void

    :pswitch_48
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->p(Ljava/lang/String;)V

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->e:Lpr;

    iget-object v3, v2, Lpr;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    if-lt p2, v1, :cond_6b

    invoke-virtual {v2, v1, p1, p2, v0}, Lpr;->t(IIILjava/lang/Object;)Lor;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, v2, Lpr;->a:I

    or-int/2addr p1, v1

    iput p1, v2, Lpr;->a:I

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p1, v1, :cond_6b

    invoke-virtual {p0}, La83;->k()V

    :cond_6b
    return-void

    :pswitch_6c
    check-cast v2, Ljava/util/ArrayList;

    new-instance p0, Looh;

    invoke-direct {p0, p1, p2}, Looh;-><init>(II)V

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_77
    check-cast v2, Lxke;

    iget p0, v2, Lxke;->e:I

    add-int/2addr p0, p2

    iput p0, v2, Lxke;->e:I

    iget-object p0, v2, Lxke;->d:Lrma;

    invoke-virtual {p0, v2}, Lrma;->g(Lxke;)I

    move-result v0

    iget-object v1, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v1, Lx93;

    add-int/2addr p1, v0

    invoke-virtual {v1, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    iget p1, v2, Lxke;->e:I

    if-lez p1, :cond_9d

    iget-object p1, v2, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->getStateRestorationPolicy()Leph;

    move-result-object p1

    sget-object p2, Leph;->b:Leph;

    if-ne p1, p2, :cond_9d

    invoke-virtual {p0}, Lrma;->e()V

    :cond_9d
    return-void

    :pswitch_9e
    check-cast v2, Lfge;

    iget-object p0, v2, Lfge;->A:Lcom/opera/android/custom_views/FadingRecyclerView;

    if-eqz p0, :cond_a9

    add-int/2addr p1, p2

    sub-int/2addr p1, v1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->H0(I)V

    :cond_a9
    return-void

    :pswitch_aa
    check-cast v2, Lm0e;

    invoke-virtual {v2}, Lm0e;->b()V

    return-void

    :pswitch_b0
    check-cast v2, Lar8;

    invoke-virtual {v2}, Lar8;->p0()V

    return-void

    :pswitch_b6
    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_bc
    check-cast v2, Lx77;

    invoke-virtual {v2}, Lx77;->p()V

    return-void

    :pswitch_c2
    check-cast v2, Lyz7;

    invoke-virtual {v2}, Lyz7;->d()V

    return-void

    :pswitch_c8
    invoke-virtual {p0}, La83;->l()V

    return-void

    :pswitch_cc
    check-cast v2, Ljh3;

    invoke-virtual {v2}, Ljh3;->J0()V

    return-void

    :pswitch_data_d2
    .packed-switch 0x0
        :pswitch_cc
        :pswitch_c8
        :pswitch_8
        :pswitch_c2
        :pswitch_bc
        :pswitch_b6
        :pswitch_b0
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_aa
        :pswitch_9e
        :pswitch_77
        :pswitch_6c
        :pswitch_48
        :pswitch_13
        :pswitch_d
        :pswitch_8
        :pswitch_9
    .end packed-switch
.end method

.method public final g(II)V
    .registers 7

    iget-byte v0, p0, La83;->a:B

    iget-object v1, p0, La83;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_56

    :pswitch_7
    return-void

    :pswitch_8
    invoke-virtual {p0}, La83;->j()V

    return-void

    :pswitch_c
    check-cast v1, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->p(Ljava/lang/String;)V

    iget-object v1, v1, Landroidx/recyclerview/widget/RecyclerView;->e:Lpr;

    iget-object v2, v1, Lpr;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/ArrayList;

    if-eq p1, p2, :cond_32

    const/16 v3, 0x8

    invoke-virtual {v1, v3, p1, p2, v0}, Lpr;->t(IIILjava/lang/Object;)Lor;

    move-result-object p1

    invoke-virtual {v2, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, v1, Lpr;->a:I

    or-int/2addr p1, v3

    iput p1, v1, Lpr;->a:I

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result p1

    const/4 p2, 0x1

    if-ne p1, p2, :cond_32

    invoke-virtual {p0}, La83;->k()V

    :cond_32
    return-void

    :pswitch_33
    check-cast v1, Ljava/util/ArrayList;

    new-instance p0, Lqoh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_3e
    check-cast v1, Lxke;

    iget-object p0, v1, Lxke;->d:Lrma;

    invoke-virtual {p0, v1}, Lrma;->g(Lxke;)I

    move-result v0

    iget-object p0, p0, Lrma;->c:Ljava/lang/Object;

    check-cast p0, Lx93;

    add-int/2addr p1, v0

    add-int/2addr p2, v0

    invoke-virtual {p0, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemMoved(II)V

    return-void

    :pswitch_50
    check-cast v1, Lm0e;

    invoke-virtual {v1}, Lm0e;->b()V

    return-void

    :pswitch_data_56
    .packed-switch 0xa
        :pswitch_50
        :pswitch_7
        :pswitch_3e
        :pswitch_33
        :pswitch_c
        :pswitch_7
        :pswitch_7
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final h(II)V
    .registers 8

    iget-byte v0, p0, La83;->a:B

    const/4 v1, 0x1

    iget-object v2, p0, La83;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_ba

    :pswitch_8
    return-void

    :pswitch_9
    invoke-virtual {p0}, La83;->j()V

    return-void

    :pswitch_d
    check-cast v2, Lmrk;

    iget-object p0, v2, Lmrk;->P:Lc1f;

    if-eqz p0, :cond_1f

    if-ne p2, v1, :cond_1f

    iget-boolean p1, p0, Lc1f;->c:Z

    if-nez p1, :cond_1f

    iget-object p0, p0, Lc1f;->g:Ljava/lang/Object;

    check-cast p0, Lvqk;

    iput-boolean v1, p0, Lvqk;->v:Z

    :cond_1f
    return-void

    :pswitch_20
    check-cast v2, Lkok;

    invoke-virtual {v2}, Lkok;->c()V

    return-void

    :pswitch_26
    invoke-virtual {p0}, La83;->b()V

    return-void

    :pswitch_2a
    check-cast v2, Landroidx/recyclerview/widget/RecyclerView;

    const/4 v0, 0x0

    invoke-virtual {v2, v0}, Landroidx/recyclerview/widget/RecyclerView;->p(Ljava/lang/String;)V

    iget-object v2, v2, Landroidx/recyclerview/widget/RecyclerView;->e:Lpr;

    iget-object v3, v2, Lpr;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    if-lt p2, v1, :cond_4e

    const/4 v4, 0x2

    invoke-virtual {v2, v4, p1, p2, v0}, Lpr;->t(IIILjava/lang/Object;)Lor;

    move-result-object p1

    invoke-virtual {v3, p1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    iget p1, v2, Lpr;->a:I

    or-int/2addr p1, v4

    iput p1, v2, Lpr;->a:I

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result p1

    if-ne p1, v1, :cond_4e

    invoke-virtual {p0}, La83;->k()V

    :cond_4e
    return-void

    :pswitch_4f
    check-cast v2, Ljava/util/ArrayList;

    new-instance p0, Lqoh;

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    invoke-virtual {v2, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    return-void

    :pswitch_5a
    check-cast v2, Lxke;

    iget p0, v2, Lxke;->e:I

    sub-int/2addr p0, p2

    iput p0, v2, Lxke;->e:I

    iget-object p0, v2, Lxke;->d:Lrma;

    invoke-virtual {p0, v2}, Lrma;->g(Lxke;)I

    move-result v0

    iget-object v3, p0, Lrma;->c:Ljava/lang/Object;

    check-cast v3, Lx93;

    add-int/2addr p1, v0

    invoke-virtual {v3, p1, p2}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    iget p1, v2, Lxke;->e:I

    if-ge p1, v1, :cond_80

    iget-object p1, v2, Lxke;->c:Landroidx/recyclerview/widget/d;

    invoke-virtual {p1}, Landroidx/recyclerview/widget/d;->getStateRestorationPolicy()Leph;

    move-result-object p1

    sget-object p2, Leph;->b:Leph;

    if-ne p1, p2, :cond_80

    invoke-virtual {p0}, Lrma;->e()V

    :cond_80
    return-void

    :pswitch_81
    check-cast v2, Lm0e;

    invoke-virtual {v2}, Lm0e;->b()V

    return-void

    :pswitch_87
    check-cast v2, Lar8;

    invoke-virtual {v2}, Lar8;->p0()V

    return-void

    :pswitch_8d
    check-cast v2, Ljava/lang/Runnable;

    invoke-interface {v2}, Ljava/lang/Runnable;->run()V

    return-void

    :pswitch_93
    check-cast v2, Lx77;

    invoke-virtual {v2}, Lx77;->p()V

    return-void

    :pswitch_99
    check-cast v2, Lyz7;

    invoke-virtual {v2}, Lyz7;->d()V

    return-void

    :pswitch_9f
    invoke-virtual {p0}, La83;->l()V

    return-void

    :pswitch_a3
    check-cast v2, Ljh3;

    invoke-virtual {v2}, Ljh3;->H0()Z

    move-result p0

    if-eqz p0, :cond_b6

    const/4 p0, 0x0

    invoke-virtual {v2, p0}, Ljh3;->I0(Z)V

    iget-object p0, v2, Ljh3;->C:Landroid/view/MenuItem;

    if-eqz p0, :cond_b6

    invoke-interface {p0}, Landroid/view/MenuItem;->collapseActionView()Z

    :cond_b6
    invoke-virtual {v2}, Ljh3;->J0()V

    return-void

    :pswitch_data_ba
    .packed-switch 0x0
        :pswitch_a3
        :pswitch_9f
        :pswitch_8
        :pswitch_99
        :pswitch_93
        :pswitch_8d
        :pswitch_87
        :pswitch_8
        :pswitch_8
        :pswitch_8
        :pswitch_81
        :pswitch_8
        :pswitch_5a
        :pswitch_4f
        :pswitch_2a
        :pswitch_26
        :pswitch_20
        :pswitch_d
        :pswitch_9
    .end packed-switch
.end method

.method public final i()V
    .registers 2

    iget-byte v0, p0, La83;->a:B

    iget-object p0, p0, La83;->b:Ljava/lang/Object;

    packed-switch v0, :pswitch_data_24

    :pswitch_7
    return-void

    :pswitch_8
    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->d:Lqph;

    if-eqz v0, :cond_1b

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->m:Landroidx/recyclerview/widget/d;

    if-eqz v0, :cond_1b

    invoke-virtual {v0}, Landroidx/recyclerview/widget/d;->canRestoreState()Z

    move-result v0

    if-eqz v0, :cond_1b

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    :cond_1b
    return-void

    :pswitch_1c
    check-cast p0, Lxke;

    iget-object p0, p0, Lxke;->d:Lrma;

    invoke-virtual {p0}, Lrma;->e()V

    return-void

    :pswitch_data_24
    .packed-switch 0xc
        :pswitch_1c
        :pswitch_7
        :pswitch_8
    .end packed-switch
.end method

.method public final j()V
    .registers 2

    iget-object p0, p0, La83;->b:Ljava/lang/Object;

    check-cast p0, Lz5l;

    iget-object v0, p0, Lz5l;->f:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v0}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    iget-object p0, p0, Lz5l;->y:Lpde;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ly2c;

    invoke-interface {p0}, Ly2c;->invalidate()V

    return-void
.end method

.method public final k()V
    .registers 3

    iget-object p0, p0, La83;->b:Ljava/lang/Object;

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->t:Z

    if-eqz v0, :cond_14

    iget-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->s:Z

    if-eqz v0, :cond_14

    iget-object v0, p0, Landroidx/recyclerview/widget/RecyclerView;->i:Ldph;

    sget-object v1, Lr5n;->a:Ljava/util/WeakHashMap;

    invoke-virtual {p0, v0}, Landroid/view/View;->postOnAnimation(Ljava/lang/Runnable;)V

    return-void

    :cond_14
    const/4 v0, 0x1

    iput-boolean v0, p0, Landroidx/recyclerview/widget/RecyclerView;->A:Z

    invoke-virtual {p0}, Landroidx/recyclerview/widget/RecyclerView;->requestLayout()V

    return-void
.end method

.method public final l()V
    .registers 3

    iget-object p0, p0, La83;->b:Ljava/lang/Object;

    check-cast p0, Lm93;

    const v0, 0x7f0a0932

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object v1, p0, Lm93;->r:Lqmj;

    invoke-virtual {v1}, Lqmj;->I()Z

    move-result v1

    xor-int/lit8 v1, v1, 0x1

    invoke-interface {v0, v1}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    const v0, 0x7f0a02cb

    invoke-virtual {p0, v0}, Lltl;->r0(I)Landroid/view/MenuItem;

    move-result-object v0

    iget-object p0, p0, Lm93;->r:Lqmj;

    invoke-virtual {p0}, Lqmj;->I()Z

    move-result p0

    xor-int/lit8 p0, p0, 0x1

    invoke-interface {v0, p0}, Landroid/view/MenuItem;->setVisible(Z)Landroid/view/MenuItem;

    return-void
.end method
