.class public final Lcom/opera/android/favorites/FavoritesBridge;
.super Ljava/lang/Object;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/MemberClasses;
    value = {
        Lcom/opera/android/favorites/FavoritesBridge$Folder;,
        Lcom/opera/android/favorites/FavoritesBridge$Favorite;,
        Lcom/opera/android/favorites/FavoritesBridge$SavedPage;
    }
.end annotation


# static fields
.field public static final a:Li7f;


# direct methods
.method static constructor <clinit>()V
    .registers 1

    new-instance v0, Li7f;

    invoke-direct {v0}, Li7f;-><init>()V

    sput-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    return-void
.end method

.method public static a(Lus8;)V
    .registers 2

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-virtual {v0, p0}, Li7f;->b(Ljava/lang/Object;)Z

    move-result p0

    if-eqz p0, :cond_10

    iget p0, v0, Li7f;->c:I

    const/4 v0, 0x1

    if-ne p0, v0, :cond_10

    invoke-static {}, LJ/N;->Mw8NBrqz()V

    :cond_10
    return-void
.end method

.method public static onAdded(JJI)V
    .registers 13

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lus8;

    move-wide v3, p0

    move-wide v5, p2

    move v7, p4

    invoke-interface/range {v2 .. v7}, Lus8;->b(JJI)V

    goto :goto_6

    :cond_1a
    return-void
.end method

.method public static onChanged(JJJ)V
    .registers 15

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_1a

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    move-object v2, v1

    check-cast v2, Lus8;

    move-wide v3, p0

    move-wide v5, p2

    move-wide v7, p4

    invoke-interface/range {v2 .. v8}, Lus8;->d(JJJ)V

    goto :goto_6

    :cond_1a
    return-void
.end method

.method public static onLoaded()V
    .registers 2

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lus8;

    invoke-interface {v1}, Lus8;->g()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public static onLocalRootUpdated()V
    .registers 2

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lus8;

    invoke-interface {v1}, Lus8;->c()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public static onMoved(JJIJI)V
    .registers 17

    sget-object p4, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {p4, p4}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p4

    :goto_6
    invoke-virtual {p4}, Lg7f;->hasNext()Z

    move-result v0

    if-eqz v0, :cond_1c

    invoke-virtual {p4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v0

    move-object v1, v0

    check-cast v1, Lus8;

    move-wide v3, p0

    move-wide v5, p2

    move-wide v7, p5

    move/from16 v2, p7

    invoke-interface/range {v1 .. v8}, Lus8;->a(IJJJ)V

    goto :goto_6

    :cond_1c
    return-void
.end method

.method public static onReady()V
    .registers 2

    sget-object v0, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {v0, v0}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object v0

    :goto_6
    invoke-virtual {v0}, Lg7f;->hasNext()Z

    move-result v1

    if-eqz v1, :cond_16

    invoke-virtual {v0}, Lg7f;->next()Ljava/lang/Object;

    move-result-object v1

    check-cast v1, Lus8;

    invoke-interface {v1}, Lus8;->f()V

    goto :goto_6

    :cond_16
    return-void
.end method

.method public static onRemoved(JJIZ)V
    .registers 6

    sget-object p4, Lcom/opera/android/favorites/FavoritesBridge;->a:Li7f;

    invoke-static {p4, p4}, Lu35;->c(Li7f;Li7f;)Lg7f;

    move-result-object p4

    :goto_6
    invoke-virtual {p4}, Lg7f;->hasNext()Z

    move-result p5

    if-eqz p5, :cond_16

    invoke-virtual {p4}, Lg7f;->next()Ljava/lang/Object;

    move-result-object p5

    check-cast p5, Lus8;

    invoke-interface {p5, p0, p1, p2, p3}, Lus8;->e(JJ)V

    goto :goto_6

    :cond_16
    return-void
.end method
