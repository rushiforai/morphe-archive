.class public final Lgnh;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lp4l;


# instance fields
.field public final a:Landroid/content/Context;

.field public final b:Lfnh;

.field public final c:Lu4l;

.field public final d:Lb2l;

.field public final e:Lknh;

.field public final f:Ljava/util/ArrayList;

.field public final g:Lp4j;

.field public final h:Ljava/util/LinkedHashSet;

.field public final i:Lpde;


# direct methods
.method public constructor <init>(Lpde;Landroid/content/Context;Lfnh;Lu4l;Lb2l;Lknh;)V
    .registers 13

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p2, p0, Lgnh;->a:Landroid/content/Context;

    iput-object p3, p0, Lgnh;->b:Lfnh;

    iput-object p4, p0, Lgnh;->c:Lu4l;

    iput-object p5, p0, Lgnh;->d:Lb2l;

    iput-object p6, p0, Lgnh;->e:Lknh;

    new-instance p2, Ljava/util/LinkedHashSet;

    invoke-direct {p2}, Ljava/util/LinkedHashSet;-><init>()V

    iput-object p2, p0, Lgnh;->h:Ljava/util/LinkedHashSet;

    new-instance p2, Lpde;

    sget-object p4, Ll08;->a:Ll08;

    invoke-direct {p2, p4}, Lekc;-><init>(Ljava/lang/Object;)V

    iput-object p2, p0, Lgnh;->i:Lpde;

    new-instance p2, Ljava/util/ArrayList;

    invoke-direct {p2}, Ljava/util/ArrayList;-><init>()V

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    invoke-virtual {p2}, Ljava/util/ArrayList;->clear()V

    iget-object p3, p3, Lfnh;->f:Lcom/opera/android/browser/SessionStore;

    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    new-instance p4, Ljava/util/ArrayList;

    invoke-direct {p4}, Ljava/util/ArrayList;-><init>()V

    iget-wide p5, p3, Lcom/opera/android/browser/SessionStore;->a:J

    invoke-static {p5, p6, p4}, LJ/N;->MqkthI77(JLjava/lang/Object;)V

    invoke-virtual {p2, p4}, Ljava/util/ArrayList;->addAll(Ljava/util/Collection;)Z

    new-instance p3, Landroid/util/SparseIntArray;

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p4

    invoke-direct {p3, p4}, Landroid/util/SparseIntArray;-><init>(I)V

    new-instance p4, Landroid/util/SparseIntArray;

    invoke-direct {p4}, Landroid/util/SparseIntArray;-><init>()V

    invoke-virtual {p2}, Ljava/util/ArrayList;->size()I

    move-result p5

    const/4 p6, 0x0

    move v0, p6

    move v1, v0

    :goto_4f
    if-ge v1, p5, :cond_7e

    invoke-virtual {p2, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    add-int/lit8 v3, v0, 0x1

    if-ltz v0, :cond_79

    check-cast v2, Lenh;

    iget v4, v2, Lenh;->d:I

    iget v2, v2, Lenh;->c:I

    if-eqz v4, :cond_74

    invoke-virtual {p4, v4}, Landroid/util/SparseIntArray;->indexOfKey(I)I

    move-result v5

    if-gez v5, :cond_6c

    invoke-virtual {p4, v4, v0}, Landroid/util/SparseIntArray;->put(II)V

    :cond_6c
    invoke-virtual {p4, v4}, Landroid/util/SparseIntArray;->get(I)I

    move-result v0

    invoke-virtual {p3, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    goto :goto_77

    :cond_74
    invoke-virtual {p3, v2, v0}, Landroid/util/SparseIntArray;->put(II)V

    :goto_77
    move v0, v3

    goto :goto_4f

    :cond_79
    invoke-static {}, Lj95;->n()V

    const/4 p0, 0x0

    throw p0

    :cond_7e
    new-instance p4, Ljk;

    const/4 p5, 0x7

    invoke-direct {p4, p3, p5}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {p4, p2}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object p2

    check-cast p2, Ljava/util/Collection;

    new-instance p3, Ljava/util/ArrayList;

    invoke-direct {p3, p2}, Ljava/util/ArrayList;-><init>(Ljava/util/Collection;)V

    iput-object p3, p0, Lgnh;->f:Ljava/util/ArrayList;

    new-instance p2, Lp4j;

    invoke-direct {p2}, Lp4j;-><init>()V

    new-instance p4, Ljava/util/LinkedHashMap;

    invoke-direct {p4}, Ljava/util/LinkedHashMap;-><init>()V

    invoke-virtual {p3}, Ljava/util/ArrayList;->size()I

    move-result p5

    move v0, p6

    :goto_a0
    const/4 v1, 0x1

    if-ge v0, p5, :cond_ce

    invoke-virtual {p3, v0}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v0, v0, 0x1

    check-cast v2, Lenh;

    iget v3, v2, Lenh;->d:I

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    iget v2, v2, Lenh;->d:I

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    invoke-static {p6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    invoke-virtual {p4, v2, v4}, Ljava/util/LinkedHashMap;->getOrDefault(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/Number;

    invoke-virtual {v2}, Ljava/lang/Number;->intValue()I

    move-result v2

    add-int/2addr v2, v1

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    invoke-interface {p4, v3, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_a0

    :cond_ce
    invoke-virtual {p4}, Ljava/util/LinkedHashMap;->entrySet()Ljava/util/Set;

    move-result-object p3

    invoke-interface {p3}, Ljava/util/Set;->iterator()Ljava/util/Iterator;

    move-result-object p3

    :cond_d6
    :goto_d6
    invoke-interface {p3}, Ljava/util/Iterator;->hasNext()Z

    move-result p4

    if-eqz p4, :cond_f6

    invoke-interface {p3}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object p4

    check-cast p4, Ljava/util/Map$Entry;

    invoke-interface {p4}, Ljava/util/Map$Entry;->getValue()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Ljava/lang/Number;

    invoke-virtual {p5}, Ljava/lang/Number;->intValue()I

    move-result p5

    if-ne p5, v1, :cond_d6

    invoke-interface {p4}, Ljava/util/Map$Entry;->getKey()Ljava/lang/Object;

    move-result-object p4

    invoke-virtual {p2, p4}, Lp4j;->add(Ljava/lang/Object;)Z

    goto :goto_d6

    :cond_f6
    invoke-static {p2}, Lz4j;->a(Lp4j;)Lp4j;

    move-result-object p2

    iput-object p2, p0, Lgnh;->g:Lp4j;

    invoke-virtual {p0}, Lgnh;->e()V

    iget-object p2, p0, Lgnh;->c:Lu4l;

    invoke-static {p2, p1, p0}, La26;->V(Lw6f;Likc;Ljava/lang/Object;)V

    return-void
.end method


# virtual methods
.method public final a(Lm4l;)V
    .registers 7

    iget-object v0, p0, Lgnh;->f:Ljava/util/ArrayList;

    if-eqz v0, :cond_a

    invoke-virtual {v0}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_22

    :cond_a
    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_f
    if-ge v2, v1, :cond_22

    invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lenh;

    iget v3, v3, Lenh;->d:I

    iget v4, p1, Lm4l;->a:I

    if-ne v3, v4, :cond_f

    invoke-virtual {p0}, Lgnh;->e()V

    :cond_22
    return-void
.end method

.method public final b()V
    .registers 1

    invoke-virtual {p0}, Lgnh;->e()V

    return-void
.end method

.method public final c(Ljava/util/List;Z)V
    .registers 9

    invoke-interface {p1}, Ljava/util/List;->isEmpty()Z

    move-result v0

    if-nez v0, :cond_9f

    const/4 v0, 0x0

    const/4 v1, 0x1

    if-eqz p2, :cond_5b

    move-object p2, p1

    check-cast p2, Ljava/lang/Iterable;

    new-instance v2, Ljava/util/ArrayList;

    const/16 v3, 0xa

    invoke-static {p2, v3}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-direct {v2, v3}, Ljava/util/ArrayList;-><init>(I)V

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    :goto_1c
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_2e

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lenh;

    iget-object v3, v3, Lenh;->b:Ljava/lang/String;

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_1c

    :cond_2e
    invoke-virtual {v2}, Ljava/util/ArrayList;->isEmpty()Z

    move-result p2

    if-nez p2, :cond_59

    new-instance p2, Lvx3;

    sget-object v3, Llqm;->d:Llqm;

    invoke-direct {p2, v3}, Lvx3;-><init>(Llqm;)V

    new-instance v3, Lux3;

    invoke-direct {v3, p2, v1}, Lux3;-><init>(Lvx3;Z)V

    invoke-virtual {v2, v3}, Ljava/util/ArrayList;->forEach(Ljava/util/function/Consumer;)V

    invoke-virtual {p2, v1}, Lvx3;->c(Z)V

    sget-object v2, Lwx3;->Go:Lulp;

    iput-object v2, p2, Lvx3;->k:Lwx3;

    invoke-virtual {p2, v1}, Lvx3;->e(Z)V

    invoke-virtual {p2, v1}, Lvx3;->a(Z)V

    invoke-virtual {p2, v0}, Lvx3;->d(Z)V

    iput-boolean v0, p2, Lvx3;->f:Z

    invoke-static {p2}, Lam2;->v(Lvx3;)V

    goto :goto_86

    :cond_59
    move v1, v0

    goto :goto_86

    :cond_5b
    move-object p2, p1

    check-cast p2, Ljava/lang/Iterable;

    invoke-interface {p2}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object p2

    move v3, v0

    move v2, v1

    :cond_64
    :goto_64
    invoke-interface {p2}, Ljava/util/Iterator;->hasNext()Z

    move-result v4

    if-eqz v4, :cond_82

    invoke-interface {p2}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v4

    check-cast v4, Lenh;

    iget-object v5, p0, Lgnh;->f:Ljava/util/ArrayList;

    invoke-virtual {v5, v4}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v5

    if-eqz v5, :cond_64

    iget-object v3, p0, Lgnh;->b:Lfnh;

    iget-object v5, p0, Lgnh;->d:Lb2l;

    invoke-virtual {v3, v4, v5, v2}, Lfnh;->b(Lenh;Lb2l;Z)V

    move v2, v0

    move v3, v1

    goto :goto_64

    :cond_82
    invoke-virtual {p0}, Lgnh;->e()V

    move v1, v3

    :goto_86
    if-eqz v1, :cond_9f

    invoke-interface {p1}, Ljava/util/List;->size()I

    iget-object p0, p0, Lgnh;->e:Lknh;

    iget-object p1, p0, Lknh;->w:Lua7;

    new-instance p2, Lnnh;

    invoke-direct {p2, v0}, Lnnh;-><init>(I)V

    invoke-static {p1, p2}, Lcqp;->r0(Lua7;Ljava/lang/Object;)V

    iget-object p0, p0, Lknh;->B:Lvl6;

    if-nez p0, :cond_9c

    const/4 p0, 0x0

    :cond_9c
    invoke-virtual {p0}, Lvl6;->S()Z

    :cond_9f
    return-void
.end method

.method public final d(Ljava/util/List;)V
    .registers 7

    move-object v0, p1

    check-cast v0, Ljava/lang/Iterable;

    invoke-interface {v0}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v0

    const/4 v1, 0x0

    move v2, v1

    :cond_9
    :goto_9
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    move-result v3

    if-eqz v3, :cond_26

    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lenh;

    iget-object v4, p0, Lgnh;->f:Ljava/util/ArrayList;

    invoke-virtual {v4, v3}, Ljava/util/ArrayList;->remove(Ljava/lang/Object;)Z

    move-result v4

    if-eqz v4, :cond_9

    iget-object v2, p0, Lgnh;->b:Lfnh;

    iget-object v4, p0, Lgnh;->d:Lb2l;

    invoke-virtual {v2, v3, v4, v1}, Lfnh;->b(Lenh;Lb2l;Z)V

    const/4 v2, 0x1

    goto :goto_9

    :cond_26
    if-eqz v2, :cond_54

    invoke-virtual {p0}, Lgnh;->e()V

    invoke-interface {p1}, Ljava/util/List;->size()I

    move-result p1

    iget-object p0, p0, Lgnh;->e:Lknh;

    iget-object v0, p0, Lknh;->A:Ly83;

    if-nez v0, :cond_36

    const/4 v0, 0x0

    :cond_36
    iget-object v0, v0, Ly83;->b:Landroid/view/ViewGroup;

    check-cast v0, Landroid/widget/LinearLayout;

    invoke-virtual {v0}, Landroid/view/View;->getContext()Landroid/content/Context;

    move-result-object v0

    invoke-virtual {v0}, Landroid/content/Context;->getResources()Landroid/content/res/Resources;

    move-result-object v0

    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    filled-new-array {v2}, [Ljava/lang/Object;

    move-result-object v2

    const v3, 0x7f120069

    invoke-virtual {v0, v3, p1, v2}, Landroid/content/res/Resources;->getQuantityString(II[Ljava/lang/Object;)Ljava/lang/String;

    move-result-object p1

    invoke-virtual {p0, p1, v1}, Lknh;->G0(Ljava/lang/String;Z)V

    :cond_54
    return-void
.end method

.method public final e()V
    .registers 12

    new-instance v0, Ljava/util/ArrayList;

    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    new-instance v1, Ljava/util/LinkedHashMap;

    invoke-direct {v1}, Ljava/util/LinkedHashMap;-><init>()V

    iget-object v2, p0, Lgnh;->f:Ljava/util/ArrayList;

    invoke-virtual {v2}, Ljava/util/ArrayList;->size()I

    move-result v3

    const/4 v4, 0x0

    :goto_11
    if-ge v4, v3, :cond_72

    invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v5

    add-int/lit8 v4, v4, 0x1

    check-cast v5, Lenh;

    iget v6, v5, Lenh;->d:I

    if-eqz v6, :cond_69

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    iget-object v8, p0, Lgnh;->g:Lp4j;

    iget-object v8, v8, Lp4j;->a:Lu9d;

    invoke-virtual {v8, v7}, Lu9d;->containsKey(Ljava/lang/Object;)Z

    move-result v7

    if-nez v7, :cond_69

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    invoke-virtual {v1, v7}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v8

    if-nez v8, :cond_63

    new-instance v8, Ljava/util/ArrayList;

    invoke-direct {v8}, Ljava/util/ArrayList;-><init>()V

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    iget-object v10, p0, Lgnh;->h:Ljava/util/LinkedHashSet;

    invoke-interface {v10, v9}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v9

    iget-object v10, p0, Lgnh;->c:Lu4l;

    if-eqz v9, :cond_54

    new-instance v9, Lhj8;

    invoke-virtual {v10, v6}, Lu4l;->a(I)Lm4l;

    move-result-object v6

    invoke-direct {v9, v6, v8}, Lhj8;-><init>(Lm4l;Ljava/util/ArrayList;)V

    goto :goto_5d

    :cond_54
    new-instance v9, Lc85;

    invoke-virtual {v10, v6}, Lu4l;->a(I)Lm4l;

    move-result-object v6

    invoke-direct {v9, v6, v8}, Lc85;-><init>(Lm4l;Ljava/util/ArrayList;)V

    :goto_5d
    invoke-virtual {v0, v9}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v1, v7, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    :cond_63
    check-cast v8, Ljava/util/List;

    invoke-interface {v8, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_69
    new-instance v6, Lzmh;

    invoke-direct {v6, v5}, Lzmh;-><init>(Lenh;)V

    invoke-virtual {v0, v6}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_11

    :cond_72
    iget-object p0, p0, Lgnh;->i:Lpde;

    invoke-static {p0, v0}, Lxf8;->F0(Lpde;Ljava/lang/Object;)Z

    return-void
.end method
