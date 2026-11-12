.class public final Lcom/opera/android/favorites/PushedSpeedDialSuggestionProvider;
.super Llt8;
.source "SourceFile"


# instance fields
.field public final c:Lh42;


# direct methods
.method public constructor <init>(Lh42;IIII)V
    .registers 7

    const/4 v0, 0x1

    invoke-direct {p0, v0}, Llt8;-><init>(B)V

    iput-object p1, p0, Lcom/opera/android/favorites/PushedSpeedDialSuggestionProvider;->c:Lh42;

    const/16 p1, 0x14

    invoke-static/range {p0 .. p5}, LJ/N;->MGWi5Jme(Ljava/lang/Object;IIIII)J

    move-result-wide p1

    invoke-virtual {p0, p1, p2}, Llt8;->e(J)V

    return-void
.end method

.method public static getEntryTitle(Lcom/opera/android/favorites/PushedSpeedDialFavorite;)Ljava/lang/String;
    .registers 1
    .param p0    # Lcom/opera/android/favorites/PushedSpeedDialFavorite;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p0, p0, Ltqi;->d:Ljava/lang/String;

    return-object p0
.end method

.method public static getEntryUrl(Lcom/opera/android/favorites/PushedSpeedDialFavorite;)Ljava/lang/String;
    .registers 2
    .param p0    # Lcom/opera/android/favorites/PushedSpeedDialFavorite;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    sget-object v0, Lp6l;->a:Lp6l;

    invoke-virtual {p0, v0}, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->i(Lp6l;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method


# virtual methods
.method public final getEntries()[Lcom/opera/android/favorites/PushedSpeedDialFavorite;
    .registers 2
    .annotation build Landroidx/annotation/NonNull;
    .end annotation

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialSuggestionProvider;->c:Lh42;

    invoke-virtual {p0}, Lekc;->g()Ljava/lang/Object;

    move-result-object p0

    check-cast p0, Ljava/util/List;

    const/4 v0, 0x0

    if-nez p0, :cond_e

    new-array p0, v0, [Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    return-object p0

    :cond_e
    new-array v0, v0, [Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    invoke-interface {p0, v0}, Ljava/util/List;->toArray([Ljava/lang/Object;)[Ljava/lang/Object;

    move-result-object p0

    check-cast p0, [Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    return-object p0
.end method
