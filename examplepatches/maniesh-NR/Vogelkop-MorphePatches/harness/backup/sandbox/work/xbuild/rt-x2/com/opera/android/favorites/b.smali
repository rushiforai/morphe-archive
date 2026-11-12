.class public Lcom/opera/android/favorites/b;
.super Ltq8;
.source "SourceFile"


# instance fields
.field public final h:Lcom/opera/android/favorites/e;

.field public i:Lcom/opera/android/favorites/FavoritesBridge$Folder;


# direct methods
.method public constructor <init>(Lcom/opera/android/favorites/FavoritesBridge$Folder;Lcom/opera/android/favorites/e;)V
    .registers 5

    invoke-direct {p0}, Ltq8;-><init>()V

    iput-object p1, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iput-object p2, p0, Lcom/opera/android/favorites/b;->h:Lcom/opera/android/favorites/e;

    const/4 p1, 0x0

    :goto_8
    iget-object p2, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, p2, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->MuqmbcLE(J)I

    move-result p2

    if-ge p1, p2, :cond_28

    iget-object p2, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, p2, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MaBjvgQV(JI)Ljava/lang/Object;

    move-result-object p2

    check-cast p2, Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-object v0, p0, Lcom/opera/android/favorites/b;->h:Lcom/opera/android/favorites/e;

    invoke-virtual {v0, p2}, Lcom/opera/android/favorites/e;->n(Lcom/opera/android/favorites/FavoritesBridge$Favorite;)Lhq8;

    move-result-object p2

    invoke-virtual {p0, p1, p2}, Ltq8;->x(ILhq8;)V

    add-int/lit8 p1, p1, 0x1

    goto :goto_8

    :cond_28
    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-nez v0, :cond_7

    const-string p0, ""

    return-object p0

    :cond_7
    iget-wide v0, v0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->MklSMFzA(J)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Ljava/lang/String;

    invoke-virtual {v0}, Ljava/lang/String;->isEmpty()Z

    move-result v1

    if-nez v1, :cond_16

    return-object v0

    :cond_16
    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->Mvi8cy50(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz p0, :cond_b

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->Mvi8cy50(J)J

    move-result-wide v0

    return-wide v0

    :cond_b
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 6

    iget-object v0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    const/4 v1, 0x0

    if-nez v0, :cond_6

    return v1

    :cond_6
    instance-of v0, p1, Lcom/opera/android/favorites/b;

    if-nez v0, :cond_b

    return v1

    :cond_b
    check-cast p1, Lcom/opera/android/favorites/b;

    iget-object v0, p1, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz v0, :cond_1f

    invoke-virtual {p1}, Lcom/opera/android/favorites/b;->e()J

    move-result-wide v2

    invoke-virtual {p0}, Lcom/opera/android/favorites/b;->e()J

    move-result-wide p0

    cmp-long p0, v2, p0

    if-nez p0, :cond_1f

    const/4 p0, 0x1

    return p0

    :cond_1f
    return v1
.end method

.method public final g()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz p0, :cond_d

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->M6rFvEWY(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_d
    const/4 p0, 0x0

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz p0, :cond_d

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->MLPfGs3T(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_d
    const-string p0, ""

    return-object p0
.end method

.method public final hashCode()I
    .registers 3

    iget-object v0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-nez v0, :cond_6

    const/4 p0, 0x0

    return p0

    :cond_6
    invoke-virtual {p0}, Lcom/opera/android/favorites/b;->e()J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/Long;->hashCode(J)I

    move-result p0

    return p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz p0, :cond_d

    iget-wide p0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {p0, p1}, LJ/N;->MBjUu$zl(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_d
    const-string p0, ""

    return-object p0
.end method

.method public final p()V
    .registers 2

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    invoke-super {p0}, Lhq8;->p()V

    return-void
.end method

.method public final q(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz p0, :cond_9

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MGNrMcnR(JLjava/lang/Object;)V

    :cond_9
    return-void
.end method

.method public final z()Ljava/util/Date;
    .registers 4

    iget-object v0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    if-eqz v0, :cond_12

    new-instance v0, Ljava/util/Date;

    iget-object p0, p0, Lcom/opera/android/favorites/b;->i:Lcom/opera/android/favorites/FavoritesBridge$Folder;

    iget-wide v1, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v1, v2}, LJ/N;->MLt8qqHG(J)J

    move-result-wide v1

    invoke-direct {v0, v1, v2}, Ljava/util/Date;-><init>(J)V

    return-object v0

    :cond_12
    new-instance p0, Ljava/util/Date;

    const-wide/16 v0, 0x0

    invoke-direct {p0, v0, v1}, Ljava/util/Date;-><init>(J)V

    return-object p0
.end method
