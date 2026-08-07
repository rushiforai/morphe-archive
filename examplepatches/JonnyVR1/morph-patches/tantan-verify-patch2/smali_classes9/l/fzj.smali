.class public Ll/fzj;
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

.method public static a(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;ILjava/lang/String;)V
    .locals 17

    .line 1
    move-object/from16 v0, p2

    .line 2
    .line 3
    new-instance v1, Ll/q4f;

    .line 4
    .line 5
    invoke-direct {v1}, Ll/q4f;-><init>()V

    .line 6
    .line 7
    .line 8
    const-string v2, "e_gift"

    .line 9
    .line 10
    iput-object v2, v1, Ll/q4f;->s:Ljava/lang/String;

    .line 11
    .line 12
    move-object/from16 v2, p1

    .line 13
    .line 14
    iput-object v2, v1, Ll/q4f;->n:Ljava/lang/String;

    .line 15
    .line 16
    sget-object v2, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->BIZ_PAY:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 17
    .line 18
    iput-object v2, v1, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 19
    .line 20
    const-string v2, "index"

    .line 21
    .line 22
    const-string v3, "NA"

    .line 23
    .line 24
    invoke-static {v2, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object v4

    .line 28
    const-string v2, "module"

    .line 29
    .line 30
    const-string v5, "gift_set"

    .line 31
    .line 32
    invoke-static {v2, v5}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 33
    .line 34
    .line 35
    move-result-object v5

    .line 36
    const-string v2, "giftId"

    .line 37
    .line 38
    move-object/from16 v6, p0

    .line 39
    .line 40
    invoke-static {v2, v6}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 41
    .line 42
    .line 43
    move-result-object v6

    .line 44
    const-string v2, "giftName"

    .line 45
    .line 46
    iget-object v7, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 47
    .line 48
    invoke-static {v2, v7}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 49
    .line 50
    .line 51
    move-result-object v7

    .line 52
    iget-wide v8, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 53
    .line 54
    invoke-static {v8, v9}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 55
    .line 56
    .line 57
    move-result-object v0

    .line 58
    const-string v2, "giftUnitPrice"

    .line 59
    .line 60
    invoke-static {v2, v0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 61
    .line 62
    .line 63
    move-result-object v8

    .line 64
    const-string v0, "giftBarPageId"

    .line 65
    .line 66
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 67
    .line 68
    .line 69
    move-result-object v9

    .line 70
    const-string v0, "enoughCoin"

    .line 71
    .line 72
    sget-object v2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 73
    .line 74
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 75
    .line 76
    .line 77
    move-result-object v10

    .line 78
    const-string v0, "giftCombos"

    .line 79
    .line 80
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 81
    .line 82
    .line 83
    move-result-object v11

    .line 84
    const-string v0, "gift_type"

    .line 85
    .line 86
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 87
    .line 88
    .line 89
    move-result-object v12

    .line 90
    const-string v0, "combo_id"

    .line 91
    .line 92
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v13

    .line 96
    const-string v0, "gift_num"

    .line 97
    .line 98
    invoke-static/range {p3 .. p3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 103
    .line 104
    .line 105
    move-result-object v14

    .line 106
    const-string v0, "gift_bar_tab"

    .line 107
    .line 108
    invoke-static {v0, v3}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 109
    .line 110
    .line 111
    move-result-object v15

    .line 112
    const-string v0, "gift_receiver_id"

    .line 113
    .line 114
    move-object/from16 v2, p4

    .line 115
    .line 116
    invoke-static {v0, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 117
    .line 118
    .line 119
    move-result-object v16

    .line 120
    filled-new-array/range {v4 .. v16}, [Ll/pf60;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    invoke-static {v1, v0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 125
    .line 126
    .line 127
    return-void
.end method

.method public static b(Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "p_anchor_live_room"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "p_user_live_room"

    .line 7
    .line 8
    :goto_0
    const-string v0, "e_live_gift_set"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method
