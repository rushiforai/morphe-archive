.class public Ll/etx;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/btx;


# instance fields
.field public a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

.field public b:Ll/g0r;

.field public c:Lrx/subjects/b;
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "Lrx/subjects/b<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation
.end field

.field public d:Ll/jxd0;

.field public e:Ll/jxd0;


# direct methods
.method public constructor <init>(Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;)V
    .locals 3

    .line 1
    invoke-direct {p0}, Ljava/lang/Object;-><init>()V

    .line 2
    .line 3
    .line 4
    invoke-static {}, Lrx/subjects/b;->b()Lrx/subjects/b;

    .line 5
    .line 6
    .line 7
    move-result-object v0

    .line 8
    iput-object v0, p0, Ll/etx;->c:Lrx/subjects/b;

    .line 9
    .line 10
    new-instance v0, Ll/jxd0;

    .line 11
    .line 12
    sget-object v1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 13
    .line 14
    const-string v2, "message_media_item_exclusive"

    .line 15
    .line 16
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 17
    .line 18
    .line 19
    iput-object v0, p0, Ll/etx;->d:Ll/jxd0;

    .line 20
    .line 21
    new-instance v0, Ll/jxd0;

    .line 22
    .line 23
    const-string v2, "message_media_item_aicg"

    .line 24
    .line 25
    invoke-direct {v0, v2, v1}, Ll/jxd0;-><init>(Ljava/lang/String;Ljava/lang/Boolean;)V

    .line 26
    .line 27
    .line 28
    iput-object v0, p0, Ll/etx;->e:Ll/jxd0;

    .line 29
    .line 30
    iput-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 31
    .line 32
    return-void
.end method

.method public static synthetic b(Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;)Ljava/lang/Boolean;
    .locals 0

    .line 1
    if-eqz p0, :cond_0

    .line 2
    .line 3
    iget p0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 4
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

.method public static synthetic c()V
    .locals 0

    .line 1
    return-void
.end method


