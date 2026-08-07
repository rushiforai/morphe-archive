.class public Ll/btu;
.super Ljava/lang/Object;
.source "SourceFile"


# static fields
.field public static a:Ljava/lang/String; = "e_live_video_quickchat_close"

.field public static b:Ljava/lang/String; = "e_live_video_quickchat_missed_call"

.field public static c:Ljava/lang/String; = "e_live_video_quickchat_missed_call_list"

.field public static d:Ljava/lang/String; = "e_live_video_quickchat_call_back_close"

.field public static e:Ljava/lang/String; = "e_live_video_quickchat_missed_call_back"

.field public static f:Ljava/lang/String; = "e_live_video_quickchat_random_hang_up"

.field public static g:Ljava/lang/String; = "p_live_anchor_receive_video_quickchat"

.field public static h:Ljava/lang/String; = "p_live_anchor_video_quickchat_calling_back"

.field public static i:Ljava/lang/String; = "e_live_receive_video_quickchat_button"

.field public static j:Ljava/lang/String; = "p_live_user_receive_video_quickchat"

.field public static k:Ljava/lang/String; = "p_live_user_video_quickchat_calling"

.field public static l:Ljava/lang/String; = "p_live_user_video_quickchat_random_calling"


# direct methods
.method static constructor <clinit>()V
    .locals 0

    .line 1
    return-void
.end method

.method public constructor <init>()V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

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

.method public static b()V
    .locals 4

    .line 1
    sget-object v0, Ll/btu;->i:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/btu;->g:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "button_type"

    .line 6
    .line 7
    const-string v3, "answer"

    .line 8
    .line 9
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static c()V
    .locals 4

    .line 1
    sget-object v0, Ll/btu;->i:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/btu;->g:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "button_type"

    .line 6
    .line 7
    const-string v3, "hang_up"

    .line 8
    .line 9
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static d()V
    .locals 2

    .line 1
    const-string v0, "e_live_video_quickchat_end"

    .line 2
    .line 3
    const-string v1, "p_live_video_quickchat"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static e()V
    .locals 4

    .line 1
    sget-object v0, Ll/btu;->i:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/btu;->j:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "button_type"

    .line 6
    .line 7
    const-string v3, "answer"

    .line 8
    .line 9
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static f()V
    .locals 4

    .line 1
    sget-object v0, Ll/btu;->i:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/btu;->j:Ljava/lang/String;

    .line 4
    .line 5
    const-string v2, "button_type"

    .line 6
    .line 7
    const-string v3, "hang_up"

    .line 8
    .line 9
    invoke-static {v2, v3}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v2

    .line 13
    filled-new-array {v2}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-static {v0, v1, v2}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 18
    .line 19
    .line 20
    return-void
.end method

