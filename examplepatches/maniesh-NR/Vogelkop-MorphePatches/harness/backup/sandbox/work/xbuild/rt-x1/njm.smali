.class public final Lnjm;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lw6f;


# instance fields
.field public final a:Li7f;

.field public final b:Lev4;


# direct methods
.method public constructor <init>(Landroid/view/View;)V
    .registers 11

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    iput-object v0, p0, Lnjm;->a:Li7f;

    new-instance v0, Lev4;

    new-instance v1, Lj1k;

    const/4 v7, 0x0

    const/16 v8, 0x1d

    const/4 v2, 0x0

    const-class v4, Lnjm;

    const-string v5, "update"

    const-string v6, "update()Z"

    move-object v3, p0

    invoke-direct/range {v1 .. v8}, Lj1k;-><init>(ILjava/lang/Object;Ljava/lang/Class;Ljava/lang/String;Ljava/lang/String;IB)V

    invoke-direct {v0, p1, v1}, Lev4;-><init>(Landroid/view/View;Lj1k;)V

    iput-object v0, v3, Lnjm;->b:Lev4;

    return-void
.end method


# virtual methods
.method public final F(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lbv8;

    iget-object p0, p0, Lnjm;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->b(Ljava/lang/Object;)Z

    return-void
.end method

.method public final H(Ljava/lang/Object;)V
    .registers 2

    check-cast p1, Lbv8;

    iget-object p0, p0, Lnjm;->a:Li7f;

    invoke-virtual {p0, p1}, Li7f;->c(Ljava/lang/Object;)Z

    return-void
.end method

.method public final a()Z
    .registers 15

    iget-object p0, p0, Lnjm;->a:Li7f;

    invoke-static {p0, p0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p0

    const/4 v0, 0x0

    move v1, v0

    :goto_8
    invoke-virtual {p0}, Lg7f;->hasNext()Z

    move-result v2

    if-eqz v2, :cond_164

    invoke-virtual {p0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Lbv8;

    iget-byte v3, v2, Lbv8;->a:B

    const/4 v4, 0x1

    iget-object v2, v2, Lbv8;->b:Ljava/lang/Object;

    packed-switch v3, :pswitch_data_166

    check-cast v2, Luvl;

    invoke-virtual {v2}, Luvl;->a()Z

    move-result v2

    goto/16 :goto_161

    :pswitch_24
    check-cast v2, Lijc;

    iget-boolean v3, v2, Lijc;->b:Z

    if-eqz v3, :cond_145

    iput-boolean v0, v2, Lijc;->b:Z

    iget-object v3, v2, Lijc;->g:Ljava/lang/Object;

    check-cast v3, Ljava/util/LinkedHashMap;

    iget-object v5, v2, Lijc;->i:Ljava/lang/Object;

    check-cast v5, Landroid/util/Size;

    invoke-virtual {v5}, Landroid/util/Size;->getWidth()I

    move-result v5

    if-lez v5, :cond_146

    iget-object v5, v2, Lijc;->i:Ljava/lang/Object;

    check-cast v5, Landroid/util/Size;

    invoke-virtual {v5}, Landroid/util/Size;->getHeight()I

    move-result v5

    if-lez v5, :cond_146

    iget-object v5, v2, Lijc;->f:Ljava/lang/Object;

    check-cast v5, Ld6k;

    iget-object v6, v2, Lijc;->c:Ljava/lang/Object;

    check-cast v6, Landroidx/recyclerview/widget/RecyclerView;

    invoke-virtual {v6}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v6

    iget-object v7, v2, Lijc;->i:Ljava/lang/Object;

    check-cast v7, Landroid/util/Size;

    invoke-virtual {v7}, Landroid/util/Size;->getWidth()I

    move-result v7

    iget-object v8, v2, Lijc;->i:Ljava/lang/Object;

    check-cast v8, Landroid/util/Size;

    invoke-virtual {v8}, Landroid/util/Size;->getHeight()I

    move-result v8

    sget-object v9, Ln08;->a:Ln08;

    invoke-virtual {v5, v6, v7, v8, v9}, Ld6k;->a(Landroid/content/Context;IILjava/util/Map;)Lc6k;

    move-result-object v9

    iget-object v9, v9, Lc6k;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v5, v6, v7, v8, v9}, Ld6k;->a(Landroid/content/Context;IILjava/util/Map;)Lc6k;

    move-result-object v5

    iget-object v6, v5, Lc6k;->b:Ljava/util/ArrayList;

    iget-object v7, v5, Lc6k;->a:Ljava/util/LinkedHashMap;

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object v8

    check-cast v8, Ljava/lang/Iterable;

    invoke-interface {v8}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v8

    :goto_7a
    invoke-interface {v8}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_98

    invoke-interface {v8}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Ljava/util/Map$Entry;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lk6k;

    invoke-interface {v9}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lf6k;

    iget-object v10, v10, Lk6k;->c:Lpde;

    invoke-static {v10, v9}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    goto :goto_7a

    :cond_98
    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v8

    move v9, v0

    :goto_9d
    const/4 v10, 0x0

    if-ge v9, v8, :cond_ae

    invoke-virtual {v6, v9}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v11

    add-int/lit8 v9, v9, 0x1

    check-cast v11, Lk6k;

    iget-object v11, v11, Lk6k;->c:Lpde;

    invoke-static {v11, v10}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    goto :goto_9d

    :cond_ae
    iget-boolean v5, v5, Lc6k;->c:Z

    iput-boolean v5, v2, Lijc;->a:Z

    invoke-virtual {v6}, Ljava/util/ArrayList;->size()I

    move-result v5

    move v8, v0

    :goto_b7
    if-ge v8, v5, :cond_c7

    invoke-virtual {v6, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v8, v8, 0x1

    check-cast v9, Lk6k;

    iget-object v9, v9, Lk6k;->b:Lu5k;

    invoke-interface {v3, v9}, Ljava/util/Map;->remove(Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_b7

    :cond_c7
    iget-object v5, v2, Lijc;->d:Ljava/lang/Object;

    check-cast v5, Lt5k;

    invoke-static {}, Lkotlin/collections/a;->b()Lehc;

    move-result-object v6

    invoke-virtual {v7}, Ljava/util/LinkedHashMap;->keySet()Ljava/util/Set;

    move-result-object v7

    check-cast v7, Ljava/lang/Iterable;

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    move v8, v0

    :goto_da
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v9

    if-eqz v9, :cond_12c

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v9

    add-int/lit8 v11, v8, 0x1

    if-ltz v8, :cond_128

    check-cast v9, Lk6k;

    iget-object v12, v9, Lk6k;->c:Lpde;

    invoke-virtual {v12}, Lekc;->g()Ljava/lang/Object;

    move-result-object v12

    check-cast v12, Lf6k;

    if-eqz v12, :cond_fd

    iget-object v12, v12, Lf6k;->b:Lmv8;

    iget-object v13, v2, Lijc;->h:Ljava/lang/Object;

    check-cast v13, Ljde;

    invoke-virtual {v13, v8, v12}, Ljde;->i(ILjava/lang/Object;)V

    :cond_fd
    iget-object v8, v9, Lk6k;->b:Lu5k;

    invoke-virtual {v3, v8}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v9

    check-cast v9, Lja2;

    if-eqz v9, :cond_11c

    invoke-virtual {v8, v9}, Lu5k;->y(Lja2;)Z

    move-result v12

    if-eqz v12, :cond_118

    invoke-virtual {v8}, Lu5k;->t()Lja2;

    move-result-object v9

    invoke-interface {v3, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v9}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_126

    :cond_118
    invoke-virtual {v6, v9}, Lehc;->add(Ljava/lang/Object;)Z

    goto :goto_126

    :cond_11c
    invoke-virtual {v8}, Lu5k;->t()Lja2;

    move-result-object v9

    invoke-interface {v3, v8, v9}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    invoke-virtual {v6, v9}, Lehc;->add(Ljava/lang/Object;)Z

    :goto_126
    move v8, v11

    goto :goto_da

    :cond_128
    invoke-static {}, Lj95;->n()V

    throw v10

    :cond_12c
    invoke-static {v6}, Lkotlin/collections/a;->a(Lehc;)Lehc;

    move-result-object v2

    iget-object v3, v5, Lha2;->a:Ljava/util/ArrayList;

    new-instance v6, Lik;

    invoke-direct {v6, v3, v2, v4}, Lik;-><init>(Ljava/util/ArrayList;Ljava/util/List;B)V

    invoke-static {v6, v4}, Luup;->k(Lk1g;Z)Lj87;

    move-result-object v6

    invoke-virtual {v3}, Ljava/util/ArrayList;->clear()V

    invoke-virtual {v3, v2}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    invoke-virtual {v6, v5}, Lj87;->b(Landroidx/recyclerview/widget/d;)V

    goto :goto_146

    :cond_145
    move v4, v0

    :cond_146
    :goto_146
    move v2, v4

    goto :goto_161

    :pswitch_148
    check-cast v2, Lc5k;

    iget-object v3, v2, Lc5k;->f0:Lpde;

    iget-object v2, v2, Lc5k;->l:Lcom/opera/android/feed/FeedScrollView;

    invoke-virtual {v2, v4}, Lcom/opera/android/feed/FeedScrollView;->canScrollVertically(I)Z

    move-result v2

    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    move-result-object v2

    invoke-static {v3, v2}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    move v2, v0

    goto :goto_161

    :pswitch_15b
    check-cast v2, Lcv8;

    invoke-virtual {v2}, Lcv8;->b()Z

    move-result v2

    :goto_161
    or-int/2addr v1, v2

    goto/16 :goto_8

    :cond_164
    return v1

    nop

    :pswitch_data_166
    .packed-switch 0x0
        :pswitch_15b
        :pswitch_148
        :pswitch_24
    .end packed-switch
.end method

.method public final b()V
    .registers 4

    iget-object p0, p0, Lnjm;->b:Lev4;

    iget-boolean v0, p0, Lev4;->b:Z

    if-eqz v0, :cond_7

    return-void

    :cond_7
    const/4 v0, 0x1

    iput-boolean v0, p0, Lev4;->b:Z

    iget-object v0, p0, Lev4;->d:Ljava/lang/Object;

    check-cast v0, Landroid/view/View;

    new-instance v1, Luog;

    const/4 v2, 0x0

    invoke-direct {v1, p0, v2}, Luog;-><init>(Lev4;B)V

    iget-object v2, p0, Lev4;->f:Ljava/lang/Object;

    check-cast v2, Lml2;

    invoke-static {v0, p0, v1, v2}, Lp37;->C(Landroid/view/View;Ljava/lang/Object;Ldh4;Landroid/view/ViewTreeObserver$OnPreDrawListener;)V

    return-void
.end method
