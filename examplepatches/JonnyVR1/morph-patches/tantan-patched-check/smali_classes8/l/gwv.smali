.class public Ll/gwv;
.super Ljava/lang/Object;
.source "SourceFile"

# interfaces
.implements Ll/vwl;


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

.method public static synthetic d(Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const/4 v0, 0x2

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->triggerType:I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->toJson()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method

.method public static synthetic e(Lcom/p1/mobile/putong/core/data/LoveLetterContent;Lcom/p1/mobile/putong/core/data/Message;)V
    .locals 1

    .line 1
    const/4 v0, 0x1

    .line 2
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->triggerType:I

    .line 3
    .line 4
    invoke-virtual {p0}, Lcom/p1/mobile/putong/core/data/LoveLetterContent;->toJson()Ljava/lang/String;

    .line 5
    .line 6
    .line 7
    move-result-object p0

    .line 8
    iput-object p0, p1, Lcom/p1/mobile/putong/core/data/Message;->localExtraInfo:Ljava/lang/String;

    .line 9
    .line 10
    return-void
.end method


# virtual methods
.method public a()Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;
    .locals 0

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;->LOVE_LETTER_GUIDE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;

    .line 2
    .line 3
    return-object p0
.end method

.method public b(Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/data/User;Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Ljava/util/List;Lrx/subjects/a;)V
    .locals 16
    .param p2    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .param p3    # Lcom/p1/mobile/putong/data/User;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param
    .annotation system Ldalvik/annotation/Signature;
        value = {
            "(",
            "Lcom/p1/mobile/putong/core/data/Conversation;",
            "Lcom/p1/mobile/putong/core/data/Message;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/data/User;",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;",
            "Ljava/util/List<",
            "Lcom/p1/mobile/putong/core/ui/messages/manager/insert/LocalMsgInsertType;",
            ">;",
            "Lrx/subjects/a<",
            "Ljava/lang/Boolean;",
            ">;)V"
        }
    .end annotation

    .line 1
    move-object/from16 v0, p1

    .line 2
    .line 3
    move-object/from16 v1, p5

    .line 4
    .line 5
    move-object/from16 v2, p7

    .line 6
    .line 7
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->CONV_MSG_CHANGE:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 8
    .line 9
    const-string v4, "local_love_letter_guide"

    .line 10
    .line 11
    if-ne v1, v3, :cond_6

    .line 12
    .line 13
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 14
    .line 15
    iget-object v1, v1, Ll/il8;->c:Ll/t600;

    .line 16
    .line 17
    sget-object v3, Lcom/p1/mobile/putong/core/data/Message;->CID:Lcom/tantanapp/common/data/orm/StringColumn;

    .line 18
    .line 19
    iget-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 20
    .line 21
    invoke-virtual {v3, v5}, Lcom/tantanapp/common/data/orm/ValueColumn;->EQ(Ljava/lang/Object;)Lcom/tantanapp/common/data/orm/Filter;

    .line 22
    .line 23
    .line 24
    move-result-object v3

    .line 25
    sget-object v5, Lcom/p1/mobile/putong/core/data/Message;->MESSAGETYPE:Lcom/p1/mobile/putong/data/tenum/TEnumColumn;

    .line 26
    .line 27
    invoke-virtual {v5, v4}, Lcom/p1/mobile/putong/data/tenum/TEnumColumn;->EQ(Ljava/lang/String;)Lcom/tantanapp/common/data/orm/Filter;

    .line 28
    .line 29
    .line 30
    move-result-object v5

    .line 31
    filled-new-array {v3, v5}, [Lcom/tantanapp/common/data/orm/Filter;

    .line 32
    .line 33
    .line 34
    move-result-object v3

    .line 35
    invoke-static {v3}, Lcom/tantanapp/common/data/orm/Filter;->AND([Lcom/tantanapp/common/data/orm/Filter;)Lcom/tantanapp/common/data/orm/Filter;

    .line 36
    .line 37
    .line 38
    move-result-object v3

    .line 39
    const/4 v5, 0x1

    .line 40
    invoke-virtual {v1, v3, v5}, Ll/wzh0;->count(Lcom/tantanapp/common/data/orm/Filter;I)I

    .line 41
    .line 42
    .line 43
    move-result v1

    .line 44
    if-lez v1, :cond_0

    .line 45
    .line 46
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 49
    .line 50
    .line 51
    return-void

    .line 52
    :cond_0
    invoke-static {}, Ll/h39;->n()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-static {}, Ll/h39;->q()I

    .line 57
    .line 58
    .line 59
    move-result v3

    .line 60
    sget-object v6, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 61
    .line 62
    iget-object v6, v6, Ll/il8;->c:Ll/t600;

    .line 63
    .line 64
    iget-object v7, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 65
    .line 66
    invoke-virtual {v6, v7, v7, v1}, Ll/t600;->t0(Ljava/lang/String;Ljava/lang/String;I)Ll/wzh0$a;

    .line 67
    .line 68
    .line 69
    move-result-object v6

    .line 70
    invoke-virtual {v6}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 71
    .line 72
    .line 73
    move-result-object v6

    .line 74
    sget-object v7, Lcom/p1/mobile/putong/core/CoreModule;->k:Ll/il8;

    .line 75
    .line 76
    iget-object v7, v7, Ll/il8;->c:Ll/t600;

    .line 77
    .line 78
    iget-object v8, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 79
    .line 80
    move-object/from16 v9, p4

    .line 81
    .line 82
    iget-object v9, v9, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 83
    .line 84
    invoke-virtual {v7, v8, v9, v1}, Ll/t600;->t0(Ljava/lang/String;Ljava/lang/String;I)Ll/wzh0$a;

    .line 85
    .line 86
    .line 87
    move-result-object v7

    .line 88
    invoke-virtual {v7}, Ll/wzh0$a;->j()Ljava/util/List;

    .line 89
    .line 90
    .line 91
    move-result-object v7

    .line 92
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 93
    .line 94
    .line 95
    move-result v8

    .line 96
    const-string v9, "love_letter_show_time_"

    .line 97
    .line 98
    const-wide/32 v10, 0x36ee80

    .line 99
    .line 100
    .line 101
    if-le v8, v1, :cond_1

    .line 102
    .line 103
    invoke-static {}, Ll/pzi0;->o()J

    .line 104
    .line 105
    .line 106
    move-result-wide v12

    .line 107
    long-to-double v12, v12

    .line 108
    invoke-interface {v6, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v8

    .line 112
    check-cast v8, Lcom/p1/mobile/putong/core/data/Message;

    .line 113
    .line 114
    iget-wide v14, v8, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 115
    .line 116
    sub-double/2addr v12, v14

    .line 117
    int-to-long v14, v3

    .line 118
    mul-long/2addr v14, v10

    .line 119
    long-to-double v14, v14

    .line 120
    cmpg-double v3, v12, v14

    .line 121
    .line 122
    if-gtz v3, :cond_1

    .line 123
    .line 124
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 125
    .line 126
    .line 127
    move-result v3

    .line 128
    if-le v3, v1, :cond_1

    .line 129
    .line 130
    invoke-static {}, Ll/pzi0;->o()J

    .line 131
    .line 132
    .line 133
    move-result-wide v12

    .line 134
    long-to-double v12, v12

    .line 135
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 140
    .line 141
    move-wide/from16 p2, v10

    .line 142
    .line 143
    iget-wide v10, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 144
    .line 145
    sub-double/2addr v12, v10

    .line 146
    cmpg-double v1, v12, v14

    .line 147
    .line 148
    if-gtz v1, :cond_2

    .line 149
    .line 150
    :try_start_0
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 151
    .line 152
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 153
    .line 154
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 155
    .line 156
    invoke-virtual {v1, v3}, Ll/dkb;->v7(Ljava/lang/String;)Lrx/c;

    .line 157
    .line 158
    .line 159
    move-result-object v1

    .line 160
    invoke-virtual {v1}, Lrx/c;->toBlocking()Ll/o43;

    .line 161
    .line 162
    .line 163
    move-result-object v1

    .line 164
    invoke-virtual {v1}, Ll/o43;->b()Ljava/lang/Object;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    check-cast v1, Lcom/p1/mobile/putong/core/data/LoveLetterContent;
    :try_end_0
    .catch Ljava/lang/Exception; {:try_start_0 .. :try_end_0} :catch_0

    .line 169
    .line 170
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 171
    .line 172
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 173
    .line 174
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 175
    .line 176
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 177
    .line 178
    .line 179
    move-result-object v4

    .line 180
    new-instance v5, Ll/ewv;

    .line 181
    .line 182
    invoke-direct {v5, v1}, Ll/ewv;-><init>(Lcom/p1/mobile/putong/core/data/LoveLetterContent;)V

    .line 183
    .line 184
    .line 185
    invoke-virtual {v3, v0, v4, v5}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 186
    .line 187
    .line 188
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->LoveLetterGuideShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 189
    .line 190
    invoke-static {}, Ll/pzi0;->o()J

    .line 191
    .line 192
    .line 193
    move-result-wide v3

    .line 194
    invoke-virtual {v0, v9, v3, v4}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 195
    .line 196
    .line 197
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 198
    .line 199
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 200
    .line 201
    .line 202
    return-void

    .line 203
    :catch_0
    move-exception v0

    .line 204
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 205
    .line 206
    .line 207
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 208
    .line 209
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 210
    .line 211
    .line 212
    return-void

    .line 213
    :cond_1
    move-wide/from16 p2, v10

    .line 214
    .line 215
    :cond_2
    invoke-static {}, Ll/h39;->o()I

    .line 216
    .line 217
    .line 218
    move-result v1

    .line 219
    invoke-static {}, Ll/h39;->p()I

    .line 220
    .line 221
    .line 222
    move-result v3

    .line 223
    invoke-interface {v7}, Ljava/util/List;->size()I

    .line 224
    .line 225
    .line 226
    move-result v8

    .line 227
    if-ge v1, v8, :cond_5

    .line 228
    .line 229
    invoke-interface {v6}, Ljava/util/List;->size()I

    .line 230
    .line 231
    .line 232
    move-result v8

    .line 233
    const/4 v10, 0x0

    .line 234
    if-eqz v8, :cond_3

    .line 235
    .line 236
    invoke-interface {v6, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 237
    .line 238
    .line 239
    move-result-object v6

    .line 240
    check-cast v6, Lcom/p1/mobile/putong/core/data/Message;

    .line 241
    .line 242
    iget-wide v11, v6, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 243
    .line 244
    sub-int/2addr v1, v5

    .line 245
    invoke-interface {v7, v1}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 246
    .line 247
    .line 248
    move-result-object v1

    .line 249
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 250
    .line 251
    iget-wide v5, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 252
    .line 253
    cmpg-double v1, v11, v5

    .line 254
    .line 255
    if-gez v1, :cond_5

    .line 256
    .line 257
    :cond_3
    invoke-static {}, Ll/pzi0;->o()J

    .line 258
    .line 259
    .line 260
    move-result-wide v5

    .line 261
    long-to-double v5, v5

    .line 262
    invoke-interface {v7, v10}, Ljava/util/List;->get(I)Ljava/lang/Object;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    check-cast v1, Lcom/p1/mobile/putong/core/data/Message;

    .line 267
    .line 268
    iget-wide v7, v1, Lcom/p1/mobile/putong/core/data/Message;->createdTime:D

    .line 269
    .line 270
    sub-double/2addr v5, v7

    .line 271
    int-to-long v7, v3

    .line 272
    mul-long v7, v7, p2

    .line 273
    .line 274
    long-to-double v7, v7

    .line 275
    cmpl-double v1, v5, v7

    .line 276
    .line 277
    if-lez v1, :cond_5

    .line 278
    .line 279
    :try_start_1
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 280
    .line 281
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 282
    .line 283
    iget-object v3, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 284
    .line 285
    invoke-virtual {v1, v3}, Ll/dkb;->v7(Ljava/lang/String;)Lrx/c;

    .line 286
    .line 287
    .line 288
    move-result-object v1

    .line 289
    invoke-virtual {v1}, Lrx/c;->toBlocking()Ll/o43;

    .line 290
    .line 291
    .line 292
    move-result-object v1

    .line 293
    invoke-virtual {v1}, Ll/o43;->b()Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v1

    .line 297
    check-cast v1, Lcom/p1/mobile/putong/core/data/LoveLetterContent;
    :try_end_1
    .catch Ljava/lang/Exception; {:try_start_1 .. :try_end_1} :catch_1

    .line 298
    .line 299
    invoke-static {v1}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 300
    .line 301
    .line 302
    move-result v3

    .line 303
    if-eqz v3, :cond_4

    .line 304
    .line 305
    sget-object v3, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 306
    .line 307
    iget-object v3, v3, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 308
    .line 309
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 310
    .line 311
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/MessageType;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/core/data/MessageType;

    .line 312
    .line 313
    .line 314
    move-result-object v4

    .line 315
    new-instance v5, Ll/fwv;

    .line 316
    .line 317
    invoke-direct {v5, v1}, Ll/fwv;-><init>(Lcom/p1/mobile/putong/core/data/LoveLetterContent;)V

    .line 318
    .line 319
    .line 320
    invoke-virtual {v3, v0, v4, v5}, Lcom/p1/mobile/putong/core/api/g;->ch(Ljava/lang/String;Lcom/p1/mobile/putong/core/data/MessageType;Ll/y20;)Lrx/c;

    .line 321
    .line 322
    .line 323
    sget-object v0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->LoveLetterGuideShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 324
    .line 325
    invoke-static {}, Ll/pzi0;->o()J

    .line 326
    .line 327
    .line 328
    move-result-wide v3

    .line 329
    invoke-virtual {v0, v9, v3, v4}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->setLong(Ljava/lang/String;J)V

    .line 330
    .line 331
    .line 332
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 333
    .line 334
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 335
    .line 336
    .line 337
    return-void

    .line 338
    :cond_4
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 339
    .line 340
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 341
    .line 342
    .line 343
    return-void

    .line 344
    :catch_1
    move-exception v0

    .line 345
    invoke-static {v0}, Lcom/tantanapp/common/utils/CrashHelper;->c(Ljava/lang/Throwable;)V

    .line 346
    .line 347
    .line 348
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 349
    .line 350
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 351
    .line 352
    .line 353
    return-void

    .line 354
    :cond_5
    sget-object v0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 355
    .line 356
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 357
    .line 358
    .line 359
    return-void

    .line 360
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 361
    .line 362
    if-ne v1, v3, :cond_7

    .line 363
    .line 364
    sget-object v1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 365
    .line 366
    iget-object v1, v1, Lcom/p1/mobile/putong/core/api/c;->f0:Lcom/p1/mobile/putong/core/api/g;

    .line 367
    .line 368
    iget-object v0, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 369
    .line 370
    filled-new-array {v4}, [Ljava/lang/String;

    .line 371
    .line 372
    .line 373
    move-result-object v3

    .line 374
    invoke-static {v3}, Ll/jyb;->f0([Ljava/lang/Object;)Ljava/util/ArrayList;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    invoke-virtual {v1, v0, v3}, Lcom/p1/mobile/putong/core/api/g;->Qf(Ljava/lang/String;Ljava/util/List;)V

    .line 379
    .line 380
    .line 381
    sget-object v0, Ljava/lang/Boolean;->TRUE:Ljava/lang/Boolean;

    .line 382
    .line 383
    invoke-virtual {v2, v0}, Lrx/subjects/a;->onNext(Ljava/lang/Object;)V

    .line 384
    .line 385
    .line 386
    :cond_7
    return-void
.end method

.method public c(Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;Lcom/p1/mobile/putong/core/data/Conversation;Lcom/p1/mobile/putong/core/data/Message;Lcom/p1/mobile/putong/data/User;)Z
    .locals 3
    .param p3    # Lcom/p1/mobile/putong/core/data/Message;
        .annotation build Landroidx/annotation/Nullable;
        .end annotation
    .end param

    .line 1
    iget-object p4, p2, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 2
    .line 3
    invoke-static {p4}, Lcom/p1/mobile/putong/data/User;->isTeamAccount(Ljava/lang/String;)Z

    .line 4
    .line 5
    .line 6
    move-result p4

    .line 7
    const/4 v0, 0x0

    .line 8
    if-eqz p4, :cond_0

    .line 9
    .line 10
    return v0

    .line 11
    :cond_0
    sget-object p4, Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;->PAGE_FINISH:Lcom/p1/mobile/putong/core/ui/messages/manager/insert/InsertLocalMsgTriggerType;

    .line 12
    .line 13
    const/4 v1, 0x1

    .line 14
    if-ne p1, p4, :cond_1

    .line 15
    .line 16
    return v1

    .line 17
    :cond_1
    invoke-static {p3}, Lcom/tantanapp/common/utils/NullChecker;->a(Ljava/lang/Object;)Z

    .line 18
    .line 19
    .line 20
    move-result p1

    .line 21
    if-eqz p1, :cond_2

    .line 22
    .line 23
    iget-object p1, p3, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 24
    .line 25
    const-string p4, "fake_id_"

    .line 26
    .line 27
    invoke-virtual {p1, p4}, Ljava/lang/String;->startsWith(Ljava/lang/String;)Z

    .line 28
    .line 29
    .line 30
    move-result p1

    .line 31
    if-eqz p1, :cond_2

    .line 32
    .line 33
    return v0

    .line 34
    :cond_2
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->status:Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 35
    .line 36
    const-string p4, "default"

    .line 37
    .line 38
    invoke-static {p4}, Lcom/p1/mobile/putong/data/ConversationStatus;->get(Ljava/lang/String;)Lcom/p1/mobile/putong/data/ConversationStatus;

    .line 39
    .line 40
    .line 41
    move-result-object v2

    .line 42
    if-eq p1, v2, :cond_3

    .line 43
    .line 44
    return v0

    .line 45
    :cond_3
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->convType:Ljava/lang/String;

    .line 46
    .line 47
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 48
    .line 49
    .line 50
    move-result p1

    .line 51
    if-eqz p1, :cond_7

    .line 52
    .line 53
    iget-object p1, p2, Lcom/p1/mobile/putong/core/data/Conversation;->otherStatus:Ljava/lang/String;

    .line 54
    .line 55
    invoke-static {p1, p4}, Landroid/text/TextUtils;->equals(Ljava/lang/CharSequence;Ljava/lang/CharSequence;)Z

    .line 56
    .line 57
    .line 58
    move-result p1

    .line 59
    if-nez p1, :cond_4

    .line 60
    .line 61
    goto :goto_0

    .line 62
    :cond_4
    if-eqz p3, :cond_5

    .line 63
    .line 64
    iget-object p1, p3, Lcom/p1/mobile/putong/core/data/Message;->messageType:Lcom/p1/mobile/putong/core/data/MessageType;

    .line 65
    .line 66
    const-string p2, "local_love_letter_guide"

    .line 67
    .line 68
    invoke-static {p1, p2}, Lcom/p1/mobile/putong/data/tenum/TEnum;->equals(Lcom/p1/mobile/putong/data/tenum/TEnum;Ljava/lang/String;)Z

    .line 69
    .line 70
    .line 71
    move-result p1

    .line 72
    if-eqz p1, :cond_5

    .line 73
    .line 74
    return v0

    .line 75
    :cond_5
    sget-object p1, Lcom/p1/mobile/putong/core/CoreModule;->c:Lcom/p1/mobile/putong/core/api/c;

    .line 76
    .line 77
    iget-object p1, p1, Lcom/p1/mobile/putong/core/api/c;->e0:Ll/dkb;

    .line 78
    .line 79
    invoke-virtual {p1}, Ll/dkb;->na()Lcom/p1/mobile/putong/data/User;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/User;->isPicVerificationVerified()Z

    .line 84
    .line 85
    .line 86
    move-result p1

    .line 87
    if-nez p1, :cond_6

    .line 88
    .line 89
    return v0

    .line 90
    :cond_6
    invoke-static {}, Lcom/p1/mobile/putong/core/CoreModule;->P()Ll/j49;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    invoke-virtual {p1}, Ll/j49;->a()Lcom/p1/mobile/putong/core/api/inject/provider/CoreBusinessService;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    invoke-interface {p1}, Ll/r97;->k3()Z

    .line 99
    .line 100
    .line 101
    move-result p1

    .line 102
    if-eqz p1, :cond_7

    .line 103
    .line 104
    invoke-virtual {p0}, Ll/gwv;->f()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    if-nez p0, :cond_7

    .line 109
    .line 110
    return v1

    .line 111
    :cond_7
    :goto_0
    return v0
.end method

.method public final f()Z
    .locals 6

    .line 1
    sget-object p0, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->LoveLetterGuideShowTime:Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;

    .line 2
    .line 3
    const-string v0, "love_letter_show_time_"

    .line 4
    .line 5
    invoke-virtual {p0, v0}, Lcom/p1/mobile/putong/core/newui/messages/util/ConversationCounterTypeSp;->getLong(Ljava/lang/String;)J

    .line 6
    .line 7
    .line 8
    move-result-wide v0

    .line 9
    invoke-static {}, Ll/pzi0;->o()J

    .line 10
    .line 11
    .line 12
    move-result-wide v2

    .line 13
    sub-long/2addr v2, v0

    .line 14
    invoke-static {}, Ll/h39;->m()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    int-to-long v0, p0

    .line 19
    const-wide/32 v4, 0x36ee80

    .line 20
    .line 21
    .line 22
    mul-long/2addr v0, v4

    .line 23
    cmp-long p0, v2, v0

    .line 24
    .line 25
    if-gez p0, :cond_0

    .line 26
    .line 27
    const/4 p0, 0x1

    .line 28
    return p0

    .line 29
    :cond_0
    const/4 p0, 0x0

    .line 30
    return p0
.end method
