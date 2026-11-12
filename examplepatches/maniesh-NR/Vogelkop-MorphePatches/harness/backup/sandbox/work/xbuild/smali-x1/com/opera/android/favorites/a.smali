.class public Lcom/opera/android/favorites/a;
.super Lhq8;
.source "SourceFile"


# instance fields
.field public final e:Lcom/opera/android/favorites/e;

.field public f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;


# direct methods
.method public constructor <init>(Lcom/opera/android/favorites/FavoritesBridge$Favorite;Lcom/opera/android/favorites/e;)V
    .registers 3

    invoke-direct {p0}, Lhq8;-><init>()V

    iput-object p1, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iput-object p2, p0, Lcom/opera/android/favorites/a;->e:Lcom/opera/android/favorites/e;

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

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
    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->Mvi8cy50(J)J

    move-result-wide v0

    invoke-static {v0, v1}, Ljava/lang/String;->valueOf(J)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    if-eqz p0, :cond_b

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->Mvi8cy50(J)J

    move-result-wide v0

    return-wide v0

    :cond_b
    const-wide/16 v0, -0x1

    return-wide v0
.end method

.method public final g()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    if-eqz p0, :cond_d

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1}, LJ/N;->M6rFvEWY(J)Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/lang/String;

    return-object p0

    :cond_d
    const-string p0, ""

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

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

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 2

    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

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

    invoke-super {p0}, Lhq8;->p()V

    const/4 v0, 0x0

    iput-object v0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    return-void
.end method

.method public final q(Ljava/lang/String;)V
    .registers 4

    iget-object p0, p0, Lcom/opera/android/favorites/a;->f:Lcom/opera/android/favorites/FavoritesBridge$Favorite;

    if-eqz p0, :cond_9

    iget-wide v0, p0, Lcom/opera/android/favorites/FavoritesBridge$Favorite;->a:J

    invoke-static {v0, v1, p1}, LJ/N;->MGNrMcnR(JLjava/lang/Object;)V

    :cond_9
    return-void
.end method
