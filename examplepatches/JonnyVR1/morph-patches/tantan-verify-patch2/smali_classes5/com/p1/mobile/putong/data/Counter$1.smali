.class Lcom/p1/mobile/putong/data/Counter$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Counter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Counter;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Counter;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    sget-object v2, Lcom/p1/mobile/putong/data/CounterActivities;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/data/CounterFollowShips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

    .line 79
    sget-object v2, Lcom/p1/mobile/putong/data/CouterMoments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 87
    .line 88
    if-eqz v0, :cond_7

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/data/BoostLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    .line 95
    move-result-object v1

    .line 96
    const/16 v2, 0x8

    .line 97
    .line 98
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 104
    .line 105
    if-eqz v0, :cond_8

    .line 106
    .line 107
    const/16 v1, 0x9

    .line 108
    .line 109
    sget-object v2, Lcom/p1/mobile/putong/data/LikersLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 117
    .line 118
    if-eqz v0, :cond_9

    .line 119
    .line 120
    const/16 v1, 0xa

    .line 121
    .line 122
    sget-object v2, Lcom/p1/mobile/putong/data/LiveChatLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    add-int/2addr p0, v0

    .line 129
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 130
    .line 131
    if-eqz v0, :cond_a

    .line 132
    .line 133
    const/16 v1, 0xb

    .line 134
    .line 135
    sget-object v2, Lcom/p1/mobile/putong/data/Mytantan;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 143
    .line 144
    if-eqz v0, :cond_b

    .line 145
    .line 146
    const/16 v1, 0xc

    .line 147
    .line 148
    sget-object v2, Lcom/p1/mobile/putong/data/LivePushLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    add-int/2addr p0, v0

    .line 155
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 156
    .line 157
    if-eqz v0, :cond_c

    .line 158
    .line 159
    const/16 v1, 0xd

    .line 160
    .line 161
    sget-object v2, Lcom/p1/mobile/putong/data/CounterFriendReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    add-int/2addr p0, v0

    .line 168
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 169
    .line 170
    if-eqz v0, :cond_d

    .line 171
    .line 172
    const/16 v1, 0xe

    .line 173
    .line 174
    sget-object v2, Lcom/p1/mobile/putong/data/CounterViewer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    add-int/2addr p0, v0

    .line 181
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 182
    .line 183
    if-eqz v0, :cond_e

    .line 184
    .line 185
    const/16 v1, 0xf

    .line 186
    .line 187
    sget-object v2, Lcom/p1/mobile/putong/data/CounterShuoshuo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    add-int/2addr p0, v0

    .line 194
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 195
    .line 196
    if-eqz v0, :cond_f

    .line 197
    .line 198
    const/16 v1, 0x10

    .line 199
    .line 200
    sget-object v2, Lcom/p1/mobile/putong/data/CounterKankan;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 201
    .line 202
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    add-int/2addr p0, v0

    .line 207
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 208
    .line 209
    if-eqz v0, :cond_10

    .line 210
    .line 211
    const/16 v1, 0x11

    .line 212
    .line 213
    sget-object v2, Lcom/p1/mobile/putong/data/Swipes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    add-int/2addr p0, v0

    .line 220
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 221
    .line 222
    if-eqz v0, :cond_11

    .line 223
    .line 224
    const/16 v1, 0x12

    .line 225
    .line 226
    sget-object v2, Lcom/p1/mobile/putong/data/CounterGrowth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 227
    .line 228
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    add-int/2addr p0, v0

    .line 233
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 234
    .line 235
    if-eqz v0, :cond_12

    .line 236
    .line 237
    const/16 v1, 0x13

    .line 238
    .line 239
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileLike;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    .line 241
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    add-int/2addr p0, v0

    .line 246
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 247
    .line 248
    if-eqz v0, :cond_13

    .line 249
    .line 250
    const/16 v1, 0x14

    .line 251
    .line 252
    sget-object v2, Lcom/p1/mobile/putong/data/CounterPickUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 253
    .line 254
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 255
    .line 256
    .line 257
    move-result v0

    .line 258
    add-int/2addr p0, v0

    .line 259
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 260
    .line 261
    if-eqz v0, :cond_14

    .line 262
    .line 263
    const/16 v1, 0x15

    .line 264
    .line 265
    sget-object v2, Lcom/p1/mobile/putong/data/FakeLikeLimits;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 266
    .line 267
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 268
    .line 269
    .line 270
    move-result v0

    .line 271
    add-int/2addr p0, v0

    .line 272
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 273
    .line 274
    if-eqz v0, :cond_15

    .line 275
    .line 276
    const/16 v1, 0x16

    .line 277
    .line 278
    sget-object v2, Lcom/p1/mobile/putong/data/FeedFlower;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 281
    .line 282
    .line 283
    move-result v0

    .line 284
    add-int/2addr p0, v0

    .line 285
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 286
    .line 287
    if-eqz v0, :cond_16

    .line 288
    .line 289
    const/16 v1, 0x17

    .line 290
    .line 291
    sget-object v2, Lcom/p1/mobile/putong/data/VerificationLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 299
    .line 300
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 301
    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Counter$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Counter;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Counter;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Counter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Counter;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->new_()Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 18
    .line 19
    .line 20
    move-result-object p1

    .line 21
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 22
    .line 23
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 24
    .line 25
    if-nez p1, :cond_1

    .line 26
    .line 27
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterActivities;->new_()Lcom/p1/mobile/putong/data/CounterActivities;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 32
    .line 33
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 34
    .line 35
    if-nez p1, :cond_2

    .line 36
    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->new_()Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 42
    .line 43
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 44
    .line 45
    if-nez p1, :cond_3

    .line 46
    .line 47
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->new_()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 48
    .line 49
    .line 50
    move-result-object p1

    .line 51
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 52
    .line 53
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 54
    .line 55
    if-nez p1, :cond_4

    .line 56
    .line 57
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->new_()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 62
    .line 63
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 64
    .line 65
    if-nez p1, :cond_5

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterFollowShips;->new_()Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 72
    .line 73
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 74
    .line 75
    if-nez p1, :cond_6

    .line 76
    .line 77
    invoke-static {}, Lcom/p1/mobile/putong/data/CouterMoments;->new_()Lcom/p1/mobile/putong/data/CouterMoments;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 82
    .line 83
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 84
    .line 85
    if-nez p1, :cond_7

    .line 86
    .line 87
    new-instance p1, Ljava/util/ArrayList;

    .line 88
    .line 89
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 90
    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 93
    .line 94
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 95
    .line 96
    if-nez p1, :cond_8

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/data/LikersLimit;->new_()Lcom/p1/mobile/putong/data/LikersLimit;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 103
    .line 104
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 105
    .line 106
    if-nez p1, :cond_9

    .line 107
    .line 108
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveChatLimit;->new_()Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 109
    .line 110
    .line 111
    move-result-object p1

    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 113
    .line 114
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 115
    .line 116
    if-nez p1, :cond_a

    .line 117
    .line 118
    invoke-static {}, Lcom/p1/mobile/putong/data/Mytantan;->new_()Lcom/p1/mobile/putong/data/Mytantan;

    .line 119
    .line 120
    .line 121
    move-result-object p1

    .line 122
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 123
    .line 124
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 125
    .line 126
    if-nez p1, :cond_b

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/data/LivePushLimit;->new_()Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 133
    .line 134
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 135
    .line 136
    if-nez p1, :cond_c

    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterFriendReminder;->new_()Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 143
    .line 144
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 145
    .line 146
    if-nez p1, :cond_d

    .line 147
    .line 148
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterViewer;->new_()Lcom/p1/mobile/putong/data/CounterViewer;

    .line 149
    .line 150
    .line 151
    move-result-object p1

    .line 152
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 153
    .line 154
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 155
    .line 156
    if-nez p1, :cond_e

    .line 157
    .line 158
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterShuoshuo;->new_()Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 159
    .line 160
    .line 161
    move-result-object p1

    .line 162
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 163
    .line 164
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 165
    .line 166
    if-nez p1, :cond_f

    .line 167
    .line 168
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterKankan;->new_()Lcom/p1/mobile/putong/data/CounterKankan;

    .line 169
    .line 170
    .line 171
    move-result-object p1

    .line 172
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 173
    .line 174
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 175
    .line 176
    if-nez p1, :cond_10

    .line 177
    .line 178
    invoke-static {}, Lcom/p1/mobile/putong/data/Swipes;->new_()Lcom/p1/mobile/putong/data/Swipes;

    .line 179
    .line 180
    .line 181
    move-result-object p1

    .line 182
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 183
    .line 184
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 185
    .line 186
    if-nez p1, :cond_11

    .line 187
    .line 188
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterGrowth;->new_()Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 193
    .line 194
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 195
    .line 196
    if-nez p1, :cond_12

    .line 197
    .line 198
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileLike;->new_()Lcom/p1/mobile/putong/data/ProfileLike;

    .line 199
    .line 200
    .line 201
    move-result-object p1

    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 203
    .line 204
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 205
    .line 206
    if-nez p1, :cond_13

    .line 207
    .line 208
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterPickUsers;->new_()Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 209
    .line 210
    .line 211
    move-result-object p1

    .line 212
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 213
    .line 214
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 215
    .line 216
    if-nez p1, :cond_14

    .line 217
    .line 218
    invoke-static {}, Lcom/p1/mobile/putong/data/FakeLikeLimits;->new_()Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 223
    .line 224
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 225
    .line 226
    if-nez p1, :cond_15

    .line 227
    .line 228
    invoke-static {}, Lcom/p1/mobile/putong/data/FeedFlower;->new_()Lcom/p1/mobile/putong/data/FeedFlower;

    .line 229
    .line 230
    .line 231
    move-result-object p1

    .line 232
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 233
    .line 234
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 235
    .line 236
    if-nez p1, :cond_2c

    .line 237
    .line 238
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationLimit;->new_()Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 239
    .line 240
    .line 241
    move-result-object p1

    .line 242
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 243
    .line 244
    return-object p0

    .line 245
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    .line 247
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v0

    .line 251
    check-cast v0, Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 252
    .line 253
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/FeedFlower;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 258
    .line 259
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    check-cast v0, Lcom/p1/mobile/putong/data/FeedFlower;

    .line 264
    .line 265
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/FakeLikeLimits;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 270
    .line 271
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v0

    .line 275
    check-cast v0, Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 276
    .line 277
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/CounterPickUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v0

    .line 287
    check-cast v0, Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 288
    .line 289
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileLike;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 294
    .line 295
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 296
    .line 297
    .line 298
    move-result-object v0

    .line 299
    check-cast v0, Lcom/p1/mobile/putong/data/ProfileLike;

    .line 300
    .line 301
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 302
    .line 303
    goto/16 :goto_0

    .line 304
    .line 305
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/CounterGrowth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 306
    .line 307
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 308
    .line 309
    .line 310
    move-result-object v0

    .line 311
    check-cast v0, Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 312
    .line 313
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 314
    .line 315
    goto/16 :goto_0

    .line 316
    .line 317
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/Swipes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 320
    .line 321
    .line 322
    move-result-object v0

    .line 323
    check-cast v0, Lcom/p1/mobile/putong/data/Swipes;

    .line 324
    .line 325
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 326
    .line 327
    goto/16 :goto_0

    .line 328
    .line 329
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/CounterKankan;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 330
    .line 331
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 332
    .line 333
    .line 334
    move-result-object v0

    .line 335
    check-cast v0, Lcom/p1/mobile/putong/data/CounterKankan;

    .line 336
    .line 337
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 338
    .line 339
    goto/16 :goto_0

    .line 340
    .line 341
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/CounterShuoshuo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 342
    .line 343
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 344
    .line 345
    .line 346
    move-result-object v0

    .line 347
    check-cast v0, Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 348
    .line 349
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 350
    .line 351
    goto/16 :goto_0

    .line 352
    .line 353
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/data/CounterViewer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 354
    .line 355
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 356
    .line 357
    .line 358
    move-result-object v0

    .line 359
    check-cast v0, Lcom/p1/mobile/putong/data/CounterViewer;

    .line 360
    .line 361
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 362
    .line 363
    goto/16 :goto_0

    .line 364
    .line 365
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/CounterFriendReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 366
    .line 367
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object v0

    .line 371
    check-cast v0, Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 372
    .line 373
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 374
    .line 375
    goto/16 :goto_0

    .line 376
    .line 377
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/data/LivePushLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 378
    .line 379
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 380
    .line 381
    .line 382
    move-result-object v0

    .line 383
    check-cast v0, Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 384
    .line 385
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 386
    .line 387
    goto/16 :goto_0

    .line 388
    .line 389
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/data/Mytantan;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 390
    .line 391
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 392
    .line 393
    .line 394
    move-result-object v0

    .line 395
    check-cast v0, Lcom/p1/mobile/putong/data/Mytantan;

    .line 396
    .line 397
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 398
    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/LiveChatLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 402
    .line 403
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 404
    .line 405
    .line 406
    move-result-object v0

    .line 407
    check-cast v0, Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 408
    .line 409
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 410
    .line 411
    goto/16 :goto_0

    .line 412
    .line 413
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/data/LikersLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 414
    .line 415
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 416
    .line 417
    .line 418
    move-result-object v0

    .line 419
    check-cast v0, Lcom/p1/mobile/putong/data/LikersLimit;

    .line 420
    .line 421
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 422
    .line 423
    goto/16 :goto_0

    .line 424
    .line 425
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/BoostLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 426
    .line 427
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 428
    .line 429
    .line 430
    move-result-object v0

    .line 431
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 432
    .line 433
    .line 434
    move-result-object v0

    .line 435
    check-cast v0, Ljava/util/List;

    .line 436
    .line 437
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 438
    .line 439
    goto/16 :goto_0

    .line 440
    .line 441
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/data/CouterMoments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 442
    .line 443
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 444
    .line 445
    .line 446
    move-result-object v0

    .line 447
    check-cast v0, Lcom/p1/mobile/putong/data/CouterMoments;

    .line 448
    .line 449
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 450
    .line 451
    goto/16 :goto_0

    .line 452
    .line 453
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/data/CounterFollowShips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 454
    .line 455
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 456
    .line 457
    .line 458
    move-result-object v0

    .line 459
    check-cast v0, Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 460
    .line 461
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 462
    .line 463
    goto/16 :goto_0

    .line 464
    .line 465
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 466
    .line 467
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 468
    .line 469
    .line 470
    move-result-object v0

    .line 471
    check-cast v0, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 472
    .line 473
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 474
    .line 475
    goto/16 :goto_0

    .line 476
    .line 477
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 478
    .line 479
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    check-cast v0, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 484
    .line 485
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 486
    .line 487
    goto/16 :goto_0

    .line 488
    .line 489
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 490
    .line 491
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 492
    .line 493
    .line 494
    move-result-object v0

    .line 495
    check-cast v0, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 496
    .line 497
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 498
    .line 499
    goto/16 :goto_0

    .line 500
    .line 501
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/data/CounterActivities;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 502
    .line 503
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 504
    .line 505
    .line 506
    move-result-object v0

    .line 507
    check-cast v0, Lcom/p1/mobile/putong/data/CounterActivities;

    .line 508
    .line 509
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 510
    .line 511
    goto/16 :goto_0

    .line 512
    .line 513
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 514
    .line 515
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 516
    .line 517
    .line 518
    move-result-object v0

    .line 519
    check-cast v0, Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 520
    .line 521
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 522
    .line 523
    goto/16 :goto_0

    .line 524
    .line 525
    :sswitch_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 526
    .line 527
    if-nez p1, :cond_16

    .line 528
    .line 529
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterLikeLimit;->new_()Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 530
    .line 531
    .line 532
    move-result-object p1

    .line 533
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 534
    .line 535
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 536
    .line 537
    if-nez p1, :cond_17

    .line 538
    .line 539
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterActivities;->new_()Lcom/p1/mobile/putong/data/CounterActivities;

    .line 540
    .line 541
    .line 542
    move-result-object p1

    .line 543
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 544
    .line 545
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 546
    .line 547
    if-nez p1, :cond_18

    .line 548
    .line 549
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->new_()Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 550
    .line 551
    .line 552
    move-result-object p1

    .line 553
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 554
    .line 555
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 556
    .line 557
    if-nez p1, :cond_19

    .line 558
    .line 559
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->new_()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 560
    .line 561
    .line 562
    move-result-object p1

    .line 563
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 564
    .line 565
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 566
    .line 567
    if-nez p1, :cond_1a

    .line 568
    .line 569
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->new_()Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 570
    .line 571
    .line 572
    move-result-object p1

    .line 573
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 574
    .line 575
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 576
    .line 577
    if-nez p1, :cond_1b

    .line 578
    .line 579
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterFollowShips;->new_()Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 580
    .line 581
    .line 582
    move-result-object p1

    .line 583
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 584
    .line 585
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 586
    .line 587
    if-nez p1, :cond_1c

    .line 588
    .line 589
    invoke-static {}, Lcom/p1/mobile/putong/data/CouterMoments;->new_()Lcom/p1/mobile/putong/data/CouterMoments;

    .line 590
    .line 591
    .line 592
    move-result-object p1

    .line 593
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 594
    .line 595
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 596
    .line 597
    if-nez p1, :cond_1d

    .line 598
    .line 599
    new-instance p1, Ljava/util/ArrayList;

    .line 600
    .line 601
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 602
    .line 603
    .line 604
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 605
    .line 606
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 607
    .line 608
    if-nez p1, :cond_1e

    .line 609
    .line 610
    invoke-static {}, Lcom/p1/mobile/putong/data/LikersLimit;->new_()Lcom/p1/mobile/putong/data/LikersLimit;

    .line 611
    .line 612
    .line 613
    move-result-object p1

    .line 614
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 615
    .line 616
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 617
    .line 618
    if-nez p1, :cond_1f

    .line 619
    .line 620
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveChatLimit;->new_()Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 621
    .line 622
    .line 623
    move-result-object p1

    .line 624
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 625
    .line 626
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 627
    .line 628
    if-nez p1, :cond_20

    .line 629
    .line 630
    invoke-static {}, Lcom/p1/mobile/putong/data/Mytantan;->new_()Lcom/p1/mobile/putong/data/Mytantan;

    .line 631
    .line 632
    .line 633
    move-result-object p1

    .line 634
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 635
    .line 636
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 637
    .line 638
    if-nez p1, :cond_21

    .line 639
    .line 640
    invoke-static {}, Lcom/p1/mobile/putong/data/LivePushLimit;->new_()Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 641
    .line 642
    .line 643
    move-result-object p1

    .line 644
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 645
    .line 646
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 647
    .line 648
    if-nez p1, :cond_22

    .line 649
    .line 650
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterFriendReminder;->new_()Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 651
    .line 652
    .line 653
    move-result-object p1

    .line 654
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 655
    .line 656
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 657
    .line 658
    if-nez p1, :cond_23

    .line 659
    .line 660
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterViewer;->new_()Lcom/p1/mobile/putong/data/CounterViewer;

    .line 661
    .line 662
    .line 663
    move-result-object p1

    .line 664
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 665
    .line 666
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 667
    .line 668
    if-nez p1, :cond_24

    .line 669
    .line 670
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterShuoshuo;->new_()Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 671
    .line 672
    .line 673
    move-result-object p1

    .line 674
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 675
    .line 676
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 677
    .line 678
    if-nez p1, :cond_25

    .line 679
    .line 680
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterKankan;->new_()Lcom/p1/mobile/putong/data/CounterKankan;

    .line 681
    .line 682
    .line 683
    move-result-object p1

    .line 684
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 685
    .line 686
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 687
    .line 688
    if-nez p1, :cond_26

    .line 689
    .line 690
    invoke-static {}, Lcom/p1/mobile/putong/data/Swipes;->new_()Lcom/p1/mobile/putong/data/Swipes;

    .line 691
    .line 692
    .line 693
    move-result-object p1

    .line 694
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 695
    .line 696
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 697
    .line 698
    if-nez p1, :cond_27

    .line 699
    .line 700
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterGrowth;->new_()Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 701
    .line 702
    .line 703
    move-result-object p1

    .line 704
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 705
    .line 706
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 707
    .line 708
    if-nez p1, :cond_28

    .line 709
    .line 710
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileLike;->new_()Lcom/p1/mobile/putong/data/ProfileLike;

    .line 711
    .line 712
    .line 713
    move-result-object p1

    .line 714
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 715
    .line 716
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 717
    .line 718
    if-nez p1, :cond_29

    .line 719
    .line 720
    invoke-static {}, Lcom/p1/mobile/putong/data/CounterPickUsers;->new_()Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 721
    .line 722
    .line 723
    move-result-object p1

    .line 724
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 725
    .line 726
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 727
    .line 728
    if-nez p1, :cond_2a

    .line 729
    .line 730
    invoke-static {}, Lcom/p1/mobile/putong/data/FakeLikeLimits;->new_()Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 731
    .line 732
    .line 733
    move-result-object p1

    .line 734
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 735
    .line 736
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 737
    .line 738
    if-nez p1, :cond_2b

    .line 739
    .line 740
    invoke-static {}, Lcom/p1/mobile/putong/data/FeedFlower;->new_()Lcom/p1/mobile/putong/data/FeedFlower;

    .line 741
    .line 742
    .line 743
    move-result-object p1

    .line 744
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 745
    .line 746
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 747
    .line 748
    if-nez p1, :cond_2c

    .line 749
    .line 750
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationLimit;->new_()Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 751
    .line 752
    .line 753
    move-result-object p1

    .line 754
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 755
    .line 756
    :cond_2c
    return-object p0

    .line 757
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_17
        0xa -> :sswitch_16
        0x12 -> :sswitch_15
        0x1a -> :sswitch_14
        0x22 -> :sswitch_13
        0x2a -> :sswitch_12
        0x32 -> :sswitch_11
        0x3a -> :sswitch_10
        0x42 -> :sswitch_f
        0x4a -> :sswitch_e
        0x52 -> :sswitch_d
        0x5a -> :sswitch_c
        0x62 -> :sswitch_b
        0x6a -> :sswitch_a
        0x72 -> :sswitch_9
        0x7a -> :sswitch_8
        0x82 -> :sswitch_7
        0x8a -> :sswitch_6
        0x92 -> :sswitch_5
        0x9a -> :sswitch_4
        0xa2 -> :sswitch_3
        0xaa -> :sswitch_2
        0xb2 -> :sswitch_1
        0xba -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 757
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Counter$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Counter;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Counter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->likeLimit:Lcom/p1/mobile/putong/data/CounterLikeLimit;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/CounterLikeLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->activities:Lcom/p1/mobile/putong/data/CounterActivities;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    sget-object v1, Lcom/p1/mobile/putong/data/CounterActivities;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 17
    .line 18
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->secretCrushLimit:Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/CounterSecretCrushLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->superLikeLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->undoLimit:Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/data/CounterSuperlikeAndUndoLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->followships:Lcom/p1/mobile/putong/data/CounterFollowShips;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    sget-object v1, Lcom/p1/mobile/putong/data/CounterFollowShips;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->moments:Lcom/p1/mobile/putong/data/CouterMoments;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    sget-object v1, Lcom/p1/mobile/putong/data/CouterMoments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->boostLimits:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_7

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/data/BoostLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/16 v1, 0x8

    .line 82
    .line 83
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 84
    .line 85
    .line 86
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->likersLimit:Lcom/p1/mobile/putong/data/LikersLimit;

    .line 87
    .line 88
    if-eqz p0, :cond_8

    .line 89
    .line 90
    const/16 v0, 0x9

    .line 91
    .line 92
    sget-object v1, Lcom/p1/mobile/putong/data/LikersLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->liveChatLimit:Lcom/p1/mobile/putong/data/LiveChatLimit;

    .line 98
    .line 99
    if-eqz p0, :cond_9

    .line 100
    .line 101
    const/16 v0, 0xa

    .line 102
    .line 103
    sget-object v1, Lcom/p1/mobile/putong/data/LiveChatLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->mytantan:Lcom/p1/mobile/putong/data/Mytantan;

    .line 109
    .line 110
    if-eqz p0, :cond_a

    .line 111
    .line 112
    const/16 v0, 0xb

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/data/Mytantan;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 117
    .line 118
    .line 119
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->livePushLimit:Lcom/p1/mobile/putong/data/LivePushLimit;

    .line 120
    .line 121
    if-eqz p0, :cond_b

    .line 122
    .line 123
    const/16 v0, 0xc

    .line 124
    .line 125
    sget-object v1, Lcom/p1/mobile/putong/data/LivePushLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 128
    .line 129
    .line 130
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->friendReminders:Lcom/p1/mobile/putong/data/CounterFriendReminder;

    .line 131
    .line 132
    if-eqz p0, :cond_c

    .line 133
    .line 134
    const/16 v0, 0xd

    .line 135
    .line 136
    sget-object v1, Lcom/p1/mobile/putong/data/CounterFriendReminder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 139
    .line 140
    .line 141
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->viewers:Lcom/p1/mobile/putong/data/CounterViewer;

    .line 142
    .line 143
    if-eqz p0, :cond_d

    .line 144
    .line 145
    const/16 v0, 0xe

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/data/CounterViewer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 150
    .line 151
    .line 152
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->shuoshuos:Lcom/p1/mobile/putong/data/CounterShuoshuo;

    .line 153
    .line 154
    if-eqz p0, :cond_e

    .line 155
    .line 156
    const/16 v0, 0xf

    .line 157
    .line 158
    sget-object v1, Lcom/p1/mobile/putong/data/CounterShuoshuo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 161
    .line 162
    .line 163
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->kankan:Lcom/p1/mobile/putong/data/CounterKankan;

    .line 164
    .line 165
    if-eqz p0, :cond_f

    .line 166
    .line 167
    const/16 v0, 0x10

    .line 168
    .line 169
    sget-object v1, Lcom/p1/mobile/putong/data/CounterKankan;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 172
    .line 173
    .line 174
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->swipes:Lcom/p1/mobile/putong/data/Swipes;

    .line 175
    .line 176
    if-eqz p0, :cond_10

    .line 177
    .line 178
    const/16 v0, 0x11

    .line 179
    .line 180
    sget-object v1, Lcom/p1/mobile/putong/data/Swipes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 183
    .line 184
    .line 185
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->growth:Lcom/p1/mobile/putong/data/CounterGrowth;

    .line 186
    .line 187
    if-eqz p0, :cond_11

    .line 188
    .line 189
    const/16 v0, 0x12

    .line 190
    .line 191
    sget-object v1, Lcom/p1/mobile/putong/data/CounterGrowth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 192
    .line 193
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 194
    .line 195
    .line 196
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->profileLike:Lcom/p1/mobile/putong/data/ProfileLike;

    .line 197
    .line 198
    if-eqz p0, :cond_12

    .line 199
    .line 200
    const/16 v0, 0x13

    .line 201
    .line 202
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileLike;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    .line 204
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 205
    .line 206
    .line 207
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->pickUsers:Lcom/p1/mobile/putong/data/CounterPickUsers;

    .line 208
    .line 209
    if-eqz p0, :cond_13

    .line 210
    .line 211
    const/16 v0, 0x14

    .line 212
    .line 213
    sget-object v1, Lcom/p1/mobile/putong/data/CounterPickUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 216
    .line 217
    .line 218
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->fakeLikeLimits:Lcom/p1/mobile/putong/data/FakeLikeLimits;

    .line 219
    .line 220
    if-eqz p0, :cond_14

    .line 221
    .line 222
    const/16 v0, 0x15

    .line 223
    .line 224
    sget-object v1, Lcom/p1/mobile/putong/data/FakeLikeLimits;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 225
    .line 226
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 227
    .line 228
    .line 229
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->flower:Lcom/p1/mobile/putong/data/FeedFlower;

    .line 230
    .line 231
    if-eqz p0, :cond_15

    .line 232
    .line 233
    const/16 v0, 0x16

    .line 234
    .line 235
    sget-object v1, Lcom/p1/mobile/putong/data/FeedFlower;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 236
    .line 237
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 238
    .line 239
    .line 240
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Counter;->verification:Lcom/p1/mobile/putong/data/VerificationLimit;

    .line 241
    .line 242
    if-eqz p0, :cond_16

    .line 243
    .line 244
    const/16 p1, 0x17

    .line 245
    .line 246
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 247
    .line 248
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 249
    .line 250
    .line 251
    :cond_16
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 252
    check-cast p1, Lcom/p1/mobile/putong/data/Counter;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Counter$1;->serialize(Lcom/p1/mobile/putong/data/Counter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
