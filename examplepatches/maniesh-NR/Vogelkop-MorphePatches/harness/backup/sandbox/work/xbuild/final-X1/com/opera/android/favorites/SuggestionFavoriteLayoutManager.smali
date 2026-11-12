.class public Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;
.super Landroidx/recyclerview/widget/LinearLayoutManager;
.source "SourceFile"


# instance fields
.field public a:I

.field public b:I

.field public c:I

.field public final d:Landroidx/recyclerview/widget/RecyclerView;

.field public final e:Lhok;

.field public final f:Lzzh;

.field public g:I

.field public h:I

.field public i:I


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Ltta;Lgr8;Lhok;Lzzh;)V
    .registers 8

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    const/4 v0, 0x0

    invoke-direct {p0, v0, v0}, Landroidx/recyclerview/widget/LinearLayoutManager;-><init>(IZ)V

    const/16 v1, 0x10

    iput v1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->a:I

    const/4 v1, -0x1

    iput v1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->h:I

    iput v1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->i:I

    iget v1, p2, Ltta;->c:I

    iput v1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->b:I

    iget p2, p2, Ltta;->a:I

    iput p2, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->c:I

    iget p2, p3, Lgr8;->a:I

    iput p2, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->a:I

    iput-object p1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->d:Landroidx/recyclerview/widget/RecyclerView;

    :goto_1e
    iget-object p1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->d:Landroidx/recyclerview/widget/RecyclerView;

    iget-object p1, p1, Landroidx/recyclerview/widget/RecyclerView;->p:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result p1

    iget-object p2, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->d:Landroidx/recyclerview/widget/RecyclerView;

    if-lez p1, :cond_2e

    invoke-virtual {p2, v0}, Landroidx/recyclerview/widget/RecyclerView;->r0(I)V

    goto :goto_1e

    :cond_2e
    new-instance p1, Ls93;

    const/4 p3, 0x2

    invoke-direct {p1, p0, p3}, Ls93;-><init>(Ljava/lang/Object;B)V

    invoke-virtual {p2, p1}, Landroidx/recyclerview/widget/RecyclerView;->m(Liph;)V

    iput-object p4, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->e:Lhok;

    iput-object p5, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->f:Lzzh;

    return-void
.end method


