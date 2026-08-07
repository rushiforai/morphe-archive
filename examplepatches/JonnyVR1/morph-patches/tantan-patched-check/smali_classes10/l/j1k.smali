.class public Ll/j1k;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static a(Ljava/lang/String;)V
    .locals 3

    .line 1
    invoke-static {p0}, Ll/guk0;->i(Ljava/lang/String;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    new-instance v1, Ll/q4f;

    .line 6
    .line 7
    invoke-direct {v1}, Ll/q4f;-><init>()V

    .line 8
    .line 9
    .line 10
    sget-object v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 11
    .line 12
    iput-object v2, v1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 13
    .line 14
    const-string v2, "p_audio_giftwall"

    .line 15
    .line 16
    iput-object v2, v1, Ll/q4f;->n:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_0

    .line 19
    .line 20
    const-string v0, "me"

    .line 21
    .line 22
    goto :goto_0

    .line 23
    :cond_0
    const-string v0, "others"

    .line 24
    .line 25
    :goto_0
    const-string v2, "sight"

    .line 26
    .line 27
    invoke-static {v2, v0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    const-string v2, "other_user_id"

    .line 32
    .line 33
    invoke-static {v2, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    filled-new-array {v0, p0}, [Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    invoke-static {v1, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public static b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const-string v0, "enoughCoin"

    .line 2
    .line 3
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-static {v0, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string p5, "module"

    .line 12
    .line 13
    invoke-static {p5, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string p0, "giftId"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string p0, "giftUnitPrice"

    .line 24
    .line 25
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string p0, "gift_type"

    .line 30
    .line 31
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const-string p0, "gift_receiver_id"

    .line 36
    .line 37
    invoke-static {p0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_gift"

    .line 46
    .line 47
    const-string p2, "p_audio_light_gift"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static c(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "light_gift_pop_rightwall"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "light_gift_pop_giftwall"

    .line 11
    .line 12
    :goto_0
    const-string v0, "module"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "giftId"

    .line 19
    .line 20
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "e_gift"

    .line 29
    .line 30
    const-string v0, "p_audio_light_gift"

    .line 31
    .line 32
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static d(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 1

    .line 1
    const-string v0, "gift_naming_pop_profile"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_3

    .line 8
    .line 9
    const-string v0, "gift_naming_pop_giftwall"

    .line 10
    .line 11
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_0

    .line 16
    .line 17
    goto :goto_1

    .line 18
    :cond_0
    const-string v0, "light_gift_pop_giftwall"

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 21
    .line 22
    .line 23
    move-result v0

    .line 24
    if-nez v0, :cond_2

    .line 25
    .line 26
    const-string v0, "light_gift_pop_rightwall"

    .line 27
    .line 28
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    return-void

    .line 36
    :cond_2
    :goto_0
    invoke-static/range {p1 .. p6}, Ll/j1k;->b(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :cond_3
    :goto_1
    invoke-static/range {p1 .. p6}, Ll/j1k;->e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V

    .line 41
    .line 42
    .line 43
    return-void
.end method

.method public static e(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Z)V
    .locals 7

    .line 1
    const-string v0, "enoughCoin"

    .line 2
    .line 3
    invoke-static {p5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p5

    .line 7
    invoke-static {v0, p5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object v1

    .line 11
    const-string p5, "module"

    .line 12
    .line 13
    invoke-static {p5, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    const-string p0, "giftId"

    .line 18
    .line 19
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v3

    .line 23
    const-string p0, "giftUnitPrice"

    .line 24
    .line 25
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object v4

    .line 29
    const-string p0, "gift_type"

    .line 30
    .line 31
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object v5

    .line 35
    const-string p0, "gift_receiver_id"

    .line 36
    .line 37
    invoke-static {p0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v6

    .line 41
    filled-new-array/range {v1 .. v6}, [Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object p0

    .line 45
    const-string p1, "e_gift"

    .line 46
    .line 47
    const-string p2, "p_audio_gift_naming"

    .line 48
    .line 49
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 50
    .line 51
    .line 52
    return-void
.end method

.method public static f(Ljava/lang/Boolean;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "gift_naming_pop_profile"

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const-string p0, "gift_naming_pop_giftwall"

    .line 11
    .line 12
    :goto_0
    const-string v0, "module"

    .line 13
    .line 14
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "giftId"

    .line 19
    .line 20
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 21
    .line 22
    .line 23
    move-result-object p1

    .line 24
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    const-string p1, "e_gift"

    .line 29
    .line 30
    const-string v0, "p_audio_gift_naming"

    .line 31
    .line 32
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    return-void
.end method

.method public static g()V
    .locals 2

    .line 1
    const-string v0, "e_audio_rightwall_get_button"

    .line 2
    .line 3
    const-string v1, "p_audio_rightwall"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method
