.class public Ll/ltc0;
.super Ll/ar2;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/Signature;
    value = {
        "Ll/ar2<",
        "Ll/ztc0;",
        ">;"
    }
.end annotation


# instance fields
.field public a:Lcom/p1/mobile/putong/core/data/Message;

.field public b:Ljava/lang/String;

.field public c:Ljava/lang/String;

.field public d:Ll/l4g0;


# direct methods
.method public constructor <init>(Ll/ner;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ar2;-><init>(Ll/ner;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic e0(Ll/ltc0;Ll/pf60;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ltc0;->s0(Ll/pf60;)V

    return-void
.end method

.method public static synthetic f0(Ll/ltc0;ZLcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ltc0;->z0(ZLcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method

.method public static synthetic g0(Ll/ltc0;ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/ltc0;->A0(ZLjava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic h0(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ltc0;->y0(Lcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method

.method public static synthetic i0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    return-void
.end method

.method public static synthetic j0(Ll/ltc0;Lcom/p1/mobile/android/app/c;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ltc0;->u0(Lcom/p1/mobile/android/app/c;)V

    return-void
.end method

.method public static synthetic k0(Ll/ltc0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ltc0;->t0(Ljava/lang/Throwable;)V

    return-void
.end method

.method public static synthetic l0(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ltc0;->C0(Lcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method

.method public static synthetic m0(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/ltc0;->D0(Lcom/p1/mobile/putong/core/data/RedPacket;)V

    return-void
.end method

.method public static synthetic n0(Ll/ltc0;Landroid/os/Bundle;)V
    .locals 0

    .line 1
    invoke-direct {p0, p1}, Ll/ltc0;->x0(Landroid/os/Bundle;)V

    return-void
.end method

.method public static synthetic o0(Ll/ltc0;)Ll/iam;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    return-object p0
.end method

.method private synthetic x0(Landroid/os/Bundle;)V
    .locals 0

    .line 1
    iget-object p1, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p1, Ll/ztc0;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ltc0;->c:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {p1, p0}, Ll/ztc0;->A3(Ljava/lang/String;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public final synthetic A0(ZLjava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 2
    .line 3
    .line 4
    move-result-object p2

    .line 5
    invoke-virtual {p2}, Lcom/p1/mobile/android/app/Act;->progressDismiss()V

    .line 6
    .line 7
    .line 8
    if-eqz p1, :cond_0

    .line 9
    .line 10
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->finish()V

    .line 15
    .line 16
    .line 17
    :cond_0
    return-void
.end method

.method public final synthetic C0(Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ltc0;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/x;->x3(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/RedPacket;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic D0(Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 1

    .line 1
    new-instance v0, Ll/ktc0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p1}, Ll/ktc0;-><init>(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public E0(Lcom/p1/mobile/putong/core/data/RedPacket;Z)V
    .locals 21

    .line 1
    move-object/from16 v0, p0

    .line 2
    .line 3
    move-object/from16 v1, p1

    .line 4
    .line 5
    iget-object v2, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 6
    .line 7
    check-cast v2, Ll/ztc0;

    .line 8
    .line 9
    invoke-virtual {v2}, Ll/ztc0;->A()Z

    .line 10
    .line 11
    .line 12
    move-result v2

    .line 13
    if-eqz v2, :cond_0

    .line 14
    .line 15
    iget-object v2, v0, Ll/ltc0;->d:Ll/l4g0;

    .line 16
    .line 17
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result v2

    .line 21
    if-eqz v2, :cond_0

    .line 22
    .line 23
    iget-object v2, v0, Ll/ltc0;->d:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {v2}, Ll/l4g0;->k()V

    .line 26
    .line 27
    .line 28
    :cond_0
    new-instance v2, Ll/l4g0;

    .line 29
    .line 30
    new-instance v3, Ll/ltc0$a;

    .line 31
    .line 32
    invoke-direct {v3, v0}, Ll/ltc0$a;-><init>(Ll/ltc0;)V

    .line 33
    .line 34
    .line 35
    const-class v4, Lcom/p1/mobile/putong/core/ui/messages/redpacket/RedPacketRecordAct;

    .line 36
    .line 37
    invoke-virtual {v4}, Ljava/lang/Class;->getName()Ljava/lang/String;

    .line 38
    .line 39
    .line 40
    move-result-object v4

    .line 41
    invoke-direct {v2, v3, v4}, Ll/l4g0;-><init>(Ll/ur2;Ljava/lang/String;)V

    .line 42
    .line 43
    .line 44
    iput-object v2, v0, Ll/ltc0;->d:Ll/l4g0;

    .line 45
    .line 46
    iget-object v2, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 47
    .line 48
    check-cast v2, Ll/ztc0;

    .line 49
    .line 50
    invoke-virtual {v2}, Ll/ztc0;->A()Z

    .line 51
    .line 52
    .line 53
    move-result v2

    .line 54
    iget-object v3, v0, Ll/ltc0;->d:Ll/l4g0;

    .line 55
    .line 56
    const-string v4, "effective"

    .line 57
    .line 58
    const-string v5, "overdue"

    .line 59
    .line 60
    const-wide/16 v6, 0x3e8

    .line 61
    .line 62
    const-string v8, "red_packet_state"

    .line 63
    .line 64
    const-string v9, "red_packet_over"

    .line 65
    .line 66
    const-string v10, "groupchat_id"

    .line 67
    .line 68
    const-string v11, "1"

    .line 69
    .line 70
    const-string v12, "0"

    .line 71
    .line 72
    if-eqz v2, :cond_5

    .line 73
    .line 74
    iget-object v2, v0, Ll/ltc0;->c:Ljava/lang/String;

    .line 75
    .line 76
    invoke-static {v10, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 77
    .line 78
    .line 79
    move-result-object v13

    .line 80
    const-string v2, "red_packet_amount"

    .line 81
    .line 82
    iget-object v10, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 83
    .line 84
    invoke-static {v2, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 85
    .line 86
    .line 87
    move-result-object v14

    .line 88
    const-string v2, "red_packet_id"

    .line 89
    .line 90
    iget-object v10, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 91
    .line 92
    invoke-static {v2, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 93
    .line 94
    .line 95
    move-result-object v15

    .line 96
    iget v2, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 97
    .line 98
    iget v10, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 99
    .line 100
    if-le v2, v10, :cond_1

    .line 101
    .line 102
    move-object v2, v12

    .line 103
    goto :goto_0

    .line 104
    :cond_1
    move-object v2, v11

    .line 105
    :goto_0
    invoke-static {v9, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 106
    .line 107
    .line 108
    move-result-object v16

    .line 109
    new-instance v2, Ljava/lang/StringBuilder;

    .line 110
    .line 111
    invoke-direct {v2}, Ljava/lang/StringBuilder;-><init>()V

    .line 112
    .line 113
    .line 114
    iget v9, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 115
    .line 116
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 117
    .line 118
    .line 119
    const-string v9, ""

    .line 120
    .line 121
    invoke-virtual {v2, v9}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 122
    .line 123
    .line 124
    invoke-virtual {v2}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    const-string v9, "red_packet_quantity"

    .line 129
    .line 130
    invoke-static {v9, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 131
    .line 132
    .line 133
    move-result-object v17

    .line 134
    iget-wide v9, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 135
    .line 136
    mul-long/2addr v9, v6

    .line 137
    sget-object v2, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 138
    .line 139
    invoke-virtual {v2}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 140
    .line 141
    .line 142
    move-result-wide v6

    .line 143
    cmp-long v2, v9, v6

    .line 144
    .line 145
    if-gez v2, :cond_2

    .line 146
    .line 147
    move-object v4, v5

    .line 148
    :cond_2
    invoke-static {v8, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 149
    .line 150
    .line 151
    move-result-object v18

    .line 152
    iget-object v2, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 153
    .line 154
    const-string v4, "random"

    .line 155
    .line 156
    invoke-static {v2, v4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 157
    .line 158
    .line 159
    move-result v2

    .line 160
    if-eqz v2, :cond_3

    .line 161
    .line 162
    const-string v2, "luck_red_packet"

    .line 163
    .line 164
    goto :goto_1

    .line 165
    :cond_3
    const-string v2, "normal_red_packet"

    .line 166
    .line 167
    :goto_1
    const-string v4, "red_packet_type"

    .line 168
    .line 169
    invoke-static {v4, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 170
    .line 171
    .line 172
    move-result-object v19

    .line 173
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 174
    .line 175
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->amount:Ljava/lang/String;

    .line 176
    .line 177
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    if-eqz v1, :cond_4

    .line 182
    .line 183
    move-object v11, v12

    .line 184
    :cond_4
    const-string v1, "user_get_red_packet"

    .line 185
    .line 186
    invoke-static {v1, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 187
    .line 188
    .line 189
    move-result-object v20

    .line 190
    filled-new-array/range {v13 .. v20}, [Ll/pf60;

    .line 191
    .line 192
    .line 193
    move-result-object v1

    .line 194
    invoke-virtual {v3, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 195
    .line 196
    .line 197
    goto :goto_2

    .line 198
    :cond_5
    iget-object v2, v0, Ll/ltc0;->c:Ljava/lang/String;

    .line 199
    .line 200
    invoke-static {v10, v2}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    iget-object v10, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 205
    .line 206
    iget-object v10, v10, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->ownerId:Ljava/lang/String;

    .line 207
    .line 208
    const-string v13, "actor_user_id"

    .line 209
    .line 210
    invoke-static {v13, v10}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 211
    .line 212
    .line 213
    move-result-object v10

    .line 214
    iget v13, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 215
    .line 216
    iget v14, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 217
    .line 218
    if-le v13, v14, :cond_6

    .line 219
    .line 220
    move-object v11, v12

    .line 221
    :cond_6
    invoke-static {v9, v11}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 222
    .line 223
    .line 224
    move-result-object v9

    .line 225
    iget-wide v11, v1, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 226
    .line 227
    mul-long/2addr v11, v6

    .line 228
    sget-object v1, Ll/uqb0;->H:Lcom/p1/mobile/putong/api/api/Network;

    .line 229
    .line 230
    invoke-virtual {v1}, Lcom/p1/mobile/putong/api/api/Network;->guessedCurrentServerTime()J

    .line 231
    .line 232
    .line 233
    move-result-wide v6

    .line 234
    cmp-long v1, v11, v6

    .line 235
    .line 236
    if-gez v1, :cond_7

    .line 237
    .line 238
    move-object v4, v5

    .line 239
    :cond_7
    invoke-static {v8, v4}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    filled-new-array {v2, v10, v9, v1}, [Ll/pf60;

    .line 244
    .line 245
    .line 246
    move-result-object v1

    .line 247
    invoke-virtual {v3, v1}, Ll/l4g0;->p([Ll/pf60;)V

    .line 248
    .line 249
    .line 250
    :goto_2
    iget-object v1, v0, Ll/ltc0;->d:Ll/l4g0;

    .line 251
    .line 252
    invoke-virtual {v1}, Ll/l4g0;->i()V

    .line 253
    .line 254
    .line 255
    iget-object v1, v0, Ll/ar2;->viewModel:Ll/iam;

    .line 256
    .line 257
    check-cast v1, Ll/ztc0;

    .line 258
    .line 259
    invoke-virtual {v1}, Ll/ztc0;->A()Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    if-eqz v1, :cond_8

    .line 264
    .line 265
    if-eqz p2, :cond_8

    .line 266
    .line 267
    iget-object v0, v0, Ll/ltc0;->d:Ll/l4g0;

    .line 268
    .line 269
    invoke-virtual {v0}, Ll/l4g0;->l()V

    .line 270
    .line 271
    .line 272
    :cond_8
    return-void
.end method

.method public F0(Z)V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ltc0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/x;->t3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/ctc0;

    .line 16
    .line 17
    invoke-direct {v1, p0, p1}, Ll/ctc0;-><init>(Ll/ltc0;Z)V

    .line 18
    .line 19
    .line 20
    new-instance v2, Ll/dtc0;

    .line 21
    .line 22
    invoke-direct {v2, p0, p1}, Ll/dtc0;-><init>(Ll/ltc0;Z)V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public G0()V
    .locals 2

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 4
    .line 5
    iget-object v1, p0, Ll/ltc0;->b:Ljava/lang/String;

    .line 6
    .line 7
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/core/api/x;->t3(Ljava/lang/String;)Lrx/c;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 12
    .line 13
    .line 14
    move-result-object v0

    .line 15
    new-instance v1, Ll/gtc0;

    .line 16
    .line 17
    invoke-direct {v1, p0}, Ll/gtc0;-><init>(Ll/ltc0;)V

    .line 18
    .line 19
    .line 20
    new-instance p0, Ll/htc0;

    .line 21
    .line 22
    invoke-direct {p0}, Ll/htc0;-><init>()V

    .line 23
    .line 24
    .line 25
    invoke-static {v1, p0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 26
    .line 27
    .line 28
    move-result-object p0

    .line 29
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 30
    .line 31
    .line 32
    return-void
.end method

.method public a0()V
    .locals 1

    .line 1
    new-instance v0, Ll/btc0;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/btc0;-><init>(Ll/ltc0;)V

    .line 4
    .line 5
    .line 6
    invoke-virtual {p0, v0}, Ll/ar2;->creates(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public destroy()V
    .locals 0

    .line 1
    return-void
.end method

.method public p0()V
    .locals 3

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->H0:Ll/lqb;

    .line 4
    .line 5
    new-instance v1, Lcom/alipay/sdk/app/AuthTask;

    .line 6
    .line 7
    invoke-virtual {p0}, Ll/ar2;->act()Lcom/p1/mobile/android/app/Act;

    .line 8
    .line 9
    .line 10
    move-result-object v2

    .line 11
    invoke-direct {v1, v2}, Lcom/alipay/sdk/app/AuthTask;-><init>(Landroid/app/Activity;)V

    .line 12
    .line 13
    .line 14
    invoke-virtual {v0, v1}, Ll/lqb;->k4(Lcom/alipay/sdk/app/AuthTask;)Lrx/c;

    .line 15
    .line 16
    .line 17
    move-result-object v0

    .line 18
    invoke-virtual {p0, v0}, Ll/ar2;->duringCreated(Lrx/c;)Lrx/c;

    .line 19
    .line 20
    .line 21
    move-result-object v0

    .line 22
    new-instance v1, Ll/itc0;

    .line 23
    .line 24
    invoke-direct {v1, p0}, Ll/itc0;-><init>(Ll/ltc0;)V

    .line 25
    .line 26
    .line 27
    new-instance v2, Ll/jtc0;

    .line 28
    .line 29
    invoke-direct {v2, p0}, Ll/jtc0;-><init>(Ll/ltc0;)V

    .line 30
    .line 31
    .line 32
    invoke-static {v1, v2}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 33
    .line 34
    .line 35
    move-result-object p0

    .line 36
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 37
    .line 38
    .line 39
    return-void
.end method

.method public pageId()Ljava/lang/String;
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ztc0;

    .line 4
    .line 5
    invoke-virtual {p0}, Ll/ztc0;->A()Z

    .line 6
    .line 7
    .line 8
    move-result p0

    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const-string p0, "p_red_packet_detail"

    .line 12
    .line 13
    return-object p0

    .line 14
    :cond_0
    const-string p0, "p_red_packet_loading"

    .line 15
    .line 16
    return-object p0
.end method

.method public q0(Lcom/p1/mobile/putong/core/data/Message;Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    iput-object p1, p0, Ll/ltc0;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 2
    .line 3
    iput-object p2, p0, Ll/ltc0;->b:Ljava/lang/String;

    .line 4
    .line 5
    iput-object p3, p0, Ll/ltc0;->c:Ljava/lang/String;

    .line 6
    .line 7
    return-void
.end method

.method public r0()V
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/ar2;->lifecycle()Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object v0

    .line 5
    new-instance v1, Ll/ftc0;

    .line 6
    .line 7
    invoke-direct {v1, p0}, Ll/ftc0;-><init>(Ll/ltc0;)V

    .line 8
    .line 9
    .line 10
    invoke-static {v1}, Ll/psd0;->G(Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 11
    .line 12
    .line 13
    move-result-object p0

    .line 14
    invoke-virtual {v0, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 15
    .line 16
    .line 17
    return-void
.end method

.method public final synthetic s0(Ll/pf60;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ztc0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ztc0;->w(Ll/pf60;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic t0(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 2
    .line 3
    check-cast p0, Ll/ztc0;

    .line 4
    .line 5
    invoke-virtual {p0, p1}, Ll/ztc0;->v(Ljava/lang/Throwable;)V

    .line 6
    .line 7
    .line 8
    return-void
.end method

.method public final synthetic u0(Lcom/p1/mobile/android/app/c;)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/ltc0;->d:Ll/l4g0;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->b(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_1

    .line 8
    .line 9
    sget-object v0, Lcom/p1/mobile/android/app/c;->i:Lcom/p1/mobile/android/app/c;

    .line 10
    .line 11
    if-ne p1, v0, :cond_0

    .line 12
    .line 13
    iget-object p0, p0, Ll/ltc0;->d:Ll/l4g0;

    .line 14
    .line 15
    invoke-virtual {p0}, Ll/l4g0;->l()V

    .line 16
    .line 17
    .line 18
    return-void

    .line 19
    :cond_0
    sget-object v0, Lcom/p1/mobile/android/app/c;->j:Lcom/p1/mobile/android/app/c;

    .line 20
    .line 21
    if-ne p1, v0, :cond_1

    .line 22
    .line 23
    iget-object p0, p0, Ll/ltc0;->d:Ll/l4g0;

    .line 24
    .line 25
    invoke-virtual {p0}, Ll/l4g0;->k()V

    .line 26
    .line 27
    .line 28
    :cond_1
    return-void
.end method

.method public final synthetic y0(Lcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 1

    .line 1
    sget-object v0, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 2
    .line 3
    iget-object v0, v0, Lcom/p1/mobile/putong/core/api/c;->d1:Lcom/p1/mobile/putong/core/api/x;

    .line 4
    .line 5
    iget-object p0, p0, Ll/ltc0;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 6
    .line 7
    invoke-virtual {v0, p0, p1}, Lcom/p1/mobile/putong/core/api/x;->x3(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/RedPacket;)V

    .line 8
    .line 9
    .line 10
    return-void
.end method

.method public final synthetic z0(ZLcom/p1/mobile/putong/core/data/RedPacket;)V
    .locals 2

    .line 1
    new-instance v0, Ll/etc0;

    .line 2
    .line 3
    invoke-direct {v0, p0, p2}, Ll/etc0;-><init>(Ll/ltc0;Lcom/p1/mobile/putong/core/data/RedPacket;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Ll/l51;->y(Ljava/lang/Runnable;)V

    .line 7
    .line 8
    .line 9
    iget-object v0, p0, Ll/ar2;->viewModel:Ll/iam;

    .line 10
    .line 11
    if-eqz p1, :cond_0

    .line 12
    .line 13
    check-cast v0, Ll/ztc0;

    .line 14
    .line 15
    iget-object p1, p0, Ll/ltc0;->a:Lcom/p1/mobile/putong/core/data/Message;

    .line 16
    .line 17
    iget-object p0, p0, Ll/ltc0;->b:Ljava/lang/String;

    .line 18
    .line 19
    invoke-virtual {v0, p1, p2, p0}, Ll/ztc0;->z(Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/core/data/RedPacket;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    check-cast v0, Ll/ztc0;

    .line 24
    .line 25
    iget-object p0, p0, Ll/ltc0;->b:Ljava/lang/String;

    .line 26
    .line 27
    const/4 p1, 0x0

    .line 28
    const/4 v1, 0x1

    .line 29
    invoke-virtual {v0, p0, p1, p2, v1}, Ll/ztc0;->S(Ljava/lang/String;ZLcom/p1/mobile/putong/core/data/RedPacket;Z)V

    .line 30
    .line 31
    .line 32
    return-void
.end method
