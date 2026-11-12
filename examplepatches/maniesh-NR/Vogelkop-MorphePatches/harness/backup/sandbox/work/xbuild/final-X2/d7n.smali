.class public abstract Ld7n;
.super Le7n;
.source "SourceFile"


# instance fields
.field public final k:Landroid/widget/TextView;

.field public final l:Landroid/widget/TextView;

.field public final m:Landroid/view/View;

.field public final n:Landroid/widget/TextView;

.field public final o:Li53;


# direct methods
.method public constructor <init>(Landroid/view/View;Ltzi;Li53;)V
    .registers 4

    invoke-direct {p0, p1, p2}, Lak7;-><init>(Landroid/view/View;Ltzi;)V

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a05bf

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld7n;->k:Landroid/widget/TextView;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a05c2

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld7n;->l:Landroid/widget/TextView;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a05ba

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    iput-object p1, p0, Ld7n;->m:Landroid/view/View;

    iget-object p1, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const p2, 0x7f0a05b7

    invoke-virtual {p1, p2}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    check-cast p1, Landroid/widget/TextView;

    iput-object p1, p0, Ld7n;->n:Landroid/widget/TextView;

    iput-object p3, p0, Ld7n;->o:Li53;

    return-void
.end method


# virtual methods
.method public final I(Landroidx/recyclerview/widget/i;)Z
    .registers 4

    iget-boolean v0, p0, Le7n;->j:Z

    if-eqz v0, :cond_26

    iget-object v0, p0, Le7n;->i:Lqhc;

    iget-object v0, v0, Lqhc;->a:Lal3;

    iget-object v1, p0, Ld7n;->o:Li53;

    check-cast v1, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v1}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v1

    invoke-interface {v0, v1}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    invoke-interface {v0}, Lml3;->h()Z

    move-result v0

    if-eqz v0, :cond_24

    invoke-virtual {p0}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p0

    invoke-virtual {p1}, Landroidx/recyclerview/widget/i;->getItemViewType()I

    move-result p1

    if-ne p0, p1, :cond_26

    :cond_24
    const/4 p0, 0x1

    return p0

    :cond_26
    const/4 p0, 0x0

    return p0
.end method

.method public final K(Landroidx/recyclerview/widget/i;)V
    .registers 4

    check-cast p1, Le7n;

    invoke-virtual {p1}, Le7n;->j0()Z

    move-result v0

    iget-object v1, p0, Ld7n;->o:Li53;

    if-eqz v0, :cond_c

    const/4 p1, 0x0

    goto :goto_23

    :cond_c
    iget-object p1, p1, Le7n;->i:Lqhc;

    iget-object p1, p1, Lqhc;->a:Lal3;

    move-object v0, v1

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-interface {p1, v0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    invoke-interface {v0}, Lml3;->i()Ljava/util/List;

    move-result-object v0

    invoke-interface {v0, p1}, Ljava/util/List;->indexOf(Ljava/lang/Object;)I

    move-result p1

    :goto_23
    if-ltz p1, :cond_3a

    iget-object p0, p0, Le7n;->i:Lqhc;

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v0, v1

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-interface {p0, v0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v0

    invoke-virtual {v1, p0, v0, p1}, Li53;->h(Lal3;Lml3;I)V

    :cond_3a
    return-void
.end method

.method public final V()Z
    .registers 2

    iget-object p0, p0, Le7n;->i:Lqhc;

    if-eqz p0, :cond_11

    invoke-virtual {p0}, Lqhc;->a()Z

    move-result v0

    if-nez v0, :cond_f

    iget p0, p0, Lqhc;->b:I

    const/4 v0, 0x2

    if-ne p0, v0, :cond_11

    :cond_f
    const/4 p0, 0x1

    return p0

    :cond_11
    const/4 p0, 0x0

    return p0
.end method

.method public final W(Z)V
    .registers 3

    invoke-virtual {p0}, Lyzi;->f0()V

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-eqz p1, :cond_11

    iget-object p0, p0, Le7n;->i:Lqhc;

    invoke-virtual {p0}, Lqhc;->a()Z

    move-result p0

    if-nez p0, :cond_11

    const/4 p0, 0x0

    goto :goto_12

    :cond_11
    const/4 p0, 0x1

    :goto_12
    invoke-virtual {v0, p0}, Landroid/view/View;->setEnabled(Z)V

    return-void
.end method

.method public final Y()Z
    .registers 1

    iget-object p0, p0, Le7n;->i:Lqhc;

    if-eqz p0, :cond_c

    invoke-virtual {p0}, Lqhc;->a()Z

    move-result p0

    if-eqz p0, :cond_c

    const/4 p0, 0x1

    return p0

    :cond_c
    const/4 p0, 0x0

    return p0
.end method

.method public final e()Landroid/view/View;
    .registers 2

    iget-object p0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v0, 0x7f0a05be

    invoke-virtual {p0, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    return-object p0
.end method

.method public final f()Ljava/lang/Object;
    .registers 1

    const/4 p0, 0x0

    return-object p0
.end method

.method public final g0(Z)V
    .registers 3

    iget-object v0, p0, Le7n;->i:Lqhc;

    invoke-virtual {v0}, Lqhc;->a()Z

    move-result v0

    if-eqz v0, :cond_e

    if-eqz p1, :cond_c

    const/4 p1, 0x0

    goto :goto_10

    :cond_c
    const/4 p1, 0x4

    goto :goto_10

    :cond_e
    const/16 p1, 0x8

    :goto_10
    iget-object p0, p0, Ld7n;->m:Landroid/view/View;

    invoke-virtual {p0, p1}, Landroid/view/View;->setVisibility(I)V

    return-void
.end method

.method public k0(Lqhc;)V
    .registers 4

    iget-object v0, p0, Ld7n;->k:Landroid/widget/TextView;

    invoke-virtual {v0}, Landroid/view/View;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    invoke-virtual {p1, v1}, Lqhc;->d(Landroid/content/res/Resources;)Ljava/lang/String;

    move-result-object v1

    invoke-virtual {v0, v1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iget-object p1, p1, Lqhc;->a:Lal3;

    iget-object v0, p0, Ld7n;->o:Li53;

    check-cast v0, Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    invoke-interface {p1, v0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p1

    iget-object p0, p0, Ld7n;->n:Landroid/widget/TextView;

    if-eqz p1, :cond_2d

    invoke-interface {p1}, Lml3;->h()Z

    move-result v0

    if-nez v0, :cond_2d

    invoke-interface {p1}, Lal3;->getTitle()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    return-void

    :cond_2d
    const p1, 0x7f140d5a

    invoke-virtual {p0, p1}, Landroid/widget/TextView;->setText(I)V

    return-void
.end method

.method public final x(Z)V
    .registers 3

    iget-object v0, p0, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    if-nez p1, :cond_c

    invoke-virtual {p0}, Lyzi;->Z()Z

    move-result p0

    if-nez p0, :cond_c

    const/4 p0, 0x0

    goto :goto_d

    :cond_c
    const/4 p0, 0x1

    :goto_d
    invoke-virtual {v0, p0}, Landroid/view/View;->setSelected(Z)V

    return-void
.end method