# virtual methods
.method public final D()V
    .registers 12

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findFirstVisibleItemPosition()I

    move-result v0

    invoke-virtual {p0}, Landroidx/recyclerview/widget/LinearLayoutManager;->findLastVisibleItemPosition()I

    move-result v1

    iget v2, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->h:I

    if-ne v0, v2, :cond_10

    iget v2, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->i:I

    if-eq v1, v2, :cond_9d

    :cond_10
    iput v0, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->h:I

    iput v1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->i:I

    iget-object p0, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->e:Lhok;

    iget-object v2, p0, Lhok;->D:Ljava/lang/Object;

    check-cast v2, Lw6j;

    iget-object v3, p0, Lns8;->c:Ls9i;

    const/4 v4, 0x0

    move v5, v4

    :goto_1e
    iget-object v6, v3, Ls9i;->b:Ljava/lang/Object;

    check-cast v6, Ltq8;

    iget-object v6, v6, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_9d

    iget-object v6, v3, Ls9i;->b:Ljava/lang/Object;

    check-cast v6, Ltq8;

    invoke-virtual {v6, v5}, Ltq8;->u(I)Lhq8;

    move-result-object v6

    check-cast v6, Lqok;

    iget-object v7, v6, Lqok;->e:Look;

    if-lt v5, v0, :cond_89

    if-gt v5, v1, :cond_89

    iget-object v8, p0, Lhok;->C:Ljava/lang/Object;

    check-cast v8, Ljava/util/HashSet;

    invoke-virtual {v8, v6}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_9a

    iget-byte v6, v7, Look;->d:B

    const/4 v8, 0x7

    if-eq v6, v8, :cond_83

    const/16 v8, 0x8

    if-ne v6, v8, :cond_63

    iget-object v6, p0, Lhok;->F:Ljava/lang/Object;

    check-cast v6, Lx5f;

    iget-object v8, v7, Look;->b:Ljava/lang/String;

    invoke-static {v8}, Lz7h;->s(Ljava/lang/String;)Z

    move-result v8

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance v9, Lou5;

    const/4 v10, 0x1

    invoke-direct {v9, v8, v4, v10}, Lou5;-><init>(ZZB)V

    invoke-virtual {v6, v9}, Lx5f;->T0(Lkotlin/jvm/functions/Function1;)V

    :cond_63
    iget-object v6, v2, Lw6j;->c:Ljava/lang/Object;

    check-cast v6, Landroid/util/SparseArray;

    iget-byte v8, v7, Look;->d:B

    const/4 v9, 0x6

    if-eq v8, v9, :cond_9a

    const/16 v9, 0xb

    if-eq v8, v9, :cond_9a

    iget-object v8, v2, Lw6j;->d:Ljava/lang/Object;

    check-cast v8, Landroid/util/SparseArray;

    invoke-virtual {v8, v5}, Landroid/util/SparseArray;->remove(I)V

    invoke-virtual {v6, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Look;

    if-nez v8, :cond_9a

    invoke-virtual {v6, v5, v7}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    goto :goto_9a

    :cond_83
    const/4 p0, -0x1

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    const/4 p0, 0x0

    throw p0

    :cond_89
    iget-object v6, v2, Lw6j;->c:Ljava/lang/Object;

    check-cast v6, Landroid/util/SparseArray;

    invoke-virtual {v6, v5}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;

    move-result-object v6

    if-nez v6, :cond_9a

    iget-object v6, v2, Lw6j;->d:Ljava/lang/Object;

    check-cast v6, Landroid/util/SparseArray;

    invoke-virtual {v6, v5, v7}, Landroid/util/SparseArray;->append(ILjava/lang/Object;)V

    :cond_9a
    :goto_9a
    add-int/lit8 v5, v5, 0x1

    goto :goto_1e

    :cond_9d
    return-void
.end method

.method public final onLayoutCompleted(Lvph;)V
    .registers 2

    invoke-virtual {p0}, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->D()V

    return-void
.end method

.method public final onMeasure(Landroidx/recyclerview/widget/g;Lvph;II)V
    .registers 7

    invoke-super {p0, p1, p2, p3, p4}, Landroidx/recyclerview/widget/f;->onMeasure(Landroidx/recyclerview/widget/g;Lvph;II)V

    iget-object p1, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->d:Landroidx/recyclerview/widget/RecyclerView;

    invoke-static {p1}, Lcs5;->W(Landroid/view/View;)Z

    move-result p2

    if-eqz p2, :cond_10

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p2

    goto :goto_14

    :cond_10
    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p2

    :goto_14
    invoke-virtual {p1}, Landroid/view/View;->getMeasuredWidth()I

    move-result p3

    invoke-virtual {p1}, Landroid/view/View;->getPaddingLeft()I

    move-result p4

    sub-int/2addr p3, p4

    invoke-virtual {p1}, Landroid/view/View;->getPaddingRight()I

    move-result p4

    sub-int/2addr p3, p4

    sub-int p2, p3, p2

    iget p4, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->b:I

    div-int/2addr p2, p4

    iget p4, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->a:I

    invoke-static {p2, p4}, Ljava/lang/Math;->min(II)I

    move-result p2

    iget p4, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->b:I

    mul-int/2addr p4, p2

    iget v0, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->g:I

    invoke-static {}, Li0l;->g()Z

    move-result v1

    if-eqz v1, :cond_40

    iget p3, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->b:I

    iget p4, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->c:I

    sub-int/2addr p3, p4

    iput p3, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->g:I

    goto :goto_49

    :cond_40
    sub-int/2addr p3, p4

    const/4 p4, 0x1

    if-le p2, p4, :cond_46

    add-int/lit8 p4, p2, -0x1

    :cond_46
    div-int/2addr p3, p4

    iput p3, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->g:I

    :goto_49
    if-eq v0, p3, :cond_4e

    invoke-virtual {p1}, Landroidx/recyclerview/widget/RecyclerView;->a0()V

    :cond_4e
    iget-object p0, p0, Lcom/opera/android/favorites/SuggestionFavoriteLayoutManager;->f:Lzzh;

    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p1

    invoke-virtual {p0, p1}, Lzzh;->run(Ljava/lang/Object;)V

    return-void
.end method
