.class public Ll/p6g0;
.super Ll/i6t;
.source "SourceFile"

# interfaces
.implements Ll/dse;


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<T:",
        "Ll/oo2;",
        ">",
        "Ll/i6t<",
        "TT;",
        "Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;",
        ">;",
        "Ll/dse;"
    }
.end annotation


# instance fields
.field public i:Z

.field public j:Ll/kcg0;

.field public final k:Ll/jxd0;

.field public l:I


# direct methods
.method public constructor <init>(Ll/dum;)V
    .locals 2
    .annotation build Landroid/annotation/SuppressLint;
        value = {
            "InflateParams"
        }
    .end annotation

    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TT;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/i6t;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/jxd0;

    .line 5
    .line 6
    new-instance v0, Ljava/lang/StringBuilder;

    .line 7
    .line 8
    const-string v1, "confirm_send_storm_danmaku_dialog_show"

    .line 9
    .line 10
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    sget-object v1, Ll/zrv;->a:Ll/wrv;

    .line 14
    .line 15
    invoke-virtual {v1}, Ll/wrv;->D0()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 20
    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    sget-object v1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 27
    .line 28
    invoke-direct {p1, v0, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 29
    .line 30
    .line 31
    iput-object p1, p0, Ll/p6g0;->k:Ll/jxd0;

    .line 32
    .line 33
    const/4 p1, -0x1

    .line 34
    iput p1, p0, Ll/p6g0;->l:I

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    sget v0, Ll/yec0;->E0:I

    .line 45
    .line 46
    const/4 v1, 0x0

    .line 47
    invoke-virtual {p1, v0, v1}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 54
    .line 55
    .line 56
    return-void
.end method

.method public static synthetic J3(Landroid/widget/CompoundButton;Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic K3(Ll/p6g0;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6g0;->U3(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)V

    return-void
.end method

.method public static synthetic L3(Ll/p6g0;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/p6g0;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/p6g0;Lv/VCheckBox;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2, p3, p4}, Ll/p6g0;->V3(Lv/VCheckBox;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V

    return-void
.end method

.method public static synthetic N3(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResource;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResource;->kind:Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;

    .line 2
    .line 3
    invoke-static {p0, p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Lcom/p1/mobile/putong/data/tenum/TEnum;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method

.method public static synthetic O3(Ll/p6g0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method


# virtual methods
.method public K()Landroid/view/View;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Landroid/view/View;

    .line 4
    .line 5
    return-object p0
.end method

.method public P3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->dismissEffectsDanmakuDialog()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 15
    .line 16
    .line 17
    move-result-object p0

    .line 18
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 19
    .line 20
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->chatInputClick()Ll/v3f$d;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    new-instance v0, Ll/vv4;

    .line 25
    .line 26
    const/4 v1, 0x1

    .line 27
    const-string v2, ""

    .line 28
    .line 29
    invoke-direct {v0, v1, v2}, Ll/vv4;-><init>(ZLjava/lang/String;)V

    .line 30
    .line 31
    .line 32
    const-string v1, "1"

    .line 33
    .line 34
    invoke-virtual {v0, v1}, Ll/vv4;->b(Ljava/lang/String;)Ll/vv4;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 39
    .line 40
    .line 41
    return-void
.end method

.method public final R3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V
    .locals 7
    .param p1    # Ljava/lang/String;
        .annotation build Landroidx/annotation/NonNull;
        .end annotation
    .end param

    .line 1
    invoke-virtual {p1}, Ljava/lang/String;->length()I

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    const/4 v1, 0x5

    .line 6
    if-gt v0, v1, :cond_0

    .line 7
    .line 8
    const-string v0, "s"

    .line 9
    .line 10
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/16 v1, 0xa

    .line 16
    .line 17
    if-gt v0, v1, :cond_1

    .line 18
    .line 19
    const-string v0, "m"

    .line 20
    .line 21
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    goto :goto_0

    .line 26
    :cond_1
    const-string v0, "l"

    .line 27
    .line 28
    invoke-static {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    :goto_0
    iget-object p3, p3, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;->resources:Ljava/util/List;

    .line 33
    .line 34
    new-instance v1, Ll/l6g0;

    .line 35
    .line 36
    invoke-direct {v1, v0}, Ll/l6g0;-><init>(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResourceType;)V

    .line 37
    .line 38
    .line 39
    invoke-static {p3, v1}, Ll/jyb;->r(Ljava/util/Collection;Ll/qcj;)Ljava/lang/Object;

    .line 40
    .line 41
    .line 42
    move-result-object p3

    .line 43
    check-cast p3, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResource;

    .line 44
    .line 45
    if-eqz p3, :cond_4

    .line 46
    .line 47
    iget-object v1, p3, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuGiftResource;->giftId:Ljava/lang/String;

    .line 48
    .line 49
    const-string p3, "video"

    .line 50
    .line 51
    invoke-static {p3}, Ll/wqe;->d(Ljava/lang/String;)Ll/l4;

    .line 52
    .line 53
    .line 54
    move-result-object p3

    .line 55
    sget-object v0, Ll/htd0;->c:Ll/htd0;

    .line 56
    .line 57
    invoke-static {v0}, Ll/zrv;->l(Ll/htd0;)Ljava/lang/Object;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    check-cast v0, Ll/hiv;

    .line 62
    .line 63
    invoke-virtual {v0, v1}, Ll/hiv;->m(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveGiftItem;->liveResourceId:Ljava/lang/String;

    .line 68
    .line 69
    invoke-virtual {p3, v0}, Ll/l4;->g(Ljava/lang/String;)Z

    .line 70
    .line 71
    .line 72
    move-result p3

    .line 73
    if-nez p3, :cond_2

    .line 74
    .line 75
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->de:I

    .line 76
    .line 77
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 78
    .line 79
    .line 80
    return-void

    .line 81
    :cond_2
    new-instance v0, Ll/hne0$a;

    .line 82
    .line 83
    invoke-direct {v0}, Ll/hne0$a;-><init>()V

    .line 84
    .line 85
    .line 86
    new-instance v2, Ll/p6g0$a;

    .line 87
    .line 88
    invoke-direct {v2, p0}, Ll/p6g0$a;-><init>(Ll/p6g0;)V

    .line 89
    .line 90
    .line 91
    const-string p3, "bulletstorm"

    .line 92
    .line 93
    invoke-static {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;

    .line 94
    .line 95
    .line 96
    move-result-object p3

    .line 97
    invoke-static {p3}, Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;->getNativeTraceServerData(Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerBiz;)Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;

    .line 98
    .line 99
    .line 100
    move-result-object v6

    .line 101
    const/4 v3, 0x1

    .line 102
    const-string v4, "bullet_storm"

    .line 103
    .line 104
    const-string v5, "bullet_storm"

    .line 105
    .line 106
    invoke-virtual/range {v0 .. v6}, Ll/hne0$a;->u(Ljava/lang/String;Ll/aiv$a$a;ILjava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveTraceServerData;)Ll/hne0$a;

    .line 107
    .line 108
    .line 109
    move-result-object p3

    .line 110
    const/4 v0, 0x0

    .line 111
    invoke-virtual {p3, v0}, Ll/hne0$a;->A(Z)Ll/hne0$a;

    .line 112
    .line 113
    .line 114
    move-result-object p3

    .line 115
    invoke-virtual {p3, p1}, Ll/hne0$a;->D(Ljava/lang/String;)Ll/hne0$a;

    .line 116
    .line 117
    .line 118
    move-result-object p3

    .line 119
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    if-nez v0, :cond_3

    .line 124
    .line 125
    invoke-virtual {p3, p2}, Ll/hne0$a;->C(Ljava/lang/String;)Ll/hne0$a;

    .line 126
    .line 127
    .line 128
    :cond_3
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 129
    .line 130
    .line 131
    move-result-object p2

    .line 132
    iget-object p2, p2, Lcom/tantan/live/eventbus/LiveEventBus;->SendGiftEventGroup:Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;

    .line 133
    .line 134
    invoke-virtual {p2}, Lcom/tantan/live/eventbus/LiveEventBus$SendGiftEventGroup;->sendGift()Ll/v3f$d;

    .line 135
    .line 136
    .line 137
    move-result-object p2

    .line 138
    invoke-virtual {p3}, Ll/hne0$a;->t()Ll/hne0;

    .line 139
    .line 140
    .line 141
    move-result-object p3

    .line 142
    invoke-virtual {p2, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 143
    .line 144
    .line 145
    new-instance p2, Ljava/util/HashMap;

    .line 146
    .line 147
    invoke-direct {p2}, Ljava/util/HashMap;-><init>()V

    .line 148
    .line 149
    .line 150
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 151
    .line 152
    .line 153
    move-result-object p3

    .line 154
    invoke-virtual {p3}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 155
    .line 156
    .line 157
    move-result-object p3

    .line 158
    iget-object p3, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 159
    .line 160
    const-string v0, "anchor_id"

    .line 161
    .line 162
    invoke-interface {p2, v0, p3}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    const-string p3, "bullet_storm_text"

    .line 166
    .line 167
    invoke-interface {p2, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    invoke-virtual {p1}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 175
    .line 176
    .line 177
    move-result-object p1

    .line 178
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 179
    .line 180
    const-string p3, "live_id"

    .line 181
    .line 182
    invoke-interface {p2, p3, p1}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 183
    .line 184
    .line 185
    const-string p1, "e_live_bullet_storm_send"

    .line 186
    .line 187
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    invoke-static {p1, p0, p2}, Ll/i4g0;->s(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 192
    .line 193
    .line 194
    :cond_4
    return-void
.end method

.method public S3()I
    .locals 0

    .line 1
    iget p0, p0, Ll/p6g0;->l:I

    .line 2
    .line 3
    return p0
.end method

.method public final synthetic T3(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-boolean p0, p0, Ll/p6g0;->i:Z

    .line 2
    .line 3
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    return-object p0
.end method

.method public final synthetic U3(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/p6g0;->l:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->P(Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmaku;)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public V()Z
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->J()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    return p0
.end method

.method public final synthetic V3(Lv/VCheckBox;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/p6g0;->k:Ll/jxd0;

    .line 2
    .line 3
    invoke-virtual {p1}, Landroid/widget/CompoundButton;->isChecked()Z

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    xor-int/lit8 p1, p1, 0x1

    .line 8
    .line 9
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {v0, p1}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, p2, p3, p4}, Ll/p6g0;->R3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public W3()V
    .locals 1

    .line 1
    const/4 v0, -0x1

    .line 2
    iput v0, p0, Ll/p6g0;->l:I

    .line 3
    .line 4
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 7
    .line 8
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->O()V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public X3(I)V
    .locals 1

    .line 1
    iget v0, p0, Ll/p6g0;->l:I

    .line 2
    .line 3
    if-ne v0, p1, :cond_0

    .line 4
    .line 5
    const/4 p1, -0x1

    .line 6
    :cond_0
    iput p1, p0, Ll/p6g0;->l:I

    .line 7
    .line 8
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 11
    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->O()V

    .line 13
    .line 14
    .line 15
    return-void
.end method

.method public Y0(Ll/sre;)V
    .locals 2

    .line 1
    const/4 v0, 0x1

    .line 2
    iput-boolean v0, p0, Ll/p6g0;->i:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 7
    .line 8
    iget-boolean p1, p1, Ll/sre;->b:Z

    .line 9
    .line 10
    xor-int/2addr p1, v0

    .line 11
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->R(Z)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {p0}, Ll/p6g0;->Y3()V

    .line 15
    .line 16
    .line 17
    new-instance p1, Ljava/util/HashMap;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/HashMap;-><init>()V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 31
    .line 32
    const-string v1, "anchor_id"

    .line 33
    .line 34
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    invoke-virtual {v0}, Ll/vp20;->j()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 46
    .line 47
    const-string v1, "live_id"

    .line 48
    .line 49
    invoke-interface {p1, v1, v0}, Ljava/util/Map;->put(Ljava/lang/Object;Ljava/lang/Object;)Ljava/lang/Object;

    .line 50
    .line 51
    .line 52
    const-string v0, "e_live_bullet_storm_send"

    .line 53
    .line 54
    invoke-virtual {p0}, Ll/xzs;->R2()Ljava/lang/String;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-static {v0, p0, p1}, Ll/i4g0;->y(Ljava/lang/String;Ljava/lang/String;Ljava/util/Map;)V

    .line 59
    .line 60
    .line 61
    return-void
.end method

.method public final Y3()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v1, p0, Ll/p6g0;->j:Ll/kcg0;

    .line 13
    .line 14
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 15
    .line 16
    .line 17
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {v1}, Ll/vp20;->k()Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object v1

    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v2

    .line 31
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->X5(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    new-instance v1, Ll/m6g0;

    .line 44
    .line 45
    invoke-direct {v1}, Ll/m6g0;-><init>()V

    .line 46
    .line 47
    .line 48
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    new-instance v1, Ll/n6g0;

    .line 53
    .line 54
    invoke-direct {v1, p0}, Ll/n6g0;-><init>(Ll/p6g0;)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object v0

    .line 61
    new-instance v1, Ll/o6g0;

    .line 62
    .line 63
    invoke-direct {v1, p0}, Ll/o6g0;-><init>(Ll/p6g0;)V

    .line 64
    .line 65
    .line 66
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 67
    .line 68
    .line 69
    move-result-object v1

    .line 70
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 71
    .line 72
    .line 73
    move-result-object v0

    .line 74
    iput-object v0, p0, Ll/p6g0;->j:Ll/kcg0;

    .line 75
    .line 76
    return-void
.end method

.method public Z3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V
    .locals 8

    .line 1
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    invoke-static {p2}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-object v0, p0, Ll/p6g0;->k:Ll/jxd0;

    .line 15
    .line 16
    invoke-virtual {v0}, Ll/azd0;->get()Ljava/lang/Object;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    check-cast v0, Ljava/lang/Boolean;

    .line 21
    .line 22
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/p1/mobile/android/app/Act;->inflater()Landroid/view/LayoutInflater;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    sget v1, Ll/yec0;->o0:I

    .line 35
    .line 36
    const/4 v2, 0x0

    .line 37
    invoke-virtual {v0, v1, v2}, Landroid/view/LayoutInflater;->inflate(ILandroid/view/ViewGroup;)Landroid/view/View;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    sget v1, Ll/mdc0;->q0:I

    .line 42
    .line 43
    invoke-virtual {v0, v1}, Landroid/view/View;->findViewById(I)Landroid/view/View;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    move-object v4, v1

    .line 48
    check-cast v4, Lv/VCheckBox;

    .line 49
    .line 50
    const/4 v1, 0x1

    .line 51
    invoke-virtual {v4, v1}, Landroid/widget/CompoundButton;->setChecked(Z)V

    .line 52
    .line 53
    .line 54
    new-instance v2, Ll/j6g0;

    .line 55
    .line 56
    invoke-direct {v2}, Ll/j6g0;-><init>()V

    .line 57
    .line 58
    .line 59
    invoke-virtual {v4, v2}, Landroid/widget/CompoundButton;->setOnCheckedChangeListener(Landroid/widget/CompoundButton$OnCheckedChangeListener;)V

    .line 60
    .line 61
    .line 62
    iget-object v2, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 63
    .line 64
    invoke-virtual {v2}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 65
    .line 66
    .line 67
    move-result-object v2

    .line 68
    invoke-virtual {v2, v0, v1}, Lcom/p1/mobile/android/app/Dialog$e;->P(Landroid/view/View;Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->ce:I

    .line 73
    .line 74
    iget-object v2, p3, Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;->price:Ljava/lang/String;

    .line 75
    .line 76
    filled-new-array {v2}, [Ljava/lang/Object;

    .line 77
    .line 78
    .line 79
    move-result-object v2

    .line 80
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->F0(I[Ljava/lang/Object;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 81
    .line 82
    .line 83
    move-result-object v0

    .line 84
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 85
    .line 86
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->rd:I

    .line 87
    .line 88
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    new-instance v2, Ll/k6g0;

    .line 93
    .line 94
    move-object v3, p0

    .line 95
    move-object v5, p1

    .line 96
    move-object v6, p2

    .line 97
    move-object v7, p3

    .line 98
    invoke-direct/range {v2 .. v7}, Ll/k6g0;-><init>(Ll/p6g0;Lv/VCheckBox;Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V

    .line 99
    .line 100
    .line 101
    invoke-virtual {v0, v1, v2}, Lcom/p1/mobile/android/app/Dialog$e;->v0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 106
    .line 107
    sget p2, Lcom/p1/mobile/putong/live/livingroom/R$string;->z:I

    .line 108
    .line 109
    invoke-virtual {p1, p2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->m0(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z()Lcom/p1/mobile/android/app/Dialog;

    .line 118
    .line 119
    .line 120
    move-result-object p0

    .line 121
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog;->show()V

    .line 122
    .line 123
    .line 124
    return-void

    .line 125
    :cond_1
    move-object v3, p0

    .line 126
    move-object v5, p1

    .line 127
    move-object v6, p2

    .line 128
    move-object v7, p3

    .line 129
    invoke-virtual {v3, v5, v6, v7}, Ll/p6g0;->R3(Ljava/lang/String;Ljava/lang/String;Lcom/p1/mobile/putong/live/base/data/BLiveStormDanmakuResource;)V

    .line 130
    .line 131
    .line 132
    return-void
.end method

.method public a4()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->showEffectsDanmakuDialog()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/sre$a;

    .line 12
    .line 13
    invoke-direct {v0}, Ll/sre$a;-><init>()V

    .line 14
    .line 15
    .line 16
    sget-object v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;->STORM_RULE:Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;

    .line 17
    .line 18
    invoke-virtual {v0, v1}, Ll/sre$a;->c(Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/EffectsDanmakuEvent$Page;)Ll/sre$a;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-virtual {v0}, Ll/sre$a;->a()Ll/sre;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public b4(I)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->EffectsDanmakuEvent:Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$EffectsDanmakuEvent;->verticalTranslateDialogContent()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public g0(I)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->w(I)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public w()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    iput-boolean v0, p0, Ll/p6g0;->i:Z

    .line 3
    .line 4
    iget-object v1, p0, Ll/p6g0;->j:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v1}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 12
    .line 13
    invoke-virtual {v1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->A()V

    .line 14
    .line 15
    .line 16
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 17
    .line 18
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;

    .line 19
    .line 20
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/danmaku/input/effects/storm/StormDanmakuViewModel;->w(I)V

    .line 21
    .line 22
    .line 23
    return-void
.end method
