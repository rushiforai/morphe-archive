.class public Lcom/opera/android/undo/UndoBar;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Landroid/app/Activity;

.field public final b:Lami;

.field public final c:Lmgh;

.field public final d:Llkm;

.field public final e:Lkkm;

.field public f:Z

.field public g:Z

.field public h:I

.field public i:I

.field public final j:Z

.field public k:Z


# direct methods
.method public constructor <init>(Landroid/app/Activity;Lvwh;Llkm;Lkkm;Z)V
    .registers 7

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    const v0, 0x7f1412f2

    iput v0, p0, Lcom/opera/android/undo/UndoBar;->h:I

    iput-object p1, p0, Lcom/opera/android/undo/UndoBar;->a:Landroid/app/Activity;

    iput-object p3, p0, Lcom/opera/android/undo/UndoBar;->d:Llkm;

    iput-object p4, p0, Lcom/opera/android/undo/UndoBar;->e:Lkkm;

    new-instance p3, Ll46;

    const/4 v0, 0x5

    invoke-direct {p3, p0, v0}, Ll46;-><init>(Ljava/lang/Object;B)V

    invoke-interface {p4, p3}, Lkkm;->O(Ll46;)V

    new-instance p3, Lmgh;

    invoke-direct {p3, p0}, Lmgh;-><init>(Lcom/opera/android/undo/UndoBar;)V

    iput-object p3, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    new-instance p4, Lami;

    invoke-direct {p4, p2}, Lami;-><init>(Lvwh;)V

    iput-object p4, p0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iget p2, p0, Lcom/opera/android/undo/UndoBar;->h:I

    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    move-result-object p1

    iput-object p1, p4, Lami;->e:Ljava/lang/Object;

    iget-object p2, p4, Lami;->c:Ljava/lang/Object;

    check-cast p2, Lgtj;

    if-eqz p2, :cond_43

    iget-object p2, p2, Lgtj;->a:Lasj;

    iget-object p2, p2, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const/4 v0, 0x0

    invoke-virtual {p2, v0}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p2

    check-cast p2, Lcom/google/android/material/snackbar/SnackbarContentLayout;

    iget-object p2, p2, Lcom/google/android/material/snackbar/SnackbarContentLayout;->a:Landroid/widget/TextView;

    invoke-virtual {p2, p1}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_43
    iput-object p3, p4, Lami;->d:Ljava/lang/Object;

    iput-boolean p5, p0, Lcom/opera/android/undo/UndoBar;->j:Z

    return-void
.end method


# virtual methods
.method public final a(Z)V
    .registers 2

    if-eqz p1, :cond_7

    iget-object p1, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    invoke-virtual {p1}, Lmgh;->f()V

    :cond_7
    iget-object p0, p0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iget-object p1, p0, Lami;->c:Ljava/lang/Object;

    check-cast p1, Lgtj;

    if-nez p1, :cond_10

    return-void

    :cond_10
    invoke-virtual {p1}, Lgtj;->a()V

    const/4 p1, 0x0

    iput-object p1, p0, Lami;->c:Ljava/lang/Object;

    return-void
.end method

.method public b(Lmkm;)V
    .registers 2

    return-void
.end method

.method public final c(Ljava/util/List;)V
    .registers 5

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v0

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_b

    return-void

    :cond_b
    const/4 v1, 0x1

    iput-boolean v1, p0, Lcom/opera/android/undo/UndoBar;->g:Z

    iget-object v1, p0, Lcom/opera/android/undo/UndoBar;->e:Lkkm;

    invoke-interface {v1, p1}, Lkkm;->N(Ljava/util/List;)Le5d;

    move-result-object p1

    iget-object v1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_34

    iget-object v1, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v1, v1, Lmgh;->b:Ljava/lang/Object;

    check-cast v1, Lmhk;

    new-instance v2, Lmkm;

    invoke-direct {v2, p1, v0}, Lmkm;-><init>(Le5d;I)V

    invoke-virtual {v1, v2}, Lmhk;->g(Lmkm;)V

    invoke-virtual {p0}, Lcom/opera/android/undo/UndoBar;->f()V

    iget-object p1, p0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    invoke-virtual {p1}, Lami;->u()V

    :cond_34
    const/4 p1, 0x0

    iput-boolean p1, p0, Lcom/opera/android/undo/UndoBar;->g:Z

    return-void
.end method

