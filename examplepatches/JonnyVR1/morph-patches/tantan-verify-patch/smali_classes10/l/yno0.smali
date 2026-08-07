.class public Ll/yno0;
.super Ll/csm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/csm0<",
        "Ll/rwn0;",
        ">;"
    }
.end annotation


# instance fields
.field public final q:Ljava/util/HashSet;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ljava/util/HashSet<",
            "Ljava/lang/String;",
            ">;"
        }
    .end annotation
.end field

.field public r:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

.field public s:Z


# direct methods
.method public constructor <init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1, p2}, Ll/csm0;-><init>(Ll/dum;Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ljava/util/HashSet;

    .line 5
    .line 6
    invoke-direct {p1}, Ljava/util/HashSet;-><init>()V

    .line 7
    .line 8
    .line 9
    iput-object p1, p0, Ll/yno0;->q:Ljava/util/HashSet;

    .line 10
    .line 11
    return-void
.end method

.method public static synthetic A5(Ll/yno0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->T5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic B5(Ll/yno0;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/yno0;->X5(Ljava/lang/String;)V

    return-void
.end method

.method public static synthetic C5(Ll/yno0;Ll/b9m0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->Y5(Ll/b9m0;)V

    return-void
.end method

.method public static synthetic D5(Ll/yno0;Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->S5(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V

    return-void
.end method

.method public static synthetic E5(Ll/yno0;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->U5(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic F5(Landroid/net/NetworkInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->g()Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    return-object p0
.end method

.method public static synthetic G5(Ll/yno0;Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->R5(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    return-void
.end method

.method public static synthetic H5(Ll/yno0;Landroid/net/NetworkInfo;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->Z5(Landroid/net/NetworkInfo;)V

    return-void
.end method

.method public static synthetic I5(Ll/yno0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->V5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic J5(Ll/yno0;Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->P5(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    move-result-object p0

    return-object p0
.end method

.method private synthetic X5(Ljava/lang/String;)V
    .locals 1

    .line 1
    const-string p1, "voiceCallApply"

    .line 2
    .line 3
    const/4 v0, 0x0

    .line 4
    invoke-virtual {p0, p1, v0}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public static synthetic t5(Ll/yno0;Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->Q5(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)V

    return-void
.end method

.method public static synthetic u5(Ll/yno0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->O5(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic v5(Ll/yno0;Ljava/util/List;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->L5(Ljava/util/List;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic w5(Ll/yno0;Ll/gvn0;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yh2;->h4(Ll/gvn0;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic x5(Ll/yno0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->W5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic y5(Ll/yno0;Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/yno0;->N5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V

    return-void
.end method

.method public static synthetic z5(Ljava/lang/String;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 2
    .line 3
    .line 4
    move-result p0

    .line 5
    xor-int/lit8 p0, p0, 0x1

    .line 6
    .line 7
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    return-object p0
.end method


# virtual methods
.method public J4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 1

    .line 1
    invoke-super {p0, p1}, Ll/csm0;->J4(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-static {v0, p1, p0}, Ll/i35;->k(Ll/rwn0;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;Ll/yno0;)V

    .line 11
    .line 12
    .line 13
    return-void
.end method

.method public K4(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 3

    .line 1
    invoke-super {p0, p1, p2, p3, p4}, Ll/csm0;->K4(Ll/a5s;Landroid/view/View;Ljava/lang/String;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p3}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 5
    .line 6
    .line 7
    invoke-virtual {p3}, Ljava/lang/String;->hashCode()I

    .line 8
    .line 9
    .line 10
    move-result p2

    .line 11
    const-string v0, "ktvKingCongratulate"

    .line 12
    .line 13
    const-string v1, "voiceRoomApplaud"

    .line 14
    .line 15
    const/4 v2, -0x1

    .line 16
    sparse-switch p2, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    goto/16 :goto_0

    .line 20
    .line 21
    :sswitch_0
    invoke-virtual {p3, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 22
    .line 23
    .line 24
    move-result p2

    .line 25
    if-nez p2, :cond_0

    .line 26
    .line 27
    goto/16 :goto_0

    .line 28
    .line 29
    :cond_0
    const/16 v2, 0x8

    .line 30
    .line 31
    goto :goto_0

    .line 32
    :sswitch_1
    const-string p2, "openAnchorGradeWeb"

    .line 33
    .line 34
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 35
    .line 36
    .line 37
    move-result p2

    .line 38
    if-nez p2, :cond_1

    .line 39
    .line 40
    goto :goto_0

    .line 41
    :cond_1
    const/4 v2, 0x7

    .line 42
    goto :goto_0

    .line 43
    :sswitch_2
    const-string p2, "roomLevelDetail"

    .line 44
    .line 45
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 46
    .line 47
    .line 48
    move-result p2

    .line 49
    if-nez p2, :cond_2

    .line 50
    .line 51
    goto :goto_0

    .line 52
    :cond_2
    const/4 v2, 0x6

    .line 53
    goto :goto_0

    .line 54
    :sswitch_3
    const-string p2, "returnGift"

    .line 55
    .line 56
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 57
    .line 58
    .line 59
    move-result p2

    .line 60
    if-nez p2, :cond_3

    .line 61
    .line 62
    goto :goto_0

    .line 63
    :cond_3
    const/4 v2, 0x5

    .line 64
    goto :goto_0

    .line 65
    :sswitch_4
    invoke-virtual {p3, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 66
    .line 67
    .line 68
    move-result p2

    .line 69
    if-nez p2, :cond_4

    .line 70
    .line 71
    goto :goto_0

    .line 72
    :cond_4
    const/4 v2, 0x4

    .line 73
    goto :goto_0

    .line 74
    :sswitch_5
    const-string p2, "grabStarRedPacket"

    .line 75
    .line 76
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 77
    .line 78
    .line 79
    move-result p2

    .line 80
    if-nez p2, :cond_5

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :cond_5
    const/4 v2, 0x3

    .line 84
    goto :goto_0

    .line 85
    :sswitch_6
    const-string p2, "userProfile"

    .line 86
    .line 87
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 88
    .line 89
    .line 90
    move-result p2

    .line 91
    if-nez p2, :cond_6

    .line 92
    .line 93
    goto :goto_0

    .line 94
    :cond_6
    const/4 v2, 0x2

    .line 95
    goto :goto_0

    .line 96
    :sswitch_7
    const-string p2, "openAuctionApplyPanel"

    .line 97
    .line 98
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 99
    .line 100
    .line 101
    move-result p2

    .line 102
    if-nez p2, :cond_7

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    const/4 v2, 0x1

    .line 106
    goto :goto_0

    .line 107
    :sswitch_8
    const-string p2, "userApplyVoiceCall"

    .line 108
    .line 109
    invoke-virtual {p3, p2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 110
    .line 111
    .line 112
    move-result p2

    .line 113
    if-nez p2, :cond_8

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    const/4 v2, 0x0

    .line 117
    :goto_0
    const/4 p2, 0x0

    .line 118
    packed-switch v2, :pswitch_data_0

    .line 119
    .line 120
    .line 121
    goto/16 :goto_1

    .line 122
    .line 123
    :pswitch_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 128
    .line 129
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendNormalMessage()Ll/v3f$d;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    new-instance p3, Ll/gw40;

    .line 134
    .line 135
    const-string p4, "\u606d\u559c\u6210\u4e3a\u6b4c\u66f2\u64c2\u4e3b"

    .line 136
    .line 137
    invoke-direct {p3, p4}, Ll/gw40;-><init>(Ljava/lang/String;)V

    .line 138
    .line 139
    .line 140
    invoke-virtual {p1, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 141
    .line 142
    .line 143
    invoke-virtual {p0, v0, p2}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 144
    .line 145
    .line 146
    return-void

    .line 147
    :pswitch_1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenH5Event:Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;

    .line 152
    .line 153
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenH5Event;->open()Ll/v3f$d;

    .line 154
    .line 155
    .line 156
    move-result-object p0

    .line 157
    const/16 p1, 0x2328

    .line 158
    .line 159
    invoke-static {p1}, Ll/px50;->c(I)Ll/px50$a;

    .line 160
    .line 161
    .line 162
    move-result-object p1

    .line 163
    sget-object p2, Ll/efv;->J:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {p1, p2}, Ll/px50$a;->B(Ljava/lang/String;)Ll/px50$a;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    const-wide/high16 p2, 0x3ff0000000000000L    # 1.0

    .line 170
    .line 171
    invoke-virtual {p1, p2, p3, p2, p3}, Ll/px50$a;->z(DD)Ll/px50$a;

    .line 172
    .line 173
    .line 174
    move-result-object p1

    .line 175
    const/16 p2, 0x50

    .line 176
    .line 177
    invoke-virtual {p1, p2}, Ll/px50$a;->t(I)Ll/px50$a;

    .line 178
    .line 179
    .line 180
    move-result-object p1

    .line 181
    invoke-virtual {p1}, Ll/px50$a;->q()Ll/px50;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 186
    .line 187
    .line 188
    return-void

    .line 189
    :pswitch_2
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 190
    .line 191
    .line 192
    move-result-object p0

    .line 193
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VirtualRoomInfoEvent:Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;

    .line 194
    .line 195
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VirtualRoomInfoEvent;->showVoiceRoomLevelDetail()Ll/v3f$c;

    .line 196
    .line 197
    .line 198
    move-result-object p0

    .line 199
    invoke-virtual {p0}, Ll/v3f$c;->p()V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :pswitch_3
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->extInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;

    .line 204
    .line 205
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage$ExtInfo;->buttonSchema:Ljava/lang/String;

    .line 206
    .line 207
    invoke-virtual {p0, p1}, Ll/yh2;->r4(Ljava/lang/String;)V

    .line 208
    .line 209
    .line 210
    return-void

    .line 211
    :pswitch_4
    invoke-virtual {p1}, Ll/a5s;->b()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object p1

    .line 215
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 216
    .line 217
    .line 218
    move-result-object p2

    .line 219
    check-cast p2, Ll/rwn0;

    .line 220
    .line 221
    invoke-virtual {p2}, Ll/vp20;->o()Ljava/lang/String;

    .line 222
    .line 223
    .line 224
    move-result-object p2

    .line 225
    invoke-static {p0, p1, p2}, Ll/m2g0;->c(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    return-void

    .line 229
    :pswitch_5
    iget-object p1, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 230
    .line 231
    if-eqz p1, :cond_9

    .line 232
    .line 233
    iget-object p1, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 234
    .line 235
    invoke-static {p1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 236
    .line 237
    .line 238
    move-result p1

    .line 239
    if-nez p1, :cond_9

    .line 240
    .line 241
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    check-cast p1, Ll/rwn0;

    .line 246
    .line 247
    invoke-virtual {p1}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 252
    .line 253
    iget-object p2, p4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->liveUserInfo:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;

    .line 254
    .line 255
    iget-object p2, p2, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveUserInfo;->userId:Ljava/lang/String;

    .line 256
    .line 257
    invoke-static {p0, p1, p2}, Ll/ydn0;->k(Ll/i6t;Ljava/lang/String;Ljava/lang/String;)V

    .line 258
    .line 259
    .line 260
    :cond_9
    :goto_1
    return-void

    .line 261
    :pswitch_6
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 262
    .line 263
    .line 264
    move-result-object p1

    .line 265
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceAuctionEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;

    .line 266
    .line 267
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceAuctionEvent;->openAuctionQueueDlg()Ll/v3f$d;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    sget-object p2, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 272
    .line 273
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 274
    .line 275
    .line 276
    invoke-static {p0}, Ll/t3m0;->h(Ll/i6t;)V

    .line 277
    .line 278
    .line 279
    return-void

    .line 280
    :pswitch_7
    invoke-virtual {p0, p1, p4}, Ll/yno0;->K5(Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 281
    .line 282
    .line 283
    :pswitch_8
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 284
    .line 285
    .line 286
    move-result-object p1

    .line 287
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->ChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;

    .line 288
    .line 289
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$ChatEvent;->sendNormalMessage()Ll/v3f$d;

    .line 290
    .line 291
    .line 292
    move-result-object p1

    .line 293
    new-instance p3, Ll/gw40;

    .line 294
    .line 295
    const-string p4, "\u606d\u559c\u7fa4\u4e3b\uff01\ud83d\udc4f\ud83c\udffb"

    .line 296
    .line 297
    invoke-direct {p3, p4}, Ll/gw40;-><init>(Ljava/lang/String;)V

    .line 298
    .line 299
    .line 300
    invoke-virtual {p1, p3}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 301
    .line 302
    .line 303
    invoke-virtual {p0, v1, p2}, Ll/yh2;->j4(Ljava/lang/String;Ll/qcj;)V

    .line 304
    .line 305
    .line 306
    invoke-static {p0}, Ll/t3m0;->b(Ll/i6t;)V

    .line 307
    .line 308
    .line 309
    return-void

    .line 310
    nop

    .line 311
    :sswitch_data_0
    .sparse-switch
        -0x5888c873 -> :sswitch_8
        -0x4d7f3b51 -> :sswitch_7
        -0x246f94a2 -> :sswitch_6
        0x2068575b -> :sswitch_5
        0x2eaf0278 -> :sswitch_4
        0x4fae0280 -> :sswitch_3
        0x57838d1a -> :sswitch_2
        0x6820babc -> :sswitch_1
        0x7733713f -> :sswitch_0
    .end sparse-switch

    .line 312
    .line 313
    .line 314
    .line 315
    .line 316
    .line 317
    .line 318
    .line 319
    .line 320
    .line 321
    .line 322
    .line 323
    .line 324
    .line 325
    .line 326
    .line 327
    .line 328
    .line 329
    .line 330
    .line 331
    .line 332
    .line 333
    .line 334
    .line 335
    .line 336
    .line 337
    .line 338
    .line 339
    .line 340
    .line 341
    .line 342
    .line 343
    .line 344
    .line 345
    .line 346
    .line 347
    .line 348
    .line 349
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_8
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final K5(Ll/a5s;Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V
    .locals 1

    .line 1
    const/4 v0, 0x0

    .line 2
    invoke-virtual {p1, v0}, Ll/a5s;->h(Z)V

    .line 3
    .line 4
    .line 5
    invoke-virtual {p1, v0}, Ll/a5s;->f(Z)V

    .line 6
    .line 7
    .line 8
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 9
    .line 10
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 11
    .line 12
    invoke-virtual {p1, p2}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->M(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)V

    .line 13
    .line 14
    .line 15
    new-instance p1, Ll/pf60;

    .line 16
    .line 17
    const-string p2, "scene"

    .line 18
    .line 19
    const-string v0, "welcome_message"

    .line 20
    .line 21
    invoke-direct {p1, p2, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 22
    .line 23
    .line 24
    filled-new-array {p1}, [Ll/pf60;

    .line 25
    .line 26
    .line 27
    move-result-object p1

    .line 28
    const-string p2, "e_audio_user_application"

    .line 29
    .line 30
    const-string v0, "p_user_audio_room"

    .line 31
    .line 32
    invoke-static {p2, v0, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 33
    .line 34
    .line 35
    invoke-static {p0}, Ll/i9o0;->i(Ll/i6t;)Z

    .line 36
    .line 37
    .line 38
    move-result p1

    .line 39
    if-eqz p1, :cond_0

    .line 40
    .line 41
    const-string p0, "\u4f60\u5df2\u5728\u9ea6\u4e0a"

    .line 42
    .line 43
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 44
    .line 45
    .line 46
    return-void

    .line 47
    :cond_0
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 48
    .line 49
    .line 50
    move-result-object p0

    .line 51
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;

    .line 52
    .line 53
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceCallEvent;->callApplyEvent()Ll/v3f$d;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    new-instance p1, Ll/bzm0;

    .line 58
    .line 59
    invoke-direct {p1}, Ll/bzm0;-><init>()V

    .line 60
    .line 61
    .line 62
    const-string p2, "apply"

    .line 63
    .line 64
    invoke-virtual {p1, p2}, Ll/bzm0;->d(Ljava/lang/String;)Ll/bzm0;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public final L5(Ljava/util/List;)Ljava/util/List;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;",
            ">;)",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/nno0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/nno0;-><init>(Ll/yno0;)V

    .line 4
    .line 5
    .line 6
    invoke-static {p1, v0}, Ll/jyb;->Q(Ljava/util/Collection;Ll/qcj;)Ljava/util/ArrayList;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method

.method public M4()V
    .locals 3

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    check-cast v0, Ll/rwn0;

    .line 6
    .line 7
    invoke-virtual {v0}, Ll/rwn0;->W2()Ljava/lang/String;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    if-nez v0, :cond_0

    .line 12
    .line 13
    return-void

    .line 14
    :cond_0
    iget-boolean v0, p0, Ll/yno0;->s:Z

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    return-void

    .line 19
    :cond_1
    const/4 v0, 0x1

    .line 20
    iput-boolean v0, p0, Ll/yno0;->s:Z

    .line 21
    .line 22
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 23
    .line 24
    .line 25
    move-result-object v0

    .line 26
    check-cast v0, Ll/rwn0;

    .line 27
    .line 28
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 29
    .line 30
    .line 31
    move-result-object v0

    .line 32
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    check-cast v1, Ll/rwn0;

    .line 37
    .line 38
    invoke-virtual {v1}, Ll/vp20;->o()Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v1

    .line 42
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 43
    .line 44
    .line 45
    move-result-object v2

    .line 46
    check-cast v2, Ll/rwn0;

    .line 47
    .line 48
    invoke-virtual {v2}, Ll/rwn0;->W2()Ljava/lang/String;

    .line 49
    .line 50
    .line 51
    move-result-object v2

    .line 52
    invoke-static {v0, v1, v2}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->requestHistoryMessages(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 57
    .line 58
    .line 59
    move-result-object v0

    .line 60
    new-instance v1, Ll/hno0;

    .line 61
    .line 62
    invoke-direct {v1, p0}, Ll/hno0;-><init>(Ll/yno0;)V

    .line 63
    .line 64
    .line 65
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    new-instance v1, Ll/pno0;

    .line 70
    .line 71
    invoke-direct {v1, p0}, Ll/pno0;-><init>(Ll/yno0;)V

    .line 72
    .line 73
    .line 74
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    new-instance v1, Ll/qno0;

    .line 79
    .line 80
    invoke-direct {v1, p0}, Ll/qno0;-><init>(Ll/yno0;)V

    .line 81
    .line 82
    .line 83
    invoke-virtual {v0, v1}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    new-instance v1, Ll/rno0;

    .line 88
    .line 89
    invoke-direct {v1, p0}, Ll/rno0;-><init>(Ll/yno0;)V

    .line 90
    .line 91
    .line 92
    invoke-virtual {v0, v1}, Lrx/c;->doOnNext(Ll/y20;)Lrx/c;

    .line 93
    .line 94
    .line 95
    move-result-object v0

    .line 96
    new-instance v1, Ll/sno0;

    .line 97
    .line 98
    invoke-direct {v1, p0}, Ll/sno0;-><init>(Ll/yno0;)V

    .line 99
    .line 100
    .line 101
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 102
    .line 103
    .line 104
    move-result-object p0

    .line 105
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 106
    .line 107
    .line 108
    return-void
.end method

.method public final M5(JJ)V
    .locals 7

    .line 1
    new-instance v0, Ljava/lang/StringBuilder;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 4
    .line 5
    .line 6
    invoke-virtual {v0, p1, p2}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 7
    .line 8
    .line 9
    const-string v1, "-"

    .line 10
    .line 11
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, p3, p4}, Ljava/lang/StringBuilder;->append(J)Ljava/lang/StringBuilder;

    .line 15
    .line 16
    .line 17
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object v0

    .line 21
    iget-object v1, p0, Ll/yno0;->q:Ljava/util/HashSet;

    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->contains(Ljava/lang/Object;)Z

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    if-eqz v1, :cond_0

    .line 28
    .line 29
    return-void

    .line 30
    :cond_0
    iget-object v1, p0, Ll/yno0;->q:Ljava/util/HashSet;

    .line 31
    .line 32
    invoke-virtual {v1, v0}, Ljava/util/HashSet;->add(Ljava/lang/Object;)Z

    .line 33
    .line 34
    .line 35
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    check-cast v0, Ll/rwn0;

    .line 40
    .line 41
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 42
    .line 43
    .line 44
    move-result-object v1

    .line 45
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    check-cast v0, Ll/rwn0;

    .line 50
    .line 51
    invoke-virtual {v0}, Ll/vp20;->o()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    move-wide v3, p1

    .line 56
    move-wide v5, p3

    .line 57
    invoke-static/range {v1 .. v6}, Lcom/p1/mobile/putong/live/livingroom/voice/api/VoiceRoomApiProvider;->requestHistoryMessages(Ljava/lang/String;Ljava/lang/String;JJ)Lrx/c;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    invoke-virtual {p0, p1}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    new-instance p2, Ll/mno0;

    .line 66
    .line 67
    invoke-direct {p2, p0}, Ll/mno0;-><init>(Ll/yno0;)V

    .line 68
    .line 69
    .line 70
    invoke-static {p2}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 71
    .line 72
    .line 73
    move-result-object p0

    .line 74
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 75
    .line 76
    .line 77
    return-void
.end method

.method public final N5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-eqz v0, :cond_0

    .line 10
    .line 11
    return-void

    .line 12
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 13
    .line 14
    if-eqz v0, :cond_2

    .line 15
    .line 16
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Pagination;->links:Lcom/p1/mobile/putong/data/Links;

    .line 17
    .line 18
    if-eqz v0, :cond_2

    .line 19
    .line 20
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Links;->next:Ljava/lang/String;

    .line 21
    .line 22
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    if-eqz v0, :cond_1

    .line 27
    .line 28
    goto :goto_0

    .line 29
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    check-cast v0, Ll/rwn0;

    .line 34
    .line 35
    iget-object v1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 36
    .line 37
    invoke-virtual {v0, v1}, Ll/rwn0;->P3(Lcom/p1/mobile/putong/data/Pagination;)V

    .line 38
    .line 39
    .line 40
    iget-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 41
    .line 42
    invoke-interface {v0}, Ljava/util/List;->clear()V

    .line 43
    .line 44
    .line 45
    iget-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 46
    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 48
    .line 49
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 50
    .line 51
    invoke-virtual {p0, p1}, Ll/yno0;->L5(Ljava/util/List;)Ljava/util/List;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-interface {v0, p1}, Ljava/util/List;->addAll(Ljava/util/Collection;)Z

    .line 56
    .line 57
    .line 58
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 59
    .line 60
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 61
    .line 62
    iget-object p0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 63
    .line 64
    const/4 v0, 0x1

    .line 65
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->K(Ljava/util/List;Z)V

    .line 66
    .line 67
    .line 68
    return-void

    .line 69
    :cond_2
    :goto_0
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 70
    .line 71
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 72
    .line 73
    new-instance v0, Ll/ono0;

    .line 74
    .line 75
    invoke-direct {v0, p0}, Ll/ono0;-><init>(Ll/yno0;)V

    .line 76
    .line 77
    .line 78
    invoke-static {p1, v0}, Ll/jyb;->z(Ljava/util/Collection;Ll/y20;)V

    .line 79
    .line 80
    .line 81
    return-void
.end method

.method public final O5(Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;)Ljava/lang/Boolean;
    .locals 7

    .line 1
    iget v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->category:I

    .line 2
    .line 3
    sget v1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->VOICE_CHAT_CATEGORY:I

    .line 4
    .line 5
    iget-wide v2, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 6
    .line 7
    if-eq v0, v1, :cond_0

    .line 8
    .line 9
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 10
    .line 11
    return-object p0

    .line 12
    :cond_0
    const-wide/16 v0, 0x0

    .line 13
    .line 14
    cmp-long v4, v2, v0

    .line 15
    .line 16
    if-nez v4, :cond_1

    .line 17
    .line 18
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 19
    .line 20
    return-object p0

    .line 21
    :cond_1
    iget-object v4, p0, Ll/yno0;->r:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 22
    .line 23
    if-nez v4, :cond_2

    .line 24
    .line 25
    iput-object p1, p0, Ll/yno0;->r:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 26
    .line 27
    iput-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->preMessageTime:J

    .line 28
    .line 29
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 30
    .line 31
    return-object p0

    .line 32
    :cond_2
    iget-wide v5, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->preSeq:J

    .line 33
    .line 34
    cmp-long v0, v5, v0

    .line 35
    .line 36
    if-nez v0, :cond_3

    .line 37
    .line 38
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 39
    .line 40
    return-object p0

    .line 41
    :cond_3
    iget-wide v0, v4, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 42
    .line 43
    cmp-long v4, v2, v0

    .line 44
    .line 45
    if-gtz v4, :cond_4

    .line 46
    .line 47
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 48
    .line 49
    return-object p0

    .line 50
    :cond_4
    cmp-long v4, v0, v5

    .line 51
    .line 52
    if-eqz v4, :cond_5

    .line 53
    .line 54
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/yno0;->M5(JJ)V

    .line 55
    .line 56
    .line 57
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 58
    .line 59
    .line 60
    move-result-object p0

    .line 61
    check-cast p0, Ll/rwn0;

    .line 62
    .line 63
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 64
    .line 65
    invoke-virtual {p0, v0, v1}, Ll/rwn0;->G3(J)V

    .line 66
    .line 67
    .line 68
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 69
    .line 70
    return-object p0

    .line 71
    :cond_5
    iput-object p1, p0, Ll/yno0;->r:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 72
    .line 73
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 74
    .line 75
    .line 76
    move-result-object p0

    .line 77
    check-cast p0, Ll/rwn0;

    .line 78
    .line 79
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 80
    .line 81
    invoke-virtual {p0, v0, v1}, Ll/rwn0;->G3(J)V

    .line 82
    .line 83
    .line 84
    sget-object p0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 85
    .line 86
    return-object p0
.end method

.method public final synthetic P5(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;
    .locals 1

    .line 1
    invoke-static {}, Ll/v710;->d()Ll/v710;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    check-cast p0, Ll/rwn0;

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/rwn0;->W0()Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    invoke-static {p1, p0}, Ll/f7t;->y(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 16
    .line 17
    .line 18
    move-result-object p0

    .line 19
    invoke-virtual {v0, p0}, Ll/v710;->g(Lcom/google/protobuf/q;)Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 20
    .line 21
    .line 22
    move-result-object p0

    .line 23
    return-object p0
.end method

.method public final synthetic Q5(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;)V
    .locals 3

    .line 1
    invoke-static {}, Ll/v710;->d()Ll/v710;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ljava/lang/StringBuilder;

    .line 6
    .line 7
    const-string v2, "msg_from_request_"

    .line 8
    .line 9
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 10
    .line 11
    .line 12
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->hashCode()I

    .line 13
    .line 14
    .line 15
    move-result v2

    .line 16
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 17
    .line 18
    .line 19
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 20
    .line 21
    .line 22
    move-result-object v1

    .line 23
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 24
    .line 25
    .line 26
    move-result-object p0

    .line 27
    check-cast p0, Ll/rwn0;

    .line 28
    .line 29
    invoke-virtual {p0}, Ll/rwn0;->W0()Z

    .line 30
    .line 31
    .line 32
    move-result p0

    .line 33
    invoke-static {p1, p0}, Ll/f7t;->y(Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;Z)Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$LiveChatMessage;

    .line 34
    .line 35
    .line 36
    move-result-object p0

    .line 37
    sget-object p1, Ll/p1w;->j:Ljava/lang/String;

    .line 38
    .line 39
    const-string v2, "live.chat.msg"

    .line 40
    .line 41
    invoke-virtual {v0, v1, v2, p0, p1}, Ll/v710;->c(Ljava/lang/String;Ljava/lang/String;Lcom/google/protobuf/q;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    return-void
.end method

.method public final synthetic R5(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->N(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic S5(Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/VoiceUpdateUserMaskProto$UserMaskUpdate;->getMask()Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;

    .line 6
    .line 7
    .line 8
    move-result-object p1

    .line 9
    invoke-static {p1}, Ll/v6o0;->a(Lcom/p1/mobile/longlink/msg/userMask/userMaskConfig$UserMask;)Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;

    .line 10
    .line 11
    .line 12
    move-result-object p1

    .line 13
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->N(Lcom/p1/mobile/putong/live/base/data/BLiveUserMask;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method

.method public final synthetic T5(Ljava/util/List;)V
    .locals 0

    .line 1
    const/4 p1, 0x0

    .line 2
    iput-boolean p1, p0, Ll/yno0;->s:Z

    .line 3
    .line 4
    return-void
.end method

.method public final synthetic U5(Ljava/util/List;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-interface {v0, v1, p1}, Ljava/util/List;->addAll(ILjava/util/Collection;)Z

    .line 5
    .line 6
    .line 7
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 8
    .line 9
    check-cast p1, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 10
    .line 11
    iget-object p0, p0, Ll/yh2;->i:Ljava/util/List;

    .line 12
    .line 13
    const/4 v0, 0x1

    .line 14
    invoke-virtual {p1, p0, v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->K(Ljava/util/List;Z)V

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic V5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    check-cast p0, Ll/rwn0;

    .line 6
    .line 7
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->pagination:Lcom/p1/mobile/putong/data/Pagination;

    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/rwn0;->P3(Lcom/p1/mobile/putong/data/Pagination;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public final synthetic W5(Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;)Ljava/util/List;
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 4
    .line 5
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 6
    .line 7
    .line 8
    move-result v0

    .line 9
    if-nez v0, :cond_0

    .line 10
    .line 11
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    check-cast p0, Ll/rwn0;

    .line 16
    .line 17
    invoke-virtual {p0}, Ll/rwn0;->W2()Ljava/lang/String;

    .line 18
    .line 19
    .line 20
    move-result-object p0

    .line 21
    if-nez p0, :cond_0

    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 24
    .line 25
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 26
    .line 27
    const/4 v0, 0x0

    .line 28
    invoke-interface {p0, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    check-cast p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;

    .line 33
    .line 34
    const-wide/16 v0, 0x0

    .line 35
    .line 36
    iput-wide v0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveChatMessage;->preTimestamp:J

    .line 37
    .line 38
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveEnvelope;->data:Lcom/p1/mobile/putong/live/base/data/BLiveData;

    .line 39
    .line 40
    iget-object p0, p0, Lcom/p1/mobile/putong/live/base/data/BLiveData;->liveChatMessages:Ljava/util/List;

    .line 41
    .line 42
    return-object p0
.end method

.method public final synthetic Y5(Ll/b9m0;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 4
    .line 5
    invoke-virtual {p0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->H()V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic Z5(Landroid/net/NetworkInfo;)V
    .locals 4

    .line 1
    iget-object p1, p0, Ll/yno0;->r:Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    iget-wide v0, p1, Lcom/p1/mobile/putong/live/livingroom/archi/longlink/bean/LiveMessage;->seq:J

    .line 6
    .line 7
    const-wide/16 v2, -0x1

    .line 8
    .line 9
    invoke-virtual {p0, v0, v1, v2, v3}, Ll/yno0;->M5(JJ)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method

.method public init()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/yh2;->init()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->Y()Ll/cxl;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    new-instance v1, Ll/tno0;

    .line 15
    .line 16
    invoke-direct {v1, p0}, Ll/tno0;-><init>(Ll/yno0;)V

    .line 17
    .line 18
    .line 19
    invoke-virtual {v0, v1}, Ll/cxl;->a(Ll/qcj;)V

    .line 20
    .line 21
    .line 22
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 23
    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 25
    .line 26
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->getAdapter()Ll/gt4;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    if-eqz v0, :cond_0

    .line 31
    .line 32
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 33
    .line 34
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 35
    .line 36
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->getAdapter()Ll/gt4;

    .line 37
    .line 38
    .line 39
    move-result-object v0

    .line 40
    instance-of v0, v0, Ll/m5n0;

    .line 41
    .line 42
    if-eqz v0, :cond_0

    .line 43
    .line 44
    iget-object v0, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 45
    .line 46
    check-cast v0, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/common/chat/list/ChatListView;->getAdapter()Ll/gt4;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    check-cast v0, Ll/m5n0;

    .line 53
    .line 54
    const/4 v1, 0x1

    .line 55
    invoke-virtual {v0, v1}, Ll/m5n0;->h0(Z)V

    .line 56
    .line 57
    .line 58
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->h()Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/livingroom/util/pref/LiveWatchCounter;->m()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    if-nez v0, :cond_1

    .line 67
    .line 68
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 69
    .line 70
    .line 71
    move-result-object v0

    .line 72
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->BootBubbleEvent:Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$BootBubbleEvent;->showBubbleByType()Ll/v3f$d;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "voiceChatButtonBubble"

    .line 79
    .line 80
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 81
    .line 82
    .line 83
    :cond_1
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    check-cast v0, Ll/rwn0;

    .line 88
    .line 89
    invoke-virtual {v0}, Ll/rwn0;->E3()Lrx/c;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    new-instance v1, Ll/uno0;

    .line 98
    .line 99
    invoke-direct {v1, p0}, Ll/uno0;-><init>(Ll/yno0;)V

    .line 100
    .line 101
    .line 102
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 107
    .line 108
    .line 109
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    check-cast v0, Ll/rwn0;

    .line 114
    .line 115
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    invoke-virtual {v0}, Ll/aj1;->l0()Lrx/c;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 128
    .line 129
    .line 130
    move-result-object v1

    .line 131
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    new-instance v1, Ll/vno0;

    .line 136
    .line 137
    invoke-direct {v1, p0}, Ll/vno0;-><init>(Ll/yno0;)V

    .line 138
    .line 139
    .line 140
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 141
    .line 142
    .line 143
    move-result-object p0

    .line 144
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 145
    .line 146
    .line 147
    return-void
.end method

.method public o4()Ll/zh2;
    .locals 8

    .line 1
    iget-object v0, p0, Ll/yh2;->m:Ll/zh2;

    .line 2
    .line 3
    if-nez v0, :cond_1

    .line 4
    .line 5
    new-instance v0, Ll/o2f;

    .line 6
    .line 7
    invoke-direct {v0}, Ll/o2f;-><init>()V

    .line 8
    .line 9
    .line 10
    new-instance v1, Ll/lx40;

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 13
    .line 14
    .line 15
    move-result-object v2

    .line 16
    check-cast v2, Ll/rwn0;

    .line 17
    .line 18
    invoke-virtual {v2}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 19
    .line 20
    .line 21
    move-result-object v2

    .line 22
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 23
    .line 24
    invoke-static {v2}, Ll/y6s;->a(Ljava/lang/String;)Z

    .line 25
    .line 26
    .line 27
    move-result v2

    .line 28
    invoke-direct {v1, v2}, Ll/lx40;-><init>(Z)V

    .line 29
    .line 30
    .line 31
    new-instance v2, Ll/m90;

    .line 32
    .line 33
    invoke-virtual {p0}, Ll/xzs;->L2()Z

    .line 34
    .line 35
    .line 36
    move-result v3

    .line 37
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    check-cast v4, Ll/rwn0;

    .line 42
    .line 43
    invoke-virtual {v4}, Ll/oo2;->F0()I

    .line 44
    .line 45
    .line 46
    move-result v4

    .line 47
    const/4 v5, 0x0

    .line 48
    const/4 v6, 0x1

    .line 49
    const/4 v7, 0x2

    .line 50
    if-ne v4, v7, :cond_0

    .line 51
    .line 52
    move v4, v6

    .line 53
    goto :goto_0

    .line 54
    :cond_0
    move v4, v5

    .line 55
    :goto_0
    invoke-direct {v2, v3, v4}, Ll/m90;-><init>(ZZ)V

    .line 56
    .line 57
    .line 58
    const/4 v3, 0x3

    .line 59
    new-array v3, v3, [Ll/vr4;

    .line 60
    .line 61
    aput-object v0, v3, v5

    .line 62
    .line 63
    aput-object v1, v3, v6

    .line 64
    .line 65
    aput-object v2, v3, v7

    .line 66
    .line 67
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 68
    .line 69
    .line 70
    move-result-object v0

    .line 71
    invoke-static {v0}, Ll/vr4;->a(Ljava/util/List;)Ll/vr4;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Ll/zh2;

    .line 76
    .line 77
    iput-object v0, p0, Ll/yh2;->m:Ll/zh2;

    .line 78
    .line 79
    :cond_1
    iget-object p0, p0, Ll/yh2;->m:Ll/zh2;

    .line 80
    .line 81
    return-object p0
.end method

.method public p4()Ljava/lang/String;
    .locals 0

    .line 1
    sget-object p0, Ll/j35;->b:Ljava/lang/String;

    .line 2
    .line 3
    return-object p0
.end method

.method public q4()Ljava/lang/String;
    .locals 0

    .line 1
    const-string p0, "voiceLiveRoom"

    .line 2
    .line 3
    return-object p0
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/csm0;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    check-cast v0, Ll/rwn0;

    .line 9
    .line 10
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    invoke-virtual {v0}, Ll/aj1;->x0()Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 23
    .line 24
    .line 25
    move-result-object v1

    .line 26
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 27
    .line 28
    .line 29
    move-result-object v0

    .line 30
    new-instance v1, Ll/wno0;

    .line 31
    .line 32
    invoke-direct {v1, p0}, Ll/wno0;-><init>(Ll/yno0;)V

    .line 33
    .line 34
    .line 35
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 40
    .line 41
    .line 42
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceChatEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceChatEvent;->dismissInviteSpanEvent()Ll/v3f$d;

    .line 49
    .line 50
    .line 51
    move-result-object v0

    .line 52
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 53
    .line 54
    .line 55
    move-result-object v0

    .line 56
    check-cast v0, Lrx/c;

    .line 57
    .line 58
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    new-instance v1, Ll/xno0;

    .line 71
    .line 72
    invoke-direct {v1}, Ll/xno0;-><init>()V

    .line 73
    .line 74
    .line 75
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    new-instance v1, Ll/ino0;

    .line 80
    .line 81
    invoke-direct {v1, p0}, Ll/ino0;-><init>(Ll/yno0;)V

    .line 82
    .line 83
    .line 84
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 89
    .line 90
    .line 91
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceVirtualLiveEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceVirtualLiveEvent;->motionSwitch()Ll/v3f$d;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/v3f$b;->g()Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lrx/c;

    .line 106
    .line 107
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    new-instance v1, Ll/jno0;

    .line 112
    .line 113
    invoke-direct {v1, p0}, Ll/jno0;-><init>(Ll/yno0;)V

    .line 114
    .line 115
    .line 116
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 121
    .line 122
    .line 123
    invoke-static {}, Lcom/tantanapp/common/utils/ConnectivityReceiver;->m()Lrx/c;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    const/4 v1, 0x1

    .line 132
    invoke-virtual {v0, v1}, Lrx/c;->skip(I)Lrx/c;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    new-instance v1, Ll/kno0;

    .line 137
    .line 138
    invoke-direct {v1}, Ll/kno0;-><init>()V

    .line 139
    .line 140
    .line 141
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    invoke-virtual {v0}, Lrx/c;->distinctUntilChanged()Lrx/c;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    invoke-static {}, Ll/fo0;->a()Ll/f2e0;

    .line 150
    .line 151
    .line 152
    move-result-object v1

    .line 153
    invoke-virtual {v0, v1}, Lrx/c;->observeOn(Ll/f2e0;)Lrx/c;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    new-instance v1, Ll/lno0;

    .line 158
    .line 159
    invoke-direct {v1, p0}, Ll/lno0;-><init>(Ll/yno0;)V

    .line 160
    .line 161
    .line 162
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 163
    .line 164
    .line 165
    move-result-object p0

    .line 166
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 167
    .line 168
    .line 169
    return-void
.end method
