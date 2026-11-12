.class public final Lwr2;
.super Le93;
.source "SourceFile"

# interfaces
.implements Lkkm;
.implements Llkm;


# instance fields
.field public final r:Lbv1;

.field public final s:Lcom/opera/android/autofill/AutofillManager;

.field public t:Lcom/opera/android/autofill/PersonalDataMonitor;

.field public u:Lcom/opera/android/undo/UndoBar;

.field public final v:Lorm;

.field public final w:Ld8j;


# direct methods
.method public constructor <init>(Lcom/opera/android/autofill/AutofillManager;Lorm;Ld8j;)V
    .registers 6

    sget v0, Lfki;->a:I

    invoke-static {v0}, Lu7k;->f(I)Lu7k;

    move-result-object v0

    const v1, 0x7f140276

    invoke-virtual {v0, v1}, Lu7k;->s(I)V

    iget-object v0, v0, Lu7k;->a:Ljava/lang/Object;

    check-cast v0, Litl;

    const v1, 0x7f10000d

    iput v1, v0, Litl;->b:I

    invoke-direct {p0, v0}, Lltl;-><init>(Litl;)V

    iput-object p1, p0, Lwr2;->s:Lcom/opera/android/autofill/AutofillManager;

    new-instance p1, Lbv1;

    invoke-static {}, Li0l;->g()Z

    move-result v0

    invoke-direct {p1, p0, v0}, Lbv1;-><init>(Lwr2;Z)V

    iput-object p1, p0, Lwr2;->r:Lbv1;

    iput-object p2, p0, Lwr2;->v:Lorm;

    iput-object p3, p0, Lwr2;->w:Ld8j;

    return-void
.end method


# virtual methods
.method public final G0()I
    .registers 1

    const p0, 0x7f0d0074

    return p0
.end method

.method public final I0(Lcom/opera/android/autofill/Address;)V
    .registers 6

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    move-result-object v0

    new-instance v1, Ltr2;

    invoke-direct {v1, p0}, Ltr2;-><init>(Lwr2;)V

    new-instance v2, Lhs2;

    iget-boolean v3, p1, Lcom/opera/android/autofill/Address;->o:Z

    if-eqz v3, :cond_13

    const v3, 0x7f100008

    goto :goto_14

    :cond_13
    const/4 v3, 0x0

    :goto_14
    invoke-direct {v2, v3}, Lrr2;-><init>(I)V

    iget-object p0, p0, Lwr2;->s:Lcom/opera/android/autofill/AutofillManager;

    iput-object p0, v2, Lrr2;->w:Lcom/opera/android/autofill/AutofillManager;

    iput-object p1, v2, Lhs2;->y:Lcom/opera/android/autofill/Address;

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->isVisible()Z

    invoke-virtual {v2}, Landroidx/fragment/app/Fragment;->isVisible()Z

    iput-object v1, v2, Lrr2;->x:Ltr2;

    const/16 p0, 0x1003

    invoke-static {v2, p0}, Lzhj;->a(Lryl;I)Lzhj;

    move-result-object p0

    invoke-virtual {p0, v0}, Lzhj;->c(Landroid/content/Context;)V

    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 6

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_d
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_28

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Ljava/lang/String;

    iget-object v2, p0, Lwr2;->r:Lbv1;

    invoke-virtual {v2, v1}, Lbv1;->G(Ljava/lang/String;)I

    move-result v2

    new-instance v3, Lguh;

    invoke-direct {v3, v1, v2}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_28
    new-instance p0, Le5d;

    sget-object p1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    const/4 v1, 0x2

    invoke-direct {p0, v0, p1, v1}, Le5d;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    return-object p0
.end method

.method public final O(Ll46;)V
    .registers 2

    return-void
.end method

.method public final R(Ljava/util/ArrayList;)V
    .registers 6

    iget-object p0, p0, Lwr2;->r:Lbv1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_a
    if-ge v1, v0, :cond_1e

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Ljava/lang/String;

    iget-object v3, p0, Lbv1;->e:Ljava/lang/Object;

    check-cast v3, Lwr2;

    iget-object v3, v3, Lwr2;->s:Lcom/opera/android/autofill/AutofillManager;

    invoke-virtual {v3, v2}, Lcom/opera/android/autofill/AutofillManager;->f(Ljava/lang/String;)V

    goto :goto_a

    :cond_1e
    return-void
.end method

.method public final onDestroyView()V
    .registers 2

    invoke-super {p0}, Lltl;->onDestroyView()V

    iget-object p0, p0, Lwr2;->u:Lcom/opera/android/undo/UndoBar;

    const/4 v0, 0x1

    invoke-virtual {p0, v0}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    return-void
