.class Lcom/p1/mobile/putong/core/data/MessageAdditionalData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MessageAdditionalData;",
        ">;"
    }
.end annotation


# direct methods
.method public constructor <init>()V
    .locals 1

    .line 1
    invoke-direct {p0}, Lcom/tantanapp/common/data/MessageNanoAdapter;-><init>()V

    .line 2
    .line 3
    .line 4
    const/4 v0, 0x2

    .line 5
    iput v0, p0, Lcom/tantanapp/common/data/ProtobufAdapter;->wireFormat:I

    .line 6
    .line 7
    return-void
.end method


# virtual methods
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    goto :goto_0

    .line 11
    :cond_0
    const/4 p0, 0x0

    .line 12
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 63
    .line 64
    if-eqz v0, :cond_6

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/NewQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 75
    .line 76
    if-eqz v0, :cond_7

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 88
    .line 89
    if-eqz v0, :cond_8

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/data/QuestionResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    .line 96
    move-result-object v1

    .line 97
    const/16 v2, 0x9

    .line 98
    .line 99
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 105
    .line 106
    if-eqz v0, :cond_9

    .line 107
    .line 108
    const/16 v1, 0xa

    .line 109
    .line 110
    sget-object v2, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 113
    .line 114
    .line 115
    move-result v0

    .line 116
    add-int/2addr p0, v0

    .line 117
    :cond_9
    const/16 v0, 0xb

    .line 118
    .line 119
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 120
    .line 121
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 127
    .line 128
    if-eqz v0, :cond_a

    .line 129
    .line 130
    const/16 v1, 0xc

    .line 131
    .line 132
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p0, v0

    .line 137
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 138
    .line 139
    if-eqz v0, :cond_b

    .line 140
    .line 141
    const/16 v1, 0xd

    .line 142
    .line 143
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr p0, v0

    .line 148
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 149
    .line 150
    if-eqz v0, :cond_c

    .line 151
    .line 152
    const/16 v1, 0xe

    .line 153
    .line 154
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageContact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 162
    .line 163
    if-eqz v0, :cond_d

    .line 164
    .line 165
    const/16 v1, 0xf

    .line 166
    .line 167
    sget-object v2, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    .line 169
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    add-int/2addr p0, v0

    .line 174
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 175
    .line 176
    if-eqz v0, :cond_e

    .line 177
    .line 178
    const/16 v1, 0x10

    .line 179
    .line 180
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageMusic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 188
    .line 189
    if-eqz v0, :cond_f

    .line 190
    .line 191
    const/16 v1, 0x11

    .line 192
    .line 193
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationNotification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 201
    .line 202
    if-eqz v0, :cond_10

    .line 203
    .line 204
    const/16 v1, 0x12

    .line 205
    .line 206
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    add-int/2addr p0, v0

    .line 213
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 214
    .line 215
    if-eqz v0, :cond_11

    .line 216
    .line 217
    const/16 v1, 0x13

    .line 218
    .line 219
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 220
    .line 221
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 227
    .line 228
    if-eqz v0, :cond_12

    .line 229
    .line 230
    const/16 v1, 0x14

    .line 231
    .line 232
    sget-object v2, Lcom/p1/mobile/putong/core/data/GroupInvitation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 235
    .line 236
    .line 237
    move-result v0

    .line 238
    add-int/2addr p0, v0

    .line 239
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 240
    .line 241
    if-eqz v0, :cond_13

    .line 242
    .line 243
    const/16 v1, 0x15

    .line 244
    .line 245
    sget-object v2, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    .line 247
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 248
    .line 249
    .line 250
    move-result v0

    .line 251
    add-int/2addr p0, v0

    .line 252
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 253
    .line 254
    if-eqz v0, :cond_14

    .line 255
    .line 256
    sget-object v1, Lcom/p1/mobile/putong/core/data/BreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 259
    .line 260
    .line 261
    move-result-object v1

    .line 262
    const/16 v2, 0x16

    .line 263
    .line 264
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 265
    .line 266
    .line 267
    move-result v0

    .line 268
    add-int/2addr p0, v0

    .line 269
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 270
    .line 271
    if-eqz v0, :cond_15

    .line 272
    .line 273
    const/16 v1, 0x17

    .line 274
    .line 275
    sget-object v2, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 276
    .line 277
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 278
    .line 279
    .line 280
    move-result v0

    .line 281
    add-int/2addr p0, v0

    .line 282
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 283
    .line 284
    if-eqz v0, :cond_16

    .line 285
    .line 286
    const/16 v1, 0x18

    .line 287
    .line 288
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExchangePicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 289
    .line 290
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    add-int/2addr p0, v0

    .line 295
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 296
    .line 297
    if-eqz v0, :cond_17

    .line 298
    .line 299
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 300
    .line 301
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 302
    .line 303
    .line 304
    move-result-object v1

    .line 305
    const/16 v2, 0x19

    .line 306
    .line 307
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    add-int/2addr p0, v0

    .line 312
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 313
    .line 314
    if-eqz v0, :cond_18

    .line 315
    .line 316
    const/16 v1, 0x1a

    .line 317
    .line 318
    sget-object v2, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 319
    .line 320
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    add-int/2addr p0, v0

    .line 325
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 326
    .line 327
    if-eqz v0, :cond_19

    .line 328
    .line 329
    const/16 v1, 0x1b

    .line 330
    .line 331
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatTips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 332
    .line 333
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    add-int/2addr p0, v0

    .line 338
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 339
    .line 340
    if-eqz v0, :cond_1a

    .line 341
    .line 342
    const/16 v1, 0x1c

    .line 343
    .line 344
    sget-object v2, Lcom/p1/mobile/putong/core/data/AiPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 345
    .line 346
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    add-int/2addr p0, v0

    .line 351
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 352
    .line 353
    if-eqz v0, :cond_1b

    .line 354
    .line 355
    const/16 v1, 0x1d

    .line 356
    .line 357
    sget-object v2, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 358
    .line 359
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 360
    .line 361
    .line 362
    move-result v0

    .line 363
    add-int/2addr p0, v0

    .line 364
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 365
    .line 366
    if-eqz v0, :cond_1c

    .line 367
    .line 368
    const/16 v1, 0x1e

    .line 369
    .line 370
    sget-object v2, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 371
    .line 372
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 373
    .line 374
    .line 375
    move-result v0

    .line 376
    add-int/2addr p0, v0

    .line 377
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 378
    .line 379
    if-eqz v0, :cond_1d

    .line 380
    .line 381
    const/16 v1, 0x1f

    .line 382
    .line 383
    sget-object v2, Lcom/p1/mobile/putong/core/data/SystemReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 384
    .line 385
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 386
    .line 387
    .line 388
    move-result v0

    .line 389
    add-int/2addr p0, v0

    .line 390
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 391
    .line 392
    if-eqz v0, :cond_1e

    .line 393
    .line 394
    const/16 v1, 0x20

    .line 395
    .line 396
    sget-object v2, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 397
    .line 398
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 399
    .line 400
    .line 401
    move-result v0

    .line 402
    add-int/2addr p0, v0

    .line 403
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 404
    .line 405
    if-eqz v0, :cond_1f

    .line 406
    .line 407
    const/16 v1, 0x21

    .line 408
    .line 409
    sget-object v2, Lcom/p1/mobile/putong/core/data/CommonTipBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 410
    .line 411
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    add-int/2addr p0, v0

    .line 416
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 417
    .line 418
    if-eqz v0, :cond_20

    .line 419
    .line 420
    const/16 v1, 0x22

    .line 421
    .line 422
    sget-object v2, Lcom/p1/mobile/putong/core/data/Questionnaire;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 423
    .line 424
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 425
    .line 426
    .line 427
    move-result v0

    .line 428
    add-int/2addr p0, v0

    .line 429
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 430
    .line 431
    if-eqz v0, :cond_21

    .line 432
    .line 433
    const/16 v1, 0x23

    .line 434
    .line 435
    sget-object v2, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 436
    .line 437
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 438
    .line 439
    .line 440
    move-result v0

    .line 441
    add-int/2addr p0, v0

    .line 442
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 443
    .line 444
    if-eqz v0, :cond_22

    .line 445
    .line 446
    const/16 v1, 0x24

    .line 447
    .line 448
    sget-object v2, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 449
    .line 450
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    add-int/2addr p0, v0

    .line 455
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 456
    .line 457
    if-eqz v0, :cond_23

    .line 458
    .line 459
    const/16 v1, 0x25

    .line 460
    .line 461
    sget-object v2, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 462
    .line 463
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 464
    .line 465
    .line 466
    move-result v0

    .line 467
    add-int/2addr p0, v0

    .line 468
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 469
    .line 470
    if-eqz v0, :cond_24

    .line 471
    .line 472
    const/16 v1, 0x26

    .line 473
    .line 474
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    add-int/2addr p0, v0

    .line 479
    :cond_24
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 480
    .line 481
    if-eqz v0, :cond_25

    .line 482
    .line 483
    const/16 v1, 0x27

    .line 484
    .line 485
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 486
    .line 487
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 488
    .line 489
    .line 490
    move-result v0

    .line 491
    add-int/2addr p0, v0

    .line 492
    :cond_25
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 493
    .line 494
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 495
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageAdditionalData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, ""

    .line 11
    .line 12
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_6

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 38
    .line 39
    return-object p0

    .line 40
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 43
    .line 44
    .line 45
    move-result-object v0

    .line 46
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 47
    .line 48
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 49
    .line 50
    goto :goto_0

    .line 51
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 52
    .line 53
    .line 54
    move-result-object v0

    .line 55
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 56
    .line 57
    goto :goto_0

    .line 58
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 61
    .line 62
    .line 63
    move-result-object v0

    .line 64
    check-cast v0, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 65
    .line 66
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 76
    .line 77
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 78
    .line 79
    goto :goto_0

    .line 80
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 81
    .line 82
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    check-cast v0, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 87
    .line 88
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 89
    .line 90
    goto :goto_0

    .line 91
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/Questionnaire;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    check-cast v0, Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 98
    .line 99
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 100
    .line 101
    goto :goto_0

    .line 102
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/CommonTipBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    check-cast v0, Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 109
    .line 110
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 111
    .line 112
    goto :goto_0

    .line 113
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    check-cast v0, Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 120
    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/SystemReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    check-cast v0, Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 131
    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    check-cast v0, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 143
    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    check-cast v0, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 155
    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/AiPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    check-cast v0, Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 167
    .line 168
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatTips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 173
    .line 174
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 179
    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 203
    .line 204
    .line 205
    move-result-object v0

    .line 206
    check-cast v0, Ljava/util/List;

    .line 207
    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExchangePicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 215
    .line 216
    .line 217
    move-result-object v0

    .line 218
    check-cast v0, Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 219
    .line 220
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 225
    .line 226
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v0

    .line 230
    check-cast v0, Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 231
    .line 232
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/core/data/BreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    check-cast v0, Ljava/util/List;

    .line 247
    .line 248
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 253
    .line 254
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v0

    .line 258
    check-cast v0, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 259
    .line 260
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupInvitation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 265
    .line 266
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    check-cast v0, Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 271
    .line 272
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 277
    .line 278
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 283
    .line 284
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 285
    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 289
    .line 290
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v0

    .line 294
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 295
    .line 296
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationNotification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 301
    .line 302
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v0

    .line 306
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 307
    .line 308
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 309
    .line 310
    goto/16 :goto_0

    .line 311
    .line 312
    :sswitch_17
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageMusic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 313
    .line 314
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v0

    .line 318
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 319
    .line 320
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_18
    sget-object v0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    check-cast v0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 331
    .line 332
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 333
    .line 334
    goto/16 :goto_0

    .line 335
    .line 336
    :sswitch_19
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageContact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 337
    .line 338
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 339
    .line 340
    .line 341
    move-result-object v0

    .line 342
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 343
    .line 344
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 345
    .line 346
    goto/16 :goto_0

    .line 347
    .line 348
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 349
    .line 350
    .line 351
    move-result-object v0

    .line 352
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 353
    .line 354
    goto/16 :goto_0

    .line 355
    .line 356
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 361
    .line 362
    goto/16 :goto_0

    .line 363
    .line 364
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 365
    .line 366
    .line 367
    move-result v0

    .line 368
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 369
    .line 370
    goto/16 :goto_0

    .line 371
    .line 372
    :sswitch_1d
    sget-object v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 373
    .line 374
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v0

    .line 378
    check-cast v0, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 379
    .line 380
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 381
    .line 382
    goto/16 :goto_0

    .line 383
    .line 384
    :sswitch_1e
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuestionResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 385
    .line 386
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 391
    .line 392
    .line 393
    move-result-object v0

    .line 394
    check-cast v0, Ljava/util/List;

    .line 395
    .line 396
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 397
    .line 398
    goto/16 :goto_0

    .line 399
    .line 400
    :sswitch_1f
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 401
    .line 402
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    check-cast v0, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 407
    .line 408
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 409
    .line 410
    goto/16 :goto_0

    .line 411
    .line 412
    :sswitch_20
    sget-object v0, Lcom/p1/mobile/putong/core/data/NewQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 413
    .line 414
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 415
    .line 416
    .line 417
    move-result-object v0

    .line 418
    check-cast v0, Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 419
    .line 420
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 421
    .line 422
    goto/16 :goto_0

    .line 423
    .line 424
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 425
    .line 426
    .line 427
    move-result-object v0

    .line 428
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 429
    .line 430
    goto/16 :goto_0

    .line 431
    .line 432
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 433
    .line 434
    .line 435
    move-result-object v0

    .line 436
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 437
    .line 438
    goto/16 :goto_0

    .line 439
    .line 440
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 441
    .line 442
    .line 443
    move-result-object v0

    .line 444
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 445
    .line 446
    goto/16 :goto_0

    .line 447
    .line 448
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 449
    .line 450
    .line 451
    move-result-object v0

    .line 452
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 453
    .line 454
    goto/16 :goto_0

    .line 455
    .line 456
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 457
    .line 458
    .line 459
    move-result-object v0

    .line 460
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 461
    .line 462
    goto/16 :goto_0

    .line 463
    .line 464
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 469
    .line 470
    goto/16 :goto_0

    .line 471
    .line 472
    :sswitch_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 473
    .line 474
    if-nez p1, :cond_3

    .line 475
    .line 476
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 477
    .line 478
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 479
    .line 480
    if-nez p1, :cond_4

    .line 481
    .line 482
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 483
    .line 484
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 485
    .line 486
    if-nez p1, :cond_5

    .line 487
    .line 488
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 489
    .line 490
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 491
    .line 492
    if-nez p1, :cond_6

    .line 493
    .line 494
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 495
    .line 496
    :cond_6
    return-object p0

    .line 497
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_27
        0xa -> :sswitch_26
        0x12 -> :sswitch_25
        0x1a -> :sswitch_24
        0x22 -> :sswitch_23
        0x2a -> :sswitch_22
        0x32 -> :sswitch_21
        0x3a -> :sswitch_20
        0x42 -> :sswitch_1f
        0x4a -> :sswitch_1e
        0x52 -> :sswitch_1d
        0x58 -> :sswitch_1c
        0x62 -> :sswitch_1b
        0x6a -> :sswitch_1a
        0x72 -> :sswitch_19
        0x7a -> :sswitch_18
        0x82 -> :sswitch_17
        0x8a -> :sswitch_16
        0x92 -> :sswitch_15
        0x9a -> :sswitch_14
        0xa2 -> :sswitch_13
        0xaa -> :sswitch_12
        0xb2 -> :sswitch_11
        0xba -> :sswitch_10
        0xc2 -> :sswitch_f
        0xca -> :sswitch_e
        0xd2 -> :sswitch_d
        0xda -> :sswitch_c
        0xe2 -> :sswitch_b
        0xea -> :sswitch_a
        0xf2 -> :sswitch_9
        0xfa -> :sswitch_8
        0x102 -> :sswitch_7
        0x10a -> :sswitch_6
        0x112 -> :sswitch_5
        0x11a -> :sswitch_4
        0x122 -> :sswitch_3
        0x12a -> :sswitch_2
        0x132 -> :sswitch_1
        0x13a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 497
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contactInfoRequestMessageId:Ljava/lang/String;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 7
    .line 8
    .line 9
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->href:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->caller:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->callee:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->status:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->duration:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestion:Lcom/p1/mobile/putong/core/data/NewQuestion;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/NewQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->newQuestionAnswer:Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;

    .line 60
    .line 61
    if-eqz p0, :cond_7

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/data/NewQuestionAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 68
    .line 69
    .line 70
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->questionResult:Ljava/util/List;

    .line 71
    .line 72
    if-eqz p0, :cond_8

    .line 73
    .line 74
    sget-object v0, Lcom/p1/mobile/putong/core/data/QuestionResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 77
    .line 78
    .line 79
    move-result-object v0

    .line 80
    const/16 v1, 0x9

    .line 81
    .line 82
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQuestion:Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;

    .line 86
    .line 87
    if-eqz p0, :cond_9

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    sget-object v1, Lcom/p1/mobile/putong/core/data/IceBreakingQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 94
    .line 95
    .line 96
    :cond_9
    const/16 p0, 0xb

    .line 97
    .line 98
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->forceSend:Z

    .line 99
    .line 100
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 101
    .line 102
    .line 103
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->consumeType:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz p0, :cond_a

    .line 106
    .line 107
    const/16 v0, 0xc

    .line 108
    .line 109
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 110
    .line 111
    .line 112
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->coinSign:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz p0, :cond_b

    .line 115
    .line 116
    const/16 v0, 0xd

    .line 117
    .line 118
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->contact:Lcom/p1/mobile/putong/core/data/MessageContact;

    .line 122
    .line 123
    if-eqz p0, :cond_c

    .line 124
    .line 125
    const/16 v0, 0xe

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageContact;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 130
    .line 131
    .line 132
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;

    .line 133
    .line 134
    if-eqz p0, :cond_d

    .line 135
    .line 136
    const/16 v0, 0xf

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/putong/core/data/OneSideNoMatchMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->song:Lcom/p1/mobile/putong/core/data/MessageMusic;

    .line 144
    .line 145
    if-eqz p0, :cond_e

    .line 146
    .line 147
    const/16 v0, 0x10

    .line 148
    .line 149
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageMusic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 152
    .line 153
    .line 154
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->conversationNotification:Lcom/p1/mobile/putong/core/data/ConversationNotification;

    .line 155
    .line 156
    if-eqz p0, :cond_f

    .line 157
    .line 158
    const/16 v0, 0x11

    .line 159
    .line 160
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationNotification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 163
    .line 164
    .line 165
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 166
    .line 167
    if-eqz p0, :cond_10

    .line 168
    .line 169
    const/16 v0, 0x12

    .line 170
    .line 171
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 174
    .line 175
    .line 176
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->momentGiftInfo:Lcom/p1/mobile/putong/core/data/ChatGiftInfo;

    .line 177
    .line 178
    if-eqz p0, :cond_11

    .line 179
    .line 180
    const/16 v0, 0x13

    .line 181
    .line 182
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGiftInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 185
    .line 186
    .line 187
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->groupInvitation:Lcom/p1/mobile/putong/core/data/GroupInvitation;

    .line 188
    .line 189
    if-eqz p0, :cond_12

    .line 190
    .line 191
    const/16 v0, 0x14

    .line 192
    .line 193
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupInvitation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 196
    .line 197
    .line 198
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->understandShare:Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;

    .line 199
    .line 200
    if-eqz p0, :cond_13

    .line 201
    .line 202
    const/16 v0, 0x15

    .line 203
    .line 204
    sget-object v1, Lcom/p1/mobile/putong/core/data/KnowMyselfShareMessageAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 207
    .line 208
    .line 209
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localBreakIce:Ljava/util/List;

    .line 210
    .line 211
    if-eqz p0, :cond_14

    .line 212
    .line 213
    sget-object v0, Lcom/p1/mobile/putong/core/data/BreakIce;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    .line 218
    move-result-object v0

    .line 219
    const/16 v1, 0x16

    .line 220
    .line 221
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 222
    .line 223
    .line 224
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->woodenFishHint:Lcom/p1/mobile/putong/core/data/WoodenFishHint;

    .line 225
    .line 226
    if-eqz p0, :cond_15

    .line 227
    .line 228
    const/16 v0, 0x17

    .line 229
    .line 230
    sget-object v1, Lcom/p1/mobile/putong/core/data/WoodenFishHint;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 233
    .line 234
    .line 235
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->exchangePicture:Lcom/p1/mobile/putong/core/data/ExchangePicture;

    .line 236
    .line 237
    if-eqz p0, :cond_16

    .line 238
    .line 239
    const/16 v0, 0x18

    .line 240
    .line 241
    sget-object v1, Lcom/p1/mobile/putong/core/data/ExchangePicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 242
    .line 243
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 244
    .line 245
    .line 246
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->chatAssistantQuestions:Ljava/util/List;

    .line 247
    .line 248
    if-eqz p0, :cond_17

    .line 249
    .line 250
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 251
    .line 252
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    const/16 v1, 0x19

    .line 257
    .line 258
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 259
    .line 260
    .line 261
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->femaleUnreplyReminder:Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;

    .line 262
    .line 263
    if-eqz p0, :cond_18

    .line 264
    .line 265
    const/16 v0, 0x1a

    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/core/data/FemaleUnreplyReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 270
    .line 271
    .line 272
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->twoSidesDifferentTip:Lcom/p1/mobile/putong/core/data/ChatTips;

    .line 273
    .line 274
    if-eqz p0, :cond_19

    .line 275
    .line 276
    const/16 v0, 0x1b

    .line 277
    .line 278
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatTips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 281
    .line 282
    .line 283
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiPicture:Lcom/p1/mobile/putong/core/data/AiPicture;

    .line 284
    .line 285
    if-eqz p0, :cond_1a

    .line 286
    .line 287
    const/16 v0, 0x1c

    .line 288
    .line 289
    sget-object v1, Lcom/p1/mobile/putong/core/data/AiPicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 290
    .line 291
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 292
    .line 293
    .line 294
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->harassAlertInfo:Lcom/p1/mobile/putong/core/data/HarassAlertInfo;

    .line 295
    .line 296
    if-eqz p0, :cond_1b

    .line 297
    .line 298
    const/16 v0, 0x1d

    .line 299
    .line 300
    sget-object v1, Lcom/p1/mobile/putong/core/data/HarassAlertInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 301
    .line 302
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 303
    .line 304
    .line 305
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->continuousChatTip:Lcom/p1/mobile/putong/core/data/ContinuousChatTip;

    .line 306
    .line 307
    if-eqz p0, :cond_1c

    .line 308
    .line 309
    const/16 v0, 0x1e

    .line 310
    .line 311
    sget-object v1, Lcom/p1/mobile/putong/core/data/ContinuousChatTip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 312
    .line 313
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 314
    .line 315
    .line 316
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->systemReminder:Lcom/p1/mobile/putong/core/data/SystemReminder;

    .line 317
    .line 318
    if-eqz p0, :cond_1d

    .line 319
    .line 320
    const/16 v0, 0x1f

    .line 321
    .line 322
    sget-object v1, Lcom/p1/mobile/putong/core/data/SystemReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 323
    .line 324
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 325
    .line 326
    .line 327
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->limitTimePicture:Lcom/p1/mobile/putong/core/data/LimitTimePicture;

    .line 328
    .line 329
    if-eqz p0, :cond_1e

    .line 330
    .line 331
    const/16 v0, 0x20

    .line 332
    .line 333
    sget-object v1, Lcom/p1/mobile/putong/core/data/LimitTimePicture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 334
    .line 335
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 336
    .line 337
    .line 338
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->commonTipBox:Lcom/p1/mobile/putong/core/data/CommonTipBox;

    .line 339
    .line 340
    if-eqz p0, :cond_1f

    .line 341
    .line 342
    const/16 v0, 0x21

    .line 343
    .line 344
    sget-object v1, Lcom/p1/mobile/putong/core/data/CommonTipBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 345
    .line 346
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 347
    .line 348
    .line 349
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->localUXQuestionnaire:Lcom/p1/mobile/putong/core/data/Questionnaire;

    .line 350
    .line 351
    if-eqz p0, :cond_20

    .line 352
    .line 353
    const/16 v0, 0x22

    .line 354
    .line 355
    sget-object v1, Lcom/p1/mobile/putong/core/data/Questionnaire;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 356
    .line 357
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 358
    .line 359
    .line 360
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->loveLetterInfo:Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;

    .line 361
    .line 362
    if-eqz p0, :cond_21

    .line 363
    .line 364
    const/16 v0, 0x23

    .line 365
    .line 366
    sget-object v1, Lcom/p1/mobile/putong/core/data/LoveLetterMessageInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 367
    .line 368
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 369
    .line 370
    .line 371
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->iceBreakingQA:Lcom/p1/mobile/putong/core/data/IceBreakingQA;

    .line 372
    .line 373
    if-eqz p0, :cond_22

    .line 374
    .line 375
    const/16 v0, 0x24

    .line 376
    .line 377
    sget-object v1, Lcom/p1/mobile/putong/core/data/IceBreakingQA;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 378
    .line 379
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 380
    .line 381
    .line 382
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->prologue:Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;

    .line 383
    .line 384
    if-eqz p0, :cond_23

    .line 385
    .line 386
    const/16 v0, 0x25

    .line 387
    .line 388
    sget-object v1, Lcom/p1/mobile/putong/core/data/PrologueMessageAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 389
    .line 390
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 391
    .line 392
    .line 393
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->aiChatGuideType:Ljava/lang/String;

    .line 394
    .line 395
    if-eqz p0, :cond_24

    .line 396
    .line 397
    const/16 v0, 0x26

    .line 398
    .line 399
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 400
    .line 401
    .line 402
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;->compliment:Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;

    .line 403
    .line 404
    if-eqz p0, :cond_25

    .line 405
    .line 406
    const/16 p1, 0x27

    .line 407
    .line 408
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageAdditionalDataCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 409
    .line 410
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 411
    .line 412
    .line 413
    :cond_25
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 414
    check-cast p1, Lcom/p1/mobile/putong/core/data/MessageAdditionalData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MessageAdditionalData$1;->serialize(Lcom/p1/mobile/putong/core/data/MessageAdditionalData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
