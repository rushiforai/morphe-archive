.class public Ll/ojp0;
.super Ll/x5;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/x5<",
        "Ll/jqm0;",
        "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
        "Ll/noo0;",
        "Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;",
        ">;"
    }
.end annotation


# instance fields
.field public final j:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

.field public final k:Ll/ogd0;

.field public l:Ll/kcg0;

.field public m:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/noo0;Ll/ogd0;Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;)V
    .locals 1

    .line 1
    invoke-direct {p0, p1}, Ll/x5;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iget-object v0, p1, Ll/dum;->f:Lcom/p1/mobile/putong/live/livingroom/archi/act/LiveBaseFrag;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 7
    .line 8
    iput-object v0, p0, Ll/ojp0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 9
    .line 10
    iput-object p2, p0, Ll/ojp0;->k:Ll/ogd0;

    .line 11
    .line 12
    invoke-virtual {p0, p3}, Ll/l6t;->C(Ll/iam;)V

    .line 13
    .line 14
    .line 15
    iget-object p2, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 16
    .line 17
    check-cast p2, Landroid/view/ViewGroup;

    .line 18
    .line 19
    invoke-virtual {p1, p0, p2}, Ll/dum;->a(Ll/njt;Landroid/view/ViewGroup;)V

    .line 20
    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object p1

    .line 26
    check-cast p1, Ll/jqm0;

    .line 27
    .line 28
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 29
    .line 30
    .line 31
    move-result-object p2

    .line 32
    check-cast p2, Ll/jqm0;

    .line 33
    .line 34
    invoke-virtual {p2}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 35
    .line 36
    .line 37
    move-result-object p2

    .line 38
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->template:Ljava/lang/String;

    .line 39
    .line 40
    invoke-virtual {p1, p2}, Ll/rwn0;->N3(Ljava/lang/String;)V

    .line 41
    .line 42
    .line 43
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Ll/jqm0;

    .line 48
    .line 49
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 50
    .line 51
    .line 52
    move-result-object p2

    .line 53
    check-cast p2, Ll/jqm0;

    .line 54
    .line 55
    invoke-virtual {p2}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 56
    .line 57
    .line 58
    move-result-object p2

    .line 59
    iget-object p2, p2, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->gameType:Ljava/lang/String;

    .line 60
    .line 61
    invoke-virtual {p1, p2}, Ll/rwn0;->M3(Ljava/lang/String;)V

    .line 62
    .line 63
    .line 64
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Ll/jqm0;

    .line 69
    .line 70
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    check-cast p0, Ll/jqm0;

    .line 75
    .line 76
    invoke-virtual {p0}, Ll/jqm0;->b4()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 77
    .line 78
    .line 79
    move-result-object p0

    .line 80
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->voiceEnterType:Ljava/lang/String;

    .line 81
    .line 82
    iput-object p0, p1, Ll/rwn0;->a0:Ljava/lang/String;

    .line 83
    .line 84
    return-void
.end method

.method private D4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V
    .locals 1

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
    return-void

    .line 8
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->dialog()Lcom/p1/mobile/android/app/Dialog$e;

    .line 13
    .line 14
    .line 15
    move-result-object p0

    .line 16
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->F(Ljava/lang/CharSequence;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    const/4 p1, 0x0

    .line 21
    invoke-virtual {p0, p1}, Lcom/p1/mobile/android/app/Dialog$e;->B(Z)Lcom/p1/mobile/android/app/Dialog$e;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p3}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 26
    .line 27
    .line 28
    new-instance p1, Ll/bri0;

    .line 29
    .line 30
    invoke-direct {p1, p3}, Ll/bri0;-><init>(Ll/x20;)V

    .line 31
    .line 32
    .line 33
    invoke-virtual {p0, p2, p1}, Lcom/p1/mobile/android/app/Dialog$e;->n0(Ljava/lang/CharSequence;Ljava/lang/Runnable;)Lcom/p1/mobile/android/app/Dialog$e;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Dialog$e;->z0()Lcom/p1/mobile/android/app/Dialog;

    .line 38
    .line 39
    .line 40
    return-void
.end method

