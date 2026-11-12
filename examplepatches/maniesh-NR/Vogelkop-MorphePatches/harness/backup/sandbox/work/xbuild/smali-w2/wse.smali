.class public final Lwse;
.super Lha2;
.source "SourceFile"


# instance fields
.field public final k:Lz8b;

.field public final l:Lh42;

.field public m:Llwc;

.field public n:Ljava/lang/String;

.field public final o:Lbte;

.field public final p:Lzse;

.field public q:Lavc;


# direct methods
.method public constructor <init>(Lbte;Lzse;Ltni;Lz8b;)V
    .registers 5

    invoke-direct {p0, p3}, Lha2;-><init>(Ltni;)V

    iput-object p4, p0, Lwse;->k:Lz8b;

    new-instance p3, Lh42;

    sget-object p4, Ll08;->a:Ll08;

    invoke-direct {p3, p4}, Lh42;-><init>(Ljava/lang/Object;)V

    iput-object p3, p0, Lwse;->l:Lh42;

    iput-object p1, p0, Lwse;->o:Lbte;

    iput-object p2, p0, Lwse;->p:Lzse;

    return-void
.end method


# virtual methods
.method public final Y(Ljava/util/ArrayList;)Lewc;
    .registers 7

    invoke-virtual {p1}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_8

    const/4 p0, 0x0

    return-object p0

    :cond_8
    const/4 v0, 0x0

    invoke-virtual {p1, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Late;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x1

    if-ne v1, v2, :cond_22

    new-instance p1, Lkwc;

    new-instance v1, Luse;

    const/4 v2, 0x3

    invoke-direct {v1, p0, v0, v2}, Luse;-><init>(Lwse;Late;B)V

    invoke-direct {p1, v0, v1}, Lkwc;-><init>(Late;Ljava/lang/Runnable;)V

    return-object p1

    :cond_22
    new-instance v1, Ljwc;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v3

    new-instance v4, Lvse;

    invoke-direct {v4, p0, v0, p1, v2}, Lvse;-><init>(Lwse;Late;Ljava/util/ArrayList;B)V

    invoke-direct {v1, v0, v3, v4}, Ljwc;-><init>(Late;ILvse;)V

    return-object v1
.end method

.method public final Z()V
    .registers 5

    iget-object v0, p0, Lwse;->o:Lbte;

    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v1, v0, Lbte;->b:Lkze;

    iget-object v2, v0, Lbte;->c:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_33

    iget-object v0, p0, Lwse;->n:Ljava/lang/String;

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    invoke-static {v0, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v0

    if-nez v0, :cond_32

    invoke-virtual {v1}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    iput-object v0, p0, Lwse;->n:Ljava/lang/String;

    iget-object p0, p0, Lwse;->m:Llwc;

    if-eqz p0, :cond_2f

    move-object v3, p0

    :cond_2f
    invoke-virtual {v3, v0}, Landroid/widget/Filter;->filter(Ljava/lang/CharSequence;)V

    :cond_32
    return-void

    :cond_33
    iput-object v3, p0, Lwse;->n:Ljava/lang/String;

    iget-object v0, v0, Lbte;->a:Lkze;

    invoke-virtual {v0}, Lekc;->g()Ljava/lang/Object;

    move-result-object v0

    iget-object p0, p0, Lwse;->l:Lh42;

    invoke-virtual {p0, v0}, Lekc;->r(Ljava/lang/Object;)V

    return-void
.end method

.method public final b0(Ljava/util/List;)Ljava/util/List;
    .registers 14

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-eqz v0, :cond_9

    sget-object p0, Ll08;->a:Ll08;

    return-object p0

    :cond_9
    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    iget-object v1, p0, Lwse;->o:Lbte;

    invoke-virtual {v1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    iget-object v2, v1, Lbte;->c:Lkze;

    invoke-virtual {v2}, Lekc;->g()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Boolean;

    invoke-virtual {v2}, Ljava/lang/Boolean;->booleanValue()Z

    move-result v2

    const/4 v3, 0x0

    if-eqz v2, :cond_41

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_26
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_40

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Late;

    new-instance v2, Liwc;

    new-instance v4, Luse;

    invoke-direct {v4, p0, v1, v3}, Luse;-><init>(Lwse;Late;B)V

    invoke-direct {v2, v1, v4}, Lkwc;-><init>(Late;Ljava/lang/Runnable;)V

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_26

    :cond_40
    return-object v0

    :cond_41
    iget-object v1, v1, Lbte;->d:Ljava/util/ArrayList;

    new-instance v2, Ljava/util/ArrayList;

    invoke-direct {v2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    move v5, v3

    :cond_4d
    :goto_4d
    if-ge v5, v4, :cond_b0

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Late;

    move-object v7, p1

    check-cast v7, Ljava/lang/Iterable;

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_63
    :goto_63
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_7e

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    move-object v10, v9

    check-cast v10, Late;

    iget-object v10, v10, Late;->a:Ljava/lang/String;

    iget-object v11, v6, Late;->a:Ljava/lang/String;

    invoke-static {v10, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v10

    if-eqz v10, :cond_63

    invoke-virtual {v8, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_63

    :cond_7e
    invoke-virtual {v8, v6}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_86

    const/4 v6, 0x0

    goto :goto_aa

    :cond_86
    invoke-virtual {v8}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v9, 0x1

    if-ne v7, v9, :cond_99

    new-instance v7, Lkwc;

    new-instance v8, Luse;

    invoke-direct {v8, p0, v6, v9}, Luse;-><init>(Lwse;Late;B)V

    invoke-direct {v7, v6, v8}, Lkwc;-><init>(Late;Ljava/lang/Runnable;)V

    :goto_97
    move-object v6, v7

    goto :goto_aa

    :cond_99
    new-instance v7, Lfwc;

    new-instance v9, Luse;

    const/4 v10, 0x2

    invoke-direct {v9, p0, v6, v10}, Luse;-><init>(Lwse;Late;B)V

    new-instance v10, Lvse;

    invoke-direct {v10, p0, v6, v8, v3}, Lvse;-><init>(Lwse;Late;Ljava/util/ArrayList;B)V

    invoke-direct {v7, v6, v9, v10}, Lfwc;-><init>(Late;Luse;Lvse;)V

    goto :goto_97

    :goto_aa
    if-eqz v6, :cond_4d

    invoke-virtual {v2, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_4d

    :cond_b0
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_cf

    new-instance v1, Lpwc;

    const v4, 0x7f140b28

    invoke-direct {v1, v4}, Lpwc;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance v1, Lpwc;

    const v2, 0x7f140b19

    invoke-direct {v1, v2}, Lpwc;-><init>(I)V

    invoke-virtual {v0, v1}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_cf
    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v1

    if-eqz v1, :cond_d8

    sget-object p0, Ll08;->a:Ll08;

    goto :goto_124

    :cond_d8
    new-instance v1, Ljava/util/ArrayList;

    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1, v3}, Ljava/util/List;->get(I)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Late;

    iget-object v2, v2, Late;->a:Ljava/lang/String;

    new-instance v3, Ljava/util/ArrayList;

    invoke-direct {v3}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :goto_ee
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_11a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Late;

    iget-object v5, v4, Late;->a:Ljava/lang/String;

    invoke-static {v5, v2}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_106

    invoke-interface {v3, v4}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_ee

    :cond_106
    invoke-virtual {p0, v3}, Lwse;->Y(Ljava/util/ArrayList;)Lewc;

    move-result-object v2

    if-eqz v2, :cond_10f

    invoke-virtual {v1, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_10f
    iget-object v2, v4, Late;->a:Ljava/lang/String;

    filled-new-array {v4}, [Late;

    move-result-object v3

    invoke-static {v3}, Lj95;->j([Ljava/lang/Object;)Ljava/util/ArrayList;

    move-result-object v3

    goto :goto_ee

    :cond_11a
    invoke-virtual {p0, v3}, Lwse;->Y(Ljava/util/ArrayList;)Lewc;

    move-result-object p0

    if-eqz p0, :cond_123

    invoke-virtual {v1, p0}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    :cond_123
    move-object p0, v1

    :goto_124
    check-cast p0, Ljava/util/Collection;

    invoke-virtual {v0, p0}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    return-object v0
.end method
