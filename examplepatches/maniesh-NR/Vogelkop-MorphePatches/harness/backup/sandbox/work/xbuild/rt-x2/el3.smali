.class public final Lel3;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"


# instance fields
.field public final a:Ljava/util/ArrayList;

.field public final b:I

.field public final c:I

.field public final d:Z

.field public final e:Lw8l;

.field public final synthetic f:Lfl3;

.field public final synthetic g:Lfl3;


# direct methods
.method public constructor <init>(Lfl3;Ljl3;Z)V
    .registers 6

    iput-object p1, p0, Lel3;->g:Lfl3;

    invoke-virtual {p1}, Landroidx/fragment/app/Fragment;->getResources()Landroid/content/res/Resources;

    new-instance v0, Lw8l;

    const/4 v1, 0x4

    invoke-direct {v0, v1}, Lw8l;-><init>(B)V

    iput-object p1, p0, Lel3;->f:Lfl3;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lel3;->a:Ljava/util/ArrayList;

    const p1, 0x7f0d0096

    iput p1, p0, Lel3;->b:I

    iput p1, p0, Lel3;->c:I

    iput-boolean p3, p0, Lel3;->d:Z

    iput-object v0, p0, Lel3;->e:Lw8l;

    invoke-virtual {p0, p2}, Lel3;->H(Ljl3;)V

    return-void
.end method


