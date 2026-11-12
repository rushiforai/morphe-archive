.class public final Leu8;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lfa2;
.implements Laa2;
.implements Ldy;


# instance fields
.field public final a:Landroidx/recyclerview/widget/RecyclerView;

.field public final b:Lvzk;

.field public final c:Low8;

.field public final d:Lhx;

.field public final e:Lk5k;

.field public final f:Lwy;

.field public final g:Lks6;

.field public h:Leyi;

.field public i:Lkze;


# direct methods
.method public constructor <init>(Landroidx/recyclerview/widget/RecyclerView;Low8;Lhx;Lk5k;Lwy;)V
    .registers 8

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Lks6;

    const/16 v1, 0x9

    invoke-direct {v0, p0, v1}, Lks6;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Leu8;->g:Lks6;

    iput-object p1, p0, Leu8;->a:Landroidx/recyclerview/widget/RecyclerView;

    iget-object v0, p5, Lwy;->e:Lvzk;

    iput-object v0, p0, Leu8;->b:Lvzk;

    invoke-virtual {v0, p0}, Lvzk;->h(Ldy;)V

    iput-object p2, p0, Leu8;->c:Low8;

    iput-object p3, p0, Leu8;->d:Lhx;

    iput-object p4, p0, Leu8;->e:Lk5k;

    iput-object p0, p4, Lk5k;->g:Leu8;

    invoke-virtual {p1, p4}, Landroidx/recyclerview/widget/RecyclerView;->o(Loph;)V

    iput-object p5, p0, Leu8;->f:Lwy;

    iget-object p1, v0, Lvzk;->a:Ljava/lang/Object;

    check-cast p1, Lcy;

    invoke-virtual {p1}, Lcy;->c()Lml;

    move-result-object p1

    invoke-virtual {p0, p1}, Leu8;->s(Lml;)V

    return-void
.end method


# virtual methods
.method public final S()Laa2;
    .registers 1

    return-object p0
.end method

.method public final a()Z
    .registers 4

    iget-object v0, p0, Leu8;->i:Lkze;

    if-nez v0, :cond_20

    iget-object v0, p0, Leu8;->f:Lwy;

    iget-object v1, v0, Lwy;->A:Lkze;

    if-nez v1, :cond_19

    new-instance v1, Lkze;

    invoke-virtual {v0}, Lwy;->T()Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-direct {v1, v2}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object v1, v0, Lwy;->A:Lkze;

    :cond_19
    iput-object v1, p0, Leu8;->i:Lkze;

    iget-object v0, p0, Leu8;->g:Lks6;

    invoke-virtual {v1, v0}, Lekc;->k(Lf7f;)V

    :cond_20
    iget-object p0, p0, Leu8;->i:Lkze;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/Boolean;

    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    move-result p0

    return p0
.end method

