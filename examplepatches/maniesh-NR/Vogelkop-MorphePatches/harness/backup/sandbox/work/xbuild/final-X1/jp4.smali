.class public final Ljp4;
.super Llze;
.source "SourceFile"


# instance fields
.field public final c:Lhb6;

.field public final d:Lip4;


# direct methods
.method public constructor <init>(Landroid/content/Context;Lip4;)V
    .registers 5

    invoke-direct {p0, p2}, Llze;-><init>(Lt7j;)V

    new-instance v0, Lhb6;

    const/4 v1, 0x0

    invoke-direct {v0, p1, v1}, Lhb6;-><init>(Landroid/content/Context;B)V

    iput-object v0, p0, Ljp4;->c:Lhb6;

    iput-object p2, p0, Ljp4;->d:Lip4;

    return-void
.end method


# virtual methods
.method public final b(Ljava/lang/Object;)V
    .registers 6

    check-cast p1, Lfp4;

    iget-object v0, p0, Ljp4;->c:Lhb6;

    invoke-virtual {v0}, Lhb6;->d()Ld5o;

    move-result-object v1

    iget-object v2, v0, Lhb6;->a:Landroid/content/SharedPreferences;

    if-eqz v1, :cond_22

    invoke-virtual {p0, p1, v1}, Ljp4;->d(Lfp4;Ld5o;)V

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "categories"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    const-string v3, "subscribed_categories"

    invoke-interface {v1, v3}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object v1

    invoke-interface {v1}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_22
    invoke-virtual {v0}, Lhb6;->b()Ld5o;

    move-result-object v0

    if-eqz v0, :cond_50

    invoke-virtual {p0, p1, v0}, Ljp4;->d(Lfp4;Ld5o;)V

    invoke-interface {v2}, Landroid/content/SharedPreferences;->edit()Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "ordered_all_categories"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "user_reordered_category_codes"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "user_subscribed_category_codes"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "user_subscribed_unlisted_category_codes"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    const-string p1, "user_unsubscribed_category_codes"

    invoke-interface {p0, p1}, Landroid/content/SharedPreferences$Editor;->remove(Ljava/lang/String;)Landroid/content/SharedPreferences$Editor;

    move-result-object p0

    invoke-interface {p0}, Landroid/content/SharedPreferences$Editor;->apply()V

    :cond_50
    return-void
.end method

.method public final d(Lfp4;Ld5o;)V
    .registers 13

    new-instance v0, Ljava/util/ArrayList;

    iget-object v1, p2, Ld5o;->a:Ljava/lang/Object;

    check-cast v1, Ljava/util/ArrayList;

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v2

    invoke-direct {v0, v2}, Ljava/util/ArrayList;-><init>(I)V

    new-instance v2, Ljava/util/HashSet;

    iget-object v3, p2, Ld5o;->b:Ljava/lang/Object;

    check-cast v3, Ljava/util/HashSet;

    invoke-interface {v3}, Ljava/util/Set;->size()I

    move-result v4

    invoke-direct {v2, v4}, Ljava/util/HashSet;-><init>(I)V

    invoke-virtual {v1}, Ljava/util/ArrayList;->size()I

    move-result v4

    const/4 v5, 0x0

    :cond_1f
    :goto_1f
    if-ge v5, v4, :cond_54

    invoke-virtual {v1, v5}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v6

    add-int/lit8 v5, v5, 0x1

    check-cast v6, Ljava/lang/String;

    iget-object v7, p1, Lfp4;->e:Ljava/util/List;

    invoke-interface {v7}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object v7

    :cond_2f
    invoke-interface {v7}, Ljava/util/Iterator;->hasNext()Z

    move-result v8

    if-eqz v8, :cond_44

    invoke-interface {v7}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v8

    check-cast v8, Lyqe;

    iget-object v9, v8, Lyqe;->a:Ljava/lang/String;

    invoke-virtual {v9, v6}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    move-result v9

    if-eqz v9, :cond_2f

    goto :goto_45

    :cond_44
    const/4 v8, 0x0

    :goto_45
    if-eqz v8, :cond_1f

    invoke-virtual {v0, v8}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    invoke-interface {v3, v6}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v6

    if-eqz v6, :cond_1f

    invoke-virtual {v2, v8}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_1f

    :cond_54
    iget-object p1, p1, Lfp4;->e:Ljava/util/List;

    invoke-interface {p1}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    move-result-object p1

    :cond_5a
    :goto_5a
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_7a

    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lyqe;

    iget-boolean v3, v1, Lyqe;->c:Z

    if-eqz v3, :cond_5a

    iget-object v3, p2, Ld5o;->c:Ljava/lang/Object;

    check-cast v3, Ljava/util/Set;

    iget-object v4, v1, Lyqe;->a:Ljava/lang/String;

    invoke-interface {v3, v4}, Ljava/util/Set;->contains(Ljava/lang/Object;)Z

    move-result v3

    if-nez v3, :cond_5a

    invoke-virtual {v2, v1}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    goto :goto_5a

    :cond_7a
    iget-object p0, p0, Ljp4;->d:Lip4;

    invoke-virtual {p0, v0, v2}, Lip4;->g(Ljava/util/List;Ljava/util/Set;)V

    return-void
.end method
