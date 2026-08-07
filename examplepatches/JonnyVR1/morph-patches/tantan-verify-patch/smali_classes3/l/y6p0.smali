.class public Ll/y6p0;
.super Ll/atm0;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "<D:",
        "Ll/rwn0;",
        ">",
        "Ll/atm0<",
        "Ll/w6p0<",
        "TD;>;TD;>;"
    }
.end annotation


# instance fields
.field public k:Ll/nsv;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;"
        }
    .end annotation
.end field

.field public l:Ll/q1d0;

.field public m:Ll/fko0;


# direct methods
.method public constructor <init>(Ll/dum;Lv/VImage;)V
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/dum<",
            "TD;>;",
            "Lv/VImage;",
            ")V"
        }
    .end annotation

    .line 1
    invoke-direct {p0, p1}, Ll/atm0;-><init>(Ll/dum;)V

    .line 2
    .line 3
    .line 4
    new-instance p1, Ll/w6p0;

    .line 5
    .line 6
    invoke-direct {p1, p2}, Ll/w6p0;-><init>(Landroid/widget/ImageView;)V

    .line 7
    .line 8
    .line 9
    invoke-virtual {p0, p1}, Ll/l6t;->C(Ll/iam;)V

    .line 10
    .line 11
    .line 12
    return-void
.end method

