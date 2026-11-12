.class public final Lqmj;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Landroid/widget/Filterable;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lcom/opera/android/undo/UndoBar;

.field public final c:Lcom/opera/api/Callback;

.field public d:Ljava/util/ArrayList;

.field public e:Ljava/util/List;

.field public final f:Ljava/util/TreeSet;

.field public g:Ljava/lang/CharSequence;


# direct methods
.method public constructor <init>(Landroid/content/Context;Ljava/util/Collection;Lcom/opera/android/undo/UndoBar;Lcom/opera/api/Callback;)V
    .registers 6

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    iput-object p1, p0, Lqmj;->a:Landroid/content/Context;

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p1, p0, Lqmj;->d:Ljava/util/ArrayList;

    invoke-static {p1}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    iget-object p1, p0, Lqmj;->d:Ljava/util/ArrayList;

    iput-object p1, p0, Lqmj;->e:Ljava/util/List;

    new-instance p1, Ljava/util/TreeSet;

    new-instance p2, Lomj;

    const/4 v0, 0x0

    invoke-direct {p2, v0}, Lomj;-><init>(B)V

    invoke-direct {p1, p2}, Ljava/util/TreeSet;-><init>(Ljava/util/Comparator;)V

    iput-object p1, p0, Lqmj;->f:Ljava/util/TreeSet;

    iput-object p3, p0, Lqmj;->b:Lcom/opera/android/undo/UndoBar;

    iput-object p4, p0, Lqmj;->c:Lcom/opera/api/Callback;

    return-void
.end method