.method public static synthetic j4(Ll/ojp0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojp0;->A4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V

    return-void
.end method

.method public static synthetic k4(Ll/ojp0;Ljava/lang/Integer;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojp0;->v4(Ljava/lang/Integer;)V

    return-void
.end method

.method public static synthetic l4(Ll/ojp0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ll/ojp0;->y4()V

    return-void
.end method

.method public static synthetic m4()V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic n4(Ll/ojp0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojp0;->z4(Ll/jsv;)V

    return-void
.end method

.method public static synthetic o4(Ll/ojp0;Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojp0;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V

    return-void
.end method

.method public static synthetic p4(Ljava/lang/Integer;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    if-lez p0, :cond_0

    .line 6
    .line 7
    const/4 p0, 0x1

    .line 8
    goto :goto_0

    .line 9
    :cond_0
    const/4 p0, 0x0

    .line 10
    :goto_0
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    return-object p0
.end method

.method public static synthetic q4(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$JailInRoom;)V
    .locals 1

    .line 1
    sget-object v0, Ll/zrv;->a:Ll/wrv;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/wrv;->D0()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$JailInRoom;->getUser()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkLiveMessage$UserInfo;->getId()Ljava/lang/String;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    invoke-static {v0, p0}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 16
    .line 17
    .line 18
    move-result p0

    .line 19
    if-eqz p0, :cond_0

    .line 20
    .line 21
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->pf:I

    .line 22
    .line 23
    invoke-static {p0}, Ll/xau;->t(I)Ljava/lang/String;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 28
    .line 29
    .line 30
    :cond_0
    return-void
.end method

.method public static synthetic r4(Ll/ojp0;Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ojp0;->w4(Ll/jsv;)V

    return-void
.end method

.method private s4()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/ojp0;->m:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 7
    .line 8
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 9
    .line 10
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->getGiftWidthObs()Lrx/c;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {v0}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/ljp0;

    .line 23
    .line 24
    invoke-direct {v1}, Ll/ljp0;-><init>()V

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    new-instance v1, Ll/mjp0;

    .line 36
    .line 37
    invoke-direct {v1, p0}, Ll/mjp0;-><init>(Ll/ojp0;)V

    .line 38
    .line 39
    .line 40
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 45
    .line 46
    .line 47
    move-result-object v0

    .line 48
    iput-object v0, p0, Ll/ojp0;->m:Ll/kcg0;

    .line 49
    .line 50
    return-void
.end method

.method private synthetic y4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 6
    .line 7
    .line 8
    return-void
.end method


# virtual methods
.method public final synthetic A4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;)V
    .locals 4

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "controlMsgType="

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    iget-object v1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 9
    .line 10
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 11
    .line 12
    .line 13
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    const-string v1, "[live][virtual_voice]"

    .line 18
    .line 19
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->type:Ljava/lang/String;

    .line 23
    .line 24
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 25
    .line 26
    .line 27
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    const/4 v2, 0x1

    .line 32
    const/4 v3, -0x1

    .line 33
    sparse-switch v1, :sswitch_data_0

    .line 34
    .line 35
    .line 36
    goto/16 :goto_0

    .line 37
    .line 38
    :sswitch_0
    const-string v1, "delete_manager"

    .line 39
    .line 40
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-nez v0, :cond_0

    .line 45
    .line 46
    goto/16 :goto_0

    .line 47
    .line 48
    :cond_0
    const/16 v3, 0xa

    .line 49
    .line 50
    goto/16 :goto_0

    .line 51
    .line 52
    :sswitch_1
    const-string v1, "forbidden_multidevice"

    .line 53
    .line 54
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 55
    .line 56
    .line 57
    move-result v0

    .line 58
    if-nez v0, :cond_1

    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_1
    const/16 v3, 0x9

    .line 63
    .line 64
    goto/16 :goto_0

    .line 65
    .line 66
    :sswitch_2
    const-string v1, "force_stop"

    .line 67
    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-nez v0, :cond_2

    .line 73
    .line 74
    goto/16 :goto_0

    .line 75
    .line 76
    :cond_2
    const/16 v3, 0x8

    .line 77
    .line 78
    goto/16 :goto_0

    .line 79
    .line 80
    :sswitch_3
    const-string v1, "pause"

    .line 81
    .line 82
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    if-nez v0, :cond_3

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :cond_3
    const/4 v3, 0x7

    .line 90
    goto :goto_0

    .line 91
    :sswitch_4
    const-string v1, "stop"

    .line 92
    .line 93
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    if-nez v0, :cond_4

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :cond_4
    const/4 v3, 0x6

    .line 101
    goto :goto_0

    .line 102
    :sswitch_5
    const-string v1, "boot"

    .line 103
    .line 104
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    if-nez v0, :cond_5

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :cond_5
    const/4 v3, 0x5

    .line 112
    goto :goto_0

    .line 113
    :sswitch_6
    const-string v1, "chat_tip_change"

    .line 114
    .line 115
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    if-nez v0, :cond_6

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_6
    const/4 v3, 0x4

    .line 123
    goto :goto_0

    .line 124
    :sswitch_7
    const-string v1, "re_request_room_gift_list"

    .line 125
    .line 126
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    if-nez v0, :cond_7

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_7
    const/4 v3, 0x3

    .line 134
    goto :goto_0

    .line 135
    :sswitch_8
    const-string v1, "system"

    .line 136
    .line 137
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    if-nez v0, :cond_8

    .line 142
    .line 143
    goto :goto_0

    .line 144
    :cond_8
    const/4 v3, 0x2

    .line 145
    goto :goto_0

    .line 146
    :sswitch_9
    const-string v1, "delete_room"

    .line 147
    .line 148
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    if-nez v0, :cond_9

    .line 153
    .line 154
    goto :goto_0

    .line 155
    :cond_9
    move v3, v2

    .line 156
    goto :goto_0

    .line 157
    :sswitch_a
    const-string v1, "add_manager"

    .line 158
    .line 159
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    if-nez v0, :cond_a

    .line 164
    .line 165
    goto :goto_0

    .line 166
    :cond_a
    const/4 v3, 0x0

    .line 167
    :goto_0
    const-string v0, ""

    .line 168
    .line 169
    packed-switch v3, :pswitch_data_0

    .line 170
    .line 171
    .line 172
    return-void

    .line 173
    :pswitch_0
    iget-boolean p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->isAnchor:Z

    .line 174
    .line 175
    if-eqz p1, :cond_b

    .line 176
    .line 177
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->T5:I

    .line 178
    .line 179
    goto :goto_1

    .line 180
    :cond_b
    sget p1, Lcom/p1/mobile/putong/live/livingroom/R$string;->R5:I

    .line 181
    .line 182
    :goto_1
    invoke-static {p1}, Ll/xau;->t(I)Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object p1

    .line 186
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 187
    .line 188
    .line 189
    move-result-object v1

    .line 190
    check-cast v1, Ll/jqm0;

    .line 191
    .line 192
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    check-cast v2, Ll/jqm0;

    .line 197
    .line 198
    invoke-virtual {v2}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    invoke-virtual {v1, v2}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 203
    .line 204
    .line 205
    invoke-virtual {p0}, Ll/ojp0;->t4()V

    .line 206
    .line 207
    .line 208
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 209
    .line 210
    .line 211
    move-result-object v1

    .line 212
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 213
    .line 214
    .line 215
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 216
    .line 217
    .line 218
    move-result-object p0

    .line 219
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :pswitch_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 224
    .line 225
    .line 226
    move-result-object p0

    .line 227
    check-cast p0, Ll/jqm0;

    .line 228
    .line 229
    sget-object p1, Ll/qcu;->b:Ll/qcu;

    .line 230
    .line 231
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 232
    .line 233
    .line 234
    return-void

    .line 235
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 236
    .line 237
    .line 238
    move-result-object p0

    .line 239
    check-cast p0, Ll/jqm0;

    .line 240
    .line 241
    sget-object p1, Ll/v9s;->e:Ll/v9s;

    .line 242
    .line 243
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 244
    .line 245
    .line 246
    return-void

    .line 247
    :pswitch_3
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 248
    .line 249
    .line 250
    move-result-object v1

    .line 251
    check-cast v1, Ll/jqm0;

    .line 252
    .line 253
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    check-cast v2, Ll/jqm0;

    .line 258
    .line 259
    invoke-virtual {v2}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    invoke-virtual {v1, v2}, Ll/oo2;->g2(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 264
    .line 265
    .line 266
    invoke-virtual {p0}, Ll/ojp0;->t4()V

    .line 267
    .line 268
    .line 269
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    invoke-virtual {v1}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 274
    .line 275
    .line 276
    invoke-virtual {p0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 277
    .line 278
    .line 279
    move-result-object p0

    .line 280
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 281
    .line 282
    invoke-static {p0, v0, p1}, Lcom/p1/mobile/putong/live/LiveDialogAct;->h2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 283
    .line 284
    .line 285
    return-void

    .line 286
    :pswitch_4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 287
    .line 288
    .line 289
    move-result-object p0

    .line 290
    check-cast p0, Ll/jqm0;

    .line 291
    .line 292
    invoke-virtual {p0}, Ll/oo2;->L1()V

    .line 293
    .line 294
    .line 295
    return-void

    .line 296
    :pswitch_5
    invoke-static {v2}, Ll/muj;->w(Z)V

    .line 297
    .line 298
    .line 299
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 300
    .line 301
    .line 302
    move-result-object p1

    .line 303
    check-cast p1, Ll/jqm0;

    .line 304
    .line 305
    new-instance v0, Ll/uxj$a;

    .line 306
    .line 307
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 308
    .line 309
    .line 310
    move-result-object v1

    .line 311
    check-cast v1, Ll/jqm0;

    .line 312
    .line 313
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 314
    .line 315
    .line 316
    move-result-object v1

    .line 317
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 318
    .line 319
    .line 320
    move-result-object p0

    .line 321
    check-cast p0, Ll/jqm0;

    .line 322
    .line 323
    invoke-virtual {p0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 324
    .line 325
    .line 326
    move-result-object p0

    .line 327
    iget-object p0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 328
    .line 329
    const-string v2, "live"

    .line 330
    .line 331
    invoke-direct {v0, v1, p0, v2}, Ll/uxj$a;-><init>(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 332
    .line 333
    .line 334
    invoke-virtual {v0}, Ll/uxj$a;->f()Ll/uxj;

    .line 335
    .line 336
    .line 337
    move-result-object p0

    .line 338
    const/4 v0, 0x0

    .line 339
    invoke-virtual {p1, p0, v0}, Ll/oo2;->A1(Ll/uxj;Ll/y20;)V

    .line 340
    .line 341
    .line 342
    return-void

    .line 343
    :pswitch_6
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveControlMessage;->content:Ljava/lang/String;

    .line 344
    .line 345
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 346
    .line 347
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->y5:I

    .line 348
    .line 349
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 350
    .line 351
    .line 352
    move-result-object v0

    .line 353
    new-instance v1, Ll/kjp0;

    .line 354
    .line 355
    invoke-direct {v1}, Ll/kjp0;-><init>()V

    .line 356
    .line 357
    .line 358
    invoke-direct {p0, p1, v0, v1}, Ll/ojp0;->D4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 359
    .line 360
    .line 361
    return-void

    .line 362
    :pswitch_7
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 363
    .line 364
    .line 365
    move-result-object p0

    .line 366
    check-cast p0, Ll/jqm0;

    .line 367
    .line 368
    new-instance p1, Ll/z8s;

    .line 369
    .line 370
    invoke-direct {p1}, Ll/z8s;-><init>()V

    .line 371
    .line 372
    .line 373
    invoke-virtual {p0, p1}, Ll/vp20;->h(Ll/jsv;)V

    .line 374
    .line 375
    .line 376
    return-void

    .line 377
    :pswitch_8
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    check-cast p1, Ll/jqm0;

    .line 382
    .line 383
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 384
    .line 385
    .line 386
    move-result-object p0

    .line 387
    check-cast p0, Ll/jqm0;

    .line 388
    .line 389
    invoke-virtual {p0}, Ll/vp20;->k()Ljava/lang/String;

    .line 390
    .line 391
    .line 392
    move-result-object p0

    .line 393
    invoke-virtual {p1, p0}, Ll/rwn0;->K1(Ljava/lang/String;)V

    .line 394
    .line 395
    .line 396
    return-void

    .line 397
    :sswitch_data_0
    .sparse-switch
        -0x7f9401f1 -> :sswitch_a
        -0x42de7911 -> :sswitch_9
        -0x34e38dd1 -> :sswitch_8
        -0x33a7a8db -> :sswitch_7
        -0x1ce5c8e5 -> :sswitch_6
        0x2e3af2 -> :sswitch_5
        0x360802 -> :sswitch_4
        0x65825f6 -> :sswitch_3
        0x80850d6 -> :sswitch_2
        0x169d3189 -> :sswitch_1
        0x40206119 -> :sswitch_0
    .end sparse-switch

    .line 398
    .line 399
    .line 400
    .line 401
    .line 402
    .line 403
    .line 404
    .line 405
    .line 406
    .line 407
    .line 408
    .line 409
    .line 410
    .line 411
    .line 412
    .line 413
    .line 414
    .line 415
    .line 416
    .line 417
    .line 418
    .line 419
    .line 420
    .line 421
    .line 422
    .line 423
    .line 424
    .line 425
    .line 426
    .line 427
    .line 428
    .line 429
    .line 430
    .line 431
    .line 432
    .line 433
    .line 434
    .line 435
    .line 436
    .line 437
    .line 438
    .line 439
    .line 440
    .line 441
    .line 442
    .line 443
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_2
        :pswitch_0
        :pswitch_8
    .end packed-switch
.end method

.method public B4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    return-void
.end method

.method public C4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V
    .locals 0

    .line 1
    return-void
.end method

.method public E4(ZLjava/lang/String;)V
    .locals 1

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCloseEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCloseEvent;->showFloatWindow()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/dan0;

    .line 12
    .line 13
    invoke-direct {v0, p1, p2}, Ll/dan0;-><init>(ZLjava/lang/String;)V

    .line 14
    .line 15
    .line 16
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 17
    .line 18
    .line 19
    return-void
.end method

.method public N3()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PreLoadEvent:Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PreLoadEvent;->cleanPreLoad()Ll/v3f$c;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public O3()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public P3()V
    .locals 0

    .line 1
    return-void
.end method

.method public R3()Landroid/view/View;
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

.method public bridge synthetic S3(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Ll/y20;Z)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-virtual/range {p0 .. p5}, Ll/ojp0;->u4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;ZLl/y20;Ll/y20;Z)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public T3(Ll/y20;)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;)V"
        }
    .end annotation

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initSmallWindowRoomInfo()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Ll/vgd0;

    .line 12
    .line 13
    const/4 v4, 0x0

    .line 14
    const/4 v5, 0x0

    .line 15
    const/4 v2, 0x0

    .line 16
    const/4 v3, 0x0

    .line 17
    move-object v1, p1

    .line 18
    invoke-direct/range {v0 .. v5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    return-void
.end method

.method public U3(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public V3()Z
    .locals 2

    .line 1
    new-instance v0, Ll/u7f;

    .line 2
    .line 3
    const/16 v1, 0xd48

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ll/u7f;-><init>(I)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p0, v0}, Ll/i6t;->F3(Ll/hk2;)Ljava/lang/Object;

    .line 9
    .line 10
    .line 11
    move-result-object p0

    .line 12
    check-cast p0, Ljava/lang/Boolean;

    .line 13
    .line 14
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    return p0
.end method

.method public W3()Z
    .locals 0

    .line 1
    const/4 p0, 0x1

    .line 2
    return p0
.end method

.method public X3(I)Z
    .locals 0

    .line 1
    const/4 p0, 0x0

    .line 2
    return p0
.end method

.method public Y3(ZZ)Z
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    if-nez p2, :cond_0

    .line 3
    .line 4
    const-string p2, "click_back_button"

    .line 5
    .line 6
    invoke-virtual {p0, p1, p2}, Ll/ojp0;->E4(ZLjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    const/4 p0, 0x1

    .line 10
    return p0

    .line 11
    :cond_0
    return p1
.end method

.method public Z3()V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ojp0;->k:Ll/ogd0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/ogd0;->h1()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public a4()V
    .locals 2

    .line 1
    const/4 v0, 0x0

    .line 2
    const-string v1, "slide"

    .line 3
    .line 4
    invoke-virtual {p0, v0, v1}, Ll/ojp0;->E4(ZLjava/lang/String;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public bridge synthetic b4(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p2, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-virtual {p0, p1, p2}, Ll/ojp0;->B4(ZLcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public bridge synthetic c4(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V
    .locals 0

    .line 1
    check-cast p1, Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ll/ojp0;->C4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;)V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public e4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0, p1}, Ll/jqm0;->f4(Lcom/p1/mobile/putong/live/livingroom/common/jumproom/JumpRoomData;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public f4(Ll/qwl;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->PlayerEvent:Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$PlayerEvent;->updatePlayer()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public g4(Z)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-nez p0, :cond_0

    .line 4
    .line 5
    return-void

    .line 6
    :cond_0
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 7
    .line 8
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->setSwallowAllTouchEvent(Z)V

    .line 9
    .line 10
    .line 11
    return-void
.end method

.method public i4()V
    .locals 2

    .line 1
    invoke-static {}, Ll/zrv;->r()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ojp0;->k:Ll/ogd0;

    .line 5
    .line 6
    invoke-virtual {v0}, Ll/ogd0;->x0()Ll/u4j;

    .line 7
    .line 8
    .line 9
    move-result-object v0

    .line 10
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 11
    .line 12
    .line 13
    move-result-object v1

    .line 14
    invoke-virtual {v0, v1}, Ll/mer;->I2(Ll/dum;)Ll/l6t;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 19
    .line 20
    .line 21
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    check-cast v0, Ll/noo0;

    .line 26
    .line 27
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 28
    .line 29
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 30
    .line 31
    invoke-static {p0, v0, v1}, Ll/djp0;->b(Ll/ojp0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;)V

    .line 32
    .line 33
    .line 34
    invoke-super {p0}, Ll/l6t;->T()V

    .line 35
    .line 36
    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    check-cast v0, Ll/jqm0;

    .line 42
    .line 43
    iget-object v1, p0, Ll/x5;->i:Ljava/lang/String;

    .line 44
    .line 45
    invoke-virtual {v0, v1}, Ll/vp20;->w(Ljava/lang/String;)V

    .line 46
    .line 47
    .line 48
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/jqm0;

    .line 53
    .line 54
    invoke-virtual {v0}, Ll/rwn0;->c2()V

    .line 55
    .line 56
    .line 57
    iget-object v0, p0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 58
    .line 59
    const/4 v1, 0x0

    .line 60
    invoke-virtual {v0, v1}, Lcom/p1/mobile/android/app/Act;->setSwipeBackEnable(Z)V

    .line 61
    .line 62
    .line 63
    invoke-direct {p0}, Ll/ojp0;->s4()V

    .line 64
    .line 65
    .line 66
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    check-cast v0, Ll/jqm0;

    .line 71
    .line 72
    invoke-virtual {v0}, Ll/rwn0;->y()Lrx/c;

    .line 73
    .line 74
    .line 75
    move-result-object v0

    .line 76
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    new-instance v1, Ll/ejp0;

    .line 81
    .line 82
    invoke-direct {v1, p0}, Ll/ejp0;-><init>(Ll/ojp0;)V

    .line 83
    .line 84
    .line 85
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 86
    .line 87
    .line 88
    move-result-object v1

    .line 89
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 90
    .line 91
    .line 92
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    invoke-virtual {v0}, Ll/mof0;->k()Lrx/c;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    new-instance v1, Ll/fjp0;

    .line 105
    .line 106
    invoke-direct {v1, p0}, Ll/fjp0;-><init>(Ll/ojp0;)V

    .line 107
    .line 108
    .line 109
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 114
    .line 115
    .line 116
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Ll/jqm0;

    .line 121
    .line 122
    invoke-virtual {v0}, Ll/vp20;->l()Lrx/c;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    new-instance v1, Ll/gjp0;

    .line 131
    .line 132
    invoke-direct {v1, p0}, Ll/gjp0;-><init>(Ll/ojp0;)V

    .line 133
    .line 134
    .line 135
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 140
    .line 141
    .line 142
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Ll/jqm0;

    .line 147
    .line 148
    invoke-virtual {v0}, Ll/oo2;->n1()Lrx/c;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    new-instance v1, Ll/hjp0;

    .line 153
    .line 154
    invoke-direct {v1, p0}, Ll/hjp0;-><init>(Ll/ojp0;)V

    .line 155
    .line 156
    .line 157
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 158
    .line 159
    .line 160
    move-result-object v1

    .line 161
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Ll/ojp0;->l:Ll/kcg0;

    .line 166
    .line 167
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    check-cast p0, Ll/jqm0;

    .line 172
    .line 173
    invoke-virtual {p0}, Ll/oo2;->P1()V

    .line 174
    .line 175
    .line 176
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 177
    .line 178
    .line 179
    move-result-object p0

    .line 180
    const/4 v0, 0x1

    .line 181
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->f(I)V

    .line 182
    .line 183
    .line 184
    return-void
.end method

.method public init()V
    .locals 3

    .line 1
    new-instance v0, Ll/i5j;

    .line 2
    .line 3
    iget-object v1, p0, Ll/xzs;->e:Ll/dum;

    .line 4
    .line 5
    iget-object v2, p0, Ll/ojp0;->k:Ll/ogd0;

    .line 6
    .line 7
    invoke-direct {v0, v1, v2}, Ll/i5j;-><init>(Ll/dum;Ll/ogd0;)V

    .line 8
    .line 9
    .line 10
    invoke-virtual {p0, v0}, Ll/l6t;->z2(Ll/l6t;)Ll/l6t;

    .line 11
    .line 12
    .line 13
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 14
    .line 15
    .line 16
    move-result-object v0

    .line 17
    check-cast v0, Ll/noo0;

    .line 18
    .line 19
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 20
    .line 21
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 22
    .line 23
    invoke-static {p0, v0, v1}, Ll/djp0;->c(Ll/ojp0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;)V

    .line 24
    .line 25
    .line 26
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 27
    .line 28
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 29
    .line 30
    iget-object p0, p0, Ll/ojp0;->j:Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;

    .line 31
    .line 32
    iget-object p0, p0, Lcom/p1/mobile/putong/live/livingroom/archi/frag/RoomFrag;->A:Ll/rgd0;

    .line 33
    .line 34
    invoke-virtual {v0, p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->j0(Ll/rgd0;)V

    .line 35
    .line 36
    .line 37
    invoke-static {}, Ll/ere;->i()Ll/ere;

    .line 38
    .line 39
    .line 40
    move-result-object p0

    .line 41
    const/4 v0, 0x0

    .line 42
    invoke-virtual {p0, v0}, Ll/ere;->t(Z)V

    .line 43
    .line 44
    .line 45
    return-void
.end method

.method public m(Z)V
    .locals 0

    .line 1
    return-void
.end method

.method public n()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/xzs;->e:Ll/dum;

    .line 2
    .line 3
    iget-object v0, v0, Ll/dum;->m:Ll/w3o0;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/l6t;->destroy()V

    .line 6
    .line 7
    .line 8
    const-string v0, "context_single_room"

    .line 9
    .line 10
    invoke-static {v0}, Ll/r230;->p(Ljava/lang/String;)V

    .line 11
    .line 12
    .line 13
    iget-object v0, p0, Ll/ojp0;->l:Ll/kcg0;

    .line 14
    .line 15
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 16
    .line 17
    .line 18
    invoke-virtual {p0}, Ll/ojp0;->V3()Z

    .line 19
    .line 20
    .line 21
    move-result v0

    .line 22
    invoke-super {p0}, Ll/i6t;->n()V

    .line 23
    .line 24
    .line 25
    if-eqz v0, :cond_0

    .line 26
    .line 27
    iget-object p0, p0, Ll/xzs;->e:Ll/dum;

    .line 28
    .line 29
    iget-object p0, p0, Ll/dum;->h:Ll/oo2;

    .line 30
    .line 31
    check-cast p0, Ll/jqm0;

    .line 32
    .line 33
    const/4 v0, 0x1

    .line 34
    invoke-virtual {p0, v0}, Ll/jqm0;->c0(Z)V

    .line 35
    .line 36
    .line 37
    return-void

    .line 38
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    check-cast p0, Ll/jqm0;

    .line 43
    .line 44
    invoke-virtual {p0}, Ll/jqm0;->exit()V

    .line 45
    .line 46
    .line 47
    const/4 p0, 0x0

    .line 48
    invoke-static {p0}, Lcom/p1/mobile/putong/live/livingroom/view/SayHiBubbleView;->setGreetedToUserId(Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void
.end method

.method public s2()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/l6t;->s2()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/ojp0;->m:Ll/kcg0;

    .line 5
    .line 6
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 7
    .line 8
    .line 9
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 10
    .line 11
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 12
    .line 13
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->destroy()V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public t()V
    .locals 3

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 5
    .line 6
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 7
    .line 8
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;->k0()V

    .line 9
    .line 10
    .line 11
    invoke-virtual {p0}, Ll/njt;->K3()Ll/dum;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    check-cast v0, Ll/noo0;

    .line 16
    .line 17
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 18
    .line 19
    check-cast v1, Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;

    .line 20
    .line 21
    invoke-static {p0, v0, v1}, Ll/djp0;->a(Ll/ojp0;Ll/noo0;Lcom/p1/mobile/putong/live/livingroom/virtual/VoiceVirtualRoomView;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 25
    .line 26
    .line 27
    move-result-object v0

    .line 28
    check-cast v0, Ll/jqm0;

    .line 29
    .line 30
    iget-boolean v0, v0, Ll/rwn0;->Q:Z

    .line 31
    .line 32
    if-nez v0, :cond_0

    .line 33
    .line 34
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 35
    .line 36
    .line 37
    move-result-object v0

    .line 38
    check-cast v0, Ll/jqm0;

    .line 39
    .line 40
    invoke-static {}, Ll/pzi0;->o()J

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    iput-wide v1, v0, Ll/jqm0;->g0:J

    .line 45
    .line 46
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    check-cast v0, Ll/jqm0;

    .line 51
    .line 52
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {v0}, Ll/aj1;->t()Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 61
    .line 62
    .line 63
    move-result-object p0

    .line 64
    new-instance v0, Ll/ijp0;

    .line 65
    .line 66
    invoke-direct {v0}, Ll/ijp0;-><init>()V

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0, v0}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 70
    .line 71
    .line 72
    move-result-object p0

    .line 73
    new-instance v0, Ll/jjp0;

    .line 74
    .line 75
    invoke-direct {v0}, Ll/jjp0;-><init>()V

    .line 76
    .line 77
    .line 78
    invoke-static {v0}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    invoke-virtual {p0, v0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 83
    .line 84
    .line 85
    return-void
.end method

.method public t4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njt;->J3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public u4(Lcom/p1/mobile/putong/live/base/data/BLiveVoice;ZLl/y20;Ll/y20;Z)V
    .locals 6
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/live/base/data/BLiveVoice;",
            "Z",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;",
            "Ll/y20<",
            "Ll/ugd0;",
            ">;Z)V"
        }
    .end annotation

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    return-void

    .line 10
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->RoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;

    .line 15
    .line 16
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$RoomInfoEvent;->initRoomInfo()Ll/v3f$d;

    .line 17
    .line 18
    .line 19
    move-result-object p0

    .line 20
    new-instance v0, Ll/vgd0;

    .line 21
    .line 22
    move-object v2, p1

    .line 23
    move v3, p2

    .line 24
    move-object v4, p3

    .line 25
    move-object v1, p4

    .line 26
    move v5, p5

    .line 27
    invoke-direct/range {v0 .. v5}, Ll/vgd0;-><init>(Ll/y20;Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;ZLl/y20;Z)V

    .line 28
    .line 29
    .line 30
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 31
    .line 32
    .line 33
    return-void
.end method

.method public final synthetic v4(Ljava/lang/Integer;)V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->changeInputSize()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    new-instance v0, Landroid/util/Size;

    .line 12
    .line 13
    invoke-static {}, Ll/bnl0;->y0()I

    .line 14
    .line 15
    .line 16
    move-result v1

    .line 17
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    sub-int/2addr v1, p1

    .line 22
    const/4 p1, 0x0

    .line 23
    invoke-direct {v0, v1, p1}, Landroid/util/Size;-><init>(II)V

    .line 24
    .line 25
    .line 26
    invoke-virtual {p0, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 27
    .line 28
    .line 29
    return-void
.end method

.method public final synthetic w4(Ll/jsv;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/njt;->M3()V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public final synthetic x4(Lcom/p1/mobile/putong/live/base/data/BLiveSettings;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/jqm0;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/oo2;->U0()V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic z4(Ll/jsv;)V
    .locals 2

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    const-string v1, "cur living state : "

    .line 4
    .line 5
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 6
    .line 7
    .line 8
    invoke-virtual {p1}, Ljava/lang/Object;->toString()Ljava/lang/String;

    .line 9
    .line 10
    .line 11
    move-result-object v1

    .line 12
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 13
    .line 14
    .line 15
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    const-string v1, "[live][virtual_voice]"

    .line 20
    .line 21
    invoke-static {v1, v0}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 22
    .line 23
    .line 24
    invoke-virtual {p1}, Ll/jsv;->k()Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_0

    .line 29
    .line 30
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Ll/jqm0;

    .line 35
    .line 36
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    check-cast v0, Ll/jqm0;

    .line 41
    .line 42
    invoke-virtual {v0}, Ll/rwn0;->p()Z

    .line 43
    .line 44
    .line 45
    move-result v0

    .line 46
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    check-cast p0, Ll/jqm0;

    .line 51
    .line 52
    invoke-virtual {p0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 53
    .line 54
    .line 55
    move-result-object p0

    .line 56
    invoke-virtual {p1, v0, p0}, Ll/jqm0;->e2(ZLcom/p1/mobile/putong/live/base/data/BLiveAbsData;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :cond_0
    invoke-virtual {p1}, Ll/jsv;->b()Z

    .line 61
    .line 62
    .line 63
    move-result p1

    .line 64
    if-eqz p1, :cond_1

    .line 65
    .line 66
    sget-object p1, Ll/zrv;->e:Landroid/app/Application;

    .line 67
    .line 68
    sget v0, Lcom/p1/mobile/putong/live/livingroom/R$string;->Gj:I

    .line 69
    .line 70
    invoke-virtual {p1, v0}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    sget-object v0, Ll/zrv;->e:Landroid/app/Application;

    .line 75
    .line 76
    sget v1, Lcom/p1/mobile/putong/live/livingroom/R$string;->o2:I

    .line 77
    .line 78
    invoke-virtual {v0, v1}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 79
    .line 80
    .line 81
    move-result-object v0

    .line 82
    new-instance v1, Ll/njp0;

    .line 83
    .line 84
    invoke-direct {v1, p0}, Ll/njp0;-><init>(Ll/ojp0;)V

    .line 85
    .line 86
    .line 87
    invoke-direct {p0, p1, v0, v1}, Ll/ojp0;->D4(Ljava/lang/String;Ljava/lang/String;Ll/x20;)V

    .line 88
    .line 89
    .line 90
    :cond_1
    return-void
.end method