# virtual methods
.method public final G(Landroid/content/res/Resources;Ljava/lang/String;)Z
    .registers 9

    invoke-virtual {p2}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object p2

    invoke-virtual {p2}, Ljava/lang/String;->isEmpty()Z

    move-result v0

    const/4 v1, 0x0

    if-nez v0, :cond_43

    iget-object p0, p0, Lel3;->f:Lfl3;

    iget-object p0, p0, Lfl3;->u:Lel3;

    iget-object p0, p0, Lel3;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    move v2, v1

    :cond_16
    if-ge v2, v0, :cond_43

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lll3;

    invoke-virtual {v3}, Lll3;->d()I

    move-result v4

    const/4 v5, 0x2

    if-ne v4, v5, :cond_16

    instance-of v4, v3, Lkl3;

    if-nez v4, :cond_16

    instance-of v4, v3, Lgl3;

    if-nez v4, :cond_16

    invoke-virtual {v3, p1}, Lll3;->c(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v3

    if-eqz v3, :cond_3a

    invoke-virtual {v3}, Ljava/lang/String;->trim()Ljava/lang/String;

    move-result-object v3

    goto :goto_3b

    :cond_3a
    const/4 v3, 0x0

    :goto_3b
    invoke-virtual {p2, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_16

    const/4 p0, 0x1

    return p0

    :cond_43
    return v1
.end method

.method public final H(Ljl3;)V
    .registers 12

    const/4 v0, 0x0

    iget-object v1, p0, Lel3;->f:Lfl3;

    iput-object v0, v1, Lfl3;->t:Lkl3;

    iget-object v0, p0, Lel3;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->clear()V

    iget-object v2, p1, Lll3;->a:Lal3;

    check-cast v2, Lml3;

    invoke-interface {v2}, Lml3;->i()Ljava/util/List;

    move-result-object v3

    new-instance v4, Ljava/util/ArrayList;

    invoke-interface {v3}, Ljava/util/List;->size()I

    move-result v5

    invoke-direct {v4, v5}, Ljava/util/ArrayList;-><init>(I)V

    iget-object v5, p1, Ljl3;->b:Li53;

    check-cast v5, Lcom/opera/android/bookmarks/h;

    invoke-interface {v2}, Lml3;->h()Z

    move-result v6

    const/4 v7, 0x1

    if-eqz v6, :cond_38

    invoke-static {v5}, Lalo;->G(Lcom/opera/android/bookmarks/h;)Z

    move-result v6

    if-eqz v6, :cond_38

    new-instance v6, Lgl3;

    invoke-virtual {v5}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v8

    invoke-direct {v6, v8, v5, v7}, Ljl3;-><init>(Lml3;Li53;Z)V

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_38
    invoke-interface {v2}, Lml3;->h()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-virtual {v5}, Lcom/opera/android/bookmarks/h;->t()Z

    move-result v2

    if-eqz v2, :cond_52

    invoke-virtual {v5}, Lcom/opera/android/bookmarks/h;->p()Lcom/opera/android/bookmarks/c;

    move-result-object v2

    if-eqz v2, :cond_52

    new-instance v6, Ljl3;

    invoke-direct {v6, v2, v5, v7}, Ljl3;-><init>(Lml3;Li53;Z)V

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_52
    invoke-interface {v3}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :goto_56
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_7b

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lal3;

    invoke-interface {v3}, Lol3;->g()Z

    move-result v6

    if-eqz v6, :cond_70

    check-cast v3, Lml3;

    new-instance v6, Ljl3;

    invoke-direct {v6, v3, v5, v7}, Ljl3;-><init>(Lml3;Li53;Z)V

    goto :goto_77

    :cond_70
    check-cast v3, Lpl3;

    new-instance v6, Lil3;

    invoke-direct {v6, v3}, Lll3;-><init>(Lal3;)V

    :goto_77
    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_56

    :cond_7b
    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-boolean v2, p0, Lel3;->d:Z

    const/4 v3, 0x2

    if-eqz v2, :cond_9d

    invoke-virtual {v0}, Ljava/util/ArrayList;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_87
    :goto_87
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_9d

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lll3;

    invoke-virtual {v4}, Lll3;->d()I

    move-result v4

    if-eq v4, v3, :cond_87

    invoke-interface {v2}, Ljava/util/Iterator;->remove()V

    goto :goto_87

    :cond_9d
    iget-object v2, p0, Lel3;->e:Lw8l;

    if-eqz v2, :cond_f6

    invoke-static {v0, v2}, Ljava/util/Collections;->sort(Ljava/util/List;Ljava/util/Comparator;)V

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v4, 0x0

    move v5, v4

    move v6, v5

    :goto_ab
    if-ge v6, v2, :cond_be

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v6, v6, 0x1

    check-cast v8, Lll3;

    invoke-virtual {v8}, Lll3;->d()I

    move-result v8

    if-ne v8, v3, :cond_be

    add-int/lit8 v5, v5, 0x1

    goto :goto_ab

    :cond_be
    if-lez v5, :cond_d6

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v2

    if-ge v5, v2, :cond_d6

    new-instance v2, Lhl3;

    const-string v3, ""

    const-wide/16 v8, -0x1

    invoke-static {v8, v9, v3, v3}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v3

    invoke-direct {v2, v3}, Lll3;-><init>(Lal3;)V

    invoke-virtual {v0, v5, v2}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_d6
    iget-object v2, p1, Lll3;->a:Lal3;

    check-cast v2, Lml3;

    invoke-interface {v2}, Lml3;->h()Z

    move-result v2

    if-nez v2, :cond_f6

    invoke-virtual {p1}, Ljl3;->f()Ljl3;

    move-result-object p1

    iget-object p1, p1, Lll3;->a:Lal3;

    check-cast p1, Lml3;

    iget-object v2, p0, Lel3;->g:Lfl3;

    iget-object v2, v2, Lfl3;->C:Li53;

    new-instance v3, Lkl3;

    invoke-direct {v3, p1, v2, v7}, Ljl3;-><init>(Lml3;Li53;Z)V

    iput-object v3, v1, Lfl3;->t:Lkl3;

    invoke-virtual {v0, v4, v3}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_f6
    invoke-virtual {p0}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lel3;->a:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result p0

    return p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    iget-object p0, p0, Lel3;->a:Ljava/util/ArrayList;

    invoke-virtual {p0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lll3;

    invoke-virtual {p0}, Lll3;->d()I

    move-result p0

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 9

    check-cast p1, Lz5m;

    iget-object v0, p0, Lel3;->a:Ljava/util/ArrayList;

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lll3;

    invoke-virtual {p1, v1}, Lz5m;->U(Lll3;)V

    invoke-virtual {v0, p2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lll3;

    invoke-virtual {p2}, Lll3;->d()I

    move-result v0

    const/4 v1, 0x2

    if-ne v0, v1, :cond_64

    check-cast p2, Ljl3;

    iget-object p0, p0, Lel3;->g:Lfl3;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p2, p2, Lll3;->a:Lal3;

    iget-object p0, p0, Lfl3;->A:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :cond_2b
    const/4 v3, 0x1

    if-ge v2, v0, :cond_52

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v4

    add-int/lit8 v2, v2, 0x1

    check-cast v4, Lal3;

    if-eqz v4, :cond_3e

    invoke-interface {v4}, Lol3;->g()Z

    move-result v5

    if-nez v5, :cond_40

    :cond_3e
    move v4, v3

    goto :goto_4f

    :cond_40
    invoke-virtual {v4, p2}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_48

    move v4, v1

    goto :goto_4f

    :cond_48
    check-cast v4, Lml3;

    invoke-interface {p2, v4}, Lal3;->e(Lml3;)Z

    move-result v4

    xor-int/2addr v4, v3

    :goto_4f
    if-nez v4, :cond_2b

    move v1, v3

    :cond_52
    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    check-cast p0, Lcom/opera/android/widget/SelectableRelativeLayout;

    invoke-virtual {p0, v1}, Lcom/opera/android/widget/SelectableRelativeLayout;->d(Z)V

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p0, v1}, Landroid/view/View;->setSelected(Z)V

    iget-object p0, p1, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    xor-int/2addr v1, v3

    invoke-virtual {p0, v1}, Landroid/view/View;->setEnabled(Z)V

    :cond_64
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x3

    invoke-static {v1}, Lvep;->B(I)[I

    move-result-object v1

    aget p2, v1, p2

    invoke-static {p2}, Lvep;->A(I)I

    move-result p2

    const/4 v1, 0x0

    iget-object v2, p0, Lel3;->g:Lfl3;

    if-eqz p2, :cond_41

    const/4 v3, 0x1

    if-eq p2, v3, :cond_35

    const/4 p0, 0x2

    if-ne p2, p0, :cond_2e

    new-instance p0, Lz5m;

    const p2, 0x7f0d038d

    invoke-virtual {v0, p2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    invoke-static {v2}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p0, p1}, Landroidx/recyclerview/widget/i;-><init>(Landroid/view/View;)V

    return-object p0

    :cond_2e
    new-instance p0, Ljava/lang/RuntimeException;

    const/4 p1, 0x0

    invoke-direct {p0, p1, p1}, Ljava/lang/RuntimeException;-><init>(Ljava/lang/String;Ljava/lang/Throwable;)V

    throw p0

    :cond_35
    new-instance p2, Ly5m;

    iget p0, p0, Lel3;->c:I

    invoke-virtual {v0, p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    invoke-direct {p2, v2, p0}, Ly5m;-><init>(Lfl3;Landroid/view/View;)V

    return-object p2

    :cond_41
    new-instance p2, Lcl3;

    iget p0, p0, Lel3;->b:I

    invoke-virtual {v0, p0, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p0

    iget-object p1, v2, Lfl3;->C:Li53;

    check-cast p1, Lcom/opera/android/bookmarks/h;

    iget-object p1, p1, Lcom/opera/android/bookmarks/h;->m:Leme;

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    invoke-direct {p2, v2, p0, p1}, Lcl3;-><init>(Lfl3;Landroid/view/View;Leme;)V

    return-object p2
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Lz5m;

    invoke-virtual {p1}, Lz5m;->V()V

    invoke-super {p0, p1}, Landroidx/recyclerview/widget/d;->onViewRecycled(Landroidx/recyclerview/widget/i;)V

    return-void
.end method
