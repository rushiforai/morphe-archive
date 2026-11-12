.class public final Lxm3;
.super Landroidx/recyclerview/widget/d;
.source "SourceFile"

# interfaces
.implements Lql3;
.implements Lkkm;


# instance fields
.field public final a:Lcom/opera/android/bookmarks/h;

.field public final b:Ljava/util/HashSet;

.field public c:Lml3;

.field public final d:Lc5o;

.field public e:Lxvj;

.field public f:Ljava/lang/Boolean;

.field public g:Ljava/lang/Boolean;

.field public final h:Lqhc;

.field public i:I

.field public j:Z

.field public k:I

.field public final synthetic l:Lgn3;


# direct methods
.method public constructor <init>(Lgn3;Li53;I)V
    .registers 7

    invoke-static {p1}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iput-object p1, p0, Lxm3;->l:Lgn3;

    invoke-direct {p0}, Landroidx/recyclerview/widget/d;-><init>()V

    new-instance p1, Ljava/util/HashSet;

    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    iput-object p1, p0, Lxm3;->b:Ljava/util/HashSet;

    new-instance p1, Lc5o;

    invoke-direct {p1}, Ljava/lang/Object;-><init>()V

    iput-object p0, p1, Lc5o;->b:Ljava/lang/Object;

    iput-object p1, p0, Lxm3;->d:Lc5o;

    new-instance p1, Lqhc;

    const-wide/16 v0, -0x2

    const-string v2, ""

    invoke-static {v0, v1, v2, v2}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v0

    const/4 v1, 0x6

    invoke-direct {p1, v0, v1}, Lqhc;-><init>(Lal3;I)V

    iput-object p1, p0, Lxm3;->h:Lqhc;

    const/4 p1, -0x1

    iput p1, p0, Lxm3;->k:I

    check-cast p2, Lcom/opera/android/bookmarks/h;

    iput-object p2, p0, Lxm3;->a:Lcom/opera/android/bookmarks/h;

    iput p3, p0, Lxm3;->i:I

    new-instance p1, Lxvj;

    new-instance p2, Lk53;

    invoke-direct {p2, p0, p0, p3}, Lk53;-><init>(Lxm3;Lxm3;I)V

    const-class p3, Lqhc;

    invoke-direct {p1, p3, p2}, Lxvj;-><init>(Ljava/lang/Class;Lyvj;)V

    iput-object p1, p0, Lxm3;->e:Lxvj;

    const/4 p1, 0x1

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->setHasStableIds(Z)V

    new-instance p1, Lj53;

    invoke-direct {p1, p0}, Lj53;-><init>(Lxm3;)V

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->registerAdapterDataObserver(Lgph;)V

    return-void
.end method

