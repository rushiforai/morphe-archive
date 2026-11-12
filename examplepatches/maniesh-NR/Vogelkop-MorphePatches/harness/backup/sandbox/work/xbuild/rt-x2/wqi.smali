.class public final Lwqi;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Lodb;


# instance fields
.field public final a:Lqdh;


# direct methods
.method public constructor <init>(Lqdh;)V
    .registers 2

    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    iput-object p1, p0, Lwqi;->a:Lqdh;

    return-void
.end method


# virtual methods
.method public final a(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 3

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v0, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-nez v0, :cond_7

    return-void

    :cond_7
    check-cast p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object p1, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p0, p0, Lwqi;->a:Lqdh;

    invoke-virtual {p0, p1}, Lqdh;->b(Ltqi;)V

    return-void
.end method

.method public final b(Lcom/opera/android/suggestion/Suggestion;)V
    .registers 3

    iget-object p1, p1, Lcom/opera/android/suggestion/Suggestion;->k:Ljava/lang/Object;

    instance-of v0, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    if-nez v0, :cond_7

    return-void

    :cond_7
    check-cast p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object p1, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p0, p0, Lwqi;->a:Lqdh;

    invoke-virtual {p0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    sget-object v0, Lidh;->a:Lidh;

    invoke-virtual {p0, p1, v0}, Lqdh;->a(Ltqi;Lidh;)V

    return-void
.end method

.method public final reset()V
    .registers 1

    iget-object p0, p0, Lwqi;->a:Lqdh;

    iget-object p0, p0, Lqdh;->c:Ljava/util/ArrayList;

    invoke-virtual {p0}, Ljava/util/ArrayList;->clear()V

    return-void
.end method
