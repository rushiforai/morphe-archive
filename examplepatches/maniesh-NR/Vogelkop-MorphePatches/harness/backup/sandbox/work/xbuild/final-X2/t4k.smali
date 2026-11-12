.class public final Lt4k;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lxxf;


# instance fields
.field public final synthetic a:Lc5k;


# direct methods
.method public constructor <init>(Lc5k;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lt4k;->a:Lc5k;

    return-void
.end method


# virtual methods
.method public final f()V
    .registers 14

    iget-object p0, p0, Lt4k;->a:Lc5k;

    iget-object v0, p0, Lc5k;->y:Lzxf;

    invoke-virtual {v0}, Lzxf;->e()Ljava/util/List;

    move-result-object v0

    iget-object v1, p0, Lc5k;->t:Lkue;

    iput-object v0, v1, Lkue;->f:Ljava/util/List;

    iget-object v2, v1, Lkue;->k:Ljava/util/List;

    invoke-interface {v2}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v2

    :cond_12
    invoke-interface {v2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    const/4 v4, 0x0

    const/4 v5, 0x0

    if-eqz v3, :cond_63

    invoke-interface {v2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Ljue;

    iget-object v6, v3, Ljue;->a:Lurg;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    invoke-virtual {v7}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    :cond_29
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_3d

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v9, v8

    check-cast v9, Lbwf;

    invoke-interface {v6, v9}, Lurg;->test(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_29

    move-object v5, v8

    :cond_3d
    check-cast v5, Lbwf;

    iget-object v6, v3, Ljue;->c:Lbwf;

    invoke-static {v5, v6}, Ljava/util/Objects;->equals(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v6

    if-nez v6, :cond_12

    iput-object v5, v3, Ljue;->c:Lbwf;

    if-eqz v5, :cond_4c

    const/4 v4, 0x1

    :cond_4c
    iget-object v3, v3, Ljue;->b:Li7f;

    new-instance v5, Lg7f;

    invoke-direct {v5, v3}, Lg7f;-><init>(Li7f;)V

    :goto_53
    invoke-virtual {v5}, Lg7f;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_12

    invoke-virtual {v5}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Liue;

    invoke-interface {v3, v4}, Liue;->O(Z)V

    goto :goto_53

    :cond_63
    iget-object v1, v1, Lkue;->e:Lx93;

    invoke-virtual {v1}, Landroidx/recyclerview/widget/d;->notifyDataSetChanged()V

    iget-object v1, p0, Lc5k;->A:Lbx8;

    iget-object v2, v1, Lbx8;->a:Ljava/util/ArrayList;

    new-instance v3, Ljava/util/ArrayList;

    invoke-interface {v0}, Ljava/util/List;->size()I

    move-result v6

    invoke-direct {v3, v6}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v0

    :goto_79
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v6

    if-eqz v6, :cond_c6

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lbwf;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v7

    move v8, v4

    move v9, v8

    :goto_8b
    if-ge v9, v7, :cond_b0

    invoke-virtual {v2, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v9, v9, 0x1

    check-cast v10, Lzw8;

    iget-object v10, v10, Lzw8;->a:Lbwf;

    invoke-virtual {v10}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v11

    invoke-virtual {v6}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v12

    invoke-virtual {v11, v12}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v11

    if-nez v11, :cond_a7

    move v10, v4

    goto :goto_ab

    :cond_a7
    invoke-virtual {v10, v6}, Lbwf;->equals(Ljava/lang/Object;)Z

    move-result v10

    :goto_ab
    if-nez v10, :cond_b1

    add-int/lit8 v8, v8, 0x1

    goto :goto_8b

    :cond_b0
    const/4 v8, -0x1

    :cond_b1
    if-gez v8, :cond_bc

    new-instance v7, Lzw8;

    invoke-direct {v7, v6}, Lzw8;-><init>(Lbwf;)V

    invoke-virtual {v3, v7}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_79

    :cond_bc
    invoke-virtual {v2, v8}, Ljava/util/ArrayList;->remove(I)Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lzw8;

    invoke-virtual {v3, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_79

    :cond_c6
    invoke-virtual {v2}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v1}, Landroidx/viewpager/widget/PagerAdapter;->notifyDataSetChanged()V

    iget-object v0, p0, Lc5k;->O:Lnrl;

    if-eqz v0, :cond_de

    iput-object v5, p0, Lc5k;->O:Lnrl;

    iget-object v1, v0, Lnrl;->b:Ljava/lang/Object;

    check-cast v1, Lf1p;

    iget-boolean v0, v0, Lnrl;->a:Z

    invoke-virtual {p0, v1, v0, v4}, Lc5k;->g(Lf1p;ZZ)V

    :cond_de
    return-void
.end method
