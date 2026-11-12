.class public final Lcom/opera/android/favorites/e;
.super Lnr8;
.source "SourceFile"


# instance fields
.field public final c:Lcul;

.field public final d:Lvzk;

.field public final e:Lzzj;

.field public f:Lcom/opera/android/favorites/b;

.field public g:Lcom/opera/android/favorites/b;

.field public h:Lus8;

.field public final i:Lg6e;


# direct methods
.method public constructor <init>(Lcul;Lvzk;Lzzj;)V
    .registers 6

    invoke-direct {p0}, Lnr8;-><init>()V

    new-instance v0, Lg6e;

    const/4 v1, 0x0

    invoke-direct {v0, p0, v1}, Lg6e;-><init>(Ljava/lang/Object;B)V

    iput-object v0, p0, Lcom/opera/android/favorites/e;->i:Lg6e;

    iput-object p1, p0, Lcom/opera/android/favorites/e;->c:Lcul;

    iput-object p2, p0, Lcom/opera/android/favorites/e;->d:Lvzk;

    iput-object p3, p0, Lcom/opera/android/favorites/e;->e:Lzzj;

    return-void
.end method

.method public static i(Ljava/util/ArrayList;Ltq8;)V
    .registers 6

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v0

    const/4 v1, 0x0

    :goto_7
    if-ge v1, v0, :cond_29

    invoke-virtual {p1, v1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v2

    add-int/lit8 v1, v1, 0x1

    check-cast v2, Lhq8;

    invoke-virtual {v2}, Lhq8;->j()Z

    move-result v3

    if-eqz v3, :cond_1d

    check-cast v2, Ltq8;

    invoke-static {p0, v2}, Lcom/opera/android/favorites/e;->i(Ljava/util/ArrayList;Ltq8;)V

    goto :goto_7

    :cond_1d
    invoke-virtual {v2}, Lhq8;->e()J

    move-result-wide v2

    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    move-result-object v2

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z

    goto :goto_7

    :cond_29
    return-void
.end method

.method public static l(Ltq8;J)Ltq8;
    .registers 8

    invoke-virtual {p0, p1, p2}, Ltq8;->v(J)Lhq8;

    move-result-object v0

    check-cast v0, Ltq8;

    if-eqz v0, :cond_9

    return-object v0

    :cond_9
    iget-object p0, p0, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_10
    if-ge v2, v1, :cond_28

    invoke-virtual {p0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lhq8;

    invoke-virtual {v3}, Lhq8;->j()Z

    move-result v4

    if-eqz v4, :cond_10

    check-cast v3, Ltq8;

    invoke-static {v3, p1, p2}, Lcom/opera/android/favorites/e;->l(Ltq8;J)Ltq8;

    move-result-object v0

    if-eqz v0, :cond_10

    :cond_28
    return-object v0
.end method


# virtual methods
.method public final b(Ljava/lang/String;Ljava/lang/String;)J
    .registers 8

    invoke-static {p2}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v0

    const-string v1, "https://"

    invoke-static {v1, v0}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v0

    invoke-virtual {v0}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v0

    invoke-static {v0}, LJ/N;->MryibIhv(Ljava/lang/Object;)Z

    move-result v0

    iget-object v2, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v2, v2, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v3, v2, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v3, v4}, LJ/N;->MuqmbcLE(J)I

    move-result v3

    invoke-static {p2}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object p2

    invoke-static {v1, p2}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object p2

    invoke-virtual {p2}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object p2

    sget-object v1, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    iget-wide v1, v2, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v1, v2, v3, p1, p2}, LJ/N;->MpkDBxXp(JILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object p1

    check-cast p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    new-instance p2, Lcom/opera/android/favorites/a;

    invoke-direct {p2, p1, p0}, Lcom/opera/android/favorites/a;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Favorite;Lcom/opera/android/favorites/e;)V

    iget-object p0, p0, Lcom/opera/android/favorites/e;->d:Lvzk;

    invoke-virtual {p0, p2, v0}, Lvzk;->w(Lhq8;Z)V

    iget-wide p0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {p0, p1}, LJ/N;->Mvi8cy50(J)J

    move-result-wide p0

    return-wide p0
.end method