.method public final d(Lqhc;)V
    .registers 10

    iget-object v0, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v0, v0, Lmgh;->b:Ljava/lang/Object;

    check-cast v0, Lmhk;

    iget-object v1, v0, Lmhk;->c:Ljava/lang/Object;

    check-cast v1, Ljava/util/LinkedList;

    invoke-interface {v1}, Ljava/util/List;->listIterator()Ljava/util/ListIterator;

    move-result-object v2

    :cond_e
    invoke-interface {v2}, Ljava/util/ListIterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_a7

    invoke-interface {v2}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmkm;

    iget-object v3, v3, Lmkm;->a:Le5d;

    iget-object v3, v3, Le5d;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->listIterator()Ljava/util/ListIterator;

    move-result-object v3

    :cond_24
    invoke-interface {v3}, Ljava/util/ListIterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_57

    invoke-interface {v3}, Ljava/util/ListIterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lguh;

    iget-object v5, v4, Lguh;->a:Ljava/lang/Object;

    invoke-virtual {v5, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_24

    invoke-interface {v3}, Ljava/util/ListIterator;->remove()V

    :goto_3b
    invoke-interface {v3}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v5

    if-eqz v5, :cond_58

    invoke-interface {v3}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lguh;

    iget v6, v5, Lguh;->b:I

    iget v7, v4, Lguh;->b:I

    if-le v6, v7, :cond_52

    add-int/lit8 v6, v6, -0x1

    iput v6, v5, Lguh;->b:I

    goto :goto_3b

    :cond_52
    add-int/lit8 v7, v7, 0x1

    iput v7, v4, Lguh;->b:I

    goto :goto_3b

    :cond_57
    const/4 v4, 0x0

    :cond_58
    if-eqz v4, :cond_e

    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    :cond_5d
    invoke-interface {v2}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result p1

    if-eqz p1, :cond_93

    invoke-interface {v2}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lmkm;

    iget-object p1, p1, Lmkm;->a:Le5d;

    iget-object p1, p1, Le5d;->c:Ljava/lang/Object;

    check-cast p1, Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    invoke-virtual {p1, v3}, Ljava/util/ArrayList;->listIterator(I)Ljava/util/ListIterator;

    move-result-object p1

    :goto_77
    invoke-interface {p1}, Ljava/util/ListIterator;->hasPrevious()Z

    move-result v3

    if-eqz v3, :cond_5d

    invoke-interface {p1}, Ljava/util/ListIterator;->previous()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lguh;

    iget v5, v3, Lguh;->b:I

    iget v6, v4, Lguh;->b:I

    if-le v5, v6, :cond_8e

    add-int/lit8 v5, v5, -0x1

    iput v5, v3, Lguh;->b:I

    goto :goto_77

    :cond_8e
    add-int/lit8 v6, v6, 0x1

    iput v6, v4, Lguh;->b:I

    goto :goto_77

    :cond_93
    iget p1, v0, Lmhk;->b:I

    add-int/lit8 p1, p1, -0x1

    iput p1, v0, Lmhk;->b:I

    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result p1

    if-eqz p1, :cond_a4

    const/4 p1, 0x0

    invoke-virtual {p0, p1}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    return-void

    :cond_a4
    invoke-virtual {p0}, Lcom/opera/android/undo/UndoBar;->f()V

    :cond_a7
    return-void
.end method

.method public final e(I)V
    .registers 3

    iget v0, p0, Lcom/opera/android/undo/UndoBar;->i:I

    if-eq v0, p1, :cond_9

    iput p1, p0, Lcom/opera/android/undo/UndoBar;->i:I

    invoke-virtual {p0}, Lcom/opera/android/undo/UndoBar;->f()V

    :cond_9
    return-void
.end method

.method public f()V
    .registers 5

    iget-object v0, p0, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v0, v0, Lmgh;->b:Ljava/lang/Object;

    check-cast v0, Lmhk;

    iget v0, v0, Lmhk;->b:I

    if-lez v0, :cond_4b

    iget v1, p0, Lcom/opera/android/undo/UndoBar;->i:I

    iget-object v2, p0, Lcom/opera/android/undo/UndoBar;->a:Landroid/app/Activity;

    if-nez v1, :cond_1f

    iget v1, p0, Lcom/opera/android/undo/UndoBar;->h:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v0

    filled-new-array {v0}, [Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v2, v1, v0}, Landroid/content/Context;->getString(I[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    goto :goto_31

    :cond_1f
    invoke-virtual {v2}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v1

    iget v2, p0, Lcom/opera/android/undo/UndoBar;->i:I

    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    filled-new-array {v3}, [Ljava/lang/Object;

    move-result-object v3

    invoke-virtual {v1, v2, v0, v3}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object v0

    :goto_31
    iget-object p0, p0, Lcom/opera/android/undo/UndoBar;->b:Lami;

    iput-object v0, p0, Lami;->e:Ljava/lang/Object;

    iget-object p0, p0, Lami;->c:Ljava/lang/Object;

    check-cast p0, Lgtj;

    if-eqz p0, :cond_4b

    iget-object p0, p0, Lgtj;->a:Lasj;

    iget-object p0, p0, Lna3;->i:Lcom/google/android/material/snackbar/Snackbar$SnackbarLayout;

    const/4 v1, 0x0

    invoke-virtual {p0, v1}, Landroid/view/ViewGroup;->getChildAt(I)Landroid/view/View;

    move-result-object p0

    check-cast p0, Lcom/google/android/material/snackbar/SnackbarContentLayout;

    iget-object p0, p0, Lcom/google/android/material/snackbar/SnackbarContentLayout;->a:Landroid/widget/TextView;

    invoke-virtual {p0, v0}, Landroid/widget/TextView;->setText(Ljava/lang/CharSequence;)V

    :cond_4b
    return-void
.end method
