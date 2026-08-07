.class Lcom/p1/mobile/putong/core/data/ConversationAdditional$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ConversationAdditional;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ConversationAdditional;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditional;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/TimeLimited;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 80
    .line 81
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    const/16 v1, 0x8

    .line 91
    .line 92
    sget-object v2, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 100
    .line 101
    if-eqz v0, :cond_8

    .line 102
    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    sget-object v2, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xa

    .line 117
    .line 118
    sget-object v2, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 121
    .line 122
    .line 123
    move-result v0

    .line 124
    add-int/2addr p0, v0

    .line 125
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 126
    .line 127
    if-eqz v0, :cond_a

    .line 128
    .line 129
    const/16 v1, 0xb

    .line 130
    .line 131
    sget-object v2, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 139
    .line 140
    if-eqz v0, :cond_b

    .line 141
    .line 142
    const/16 v1, 0xc

    .line 143
    .line 144
    sget-object v2, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 152
    .line 153
    if-eqz v0, :cond_c

    .line 154
    .line 155
    const/16 v1, 0xd

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 165
    .line 166
    if-eqz v0, :cond_d

    .line 167
    .line 168
    const/16 v1, 0xe

    .line 169
    .line 170
    sget-object v2, Lcom/p1/mobile/putong/data/LiveActivityConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    add-int/2addr p0, v0

    .line 177
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 178
    .line 179
    if-eqz v0, :cond_e

    .line 180
    .line 181
    const/16 v1, 0xf

    .line 182
    .line 183
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr p0, v0

    .line 190
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 191
    .line 192
    if-eqz v0, :cond_f

    .line 193
    .line 194
    const/16 v1, 0x10

    .line 195
    .line 196
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    add-int/2addr p0, v0

    .line 203
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 204
    .line 205
    if-eqz v0, :cond_10

    .line 206
    .line 207
    const/16 v1, 0x11

    .line 208
    .line 209
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 210
    .line 211
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    add-int/2addr p0, v0

    .line 216
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 217
    .line 218
    if-eqz v0, :cond_11

    .line 219
    .line 220
    const/16 v1, 0x12

    .line 221
    .line 222
    sget-object v2, Lcom/p1/mobile/putong/core/data/ContinuousChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 225
    .line 226
    .line 227
    move-result v0

    .line 228
    add-int/2addr p0, v0

    .line 229
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 230
    .line 231
    if-eqz v0, :cond_12

    .line 232
    .line 233
    const/16 v1, 0x13

    .line 234
    .line 235
    sget-object v2, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 236
    .line 237
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 238
    .line 239
    .line 240
    move-result v0

    .line 241
    add-int/2addr p0, v0

    .line 242
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 243
    .line 244
    if-eqz v0, :cond_13

    .line 245
    .line 246
    const/16 v1, 0x14

    .line 247
    .line 248
    sget-object v2, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 249
    .line 250
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    add-int/2addr p0, v0

    .line 255
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 256
    .line 257
    if-eqz v0, :cond_14

    .line 258
    .line 259
    const/16 v1, 0x15

    .line 260
    .line 261
    sget-object v2, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 262
    .line 263
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    add-int/2addr p0, v0

    .line 268
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 269
    .line 270
    if-eqz v0, :cond_15

    .line 271
    .line 272
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 273
    .line 274
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 275
    .line 276
    .line 277
    move-result-object v1

    .line 278
    const/16 v2, 0x16

    .line 279
    .line 280
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    add-int/2addr p0, v0

    .line 285
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 286
    .line 287
    if-eqz v0, :cond_16

    .line 288
    .line 289
    const/16 v1, 0x17

    .line 290
    .line 291
    sget-object v2, Lcom/p1/mobile/putong/core/data/GreetingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 292
    .line 293
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    add-int/2addr p0, v0

    .line 298
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 299
    .line 300
    if-eqz v0, :cond_17

    .line 301
    .line 302
    const/16 v1, 0x18

    .line 303
    .line 304
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 305
    .line 306
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    add-int/2addr p0, v0

    .line 311
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 312
    .line 313
    if-eqz v0, :cond_18

    .line 314
    .line 315
    const/16 v1, 0x19

    .line 316
    .line 317
    sget-object v2, Lcom/p1/mobile/putong/core/data/LowPayOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    add-int/2addr p0, v0

    .line 324
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 325
    .line 326
    if-eqz v0, :cond_19

    .line 327
    .line 328
    const/16 v1, 0x1a

    .line 329
    .line 330
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 331
    .line 332
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    add-int/2addr p0, v0

    .line 337
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 338
    .line 339
    if-eqz v0, :cond_1a

    .line 340
    .line 341
    const/16 v1, 0x1b

    .line 342
    .line 343
    sget-object v2, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 344
    .line 345
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 346
    .line 347
    .line 348
    move-result v0

    .line 349
    add-int/2addr p0, v0

    .line 350
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 351
    .line 352
    if-eqz v0, :cond_1b

    .line 353
    .line 354
    const/16 v1, 0x1c

    .line 355
    .line 356
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 357
    .line 358
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 359
    .line 360
    .line 361
    move-result v0

    .line 362
    add-int/2addr p0, v0

    .line 363
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 364
    .line 365
    if-eqz v0, :cond_1c

    .line 366
    .line 367
    const/16 v1, 0x1d

    .line 368
    .line 369
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatMM;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 372
    .line 373
    .line 374
    move-result v0

    .line 375
    add-int/2addr p0, v0

    .line 376
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 377
    .line 378
    if-eqz v0, :cond_1d

    .line 379
    .line 380
    const/16 v1, 0x1e

    .line 381
    .line 382
    sget-object v2, Lcom/p1/mobile/putong/core/data/BlackList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 383
    .line 384
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 385
    .line 386
    .line 387
    move-result v0

    .line 388
    add-int/2addr p0, v0

    .line 389
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 390
    .line 391
    if-eqz v0, :cond_1e

    .line 392
    .line 393
    const/16 v1, 0x1f

    .line 394
    .line 395
    sget-object v2, Lcom/p1/mobile/putong/core/data/MessageRelate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 396
    .line 397
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 398
    .line 399
    .line 400
    move-result v0

    .line 401
    add-int/2addr p0, v0

    .line 402
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 403
    .line 404
    if-eqz v0, :cond_1f

    .line 405
    .line 406
    const/16 v1, 0x20

    .line 407
    .line 408
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 409
    .line 410
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    add-int/2addr p0, v0

    .line 415
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 416
    .line 417
    if-eqz v0, :cond_20

    .line 418
    .line 419
    const/16 v1, 0x21

    .line 420
    .line 421
    sget-object v2, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 422
    .line 423
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    add-int/2addr p0, v0

    .line 428
    :cond_20
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 429
    .line 430
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 431
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ConversationAdditional;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditional;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ConversationAdditional;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 11
    .line 12
    .line 13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->new_()Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TimeLimited;->new_()Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 42
    .line 43
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 44
    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->new_()Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 52
    .line 53
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 54
    .line 55
    if-nez p1, :cond_4

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 62
    .line 63
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 72
    .line 73
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 74
    .line 75
    if-nez p1, :cond_6

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->new_()Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 82
    .line 83
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 84
    .line 85
    if-nez p1, :cond_7

    .line 86
    .line 87
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->new_()Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 92
    .line 93
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 94
    .line 95
    if-nez p1, :cond_8

    .line 96
    .line 97
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->new_()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 102
    .line 103
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 104
    .line 105
    if-nez p1, :cond_9

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->new_()Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 112
    .line 113
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 114
    .line 115
    if-nez p1, :cond_a

    .line 116
    .line 117
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 122
    .line 123
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 124
    .line 125
    if-nez p1, :cond_b

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveActivityConversation;->new_()Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 132
    .line 133
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 134
    .line 135
    if-nez p1, :cond_c

    .line 136
    .line 137
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGame;->new_()Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 142
    .line 143
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 144
    .line 145
    if-nez p1, :cond_d

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 148
    .line 149
    .line 150
    move-result-object p1

    .line 151
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 152
    .line 153
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 154
    .line 155
    if-nez p1, :cond_e

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 158
    .line 159
    .line 160
    move-result-object p1

    .line 161
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 162
    .line 163
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 164
    .line 165
    if-nez p1, :cond_f

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ContinuousChat;->new_()Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 168
    .line 169
    .line 170
    move-result-object p1

    .line 171
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 172
    .line 173
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 174
    .line 175
    if-nez p1, :cond_10

    .line 176
    .line 177
    new-instance p1, Ljava/util/ArrayList;

    .line 178
    .line 179
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 180
    .line 181
    .line 182
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 183
    .line 184
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 185
    .line 186
    if-nez p1, :cond_11

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingInfo;->new_()Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 193
    .line 194
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 195
    .line 196
    if-nez p1, :cond_12

    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 203
    .line 204
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 205
    .line 206
    if-nez p1, :cond_13

    .line 207
    .line 208
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LowPayOneside;->new_()Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 213
    .line 214
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 215
    .line 216
    if-nez p1, :cond_14

    .line 217
    .line 218
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 223
    .line 224
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 225
    .line 226
    if-nez p1, :cond_15

    .line 227
    .line 228
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->new_()Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 233
    .line 234
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 235
    .line 236
    if-nez p1, :cond_16

    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 243
    .line 244
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 245
    .line 246
    if-nez p1, :cond_17

    .line 247
    .line 248
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BlackList;->new_()Lcom/p1/mobile/putong/core/data/BlackList;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 253
    .line 254
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 255
    .line 256
    if-nez p1, :cond_18

    .line 257
    .line 258
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageRelate;->new_()Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 259
    .line 260
    .line 261
    move-result-object p1

    .line 262
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 263
    .line 264
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 265
    .line 266
    if-nez p1, :cond_19

    .line 267
    .line 268
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 269
    .line 270
    .line 271
    move-result-object p1

    .line 272
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 273
    .line 274
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 275
    .line 276
    if-nez p1, :cond_34

    .line 277
    .line 278
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 283
    .line 284
    return-object p0

    .line 285
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 286
    .line 287
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 288
    .line 289
    .line 290
    move-result-object v0

    .line 291
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 292
    .line 293
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 294
    .line 295
    goto/16 :goto_0

    .line 296
    .line 297
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 298
    .line 299
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v0

    .line 303
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 304
    .line 305
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/MessageRelate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 310
    .line 311
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    check-cast v0, Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 316
    .line 317
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 318
    .line 319
    goto/16 :goto_0

    .line 320
    .line 321
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/BlackList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 322
    .line 323
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 324
    .line 325
    .line 326
    move-result-object v0

    .line 327
    check-cast v0, Lcom/p1/mobile/putong/core/data/BlackList;

    .line 328
    .line 329
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 330
    .line 331
    goto/16 :goto_0

    .line 332
    .line 333
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatMM;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 334
    .line 335
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 336
    .line 337
    .line 338
    move-result-object v0

    .line 339
    check-cast v0, Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 340
    .line 341
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 342
    .line 343
    goto/16 :goto_0

    .line 344
    .line 345
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 346
    .line 347
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 348
    .line 349
    .line 350
    move-result-object v0

    .line 351
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 352
    .line 353
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 354
    .line 355
    goto/16 :goto_0

    .line 356
    .line 357
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 358
    .line 359
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 360
    .line 361
    .line 362
    move-result-object v0

    .line 363
    check-cast v0, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 364
    .line 365
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 366
    .line 367
    goto/16 :goto_0

    .line 368
    .line 369
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 376
    .line 377
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 378
    .line 379
    goto/16 :goto_0

    .line 380
    .line 381
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/LowPayOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 382
    .line 383
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 384
    .line 385
    .line 386
    move-result-object v0

    .line 387
    check-cast v0, Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 388
    .line 389
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 390
    .line 391
    goto/16 :goto_0

    .line 392
    .line 393
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 394
    .line 395
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 396
    .line 397
    .line 398
    move-result-object v0

    .line 399
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 400
    .line 401
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 402
    .line 403
    goto/16 :goto_0

    .line 404
    .line 405
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/core/data/GreetingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 406
    .line 407
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 408
    .line 409
    .line 410
    move-result-object v0

    .line 411
    check-cast v0, Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 412
    .line 413
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 414
    .line 415
    goto/16 :goto_0

    .line 416
    .line 417
    :sswitch_b
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 418
    .line 419
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 420
    .line 421
    .line 422
    move-result-object v0

    .line 423
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v0

    .line 427
    check-cast v0, Ljava/util/List;

    .line 428
    .line 429
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 430
    .line 431
    goto/16 :goto_0

    .line 432
    .line 433
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 434
    .line 435
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v0

    .line 439
    check-cast v0, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 440
    .line 441
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 442
    .line 443
    goto/16 :goto_0

    .line 444
    .line 445
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 446
    .line 447
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 448
    .line 449
    .line 450
    move-result-object v0

    .line 451
    check-cast v0, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 452
    .line 453
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 454
    .line 455
    goto/16 :goto_0

    .line 456
    .line 457
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 458
    .line 459
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 460
    .line 461
    .line 462
    move-result-object v0

    .line 463
    check-cast v0, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 464
    .line 465
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 466
    .line 467
    goto/16 :goto_0

    .line 468
    .line 469
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/core/data/ContinuousChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 470
    .line 471
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 472
    .line 473
    .line 474
    move-result-object v0

    .line 475
    check-cast v0, Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 476
    .line 477
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 478
    .line 479
    goto/16 :goto_0

    .line 480
    .line 481
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 482
    .line 483
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v0

    .line 487
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 488
    .line 489
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 490
    .line 491
    goto/16 :goto_0

    .line 492
    .line 493
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 494
    .line 495
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 496
    .line 497
    .line 498
    move-result-object v0

    .line 499
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 500
    .line 501
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 502
    .line 503
    goto/16 :goto_0

    .line 504
    .line 505
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 506
    .line 507
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    move-result-object v0

    .line 511
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 512
    .line 513
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 514
    .line 515
    goto/16 :goto_0

    .line 516
    .line 517
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/data/LiveActivityConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 518
    .line 519
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object v0

    .line 523
    check-cast v0, Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 524
    .line 525
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 526
    .line 527
    goto/16 :goto_0

    .line 528
    .line 529
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 530
    .line 531
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object v0

    .line 535
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 536
    .line 537
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 538
    .line 539
    goto/16 :goto_0

    .line 540
    .line 541
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 542
    .line 543
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 544
    .line 545
    .line 546
    move-result-object v0

    .line 547
    check-cast v0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 548
    .line 549
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 550
    .line 551
    goto/16 :goto_0

    .line 552
    .line 553
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 554
    .line 555
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 556
    .line 557
    .line 558
    move-result-object v0

    .line 559
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 560
    .line 561
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 562
    .line 563
    goto/16 :goto_0

    .line 564
    .line 565
    :sswitch_17
    sget-object v0, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 566
    .line 567
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 568
    .line 569
    .line 570
    move-result-object v0

    .line 571
    check-cast v0, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 572
    .line 573
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 574
    .line 575
    goto/16 :goto_0

    .line 576
    .line 577
    :sswitch_18
    sget-object v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 578
    .line 579
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 580
    .line 581
    .line 582
    move-result-object v0

    .line 583
    check-cast v0, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 584
    .line 585
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :sswitch_19
    sget-object v0, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 590
    .line 591
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v0

    .line 595
    check-cast v0, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 596
    .line 597
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 598
    .line 599
    goto/16 :goto_0

    .line 600
    .line 601
    :sswitch_1a
    sget-object v0, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 602
    .line 603
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 604
    .line 605
    .line 606
    move-result-object v0

    .line 607
    check-cast v0, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 608
    .line 609
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 610
    .line 611
    goto/16 :goto_0

    .line 612
    .line 613
    :sswitch_1b
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 614
    .line 615
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v0

    .line 619
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 620
    .line 621
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 622
    .line 623
    goto/16 :goto_0

    .line 624
    .line 625
    :sswitch_1c
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 626
    .line 627
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 628
    .line 629
    .line 630
    move-result-object v0

    .line 631
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 632
    .line 633
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 634
    .line 635
    goto/16 :goto_0

    .line 636
    .line 637
    :sswitch_1d
    sget-object v0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 638
    .line 639
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 640
    .line 641
    .line 642
    move-result-object v0

    .line 643
    check-cast v0, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 644
    .line 645
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 646
    .line 647
    goto/16 :goto_0

    .line 648
    .line 649
    :sswitch_1e
    sget-object v0, Lcom/p1/mobile/putong/core/data/TimeLimited;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 650
    .line 651
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 652
    .line 653
    .line 654
    move-result-object v0

    .line 655
    check-cast v0, Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 656
    .line 657
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 658
    .line 659
    goto/16 :goto_0

    .line 660
    .line 661
    :sswitch_1f
    sget-object v0, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 662
    .line 663
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 664
    .line 665
    .line 666
    move-result-object v0

    .line 667
    check-cast v0, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 668
    .line 669
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 670
    .line 671
    goto/16 :goto_0

    .line 672
    .line 673
    :sswitch_20
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 674
    .line 675
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 676
    .line 677
    .line 678
    move-result-object v0

    .line 679
    check-cast v0, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 680
    .line 681
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 682
    .line 683
    goto/16 :goto_0

    .line 684
    .line 685
    :sswitch_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 686
    .line 687
    if-nez p1, :cond_1a

    .line 688
    .line 689
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 690
    .line 691
    .line 692
    move-result-object p1

    .line 693
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 694
    .line 695
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 696
    .line 697
    if-nez p1, :cond_1b

    .line 698
    .line 699
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->new_()Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 700
    .line 701
    .line 702
    move-result-object p1

    .line 703
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 704
    .line 705
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 706
    .line 707
    if-nez p1, :cond_1c

    .line 708
    .line 709
    invoke-static {}, Lcom/p1/mobile/putong/core/data/TimeLimited;->new_()Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 710
    .line 711
    .line 712
    move-result-object p1

    .line 713
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 714
    .line 715
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 716
    .line 717
    if-nez p1, :cond_1d

    .line 718
    .line 719
    invoke-static {}, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->new_()Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 720
    .line 721
    .line 722
    move-result-object p1

    .line 723
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 724
    .line 725
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 726
    .line 727
    if-nez p1, :cond_1e

    .line 728
    .line 729
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 730
    .line 731
    .line 732
    move-result-object p1

    .line 733
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 734
    .line 735
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 736
    .line 737
    if-nez p1, :cond_1f

    .line 738
    .line 739
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 740
    .line 741
    .line 742
    move-result-object p1

    .line 743
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 744
    .line 745
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 746
    .line 747
    if-nez p1, :cond_20

    .line 748
    .line 749
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->new_()Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 750
    .line 751
    .line 752
    move-result-object p1

    .line 753
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 754
    .line 755
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 756
    .line 757
    if-nez p1, :cond_21

    .line 758
    .line 759
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->new_()Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 760
    .line 761
    .line 762
    move-result-object p1

    .line 763
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 764
    .line 765
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 766
    .line 767
    if-nez p1, :cond_22

    .line 768
    .line 769
    invoke-static {}, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->new_()Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 770
    .line 771
    .line 772
    move-result-object p1

    .line 773
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 774
    .line 775
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 776
    .line 777
    if-nez p1, :cond_23

    .line 778
    .line 779
    invoke-static {}, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->new_()Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 780
    .line 781
    .line 782
    move-result-object p1

    .line 783
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 784
    .line 785
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 786
    .line 787
    if-nez p1, :cond_24

    .line 788
    .line 789
    invoke-static {}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->new_()Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 790
    .line 791
    .line 792
    move-result-object p1

    .line 793
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 794
    .line 795
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 796
    .line 797
    if-nez p1, :cond_25

    .line 798
    .line 799
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveActivityConversation;->new_()Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 800
    .line 801
    .line 802
    move-result-object p1

    .line 803
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 804
    .line 805
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 806
    .line 807
    if-nez p1, :cond_26

    .line 808
    .line 809
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationGame;->new_()Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 810
    .line 811
    .line 812
    move-result-object p1

    .line 813
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 814
    .line 815
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 816
    .line 817
    if-nez p1, :cond_27

    .line 818
    .line 819
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 820
    .line 821
    .line 822
    move-result-object p1

    .line 823
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 824
    .line 825
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 826
    .line 827
    if-nez p1, :cond_28

    .line 828
    .line 829
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 830
    .line 831
    .line 832
    move-result-object p1

    .line 833
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 834
    .line 835
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 836
    .line 837
    if-nez p1, :cond_29

    .line 838
    .line 839
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ContinuousChat;->new_()Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 840
    .line 841
    .line 842
    move-result-object p1

    .line 843
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 844
    .line 845
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 846
    .line 847
    if-nez p1, :cond_2a

    .line 848
    .line 849
    new-instance p1, Ljava/util/ArrayList;

    .line 850
    .line 851
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 852
    .line 853
    .line 854
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 855
    .line 856
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 857
    .line 858
    if-nez p1, :cond_2b

    .line 859
    .line 860
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GreetingInfo;->new_()Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 861
    .line 862
    .line 863
    move-result-object p1

    .line 864
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 865
    .line 866
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 867
    .line 868
    if-nez p1, :cond_2c

    .line 869
    .line 870
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->new_()Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 871
    .line 872
    .line 873
    move-result-object p1

    .line 874
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 875
    .line 876
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 877
    .line 878
    if-nez p1, :cond_2d

    .line 879
    .line 880
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LowPayOneside;->new_()Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 881
    .line 882
    .line 883
    move-result-object p1

    .line 884
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 885
    .line 886
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 887
    .line 888
    if-nez p1, :cond_2e

    .line 889
    .line 890
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 891
    .line 892
    .line 893
    move-result-object p1

    .line 894
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 895
    .line 896
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 897
    .line 898
    if-nez p1, :cond_2f

    .line 899
    .line 900
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->new_()Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 901
    .line 902
    .line 903
    move-result-object p1

    .line 904
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 905
    .line 906
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 907
    .line 908
    if-nez p1, :cond_30

    .line 909
    .line 910
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 911
    .line 912
    .line 913
    move-result-object p1

    .line 914
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 915
    .line 916
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 917
    .line 918
    if-nez p1, :cond_31

    .line 919
    .line 920
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BlackList;->new_()Lcom/p1/mobile/putong/core/data/BlackList;

    .line 921
    .line 922
    .line 923
    move-result-object p1

    .line 924
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 925
    .line 926
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 927
    .line 928
    if-nez p1, :cond_32

    .line 929
    .line 930
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MessageRelate;->new_()Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 931
    .line 932
    .line 933
    move-result-object p1

    .line 934
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 935
    .line 936
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 937
    .line 938
    if-nez p1, :cond_33

    .line 939
    .line 940
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 941
    .line 942
    .line 943
    move-result-object p1

    .line 944
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 945
    .line 946
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 947
    .line 948
    if-nez p1, :cond_34

    .line 949
    .line 950
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->new_()Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 951
    .line 952
    .line 953
    move-result-object p1

    .line 954
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 955
    .line 956
    :cond_34
    return-object p0

    .line 957
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_21
        0xa -> :sswitch_20
        0x12 -> :sswitch_1f
        0x1a -> :sswitch_1e
        0x22 -> :sswitch_1d
        0x2a -> :sswitch_1c
        0x32 -> :sswitch_1b
        0x3a -> :sswitch_1a
        0x42 -> :sswitch_19
        0x4a -> :sswitch_18
        0x52 -> :sswitch_17
        0x5a -> :sswitch_16
        0x62 -> :sswitch_15
        0x6a -> :sswitch_14
        0x72 -> :sswitch_13
        0x7a -> :sswitch_12
        0x82 -> :sswitch_11
        0x8a -> :sswitch_10
        0x92 -> :sswitch_f
        0x9a -> :sswitch_e
        0xa2 -> :sswitch_d
        0xaa -> :sswitch_c
        0xb2 -> :sswitch_b
        0xba -> :sswitch_a
        0xc2 -> :sswitch_9
        0xca -> :sswitch_8
        0xd2 -> :sswitch_7
        0xda -> :sswitch_6
        0xe2 -> :sswitch_5
        0xea -> :sswitch_4
        0xf2 -> :sswitch_3
        0xfa -> :sswitch_2
        0x102 -> :sswitch_1
        0x10a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 957
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->quickChat:Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalQuickChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->voiceCall:Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/core/data/VoiceCallAdditional;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->timeLimited:Lcom/p1/mobile/putong/core/data/TimeLimited;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/TimeLimited;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSideNoMatch:Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/core/data/OneSideNoMatchConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->oneSide:Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalOneSide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->kankan:Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalKanKanContent;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedStateCounter:Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreFeedStateCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->suggestedTimeLimitedMatch:Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    const/16 v0, 0x8

    .line 76
    .line 77
    sget-object v1, Lcom/p1/mobile/putong/core/data/SuggestedTimeLimitedMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->heartbeatMatch:Lcom/p1/mobile/putong/core/data/HeartbeatMatch;

    .line 83
    .line 84
    if-eqz p0, :cond_8

    .line 85
    .line 86
    const/16 v0, 0x9

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/core/data/HeartbeatMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->avatarSummary:Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0xa

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/core/data/AvatarSummaryCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->feedInteractionCounter:Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;

    .line 105
    .line 106
    if-eqz p0, :cond_a

    .line 107
    .line 108
    const/16 v0, 0xb

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/core/data/CoreInteractionMessageCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 113
    .line 114
    .line 115
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveVirtualVoice:Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;

    .line 116
    .line 117
    if-eqz p0, :cond_b

    .line 118
    .line 119
    const/16 v0, 0xc

    .line 120
    .line 121
    sget-object v1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationCell;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 124
    .line 125
    .line 126
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->localMomentInfo:Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;

    .line 127
    .line 128
    if-eqz p0, :cond_c

    .line 129
    .line 130
    const/16 v0, 0xd

    .line 131
    .line 132
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationMomentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 135
    .line 136
    .line 137
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->liveActivity:Lcom/p1/mobile/putong/data/LiveActivityConversation;

    .line 138
    .line 139
    if-eqz p0, :cond_d

    .line 140
    .line 141
    const/16 v0, 0xe

    .line 142
    .line 143
    sget-object v1, Lcom/p1/mobile/putong/data/LiveActivityConversation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 146
    .line 147
    .line 148
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->game:Lcom/p1/mobile/putong/core/data/ConversationGame;

    .line 149
    .line 150
    if-eqz p0, :cond_e

    .line 151
    .line 152
    const/16 v0, 0xf

    .line 153
    .line 154
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 157
    .line 158
    .line 159
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->tag:Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;

    .line 160
    .line 161
    if-eqz p0, :cond_f

    .line 162
    .line 163
    const/16 v0, 0x10

    .line 164
    .line 165
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 168
    .line 169
    .line 170
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatAssistantQuestion:Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;

    .line 171
    .line 172
    if-eqz p0, :cond_10

    .line 173
    .line 174
    const/16 v0, 0x11

    .line 175
    .line 176
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalChatAssistantQuestion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 179
    .line 180
    .line 181
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->continuousChat:Lcom/p1/mobile/putong/core/data/ContinuousChat;

    .line 182
    .line 183
    if-eqz p0, :cond_11

    .line 184
    .line 185
    const/16 v0, 0x12

    .line 186
    .line 187
    sget-object v1, Lcom/p1/mobile/putong/core/data/ContinuousChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 190
    .line 191
    .line 192
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->pinChat:Lcom/p1/mobile/putong/core/data/PlatinumPinChat;

    .line 193
    .line 194
    if-eqz p0, :cond_12

    .line 195
    .line 196
    const/16 v0, 0x13

    .line 197
    .line 198
    sget-object v1, Lcom/p1/mobile/putong/core/data/PlatinumPinChat;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 199
    .line 200
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 201
    .line 202
    .line 203
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->reSwipe:Lcom/p1/mobile/putong/core/data/ReSwipeInfo;

    .line 204
    .line 205
    if-eqz p0, :cond_13

    .line 206
    .line 207
    const/16 v0, 0x14

    .line 208
    .line 209
    sget-object v1, Lcom/p1/mobile/putong/core/data/ReSwipeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 210
    .line 211
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 212
    .line 213
    .line 214
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blindbox:Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;

    .line 215
    .line 216
    if-eqz p0, :cond_14

    .line 217
    .line 218
    const/16 v0, 0x15

    .line 219
    .line 220
    sget-object v1, Lcom/p1/mobile/putong/core/data/GrowthConversationBlindBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 221
    .line 222
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 223
    .line 224
    .line 225
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->previewTexts:Ljava/util/List;

    .line 226
    .line 227
    if-eqz p0, :cond_15

    .line 228
    .line 229
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 232
    .line 233
    .line 234
    move-result-object v0

    .line 235
    const/16 v1, 0x16

    .line 236
    .line 237
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 238
    .line 239
    .line 240
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->greetingInfo:Lcom/p1/mobile/putong/core/data/GreetingInfo;

    .line 241
    .line 242
    if-eqz p0, :cond_16

    .line 243
    .line 244
    const/16 v0, 0x17

    .line 245
    .line 246
    sget-object v1, Lcom/p1/mobile/putong/core/data/GreetingInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 247
    .line 248
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 249
    .line 250
    .line 251
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->fateRadar:Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;

    .line 252
    .line 253
    if-eqz p0, :cond_17

    .line 254
    .line 255
    const/16 v0, 0x18

    .line 256
    .line 257
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConversationAdditionalFateRadar;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 258
    .line 259
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 260
    .line 261
    .line 262
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->lowPayOneside:Lcom/p1/mobile/putong/core/data/LowPayOneside;

    .line 263
    .line 264
    if-eqz p0, :cond_18

    .line 265
    .line 266
    const/16 v0, 0x19

    .line 267
    .line 268
    sget-object v1, Lcom/p1/mobile/putong/core/data/LowPayOneside;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 269
    .line 270
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 271
    .line 272
    .line 273
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->matchInfo:Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;

    .line 274
    .line 275
    if-eqz p0, :cond_19

    .line 276
    .line 277
    const/16 v0, 0x1a

    .line 278
    .line 279
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalMatchInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 282
    .line 283
    .line 284
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->newMatch:Lcom/p1/mobile/putong/core/data/ExposureNewMatch;

    .line 285
    .line 286
    if-eqz p0, :cond_1a

    .line 287
    .line 288
    const/16 v0, 0x1b

    .line 289
    .line 290
    sget-object v1, Lcom/p1/mobile/putong/core/data/ExposureNewMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 291
    .line 292
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 293
    .line 294
    .line 295
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->loveLetter:Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;

    .line 296
    .line 297
    if-eqz p0, :cond_1b

    .line 298
    .line 299
    const/16 v0, 0x1c

    .line 300
    .line 301
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalLoveLetter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 302
    .line 303
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 304
    .line 305
    .line 306
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->chatMM:Lcom/p1/mobile/putong/core/data/ChatMM;

    .line 307
    .line 308
    if-eqz p0, :cond_1c

    .line 309
    .line 310
    const/16 v0, 0x1d

    .line 311
    .line 312
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatMM;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 313
    .line 314
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 315
    .line 316
    .line 317
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->blackList:Lcom/p1/mobile/putong/core/data/BlackList;

    .line 318
    .line 319
    if-eqz p0, :cond_1d

    .line 320
    .line 321
    const/16 v0, 0x1e

    .line 322
    .line 323
    sget-object v1, Lcom/p1/mobile/putong/core/data/BlackList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 324
    .line 325
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 326
    .line 327
    .line 328
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->messageRelate:Lcom/p1/mobile/putong/core/data/MessageRelate;

    .line 329
    .line 330
    if-eqz p0, :cond_1e

    .line 331
    .line 332
    const/16 v0, 0x1f

    .line 333
    .line 334
    sget-object v1, Lcom/p1/mobile/putong/core/data/MessageRelate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 335
    .line 336
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 337
    .line 338
    .line 339
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->compliment:Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;

    .line 340
    .line 341
    if-eqz p0, :cond_1f

    .line 342
    .line 343
    const/16 v0, 0x20

    .line 344
    .line 345
    sget-object v1, Lcom/p1/mobile/putong/core/data/ConvAdditionalCompliment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 346
    .line 347
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 348
    .line 349
    .line 350
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;->swiper:Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;

    .line 351
    .line 352
    if-eqz p0, :cond_20

    .line 353
    .line 354
    const/16 p1, 0x21

    .line 355
    .line 356
    sget-object v0, Lcom/p1/mobile/putong/core/data/ConvAdditionalSwiper;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 357
    .line 358
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 359
    .line 360
    .line 361
    :cond_20
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 362
    check-cast p1, Lcom/p1/mobile/putong/core/data/ConversationAdditional;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ConversationAdditional$1;->serialize(Lcom/p1/mobile/putong/core/data/ConversationAdditional;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