# virtual methods
.method public final G()V
    .registers 5

    iget-object v0, p0, Lqmj;->e:Ljava/util/List;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v0

    iget-object v1, p0, Lqmj;->d:Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->clear()V

    iget-object v1, p0, Lqmj;->e:Ljava/util/List;

    invoke-interface {v1}, Ljava/util/List;->clear()V

    iget-object v1, p0, Lqmj;->f:Ljava/util/TreeSet;

    invoke-virtual {v1}, Ljava/util/TreeSet;->clear()V

    iget-object v1, p0, Lqmj;->b:Lcom/opera/android/undo/UndoBar;

    iget-object v2, v1, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v2, v2, Lmgh;->b:Ljava/lang/Object;

    check-cast v2, Lmhk;

    const/4 v3, 0x0

    iput v3, v2, Lmhk;->b:I

    iget-object v2, v2, Lmhk;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    invoke-virtual {v1, v3}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-virtual {p0, v3, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeRemoved(II)V

    return-void
.end method

.method public final H(Ljava/util/List;)V
    .registers 11

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    move v2, v1

    :goto_8
    if-ge v2, v0, :cond_4d

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Ljava/lang/String;

    iget-object v4, p0, Lqmj;->d:Ljava/util/ArrayList;

    invoke-virtual {v4}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v6, v1

    :cond_19
    if-ge v6, v5, :cond_2c

    invoke-virtual {v4, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v7

    add-int/lit8 v6, v6, 0x1

    check-cast v7, Ljava/lang/String;

    invoke-virtual {v7, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v8

    if-eqz v8, :cond_19

    invoke-virtual {v4, v7}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    :cond_2c
    iget-object v4, p0, Lqmj;->e:Ljava/util/List;

    invoke-interface {v4}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :cond_32
    invoke-interface {v5}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_47

    invoke-interface {v5}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Ljava/lang/String;

    invoke-virtual {v6, v3}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_32

    invoke-interface {v4, v6}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    :cond_47
    iget-object v4, p0, Lqmj;->f:Ljava/util/TreeSet;

    invoke-virtual {v4, v3}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    goto :goto_8

    :cond_4d
    return-void
.end method

.method public final I()Z
    .registers 2

    iget-object v0, p0, Lqmj;->d:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object p0, p0, Lqmj;->f:Ljava/util/TreeSet;

    invoke-virtual {p0}, Ljava/util/TreeSet;->size()I

    move-result p0

    if-ne v0, p0, :cond_10

    const/4 p0, 0x1

    return p0

    :cond_10
    const/4 p0, 0x0

    return p0
.end method

.method public final J(Ljava/lang/String;)V
    .registers 4

    iget-object v0, p0, Lqmj;->b:Lcom/opera/android/undo/UndoBar;

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->c(Ljava/util/List;)V

    iget-object v0, p0, Lqmj;->f:Ljava/util/TreeSet;

    invoke-virtual {v0, p1}, Ljava/util/TreeSet;->add(Ljava/lang/Object;)Z

    new-instance p1, Lc83;

    invoke-direct {p1, p0}, Lc83;-><init>(Lqmj;)V

    iget-object p0, p0, Lqmj;->g:Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final K(Le5d;)V
    .registers 4

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_18

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Lqmj;->f:Ljava/util/TreeSet;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v1, v0}, Ljava/util/TreeSet;->remove(Ljava/lang/Object;)Z

    goto :goto_4

    :cond_18
    new-instance p1, Lc83;

    invoke-direct {p1, p0}, Lc83;-><init>(Lqmj;)V

    iget-object p0, p0, Lqmj;->g:Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final L(Ljava/util/Collection;)V
    .registers 3

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0, p1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object v0, p0, Lqmj;->d:Ljava/util/ArrayList;

    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    new-instance p1, Lc83;

    invoke-direct {p1, p0}, Lc83;-><init>(Lqmj;)V

    iget-object p0, p0, Lqmj;->g:Ljava/lang/CharSequence;

    invoke-virtual {p1, p0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    return-void
.end method

.method public final getFilter()Landroid/widget/Filter;
    .registers 2

    new-instance v0, Lc83;

    invoke-direct {v0, p0}, Lc83;-><init>(Lqmj;)V

    return-object v0
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lqmj;->e:Ljava/util/List;

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result p0

    return p0
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 5

    check-cast p1, Lpmj;

    iget-object p0, p0, Lqmj;->e:Ljava/util/List;

    invoke-interface {p0, p2}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    invoke-static {p0}, Lwqm;->G(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    const-string v0, "/"

    invoke-virtual {p2, v0}, Ljava/lang/String;->endsWith(Ljava/lang/String;)Z

    move-result v0

    if-eqz v0, :cond_1c

    const/4 v0, 0x0

    const/4 v1, 0x1

    invoke-static {v1, v0, p2}, Lp3p;->h(IILjava/lang/String;)Ljava/lang/String;

    move-result-object p2

    :cond_1c
    iget-object v0, p1, Lpmj;->b:Lcom/opera/android/custom_views/StylingTextView;

    invoke-virtual {v0, p2}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    iput-object p0, p1, Lpmj;->c:Ljava/lang/String;

    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 5

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p2

    invoke-static {p2}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object p2

    invoke-static {p2, p1}, Lkf;->j(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;)Lkf;

    move-result-object p1

    new-instance p2, Lpmj;

    iget-object v0, p1, Lkf;->b:Landroid/view/View;

    check-cast v0, Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;

    iget-object p1, p1, Lkf;->c:Ljava/lang/Object;

    check-cast p1, Lcom/opera/android/custom_views/StylingTextView;

    invoke-direct {p2, v0, p1}, Lpmj;-><init>(Lcom/opera/android/custom_views/LayoutDirectionLinearLayout;Lcom/opera/android/custom_views/StylingTextView;)V

    iget-object p1, p0, Lqmj;->c:Lcom/opera/api/Callback;

    if-eqz p1, :cond_2f

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    new-instance v0, Lj5g;

    const/16 v1, 0xf

    invoke-direct {v0, p0, p2, v1}, Lj5g;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    new-instance p0, Lohi;

    const/4 v1, 0x0

    invoke-direct {p0, v0, v1}, Lohi;-><init>(Landroid/view/View$OnClickListener;B)V

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    :cond_2f
    return-object p2
.end method
