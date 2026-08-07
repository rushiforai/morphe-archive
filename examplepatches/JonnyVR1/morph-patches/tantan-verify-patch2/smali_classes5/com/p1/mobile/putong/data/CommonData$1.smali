.class Lcom/p1/mobile/putong/data/CommonData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/CommonData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/CommonData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/CommonData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 35
    .line 36
    if-eqz v0, :cond_2

    .line 37
    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 51
    .line 52
    if-eqz v0, :cond_3

    .line 53
    .line 54
    const/4 v1, 0x4

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/Connector;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    sget-object v1, Lcom/p1/mobile/putong/data/VerificationToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 67
    .line 68
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    .line 70
    .line 71
    move-result-object v1

    .line 72
    const/4 v2, 0x5

    .line 73
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 79
    .line 80
    if-eqz v0, :cond_5

    .line 81
    .line 82
    sget-object v1, Lcom/p1/mobile/putong/data/Link;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    .line 87
    move-result-object v1

    .line 88
    const/4 v2, 0x6

    .line 89
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 95
    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    const/4 v1, 0x7

    .line 99
    sget-object v2, Lcom/p1/mobile/putong/data/Detect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    add-int/2addr p0, v0

    .line 106
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 107
    .line 108
    if-eqz v0, :cond_7

    .line 109
    .line 110
    sget-object v1, Lcom/p1/mobile/putong/data/RecommendMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v1

    .line 116
    const/16 v2, 0x8

    .line 117
    .line 118
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 124
    .line 125
    if-eqz v0, :cond_8

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/data/ReflectResponse;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    .line 132
    move-result-object v1

    .line 133
    const/16 v2, 0x9

    .line 134
    .line 135
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/2addr p0, v0

    .line 140
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz v0, :cond_9

    .line 143
    .line 144
    const/16 v1, 0xa

    .line 145
    .line 146
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 152
    .line 153
    if-eqz v0, :cond_a

    .line 154
    .line 155
    const/16 v1, 0xb

    .line 156
    .line 157
    sget-object v2, Lcom/p1/mobile/putong/data/SliderData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 165
    .line 166
    if-eqz v0, :cond_b

    .line 167
    .line 168
    const/16 v1, 0xc

    .line 169
    .line 170
    sget-object v2, Lcom/p1/mobile/putong/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 178
    .line 179
    if-eqz v0, :cond_c

    .line 180
    .line 181
    sget-object v1, Lcom/p1/mobile/putong/data/VisitorStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 182
    .line 183
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    const/16 v2, 0xd

    .line 188
    .line 189
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 190
    .line 191
    .line 192
    move-result v0

    .line 193
    add-int/2addr p0, v0

    .line 194
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 195
    .line 196
    if-eqz v0, :cond_d

    .line 197
    .line 198
    const/16 v1, 0xe

    .line 199
    .line 200
    sget-object v2, Lcom/p1/mobile/putong/data/VisitorCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 208
    .line 209
    if-eqz v0, :cond_e

    .line 210
    .line 211
    sget-object v1, Lcom/p1/mobile/putong/data/AvatarFrameConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 212
    .line 213
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    .line 216
    move-result-object v1

    .line 217
    const/16 v2, 0xf

    .line 218
    .line 219
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    add-int/2addr p0, v0

    .line 224
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 225
    .line 226
    if-eqz v0, :cond_f

    .line 227
    .line 228
    const/16 v1, 0x10

    .line 229
    .line 230
    sget-object v2, Lcom/p1/mobile/putong/data/LiveRightCDN;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    add-int/2addr p0, v0

    .line 237
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 238
    .line 239
    if-eqz v0, :cond_10

    .line 240
    .line 241
    const/16 v1, 0x11

    .line 242
    .line 243
    sget-object v2, Lcom/p1/mobile/putong/data/AdConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 244
    .line 245
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    add-int/2addr p0, v0

    .line 250
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 251
    .line 252
    if-eqz v0, :cond_11

    .line 253
    .line 254
    const/16 v1, 0x12

    .line 255
    .line 256
    sget-object v2, Lcom/p1/mobile/putong/data/AdRewardResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 259
    .line 260
    .line 261
    move-result v0

    .line 262
    add-int/2addr p0, v0

    .line 263
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 264
    .line 265
    if-eqz v0, :cond_12

    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/data/UserPictureTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 270
    .line 271
    .line 272
    move-result-object v1

    .line 273
    const/16 v2, 0x13

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
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 281
    .line 282
    if-eqz v0, :cond_13

    .line 283
    .line 284
    const/16 v1, 0x14

    .line 285
    .line 286
    sget-object v2, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 287
    .line 288
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    add-int/2addr p0, v0

    .line 293
    :cond_13
    const/16 v0, 0x15

    .line 294
    .line 295
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 296
    .line 297
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 298
    .line 299
    .line 300
    move-result v0

    .line 301
    add-int/2addr p0, v0

    .line 302
    const/16 v0, 0x16

    .line 303
    .line 304
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 305
    .line 306
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    add-int/2addr p0, v0

    .line 311
    const/16 v0, 0x17

    .line 312
    .line 313
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 314
    .line 315
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    add-int/2addr p0, v0

    .line 320
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 321
    .line 322
    if-eqz v0, :cond_14

    .line 323
    .line 324
    const/16 v1, 0x18

    .line 325
    .line 326
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    add-int/2addr p0, v0

    .line 331
    :cond_14
    const/16 v0, 0x19

    .line 332
    .line 333
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 334
    .line 335
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    add-int/2addr p0, v0

    .line 340
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 341
    .line 342
    if-eqz v0, :cond_15

    .line 343
    .line 344
    const/16 v1, 0x1a

    .line 345
    .line 346
    sget-object v2, Lcom/p1/mobile/putong/data/Mobile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 347
    .line 348
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 349
    .line 350
    .line 351
    move-result v0

    .line 352
    add-int/2addr p0, v0

    .line 353
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 354
    .line 355
    if-eqz v0, :cond_16

    .line 356
    .line 357
    const/16 v1, 0x1b

    .line 358
    .line 359
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 360
    .line 361
    .line 362
    move-result v0

    .line 363
    add-int/2addr p0, v0

    .line 364
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 365
    .line 366
    if-eqz v0, :cond_17

    .line 367
    .line 368
    const/16 v1, 0x1c

    .line 369
    .line 370
    sget-object v2, Lcom/p1/mobile/putong/data/ThirdParty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 378
    .line 379
    if-eqz v0, :cond_18

    .line 380
    .line 381
    const/16 v1, 0x1d

    .line 382
    .line 383
    sget-object v2, Lcom/p1/mobile/putong/data/Token;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 391
    .line 392
    if-eqz v0, :cond_19

    .line 393
    .line 394
    const/16 v1, 0x1e

    .line 395
    .line 396
    sget-object v2, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_19
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 404
    .line 405
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 406
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/CommonData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/CommonData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/CommonData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/CommonData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/CommonData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    new-instance p1, Ljava/util/ArrayList;

    .line 20
    .line 21
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 22
    .line 23
    .line 24
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 25
    .line 26
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    new-instance p1, Ljava/util/ArrayList;

    .line 31
    .line 32
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 33
    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 36
    .line 37
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 38
    .line 39
    if-nez p1, :cond_2

    .line 40
    .line 41
    new-instance p1, Ljava/util/ArrayList;

    .line 42
    .line 43
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 44
    .line 45
    .line 46
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 47
    .line 48
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 49
    .line 50
    if-nez p1, :cond_3

    .line 51
    .line 52
    invoke-static {}, Lcom/p1/mobile/putong/data/Detect;->new_()Lcom/p1/mobile/putong/data/Detect;

    .line 53
    .line 54
    .line 55
    move-result-object p1

    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 57
    .line 58
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 59
    .line 60
    if-nez p1, :cond_4

    .line 61
    .line 62
    new-instance p1, Ljava/util/ArrayList;

    .line 63
    .line 64
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 65
    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 68
    .line 69
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 70
    .line 71
    if-nez p1, :cond_5

    .line 72
    .line 73
    new-instance p1, Ljava/util/ArrayList;

    .line 74
    .line 75
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 76
    .line 77
    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 79
    .line 80
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_6

    .line 83
    .line 84
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 85
    .line 86
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 87
    .line 88
    if-nez p1, :cond_7

    .line 89
    .line 90
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderData;->new_()Lcom/p1/mobile/putong/data/SliderData;

    .line 91
    .line 92
    .line 93
    move-result-object p1

    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 95
    .line 96
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 97
    .line 98
    if-nez p1, :cond_8

    .line 99
    .line 100
    invoke-static {}, Lcom/p1/mobile/putong/data/VisitorInfo;->new_()Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 101
    .line 102
    .line 103
    move-result-object p1

    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 105
    .line 106
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 107
    .line 108
    if-nez p1, :cond_9

    .line 109
    .line 110
    new-instance p1, Ljava/util/ArrayList;

    .line 111
    .line 112
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 113
    .line 114
    .line 115
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 116
    .line 117
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 118
    .line 119
    if-nez p1, :cond_a

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/data/VisitorCounter;->new_()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 126
    .line 127
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 128
    .line 129
    if-nez p1, :cond_b

    .line 130
    .line 131
    new-instance p1, Ljava/util/ArrayList;

    .line 132
    .line 133
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 134
    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 137
    .line 138
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 139
    .line 140
    if-nez p1, :cond_c

    .line 141
    .line 142
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRightCDN;->new_()Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 143
    .line 144
    .line 145
    move-result-object p1

    .line 146
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 147
    .line 148
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 149
    .line 150
    if-nez p1, :cond_d

    .line 151
    .line 152
    invoke-static {}, Lcom/p1/mobile/putong/data/AdConfiguration;->new_()Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 153
    .line 154
    .line 155
    move-result-object p1

    .line 156
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 157
    .line 158
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 159
    .line 160
    if-nez p1, :cond_e

    .line 161
    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/data/AdRewardResult;->new_()Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 163
    .line 164
    .line 165
    move-result-object p1

    .line 166
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 167
    .line 168
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 169
    .line 170
    if-nez p1, :cond_f

    .line 171
    .line 172
    new-instance p1, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .line 176
    .line 177
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 178
    .line 179
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_10

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 184
    .line 185
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 186
    .line 187
    if-nez p1, :cond_11

    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/data/Mobile;->new_()Lcom/p1/mobile/putong/data/Mobile;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 194
    .line 195
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 196
    .line 197
    if-nez p1, :cond_12

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 200
    .line 201
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 202
    .line 203
    if-nez p1, :cond_13

    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/data/ThirdParty;->new_()Lcom/p1/mobile/putong/data/ThirdParty;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 210
    .line 211
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 212
    .line 213
    if-nez p1, :cond_14

    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/data/Token;->new_()Lcom/p1/mobile/putong/data/Token;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 220
    .line 221
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 222
    .line 223
    if-nez p1, :cond_2a

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->new_()Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 230
    .line 231
    return-object p0

    .line 232
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v0

    .line 238
    check-cast v0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 239
    .line 240
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/Token;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    .line 246
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 247
    .line 248
    .line 249
    move-result-object v0

    .line 250
    check-cast v0, Lcom/p1/mobile/putong/data/Token;

    .line 251
    .line 252
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/ThirdParty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 259
    .line 260
    .line 261
    move-result-object v0

    .line 262
    check-cast v0, Lcom/p1/mobile/putong/data/ThirdParty;

    .line 263
    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/Mobile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 277
    .line 278
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v0

    .line 282
    check-cast v0, Lcom/p1/mobile/putong/data/Mobile;

    .line 283
    .line 284
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 285
    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 289
    .line 290
    .line 291
    move-result v0

    .line 292
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 293
    .line 294
    goto/16 :goto_0

    .line 295
    .line 296
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 297
    .line 298
    .line 299
    move-result-object v0

    .line 300
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 301
    .line 302
    goto/16 :goto_0

    .line 303
    .line 304
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 309
    .line 310
    goto/16 :goto_0

    .line 311
    .line 312
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 313
    .line 314
    .line 315
    move-result v0

    .line 316
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 317
    .line 318
    goto/16 :goto_0

    .line 319
    .line 320
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 325
    .line 326
    goto/16 :goto_0

    .line 327
    .line 328
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 329
    .line 330
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 331
    .line 332
    .line 333
    move-result-object v0

    .line 334
    check-cast v0, Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 335
    .line 336
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 337
    .line 338
    goto/16 :goto_0

    .line 339
    .line 340
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/data/UserPictureTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 341
    .line 342
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 343
    .line 344
    .line 345
    move-result-object v0

    .line 346
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 347
    .line 348
    .line 349
    move-result-object v0

    .line 350
    check-cast v0, Ljava/util/List;

    .line 351
    .line 352
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 353
    .line 354
    goto/16 :goto_0

    .line 355
    .line 356
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/data/AdRewardResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 357
    .line 358
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 359
    .line 360
    .line 361
    move-result-object v0

    .line 362
    check-cast v0, Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 363
    .line 364
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 365
    .line 366
    goto/16 :goto_0

    .line 367
    .line 368
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/AdConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 369
    .line 370
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 371
    .line 372
    .line 373
    move-result-object v0

    .line 374
    check-cast v0, Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 375
    .line 376
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 377
    .line 378
    goto/16 :goto_0

    .line 379
    .line 380
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/data/LiveRightCDN;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 381
    .line 382
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 383
    .line 384
    .line 385
    move-result-object v0

    .line 386
    check-cast v0, Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 387
    .line 388
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 389
    .line 390
    goto/16 :goto_0

    .line 391
    .line 392
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/AvatarFrameConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 393
    .line 394
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 395
    .line 396
    .line 397
    move-result-object v0

    .line 398
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 399
    .line 400
    .line 401
    move-result-object v0

    .line 402
    check-cast v0, Ljava/util/List;

    .line 403
    .line 404
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 405
    .line 406
    goto/16 :goto_0

    .line 407
    .line 408
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/data/VisitorCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 409
    .line 410
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 411
    .line 412
    .line 413
    move-result-object v0

    .line 414
    check-cast v0, Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 415
    .line 416
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 417
    .line 418
    goto/16 :goto_0

    .line 419
    .line 420
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/data/VisitorStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 421
    .line 422
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 423
    .line 424
    .line 425
    move-result-object v0

    .line 426
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    check-cast v0, Ljava/util/List;

    .line 431
    .line 432
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 437
    .line 438
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 439
    .line 440
    .line 441
    move-result-object v0

    .line 442
    check-cast v0, Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 443
    .line 444
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 445
    .line 446
    goto/16 :goto_0

    .line 447
    .line 448
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/data/SliderData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 449
    .line 450
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 451
    .line 452
    .line 453
    move-result-object v0

    .line 454
    check-cast v0, Lcom/p1/mobile/putong/data/SliderData;

    .line 455
    .line 456
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 457
    .line 458
    goto/16 :goto_0

    .line 459
    .line 460
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 461
    .line 462
    .line 463
    move-result-object v0

    .line 464
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 465
    .line 466
    goto/16 :goto_0

    .line 467
    .line 468
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/data/ReflectResponse;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 469
    .line 470
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 471
    .line 472
    .line 473
    move-result-object v0

    .line 474
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 475
    .line 476
    .line 477
    move-result-object v0

    .line 478
    check-cast v0, Ljava/util/List;

    .line 479
    .line 480
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 481
    .line 482
    goto/16 :goto_0

    .line 483
    .line 484
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/data/RecommendMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 485
    .line 486
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 487
    .line 488
    .line 489
    move-result-object v0

    .line 490
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    check-cast v0, Ljava/util/List;

    .line 495
    .line 496
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 497
    .line 498
    goto/16 :goto_0

    .line 499
    .line 500
    :sswitch_17
    sget-object v0, Lcom/p1/mobile/putong/data/Detect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 501
    .line 502
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 503
    .line 504
    .line 505
    move-result-object v0

    .line 506
    check-cast v0, Lcom/p1/mobile/putong/data/Detect;

    .line 507
    .line 508
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 509
    .line 510
    goto/16 :goto_0

    .line 511
    .line 512
    :sswitch_18
    sget-object v0, Lcom/p1/mobile/putong/data/Link;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 513
    .line 514
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 519
    .line 520
    .line 521
    move-result-object v0

    .line 522
    check-cast v0, Ljava/util/List;

    .line 523
    .line 524
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 525
    .line 526
    goto/16 :goto_0

    .line 527
    .line 528
    :sswitch_19
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 529
    .line 530
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 531
    .line 532
    .line 533
    move-result-object v0

    .line 534
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 535
    .line 536
    .line 537
    move-result-object v0

    .line 538
    check-cast v0, Ljava/util/List;

    .line 539
    .line 540
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 541
    .line 542
    goto/16 :goto_0

    .line 543
    .line 544
    :sswitch_1a
    sget-object v0, Lcom/p1/mobile/putong/data/Connector;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 545
    .line 546
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 547
    .line 548
    .line 549
    move-result-object v0

    .line 550
    check-cast v0, Lcom/p1/mobile/putong/data/Connector;

    .line 551
    .line 552
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 553
    .line 554
    goto/16 :goto_0

    .line 555
    .line 556
    :sswitch_1b
    sget-object v0, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 557
    .line 558
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 559
    .line 560
    .line 561
    move-result-object v0

    .line 562
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 563
    .line 564
    .line 565
    move-result-object v0

    .line 566
    check-cast v0, Ljava/util/List;

    .line 567
    .line 568
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 569
    .line 570
    goto/16 :goto_0

    .line 571
    .line 572
    :sswitch_1c
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 573
    .line 574
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 575
    .line 576
    .line 577
    move-result-object v0

    .line 578
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object v0

    .line 582
    check-cast v0, Ljava/util/List;

    .line 583
    .line 584
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 585
    .line 586
    goto/16 :goto_0

    .line 587
    .line 588
    :sswitch_1d
    sget-object v0, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 589
    .line 590
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 591
    .line 592
    .line 593
    move-result-object v0

    .line 594
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 595
    .line 596
    .line 597
    move-result-object v0

    .line 598
    check-cast v0, Ljava/util/List;

    .line 599
    .line 600
    iput-object v0, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 601
    .line 602
    goto/16 :goto_0

    .line 603
    .line 604
    :sswitch_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 605
    .line 606
    if-nez p1, :cond_15

    .line 607
    .line 608
    new-instance p1, Ljava/util/ArrayList;

    .line 609
    .line 610
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 611
    .line 612
    .line 613
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 614
    .line 615
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 616
    .line 617
    if-nez p1, :cond_16

    .line 618
    .line 619
    new-instance p1, Ljava/util/ArrayList;

    .line 620
    .line 621
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 622
    .line 623
    .line 624
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 625
    .line 626
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 627
    .line 628
    if-nez p1, :cond_17

    .line 629
    .line 630
    new-instance p1, Ljava/util/ArrayList;

    .line 631
    .line 632
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 633
    .line 634
    .line 635
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 636
    .line 637
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 638
    .line 639
    if-nez p1, :cond_18

    .line 640
    .line 641
    invoke-static {}, Lcom/p1/mobile/putong/data/Detect;->new_()Lcom/p1/mobile/putong/data/Detect;

    .line 642
    .line 643
    .line 644
    move-result-object p1

    .line 645
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 646
    .line 647
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 648
    .line 649
    if-nez p1, :cond_19

    .line 650
    .line 651
    new-instance p1, Ljava/util/ArrayList;

    .line 652
    .line 653
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 654
    .line 655
    .line 656
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 657
    .line 658
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 659
    .line 660
    if-nez p1, :cond_1a

    .line 661
    .line 662
    new-instance p1, Ljava/util/ArrayList;

    .line 663
    .line 664
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 665
    .line 666
    .line 667
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 668
    .line 669
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 670
    .line 671
    if-nez p1, :cond_1b

    .line 672
    .line 673
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 674
    .line 675
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 676
    .line 677
    if-nez p1, :cond_1c

    .line 678
    .line 679
    invoke-static {}, Lcom/p1/mobile/putong/data/SliderData;->new_()Lcom/p1/mobile/putong/data/SliderData;

    .line 680
    .line 681
    .line 682
    move-result-object p1

    .line 683
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 684
    .line 685
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 686
    .line 687
    if-nez p1, :cond_1d

    .line 688
    .line 689
    invoke-static {}, Lcom/p1/mobile/putong/data/VisitorInfo;->new_()Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 690
    .line 691
    .line 692
    move-result-object p1

    .line 693
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 694
    .line 695
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 696
    .line 697
    if-nez p1, :cond_1e

    .line 698
    .line 699
    new-instance p1, Ljava/util/ArrayList;

    .line 700
    .line 701
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 702
    .line 703
    .line 704
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 705
    .line 706
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 707
    .line 708
    if-nez p1, :cond_1f

    .line 709
    .line 710
    invoke-static {}, Lcom/p1/mobile/putong/data/VisitorCounter;->new_()Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 711
    .line 712
    .line 713
    move-result-object p1

    .line 714
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 715
    .line 716
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 717
    .line 718
    if-nez p1, :cond_20

    .line 719
    .line 720
    new-instance p1, Ljava/util/ArrayList;

    .line 721
    .line 722
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 723
    .line 724
    .line 725
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 726
    .line 727
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 728
    .line 729
    if-nez p1, :cond_21

    .line 730
    .line 731
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRightCDN;->new_()Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 732
    .line 733
    .line 734
    move-result-object p1

    .line 735
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 736
    .line 737
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 738
    .line 739
    if-nez p1, :cond_22

    .line 740
    .line 741
    invoke-static {}, Lcom/p1/mobile/putong/data/AdConfiguration;->new_()Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 742
    .line 743
    .line 744
    move-result-object p1

    .line 745
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 746
    .line 747
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 748
    .line 749
    if-nez p1, :cond_23

    .line 750
    .line 751
    invoke-static {}, Lcom/p1/mobile/putong/data/AdRewardResult;->new_()Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 752
    .line 753
    .line 754
    move-result-object p1

    .line 755
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 756
    .line 757
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 758
    .line 759
    if-nez p1, :cond_24

    .line 760
    .line 761
    new-instance p1, Ljava/util/ArrayList;

    .line 762
    .line 763
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 764
    .line 765
    .line 766
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 767
    .line 768
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 769
    .line 770
    if-nez p1, :cond_25

    .line 771
    .line 772
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 773
    .line 774
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 775
    .line 776
    if-nez p1, :cond_26

    .line 777
    .line 778
    invoke-static {}, Lcom/p1/mobile/putong/data/Mobile;->new_()Lcom/p1/mobile/putong/data/Mobile;

    .line 779
    .line 780
    .line 781
    move-result-object p1

    .line 782
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 783
    .line 784
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 785
    .line 786
    if-nez p1, :cond_27

    .line 787
    .line 788
    iput-object v1, p0, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 789
    .line 790
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 791
    .line 792
    if-nez p1, :cond_28

    .line 793
    .line 794
    invoke-static {}, Lcom/p1/mobile/putong/data/ThirdParty;->new_()Lcom/p1/mobile/putong/data/ThirdParty;

    .line 795
    .line 796
    .line 797
    move-result-object p1

    .line 798
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 799
    .line 800
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 801
    .line 802
    if-nez p1, :cond_29

    .line 803
    .line 804
    invoke-static {}, Lcom/p1/mobile/putong/data/Token;->new_()Lcom/p1/mobile/putong/data/Token;

    .line 805
    .line 806
    .line 807
    move-result-object p1

    .line 808
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 809
    .line 810
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 811
    .line 812
    if-nez p1, :cond_2a

    .line 813
    .line 814
    invoke-static {}, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->new_()Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 815
    .line 816
    .line 817
    move-result-object p1

    .line 818
    iput-object p1, p0, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 819
    .line 820
    :cond_2a
    return-object p0

    .line 821
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_1e
        0xa -> :sswitch_1d
        0x12 -> :sswitch_1c
        0x1a -> :sswitch_1b
        0x22 -> :sswitch_1a
        0x2a -> :sswitch_19
        0x32 -> :sswitch_18
        0x3a -> :sswitch_17
        0x42 -> :sswitch_16
        0x4a -> :sswitch_15
        0x52 -> :sswitch_14
        0x5a -> :sswitch_13
        0x62 -> :sswitch_12
        0x6a -> :sswitch_11
        0x72 -> :sswitch_10
        0x7a -> :sswitch_f
        0x82 -> :sswitch_e
        0x8a -> :sswitch_d
        0x92 -> :sswitch_c
        0x9a -> :sswitch_b
        0xa2 -> :sswitch_a
        0xa8 -> :sswitch_9
        0xb0 -> :sswitch_8
        0xb8 -> :sswitch_7
        0xc2 -> :sswitch_6
        0xc8 -> :sswitch_5
        0xd2 -> :sswitch_4
        0xda -> :sswitch_3
        0xe2 -> :sswitch_2
        0xea -> :sswitch_1
        0xf2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 821
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/CommonData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/CommonData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/CommonData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->users:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/data/User;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->media:Ljava/util/List;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->devices:Ljava/util/List;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    sget-object v0, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->connector:Lcom/p1/mobile/putong/data/Connector;

    .line 44
    .line 45
    if-eqz p0, :cond_3

    .line 46
    .line 47
    const/4 v0, 0x4

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/data/Connector;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->verificationTokens:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p0, :cond_4

    .line 56
    .line 57
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x5

    .line 64
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->links:Ljava/util/List;

    .line 68
    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    sget-object v0, Lcom/p1/mobile/putong/data/Link;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/4 v1, 0x6

    .line 78
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 79
    .line 80
    .line 81
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->detect:Lcom/p1/mobile/putong/data/Detect;

    .line 82
    .line 83
    if-eqz p0, :cond_6

    .line 84
    .line 85
    const/4 v0, 0x7

    .line 86
    sget-object v1, Lcom/p1/mobile/putong/data/Detect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 89
    .line 90
    .line 91
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->recommendMessage:Ljava/util/List;

    .line 92
    .line 93
    if-eqz p0, :cond_7

    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/data/RecommendMessage;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const/16 v1, 0x8

    .line 102
    .line 103
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 104
    .line 105
    .line 106
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->raySequences:Ljava/util/List;

    .line 107
    .line 108
    if-eqz p0, :cond_8

    .line 109
    .line 110
    sget-object v0, Lcom/p1/mobile/putong/data/ReflectResponse;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    const/16 v1, 0x9

    .line 117
    .line 118
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 119
    .line 120
    .line 121
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->stage:Ljava/lang/String;

    .line 122
    .line 123
    if-eqz p0, :cond_9

    .line 124
    .line 125
    const/16 v0, 0xa

    .line 126
    .line 127
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 128
    .line 129
    .line 130
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->captcha:Lcom/p1/mobile/putong/data/SliderData;

    .line 131
    .line 132
    if-eqz p0, :cond_a

    .line 133
    .line 134
    const/16 v0, 0xb

    .line 135
    .line 136
    sget-object v1, Lcom/p1/mobile/putong/data/SliderData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 139
    .line 140
    .line 141
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorInfo:Lcom/p1/mobile/putong/data/VisitorInfo;

    .line 142
    .line 143
    if-eqz p0, :cond_b

    .line 144
    .line 145
    const/16 v0, 0xc

    .line 146
    .line 147
    sget-object v1, Lcom/p1/mobile/putong/data/VisitorInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 150
    .line 151
    .line 152
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorStatistics:Ljava/util/List;

    .line 153
    .line 154
    if-eqz p0, :cond_c

    .line 155
    .line 156
    sget-object v0, Lcom/p1/mobile/putong/data/VisitorStatistics;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 157
    .line 158
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    const/16 v1, 0xd

    .line 163
    .line 164
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 165
    .line 166
    .line 167
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->visitorCounter:Lcom/p1/mobile/putong/data/VisitorCounter;

    .line 168
    .line 169
    if-eqz p0, :cond_d

    .line 170
    .line 171
    const/16 v0, 0xe

    .line 172
    .line 173
    sget-object v1, Lcom/p1/mobile/putong/data/VisitorCounter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 176
    .line 177
    .line 178
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->avatarFrameConfiguration:Ljava/util/List;

    .line 179
    .line 180
    if-eqz p0, :cond_e

    .line 181
    .line 182
    sget-object v0, Lcom/p1/mobile/putong/data/AvatarFrameConfig;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    .line 187
    move-result-object v0

    .line 188
    const/16 v1, 0xf

    .line 189
    .line 190
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 191
    .line 192
    .line 193
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->liveRightCDN:Lcom/p1/mobile/putong/data/LiveRightCDN;

    .line 194
    .line 195
    if-eqz p0, :cond_f

    .line 196
    .line 197
    const/16 v0, 0x10

    .line 198
    .line 199
    sget-object v1, Lcom/p1/mobile/putong/data/LiveRightCDN;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 202
    .line 203
    .line 204
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->adConfiguration:Lcom/p1/mobile/putong/data/AdConfiguration;

    .line 205
    .line 206
    if-eqz p0, :cond_10

    .line 207
    .line 208
    const/16 v0, 0x11

    .line 209
    .line 210
    sget-object v1, Lcom/p1/mobile/putong/data/AdConfiguration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 213
    .line 214
    .line 215
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->adReward:Lcom/p1/mobile/putong/data/AdRewardResult;

    .line 216
    .line 217
    if-eqz p0, :cond_11

    .line 218
    .line 219
    const/16 v0, 0x12

    .line 220
    .line 221
    sget-object v1, Lcom/p1/mobile/putong/data/AdRewardResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 224
    .line 225
    .line 226
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->pictureTags:Ljava/util/List;

    .line 227
    .line 228
    if-eqz p0, :cond_12

    .line 229
    .line 230
    sget-object v0, Lcom/p1/mobile/putong/data/UserPictureTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 231
    .line 232
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 233
    .line 234
    .line 235
    move-result-object v0

    .line 236
    const/16 v1, 0x13

    .line 237
    .line 238
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 239
    .line 240
    .line 241
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 242
    .line 243
    if-eqz p0, :cond_13

    .line 244
    .line 245
    const/16 v0, 0x14

    .line 246
    .line 247
    sget-object v1, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 250
    .line 251
    .line 252
    :cond_13
    const/16 p0, 0x15

    .line 253
    .line 254
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonData;->newGuide:Z

    .line 255
    .line 256
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 257
    .line 258
    .line 259
    const/16 p0, 0x16

    .line 260
    .line 261
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonData;->popUps:Z

    .line 262
    .line 263
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 264
    .line 265
    .line 266
    const/16 p0, 0x17

    .line 267
    .line 268
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonData;->showDialog:Z

    .line 269
    .line 270
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 271
    .line 272
    .line 273
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->type:Ljava/lang/String;

    .line 274
    .line 275
    if-eqz p0, :cond_14

    .line 276
    .line 277
    const/16 v0, 0x18

    .line 278
    .line 279
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 280
    .line 281
    .line 282
    :cond_14
    const/16 p0, 0x19

    .line 283
    .line 284
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/CommonData;->showEntrance:Z

    .line 285
    .line 286
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 287
    .line 288
    .line 289
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->mobile:Lcom/p1/mobile/putong/data/Mobile;

    .line 290
    .line 291
    if-eqz p0, :cond_15

    .line 292
    .line 293
    const/16 v0, 0x1a

    .line 294
    .line 295
    sget-object v1, Lcom/p1/mobile/putong/data/Mobile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 296
    .line 297
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 298
    .line 299
    .line 300
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->email:Ljava/lang/String;

    .line 301
    .line 302
    if-eqz p0, :cond_16

    .line 303
    .line 304
    const/16 v0, 0x1b

    .line 305
    .line 306
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 307
    .line 308
    .line 309
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdparty:Lcom/p1/mobile/putong/data/ThirdParty;

    .line 310
    .line 311
    if-eqz p0, :cond_17

    .line 312
    .line 313
    const/16 v0, 0x1c

    .line 314
    .line 315
    sget-object v1, Lcom/p1/mobile/putong/data/ThirdParty;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 316
    .line 317
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 318
    .line 319
    .line 320
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->token:Lcom/p1/mobile/putong/data/Token;

    .line 321
    .line 322
    if-eqz p0, :cond_18

    .line 323
    .line 324
    const/16 v0, 0x1d

    .line 325
    .line 326
    sget-object v1, Lcom/p1/mobile/putong/data/Token;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 329
    .line 330
    .line 331
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/CommonData;->thirdpartyEmail:Lcom/p1/mobile/putong/data/ThirdPartyEmail;

    .line 332
    .line 333
    if-eqz p0, :cond_19

    .line 334
    .line 335
    const/16 p1, 0x1e

    .line 336
    .line 337
    sget-object v0, Lcom/p1/mobile/putong/data/ThirdPartyEmail;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 340
    .line 341
    .line 342
    :cond_19
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 343
    check-cast p1, Lcom/p1/mobile/putong/data/CommonData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/CommonData$1;->serialize(Lcom/p1/mobile/putong/data/CommonData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