.method public static G(Ljava/lang/Object;Lml3;)Z
    .registers 2

    if-nez p0, :cond_8

    if-nez p1, :cond_6

    const/4 p0, 0x1

    return p0

    :cond_6
    const/4 p0, 0x0

    return p0

    :cond_8
    invoke-virtual {p0, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result p0

    return p0
.end method


# virtual methods
.method public final A(Lal3;Lml3;)V
    .registers 12

    iget-object v0, p0, Lxm3;->d:Lc5o;

    const/4 v1, 0x0

    iput-object v1, v0, Lc5o;->a:Ljava/lang/Object;

    iget-object v0, p0, Lxm3;->c:Lml3;

    invoke-static {v0, p2}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result v0

    iget-object v1, p0, Lxm3;->c:Lml3;

    const/4 v2, 0x3

    const/4 v3, 0x1

    const/4 v4, 0x0

    if-eqz v1, :cond_6c

    invoke-interface {v1}, Lml3;->h()Z

    move-result v1

    if-eqz v1, :cond_6c

    invoke-static {p2}, Lalo;->S(Lml3;)Z

    move-result v1

    if-eqz v1, :cond_6c

    iget-object v1, p0, Lxm3;->f:Ljava/lang/Boolean;

    if-eqz v1, :cond_27

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    goto :goto_68

    :cond_27
    iget-object v1, p0, Lxm3;->c:Lml3;

    if-eqz v1, :cond_36

    invoke-interface {v1}, Lml3;->h()Z

    move-result v1

    if-nez v1, :cond_36

    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lxm3;->f:Ljava/lang/Boolean;

    goto :goto_62

    :cond_36
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v1, p0, Lxm3;->f:Ljava/lang/Boolean;

    iget-object v1, p0, Lxm3;->e:Lxvj;

    move v5, v4

    :goto_3d
    iget v6, v1, Lxvj;->h:I

    invoke-static {v6, v2}, Ljava/lang/Math;->min(II)I

    move-result v6

    if-ge v5, v6, :cond_62

    invoke-virtual {v1, v5}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lqhc;

    iget-object v6, v6, Lqhc;->a:Lal3;

    invoke-interface {v6}, Lol3;->g()Z

    move-result v7

    if-eqz v7, :cond_5f

    check-cast v6, Lml3;

    invoke-static {v6}, Lalo;->S(Lml3;)Z

    move-result v6

    if-eqz v6, :cond_5f

    sget-object v6, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v6, p0, Lxm3;->f:Ljava/lang/Boolean;

    :cond_5f
    add-int/lit8 v5, v5, 0x1

    goto :goto_3d

    :cond_62
    :goto_62
    iget-object v1, p0, Lxm3;->f:Ljava/lang/Boolean;

    invoke-virtual {v1}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v1

    :goto_68
    if-nez v1, :cond_6c

    move v1, v3

    goto :goto_6d

    :cond_6c
    move v1, v4

    :goto_6d
    iget-object v5, p0, Lxm3;->c:Lml3;

    if-eqz v5, :cond_c9

    invoke-interface {v5}, Lml3;->h()Z

    move-result v5

    if-eqz v5, :cond_c9

    invoke-static {p2}, Lalo;->T(Lml3;)Z

    move-result v5

    if-eqz v5, :cond_c9

    iget-object v5, p0, Lxm3;->g:Ljava/lang/Boolean;

    if-eqz v5, :cond_86

    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    goto :goto_c7

    :cond_86
    iget-object v5, p0, Lxm3;->c:Lml3;

    if-eqz v5, :cond_95

    invoke-interface {v5}, Lml3;->h()Z

    move-result v5

    if-nez v5, :cond_95

    sget-object v2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v2, p0, Lxm3;->g:Ljava/lang/Boolean;

    goto :goto_c1

    :cond_95
    sget-object v5, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    iput-object v5, p0, Lxm3;->g:Ljava/lang/Boolean;

    iget-object v5, p0, Lxm3;->e:Lxvj;

    move v6, v4

    :goto_9c
    iget v7, v5, Lxvj;->h:I

    invoke-static {v7, v2}, Ljava/lang/Math;->min(II)I

    move-result v7

    if-ge v6, v7, :cond_c1

    invoke-virtual {v5, v6}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lqhc;

    iget-object v7, v7, Lqhc;->a:Lal3;

    invoke-interface {v7}, Lol3;->g()Z

    move-result v8

    if-eqz v8, :cond_be

    check-cast v7, Lml3;

    invoke-static {v7}, Lalo;->T(Lml3;)Z

    move-result v7

    if-eqz v7, :cond_be

    sget-object v7, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    iput-object v7, p0, Lxm3;->g:Ljava/lang/Boolean;

    :cond_be
    add-int/lit8 v6, v6, 0x1

    goto :goto_9c

    :cond_c1
    :goto_c1
    iget-object v2, p0, Lxm3;->g:Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    :goto_c7
    if-eqz v2, :cond_ca

    :cond_c9
    move v3, v4

    :cond_ca
    if-nez v0, :cond_d1

    if-nez v1, :cond_d0

    if-eqz v3, :cond_d1

    :cond_d0
    move-object p1, p2

    :cond_d1
    if-nez v0, :cond_db

    if-nez v1, :cond_db

    if-nez v3, :cond_db

    invoke-virtual {p0, p2}, Lxm3;->P(Lml3;)V

    return-void

    :cond_db
    invoke-static {p1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object p1

    iget-object p2, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p2, p1}, Lxvj;->a(Ljava/lang/Object;)I

    move-result p1

    iget-boolean p2, p0, Lxm3;->j:Z

    if-eqz p2, :cond_ec

    iput p1, p0, Lxm3;->k:I

    return-void

    :cond_ec
    iget-object p0, p0, Lxm3;->l:Lgn3;

    iget-object p0, p0, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    return-void
.end method

.method public final D(Ljava/util/Collection;Lml3;)V
    .registers 6

    invoke-interface {p1}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_4
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1c

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lal3;

    iget-object v2, p0, Lxm3;->l:Lgn3;

    iget-object v2, v2, Lgn3;->A:Lum3;

    invoke-static {v1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object v1

    invoke-virtual {v2, v1}, Lcom/opera/android/undo/UndoBar;->d(Lqhc;)V

    goto :goto_4

    :cond_1c
    iget-object v0, p0, Lxm3;->c:Lml3;

    invoke-static {v0, p2}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result v0

    if-eqz v0, :cond_31

    iget-object p2, p0, Lxm3;->d:Lc5o;

    const/4 v0, 0x0

    iput-object v0, p2, Lc5o;->a:Ljava/lang/Object;

    invoke-static {p1}, Lalo;->k(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxm3;->L(Ljava/util/List;)V

    return-void

    :cond_31
    invoke-virtual {p0, p2}, Lxm3;->P(Lml3;)V

    return-void
.end method

.method public final E()V
    .registers 2

    const/4 v0, 0x1

    iput-boolean v0, p0, Lxm3;->j:Z

    return-void
.end method

.method public final H(I)Lqhc;
    .registers 2

    iget-object p0, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqhc;

    return-object p0
.end method

.method public final I(Lqhc;)I
    .registers 5

    const/4 v0, 0x0

    :goto_1
    iget-object v1, p0, Lxm3;->e:Lxvj;

    iget v2, v1, Lxvj;->h:I

    if-ge v0, v2, :cond_17

    invoke-virtual {v1, v0}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lqhc;

    invoke-virtual {v1, p1}, Lqhc;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_14

    return v0

    :cond_14
    add-int/lit8 v0, v0, 0x1

    goto :goto_1

    :cond_17
    const/4 p0, -0x1

    return p0
.end method

.method public final J()V
    .registers 12

    iget-object v0, p0, Lxm3;->l:Lgn3;

    iget-object v1, v0, Lgn3;->u:Ltzi;

    iget-object v2, v0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v1, v1, Ltzi;->a:Le5d;

    invoke-virtual {v1}, Le5d;->clear()V

    iget-object v1, p0, Lxm3;->d:Lc5o;

    const/4 v3, 0x0

    iput-object v3, v1, Lc5o;->a:Ljava/lang/Object;

    iput-object v3, p0, Lxm3;->f:Ljava/lang/Boolean;

    iput-object v3, p0, Lxm3;->g:Ljava/lang/Boolean;

    iget-object v4, p0, Lxm3;->e:Lxvj;

    invoke-virtual {v4}, Lxvj;->d()V

    new-instance v4, Lxvj;

    new-instance v5, Lk53;

    iget v6, p0, Lxm3;->i:I

    invoke-direct {v5, p0, p0, v6}, Lk53;-><init>(Lxm3;Lxm3;I)V

    const-class v6, Lqhc;

    invoke-direct {v4, v6, v5}, Lxvj;-><init>(Ljava/lang/Class;Lyvj;)V

    iput-object v4, p0, Lxm3;->e:Lxvj;

    iget-object v4, p0, Lxm3;->c:Lml3;

    if-nez v4, :cond_30

    sget-object v1, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_4b

    :cond_30
    iget-object v5, v1, Lc5o;->a:Ljava/lang/Object;

    check-cast v5, Ljava/util/List;

    if-nez v5, :cond_47

    iget-object v5, v1, Lc5o;->b:Ljava/lang/Object;

    check-cast v5, Lxm3;

    iget-object v5, v5, Lxm3;->c:Lml3;

    if-nez v5, :cond_41

    sget-object v5, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    goto :goto_45

    :cond_41
    invoke-interface {v5}, Lml3;->i()Ljava/util/List;

    move-result-object v5

    :goto_45
    iput-object v5, v1, Lc5o;->a:Ljava/lang/Object;

    :cond_47
    invoke-static {v5}, Lalo;->k(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    :goto_4b
    if-eqz v4, :cond_109

    invoke-virtual {v0}, Lgn3;->a()Lml3;

    move-result-object v4

    if-eqz v4, :cond_61

    invoke-interface {v4}, Lml3;->h()Z

    move-result v5

    if-nez v5, :cond_61

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-interface {v4, v3}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v3

    :cond_61
    if-eqz v3, :cond_6e

    new-instance v2, Lqhc;

    const/4 v4, 0x2

    invoke-direct {v2, v3, v4}, Lqhc;-><init>(Lal3;I)V

    invoke-interface {v1, v2}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto/16 :goto_109

    :cond_6e
    invoke-static {v2}, Lalo;->G(Lcom/opera/android/bookmarks/h;)Z

    move-result v3

    if-eqz v3, :cond_7f

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->l()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-static {v3}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_7f
    sget-boolean v3, Lalo;->j:Z

    const/4 v4, 0x1

    if-nez v3, :cond_95

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-virtual {v3}, Lcom/opera/android/bookmarks/c;->isEmpty()Z

    move-result v3

    xor-int/2addr v3, v4

    sget-boolean v5, Lalo;->j:Z

    if-eq v5, v3, :cond_94

    sput-boolean v3, Lalo;->j:Z

    goto :goto_95

    :cond_94
    move v3, v5

    :cond_95
    :goto_95
    if-eqz v3, :cond_a2

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->n()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    invoke-static {v3}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object v3

    invoke-interface {v1, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_a2
    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->t()Z

    move-result v3

    if-eqz v3, :cond_b7

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->p()Lcom/opera/android/bookmarks/c;

    move-result-object v3

    if-eqz v3, :cond_b7

    new-instance v5, Lqhc;

    const/4 v6, 0x5

    invoke-direct {v5, v3, v6}, Lqhc;-><init>(Lal3;I)V

    invoke-interface {v1, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    :cond_b7
    iget-object v3, v0, Lgn3;->i:Ldb;

    iget-object v5, v0, Lgn3;->h:Lzwk;

    sget-boolean v6, Lxgh;->a:Z

    const-string v7, ""

    const-wide/16 v8, -0x2

    const/4 v10, 0x0

    if-nez v6, :cond_d9

    invoke-static {v3, v5}, Lxgh;->s(Ldb;Lzwk;)Z

    move-result v3

    if-eqz v3, :cond_d9

    new-instance v2, Lqhc;

    invoke-static {v8, v9, v7, v7}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v3

    const/16 v4, 0x8

    invoke-direct {v2, v3, v4}, Lqhc;-><init>(Lal3;I)V

    invoke-interface {v1, v10, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_109

    :cond_d9
    iget-object v3, v0, Lgn3;->H:Lsom;

    invoke-virtual {v3, v4}, Lsom;->R(I)Z

    move-result v3

    if-eqz v3, :cond_ef

    new-instance v2, Lqhc;

    invoke-static {v8, v9, v7, v7}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v3

    const/4 v4, 0x7

    invoke-direct {v2, v3, v4}, Lqhc;-><init>(Lal3;I)V

    invoke-interface {v1, v10, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    goto :goto_109

    :cond_ef
    invoke-interface {v1}, Ljava/util/List;->isEmpty()Z

    move-result v3

    if-nez v3, :cond_109

    invoke-virtual {v2}, Lcom/opera/android/bookmarks/h;->s()Z

    move-result v2

    if-eqz v2, :cond_109

    new-instance v2, Lqhc;

    invoke-static {v8, v9, v7, v7}, Llkj;->k(JLjava/lang/String;Ljava/lang/String;)Llkj;

    move-result-object v3

    const/16 v4, 0x9

    invoke-direct {v2, v3, v4}, Lqhc;-><init>(Lal3;I)V

    invoke-interface {v1, v10, v2}, Ljava/util/List;->add(ILjava/lang/Object;)V

    :cond_109
    :goto_109
    iget-object p0, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p0, v1}, Lxvj;->c(Ljava/util/Collection;)V

    iget-object p0, v0, Lgn3;->D:Lxw;

    if-eqz p0, :cond_115

    invoke-virtual {p0}, Lo73;->b()Z

    :cond_115
    return-void
.end method

.method public final K(Lqhc;)V
    .registers 2

    if-nez p1, :cond_3

    return-void

    :cond_3
    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxm3;->L(Ljava/util/List;)V

    return-void
.end method

.method public final L(Ljava/util/List;)V
    .registers 6

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    :cond_5
    :goto_5
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqhc;

    invoke-virtual {p0, v2}, Lxm3;->I(Lqhc;)I

    move-result v2

    const/4 v3, -0x1

    if-eq v2, v3, :cond_5

    iget-object v1, p0, Lxm3;->e:Lxvj;

    invoke-virtual {v1}, Lxvj;->i()V

    invoke-virtual {v1, v2}, Lxvj;->f(I)Ljava/lang/Object;

    const/4 v3, 0x1

    invoke-virtual {v1, v2, v3}, Lxvj;->h(IZ)V

    move v1, v3

    goto :goto_5

    :cond_26
    if-eqz v1, :cond_3d

    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lxm3;->l:Lgn3;

    iget-object v0, p0, Lgn3;->D:Lxw;

    if-eqz v0, :cond_3d

    iget-object v0, v0, Lo73;->h:Lqhc;

    invoke-interface {p1, v0}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3d

    iget-object p0, p0, Lgn3;->D:Lxw;

    invoke-virtual {p0}, Lo73;->b()Z

    :cond_3d
    return-void
.end method

.method public final M()V
    .registers 11

    iget-object v0, p0, Lxm3;->l:Lgn3;

    iget-object v1, v0, Lgn3;->y:Lrm3;

    invoke-virtual {v1}, Lshf;->q()V

    iget-object v1, p0, Lxm3;->e:Lxvj;

    invoke-virtual {v1}, Lxvj;->d()V

    new-instance v1, Lxvj;

    new-instance v2, Lk53;

    const/4 v3, 0x1

    invoke-direct {v2, p0, p0, v3}, Lk53;-><init>(Lxm3;Lxm3;I)V

    const-class v4, Lqhc;

    invoke-direct {v1, v4, v2}, Lxvj;-><init>(Ljava/lang/Class;Lyvj;)V

    iput-object v1, p0, Lxm3;->e:Lxvj;

    iget-object v1, v0, Lgn3;->f:Lne5;

    iget-object v0, v0, Lgn3;->y:Lrm3;

    iget-object v2, v0, Lshf;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/String;

    sget-object v4, Laik;->a:[Ljava/lang/String;

    if-nez v2, :cond_29

    const-string v2, ""

    :cond_29
    iget-object v4, v1, Lne5;->d:Ljava/lang/Object;

    check-cast v4, Ljava/util/ArrayList;

    iget-object v5, v1, Lne5;->c:Ljava/lang/Object;

    check-cast v5, Ljava/lang/String;

    iput-object v2, v1, Lne5;->c:Ljava/lang/Object;

    iget-object v6, v1, Lne5;->b:Ljava/lang/Object;

    check-cast v6, Ljava/util/ArrayList;

    const/4 v7, 0x0

    if-eqz v5, :cond_41

    invoke-static {v2, v5, v7}, Lkotlin/text/StringsKt;->E(Ljava/lang/CharSequence;Ljava/lang/CharSequence;Z)Z

    move-result v5

    if-ne v5, v3, :cond_41

    move-object v6, v4

    :cond_41
    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v5

    :cond_4a
    :goto_4a
    if-ge v7, v5, :cond_5f

    invoke-virtual {v6, v7}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v8

    add-int/lit8 v7, v7, 0x1

    move-object v9, v8

    check-cast v9, Lal3;

    invoke-virtual {v1, v9, v2}, Lne5;->t(Lal3;Ljava/lang/String;)Z

    move-result v9

    if-eqz v9, :cond_4a

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4a

    :cond_5f
    invoke-virtual {v4}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    iget-object p0, p0, Lxm3;->e:Lxvj;

    invoke-static {v3}, Lalo;->k(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object v1

    invoke-virtual {p0, v1}, Lxvj;->c(Ljava/util/Collection;)V

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p0

    if-eqz p0, :cond_78

    const/4 p0, 0x0

    invoke-virtual {v0, p0}, Lshf;->S(Ljava/lang/Object;)V

    :cond_78
    return-void
.end method

.method public final N(Ljava/util/List;)Le5d;
    .registers 7

    new-instance v0, Ljava/util/ArrayList;

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result v1

    invoke-direct {v0, v1}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_28

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lqhc;

    iget-object v3, p0, Lxm3;->e:Lxvj;

    invoke-virtual {v3, v2}, Lxvj;->g(Ljava/lang/Object;)V

    new-instance v3, Lguh;

    const/4 v4, 0x0

    invoke-direct {v3, v2, v4}, Lguh;-><init>(Ljava/lang/Object;I)V

    invoke-virtual {v0, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_d

    :cond_28
    check-cast p1, Ljava/util/List;

    iget-object p0, p0, Lxm3;->l:Lgn3;

    iget-object v1, p0, Lgn3;->D:Lxw;

    if-eqz v1, :cond_3d

    iget-object v1, v1, Lo73;->h:Lqhc;

    invoke-interface {p1, v1}, Ljava/util/Collection;->contains(Ljava/lang/Object;)Z

    move-result p1

    if-eqz p1, :cond_3d

    iget-object p0, p0, Lgn3;->D:Lxw;

    invoke-virtual {p0}, Lo73;->b()Z

    :cond_3d
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

.method public final P(Lml3;)V
    .registers 5

    iget-object v0, p0, Lxm3;->a:Lcom/opera/android/bookmarks/h;

    invoke-virtual {v0}, Lcom/opera/android/bookmarks/h;->o()Lcom/opera/android/bookmarks/c;

    move-result-object v0

    :goto_6
    if-eqz p1, :cond_19

    iget-object v1, p0, Lxm3;->c:Lml3;

    invoke-interface {p1, v0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object v2

    invoke-static {v1, v2}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result v1

    if-nez v1, :cond_1a

    invoke-interface {p1, v0}, Lal3;->a(Lcom/opera/android/bookmarks/c;)Lml3;

    move-result-object p1

    goto :goto_6

    :cond_19
    const/4 p1, 0x0

    :cond_1a
    if-eqz p1, :cond_34

    invoke-static {p1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object p1

    iget-boolean v0, p0, Lxm3;->j:Z

    if-eqz v0, :cond_2a

    iget-object p0, p0, Lxm3;->b:Ljava/util/HashSet;

    invoke-virtual {p0, p1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    return-void

    :cond_2a
    invoke-virtual {p0, p1}, Lxm3;->I(Lqhc;)I

    move-result p1

    const/4 v0, -0x1

    if-eq p1, v0, :cond_34

    invoke-virtual {p0, p1}, Landroidx/recyclerview/widget/d;->notifyItemChanged(I)V

    :cond_34
    return-void
.end method

.method public final a(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, p2, p3}, Lxm3;->d(Ljava/util/Collection;Lml3;Lml3;)V

    return-void
.end method

.method public final d(Ljava/util/Collection;Lml3;Lml3;)V
    .registers 7

    iget-object v0, p0, Lxm3;->l:Lgn3;

    invoke-virtual {v0}, Lgn3;->e()Z

    move-result v0

    if-eqz v0, :cond_c

    invoke-virtual {p0}, Lxm3;->M()V

    return-void

    :cond_c
    iget-object v0, p0, Lxm3;->d:Lc5o;

    const/4 v1, 0x0

    iput-object v1, v0, Lc5o;->a:Ljava/lang/Object;

    iget-object v2, p0, Lxm3;->c:Lml3;

    invoke-static {v2, p2}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result v2

    if-eqz v2, :cond_26

    iput-object v1, v0, Lc5o;->a:Ljava/lang/Object;

    invoke-static {p1}, Lalo;->k(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxm3;->L(Ljava/util/List;)V

    invoke-virtual {p0, p3}, Lxm3;->P(Lml3;)V

    return-void

    :cond_26
    iget-object v2, p0, Lxm3;->c:Lml3;

    invoke-static {v2, p3}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result v2

    if-eqz v2, :cond_3d

    iput-object v1, v0, Lc5o;->a:Ljava/lang/Object;

    invoke-static {p1}, Lalo;->k(Ljava/util/Collection;)Ljava/util/ArrayList;

    move-result-object p1

    iget-object p3, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p3, p1}, Lxvj;->c(Ljava/util/Collection;)V

    invoke-virtual {p0, p2}, Lxm3;->P(Lml3;)V

    return-void

    :cond_3d
    invoke-virtual {p0, p2}, Lxm3;->P(Lml3;)V

    invoke-virtual {p0, p3}, Lxm3;->P(Lml3;)V

    return-void
.end method

.method public final e(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 8

    iget-object v0, p0, Lxm3;->d:Lc5o;

    const/4 v1, 0x0

    iput-object v1, v0, Lc5o;->a:Ljava/lang/Object;

    iget-object v0, p0, Lxm3;->c:Lml3;

    invoke-static {v0, p2}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result p2

    if-eqz p2, :cond_62

    invoke-static {p1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxm3;->I(Lqhc;)I

    move-result p2

    if-ltz p2, :cond_62

    iget-object p0, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p0}, Lxvj;->i()V

    invoke-virtual {p0, p2}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object v0

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eq v0, p1, :cond_2e

    iget-object v3, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v3, v0, p1}, Lqw4;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v3

    if-eqz v3, :cond_2e

    move v3, v2

    goto :goto_2f

    :cond_2e
    move v3, v1

    :goto_2f
    if-eq v0, p1, :cond_49

    iget-object v4, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v4, v0, p1}, Lqw4;->compare(Ljava/lang/Object;Ljava/lang/Object;)I

    move-result v4

    if-nez v4, :cond_49

    iget-object v2, p0, Lxvj;->a:[Ljava/lang/Object;

    aput-object p1, v2, p2

    if-eqz v3, :cond_62

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-virtual {p0, v0, p1}, Lqw4;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    invoke-virtual {p0, p2, v1, p1}, Lqw4;->I(IILjava/lang/Object;)V

    return-void

    :cond_49
    if-eqz v3, :cond_54

    iget-object v3, p0, Lxvj;->f:Lqw4;

    invoke-virtual {v3, v0, p1}, Lqw4;->d(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    invoke-virtual {v3, p2, v1, v0}, Lqw4;->I(IILjava/lang/Object;)V

    :cond_54
    invoke-virtual {p0, p2, v2}, Lxvj;->h(IZ)V

    invoke-virtual {p0, p1, v2}, Lxvj;->b(Ljava/lang/Object;Z)I

    move-result p1

    if-eq p2, p1, :cond_62

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-interface {p0, p2, p1}, Lsic;->S(II)V

    :cond_62
    return-void
.end method

.method public final getItemCount()I
    .registers 1

    iget-object p0, p0, Lxm3;->e:Lxvj;

    iget p0, p0, Lxvj;->h:I

    return p0
.end method

.method public final getItemId(I)J
    .registers 2

    iget-object p0, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lqhc;

    iget-object p0, p0, Lqhc;->a:Lal3;

    invoke-interface {p0}, Lal3;->getId()J

    move-result-wide p0

    return-wide p0
.end method

.method public final getItemViewType(I)I
    .registers 2

    invoke-virtual {p0, p1}, Lxm3;->H(I)Lqhc;

    move-result-object p0

    invoke-virtual {p0}, Lqhc;->c()I

    move-result p0

    invoke-static {p0}, Lvep;->A(I)I

    move-result p0

    return p0
.end method

.method public final m()V
    .registers 5

    iget-object v0, p0, Lxm3;->l:Lgn3;

    iget-object v1, v0, Lgn3;->A:Lum3;

    iget-object v2, v1, Lcom/opera/android/undo/UndoBar;->c:Lmgh;

    iget-object v2, v2, Lmgh;->b:Ljava/lang/Object;

    check-cast v2, Lmhk;

    const/4 v3, 0x0

    iput v3, v2, Lmhk;->b:I

    iget-object v2, v2, Lmhk;->c:Ljava/lang/Object;

    check-cast v2, Ljava/util/LinkedList;

    invoke-virtual {v2}, Ljava/util/LinkedList;->clear()V

    invoke-virtual {v1, v3}, Lcom/opera/android/undo/UndoBar;->a(Z)V

    invoke-virtual {v0}, Lgn3;->e()Z

    move-result v0

    if-eqz v0, :cond_21

    invoke-virtual {p0}, Lxm3;->M()V

    return-void

    :cond_21
    invoke-virtual {p0}, Lxm3;->J()V

    return-void
.end method

.method public final onBindViewHolder(Landroidx/recyclerview/widget/i;I)V
    .registers 6

    check-cast p1, Le7n;

    invoke-virtual {p0, p2}, Lxm3;->H(I)Lqhc;

    move-result-object p2

    iget v0, p0, Lxm3;->i:I

    const/4 v1, 0x3

    const/4 v2, 0x0

    if-ne v0, v1, :cond_e

    const/4 v0, 0x1

    goto :goto_f

    :cond_e
    move v0, v2

    :goto_f
    iput-object p2, p1, Le7n;->i:Lqhc;

    iput-boolean v0, p1, Le7n;->j:Z

    invoke-virtual {p1}, Lak7;->U()V

    iget-object p2, p1, Le7n;->i:Lqhc;

    invoke-virtual {p1, p2}, Le7n;->k0(Lqhc;)V

    instance-of p2, p1, Ld7n;

    if-eqz p2, :cond_30

    check-cast p1, Ld7n;

    iget-object p0, p0, Lxm3;->l:Lgn3;

    invoke-virtual {p0}, Lgn3;->e()Z

    move-result p0

    iget-object p1, p1, Ld7n;->n:Landroid/widget/TextView;

    if-nez p0, :cond_2d

    const/16 v2, 0x8

    :cond_2d
    invoke-virtual {p1, v2}, Landroid/view/View;->setVisibility(I)V

    :cond_30
    return-void
.end method

.method public final onCreateViewHolder(Landroid/view/ViewGroup;I)Landroidx/recyclerview/widget/i;
    .registers 7

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-static {v0}, Landroid/view/LayoutInflater;->from(Landroid/content/Context;)Landroid/view/LayoutInflater;

    move-result-object v0

    const/4 v1, 0x0

    iget-object p0, p0, Lxm3;->l:Lgn3;

    if-nez p2, :cond_1c

    new-instance p2, Le7n;

    const v2, 0x7f0d038d

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget-object p0, p0, Lgn3;->u:Ltzi;

    invoke-direct {p2, p1, p0}, Lak7;-><init>(Landroid/view/View;Ltzi;)V

    return-object p2

    :cond_1c
    const/4 v2, 0x4

    const/4 v3, 0x1

    if-ne p2, v2, :cond_2f

    new-instance p2, Ldn3;

    const v2, 0x7f0d03e8

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lgn3;->u:Ltzi;

    invoke-direct {p2, p0, p1, v0, v3}, Ldn3;-><init>(Lgn3;Landroid/view/View;Ltzi;B)V

    return-object p2

    :cond_2f
    const/4 v2, 0x3

    if-ne p2, v2, :cond_41

    new-instance p2, Ldn3;

    const v2, 0x7f0d03e5

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lgn3;->u:Ltzi;

    invoke-direct {p2, p0, p1, v0, v1}, Ldn3;-><init>(Lgn3;Landroid/view/View;Ltzi;B)V

    return-object p2

    :cond_41
    const/4 v2, 0x5

    if-ne p2, v2, :cond_75

    new-instance p2, Lan3;

    new-instance v0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;

    invoke-virtual {p1}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object p1

    const/4 v1, 0x0

    const/4 v2, 0x6

    invoke-direct {v0, p1, v1, v2}, Lcom/opera/android/bookmarks/ImportBookmarksBanner;-><init>(Landroid/content/Context;Landroid/util/AttributeSet;I)V

    iget-object p1, p0, Lgn3;->u:Ltzi;

    invoke-direct {p2, v0, p1}, Lak7;-><init>(Landroid/view/View;Ltzi;)V

    new-instance p1, Lgf;

    const/16 v1, 0x19

    invoke-direct {p1, p0, v1}, Lgf;-><init>(Ljava/lang/Object;B)V

    iget-object v0, v0, Lcom/opera/android/bookmarks/ImportBookmarksBanner;->a:Lov0;

    iget-object v1, v0, Lov0;->d:Ljava/lang/Object;

    check-cast v1, Lcom/google/android/material/button/MaterialButton;

    invoke-virtual {v1, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    new-instance p1, Lnf;

    const/16 v1, 0x12

    invoke-direct {p1, p2, p0, v1}, Lnf;-><init>(Ljava/lang/Object;Ljava/lang/Object;B)V

    iget-object p0, v0, Lov0;->c:Ljava/lang/Object;

    check-cast p0, Lcom/opera/android/custom_views/StylingImageView;

    invoke-virtual {p0, p1}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2

    :cond_75
    const v2, 0x7f0d0419

    if-ne p2, v3, :cond_88

    new-instance p2, Lb7n;

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lgn3;->u:Ltzi;

    iget-object v1, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-direct {p2, p1, v0, v1}, Ld7n;-><init>(Landroid/view/View;Ltzi;Li53;)V

    goto :goto_9c

    :cond_88
    new-instance p2, Lc7n;

    invoke-virtual {v0, v2, p1, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;Z)Landroid/view/View;

    move-result-object p1

    iget-object v0, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    iget-object v0, v0, Lcom/opera/android/bookmarks/h;->m:Leme;

    invoke-static {v0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    iget-object v1, p0, Lgn3;->u:Ltzi;

    iget-object v2, p0, Lgn3;->b:Lcom/opera/android/bookmarks/h;

    invoke-direct {p2, p1, v0, v1, v2}, Lc7n;-><init>(Landroid/view/View;Leme;Ltzi;Li53;)V

    :goto_9c
    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-static {p0}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object v0

    invoke-virtual {p1, v0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnLongClickListener(Landroid/view/View$OnLongClickListener;)V

    iget-object p1, p2, Landroidx/recyclerview/widget/i;->itemView:Landroid/view/View;

    const v0, 0x7f0a05ba

    invoke-virtual {p1, v0}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    move-result-object p1

    invoke-static {p0}, Lt0h;->i(Landroid/view/View$OnClickListener;)Lks8;

    move-result-object p0

    invoke-virtual {p1, p0}, Landroid/view/View;->setOnClickListener(Landroid/view/View$OnClickListener;)V

    return-object p2
.end method

.method public final onViewRecycled(Landroidx/recyclerview/widget/i;)V
    .registers 2

    check-cast p1, Le7n;

    invoke-virtual {p1}, Le7n;->e0()V

    return-void
.end method

.method public final p()V
    .registers 11

    const/4 v0, 0x0

    iput-boolean v0, p0, Lxm3;->j:Z

    iget-object v1, p0, Lxm3;->b:Ljava/util/HashSet;

    invoke-virtual {v1}, Ljava/util/HashSet;->size()I

    move-result v2

    new-array v2, v2, [I

    invoke-virtual {v1}, Ljava/util/HashSet;->iterator()Ljava/util/Iterator;

    move-result-object v3

    move v4, v0

    :cond_10
    :goto_10
    invoke-interface {v3}, Ljava/util/Iterator;->hasNext()Z

    move-result v5

    const/4 v6, -0x1

    if-eqz v5, :cond_29

    invoke-interface {v3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lqhc;

    invoke-virtual {p0, v5}, Lxm3;->I(Lqhc;)I

    move-result v5

    if-eq v5, v6, :cond_10

    add-int/lit8 v6, v4, 0x1

    aput v5, v2, v4

    move v4, v6

    goto :goto_10

    :cond_29
    invoke-static {v2, v0, v4}, Ljava/util/Arrays;->sort([III)V

    move v3, v0

    move v5, v3

    move v7, v5

    :goto_2f
    if-ge v3, v4, :cond_47

    if-nez v5, :cond_37

    aget v7, v2, v3

    const/4 v5, 0x1

    goto :goto_44

    :cond_37
    aget v8, v2, v3

    add-int v9, v7, v5

    if-ne v8, v9, :cond_40

    add-int/lit8 v5, v5, 0x1

    goto :goto_44

    :cond_40
    invoke-virtual {p0, v7, v5}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    move v5, v0

    :goto_44
    add-int/lit8 v3, v3, 0x1

    goto :goto_2f

    :cond_47
    if-lez v5, :cond_4c

    invoke-virtual {p0, v7, v5}, Landroidx/recyclerview/widget/d;->notifyItemRangeChanged(II)V

    :cond_4c
    invoke-virtual {v1}, Ljava/util/HashSet;->clear()V

    iget v0, p0, Lxm3;->k:I

    if-eq v0, v6, :cond_5c

    iget-object v1, p0, Lxm3;->l:Lgn3;

    iget-object v1, v1, Lgn3;->r:Lcom/opera/android/custom_views/FadingRecyclerView;

    invoke-virtual {v1, v0}, Landroidx/recyclerview/widget/RecyclerView;->x0(I)V

    iput v6, p0, Lxm3;->k:I

    :cond_5c
    return-void
.end method

.method public final s(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 4

    iget-object v0, p0, Lxm3;->c:Lml3;

    invoke-static {v0, p2}, Lxm3;->G(Ljava/lang/Object;Lml3;)Z

    move-result p2

    if-eqz p2, :cond_36

    if-nez p1, :cond_e

    invoke-virtual {p0}, Lxm3;->J()V

    return-void

    :cond_e
    iget-object p2, p0, Lxm3;->d:Lc5o;

    const/4 v0, 0x0

    iput-object v0, p2, Lc5o;->a:Ljava/lang/Object;

    invoke-static {p1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object p1

    invoke-virtual {p0, p1}, Lxm3;->I(Lqhc;)I

    move-result p1

    const/4 p2, -0x1

    if-eq p1, p2, :cond_36

    iget-object p0, p0, Lxm3;->e:Lxvj;

    invoke-virtual {p0}, Lxvj;->i()V

    invoke-virtual {p0, p1}, Lxvj;->f(I)Ljava/lang/Object;

    move-result-object p2

    const/4 v0, 0x0

    invoke-virtual {p0, p1, v0}, Lxvj;->h(IZ)V

    invoke-virtual {p0, p2, v0}, Lxvj;->b(Ljava/lang/Object;Z)I

    move-result p2

    if-eq p1, p2, :cond_36

    iget-object p0, p0, Lxvj;->f:Lqw4;

    invoke-interface {p0, p1, p2}, Lsic;->S(II)V

    :cond_36
    return-void
.end method

.method public final t(Le5d;)V
    .registers 4

    invoke-virtual {p1}, Le5d;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_4
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lguh;

    iget-object v1, p0, Lxm3;->e:Lxvj;

    iget-object v0, v0, Lguh;->a:Ljava/lang/Object;

    check-cast v0, Lqhc;

    invoke-virtual {v1, v0}, Lxvj;->a(Ljava/lang/Object;)I

    goto :goto_4

    :cond_1a
    return-void
.end method

.method public final y(Lcom/opera/android/bookmarks/b;Lcom/opera/android/bookmarks/c;)V
    .registers 5

    iget-object v0, p0, Lxm3;->l:Lgn3;

    iget-object v0, v0, Lgn3;->A:Lum3;

    invoke-static {p1}, Lqhc;->b(Lal3;)Lqhc;

    move-result-object v1

    invoke-virtual {v0, v1}, Lcom/opera/android/undo/UndoBar;->d(Lqhc;)V

    invoke-static {p1}, Ljava/util/Collections;->singletonList(Ljava/lang/Object;)Ljava/util/List;

    move-result-object p1

    invoke-virtual {p0, p1, p2}, Lxm3;->D(Ljava/util/Collection;Lml3;)V

    return-void
.end method
