.class public Ll/n4u;
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

.method public static synthetic a(Ljava/lang/String;)Lrx/c;
    .locals 0

    .line 1
    invoke-static {p0}, Lcom/p1/mobile/putong/live/external/module/api/LiveSquareApi;->getLiveSchema(Ljava/lang/String;)Lrx/c;

    .line 2
    .line 3
    .line 4
    move-result-object p0

    .line 5
    return-object p0
.end method

.method public static synthetic b(Ljava/lang/Throwable;)V
    .locals 2

    .line 1
    instance-of v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 2
    .line 3
    if-eqz v0, :cond_0

    .line 4
    .line 5
    check-cast p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;

    .line 6
    .line 7
    iget v0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->code:I

    .line 8
    .line 9
    const v1, 0xa067

    .line 10
    .line 11
    .line 12
    if-ne v0, v1, :cond_0

    .line 13
    .line 14
    iget-object p0, p0, Lcom/p1/mobile/putong/api/api/TantanException$Client$CoreService;->metaMessage:Ljava/lang/String;

    .line 15
    .line 16
    invoke-static {p0}, Ll/o1j0;->j(Ljava/lang/String;)V

    .line 17
    .line 18
    .line 19
    return-void

    .line 20
    :cond_0
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->g:I

    .line 21
    .line 22
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 23
    .line 24
    .line 25
    return-void
.end method

.method public static synthetic c(Ll/gcg0;Lcom/p1/mobile/android/app/Act;Ljava/lang/Boolean;)V
    .locals 0

    .line 1
    invoke-virtual {p2}, Ljava/lang/Boolean;->booleanValue()Z

    .line 2
    .line 3
    .line 4
    move-result p2

    .line 5
    if-eqz p2, :cond_0

    .line 6
    .line 7
    sget-object p1, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 8
    .line 9
    invoke-interface {p0, p1}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 10
    .line 11
    .line 12
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 13
    .line 14
    .line 15
    return-void

    .line 16
    :cond_0
    sget-object p2, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 17
    .line 18
    invoke-interface {p0, p2}, Ll/bb50;->onNext(Ljava/lang/Object;)V

    .line 19
    .line 20
    .line 21
    invoke-interface {p0}, Ll/bb50;->onCompleted()V

    .line 22
    .line 23
    .line 24
    invoke-static {p1}, Ll/n4u;->m(Lcom/p1/mobile/android/app/Act;)V

    .line 25
    .line 26
    .line 27
    return-void
.end method