.end method

.method public final onMenuItemClick(Landroid/view/MenuItem;)Z
    .registers 4

    invoke-interface {p1}, Landroid/view/MenuItem;->getItemId()I

    move-result p1

    const v0, 0x7f0a0932

    const/4 v1, 0x1

    if-ne p1, v0, :cond_11

    iget-object p0, p0, Lwr2;->w:Ld8j;

    check-cast p0, Lg8j;

    invoke-virtual {p0}, Lg8j;->h()V

    :cond_11
    return v1
.end method

.method public final onPause()V
    .registers 1

    invoke-super {p0}, Lltl;->onPause()V

    iget-object p0, p0, Lwr2;->t:Lcom/opera/android/autofill/PersonalDataMonitor;

    if-eqz p0, :cond_a

    invoke-virtual {p0}, Lcom/opera/android/autofill/PersonalDataMonitor;->a()V

    :cond_a
    return-void
.end method

.method public final onResume()V
    .registers 4

    invoke-super {p0}, Lltl;->onResume()V

    iget-object v0, p0, Lwr2;->t:Lcom/opera/android/autofill/PersonalDataMonitor;

    iget-object v1, p0, Lwr2;->s:Lcom/opera/android/autofill/AutofillManager;

    if-nez v0, :cond_19

    new-instance v0, Lq02;

    const/16 v2, 0x1c

    invoke-direct {v0, p0, v2}, Lq02;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-static {v0}, Lcom/opera/android/autofill/AutofillManager;->b(Ljava/lang/Runnable;)Lcom/opera/android/autofill/PersonalDataMonitor;

    move-result-object v0

    iput-object v0, p0, Lwr2;->t:Lcom/opera/android/autofill/PersonalDataMonitor;

    :cond_19
    iget-object p0, p0, Lwr2;->r:Lbv1;

    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    new-instance v0, Lab;

    const/16 v2, 0x1b

    invoke-direct {v0, p0, v2}, Lab;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {v1, v0}, Lcom/opera/android/autofill/AutofillManager;->d(Lcom/opera/api/Callback;)V

    return-void
.end method

.method public final onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    .registers 9

    invoke-super {p0, p1, p2}, Lk24;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V

    new-instance v0, Lcom/opera/android/undo/UndoBar;

    invoke-virtual {p0}, Landroidx/fragment/app/Fragment;->getActivity()Landroidx/fragment/app/r;

    move-result-object v1

    iget-object v2, p0, Lltl;->n:Lqm9;

    const/4 v5, 0x1

    move-object v4, p0

    move-object v3, p0

    invoke-direct/range {v0 .. v5}, Lcom/opera/android/undo/UndoBar;-><init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V

    iput-object v0, v3, Lwr2;->u:Lcom/opera/android/undo/UndoBar;

    const p0, 0x7f12000c

    invoke-virtual {v0, p0}, Lcom/opera/android/undo/UndoBar;->e(I)V

    const p0, 0x7f0a0600

    invoke-virtual {p1, p0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Landroidx/recyclerview/widget/RecyclerView;

    new-instance p1, Landroidx/recyclerview/widget/LinearLayoutManager;

    invoke-virtual {v3}, Landroidx/fragment/app/Fragment;->getContext()Landroid/content/Context;

    invoke-direct {p1}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>()V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->C0(Landroidx/recyclerview/widget/f;)V

    iget-object p1, v3, Lwr2;->r:Lbv1;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->y0(Landroidx/recyclerview/widget/d;)V

    return-void
.end method

.method public final t(Le5d;)V
    .registers 8

    iget-object p0, p0, Lwr2;->r:Lbv1;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    add-int/lit8 v0, v0, -0x1

    :goto_13
    if-ltz v0, :cond_43

    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lguh;

    iget-object v2, p0, Lbv1;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/HashMap;

    iget-object v3, v1, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v2, v3}, Ljava/util/HashMap;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lcom/opera/android/autofill/AutofillItem;

    iget-object v3, p0, Lbv1;->d:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v3

    iget-object v4, p0, Lbv1;->d:Ljava/util/List;

    iget v5, v1, Lguh;->b:I

    invoke-interface {v4, v5, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    iget v1, v1, Lguh;->b:I

    if-eqz v3, :cond_3d

    const/4 v2, 0x2

    invoke-virtual {p0, v1, v2}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    goto :goto_40

    :cond_3d
    invoke-virtual {p0, v1}, Landroidx/recyclerview/widget/d;->notifyItemInserted(I)V

    :goto_40
    add-int/lit8 v0, v0, -0x1

    goto :goto_13

    :cond_43
    return-void
.end method
