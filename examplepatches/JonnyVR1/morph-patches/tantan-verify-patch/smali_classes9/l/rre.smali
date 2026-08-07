.class public Ll/rre;
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

.method public static A(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZZ)V
    .locals 1

    .line 1
    invoke-static {p1, p5}, Ll/rre;->a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p5

    .line 5
    if-eqz p5, :cond_0

    .line 6
    .line 7
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isFaceGift()Z

    .line 8
    .line 9
    .line 10
    move-result p5

    .line 11
    if-nez p5, :cond_0

    .line 12
    .line 13
    new-instance p5, Ll/q4f;

    .line 14
    .line 15
    invoke-direct {p5}, Ll/q4f;-><init>()V

    .line 16
    .line 17
    .line 18
    const-string v0, "e_gift_receive"

    .line 19
    .line 20
    iput-object v0, p5, Ll/q4f;->s:Ljava/lang/String;

    .line 21
    .line 22
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 23
    .line 24
    iput-object v0, p5, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 25
    .line 26
    invoke-static {p0, p1, p2, p3, p4}, Ll/rre;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p5, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    :cond_0
    return-void
.end method

.method public static B(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;ZZZ)V
    .locals 1

    .line 1
    if-nez p4, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    if-eqz p4, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    new-instance p4, Ll/q4f;

    .line 12
    .line 13
    invoke-direct {p4}, Ll/q4f;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v0, "e_gift_receive"

    .line 17
    .line 18
    iput-object v0, p4, Ll/q4f;->s:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 21
    .line 22
    iput-object v0, p4, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    invoke-static {p0, v0, p1, p2, p3}, Ll/rre;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-static {p4, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public static C(Ll/e4d0;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e4d0;->a()Ll/pre;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/pre;->d()Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/rre;->o(Ll/e4d0;)Z

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    if-eqz v0, :cond_1

    .line 16
    .line 17
    :cond_0
    invoke-virtual {p0}, Ll/e4d0;->a()Ll/pre;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    invoke-virtual {p0}, Ll/pre;->a()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-static {p0}, Ll/rre;->k(I)Z

    .line 26
    .line 27
    .line 28
    move-result p0

    .line 29
    if-eqz p0, :cond_1

    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0

    .line 33
    :cond_1
    const/4 p0, 0x0

    .line 34
    return p0
.end method

.method public static D(Ljava/lang/String;Ll/e4d0;)V
    .locals 1

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {p1}, Ll/rre;->C(Ll/e4d0;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    new-instance v0, Ll/q4f;

    .line 11
    .line 12
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 13
    .line 14
    .line 15
    iput-object p0, v0, Ll/q4f;->s:Ljava/lang/String;

    .line 16
    .line 17
    sget-object p0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 18
    .line 19
    iput-object p0, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 20
    .line 21
    invoke-virtual {p1}, Ll/e4d0;->a()Ll/pre;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const/4 p1, 0x0

    .line 26
    invoke-virtual {p0, p1}, Ll/pre;->e(Z)V

    .line 27
    .line 28
    .line 29
    invoke-virtual {p0}, Ll/pre;->c()Ljava/util/Map;

    .line 30
    .line 31
    .line 32
    move-result-object p0

    .line 33
    invoke-static {v0, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 34
    .line 35
    .line 36
    :cond_1
    :goto_0
    return-void
.end method

.method public static E(ZLjava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_2

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string p0, "p_anchor_live_room"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string p0, "p_user_live_room"

    .line 22
    .line 23
    :goto_0
    const-string v0, "effect_id"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "type"

    .line 30
    .line 31
    const-string v1, "play"

    .line 32
    .line 33
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    const-string v1, "error"

    .line 38
    .line 39
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 40
    .line 41
    .line 42
    move-result-object p2

    .line 43
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 44
    .line 45
    .line 46
    move-result-object p2

    .line 47
    filled-new-array {p1, v0, p2}, [Ll/pf60;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    const-string p2, "e_live_gift_check_res"

    .line 52
    .line 53
    invoke-static {p2, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 54
    .line 55
    .line 56
    :cond_2
    :goto_1
    return-void
.end method

.method public static F(ZLjava/lang/String;ZZZ)V
    .locals 1

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_4

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {p1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_3

    .line 16
    :cond_0
    if-eqz p0, :cond_1

    .line 17
    .line 18
    const-string p0, "p_anchor_live_room"

    .line 19
    .line 20
    goto :goto_0

    .line 21
    :cond_1
    const-string p0, "p_user_live_room"

    .line 22
    .line 23
    :goto_0
    const-string v0, "effect_id"

    .line 24
    .line 25
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    if-eqz p2, :cond_2

    .line 30
    .line 31
    const-string p2, "yes"

    .line 32
    .line 33
    goto :goto_1

    .line 34
    :cond_2
    const-string p2, "no"

    .line 35
    .line 36
    :goto_1
    const-string v0, "ready"

    .line 37
    .line 38
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 39
    .line 40
    .line 41
    move-result-object p2

    .line 42
    if-eqz p3, :cond_3

    .line 43
    .line 44
    const-string p3, "tray"

    .line 45
    .line 46
    goto :goto_2

    .line 47
    :cond_3
    const-string p3, "send"

    .line 48
    .line 49
    :goto_2
    const-string v0, "type"

    .line 50
    .line 51
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    const-string v0, "in_preload"

    .line 56
    .line 57
    invoke-static {p4}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 58
    .line 59
    .line 60
    move-result-object p4

    .line 61
    invoke-static {v0, p4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object p4

    .line 65
    filled-new-array {p1, p2, p3, p4}, [Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    const-string p2, "e_live_gift_check_res"

    .line 70
    .line 71
    invoke-static {p2, p0, p1}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 72
    .line 73
    .line 74
    :cond_4
    :goto_3
    return-void
.end method

.method public static G(Ljava/lang/String;ZZJ)V
    .locals 3

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_3

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_1

    .line 16
    :cond_0
    const-string v0, "effect_id"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "ready"

    .line 23
    .line 24
    const-string v1, "no"

    .line 25
    .line 26
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz p1, :cond_1

    .line 31
    .line 32
    const-string p1, "tray_download"

    .line 33
    .line 34
    goto :goto_0

    .line 35
    :cond_1
    const-string p1, "send_download"

    .line 36
    .line 37
    :goto_0
    const-string v1, "type"

    .line 38
    .line 39
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    const-string v1, "error"

    .line 44
    .line 45
    invoke-static {p2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 50
    .line 51
    .line 52
    move-result-object v1

    .line 53
    if-eqz p2, :cond_2

    .line 54
    .line 55
    const-wide/16 p3, -0x1

    .line 56
    .line 57
    :cond_2
    invoke-static {p3, p4}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 58
    .line 59
    .line 60
    move-result-object p2

    .line 61
    const-string p3, "duration"

    .line 62
    .line 63
    invoke-static {p3, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object p2

    .line 67
    filled-new-array {p0, v0, p1, v1, p2}, [Ll/pf60;

    .line 68
    .line 69
    .line 70
    move-result-object p0

    .line 71
    const-string p1, "e_live_gift_check_res"

    .line 72
    .line 73
    const-string p2, "p_live_gift_download"

    .line 74
    .line 75
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 76
    .line 77
    .line 78
    :cond_3
    :goto_1
    return-void
.end method

.method public static H(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_1

    .line 6
    .line 7
    const-string v0, "0"

    .line 8
    .line 9
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    goto :goto_0

    .line 16
    :cond_0
    const-string v0, "effect_id"

    .line 17
    .line 18
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    const-string v0, "url"

    .line 23
    .line 24
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string v0, "md"

    .line 29
    .line 30
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    const-string v0, "error_type"

    .line 35
    .line 36
    invoke-static {v0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p3

    .line 40
    filled-new-array {p0, p1, p2, p3}, [Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    const-string p1, "e_live_gift_check_res_download_error"

    .line 45
    .line 46
    const-string p2, "p_live_gift_download"

    .line 47
    .line 48
    invoke-static {p1, p2, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 49
    .line 50
    .line 51
    :cond_1
    :goto_0
    return-void
.end method

.method public static a(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z
    .locals 0

    .line 1
    if-eqz p1, :cond_0

    .line 2
    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 6
    .line 7
    .line 8
    move-result p1

    .line 9
    if-nez p1, :cond_0

    .line 10
    .line 11
    invoke-static {p0}, Ll/rre;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-eqz p0, :cond_0

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_0
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_2

    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_2

    .line 16
    .line 17
    invoke-static {p1}, Ll/rre;->l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z

    .line 18
    .line 19
    .line 20
    move-result p0

    .line 21
    if-nez p0, :cond_1

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isFaceGift()Z

    .line 24
    .line 25
    .line 26
    move-result p0

    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x1

    .line 30
    return p0

    .line 31
    :cond_2
    const/4 p0, 0x0

    .line 32
    return p0
.end method

.method public static c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p1

    .line 15
    if-nez p1, :cond_1

    .line 16
    .line 17
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 18
    .line 19
    invoke-static {p0}, Ll/rre;->k(I)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 p0, 0x1

    .line 26
    return p0

    .line 27
    :cond_1
    const/4 p0, 0x0

    .line 28
    return p0
.end method

.method public static d(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z
    .locals 0

    .line 1
    if-nez p2, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_1

    .line 8
    .line 9
    :cond_0
    if-eqz p1, :cond_1

    .line 10
    .line 11
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    if-nez p0, :cond_1

    .line 18
    .line 19
    const/4 p0, 0x1

    .line 20
    return p0

    .line 21
    :cond_1
    const/4 p0, 0x0

    .line 22
    return p0
.end method

.method public static e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z
    .locals 0

    .line 1
    if-nez p1, :cond_0

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    if-eqz p1, :cond_1

    .line 8
    .line 9
    :cond_0
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    const/4 p0, 0x1

    .line 18
    return p0

    .line 19
    :cond_1
    const/4 p0, 0x0

    .line 20
    return p0
.end method

.method public static f(Ll/e4d0;)V
    .locals 1

    .line 1
    const-string v0, "e_download_check"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/rre;->D(Ljava/lang/String;Ll/e4d0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static g(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ll/pre;
    .locals 3

    .line 1
    new-instance v0, Ll/pre$a;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/pre$a;-><init>()V

    .line 4
    .line 5
    .line 6
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 7
    .line 8
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 9
    .line 10
    invoke-virtual {v0, v1, v2}, Ll/pre$a;->m(Ljava/lang/String;I)Ll/pre$a;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 15
    .line 16
    invoke-virtual {v0, v1}, Ll/pre$a;->q(I)Ll/pre$a;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/pre$a;->t(Ljava/lang/String;)Ll/pre$a;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 27
    .line 28
    invoke-virtual {v0, v1}, Ll/pre$a;->w(Ljava/lang/String;)Ll/pre$a;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/pre$a;->o(Ljava/lang/String;)Ll/pre$a;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->f:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ll/pre$a;->s(Ljava/lang/String;)Ll/pre$a;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    iget-object v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 45
    .line 46
    invoke-virtual {v0, v1}, Ll/pre$a;->v(Ljava/lang/String;)Ll/pre$a;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    if-eqz p1, :cond_0

    .line 51
    .line 52
    const-string p1, "face_gift"

    .line 53
    .line 54
    goto :goto_0

    .line 55
    :cond_0
    const-string p1, "normal_gift"

    .line 56
    .line 57
    :goto_0
    invoke-virtual {v0, p1}, Ll/pre$a;->p(Ljava/lang/String;)Ll/pre$a;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iget v0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->g:I

    .line 62
    .line 63
    invoke-virtual {p1, v0}, Ll/pre$a;->u(I)Ll/pre$a;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->d:I

    .line 68
    .line 69
    invoke-virtual {p1, p0}, Ll/pre$a;->r(I)Ll/pre$a;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    invoke-virtual {p0, p2}, Ll/pre$a;->n(Z)Ll/pre$a;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    invoke-virtual {p0}, Ll/pre$a;->l()Ll/pre;

    .line 78
    .line 79
    .line 80
    move-result-object p0

    .line 81
    return-object p0
.end method

.method public static h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;
    .locals 4
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;",
            "Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;",
            "Ll/oo2;",
            "ZZ)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->comboId:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, "_"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->combos:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "unique_id"

    .line 31
    .line 32
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    const-string v1, ""

    .line 36
    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    move-object v2, v1

    .line 40
    goto :goto_0

    .line 41
    :cond_0
    iget v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 42
    .line 43
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 44
    .line 45
    .line 46
    move-result-object v2

    .line 47
    :goto_0
    const-string v3, "giftId"

    .line 48
    .line 49
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    move-object v2, v1

    .line 55
    goto :goto_1

    .line 56
    :cond_1
    iget-object v2, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 57
    .line 58
    :goto_1
    const-string v3, "gift_resource_id"

    .line 59
    .line 60
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    iget-object v2, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 64
    .line 65
    invoke-virtual {v2}, Ll/ine0;->d()Ljava/lang/String;

    .line 66
    .line 67
    .line 68
    move-result-object v2

    .line 69
    const-string v3, "actor_user_id"

    .line 70
    .line 71
    invoke-interface {v0, v3, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/ine0;->a()Ljava/lang/String;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    const-string v2, "anchorId"

    .line 81
    .line 82
    invoke-interface {v0, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    if-nez p1, :cond_2

    .line 86
    .line 87
    move-object p0, v1

    .line 88
    goto :goto_2

    .line 89
    :cond_2
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->getLocalName()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    :goto_2
    const-string v2, "giftName"

    .line 94
    .line 95
    invoke-interface {v0, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 96
    .line 97
    .line 98
    if-nez p2, :cond_3

    .line 99
    .line 100
    move-object p0, v1

    .line 101
    goto :goto_3

    .line 102
    :cond_3
    invoke-virtual {p2}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 107
    .line 108
    :goto_3
    const-string v2, "liveId"

    .line 109
    .line 110
    invoke-interface {v0, v2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 111
    .line 112
    .line 113
    if-nez p1, :cond_4

    .line 114
    .line 115
    move-object p0, v1

    .line 116
    goto :goto_4

    .line 117
    :cond_4
    if-eqz p4, :cond_5

    .line 118
    .line 119
    const-string p0, "face_gift"

    .line 120
    .line 121
    goto :goto_4

    .line 122
    :cond_5
    const-string p0, "normal_gift"

    .line 123
    .line 124
    :goto_4
    const-string p4, "gift_effect_type"

    .line 125
    .line 126
    invoke-interface {v0, p4, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    if-nez p1, :cond_6

    .line 130
    .line 131
    goto :goto_5

    .line 132
    :cond_6
    iget p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftSource:I

    .line 133
    .line 134
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    :goto_5
    const-string p0, "gift_source"

    .line 139
    .line 140
    invoke-interface {v0, p0, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 141
    .line 142
    .line 143
    const-string p0, "live_status"

    .line 144
    .line 145
    invoke-static {p2}, Ll/rre;->j(Ll/oo2;)Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object p1

    .line 149
    invoke-interface {v0, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 150
    .line 151
    .line 152
    if-eqz p3, :cond_7

    .line 153
    .line 154
    const-string p0, "success"

    .line 155
    .line 156
    goto :goto_6

    .line 157
    :cond_7
    const-string p0, "fail"

    .line 158
    .line 159
    :goto_6
    const-string p1, "process_status"

    .line 160
    .line 161
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    return-object v0
.end method

.method public static i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ljava/util/Map;
    .locals 3
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;",
            "ZZ)",
            "Ljava/util/Map<",
            "Ljava/lang/String;",
            "Ljava/lang/Object;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ljava/util/HashMap;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/HashMap;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 9
    .line 10
    .line 11
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->n:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 14
    .line 15
    .line 16
    const-string v2, "_"

    .line 17
    .line 18
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 19
    .line 20
    .line 21
    iget v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->k:I

    .line 22
    .line 23
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 27
    .line 28
    .line 29
    move-result-object v1

    .line 30
    const-string v2, "unique_id"

    .line 31
    .line 32
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 33
    .line 34
    .line 35
    iget v1, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->e:I

    .line 36
    .line 37
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 38
    .line 39
    .line 40
    move-result-object v1

    .line 41
    const-string v2, "giftId"

    .line 42
    .line 43
    invoke-interface {v0, v2, v1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    const-string v1, "gift_resource_id"

    .line 47
    .line 48
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->y:Ljava/lang/String;

    .line 49
    .line 50
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 51
    .line 52
    .line 53
    const-string v1, "actor_user_id"

    .line 54
    .line 55
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 56
    .line 57
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    const-string v1, "anchorId"

    .line 61
    .line 62
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->C:Ljava/lang/String;

    .line 63
    .line 64
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 65
    .line 66
    .line 67
    const-string v1, "giftName"

    .line 68
    .line 69
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->f:Ljava/lang/String;

    .line 70
    .line 71
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    const-string v1, "liveId"

    .line 75
    .line 76
    iget-object v2, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->h:Ljava/lang/String;

    .line 77
    .line 78
    invoke-interface {v0, v1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 79
    .line 80
    .line 81
    if-eqz p2, :cond_0

    .line 82
    .line 83
    const-string p2, "face_gift"

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :cond_0
    const-string p2, "normal_gift"

    .line 87
    .line 88
    :goto_0
    const-string v1, "gift_effect_type"

    .line 89
    .line 90
    invoke-interface {v0, v1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    iget p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->g:I

    .line 94
    .line 95
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 96
    .line 97
    .line 98
    move-result-object p0

    .line 99
    const-string p2, "gift_source"

    .line 100
    .line 101
    invoke-interface {v0, p2, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    if-eqz p1, :cond_1

    .line 105
    .line 106
    const-string p0, "success"

    .line 107
    .line 108
    goto :goto_1

    .line 109
    :cond_1
    const-string p0, "fail"

    .line 110
    .line 111
    :goto_1
    const-string p1, "process_status"

    .line 112
    .line 113
    invoke-interface {v0, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    return-object v0
.end method

.method public static j(Ll/oo2;)Ljava/lang/String;
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    const-string p0, ""

    .line 4
    .line 5
    return-object p0

    .line 6
    :cond_0
    invoke-virtual {p0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->state:Lcom/p1/mobile/putong/live/base/data/BLiveState;

    .line 11
    .line 12
    const-string v0, "onlive"

    .line 13
    .line 14
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    const-string v0, "suspended"

    .line 21
    .line 22
    invoke-static {p0, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    if-eqz p0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    const-string p0, "off"

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    :goto_0
    const-string p0, "on"

    .line 33
    .line 34
    return-object p0
.end method

.method public static k(I)Z
    .locals 1

    .line 1
    const/16 v0, 0xc8

    .line 2
    .line 3
    if-eq p0, v0, :cond_1

    .line 4
    .line 5
    const/16 v0, 0x12c

    .line 6
    .line 7
    if-ne p0, v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 p0, 0x0

    .line 11
    return p0

    .line 12
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 13
    return p0
.end method

.method public static l(Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;)Z
    .locals 0

    .line 1
    iget p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftLevel:I

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->k(I)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    return p0
.end method

.method public static m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;->sendGiftExtraInfo:Ll/ine0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ine0;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 8
    .line 9
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 14
    .line 15
    .line 16
    move-result p0

    .line 17
    return p0
.end method

.method public static n(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;)Z
    .locals 1

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;->B:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 10
    .line 11
    .line 12
    move-result p0

    .line 13
    return p0
.end method

.method public static o(Ll/e4d0;)Z
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/e4d0;->a()Ll/pre;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/pre;->b()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 10
    .line 11
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    invoke-static {p0, v0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    return p0
.end method

.method public static p(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V
    .locals 1

    .line 1
    invoke-static {p0, p2}, Ll/rre;->e(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_gift_add_to_live"

    .line 13
    .line 14
    iput-object v0, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, p1, v0}, Ll/rre;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p2, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static q(Ll/e4d0;)V
    .locals 1

    .line 1
    const-string v0, "e_md_check"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/rre;->D(Ljava/lang/String;Ll/e4d0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static r(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)V
    .locals 1

    .line 1
    invoke-static {p0, p1}, Ll/rre;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p1

    .line 5
    if-eqz p1, :cond_0

    .line 6
    .line 7
    new-instance p1, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p1}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_gift_grade"

    .line 13
    .line 14
    iput-object v0, p1, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, v0, v0}, Ll/rre;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p1, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static s(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;ZZ)V
    .locals 2

    .line 1
    if-nez p3, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z

    .line 4
    .line 5
    .line 6
    move-result p3

    .line 7
    if-eqz p3, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    new-instance p3, Ll/q4f;

    .line 12
    .line 13
    invoke-direct {p3}, Ll/q4f;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v0, "e_giftid_configure_check"

    .line 17
    .line 18
    iput-object v0, p3, Ll/q4f;->s:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 21
    .line 22
    iput-object v0, p3, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x0

    .line 26
    invoke-static {p0, v0, p1, v1, p2}, Ll/rre;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p3, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public static t(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V
    .locals 1

    .line 1
    invoke-static {p0, p2}, Ll/rre;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_gift_default_show"

    .line 13
    .line 14
    iput-object v0, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, p1, v0}, Ll/rre;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p2, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static u(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)V
    .locals 1

    .line 1
    invoke-static {p0, p2}, Ll/rre;->c(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    new-instance p2, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p2}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_gift_show"

    .line 13
    .line 14
    iput-object v0, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const/4 v0, 0x0

    .line 21
    invoke-static {p0, p1, v0}, Ll/rre;->i(Lcom/p1/mobile/putong/live/livingroom/increment/gift/tray/GiftTrayData;ZZ)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p2, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static v(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;Z)V
    .locals 2

    .line 1
    invoke-static {p0, p1, p3}, Ll/rre;->b(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_1

    .line 6
    .line 7
    new-instance p3, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p3}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_gift_sent"

    .line 13
    .line 14
    iput-object v0, p3, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p3, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    if-eqz p1, :cond_0

    .line 22
    .line 23
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->isFaceGift()Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    move v1, v0

    .line 30
    goto :goto_0

    .line 31
    :cond_0
    const/4 v1, 0x0

    .line 32
    :goto_0
    invoke-static {p0, p1, p2, v0, v1}, Ll/rre;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-static {p3, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    return-void
.end method

.method public static w(Ll/e4d0;)V
    .locals 1

    .line 1
    const-string v0, "e_unzip_check"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/rre;->D(Ljava/lang/String;Ll/e4d0;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public static x(Ll/e4d0;)V
    .locals 1

    .line 1
    if-nez p0, :cond_0

    .line 2
    .line 3
    goto :goto_0

    .line 4
    :cond_0
    invoke-static {p0}, Ll/rre;->C(Ll/e4d0;)Z

    .line 5
    .line 6
    .line 7
    move-result v0

    .line 8
    if-eqz v0, :cond_1

    .line 9
    .line 10
    const-string v0, "e_gift_resource_gain"

    .line 11
    .line 12
    invoke-static {v0, p0}, Ll/rre;->D(Ljava/lang/String;Ll/e4d0;)V

    .line 13
    .line 14
    .line 15
    :cond_1
    :goto_0
    return-void
.end method

.method public static y(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;Z)V
    .locals 1

    .line 1
    invoke-static {p0, p1, p3}, Ll/rre;->d(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Z)Z

    .line 2
    .line 3
    .line 4
    move-result p3

    .line 5
    if-eqz p3, :cond_0

    .line 6
    .line 7
    new-instance p3, Ll/q4f;

    .line 8
    .line 9
    invoke-direct {p3}, Ll/q4f;-><init>()V

    .line 10
    .line 11
    .line 12
    const-string v0, "e_gift_receive"

    .line 13
    .line 14
    iput-object v0, p3, Ll/q4f;->s:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v0, p3, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const/4 v0, 0x1

    .line 21
    invoke-static {p0, p1, p2, v0, v0}, Ll/rre;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p3, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    return-void
.end method

.method public static z(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Ll/oo2;Z)V
    .locals 2

    .line 1
    if-nez p2, :cond_1

    .line 2
    .line 3
    invoke-static {p0}, Ll/rre;->m(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-eqz p2, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    return-void

    .line 11
    :cond_1
    :goto_0
    new-instance p2, Ll/q4f;

    .line 12
    .line 13
    invoke-direct {p2}, Ll/q4f;-><init>()V

    .line 14
    .line 15
    .line 16
    const-string v0, "e_gift_receive"

    .line 17
    .line 18
    iput-object v0, p2, Ll/q4f;->s:Ljava/lang/String;

    .line 19
    .line 20
    sget-object v0, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->USER_BEHAVIOR_COMPLEMENT:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 21
    .line 22
    iput-object v0, p2, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 23
    .line 24
    const/4 v0, 0x0

    .line 25
    const/4 v1, 0x1

    .line 26
    invoke-static {p0, v0, p1, v1, v1}, Ll/rre;->h(Lcom/p1/mobile/putong/live/base/data/BLiveGivenGiftBrief;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;Ll/oo2;ZZ)Ljava/util/Map;

    .line 27
    .line 28
    .line 29
    move-result-object p0

    .line 30
    invoke-static {p2, p0}, Ll/i4g0;->n(Ll/q4f;Ljava/util/Map;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method
