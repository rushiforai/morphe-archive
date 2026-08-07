.class Lcom/p1/mobile/putong/core/data/ChatGroup$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatGroup;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ChatGroup;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ChatGroup;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 34
    .line 35
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    .line 38
    move-result-object v1

    .line 39
    const/16 v2, 0x34

    .line 40
    .line 41
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/16 v1, 0x35

    .line 51
    .line 52
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p0, v0

    .line 57
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 58
    .line 59
    if-eqz v0, :cond_4

    .line 60
    .line 61
    const/16 v1, 0x36

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/16 v1, 0x37

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v0, :cond_6

    .line 86
    .line 87
    const/16 v1, 0x38

    .line 88
    .line 89
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 95
    .line 96
    if-eqz v0, :cond_7

    .line 97
    .line 98
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    .line 103
    move-result-object v1

    .line 104
    const/16 v2, 0x39

    .line 105
    .line 106
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz v0, :cond_8

    .line 114
    .line 115
    const/16 v1, 0x3a

    .line 116
    .line 117
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 123
    .line 124
    if-eqz v0, :cond_9

    .line 125
    .line 126
    const/16 v1, 0x3b

    .line 127
    .line 128
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 133
    .line 134
    .line 135
    move-result v0

    .line 136
    add-int/2addr p0, v0

    .line 137
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 138
    .line 139
    if-eqz v0, :cond_a

    .line 140
    .line 141
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    .line 146
    move-result-object v1

    .line 147
    const/16 v2, 0x3c

    .line 148
    .line 149
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    :cond_a
    const/16 v0, 0x3d

    .line 155
    .line 156
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 157
    .line 158
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    add-int/2addr p0, v0

    .line 163
    const/16 v0, 0x3e

    .line 164
    .line 165
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 166
    .line 167
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    add-int/2addr p0, v0

    .line 172
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 173
    .line 174
    if-eqz v0, :cond_b

    .line 175
    .line 176
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    const/16 v2, 0x3f

    .line 183
    .line 184
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_b
    const/16 v0, 0x40

    .line 190
    .line 191
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 192
    .line 193
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    add-int/2addr p0, v0

    .line 198
    const/16 v0, 0x41

    .line 199
    .line 200
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 201
    .line 202
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    add-int/2addr p0, v0

    .line 207
    const/16 v0, 0x42

    .line 208
    .line 209
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 210
    .line 211
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 212
    .line 213
    .line 214
    move-result v0

    .line 215
    add-int/2addr p0, v0

    .line 216
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 217
    .line 218
    if-eqz v0, :cond_c

    .line 219
    .line 220
    const/16 v1, 0x43

    .line 221
    .line 222
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    add-int/2addr p0, v0

    .line 227
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 228
    .line 229
    if-eqz v0, :cond_d

    .line 230
    .line 231
    const/16 v1, 0x44

    .line 232
    .line 233
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 234
    .line 235
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 236
    .line 237
    .line 238
    move-result v0

    .line 239
    add-int/2addr p0, v0

    .line 240
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 241
    .line 242
    if-eqz v0, :cond_e

    .line 243
    .line 244
    const/16 v1, 0x45

    .line 245
    .line 246
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 247
    .line 248
    .line 249
    move-result v0

    .line 250
    add-int/2addr p0, v0

    .line 251
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 252
    .line 253
    if-eqz v0, :cond_f

    .line 254
    .line 255
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 256
    .line 257
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 258
    .line 259
    .line 260
    move-result-object v1

    .line 261
    const/16 v2, 0x46

    .line 262
    .line 263
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 264
    .line 265
    .line 266
    move-result v0

    .line 267
    add-int/2addr p0, v0

    .line 268
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 269
    .line 270
    if-eqz v0, :cond_10

    .line 271
    .line 272
    const/16 v1, 0x47

    .line 273
    .line 274
    sget-object v2, Lcom/p1/mobile/putong/core/data/GroupApply;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 275
    .line 276
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 277
    .line 278
    .line 279
    move-result v0

    .line 280
    add-int/2addr p0, v0

    .line 281
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 282
    .line 283
    if-eqz v0, :cond_11

    .line 284
    .line 285
    const/16 v1, 0x48

    .line 286
    .line 287
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 288
    .line 289
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 290
    .line 291
    .line 292
    move-result v0

    .line 293
    add-int/2addr p0, v0

    .line 294
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 295
    .line 296
    if-eqz v0, :cond_12

    .line 297
    .line 298
    const/16 v1, 0x49

    .line 299
    .line 300
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatPunishment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 301
    .line 302
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 303
    .line 304
    .line 305
    move-result v0

    .line 306
    add-int/2addr p0, v0

    .line 307
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 308
    .line 309
    if-eqz v0, :cond_13

    .line 310
    .line 311
    const/16 v1, 0x4a

    .line 312
    .line 313
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 314
    .line 315
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 316
    .line 317
    .line 318
    move-result v0

    .line 319
    add-int/2addr p0, v0

    .line 320
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 321
    .line 322
    if-eqz v0, :cond_14

    .line 323
    .line 324
    const/16 v1, 0x4b

    .line 325
    .line 326
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 327
    .line 328
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    add-int/2addr p0, v0

    .line 333
    :cond_14
    const/16 v0, 0x4c

    .line 334
    .line 335
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 336
    .line 337
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 338
    .line 339
    .line 340
    move-result v0

    .line 341
    add-int/2addr p0, v0

    .line 342
    const/16 v0, 0x4d

    .line 343
    .line 344
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 345
    .line 346
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    add-int/2addr p0, v0

    .line 351
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 352
    .line 353
    if-eqz v0, :cond_15

    .line 354
    .line 355
    const/16 v1, 0x4e

    .line 356
    .line 357
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    add-int/2addr p0, v0

    .line 362
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 363
    .line 364
    if-eqz v0, :cond_16

    .line 365
    .line 366
    const/16 v1, 0x4f

    .line 367
    .line 368
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    add-int/2addr p0, v0

    .line 373
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 374
    .line 375
    if-eqz v0, :cond_17

    .line 376
    .line 377
    const/16 v1, 0x50

    .line 378
    .line 379
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 380
    .line 381
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 382
    .line 383
    .line 384
    move-result v0

    .line 385
    add-int/2addr p0, v0

    .line 386
    :cond_17
    const/16 v0, 0x51

    .line 387
    .line 388
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 389
    .line 390
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 391
    .line 392
    .line 393
    move-result v0

    .line 394
    add-int/2addr p0, v0

    .line 395
    const/16 v0, 0x52

    .line 396
    .line 397
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 398
    .line 399
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 400
    .line 401
    .line 402
    move-result v0

    .line 403
    add-int/2addr p0, v0

    .line 404
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 405
    .line 406
    if-eqz v0, :cond_18

    .line 407
    .line 408
    const/16 v1, 0x53

    .line 409
    .line 410
    sget-object v2, Lcom/p1/mobile/putong/core/data/JoinCondition;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 411
    .line 412
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 413
    .line 414
    .line 415
    move-result v0

    .line 416
    add-int/2addr p0, v0

    .line 417
    :cond_18
    const/16 v0, 0x54

    .line 418
    .line 419
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 420
    .line 421
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 422
    .line 423
    .line 424
    move-result v0

    .line 425
    add-int/2addr p0, v0

    .line 426
    const/16 v0, 0x55

    .line 427
    .line 428
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 429
    .line 430
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 431
    .line 432
    .line 433
    move-result v0

    .line 434
    add-int/2addr p0, v0

    .line 435
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 436
    .line 437
    if-eqz v0, :cond_19

    .line 438
    .line 439
    const/16 v1, 0x56

    .line 440
    .line 441
    sget-object v2, Lcom/p1/mobile/putong/core/data/Permissions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 442
    .line 443
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 444
    .line 445
    .line 446
    move-result v0

    .line 447
    add-int/2addr p0, v0

    .line 448
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 449
    .line 450
    if-eqz v0, :cond_1a

    .line 451
    .line 452
    const/16 v1, 0x57

    .line 453
    .line 454
    sget-object v2, Lcom/p1/mobile/putong/core/data/InModeration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 455
    .line 456
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 457
    .line 458
    .line 459
    move-result v0

    .line 460
    add-int/2addr p0, v0

    .line 461
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 462
    .line 463
    if-eqz v0, :cond_1b

    .line 464
    .line 465
    const/16 v1, 0x58

    .line 466
    .line 467
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 468
    .line 469
    .line 470
    move-result v0

    .line 471
    add-int/2addr p0, v0

    .line 472
    :cond_1b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 473
    .line 474
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 475
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroup$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ChatGroup;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ChatGroup;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatGroup;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatGroup;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    const-string v4, ""

    .line 14
    .line 15
    sparse-switch v3, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    new-instance p1, Ljava/util/ArrayList;

    .line 69
    .line 70
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 71
    .line 72
    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 74
    .line 75
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_4

    .line 78
    .line 79
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 80
    .line 81
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 82
    .line 83
    if-nez p1, :cond_5

    .line 84
    .line 85
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 86
    .line 87
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 88
    .line 89
    .line 90
    move-result-object p1

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 94
    .line 95
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 96
    .line 97
    if-nez p1, :cond_6

    .line 98
    .line 99
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 100
    .line 101
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 102
    .line 103
    if-nez p1, :cond_7

    .line 104
    .line 105
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 106
    .line 107
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 108
    .line 109
    if-nez p1, :cond_8

    .line 110
    .line 111
    new-instance p1, Ljava/util/ArrayList;

    .line 112
    .line 113
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 114
    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 117
    .line 118
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 119
    .line 120
    if-nez p1, :cond_9

    .line 121
    .line 122
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 123
    .line 124
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 125
    .line 126
    if-nez p1, :cond_a

    .line 127
    .line 128
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 129
    .line 130
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 135
    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 137
    .line 138
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 139
    .line 140
    if-nez p1, :cond_b

    .line 141
    .line 142
    new-instance p1, Ljava/util/ArrayList;

    .line 143
    .line 144
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 145
    .line 146
    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 148
    .line 149
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 150
    .line 151
    if-nez p1, :cond_c

    .line 152
    .line 153
    new-instance p1, Ljava/util/ArrayList;

    .line 154
    .line 155
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 156
    .line 157
    .line 158
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 159
    .line 160
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 161
    .line 162
    if-nez p1, :cond_d

    .line 163
    .line 164
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 165
    .line 166
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 167
    .line 168
    if-nez p1, :cond_e

    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 175
    .line 176
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_f

    .line 179
    .line 180
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 181
    .line 182
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 183
    .line 184
    if-nez p1, :cond_10

    .line 185
    .line 186
    new-instance p1, Ljava/util/ArrayList;

    .line 187
    .line 188
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 189
    .line 190
    .line 191
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 192
    .line 193
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 194
    .line 195
    if-nez p1, :cond_11

    .line 196
    .line 197
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GroupApply;->new_()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 198
    .line 199
    .line 200
    move-result-object p1

    .line 201
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 202
    .line 203
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 204
    .line 205
    if-nez p1, :cond_12

    .line 206
    .line 207
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 208
    .line 209
    .line 210
    move-result-object p1

    .line 211
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 212
    .line 213
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 214
    .line 215
    if-nez p1, :cond_13

    .line 216
    .line 217
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->new_()Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 218
    .line 219
    .line 220
    move-result-object p1

    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 222
    .line 223
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 224
    .line 225
    if-nez p1, :cond_14

    .line 226
    .line 227
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 228
    .line 229
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 230
    .line 231
    if-nez p1, :cond_15

    .line 232
    .line 233
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 234
    .line 235
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 236
    .line 237
    if-nez p1, :cond_16

    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 244
    .line 245
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 246
    .line 247
    if-nez p1, :cond_17

    .line 248
    .line 249
    sget-object p1, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 250
    .line 251
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    check-cast p1, Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 256
    .line 257
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 258
    .line 259
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 260
    .line 261
    if-nez p1, :cond_18

    .line 262
    .line 263
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Permissions;->new_()Lcom/p1/mobile/putong/core/data/Permissions;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 268
    .line 269
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 270
    .line 271
    if-nez p1, :cond_19

    .line 272
    .line 273
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 274
    .line 275
    .line 276
    move-result-object p1

    .line 277
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 278
    .line 279
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 280
    .line 281
    if-nez p1, :cond_34

    .line 282
    .line 283
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 284
    .line 285
    return-object p0

    .line 286
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v3

    .line 290
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/InModeration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 295
    .line 296
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 297
    .line 298
    .line 299
    move-result-object v3

    .line 300
    check-cast v3, Lcom/p1/mobile/putong/core/data/InModeration;

    .line 301
    .line 302
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/core/data/Permissions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 307
    .line 308
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v3

    .line 312
    check-cast v3, Lcom/p1/mobile/putong/core/data/Permissions;

    .line 313
    .line 314
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 319
    .line 320
    .line 321
    move-result v3

    .line 322
    iput v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 323
    .line 324
    goto/16 :goto_0

    .line 325
    .line 326
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 327
    .line 328
    .line 329
    move-result v3

    .line 330
    iput v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :sswitch_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/JoinCondition;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 335
    .line 336
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 337
    .line 338
    .line 339
    move-result-object v3

    .line 340
    check-cast v3, Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 341
    .line 342
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 343
    .line 344
    goto/16 :goto_0

    .line 345
    .line 346
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 347
    .line 348
    .line 349
    move-result-wide v3

    .line 350
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 351
    .line 352
    goto/16 :goto_0

    .line 353
    .line 354
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 355
    .line 356
    .line 357
    move-result v3

    .line 358
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :sswitch_8
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 363
    .line 364
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v3

    .line 368
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 369
    .line 370
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 371
    .line 372
    goto/16 :goto_0

    .line 373
    .line 374
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v3

    .line 378
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 379
    .line 380
    goto/16 :goto_0

    .line 381
    .line 382
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 383
    .line 384
    .line 385
    move-result-object v3

    .line 386
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 387
    .line 388
    goto/16 :goto_0

    .line 389
    .line 390
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 391
    .line 392
    .line 393
    move-result v3

    .line 394
    iput v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 395
    .line 396
    goto/16 :goto_0

    .line 397
    .line 398
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 399
    .line 400
    .line 401
    move-result-wide v3

    .line 402
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 403
    .line 404
    goto/16 :goto_0

    .line 405
    .line 406
    :sswitch_d
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 407
    .line 408
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object v3

    .line 412
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 413
    .line 414
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 415
    .line 416
    goto/16 :goto_0

    .line 417
    .line 418
    :sswitch_e
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 419
    .line 420
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 421
    .line 422
    .line 423
    move-result-object v3

    .line 424
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 425
    .line 426
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 427
    .line 428
    goto/16 :goto_0

    .line 429
    .line 430
    :sswitch_f
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatPunishment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 431
    .line 432
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 433
    .line 434
    .line 435
    move-result-object v3

    .line 436
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 437
    .line 438
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 439
    .line 440
    goto/16 :goto_0

    .line 441
    .line 442
    :sswitch_10
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 443
    .line 444
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 445
    .line 446
    .line 447
    move-result-object v3

    .line 448
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 449
    .line 450
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 451
    .line 452
    goto/16 :goto_0

    .line 453
    .line 454
    :sswitch_11
    sget-object v3, Lcom/p1/mobile/putong/core/data/GroupApply;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 455
    .line 456
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 457
    .line 458
    .line 459
    move-result-object v3

    .line 460
    check-cast v3, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 461
    .line 462
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 463
    .line 464
    goto/16 :goto_0

    .line 465
    .line 466
    :sswitch_12
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 467
    .line 468
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 469
    .line 470
    .line 471
    move-result-object v3

    .line 472
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 473
    .line 474
    .line 475
    move-result-object v3

    .line 476
    check-cast v3, Ljava/util/List;

    .line 477
    .line 478
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 479
    .line 480
    goto/16 :goto_0

    .line 481
    .line 482
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v3

    .line 486
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 487
    .line 488
    goto/16 :goto_0

    .line 489
    .line 490
    :sswitch_14
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 491
    .line 492
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 493
    .line 494
    .line 495
    move-result-object v3

    .line 496
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 497
    .line 498
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 499
    .line 500
    goto/16 :goto_0

    .line 501
    .line 502
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 503
    .line 504
    .line 505
    move-result-object v3

    .line 506
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 507
    .line 508
    goto/16 :goto_0

    .line 509
    .line 510
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 511
    .line 512
    .line 513
    move-result v3

    .line 514
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 515
    .line 516
    goto/16 :goto_0

    .line 517
    .line 518
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 519
    .line 520
    .line 521
    move-result-wide v3

    .line 522
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 523
    .line 524
    goto/16 :goto_0

    .line 525
    .line 526
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 527
    .line 528
    .line 529
    move-result-wide v3

    .line 530
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 531
    .line 532
    goto/16 :goto_0

    .line 533
    .line 534
    :sswitch_19
    sget-object v3, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 535
    .line 536
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 537
    .line 538
    .line 539
    move-result-object v3

    .line 540
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 541
    .line 542
    .line 543
    move-result-object v3

    .line 544
    check-cast v3, Ljava/util/List;

    .line 545
    .line 546
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 547
    .line 548
    goto/16 :goto_0

    .line 549
    .line 550
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 551
    .line 552
    .line 553
    move-result v3

    .line 554
    iput v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 555
    .line 556
    goto/16 :goto_0

    .line 557
    .line 558
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 559
    .line 560
    .line 561
    move-result v3

    .line 562
    iput v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 563
    .line 564
    goto/16 :goto_0

    .line 565
    .line 566
    :sswitch_1c
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 567
    .line 568
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 569
    .line 570
    .line 571
    move-result-object v3

    .line 572
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 573
    .line 574
    .line 575
    move-result-object v3

    .line 576
    check-cast v3, Ljava/util/List;

    .line 577
    .line 578
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 579
    .line 580
    goto/16 :goto_0

    .line 581
    .line 582
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 583
    .line 584
    .line 585
    move-result v2

    .line 586
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 587
    .line 588
    .line 589
    move-result-object v2

    .line 590
    goto/16 :goto_0

    .line 591
    .line 592
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 593
    .line 594
    .line 595
    move-result-object v3

    .line 596
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 597
    .line 598
    goto/16 :goto_0

    .line 599
    .line 600
    :sswitch_1f
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 601
    .line 602
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 603
    .line 604
    .line 605
    move-result-object v3

    .line 606
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 607
    .line 608
    .line 609
    move-result-object v3

    .line 610
    check-cast v3, Ljava/util/List;

    .line 611
    .line 612
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 613
    .line 614
    goto/16 :goto_0

    .line 615
    .line 616
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 617
    .line 618
    .line 619
    move-result-object v3

    .line 620
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 621
    .line 622
    goto/16 :goto_0

    .line 623
    .line 624
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 625
    .line 626
    .line 627
    move-result-object v3

    .line 628
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 629
    .line 630
    goto/16 :goto_0

    .line 631
    .line 632
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 633
    .line 634
    .line 635
    move-result v1

    .line 636
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 637
    .line 638
    .line 639
    move-result-object v1

    .line 640
    goto/16 :goto_0

    .line 641
    .line 642
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 643
    .line 644
    .line 645
    move-result-object v3

    .line 646
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 647
    .line 648
    goto/16 :goto_0

    .line 649
    .line 650
    :sswitch_24
    sget-object v3, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 651
    .line 652
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 653
    .line 654
    .line 655
    move-result-object v3

    .line 656
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 657
    .line 658
    .line 659
    move-result-object v3

    .line 660
    check-cast v3, Ljava/util/List;

    .line 661
    .line 662
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 663
    .line 664
    goto/16 :goto_0

    .line 665
    .line 666
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 667
    .line 668
    .line 669
    move-result-object v3

    .line 670
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 671
    .line 672
    goto/16 :goto_0

    .line 673
    .line 674
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 675
    .line 676
    .line 677
    move-result-object v3

    .line 678
    iput-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 679
    .line 680
    goto/16 :goto_0

    .line 681
    .line 682
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 683
    .line 684
    .line 685
    move-result-wide v3

    .line 686
    iput-wide v3, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 687
    .line 688
    goto/16 :goto_0

    .line 689
    .line 690
    :sswitch_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 691
    .line 692
    if-nez p1, :cond_1a

    .line 693
    .line 694
    if-eqz v1, :cond_1a

    .line 695
    .line 696
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 697
    .line 698
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 699
    .line 700
    .line 701
    move-result v1

    .line 702
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 703
    .line 704
    .line 705
    move-result-object p1

    .line 706
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 707
    .line 708
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 709
    .line 710
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 711
    .line 712
    if-nez p1, :cond_1b

    .line 713
    .line 714
    if-eqz v2, :cond_1b

    .line 715
    .line 716
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 717
    .line 718
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 719
    .line 720
    .line 721
    move-result v1

    .line 722
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 723
    .line 724
    .line 725
    move-result-object p1

    .line 726
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 727
    .line 728
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 729
    .line 730
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 731
    .line 732
    if-nez p1, :cond_1c

    .line 733
    .line 734
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 735
    .line 736
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 737
    .line 738
    if-nez p1, :cond_1d

    .line 739
    .line 740
    new-instance p1, Ljava/util/ArrayList;

    .line 741
    .line 742
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 743
    .line 744
    .line 745
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 746
    .line 747
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 748
    .line 749
    if-nez p1, :cond_1e

    .line 750
    .line 751
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 752
    .line 753
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 754
    .line 755
    if-nez p1, :cond_1f

    .line 756
    .line 757
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 758
    .line 759
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 760
    .line 761
    .line 762
    move-result-object p1

    .line 763
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 764
    .line 765
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 766
    .line 767
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 768
    .line 769
    if-nez p1, :cond_20

    .line 770
    .line 771
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 772
    .line 773
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 774
    .line 775
    if-nez p1, :cond_21

    .line 776
    .line 777
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 778
    .line 779
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 780
    .line 781
    if-nez p1, :cond_22

    .line 782
    .line 783
    new-instance p1, Ljava/util/ArrayList;

    .line 784
    .line 785
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 786
    .line 787
    .line 788
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 789
    .line 790
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 791
    .line 792
    if-nez p1, :cond_23

    .line 793
    .line 794
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 795
    .line 796
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 797
    .line 798
    if-nez p1, :cond_24

    .line 799
    .line 800
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 801
    .line 802
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 803
    .line 804
    .line 805
    move-result-object p1

    .line 806
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 807
    .line 808
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 809
    .line 810
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 811
    .line 812
    if-nez p1, :cond_25

    .line 813
    .line 814
    new-instance p1, Ljava/util/ArrayList;

    .line 815
    .line 816
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 817
    .line 818
    .line 819
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 820
    .line 821
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 822
    .line 823
    if-nez p1, :cond_26

    .line 824
    .line 825
    new-instance p1, Ljava/util/ArrayList;

    .line 826
    .line 827
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 828
    .line 829
    .line 830
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 831
    .line 832
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 833
    .line 834
    if-nez p1, :cond_27

    .line 835
    .line 836
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 837
    .line 838
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 839
    .line 840
    if-nez p1, :cond_28

    .line 841
    .line 842
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 843
    .line 844
    .line 845
    move-result-object p1

    .line 846
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 847
    .line 848
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 849
    .line 850
    if-nez p1, :cond_29

    .line 851
    .line 852
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 853
    .line 854
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 855
    .line 856
    if-nez p1, :cond_2a

    .line 857
    .line 858
    new-instance p1, Ljava/util/ArrayList;

    .line 859
    .line 860
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 861
    .line 862
    .line 863
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 864
    .line 865
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 866
    .line 867
    if-nez p1, :cond_2b

    .line 868
    .line 869
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GroupApply;->new_()Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 870
    .line 871
    .line 872
    move-result-object p1

    .line 873
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 874
    .line 875
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 876
    .line 877
    if-nez p1, :cond_2c

    .line 878
    .line 879
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 880
    .line 881
    .line 882
    move-result-object p1

    .line 883
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 884
    .line 885
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 886
    .line 887
    if-nez p1, :cond_2d

    .line 888
    .line 889
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatPunishment;->new_()Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 890
    .line 891
    .line 892
    move-result-object p1

    .line 893
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 894
    .line 895
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 896
    .line 897
    if-nez p1, :cond_2e

    .line 898
    .line 899
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 900
    .line 901
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 902
    .line 903
    if-nez p1, :cond_2f

    .line 904
    .line 905
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 906
    .line 907
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 908
    .line 909
    if-nez p1, :cond_30

    .line 910
    .line 911
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 912
    .line 913
    .line 914
    move-result-object p1

    .line 915
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 916
    .line 917
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 918
    .line 919
    if-nez p1, :cond_31

    .line 920
    .line 921
    sget-object p1, Lcom/p1/mobile/putong/core/data/JoinCondition;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 922
    .line 923
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 924
    .line 925
    .line 926
    move-result-object p1

    .line 927
    check-cast p1, Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 928
    .line 929
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 930
    .line 931
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 932
    .line 933
    if-nez p1, :cond_32

    .line 934
    .line 935
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Permissions;->new_()Lcom/p1/mobile/putong/core/data/Permissions;

    .line 936
    .line 937
    .line 938
    move-result-object p1

    .line 939
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 940
    .line 941
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 942
    .line 943
    if-nez p1, :cond_33

    .line 944
    .line 945
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 946
    .line 947
    .line 948
    move-result-object p1

    .line 949
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 950
    .line 951
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 952
    .line 953
    if-nez p1, :cond_34

    .line 954
    .line 955
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 956
    .line 957
    :cond_34
    return-object p0

    .line 958
    nop

    .line 959
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_28
        0x8 -> :sswitch_27
        0x12 -> :sswitch_26
        0x19a -> :sswitch_25
        0x1a2 -> :sswitch_24
        0x1aa -> :sswitch_23
        0x1b0 -> :sswitch_22
        0x1ba -> :sswitch_21
        0x1c2 -> :sswitch_20
        0x1ca -> :sswitch_1f
        0x1d2 -> :sswitch_1e
        0x1d8 -> :sswitch_1d
        0x1e2 -> :sswitch_1c
        0x1e8 -> :sswitch_1b
        0x1f0 -> :sswitch_1a
        0x1fa -> :sswitch_19
        0x201 -> :sswitch_18
        0x209 -> :sswitch_17
        0x210 -> :sswitch_16
        0x21a -> :sswitch_15
        0x222 -> :sswitch_14
        0x22a -> :sswitch_13
        0x232 -> :sswitch_12
        0x23a -> :sswitch_11
        0x242 -> :sswitch_10
        0x24a -> :sswitch_f
        0x252 -> :sswitch_e
        0x25a -> :sswitch_d
        0x260 -> :sswitch_c
        0x268 -> :sswitch_b
        0x272 -> :sswitch_a
        0x27a -> :sswitch_9
        0x282 -> :sswitch_8
        0x288 -> :sswitch_7
        0x290 -> :sswitch_6
        0x29a -> :sswitch_5
        0x2a0 -> :sswitch_4
        0x2a8 -> :sswitch_3
        0x2b2 -> :sswitch_2
        0x2ba -> :sswitch_1
        0x2c2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 959
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroup$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ChatGroup;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->avatars:Ljava/util/List;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    .line 33
    move-result-object v0

    .line 34
    const/16 v1, 0x34

    .line 35
    .line 36
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->announcement:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_3

    .line 42
    .line 43
    const/16 v0, 0x35

    .line 44
    .line 45
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 46
    .line 47
    .line 48
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 49
    .line 50
    if-eqz p0, :cond_4

    .line 51
    .line 52
    const/16 v0, 0x36

    .line 53
    .line 54
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 55
    .line 56
    .line 57
    move-result p0

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 59
    .line 60
    .line 61
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localConId:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/16 v0, 0x37

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->ownerUserId:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    const/16 v0, 0x38

    .line 75
    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminUserIds:Ljava/util/List;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    .line 88
    move-result-object v0

    .line 89
    const/16 v1, 0x39

    .line 90
    .line 91
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 92
    .line 93
    .line 94
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->creatorUserId:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz p0, :cond_8

    .line 97
    .line 98
    const/16 v0, 0x3a

    .line 99
    .line 100
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 104
    .line 105
    if-eqz p0, :cond_9

    .line 106
    .line 107
    const/16 v0, 0x3b

    .line 108
    .line 109
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 110
    .line 111
    .line 112
    move-result p0

    .line 113
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 114
    .line 115
    .line 116
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberIds:Ljava/util/List;

    .line 117
    .line 118
    if-eqz p0, :cond_a

    .line 119
    .line 120
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    const/16 v1, 0x3c

    .line 127
    .line 128
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 129
    .line 130
    .line 131
    :cond_a
    const/16 p0, 0x3d

    .line 132
    .line 133
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberCount:I

    .line 134
    .line 135
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 136
    .line 137
    .line 138
    const/16 p0, 0x3e

    .line 139
    .line 140
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberLimit:I

    .line 141
    .line 142
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 143
    .line 144
    .line 145
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->memberStatistics:Ljava/util/List;

    .line 146
    .line 147
    if-eqz p0, :cond_b

    .line 148
    .line 149
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupMemberStatistic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    const/16 v1, 0x3f

    .line 156
    .line 157
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 158
    .line 159
    .line 160
    :cond_b
    const/16 p0, 0x40

    .line 161
    .line 162
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->createdTime:D

    .line 163
    .line 164
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 165
    .line 166
    .line 167
    const/16 p0, 0x41

    .line 168
    .line 169
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->updatedTime:D

    .line 170
    .line 171
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 172
    .line 173
    .line 174
    const/16 p0, 0x42

    .line 175
    .line 176
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->localMembersLoaded:Z

    .line 177
    .line 178
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 179
    .line 180
    .line 181
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->publicId:Ljava/lang/String;

    .line 182
    .line 183
    if-eqz p0, :cond_c

    .line 184
    .line 185
    const/16 v0, 0x43

    .line 186
    .line 187
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 188
    .line 189
    .line 190
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->category:Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;

    .line 191
    .line 192
    if-eqz p0, :cond_d

    .line 193
    .line 194
    const/16 v0, 0x44

    .line 195
    .line 196
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupCateGory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 199
    .line 200
    .line 201
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->description:Ljava/lang/String;

    .line 202
    .line 203
    if-eqz p0, :cond_e

    .line 204
    .line 205
    const/16 v0, 0x45

    .line 206
    .line 207
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->tags:Ljava/util/List;

    .line 211
    .line 212
    if-eqz p0, :cond_f

    .line 213
    .line 214
    sget-object v0, Lcom/p1/mobile/putong/core/data/ChatGroupTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 215
    .line 216
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 217
    .line 218
    .line 219
    move-result-object v0

    .line 220
    const/16 v1, 0x46

    .line 221
    .line 222
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 223
    .line 224
    .line 225
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupApply:Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 226
    .line 227
    if-eqz p0, :cond_10

    .line 228
    .line 229
    const/16 v0, 0x47

    .line 230
    .line 231
    sget-object v1, Lcom/p1/mobile/putong/core/data/GroupApply;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 232
    .line 233
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 234
    .line 235
    .line 236
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 237
    .line 238
    if-eqz p0, :cond_11

    .line 239
    .line 240
    const/16 v0, 0x48

    .line 241
    .line 242
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 245
    .line 246
    .line 247
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->punishment:Lcom/p1/mobile/putong/core/data/ChatPunishment;

    .line 248
    .line 249
    if-eqz p0, :cond_12

    .line 250
    .line 251
    const/16 v0, 0x49

    .line 252
    .line 253
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatPunishment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    .line 255
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 256
    .line 257
    .line 258
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->status:Lcom/p1/mobile/putong/core/data/ChatGroupStatus;

    .line 259
    .line 260
    if-eqz p0, :cond_13

    .line 261
    .line 262
    const/16 v0, 0x4a

    .line 263
    .line 264
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 265
    .line 266
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 267
    .line 268
    .line 269
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupType:Lcom/p1/mobile/putong/core/data/ChatGroupType;

    .line 270
    .line 271
    if-eqz p0, :cond_14

    .line 272
    .line 273
    const/16 v0, 0x4b

    .line 274
    .line 275
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 276
    .line 277
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 278
    .line 279
    .line 280
    :cond_14
    const/16 p0, 0x4c

    .line 281
    .line 282
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->expiredTime:J

    .line 283
    .line 284
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 285
    .line 286
    .line 287
    const/16 p0, 0x4d

    .line 288
    .line 289
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinRemainedTime:I

    .line 290
    .line 291
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 292
    .line 293
    .line 294
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->source:Ljava/lang/String;

    .line 295
    .line 296
    if-eqz p0, :cond_15

    .line 297
    .line 298
    const/16 v0, 0x4e

    .line 299
    .line 300
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 301
    .line 302
    .line 303
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->token:Ljava/lang/String;

    .line 304
    .line 305
    if-eqz p0, :cond_16

    .line 306
    .line 307
    const/16 v0, 0x4f

    .line 308
    .line 309
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 310
    .line 311
    .line 312
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->groupTopic:Lcom/p1/mobile/putong/core/data/ChatGroupTopic;

    .line 313
    .line 314
    if-eqz p0, :cond_17

    .line 315
    .line 316
    const/16 v0, 0x50

    .line 317
    .line 318
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 319
    .line 320
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 321
    .line 322
    .line 323
    :cond_17
    const/16 p0, 0x51

    .line 324
    .line 325
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->upgraded:Z

    .line 326
    .line 327
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 328
    .line 329
    .line 330
    const/16 p0, 0x52

    .line 331
    .line 332
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->duration:J

    .line 333
    .line 334
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 335
    .line 336
    .line 337
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->joinCondition:Lcom/p1/mobile/putong/core/data/JoinCondition;

    .line 338
    .line 339
    if-eqz p0, :cond_18

    .line 340
    .line 341
    const/16 v0, 0x53

    .line 342
    .line 343
    sget-object v1, Lcom/p1/mobile/putong/core/data/JoinCondition;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 344
    .line 345
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 346
    .line 347
    .line 348
    :cond_18
    const/16 p0, 0x54

    .line 349
    .line 350
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->onlineCount:I

    .line 351
    .line 352
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 353
    .line 354
    .line 355
    const/16 p0, 0x55

    .line 356
    .line 357
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->adminLimit:I

    .line 358
    .line 359
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 360
    .line 361
    .line 362
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->permissions:Lcom/p1/mobile/putong/core/data/Permissions;

    .line 363
    .line 364
    if-eqz p0, :cond_19

    .line 365
    .line 366
    const/16 v0, 0x56

    .line 367
    .line 368
    sget-object v1, Lcom/p1/mobile/putong/core/data/Permissions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 369
    .line 370
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 371
    .line 372
    .line 373
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 374
    .line 375
    if-eqz p0, :cond_1a

    .line 376
    .line 377
    const/16 v0, 0x57

    .line 378
    .line 379
    sget-object v1, Lcom/p1/mobile/putong/core/data/InModeration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 380
    .line 381
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 382
    .line 383
    .line 384
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroup;->shareToken:Ljava/lang/String;

    .line 385
    .line 386
    if-eqz p0, :cond_1b

    .line 387
    .line 388
    const/16 p1, 0x58

    .line 389
    .line 390
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 391
    .line 392
    .line 393
    :cond_1b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 394
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroup;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroup$1;->serialize(Lcom/p1/mobile/putong/core/data/ChatGroup;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
