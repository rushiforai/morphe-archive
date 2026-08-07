.class public Ll/cj10;
.super Ll/qct;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/oo2;",
        ">",
        "Ll/qct<",
        "TD;>;"
    }
.end annotation


# instance fields
.field public final i:Ll/td10;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/td10<",
            "TD;>;"
        }
    .end annotation
.end field


# direct methods
.method public constructor <init>(Ll/dum;Ll/td10;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Ll/td10<",
            "TD;>;)V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/qct;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    iput-object p2, p0, Ll/cj10;->i:Ll/td10;

    .line 5
    .line 6
    return-void
.end method

.method public static synthetic J3(Ll/cj10;Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cj10;->W3(Ljava/util/List;)V

    return-void
.end method

.method public static synthetic K3(Ll/cj10;Ll/c8t;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cj10;->P3(Ll/c8t;)V

    return-void
.end method

.method public static synthetic L3(Ll/cj10;Ll/v7t;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cj10;->X3(Ll/v7t;)Ljava/lang/Boolean;

    move-result-object p0

    return-object p0
.end method

.method public static synthetic M3(Ll/cj10;Ll/v7t;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/cj10;->R3(Ll/v7t;)V

    return-void
.end method

.method public static synthetic N3(Ll/cj10;Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/cj10;->O3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;)V

    return-void
.end method

.method private R3(Ll/v7t;)V
    .locals 3

    .line 1
    sget-object v0, Ll/cd10;->I:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result v0

    .line 11
    if-eqz v0, :cond_0

    .line 12
    .line 13
    iget-object v0, p0, Ll/cj10;->i:Ll/td10;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 16
    .line 17
    .line 18
    move-result-object v1

    .line 19
    invoke-virtual {v0, v1}, Ll/td10;->Z3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 20
    .line 21
    .line 22
    goto/16 :goto_0

    .line 23
    .line 24
    :cond_0
    invoke-virtual {p0, p1}, Ll/cj10;->V3(Ll/v7t;)Z

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    iget-object v0, p0, Ll/cj10;->i:Ll/td10;

    .line 31
    .line 32
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 33
    .line 34
    .line 35
    move-result-object v1

    .line 36
    invoke-virtual {v0, v1}, Ll/td10;->x4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 37
    .line 38
    .line 39
    goto/16 :goto_0

    .line 40
    .line 41
    :cond_1
    sget-object v0, Ll/cd10;->J:Ljava/lang/String;

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 44
    .line 45
    .line 46
    move-result-object v1

    .line 47
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    if-eqz v0, :cond_2

    .line 52
    .line 53
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    invoke-virtual {p0, v0}, Ll/cj10;->T3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 58
    .line 59
    .line 60
    goto/16 :goto_0

    .line 61
    .line 62
    :cond_2
    sget-object v0, Ll/cd10;->H:Ljava/lang/String;

    .line 63
    .line 64
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    if-eqz v0, :cond_3

    .line 73
    .line 74
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const-string v1, "longlink"

    .line 79
    .line 80
    invoke-static {p0, v0, v1}, Ll/bf10;->i0(Ll/i6t;Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;Ljava/lang/String;)V

    .line 81
    .line 82
    .line 83
    goto :goto_0

    .line 84
    :cond_3
    sget-object v0, Ll/cd10;->S:Ljava/lang/String;

    .line 85
    .line 86
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    if-eqz v0, :cond_4

    .line 95
    .line 96
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 101
    .line 102
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->switchToLeadRole()Ll/v3f$d;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 107
    .line 108
    .line 109
    move-result-object v1

    .line 110
    invoke-virtual {v0, v1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 111
    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_4
    sget-object v0, Ll/cd10;->T:Ljava/lang/String;

    .line 115
    .line 116
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    if-eqz v0, :cond_5

    .line 125
    .line 126
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 131
    .line 132
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->cancelLeadRole()Ll/v3f$d;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 137
    .line 138
    .line 139
    goto :goto_0

    .line 140
    :cond_5
    sget-object v0, Ll/cd10;->V:Ljava/lang/String;

    .line 141
    .line 142
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v1

    .line 146
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    if-eqz v0, :cond_6

    .line 151
    .line 152
    sget-object v0, Ll/cd10;->a:Ljava/lang/String;

    .line 153
    .line 154
    new-instance v1, Ljava/lang/StringBuilder;

    .line 155
    .line 156
    const-string v2, "receive cdn fail"

    .line 157
    .line 158
    invoke-direct {v1, v2}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    iget-object v2, p1, Ll/v7t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 162
    .line 163
    iget-object v2, v2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->refreshPushStreamUrl:Ljava/lang/String;

    .line 164
    .line 165
    invoke-virtual {v1, v2}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 166
    .line 167
    .line 168
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v1

    .line 172
    invoke-static {v0, v1}, Ll/fhw;->a(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    iget-object v0, p0, Ll/cj10;->i:Ll/td10;

    .line 176
    .line 177
    iget-object v0, v0, Ll/td10;->l:Ll/en10;

    .line 178
    .line 179
    iget-object v1, p1, Ll/v7t;->a:Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 180
    .line 181
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->refreshPushStreamUrl:Ljava/lang/String;

    .line 182
    .line 183
    invoke-virtual {v0, v1}, Ll/en10;->i4(Ljava/lang/String;)V

    .line 184
    .line 185
    .line 186
    :cond_6
    :goto_0
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    invoke-virtual {p0, v0}, Ll/cj10;->U3(Ljava/lang/String;)Z

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    if-eqz v0, :cond_7

    .line 195
    .line 196
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 197
    .line 198
    .line 199
    move-result-object v0

    .line 200
    invoke-virtual {v0}, Ll/vp20;->k()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v0

    .line 204
    invoke-static {v0}, Lcom/p1/mobile/putong/live/livingroom/api/LivingNormalApiProvider;->w4(Ljava/lang/String;)Lrx/c;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    new-instance v1, Ll/bj10;

    .line 213
    .line 214
    invoke-direct {v1, p0}, Ll/bj10;-><init>(Ll/cj10;)V

    .line 215
    .line 216
    .line 217
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 218
    .line 219
    .line 220
    move-result-object p0

    .line 221
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 222
    .line 223
    .line 224
    :cond_7
    invoke-virtual {p1}, Ll/v7t;->c()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object p0

    .line 228
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    if-nez p0, :cond_8

    .line 233
    .line 234
    invoke-virtual {p1}, Ll/v7t;->c()Ljava/lang/String;

    .line 235
    .line 236
    .line 237
    move-result-object p0

    .line 238
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 239
    .line 240
    .line 241
    :cond_8
    return-void
.end method

.method private synthetic X3(Ll/v7t;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/cj10;->i:Ll/td10;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/v7t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-virtual {p0, p1}, Ll/td10;->j4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    invoke-static {p0}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 12
    .line 13
    .line 14
    move-result-object p0

    .line 15
    return-object p0
.end method


# virtual methods
.method public final O3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;)V
    .locals 2

    .line 1
    sget-object v0, Ll/cj10$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1}, Ljava/lang/Enum;->ordinal()I

    .line 8
    .line 9
    .line 10
    move-result v1

    .line 11
    aget v0, v0, v1

    .line 12
    .line 13
    packed-switch v0, :pswitch_data_0

    .line 14
    .line 15
    .line 16
    goto :goto_0

    .line 17
    :pswitch_0
    iget-object p1, p0, Ll/cj10;->i:Ll/td10;

    .line 18
    .line 19
    invoke-virtual {p1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    invoke-static {p1}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 24
    .line 25
    .line 26
    move-result p1

    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    invoke-static {p0}, Ll/bf10;->D(Ll/i6t;)Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    invoke-static {p1}, Ll/fn10;->n(Ljava/lang/String;)Z

    .line 34
    .line 35
    .line 36
    move-result p1

    .line 37
    if-nez p1, :cond_0

    .line 38
    .line 39
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 40
    .line 41
    .line 42
    move-result-object p0

    .line 43
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 44
    .line 45
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->switchDeputyCount()Ll/v3f$d;

    .line 46
    .line 47
    .line 48
    move-result-object p0

    .line 49
    const/16 p1, 0x9

    .line 50
    .line 51
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 56
    .line 57
    .line 58
    return-void

    .line 59
    :pswitch_1
    iget-object p1, p0, Ll/cj10;->i:Ll/td10;

    .line 60
    .line 61
    invoke-virtual {p1}, Ll/td10;->e4()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-static {p1}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-nez p1, :cond_0

    .line 70
    .line 71
    invoke-static {p0}, Ll/bf10;->D(Ll/i6t;)Ljava/lang/String;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-static {p1}, Ll/fn10;->n(Ljava/lang/String;)Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-nez p1, :cond_0

    .line 80
    .line 81
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 82
    .line 83
    .line 84
    move-result-object p0

    .line 85
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 86
    .line 87
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->switchDeputyCount()Ll/v3f$d;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    const/4 p1, 0x6

    .line 92
    invoke-static {p1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 97
    .line 98
    .line 99
    :cond_0
    :goto_0
    return-void

    .line 100
    :pswitch_2
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;->getUserId()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    invoke-virtual {p0, v0, p1}, Ll/cj10;->S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;Ljava/lang/String;)V

    .line 109
    .line 110
    .line 111
    return-void

    .line 112
    :pswitch_3
    iget-object p0, p0, Ll/cj10;->i:Ll/td10;

    .line 113
    .line 114
    invoke-virtual {p0}, Ll/td10;->b4()Ll/le10;

    .line 115
    .line 116
    .line 117
    move-result-object p0

    .line 118
    invoke-virtual {p1}, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage;->getType()Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    sget-object v0, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;->turnOnFreeCall:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 125
    .line 126
    .line 127
    move-result p1

    .line 128
    iput-boolean p1, p0, Ll/le10;->b:Z

    .line 129
    .line 130
    return-void

    .line 131
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_3
        :pswitch_3
        :pswitch_2
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public final P3(Ll/c8t;)V
    .locals 1

    .line 1
    sget-object p0, Ll/cd10;->y:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/c8t;->c()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-eqz p0, :cond_0

    .line 12
    .line 13
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->f9:I

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/c8t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserName:Ljava/lang/String;

    .line 20
    .line 21
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 22
    .line 23
    .line 24
    move-result-object p0

    .line 25
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    return-void

    .line 29
    :cond_0
    sget-object p0, Ll/cd10;->A:Ljava/lang/String;

    .line 30
    .line 31
    invoke-virtual {p1}, Ll/c8t;->c()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v0

    .line 35
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_1

    .line 40
    .line 41
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->g9:I

    .line 42
    .line 43
    invoke-virtual {p1}, Ll/c8t;->b()Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCallInvite;->toUserName:Ljava/lang/String;

    .line 48
    .line 49
    invoke-static {p0, p1}, Ll/xau;->u(ILjava/lang/Object;)Ljava/lang/String;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_1
    return-void
.end method

.method public final S3(Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0}, Ll/bf10;->z(Ll/i6t;)Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    iget-boolean p2, p2, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->isAway:Z

    .line 8
    .line 9
    if-eqz p2, :cond_1

    .line 10
    .line 11
    :cond_0
    sget-object p2, Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;->turnOffMultiCall:Lcom/p1/mobile/longlink/msg/liveroom/LongLinkMultiCallMessage$MultiCallActionMessage$Type;

    .line 12
    .line 13
    invoke-virtual {p2, p1}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z

    .line 14
    .line 15
    .line 16
    move-result p1

    .line 17
    if-eqz p1, :cond_1

    .line 18
    .line 19
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 20
    .line 21
    .line 22
    move-result-object p1

    .line 23
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 24
    .line 25
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openApplyDlg()Ll/v3f$d;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const/16 p2, -0x64

    .line 30
    .line 31
    invoke-static {p2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 32
    .line 33
    .line 34
    move-result-object p2

    .line 35
    invoke-virtual {p1, p2}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 36
    .line 37
    .line 38
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 39
    .line 40
    .line 41
    move-result-object p0

    .line 42
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 43
    .line 44
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->closeAcceptDlg()Ll/v3f$d;

    .line 45
    .line 46
    .line 47
    move-result-object p0

    .line 48
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 49
    .line 50
    invoke-virtual {p0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 51
    .line 52
    .line 53
    :cond_1
    return-void
.end method

.method public final T3(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    invoke-static {p0}, Ll/bf10;->P(Ll/i6t;)Z

    .line 10
    .line 11
    .line 12
    move-result v0

    .line 13
    if-eqz v0, :cond_0

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->hangUpSelfCall()Ll/v3f$d;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    invoke-virtual {v0, p1}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 26
    .line 27
    .line 28
    :cond_0
    invoke-static {p1}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    if-nez v0, :cond_1

    .line 33
    .line 34
    iget-object v0, p0, Ll/cj10;->i:Ll/td10;

    .line 35
    .line 36
    invoke-virtual {v0, p1}, Ll/td10;->v4(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)V

    .line 37
    .line 38
    .line 39
    :cond_1
    invoke-static {p1}, Ll/fn10;->j(Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;)Z

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    if-eqz v0, :cond_3

    .line 44
    .line 45
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveMultiCall;->userId:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1}, Ll/bf10;->W(Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 58
    .line 59
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->openApplyDlg()Ll/v3f$d;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    const/16 v0, -0x64

    .line 64
    .line 65
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 66
    .line 67
    .line 68
    move-result-object v0

    .line 69
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 70
    .line 71
    .line 72
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iget-object p1, p1, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->closeAcceptDlg()Ll/v3f$d;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 83
    .line 84
    invoke-virtual {p1, v0}, Ll/v3f$d;->j(Ljava/lang/Object;)V

    .line 85
    .line 86
    .line 87
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 88
    .line 89
    .line 90
    move-result-object p0

    .line 91
    invoke-virtual {p0}, Ll/vp20;->p()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    if-eqz p0, :cond_2

    .line 96
    .line 97
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->R:I

    .line 98
    .line 99
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 100
    .line 101
    .line 102
    return-void

    .line 103
    :cond_2
    sget p0, Lcom/p1/mobile/putong/live/livingroom/R$string;->q1:I

    .line 104
    .line 105
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 106
    .line 107
    .line 108
    :cond_3
    return-void
.end method

.method public final U3(Ljava/lang/String;)Z
    .locals 0

    .line 1
    sget-object p0, Ll/cd10;->F:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-nez p0, :cond_1

    .line 8
    .line 9
    sget-object p0, Ll/cd10;->G:Ljava/lang/String;

    .line 10
    .line 11
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 12
    .line 13
    .line 14
    move-result p0

    .line 15
    if-nez p0, :cond_1

    .line 16
    .line 17
    sget-object p0, Ll/cd10;->H:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Ll/cd10;->J:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 28
    .line 29
    .line 30
    move-result p0

    .line 31
    if-nez p0, :cond_1

    .line 32
    .line 33
    sget-object p0, Ll/cd10;->K:Ljava/lang/String;

    .line 34
    .line 35
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 36
    .line 37
    .line 38
    move-result p0

    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    goto :goto_0

    .line 42
    :cond_0
    const/4 p0, 0x0

    .line 43
    return p0

    .line 44
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 45
    return p0
.end method

.method public final V3(Ll/v7t;)Z
    .locals 1

    .line 1
    sget-object p0, Ll/cd10;->N:Ljava/lang/String;

    .line 2
    .line 3
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    if-nez p0, :cond_1

    .line 12
    .line 13
    sget-object p0, Ll/cd10;->O:Ljava/lang/String;

    .line 14
    .line 15
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object v0

    .line 19
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 20
    .line 21
    .line 22
    move-result p0

    .line 23
    if-nez p0, :cond_1

    .line 24
    .line 25
    sget-object p0, Ll/cd10;->K:Ljava/lang/String;

    .line 26
    .line 27
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 32
    .line 33
    .line 34
    move-result p0

    .line 35
    if-nez p0, :cond_1

    .line 36
    .line 37
    sget-object p0, Ll/cd10;->L:Ljava/lang/String;

    .line 38
    .line 39
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 44
    .line 45
    .line 46
    move-result p0

    .line 47
    if-nez p0, :cond_1

    .line 48
    .line 49
    sget-object p0, Ll/cd10;->M:Ljava/lang/String;

    .line 50
    .line 51
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    invoke-virtual {p0, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    if-nez p0, :cond_1

    .line 60
    .line 61
    sget-object p0, Ll/cd10;->R:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {p1}, Ll/v7t;->d()Ljava/lang/String;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 68
    .line 69
    .line 70
    move-result p0

    .line 71
    if-eqz p0, :cond_0

    .line 72
    .line 73
    goto :goto_0

    .line 74
    :cond_0
    const/4 p0, 0x0

    .line 75
    return p0

    .line 76
    :cond_1
    :goto_0
    const/4 p0, 0x1

    .line 77
    return p0
.end method

.method public final synthetic W3(Ljava/util/List;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->applyData()Ll/v3f$d;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    invoke-virtual {p0, p1}, Ll/v3f$d;->m(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public t()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/l6t;->t()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/aj1;->R()Lrx/c;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v0

    .line 20
    new-instance v1, Ll/wi10;

    .line 21
    .line 22
    invoke-direct {v1, p0}, Ll/wi10;-><init>(Ll/cj10;)V

    .line 23
    .line 24
    .line 25
    invoke-virtual {v0, v1}, Lrx/c;->filter(Ll/qcj;)Lrx/c;

    .line 26
    .line 27
    .line 28
    move-result-object v0

    .line 29
    new-instance v1, Ll/xi10;

    .line 30
    .line 31
    invoke-direct {v1, p0}, Ll/xi10;-><init>(Ll/cj10;)V

    .line 32
    .line 33
    .line 34
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 35
    .line 36
    .line 37
    move-result-object v1

    .line 38
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 39
    .line 40
    .line 41
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 46
    .line 47
    .line 48
    move-result-object v0

    .line 49
    invoke-virtual {v0}, Ll/aj1;->Q()Lrx/c;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    new-instance v1, Ll/yi10;

    .line 58
    .line 59
    invoke-direct {v1, p0}, Ll/yi10;-><init>(Ll/cj10;)V

    .line 60
    .line 61
    .line 62
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 63
    .line 64
    .line 65
    move-result-object v1

    .line 66
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 67
    .line 68
    .line 69
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 70
    .line 71
    .line 72
    move-result-object v0

    .line 73
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    invoke-virtual {v0}, Ll/aj1;->N()Lrx/c;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    new-instance v1, Ll/zi10;

    .line 86
    .line 87
    invoke-direct {v1, p0}, Ll/zi10;-><init>(Ll/cj10;)V

    .line 88
    .line 89
    .line 90
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    invoke-virtual {v0, v1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 95
    .line 96
    .line 97
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    invoke-virtual {v0}, Ll/oo2;->q1()Ll/aj1;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    invoke-virtual {v0}, Ll/aj1;->P()Lrx/c;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    invoke-virtual {p0, v0}, Ll/cyr;->duringCreated(Lrx/c;)Lrx/c;

    .line 110
    .line 111
    .line 112
    move-result-object v0

    .line 113
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 114
    .line 115
    .line 116
    move-result-object p0

    .line 117
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->MultiCallEvent:Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;

    .line 118
    .line 119
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$MultiCallEvent;->receiveInviteLeadRoleMessage()Ll/v3f$d;

    .line 120
    .line 121
    .line 122
    move-result-object p0

    .line 123
    invoke-static {p0}, Ljava/util/Objects;->requireNonNull(Ljava/lang/Object;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    new-instance v1, Ll/aj10;

    .line 127
    .line 128
    invoke-direct {v1, p0}, Ll/aj10;-><init>(Ll/v3f$d;)V

    .line 129
    .line 130
    .line 131
    invoke-static {v1}, Ll/dhw;->h(Ll/y20;)Ll/t9t;

    .line 132
    .line 133
    .line 134
    move-result-object p0

    .line 135
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 136
    .line 137
    .line 138
    return-void
.end method
