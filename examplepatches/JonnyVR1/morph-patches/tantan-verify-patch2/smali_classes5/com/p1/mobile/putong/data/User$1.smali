.class Lcom/p1/mobile/putong/data/User$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/User;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/User;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/User;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x34

    .line 34
    .line 35
    sget-object v2, Lcom/p1/mobile/putong/data/Location;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/16 v1, 0x35

    .line 47
    .line 48
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/2addr p0, v0

    .line 53
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    const/16 v1, 0x36

    .line 58
    .line 59
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    .line 77
    move-result-object v1

    .line 78
    const/16 v2, 0x37

    .line 79
    .line 80
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_5
    const/16 v0, 0x38

    .line 86
    .line 87
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 88
    .line 89
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 95
    .line 96
    if-eqz v0, :cond_6

    .line 97
    .line 98
    const/16 v1, 0x39

    .line 99
    .line 100
    sget-object v2, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 108
    .line 109
    if-eqz v0, :cond_7

    .line 110
    .line 111
    invoke-static {v0}, Lcom/p1/mobile/putong/data/UserStatus;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 112
    .line 113
    .line 114
    move-result-object v0

    .line 115
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const/16 v2, 0x3a

    .line 122
    .line 123
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 129
    .line 130
    if-eqz v0, :cond_8

    .line 131
    .line 132
    const/16 v1, 0x3b

    .line 133
    .line 134
    sget-object v2, Lcom/p1/mobile/putong/data/Settings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 135
    .line 136
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 137
    .line 138
    .line 139
    move-result v0

    .line 140
    add-int/2addr p0, v0

    .line 141
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 142
    .line 143
    if-eqz v0, :cond_9

    .line 144
    .line 145
    const/16 v1, 0x3c

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 152
    .line 153
    .line 154
    move-result v0

    .line 155
    add-int/2addr p0, v0

    .line 156
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 157
    .line 158
    if-eqz v0, :cond_a

    .line 159
    .line 160
    const/16 v1, 0x3d

    .line 161
    .line 162
    sget-object v2, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 165
    .line 166
    .line 167
    move-result v0

    .line 168
    add-int/2addr p0, v0

    .line 169
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 170
    .line 171
    if-eqz v0, :cond_b

    .line 172
    .line 173
    const/16 v1, 0x3e

    .line 174
    .line 175
    sget-object v2, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 183
    .line 184
    if-eqz v0, :cond_c

    .line 185
    .line 186
    const/16 v1, 0x3f

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 189
    .line 190
    .line 191
    move-result v0

    .line 192
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 193
    .line 194
    .line 195
    move-result v0

    .line 196
    add-int/2addr p0, v0

    .line 197
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 198
    .line 199
    if-eqz v0, :cond_d

    .line 200
    .line 201
    const/16 v1, 0x40

    .line 202
    .line 203
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    add-int/2addr p0, v0

    .line 208
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 209
    .line 210
    if-eqz v0, :cond_e

    .line 211
    .line 212
    const/16 v1, 0x41

    .line 213
    .line 214
    sget-object v2, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 215
    .line 216
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    add-int/2addr p0, v0

    .line 221
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 222
    .line 223
    if-eqz v0, :cond_f

    .line 224
    .line 225
    sget-object v1, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 226
    .line 227
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    .line 230
    move-result-object v1

    .line 231
    const/16 v2, 0x42

    .line 232
    .line 233
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 234
    .line 235
    .line 236
    move-result v0

    .line 237
    add-int/2addr p0, v0

    .line 238
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 239
    .line 240
    if-eqz v0, :cond_10

    .line 241
    .line 242
    const/16 v1, 0x43

    .line 243
    .line 244
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    add-int/2addr p0, v0

    .line 249
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 250
    .line 251
    if-eqz v0, :cond_11

    .line 252
    .line 253
    const/16 v1, 0x44

    .line 254
    .line 255
    sget-object v2, Lcom/p1/mobile/putong/data/UserState;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 256
    .line 257
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    add-int/2addr p0, v0

    .line 262
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 263
    .line 264
    if-eqz v0, :cond_12

    .line 265
    .line 266
    const/16 v1, 0x45

    .line 267
    .line 268
    sget-object v2, Lcom/p1/mobile/putong/data/PicVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 269
    .line 270
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    add-int/2addr p0, v0

    .line 275
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 276
    .line 277
    if-eqz v0, :cond_13

    .line 278
    .line 279
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    const/16 v2, 0x46

    .line 286
    .line 287
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    add-int/2addr p0, v0

    .line 292
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 293
    .line 294
    if-eqz v0, :cond_14

    .line 295
    .line 296
    sget-object v1, Lcom/p1/mobile/putong/data/PrivateAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    const/16 v2, 0x47

    .line 303
    .line 304
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 305
    .line 306
    .line 307
    move-result v0

    .line 308
    add-int/2addr p0, v0

    .line 309
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 310
    .line 311
    if-eqz v0, :cond_15

    .line 312
    .line 313
    const/16 v1, 0x48

    .line 314
    .line 315
    sget-object v2, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 316
    .line 317
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 318
    .line 319
    .line 320
    move-result v0

    .line 321
    add-int/2addr p0, v0

    .line 322
    :cond_15
    const/16 v0, 0x49

    .line 323
    .line 324
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 325
    .line 326
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    add-int/2addr p0, v0

    .line 331
    const/16 v0, 0x4a

    .line 332
    .line 333
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 341
    .line 342
    if-eqz v0, :cond_16

    .line 343
    .line 344
    const/16 v1, 0x4b

    .line 345
    .line 346
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 347
    .line 348
    .line 349
    move-result v0

    .line 350
    add-int/2addr p0, v0

    .line 351
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 352
    .line 353
    if-eqz v0, :cond_17

    .line 354
    .line 355
    const/16 v1, 0x4c

    .line 356
    .line 357
    sget-object v2, Lcom/p1/mobile/putong/data/UserCreditData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_17
    const/16 v0, 0x4d

    .line 365
    .line 366
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 367
    .line 368
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 369
    .line 370
    .line 371
    move-result v0

    .line 372
    add-int/2addr p0, v0

    .line 373
    const/16 v0, 0x4e

    .line 374
    .line 375
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 376
    .line 377
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 378
    .line 379
    .line 380
    move-result v0

    .line 381
    add-int/2addr p0, v0

    .line 382
    const/16 v0, 0x4f

    .line 383
    .line 384
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 385
    .line 386
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 387
    .line 388
    .line 389
    move-result v0

    .line 390
    add-int/2addr p0, v0

    .line 391
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 392
    .line 393
    if-eqz v0, :cond_18

    .line 394
    .line 395
    const/16 v1, 0x50

    .line 396
    .line 397
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 398
    .line 399
    .line 400
    move-result v0

    .line 401
    add-int/2addr p0, v0

    .line 402
    :cond_18
    const/16 v0, 0x51

    .line 403
    .line 404
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 405
    .line 406
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 407
    .line 408
    .line 409
    move-result v0

    .line 410
    add-int/2addr p0, v0

    .line 411
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 412
    .line 413
    if-eqz v0, :cond_19

    .line 414
    .line 415
    const/16 v1, 0x52

    .line 416
    .line 417
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    add-int/2addr p0, v0

    .line 422
    :cond_19
    const/16 v0, 0x53

    .line 423
    .line 424
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 425
    .line 426
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 427
    .line 428
    .line 429
    move-result v0

    .line 430
    add-int/2addr p0, v0

    .line 431
    const/16 v0, 0x54

    .line 432
    .line 433
    iget v1, p1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 434
    .line 435
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 436
    .line 437
    .line 438
    move-result v0

    .line 439
    add-int/2addr p0, v0

    .line 440
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 441
    .line 442
    if-eqz v0, :cond_1a

    .line 443
    .line 444
    const/16 v1, 0x55

    .line 445
    .line 446
    sget-object v2, Lcom/p1/mobile/putong/data/AudioSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 447
    .line 448
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 449
    .line 450
    .line 451
    move-result v0

    .line 452
    add-int/2addr p0, v0

    .line 453
    :cond_1a
    const/16 v0, 0x56

    .line 454
    .line 455
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 456
    .line 457
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    add-int/2addr p0, v0

    .line 462
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 463
    .line 464
    if-eqz v0, :cond_1b

    .line 465
    .line 466
    const/16 v1, 0x57

    .line 467
    .line 468
    sget-object v2, Lcom/p1/mobile/putong/data/UssTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 469
    .line 470
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 471
    .line 472
    .line 473
    move-result v0

    .line 474
    add-int/2addr p0, v0

    .line 475
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 476
    .line 477
    if-eqz v0, :cond_1c

    .line 478
    .line 479
    const/16 v1, 0x58

    .line 480
    .line 481
    sget-object v2, Lcom/p1/mobile/putong/data/UserAbroad;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 482
    .line 483
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 484
    .line 485
    .line 486
    move-result v0

    .line 487
    add-int/2addr p0, v0

    .line 488
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 489
    .line 490
    if-eqz v0, :cond_1d

    .line 491
    .line 492
    const/16 v1, 0x59

    .line 493
    .line 494
    sget-object v2, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 495
    .line 496
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 497
    .line 498
    .line 499
    move-result v0

    .line 500
    add-int/2addr p0, v0

    .line 501
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 502
    .line 503
    if-eqz v0, :cond_1e

    .line 504
    .line 505
    const/16 v1, 0x5a

    .line 506
    .line 507
    sget-object v2, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 508
    .line 509
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 510
    .line 511
    .line 512
    move-result v0

    .line 513
    add-int/2addr p0, v0

    .line 514
    :cond_1e
    const/16 v0, 0x5b

    .line 515
    .line 516
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 517
    .line 518
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 519
    .line 520
    .line 521
    move-result v0

    .line 522
    add-int/2addr p0, v0

    .line 523
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 524
    .line 525
    if-eqz v0, :cond_1f

    .line 526
    .line 527
    const/16 v1, 0x5c

    .line 528
    .line 529
    sget-object v2, Lcom/p1/mobile/putong/data/VisitPlace;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 530
    .line 531
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 532
    .line 533
    .line 534
    move-result v0

    .line 535
    add-int/2addr p0, v0

    .line 536
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 537
    .line 538
    if-eqz v0, :cond_20

    .line 539
    .line 540
    const/16 v1, 0x5d

    .line 541
    .line 542
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 543
    .line 544
    .line 545
    move-result v0

    .line 546
    add-int/2addr p0, v0

    .line 547
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 548
    .line 549
    if-eqz v0, :cond_21

    .line 550
    .line 551
    const/16 v1, 0x5e

    .line 552
    .line 553
    sget-object v2, Lcom/p1/mobile/putong/data/UserSoulSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 554
    .line 555
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 556
    .line 557
    .line 558
    move-result v0

    .line 559
    add-int/2addr p0, v0

    .line 560
    :cond_21
    const/16 v0, 0x5f

    .line 561
    .line 562
    iget v1, p1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 563
    .line 564
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 565
    .line 566
    .line 567
    move-result v0

    .line 568
    add-int/2addr p0, v0

    .line 569
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 570
    .line 571
    if-eqz v0, :cond_22

    .line 572
    .line 573
    const/16 v1, 0x60

    .line 574
    .line 575
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 576
    .line 577
    .line 578
    move-result v0

    .line 579
    add-int/2addr p0, v0

    .line 580
    :cond_22
    const/16 v0, 0x61

    .line 581
    .line 582
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 583
    .line 584
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 585
    .line 586
    .line 587
    move-result v0

    .line 588
    add-int/2addr p0, v0

    .line 589
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 590
    .line 591
    if-eqz v0, :cond_23

    .line 592
    .line 593
    const/16 v1, 0x62

    .line 594
    .line 595
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 596
    .line 597
    .line 598
    move-result v0

    .line 599
    add-int/2addr p0, v0

    .line 600
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 601
    .line 602
    if-eqz v0, :cond_24

    .line 603
    .line 604
    const/16 v1, 0x63

    .line 605
    .line 606
    sget-object v2, Lcom/p1/mobile/putong/data/FriendCommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 607
    .line 608
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 609
    .line 610
    .line 611
    move-result v0

    .line 612
    add-int/2addr p0, v0

    .line 613
    :cond_24
    const/16 v0, 0x64

    .line 614
    .line 615
    iget v1, p1, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 616
    .line 617
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 618
    .line 619
    .line 620
    move-result v0

    .line 621
    add-int/2addr p0, v0

    .line 622
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 623
    .line 624
    if-eqz v0, :cond_25

    .line 625
    .line 626
    const/16 v1, 0x65

    .line 627
    .line 628
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 629
    .line 630
    .line 631
    move-result v0

    .line 632
    add-int/2addr p0, v0

    .line 633
    :cond_25
    const/16 v0, 0x66

    .line 634
    .line 635
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 636
    .line 637
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 638
    .line 639
    .line 640
    move-result v0

    .line 641
    add-int/2addr p0, v0

    .line 642
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 643
    .line 644
    if-eqz v0, :cond_26

    .line 645
    .line 646
    const/16 v1, 0x67

    .line 647
    .line 648
    sget-object v2, Lcom/p1/mobile/putong/data/LiveUserLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 649
    .line 650
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 651
    .line 652
    .line 653
    move-result v0

    .line 654
    add-int/2addr p0, v0

    .line 655
    :cond_26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 656
    .line 657
    if-eqz v0, :cond_27

    .line 658
    .line 659
    const/16 v1, 0x68

    .line 660
    .line 661
    sget-object v2, Lcom/p1/mobile/putong/data/SoulShip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 662
    .line 663
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 664
    .line 665
    .line 666
    move-result v0

    .line 667
    add-int/2addr p0, v0

    .line 668
    :cond_27
    const/16 v0, 0x69

    .line 669
    .line 670
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 671
    .line 672
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 673
    .line 674
    .line 675
    move-result v0

    .line 676
    add-int/2addr p0, v0

    .line 677
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 678
    .line 679
    if-eqz v0, :cond_28

    .line 680
    .line 681
    const/16 v1, 0x6a

    .line 682
    .line 683
    sget-object v2, Lcom/p1/mobile/putong/data/BanStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 684
    .line 685
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 686
    .line 687
    .line 688
    move-result v0

    .line 689
    add-int/2addr p0, v0

    .line 690
    :cond_28
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 691
    .line 692
    if-eqz v0, :cond_29

    .line 693
    .line 694
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 695
    .line 696
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 697
    .line 698
    .line 699
    move-result-object v1

    .line 700
    const/16 v2, 0x6b

    .line 701
    .line 702
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 703
    .line 704
    .line 705
    move-result v0

    .line 706
    add-int/2addr p0, v0

    .line 707
    :cond_29
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 708
    .line 709
    if-eqz v0, :cond_2a

    .line 710
    .line 711
    const/16 v1, 0x6c

    .line 712
    .line 713
    sget-object v2, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 714
    .line 715
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 716
    .line 717
    .line 718
    move-result v0

    .line 719
    add-int/2addr p0, v0

    .line 720
    :cond_2a
    const/16 v0, 0x6d

    .line 721
    .line 722
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 723
    .line 724
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 725
    .line 726
    .line 727
    move-result v0

    .line 728
    add-int/2addr p0, v0

    .line 729
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 730
    .line 731
    if-eqz v0, :cond_2b

    .line 732
    .line 733
    sget-object v1, Lcom/p1/mobile/putong/data/UserStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 734
    .line 735
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 736
    .line 737
    .line 738
    move-result-object v1

    .line 739
    const/16 v2, 0x6e

    .line 740
    .line 741
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 742
    .line 743
    .line 744
    move-result v0

    .line 745
    add-int/2addr p0, v0

    .line 746
    :cond_2b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 747
    .line 748
    if-eqz v0, :cond_2c

    .line 749
    .line 750
    const/16 v1, 0x6f

    .line 751
    .line 752
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 753
    .line 754
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 755
    .line 756
    .line 757
    move-result v0

    .line 758
    add-int/2addr p0, v0

    .line 759
    :cond_2c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 760
    .line 761
    if-eqz v0, :cond_2d

    .line 762
    .line 763
    const/16 v1, 0x70

    .line 764
    .line 765
    sget-object v2, Lcom/p1/mobile/putong/data/UserSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 766
    .line 767
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 768
    .line 769
    .line 770
    move-result v0

    .line 771
    add-int/2addr p0, v0

    .line 772
    :cond_2d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 773
    .line 774
    if-eqz v0, :cond_2e

    .line 775
    .line 776
    const/16 v1, 0x71

    .line 777
    .line 778
    sget-object v2, Lcom/p1/mobile/putong/data/ActivityUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 779
    .line 780
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 781
    .line 782
    .line 783
    move-result v0

    .line 784
    add-int/2addr p0, v0

    .line 785
    :cond_2e
    const/16 v0, 0x72

    .line 786
    .line 787
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 788
    .line 789
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 790
    .line 791
    .line 792
    move-result v0

    .line 793
    add-int/2addr p0, v0

    .line 794
    const/16 v0, 0x73

    .line 795
    .line 796
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 797
    .line 798
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 799
    .line 800
    .line 801
    move-result v0

    .line 802
    add-int/2addr p0, v0

    .line 803
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 804
    .line 805
    if-eqz v0, :cond_2f

    .line 806
    .line 807
    const/16 v1, 0x74

    .line 808
    .line 809
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 810
    .line 811
    .line 812
    move-result v0

    .line 813
    add-int/2addr p0, v0

    .line 814
    :cond_2f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 815
    .line 816
    if-eqz v0, :cond_30

    .line 817
    .line 818
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 819
    .line 820
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 821
    .line 822
    .line 823
    move-result-object v1

    .line 824
    const/16 v2, 0x75

    .line 825
    .line 826
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 827
    .line 828
    .line 829
    move-result v0

    .line 830
    add-int/2addr p0, v0

    .line 831
    :cond_30
    const/16 v0, 0x76

    .line 832
    .line 833
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 834
    .line 835
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 836
    .line 837
    .line 838
    move-result v0

    .line 839
    add-int/2addr p0, v0

    .line 840
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 841
    .line 842
    if-eqz v0, :cond_31

    .line 843
    .line 844
    const/16 v1, 0x77

    .line 845
    .line 846
    sget-object v2, Lcom/p1/mobile/putong/data/SpecialEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 847
    .line 848
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 849
    .line 850
    .line 851
    move-result v0

    .line 852
    add-int/2addr p0, v0

    .line 853
    :cond_31
    iget-object v0, p1, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 854
    .line 855
    if-eqz v0, :cond_32

    .line 856
    .line 857
    const/16 v1, 0x78

    .line 858
    .line 859
    sget-object v2, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 860
    .line 861
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 862
    .line 863
    .line 864
    move-result v0

    .line 865
    add-int/2addr p0, v0

    .line 866
    :cond_32
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 867
    .line 868
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 869
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/User;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/User;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    const/4 p0, 0x0

    .line 1
    invoke-static {p0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object p0

    .line 2
    new-instance v0, Lcom/p1/mobile/putong/data/User;

    invoke-direct {v0}, Lcom/p1/mobile/putong/data/User;-><init>()V

    const/4 v1, 0x0

    move-object v2, v1

    move-object v3, v2

    move-object v4, v3

    .line 3
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    move-result v5

    .line 4
    const-string v6, ""

    sparse-switch v5, :sswitch_data_0

    .line 5
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez p1, :cond_0

    if-eqz v2, :cond_0

    .line 6
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 7
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez p1, :cond_1

    if-eqz v3, :cond_1

    .line 8
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 9
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    if-nez p1, :cond_2

    if-eqz v4, :cond_2

    .line 10
    sget-object p1, Lcom/p1/mobile/putong/data/UserSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/UserSource;

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 11
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    if-nez p1, :cond_3

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 12
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    if-nez p1, :cond_4

    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    move-result-object p1

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 13
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    if-nez p1, :cond_5

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 14
    :cond_5
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    if-nez p1, :cond_6

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 15
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    if-nez p0, :cond_7

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 16
    :cond_7
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    if-nez p0, :cond_8

    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 17
    :cond_8
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez p0, :cond_9

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 18
    :cond_9
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez p0, :cond_a

    sget-object p0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/Gender;

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 19
    :cond_a
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    if-nez p0, :cond_b

    invoke-static {}, Lcom/p1/mobile/putong/data/Membership;->new_()Lcom/p1/mobile/putong/data/Membership;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 20
    :cond_b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    if-nez p0, :cond_c

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 21
    :cond_c
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    if-nez p0, :cond_d

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 22
    :cond_d
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    if-nez p0, :cond_e

    invoke-static {}, Lcom/p1/mobile/putong/data/PicVerification;->new_()Lcom/p1/mobile/putong/data/PicVerification;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 23
    :cond_e
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    if-nez p0, :cond_f

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 24
    :cond_f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    if-nez p0, :cond_10

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 25
    :cond_10
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    if-nez p0, :cond_11

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 26
    :cond_11
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    if-nez p0, :cond_12

    invoke-static {}, Lcom/p1/mobile/putong/data/AudioSignature;->new_()Lcom/p1/mobile/putong/data/AudioSignature;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 27
    :cond_12
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    if-nez p0, :cond_13

    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveState;->new_()Lcom/p1/mobile/putong/data/UserLiveState;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 28
    :cond_13
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    if-nez p0, :cond_14

    invoke-static {}, Lcom/p1/mobile/putong/data/UserAbroad;->new_()Lcom/p1/mobile/putong/data/UserAbroad;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 29
    :cond_14
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    if-nez p0, :cond_15

    invoke-static {}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->new_()Lcom/p1/mobile/putong/data/UserMedalWrapper;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 30
    :cond_15
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    if-nez p0, :cond_16

    sget-object p0, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/SignupStage;

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 31
    :cond_16
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    if-nez p0, :cond_17

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 32
    :cond_17
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    if-nez p0, :cond_18

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSoulSettings;->new_()Lcom/p1/mobile/putong/data/UserSoulSettings;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 33
    :cond_18
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    if-nez p0, :cond_19

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 34
    :cond_19
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    if-nez p0, :cond_1a

    invoke-static {}, Lcom/p1/mobile/putong/data/RichListUsers;->new_()Lcom/p1/mobile/putong/data/RichListUsers;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 35
    :cond_1a
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    if-nez p0, :cond_1b

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 36
    :cond_1b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    if-nez p0, :cond_1c

    .line 37
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->new_()Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 38
    :cond_1c
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    if-nez p0, :cond_1d

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 39
    :cond_1d
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    if-nez p0, :cond_1e

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 40
    :cond_1e
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    if-nez p0, :cond_1f

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->new_()Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 41
    :cond_1f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    if-nez p0, :cond_20

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->new_()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 42
    :cond_20
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    if-nez p0, :cond_21

    invoke-static {}, Lcom/p1/mobile/putong/data/AvatarFrame;->new_()Lcom/p1/mobile/putong/data/AvatarFrame;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 43
    :cond_21
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    if-nez p0, :cond_22

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserLevel;->new_()Lcom/p1/mobile/putong/data/LiveUserLevel;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 44
    :cond_22
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    if-nez p0, :cond_23

    invoke-static {}, Lcom/p1/mobile/putong/data/BanStatus;->new_()Lcom/p1/mobile/putong/data/BanStatus;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 45
    :cond_23
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    if-nez p0, :cond_24

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 46
    :cond_24
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    if-nez p0, :cond_25

    invoke-static {}, Lcom/p1/mobile/putong/data/ActivityUser;->new_()Lcom/p1/mobile/putong/data/ActivityUser;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 47
    :cond_25
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    if-nez p0, :cond_26

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 48
    :cond_26
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    if-nez p0, :cond_27

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 49
    :cond_27
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    if-nez p0, :cond_28

    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveState;->new_()Lcom/p1/mobile/putong/data/VoiceLiveState;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 50
    :cond_28
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    if-nez p0, :cond_52

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    return-object v0

    .line 51
    :sswitch_0
    sget-object v5, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UserActivityInfo;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    goto/16 :goto_0

    .line 52
    :sswitch_1
    sget-object v5, Lcom/p1/mobile/putong/data/SpecialEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/SpecialEffect;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    goto/16 :goto_0

    .line 53
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->deleted:Z

    goto/16 :goto_0

    .line 54
    :sswitch_3
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    goto/16 :goto_0

    .line 56
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    goto/16 :goto_0

    .line 57
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    goto/16 :goto_0

    .line 58
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    goto/16 :goto_0

    .line 59
    :sswitch_7
    sget-object v5, Lcom/p1/mobile/putong/data/ActivityUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/ActivityUser;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    goto/16 :goto_0

    .line 60
    :sswitch_8
    sget-object v5, Lcom/p1/mobile/putong/data/UserSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UserSource;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    goto/16 :goto_0

    .line 61
    :sswitch_9
    sget-object v5, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Gender;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    goto/16 :goto_0

    .line 62
    :sswitch_a
    sget-object v5, Lcom/p1/mobile/putong/data/UserStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    goto/16 :goto_0

    .line 63
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    goto/16 :goto_0

    .line 64
    :sswitch_c
    sget-object v5, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    goto/16 :goto_0

    .line 65
    :sswitch_d
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    goto/16 :goto_0

    .line 67
    :sswitch_e
    sget-object v5, Lcom/p1/mobile/putong/data/BanStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/BanStatus;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    goto/16 :goto_0

    .line 68
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->signupTime:D

    goto/16 :goto_0

    .line 69
    :sswitch_10
    sget-object v5, Lcom/p1/mobile/putong/data/SoulShip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/SoulShip;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    goto/16 :goto_0

    .line 70
    :sswitch_11
    sget-object v5, Lcom/p1/mobile/putong/data/LiveUserLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/LiveUserLevel;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    goto/16 :goto_0

    .line 71
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    goto/16 :goto_0

    .line 72
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    goto/16 :goto_0

    .line 73
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v5

    iput v5, v0, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    goto/16 :goto_0

    .line 74
    :sswitch_15
    sget-object v5, Lcom/p1/mobile/putong/data/FriendCommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/FriendCommentInfo;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    goto/16 :goto_0

    .line 75
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    goto/16 :goto_0

    .line 76
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    goto/16 :goto_0

    .line 77
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    goto/16 :goto_0

    .line 78
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v5

    iput v5, v0, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    goto/16 :goto_0

    .line 79
    :sswitch_1a
    sget-object v5, Lcom/p1/mobile/putong/data/UserSoulSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UserSoulSettings;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    goto/16 :goto_0

    .line 80
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    goto/16 :goto_0

    .line 81
    :sswitch_1c
    sget-object v5, Lcom/p1/mobile/putong/data/VisitPlace;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/VisitPlace;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    goto/16 :goto_0

    .line 82
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    goto/16 :goto_0

    .line 83
    :sswitch_1e
    sget-object v5, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/StatusesItem;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    goto/16 :goto_0

    .line 84
    :sswitch_1f
    sget-object v5, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/StatusesItem;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    goto/16 :goto_0

    .line 85
    :sswitch_20
    sget-object v5, Lcom/p1/mobile/putong/data/UserAbroad;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UserAbroad;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    goto/16 :goto_0

    .line 86
    :sswitch_21
    sget-object v5, Lcom/p1/mobile/putong/data/UssTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UssTags;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    goto/16 :goto_0

    .line 87
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    goto/16 :goto_0

    .line 88
    :sswitch_23
    sget-object v5, Lcom/p1/mobile/putong/data/AudioSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/AudioSignature;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    goto/16 :goto_0

    .line 89
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v5

    iput v5, v0, Lcom/p1/mobile/putong/data/User;->popLevel:I

    goto/16 :goto_0

    .line 90
    :sswitch_25
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    goto/16 :goto_0

    .line 91
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    goto/16 :goto_0

    .line 92
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    goto/16 :goto_0

    .line 93
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    goto/16 :goto_0

    .line 94
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    goto/16 :goto_0

    .line 95
    :sswitch_2a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->isLord:Z

    goto/16 :goto_0

    .line 96
    :sswitch_2b
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    goto/16 :goto_0

    .line 97
    :sswitch_2c
    sget-object v5, Lcom/p1/mobile/putong/data/UserCreditData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UserCreditData;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    goto/16 :goto_0

    .line 98
    :sswitch_2d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    goto/16 :goto_0

    .line 99
    :sswitch_2e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v5

    iput-boolean v5, v0, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    goto/16 :goto_0

    .line 100
    :sswitch_2f
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    goto/16 :goto_0

    .line 101
    :sswitch_30
    sget-object v5, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Membership;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    goto/16 :goto_0

    .line 102
    :sswitch_31
    sget-object v5, Lcom/p1/mobile/putong/data/PrivateAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    goto/16 :goto_0

    .line 104
    :sswitch_32
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    goto/16 :goto_0

    .line 106
    :sswitch_33
    sget-object v5, Lcom/p1/mobile/putong/data/PicVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/PicVerification;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    goto/16 :goto_0

    .line 107
    :sswitch_34
    sget-object v5, Lcom/p1/mobile/putong/data/UserState;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/UserState;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    goto/16 :goto_0

    .line 108
    :sswitch_35
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    goto/16 :goto_0

    .line 109
    :sswitch_36
    sget-object v5, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    goto/16 :goto_0

    .line 111
    :sswitch_37
    sget-object v5, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Followship;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    goto/16 :goto_0

    .line 112
    :sswitch_38
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    goto/16 :goto_0

    .line 113
    :sswitch_39
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto/16 :goto_0

    .line 114
    :sswitch_3a
    sget-object v5, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Membership;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    goto/16 :goto_0

    .line 115
    :sswitch_3b
    sget-object v5, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Relationship;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    goto/16 :goto_0

    .line 116
    :sswitch_3c
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_0

    .line 117
    :sswitch_3d
    sget-object v5, Lcom/p1/mobile/putong/data/Settings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Settings;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    goto/16 :goto_0

    .line 118
    :sswitch_3e
    sget-object v2, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 119
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v2

    .line 120
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v2

    check-cast v2, Ljava/util/List;

    goto/16 :goto_0

    .line 121
    :sswitch_3f
    sget-object v5, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Profile;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    goto/16 :goto_0

    .line 122
    :sswitch_40
    invoke-virtual {p1}, Ll/nc5;->h()D

    move-result-wide v5

    iput-wide v5, v0, Lcom/p1/mobile/putong/data/User;->createdTime:D

    goto/16 :goto_0

    .line 123
    :sswitch_41
    sget-object v5, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    goto/16 :goto_0

    .line 124
    :sswitch_42
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v5

    invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    goto/16 :goto_0

    .line 125
    :sswitch_43
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    goto/16 :goto_0

    .line 126
    :sswitch_44
    sget-object v5, Lcom/p1/mobile/putong/data/Location;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Lcom/p1/mobile/putong/data/Location;

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    goto/16 :goto_0

    .line 127
    :sswitch_45
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    goto/16 :goto_0

    .line 128
    :sswitch_46
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v5

    iput-object v5, v0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    goto/16 :goto_0

    .line 129
    :sswitch_47
    invoke-virtual {p1}, Ll/nc5;->k()J

    move-result-wide v5

    iput-wide v5, v0, Lcom/tantanapp/common/data/DbObject;->_id:J

    goto/16 :goto_0

    .line 130
    :sswitch_48
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez p1, :cond_29

    if-eqz v2, :cond_29

    .line 131
    invoke-static {v2}, Lcom/p1/mobile/putong/data/UserStatus;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 132
    :cond_29
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez p1, :cond_2a

    if-eqz v3, :cond_2a

    .line 133
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 134
    :cond_2a
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    if-nez p1, :cond_2b

    if-eqz v4, :cond_2b

    .line 135
    sget-object p1, Lcom/p1/mobile/putong/data/UserSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v2

    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/UserSource;

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 136
    :cond_2b
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    if-nez p1, :cond_2c

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

    .line 137
    :cond_2c
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    if-nez p1, :cond_2d

    invoke-static {}, Lcom/p1/mobile/putong/data/Location;->new_()Lcom/p1/mobile/putong/data/Location;

    move-result-object p1

    iput-object p1, v0, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 138
    :cond_2d
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    if-nez p1, :cond_2e

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 139
    :cond_2e
    iget-object p1, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    if-nez p1, :cond_2f

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 140
    :cond_2f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    if-nez p0, :cond_30

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 141
    :cond_30
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    if-nez p0, :cond_31

    invoke-static {}, Lcom/p1/mobile/putong/data/Profile;->new_()Lcom/p1/mobile/putong/data/Profile;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 142
    :cond_31
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    if-nez p0, :cond_32

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 143
    :cond_32
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    if-nez p0, :cond_33

    sget-object p0, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/Gender;

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 144
    :cond_33
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    if-nez p0, :cond_34

    invoke-static {}, Lcom/p1/mobile/putong/data/Membership;->new_()Lcom/p1/mobile/putong/data/Membership;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 145
    :cond_34
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    if-nez p0, :cond_35

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 146
    :cond_35
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    if-nez p0, :cond_36

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 147
    :cond_36
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    if-nez p0, :cond_37

    invoke-static {}, Lcom/p1/mobile/putong/data/PicVerification;->new_()Lcom/p1/mobile/putong/data/PicVerification;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 148
    :cond_37
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    if-nez p0, :cond_38

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 149
    :cond_38
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    if-nez p0, :cond_39

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 150
    :cond_39
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    if-nez p0, :cond_3a

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->picksTracker:Ljava/lang/String;

    .line 151
    :cond_3a
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    if-nez p0, :cond_3b

    invoke-static {}, Lcom/p1/mobile/putong/data/AudioSignature;->new_()Lcom/p1/mobile/putong/data/AudioSignature;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 152
    :cond_3b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    if-nez p0, :cond_3c

    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveState;->new_()Lcom/p1/mobile/putong/data/UserLiveState;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveState:Lcom/p1/mobile/putong/data/UserLiveState;

    .line 153
    :cond_3c
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    if-nez p0, :cond_3d

    invoke-static {}, Lcom/p1/mobile/putong/data/UserAbroad;->new_()Lcom/p1/mobile/putong/data/UserAbroad;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 154
    :cond_3d
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    if-nez p0, :cond_3e

    invoke-static {}, Lcom/p1/mobile/putong/data/UserMedalWrapper;->new_()Lcom/p1/mobile/putong/data/UserMedalWrapper;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->medal:Lcom/p1/mobile/putong/data/UserMedalWrapper;

    .line 155
    :cond_3e
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    if-nez p0, :cond_3f

    sget-object p0, Lcom/p1/mobile/putong/data/SignupStage;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p0

    check-cast p0, Lcom/p1/mobile/putong/data/SignupStage;

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->signupStage:Lcom/p1/mobile/putong/data/SignupStage;

    .line 156
    :cond_3f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    if-nez p0, :cond_40

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 157
    :cond_40
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    if-nez p0, :cond_41

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSoulSettings;->new_()Lcom/p1/mobile/putong/data/UserSoulSettings;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 158
    :cond_41
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    if-nez p0, :cond_42

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 159
    :cond_42
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    if-nez p0, :cond_43

    invoke-static {}, Lcom/p1/mobile/putong/data/RichListUsers;->new_()Lcom/p1/mobile/putong/data/RichListUsers;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->localRichListUsers:Lcom/p1/mobile/putong/data/RichListUsers;

    .line 160
    :cond_43
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    if-nez p0, :cond_44

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->richListType:Ljava/lang/String;

    .line 161
    :cond_44
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    if-nez p0, :cond_45

    .line 162
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;->new_()Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->liveRevenueCampaignVip:Lcom/p1/mobile/putong/data/LiveRevenueCampaignVip;

    .line 163
    :cond_45
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    if-nez p0, :cond_46

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 164
    :cond_46
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    if-nez p0, :cond_47

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 165
    :cond_47
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    if-nez p0, :cond_48

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveAnchorLevel;->new_()Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->anchorHierarchy:Lcom/p1/mobile/putong/data/LiveAnchorLevel;

    .line 166
    :cond_48
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    if-nez p0, :cond_49

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveFansClubLevel;->new_()Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->fanbaseHierarchy:Lcom/p1/mobile/putong/data/LiveFansClubLevel;

    .line 167
    :cond_49
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    if-nez p0, :cond_4a

    invoke-static {}, Lcom/p1/mobile/putong/data/AvatarFrame;->new_()Lcom/p1/mobile/putong/data/AvatarFrame;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->avatarFrame:Lcom/p1/mobile/putong/data/AvatarFrame;

    .line 168
    :cond_4a
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    if-nez p0, :cond_4b

    invoke-static {}, Lcom/p1/mobile/putong/data/LiveUserLevel;->new_()Lcom/p1/mobile/putong/data/LiveUserLevel;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 169
    :cond_4b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    if-nez p0, :cond_4c

    invoke-static {}, Lcom/p1/mobile/putong/data/BanStatus;->new_()Lcom/p1/mobile/putong/data/BanStatus;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 170
    :cond_4c
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    if-nez p0, :cond_4d

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->finishedStages:Ljava/util/List;

    .line 171
    :cond_4d
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    if-nez p0, :cond_4e

    invoke-static {}, Lcom/p1/mobile/putong/data/ActivityUser;->new_()Lcom/p1/mobile/putong/data/ActivityUser;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 172
    :cond_4e
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    if-nez p0, :cond_4f

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 173
    :cond_4f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    if-nez p0, :cond_50

    new-instance p0, Ljava/util/ArrayList;

    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 174
    :cond_50
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    if-nez p0, :cond_51

    invoke-static {}, Lcom/p1/mobile/putong/data/VoiceLiveState;->new_()Lcom/p1/mobile/putong/data/VoiceLiveState;

    move-result-object p0

    iput-object p0, v0, Lcom/p1/mobile/putong/data/User;->voiceLiveState:Lcom/p1/mobile/putong/data/VoiceLiveState;

    .line 175
    :cond_51
    iget-object p0, v0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    if-nez p0, :cond_52

    iput-object v6, v0, Lcom/p1/mobile/putong/data/User;->localSeeReminderType:Ljava/lang/String;

    :cond_52
    return-object v0

    nop

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_48
        0x8 -> :sswitch_47
        0x12 -> :sswitch_46
        0x19a -> :sswitch_45
        0x1a2 -> :sswitch_44
        0x1aa -> :sswitch_43
        0x1b0 -> :sswitch_42
        0x1ba -> :sswitch_41
        0x1c1 -> :sswitch_40
        0x1ca -> :sswitch_3f
        0x1d2 -> :sswitch_3e
        0x1da -> :sswitch_3d
        0x1e0 -> :sswitch_3c
        0x1ea -> :sswitch_3b
        0x1f2 -> :sswitch_3a
        0x1f8 -> :sswitch_39
        0x202 -> :sswitch_38
        0x20a -> :sswitch_37
        0x212 -> :sswitch_36
        0x21a -> :sswitch_35
        0x222 -> :sswitch_34
        0x22a -> :sswitch_33
        0x232 -> :sswitch_32
        0x23a -> :sswitch_31
        0x242 -> :sswitch_30
        0x248 -> :sswitch_2f
        0x250 -> :sswitch_2e
        0x25a -> :sswitch_2d
        0x262 -> :sswitch_2c
        0x269 -> :sswitch_2b
        0x270 -> :sswitch_2a
        0x279 -> :sswitch_29
        0x282 -> :sswitch_28
        0x288 -> :sswitch_27
        0x292 -> :sswitch_26
        0x298 -> :sswitch_25
        0x2a0 -> :sswitch_24
        0x2aa -> :sswitch_23
        0x2b0 -> :sswitch_22
        0x2ba -> :sswitch_21
        0x2c2 -> :sswitch_20
        0x2ca -> :sswitch_1f
        0x2d2 -> :sswitch_1e
        0x2d8 -> :sswitch_1d
        0x2e2 -> :sswitch_1c
        0x2ea -> :sswitch_1b
        0x2f2 -> :sswitch_1a
        0x2f8 -> :sswitch_19
        0x302 -> :sswitch_18
        0x309 -> :sswitch_17
        0x312 -> :sswitch_16
        0x31a -> :sswitch_15
        0x320 -> :sswitch_14
        0x32a -> :sswitch_13
        0x330 -> :sswitch_12
        0x33a -> :sswitch_11
        0x342 -> :sswitch_10
        0x349 -> :sswitch_f
        0x352 -> :sswitch_e
        0x35a -> :sswitch_d
        0x362 -> :sswitch_c
        0x368 -> :sswitch_b
        0x372 -> :sswitch_a
        0x37a -> :sswitch_9
        0x382 -> :sswitch_8
        0x38a -> :sswitch_7
        0x390 -> :sswitch_6
        0x398 -> :sswitch_5
        0x3a2 -> :sswitch_4
        0x3aa -> :sswitch_3
        0x3b0 -> :sswitch_2
        0x3ba -> :sswitch_1
        0x3c2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 176
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/User$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/User;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/User;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->location:Lcom/p1/mobile/putong/data/Location;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 v0, 0x34

    .line 29
    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/Location;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->description:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/16 v0, 0x35

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->age:Ljava/lang/Integer;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const/16 v0, 0x36

    .line 49
    .line 50
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 51
    .line 52
    .line 53
    move-result p0

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->pictures:Ljava/util/List;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    .line 66
    move-result-object v0

    .line 67
    const/16 v1, 0x37

    .line 68
    .line 69
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_5
    const/16 p0, 0x38

    .line 73
    .line 74
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->createdTime:D

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->profile:Lcom/p1/mobile/putong/data/Profile;

    .line 80
    .line 81
    if-eqz p0, :cond_6

    .line 82
    .line 83
    const/16 v0, 0x39

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/data/Profile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 88
    .line 89
    .line 90
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 91
    .line 92
    if-eqz p0, :cond_7

    .line 93
    .line 94
    invoke-static {p0}, Lcom/p1/mobile/putong/data/UserStatus;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 95
    .line 96
    .line 97
    move-result-object p0

    .line 98
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    .line 103
    move-result-object v0

    .line 104
    const/16 v1, 0x3a

    .line 105
    .line 106
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 107
    .line 108
    .line 109
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->settings:Lcom/p1/mobile/putong/data/Settings;

    .line 110
    .line 111
    if-eqz p0, :cond_8

    .line 112
    .line 113
    const/16 v0, 0x3b

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/putong/data/Settings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 118
    .line 119
    .line 120
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 121
    .line 122
    if-eqz p0, :cond_9

    .line 123
    .line 124
    const/16 v0, 0x3c

    .line 125
    .line 126
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 127
    .line 128
    .line 129
    move-result p0

    .line 130
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 131
    .line 132
    .line 133
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localRelationship:Lcom/p1/mobile/putong/data/Relationship;

    .line 134
    .line 135
    if-eqz p0, :cond_a

    .line 136
    .line 137
    const/16 v0, 0x3d

    .line 138
    .line 139
    sget-object v1, Lcom/p1/mobile/putong/data/Relationship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 142
    .line 143
    .line 144
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->membership:Lcom/p1/mobile/putong/data/Membership;

    .line 145
    .line 146
    if-eqz p0, :cond_b

    .line 147
    .line 148
    const/16 v0, 0x3e

    .line 149
    .line 150
    sget-object v1, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 153
    .line 154
    .line 155
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 156
    .line 157
    if-eqz p0, :cond_c

    .line 158
    .line 159
    const/16 v0, 0x3f

    .line 160
    .line 161
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 162
    .line 163
    .line 164
    move-result p0

    .line 165
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 166
    .line 167
    .line 168
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->realName:Ljava/lang/String;

    .line 169
    .line 170
    if-eqz p0, :cond_d

    .line 171
    .line 172
    const/16 v0, 0x40

    .line 173
    .line 174
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 175
    .line 176
    .line 177
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localFollowship:Lcom/p1/mobile/putong/data/Followship;

    .line 178
    .line 179
    if-eqz p0, :cond_e

    .line 180
    .line 181
    const/16 v0, 0x41

    .line 182
    .line 183
    sget-object v1, Lcom/p1/mobile/putong/data/Followship;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 184
    .line 185
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 186
    .line 187
    .line 188
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->memberships:Ljava/util/List;

    .line 189
    .line 190
    if-eqz p0, :cond_f

    .line 191
    .line 192
    sget-object v0, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 193
    .line 194
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    const/16 v1, 0x42

    .line 199
    .line 200
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 201
    .line 202
    .line 203
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->nameRemark:Ljava/lang/String;

    .line 204
    .line 205
    if-eqz p0, :cond_10

    .line 206
    .line 207
    const/16 v0, 0x43

    .line 208
    .line 209
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 210
    .line 211
    .line 212
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->state:Lcom/p1/mobile/putong/data/UserState;

    .line 213
    .line 214
    if-eqz p0, :cond_11

    .line 215
    .line 216
    const/16 v0, 0x44

    .line 217
    .line 218
    sget-object v1, Lcom/p1/mobile/putong/data/UserState;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 221
    .line 222
    .line 223
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->verifications:Lcom/p1/mobile/putong/data/PicVerification;

    .line 224
    .line 225
    if-eqz p0, :cond_12

    .line 226
    .line 227
    const/16 v0, 0x45

    .line 228
    .line 229
    sget-object v1, Lcom/p1/mobile/putong/data/PicVerification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 232
    .line 233
    .line 234
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->abGroups:Ljava/util/List;

    .line 235
    .line 236
    if-eqz p0, :cond_13

    .line 237
    .line 238
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 241
    .line 242
    .line 243
    move-result-object v0

    .line 244
    const/16 v1, 0x46

    .line 245
    .line 246
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 247
    .line 248
    .line 249
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->privateAnswers:Ljava/util/List;

    .line 250
    .line 251
    if-eqz p0, :cond_14

    .line 252
    .line 253
    sget-object v0, Lcom/p1/mobile/putong/data/PrivateAnswer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    .line 255
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 256
    .line 257
    .line 258
    move-result-object v0

    .line 259
    const/16 v1, 0x47

    .line 260
    .line 261
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 262
    .line 263
    .line 264
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->peepership:Lcom/p1/mobile/putong/data/Membership;

    .line 265
    .line 266
    if-eqz p0, :cond_15

    .line 267
    .line 268
    const/16 v0, 0x48

    .line 269
    .line 270
    sget-object v1, Lcom/p1/mobile/putong/data/Membership;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 271
    .line 272
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 273
    .line 274
    .line 275
    :cond_15
    const/16 p0, 0x49

    .line 276
    .line 277
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->picksExpiredTimestamp:J

    .line 278
    .line 279
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 280
    .line 281
    .line 282
    const/16 p0, 0x4a

    .line 283
    .line 284
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->picksSwipable:Z

    .line 285
    .line 286
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 287
    .line 288
    .line 289
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->picksTag:Ljava/lang/String;

    .line 290
    .line 291
    if-eqz p0, :cond_16

    .line 292
    .line 293
    const/16 v0, 0x4b

    .line 294
    .line 295
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 296
    .line 297
    .line 298
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->credit:Lcom/p1/mobile/putong/data/UserCreditData;

    .line 299
    .line 300
    if-eqz p0, :cond_17

    .line 301
    .line 302
    const/16 v0, 0x4c

    .line 303
    .line 304
    sget-object v1, Lcom/p1/mobile/putong/data/UserCreditData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 305
    .line 306
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 307
    .line 308
    .line 309
    :cond_17
    const/16 p0, 0x4d

    .line 310
    .line 311
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->goPlaceTimestamp:D

    .line 312
    .line 313
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 314
    .line 315
    .line 316
    const/16 p0, 0x4e

    .line 317
    .line 318
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->isLord:Z

    .line 319
    .line 320
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 321
    .line 322
    .line 323
    const/16 p0, 0x4f

    .line 324
    .line 325
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->privateAnswersUpdatedTime:D

    .line 326
    .line 327
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 328
    .line 329
    .line 330
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->sendLetter:Ljava/lang/String;

    .line 331
    .line 332
    if-eqz p0, :cond_18

    .line 333
    .line 334
    const/16 v0, 0x50

    .line 335
    .line 336
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 337
    .line 338
    .line 339
    :cond_18
    const/16 p0, 0x51

    .line 340
    .line 341
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->sendLetterTimestamp:J

    .line 342
    .line 343
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 344
    .line 345
    .line 346
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->receivedLetter:Ljava/lang/String;

    .line 347
    .line 348
    if-eqz p0, :cond_19

    .line 349
    .line 350
    const/16 v0, 0x52

    .line 351
    .line 352
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 353
    .line 354
    .line 355
    :cond_19
    const/16 p0, 0x53

    .line 356
    .line 357
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->receivedLetterTimestamp:J

    .line 358
    .line 359
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 360
    .line 361
    .line 362
    const/16 p0, 0x54

    .line 363
    .line 364
    iget v0, p1, Lcom/p1/mobile/putong/data/User;->popLevel:I

    .line 365
    .line 366
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 367
    .line 368
    .line 369
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->voice:Lcom/p1/mobile/putong/data/AudioSignature;

    .line 370
    .line 371
    if-eqz p0, :cond_1a

    .line 372
    .line 373
    const/16 v0, 0x55

    .line 374
    .line 375
    sget-object v1, Lcom/p1/mobile/putong/data/AudioSignature;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 376
    .line 377
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 378
    .line 379
    .line 380
    :cond_1a
    const/16 p0, 0x56

    .line 381
    .line 382
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->datingMode:Z

    .line 383
    .line 384
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 385
    .line 386
    .line 387
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->ussTags:Lcom/p1/mobile/putong/data/UssTags;

    .line 388
    .line 389
    if-eqz p0, :cond_1b

    .line 390
    .line 391
    const/16 v0, 0x57

    .line 392
    .line 393
    sget-object v1, Lcom/p1/mobile/putong/data/UssTags;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 394
    .line 395
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 396
    .line 397
    .line 398
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->abroad:Lcom/p1/mobile/putong/data/UserAbroad;

    .line 399
    .line 400
    if-eqz p0, :cond_1c

    .line 401
    .line 402
    const/16 v0, 0x58

    .line 403
    .line 404
    sget-object v1, Lcom/p1/mobile/putong/data/UserAbroad;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 405
    .line 406
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 407
    .line 408
    .line 409
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->fakeStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 410
    .line 411
    if-eqz p0, :cond_1d

    .line 412
    .line 413
    const/16 v0, 0x59

    .line 414
    .line 415
    sget-object v1, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 416
    .line 417
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 418
    .line 419
    .line 420
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->nameStatus:Lcom/p1/mobile/putong/data/StatusesItem;

    .line 421
    .line 422
    if-eqz p0, :cond_1e

    .line 423
    .line 424
    const/16 v0, 0x5a

    .line 425
    .line 426
    sget-object v1, Lcom/p1/mobile/putong/data/StatusesItem;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 427
    .line 428
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 429
    .line 430
    .line 431
    :cond_1e
    const/16 p0, 0x5b

    .line 432
    .line 433
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->displayAudit:Z

    .line 434
    .line 435
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 436
    .line 437
    .line 438
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->visitPlace:Lcom/p1/mobile/putong/data/VisitPlace;

    .line 439
    .line 440
    if-eqz p0, :cond_1f

    .line 441
    .line 442
    const/16 v0, 0x5c

    .line 443
    .line 444
    sget-object v1, Lcom/p1/mobile/putong/data/VisitPlace;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 445
    .line 446
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 447
    .line 448
    .line 449
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->publicId:Ljava/lang/String;

    .line 450
    .line 451
    if-eqz p0, :cond_20

    .line 452
    .line 453
    const/16 v0, 0x5d

    .line 454
    .line 455
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 456
    .line 457
    .line 458
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->soulSettings:Lcom/p1/mobile/putong/data/UserSoulSettings;

    .line 459
    .line 460
    if-eqz p0, :cond_21

    .line 461
    .line 462
    const/16 v0, 0x5e

    .line 463
    .line 464
    sget-object v1, Lcom/p1/mobile/putong/data/UserSoulSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 465
    .line 466
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 467
    .line 468
    .line 469
    :cond_21
    const/16 p0, 0x5f

    .line 470
    .line 471
    iget v0, p1, Lcom/p1/mobile/putong/data/User;->richListPosition:I

    .line 472
    .line 473
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 474
    .line 475
    .line 476
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->richListTracker:Ljava/lang/String;

    .line 477
    .line 478
    if-eqz p0, :cond_22

    .line 479
    .line 480
    const/16 v0, 0x60

    .line 481
    .line 482
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 483
    .line 484
    .line 485
    :cond_22
    const/16 p0, 0x61

    .line 486
    .line 487
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->diamondVIPExpiresTime:D

    .line 488
    .line 489
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 490
    .line 491
    .line 492
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->aiTag:Ljava/lang/String;

    .line 493
    .line 494
    if-eqz p0, :cond_23

    .line 495
    .line 496
    const/16 v0, 0x62

    .line 497
    .line 498
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 499
    .line 500
    .line 501
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->friendCommentInfo:Lcom/p1/mobile/putong/data/FriendCommentInfo;

    .line 502
    .line 503
    if-eqz p0, :cond_24

    .line 504
    .line 505
    const/16 v0, 0x63

    .line 506
    .line 507
    sget-object v1, Lcom/p1/mobile/putong/data/FriendCommentInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 508
    .line 509
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 510
    .line 511
    .line 512
    :cond_24
    const/16 p0, 0x64

    .line 513
    .line 514
    iget v0, p1, Lcom/p1/mobile/putong/data/User;->minRichListPosition:I

    .line 515
    .line 516
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 517
    .line 518
    .line 519
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->ussTracker:Ljava/lang/String;

    .line 520
    .line 521
    if-eqz p0, :cond_25

    .line 522
    .line 523
    const/16 v0, 0x65

    .line 524
    .line 525
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 526
    .line 527
    .line 528
    :cond_25
    const/16 p0, 0x66

    .line 529
    .line 530
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->localLatestReceivedMessageTime:J

    .line 531
    .line 532
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 533
    .line 534
    .line 535
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->hierarchy:Lcom/p1/mobile/putong/data/LiveUserLevel;

    .line 536
    .line 537
    if-eqz p0, :cond_26

    .line 538
    .line 539
    const/16 v0, 0x67

    .line 540
    .line 541
    sget-object v1, Lcom/p1/mobile/putong/data/LiveUserLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 542
    .line 543
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 544
    .line 545
    .line 546
    :cond_26
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localSoulShip:Lcom/p1/mobile/putong/data/SoulShip;

    .line 547
    .line 548
    if-eqz p0, :cond_27

    .line 549
    .line 550
    const/16 v0, 0x68

    .line 551
    .line 552
    sget-object v1, Lcom/p1/mobile/putong/data/SoulShip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 553
    .line 554
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 555
    .line 556
    .line 557
    :cond_27
    const/16 p0, 0x69

    .line 558
    .line 559
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/User;->signupTime:D

    .line 560
    .line 561
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 562
    .line 563
    .line 564
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->banStatus:Lcom/p1/mobile/putong/data/BanStatus;

    .line 565
    .line 566
    if-eqz p0, :cond_28

    .line 567
    .line 568
    const/16 v0, 0x6a

    .line 569
    .line 570
    sget-object v1, Lcom/p1/mobile/putong/data/BanStatus;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 571
    .line 572
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 573
    .line 574
    .line 575
    :cond_28
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localDiamondPrivateMatchTags:Ljava/util/List;

    .line 576
    .line 577
    if-eqz p0, :cond_29

    .line 578
    .line 579
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 580
    .line 581
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 582
    .line 583
    .line 584
    move-result-object v0

    .line 585
    const/16 v1, 0x6b

    .line 586
    .line 587
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 588
    .line 589
    .line 590
    :cond_29
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->anonymousLike:Lcom/p1/mobile/putong/data/AnonymousLikeInfo;

    .line 591
    .line 592
    if-eqz p0, :cond_2a

    .line 593
    .line 594
    const/16 v0, 0x6c

    .line 595
    .line 596
    sget-object v1, Lcom/p1/mobile/putong/data/AnonymousLikeInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 597
    .line 598
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 599
    .line 600
    .line 601
    :cond_2a
    const/16 p0, 0x6d

    .line 602
    .line 603
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->inactivated:Z

    .line 604
    .line 605
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 606
    .line 607
    .line 608
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->status:Ljava/util/List;

    .line 609
    .line 610
    if-eqz p0, :cond_2b

    .line 611
    .line 612
    sget-object v0, Lcom/p1/mobile/putong/data/UserStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 613
    .line 614
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 615
    .line 616
    .line 617
    move-result-object v0

    .line 618
    const/16 v1, 0x6e

    .line 619
    .line 620
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 621
    .line 622
    .line 623
    :cond_2b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 624
    .line 625
    if-eqz p0, :cond_2c

    .line 626
    .line 627
    const/16 v0, 0x6f

    .line 628
    .line 629
    sget-object v1, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 630
    .line 631
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 632
    .line 633
    .line 634
    :cond_2c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->source:Lcom/p1/mobile/putong/data/UserSource;

    .line 635
    .line 636
    if-eqz p0, :cond_2d

    .line 637
    .line 638
    const/16 v0, 0x70

    .line 639
    .line 640
    sget-object v1, Lcom/p1/mobile/putong/data/UserSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 641
    .line 642
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 643
    .line 644
    .line 645
    :cond_2d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->activityUser:Lcom/p1/mobile/putong/data/ActivityUser;

    .line 646
    .line 647
    if-eqz p0, :cond_2e

    .line 648
    .line 649
    const/16 v0, 0x71

    .line 650
    .line 651
    sget-object v1, Lcom/p1/mobile/putong/data/ActivityUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 652
    .line 653
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 654
    .line 655
    .line 656
    :cond_2e
    const/16 p0, 0x72

    .line 657
    .line 658
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->matePlanUser:Z

    .line 659
    .line 660
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 661
    .line 662
    .line 663
    const/16 p0, 0x73

    .line 664
    .line 665
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->matePlanAdUser:Z

    .line 666
    .line 667
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 668
    .line 669
    .line 670
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->regionTag:Ljava/lang/String;

    .line 671
    .line 672
    if-eqz p0, :cond_2f

    .line 673
    .line 674
    const/16 v0, 0x74

    .line 675
    .line 676
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 677
    .line 678
    .line 679
    :cond_2f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->localLikeIdentifiers:Ljava/util/List;

    .line 680
    .line 681
    if-eqz p0, :cond_30

    .line 682
    .line 683
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 684
    .line 685
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 686
    .line 687
    .line 688
    move-result-object v0

    .line 689
    const/16 v1, 0x75

    .line 690
    .line 691
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 692
    .line 693
    .line 694
    :cond_30
    const/16 p0, 0x76

    .line 695
    .line 696
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/User;->deleted:Z

    .line 697
    .line 698
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 699
    .line 700
    .line 701
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->specialEffect:Lcom/p1/mobile/putong/data/SpecialEffect;

    .line 702
    .line 703
    if-eqz p0, :cond_31

    .line 704
    .line 705
    const/16 v0, 0x77

    .line 706
    .line 707
    sget-object v1, Lcom/p1/mobile/putong/data/SpecialEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 708
    .line 709
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 710
    .line 711
    .line 712
    :cond_31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/User;->userActivityInfo:Lcom/p1/mobile/putong/data/UserActivityInfo;

    .line 713
    .line 714
    if-eqz p0, :cond_32

    .line 715
    .line 716
    const/16 p1, 0x78

    .line 717
    .line 718
    sget-object v0, Lcom/p1/mobile/putong/data/UserActivityInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 719
    .line 720
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 721
    .line 722
    .line 723
    :cond_32
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 724
    check-cast p1, Lcom/p1/mobile/putong/data/User;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/User$1;->serialize(Lcom/p1/mobile/putong/data/User;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