.method public static g()V
    .locals 2

    .line 1
    sget-object v0, Ll/btu;->a:Ljava/lang/String;

    .line 2
    .line 3
    sget-object v1, Ll/btu;->k:Ljava/lang/String;

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static h(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "anchorId"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "feedback_result"

    .line 8
    .line 9
    invoke-static {v0, p2}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p2

    .line 13
    const-string v0, "quickchat_id"

    .line 14
    .line 15
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    filled-new-array {p0, p2, p1}, [Ll/pf60;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    const-string p1, "e_live_video_quickchat_feedback"

    .line 24
    .line 25
    const-string p2, "p_live_video_quickchat"

    .line 26
    .line 27
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 28
    .line 29
    .line 30
    return-void
.end method

.method public static i(Ljava/lang/String;Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string v0, "anchorId"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "quickchat_id"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 14
    .line 15
    .line 16
    move-result-object p0

    .line 17
    const-string p1, "e_live_video_quickchat_feedback"

    .line 18
    .line 19
    const-string v0, "p_live_video_quickchat"

    .line 20
    .line 21
    invoke-static {p1, v0, p0}, Ll/i4g0;->A(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public static j()V
    .locals 2

    .line 1
    sget-object v0, Ll/btu;->a:Ljava/lang/String;

    .line 2
    .line 3
    const-string v1, "p_live_anchor_video_quickchat_calling"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public static k(Ll/jjs;ILjava/lang/String;Ljava/lang/String;ILjava/lang/String;Ljava/lang/String;Z)V
    .locals 4

    .line 1
    invoke-virtual {p0}, Ll/jjs;->h()Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/util/HashMap;

    .line 6
    .line 7
    invoke-direct {v1}, Ljava/util/HashMap;-><init>()V

    .line 8
    .line 9
    .line 10
    add-int/lit8 p1, p1, 0x1

    .line 11
    .line 12
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 13
    .line 14
    .line 15
    move-result-object p1

    .line 16
    const-string v2, "index"

    .line 17
    .line 18
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 19
    .line 20
    .line 21
    const-string p1, "module"

    .line 22
    .line 23
    const-string v2, "e_gift_bar"

    .line 24
    .line 25
    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    iget p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->id:I

    .line 29
    .line 30
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    const-string v2, "giftId"

    .line 35
    .line 36
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 37
    .line 38
    .line 39
    const-string p1, "giftName"

    .line 40
    .line 41
    iget-object v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->name:Ljava/lang/String;

    .line 42
    .line 43
    invoke-interface {v1, p1, v2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 44
    .line 45
    .line 46
    iget-wide v2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->unitPrice:D

    .line 47
    .line 48
    invoke-static {v2, v3}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    const-string v2, "giftUnitPrice"

    .line 53
    .line 54
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/jjs;->k()I

    .line 58
    .line 59
    .line 60
    move-result p1

    .line 61
    add-int/lit8 p1, p1, 0x1

    .line 62
    .line 63
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    const-string v2, "giftBarPageId"

    .line 68
    .line 69
    invoke-interface {v1, v2, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 70
    .line 71
    .line 72
    const-string p1, "enoughCoin"

    .line 73
    .line 74
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 75
    .line 76
    .line 77
    const-string p1, "gift_type"

    .line 78
    .line 79
    iget-object p2, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->giftType:Ljava/lang/String;

    .line 80
    .line 81
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 82
    .line 83
    .line 84
    const-string p1, "combo_id"

    .line 85
    .line 86
    const-string p2, "NA"

    .line 87
    .line 88
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 89
    .line 90
    .line 91
    const-string p1, "gift_num"

    .line 92
    .line 93
    invoke-static {p4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 94
    .line 95
    .line 96
    move-result-object p2

    .line 97
    invoke-interface {v1, p1, p2}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    const-string p1, "gift_bar_tab"

    .line 101
    .line 102
    invoke-virtual {p0}, Ll/jjs;->i()Ljava/lang/String;

    .line 103
    .line 104
    .line 105
    move-result-object p0

    .line 106
    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    const-string p0, "gift_send_type"

    .line 110
    .line 111
    invoke-interface {v1, p0, p5}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 112
    .line 113
    .line 114
    const-string p0, "gift_receiver_id"

    .line 115
    .line 116
    invoke-interface {v1, p0, p6}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    if-eqz p7, :cond_0

    .line 120
    .line 121
    const-string p0, "long_press"

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_0
    const-string p0, "click"

    .line 125
    .line 126
    :goto_0
    const-string p1, "gift_press_type"

    .line 127
    .line 128
    invoke-interface {v1, p1, p0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    const-string p0, "is_send_all"

    .line 132
    .line 133
    const-string p1, "0"

    .line 134
    .line 135
    invoke-interface {v1, p0, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    const-string p0, "e_gift"

    .line 139
    .line 140
    invoke-static {p0, p3, v1}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 141
    .line 142
    .line 143
    return-void
.end method

.method public static l(Ljava/util/List;ZLjava/lang/String;)V
    .locals 10
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
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
    const-string v2, "p_live_user_video_quickchat_room"

    .line 17
    .line 18
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 19
    .line 20
    .line 21
    move-result-object v3

    .line 22
    const-string v1, "productType"

    .line 23
    .line 24
    const-string v2, "coin"

    .line 25
    .line 26
    invoke-static {v1, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 27
    .line 28
    .line 29
    move-result-object v4

    .line 30
    const-string v1, "fold"

    .line 31
    .line 32
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 33
    .line 34
    .line 35
    move-result-object p1

    .line 36
    invoke-static {v1, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 37
    .line 38
    .line 39
    move-result-object v5

    .line 40
    const-string p1, "livefrist"

    .line 41
    .line 42
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 43
    .line 44
    .line 45
    move-result-object v6

    .line 46
    new-instance p1, Ll/atu;

    .line 47
    .line 48
    invoke-direct {p1}, Ll/atu;-><init>()V

    .line 49
    .line 50
    .line 51
    invoke-static {p0, p1}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 52
    .line 53
    .line 54
    move-result-object p0

    .line 55
    const-string p1, ","

    .line 56
    .line 57
    invoke-static {p0, p1}, Ll/jyb;->U(Ljava/util/Collection;Ljava/lang/String;)Ljava/lang/String;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    const-string p1, "skuGroup"

    .line 62
    .line 63
    invoke-static {p1, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 64
    .line 65
    .line 66
    move-result-object v7

    .line 67
    const-string p0, "ui_type"

    .line 68
    .line 69
    const-string p1, "NA"

    .line 70
    .line 71
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 72
    .line 73
    .line 74
    move-result-object v8

    .line 75
    const-string p0, "function_type"

    .line 76
    .line 77
    const-string p1, "live"

    .line 78
    .line 79
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 80
    .line 81
    .line 82
    move-result-object v9

    .line 83
    filled-new-array/range {v3 .. v9}, [Ll/pf60;

    .line 84
    .line 85
    .line 86
    move-result-object p0

    .line 87
    invoke-static {v0, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 88
    .line 89
    .line 90
    return-void
.end method

.method public static m(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    const-string v0, "quickchat_id"

    .line 2
    .line 3
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-string v0, "anchor_id"

    .line 8
    .line 9
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    const-string v0, "liveId"

    .line 14
    .line 15
    invoke-static {v0, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 16
    .line 17
    .line 18
    move-result-object p2

    .line 19
    const-string v0, "button_type"

    .line 20
    .line 21
    const-string v1, "gift"

    .line 22
    .line 23
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    filled-new-array {p0, p1, p2, v0}, [Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p0

    .line 31
    const-string p1, "e_live_video_button"

    .line 32
    .line 33
    const-string p2, "p_live_user_video_quickchat_room"

    .line 34
    .line 35
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static n(Z)V
    .locals 1

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "p_live_anchor_video_quickchat_room"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "p_live_user_video_quickchat_room"

    .line 7
    .line 8
    :goto_0
    const-string v0, "e_live_video_quickchat_hang_up"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public static o()V
    .locals 3

    .line 1
    const-string v0, "module"

    .line 2
    .line 3
    const-string v1, "p_live_user_video_quickchat_room"

    .line 4
    .line 5
    invoke-static {v0, v1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    filled-new-array {v0}, [Ll/pf60;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    const-string v2, "e_recharge"

    .line 14
    .line 15
    invoke-static {v2, v1, v0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static p(ZLjava/lang/String;Ljava/lang/String;)V
    .locals 2

    .line 1
    new-instance v0, Ll/q4f;

    .line 2
    .line 3
    invoke-direct {v0}, Ll/q4f;-><init>()V

    .line 4
    .line 5
    .line 6
    sget-object v1, Lcom/tantanapp/foxstatistics/entity/EventNameEnum;->PAGE_VIEW:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 7
    .line 8
    iput-object v1, v0, Ll/q4f;->d:Lcom/tantanapp/foxstatistics/entity/EventNameEnum;

    .line 9
    .line 10
    if-eqz p0, :cond_0

    .line 11
    .line 12
    const-string p0, "p_live_anchor_video_quickchat_room"

    .line 13
    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const-string p0, "p_live_user_video_quickchat_room"

    .line 16
    .line 17
    :goto_0
    iput-object p0, v0, Ll/q4f;->n:Ljava/lang/String;

    .line 18
    .line 19
    const-string p0, "anchorId"

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    const-string p1, "quickchat_id"

    .line 26
    .line 27
    invoke-static {p1, p2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    filled-new-array {p0, p1}, [Ll/pf60;

    .line 32
    .line 33
    .line 34
    move-result-object p0

    .line 35
    invoke-static {v0, p0}, Ll/i4g0;->o(Ll/q4f;[Ll/pf60;)V

    .line 36
    .line 37
    .line 38
    return-void
.end method

.method public static q(Z)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "open"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "close"

    .line 7
    .line 8
    :goto_0
    const-string v0, "setting_result"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_live_camera_setting"

    .line 19
    .line 20
    const-string v1, "p_live_user_video_quickchat_room"

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static r(Z)V
    .locals 2

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    const-string p0, "open"

    .line 4
    .line 5
    goto :goto_0

    .line 6
    :cond_0
    const-string p0, "close"

    .line 7
    .line 8
    :goto_0
    const-string v0, "setting_result"

    .line 9
    .line 10
    invoke-static {v0, p0}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    filled-new-array {p0}, [Ll/pf60;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    const-string v0, "e_live_voice_setting"

    .line 19
    .line 20
    const-string v1, "p_live_user_video_quickchat_room"

    .line 21
    .line 22
    invoke-static {v0, v1, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 23
    .line 24
    .line 25
    return-void
.end method
