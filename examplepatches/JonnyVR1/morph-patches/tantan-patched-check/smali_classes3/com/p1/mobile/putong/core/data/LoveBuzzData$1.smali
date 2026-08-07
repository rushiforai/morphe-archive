.class Lcom/p1/mobile/putong/core/data/LoveBuzzData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/LoveBuzzData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/LoveBuzzData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LoveBuzzData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

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
    const/4 v0, 0x2

    .line 13
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 14
    .line 15
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 16
    .line 17
    .line 18
    move-result v0

    .line 19
    add-int/2addr p0, v0

    .line 20
    const/4 v0, 0x3

    .line 21
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 22
    .line 23
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 29
    .line 30
    if-eqz v0, :cond_1

    .line 31
    .line 32
    const/4 v1, 0x4

    .line 33
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_1
    const/4 v0, 0x5

    .line 39
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    const/4 v0, 0x6

    .line 47
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/4 v0, 0x7

    .line 55
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/16 v0, 0x8

    .line 63
    .line 64
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 65
    .line 66
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 67
    .line 68
    .line 69
    move-result v0

    .line 70
    add-int/2addr p0, v0

    .line 71
    const/16 v0, 0x9

    .line 72
    .line 73
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 74
    .line 75
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    const/16 v0, 0xa

    .line 81
    .line 82
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 83
    .line 84
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    const/16 v0, 0xb

    .line 90
    .line 91
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v0, :cond_2

    .line 101
    .line 102
    const/16 v1, 0xc

    .line 103
    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_2
    const/16 v0, 0xd

    .line 110
    .line 111
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 112
    .line 113
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    const/16 v0, 0xe

    .line 119
    .line 120
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 121
    .line 122
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v0, :cond_3

    .line 130
    .line 131
    const/16 v1, 0xf

    .line 132
    .line 133
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 139
    .line 140
    if-eqz v0, :cond_4

    .line 141
    .line 142
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    .line 147
    move-result-object v1

    .line 148
    const/16 v2, 0x10

    .line 149
    .line 150
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 151
    .line 152
    .line 153
    move-result v0

    .line 154
    add-int/2addr p0, v0

    .line 155
    :cond_4
    const/16 v0, 0x11

    .line 156
    .line 157
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 158
    .line 159
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 160
    .line 161
    .line 162
    move-result v0

    .line 163
    add-int/2addr p0, v0

    .line 164
    const/16 v0, 0x12

    .line 165
    .line 166
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 167
    .line 168
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    add-int/2addr p0, v0

    .line 173
    const/16 v0, 0x13

    .line 174
    .line 175
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 176
    .line 177
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    const/16 v0, 0x14

    .line 183
    .line 184
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 185
    .line 186
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    const/16 v0, 0x15

    .line 192
    .line 193
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 194
    .line 195
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    const/16 v0, 0x16

    .line 201
    .line 202
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 203
    .line 204
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    add-int/2addr p0, v0

    .line 209
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 210
    .line 211
    if-eqz v0, :cond_5

    .line 212
    .line 213
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    .line 218
    move-result-object v1

    .line 219
    const/16 v2, 0x17

    .line 220
    .line 221
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    :cond_5
    const/16 v0, 0x18

    .line 227
    .line 228
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 229
    .line 230
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    add-int/2addr p0, v0

    .line 235
    const/16 v0, 0x19

    .line 236
    .line 237
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 238
    .line 239
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 240
    .line 241
    .line 242
    move-result v0

    .line 243
    add-int/2addr p0, v0

    .line 244
    const/16 v0, 0x1a

    .line 245
    .line 246
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 247
    .line 248
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    add-int/2addr p0, v0

    .line 253
    const/16 v0, 0x1b

    .line 254
    .line 255
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 256
    .line 257
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    add-int/2addr p0, v0

    .line 262
    const/16 v0, 0x1c

    .line 263
    .line 264
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 265
    .line 266
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    add-int/2addr p0, v0

    .line 271
    const/16 v0, 0x1d

    .line 272
    .line 273
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 274
    .line 275
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    add-int/2addr p0, v0

    .line 280
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 281
    .line 282
    if-eqz v0, :cond_6

    .line 283
    .line 284
    const/16 v1, 0x1e

    .line 285
    .line 286
    sget-object v2, Lcom/p1/mobile/putong/core/data/RemainingBonus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 294
    .line 295
    if-eqz v0, :cond_7

    .line 296
    .line 297
    const/16 v1, 0x1f

    .line 298
    .line 299
    sget-object v2, Lcom/p1/mobile/putong/core/data/RateLimited;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 300
    .line 301
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    add-int/2addr p0, v0

    .line 306
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 307
    .line 308
    if-eqz v0, :cond_8

    .line 309
    .line 310
    const/16 v1, 0x20

    .line 311
    .line 312
    sget-object v2, Lcom/p1/mobile/putong/core/data/BonusThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 313
    .line 314
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    add-int/2addr p0, v0

    .line 319
    :cond_8
    const/16 v0, 0x21

    .line 320
    .line 321
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 322
    .line 323
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    add-int/2addr p0, v0

    .line 328
    const/16 v0, 0x22

    .line 329
    .line 330
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 331
    .line 332
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 333
    .line 334
    .line 335
    move-result v0

    .line 336
    add-int/2addr p0, v0

    .line 337
    const/16 v0, 0x23

    .line 338
    .line 339
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 340
    .line 341
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 342
    .line 343
    .line 344
    move-result v0

    .line 345
    add-int/2addr p0, v0

    .line 346
    const/16 v0, 0x24

    .line 347
    .line 348
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 349
    .line 350
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 351
    .line 352
    .line 353
    move-result v0

    .line 354
    add-int/2addr p0, v0

    .line 355
    const/16 v0, 0x25

    .line 356
    .line 357
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 358
    .line 359
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 360
    .line 361
    .line 362
    move-result v0

    .line 363
    add-int/2addr p0, v0

    .line 364
    const/16 v0, 0x26

    .line 365
    .line 366
    iget v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 367
    .line 368
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    add-int/2addr p0, v0

    .line 373
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 374
    .line 375
    if-eqz v0, :cond_9

    .line 376
    .line 377
    const/16 v1, 0x27

    .line 378
    .line 379
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    add-int/2addr p0, v0

    .line 384
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 385
    .line 386
    if-eqz v0, :cond_a

    .line 387
    .line 388
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 389
    .line 390
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 391
    .line 392
    .line 393
    move-result-object v1

    .line 394
    const/16 v2, 0x28

    .line 395
    .line 396
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 397
    .line 398
    .line 399
    move-result v0

    .line 400
    add-int/2addr p0, v0

    .line 401
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 402
    .line 403
    if-eqz v0, :cond_b

    .line 404
    .line 405
    const/16 v1, 0x29

    .line 406
    .line 407
    sget-object v2, Lcom/p1/mobile/putong/core/data/BuzzResolution;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 408
    .line 409
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 410
    .line 411
    .line 412
    move-result v0

    .line 413
    add-int/2addr p0, v0

    .line 414
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 415
    .line 416
    if-eqz v0, :cond_c

    .line 417
    .line 418
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 419
    .line 420
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 421
    .line 422
    .line 423
    move-result-object v1

    .line 424
    const/16 v2, 0x2a

    .line 425
    .line 426
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    add-int/2addr p0, v0

    .line 431
    :cond_c
    const/16 v0, 0x2b

    .line 432
    .line 433
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 434
    .line 435
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    add-int/2addr p0, v0

    .line 440
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 441
    .line 442
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 443
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LoveBuzzData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LoveBuzzData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LoveBuzzData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    new-instance p1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 60
    .line 61
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 62
    .line 63
    if-nez p1, :cond_6

    .line 64
    .line 65
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RemainingBonus;->new_()Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 66
    .line 67
    .line 68
    move-result-object p1

    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 70
    .line 71
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 72
    .line 73
    if-nez p1, :cond_7

    .line 74
    .line 75
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RateLimited;->new_()Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 76
    .line 77
    .line 78
    move-result-object p1

    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 80
    .line 81
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 82
    .line 83
    if-nez p1, :cond_8

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BonusThreshold;->new_()Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 90
    .line 91
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_9

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 96
    .line 97
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 98
    .line 99
    if-nez p1, :cond_a

    .line 100
    .line 101
    new-instance p1, Ljava/util/ArrayList;

    .line 102
    .line 103
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 104
    .line 105
    .line 106
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 107
    .line 108
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 109
    .line 110
    if-nez p1, :cond_b

    .line 111
    .line 112
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzResolution;->new_()Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 113
    .line 114
    .line 115
    move-result-object p1

    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 117
    .line 118
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 119
    .line 120
    if-nez p1, :cond_18

    .line 121
    .line 122
    new-instance p1, Ljava/util/ArrayList;

    .line 123
    .line 124
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 125
    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 128
    .line 129
    return-object p0

    .line 130
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_1
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    check-cast v0, Ljava/util/List;

    .line 149
    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/BuzzResolution;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    check-cast v0, Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 161
    .line 162
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    .line 171
    move-result-object v0

    .line 172
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v0

    .line 176
    check-cast v0, Ljava/util/List;

    .line 177
    .line 178
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v0

    .line 186
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 199
    .line 200
    .line 201
    move-result v0

    .line 202
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 227
    .line 228
    goto/16 :goto_0

    .line 229
    .line 230
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 235
    .line 236
    goto/16 :goto_0

    .line 237
    .line 238
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/core/data/BonusThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    check-cast v0, Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 245
    .line 246
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 247
    .line 248
    goto/16 :goto_0

    .line 249
    .line 250
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/RateLimited;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 251
    .line 252
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    check-cast v0, Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 257
    .line 258
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/core/data/RemainingBonus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 263
    .line 264
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    check-cast v0, Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 269
    .line 270
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 271
    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 283
    .line 284
    .line 285
    move-result v0

    .line 286
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 299
    .line 300
    .line 301
    move-result v0

    .line 302
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 315
    .line 316
    .line 317
    move-result v0

    .line 318
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :sswitch_14
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 323
    .line 324
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    .line 327
    move-result-object v0

    .line 328
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v0

    .line 332
    check-cast v0, Ljava/util/List;

    .line 333
    .line 334
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 339
    .line 340
    .line 341
    move-result v0

    .line 342
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 343
    .line 344
    goto/16 :goto_0

    .line 345
    .line 346
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 351
    .line 352
    goto/16 :goto_0

    .line 353
    .line 354
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 355
    .line 356
    .line 357
    move-result v0

    .line 358
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 363
    .line 364
    .line 365
    move-result v0

    .line 366
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 367
    .line 368
    goto/16 :goto_0

    .line 369
    .line 370
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 375
    .line 376
    goto/16 :goto_0

    .line 377
    .line 378
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 383
    .line 384
    goto/16 :goto_0

    .line 385
    .line 386
    :sswitch_1b
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 387
    .line 388
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 389
    .line 390
    .line 391
    move-result-object v0

    .line 392
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 393
    .line 394
    .line 395
    move-result-object v0

    .line 396
    check-cast v0, Ljava/util/List;

    .line 397
    .line 398
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 399
    .line 400
    goto/16 :goto_0

    .line 401
    .line 402
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 403
    .line 404
    .line 405
    move-result-object v0

    .line 406
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 407
    .line 408
    goto/16 :goto_0

    .line 409
    .line 410
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 411
    .line 412
    .line 413
    move-result v0

    .line 414
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 415
    .line 416
    goto/16 :goto_0

    .line 417
    .line 418
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 419
    .line 420
    .line 421
    move-result v0

    .line 422
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 423
    .line 424
    goto/16 :goto_0

    .line 425
    .line 426
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 427
    .line 428
    .line 429
    move-result-object v0

    .line 430
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 431
    .line 432
    goto/16 :goto_0

    .line 433
    .line 434
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 435
    .line 436
    .line 437
    move-result v0

    .line 438
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 439
    .line 440
    goto/16 :goto_0

    .line 441
    .line 442
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 443
    .line 444
    .line 445
    move-result v0

    .line 446
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 447
    .line 448
    goto/16 :goto_0

    .line 449
    .line 450
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 451
    .line 452
    .line 453
    move-result v0

    .line 454
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 455
    .line 456
    goto/16 :goto_0

    .line 457
    .line 458
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 459
    .line 460
    .line 461
    move-result v0

    .line 462
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 463
    .line 464
    goto/16 :goto_0

    .line 465
    .line 466
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 467
    .line 468
    .line 469
    move-result v0

    .line 470
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 471
    .line 472
    goto/16 :goto_0

    .line 473
    .line 474
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 475
    .line 476
    .line 477
    move-result v0

    .line 478
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 479
    .line 480
    goto/16 :goto_0

    .line 481
    .line 482
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 483
    .line 484
    .line 485
    move-result v0

    .line 486
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 487
    .line 488
    goto/16 :goto_0

    .line 489
    .line 490
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v0

    .line 494
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 495
    .line 496
    goto/16 :goto_0

    .line 497
    .line 498
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 499
    .line 500
    .line 501
    move-result v0

    .line 502
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 507
    .line 508
    .line 509
    move-result v0

    .line 510
    iput v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 511
    .line 512
    goto/16 :goto_0

    .line 513
    .line 514
    :sswitch_2a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v0

    .line 518
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 519
    .line 520
    goto/16 :goto_0

    .line 521
    .line 522
    :sswitch_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 523
    .line 524
    if-nez p1, :cond_c

    .line 525
    .line 526
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

    .line 527
    .line 528
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 529
    .line 530
    if-nez p1, :cond_d

    .line 531
    .line 532
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 533
    .line 534
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 535
    .line 536
    if-nez p1, :cond_e

    .line 537
    .line 538
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 539
    .line 540
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 541
    .line 542
    if-nez p1, :cond_f

    .line 543
    .line 544
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 545
    .line 546
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 547
    .line 548
    if-nez p1, :cond_10

    .line 549
    .line 550
    new-instance p1, Ljava/util/ArrayList;

    .line 551
    .line 552
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 553
    .line 554
    .line 555
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 556
    .line 557
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 558
    .line 559
    if-nez p1, :cond_11

    .line 560
    .line 561
    new-instance p1, Ljava/util/ArrayList;

    .line 562
    .line 563
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 564
    .line 565
    .line 566
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 567
    .line 568
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 569
    .line 570
    if-nez p1, :cond_12

    .line 571
    .line 572
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RemainingBonus;->new_()Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 573
    .line 574
    .line 575
    move-result-object p1

    .line 576
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 577
    .line 578
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 579
    .line 580
    if-nez p1, :cond_13

    .line 581
    .line 582
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RateLimited;->new_()Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 583
    .line 584
    .line 585
    move-result-object p1

    .line 586
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 587
    .line 588
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 589
    .line 590
    if-nez p1, :cond_14

    .line 591
    .line 592
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BonusThreshold;->new_()Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 593
    .line 594
    .line 595
    move-result-object p1

    .line 596
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 597
    .line 598
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 599
    .line 600
    if-nez p1, :cond_15

    .line 601
    .line 602
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 603
    .line 604
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 605
    .line 606
    if-nez p1, :cond_16

    .line 607
    .line 608
    new-instance p1, Ljava/util/ArrayList;

    .line 609
    .line 610
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 611
    .line 612
    .line 613
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 614
    .line 615
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 616
    .line 617
    if-nez p1, :cond_17

    .line 618
    .line 619
    invoke-static {}, Lcom/p1/mobile/putong/core/data/BuzzResolution;->new_()Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 620
    .line 621
    .line 622
    move-result-object p1

    .line 623
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 624
    .line 625
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 626
    .line 627
    if-nez p1, :cond_18

    .line 628
    .line 629
    new-instance p1, Ljava/util/ArrayList;

    .line 630
    .line 631
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 632
    .line 633
    .line 634
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 635
    .line 636
    :cond_18
    return-object p0

    .line 637
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_2b
        0xa -> :sswitch_2a
        0x10 -> :sswitch_29
        0x18 -> :sswitch_28
        0x22 -> :sswitch_27
        0x28 -> :sswitch_26
        0x30 -> :sswitch_25
        0x38 -> :sswitch_24
        0x40 -> :sswitch_23
        0x48 -> :sswitch_22
        0x50 -> :sswitch_21
        0x58 -> :sswitch_20
        0x62 -> :sswitch_1f
        0x68 -> :sswitch_1e
        0x70 -> :sswitch_1d
        0x7a -> :sswitch_1c
        0x82 -> :sswitch_1b
        0x88 -> :sswitch_1a
        0x90 -> :sswitch_19
        0x98 -> :sswitch_18
        0xa0 -> :sswitch_17
        0xa8 -> :sswitch_16
        0xb0 -> :sswitch_15
        0xba -> :sswitch_14
        0xc0 -> :sswitch_13
        0xc8 -> :sswitch_12
        0xd0 -> :sswitch_11
        0xd8 -> :sswitch_10
        0xe0 -> :sswitch_f
        0xe8 -> :sswitch_e
        0xf2 -> :sswitch_d
        0xfa -> :sswitch_c
        0x102 -> :sswitch_b
        0x108 -> :sswitch_a
        0x110 -> :sswitch_9
        0x118 -> :sswitch_8
        0x120 -> :sswitch_7
        0x128 -> :sswitch_6
        0x130 -> :sswitch_5
        0x13a -> :sswitch_4
        0x142 -> :sswitch_3
        0x14a -> :sswitch_2
        0x152 -> :sswitch_1
        0x158 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 637
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->userId:Ljava/lang/String;

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
    const/4 p0, 0x2

    .line 10
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->mcc:I

    .line 11
    .line 12
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 13
    .line 14
    .line 15
    const/4 p0, 0x3

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzToggle:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->conversationId:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    const/4 p0, 0x5

    .line 30
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzExhausted:Z

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x6

    .line 36
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isBoosted:Z

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 39
    .line 40
    .line 41
    const/4 p0, 0x7

    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVoiceBuzz:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    const/16 p0, 0x8

    .line 48
    .line 49
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingProlongCount:I

    .line 50
    .line 51
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 52
    .line 53
    .line 54
    const/16 p0, 0x9

    .line 55
    .line 56
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->matched:Z

    .line 57
    .line 58
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 59
    .line 60
    .line 61
    const/16 p0, 0xa

    .line 62
    .line 63
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->totalDuration:I

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 66
    .line 67
    .line 68
    const/16 p0, 0xb

    .line 69
    .line 70
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->prolongDuration:I

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzRTCVendor:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_2

    .line 78
    .line 79
    const/16 v0, 0xc

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_2
    const/16 p0, 0xd

    .line 85
    .line 86
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->isTextBuzzBoosted:Z

    .line 87
    .line 88
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 89
    .line 90
    .line 91
    const/16 p0, 0xe

    .line 92
    .line 93
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingVideoBuzz:I

    .line 94
    .line 95
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 96
    .line 97
    .line 98
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzRTCVendor:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz p0, :cond_3

    .line 101
    .line 102
    const/16 v0, 0xf

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 105
    .line 106
    .line 107
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->enabledBuzz:Ljava/util/List;

    .line 108
    .line 109
    if-eqz p0, :cond_4

    .line 110
    .line 111
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    const/16 v1, 0x10

    .line 118
    .line 119
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 120
    .line 121
    .line 122
    :cond_4
    const/16 p0, 0x11

    .line 123
    .line 124
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingTextBuzz:I

    .line 125
    .line 126
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 127
    .line 128
    .line 129
    const/16 p0, 0x12

    .line 130
    .line 131
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->textBuzzPairFailHintTimeout:I

    .line 132
    .line 133
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 134
    .line 135
    .line 136
    const/16 p0, 0x13

    .line 137
    .line 138
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzPairFailHintTimeout:I

    .line 139
    .line 140
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 141
    .line 142
    .line 143
    const/16 p0, 0x14

    .line 144
    .line 145
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzPairFailHintTimeout:I

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 148
    .line 149
    .line 150
    const/16 p0, 0x15

    .line 151
    .line 152
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzToggle:Z

    .line 153
    .line 154
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 155
    .line 156
    .line 157
    const/16 p0, 0x16

    .line 158
    .line 159
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzToggle:Z

    .line 160
    .line 161
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 162
    .line 163
    .line 164
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->showedPassiveModeBuzz:Ljava/util/List;

    .line 165
    .line 166
    if-eqz p0, :cond_5

    .line 167
    .line 168
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    const/16 v1, 0x17

    .line 175
    .line 176
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 177
    .line 178
    .line 179
    :cond_5
    const/16 p0, 0x18

    .line 180
    .line 181
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzConnectTimeout:I

    .line 182
    .line 183
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 184
    .line 185
    .line 186
    const/16 p0, 0x19

    .line 187
    .line 188
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzConnectTimeout:I

    .line 189
    .line 190
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 191
    .line 192
    .line 193
    const/16 p0, 0x1a

    .line 194
    .line 195
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzReactTimeout:I

    .line 196
    .line 197
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 198
    .line 199
    .line 200
    const/16 p0, 0x1b

    .line 201
    .line 202
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzReactTimeout:I

    .line 203
    .line 204
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 205
    .line 206
    .line 207
    const/16 p0, 0x1c

    .line 208
    .line 209
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->voiceBuzzWaitingTimeout:I

    .line 210
    .line 211
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 212
    .line 213
    .line 214
    const/16 p0, 0x1d

    .line 215
    .line 216
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->videoBuzzWaitingTimeout:I

    .line 217
    .line 218
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 219
    .line 220
    .line 221
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingBonus:Lcom/p1/mobile/putong/core/data/RemainingBonus;

    .line 222
    .line 223
    if-eqz p0, :cond_6

    .line 224
    .line 225
    const/16 v0, 0x1e

    .line 226
    .line 227
    sget-object v1, Lcom/p1/mobile/putong/core/data/RemainingBonus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 230
    .line 231
    .line 232
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->rateLimited:Lcom/p1/mobile/putong/core/data/RateLimited;

    .line 233
    .line 234
    if-eqz p0, :cond_7

    .line 235
    .line 236
    const/16 v0, 0x1f

    .line 237
    .line 238
    sget-object v1, Lcom/p1/mobile/putong/core/data/RateLimited;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 241
    .line 242
    .line 243
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusThreshold:Lcom/p1/mobile/putong/core/data/BonusThreshold;

    .line 244
    .line 245
    if-eqz p0, :cond_8

    .line 246
    .line 247
    const/16 v0, 0x20

    .line 248
    .line 249
    sget-object v1, Lcom/p1/mobile/putong/core/data/BonusThreshold;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 250
    .line 251
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 252
    .line 253
    .line 254
    :cond_8
    const/16 p0, 0x21

    .line 255
    .line 256
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzToggle:Z

    .line 257
    .line 258
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 259
    .line 260
    .line 261
    const/16 p0, 0x22

    .line 262
    .line 263
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzConnectTimeout:I

    .line 264
    .line 265
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 266
    .line 267
    .line 268
    const/16 p0, 0x23

    .line 269
    .line 270
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzPairFailHintTimeout:I

    .line 271
    .line 272
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 273
    .line 274
    .line 275
    const/16 p0, 0x24

    .line 276
    .line 277
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzReactTimeout:I

    .line 278
    .line 279
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 280
    .line 281
    .line 282
    const/16 p0, 0x25

    .line 283
    .line 284
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzWaitingTimeout:I

    .line 285
    .line 286
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 287
    .line 288
    .line 289
    const/16 p0, 0x26

    .line 290
    .line 291
    iget v0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->remainingMemojiBuzz:I

    .line 292
    .line 293
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 294
    .line 295
    .line 296
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->memojiBuzzRTCVendor:Ljava/lang/String;

    .line 297
    .line 298
    if-eqz p0, :cond_9

    .line 299
    .line 300
    const/16 v0, 0x27

    .line 301
    .line 302
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 303
    .line 304
    .line 305
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->allowedMCCSwitchList:Ljava/util/List;

    .line 306
    .line 307
    if-eqz p0, :cond_a

    .line 308
    .line 309
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 310
    .line 311
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 312
    .line 313
    .line 314
    move-result-object v0

    .line 315
    const/16 v1, 0x28

    .line 316
    .line 317
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 318
    .line 319
    .line 320
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->recommendResolution:Lcom/p1/mobile/putong/core/data/BuzzResolution;

    .line 321
    .line 322
    if-eqz p0, :cond_b

    .line 323
    .line 324
    const/16 v0, 0x29

    .line 325
    .line 326
    sget-object v1, Lcom/p1/mobile/putong/core/data/BuzzResolution;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 329
    .line 330
    .line 331
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->bonusEnabledBuzz:Ljava/util/List;

    .line 332
    .line 333
    if-eqz p0, :cond_c

    .line 334
    .line 335
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    .line 340
    move-result-object v0

    .line 341
    const/16 v1, 0x2a

    .line 342
    .line 343
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 344
    .line 345
    .line 346
    :cond_c
    const/16 p0, 0x2b

    .line 347
    .line 348
    iget-boolean p1, p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;->potentialPremium:Z

    .line 349
    .line 350
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 351
    .line 352
    .line 353
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 354
    check-cast p1, Lcom/p1/mobile/putong/core/data/LoveBuzzData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/LoveBuzzData$1;->serialize(Lcom/p1/mobile/putong/core/data/LoveBuzzData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