.method public static synthetic d(Ljava/lang/String;Ljava/lang/String;)V
    .locals 0

    .line 1
    const-string p0, "scheme_message_no_handler_found"

    .line 2
    .line 3
    invoke-virtual {p0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result p0

    .line 7
    if-eqz p0, :cond_0

    .line 8
    .line 9
    sget p0, Lcom/p1/mobile/putong/live/base/R$string;->H0:I

    .line 10
    .line 11
    invoke-static {p0}, Ll/o1j0;->h(I)V

    .line 12
    .line 13
    .line 14
    :cond_0
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSchema;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n4u;->i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSchema;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static synthetic f(Lcom/p1/mobile/android/app/Act;Ll/gcg0;)V
    .locals 1

    .line 1
    new-instance v0, Ll/m4u;

    .line 2
    .line 3
    invoke-direct {v0, p1, p0}, Ll/m4u;-><init>(Ll/gcg0;Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lcom/p1/mobile/putong/live/external/module/api/LiveVerificationApi;->requestLiveVerification(Ll/y20;)V

    .line 7
    .line 8
    .line 9
    return-void
.end method

.method public static g(Landroid/os/Bundle;ILcom/p1/mobile/android/app/Act;)V
    .locals 0

    .line 1
    invoke-static {p0, p1, p2}, Ll/n4u;->h(Landroid/os/Bundle;ILcom/p1/mobile/android/app/Act;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static h(Landroid/os/Bundle;ILcom/p1/mobile/android/app/Act;)V
    .locals 8

    .line 1
    const-string v0, "extra_live"

    .line 2
    .line 3
    invoke-virtual {p0, v0}, Landroid/os/Bundle;->getByteArray(Ljava/lang/String;)[B

    .line 4
    .line 5
    .line 6
    move-result-object v0

    .line 7
    if-eqz v0, :cond_a

    .line 8
    .line 9
    const-string v1, "voice-push-big-anchor"

    .line 10
    .line 11
    const/4 v2, 0x0

    .line 12
    invoke-virtual {p0, v1, v2}, Landroid/os/BaseBundle;->getBoolean(Ljava/lang/String;Z)Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-eqz v1, :cond_0

    .line 17
    .line 18
    goto/16 :goto_2

    .line 19
    .line 20
    :cond_0
    invoke-static {v0}, Ll/w6c;->c([B)Ljava/lang/Object;

    .line 21
    .line 22
    .line 23
    move-result-object v0

    .line 24
    check-cast v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;

    .line 25
    .line 26
    const-string v1, "live_source"

    .line 27
    .line 28
    const-string v2, "default"

    .line 29
    .line 30
    invoke-virtual {p0, v1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 31
    .line 32
    .line 33
    move-result-object v1

    .line 34
    const-string v3, "live_push_voice_focus_user_id"

    .line 35
    .line 36
    const-string v4, ""

    .line 37
    .line 38
    invoke-virtual {p0, v3, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 39
    .line 40
    .line 41
    move-result-object v3

    .line 42
    const-string v5, "extra_live_category"

    .line 43
    .line 44
    invoke-virtual {p0, v5, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 45
    .line 46
    .line 47
    move-result-object v5

    .line 48
    const-string v6, "extra_live_test_group_name"

    .line 49
    .line 50
    invoke-virtual {p0, v6, v4}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 51
    .line 52
    .line 53
    move-result-object v4

    .line 54
    const/4 v6, 0x1

    .line 55
    if-ne v6, p1, :cond_a

    .line 56
    .line 57
    if-nez v0, :cond_1

    .line 58
    .line 59
    goto/16 :goto_2

    .line 60
    .line 61
    :cond_1
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    invoke-virtual {p1}, Ll/ppi0;->x()Z

    .line 66
    .line 67
    .line 68
    move-result p1

    .line 69
    if-eqz p1, :cond_2

    .line 70
    .line 71
    invoke-static {}, Ll/ppi0;->l()Ll/ppi0;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    invoke-virtual {p1}, Ll/ppi0;->j()Z

    .line 76
    .line 77
    .line 78
    move-result p1

    .line 79
    if-eqz p1, :cond_2

    .line 80
    .line 81
    goto/16 :goto_2

    .line 82
    .line 83
    :cond_2
    sget-object p1, Ll/tbs;->f:Ll/j6t;

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 86
    .line 87
    .line 88
    move-result-object v6

    .line 89
    invoke-virtual {v6, v0}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->D(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 90
    .line 91
    .line 92
    move-result-object v6

    .line 93
    invoke-virtual {v6, v1}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->O(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 94
    .line 95
    .line 96
    move-result-object v6

    .line 97
    invoke-static {v3}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 98
    .line 99
    .line 100
    move-result v7

    .line 101
    if-eqz v7, :cond_3

    .line 102
    .line 103
    iget-object v3, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 104
    .line 105
    iget-object v3, v3, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 106
    .line 107
    :cond_3
    invoke-virtual {v6, v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->z(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;

    .line 108
    .line 109
    .line 110
    move-result-object v3

    .line 111
    invoke-virtual {v3}, Lcom/p1/mobile/putong/live/base/bean/AudienceStartData$a;->u()Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;

    .line 112
    .line 113
    .line 114
    move-result-object v3

    .line 115
    invoke-virtual {p1, p2, v3}, Ll/j6t;->f(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AudienceStartData;)Landroid/content/Intent;

    .line 116
    .line 117
    .line 118
    move-result-object p1

    .line 119
    invoke-virtual {p2, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 120
    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->isVoiceLive()Z

    .line 123
    .line 124
    .line 125
    move-result p1

    .line 126
    const-string p2, "p_live_push"

    .line 127
    .line 128
    if-eqz p1, :cond_9

    .line 129
    .line 130
    const-string p1, "live_push_voice"

    .line 131
    .line 132
    invoke-virtual {p0, p1, v2}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object p0

    .line 136
    invoke-virtual {v2, p0}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z

    .line 137
    .line 138
    .line 139
    move-result p1

    .line 140
    const-string v2, "NA"

    .line 141
    .line 142
    if-eqz p1, :cond_4

    .line 143
    .line 144
    move-object p0, v2

    .line 145
    :cond_4
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 146
    .line 147
    .line 148
    move-result p1

    .line 149
    const-string v3, "start-push-follow-out"

    .line 150
    .line 151
    const-string v5, "start-push-follow"

    .line 152
    .line 153
    const-string v6, "start-push-follow-in"

    .line 154
    .line 155
    if-nez p1, :cond_5

    .line 156
    .line 157
    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 158
    .line 159
    .line 160
    move-result p1

    .line 161
    if-eqz p1, :cond_5

    .line 162
    .line 163
    const-string p2, "p_live_inner_push"

    .line 164
    .line 165
    :goto_0
    move-object p0, v5

    .line 166
    goto :goto_1

    .line 167
    :cond_5
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 168
    .line 169
    .line 170
    move-result p1

    .line 171
    if-nez p1, :cond_6

    .line 172
    .line 173
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 174
    .line 175
    .line 176
    move-result p1

    .line 177
    if-eqz p1, :cond_6

    .line 178
    .line 179
    goto :goto_0

    .line 180
    :cond_6
    :goto_1
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 181
    .line 182
    .line 183
    move-result p1

    .line 184
    const/16 v5, 0x15

    .line 185
    .line 186
    if-nez p1, :cond_7

    .line 187
    .line 188
    invoke-virtual {v1, v6}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 189
    .line 190
    .line 191
    move-result p1

    .line 192
    if-eqz p1, :cond_7

    .line 193
    .line 194
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 195
    .line 196
    .line 197
    move-result p1

    .line 198
    const/16 v6, 0x14

    .line 199
    .line 200
    if-le p1, v6, :cond_7

    .line 201
    .line 202
    invoke-virtual {v1, v5}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    :cond_7
    invoke-static {v1}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 207
    .line 208
    .line 209
    move-result p1

    .line 210
    if-nez p1, :cond_8

    .line 211
    .line 212
    invoke-virtual {v1, v3}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 213
    .line 214
    .line 215
    move-result p1

    .line 216
    if-eqz p1, :cond_8

    .line 217
    .line 218
    invoke-virtual {v1}, Ljava/lang/String;->length()I

    .line 219
    .line 220
    .line 221
    move-result p1

    .line 222
    if-le p1, v5, :cond_8

    .line 223
    .line 224
    const/16 p1, 0x16

    .line 225
    .line 226
    invoke-virtual {v1, p1}, Ljava/lang/String;->substring(I)Ljava/lang/String;

    .line 227
    .line 228
    .line 229
    move-result-object v2

    .line 230
    :cond_8
    new-instance p1, Ll/pf60;

    .line 231
    .line 232
    iget-object v1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 233
    .line 234
    iget-object v1, v1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 235
    .line 236
    const-string v3, "anchorId"

    .line 237
    .line 238
    invoke-direct {p1, v3, v1}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 239
    .line 240
    .line 241
    new-instance v1, Ll/pf60;

    .line 242
    .line 243
    const-string v3, "liveId"

    .line 244
    .line 245
    iget-object v0, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->id:Ljava/lang/String;

    .line 246
    .line 247
    invoke-direct {v1, v3, v0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 248
    .line 249
    .line 250
    new-instance v0, Ll/pf60;

    .line 251
    .line 252
    const-string v3, "audio_card_type"

    .line 253
    .line 254
    invoke-direct {v0, v3, p0}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 255
    .line 256
    .line 257
    new-instance p0, Ll/pf60;

    .line 258
    .line 259
    const-string v3, "test_group_name"

    .line 260
    .line 261
    invoke-direct {p0, v3, v4}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 262
    .line 263
    .line 264
    new-instance v3, Ll/pf60;

    .line 265
    .line 266
    const-string v4, "intl_live_push_source"

    .line 267
    .line 268
    invoke-direct {v3, v4, v2}, Ll/pf60;-><init>(Ljava/lang/Object;Ljava/lang/Object;)V

    .line 269
    .line 270
    .line 271
    filled-new-array {p1, v1, v0, p0, v3}, [Ll/pf60;

    .line 272
    .line 273
    .line 274
    move-result-object p0

    .line 275
    const-string p1, "e_live_audio_room_enter"

    .line 276
    .line 277
    invoke-static {p1, p2, p0}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 278
    .line 279
    .line 280
    return-void

    .line 281
    :cond_9
    invoke-static {}, Ll/kfd0;->x()Ll/kfd0$a;

    .line 282
    .line 283
    .line 284
    move-result-object p0

    .line 285
    invoke-virtual {p0, v0}, Ll/kfd0$a;->b(Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;)Ll/kfd0$a;

    .line 286
    .line 287
    .line 288
    move-result-object p0

    .line 289
    iget-object p1, v0, Lcom/p1/mobile/putong/live/base/data/BLiveAbsData;->anchor:Lcom/p1/mobile/putong/live/base/data/BLiveOwner;

    .line 290
    .line 291
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveOwner;->id:Ljava/lang/String;

    .line 292
    .line 293
    invoke-virtual {p0, p1}, Ll/kfd0$a;->g(Ljava/lang/String;)Ll/kfd0$a;

    .line 294
    .line 295
    .line 296
    move-result-object p0

    .line 297
    invoke-virtual {p0, v5}, Ll/kfd0$a;->s(Ljava/lang/String;)Ll/kfd0$a;

    .line 298
    .line 299
    .line 300
    move-result-object p0

    .line 301
    invoke-virtual {p0, v4}, Ll/kfd0$a;->v(Ljava/lang/String;)Ll/kfd0$a;

    .line 302
    .line 303
    .line 304
    move-result-object p0

    .line 305
    const-string p1, "push"

    .line 306
    .line 307
    invoke-virtual {p0, p1}, Ll/kfd0$a;->w(Ljava/lang/String;)Ll/kfd0$a;

    .line 308
    .line 309
    .line 310
    move-result-object p0

    .line 311
    invoke-virtual {p0}, Ll/kfd0$a;->a()Ll/kfd0;

    .line 312
    .line 313
    .line 314
    move-result-object p0

    .line 315
    invoke-static {p0, p2}, Ll/bfu;->c(Ll/kfd0;Ljava/lang/String;)V

    .line 316
    .line 317
    .line 318
    :cond_a
    :goto_2
    return-void
.end method

.method public static i(Lcom/p1/mobile/android/app/Act;Lcom/p1/mobile/putong/live/base/data/BLiveSchema;)V
    .locals 1

    .line 1
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->tip:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {v0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-nez v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->tip:Ljava/lang/String;

    .line 10
    .line 11
    invoke-static {v0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 12
    .line 13
    .line 14
    :cond_0
    invoke-virtual {p0}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 15
    .line 16
    .line 17
    move-result v0

    .line 18
    if-nez v0, :cond_2

    .line 19
    .line 20
    iget-object v0, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->schema:Ljava/lang/String;

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
    new-instance v0, Ll/k4u;

    .line 30
    .line 31
    invoke-direct {v0}, Ll/k4u;-><init>()V

    .line 32
    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/live/base/data/BLiveSchema;->schema:Ljava/lang/String;

    .line 35
    .line 36
    invoke-static {p1}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p0, p1, v0}, Ll/nae0;->n(Landroid/app/Activity;Landroid/net/Uri;Ll/z20;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    :goto_0
    return-void
.end method

.method public static j(Landroid/os/Bundle;Lcom/p1/mobile/android/app/Act;)Z
    .locals 2

    .line 1
    const-string v0, "live_dynamic_schema"

    .line 2
    .line 3
    const/4 v1, 0x0

    .line 4
    invoke-virtual {p0, v0, v1}, Landroid/os/BaseBundle;->getString(Ljava/lang/String;Ljava/lang/String;)Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    invoke-static {p0}, Landroid/text/TextUtils;->isEmpty(Ljava/lang/CharSequence;)Z

    .line 9
    .line 10
    .line 11
    move-result v0

    .line 12
    const/4 v1, 0x0

    .line 13
    if-nez v0, :cond_0

    .line 14
    .line 15
    if-eqz p1, :cond_0

    .line 16
    .line 17
    invoke-virtual {p1}, Lcom/p1/mobile/android/app/Act;->isFinishing()Z

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    if-nez v0, :cond_0

    .line 22
    .line 23
    new-instance v0, Ll/h4u;

    .line 24
    .line 25
    invoke-direct {v0, p0}, Ll/h4u;-><init>(Ljava/lang/String;)V

    .line 26
    .line 27
    .line 28
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/android/app/Act;->duringCreated(Ll/pcj;Z)Lrx/c;

    .line 29
    .line 30
    .line 31
    move-result-object p0

    .line 32
    new-instance v0, Ll/i4u;

    .line 33
    .line 34
    invoke-direct {v0, p1}, Ll/i4u;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 35
    .line 36
    .line 37
    new-instance p1, Ll/j4u;

    .line 38
    .line 39
    invoke-direct {p1}, Ll/j4u;-><init>()V

    .line 40
    .line 41
    .line 42
    invoke-static {v0, p1}, Ll/dhw;->e(Ll/y20;Ll/y20;)Ll/t9t;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    invoke-virtual {p0, p1}, Lrx/c;->subscribe(Ll/bb50;)Ll/kcg0;

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x1

    .line 50
    return p0

    .line 51
    :cond_0
    return v1
.end method

.method public static k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 2

    .line 1
    sget-object v0, Ll/tbs;->f:Ll/j6t;

    .line 2
    .line 3
    invoke-static {}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;->getBuilder()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 4
    .line 5
    .line 6
    move-result-object v1

    .line 7
    invoke-virtual {v1, p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->n(Ljava/lang/String;)Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p1}, Lcom/p1/mobile/putong/live/base/bean/AnchorStartData$a;->k()Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;

    .line 12
    .line 13
    .line 14
    move-result-object p1

    .line 15
    invoke-virtual {v0, p0, p1}, Ll/j6t;->a(Landroid/content/Context;Lcom/p1/mobile/putong/live/base/bean/AnchorStartData;)V

    .line 16
    .line 17
    .line 18
    return-void
.end method

.method public static l(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V
    .locals 0

    .line 1
    invoke-static {p0, p1}, Ll/n4u;->k(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 2
    .line 3
    .line 4
    return-void
.end method

.method public static m(Lcom/p1/mobile/android/app/Act;)V
    .locals 2

    .line 1
    invoke-static {}, Ll/mqr;->h()Z

    .line 2
    .line 3
    .line 4
    move-result v0

    .line 5
    if-eqz v0, :cond_0

    .line 6
    .line 7
    sget-object v0, Ll/efv;->b:Ljava/lang/String;

    .line 8
    .line 9
    goto :goto_0

    .line 10
    :cond_0
    sget-object v0, Ll/efv;->a:Ljava/lang/String;

    .line 11
    .line 12
    :goto_0
    invoke-static {}, Ll/mqr;->g()Z

    .line 13
    .line 14
    .line 15
    move-result v1

    .line 16
    if-nez v1, :cond_1

    .line 17
    .line 18
    new-instance v1, Ljava/lang/StringBuilder;

    .line 19
    .line 20
    invoke-direct {v1}, Ljava/lang/StringBuilder;-><init>()V

    .line 21
    .line 22
    .line 23
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 24
    .line 25
    .line 26
    const-string v0, "?createAnchorInterfaceType="

    .line 27
    .line 28
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 29
    .line 30
    .line 31
    sget-object v0, Ll/tbs;->b:Ll/vwt;

    .line 32
    .line 33
    invoke-virtual {v0}, Ll/vwt;->G5()Ljava/lang/String;

    .line 34
    .line 35
    .line 36
    move-result-object v0

    .line 37
    invoke-virtual {v1, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 38
    .line 39
    .line 40
    invoke-virtual {v1}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 41
    .line 42
    .line 43
    move-result-object v0

    .line 44
    :cond_1
    sget v1, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->l:I

    .line 45
    .line 46
    invoke-static {p0, v0, v1}, Lcom/p1/mobile/putong/live/base/webview/LiveWebViewAct;->e2(Landroid/content/Context;Ljava/lang/String;I)Landroid/content/Intent;

    .line 47
    .line 48
    .line 49
    move-result-object v0

    .line 50
    invoke-virtual {p0, v0}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 51
    .line 52
    .line 53
    return-void
.end method

.method public static n(Lcom/p1/mobile/android/app/Act;)Lrx/c;
    .locals 1
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/android/app/Act;",
            ")",
            "Lrx/c<",
            "Ljava/lang/Boolean;",
            ">;"
        }
    .end annotation

    .line 1
    new-instance v0, Ll/l4u;

    .line 2
    .line 3
    invoke-direct {v0, p0}, Ll/l4u;-><init>(Lcom/p1/mobile/android/app/Act;)V

    .line 4
    .line 5
    .line 6
    invoke-static {v0}, Lrx/c;->create(Lrx/c$a;)Lrx/c;

    .line 7
    .line 8
    .line 9
    move-result-object p0

    .line 10
    return-object p0
.end method
