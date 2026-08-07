.class public Ll/f3n0;
.super Ljava/lang/Object;
.source "SourceFile"


# instance fields
.field public final a:Ll/u1n0;

.field public b:Ljava/lang/Object;

.field public c:Ll/kcg0;


# direct methods
.method public constructor <init>(Ll/u1n0;)V
    .locals 0

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    iput-object p1, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 5
    .line 6
    invoke-virtual {p0}, Ll/f3n0;->i()V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static synthetic a(Ll/f3n0;I)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3n0;->h(I)V

    return-void
.end method

.method public static synthetic b(Ll/f3n0;ZLjava/lang/Long;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1, p2}, Ll/f3n0;->l(ZLjava/lang/Long;)V

    return-void
.end method

.method public static synthetic c(Ll/f3n0;Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3n0;->j(Lcom/p1/mobile/putong/data/Envelope;)V

    return-void
.end method

.method public static synthetic d(Ll/f3n0;Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    invoke-virtual {p0, p1}, Ll/f3n0;->k(Ljava/lang/Throwable;)V

    return-void
.end method


# virtual methods
.method public e()Z
    .locals 2

    .line 1
    invoke-virtual {p0}, Ll/f3n0;->f()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-nez v0, :cond_0

    .line 6
    .line 7
    invoke-static {}, Ll/pb1;->b()Ll/pb1;

    .line 8
    .line 9
    .line 10
    move-result-object p0

    .line 11
    sget-object v0, Ll/xzm0;->h:Ljava/lang/String;

    .line 12
    .line 13
    invoke-virtual {p0, v0}, Ll/pb1;->e(Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    const/4 p0, 0x0

    .line 17
    return p0

    .line 18
    :cond_0
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 19
    .line 20
    const-string v1, "accepted"

    .line 21
    .line 22
    invoke-virtual {v0, v1}, Ll/u1n0;->q(Ljava/lang/String;)V

    .line 23
    .line 24
    .line 25
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 26
    .line 27
    const/4 v0, 0x2

    .line 28
    invoke-virtual {p0, v0}, Ll/u1n0;->u(I)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x1

    .line 32
    return p0
.end method

.method public final f()Z
    .locals 1

    .line 1
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 6
    .line 7
    .line 8
    move-result-object p0

    .line 9
    const v0, 0x186ab

    .line 10
    .line 11
    .line 12
    invoke-interface {p0, v0}, Ll/r97;->C(I)Z

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    const/4 v0, 0x0

    .line 17
    if-nez p0, :cond_0

    .line 18
    .line 19
    return v0

    .line 20
    :cond_0
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->Q()Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;

    .line 21
    .line 22
    .line 23
    move-result-object p0

    .line 24
    invoke-interface {p0}, Lcom/p1/mobile/putong/live_api/api/serviceprovider/api/LiveService;->Zo()Ll/nam;

    .line 25
    .line 26
    .line 27
    move-result-object p0

    .line 28
    invoke-interface {p0}, Ll/nam;->b()Z

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    if-eqz p0, :cond_1

    .line 33
    .line 34
    const-string p0, "\u5f53\u524d\u6b63\u5728\u8bed\u804a\u4e2d\uff0c\u65e0\u6cd5\u8bed\u97f3\u7535\u8bdd"

    .line 35
    .line 36
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return v0

    .line 40
    :cond_1
    sget-object p0, Lcom/p1/mobile/putong/core/CoreModule;->b:Landroid/app/Application;

    .line 41
    .line 42
    invoke-static {p0}, Lcom/p1/mobile/putong/api/api/Network;->isConnected(Landroid/content/Context;)Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    if-nez p0, :cond_2

    .line 47
    .line 48
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->B2:I

    .line 49
    .line 50
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 51
    .line 52
    .line 53
    return v0

    .line 54
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    invoke-virtual {p0}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 59
    .line 60
    .line 61
    move-result-object p0

    .line 62
    invoke-interface {p0}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->of()Z

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    if-eqz p0, :cond_3

    .line 67
    .line 68
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C3:I

    .line 69
    .line 70
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 71
    .line 72
    .line 73
    return v0

    .line 74
    :cond_3
    invoke-static {}, Ll/jpd0;->c()Z

    .line 75
    .line 76
    .line 77
    move-result p0

    .line 78
    if-nez p0, :cond_4

    .line 79
    .line 80
    invoke-static {}, Ll/jpd0;->d()V

    .line 81
    .line 82
    .line 83
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->l7:I

    .line 84
    .line 85
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 86
    .line 87
    .line 88
    return v0

    .line 89
    :cond_4
    const/4 p0, 0x1

    .line 90
    return p0
.end method

.method public g(Lcom/p1/mobile/putong/core/data/VoiceCallStatus;Lcom/p1/mobile/putong/data/PushMessageCustom;)V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->n()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const-string v1, "busy"

    .line 8
    .line 9
    const-string v2, "calling"

    .line 10
    .line 11
    if-eqz v0, :cond_1

    .line 12
    .line 13
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-eqz v0, :cond_0

    .line 18
    .line 19
    invoke-static {}, Ll/w1n0;->e()Z

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    if-eqz v0, :cond_0

    .line 24
    .line 25
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    const-string v0, "calleeSystemCalling"

    .line 30
    .line 31
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 32
    .line 33
    .line 34
    move-result-object v2

    .line 35
    invoke-virtual {p1, v0, v2}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 36
    .line 37
    .line 38
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 39
    .line 40
    invoke-virtual {p0}, Ll/u1n0;->f()Ll/azm0;

    .line 41
    .line 42
    .line 43
    move-result-object p0

    .line 44
    iget-object p0, p0, Ll/azm0;->m:Ljava/lang/String;

    .line 45
    .line 46
    invoke-static {p2, v1, p0}, Ll/avm0;->g(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V

    .line 47
    .line 48
    .line 49
    return-void

    .line 50
    :cond_0
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    invoke-virtual {p0, p2, p1}, Ll/f3n0;->m(Lcom/p1/mobile/putong/data/PushMessageCustom;Lcom/p1/mobile/putong/core/data/VoiceCallStatus;)V

    .line 54
    .line 55
    .line 56
    return-void

    .line 57
    :cond_1
    iget-object v0, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->caller:Ljava/lang/String;

    .line 58
    .line 59
    iget-object v3, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 60
    .line 61
    invoke-virtual {v3}, Ll/u1n0;->f()Ll/azm0;

    .line 62
    .line 63
    .line 64
    move-result-object v3

    .line 65
    iget-object v3, v3, Ll/azm0;->a:Ljava/lang/String;

    .line 66
    .line 67
    invoke-static {v0, v3}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    if-nez v0, :cond_3

    .line 72
    .line 73
    new-instance v0, Ljava/lang/StringBuilder;

    .line 74
    .line 75
    invoke-direct {v0}, Ljava/lang/StringBuilder;-><init>()V

    .line 76
    .line 77
    .line 78
    iget-object v3, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 79
    .line 80
    invoke-virtual {v3}, Ll/u1n0;->f()Ll/azm0;

    .line 81
    .line 82
    .line 83
    move-result-object v3

    .line 84
    invoke-virtual {v3}, Ll/azm0;->toString()Ljava/lang/String;

    .line 85
    .line 86
    .line 87
    move-result-object v3

    .line 88
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 89
    .line 90
    .line 91
    const-string v3, "currentState:"

    .line 92
    .line 93
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 94
    .line 95
    .line 96
    iget-object v3, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 97
    .line 98
    invoke-virtual {v3}, Ll/u1n0;->i()I

    .line 99
    .line 100
    .line 101
    move-result v3

    .line 102
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;

    .line 103
    .line 104
    .line 105
    const-string v3, "messageDetail:"

    .line 106
    .line 107
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 108
    .line 109
    .line 110
    invoke-virtual {p2}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v3

    .line 114
    invoke-virtual {v0, v3}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 115
    .line 116
    .line 117
    invoke-static {p1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 118
    .line 119
    .line 120
    move-result p1

    .line 121
    if-eqz p1, :cond_2

    .line 122
    .line 123
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    const-string v2, "RepeatCallingPush"

    .line 128
    .line 129
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v0

    .line 133
    invoke-virtual {p1, v2, v0}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 134
    .line 135
    .line 136
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 137
    .line 138
    invoke-virtual {p0}, Ll/u1n0;->f()Ll/azm0;

    .line 139
    .line 140
    .line 141
    move-result-object p0

    .line 142
    iget-object p0, p0, Ll/azm0;->m:Ljava/lang/String;

    .line 143
    .line 144
    invoke-static {p2, v1, p0}, Ll/avm0;->g(Lcom/p1/mobile/putong/data/PushMessageCustom;Ljava/lang/String;Ljava/lang/String;)V

    .line 145
    .line 146
    .line 147
    return-void

    .line 148
    :cond_2
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 149
    .line 150
    .line 151
    move-result-object p0

    .line 152
    const-string p1, "RepeatErrorCallPush"

    .line 153
    .line 154
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object p2

    .line 158
    invoke-virtual {p0, p1, p2}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_3
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    const-string v1, "CalleeStatusExchange"

    .line 167
    .line 168
    invoke-virtual {p2}, Lcom/google/protobuf/nano/MessageNano;->toString()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v0, v1, v2}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 173
    .line 174
    .line 175
    invoke-static {p1}, Ljava/util/Objects;->toString(Ljava/lang/Object;)Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    invoke-virtual {v0}, Ljava/lang/Object;->getClass()Ljava/lang/Class;

    .line 183
    .line 184
    .line 185
    invoke-virtual {v0}, Ljava/lang/String;->hashCode()I

    .line 186
    .line 187
    .line 188
    move-result v1

    .line 189
    const/4 v2, -0x1

    .line 190
    sparse-switch v1, :sswitch_data_0

    .line 191
    .line 192
    .line 193
    goto :goto_0

    .line 194
    :sswitch_0
    const-string v1, "notAnswered"

    .line 195
    .line 196
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    if-nez v0, :cond_4

    .line 201
    .line 202
    goto :goto_0

    .line 203
    :cond_4
    const/4 v2, 0x4

    .line 204
    goto :goto_0

    .line 205
    :sswitch_1
    const-string v1, "canceled"

    .line 206
    .line 207
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 208
    .line 209
    .line 210
    move-result v0

    .line 211
    if-nez v0, :cond_5

    .line 212
    .line 213
    goto :goto_0

    .line 214
    :cond_5
    const/4 v2, 0x3

    .line 215
    goto :goto_0

    .line 216
    :sswitch_2
    const-string v1, "rejected"

    .line 217
    .line 218
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    if-nez v0, :cond_6

    .line 223
    .line 224
    goto :goto_0

    .line 225
    :cond_6
    const/4 v2, 0x2

    .line 226
    goto :goto_0

    .line 227
    :sswitch_3
    const-string v1, "finished"

    .line 228
    .line 229
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    if-nez v0, :cond_7

    .line 234
    .line 235
    goto :goto_0

    .line 236
    :cond_7
    const/4 v2, 0x1

    .line 237
    goto :goto_0

    .line 238
    :sswitch_4
    const-string v1, "accepted"

    .line 239
    .line 240
    invoke-virtual {v0, v1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    if-nez v0, :cond_8

    .line 245
    .line 246
    goto :goto_0

    .line 247
    :cond_8
    const/4 v2, 0x0

    .line 248
    :goto_0
    packed-switch v2, :pswitch_data_0

    .line 249
    .line 250
    .line 251
    goto :goto_1

    .line 252
    :pswitch_0
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 253
    .line 254
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnum;->toString()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    invoke-virtual {p0, p1}, Ll/u1n0;->e(Ljava/lang/String;)V

    .line 259
    .line 260
    .line 261
    return-void

    .line 262
    :pswitch_1
    iget-object p1, p2, Lcom/p1/mobile/putong/data/PushMessageCustom;->calleeDeviceId:Ljava/lang/String;

    .line 263
    .line 264
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 265
    .line 266
    .line 267
    move-result-object p2

    .line 268
    iget-object p2, p2, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 269
    .line 270
    invoke-static {p1, p2}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 271
    .line 272
    .line 273
    move-result p1

    .line 274
    if-nez p1, :cond_9

    .line 275
    .line 276
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 277
    .line 278
    invoke-virtual {p0}, Ll/u1n0;->r()V

    .line 279
    .line 280
    .line 281
    :cond_9
    :goto_1
    return-void

    .line 282
    nop

    .line 283
    :sswitch_data_0
    .sparse-switch
        -0x7ff16059 -> :sswitch_4
        -0x28273f8e -> :sswitch_3
        -0x2444eb82 -> :sswitch_2
        -0x7577b67 -> :sswitch_1
        -0x4cd1f30 -> :sswitch_0
    .end sparse-switch

    .line 284
    .line 285
    .line 286
    .line 287
    .line 288
    .line 289
    .line 290
    .line 291
    .line 292
    .line 293
    .line 294
    .line 295
    .line 296
    .line 297
    .line 298
    .line 299
    .line 300
    .line 301
    .line 302
    .line 303
    .line 304
    .line 305
    :pswitch_data_0
    .packed-switch 0x0
        :pswitch_1
        :pswitch_0
        :pswitch_0
        :pswitch_0
        :pswitch_0
    .end packed-switch
.end method

.method public final h(I)V
    .locals 1

    .line 1
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->o()Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    const/4 v0, 0x1

    .line 11
    if-eq p1, v0, :cond_2

    .line 12
    .line 13
    const/4 v0, 0x3

    .line 14
    if-eq p1, v0, :cond_1

    .line 15
    .line 16
    :goto_0
    return-void

    .line 17
    :cond_1
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 18
    .line 19
    const/16 p1, 0x1f4

    .line 20
    .line 21
    invoke-virtual {p0, p1}, Ll/u1n0;->s(I)V

    .line 22
    .line 23
    .line 24
    return-void

    .line 25
    :cond_2
    invoke-virtual {p0}, Ll/f3n0;->n()V

    .line 26
    .line 27
    .line 28
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    new-instance v1, Ll/b3n0;

    .line 4
    .line 5
    invoke-direct {v1, p0}, Ll/b3n0;-><init>(Ll/f3n0;)V

    .line 6
    .line 7
    .line 8
    const-string v2, "calleeHelper"

    .line 9
    .line 10
    invoke-virtual {v0, v2, v1}, Ll/u1n0;->t(Ljava/lang/String;Ll/y20;)Ll/kcg0;

    .line 11
    .line 12
    .line 13
    move-result-object v0

    .line 14
    iput-object v0, p0, Ll/f3n0;->b:Ljava/lang/Object;

    .line 15
    .line 16
    return-void
.end method

.method public final synthetic j(Lcom/p1/mobile/putong/data/Envelope;)V
    .locals 2

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Envelope;->meta:Lcom/p1/mobile/putong/data/Meta;

    .line 2
    .line 3
    iget v0, v0, Lcom/p1/mobile/putong/data/Meta;->code:I

    .line 4
    .line 5
    const/16 v1, 0xc8

    .line 6
    .line 7
    if-ne v0, v1, :cond_3

    .line 8
    .line 9
    const-class v0, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 10
    .line 11
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 12
    .line 13
    .line 14
    move-result-object v1

    .line 15
    check-cast v1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 16
    .line 17
    iget-object v1, v1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 18
    .line 19
    invoke-static {v1}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 20
    .line 21
    .line 22
    move-result v1

    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    goto :goto_1

    .line 26
    :cond_0
    invoke-virtual {p1, v0}, Lcom/p1/mobile/putong/data/Envelope;->getModuleData(Ljava/lang/Class;)Lcom/tantanapp/common/data/BaseData;

    .line 27
    .line 28
    .line 29
    move-result-object p1

    .line 30
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreData;

    .line 31
    .line 32
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/CoreData;->voiceCall:Ljava/util/List;

    .line 33
    .line 34
    const/4 v0, 0x0

    .line 35
    invoke-interface {p1, v0}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    check-cast p1, Lcom/p1/mobile/putong/core/data/VoiceCall;

    .line 40
    .line 41
    if-eqz p1, :cond_2

    .line 42
    .line 43
    iget-object p1, p1, Lcom/p1/mobile/putong/core/data/VoiceCall;->status:Lcom/p1/mobile/putong/core/data/VoiceCallStatus;

    .line 44
    .line 45
    const-string v0, "calling"

    .line 46
    .line 47
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-nez p1, :cond_1

    .line 52
    .line 53
    goto :goto_0

    .line 54
    :cond_1
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 55
    .line 56
    const/4 p1, 0x1

    .line 57
    invoke-virtual {p0, p1}, Ll/u1n0;->u(I)V

    .line 58
    .line 59
    .line 60
    return-void

    .line 61
    :cond_2
    :goto_0
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 62
    .line 63
    invoke-virtual {p0}, Ll/u1n0;->r()V

    .line 64
    .line 65
    .line 66
    return-void

    .line 67
    :cond_3
    :goto_1
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 68
    .line 69
    invoke-virtual {p0}, Ll/u1n0;->r()V

    .line 70
    .line 71
    .line 72
    return-void
.end method

.method public final synthetic k(Ljava/lang/Throwable;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {p0}, Ll/u1n0;->r()V

    .line 4
    .line 5
    .line 6
    return-void
.end method

.method public final synthetic l(ZLjava/lang/Long;)V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 2
    .line 3
    invoke-virtual {v0}, Ll/u1n0;->i()I

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    const/4 v1, 0x1

    .line 8
    if-eq v0, v1, :cond_0

    .line 9
    .line 10
    iget-object p0, p0, Ll/f3n0;->c:Ll/kcg0;

    .line 11
    .line 12
    invoke-static {p0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    if-eqz p1, :cond_2

    .line 17
    .line 18
    invoke-static {}, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon;->a()Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 19
    .line 20
    .line 21
    move-result-object p1

    .line 22
    sget-object v0, Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;->opened:Lcom/p1/mobile/putong/notifications/NotificationCheckerCommon$State;

    .line 23
    .line 24
    if-eq p1, v0, :cond_1

    .line 25
    .line 26
    invoke-static {}, Ll/w1n0;->d()Z

    .line 27
    .line 28
    .line 29
    move-result p1

    .line 30
    if-eqz p1, :cond_2

    .line 31
    .line 32
    :cond_1
    iget-object p1, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 33
    .line 34
    const/16 v0, 0x1f4

    .line 35
    .line 36
    invoke-virtual {p1, v0}, Ll/u1n0;->s(I)V

    .line 37
    .line 38
    .line 39
    :cond_2
    invoke-virtual {p2}, Ljava/lang/Long;->longValue()J

    .line 40
    .line 41
    .line 42
    move-result-wide p1

    .line 43
    const-wide/16 v0, 0x2d

    .line 44
    .line 45
    cmp-long p1, p1, v0

    .line 46
    .line 47
    if-ltz p1, :cond_3

    .line 48
    .line 49
    iget-object p0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 50
    .line 51
    const-string p1, "canceled"

    .line 52
    .line 53
    invoke-virtual {p0, p1}, Ll/u1n0;->d(Ljava/lang/String;)V

    .line 54
    .line 55
    .line 56
    :cond_3
    return-void
.end method

.method public final m(Lcom/p1/mobile/putong/data/PushMessageCustom;Lcom/p1/mobile/putong/core/data/VoiceCallStatus;)V
    .locals 4

    .line 1
    const-string v0, "calling"

    .line 2
    .line 3
    invoke-static {p2, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p2

    .line 7
    if-nez p2, :cond_0

    .line 8
    .line 9
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 10
    .line 11
    .line 12
    move-result-object p0

    .line 13
    const-string p2, "PushInitErrorStatus"

    .line 14
    .line 15
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 16
    .line 17
    .line 18
    move-result-object p1

    .line 19
    invoke-virtual {p0, p2, p1}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 20
    .line 21
    .line 22
    return-void

    .line 23
    :cond_0
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    .line 24
    .line 25
    const-wide/16 v2, 0x0

    .line 26
    .line 27
    cmpl-double p2, v0, v2

    .line 28
    .line 29
    if-lez p2, :cond_1

    .line 30
    .line 31
    invoke-static {}, Ll/pzi0;->o()J

    .line 32
    .line 33
    .line 34
    move-result-wide v0

    .line 35
    long-to-double v0, v0

    .line 36
    iget-wide v2, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->createdTime:D

    .line 37
    .line 38
    sub-double/2addr v0, v2

    .line 39
    const-wide v2, 0x408f400000000000L    # 1000.0

    .line 40
    .line 41
    .line 42
    .line 43
    .line 44
    div-double/2addr v0, v2

    .line 45
    const-wide v2, 0x4046800000000000L    # 45.0

    .line 46
    .line 47
    .line 48
    .line 49
    .line 50
    cmpl-double p2, v0, v2

    .line 51
    .line 52
    if-lez p2, :cond_1

    .line 53
    .line 54
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 55
    .line 56
    .line 57
    move-result-object p0

    .line 58
    const-string p2, "PushInitTimeoutCall"

    .line 59
    .line 60
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    invoke-virtual {p0, p2, p1}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :cond_1
    invoke-static {}, Ll/qzm0;->h()Ll/qzm0;

    .line 69
    .line 70
    .line 71
    move-result-object p2

    .line 72
    const-string v0, "processIdleStateSuccess"

    .line 73
    .line 74
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/PushMessageCustom;->toJson()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    invoke-virtual {p2, v0, v1}, Ll/qzm0;->d(Ljava/lang/String;Ljava/lang/String;)V

    .line 79
    .line 80
    .line 81
    new-instance p2, Ll/azm0;

    .line 82
    .line 83
    invoke-direct {p2, p1}, Ll/azm0;-><init>(Lcom/p1/mobile/putong/data/PushMessageCustom;)V

    .line 84
    .line 85
    .line 86
    invoke-static {}, Ll/tl8;->M()Lcom/p1/mobile/putong/data/Device;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iget-object v0, v0, Lcom/p1/mobile/putong/data/Device;->identifier:Ljava/lang/String;

    .line 91
    .line 92
    iput-object v0, p2, Ll/azm0;->c:Ljava/lang/String;

    .line 93
    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->scene:Ljava/lang/String;

    .line 95
    .line 96
    iput-object v0, p2, Ll/azm0;->m:Ljava/lang/String;

    .line 97
    .line 98
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/PushMessageCustom;->mandatory:Z

    .line 99
    .line 100
    iput-boolean p1, p2, Ll/azm0;->p:Z

    .line 101
    .line 102
    iget-object p1, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 103
    .line 104
    invoke-virtual {p1, p2}, Ll/u1n0;->p(Ll/azm0;)V

    .line 105
    .line 106
    .line 107
    iget-object p1, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 108
    .line 109
    invoke-virtual {p1}, Ll/u1n0;->l()Ljava/lang/String;

    .line 110
    .line 111
    .line 112
    iget-object p1, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 113
    .line 114
    invoke-virtual {p1}, Ll/u1n0;->f()Ll/azm0;

    .line 115
    .line 116
    .line 117
    move-result-object p1

    .line 118
    iget-object p1, p1, Ll/azm0;->h:Ljava/lang/String;

    .line 119
    .line 120
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 121
    .line 122
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->R0:Ll/rnb;

    .line 123
    .line 124
    iget-object p2, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 125
    .line 126
    invoke-virtual {p2}, Ll/u1n0;->l()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object p2

    .line 130
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 131
    .line 132
    invoke-virtual {v0}, Ll/u1n0;->f()Ll/azm0;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iget-object v0, v0, Ll/azm0;->h:Ljava/lang/String;

    .line 137
    .line 138
    invoke-virtual {p1, p2, v0}, Ll/rnb;->n3(Ljava/lang/String;Ljava/lang/String;)Lrx/c;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    new-instance p2, Ll/d3n0;

    .line 143
    .line 144
    invoke-direct {p2, p0}, Ll/d3n0;-><init>(Ll/f3n0;)V

    .line 145
    .line 146
    .line 147
    new-instance v0, Ll/e3n0;

    .line 148
    .line 149
    invoke-direct {v0, p0}, Ll/e3n0;-><init>(Ll/f3n0;)V

    .line 150
    .line 151
    .line 152
    invoke-static {p2, v0}, Ll/psd0;->H(Ll/y20;Ll/y20;)Lcom/p1/mobile/android/rx/a;

    .line 153
    .line 154
    .line 155
    move-result-object p0

    .line 156
    invoke-virtual {p1, p0}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 157
    .line 158
    .line 159
    return-void
.end method

.method public final n()V
    .locals 4

    .line 1
    iget-object v0, p0, Ll/f3n0;->c:Ll/kcg0;

    .line 2
    .line 3
    invoke-static {v0}, Ll/psd0;->z(Ll/kcg0;)V

    .line 4
    .line 5
    .line 6
    iget-object v0, p0, Ll/f3n0;->a:Ll/u1n0;

    .line 7
    .line 8
    invoke-virtual {v0}, Ll/u1n0;->c()Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const-wide/16 v1, 0x1

    .line 13
    .line 14
    sget-object v3, Ljava/util/concurrent/TimeUnit;->SECONDS:Ljava/util/concurrent/TimeUnit;

    .line 15
    .line 16
    invoke-static {v1, v2, v3}, Lrx/c;->interval(JLjava/util/concurrent/TimeUnit;)Lrx/c;

    .line 17
    .line 18
    .line 19
    move-result-object v1

    .line 20
    invoke-virtual {v1}, Lrx/c;->onBackpressureLatest()Lrx/c;

    .line 21
    .line 22
    .line 23
    move-result-object v1

    .line 24
    invoke-static {}, Ll/psd0;->C()Lrx/c$d;

    .line 25
    .line 26
    .line 27
    move-result-object v2

    .line 28
    invoke-virtual {v1, v2}, Lrx/c;->compose(Lrx/c$d;)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    new-instance v2, Ll/c3n0;

    .line 33
    .line 34
    invoke-direct {v2, p0, v0}, Ll/c3n0;-><init>(Ll/f3n0;Z)V

    .line 35
    .line 36
    .line 37
    invoke-virtual {v1, v2}, Lrx/c;->subscribe(Ll/y20;)Ll/kcg0;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    iput-object v0, p0, Ll/f3n0;->c:Ll/kcg0;

    .line 42
    .line 43
    return-void
.end method