.method public static synthetic l4(Ll/y6p0;Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/y6p0;->p4(Ljava/util/ArrayList;)V

    return-void
.end method

.method private m4()V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/y6p0;->l:Ll/q1d0;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/q1d0;->h()V

    .line 6
    .line 7
    .line 8
    :cond_0
    iget-object p0, p0, Ll/y6p0;->m:Ll/fko0;

    .line 9
    .line 10
    if-eqz p0, :cond_1

    .line 11
    .line 12
    invoke-virtual {p0}, Ll/fko0;->j()V

    .line 13
    .line 14
    .line 15
    :cond_1
    return-void
.end method

.method private synthetic p4(Ljava/util/ArrayList;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 2
    .line 3
    if-eqz p1, :cond_0

    .line 4
    .line 5
    check-cast p1, Ll/w6p0;

    .line 6
    .line 7
    iget-object p0, p0, Ll/y6p0;->k:Ll/nsv;

    .line 8
    .line 9
    invoke-virtual {p1, p0}, Ll/w6p0;->f(Ll/nsv;)V

    .line 10
    .line 11
    .line 12
    :cond_0
    return-void
.end method


# virtual methods
.method public O3()V
    .locals 1

    .line 1
    invoke-super {p0}, Ll/y8s;->O3()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/y6p0;->m4()V

    .line 5
    .line 6
    .line 7
    const/4 v0, 0x0

    .line 8
    iput-object v0, p0, Ll/y6p0;->k:Ll/nsv;

    .line 9
    .line 10
    return-void
.end method

.method public P3()V
    .locals 2

    .line 1
    invoke-super {p0}, Ll/y8s;->P3()V

    .line 2
    .line 3
    .line 4
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    if-nez v0, :cond_0

    .line 9
    .line 10
    const/4 v0, 0x0

    .line 11
    goto :goto_0

    .line 12
    :cond_0
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Ll/vak0;->c:Ll/nsv;

    .line 17
    .line 18
    :goto_0
    iput-object v0, p0, Ll/y6p0;->k:Ll/nsv;

    .line 19
    .line 20
    iget-object v1, p0, Ll/cyr;->viewModel:Ll/iam;

    .line 21
    .line 22
    check-cast v1, Ll/w6p0;

    .line 23
    .line 24
    invoke-virtual {v1, v0}, Ll/w6p0;->f(Ll/nsv;)V

    .line 25
    .line 26
    .line 27
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 28
    .line 29
    .line 30
    move-result-object v0

    .line 31
    check-cast v0, Ll/rwn0;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/oo2;->T1()Lrx/c;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {p0, v0}, Ll/y8s;->N3(Lrx/c;)Lrx/c;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    new-instance v1, Ll/x6p0;

    .line 42
    .line 43
    invoke-direct {v1, p0}, Ll/x6p0;-><init>(Ll/y6p0;)V

    .line 44
    .line 45
    .line 46
    invoke-static {v1}, Ll/dhw;->d(Ll/y20;)Ll/t9t;

    .line 47
    .line 48
    .line 49
    move-result-object p0

    .line 50
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public n()V
    .locals 0

    .line 1
    invoke-super {p0}, Ll/i6t;->n()V

    .line 2
    .line 3
    .line 4
    invoke-direct {p0}, Ll/y6p0;->m4()V

    .line 5
    .line 6
    .line 7
    return-void
.end method

.method public n4(Ljava/lang/String;)Z
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
    invoke-virtual {p0, p1}, Ll/oo2;->S0(Ljava/lang/String;)Z

    .line 8
    .line 9
    .line 10
    move-result p0

    .line 11
    return p0
.end method

.method public o4()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/atm0;->h4()Ll/vak0;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    const/4 v1, 0x0

    .line 6
    if-eqz v0, :cond_0

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/vak0;->o()Ll/nsv;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    invoke-virtual {v0}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 13
    .line 14
    .line 15
    move-result-object v0

    .line 16
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 17
    .line 18
    invoke-virtual {p0}, Ll/xzs;->E2()Ll/oo2;

    .line 19
    .line 20
    .line 21
    move-result-object p0

    .line 22
    check-cast p0, Ll/rwn0;

    .line 23
    .line 24
    invoke-virtual {p0}, Ll/rwn0;->P2()Ll/hrk0;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-virtual {p0}, Ll/hrk0;->r()Ll/ado0;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    invoke-virtual {p0, v0}, Ll/ado0;->G(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveMember;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    if-eqz p0, :cond_0

    .line 37
    .line 38
    const/4 p0, 0x1

    .line 39
    return p0

    .line 40
    :cond_0
    return v1
.end method

.method public q4(Ll/nsv;)V
    .locals 16
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Ll/nsv<",
            "Lcom/p1/mobile/putong/data/User;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    check-cast v2, Ll/rwn0;

    .line 12
    .line 13
    invoke-virtual {v2}, Ll/oo2;->n0()Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 14
    .line 15
    .line 16
    move-result-object v2

    .line 17
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    const/4 v3, 0x1

    .line 22
    const-string v4, "indonesia"

    .line 23
    .line 24
    if-eqz v2, :cond_2

    .line 25
    .line 26
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 27
    .line 28
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 29
    .line 30
    .line 31
    move-result v2

    .line 32
    if-nez v2, :cond_2

    .line 33
    .line 34
    iget-object v2, v0, Ll/y6p0;->m:Ll/fko0;

    .line 35
    .line 36
    if-nez v2, :cond_0

    .line 37
    .line 38
    new-instance v2, Ll/fko0;

    .line 39
    .line 40
    invoke-direct {v2}, Ll/fko0;-><init>()V

    .line 41
    .line 42
    .line 43
    iput-object v2, v0, Ll/y6p0;->m:Ll/fko0;

    .line 44
    .line 45
    :cond_0
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 46
    .line 47
    .line 48
    move-result-object v2

    .line 49
    check-cast v2, Ll/rwn0;

    .line 50
    .line 51
    invoke-virtual {v2}, Ll/rwn0;->P2()Ll/hrk0;

    .line 52
    .line 53
    .line 54
    move-result-object v2

    .line 55
    move-object/from16 v6, p1

    .line 56
    .line 57
    iget-object v4, v6, Ll/nsv;->a:Ljava/lang/Object;

    .line 58
    .line 59
    check-cast v4, Lcom/p1/mobile/putong/data/User;

    .line 60
    .line 61
    iget-object v4, v4, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 62
    .line 63
    invoke-virtual {v2, v4}, Ll/hrk0;->l(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/data/BLiveVoiceCall;

    .line 64
    .line 65
    .line 66
    move-result-object v2

    .line 67
    if-eqz v2, :cond_1

    .line 68
    .line 69
    goto :goto_0

    .line 70
    :cond_1
    const/4 v3, 0x0

    .line 71
    :goto_0
    iget-object v4, v0, Ll/y6p0;->m:Ll/fko0;

    .line 72
    .line 73
    iget-object v5, v0, Ll/xzs;->f:Lcom/p1/mobile/android/app/Act;

    .line 74
    .line 75
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    check-cast v2, Ll/rwn0;

    .line 80
    .line 81
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v8

    .line 85
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 86
    .line 87
    .line 88
    move-result-object v2

    .line 89
    check-cast v2, Ll/rwn0;

    .line 90
    .line 91
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 92
    .line 93
    .line 94
    move-result-object v9

    .line 95
    invoke-virtual {v0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 96
    .line 97
    .line 98
    move-result-object v2

    .line 99
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 100
    .line 101
    .line 102
    move-result-wide v10

    .line 103
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 104
    .line 105
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    check-cast v2, Ll/rwn0;

    .line 110
    .line 111
    invoke-virtual {v2}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 116
    .line 117
    invoke-virtual {v1, v2}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 118
    .line 119
    .line 120
    move-result v12

    .line 121
    sget-object v1, Ll/zrv;->e:Landroid/app/Application;

    .line 122
    .line 123
    sget v2, Lcom/p1/mobile/putong/live/livingroom/R$string;->Li:I

    .line 124
    .line 125
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v13

    .line 129
    sget-object v1, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 130
    .line 131
    invoke-virtual {v1}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 132
    .line 133
    .line 134
    move-result v14

    .line 135
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    check-cast v0, Ll/rwn0;

    .line 140
    .line 141
    invoke-virtual {v0}, Ll/rwn0;->V2()Lcom/p1/mobile/putong/live/base/data/BLiveVoice;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iget-object v15, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->liveMode:Ljava/lang/String;

    .line 146
    .line 147
    move-object v7, v6

    .line 148
    move v6, v3

    .line 149
    invoke-virtual/range {v4 .. v15}, Ll/fko0;->p(Lcom/p1/mobile/android/app/Act;ZLl/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;ILjava/lang/String;)V

    .line 150
    .line 151
    .line 152
    return-void

    .line 153
    :cond_2
    invoke-virtual/range {p1 .. p1}, Ll/nsv;->h()Lcom/p1/mobile/putong/data/User;

    .line 154
    .line 155
    .line 156
    move-result-object v2

    .line 157
    iget-object v2, v2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 158
    .line 159
    invoke-virtual {v0, v2}, Ll/atm0;->i0(Ljava/lang/String;)Z

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    if-eqz v2, :cond_4

    .line 164
    .line 165
    sget-object v2, Ll/uqb0;->h0:Lcom/p1/mobile/putong/data/LiveRegionTag;

    .line 166
    .line 167
    invoke-static {v2, v4}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 168
    .line 169
    .line 170
    move-result v2

    .line 171
    if-eqz v2, :cond_3

    .line 172
    .line 173
    goto :goto_1

    .line 174
    :cond_3
    new-instance v1, Landroid/content/Intent;

    .line 175
    .line 176
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    const-class v4, Lcom/p1/mobile/putong/ui/webview/mk/MkWebViewAct;

    .line 181
    .line 182
    invoke-direct {v1, v2, v4}, Landroid/content/Intent;-><init>(Landroid/content/Context;Ljava/lang/Class;)V

    .line 183
    .line 184
    .line 185
    const-string v2, "url"

    .line 186
    .line 187
    sget-object v4, Ll/efv;->v:Ljava/lang/String;

    .line 188
    .line 189
    invoke-virtual {v1, v2, v4}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 190
    .line 191
    .line 192
    sget-object v2, Ll/zrv;->e:Landroid/app/Application;

    .line 193
    .line 194
    sget v4, Lcom/p1/mobile/putong/live/livingroom/R$string;->ac:I

    .line 195
    .line 196
    invoke-virtual {v2, v4}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 197
    .line 198
    .line 199
    move-result-object v2

    .line 200
    const-string v4, "title"

    .line 201
    .line 202
    invoke-virtual {v1, v4, v2}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Ljava/lang/String;)Landroid/content/Intent;

    .line 203
    .line 204
    .line 205
    const-string v2, "hideNavigationBar"

    .line 206
    .line 207
    invoke-virtual {v1, v2, v3}, Landroid/content/Intent;->putExtra(Ljava/lang/String;Z)Landroid/content/Intent;

    .line 208
    .line 209
    .line 210
    invoke-virtual {v0}, Ll/cyr;->C0()Landroid/content/Context;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    invoke-virtual {v2, v1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 215
    .line 216
    .line 217
    invoke-virtual {v0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 218
    .line 219
    .line 220
    move-result-object v0

    .line 221
    iget-object v0, v0, Lcom/tantan/live/eventbus/LiveEventBus;->OpenUserCardDialogEvent:Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;

    .line 222
    .line 223
    invoke-virtual {v0}, Lcom/tantan/live/eventbus/LiveEventBus$OpenUserCardDialogEvent;->dismiss()Ll/v3f$c;

    .line 224
    .line 225
    .line 226
    move-result-object v0

    .line 227
    invoke-virtual {v0}, Ll/v3f$c;->p()V

    .line 228
    .line 229
    .line 230
    return-void

    .line 231
    :cond_4
    :goto_1
    iget-object v2, v0, Ll/y6p0;->l:Ll/q1d0;

    .line 232
    .line 233
    if-nez v2, :cond_5

    .line 234
    .line 235
    new-instance v2, Ll/q1d0;

    .line 236
    .line 237
    invoke-direct {v2}, Ll/q1d0;-><init>()V

    .line 238
    .line 239
    .line 240
    iput-object v2, v0, Ll/y6p0;->l:Ll/q1d0;

    .line 241
    .line 242
    :cond_5
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 243
    .line 244
    .line 245
    move-result-object v2

    .line 246
    check-cast v2, Ll/rwn0;

    .line 247
    .line 248
    invoke-virtual {v2}, Ll/rwn0;->A0()Ljava/lang/String;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    const-string v3, "live"

    .line 253
    .line 254
    invoke-static {v3, v2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 255
    .line 256
    .line 257
    move-result v2

    .line 258
    if-eqz v2, :cond_6

    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->video:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 261
    .line 262
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 263
    .line 264
    .line 265
    move-result v2

    .line 266
    :goto_2
    move v13, v2

    .line 267
    goto :goto_3

    .line 268
    :cond_6
    sget-object v2, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->voice:Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;

    .line 269
    .line 270
    invoke-virtual {v2}, Lcom/p1/mobile/longlink/msg/livechat/LongLinkChatMessage$RoomType;->getNumber()I

    .line 271
    .line 272
    .line 273
    move-result v2

    .line 274
    goto :goto_2

    .line 275
    :goto_3
    iget-object v4, v0, Ll/y6p0;->l:Ll/q1d0;

    .line 276
    .line 277
    invoke-virtual {v0}, Ll/xzs;->act()Lcom/p1/mobile/android/app/Act;

    .line 278
    .line 279
    .line 280
    move-result-object v5

    .line 281
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    check-cast v2, Ll/rwn0;

    .line 286
    .line 287
    invoke-virtual {v2}, Ll/vp20;->k()Ljava/lang/String;

    .line 288
    .line 289
    .line 290
    move-result-object v7

    .line 291
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 292
    .line 293
    .line 294
    move-result-object v2

    .line 295
    check-cast v2, Ll/rwn0;

    .line 296
    .line 297
    invoke-virtual {v2}, Ll/vp20;->o()Ljava/lang/String;

    .line 298
    .line 299
    .line 300
    move-result-object v8

    .line 301
    invoke-virtual {v0}, Ll/atm0;->g4()Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;

    .line 302
    .line 303
    .line 304
    move-result-object v2

    .line 305
    invoke-virtual {v2}, Lcom/p1/mobile/putong/live/livingroom/common/usercard/bean/UserCardData;->getMessageId()J

    .line 306
    .line 307
    .line 308
    move-result-wide v9

    .line 309
    iget-object v1, v1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 310
    .line 311
    invoke-virtual {v0}, Ll/xzs;->E2()Ll/oo2;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Ll/rwn0;

    .line 316
    .line 317
    invoke-virtual {v0}, Ll/oo2;->l0()Lcom/p1/mobile/putong/data/User;

    .line 318
    .line 319
    .line 320
    move-result-object v0

    .line 321
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 322
    .line 323
    invoke-virtual {v1, v0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 324
    .line 325
    .line 326
    move-result v11

    .line 327
    invoke-static {}, Ll/zrv;->k()Ll/vwt;

    .line 328
    .line 329
    .line 330
    move-result-object v0

    .line 331
    invoke-virtual {v0}, Ll/vwt;->j5()Ljava/lang/String;

    .line 332
    .line 333
    .line 334
    move-result-object v12

    .line 335
    move-object/from16 v6, p1

    .line 336
    .line 337
    invoke-virtual/range {v4 .. v13}, Ll/q1d0;->q(Lcom/p1/mobile/android/app/Act;Ll/nsv;Ljava/lang/String;Ljava/lang/String;JZLjava/lang/String;I)V

    .line 338
    .line 339
    .line 340
    return-void
.end method

.method public r4()V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/xzs;->F2()Lcom/tantan/live/eventbus/LiveEventBus;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    iget-object p0, p0, Lcom/tantan/live/eventbus/LiveEventBus;->VoiceUserCardEvent:Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;

    .line 6
    .line 7
    invoke-virtual {p0}, Lcom/tantan/live/eventbus/LiveEventBus$VoiceUserCardEvent;->openManageDialog()Ll/v3f$c;

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
