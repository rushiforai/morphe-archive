.class Lcom/p1/mobile/putong/data/UserPushSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserPushSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserPushSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserPushSettings;)I
    .locals 2

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x5

    .line 63
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x6

    .line 77
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 87
    .line 88
    if-eqz v0, :cond_6

    .line 89
    .line 90
    const/4 v1, 0x7

    .line 91
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    const/16 v1, 0x8

    .line 105
    .line 106
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 116
    .line 117
    if-eqz v0, :cond_8

    .line 118
    .line 119
    const/16 v1, 0x9

    .line 120
    .line 121
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 131
    .line 132
    if-eqz v0, :cond_9

    .line 133
    .line 134
    const/16 v1, 0xa

    .line 135
    .line 136
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 146
    .line 147
    if-eqz v0, :cond_a

    .line 148
    .line 149
    const/16 v1, 0xb

    .line 150
    .line 151
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    add-int/2addr p0, v0

    .line 160
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 161
    .line 162
    if-eqz v0, :cond_b

    .line 163
    .line 164
    const/16 v1, 0xc

    .line 165
    .line 166
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    add-int/2addr p0, v0

    .line 175
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 176
    .line 177
    if-eqz v0, :cond_c

    .line 178
    .line 179
    const/16 v1, 0xd

    .line 180
    .line 181
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr p0, v0

    .line 190
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 191
    .line 192
    if-eqz v0, :cond_d

    .line 193
    .line 194
    const/16 v1, 0xe

    .line 195
    .line 196
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 201
    .line 202
    .line 203
    move-result v0

    .line 204
    add-int/2addr p0, v0

    .line 205
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 206
    .line 207
    if-eqz v0, :cond_e

    .line 208
    .line 209
    const/16 v1, 0xf

    .line 210
    .line 211
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 216
    .line 217
    .line 218
    move-result v0

    .line 219
    add-int/2addr p0, v0

    .line 220
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 221
    .line 222
    if-eqz v0, :cond_f

    .line 223
    .line 224
    const/16 v1, 0x10

    .line 225
    .line 226
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 227
    .line 228
    .line 229
    move-result v0

    .line 230
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    add-int/2addr p0, v0

    .line 235
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 236
    .line 237
    if-eqz v0, :cond_10

    .line 238
    .line 239
    const/16 v1, 0x11

    .line 240
    .line 241
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 242
    .line 243
    .line 244
    move-result v0

    .line 245
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 246
    .line 247
    .line 248
    move-result v0

    .line 249
    add-int/2addr p0, v0

    .line 250
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 251
    .line 252
    if-eqz v0, :cond_11

    .line 253
    .line 254
    const/16 v1, 0x12

    .line 255
    .line 256
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 257
    .line 258
    .line 259
    move-result v0

    .line 260
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 261
    .line 262
    .line 263
    move-result v0

    .line 264
    add-int/2addr p0, v0

    .line 265
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 266
    .line 267
    if-eqz v0, :cond_12

    .line 268
    .line 269
    const/16 v1, 0x13

    .line 270
    .line 271
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    add-int/2addr p0, v0

    .line 280
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 281
    .line 282
    if-eqz v0, :cond_13

    .line 283
    .line 284
    const/16 v1, 0x14

    .line 285
    .line 286
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 287
    .line 288
    .line 289
    move-result v0

    .line 290
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    add-int/2addr p0, v0

    .line 295
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 296
    .line 297
    if-eqz v0, :cond_14

    .line 298
    .line 299
    const/16 v1, 0x15

    .line 300
    .line 301
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 306
    .line 307
    .line 308
    move-result v0

    .line 309
    add-int/2addr p0, v0

    .line 310
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 311
    .line 312
    if-eqz v0, :cond_15

    .line 313
    .line 314
    const/16 v1, 0x16

    .line 315
    .line 316
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 321
    .line 322
    .line 323
    move-result v0

    .line 324
    add-int/2addr p0, v0

    .line 325
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 326
    .line 327
    if-eqz v0, :cond_16

    .line 328
    .line 329
    const/16 v1, 0x17

    .line 330
    .line 331
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 332
    .line 333
    .line 334
    move-result v0

    .line 335
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 336
    .line 337
    .line 338
    move-result v0

    .line 339
    add-int/2addr p0, v0

    .line 340
    :cond_16
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 341
    .line 342
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 343
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserPushSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserPushSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserPushSettings;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x0

    .line 2
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 3
    .line 4
    .line 5
    move-result-object p0

    .line 6
    new-instance v0, Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 7
    .line 8
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/UserPushSettings;-><init>()V

    .line 9
    .line 10
    .line 11
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 12
    .line 13
    .line 14
    move-result v1

    .line 15
    sparse-switch v1, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 23
    .line 24
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 25
    .line 26
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 27
    .line 28
    if-nez p1, :cond_1

    .line 29
    .line 30
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 31
    .line 32
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 33
    .line 34
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 35
    .line 36
    if-nez p1, :cond_2

    .line 37
    .line 38
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 39
    .line 40
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 41
    .line 42
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 43
    .line 44
    if-nez p1, :cond_3

    .line 45
    .line 46
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 47
    .line 48
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 49
    .line 50
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 51
    .line 52
    if-nez p1, :cond_4

    .line 53
    .line 54
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 55
    .line 56
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 57
    .line 58
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 59
    .line 60
    if-nez p1, :cond_5

    .line 61
    .line 62
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 63
    .line 64
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 65
    .line 66
    :cond_5
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 67
    .line 68
    if-nez p1, :cond_6

    .line 69
    .line 70
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 71
    .line 72
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 73
    .line 74
    :cond_6
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 75
    .line 76
    if-nez p1, :cond_7

    .line 77
    .line 78
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 79
    .line 80
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 81
    .line 82
    :cond_7
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 83
    .line 84
    if-nez p1, :cond_8

    .line 85
    .line 86
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 87
    .line 88
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 89
    .line 90
    :cond_8
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 91
    .line 92
    if-nez p1, :cond_9

    .line 93
    .line 94
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 95
    .line 96
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 97
    .line 98
    :cond_9
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 99
    .line 100
    if-nez p1, :cond_a

    .line 101
    .line 102
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 103
    .line 104
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 105
    .line 106
    :cond_a
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 107
    .line 108
    if-nez p1, :cond_b

    .line 109
    .line 110
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 111
    .line 112
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 113
    .line 114
    :cond_b
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 115
    .line 116
    if-nez p1, :cond_c

    .line 117
    .line 118
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 119
    .line 120
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 121
    .line 122
    :cond_c
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 123
    .line 124
    if-nez p1, :cond_d

    .line 125
    .line 126
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 127
    .line 128
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 129
    .line 130
    :cond_d
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 131
    .line 132
    if-nez p1, :cond_e

    .line 133
    .line 134
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 135
    .line 136
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 137
    .line 138
    :cond_e
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 139
    .line 140
    if-nez p1, :cond_f

    .line 141
    .line 142
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 143
    .line 144
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 145
    .line 146
    :cond_f
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 147
    .line 148
    if-nez p1, :cond_10

    .line 149
    .line 150
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 151
    .line 152
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 153
    .line 154
    :cond_10
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 155
    .line 156
    if-nez p1, :cond_11

    .line 157
    .line 158
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 159
    .line 160
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 161
    .line 162
    :cond_11
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 163
    .line 164
    if-nez p1, :cond_12

    .line 165
    .line 166
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 167
    .line 168
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 169
    .line 170
    :cond_12
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 171
    .line 172
    if-nez p1, :cond_13

    .line 173
    .line 174
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 175
    .line 176
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 177
    .line 178
    :cond_13
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 179
    .line 180
    if-nez p1, :cond_14

    .line 181
    .line 182
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 183
    .line 184
    :cond_14
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 185
    .line 186
    if-nez p1, :cond_15

    .line 187
    .line 188
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 189
    .line 190
    :cond_15
    iget-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 191
    .line 192
    if-nez p0, :cond_2c

    .line 193
    .line 194
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 195
    .line 196
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 197
    .line 198
    return-object v0

    .line 199
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 200
    .line 201
    .line 202
    move-result v1

    .line 203
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 204
    .line 205
    .line 206
    move-result-object v1

    .line 207
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 224
    .line 225
    .line 226
    move-result v1

    .line 227
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 232
    .line 233
    goto/16 :goto_0

    .line 234
    .line 235
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 240
    .line 241
    .line 242
    move-result-object v1

    .line 243
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 248
    .line 249
    .line 250
    move-result v1

    .line 251
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 256
    .line 257
    goto/16 :goto_0

    .line 258
    .line 259
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 260
    .line 261
    .line 262
    move-result v1

    .line 263
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 264
    .line 265
    .line 266
    move-result-object v1

    .line 267
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 272
    .line 273
    .line 274
    move-result v1

    .line 275
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 276
    .line 277
    .line 278
    move-result-object v1

    .line 279
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 280
    .line 281
    goto/16 :goto_0

    .line 282
    .line 283
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 288
    .line 289
    .line 290
    move-result-object v1

    .line 291
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 296
    .line 297
    .line 298
    move-result v1

    .line 299
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 300
    .line 301
    .line 302
    move-result-object v1

    .line 303
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 304
    .line 305
    goto/16 :goto_0

    .line 306
    .line 307
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 308
    .line 309
    .line 310
    move-result v1

    .line 311
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 312
    .line 313
    .line 314
    move-result-object v1

    .line 315
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 320
    .line 321
    .line 322
    move-result v1

    .line 323
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 324
    .line 325
    .line 326
    move-result-object v1

    .line 327
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 328
    .line 329
    goto/16 :goto_0

    .line 330
    .line 331
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 332
    .line 333
    .line 334
    move-result v1

    .line 335
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 336
    .line 337
    .line 338
    move-result-object v1

    .line 339
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 340
    .line 341
    goto/16 :goto_0

    .line 342
    .line 343
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 344
    .line 345
    .line 346
    move-result v1

    .line 347
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 348
    .line 349
    .line 350
    move-result-object v1

    .line 351
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 352
    .line 353
    goto/16 :goto_0

    .line 354
    .line 355
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 356
    .line 357
    .line 358
    move-result v1

    .line 359
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 360
    .line 361
    .line 362
    move-result-object v1

    .line 363
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 364
    .line 365
    goto/16 :goto_0

    .line 366
    .line 367
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 368
    .line 369
    .line 370
    move-result v1

    .line 371
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 372
    .line 373
    .line 374
    move-result-object v1

    .line 375
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 376
    .line 377
    goto/16 :goto_0

    .line 378
    .line 379
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 380
    .line 381
    .line 382
    move-result v1

    .line 383
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 384
    .line 385
    .line 386
    move-result-object v1

    .line 387
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 392
    .line 393
    .line 394
    move-result v1

    .line 395
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 396
    .line 397
    .line 398
    move-result-object v1

    .line 399
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 400
    .line 401
    goto/16 :goto_0

    .line 402
    .line 403
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 404
    .line 405
    .line 406
    move-result v1

    .line 407
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 408
    .line 409
    .line 410
    move-result-object v1

    .line 411
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 412
    .line 413
    goto/16 :goto_0

    .line 414
    .line 415
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 416
    .line 417
    .line 418
    move-result v1

    .line 419
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 420
    .line 421
    .line 422
    move-result-object v1

    .line 423
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 424
    .line 425
    goto/16 :goto_0

    .line 426
    .line 427
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 432
    .line 433
    .line 434
    move-result-object v1

    .line 435
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 436
    .line 437
    goto/16 :goto_0

    .line 438
    .line 439
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 440
    .line 441
    .line 442
    move-result v1

    .line 443
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 444
    .line 445
    .line 446
    move-result-object v1

    .line 447
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 448
    .line 449
    goto/16 :goto_0

    .line 450
    .line 451
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 452
    .line 453
    .line 454
    move-result v1

    .line 455
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 456
    .line 457
    .line 458
    move-result-object v1

    .line 459
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 460
    .line 461
    goto/16 :goto_0

    .line 462
    .line 463
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 464
    .line 465
    .line 466
    move-result v1

    .line 467
    invoke-static {v1}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 468
    .line 469
    .line 470
    move-result-object v1

    .line 471
    iput-object v1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 472
    .line 473
    goto/16 :goto_0

    .line 474
    .line 475
    :sswitch_17
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 476
    .line 477
    if-nez p1, :cond_16

    .line 478
    .line 479
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 480
    .line 481
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 482
    .line 483
    :cond_16
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 484
    .line 485
    if-nez p1, :cond_17

    .line 486
    .line 487
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 488
    .line 489
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 490
    .line 491
    :cond_17
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 492
    .line 493
    if-nez p1, :cond_18

    .line 494
    .line 495
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 496
    .line 497
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 498
    .line 499
    :cond_18
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 500
    .line 501
    if-nez p1, :cond_19

    .line 502
    .line 503
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 504
    .line 505
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 506
    .line 507
    :cond_19
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 508
    .line 509
    if-nez p1, :cond_1a

    .line 510
    .line 511
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 512
    .line 513
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 514
    .line 515
    :cond_1a
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 516
    .line 517
    if-nez p1, :cond_1b

    .line 518
    .line 519
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 520
    .line 521
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 522
    .line 523
    :cond_1b
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 524
    .line 525
    if-nez p1, :cond_1c

    .line 526
    .line 527
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 528
    .line 529
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 530
    .line 531
    :cond_1c
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 532
    .line 533
    if-nez p1, :cond_1d

    .line 534
    .line 535
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 536
    .line 537
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 538
    .line 539
    :cond_1d
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 540
    .line 541
    if-nez p1, :cond_1e

    .line 542
    .line 543
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 544
    .line 545
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 546
    .line 547
    :cond_1e
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 548
    .line 549
    if-nez p1, :cond_1f

    .line 550
    .line 551
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 552
    .line 553
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 554
    .line 555
    :cond_1f
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 556
    .line 557
    if-nez p1, :cond_20

    .line 558
    .line 559
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 560
    .line 561
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 562
    .line 563
    :cond_20
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 564
    .line 565
    if-nez p1, :cond_21

    .line 566
    .line 567
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 568
    .line 569
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 570
    .line 571
    :cond_21
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 572
    .line 573
    if-nez p1, :cond_22

    .line 574
    .line 575
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 576
    .line 577
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 578
    .line 579
    :cond_22
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 580
    .line 581
    if-nez p1, :cond_23

    .line 582
    .line 583
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 584
    .line 585
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 586
    .line 587
    :cond_23
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 588
    .line 589
    if-nez p1, :cond_24

    .line 590
    .line 591
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 592
    .line 593
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 594
    .line 595
    :cond_24
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 596
    .line 597
    if-nez p1, :cond_25

    .line 598
    .line 599
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 600
    .line 601
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 602
    .line 603
    :cond_25
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 604
    .line 605
    if-nez p1, :cond_26

    .line 606
    .line 607
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 608
    .line 609
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 610
    .line 611
    :cond_26
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 612
    .line 613
    if-nez p1, :cond_27

    .line 614
    .line 615
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 616
    .line 617
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 618
    .line 619
    :cond_27
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 620
    .line 621
    if-nez p1, :cond_28

    .line 622
    .line 623
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 624
    .line 625
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 626
    .line 627
    :cond_28
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 628
    .line 629
    if-nez p1, :cond_29

    .line 630
    .line 631
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 632
    .line 633
    iput-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 634
    .line 635
    :cond_29
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 636
    .line 637
    if-nez p1, :cond_2a

    .line 638
    .line 639
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 640
    .line 641
    :cond_2a
    iget-object p1, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 642
    .line 643
    if-nez p1, :cond_2b

    .line 644
    .line 645
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 646
    .line 647
    :cond_2b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 648
    .line 649
    if-nez p0, :cond_2c

    .line 650
    .line 651
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 652
    .line 653
    iput-object p0, v0, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 654
    .line 655
    :cond_2c
    return-object v0

    .line 656
    nop

    .line 657
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_17
        0x8 -> :sswitch_16
        0x10 -> :sswitch_15
        0x18 -> :sswitch_14
        0x20 -> :sswitch_13
        0x28 -> :sswitch_12
        0x30 -> :sswitch_11
        0x38 -> :sswitch_10
        0x40 -> :sswitch_f
        0x48 -> :sswitch_e
        0x50 -> :sswitch_d
        0x58 -> :sswitch_c
        0x60 -> :sswitch_b
        0x68 -> :sswitch_a
        0x70 -> :sswitch_9
        0x78 -> :sswitch_8
        0x80 -> :sswitch_7
        0x88 -> :sswitch_6
        0x90 -> :sswitch_5
        0x98 -> :sswitch_4
        0xa0 -> :sswitch_3
        0xa8 -> :sswitch_2
        0xb0 -> :sswitch_1
        0xb8 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 657
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserPushSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserPushSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserPushSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorRecommendPush:Ljava/lang/Boolean;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->anchorShowPush:Ljava/lang/Boolean;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 19
    .line 20
    .line 21
    move-result p0

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->friendNewMomentPush:Ljava/lang/Boolean;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->messagePush:Ljava/lang/Boolean;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentCommentPush:Ljava/lang/Boolean;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentFollowPush:Ljava/lang/Boolean;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/4 v0, 0x6

    .line 66
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 71
    .line 72
    .line 73
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentLikePush:Ljava/lang/Boolean;

    .line 74
    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    const/4 v0, 0x7

    .line 78
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->newMatchPush:Ljava/lang/Boolean;

    .line 86
    .line 87
    if-eqz p0, :cond_7

    .line 88
    .line 89
    const/16 v0, 0x8

    .line 90
    .line 91
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 92
    .line 93
    .line 94
    move-result p0

    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 96
    .line 97
    .line 98
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->officialPush:Ljava/lang/Boolean;

    .line 99
    .line 100
    if-eqz p0, :cond_8

    .line 101
    .line 102
    const/16 v0, 0x9

    .line 103
    .line 104
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 105
    .line 106
    .line 107
    move-result p0

    .line 108
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 109
    .line 110
    .line 111
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->previewMessage:Ljava/lang/Boolean;

    .line 112
    .line 113
    if-eqz p0, :cond_9

    .line 114
    .line 115
    const/16 v0, 0xa

    .line 116
    .line 117
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 118
    .line 119
    .line 120
    move-result p0

    .line 121
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 122
    .line 123
    .line 124
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->showMomentLikes:Ljava/lang/Boolean;

    .line 125
    .line 126
    if-eqz p0, :cond_a

    .line 127
    .line 128
    const/16 v0, 0xb

    .line 129
    .line 130
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 131
    .line 132
    .line 133
    move-result p0

    .line 134
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 135
    .line 136
    .line 137
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->soundPush:Ljava/lang/Boolean;

    .line 138
    .line 139
    if-eqz p0, :cond_b

    .line 140
    .line 141
    const/16 v0, 0xc

    .line 142
    .line 143
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 144
    .line 145
    .line 146
    move-result p0

    .line 147
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 148
    .line 149
    .line 150
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->superLikePush:Ljava/lang/Boolean;

    .line 151
    .line 152
    if-eqz p0, :cond_c

    .line 153
    .line 154
    const/16 v0, 0xd

    .line 155
    .line 156
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 157
    .line 158
    .line 159
    move-result p0

    .line 160
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 161
    .line 162
    .line 163
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->msgPush:Ljava/lang/Boolean;

    .line 164
    .line 165
    if-eqz p0, :cond_d

    .line 166
    .line 167
    const/16 v0, 0xe

    .line 168
    .line 169
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 170
    .line 171
    .line 172
    move-result p0

    .line 173
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 174
    .line 175
    .line 176
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->recommendPush:Ljava/lang/Boolean;

    .line 177
    .line 178
    if-eqz p0, :cond_e

    .line 179
    .line 180
    const/16 v0, 0xf

    .line 181
    .line 182
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 187
    .line 188
    .line 189
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->momentPush:Ljava/lang/Boolean;

    .line 190
    .line 191
    if-eqz p0, :cond_f

    .line 192
    .line 193
    const/16 v0, 0x10

    .line 194
    .line 195
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 196
    .line 197
    .line 198
    move-result p0

    .line 199
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 200
    .line 201
    .line 202
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->livePush:Ljava/lang/Boolean;

    .line 203
    .line 204
    if-eqz p0, :cond_10

    .line 205
    .line 206
    const/16 v0, 0x11

    .line 207
    .line 208
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 209
    .line 210
    .line 211
    move-result p0

    .line 212
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 213
    .line 214
    .line 215
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->systemPush:Ljava/lang/Boolean;

    .line 216
    .line 217
    if-eqz p0, :cond_11

    .line 218
    .line 219
    const/16 v0, 0x12

    .line 220
    .line 221
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 222
    .line 223
    .line 224
    move-result p0

    .line 225
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 226
    .line 227
    .line 228
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentSwitch:Ljava/lang/Boolean;

    .line 229
    .line 230
    if-eqz p0, :cond_12

    .line 231
    .line 232
    const/16 v0, 0x13

    .line 233
    .line 234
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 235
    .line 236
    .line 237
    move-result p0

    .line 238
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 239
    .line 240
    .line 241
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->voiceLivePush:Ljava/lang/Boolean;

    .line 242
    .line 243
    if-eqz p0, :cond_13

    .line 244
    .line 245
    const/16 v0, 0x14

    .line 246
    .line 247
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 248
    .line 249
    .line 250
    move-result p0

    .line 251
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 252
    .line 253
    .line 254
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentEndTime:Ljava/lang/Integer;

    .line 255
    .line 256
    if-eqz p0, :cond_14

    .line 257
    .line 258
    const/16 v0, 0x15

    .line 259
    .line 260
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 261
    .line 262
    .line 263
    move-result p0

    .line 264
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 265
    .line 266
    .line 267
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->silentStartTime:Ljava/lang/Integer;

    .line 268
    .line 269
    if-eqz p0, :cond_15

    .line 270
    .line 271
    const/16 v0, 0x16

    .line 272
    .line 273
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 274
    .line 275
    .line 276
    move-result p0

    .line 277
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 278
    .line 279
    .line 280
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserPushSettings;->allPush:Ljava/lang/Boolean;

    .line 281
    .line 282
    if-eqz p0, :cond_16

    .line 283
    .line 284
    const/16 p1, 0x17

    .line 285
    .line 286
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 287
    .line 288
    .line 289
    move-result p0

    .line 290
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 291
    .line 292
    .line 293
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

    .line 294
    check-cast p1, Lcom/p1/mobile/putong/data/UserPushSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserPushSettings$1;->serialize(Lcom/p1/mobile/putong/data/UserPushSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
