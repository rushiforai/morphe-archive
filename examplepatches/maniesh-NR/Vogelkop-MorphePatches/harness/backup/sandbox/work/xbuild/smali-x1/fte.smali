.class public final Lfte;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lq8j;


# instance fields
.field public final a:Ll0c;

.field public final b:Lfqe;

.field public c:Z

.field public final synthetic d:Lgte;


# direct methods
.method public constructor <init>(Lgte;Ll0c;Lfqe;)V
    .registers 4

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lfte;->d:Lgte;

    iput-object p2, p0, Lfte;->a:Ll0c;

    iput-object p3, p0, Lfte;->b:Lfqe;

    invoke-virtual {p3}, Lfqe;->c()Luqe;

    move-result-object p1

    invoke-virtual {p1, p0}, Luqe;->g(Lq8j;)V

    return-void
.end method


# virtual methods
.method public final a()V
    .registers 2

    iget-boolean v0, p0, Lfte;->c:Z

    if-eqz v0, :cond_10

    const/4 v0, 0x0

    iput-boolean v0, p0, Lfte;->c:Z

    iget-object v0, p0, Lfte;->b:Lfqe;

    invoke-virtual {v0}, Lfqe;->c()Luqe;

    move-result-object v0

    invoke-virtual {v0, p0}, Luqe;->g(Lq8j;)V

    :cond_10
    return-void
.end method

