.class public Ll/gpc0;
.super Ljava/lang/Object;
.source "SourceFile"


# direct methods
.method public static synthetic a(Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;)Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;

    .line 2
    .line 3
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveStockKeepUnit;->id:Ljava/lang/String;

    .line 4
    .line 5
    return-object p0
.end method

.method public static b(Ljava/lang/String;Z)Ljava/lang/String;
    .locals 1

    .line 1
    const-string v0, "liveFastGiftClick"

    .line 2
    .line 3
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    if-eqz p1, :cond_0

    .line 10
    .line 11
    const-string p0, "p_anchor_live_room,e_quickgift,click"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "p_user_live_room,e_quickgift,click"

    .line 15
    .line 16
    return-object p0

    .line 17
    :cond_1
    const-string v0, "liveGiftBarGiftClick"

    .line 18
    .line 19
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_3

    .line 24
    .line 25
    if-eqz p1, :cond_2

    .line 26
    .line 27
    const-string p0, "p_anchor_live_room,e_gift,click"

    .line 28
    .line 29
    return-object p0

    .line 30
    :cond_2
    const-string p0, "p_user_live_room,e_gift,click"

    .line 31
    .line 32
    return-object p0

    .line 33
    :cond_3
    const-string v0, "liveGiftBarRechargeClick"

    .line 34
    .line 35
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    if-eqz v0, :cond_5

    .line 40
    .line 41
    if-eqz p1, :cond_4

    .line 42
    .line 43
    const-string p0, "p_anchor_live_room,e_recharge,click"

    .line 44
    .line 45
    return-object p0

    .line 46
    :cond_4
    const-string p0, "p_user_live_room,e_recharge,click"

    .line 47
    .line 48
    return-object p0

    .line 49
    :cond_5
    const-string v0, "liveGiftSuitClick"

    .line 50
    .line 51
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    if-eqz v0, :cond_7

    .line 56
    .line 57
    if-eqz p1, :cond_6

    .line 58
    .line 59
    const-string p0, "p_anchor_live_room,e_live_gift_set,click"

    .line 60
    .line 61
    return-object p0

    .line 62
    :cond_6
    const-string p0, "p_user_live_room,e_live_gift_set,click"

    .line 63
    .line 64
    return-object p0

    .line 65
    :cond_7
    const-string v0, "liveGiftGuardClick"

    .line 66
    .line 67
    invoke-virtual {v0, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-eqz v0, :cond_8

    .line 72
    .line 73
    const-string p0, "p_anchor_live_room,e_live_guard_info,click"

    .line 74
    .line 75
    return-object p0

    .line 76
    :cond_8
    const-string v0, "liveGiftH5Click"

    .line 77
    .line 78
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    if-eqz v0, :cond_a

    .line 83
    .line 84
    if-eqz p1, :cond_9

    .line 85
    .line 86
    const-string p0, "p_anchor_live_room,e_h5,click"

    .line 87
    .line 88
    return-object p0

    .line 89
    :cond_9
    const-string p0, "p_user_live_room,e_h5,click"

    .line 90
    .line 91
    return-object p0

    .line 92
    :cond_a
    const-string v0, "liveGiftDanMuKuClick"

    .line 93
    .line 94
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    if-eqz v0, :cond_c

    .line 99
    .line 100
    if-eqz p1, :cond_b

    .line 101
    .line 102
    const-string p0, "p_anchor_live_room,e_pay_bullet_button,click"

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_b
    const-string p0, "p_user_live_room,e_pay_bullet_button,click"

    .line 106
    .line 107
    return-object p0

    .line 108
    :cond_c
    const-string p1, "e_audio_ktv_panel"

    .line 109
    .line 110
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    if-eqz v0, :cond_d

    .line 115
    .line 116
    return-object p1

    .line 117
    :cond_d
    sget-object p1, Ll/zeu;->h:Ljava/lang/String;

    .line 118
    .line 119
    invoke-static {p1, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result p0

    .line 123
    if-eqz p0, :cond_e

    .line 124
    .line 125
    sget-object p0, Ll/zeu;->h:Ljava/lang/String;

    .line 126
    .line 127
    return-object p0

    .line 128
    :cond_e
    const-string p0, "NA"

    .line 129
    .line 130
    return-object p0
.end method

.method public static c(Ljava/lang/String;ILjava/lang/String;ZZ)V
    .locals 16

    .line 1
    move-object/from16 v1, p2

    .line 2
    .line 3
    const-string v2, "coin"

    .line 4
    .line 5
    const-string v3, "productType"

    .line 6
    .line 7
    const-string v4, "purchaseShowFrom"

    .line 8
    .line 9
    new-instance v5, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-virtual {v5, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v5, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    const-string v0, "skuID"

    .line 26
    .line 27
    move-object/from16 v6, p0

    .line 28
    .line 29
    invoke-static {v0, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const-string v0, "platform"

    .line 34
    .line 35
    const-string v7, "alipay"

    .line 36
    .line 37
    invoke-static {v0, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-static {v4, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    const-string v0, "price"

    .line 50
    .line 51
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    const-string v0, "fold"

    .line 60
    .line 61
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    const-string v0, "pageExtras"

    .line 70
    .line 71
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v12

    .line 75
    const-string v0, "livefrist"

    .line 76
    .line 77
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 78
    .line 79
    .line 80
    move-result-object v1

    .line 81
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/wrv;->k0()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    const-string v1, "no"

    .line 92
    .line 93
    const-string v2, "yes"

    .line 94
    .line 95
    if-eqz v0, :cond_0

    .line 96
    .line 97
    move-object v0, v2

    .line 98
    goto :goto_1

    .line 99
    :cond_0
    move-object v0, v1

    .line 100
    :goto_1
    const-string v3, "no_secret_payment"

    .line 101
    .line 102
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v14

    .line 106
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/wrv;->k0()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    move-object v1, v2

    .line 115
    :cond_1
    const-string v0, "user_secret_staus"

    .line 116
    .line 117
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v15

    .line 121
    filled-new-array/range {v6 .. v15}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, "e_purchase_button"

    .line 126
    .line 127
    const-string v2, "p_purchase_page"

    .line 128
    .line 129
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public static d(Ll/uoe0;Ljava/lang/String;Z)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uoe0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_1

    .line 6
    .line 7
    const-string p0, "event_type"

    .line 8
    .line 9
    const-string v0, "MC"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "gift_redpackage_event_type"

    .line 16
    .line 17
    const-string v1, "redpackage"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    if-eqz p2, :cond_0

    .line 24
    .line 25
    const-string p2, "yes"

    .line 26
    .line 27
    goto :goto_0

    .line 28
    :cond_0
    const-string p2, "no"

    .line 29
    .line 30
    :goto_0
    const-string v1, "gift_redpackage_operate"

    .line 31
    .line 32
    invoke-static {v1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object p2

    .line 36
    filled-new-array {p0, v0, p2}, [Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object p0

    .line 40
    const-string p2, "e_live_send_gift_into"

    .line 41
    .line 42
    invoke-static {p2, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    return-void
.end method

.method public static e(Ll/uoe0;Ljava/lang/String;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/uoe0;->k()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-eqz p0, :cond_0

    .line 6
    .line 7
    const-string p0, "event_type"

    .line 8
    .line 9
    const-string v0, "MV"

    .line 10
    .line 11
    invoke-static {p0, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    const-string v0, "gift_redpackage_event_type"

    .line 16
    .line 17
    const-string v1, "redpackage"

    .line 18
    .line 19
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object v0

    .line 23
    filled-new-array {p0, v0}, [Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    const-string v0, "e_live_send_gift_into"

    .line 28
    .line 29
    invoke-static {v0, p1, p0}, Ll/i4g0;->D(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 30
    .line 31
    .line 32
    :cond_0
    return-void
.end method

.method public static f(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "livefrist"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_user_live_room_first_recharge_success"

    .line 12
    .line 13
    const-string v1, "p_user_live_room"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static g(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "livefrist"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_user_live_room_first_recharge_success"

    .line 12
    .line 13
    const-string v1, "p_user_live_room"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static h()V
    .locals 2

    .line 1
    const-string v0, "e_fold_click"

    .line 2
    .line 3
    const-string v1, "p_purchase_page"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/util/List;ZLjava/lang/String;)V
    .locals 9
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/lang/String;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveMerchandise;",
            ">;Z",
            "Ljava/lang/String;",
            ")V"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    const-string v1, "p_purchase_page"

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 9
    .line 10
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 11
    .line 12
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 13
    .line 14
    const-string v1, "purchaseShowFrom"

    .line 15
    .line 16
    invoke-static {v1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 17
    .line 18
    .line 19
    move-result-object v2

    .line 20
    const-string p0, "productType"

    .line 21
    .line 22
    const-string v1, "coin"

    .line 23
    .line 24
    invoke-static {p0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v3

    .line 28
    const-string p0, "fold"

    .line 29
    .line 30
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p2

    .line 34
    invoke-static {p0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 35
    .line 36
    .line 37
    move-result-object v4

    .line 38
    const-string p0, "livefrist"

    .line 39
    .line 40
    invoke-static {p0, p3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v5

    .line 44
    new-instance p0, Ll/fpc0;

    .line 45
    .line 46
    invoke-direct {p0}, Ll/fpc0;-><init>()V

    .line 47
    .line 48
    .line 49
    invoke-static {p1, p0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    const-string p1, ","

    .line 54
    .line 55
    invoke-static {p0, p1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 56
    .line 57
    .line 58
    move-result-object p0

    .line 59
    const-string p1, "skuGroup"

    .line 60
    .line 61
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 62
    .line 63
    .line 64
    move-result-object v6

    .line 65
    const-string p0, "ui_type"

    .line 66
    .line 67
    const-string p1, "NA"

    .line 68
    .line 69
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 70
    .line 71
    .line 72
    move-result-object v7

    .line 73
    const-string p0, "function_type"

    .line 74
    .line 75
    const-string p1, "live"

    .line 76
    .line 77
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 78
    .line 79
    .line 80
    move-result-object v8

    .line 81
    filled-new-array/range {v2 .. v8}, [Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    invoke-static {v0, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 86
    .line 87
    .line 88
    return-void
.end method

.method public static j(Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "skuID"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    filled-new-array {p0}, [Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    const-string v0, "e_purchase_intermediate_button"

    .line 12
    .line 13
    const-string v1, "p_purchase_page"

    .line 14
    .line 15
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static k(Ljava/lang/String;ILjava/lang/String;ZZ)V
    .locals 16

    .line 1
    move-object/from16 v1, p2

    .line 2
    .line 3
    const-string v2, "coin"

    .line 4
    .line 5
    const-string v3, "productType"

    .line 6
    .line 7
    const-string v4, "purchaseShowFrom"

    .line 8
    .line 9
    new-instance v5, Lorg/json/JSONObject;

    .line 10
    .line 11
    invoke-direct {v5}, Lorg/json/JSONObject;-><init>()V

    .line 12
    .line 13
    .line 14
    :try_start_0
    invoke-virtual {v5, v4, v1}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v5, v3, v2}, Lorg/json/JSONObject;->put(Ljava/lang/String;Ljava/lang/Object;)Lorg/json/JSONObject;
    :try_end_0
    .catch Lorg/json/JSONException; {:try_start_0 .. :try_end_0} :catch_0

    .line 18
    .line 19
    .line 20
    goto :goto_0

    .line 21
    :catch_0
    move-exception v0

    .line 22
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 23
    .line 24
    .line 25
    :goto_0
    const-string v0, "skuID"

    .line 26
    .line 27
    move-object/from16 v6, p0

    .line 28
    .line 29
    invoke-static {v0, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 30
    .line 31
    .line 32
    move-result-object v6

    .line 33
    const-string v0, "platform"

    .line 34
    .line 35
    const-string v7, "wechat"

    .line 36
    .line 37
    invoke-static {v0, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 38
    .line 39
    .line 40
    move-result-object v7

    .line 41
    invoke-static {v4, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 42
    .line 43
    .line 44
    move-result-object v8

    .line 45
    invoke-static {v3, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 46
    .line 47
    .line 48
    move-result-object v9

    .line 49
    const-string v0, "price"

    .line 50
    .line 51
    invoke-static/range {p1 .. p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object v1

    .line 55
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 56
    .line 57
    .line 58
    move-result-object v10

    .line 59
    const-string v0, "fold"

    .line 60
    .line 61
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 62
    .line 63
    .line 64
    move-result-object v1

    .line 65
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 66
    .line 67
    .line 68
    move-result-object v11

    .line 69
    const-string v0, "livefrist"

    .line 70
    .line 71
    invoke-static/range {p4 .. p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 72
    .line 73
    .line 74
    move-result-object v1

    .line 75
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 76
    .line 77
    .line 78
    move-result-object v12

    .line 79
    const-string v0, "pageExtras"

    .line 80
    .line 81
    invoke-static {v0, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 82
    .line 83
    .line 84
    move-result-object v13

    .line 85
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 86
    .line 87
    invoke-virtual {v0}, Ll/wrv;->k0()Z

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    const-string v1, "no"

    .line 92
    .line 93
    const-string v2, "yes"

    .line 94
    .line 95
    if-eqz v0, :cond_0

    .line 96
    .line 97
    move-object v0, v2

    .line 98
    goto :goto_1

    .line 99
    :cond_0
    move-object v0, v1

    .line 100
    :goto_1
    const-string v3, "no_secret_payment"

    .line 101
    .line 102
    invoke-static {v3, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v14

    .line 106
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 107
    .line 108
    invoke-virtual {v0}, Ll/wrv;->k0()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    if-eqz v0, :cond_1

    .line 113
    .line 114
    move-object v1, v2

    .line 115
    :cond_1
    const-string v0, "user_secret_staus"

    .line 116
    .line 117
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 118
    .line 119
    .line 120
    move-result-object v15

    .line 121
    filled-new-array/range {v6 .. v15}, [Ll/pf60;

    .line 122
    .line 123
    .line 124
    move-result-object v0

    .line 125
    const-string v1, "e_purchase_button"

    .line 126
    .line 127
    const-string v2, "p_purchase_page"

    .line 128
    .line 129
    invoke-static {v1, v2, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method