.method public final c(ILjava/util/List;)Ljava/util/List;
    .registers 8

    invoke-interface {p2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p2

    const/4 v0, 0x0

    move v1, v0

    :cond_6
    :goto_6
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_1c

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Luo;

    iget-object v2, v2, Luo;->a:Lbz;

    invoke-interface {v2}, Lbz;->c()I

    move-result v2

    if-le v2, v1, :cond_6

    move v1, v2

    goto :goto_6

    :cond_1c
    if-nez v1, :cond_21

    sget-object p0, Ljava/util/Collections;->EMPTY_LIST:Ljava/util/List;

    return-object p0

    :cond_21
    iget-object p0, p0, Leu8;->c:Low8;

    iget-object p0, p0, Lha2;->a:Ljava/util/ArrayList;

    invoke-static {p0}, Lh1b;->s(Ljava/util/Collection;)Lh1b;

    move-result-object p0

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2, v1}, Ljava/util/ArrayList;-><init>(I)V

    move v2, v0

    :cond_2f
    :goto_2f
    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v3

    if-ge v3, v1, :cond_89

    rem-int/lit8 v3, v2, 0x2

    if-nez v3, :cond_3e

    div-int/lit8 v3, v2, 0x2

    sub-int v3, p1, v3

    goto :goto_43

    :cond_3e
    add-int/lit8 v3, v2, 0x1

    div-int/lit8 v3, v3, 0x2

    add-int/2addr v3, p1

    :goto_43
    add-int/lit8 v2, v2, 0x1

    if-ltz v3, :cond_89

    invoke-interface {p0}, Ljava/util/List;->size()I

    move-result v4

    if-ge v3, v4, :cond_89

    invoke-interface {p0, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    instance-of v4, v3, Lj82;

    if-eqz v4, :cond_2f

    check-cast v3, Lj82;

    check-cast v3, Lpue;

    iget-object v3, v3, Lj82;->c:Loqe;

    instance-of v4, v3, Lmsh;

    if-eqz v4, :cond_6b

    check-cast v3, Lmsh;

    iget-object v3, v3, Lmsh;->k:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_6b
    instance-of v4, v3, Lere;

    if-eqz v4, :cond_2f

    check-cast v3, Lere;

    iget-object v3, v3, Lere;->f:Ljava/util/List;

    invoke-interface {v3}, Ljava/util/List;->isEmpty()Z

    move-result v4

    if-nez v4, :cond_2f

    invoke-interface {v3, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lmsh;

    iget-object v3, v3, Lmsh;->k:Landroid/net/Uri;

    invoke-virtual {v3}, Landroid/net/Uri;->toString()Ljava/lang/String;

    move-result-object v3

    invoke-virtual {p2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2f

    :cond_89
    return-object p2
.end method

.method public final d(ILjava/util/ArrayList;)V
    .registers 8

    invoke-virtual {p0}, Leu8;->a()Z

    move-result v0

    if-nez v0, :cond_40

    iget-object v0, p0, Leu8;->h:Leyi;

    if-eqz v0, :cond_40

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result v1

    invoke-virtual {v0, p1, v1}, Leyi;->h(II)Ljava/util/List;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :cond_16
    :goto_16
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Llyf;

    iget-object v2, v1, Llyf;->a:Ljava/lang/Object;

    check-cast v2, Ljava/lang/Integer;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v2

    if-lt v2, p1, :cond_16

    iget-object v1, v1, Llyf;->b:Ljava/lang/Object;

    check-cast v1, Ljava/util/List;

    invoke-virtual {p0, v2, v1}, Leu8;->c(ILjava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v4, p0, Leu8;->e:Lk5k;

    invoke-virtual {v4, v1, v3}, Lk5k;->a(Ljava/util/List;Ljava/util/List;)Lmq;

    move-result-object v1

    if-eqz v1, :cond_16

    invoke-virtual {p2, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    goto :goto_16

    :cond_40
    return-void
.end method

.method public final e(Lmq;Lmq;)V
    .registers 3

    iget-object p0, p0, Leu8;->c:Low8;

    invoke-virtual {p0, p1, p2}, Lha2;->W(Lja2;Lja2;)V

    return-void
.end method

.method public final g()Ljava/lang/Class;
    .registers 1

    const-class p0, Lmq;

    return-object p0
.end method

.method public final j()Lea2;
    .registers 1

    iget-object p0, p0, Leu8;->d:Lhx;

    return-object p0
.end method

.method public final onDestroy()V
    .registers 10

    iget-object v0, p0, Leu8;->i:Lkze;

    const/4 v1, 0x0

    if-eqz v0, :cond_c

    iget-object v2, p0, Leu8;->g:Lks6;

    invoke-virtual {v0, v2}, Lekc;->p(Lf7f;)V

    iput-object v1, p0, Leu8;->i:Lkze;

    :cond_c
    iget-object v0, p0, Leu8;->b:Lvzk;

    iget-object v0, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v0, Ljava/util/Set;

    invoke-interface {v0, p0}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object v0, p0, Leu8;->e:Lk5k;

    iput-object v1, v0, Lk5k;->g:Leu8;

    iget-object p0, p0, Leu8;->a:Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {p0, v0}, Landroidx/recyclerview/widget/RecyclerView;->t0(Loph;)V

    new-instance p0, Ljava/util/ArrayList;

    iget-object v1, v0, Lk5k;->a:Ljava/util/ArrayList;

    invoke-direct {p0, v1}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v2

    const/4 v3, 0x0

    move v4, v3

    :cond_2b
    :goto_2b
    if-ge v4, v2, :cond_60

    invoke-virtual {p0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lmq;

    iget-object v6, v0, Lk5k;->c:Ljava/util/HashMap;

    invoke-virtual {v6}, Ljava/util/HashMap;->values()Ljava/util/Collection;

    move-result-object v6

    invoke-interface {v6}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v6

    :goto_3f
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_56

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v7

    check-cast v7, Lj5k;

    iget-object v8, v7, Lj5k;->b:Ljava/util/ArrayDeque;

    invoke-virtual {v8, v5}, Ljava/util/ArrayDeque;->remove(Ljava/lang/Object;)Z

    iget-object v7, v7, Lj5k;->a:Ljava/util/Set;

    invoke-interface {v7, v5}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    goto :goto_3f

    :cond_56
    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_2b

    invoke-virtual {v5}, Lmq;->f()V

    goto :goto_2b

    :cond_60
    iget-object p0, v0, Lk5k;->b:Lh5k;

    invoke-virtual {p0, v3}, Lh5k;->j(Z)V

    return-void
.end method

.method public final s(Lml;)V
    .registers 16

    iget-object v0, p0, Leu8;->h:Leyi;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-nez v0, :cond_8

    move v0, v1

    goto :goto_9

    :cond_8
    move v0, v2

    :goto_9
    new-instance v3, Ldu8;

    iget-object v4, p0, Leu8;->f:Lwy;

    invoke-direct {v3, v4}, Lwy8;-><init>(Lwy;)V

    iget-object p1, p1, Lml;->c:Lrn9;

    if-nez p1, :cond_17

    const/4 p1, 0x0

    goto/16 :goto_96

    :cond_17
    iget-object v4, p1, Lrn9;->d:Ljava/lang/Object;

    check-cast v4, Lgl;

    new-instance v5, Ljava/util/ArrayList;

    invoke-direct {v5}, Ljava/util/ArrayList;-><init>()V

    iget-object v6, p1, Lrn9;->c:Ljava/lang/Object;

    check-cast v6, Ljava/util/List;

    iget-object v3, v3, Lwy8;->c:Lwy;

    if-eqz v6, :cond_55

    invoke-interface {v6}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v6

    move v7, v2

    :goto_2d
    invoke-interface {v6}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_56

    invoke-interface {v6}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lel;

    iget v9, v8, Lel;->g:I

    invoke-static {v7, v9}, Ljava/lang/Math;->max(II)I

    move-result v7

    iget v9, v8, Lel;->g:I

    new-instance v10, Luo;

    iget-object v11, v3, Lwy;->q:Lw7h;

    invoke-virtual {v11, v8}, Lw7h;->a(Ldl;)Lbz;

    move-result-object v11

    invoke-direct {v10, v11, v8}, Luo;-><init>(Lbz;Ldl;)V

    new-instance v8, Lfqj;

    invoke-direct {v8, v9, v10}, Lfqj;-><init>(ILuo;)V

    invoke-virtual {v5, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_2d

    :cond_55
    move v7, v2

    :cond_56
    new-instance v6, Ljava/util/ArrayList;

    invoke-direct {v6}, Ljava/util/ArrayList;-><init>()V

    if-eqz v4, :cond_8e

    iget-object v8, v4, Lgl;->b:Ljava/util/List;

    invoke-interface {v8}, Ljava/util/List;->isEmpty()Z

    move-result v9

    if-nez v9, :cond_8e

    iget v4, v4, Lgl;->a:I

    add-int/2addr v4, v1

    move v9, v2

    :goto_69
    invoke-interface {v8}, Ljava/util/List;->size()I

    move-result v10

    if-ge v9, v10, :cond_8e

    invoke-interface {v8, v9}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ldl;

    add-int/lit8 v9, v9, 0x1

    mul-int v11, v4, v9

    add-int/2addr v11, v7

    new-instance v12, Luo;

    iget-object v13, v3, Lwy;->q:Lw7h;

    invoke-virtual {v13, v10}, Lw7h;->a(Ldl;)Lbz;

    move-result-object v13

    invoke-direct {v12, v13, v10}, Luo;-><init>(Lbz;Ldl;)V

    new-instance v10, Lgqj;

    invoke-direct {v10, v11, v4, v12}, Lgqj;-><init>(IILuo;)V

    invoke-virtual {v6, v10}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_69

    :cond_8e
    new-instance v3, Leyi;

    iget-boolean p1, p1, Lrn9;->b:Z

    invoke-direct {v3, v5, v6, p1}, Leyi;-><init>(Ljava/util/ArrayList;Ljava/util/ArrayList;Z)V

    move-object p1, v3

    :goto_96
    iput-object p1, p0, Leu8;->h:Leyi;

    if-eqz p1, :cond_132

    if-eqz v0, :cond_132

    invoke-virtual {p0}, Leu8;->a()Z

    move-result p1

    if-nez p1, :cond_132

    iget-object p1, p0, Leu8;->c:Low8;

    iget-object v0, p1, Lha2;->a:Ljava/util/ArrayList;

    iget-object v3, p1, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v0

    if-lez v0, :cond_132

    new-instance v0, Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-direct {v0, v4}, Ljava/util/ArrayList;-><init>(I)V

    const-class v4, Lja2;

    const-class v5, Lj82;

    invoke-virtual {v5, v4}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v4

    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v6

    sub-int/2addr v6, v1

    :goto_c4
    if-ltz v6, :cond_e0

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lja2;

    if-nez v4, :cond_d4

    invoke-virtual {v5, v1}, Ljava/lang/Class;->isInstance(Ljava/lang/Object;)Z

    move-result v7

    if-eqz v7, :cond_dd

    :cond_d4
    check-cast v1, Lj82;

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-virtual {v0, v2, v1}, Ljava/util/ArrayList;->add(ILjava/lang/Object;)V

    :cond_dd
    add-int/lit8 v6, v6, -0x1

    goto :goto_c4

    :cond_e0
    invoke-static {v0}, Ljava/util/Collections;->sort(Ljava/util/List;)V

    iget-object v1, p0, Leu8;->h:Leyi;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v4

    invoke-virtual {v1, v2, v4}, Leyi;->h(II)Ljava/util/List;

    move-result-object v1

    invoke-interface {v1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :cond_f1
    :goto_f1
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_132

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Llyf;

    iget-object v5, v4, Llyf;->a:Ljava/lang/Object;

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    sub-int/2addr v5, v2

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v6

    if-ge v5, v6, :cond_118

    invoke-virtual {v0, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/lang/Integer;

    invoke-virtual {v5}, Ljava/lang/Integer;->intValue()I

    move-result v5

    add-int/2addr v5, v2

    goto :goto_11c

    :cond_118
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v5

    :goto_11c
    iget-object v4, v4, Llyf;->b:Ljava/lang/Object;

    check-cast v4, Ljava/util/List;

    invoke-virtual {p0, v5, v4}, Leu8;->c(ILjava/util/List;)Ljava/util/List;

    move-result-object v6

    iget-object v7, p0, Leu8;->e:Lk5k;

    invoke-virtual {v7, v4, v6}, Lk5k;->a(Ljava/util/List;Ljava/util/List;)Lmq;

    move-result-object v4

    if-eqz v4, :cond_f1

    invoke-virtual {p1, v5, v4}, Lha2;->H(ILja2;)V

    add-int/lit8 v2, v2, 0x1

    goto :goto_f1

    :cond_132
    return-void
.end method