.method public final c(Ljava/lang/Object;)V
    .registers 16

    check-cast p1, Lnre;

    if-eqz p1, :cond_13c

    iget-object v0, p1, Lnre;->d:Ljava/util/List;

    iget-object v1, p0, Lfte;->a:Ll0c;

    if-eqz v1, :cond_12

    iget-object v2, p1, Lnre;->c:Ll0c;

    invoke-virtual {v1, v2}, Ll0c;->equals(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_13c

    :cond_12
    iget-object v1, p0, Lfte;->d:Lgte;

    iget-object v2, v1, Lgte;->d:Li3j;

    iget-object v3, v1, Lgte;->a:Lt5j;

    iget-object v3, v3, Lt5j;->c:Ljava/util/ArrayList;

    invoke-virtual {v3}, Ljava/util/ArrayList;->isEmpty()Z

    move-result v4

    const/16 v5, 0x10

    const/16 v6, 0xa

    if-eqz v4, :cond_28

    sget-object p1, Lv08;->a:Lv08;

    goto/16 :goto_a5

    :cond_28
    new-instance v4, Ljava/util/LinkedHashSet;

    invoke-direct {v4}, Ljava/util/LinkedHashSet;-><init>()V

    move-object v7, v0

    check-cast v7, Ljava/lang/Iterable;

    invoke-static {v7, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v8

    invoke-static {v8}, Lqbd;->a(I)I

    move-result v8

    if-ge v8, v5, :cond_3b

    move v8, v5

    :cond_3b
    new-instance v9, Ljava/util/LinkedHashMap;

    invoke-direct {v9, v8}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-interface {v7}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :goto_44
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_57

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    move-object v10, v8

    check-cast v10, Lyqe;

    iget-object v10, v10, Lyqe;->a:Ljava/lang/String;

    invoke-interface {v9, v10, v8}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_44

    :cond_57
    invoke-virtual {v3}, Ljava/util/ArrayList;->size()I

    move-result v7

    const/4 v8, 0x0

    :cond_5c
    :goto_5c
    if-ge v8, v7, :cond_a4

    invoke-virtual {v3, v8}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v10

    add-int/lit8 v8, v8, 0x1

    check-cast v10, Ljava/lang/String;

    const-string v11, "<existing>"

    invoke-static {v10, v11}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result v11

    if-eqz v11, :cond_98

    iget-object v10, p1, Lnre;->e:Ljava/util/List;

    check-cast v10, Ljava/lang/Iterable;

    new-instance v11, Ljava/util/ArrayList;

    invoke-direct {v11}, Ljava/util/ArrayList;-><init>()V

    invoke-interface {v10}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v10

    :cond_7b
    :goto_7b
    invoke-interface {v10}, Ljava/util/Iterator;->hasNext()Z

    move-result v12

    if-eqz v12, :cond_94

    invoke-interface {v10}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v12

    move-object v13, v12

    check-cast v13, Lyqe;

    iget-object v13, v13, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {v3, v13}, Ljava/util/ArrayList;->contains(Ljava/lang/Object;)Z

    move-result v13

    if-nez v13, :cond_7b

    invoke-virtual {v11, v12}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7b

    :cond_94
    invoke-interface {v4, v11}, Ljava/util/Set;->addAll(Ljava/util/Collection;)Z

    goto :goto_5c

    :cond_98
    invoke-virtual {v9, v10}, Ljava/util/LinkedHashMap;->get(Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lyqe;

    if-eqz v10, :cond_5c

    invoke-interface {v4, v10}, Ljava/util/Set;->add(Ljava/lang/Object;)Z

    goto :goto_5c

    :cond_a4
    move-object p1, v4

    :goto_a5
    move-object v3, p1

    check-cast v3, Ljava/util/Collection;

    invoke-interface {v3}, Ljava/util/Collection;->isEmpty()Z

    move-result v3

    const/4 v4, 0x2

    if-nez v3, :cond_10a

    move-object v3, p1

    check-cast v3, Ljava/lang/Iterable;

    new-instance v7, Lc82;

    new-instance v8, Lr94;

    const/16 v9, 0x9

    invoke-direct {v8, v3, v9}, Lr94;-><init>(Ljava/lang/Object;B)V

    invoke-direct {v7, v8, v4}, Lc82;-><init>(Ljava/lang/Object;B)V

    invoke-static {v7, v6}, Lk95;->o(Ljava/lang/Iterable;I)I

    move-result v3

    invoke-static {v3}, Lqbd;->a(I)I

    move-result v3

    if-lt v3, v5, :cond_c9

    move v5, v3

    :cond_c9
    new-instance v3, Ljava/util/LinkedHashMap;

    invoke-direct {v3, v5}, Ljava/util/LinkedHashMap;-><init>(I)V

    invoke-virtual {v7}, Lc82;->iterator()Ljava/util/Iterator;

    move-result-object v5

    :goto_d2
    move-object v6, v5

    check-cast v6, Lkm7;

    iget-object v7, v6, Lkm7;->b:Ljava/util/Iterator;

    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v7

    if-eqz v7, :cond_f3

    invoke-virtual {v6}, Lkm7;->next()Ljava/lang/Object;

    move-result-object v6

    check-cast v6, Lkotlin/collections/IndexedValue;

    iget-object v7, v6, Lkotlin/collections/IndexedValue;->b:Ljava/lang/Object;

    check-cast v7, Lyqe;

    iget-object v7, v7, Lyqe;->a:Ljava/lang/String;

    iget v6, v6, Lkotlin/collections/IndexedValue;->a:I

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    invoke-interface {v3, v7, v6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    goto :goto_d2

    :cond_f3
    check-cast v0, Ljava/lang/Iterable;

    new-instance v5, Ljk;

    const/4 v6, 0x5

    invoke-direct {v5, v3, v6}, Ljk;-><init>(Ljava/lang/Object;B)V

    invoke-static {v5, v0}, Lkotlin/collections/CollectionsKt;->c0(Ljava/util/Comparator;Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v0

    iget-object p0, p0, Lfte;->b:Lfqe;

    invoke-virtual {p0}, Lfqe;->c()Luqe;

    move-result-object p0

    iget-object p0, p0, Luqe;->l:Lip4;

    invoke-virtual {p0, v0, p1}, Lip4;->g(Ljava/util/List;Ljava/util/Set;)V

    :cond_10a
    check-cast p1, Ljava/lang/Iterable;

    invoke-static {p1}, Lkotlin/collections/CollectionsKt;->L(Ljava/lang/Iterable;)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Lyqe;

    if-eqz p0, :cond_12f

    iget-object p1, v2, Li3j;->c:Ljava/lang/Object;

    check-cast p1, Lru9;

    invoke-virtual {p1}, Lru9;->b()Lnv6;

    move-result-object p1

    iget-object p0, p0, Lyqe;->a:Ljava/lang/String;

    iget-object v0, p1, Lnv6;->a:Ljava/lang/Object;

    check-cast v0, Landroid/content/SharedPreferences$Editor;

    const-string v3, "startpage.feed_category_id"

    invoke-interface {v0, v3, p0}, Landroid/content/SharedPreferences$Editor;->putString(Ljava/lang/String;Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    const-string p0, "startpage.feed_category_backend"

    invoke-interface {v0, p0, v4}, Landroid/content/SharedPreferences$Editor;->putInt(Ljava/lang/String;I)Landroid/content/SharedPreferences$Editor;

    invoke-virtual {p1}, Lnv6;->w()V

    :cond_12f
    iget-object p0, v2, Li3j;->d:Ljava/lang/Object;

    check-cast p0, Ljava/util/LinkedHashSet;

    invoke-interface {p0, v1}, Ljava/util/Set;->remove(Ljava/lang/Object;)Z

    iget-object p0, v1, Lgte;->b:Lvr9;

    invoke-virtual {p0}, Lvr9;->run()V

    return-void

    :cond_13c
    const/4 p1, 0x1

    iput-boolean p1, p0, Lfte;->c:Z

    return-void
.end method
