.class Lcom/p1/mobile/putong/feed/data/FeedData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/FeedData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/FeedData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/FeedData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraFilter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-static {v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 13
    .line 14
    .line 15
    move-result p0

    .line 16
    goto :goto_0

    .line 17
    :cond_0
    const/4 p0, 0x0

    .line 18
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/feed/data/CameraSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    .line 27
    move-result-object v1

    .line 28
    const/4 v2, 0x2

    .line 29
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MusicCategory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    .line 43
    move-result-object v1

    .line 44
    const/4 v2, 0x3

    .line 45
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    .line 59
    move-result-object v1

    .line 60
    const/4 v2, 0x4

    .line 61
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v0, :cond_4

    .line 69
    .line 70
    sget-object v1, Lcom/p1/mobile/putong/feed/data/CameraCategory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x5

    .line 77
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/4 v2, 0x6

    .line 93
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 99
    .line 100
    if-eqz v0, :cond_6

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    .line 107
    move-result-object v1

    .line 108
    const/4 v2, 0x7

    .line 109
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v0, :cond_7

    .line 117
    .line 118
    sget-object v1, Lcom/p1/mobile/putong/feed/data/RawFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const/16 v2, 0x8

    .line 125
    .line 126
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 132
    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    .line 140
    move-result-object v1

    .line 141
    const/16 v2, 0x9

    .line 142
    .line 143
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr p0, v0

    .line 148
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 149
    .line 150
    if-eqz v0, :cond_9

    .line 151
    .line 152
    sget-object v1, Lcom/p1/mobile/putong/data/Room;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    .line 157
    move-result-object v1

    .line 158
    const/16 v2, 0xa

    .line 159
    .line 160
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 166
    .line 167
    if-eqz v0, :cond_a

    .line 168
    .line 169
    sget-object v1, Lcom/p1/mobile/putong/feed/data/VoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    .line 174
    move-result-object v1

    .line 175
    const/16 v2, 0xb

    .line 176
    .line 177
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 183
    .line 184
    if-eqz v0, :cond_b

    .line 185
    .line 186
    sget-object v1, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    .line 188
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    .line 191
    move-result-object v1

    .line 192
    const/16 v2, 0xc

    .line 193
    .line 194
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    add-int/2addr p0, v0

    .line 199
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 200
    .line 201
    if-eqz v0, :cond_c

    .line 202
    .line 203
    sget-object v1, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 204
    .line 205
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 206
    .line 207
    .line 208
    move-result-object v1

    .line 209
    const/16 v2, 0xd

    .line 210
    .line 211
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    add-int/2addr p0, v0

    .line 216
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 217
    .line 218
    if-eqz v0, :cond_d

    .line 219
    .line 220
    sget-object v1, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 221
    .line 222
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    .line 225
    move-result-object v1

    .line 226
    const/16 v2, 0xe

    .line 227
    .line 228
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    add-int/2addr p0, v0

    .line 233
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 234
    .line 235
    if-eqz v0, :cond_e

    .line 236
    .line 237
    const/16 v1, 0xf

    .line 238
    .line 239
    sget-object v2, Lcom/p1/mobile/putong/feed/data/Extra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 247
    .line 248
    if-eqz v0, :cond_f

    .line 249
    .line 250
    sget-object v1, Lcom/p1/mobile/putong/feed/data/GreetingPermission;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 251
    .line 252
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 253
    .line 254
    .line 255
    move-result-object v1

    .line 256
    const/16 v2, 0x10

    .line 257
    .line 258
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    add-int/2addr p0, v0

    .line 263
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 264
    .line 265
    if-eqz v0, :cond_10

    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    const/16 v2, 0x11

    .line 274
    .line 275
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    add-int/2addr p0, v0

    .line 280
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 281
    .line 282
    if-eqz v0, :cond_11

    .line 283
    .line 284
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 285
    .line 286
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 287
    .line 288
    .line 289
    move-result-object v1

    .line 290
    const/16 v2, 0x12

    .line 291
    .line 292
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    add-int/2addr p0, v0

    .line 297
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 298
    .line 299
    if-eqz v0, :cond_12

    .line 300
    .line 301
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 302
    .line 303
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 304
    .line 305
    .line 306
    move-result-object v1

    .line 307
    const/16 v2, 0x13

    .line 308
    .line 309
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    add-int/2addr p0, v0

    .line 314
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 315
    .line 316
    if-eqz v0, :cond_13

    .line 317
    .line 318
    sget-object v1, Lcom/p1/mobile/putong/data/VoiceLiveGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 319
    .line 320
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    const/16 v2, 0x14

    .line 325
    .line 326
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    add-int/2addr p0, v0

    .line 331
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 332
    .line 333
    if-eqz v0, :cond_14

    .line 334
    .line 335
    sget-object v1, Lcom/p1/mobile/putong/data/LiveUserMask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    .line 340
    move-result-object v1

    .line 341
    const/16 v2, 0x15

    .line 342
    .line 343
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    add-int/2addr p0, v0

    .line 348
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 349
    .line 350
    if-eqz v0, :cond_15

    .line 351
    .line 352
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 353
    .line 354
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    const/16 v2, 0x16

    .line 359
    .line 360
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 361
    .line 362
    .line 363
    move-result v0

    .line 364
    add-int/2addr p0, v0

    .line 365
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 366
    .line 367
    if-eqz v0, :cond_16

    .line 368
    .line 369
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    const/16 v2, 0x17

    .line 376
    .line 377
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    add-int/2addr p0, v0

    .line 382
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 383
    .line 384
    if-eqz v0, :cond_17

    .line 385
    .line 386
    sget-object v1, Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 387
    .line 388
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 389
    .line 390
    .line 391
    move-result-object v1

    .line 392
    const/16 v2, 0x18

    .line 393
    .line 394
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 395
    .line 396
    .line 397
    move-result v0

    .line 398
    add-int/2addr p0, v0

    .line 399
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 400
    .line 401
    if-eqz v0, :cond_18

    .line 402
    .line 403
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 404
    .line 405
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    const/16 v2, 0x19

    .line 410
    .line 411
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    add-int/2addr p0, v0

    .line 416
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 417
    .line 418
    if-eqz v0, :cond_19

    .line 419
    .line 420
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Frame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 421
    .line 422
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 423
    .line 424
    .line 425
    move-result-object v1

    .line 426
    const/16 v2, 0x1a

    .line 427
    .line 428
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 429
    .line 430
    .line 431
    move-result v0

    .line 432
    add-int/2addr p0, v0

    .line 433
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 434
    .line 435
    if-eqz v0, :cond_1a

    .line 436
    .line 437
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Moment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 438
    .line 439
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 440
    .line 441
    .line 442
    move-result-object v1

    .line 443
    const/16 v2, 0x1b

    .line 444
    .line 445
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 446
    .line 447
    .line 448
    move-result v0

    .line 449
    add-int/2addr p0, v0

    .line 450
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 451
    .line 452
    if-eqz v0, :cond_1b

    .line 453
    .line 454
    const/16 v1, 0x1c

    .line 455
    .line 456
    sget-object v2, Lcom/p1/mobile/putong/feed/data/DetectInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 457
    .line 458
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    add-int/2addr p0, v0

    .line 463
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 464
    .line 465
    if-eqz v0, :cond_1c

    .line 466
    .line 467
    const/16 v1, 0x1d

    .line 468
    .line 469
    sget-object v2, Lcom/p1/mobile/putong/feed/data/RankingBoards;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 470
    .line 471
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 472
    .line 473
    .line 474
    move-result v0

    .line 475
    add-int/2addr p0, v0

    .line 476
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 477
    .line 478
    if-eqz v0, :cond_1d

    .line 479
    .line 480
    const/16 v1, 0x1e

    .line 481
    .line 482
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 483
    .line 484
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 485
    .line 486
    .line 487
    move-result v0

    .line 488
    add-int/2addr p0, v0

    .line 489
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 490
    .line 491
    if-eqz v0, :cond_1e

    .line 492
    .line 493
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 494
    .line 495
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 496
    .line 497
    .line 498
    move-result-object v1

    .line 499
    const/16 v2, 0x1f

    .line 500
    .line 501
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 502
    .line 503
    .line 504
    move-result v0

    .line 505
    add-int/2addr p0, v0

    .line 506
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 507
    .line 508
    if-eqz v0, :cond_1f

    .line 509
    .line 510
    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 511
    .line 512
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 513
    .line 514
    .line 515
    move-result-object v1

    .line 516
    const/16 v2, 0x20

    .line 517
    .line 518
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 519
    .line 520
    .line 521
    move-result v0

    .line 522
    add-int/2addr p0, v0

    .line 523
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 524
    .line 525
    if-eqz v0, :cond_20

    .line 526
    .line 527
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 528
    .line 529
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 530
    .line 531
    .line 532
    move-result-object v1

    .line 533
    const/16 v2, 0x21

    .line 534
    .line 535
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 536
    .line 537
    .line 538
    move-result v0

    .line 539
    add-int/2addr p0, v0

    .line 540
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 541
    .line 542
    if-eqz v0, :cond_21

    .line 543
    .line 544
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 545
    .line 546
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 547
    .line 548
    .line 549
    move-result-object v1

    .line 550
    const/16 v2, 0x22

    .line 551
    .line 552
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 553
    .line 554
    .line 555
    move-result v0

    .line 556
    add-int/2addr p0, v0

    .line 557
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 558
    .line 559
    if-eqz v0, :cond_22

    .line 560
    .line 561
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Group;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 562
    .line 563
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 564
    .line 565
    .line 566
    move-result-object v1

    .line 567
    const/16 v2, 0x23

    .line 568
    .line 569
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 570
    .line 571
    .line 572
    move-result v0

    .line 573
    add-int/2addr p0, v0

    .line 574
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 575
    .line 576
    if-eqz v0, :cond_23

    .line 577
    .line 578
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 579
    .line 580
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 581
    .line 582
    .line 583
    move-result-object v1

    .line 584
    const/16 v2, 0x24

    .line 585
    .line 586
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 587
    .line 588
    .line 589
    move-result v0

    .line 590
    add-int/2addr p0, v0

    .line 591
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 592
    .line 593
    if-eqz v0, :cond_24

    .line 594
    .line 595
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 596
    .line 597
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 598
    .line 599
    .line 600
    move-result-object v1

    .line 601
    const/16 v2, 0x25

    .line 602
    .line 603
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 604
    .line 605
    .line 606
    move-result v0

    .line 607
    add-int/2addr p0, v0

    .line 608
    :cond_24
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 609
    .line 610
    if-eqz v0, :cond_25

    .line 611
    .line 612
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 613
    .line 614
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 615
    .line 616
    .line 617
    move-result-object v1

    .line 618
    const/16 v2, 0x26

    .line 619
    .line 620
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 621
    .line 622
    .line 623
    move-result v0

    .line 624
    add-int/2addr p0, v0

    .line 625
    :cond_25
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 626
    .line 627
    if-eqz v0, :cond_26

    .line 628
    .line 629
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 630
    .line 631
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 632
    .line 633
    .line 634
    move-result-object v1

    .line 635
    const/16 v2, 0x27

    .line 636
    .line 637
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 638
    .line 639
    .line 640
    move-result v0

    .line 641
    add-int/2addr p0, v0

    .line 642
    :cond_26
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 643
    .line 644
    if-eqz v0, :cond_27

    .line 645
    .line 646
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 647
    .line 648
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 649
    .line 650
    .line 651
    move-result-object v1

    .line 652
    const/16 v2, 0x28

    .line 653
    .line 654
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 655
    .line 656
    .line 657
    move-result v0

    .line 658
    add-int/2addr p0, v0

    .line 659
    :cond_27
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 660
    .line 661
    if-eqz v0, :cond_28

    .line 662
    .line 663
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Meet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 664
    .line 665
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 666
    .line 667
    .line 668
    move-result-object v1

    .line 669
    const/16 v2, 0x29

    .line 670
    .line 671
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 672
    .line 673
    .line 674
    move-result v0

    .line 675
    add-int/2addr p0, v0

    .line 676
    :cond_28
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 677
    .line 678
    if-eqz v0, :cond_29

    .line 679
    .line 680
    const/16 v1, 0x2a

    .line 681
    .line 682
    sget-object v2, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 683
    .line 684
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 685
    .line 686
    .line 687
    move-result v0

    .line 688
    add-int/2addr p0, v0

    .line 689
    :cond_29
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 690
    .line 691
    if-eqz v0, :cond_2a

    .line 692
    .line 693
    sget-object v1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 694
    .line 695
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 696
    .line 697
    .line 698
    move-result-object v1

    .line 699
    const/16 v2, 0x2b

    .line 700
    .line 701
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 702
    .line 703
    .line 704
    move-result v0

    .line 705
    add-int/2addr p0, v0

    .line 706
    :cond_2a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 707
    .line 708
    if-eqz v0, :cond_2b

    .line 709
    .line 710
    const/16 v1, 0x2c

    .line 711
    .line 712
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 713
    .line 714
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 715
    .line 716
    .line 717
    move-result v0

    .line 718
    add-int/2addr p0, v0

    .line 719
    :cond_2b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 720
    .line 721
    if-eqz v0, :cond_2c

    .line 722
    .line 723
    sget-object v1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 724
    .line 725
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 726
    .line 727
    .line 728
    move-result-object v1

    .line 729
    const/16 v2, 0x2d

    .line 730
    .line 731
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 732
    .line 733
    .line 734
    move-result v0

    .line 735
    add-int/2addr p0, v0

    .line 736
    :cond_2c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 737
    .line 738
    if-eqz v0, :cond_2d

    .line 739
    .line 740
    sget-object v1, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 741
    .line 742
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 743
    .line 744
    .line 745
    move-result-object v1

    .line 746
    const/16 v2, 0x2e

    .line 747
    .line 748
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 749
    .line 750
    .line 751
    move-result v0

    .line 752
    add-int/2addr p0, v0

    .line 753
    :cond_2d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 754
    .line 755
    if-eqz v0, :cond_2e

    .line 756
    .line 757
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 758
    .line 759
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 760
    .line 761
    .line 762
    move-result-object v1

    .line 763
    const/16 v2, 0x2f

    .line 764
    .line 765
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 766
    .line 767
    .line 768
    move-result v0

    .line 769
    add-int/2addr p0, v0

    .line 770
    :cond_2e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 771
    .line 772
    if-eqz v0, :cond_2f

    .line 773
    .line 774
    sget-object v1, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 775
    .line 776
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 777
    .line 778
    .line 779
    move-result-object v1

    .line 780
    const/16 v2, 0x30

    .line 781
    .line 782
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 783
    .line 784
    .line 785
    move-result v0

    .line 786
    add-int/2addr p0, v0

    .line 787
    :cond_2f
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 788
    .line 789
    if-eqz v0, :cond_30

    .line 790
    .line 791
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 792
    .line 793
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 794
    .line 795
    .line 796
    move-result-object v1

    .line 797
    const/16 v2, 0x31

    .line 798
    .line 799
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 800
    .line 801
    .line 802
    move-result v0

    .line 803
    add-int/2addr p0, v0

    .line 804
    :cond_30
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 805
    .line 806
    if-eqz v0, :cond_31

    .line 807
    .line 808
    const/16 v1, 0x32

    .line 809
    .line 810
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PoiLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 811
    .line 812
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 813
    .line 814
    .line 815
    move-result v0

    .line 816
    add-int/2addr p0, v0

    .line 817
    :cond_31
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 818
    .line 819
    if-eqz v0, :cond_32

    .line 820
    .line 821
    sget-object v1, Lcom/p1/mobile/putong/data/StickerInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 822
    .line 823
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 824
    .line 825
    .line 826
    move-result-object v1

    .line 827
    const/16 v2, 0x33

    .line 828
    .line 829
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 830
    .line 831
    .line 832
    move-result v0

    .line 833
    add-int/2addr p0, v0

    .line 834
    :cond_32
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 835
    .line 836
    if-eqz v0, :cond_33

    .line 837
    .line 838
    const/16 v1, 0x34

    .line 839
    .line 840
    sget-object v2, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 841
    .line 842
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 843
    .line 844
    .line 845
    move-result v0

    .line 846
    add-int/2addr p0, v0

    .line 847
    :cond_33
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 848
    .line 849
    if-eqz v0, :cond_34

    .line 850
    .line 851
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 852
    .line 853
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 854
    .line 855
    .line 856
    move-result-object v1

    .line 857
    const/16 v2, 0x35

    .line 858
    .line 859
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 860
    .line 861
    .line 862
    move-result v0

    .line 863
    add-int/2addr p0, v0

    .line 864
    :cond_34
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 865
    .line 866
    if-eqz v0, :cond_35

    .line 867
    .line 868
    const/16 v1, 0x36

    .line 869
    .line 870
    sget-object v2, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 871
    .line 872
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 873
    .line 874
    .line 875
    move-result v0

    .line 876
    add-int/2addr p0, v0

    .line 877
    :cond_35
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 878
    .line 879
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 880
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/FeedData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/FeedData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/FeedData;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/FeedData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/FeedData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 14
    .line 15
    if-nez p1, :cond_0

    .line 16
    .line 17
    new-instance p1, Ljava/util/ArrayList;

    .line 18
    .line 19
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 20
    .line 21
    .line 22
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 23
    .line 24
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 25
    .line 26
    if-nez p1, :cond_1

    .line 27
    .line 28
    new-instance p1, Ljava/util/ArrayList;

    .line 29
    .line 30
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 31
    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 34
    .line 35
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 36
    .line 37
    if-nez p1, :cond_2

    .line 38
    .line 39
    new-instance p1, Ljava/util/ArrayList;

    .line 40
    .line 41
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 42
    .line 43
    .line 44
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 45
    .line 46
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 47
    .line 48
    if-nez p1, :cond_3

    .line 49
    .line 50
    new-instance p1, Ljava/util/ArrayList;

    .line 51
    .line 52
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 53
    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 56
    .line 57
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 58
    .line 59
    if-nez p1, :cond_4

    .line 60
    .line 61
    new-instance p1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 67
    .line 68
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 69
    .line 70
    if-nez p1, :cond_5

    .line 71
    .line 72
    new-instance p1, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    new-instance p1, Ljava/util/ArrayList;

    .line 84
    .line 85
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 86
    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 89
    .line 90
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 91
    .line 92
    if-nez p1, :cond_7

    .line 93
    .line 94
    new-instance p1, Ljava/util/ArrayList;

    .line 95
    .line 96
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 97
    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 100
    .line 101
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 102
    .line 103
    if-nez p1, :cond_8

    .line 104
    .line 105
    new-instance p1, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 111
    .line 112
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 113
    .line 114
    if-nez p1, :cond_9

    .line 115
    .line 116
    new-instance p1, Ljava/util/ArrayList;

    .line 117
    .line 118
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 119
    .line 120
    .line 121
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 122
    .line 123
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 124
    .line 125
    if-nez p1, :cond_a

    .line 126
    .line 127
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Extra;->new_()Lcom/p1/mobile/putong/feed/data/Extra;

    .line 128
    .line 129
    .line 130
    move-result-object p1

    .line 131
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 132
    .line 133
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 134
    .line 135
    if-nez p1, :cond_b

    .line 136
    .line 137
    new-instance p1, Ljava/util/ArrayList;

    .line 138
    .line 139
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 140
    .line 141
    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 143
    .line 144
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 145
    .line 146
    if-nez p1, :cond_c

    .line 147
    .line 148
    new-instance p1, Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 154
    .line 155
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 156
    .line 157
    if-nez p1, :cond_d

    .line 158
    .line 159
    new-instance p1, Ljava/util/ArrayList;

    .line 160
    .line 161
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 162
    .line 163
    .line 164
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 165
    .line 166
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 167
    .line 168
    if-nez p1, :cond_e

    .line 169
    .line 170
    new-instance p1, Ljava/util/ArrayList;

    .line 171
    .line 172
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 173
    .line 174
    .line 175
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 176
    .line 177
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 178
    .line 179
    if-nez p1, :cond_f

    .line 180
    .line 181
    new-instance p1, Ljava/util/ArrayList;

    .line 182
    .line 183
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 184
    .line 185
    .line 186
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 187
    .line 188
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 189
    .line 190
    if-nez p1, :cond_10

    .line 191
    .line 192
    new-instance p1, Ljava/util/ArrayList;

    .line 193
    .line 194
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 195
    .line 196
    .line 197
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 198
    .line 199
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 200
    .line 201
    if-nez p1, :cond_11

    .line 202
    .line 203
    new-instance p1, Ljava/util/ArrayList;

    .line 204
    .line 205
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 206
    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 209
    .line 210
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 211
    .line 212
    if-nez p1, :cond_12

    .line 213
    .line 214
    new-instance p1, Ljava/util/ArrayList;

    .line 215
    .line 216
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 217
    .line 218
    .line 219
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 220
    .line 221
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 222
    .line 223
    if-nez p1, :cond_13

    .line 224
    .line 225
    new-instance p1, Ljava/util/ArrayList;

    .line 226
    .line 227
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 228
    .line 229
    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 231
    .line 232
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 233
    .line 234
    if-nez p1, :cond_14

    .line 235
    .line 236
    new-instance p1, Ljava/util/ArrayList;

    .line 237
    .line 238
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 239
    .line 240
    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 242
    .line 243
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 244
    .line 245
    if-nez p1, :cond_15

    .line 246
    .line 247
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/DetectInfo;->new_()Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 248
    .line 249
    .line 250
    move-result-object p1

    .line 251
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 252
    .line 253
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 254
    .line 255
    if-nez p1, :cond_16

    .line 256
    .line 257
    new-instance p1, Ljava/util/ArrayList;

    .line 258
    .line 259
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 260
    .line 261
    .line 262
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 263
    .line 264
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 265
    .line 266
    if-nez p1, :cond_17

    .line 267
    .line 268
    new-instance p1, Ljava/util/ArrayList;

    .line 269
    .line 270
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 271
    .line 272
    .line 273
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 274
    .line 275
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 276
    .line 277
    if-nez p1, :cond_18

    .line 278
    .line 279
    new-instance p1, Ljava/util/ArrayList;

    .line 280
    .line 281
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 282
    .line 283
    .line 284
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 285
    .line 286
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 287
    .line 288
    if-nez p1, :cond_19

    .line 289
    .line 290
    new-instance p1, Ljava/util/ArrayList;

    .line 291
    .line 292
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 293
    .line 294
    .line 295
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 296
    .line 297
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 298
    .line 299
    if-nez p1, :cond_1a

    .line 300
    .line 301
    new-instance p1, Ljava/util/ArrayList;

    .line 302
    .line 303
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 304
    .line 305
    .line 306
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 307
    .line 308
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 309
    .line 310
    if-nez p1, :cond_1b

    .line 311
    .line 312
    new-instance p1, Ljava/util/ArrayList;

    .line 313
    .line 314
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 315
    .line 316
    .line 317
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 318
    .line 319
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 320
    .line 321
    if-nez p1, :cond_1c

    .line 322
    .line 323
    new-instance p1, Ljava/util/ArrayList;

    .line 324
    .line 325
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 326
    .line 327
    .line 328
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 329
    .line 330
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 331
    .line 332
    if-nez p1, :cond_1d

    .line 333
    .line 334
    new-instance p1, Ljava/util/ArrayList;

    .line 335
    .line 336
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 337
    .line 338
    .line 339
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 340
    .line 341
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 342
    .line 343
    if-nez p1, :cond_1e

    .line 344
    .line 345
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->new_()Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 346
    .line 347
    .line 348
    move-result-object p1

    .line 349
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 350
    .line 351
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 352
    .line 353
    if-nez p1, :cond_1f

    .line 354
    .line 355
    new-instance p1, Ljava/util/ArrayList;

    .line 356
    .line 357
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 358
    .line 359
    .line 360
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 361
    .line 362
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 363
    .line 364
    if-nez p1, :cond_20

    .line 365
    .line 366
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 367
    .line 368
    .line 369
    move-result-object p1

    .line 370
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 371
    .line 372
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 373
    .line 374
    if-nez p1, :cond_21

    .line 375
    .line 376
    new-instance p1, Ljava/util/ArrayList;

    .line 377
    .line 378
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 379
    .line 380
    .line 381
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 382
    .line 383
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 384
    .line 385
    if-nez p1, :cond_22

    .line 386
    .line 387
    new-instance p1, Ljava/util/ArrayList;

    .line 388
    .line 389
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 390
    .line 391
    .line 392
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 393
    .line 394
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 395
    .line 396
    if-nez p1, :cond_23

    .line 397
    .line 398
    new-instance p1, Ljava/util/ArrayList;

    .line 399
    .line 400
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 401
    .line 402
    .line 403
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 404
    .line 405
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 406
    .line 407
    if-nez p1, :cond_24

    .line 408
    .line 409
    new-instance p1, Ljava/util/ArrayList;

    .line 410
    .line 411
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 412
    .line 413
    .line 414
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 415
    .line 416
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 417
    .line 418
    if-nez p1, :cond_25

    .line 419
    .line 420
    new-instance p1, Ljava/util/ArrayList;

    .line 421
    .line 422
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 423
    .line 424
    .line 425
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 426
    .line 427
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 428
    .line 429
    if-nez p1, :cond_26

    .line 430
    .line 431
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiLocation;->new_()Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 436
    .line 437
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 438
    .line 439
    if-nez p1, :cond_27

    .line 440
    .line 441
    new-instance p1, Ljava/util/ArrayList;

    .line 442
    .line 443
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 444
    .line 445
    .line 446
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 447
    .line 448
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 449
    .line 450
    if-nez p1, :cond_28

    .line 451
    .line 452
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->new_()Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 453
    .line 454
    .line 455
    move-result-object p1

    .line 456
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 457
    .line 458
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 459
    .line 460
    if-nez p1, :cond_29

    .line 461
    .line 462
    new-instance p1, Ljava/util/ArrayList;

    .line 463
    .line 464
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 465
    .line 466
    .line 467
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 468
    .line 469
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 470
    .line 471
    if-nez p1, :cond_54

    .line 472
    .line 473
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->new_()Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 478
    .line 479
    return-object p0

    .line 480
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 481
    .line 482
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 483
    .line 484
    .line 485
    move-result-object v0

    .line 486
    check-cast v0, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 487
    .line 488
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 489
    .line 490
    goto/16 :goto_0

    .line 491
    .line 492
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 493
    .line 494
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 499
    .line 500
    .line 501
    move-result-object v0

    .line 502
    check-cast v0, Ljava/util/List;

    .line 503
    .line 504
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 505
    .line 506
    goto/16 :goto_0

    .line 507
    .line 508
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 509
    .line 510
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 511
    .line 512
    .line 513
    move-result-object v0

    .line 514
    check-cast v0, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 515
    .line 516
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 517
    .line 518
    goto/16 :goto_0

    .line 519
    .line 520
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/StickerInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 521
    .line 522
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 523
    .line 524
    .line 525
    move-result-object v0

    .line 526
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 527
    .line 528
    .line 529
    move-result-object v0

    .line 530
    check-cast v0, Ljava/util/List;

    .line 531
    .line 532
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 533
    .line 534
    goto/16 :goto_0

    .line 535
    .line 536
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 537
    .line 538
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 539
    .line 540
    .line 541
    move-result-object v0

    .line 542
    check-cast v0, Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 543
    .line 544
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 545
    .line 546
    goto/16 :goto_0

    .line 547
    .line 548
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 549
    .line 550
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 551
    .line 552
    .line 553
    move-result-object v0

    .line 554
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    check-cast v0, Ljava/util/List;

    .line 559
    .line 560
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 561
    .line 562
    goto/16 :goto_0

    .line 563
    .line 564
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 565
    .line 566
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 567
    .line 568
    .line 569
    move-result-object v0

    .line 570
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 571
    .line 572
    .line 573
    move-result-object v0

    .line 574
    check-cast v0, Ljava/util/List;

    .line 575
    .line 576
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 577
    .line 578
    goto/16 :goto_0

    .line 579
    .line 580
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 581
    .line 582
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 583
    .line 584
    .line 585
    move-result-object v0

    .line 586
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 587
    .line 588
    .line 589
    move-result-object v0

    .line 590
    check-cast v0, Ljava/util/List;

    .line 591
    .line 592
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 593
    .line 594
    goto/16 :goto_0

    .line 595
    .line 596
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 597
    .line 598
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 599
    .line 600
    .line 601
    move-result-object v0

    .line 602
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 603
    .line 604
    .line 605
    move-result-object v0

    .line 606
    check-cast v0, Ljava/util/List;

    .line 607
    .line 608
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 609
    .line 610
    goto/16 :goto_0

    .line 611
    .line 612
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 613
    .line 614
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 619
    .line 620
    .line 621
    move-result-object v0

    .line 622
    check-cast v0, Ljava/util/List;

    .line 623
    .line 624
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 625
    .line 626
    goto/16 :goto_0

    .line 627
    .line 628
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 629
    .line 630
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 631
    .line 632
    .line 633
    move-result-object v0

    .line 634
    check-cast v0, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 635
    .line 636
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 637
    .line 638
    goto/16 :goto_0

    .line 639
    .line 640
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 641
    .line 642
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 643
    .line 644
    .line 645
    move-result-object v0

    .line 646
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 647
    .line 648
    .line 649
    move-result-object v0

    .line 650
    check-cast v0, Ljava/util/List;

    .line 651
    .line 652
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 653
    .line 654
    goto/16 :goto_0

    .line 655
    .line 656
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 657
    .line 658
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 659
    .line 660
    .line 661
    move-result-object v0

    .line 662
    check-cast v0, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 663
    .line 664
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 665
    .line 666
    goto/16 :goto_0

    .line 667
    .line 668
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Meet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 669
    .line 670
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 671
    .line 672
    .line 673
    move-result-object v0

    .line 674
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 675
    .line 676
    .line 677
    move-result-object v0

    .line 678
    check-cast v0, Ljava/util/List;

    .line 679
    .line 680
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 681
    .line 682
    goto/16 :goto_0

    .line 683
    .line 684
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 685
    .line 686
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 687
    .line 688
    .line 689
    move-result-object v0

    .line 690
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 691
    .line 692
    .line 693
    move-result-object v0

    .line 694
    check-cast v0, Ljava/util/List;

    .line 695
    .line 696
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 697
    .line 698
    goto/16 :goto_0

    .line 699
    .line 700
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 701
    .line 702
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 703
    .line 704
    .line 705
    move-result-object v0

    .line 706
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 707
    .line 708
    .line 709
    move-result-object v0

    .line 710
    check-cast v0, Ljava/util/List;

    .line 711
    .line 712
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 713
    .line 714
    goto/16 :goto_0

    .line 715
    .line 716
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 717
    .line 718
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 719
    .line 720
    .line 721
    move-result-object v0

    .line 722
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 723
    .line 724
    .line 725
    move-result-object v0

    .line 726
    check-cast v0, Ljava/util/List;

    .line 727
    .line 728
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 729
    .line 730
    goto/16 :goto_0

    .line 731
    .line 732
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 733
    .line 734
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 735
    .line 736
    .line 737
    move-result-object v0

    .line 738
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 739
    .line 740
    .line 741
    move-result-object v0

    .line 742
    check-cast v0, Ljava/util/List;

    .line 743
    .line 744
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 745
    .line 746
    goto/16 :goto_0

    .line 747
    .line 748
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 749
    .line 750
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 751
    .line 752
    .line 753
    move-result-object v0

    .line 754
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 755
    .line 756
    .line 757
    move-result-object v0

    .line 758
    check-cast v0, Ljava/util/List;

    .line 759
    .line 760
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 761
    .line 762
    goto/16 :goto_0

    .line 763
    .line 764
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Group;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 765
    .line 766
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 767
    .line 768
    .line 769
    move-result-object v0

    .line 770
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 771
    .line 772
    .line 773
    move-result-object v0

    .line 774
    check-cast v0, Ljava/util/List;

    .line 775
    .line 776
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 777
    .line 778
    goto/16 :goto_0

    .line 779
    .line 780
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 781
    .line 782
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 783
    .line 784
    .line 785
    move-result-object v0

    .line 786
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 787
    .line 788
    .line 789
    move-result-object v0

    .line 790
    check-cast v0, Ljava/util/List;

    .line 791
    .line 792
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 793
    .line 794
    goto/16 :goto_0

    .line 795
    .line 796
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 797
    .line 798
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 799
    .line 800
    .line 801
    move-result-object v0

    .line 802
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 803
    .line 804
    .line 805
    move-result-object v0

    .line 806
    check-cast v0, Ljava/util/List;

    .line 807
    .line 808
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 809
    .line 810
    goto/16 :goto_0

    .line 811
    .line 812
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 813
    .line 814
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 815
    .line 816
    .line 817
    move-result-object v0

    .line 818
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 819
    .line 820
    .line 821
    move-result-object v0

    .line 822
    check-cast v0, Ljava/util/List;

    .line 823
    .line 824
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 825
    .line 826
    goto/16 :goto_0

    .line 827
    .line 828
    :sswitch_17
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 829
    .line 830
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 831
    .line 832
    .line 833
    move-result-object v0

    .line 834
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 835
    .line 836
    .line 837
    move-result-object v0

    .line 838
    check-cast v0, Ljava/util/List;

    .line 839
    .line 840
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 841
    .line 842
    goto/16 :goto_0

    .line 843
    .line 844
    :sswitch_18
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 845
    .line 846
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 847
    .line 848
    .line 849
    move-result-object v0

    .line 850
    check-cast v0, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 851
    .line 852
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 853
    .line 854
    goto/16 :goto_0

    .line 855
    .line 856
    :sswitch_19
    sget-object v0, Lcom/p1/mobile/putong/feed/data/RankingBoards;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 857
    .line 858
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 859
    .line 860
    .line 861
    move-result-object v0

    .line 862
    check-cast v0, Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 863
    .line 864
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 865
    .line 866
    goto/16 :goto_0

    .line 867
    .line 868
    :sswitch_1a
    sget-object v0, Lcom/p1/mobile/putong/feed/data/DetectInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 869
    .line 870
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 871
    .line 872
    .line 873
    move-result-object v0

    .line 874
    check-cast v0, Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 875
    .line 876
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 877
    .line 878
    goto/16 :goto_0

    .line 879
    .line 880
    :sswitch_1b
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 881
    .line 882
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 883
    .line 884
    .line 885
    move-result-object v0

    .line 886
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 887
    .line 888
    .line 889
    move-result-object v0

    .line 890
    check-cast v0, Ljava/util/List;

    .line 891
    .line 892
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 893
    .line 894
    goto/16 :goto_0

    .line 895
    .line 896
    :sswitch_1c
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Frame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 897
    .line 898
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 899
    .line 900
    .line 901
    move-result-object v0

    .line 902
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 903
    .line 904
    .line 905
    move-result-object v0

    .line 906
    check-cast v0, Ljava/util/List;

    .line 907
    .line 908
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 909
    .line 910
    goto/16 :goto_0

    .line 911
    .line 912
    :sswitch_1d
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 913
    .line 914
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 915
    .line 916
    .line 917
    move-result-object v0

    .line 918
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 919
    .line 920
    .line 921
    move-result-object v0

    .line 922
    check-cast v0, Ljava/util/List;

    .line 923
    .line 924
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 925
    .line 926
    goto/16 :goto_0

    .line 927
    .line 928
    :sswitch_1e
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 929
    .line 930
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 931
    .line 932
    .line 933
    move-result-object v0

    .line 934
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 935
    .line 936
    .line 937
    move-result-object v0

    .line 938
    check-cast v0, Ljava/util/List;

    .line 939
    .line 940
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 941
    .line 942
    goto/16 :goto_0

    .line 943
    .line 944
    :sswitch_1f
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 945
    .line 946
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 947
    .line 948
    .line 949
    move-result-object v0

    .line 950
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 951
    .line 952
    .line 953
    move-result-object v0

    .line 954
    check-cast v0, Ljava/util/List;

    .line 955
    .line 956
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 957
    .line 958
    goto/16 :goto_0

    .line 959
    .line 960
    :sswitch_20
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 961
    .line 962
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 963
    .line 964
    .line 965
    move-result-object v0

    .line 966
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 967
    .line 968
    .line 969
    move-result-object v0

    .line 970
    check-cast v0, Ljava/util/List;

    .line 971
    .line 972
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 973
    .line 974
    goto/16 :goto_0

    .line 975
    .line 976
    :sswitch_21
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserMask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 977
    .line 978
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 979
    .line 980
    .line 981
    move-result-object v0

    .line 982
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 983
    .line 984
    .line 985
    move-result-object v0

    .line 986
    check-cast v0, Ljava/util/List;

    .line 987
    .line 988
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 989
    .line 990
    goto/16 :goto_0

    .line 991
    .line 992
    :sswitch_22
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 993
    .line 994
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 995
    .line 996
    .line 997
    move-result-object v0

    .line 998
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 999
    .line 1000
    .line 1001
    move-result-object v0

    .line 1002
    check-cast v0, Ljava/util/List;

    .line 1003
    .line 1004
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 1005
    .line 1006
    goto/16 :goto_0

    .line 1007
    .line 1008
    :sswitch_23
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1009
    .line 1010
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1011
    .line 1012
    .line 1013
    move-result-object v0

    .line 1014
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1015
    .line 1016
    .line 1017
    move-result-object v0

    .line 1018
    check-cast v0, Ljava/util/List;

    .line 1019
    .line 1020
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 1021
    .line 1022
    goto/16 :goto_0

    .line 1023
    .line 1024
    :sswitch_24
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1025
    .line 1026
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1027
    .line 1028
    .line 1029
    move-result-object v0

    .line 1030
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1031
    .line 1032
    .line 1033
    move-result-object v0

    .line 1034
    check-cast v0, Ljava/util/List;

    .line 1035
    .line 1036
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 1037
    .line 1038
    goto/16 :goto_0

    .line 1039
    .line 1040
    :sswitch_25
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1041
    .line 1042
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1043
    .line 1044
    .line 1045
    move-result-object v0

    .line 1046
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1047
    .line 1048
    .line 1049
    move-result-object v0

    .line 1050
    check-cast v0, Ljava/util/List;

    .line 1051
    .line 1052
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 1053
    .line 1054
    goto/16 :goto_0

    .line 1055
    .line 1056
    :sswitch_26
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GreetingPermission;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1057
    .line 1058
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1059
    .line 1060
    .line 1061
    move-result-object v0

    .line 1062
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1063
    .line 1064
    .line 1065
    move-result-object v0

    .line 1066
    check-cast v0, Ljava/util/List;

    .line 1067
    .line 1068
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 1069
    .line 1070
    goto/16 :goto_0

    .line 1071
    .line 1072
    :sswitch_27
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Extra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1073
    .line 1074
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1075
    .line 1076
    .line 1077
    move-result-object v0

    .line 1078
    check-cast v0, Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1079
    .line 1080
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1081
    .line 1082
    goto/16 :goto_0

    .line 1083
    .line 1084
    :sswitch_28
    sget-object v0, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1085
    .line 1086
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1087
    .line 1088
    .line 1089
    move-result-object v0

    .line 1090
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1091
    .line 1092
    .line 1093
    move-result-object v0

    .line 1094
    check-cast v0, Ljava/util/List;

    .line 1095
    .line 1096
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 1097
    .line 1098
    goto/16 :goto_0

    .line 1099
    .line 1100
    :sswitch_29
    sget-object v0, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1101
    .line 1102
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1103
    .line 1104
    .line 1105
    move-result-object v0

    .line 1106
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1107
    .line 1108
    .line 1109
    move-result-object v0

    .line 1110
    check-cast v0, Ljava/util/List;

    .line 1111
    .line 1112
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 1113
    .line 1114
    goto/16 :goto_0

    .line 1115
    .line 1116
    :sswitch_2a
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1117
    .line 1118
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1119
    .line 1120
    .line 1121
    move-result-object v0

    .line 1122
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1123
    .line 1124
    .line 1125
    move-result-object v0

    .line 1126
    check-cast v0, Ljava/util/List;

    .line 1127
    .line 1128
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 1129
    .line 1130
    goto/16 :goto_0

    .line 1131
    .line 1132
    :sswitch_2b
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1133
    .line 1134
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1135
    .line 1136
    .line 1137
    move-result-object v0

    .line 1138
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1139
    .line 1140
    .line 1141
    move-result-object v0

    .line 1142
    check-cast v0, Ljava/util/List;

    .line 1143
    .line 1144
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 1145
    .line 1146
    goto/16 :goto_0

    .line 1147
    .line 1148
    :sswitch_2c
    sget-object v0, Lcom/p1/mobile/putong/data/Room;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1149
    .line 1150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1151
    .line 1152
    .line 1153
    move-result-object v0

    .line 1154
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1155
    .line 1156
    .line 1157
    move-result-object v0

    .line 1158
    check-cast v0, Ljava/util/List;

    .line 1159
    .line 1160
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 1161
    .line 1162
    goto/16 :goto_0

    .line 1163
    .line 1164
    :sswitch_2d
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1165
    .line 1166
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1167
    .line 1168
    .line 1169
    move-result-object v0

    .line 1170
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1171
    .line 1172
    .line 1173
    move-result-object v0

    .line 1174
    check-cast v0, Ljava/util/List;

    .line 1175
    .line 1176
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 1177
    .line 1178
    goto/16 :goto_0

    .line 1179
    .line 1180
    :sswitch_2e
    sget-object v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1181
    .line 1182
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1183
    .line 1184
    .line 1185
    move-result-object v0

    .line 1186
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1187
    .line 1188
    .line 1189
    move-result-object v0

    .line 1190
    check-cast v0, Ljava/util/List;

    .line 1191
    .line 1192
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 1193
    .line 1194
    goto/16 :goto_0

    .line 1195
    .line 1196
    :sswitch_2f
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1197
    .line 1198
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1199
    .line 1200
    .line 1201
    move-result-object v0

    .line 1202
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1203
    .line 1204
    .line 1205
    move-result-object v0

    .line 1206
    check-cast v0, Ljava/util/List;

    .line 1207
    .line 1208
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 1209
    .line 1210
    goto/16 :goto_0

    .line 1211
    .line 1212
    :sswitch_30
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1213
    .line 1214
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1215
    .line 1216
    .line 1217
    move-result-object v0

    .line 1218
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1219
    .line 1220
    .line 1221
    move-result-object v0

    .line 1222
    check-cast v0, Ljava/util/List;

    .line 1223
    .line 1224
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 1225
    .line 1226
    goto/16 :goto_0

    .line 1227
    .line 1228
    :sswitch_31
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1229
    .line 1230
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1231
    .line 1232
    .line 1233
    move-result-object v0

    .line 1234
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1235
    .line 1236
    .line 1237
    move-result-object v0

    .line 1238
    check-cast v0, Ljava/util/List;

    .line 1239
    .line 1240
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 1241
    .line 1242
    goto/16 :goto_0

    .line 1243
    .line 1244
    :sswitch_32
    sget-object v0, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1245
    .line 1246
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1247
    .line 1248
    .line 1249
    move-result-object v0

    .line 1250
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1251
    .line 1252
    .line 1253
    move-result-object v0

    .line 1254
    check-cast v0, Ljava/util/List;

    .line 1255
    .line 1256
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 1257
    .line 1258
    goto/16 :goto_0

    .line 1259
    .line 1260
    :sswitch_33
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1261
    .line 1262
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1263
    .line 1264
    .line 1265
    move-result-object v0

    .line 1266
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1267
    .line 1268
    .line 1269
    move-result-object v0

    .line 1270
    check-cast v0, Ljava/util/List;

    .line 1271
    .line 1272
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 1273
    .line 1274
    goto/16 :goto_0

    .line 1275
    .line 1276
    :sswitch_34
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1277
    .line 1278
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1279
    .line 1280
    .line 1281
    move-result-object v0

    .line 1282
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1283
    .line 1284
    .line 1285
    move-result-object v0

    .line 1286
    check-cast v0, Ljava/util/List;

    .line 1287
    .line 1288
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 1289
    .line 1290
    goto/16 :goto_0

    .line 1291
    .line 1292
    :sswitch_35
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraFilter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1293
    .line 1294
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 1295
    .line 1296
    .line 1297
    move-result-object v0

    .line 1298
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 1299
    .line 1300
    .line 1301
    move-result-object v0

    .line 1302
    check-cast v0, Ljava/util/List;

    .line 1303
    .line 1304
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 1305
    .line 1306
    goto/16 :goto_0

    .line 1307
    .line 1308
    :sswitch_36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 1309
    .line 1310
    if-nez p1, :cond_2a

    .line 1311
    .line 1312
    new-instance p1, Ljava/util/ArrayList;

    .line 1313
    .line 1314
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1315
    .line 1316
    .line 1317
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 1318
    .line 1319
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 1320
    .line 1321
    if-nez p1, :cond_2b

    .line 1322
    .line 1323
    new-instance p1, Ljava/util/ArrayList;

    .line 1324
    .line 1325
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1326
    .line 1327
    .line 1328
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 1329
    .line 1330
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 1331
    .line 1332
    if-nez p1, :cond_2c

    .line 1333
    .line 1334
    new-instance p1, Ljava/util/ArrayList;

    .line 1335
    .line 1336
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1337
    .line 1338
    .line 1339
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 1340
    .line 1341
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 1342
    .line 1343
    if-nez p1, :cond_2d

    .line 1344
    .line 1345
    new-instance p1, Ljava/util/ArrayList;

    .line 1346
    .line 1347
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1348
    .line 1349
    .line 1350
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 1351
    .line 1352
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 1353
    .line 1354
    if-nez p1, :cond_2e

    .line 1355
    .line 1356
    new-instance p1, Ljava/util/ArrayList;

    .line 1357
    .line 1358
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1359
    .line 1360
    .line 1361
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 1362
    .line 1363
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 1364
    .line 1365
    if-nez p1, :cond_2f

    .line 1366
    .line 1367
    new-instance p1, Ljava/util/ArrayList;

    .line 1368
    .line 1369
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1370
    .line 1371
    .line 1372
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 1373
    .line 1374
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 1375
    .line 1376
    if-nez p1, :cond_30

    .line 1377
    .line 1378
    new-instance p1, Ljava/util/ArrayList;

    .line 1379
    .line 1380
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1381
    .line 1382
    .line 1383
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->dynamic_moments:Ljava/util/List;

    .line 1384
    .line 1385
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 1386
    .line 1387
    if-nez p1, :cond_31

    .line 1388
    .line 1389
    new-instance p1, Ljava/util/ArrayList;

    .line 1390
    .line 1391
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1392
    .line 1393
    .line 1394
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 1395
    .line 1396
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 1397
    .line 1398
    if-nez p1, :cond_32

    .line 1399
    .line 1400
    new-instance p1, Ljava/util/ArrayList;

    .line 1401
    .line 1402
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1403
    .line 1404
    .line 1405
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 1406
    .line 1407
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 1408
    .line 1409
    if-nez p1, :cond_33

    .line 1410
    .line 1411
    new-instance p1, Ljava/util/ArrayList;

    .line 1412
    .line 1413
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1414
    .line 1415
    .line 1416
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 1417
    .line 1418
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1419
    .line 1420
    if-nez p1, :cond_34

    .line 1421
    .line 1422
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Extra;->new_()Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1423
    .line 1424
    .line 1425
    move-result-object p1

    .line 1426
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 1427
    .line 1428
    :cond_34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 1429
    .line 1430
    if-nez p1, :cond_35

    .line 1431
    .line 1432
    new-instance p1, Ljava/util/ArrayList;

    .line 1433
    .line 1434
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1435
    .line 1436
    .line 1437
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 1438
    .line 1439
    :cond_35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 1440
    .line 1441
    if-nez p1, :cond_36

    .line 1442
    .line 1443
    new-instance p1, Ljava/util/ArrayList;

    .line 1444
    .line 1445
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1446
    .line 1447
    .line 1448
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 1449
    .line 1450
    :cond_36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 1451
    .line 1452
    if-nez p1, :cond_37

    .line 1453
    .line 1454
    new-instance p1, Ljava/util/ArrayList;

    .line 1455
    .line 1456
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1457
    .line 1458
    .line 1459
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 1460
    .line 1461
    :cond_37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 1462
    .line 1463
    if-nez p1, :cond_38

    .line 1464
    .line 1465
    new-instance p1, Ljava/util/ArrayList;

    .line 1466
    .line 1467
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1468
    .line 1469
    .line 1470
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 1471
    .line 1472
    :cond_38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 1473
    .line 1474
    if-nez p1, :cond_39

    .line 1475
    .line 1476
    new-instance p1, Ljava/util/ArrayList;

    .line 1477
    .line 1478
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1479
    .line 1480
    .line 1481
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 1482
    .line 1483
    :cond_39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 1484
    .line 1485
    if-nez p1, :cond_3a

    .line 1486
    .line 1487
    new-instance p1, Ljava/util/ArrayList;

    .line 1488
    .line 1489
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1490
    .line 1491
    .line 1492
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 1493
    .line 1494
    :cond_3a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 1495
    .line 1496
    if-nez p1, :cond_3b

    .line 1497
    .line 1498
    new-instance p1, Ljava/util/ArrayList;

    .line 1499
    .line 1500
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1501
    .line 1502
    .line 1503
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 1504
    .line 1505
    :cond_3b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 1506
    .line 1507
    if-nez p1, :cond_3c

    .line 1508
    .line 1509
    new-instance p1, Ljava/util/ArrayList;

    .line 1510
    .line 1511
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1512
    .line 1513
    .line 1514
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 1515
    .line 1516
    :cond_3c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 1517
    .line 1518
    if-nez p1, :cond_3d

    .line 1519
    .line 1520
    new-instance p1, Ljava/util/ArrayList;

    .line 1521
    .line 1522
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1523
    .line 1524
    .line 1525
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 1526
    .line 1527
    :cond_3d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 1528
    .line 1529
    if-nez p1, :cond_3e

    .line 1530
    .line 1531
    new-instance p1, Ljava/util/ArrayList;

    .line 1532
    .line 1533
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1534
    .line 1535
    .line 1536
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 1537
    .line 1538
    :cond_3e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 1539
    .line 1540
    if-nez p1, :cond_3f

    .line 1541
    .line 1542
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/DetectInfo;->new_()Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 1543
    .line 1544
    .line 1545
    move-result-object p1

    .line 1546
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 1547
    .line 1548
    :cond_3f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 1549
    .line 1550
    if-nez p1, :cond_40

    .line 1551
    .line 1552
    new-instance p1, Ljava/util/ArrayList;

    .line 1553
    .line 1554
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1555
    .line 1556
    .line 1557
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 1558
    .line 1559
    :cond_40
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 1560
    .line 1561
    if-nez p1, :cond_41

    .line 1562
    .line 1563
    new-instance p1, Ljava/util/ArrayList;

    .line 1564
    .line 1565
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1566
    .line 1567
    .line 1568
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 1569
    .line 1570
    :cond_41
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 1571
    .line 1572
    if-nez p1, :cond_42

    .line 1573
    .line 1574
    new-instance p1, Ljava/util/ArrayList;

    .line 1575
    .line 1576
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1577
    .line 1578
    .line 1579
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 1580
    .line 1581
    :cond_42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 1582
    .line 1583
    if-nez p1, :cond_43

    .line 1584
    .line 1585
    new-instance p1, Ljava/util/ArrayList;

    .line 1586
    .line 1587
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1588
    .line 1589
    .line 1590
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 1591
    .line 1592
    :cond_43
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 1593
    .line 1594
    if-nez p1, :cond_44

    .line 1595
    .line 1596
    new-instance p1, Ljava/util/ArrayList;

    .line 1597
    .line 1598
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1599
    .line 1600
    .line 1601
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 1602
    .line 1603
    :cond_44
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 1604
    .line 1605
    if-nez p1, :cond_45

    .line 1606
    .line 1607
    new-instance p1, Ljava/util/ArrayList;

    .line 1608
    .line 1609
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1610
    .line 1611
    .line 1612
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 1613
    .line 1614
    :cond_45
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 1615
    .line 1616
    if-nez p1, :cond_46

    .line 1617
    .line 1618
    new-instance p1, Ljava/util/ArrayList;

    .line 1619
    .line 1620
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1621
    .line 1622
    .line 1623
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 1624
    .line 1625
    :cond_46
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 1626
    .line 1627
    if-nez p1, :cond_47

    .line 1628
    .line 1629
    new-instance p1, Ljava/util/ArrayList;

    .line 1630
    .line 1631
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1632
    .line 1633
    .line 1634
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 1635
    .line 1636
    :cond_47
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 1637
    .line 1638
    if-nez p1, :cond_48

    .line 1639
    .line 1640
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->new_()Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 1641
    .line 1642
    .line 1643
    move-result-object p1

    .line 1644
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 1645
    .line 1646
    :cond_48
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 1647
    .line 1648
    if-nez p1, :cond_49

    .line 1649
    .line 1650
    new-instance p1, Ljava/util/ArrayList;

    .line 1651
    .line 1652
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1653
    .line 1654
    .line 1655
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 1656
    .line 1657
    :cond_49
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1658
    .line 1659
    if-nez p1, :cond_4a

    .line 1660
    .line 1661
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1662
    .line 1663
    .line 1664
    move-result-object p1

    .line 1665
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 1666
    .line 1667
    :cond_4a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 1668
    .line 1669
    if-nez p1, :cond_4b

    .line 1670
    .line 1671
    new-instance p1, Ljava/util/ArrayList;

    .line 1672
    .line 1673
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1674
    .line 1675
    .line 1676
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 1677
    .line 1678
    :cond_4b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 1679
    .line 1680
    if-nez p1, :cond_4c

    .line 1681
    .line 1682
    new-instance p1, Ljava/util/ArrayList;

    .line 1683
    .line 1684
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1685
    .line 1686
    .line 1687
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 1688
    .line 1689
    :cond_4c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 1690
    .line 1691
    if-nez p1, :cond_4d

    .line 1692
    .line 1693
    new-instance p1, Ljava/util/ArrayList;

    .line 1694
    .line 1695
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1696
    .line 1697
    .line 1698
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 1699
    .line 1700
    :cond_4d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 1701
    .line 1702
    if-nez p1, :cond_4e

    .line 1703
    .line 1704
    new-instance p1, Ljava/util/ArrayList;

    .line 1705
    .line 1706
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1707
    .line 1708
    .line 1709
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 1710
    .line 1711
    :cond_4e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 1712
    .line 1713
    if-nez p1, :cond_4f

    .line 1714
    .line 1715
    new-instance p1, Ljava/util/ArrayList;

    .line 1716
    .line 1717
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1718
    .line 1719
    .line 1720
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 1721
    .line 1722
    :cond_4f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 1723
    .line 1724
    if-nez p1, :cond_50

    .line 1725
    .line 1726
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiLocation;->new_()Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 1727
    .line 1728
    .line 1729
    move-result-object p1

    .line 1730
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 1731
    .line 1732
    :cond_50
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 1733
    .line 1734
    if-nez p1, :cond_51

    .line 1735
    .line 1736
    new-instance p1, Ljava/util/ArrayList;

    .line 1737
    .line 1738
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1739
    .line 1740
    .line 1741
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 1742
    .line 1743
    :cond_51
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 1744
    .line 1745
    if-nez p1, :cond_52

    .line 1746
    .line 1747
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->new_()Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 1748
    .line 1749
    .line 1750
    move-result-object p1

    .line 1751
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 1752
    .line 1753
    :cond_52
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 1754
    .line 1755
    if-nez p1, :cond_53

    .line 1756
    .line 1757
    new-instance p1, Ljava/util/ArrayList;

    .line 1758
    .line 1759
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 1760
    .line 1761
    .line 1762
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 1763
    .line 1764
    :cond_53
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 1765
    .line 1766
    if-nez p1, :cond_54

    .line 1767
    .line 1768
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->new_()Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 1769
    .line 1770
    .line 1771
    move-result-object p1

    .line 1772
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 1773
    .line 1774
    :cond_54
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_36
        0xa -> :sswitch_35
        0x12 -> :sswitch_34
        0x1a -> :sswitch_33
        0x22 -> :sswitch_32
        0x2a -> :sswitch_31
        0x32 -> :sswitch_30
        0x3a -> :sswitch_2f
        0x42 -> :sswitch_2e
        0x4a -> :sswitch_2d
        0x52 -> :sswitch_2c
        0x5a -> :sswitch_2b
        0x62 -> :sswitch_2a
        0x6a -> :sswitch_29
        0x72 -> :sswitch_28
        0x7a -> :sswitch_27
        0x82 -> :sswitch_26
        0x8a -> :sswitch_25
        0x92 -> :sswitch_24
        0x9a -> :sswitch_23
        0xa2 -> :sswitch_22
        0xaa -> :sswitch_21
        0xb2 -> :sswitch_20
        0xba -> :sswitch_1f
        0xc2 -> :sswitch_1e
        0xca -> :sswitch_1d
        0xd2 -> :sswitch_1c
        0xda -> :sswitch_1b
        0xe2 -> :sswitch_1a
        0xea -> :sswitch_19
        0xf2 -> :sswitch_18
        0xfa -> :sswitch_17
        0x102 -> :sswitch_16
        0x10a -> :sswitch_15
        0x112 -> :sswitch_14
        0x11a -> :sswitch_13
        0x122 -> :sswitch_12
        0x12a -> :sswitch_11
        0x132 -> :sswitch_10
        0x13a -> :sswitch_f
        0x142 -> :sswitch_e
        0x14a -> :sswitch_d
        0x152 -> :sswitch_c
        0x15a -> :sswitch_b
        0x162 -> :sswitch_a
        0x16a -> :sswitch_9
        0x172 -> :sswitch_8
        0x17a -> :sswitch_7
        0x182 -> :sswitch_6
        0x18a -> :sswitch_5
        0x192 -> :sswitch_4
        0x19a -> :sswitch_3
        0x1a2 -> :sswitch_2
        0x1aa -> :sswitch_1
        0x1b2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1775
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/FeedData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/FeedData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraFilters:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraFilter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 6
    .line 7
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 8
    .line 9
    .line 10
    move-result-object v0

    .line 11
    const/4 v1, 0x1

    .line 12
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraStickers:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraSticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 20
    .line 21
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    .line 24
    move-result-object v0

    .line 25
    const/4 v1, 0x2

    .line 26
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musicCategories:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MusicCategory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v0

    .line 39
    const/4 v1, 0x3

    .line 40
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->musics:Ljava/util/List;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    sget-object v0, Lcom/p1/mobile/putong/data/Music;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 48
    .line 49
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    .line 52
    move-result-object v0

    .line 53
    const/4 v1, 0x4

    .line 54
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->cameraCategories:Ljava/util/List;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CameraCategory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/4 v1, 0x5

    .line 68
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 69
    .line 70
    .line 71
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->moments:Ljava/util/List;

    .line 72
    .line 73
    if-eqz p0, :cond_5

    .line 74
    .line 75
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    .line 80
    move-result-object v0

    .line 81
    const/4 v1, 0x6

    .line 82
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 83
    .line 84
    .line 85
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->activities:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_6

    .line 88
    .line 89
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    .line 94
    move-result-object v0

    .line 95
    const/4 v1, 0x7

    .line 96
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->feeds:Ljava/util/List;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/feed/data/RawFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    const/16 v1, 0x8

    .line 110
    .line 111
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 112
    .line 113
    .line 114
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentTopics:Ljava/util/List;

    .line 115
    .line 116
    if-eqz p0, :cond_8

    .line 117
    .line 118
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v0

    .line 124
    const/16 v1, 0x9

    .line 125
    .line 126
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 127
    .line 128
    .line 129
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->rooms:Ljava/util/List;

    .line 130
    .line 131
    if-eqz p0, :cond_9

    .line 132
    .line 133
    sget-object v0, Lcom/p1/mobile/putong/data/Room;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 136
    .line 137
    .line 138
    move-result-object v0

    .line 139
    const/16 v1, 0xa

    .line 140
    .line 141
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 142
    .line 143
    .line 144
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLives:Ljava/util/List;

    .line 145
    .line 146
    if-eqz p0, :cond_a

    .line 147
    .line 148
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLive;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    .line 153
    move-result-object v0

    .line 154
    const/16 v1, 0xb

    .line 155
    .line 156
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 157
    .line 158
    .line 159
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceRooms:Ljava/util/List;

    .line 160
    .line 161
    if-eqz p0, :cond_b

    .line 162
    .line 163
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceRoomInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    const/16 v1, 0xc

    .line 170
    .line 171
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 172
    .line 173
    .line 174
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->lives:Ljava/util/List;

    .line 175
    .line 176
    if-eqz p0, :cond_c

    .line 177
    .line 178
    sget-object v0, Lcom/p1/mobile/putong/data/Live;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 181
    .line 182
    .line 183
    move-result-object v0

    .line 184
    const/16 v1, 0xd

    .line 185
    .line 186
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->followships:Ljava/util/List;

    .line 190
    .line 191
    if-eqz p0, :cond_d

    .line 192
    .line 193
    sget-object v0, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    const/16 v1, 0xe

    .line 200
    .line 201
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 202
    .line 203
    .line 204
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->extra:Lcom/p1/mobile/putong/feed/data/Extra;

    .line 205
    .line 206
    if-eqz p0, :cond_e

    .line 207
    .line 208
    const/16 v0, 0xf

    .line 209
    .line 210
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Extra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 213
    .line 214
    .line 215
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->greetingPermissions:Ljava/util/List;

    .line 216
    .line 217
    if-eqz p0, :cond_f

    .line 218
    .line 219
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GreetingPermission;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 220
    .line 221
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    .line 224
    move-result-object v0

    .line 225
    const/16 v1, 0x10

    .line 226
    .line 227
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 228
    .line 229
    .line 230
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveLabels:Ljava/util/List;

    .line 231
    .line 232
    if-eqz p0, :cond_10

    .line 233
    .line 234
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedUserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 235
    .line 236
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    const/16 v1, 0x11

    .line 241
    .line 242
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 243
    .line 244
    .line 245
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->messages:Ljava/util/List;

    .line 246
    .line 247
    if-eqz p0, :cond_11

    .line 248
    .line 249
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 250
    .line 251
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 252
    .line 253
    .line 254
    move-result-object v0

    .line 255
    const/16 v1, 0x12

    .line 256
    .line 257
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 258
    .line 259
    .line 260
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->comments:Ljava/util/List;

    .line 261
    .line 262
    if-eqz p0, :cond_12

    .line 263
    .line 264
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 265
    .line 266
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    .line 268
    .line 269
    move-result-object v0

    .line 270
    const/16 v1, 0x13

    .line 271
    .line 272
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 273
    .line 274
    .line 275
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveGames:Ljava/util/List;

    .line 276
    .line 277
    if-eqz p0, :cond_13

    .line 278
    .line 279
    sget-object v0, Lcom/p1/mobile/putong/data/VoiceLiveGame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    .line 284
    move-result-object v0

    .line 285
    const/16 v1, 0x14

    .line 286
    .line 287
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 288
    .line 289
    .line 290
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->masks:Ljava/util/List;

    .line 291
    .line 292
    if-eqz p0, :cond_14

    .line 293
    .line 294
    sget-object v0, Lcom/p1/mobile/putong/data/LiveUserMask;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 295
    .line 296
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    const/16 v1, 0x15

    .line 301
    .line 302
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 303
    .line 304
    .line 305
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentSettings:Ljava/util/List;

    .line 306
    .line 307
    if-eqz p0, :cond_15

    .line 308
    .line 309
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PersonAlbumBgInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    const/16 v1, 0x16

    .line 316
    .line 317
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 318
    .line 319
    .line 320
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicCategories:Ljava/util/List;

    .line 321
    .line 322
    if-eqz p0, :cond_16

    .line 323
    .line 324
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicCategorie;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    .line 329
    move-result-object v0

    .line 330
    const/16 v1, 0x17

    .line 331
    .line 332
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 333
    .line 334
    .line 335
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveMomentFeeds:Ljava/util/List;

    .line 336
    .line 337
    if-eqz p0, :cond_17

    .line 338
    .line 339
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveMomentFeed;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 340
    .line 341
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 342
    .line 343
    .line 344
    move-result-object v0

    .line 345
    const/16 v1, 0x18

    .line 346
    .line 347
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 348
    .line 349
    .line 350
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->topicOperations:Ljava/util/List;

    .line 351
    .line 352
    if-eqz p0, :cond_18

    .line 353
    .line 354
    sget-object v0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 355
    .line 356
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 357
    .line 358
    .line 359
    move-result-object v0

    .line 360
    const/16 v1, 0x19

    .line 361
    .line 362
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 363
    .line 364
    .line 365
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->frames:Ljava/util/List;

    .line 366
    .line 367
    if-eqz p0, :cond_19

    .line 368
    .line 369
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Frame;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    const/16 v1, 0x1a

    .line 376
    .line 377
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 378
    .line 379
    .line 380
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->myMeetFeeds:Ljava/util/List;

    .line 381
    .line 382
    if-eqz p0, :cond_1a

    .line 383
    .line 384
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Moment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 385
    .line 386
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 387
    .line 388
    .line 389
    move-result-object v0

    .line 390
    const/16 v1, 0x1b

    .line 391
    .line 392
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 393
    .line 394
    .line 395
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->detect:Lcom/p1/mobile/putong/feed/data/DetectInfo;

    .line 396
    .line 397
    if-eqz p0, :cond_1b

    .line 398
    .line 399
    const/16 v0, 0x1c

    .line 400
    .line 401
    sget-object v1, Lcom/p1/mobile/putong/feed/data/DetectInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 402
    .line 403
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 404
    .line 405
    .line 406
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->board:Lcom/p1/mobile/putong/feed/data/RankingBoards;

    .line 407
    .line 408
    if-eqz p0, :cond_1c

    .line 409
    .line 410
    const/16 v0, 0x1d

    .line 411
    .line 412
    sget-object v1, Lcom/p1/mobile/putong/feed/data/RankingBoards;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 413
    .line 414
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 415
    .line 416
    .line 417
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->paginationWithTopic:Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;

    .line 418
    .line 419
    if-eqz p0, :cond_1d

    .line 420
    .line 421
    const/16 v0, 0x1e

    .line 422
    .line 423
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PaginationWithTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 424
    .line 425
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 426
    .line 427
    .line 428
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentExtras:Ljava/util/List;

    .line 429
    .line 430
    if-eqz p0, :cond_1e

    .line 431
    .line 432
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 433
    .line 434
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 435
    .line 436
    .line 437
    move-result-object v0

    .line 438
    const/16 v1, 0x1f

    .line 439
    .line 440
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 441
    .line 442
    .line 443
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->states:Ljava/util/List;

    .line 444
    .line 445
    if-eqz p0, :cond_1f

    .line 446
    .line 447
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 448
    .line 449
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 450
    .line 451
    .line 452
    move-result-object v0

    .line 453
    const/16 v1, 0x20

    .line 454
    .line 455
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 456
    .line 457
    .line 458
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveRecommendCards:Ljava/util/List;

    .line 459
    .line 460
    if-eqz p0, :cond_20

    .line 461
    .line 462
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveRecommendCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 463
    .line 464
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 465
    .line 466
    .line 467
    move-result-object v0

    .line 468
    const/16 v1, 0x21

    .line 469
    .line 470
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 471
    .line 472
    .line 473
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveSchemas:Ljava/util/List;

    .line 474
    .line 475
    if-eqz p0, :cond_21

    .line 476
    .line 477
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveMultiCallLiveSchema;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 478
    .line 479
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 480
    .line 481
    .line 482
    move-result-object v0

    .line 483
    const/16 v1, 0x22

    .line 484
    .line 485
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 486
    .line 487
    .line 488
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->groups:Ljava/util/List;

    .line 489
    .line 490
    if-eqz p0, :cond_22

    .line 491
    .line 492
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Group;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 493
    .line 494
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 495
    .line 496
    .line 497
    move-result-object v0

    .line 498
    const/16 v1, 0x23

    .line 499
    .line 500
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 501
    .line 502
    .line 503
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelGuides:Ljava/util/List;

    .line 504
    .line 505
    if-eqz p0, :cond_23

    .line 506
    .line 507
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentLevelGuides;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 508
    .line 509
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 510
    .line 511
    .line 512
    move-result-object v0

    .line 513
    const/16 v1, 0x24

    .line 514
    .line 515
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 516
    .line 517
    .line 518
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentLevelCounters:Ljava/util/List;

    .line 519
    .line 520
    if-eqz p0, :cond_24

    .line 521
    .line 522
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentLevelCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 523
    .line 524
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 525
    .line 526
    .line 527
    move-result-object v0

    .line 528
    const/16 v1, 0x25

    .line 529
    .line 530
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 531
    .line 532
    .line 533
    :cond_24
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literaturesComments:Ljava/util/List;

    .line 534
    .line 535
    if-eqz p0, :cond_25

    .line 536
    .line 537
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedLiteraturesComment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 538
    .line 539
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 540
    .line 541
    .line 542
    move-result-object v0

    .line 543
    const/16 v1, 0x26

    .line 544
    .line 545
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 546
    .line 547
    .line 548
    :cond_25
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->literatures:Ljava/util/List;

    .line 549
    .line 550
    if-eqz p0, :cond_26

    .line 551
    .line 552
    sget-object v0, Lcom/p1/mobile/putong/feed/data/FeedLiterature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 553
    .line 554
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 555
    .line 556
    .line 557
    move-result-object v0

    .line 558
    const/16 v1, 0x27

    .line 559
    .line 560
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 561
    .line 562
    .line 563
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentVoiceLiveInfos:Ljava/util/List;

    .line 564
    .line 565
    if-eqz p0, :cond_27

    .line 566
    .line 567
    sget-object v0, Lcom/p1/mobile/putong/feed/data/MomentVoiceLiveInfos;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 568
    .line 569
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 570
    .line 571
    .line 572
    move-result-object v0

    .line 573
    const/16 v1, 0x28

    .line 574
    .line 575
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 576
    .line 577
    .line 578
    :cond_27
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->meets:Ljava/util/List;

    .line 579
    .line 580
    if-eqz p0, :cond_28

    .line 581
    .line 582
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Meet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 583
    .line 584
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 585
    .line 586
    .line 587
    move-result-object v0

    .line 588
    const/16 v1, 0x29

    .line 589
    .line 590
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 591
    .line 592
    .line 593
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->sourceCatCount:Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;

    .line 594
    .line 595
    if-eqz p0, :cond_29

    .line 596
    .line 597
    const/16 v0, 0x2a

    .line 598
    .line 599
    sget-object v1, Lcom/p1/mobile/putong/feed/data/AttitudeSourceCatCount;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 600
    .line 601
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 602
    .line 603
    .line 604
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->voiceLiveStates:Ljava/util/List;

    .line 605
    .line 606
    if-eqz p0, :cond_2a

    .line 607
    .line 608
    sget-object v0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 609
    .line 610
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 611
    .line 612
    .line 613
    move-result-object v0

    .line 614
    const/16 v1, 0x2b

    .line 615
    .line 616
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 617
    .line 618
    .line 619
    :cond_2a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 620
    .line 621
    if-eqz p0, :cond_2b

    .line 622
    .line 623
    const/16 v0, 0x2c

    .line 624
    .line 625
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 626
    .line 627
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 628
    .line 629
    .line 630
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->notifyUsers:Ljava/util/List;

    .line 631
    .line 632
    if-eqz p0, :cond_2c

    .line 633
    .line 634
    sget-object v0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 635
    .line 636
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 637
    .line 638
    .line 639
    move-result-object v0

    .line 640
    const/16 v1, 0x2d

    .line 641
    .line 642
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 643
    .line 644
    .line 645
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->fakeUserStates:Ljava/util/List;

    .line 646
    .line 647
    if-eqz p0, :cond_2d

    .line 648
    .line 649
    sget-object v0, Lcom/p1/mobile/putong/data/BubbleInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 650
    .line 651
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 652
    .line 653
    .line 654
    move-result-object v0

    .line 655
    const/16 v1, 0x2e

    .line 656
    .line 657
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 658
    .line 659
    .line 660
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveCircleMomentExtInfos:Ljava/util/List;

    .line 661
    .line 662
    if-eqz p0, :cond_2e

    .line 663
    .line 664
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveCircleExtInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 665
    .line 666
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 667
    .line 668
    .line 669
    move-result-object v0

    .line 670
    const/16 v1, 0x2f

    .line 671
    .line 672
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 673
    .line 674
    .line 675
    :cond_2e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->liveGroupCircleMomentBanners:Ljava/util/List;

    .line 676
    .line 677
    if-eqz p0, :cond_2f

    .line 678
    .line 679
    sget-object v0, Lcom/p1/mobile/putong/feed/data/LiveCircleBanner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 680
    .line 681
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 682
    .line 683
    .line 684
    move-result-object v0

    .line 685
    const/16 v1, 0x30

    .line 686
    .line 687
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 688
    .line 689
    .line 690
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->popWindows:Ljava/util/List;

    .line 691
    .line 692
    if-eqz p0, :cond_30

    .line 693
    .line 694
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PoiGuidePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 695
    .line 696
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 697
    .line 698
    .line 699
    move-result-object v0

    .line 700
    const/16 v1, 0x31

    .line 701
    .line 702
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 703
    .line 704
    .line 705
    :cond_30
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->location:Lcom/p1/mobile/putong/feed/data/PoiLocation;

    .line 706
    .line 707
    if-eqz p0, :cond_31

    .line 708
    .line 709
    const/16 v0, 0x32

    .line 710
    .line 711
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 712
    .line 713
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 714
    .line 715
    .line 716
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->stickers:Ljava/util/List;

    .line 717
    .line 718
    if-eqz p0, :cond_32

    .line 719
    .line 720
    sget-object v0, Lcom/p1/mobile/putong/data/StickerInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 721
    .line 722
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 723
    .line 724
    .line 725
    move-result-object v0

    .line 726
    const/16 v1, 0x33

    .line 727
    .line 728
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 729
    .line 730
    .line 731
    :cond_32
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->nearbyWindow:Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;

    .line 732
    .line 733
    if-eqz p0, :cond_33

    .line 734
    .line 735
    const/16 v0, 0x34

    .line 736
    .line 737
    sget-object v1, Lcom/p1/mobile/putong/feed/data/FeedPoiNearbyWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 738
    .line 739
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 740
    .line 741
    .line 742
    :cond_33
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->momentPopWindows:Ljava/util/List;

    .line 743
    .line 744
    if-eqz p0, :cond_34

    .line 745
    .line 746
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PostBasePopWindow;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 747
    .line 748
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 749
    .line 750
    .line 751
    move-result-object v0

    .line 752
    const/16 v1, 0x35

    .line 753
    .line 754
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 755
    .line 756
    .line 757
    :cond_34
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/FeedData;->guideStatePostConfig:Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;

    .line 758
    .line 759
    if-eqz p0, :cond_35

    .line 760
    .line 761
    const/16 p1, 0x36

    .line 762
    .line 763
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GuideStatePostConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 764
    .line 765
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 766
    .line 767
    .line 768
    :cond_35
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 769
    check-cast p1, Lcom/p1/mobile/putong/feed/data/FeedData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/FeedData$1;->serialize(Lcom/p1/mobile/putong/feed/data/FeedData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