# virtual methods
.method public a(Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V
    .locals 7

    .line 1
    sget-object v0, Ll/etx$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p1, v0, p1

    .line 8
    .line 9
    const-string v0, "photograph"

    .line 10
    .line 11
    const-string v1, "e_chat_more_shoot"

    .line 12
    .line 13
    const v2, 0x186aa

    .line 14
    .line 15
    .line 16
    const/4 v3, 0x1

    .line 17
    const-string v4, ""

    .line 18
    .line 19
    const-string v5, "p_chat_view"

    .line 20
    .line 21
    const/4 v6, 0x0

    .line 22
    packed-switch p1, :pswitch_data_0

    .line 23
    .line 24
    .line 25
    goto/16 :goto_0

    .line 26
    .line 27
    :pswitch_0
    const-string p1, "e_exchange_answer"

    .line 28
    .line 29
    invoke-static {p1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 30
    .line 31
    .line 32
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 33
    .line 34
    iget-object p1, p1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 35
    .line 36
    invoke-virtual {p1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 37
    .line 38
    .line 39
    move-result-object p1

    .line 40
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    if-eqz v0, :cond_0

    .line 45
    .line 46
    iget-object v0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 47
    .line 48
    iget-object p1, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 49
    .line 50
    const/4 v1, 0x0

    .line 51
    invoke-static {v0, p1, v1}, Lcom/p1/mobile/putong/core/ui/breaking/SwapAnswerBottomSheetAct;->E2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;)V

    .line 52
    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 55
    .line 56
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 57
    .line 58
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->B1:Ll/jxd0;

    .line 59
    .line 60
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 61
    .line 62
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 63
    .line 64
    .line 65
    :cond_0
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->SWAP_ANSWER:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 66
    .line 67
    invoke-virtual {p0, v6, p1}, Ll/etx;->h(ZLcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 68
    .line 69
    .line 70
    return-void

    .line 71
    :pswitch_1
    const-string p1, "e_love_letter"

    .line 72
    .line 73
    invoke-static {p1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 74
    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 77
    .line 78
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 79
    .line 80
    iget-object p1, p1, Ll/dkb;->U1:Lrx/subjects/a;

    .line 81
    .line 82
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 87
    .line 88
    if-eqz p1, :cond_1

    .line 89
    .line 90
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->endTime:D

    .line 91
    .line 92
    invoke-static {}, Ll/pzi0;->o()J

    .line 93
    .line 94
    .line 95
    move-result-wide v2

    .line 96
    long-to-double v2, v2

    .line 97
    cmpg-double p1, v0, v2

    .line 98
    .line 99
    if-gez p1, :cond_1

    .line 100
    .line 101
    const-string p0, "\u672c\u6b21\u6d3b\u52a8\u5df2\u7ed3\u675f"

    .line 102
    .line 103
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 104
    .line 105
    .line 106
    return-void

    .line 107
    :cond_1
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 108
    .line 109
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 110
    .line 111
    invoke-virtual {p1}, Ll/dkb;->p9()Lcom/p1/mobile/putong/data/User;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 116
    .line 117
    .line 118
    move-result p1

    .line 119
    if-nez p1, :cond_3

    .line 120
    .line 121
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 122
    .line 123
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->B0:Lcom/p1/mobile/putong/core/api/d0;

    .line 124
    .line 125
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/api/d0;->s4()Lcom/p1/mobile/putong/data/StudentVerificationStatus;

    .line 126
    .line 127
    .line 128
    move-result-object p1

    .line 129
    const-string v0, "pending"

    .line 130
    .line 131
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 132
    .line 133
    .line 134
    move-result p1

    .line 135
    if-eqz p1, :cond_2

    .line 136
    .line 137
    const-string p0, "\u8bf7\u7a0d\u540e\uff0c\u6b63\u5728\u5ba1\u6838\u4e2d\u3002"

    .line 138
    .line 139
    invoke-static {p0}, Ll/o1j0;->y(Ljava/lang/String;)V

    .line 140
    .line 141
    .line 142
    return-void

    .line 143
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 152
    .line 153
    new-instance v0, Ll/dtx;

    .line 154
    .line 155
    invoke-direct {v0}, Ll/dtx;-><init>()V

    .line 156
    .line 157
    .line 158
    invoke-interface {p1, p0, v0}, Ll/r97;->J5(Lcom/p1/mobile/android/app/Act;Ll/x20;)V

    .line 159
    .line 160
    .line 161
    return-void

    .line 162
    :cond_3
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 163
    .line 164
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 165
    .line 166
    iget-object p1, p1, Ll/dkb;->U1:Lrx/subjects/a;

    .line 167
    .line 168
    invoke-virtual {p1}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 173
    .line 174
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    invoke-virtual {v0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 183
    .line 184
    if-eqz p1, :cond_4

    .line 185
    .line 186
    iget p1, p1, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 187
    .line 188
    if-lez p1, :cond_4

    .line 189
    .line 190
    iget-object p1, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 191
    .line 192
    iget-object v4, p1, Ll/clz;->c:Ljava/lang/String;

    .line 193
    .line 194
    :cond_4
    invoke-interface {v0, p0, v4}, Ll/r97;->C1(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)V

    .line 195
    .line 196
    .line 197
    return-void

    .line 198
    :pswitch_2
    const-string p1, "e_newphoto_icon"

    .line 199
    .line 200
    invoke-static {p1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 201
    .line 202
    .line 203
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 204
    .line 205
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 206
    .line 207
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/g;->A1:Ll/jxd0;

    .line 208
    .line 209
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 210
    .line 211
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 212
    .line 213
    .line 214
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->NEW_PIC:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 215
    .line 216
    invoke-virtual {p0, v6, p1}, Ll/etx;->h(ZLcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 217
    .line 218
    .line 219
    invoke-virtual {p0}, Ll/etx;->i()V

    .line 220
    .line 221
    .line 222
    return-void

    .line 223
    :pswitch_3
    const-string p1, "e_paip_chat_bottom_more"

    .line 224
    .line 225
    invoke-static {p1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 226
    .line 227
    .line 228
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 229
    .line 230
    new-instance v0, Ljava/lang/StringBuilder;

    .line 231
    .line 232
    const-string v1, "tantan://create_ai_avatar?uid="

    .line 233
    .line 234
    invoke-direct {v0, v1}, Ljava/lang/StringBuilder;-><init>(Ljava/lang/String;)V

    .line 235
    .line 236
    .line 237
    iget-object v1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 238
    .line 239
    invoke-virtual {v1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    iget-object v1, v1, Ll/clz;->b:Ljava/lang/String;

    .line 244
    .line 245
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 246
    .line 247
    .line 248
    const-string v1, "&from=default"

    .line 249
    .line 250
    invoke-virtual {v0, v1}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;

    .line 251
    .line 252
    .line 253
    invoke-virtual {v0}, Ljava/lang/StringBuilder;->toString()Ljava/lang/String;

    .line 254
    .line 255
    .line 256
    move-result-object v0

    .line 257
    invoke-static {v0}, Landroid/net/Uri;->parse(Ljava/lang/String;)Landroid/net/Uri;

    .line 258
    .line 259
    .line 260
    move-result-object v0

    .line 261
    invoke-static {p1, v0}, Ll/nae0;->m(Landroid/app/Activity;Landroid/net/Uri;)V

    .line 262
    .line 263
    .line 264
    iget-object p1, p0, Ll/etx;->e:Ll/jxd0;

    .line 265
    .line 266
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 267
    .line 268
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 269
    .line 270
    .line 271
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->AICG:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 272
    .line 273
    invoke-virtual {p0, v6, p1}, Ll/etx;->h(ZLcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 274
    .line 275
    .line 276
    return-void

    .line 277
    :pswitch_4
    const-string p1, "e_private_chat_entrance"

    .line 278
    .line 279
    invoke-static {p1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 280
    .line 281
    .line 282
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 283
    .line 284
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->M1:Ll/cn7;

    .line 285
    .line 286
    iget-object v0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 287
    .line 288
    iget-object v0, v0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 289
    .line 290
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    invoke-virtual {p1, v0}, Ll/cn7;->r3(Ljava/lang/String;)Lrx/c;

    .line 295
    .line 296
    .line 297
    iget-object p1, p0, Ll/etx;->d:Ll/jxd0;

    .line 298
    .line 299
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 300
    .line 301
    invoke-virtual {p1, v0}, Ll/jxd0;->put(Ljava/lang/Object;)Z

    .line 302
    .line 303
    .line 304
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->EXCLUSIVE_CHAT:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 305
    .line 306
    invoke-virtual {p0, v6, p1}, Ll/etx;->h(ZLcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 307
    .line 308
    .line 309
    return-void

    .line 310
    :pswitch_5
    const-string p1, "e_in_harmony_test_entrance_two"

    .line 311
    .line 312
    invoke-static {p1, v5}, Ll/i4g0;->r(Ljava/lang/String;Ljava/lang/String;)V

    .line 313
    .line 314
    .line 315
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 316
    .line 317
    .line 318
    move-result-object p1

    .line 319
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 320
    .line 321
    .line 322
    move-result-object p1

    .line 323
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 324
    .line 325
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 326
    .line 327
    .line 328
    move-result-object v0

    .line 329
    invoke-virtual {v0}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 330
    .line 331
    .line 332
    move-result-object v0

    .line 333
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 334
    .line 335
    const-string v1, "conversation_plus"

    .line 336
    .line 337
    invoke-interface {p1, p0, v4, v0, v1}, Ll/r97;->d5(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 338
    .line 339
    .line 340
    return-void

    .line 341
    :pswitch_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->K()Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;

    .line 342
    .line 343
    .line 344
    move-result-object p1

    .line 345
    invoke-interface {p1}, Lcom/p1/mobile/putong/core_api/api/serviceprovider/api/CoreService;->me_()Lcom/p1/mobile/putong/data/User;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isJailed()Z

    .line 350
    .line 351
    .line 352
    move-result p1

    .line 353
    if-eqz p1, :cond_5

    .line 354
    .line 355
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 356
    .line 357
    .line 358
    move-result-object p0

    .line 359
    invoke-virtual {p0}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 360
    .line 361
    .line 362
    move-result-object p0

    .line 363
    invoke-interface {p0}, Ll/r97;->o2()V

    .line 364
    .line 365
    .line 366
    return-void

    .line 367
    :cond_5
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 368
    .line 369
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 370
    .line 371
    .line 372
    move-result-object p1

    .line 373
    iget-object p1, p1, Ll/clz;->b:Ljava/lang/String;

    .line 374
    .line 375
    const-string v0, "groupchat_id"

    .line 376
    .line 377
    invoke-static {v0, p1}, Ll/jyb;->Y(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 378
    .line 379
    .line 380
    move-result-object p1

    .line 381
    filled-new-array {p1}, [Ll/pf60;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    const-string v0, "e_send_red_packet"

    .line 386
    .line 387
    const-string v1, "p_group_chat_view"

    .line 388
    .line 389
    invoke-static {v0, v1, p1}, Ll/i4g0;->u(Ljava/lang/String;Ljava/lang/String;[Ll/pf60;)V

    .line 390
    .line 391
    .line 392
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 393
    .line 394
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/core/ui/messages/redpacket/SendRedPacketAct;->a2(Lcom/p1/mobile/android/app/Act;Ljava/lang/String;)Landroid/content/Intent;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 407
    .line 408
    invoke-virtual {p0, p1}, Landroid/content/Context;->startActivity(Landroid/content/Intent;)V

    .line 409
    .line 410
    .line 411
    return-void

    .line 412
    :pswitch_7
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 413
    .line 414
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->B0()Ll/u1z;

    .line 415
    .line 416
    .line 417
    move-result-object p1

    .line 418
    invoke-virtual {p1}, Ll/j3z;->g0()Ll/iam;

    .line 419
    .line 420
    .line 421
    move-result-object p1

    .line 422
    check-cast p1, Ll/d3z;

    .line 423
    .line 424
    invoke-virtual {p1}, Ll/d3z;->u0()Ll/azy;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    invoke-static {p1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    if-eqz v0, :cond_6

    .line 433
    .line 434
    invoke-virtual {p1}, Ll/azy;->d0()Z

    .line 435
    .line 436
    .line 437
    move-result p1

    .line 438
    if-eqz p1, :cond_6

    .line 439
    .line 440
    sget p0, Lcom/p1/mobile/putong/core/message/R$string;->C5:I

    .line 441
    .line 442
    invoke-static {p0}, Ll/o1j0;->w(I)V

    .line 443
    .line 444
    .line 445
    return-void

    .line 446
    :cond_6
    const-string p1, "e_chat_more_voice_call"

    .line 447
    .line 448
    new-array v0, v6, [Ll/sfj0$a;

    .line 449
    .line 450
    invoke-static {p1, v5, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 451
    .line 452
    .line 453
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 454
    .line 455
    .line 456
    move-result-object p1

    .line 457
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 458
    .line 459
    .line 460
    move-result-object p1

    .line 461
    invoke-interface {p1}, Ll/r97;->O4()V

    .line 462
    .line 463
    .line 464
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 465
    .line 466
    .line 467
    move-result-object p1

    .line 468
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 469
    .line 470
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 471
    .line 472
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 473
    .line 474
    .line 475
    move-result-object v0

    .line 476
    invoke-virtual {p1, p0, v0, v4}, Ll/xzm0;->h(Landroid/content/Context;Ljava/lang/String;Ljava/lang/String;)V

    .line 477
    .line 478
    .line 479
    return-void

    .line 480
    :pswitch_8
    const-string p1, "e_chat_more_location"

    .line 481
    .line 482
    new-array v0, v6, [Ll/sfj0$a;

    .line 483
    .line 484
    invoke-static {p1, v5, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 485
    .line 486
    .line 487
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 488
    .line 489
    .line 490
    move-result-object p1

    .line 491
    invoke-virtual {p1}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 492
    .line 493
    .line 494
    move-result-object p1

    .line 495
    iget-object v0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 496
    .line 497
    const/16 v1, 0x30

    .line 498
    .line 499
    invoke-interface {p1, v0, v1}, Ll/r97;->L4(Lcom/p1/mobile/android/app/Act;I)V

    .line 500
    .line 501
    .line 502
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 503
    .line 504
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 505
    .line 506
    .line 507
    move-result-object p1

    .line 508
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 509
    .line 510
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 511
    .line 512
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 513
    .line 514
    .line 515
    move-result-object p0

    .line 516
    const-string v0, "location"

    .line 517
    .line 518
    invoke-static {p1, p0, v0}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 519
    .line 520
    .line 521
    return-void

    .line 522
    :pswitch_9
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 527
    .line 528
    .line 529
    move-result-object p1

    .line 530
    invoke-interface {p1, v2}, Ll/r97;->C(I)Z

    .line 531
    .line 532
    .line 533
    move-result p1

    .line 534
    if-nez p1, :cond_7

    .line 535
    .line 536
    goto :goto_0

    .line 537
    :cond_7
    new-array p1, v6, [Ll/sfj0$a;

    .line 538
    .line 539
    invoke-static {v1, v5, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 540
    .line 541
    .line 542
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 543
    .line 544
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 545
    .line 546
    .line 547
    move-result-object p1

    .line 548
    iget-object v1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 549
    .line 550
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 551
    .line 552
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 553
    .line 554
    .line 555
    move-result-object v1

    .line 556
    invoke-static {p1, v1, v0}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 557
    .line 558
    .line 559
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 560
    .line 561
    invoke-static {p0, v6, v3}, Ll/l7y;->k(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 562
    .line 563
    .line 564
    return-void

    .line 565
    :pswitch_a
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 566
    .line 567
    .line 568
    move-result-object p1

    .line 569
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 570
    .line 571
    .line 572
    move-result-object p1

    .line 573
    invoke-interface {p1, v2}, Ll/r97;->C(I)Z

    .line 574
    .line 575
    .line 576
    move-result p1

    .line 577
    if-nez p1, :cond_8

    .line 578
    .line 579
    :goto_0
    return-void

    .line 580
    :cond_8
    new-array p1, v6, [Ll/sfj0$a;

    .line 581
    .line 582
    invoke-static {v1, v5, p1}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 583
    .line 584
    .line 585
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 586
    .line 587
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 588
    .line 589
    .line 590
    move-result-object p1

    .line 591
    iget-object v1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 592
    .line 593
    iget-object v1, v1, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 594
    .line 595
    invoke-virtual {v1}, Ll/clz;->r3()Ljava/lang/String;

    .line 596
    .line 597
    .line 598
    move-result-object v1

    .line 599
    invoke-static {p1, v1, v0}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 600
    .line 601
    .line 602
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 603
    .line 604
    invoke-static {p0, v6, v3}, Ll/l7y;->m(Lcom/p1/mobile/android/app/Act;ZZ)V

    .line 605
    .line 606
    .line 607
    return-void

    .line 608
    :pswitch_b
    const-string p1, "e_chat_more_picture"

    .line 609
    .line 610
    new-array v0, v6, [Ll/sfj0$a;

    .line 611
    .line 612
    invoke-static {p1, v5, v0}, Ll/sfj0;->c(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 613
    .line 614
    .line 615
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 616
    .line 617
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 618
    .line 619
    .line 620
    move-result-object v0

    .line 621
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 622
    .line 623
    .line 624
    move-result-object v1

    .line 625
    const/4 v2, 0x6

    .line 626
    invoke-virtual {v1, v2}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 627
    .line 628
    .line 629
    move-result-object v1

    .line 630
    invoke-virtual {v1, v6}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->showPreviewEditBtn(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 631
    .line 632
    .line 633
    move-result-object v1

    .line 634
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 635
    .line 636
    .line 637
    move-result-object v1

    .line 638
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withImagePickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 639
    .line 640
    .line 641
    move-result-object v0

    .line 642
    invoke-static {}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->aBuilder()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 643
    .line 644
    .line 645
    move-result-object v1

    .line 646
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->canClickSubmitInPreviewWhenNoSelectedMedia()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 647
    .line 648
    .line 649
    move-result-object v1

    .line 650
    invoke-virtual {v1, v3}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->withMaxPickCount(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;

    .line 651
    .line 652
    .line 653
    move-result-object v1

    .line 654
    invoke-virtual {v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig$MediaPickConfigBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;

    .line 655
    .line 656
    .line 657
    move-result-object v1

    .line 658
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withVideoPickConfig(Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickConfig;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->needAllSelectedMediaPreview()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 663
    .line 664
    .line 665
    move-result-object v0

    .line 666
    iget-object v1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 667
    .line 668
    sget v2, Lcom/p1/mobile/putong/core/message/R$string;->h:I

    .line 669
    .line 670
    invoke-virtual {v1, v2}, Landroid/content/Context;->getString(I)Ljava/lang/String;

    .line 671
    .line 672
    .line 673
    move-result-object v1

    .line 674
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withSubmitButtonTitle(Ljava/lang/String;)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    const/4 v1, 0x4

    .line 679
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withFromType(I)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 680
    .line 681
    .line 682
    move-result-object v0

    .line 683
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 684
    .line 685
    .line 686
    move-result-object v1

    .line 687
    invoke-virtual {v1}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 688
    .line 689
    .line 690
    move-result-object v1

    .line 691
    invoke-interface {v1}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 692
    .line 693
    .line 694
    move-result v1

    .line 695
    invoke-virtual {v0, v1}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->withIsNewUIAb(Z)Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;

    .line 696
    .line 697
    .line 698
    move-result-object v0

    .line 699
    invoke-virtual {v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject$MediaPickerParamsObjectBuilder;->build()Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;

    .line 700
    .line 701
    .line 702
    move-result-object v0

    .line 703
    invoke-static {p1, v0}, Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/MediaPickerAct;->Y1(Landroid/content/Context;Lcom/p1/mobile/putong/newui/mediaoperation/mediapicker/config/MediaPickerParamsObject;)Landroid/content/Intent;

    .line 704
    .line 705
    .line 706
    move-result-object v0

    .line 707
    const/16 v1, 0x312

    .line 708
    .line 709
    invoke-virtual {p1, v0, v1}, Landroidx/activity/ComponentActivity;->startActivityForResult(Landroid/content/Intent;I)V

    .line 710
    .line 711
    .line 712
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 713
    .line 714
    sget v0, Ll/y7c0;->e:I

    .line 715
    .line 716
    sget v1, Ll/y7c0;->a:I

    .line 717
    .line 718
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/app/PutongAct;->overridePendingTransition(II)V

    .line 719
    .line 720
    .line 721
    iget-object p1, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 722
    .line 723
    invoke-virtual {p1}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->pageId()Ljava/lang/String;

    .line 724
    .line 725
    .line 726
    move-result-object p1

    .line 727
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 728
    .line 729
    iget-object p0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 730
    .line 731
    invoke-virtual {p0}, Ll/clz;->r3()Ljava/lang/String;

    .line 732
    .line 733
    .line 734
    move-result-object p0

    .line 735
    const-string v0, "photo"

    .line 736
    .line 737
    invoke-static {p1, p0, v0}, Ll/m600;->f(Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 738
    .line 739
    .line 740
    return-void

    .line 741
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public d(Ll/vez;)Ll/g0r;
    .locals 8

    .line 1
    new-instance v0, Ljava/util/ArrayList;

    .line 2
    .line 3
    invoke-direct {v0}, Ljava/util/ArrayList;-><init>()V

    .line 4
    .line 5
    .line 6
    new-instance v1, Ll/g0r;

    .line 7
    .line 8
    invoke-direct {v1}, Ll/g0r;-><init>()V

    .line 9
    .line 10
    .line 11
    iput-object v1, p0, Ll/etx;->b:Ll/g0r;

    .line 12
    .line 13
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 14
    .line 15
    .line 16
    move-result-object v1

    .line 17
    invoke-interface {v1}, Ll/mzl;->l()Ll/clz;

    .line 18
    .line 19
    .line 20
    move-result-object v1

    .line 21
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 22
    .line 23
    .line 24
    move-result-object v2

    .line 25
    invoke-interface {v2}, Ll/mzl;->l()Ll/clz;

    .line 26
    .line 27
    .line 28
    move-result-object v2

    .line 29
    invoke-virtual {v2}, Ll/clz;->r3()Ljava/lang/String;

    .line 30
    .line 31
    .line 32
    invoke-virtual {v1}, Ll/clz;->e4()Z

    .line 33
    .line 34
    .line 35
    move-result v2

    .line 36
    if-eqz v2, :cond_2

    .line 37
    .line 38
    iget-object v2, p0, Ll/etx;->b:Ll/g0r;

    .line 39
    .line 40
    const/4 v3, 0x3

    .line 41
    invoke-virtual {v2, v3}, Ll/g0r;->e(I)V

    .line 42
    .line 43
    .line 44
    invoke-virtual {v1}, Ll/clz;->h4()Z

    .line 45
    .line 46
    .line 47
    move-result v2

    .line 48
    if-eqz v2, :cond_0

    .line 49
    .line 50
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 51
    .line 52
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CAMERA:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 53
    .line 54
    filled-new-array {v2, v3}, [Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 55
    .line 56
    .line 57
    move-result-object v2

    .line 58
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 59
    .line 60
    .line 61
    move-result-object v2

    .line 62
    goto :goto_0

    .line 63
    :cond_0
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 64
    .line 65
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CAMERA:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 66
    .line 67
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VIDEO:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 68
    .line 69
    sget-object v5, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOCATION:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 70
    .line 71
    filled-new-array {v2, v3, v4, v5}, [Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 72
    .line 73
    .line 74
    move-result-object v2

    .line 75
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 76
    .line 77
    .line 78
    move-result-object v2

    .line 79
    :goto_0
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 80
    .line 81
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->g0:Lcom/p1/mobile/putong/core/api/e;

    .line 82
    .line 83
    iget-object v4, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 84
    .line 85
    invoke-virtual {v4}, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->l()Ll/clz;

    .line 86
    .line 87
    .line 88
    move-result-object v4

    .line 89
    invoke-virtual {v4}, Ll/clz;->r3()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v4

    .line 93
    invoke-virtual {v3, v4}, Lcom/p1/mobile/putong/core/api/e;->s6(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 98
    .line 99
    .line 100
    move-result v4

    .line 101
    if-eqz v4, :cond_1

    .line 102
    .line 103
    invoke-static {v3}, Ll/jek;->i(Lcom/p1/mobile/putong/core/data/ChatGroup;)Z

    .line 104
    .line 105
    .line 106
    move-result v3

    .line 107
    if-eqz v3, :cond_1

    .line 108
    .line 109
    goto/16 :goto_1

    .line 110
    .line 111
    :cond_1
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->RED_PACKAGE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 112
    .line 113
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 114
    .line 115
    .line 116
    goto/16 :goto_1

    .line 117
    .line 118
    :cond_2
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 123
    .line 124
    .line 125
    move-result-object v2

    .line 126
    invoke-interface {v2}, Ll/r97;->g()Z

    .line 127
    .line 128
    .line 129
    move-result v2

    .line 130
    if-eqz v2, :cond_4

    .line 131
    .line 132
    invoke-virtual {v1}, Ll/clz;->q4()Z

    .line 133
    .line 134
    .line 135
    move-result v2

    .line 136
    if-eqz v2, :cond_4

    .line 137
    .line 138
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    invoke-static {v2}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 143
    .line 144
    .line 145
    move-result v2

    .line 146
    if-eqz v2, :cond_4

    .line 147
    .line 148
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 149
    .line 150
    .line 151
    move-result-object v2

    .line 152
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->isTeamAccount()Z

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    if-nez v2, :cond_4

    .line 157
    .line 158
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    invoke-virtual {v2}, Lcom/p1/mobile/putong/data/User;->onlineMatchLocked()Z

    .line 163
    .line 164
    .line 165
    move-result v2

    .line 166
    if-nez v2, :cond_4

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    invoke-virtual {v2}, Ll/j49;->b()Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;

    .line 173
    .line 174
    .line 175
    move-result-object v2

    .line 176
    iget-object v3, v1, Ll/clz;->k:Lcom/p1/mobile/putong/core/data/Conversation;

    .line 177
    .line 178
    invoke-interface {v2, v3}, Lcom/p1/mobile/putong/core/buzz/service/CoreBuzzInnerService;->Pe(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 179
    .line 180
    .line 181
    move-result v2

    .line 182
    if-nez v2, :cond_4

    .line 183
    .line 184
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    invoke-virtual {v2}, Ll/j49;->i()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    invoke-interface {v2}, Ll/r97;->a1()Z

    .line 193
    .line 194
    .line 195
    move-result v2

    .line 196
    if-nez v2, :cond_3

    .line 197
    .line 198
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 199
    .line 200
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CAMERA:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 201
    .line 202
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VIDEO:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 203
    .line 204
    sget-object v5, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOCATION:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 205
    .line 206
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VOICE_CALL:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 207
    .line 208
    filled-new-array {v2, v3, v4, v5, v6}, [Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 213
    .line 214
    .line 215
    move-result-object v2

    .line 216
    goto :goto_1

    .line 217
    :cond_3
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CAMERA:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 218
    .line 219
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOCATION:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 220
    .line 221
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 222
    .line 223
    sget-object v5, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VOICE_CALL:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 224
    .line 225
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VIDEO:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 226
    .line 227
    filled-new-array {v2, v3, v4, v5, v6}, [Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 228
    .line 229
    .line 230
    move-result-object v2

    .line 231
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 232
    .line 233
    .line 234
    move-result-object v2

    .line 235
    goto :goto_1

    .line 236
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 237
    .line 238
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CAMERA:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 239
    .line 240
    sget-object v4, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VIDEO:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 241
    .line 242
    sget-object v5, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOCATION:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 243
    .line 244
    filled-new-array {v2, v3, v4, v5}, [Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 245
    .line 246
    .line 247
    move-result-object v2

    .line 248
    invoke-static {v2}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 249
    .line 250
    .line 251
    move-result-object v2

    .line 252
    :goto_1
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 253
    .line 254
    .line 255
    move-result-object v3

    .line 256
    invoke-interface {v3}, Ll/mzl;->l()Ll/clz;

    .line 257
    .line 258
    .line 259
    move-result-object v3

    .line 260
    instance-of v3, v3, Ll/jlz;

    .line 261
    .line 262
    if-nez v3, :cond_5

    .line 263
    .line 264
    invoke-static {}, Ll/xzm0;->p()Ll/xzm0;

    .line 265
    .line 266
    .line 267
    move-result-object v3

    .line 268
    invoke-virtual {v3}, Ll/xzm0;->s()Z

    .line 269
    .line 270
    .line 271
    move-result v3

    .line 272
    if-eqz v3, :cond_6

    .line 273
    .line 274
    :cond_5
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VOICE_CALL:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 275
    .line 276
    invoke-interface {v2, v3}, Ljava/util/List;->remove(Ljava/lang/Object;)Z

    .line 277
    .line 278
    .line 279
    :cond_6
    invoke-virtual {v1}, Ll/clz;->b6()Z

    .line 280
    .line 281
    .line 282
    move-result v3

    .line 283
    if-eqz v3, :cond_7

    .line 284
    .line 285
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->EXCLUSIVE_CHAT:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 286
    .line 287
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 288
    .line 289
    .line 290
    :cond_7
    iget-object v3, v1, Ll/clz;->c:Ljava/lang/String;

    .line 291
    .line 292
    invoke-virtual {v1}, Ll/clz;->e4()Z

    .line 293
    .line 294
    .line 295
    move-result v4

    .line 296
    invoke-static {v3, v4}, Ll/uxy;->f(Ljava/lang/String;Z)Z

    .line 297
    .line 298
    .line 299
    move-result v3

    .line 300
    if-eqz v3, :cond_8

    .line 301
    .line 302
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->NEW_PIC:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 303
    .line 304
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 305
    .line 306
    .line 307
    :cond_8
    iget-object v3, v1, Ll/clz;->c:Ljava/lang/String;

    .line 308
    .line 309
    invoke-virtual {v1}, Ll/clz;->e4()Z

    .line 310
    .line 311
    .line 312
    move-result v4

    .line 313
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 314
    .line 315
    .line 316
    move-result-object v5

    .line 317
    invoke-static {v3, v4, v5}, Ll/uxy;->g(Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)Z

    .line 318
    .line 319
    .line 320
    move-result v3

    .line 321
    if-eqz v3, :cond_9

    .line 322
    .line 323
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOVE_LETTER:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 324
    .line 325
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 326
    .line 327
    .line 328
    :cond_9
    iget-object v3, v1, Ll/clz;->c:Ljava/lang/String;

    .line 329
    .line 330
    invoke-virtual {v1}, Ll/clz;->e4()Z

    .line 331
    .line 332
    .line 333
    move-result v4

    .line 334
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 335
    .line 336
    .line 337
    move-result-object v5

    .line 338
    invoke-static {v3, v4, v5}, Ll/uxy;->h(Ljava/lang/String;ZLcom/p1/mobile/putong/data/User;)Z

    .line 339
    .line 340
    .line 341
    move-result v3

    .line 342
    if-eqz v3, :cond_a

    .line 343
    .line 344
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->SWAP_ANSWER:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 345
    .line 346
    invoke-interface {v2, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 347
    .line 348
    .line 349
    :cond_a
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 350
    .line 351
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 352
    .line 353
    invoke-virtual {p1}, Ll/j3z;->e0()Ll/mzl;

    .line 354
    .line 355
    .line 356
    move-result-object p1

    .line 357
    invoke-interface {p1}, Ll/mzl;->l()Ll/clz;

    .line 358
    .line 359
    .line 360
    move-result-object p1

    .line 361
    invoke-virtual {p1}, Ll/clz;->r3()Ljava/lang/String;

    .line 362
    .line 363
    .line 364
    move-result-object p1

    .line 365
    invoke-virtual {v3, p1}, Lcom/p1/mobile/putong/core/api/g;->Xe(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/Conversation;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    invoke-static {p1}, Ll/pm6;->e(Lcom/p1/mobile/putong/core/data/Conversation;)Z

    .line 370
    .line 371
    .line 372
    move-result p1

    .line 373
    if-eqz p1, :cond_b

    .line 374
    .line 375
    sget-object p1, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 376
    .line 377
    sget-object v2, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VOICE_CALL:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 378
    .line 379
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOCATION:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 380
    .line 381
    filled-new-array {p1, v2, v3}, [Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 382
    .line 383
    .line 384
    move-result-object p1

    .line 385
    invoke-static {p1}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 386
    .line 387
    .line 388
    move-result-object v2

    .line 389
    :cond_b
    const/4 p1, 0x0

    .line 390
    :goto_2
    invoke-interface {v2}, Ljava/util/List;->size()I

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    if-ge p1, v3, :cond_1e

    .line 395
    .line 396
    sget-object v3, Ll/etx$a;->a:[I

    .line 397
    .line 398
    invoke-interface {v2, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v4

    .line 402
    check-cast v4, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 403
    .line 404
    invoke-virtual {v4}, Ljava/lang/Enum;->ordinal()I

    .line 405
    .line 406
    .line 407
    move-result v4

    .line 408
    aget v3, v3, v4

    .line 409
    .line 410
    const/4 v4, 0x1

    .line 411
    packed-switch v3, :pswitch_data_0

    .line 412
    .line 413
    .line 414
    goto/16 :goto_11

    .line 415
    .line 416
    :pswitch_0
    new-instance v3, Ll/h0r;

    .line 417
    .line 418
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 419
    .line 420
    .line 421
    move-result-object v5

    .line 422
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 423
    .line 424
    .line 425
    move-result-object v5

    .line 426
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 427
    .line 428
    .line 429
    move-result v5

    .line 430
    if-eqz v5, :cond_c

    .line 431
    .line 432
    sget v5, Ll/ibc0;->H7:I

    .line 433
    .line 434
    goto :goto_3

    .line 435
    :cond_c
    sget v5, Ll/ibc0;->G7:I

    .line 436
    .line 437
    :goto_3
    const-string v6, "\u4ea4\u6362\u7b54\u6848"

    .line 438
    .line 439
    sget-object v7, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->SWAP_ANSWER:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 440
    .line 441
    invoke-direct {v3, v5, v6, v7}, Ll/h0r;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 442
    .line 443
    .line 444
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 445
    .line 446
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 447
    .line 448
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/g;->B1:Ll/jxd0;

    .line 449
    .line 450
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object v5

    .line 454
    check-cast v5, Ljava/lang/Boolean;

    .line 455
    .line 456
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 457
    .line 458
    .line 459
    move-result v5

    .line 460
    if-nez v5, :cond_d

    .line 461
    .line 462
    invoke-virtual {v3, v4}, Ll/h0r;->c(Z)Ll/h0r;

    .line 463
    .line 464
    .line 465
    :cond_d
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 466
    .line 467
    .line 468
    goto/16 :goto_11

    .line 469
    .line 470
    :pswitch_1
    new-instance v3, Ll/h0r;

    .line 471
    .line 472
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 473
    .line 474
    .line 475
    move-result-object v4

    .line 476
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 477
    .line 478
    .line 479
    move-result-object v4

    .line 480
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 481
    .line 482
    .line 483
    move-result v4

    .line 484
    if-eqz v4, :cond_e

    .line 485
    .line 486
    sget v4, Ll/ibc0;->n1:I

    .line 487
    .line 488
    goto :goto_4

    .line 489
    :cond_e
    sget v4, Ll/ibc0;->m1:I

    .line 490
    .line 491
    :goto_4
    const-string v5, "\u4f20\u9012\u60c5\u4e66"

    .line 492
    .line 493
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOVE_LETTER:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 494
    .line 495
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 496
    .line 497
    .line 498
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 499
    .line 500
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 501
    .line 502
    iget-object v4, v4, Ll/dkb;->U1:Lrx/subjects/a;

    .line 503
    .line 504
    invoke-virtual {v4}, Lrx/subjects/a;->e()Ljava/lang/Object;

    .line 505
    .line 506
    .line 507
    move-result-object v4

    .line 508
    check-cast v4, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;

    .line 509
    .line 510
    if-eqz v4, :cond_f

    .line 511
    .line 512
    iget v5, v4, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 513
    .line 514
    if-lez v5, :cond_f

    .line 515
    .line 516
    invoke-static {}, Ljava/util/Locale;->getDefault()Ljava/util/Locale;

    .line 517
    .line 518
    .line 519
    move-result-object v5

    .line 520
    iget v4, v4, Lcom/p1/mobile/putong/core/data/LoveLetterEntryInfo;->count:I

    .line 521
    .line 522
    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 523
    .line 524
    .line 525
    move-result-object v4

    .line 526
    filled-new-array {v4}, [Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object v4

    .line 530
    const-string v6, "\u53ef\u53d1\u9001%d\u5c01\u60c5\u4e66"

    .line 531
    .line 532
    invoke-static {v5, v6, v4}, Ljava/lang/String;->format(Ljava/util/Locale;Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 533
    .line 534
    .line 535
    move-result-object v4

    .line 536
    invoke-virtual {v3, v4}, Ll/h0r;->d(Ljava/lang/String;)Ll/h0r;

    .line 537
    .line 538
    .line 539
    sget-object v4, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 540
    .line 541
    iget-object v4, v4, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 542
    .line 543
    iget-object v4, v4, Ll/dkb;->U1:Lrx/subjects/a;

    .line 544
    .line 545
    new-instance v5, Ll/ctx;

    .line 546
    .line 547
    invoke-direct {v5}, Ll/ctx;-><init>()V

    .line 548
    .line 549
    .line 550
    invoke-virtual {v4, v5}, Lrx/c;->map(Ll/qcj;)Lrx/c;

    .line 551
    .line 552
    .line 553
    move-result-object v4

    .line 554
    invoke-virtual {v3, v4}, Ll/h0r;->e(Lrx/c;)Ll/h0r;

    .line 555
    .line 556
    .line 557
    goto :goto_5

    .line 558
    :cond_f
    const-string v4, ""

    .line 559
    .line 560
    invoke-virtual {v3, v4}, Ll/h0r;->d(Ljava/lang/String;)Ll/h0r;

    .line 561
    .line 562
    .line 563
    :goto_5
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 564
    .line 565
    .line 566
    goto/16 :goto_11

    .line 567
    .line 568
    :pswitch_2
    new-instance v3, Ll/h0r;

    .line 569
    .line 570
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 571
    .line 572
    .line 573
    move-result-object v5

    .line 574
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 575
    .line 576
    .line 577
    move-result-object v5

    .line 578
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 579
    .line 580
    .line 581
    move-result v5

    .line 582
    if-eqz v5, :cond_10

    .line 583
    .line 584
    sget v5, Ll/ibc0;->N3:I

    .line 585
    .line 586
    goto :goto_6

    .line 587
    :cond_10
    sget v5, Ll/ibc0;->M3:I

    .line 588
    .line 589
    :goto_6
    const-string v6, "\u56fe\u7247\u73a9\u6cd5"

    .line 590
    .line 591
    sget-object v7, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->NEW_PIC:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 592
    .line 593
    invoke-direct {v3, v5, v6, v7}, Ll/h0r;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 594
    .line 595
    .line 596
    sget-object v5, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 597
    .line 598
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 599
    .line 600
    iget-object v5, v5, Lcom/p1/mobile/putong/core/api/g;->A1:Ll/jxd0;

    .line 601
    .line 602
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 603
    .line 604
    .line 605
    move-result-object v5

    .line 606
    check-cast v5, Ljava/lang/Boolean;

    .line 607
    .line 608
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 609
    .line 610
    .line 611
    move-result v5

    .line 612
    if-nez v5, :cond_11

    .line 613
    .line 614
    invoke-virtual {v3, v4}, Ll/h0r;->c(Z)Ll/h0r;

    .line 615
    .line 616
    .line 617
    :cond_11
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 618
    .line 619
    .line 620
    goto/16 :goto_11

    .line 621
    .line 622
    :pswitch_3
    invoke-virtual {v1}, Ll/clz;->x6()Lcom/p1/mobile/putong/data/User;

    .line 623
    .line 624
    .line 625
    move-result-object v3

    .line 626
    new-instance v5, Ll/h0r;

    .line 627
    .line 628
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 629
    .line 630
    .line 631
    move-result-object v6

    .line 632
    invoke-virtual {v6}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 633
    .line 634
    .line 635
    move-result-object v6

    .line 636
    invoke-interface {v6}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 637
    .line 638
    .line 639
    move-result v6

    .line 640
    if-eqz v6, :cond_12

    .line 641
    .line 642
    sget v6, Ll/ibc0;->r3:I

    .line 643
    .line 644
    goto :goto_7

    .line 645
    :cond_12
    sget v6, Ll/ibc0;->q3:I

    .line 646
    .line 647
    :goto_7
    invoke-static {v3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 648
    .line 649
    .line 650
    move-result v7

    .line 651
    if-eqz v7, :cond_13

    .line 652
    .line 653
    iget-object v3, v3, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 654
    .line 655
    const-string v7, "female"

    .line 656
    .line 657
    invoke-static {v3, v7}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 658
    .line 659
    .line 660
    move-result v3

    .line 661
    if-eqz v3, :cond_13

    .line 662
    .line 663
    const-string v3, "\u5979"

    .line 664
    .line 665
    goto :goto_8

    .line 666
    :cond_13
    const-string v3, "\u4ed6"

    .line 667
    .line 668
    :goto_8
    filled-new-array {v3}, [Ljava/lang/Object;

    .line 669
    .line 670
    .line 671
    move-result-object v3

    .line 672
    const-string v7, "\u9001%s\u9b54\u6cd5\u7167"

    .line 673
    .line 674
    invoke-static {v7, v3}, Ljava/lang/String;->format(Ljava/lang/String;[Ljava/lang/Object;)Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v3

    .line 678
    sget-object v7, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->AICG:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 679
    .line 680
    invoke-direct {v5, v6, v3, v7}, Ll/h0r;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 681
    .line 682
    .line 683
    iget-object v3, p0, Ll/etx;->e:Ll/jxd0;

    .line 684
    .line 685
    invoke-virtual {v3}, Ll/azd0;->get()Ljava/lang/Object;

    .line 686
    .line 687
    .line 688
    move-result-object v3

    .line 689
    check-cast v3, Ljava/lang/Boolean;

    .line 690
    .line 691
    invoke-virtual {v3}, Ljava/lang/Boolean;->booleanValue()Z

    .line 692
    .line 693
    .line 694
    move-result v3

    .line 695
    if-nez v3, :cond_14

    .line 696
    .line 697
    invoke-virtual {v5, v4}, Ll/h0r;->c(Z)Ll/h0r;

    .line 698
    .line 699
    .line 700
    :cond_14
    invoke-interface {v0, v5}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 701
    .line 702
    .line 703
    goto/16 :goto_11

    .line 704
    .line 705
    :pswitch_4
    new-instance v3, Ll/h0r;

    .line 706
    .line 707
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 708
    .line 709
    .line 710
    move-result-object v5

    .line 711
    invoke-virtual {v5}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 712
    .line 713
    .line 714
    move-result-object v5

    .line 715
    invoke-interface {v5}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 716
    .line 717
    .line 718
    move-result v5

    .line 719
    if-eqz v5, :cond_15

    .line 720
    .line 721
    sget v5, Ll/ibc0;->Y:I

    .line 722
    .line 723
    goto :goto_9

    .line 724
    :cond_15
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 725
    .line 726
    .line 727
    move-result-object v5

    .line 728
    invoke-virtual {v5}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 729
    .line 730
    .line 731
    move-result-object v5

    .line 732
    invoke-interface {v5}, Ll/r97;->N0()I

    .line 733
    .line 734
    .line 735
    move-result v5

    .line 736
    :goto_9
    const-string v6, "\u4e13\u5c5e\u804a\u5929"

    .line 737
    .line 738
    sget-object v7, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->EXCLUSIVE_CHAT:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 739
    .line 740
    invoke-direct {v3, v5, v6, v7}, Ll/h0r;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 741
    .line 742
    .line 743
    iget-object v5, p0, Ll/etx;->d:Ll/jxd0;

    .line 744
    .line 745
    invoke-virtual {v5}, Ll/azd0;->get()Ljava/lang/Object;

    .line 746
    .line 747
    .line 748
    move-result-object v5

    .line 749
    check-cast v5, Ljava/lang/Boolean;

    .line 750
    .line 751
    invoke-virtual {v5}, Ljava/lang/Boolean;->booleanValue()Z

    .line 752
    .line 753
    .line 754
    move-result v5

    .line 755
    if-nez v5, :cond_16

    .line 756
    .line 757
    invoke-virtual {v3, v4}, Ll/h0r;->c(Z)Ll/h0r;

    .line 758
    .line 759
    .line 760
    :cond_16
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 761
    .line 762
    .line 763
    goto/16 :goto_11

    .line 764
    .line 765
    :pswitch_5
    new-instance v3, Ll/h0r;

    .line 766
    .line 767
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 768
    .line 769
    .line 770
    move-result-object v4

    .line 771
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 772
    .line 773
    .line 774
    move-result-object v4

    .line 775
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 776
    .line 777
    .line 778
    move-result v4

    .line 779
    if-eqz v4, :cond_17

    .line 780
    .line 781
    sget v4, Ll/ibc0;->S1:I

    .line 782
    .line 783
    goto :goto_a

    .line 784
    :cond_17
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 785
    .line 786
    .line 787
    move-result-object v4

    .line 788
    invoke-virtual {v4}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 789
    .line 790
    .line 791
    move-result-object v4

    .line 792
    invoke-interface {v4}, Ll/r97;->N2()I

    .line 793
    .line 794
    .line 795
    move-result v4

    .line 796
    :goto_a
    const-string v5, "\u771f\u76f8\u6d4b\u8bd5"

    .line 797
    .line 798
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CHALLENGE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 799
    .line 800
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(ILjava/lang/String;Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 801
    .line 802
    .line 803
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 804
    .line 805
    .line 806
    goto/16 :goto_11

    .line 807
    .line 808
    :pswitch_6
    new-instance v3, Ll/h0r;

    .line 809
    .line 810
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 811
    .line 812
    .line 813
    move-result-object v4

    .line 814
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 815
    .line 816
    .line 817
    move-result-object v4

    .line 818
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 819
    .line 820
    .line 821
    move-result v4

    .line 822
    if-eqz v4, :cond_18

    .line 823
    .line 824
    sget v4, Ll/ibc0;->b3:I

    .line 825
    .line 826
    goto :goto_b

    .line 827
    :cond_18
    sget v4, Ll/ibc0;->a3:I

    .line 828
    .line 829
    :goto_b
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->j0:I

    .line 830
    .line 831
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->RED_PACKAGE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 832
    .line 833
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 834
    .line 835
    .line 836
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 837
    .line 838
    .line 839
    goto/16 :goto_11

    .line 840
    .line 841
    :pswitch_7
    new-instance v3, Ll/h0r;

    .line 842
    .line 843
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 844
    .line 845
    .line 846
    move-result-object v4

    .line 847
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 848
    .line 849
    .line 850
    move-result-object v4

    .line 851
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 852
    .line 853
    .line 854
    move-result v4

    .line 855
    if-eqz v4, :cond_19

    .line 856
    .line 857
    sget v4, Ll/ibc0;->f3:I

    .line 858
    .line 859
    goto :goto_c

    .line 860
    :cond_19
    sget v4, Ll/ibc0;->e3:I

    .line 861
    .line 862
    :goto_c
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->H6:I

    .line 863
    .line 864
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VOICE_CALL:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 865
    .line 866
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 867
    .line 868
    .line 869
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 870
    .line 871
    .line 872
    goto/16 :goto_11

    .line 873
    .line 874
    :pswitch_8
    new-instance v3, Ll/h0r;

    .line 875
    .line 876
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 877
    .line 878
    .line 879
    move-result-object v4

    .line 880
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 881
    .line 882
    .line 883
    move-result-object v4

    .line 884
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 885
    .line 886
    .line 887
    move-result v4

    .line 888
    if-eqz v4, :cond_1a

    .line 889
    .line 890
    sget v4, Ll/ibc0;->X2:I

    .line 891
    .line 892
    goto :goto_d

    .line 893
    :cond_1a
    sget v4, Ll/ibc0;->W2:I

    .line 894
    .line 895
    :goto_d
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->p3:I

    .line 896
    .line 897
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->LOCATION:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 898
    .line 899
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 900
    .line 901
    .line 902
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 903
    .line 904
    .line 905
    goto :goto_11

    .line 906
    :pswitch_9
    new-instance v3, Ll/h0r;

    .line 907
    .line 908
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 909
    .line 910
    .line 911
    move-result-object v4

    .line 912
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 913
    .line 914
    .line 915
    move-result-object v4

    .line 916
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 917
    .line 918
    .line 919
    move-result v4

    .line 920
    if-eqz v4, :cond_1b

    .line 921
    .line 922
    sget v4, Ll/ibc0;->d3:I

    .line 923
    .line 924
    goto :goto_e

    .line 925
    :cond_1b
    sget v4, Ll/ibc0;->c3:I

    .line 926
    .line 927
    :goto_e
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->o3:I

    .line 928
    .line 929
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->VIDEO:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 930
    .line 931
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 932
    .line 933
    .line 934
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 935
    .line 936
    .line 937
    goto :goto_11

    .line 938
    :pswitch_a
    new-instance v3, Ll/h0r;

    .line 939
    .line 940
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 941
    .line 942
    .line 943
    move-result-object v4

    .line 944
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 945
    .line 946
    .line 947
    move-result-object v4

    .line 948
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 949
    .line 950
    .line 951
    move-result v4

    .line 952
    if-eqz v4, :cond_1c

    .line 953
    .line 954
    sget v4, Ll/ibc0;->V2:I

    .line 955
    .line 956
    goto :goto_f

    .line 957
    :cond_1c
    sget v4, Ll/ibc0;->U2:I

    .line 958
    .line 959
    :goto_f
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->n3:I

    .line 960
    .line 961
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->CAMERA:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 962
    .line 963
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 964
    .line 965
    .line 966
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 967
    .line 968
    .line 969
    goto :goto_11

    .line 970
    :pswitch_b
    new-instance v3, Ll/h0r;

    .line 971
    .line 972
    invoke-static {}, Ll/gta;->e()Ll/gta;

    .line 973
    .line 974
    .line 975
    move-result-object v4

    .line 976
    invoke-virtual {v4}, Ll/gta;->d()Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;

    .line 977
    .line 978
    .line 979
    move-result-object v4

    .line 980
    invoke-interface {v4}, Lcom/p1/mobile/putong/core/api/inject/provider/CoreProviderInterface;->I4()Z

    .line 981
    .line 982
    .line 983
    move-result v4

    .line 984
    if-eqz v4, :cond_1d

    .line 985
    .line 986
    sget v4, Ll/ibc0;->Z2:I

    .line 987
    .line 988
    goto :goto_10

    .line 989
    :cond_1d
    sget v4, Ll/ibc0;->Y2:I

    .line 990
    .line 991
    :goto_10
    sget v5, Lcom/p1/mobile/putong/core/message/R$string;->L1:I

    .line 992
    .line 993
    sget-object v6, Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;->PICTURE:Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 994
    .line 995
    invoke-direct {v3, v4, v5, v6}, Ll/h0r;-><init>(IILcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 996
    .line 997
    .line 998
    invoke-interface {v0, v3}, Ljava/util/List;->add(Ljava/lang/Object;)Z

    .line 999
    .line 1000
    .line 1001
    :goto_11
    add-int/lit8 p1, p1, 0x1

    .line 1002
    .line 1003
    goto/16 :goto_2

    .line 1004
    .line 1005
    :cond_1e
    iget-object p1, p0, Ll/etx;->b:Ll/g0r;

    .line 1006
    .line 1007
    invoke-virtual {p1, v0}, Ll/g0r;->d(Ljava/util/List;)V

    .line 1008
    .line 1009
    .line 1010
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 1011
    .line 1012
    .line 1013
    move-result-object p1

    .line 1014
    :goto_12
    invoke-interface {p1}, Ljava/util/Iterator;->hasNext()Z

    .line 1015
    .line 1016
    .line 1017
    move-result v0

    .line 1018
    if-eqz v0, :cond_1f

    .line 1019
    .line 1020
    invoke-interface {p1}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 1021
    .line 1022
    .line 1023
    move-result-object v0

    .line 1024
    check-cast v0, Ll/h0r;

    .line 1025
    .line 1026
    invoke-virtual {v0, p0}, Ll/h0r;->b(Ll/btx;)V

    .line 1027
    .line 1028
    .line 1029
    goto :goto_12

    .line 1030
    :cond_1f
    iget-object p0, p0, Ll/etx;->b:Ll/g0r;

    .line 1031
    .line 1032
    return-object p0

    .line 1033
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_b
        :pswitch_a
        :pswitch_9
        :pswitch_8
        :pswitch_7
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
        :pswitch_0
    .end packed-switch
.end method

.method public e()Lrx/c;
    .locals 0
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "()",
            "Lrx/c<",
            "Ll/pf60<",
            "Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;",
            "Ljava/lang/Boolean;",
            ">;>;"
        }
    .end annotation

    .line 1
    iget-object p0, p0, Ll/etx;->c:Lrx/subjects/b;

    .line 2
    .line 3
    return-object p0
.end method

.method public f(Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V
    .locals 1

    .line 1
    sget-object p0, Ll/etx$a;->a:[I

    .line 2
    .line 3
    invoke-virtual {p1}, Ljava/lang/Enum;->ordinal()I

    .line 4
    .line 5
    .line 6
    move-result p1

    .line 7
    aget p0, p0, p1

    .line 8
    .line 9
    const/4 p1, 0x0

    .line 10
    const-string v0, "p_chat_view"

    .line 11
    .line 12
    packed-switch p0, :pswitch_data_0

    .line 13
    .line 14
    .line 15
    :pswitch_0
    return-void

    .line 16
    :pswitch_1
    const-string p0, "e_exchange_answer"

    .line 17
    .line 18
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 19
    .line 20
    .line 21
    return-void

    .line 22
    :pswitch_2
    const-string p0, "e_love_letter"

    .line 23
    .line 24
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 25
    .line 26
    .line 27
    return-void

    .line 28
    :pswitch_3
    const-string p0, "e_newphoto_icon"

    .line 29
    .line 30
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 31
    .line 32
    .line 33
    return-void

    .line 34
    :pswitch_4
    const-string p0, "e_paip_chat_bottom_more"

    .line 35
    .line 36
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 37
    .line 38
    .line 39
    return-void

    .line 40
    :pswitch_5
    const-string p0, "e_private_chat_entrance"

    .line 41
    .line 42
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 43
    .line 44
    .line 45
    return-void

    .line 46
    :pswitch_6
    const-string p0, "e_in_harmony_test_entrance_two"

    .line 47
    .line 48
    invoke-static {p0, v0}, Ll/i4g0;->x(Ljava/lang/String;Ljava/lang/String;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :pswitch_7
    const-string p0, "e_chat_more_voice_call"

    .line 53
    .line 54
    new-array p1, p1, [Ll/sfj0$a;

    .line 55
    .line 56
    invoke-static {p0, v0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 57
    .line 58
    .line 59
    return-void

    .line 60
    :pswitch_8
    const-string p0, "e_chat_more_location"

    .line 61
    .line 62
    new-array p1, p1, [Ll/sfj0$a;

    .line 63
    .line 64
    invoke-static {p0, v0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 65
    .line 66
    .line 67
    return-void

    .line 68
    :pswitch_9
    const-string p0, "e_chat_more_shoot"

    .line 69
    .line 70
    new-array p1, p1, [Ll/sfj0$a;

    .line 71
    .line 72
    invoke-static {p0, v0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 73
    .line 74
    .line 75
    return-void

    .line 76
    :pswitch_a
    const-string p0, "e_chat_more_picture"

    .line 77
    .line 78
    new-array p1, p1, [Ll/sfj0$a;

    .line 79
    .line 80
    invoke-static {p0, v0, p1}, Ll/sfj0;->h(Ljava/lang/String;Ljava/lang/String;[Ll/sfj0$a;)V

    .line 81
    .line 82
    .line 83
    return-void

    .line 84
    nop

    .line 85
    :pswitch_data_0
    .packed-switch 0x1
        :pswitch_a
        :pswitch_9
        :pswitch_0
        :pswitch_8
        :pswitch_7
        :pswitch_0
        :pswitch_6
        :pswitch_5
        :pswitch_4
        :pswitch_3
        :pswitch_2
        :pswitch_1
    .end packed-switch
.end method

.method public g()V
    .locals 2

    .line 1
    iget-object v0, p0, Ll/etx;->b:Ll/g0r;

    .line 2
    .line 3
    invoke-static {v0}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 4
    .line 5
    .line 6
    move-result v0

    .line 7
    if-eqz v0, :cond_0

    .line 8
    .line 9
    iget-object v0, p0, Ll/etx;->b:Ll/g0r;

    .line 10
    .line 11
    iget-object v0, v0, Ll/g0r;->a:Ljava/util/List;

    .line 12
    .line 13
    invoke-static {v0}, Ll/jyb;->J(Ljava/util/Collection;)Z

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    if-nez v0, :cond_0

    .line 18
    .line 19
    iget-object v0, p0, Ll/etx;->b:Ll/g0r;

    .line 20
    .line 21
    iget-object v0, v0, Ll/g0r;->a:Ljava/util/List;

    .line 22
    .line 23
    invoke-interface {v0}, Ljava/util/List;->iterator()Ljava/util/Iterator;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    :goto_0
    invoke-interface {v0}, Ljava/util/Iterator;->hasNext()Z

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    if-eqz v1, :cond_0

    .line 32
    .line 33
    invoke-interface {v0}, Ljava/util/Iterator;->next()Ljava/lang/Object;

    .line 34
    .line 35
    .line 36
    move-result-object v1

    .line 37
    check-cast v1, Ll/h0r;

    .line 38
    .line 39
    invoke-virtual {v1}, Ll/h0r;->a()Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;

    .line 40
    .line 41
    .line 42
    move-result-object v1

    .line 43
    invoke-virtual {p0, v1}, Ll/etx;->f(Lcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V

    .line 44
    .line 45
    .line 46
    goto :goto_0

    .line 47
    :cond_0
    return-void
.end method

.method public h(ZLcom/p1/mobile/putong/core/ui/messages/base/MedialItemType;)V
    .locals 0

    .line 1
    iget-object p0, p0, Ll/etx;->c:Lrx/subjects/b;

    .line 2
    .line 3
    invoke-static {p1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 4
    .line 5
    .line 6
    move-result-object p1

    .line 7
    invoke-static {p2, p1}, Ll/pf60;->a(Ljava/lang/Object;Ljava/lang/Object;)Ll/pf60;

    .line 8
    .line 9
    .line 10
    move-result-object p1

    .line 11
    invoke-virtual {p0, p1}, Lrx/subjects/b;->onNext(Ljava/lang/Object;)V

    .line 12
    .line 13
    .line 14
    return-void
.end method

.method public final i()V
    .locals 3

    .line 1
    iget-object p0, p0, Ll/etx;->a:Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;

    .line 2
    .line 3
    iget-object v0, p0, Lcom/p1/mobile/putong/core/ui/messages/MessagesAct;->f:Ll/clz;

    .line 4
    .line 5
    invoke-virtual {v0}, Ll/clz;->r3()Ljava/lang/String;

    .line 6
    .line 7
    .line 8
    move-result-object v0

    .line 9
    const-string v1, ""

    .line 10
    .line 11
    const-string v2, "from_entrance_type"

    .line 12
    .line 13
    invoke-static {p0, v0, v1, v2}, Ll/r600;->t(Lcom/p1/mobile/putong/app/PutongAct;Ljava/lang/String;Ljava/lang/String;Ljava/lang/String;)V

    .line 14
    .line 15
    .line 16
    return-void
.end method
