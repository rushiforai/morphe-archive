.class public final Lzue;
.super Lf92;
.source "SourceFile"


# instance fields
.field public final f:Lqre;


# direct methods
.method public constructor <init>(Lau8;Luqe;)V
    .registers 4

    .line 30
    const-string v0, "topnews"

    invoke-direct {p0, p1, p2, v0}, Lf92;-><init>(Lau8;Luqe;Ljava/lang/String;)V

    .line 31
    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 32
    new-instance p1, Lqre;

    const-string p2, "newsfeed"

    const/4 v0, 0x0

    invoke-direct {p1, p2, v0}, Lqre;-><init>(Ljava/lang/String;Lyqe;)V

    .line 33
    iput-object p1, p0, Lzue;->f:Lqre;

    return-void
.end method

.method public constructor <init>(Lau8;Luqe;Lyqe;)V
    .registers 6

    iget-object v0, p3, Lyqe;->a:Ljava/lang/String;

    invoke-direct {p0, p1, p2, v0}, Lf92;-><init>(Lau8;Luqe;Ljava/lang/String;)V

    new-instance p1, Ljava/lang/StringBuilder;

    const-string v1, "newsfeed"

    invoke-direct {p1, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    invoke-virtual {p1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    invoke-virtual {p1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p2}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p2, Lqre;

    invoke-direct {p2, p1, p3}, Lqre;-><init>(Ljava/lang/String;Lyqe;)V

    iput-object p2, p0, Lzue;->f:Lqre;

    return-void
.end method


# virtual methods
.method public final a()Lu82;
    .registers 4

    new-instance v0, Lwue;

    iget-object v1, p0, Lf92;->a:Luqe;

    iget-object p0, p0, Lzue;->f:Lqre;

    if-nez p0, :cond_d

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    const/4 p0, 0x0

    goto :goto_17

    :cond_d
    new-instance v2, Ltw2;

    invoke-virtual {v1, p0}, Luqe;->f(Lqre;)Lxqe;

    move-result-object p0

    invoke-direct {v2, p0}, Ltw2;-><init>(Lxqe;)V

    move-object p0, v2

    :goto_17
    invoke-direct {v0, p0}, Lwue;-><init>(Ltw2;)V

    return-object v0
.end method

.method public final b()Ld53;
    .registers 4

    new-instance v0, Lyue;

    invoke-super {p0}, Lf92;->c()Lu82;

    move-result-object v1

    check-cast v1, Lwue;

    iget-object v1, v1, Lwue;->b:Ltw2;

    iget-object v2, p0, Lf92;->a:Luqe;

    iget-object p0, p0, Lzue;->f:Lqre;

    invoke-direct {v0, v2, p0, v1}, Lyue;-><init>(Luqe;Lqre;Ltw2;)V

    return-object v0
.end method

.method public final c()Lu82;
    .registers 1

    invoke-super {p0}, Lf92;->c()Lu82;

    move-result-object p0

    check-cast p0, Lwue;

    return-object p0
.end method

.method public final d()Ld53;
    .registers 1

    invoke-super {p0}, Lf92;->d()Ld53;

    move-result-object p0

    check-cast p0, Lyue;

    return-object p0
.end method

.method public final f(Lc53;)V
    .registers 12

    invoke-super {p0}, Lf92;->d()Ld53;

    move-result-object p0

    check-cast p0, Lyue;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-object v0, p1

    check-cast v0, Lk92;

    iget-object v0, v0, Lk92;->d:Ljava/util/ArrayList;

    if-nez v0, :cond_11

    return-void

    :cond_11
    iget-object p1, p1, Lc53;->b:Loqe;

    const/4 v1, 0x1

    const/4 v2, 0x0

    if-eqz p1, :cond_19

    move p1, v1

    goto :goto_1a

    :cond_19
    move p1, v2

    :goto_1a
    iget-object p0, p0, Lyue;->e:Ltw2;

    if-eqz p1, :cond_ec

    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    iget-object p1, p0, Lxqe;->g:Ljava/util/List;

    if-eqz p1, :cond_e6

    invoke-interface {p1, v0}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    move-result p1

    if-eqz p1, :cond_eb

    iget-object p1, p0, Lxqe;->g:Ljava/util/List;

    invoke-virtual {p0, p1}, Lxqe;->o(Ljava/util/List;)V

    invoke-interface {v0}, Ljava/util/Collection;->size()I

    move-result p1

    iget-object p0, p0, Lxqe;->b:Lh7f;

    invoke-static {p0, p0}, Lam2;->h(Lh7f;Lh7f;)Lg7f;

    move-result-object p0

    :cond_3b
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_eb

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, La53;

    iget-object v0, v0, La53;->a:Lwue;

    iget-object v3, v0, Lwue;->b:Ltw2;

    iget-object v4, v3, Ltw2;->b:Ljava/lang/Object;

    check-cast v4, Lxqe;

    iget-object v5, v4, Lxqe;->g:Ljava/util/List;

    if-nez v5, :cond_55

    iget-object v5, v4, Lxqe;->h:Ljava/util/ArrayList;

    :cond_55
    invoke-interface {v5}, Ljava/util/List;->size()I

    move-result v4

    sub-int v5, v4, p1

    iget-object v3, v3, Ltw2;->b:Ljava/lang/Object;

    check-cast v3, Lxqe;

    iget-object v6, v3, Lxqe;->g:Ljava/util/List;

    if-nez v6, :cond_65

    iget-object v6, v3, Lxqe;->h:Ljava/util/ArrayList;

    :cond_65
    invoke-interface {v6, v5, v4}, Ljava/util/List;->subList(II)Ljava/util/List;

    move-result-object v3

    invoke-static {v3}, Ljava/util/Collections;->unmodifiableList(Ljava/util/List;)Ljava/util/List;

    move-result-object v3

    iget-object v0, v0, Lwue;->a:Lh7f;

    new-instance v4, Lg7f;

    invoke-direct {v4, v0}, Lg7f;-><init>(Lh7f;)V

    :cond_74
    :goto_74
    invoke-virtual {v4}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_3b

    invoke-virtual {v4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lrw8;

    iget-object v5, v0, Lrw8;->b:Low8;

    invoke-virtual {v0, v3}, Lrw8;->b(Ljava/util/List;)Lg95;

    move-result-object v0

    iget-object v6, v5, Lha2;->a:Ljava/util/ArrayList;

    invoke-virtual {v0}, Lg95;->isEmpty()Z

    move-result v7

    if-nez v7, :cond_74

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v7

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    sub-int/2addr v8, v1

    :goto_97
    if-ltz v8, :cond_a4

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    instance-of v9, v9, Lpv8;

    if-eqz v9, :cond_a4

    add-int/lit8 v8, v8, -0x1

    goto :goto_97

    :cond_a4
    add-int/lit8 v8, v8, 0x1

    invoke-virtual {v6, v8, v0}, Ljava/util/ArrayList;->addAll(ILjava/util/Collection;)Z

    iget-object v0, v5, Lha2;->b:Ljava/util/LinkedHashMap;

    invoke-virtual {v0}, Ljava/util/LinkedHashMap;->values()Ljava/util/Collection;

    move-result-object v0

    invoke-interface {v0}, Ljava/util/Collection;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_b3
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_c9

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lfa2;

    invoke-interface {v8}, Lfa2;->S()Laa2;

    move-result-object v8

    iget-object v9, v5, Lha2;->a:Ljava/util/ArrayList;

    invoke-interface {v8, v7, v9}, Laa2;->d(ILjava/util/ArrayList;)V

    goto :goto_b3

    :cond_c9
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v0

    iget-object v6, v5, Lcu8;->l:Ltx7;

    invoke-virtual {v6}, Ltx7;->g()V

    iget-object v6, v5, Lcu8;->l:Ltx7;

    invoke-virtual {v6}, Ltx7;->h()V

    invoke-virtual {v5, v2}, Lcu8;->Y(Z)Z

    move-result v6

    if-eqz v6, :cond_e1

    invoke-virtual {v5}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    goto :goto_74

    :cond_e1
    sub-int/2addr v0, v7

    invoke-virtual {v5, v7, v0}, Landroidx/recyclerview/widget/d;->notifyItemRangeInserted(II)V

    goto :goto_74

    :cond_e6
    iget-object p0, p0, Lxqe;->h:Ljava/util/ArrayList;

    invoke-virtual {p0, v0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    :cond_eb
    return-void

    :cond_ec
    iget-object p0, p0, Ltw2;->b:Ljava/lang/Object;

    check-cast p0, Lxqe;

    invoke-virtual {p0, v0, v2}, Lxqe;->b(Ljava/util/List;Z)V

    return-void
.end method
