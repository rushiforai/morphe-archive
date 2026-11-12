.class public final Lcom/opera/android/favorites/c;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lus8;


# instance fields
.field public final synthetic a:Lcom/opera/android/favorites/e;


# direct methods
.method public constructor <init>(Lcom/opera/android/favorites/e;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lcom/opera/android/favorites/c;->a:Lcom/opera/android/favorites/e;

    return-void
.end method


# virtual methods
.method public final g()V
    .registers 10

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-virtual {v0, p0}, Li7f;->c(Ljava/lang/Object;)Z

    move-result v1

    if-eqz v1, :cond_f

    iget v0, v0, Li7f;->c:I

    if-nez v0, :cond_f

    invoke-static {}, LJ/N;->MhTUjhtv()V

    :cond_f
    new-instance v0, Lcom/opera/android/favorites/b;

    invoke-static {}, LJ/N;->M6CPNhwN()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-object p0, p0, Lcom/opera/android/favorites/c;->a:Lcom/opera/android/favorites/e;

    invoke-direct {v0, v1, p0}, Lcom/opera/android/favorites/b;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Folder;Lcom/opera/android/favorites/e;)V

    iput-object v0, p0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    invoke-static {}, LJ/N;->MucQ9eao()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v1, v1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v1, v2}, LJ/N;->Mvi8cy50(J)J

    move-result-wide v1

    invoke-virtual {v0, v1, v2}, Ltq8;->v(J)Lhq8;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/b;

    iput-object v0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    new-instance v0, Lcom/opera/android/favorites/d;

    invoke-direct {v0, p0}, Lcom/opera/android/favorites/d;-><init>(Lcom/opera/android/favorites/e;)V

    iput-object v0, p0, Lcom/opera/android/favorites/e;->h:Lus8;

    invoke-static {v0}, Lcom/opera/android/favorites/FavoritesBridge;->a(Lus8;)V

    iget-object v0, p0, Lcom/opera/android/favorites/e;->d:Lvzk;

    iget-object v1, v0, Lvzk;->a:Ljava/lang/Object;

    move-object v3, v1

    check-cast v3, Le84;

    new-instance v6, Lqfb;

    const/16 v1, 0xc

    invoke-direct {v6, p0, v1}, Lqfb;-><init>(Ljava/lang/Object;B)V

    iput-object v6, v0, Lvzk;->d:Ljava/lang/Object;

    iget-object v1, v3, Le84;->a:Lb59;

    invoke-virtual {v1}, Lcom/opera/android/Lazy;->get()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Landroid/content/SharedPreferences;

    const-string v2, "guids"

    const/4 v4, 0x0

    invoke-static {v1, v2, v4}, Lw1h;->o(Landroid/content/SharedPreferences;Ljava/lang/String;Ljava/util/Set;)Ljava/util/Set;

    move-result-object v1

    if-eqz v1, :cond_63

    check-cast v1, Ljava/lang/Iterable;

    invoke-static {v1}, Lkotlin/collections/CollectionsKt;->k0(Ljava/lang/Iterable;)Ljava/util/List;

    move-result-object v4

    :cond_63
    if-nez v4, :cond_67

    sget-object v4, Ll08;->a:Ll08;

    :cond_67
    check-cast v4, Ljava/lang/Iterable;

    invoke-interface {v4}, Ljava/lang/Iterable;->iterator()Ljava/util/Iterator;

    move-result-object v1

    :goto_6d
    invoke-interface {v1}, Ljava/util/Iterator;->hasNext()Z

    move-result v2

    const/4 v4, 0x0

    if-eqz v2, :cond_b2

    invoke-interface {v1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/lang/String;

    iget-object v5, v6, Lqfb;->b:Ljava/lang/Object;

    check-cast v5, Lcom/opera/android/favorites/e;

    new-instance v7, Ljp5;

    const/16 v8, 0x8

    invoke-direct {v7, v2, v8}, Ljp5;-><init>(Ljava/lang/String;B)V

    iget-object v5, v5, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-static {v7, v5}, Lnr8;->g(Lmr8;Ltq8;)Lhq8;

    move-result-object v7

    if-nez v7, :cond_91

    invoke-virtual {v3, v2}, Le84;->b(Ljava/lang/String;)V

    goto :goto_6d

    :cond_91
    invoke-virtual {v7}, Lhq8;->g()Ljava/lang/String;

    move-result-object v2

    const/4 v5, 0x1

    if-eqz v2, :cond_9e

    invoke-virtual {v2}, Ljava/lang/String;->length()I

    move-result v2

    if-nez v2, :cond_9f

    :cond_9e
    move v4, v5

    :cond_9f
    xor-int/lit8 v8, v4, 0x1

    new-instance v2, Lnp6;

    iget-object v4, v0, Lvzk;->b:Ljava/lang/Object;

    check-cast v4, Ltd2;

    iget-object v5, v0, Lvzk;->c:Ljava/lang/Object;

    check-cast v5, Lpp6;

    invoke-direct/range {v2 .. v7}, Lnp6;-><init>(Le84;Ltd2;Lpp6;Lqfb;Lhq8;)V

    invoke-virtual {v2, v8}, Lnp6;->b(Z)V

    goto :goto_6d

    :cond_b2
    iget-object v0, p0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    iget-object v0, v0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {v0}, Ljava/util/ArrayList;->size()I

    move-result v1

    :cond_ba
    :goto_ba
    if-ge v4, v1, :cond_d6

    invoke-virtual {v0, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v4, v4, 0x1

    check-cast v2, Lhq8;

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v3

    if-eqz v3, :cond_ba

    iget-object v3, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    if-eq v2, v3, :cond_ba

    iget-object v3, p0, Lcom/opera/android/favorites/e;->e:Lzzj;

    check-cast v2, Ltq8;

    invoke-virtual {v3, v2}, Lzzj;->b(Ltq8;)V

    goto :goto_ba

    :cond_d6
    iget-object p0, p0, Lnr8;->a:Lnrl;

    invoke-virtual {p0}, Lnrl;->K()V

    return-void
.end method