.method public final j(Ltq8;Llr8;)V
    .registers 13

    iget-object v0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v0, v0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, v0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->MuqmbcLE(J)I

    move-result v0

    invoke-virtual {p1}, Lhq8;->h()Ljava/lang/String;

    move-result-object v1

    sget-object v2, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v1}, LJ/N;->M98NjnEk(ILjava/lang/Object;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-object v0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    iget-object v1, v0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v1, v1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v1, v2}, LJ/N;->MuqmbcLE(J)I

    move-result v1

    add-int/lit8 v1, v1, -0x1

    invoke-virtual {v0, v1}, Ltq8;->u(I)Lhq8;

    move-result-object v0

    check-cast v0, Lcom/opera/android/favorites/b;

    iget-object p1, p1, Ltq8;->e:Ljava/util/ArrayList;

    invoke-virtual {p1}, Ljava/util/ArrayList;->size()I

    move-result v1

    const/4 v2, 0x0

    :cond_2f
    :goto_2f
    if-ge v2, v1, :cond_8a

    invoke-virtual {p1, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;

    move-result-object v3

    add-int/lit8 v2, v2, 0x1

    check-cast v3, Lhq8;

    sget-object v4, Lp6l;->a:Lp6l;

    invoke-virtual {v3, v4}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v5

    const-string v6, "https://"

    invoke-static {v6, v5}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v5

    invoke-virtual {v5}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v5

    invoke-static {v5}, LJ/N;->MryibIhv(Ljava/lang/Object;)Z

    move-result v5

    invoke-virtual {v3, v4}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v7

    invoke-interface {p2, v7}, Llr8;->a(Ljava/lang/String;)Z

    move-result v7

    if-nez v7, :cond_2f

    iget-object v7, v0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v8, v7, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v8, v9}, LJ/N;->MuqmbcLE(J)I

    move-result v8

    invoke-virtual {v3}, Lhq8;->h()Ljava/lang/String;

    move-result-object v9

    invoke-virtual {v3, v4}, Lhq8;->i(Lp6l;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v3}, Lwqm;->C(Ljava/lang/String;)Ljava/lang/String;

    move-result-object v3

    invoke-static {v6, v3}, Lwqm;->b(Ljava/lang/String;Ljava/lang/String;)Lorg/chromium/url/GURL;

    move-result-object v3

    invoke-virtual {v3}, Lorg/chromium/url/GURL;->g()Ljava/lang/String;

    move-result-object v3

    iget-wide v6, v7, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v6, v7, v8, v9, v3}, LJ/N;->MpkDBxXp(JILjava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    move-result-object v3

    check-cast v3, Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    new-instance v4, Lcom/opera/android/favorites/a;

    invoke-direct {v4, v3, p0}, Lcom/opera/android/favorites/a;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Favorite;Lcom/opera/android/favorites/e;)V

    iget-object v3, p0, Lcom/opera/android/favorites/e;->d:Lvzk;

    invoke-virtual {v3, v4, v5}, Lvzk;->w(Lhq8;Z)V

    goto :goto_2f

    :cond_8a
    return-void
.end method

.method public final k(Lhq8;)V
    .registers 3

    instance-of v0, p1, Lcom/opera/android/favorites/h;

    if-nez v0, :cond_f

    invoke-virtual {p1}, Lhq8;->j()Z

    move-result v0

    if-nez v0, :cond_f

    iget-object p0, p0, Lcom/opera/android/favorites/e;->c:Lcul;

    invoke-virtual {p0, p1}, Lcul;->c(Lhq8;)V

    :cond_f
    return-void
.end method

.method public final m(J)Ltq8;
    .registers 5

    const-wide/16 v0, 0x0

    cmp-long v0, p1, v0

    if-nez v0, :cond_9

    iget-object p0, p0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    return-object p0

    :cond_9
    iget-object v0, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    invoke-virtual {v0}, Lcom/opera/android/favorites/b;->e()J

    move-result-wide v0

    cmp-long v0, p1, v0

    iget-object v1, p0, Lcom/opera/android/favorites/e;->f:Lcom/opera/android/favorites/b;

    if-eqz v0, :cond_1c

    invoke-virtual {v1, p1, p2}, Ltq8;->v(J)Lhq8;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Ltq8;

    :cond_1c
    if-eqz v1, :cond_1f

    return-object v1

    :cond_1f
    iget-object p0, p0, Lcom/opera/android/favorites/e;->g:Lcom/opera/android/favorites/b;

    invoke-static {p0, p1, p2}, Lcom/opera/android/favorites/e;->l(Ltq8;J)Ltq8;

    move-result-object p0

    return-object p0
.end method

.method public final n(Lcom/opera/android/favorites/FavoritesBridge$Favorite;)Lhq8;
    .registers 6

    instance-of v0, p1, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz v0, :cond_20

    iget-wide v0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->MpTjmNUR(J)J

    move-result-wide v0

    const-wide/16 v2, 0x0

    cmp-long v0, v0, v2

    if-nez v0, :cond_18

    check-cast p1, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    new-instance v0, Lcom/opera/android/favorites/f;

    invoke-direct {v0, p1, p0}, Lcom/opera/android/favorites/b;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Folder;Lcom/opera/android/favorites/e;)V

    return-object v0

    :cond_18
    new-instance v0, Lcom/opera/android/favorites/b;

    check-cast p1, Lcom/opera/android/favorites/FavoritesBridge$Folder;

    invoke-direct {v0, p1, p0}, Lcom/opera/android/favorites/b;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Folder;Lcom/opera/android/favorites/e;)V

    return-object v0

    :cond_20
    instance-of v0, p1, Lcom/opera/android/favorites/FavoritesBridge$SavedPage;

    if-eqz v0, :cond_2c

    new-instance v0, Lcom/opera/android/favorites/g;

    check-cast p1, Lcom/opera/android/favorites/FavoritesBridge$SavedPage;

    invoke-direct {v0, p1, p0}, Lcom/opera/android/favorites/a;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Favorite;Lcom/opera/android/favorites/e;)V

    return-object v0

    :cond_2c
    iget-wide v0, p1, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->MpTjmNUR(J)J

    move-result-wide v0

    sget-object v2, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v1}, LJ/N;->M0FjBMi_(J)Z

    move-result v0

    if-eqz v0, :cond_40

    new-instance v0, Lcom/opera/android/favorites/a;

    invoke-direct {v0, p1, p0}, Lcom/opera/android/favorites/a;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Favorite;Lcom/opera/android/favorites/e;)V

    return-object v0

    :cond_40
    new-instance v0, Lcom/opera/android/favorites/h;

    invoke-direct {v0, p1, p0}, Lcom/opera/android/favorites/a;-><init>(Lcom/opera/android/favorites/FavoritesBridge$Favorite;Lcom/opera/android/favorites/e;)V

    return-object v0
.end method
