.class public final Lcom/opera/android/favorites/PushedSpeedDialFavorite;
.super Lhq8;
.source "SourceFile"


# instance fields
.field public final e:Ltqi;

.field public final f:Lghf;


# direct methods
.method public constructor <init>(Ltqi;Lghf;)V
    .registers 3

    invoke-direct {p0}, Lhq8;-><init>()V

    iput-object p1, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iput-object p2, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->f:Lghf;

    return-void
.end method


# virtual methods
.method public final c()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget p0, p0, Ltqi;->a:I

    invoke-static {p0}, Ljava/lang/String;->valueOf(I)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final e()J
    .registers 3

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget p0, p0, Ltqi;->a:I

    int-to-long v0, p0

    return-wide v0
.end method

.method public final equals(Ljava/lang/Object;)Z
    .registers 5

    const/4 v0, 0x1

    if-ne p0, p1, :cond_4

    return v0

    :cond_4
    if-eqz p1, :cond_b

    invoke-virtual {p1}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    move-result-object v1

    goto :goto_c

    :cond_b
    const/4 v1, 0x0

    :goto_c
    const-class v2, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    invoke-virtual {v2, v1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    move-result v1

    const/4 v2, 0x0

    if-nez v1, :cond_16

    return v2

    :cond_16
    check-cast p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p1, p1, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-static {p0, p1}, Lkotlin/jvm/internal/Intrinsics;->a(Ljava/lang/Object;Ljava/lang/Object;)Z

    move-result p0

    if-nez p0, :cond_23

    return v2

    :cond_23
    return v0
.end method

.method public final g()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p0, p0, Ltqi;->g:Ljava/lang/String;

    return-object p0
.end method

.method public final h()Ljava/lang/String;
    .registers 1

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object p0, p0, Ltqi;->d:Ljava/lang/String;

    return-object p0
.end method

.method public final hashCode()I
    .registers 1

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    invoke-virtual {p0}, Ltqi;->hashCode()I

    move-result p0

    return p0
.end method

.method public final i(Lp6l;)Ljava/lang/String;
    .registers 3

    iget-object v0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->e:Ltqi;

    iget-object v0, v0, Ltqi;->e:Ljava/lang/String;

    iget-object p0, p0, Lcom/opera/android/favorites/PushedSpeedDialFavorite;->f:Lghf;

    invoke-virtual {p0, v0, p1}, Lghf;->L(Ljava/lang/String;Lp6l;)Ljava/lang/String;

    move-result-object p0

    return-object p0
.end method

.method public final q(Ljava/lang/String;)V
    .registers 2

    return-void
.end method
