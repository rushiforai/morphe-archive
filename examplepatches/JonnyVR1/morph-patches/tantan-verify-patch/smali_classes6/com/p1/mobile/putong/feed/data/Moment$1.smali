.class Lcom/p1/mobile/putong/feed/data/Moment$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/Moment;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/Moment;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/Moment;)I
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
    const/16 v0, 0x33

    .line 19
    .line 20
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 21
    .line 22
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr p0, v0

    .line 27
    const/16 v0, 0x34

    .line 28
    .line 29
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/16 v0, 0x35

    .line 37
    .line 38
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/2addr p0, v0

    .line 45
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz v0, :cond_1

    .line 48
    .line 49
    const/16 v1, 0x36

    .line 50
    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_1
    const/16 v0, 0x37

    .line 57
    .line 58
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 59
    .line 60
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 61
    .line 62
    .line 63
    move-result v0

    .line 64
    add-int/2addr p0, v0

    .line 65
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz v0, :cond_2

    .line 68
    .line 69
    const/16 v1, 0x38

    .line 70
    .line 71
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 77
    .line 78
    if-eqz v0, :cond_3

    .line 79
    .line 80
    const/16 v1, 0x39

    .line 81
    .line 82
    sget-object v2, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_3
    const/16 v0, 0x3a

    .line 90
    .line 91
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 92
    .line 93
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 99
    .line 100
    if-eqz v0, :cond_4

    .line 101
    .line 102
    const/16 v1, 0x3b

    .line 103
    .line 104
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 112
    .line 113
    if-eqz v0, :cond_5

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    .line 120
    move-result-object v1

    .line 121
    const/16 v2, 0x3c

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz v0, :cond_6

    .line 131
    .line 132
    const/16 v1, 0x3d

    .line 133
    .line 134
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 140
    .line 141
    if-eqz v0, :cond_7

    .line 142
    .line 143
    const/16 v1, 0x3e

    .line 144
    .line 145
    sget-object v2, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 148
    .line 149
    .line 150
    move-result v0

    .line 151
    add-int/2addr p0, v0

    .line 152
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 153
    .line 154
    if-eqz v0, :cond_8

    .line 155
    .line 156
    const/16 v1, 0x3f

    .line 157
    .line 158
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 159
    .line 160
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 161
    .line 162
    .line 163
    move-result v0

    .line 164
    add-int/2addr p0, v0

    .line 165
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 166
    .line 167
    if-eqz v0, :cond_9

    .line 168
    .line 169
    const/16 v1, 0x40

    .line 170
    .line 171
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    add-int/2addr p0, v0

    .line 180
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz v0, :cond_a

    .line 183
    .line 184
    const/16 v1, 0x41

    .line 185
    .line 186
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    add-int/2addr p0, v0

    .line 191
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 192
    .line 193
    if-eqz v0, :cond_b

    .line 194
    .line 195
    const/16 v1, 0x42

    .line 196
    .line 197
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    add-int/2addr p0, v0

    .line 202
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 203
    .line 204
    if-eqz v0, :cond_c

    .line 205
    .line 206
    const/16 v1, 0x43

    .line 207
    .line 208
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 209
    .line 210
    .line 211
    move-result v0

    .line 212
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    add-int/2addr p0, v0

    .line 217
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 218
    .line 219
    if-eqz v0, :cond_d

    .line 220
    .line 221
    sget-object v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    const/16 v2, 0x44

    .line 228
    .line 229
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    add-int/2addr p0, v0

    .line 234
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 235
    .line 236
    if-eqz v0, :cond_e

    .line 237
    .line 238
    const/16 v1, 0x45

    .line 239
    .line 240
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 241
    .line 242
    .line 243
    move-result v0

    .line 244
    add-int/2addr p0, v0

    .line 245
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 246
    .line 247
    if-eqz v0, :cond_f

    .line 248
    .line 249
    const/16 v1, 0x46

    .line 250
    .line 251
    sget-object v2, Lcom/p1/mobile/putong/data/DyMomentSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 252
    .line 253
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    add-int/2addr p0, v0

    .line 258
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 259
    .line 260
    if-eqz v0, :cond_10

    .line 261
    .line 262
    const/16 v1, 0x47

    .line 263
    .line 264
    sget-object v2, Lcom/p1/mobile/putong/data/MomentType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 265
    .line 266
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 267
    .line 268
    .line 269
    move-result v0

    .line 270
    add-int/2addr p0, v0

    .line 271
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 272
    .line 273
    if-eqz v0, :cond_11

    .line 274
    .line 275
    const/16 v1, 0x48

    .line 276
    .line 277
    sget-object v2, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 278
    .line 279
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    add-int/2addr p0, v0

    .line 284
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 285
    .line 286
    if-eqz v0, :cond_12

    .line 287
    .line 288
    const/16 v1, 0x49

    .line 289
    .line 290
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 291
    .line 292
    .line 293
    move-result v0

    .line 294
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 295
    .line 296
    .line 297
    move-result v0

    .line 298
    add-int/2addr p0, v0

    .line 299
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 300
    .line 301
    if-eqz v0, :cond_13

    .line 302
    .line 303
    const/16 v1, 0x4a

    .line 304
    .line 305
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 306
    .line 307
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 308
    .line 309
    .line 310
    move-result v0

    .line 311
    add-int/2addr p0, v0

    .line 312
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 313
    .line 314
    if-eqz v0, :cond_14

    .line 315
    .line 316
    const/16 v1, 0x4b

    .line 317
    .line 318
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 326
    .line 327
    if-eqz v0, :cond_15

    .line 328
    .line 329
    const/16 v1, 0x4c

    .line 330
    .line 331
    sget-object v2, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 339
    .line 340
    if-eqz v0, :cond_16

    .line 341
    .line 342
    const/16 v1, 0x4d

    .line 343
    .line 344
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 345
    .line 346
    .line 347
    move-result v0

    .line 348
    add-int/2addr p0, v0

    .line 349
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 350
    .line 351
    if-eqz v0, :cond_17

    .line 352
    .line 353
    const/16 v1, 0x4e

    .line 354
    .line 355
    sget-object v2, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 356
    .line 357
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    add-int/2addr p0, v0

    .line 362
    :cond_17
    const/16 v0, 0x4f

    .line 363
    .line 364
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 365
    .line 366
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 367
    .line 368
    .line 369
    move-result v0

    .line 370
    add-int/2addr p0, v0

    .line 371
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 372
    .line 373
    if-eqz v0, :cond_18

    .line 374
    .line 375
    const/16 v1, 0x50

    .line 376
    .line 377
    sget-object v2, Lcom/p1/mobile/putong/feed/data/Attitudes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 378
    .line 379
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    add-int/2addr p0, v0

    .line 384
    :cond_18
    const/16 v0, 0x51

    .line 385
    .line 386
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 387
    .line 388
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 389
    .line 390
    .line 391
    move-result v0

    .line 392
    add-int/2addr p0, v0

    .line 393
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 394
    .line 395
    if-eqz v0, :cond_19

    .line 396
    .line 397
    const/16 v1, 0x52

    .line 398
    .line 399
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 400
    .line 401
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 402
    .line 403
    .line 404
    move-result v0

    .line 405
    add-int/2addr p0, v0

    .line 406
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 407
    .line 408
    if-eqz v0, :cond_1a

    .line 409
    .line 410
    const/16 v1, 0x53

    .line 411
    .line 412
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentForwards;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 413
    .line 414
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 415
    .line 416
    .line 417
    move-result v0

    .line 418
    add-int/2addr p0, v0

    .line 419
    :cond_1a
    const/16 v0, 0x54

    .line 420
    .line 421
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 422
    .line 423
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 424
    .line 425
    .line 426
    move-result v0

    .line 427
    add-int/2addr p0, v0

    .line 428
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 429
    .line 430
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 431
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Moment$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/Moment;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/Moment;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/Moment;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/Moment;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    move-object v3, v2

    .line 10
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const-string v5, ""

    .line 15
    .line 16
    sparse-switch v4, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/data/DyMomentSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/data/MomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/data/MomentType;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 78
    .line 79
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 84
    .line 85
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_4

    .line 88
    .line 89
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 90
    .line 91
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 92
    .line 93
    if-nez p1, :cond_5

    .line 94
    .line 95
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 100
    .line 101
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 102
    .line 103
    if-nez p1, :cond_6

    .line 104
    .line 105
    new-instance p1, Ljava/util/ArrayList;

    .line 106
    .line 107
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 108
    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 111
    .line 112
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 113
    .line 114
    if-nez p1, :cond_7

    .line 115
    .line 116
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 117
    .line 118
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 119
    .line 120
    if-nez p1, :cond_8

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 127
    .line 128
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 129
    .line 130
    if-nez p1, :cond_9

    .line 131
    .line 132
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSettings;->new_()Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 133
    .line 134
    .line 135
    move-result-object p1

    .line 136
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 137
    .line 138
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 139
    .line 140
    if-nez p1, :cond_a

    .line 141
    .line 142
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 143
    .line 144
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 145
    .line 146
    if-nez p1, :cond_b

    .line 147
    .line 148
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 149
    .line 150
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 151
    .line 152
    if-nez p1, :cond_c

    .line 153
    .line 154
    new-instance p1, Ljava/util/ArrayList;

    .line 155
    .line 156
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 157
    .line 158
    .line 159
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 160
    .line 161
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 162
    .line 163
    if-nez p1, :cond_d

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/data/Live;->new_()Lcom/p1/mobile/putong/data/Live;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 170
    .line 171
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 172
    .line 173
    if-nez p1, :cond_e

    .line 174
    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->new_()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 180
    .line 181
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 182
    .line 183
    if-nez p1, :cond_f

    .line 184
    .line 185
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 186
    .line 187
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 188
    .line 189
    if-nez p1, :cond_10

    .line 190
    .line 191
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 192
    .line 193
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 194
    .line 195
    if-nez p1, :cond_11

    .line 196
    .line 197
    new-instance p1, Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .line 201
    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 203
    .line 204
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 205
    .line 206
    if-nez p1, :cond_12

    .line 207
    .line 208
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 209
    .line 210
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 211
    .line 212
    if-nez p1, :cond_13

    .line 213
    .line 214
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->new_()Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 219
    .line 220
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 221
    .line 222
    if-nez p1, :cond_14

    .line 223
    .line 224
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->new_()Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 229
    .line 230
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 231
    .line 232
    if-nez p1, :cond_15

    .line 233
    .line 234
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 235
    .line 236
    .line 237
    move-result-object p1

    .line 238
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 239
    .line 240
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 241
    .line 242
    if-nez p1, :cond_16

    .line 243
    .line 244
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 245
    .line 246
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 247
    .line 248
    if-nez p1, :cond_17

    .line 249
    .line 250
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->new_()Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 251
    .line 252
    .line 253
    move-result-object p1

    .line 254
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 255
    .line 256
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 257
    .line 258
    if-nez p1, :cond_18

    .line 259
    .line 260
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Attitudes;->new_()Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 265
    .line 266
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 267
    .line 268
    if-nez p1, :cond_19

    .line 269
    .line 270
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 271
    .line 272
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 277
    .line 278
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 279
    .line 280
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 281
    .line 282
    if-nez p1, :cond_1a

    .line 283
    .line 284
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentForwards;->new_()Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 285
    .line 286
    .line 287
    move-result-object p1

    .line 288
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 289
    .line 290
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 291
    .line 292
    if-nez p1, :cond_1b

    .line 293
    .line 294
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 299
    .line 300
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 301
    .line 302
    if-nez p1, :cond_1c

    .line 303
    .line 304
    new-instance p1, Ljava/util/ArrayList;

    .line 305
    .line 306
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 307
    .line 308
    .line 309
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 310
    .line 311
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 312
    .line 313
    if-nez p1, :cond_3a

    .line 314
    .line 315
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 316
    .line 317
    return-object p0

    .line 318
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 319
    .line 320
    .line 321
    move-result v4

    .line 322
    iput-boolean v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 323
    .line 324
    goto/16 :goto_0

    .line 325
    .line 326
    :sswitch_1
    sget-object v4, Lcom/p1/mobile/putong/feed/data/MomentForwards;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 327
    .line 328
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 329
    .line 330
    .line 331
    move-result-object v4

    .line 332
    check-cast v4, Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 333
    .line 334
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_2
    sget-object v4, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 339
    .line 340
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v4

    .line 344
    check-cast v4, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 345
    .line 346
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 351
    .line 352
    .line 353
    move-result v4

    .line 354
    iput-boolean v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 355
    .line 356
    goto/16 :goto_0

    .line 357
    .line 358
    :sswitch_4
    sget-object v4, Lcom/p1/mobile/putong/feed/data/Attitudes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 359
    .line 360
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 361
    .line 362
    .line 363
    move-result-object v4

    .line 364
    check-cast v4, Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 365
    .line 366
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 367
    .line 368
    goto/16 :goto_0

    .line 369
    .line 370
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 371
    .line 372
    .line 373
    move-result v4

    .line 374
    iput v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 375
    .line 376
    goto/16 :goto_0

    .line 377
    .line 378
    :sswitch_6
    sget-object v4, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 379
    .line 380
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    check-cast v4, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 385
    .line 386
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 387
    .line 388
    goto/16 :goto_0

    .line 389
    .line 390
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 391
    .line 392
    .line 393
    move-result-object v4

    .line 394
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 395
    .line 396
    goto/16 :goto_0

    .line 397
    .line 398
    :sswitch_8
    sget-object v4, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 399
    .line 400
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 401
    .line 402
    .line 403
    move-result-object v4

    .line 404
    check-cast v4, Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 405
    .line 406
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 407
    .line 408
    goto/16 :goto_0

    .line 409
    .line 410
    :sswitch_9
    sget-object v4, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 411
    .line 412
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 413
    .line 414
    .line 415
    move-result-object v4

    .line 416
    check-cast v4, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 417
    .line 418
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_a
    sget-object v4, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 423
    .line 424
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v4

    .line 428
    check-cast v4, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 429
    .line 430
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 431
    .line 432
    goto/16 :goto_0

    .line 433
    .line 434
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 435
    .line 436
    .line 437
    move-result v3

    .line 438
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 439
    .line 440
    .line 441
    move-result-object v3

    .line 442
    goto/16 :goto_0

    .line 443
    .line 444
    :sswitch_c
    sget-object v4, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 445
    .line 446
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 447
    .line 448
    .line 449
    move-result-object v4

    .line 450
    check-cast v4, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 451
    .line 452
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 453
    .line 454
    goto/16 :goto_0

    .line 455
    .line 456
    :sswitch_d
    sget-object v4, Lcom/p1/mobile/putong/data/MomentType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 457
    .line 458
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 459
    .line 460
    .line 461
    move-result-object v4

    .line 462
    check-cast v4, Lcom/p1/mobile/putong/data/MomentType;

    .line 463
    .line 464
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 465
    .line 466
    goto/16 :goto_0

    .line 467
    .line 468
    :sswitch_e
    sget-object v4, Lcom/p1/mobile/putong/data/DyMomentSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 469
    .line 470
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 471
    .line 472
    .line 473
    move-result-object v4

    .line 474
    check-cast v4, Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 475
    .line 476
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 477
    .line 478
    goto/16 :goto_0

    .line 479
    .line 480
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 481
    .line 482
    .line 483
    move-result-object v4

    .line 484
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 485
    .line 486
    goto/16 :goto_0

    .line 487
    .line 488
    :sswitch_10
    sget-object v4, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 489
    .line 490
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 491
    .line 492
    .line 493
    move-result-object v4

    .line 494
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 495
    .line 496
    .line 497
    move-result-object v4

    .line 498
    check-cast v4, Ljava/util/List;

    .line 499
    .line 500
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 501
    .line 502
    goto/16 :goto_0

    .line 503
    .line 504
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 505
    .line 506
    .line 507
    move-result v2

    .line 508
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 509
    .line 510
    .line 511
    move-result-object v2

    .line 512
    goto/16 :goto_0

    .line 513
    .line 514
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 515
    .line 516
    .line 517
    move-result-object v4

    .line 518
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 519
    .line 520
    goto/16 :goto_0

    .line 521
    .line 522
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 523
    .line 524
    .line 525
    move-result-object v4

    .line 526
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 527
    .line 528
    goto/16 :goto_0

    .line 529
    .line 530
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 531
    .line 532
    .line 533
    move-result v1

    .line 534
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 535
    .line 536
    .line 537
    move-result-object v1

    .line 538
    goto/16 :goto_0

    .line 539
    .line 540
    :sswitch_15
    sget-object v4, Lcom/p1/mobile/putong/feed/data/MomentSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 541
    .line 542
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 543
    .line 544
    .line 545
    move-result-object v4

    .line 546
    check-cast v4, Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 547
    .line 548
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 549
    .line 550
    goto/16 :goto_0

    .line 551
    .line 552
    :sswitch_16
    sget-object v4, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 553
    .line 554
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 555
    .line 556
    .line 557
    move-result-object v4

    .line 558
    check-cast v4, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 559
    .line 560
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 561
    .line 562
    goto/16 :goto_0

    .line 563
    .line 564
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 565
    .line 566
    .line 567
    move-result-object v4

    .line 568
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 569
    .line 570
    goto/16 :goto_0

    .line 571
    .line 572
    :sswitch_18
    sget-object v4, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 573
    .line 574
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 575
    .line 576
    .line 577
    move-result-object v4

    .line 578
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 579
    .line 580
    .line 581
    move-result-object v4

    .line 582
    check-cast v4, Ljava/util/List;

    .line 583
    .line 584
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 585
    .line 586
    goto/16 :goto_0

    .line 587
    .line 588
    :sswitch_19
    sget-object v4, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 589
    .line 590
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 591
    .line 592
    .line 593
    move-result-object v4

    .line 594
    check-cast v4, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 595
    .line 596
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 597
    .line 598
    goto/16 :goto_0

    .line 599
    .line 600
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 601
    .line 602
    .line 603
    move-result v4

    .line 604
    iput-boolean v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 605
    .line 606
    goto/16 :goto_0

    .line 607
    .line 608
    :sswitch_1b
    sget-object v4, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 609
    .line 610
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 611
    .line 612
    .line 613
    move-result-object v4

    .line 614
    check-cast v4, Lcom/p1/mobile/putong/data/PartialIdList;

    .line 615
    .line 616
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 617
    .line 618
    goto/16 :goto_0

    .line 619
    .line 620
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 621
    .line 622
    .line 623
    move-result-object v4

    .line 624
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 625
    .line 626
    goto/16 :goto_0

    .line 627
    .line 628
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 629
    .line 630
    .line 631
    move-result-wide v4

    .line 632
    iput-wide v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 633
    .line 634
    goto/16 :goto_0

    .line 635
    .line 636
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 637
    .line 638
    .line 639
    move-result-object v4

    .line 640
    iput-object v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 641
    .line 642
    goto/16 :goto_0

    .line 643
    .line 644
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 645
    .line 646
    .line 647
    move-result v4

    .line 648
    iput-boolean v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 649
    .line 650
    goto/16 :goto_0

    .line 651
    .line 652
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 653
    .line 654
    .line 655
    move-result v4

    .line 656
    iput-boolean v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 657
    .line 658
    goto/16 :goto_0

    .line 659
    .line 660
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 661
    .line 662
    .line 663
    move-result v4

    .line 664
    iput v4, p0, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 665
    .line 666
    goto/16 :goto_0

    .line 667
    .line 668
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 669
    .line 670
    .line 671
    move-result-object v4

    .line 672
    iput-object v4, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 673
    .line 674
    goto/16 :goto_0

    .line 675
    .line 676
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 677
    .line 678
    .line 679
    move-result-wide v4

    .line 680
    iput-wide v4, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 681
    .line 682
    goto/16 :goto_0

    .line 683
    .line 684
    :sswitch_24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 685
    .line 686
    if-nez p1, :cond_1d

    .line 687
    .line 688
    if-eqz v1, :cond_1d

    .line 689
    .line 690
    sget-object p1, Lcom/p1/mobile/putong/data/DyMomentSource;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 691
    .line 692
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 693
    .line 694
    .line 695
    move-result v1

    .line 696
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 697
    .line 698
    .line 699
    move-result-object p1

    .line 700
    check-cast p1, Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 701
    .line 702
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 703
    .line 704
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 705
    .line 706
    if-nez p1, :cond_1e

    .line 707
    .line 708
    if-eqz v2, :cond_1e

    .line 709
    .line 710
    sget-object p1, Lcom/p1/mobile/putong/data/MomentType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 711
    .line 712
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 713
    .line 714
    .line 715
    move-result v1

    .line 716
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 717
    .line 718
    .line 719
    move-result-object p1

    .line 720
    check-cast p1, Lcom/p1/mobile/putong/data/MomentType;

    .line 721
    .line 722
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 723
    .line 724
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 725
    .line 726
    if-nez p1, :cond_1f

    .line 727
    .line 728
    if-eqz v3, :cond_1f

    .line 729
    .line 730
    sget-object p1, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 731
    .line 732
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 733
    .line 734
    .line 735
    move-result v1

    .line 736
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 737
    .line 738
    .line 739
    move-result-object p1

    .line 740
    check-cast p1, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 741
    .line 742
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 743
    .line 744
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 745
    .line 746
    if-nez p1, :cond_20

    .line 747
    .line 748
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 749
    .line 750
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 751
    .line 752
    if-nez p1, :cond_21

    .line 753
    .line 754
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 755
    .line 756
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 757
    .line 758
    if-nez p1, :cond_22

    .line 759
    .line 760
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 761
    .line 762
    .line 763
    move-result-object p1

    .line 764
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 765
    .line 766
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 767
    .line 768
    if-nez p1, :cond_23

    .line 769
    .line 770
    new-instance p1, Ljava/util/ArrayList;

    .line 771
    .line 772
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 773
    .line 774
    .line 775
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 776
    .line 777
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 778
    .line 779
    if-nez p1, :cond_24

    .line 780
    .line 781
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 782
    .line 783
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 784
    .line 785
    if-nez p1, :cond_25

    .line 786
    .line 787
    invoke-static {}, Lcom/p1/mobile/putong/data/PartialIdList;->new_()Lcom/p1/mobile/putong/data/PartialIdList;

    .line 788
    .line 789
    .line 790
    move-result-object p1

    .line 791
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 792
    .line 793
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 794
    .line 795
    if-nez p1, :cond_26

    .line 796
    .line 797
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSettings;->new_()Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 798
    .line 799
    .line 800
    move-result-object p1

    .line 801
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 802
    .line 803
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 804
    .line 805
    if-nez p1, :cond_27

    .line 806
    .line 807
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 808
    .line 809
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 810
    .line 811
    if-nez p1, :cond_28

    .line 812
    .line 813
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 814
    .line 815
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 816
    .line 817
    if-nez p1, :cond_29

    .line 818
    .line 819
    new-instance p1, Ljava/util/ArrayList;

    .line 820
    .line 821
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 822
    .line 823
    .line 824
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 825
    .line 826
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 827
    .line 828
    if-nez p1, :cond_2a

    .line 829
    .line 830
    invoke-static {}, Lcom/p1/mobile/putong/data/Live;->new_()Lcom/p1/mobile/putong/data/Live;

    .line 831
    .line 832
    .line 833
    move-result-object p1

    .line 834
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->live:Lcom/p1/mobile/putong/data/Live;

    .line 835
    .line 836
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 837
    .line 838
    if-nez p1, :cond_2b

    .line 839
    .line 840
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/VoiceLive;->new_()Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 841
    .line 842
    .line 843
    move-result-object p1

    .line 844
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->voiceLive:Lcom/p1/mobile/putong/feed/data/VoiceLive;

    .line 845
    .line 846
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 847
    .line 848
    if-nez p1, :cond_2c

    .line 849
    .line 850
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->liveState:Ljava/lang/String;

    .line 851
    .line 852
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 853
    .line 854
    if-nez p1, :cond_2d

    .line 855
    .line 856
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->iconTitle:Ljava/lang/String;

    .line 857
    .line 858
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 859
    .line 860
    if-nez p1, :cond_2e

    .line 861
    .line 862
    new-instance p1, Ljava/util/ArrayList;

    .line 863
    .line 864
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 865
    .line 866
    .line 867
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->labels:Ljava/util/List;

    .line 868
    .line 869
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 870
    .line 871
    if-nez p1, :cond_2f

    .line 872
    .line 873
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 874
    .line 875
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 876
    .line 877
    if-nez p1, :cond_30

    .line 878
    .line 879
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->new_()Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 880
    .line 881
    .line 882
    move-result-object p1

    .line 883
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 884
    .line 885
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 886
    .line 887
    if-nez p1, :cond_31

    .line 888
    .line 889
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->new_()Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 890
    .line 891
    .line 892
    move-result-object p1

    .line 893
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 894
    .line 895
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 896
    .line 897
    if-nez p1, :cond_32

    .line 898
    .line 899
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->new_()Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 900
    .line 901
    .line 902
    move-result-object p1

    .line 903
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 904
    .line 905
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 906
    .line 907
    if-nez p1, :cond_33

    .line 908
    .line 909
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 910
    .line 911
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 912
    .line 913
    if-nez p1, :cond_34

    .line 914
    .line 915
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->new_()Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 916
    .line 917
    .line 918
    move-result-object p1

    .line 919
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 920
    .line 921
    :cond_34
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 922
    .line 923
    if-nez p1, :cond_35

    .line 924
    .line 925
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Attitudes;->new_()Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 926
    .line 927
    .line 928
    move-result-object p1

    .line 929
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 930
    .line 931
    :cond_35
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 932
    .line 933
    if-nez p1, :cond_36

    .line 934
    .line 935
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 936
    .line 937
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 938
    .line 939
    .line 940
    move-result-object p1

    .line 941
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 942
    .line 943
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 944
    .line 945
    :cond_36
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 946
    .line 947
    if-nez p1, :cond_37

    .line 948
    .line 949
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentForwards;->new_()Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 950
    .line 951
    .line 952
    move-result-object p1

    .line 953
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 954
    .line 955
    :cond_37
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 956
    .line 957
    if-nez p1, :cond_38

    .line 958
    .line 959
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 960
    .line 961
    .line 962
    move-result-object p1

    .line 963
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 964
    .line 965
    :cond_38
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 966
    .line 967
    if-nez p1, :cond_39

    .line 968
    .line 969
    new-instance p1, Ljava/util/ArrayList;

    .line 970
    .line 971
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 972
    .line 973
    .line 974
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->notifyUsers:Ljava/util/List;

    .line 975
    .line 976
    :cond_39
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 977
    .line 978
    if-nez p1, :cond_3a

    .line 979
    .line 980
    iput-object v5, p0, Lcom/p1/mobile/putong/feed/data/Moment;->report:Ljava/lang/String;

    .line 981
    .line 982
    :cond_3a
    return-object p0

    .line 983
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_24
        0x8 -> :sswitch_23
        0x12 -> :sswitch_22
        0x198 -> :sswitch_21
        0x1a0 -> :sswitch_20
        0x1a8 -> :sswitch_1f
        0x1b2 -> :sswitch_1e
        0x1b9 -> :sswitch_1d
        0x1c2 -> :sswitch_1c
        0x1ca -> :sswitch_1b
        0x1d0 -> :sswitch_1a
        0x1da -> :sswitch_19
        0x1e2 -> :sswitch_18
        0x1ea -> :sswitch_17
        0x1f2 -> :sswitch_16
        0x1fa -> :sswitch_15
        0x200 -> :sswitch_14
        0x20a -> :sswitch_13
        0x212 -> :sswitch_12
        0x218 -> :sswitch_11
        0x222 -> :sswitch_10
        0x22a -> :sswitch_f
        0x232 -> :sswitch_e
        0x23a -> :sswitch_d
        0x242 -> :sswitch_c
        0x248 -> :sswitch_b
        0x252 -> :sswitch_a
        0x25a -> :sswitch_9
        0x262 -> :sswitch_8
        0x26a -> :sswitch_7
        0x272 -> :sswitch_6
        0x278 -> :sswitch_5
        0x282 -> :sswitch_4
        0x288 -> :sswitch_3
        0x292 -> :sswitch_2
        0x29a -> :sswitch_1
        0x2a0 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 983
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Moment$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/Moment;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    const/16 p0, 0x33

    .line 16
    .line 17
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localCreatedSession:I

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x34

    .line 23
    .line 24
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInFeed:Z

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x35

    .line 30
    .line 31
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->localInUserFeed:Z

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 34
    .line 35
    .line 36
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->value:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz p0, :cond_1

    .line 39
    .line 40
    const/16 v0, 0x36

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_1
    const/16 p0, 0x37

    .line 46
    .line 47
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->createdTime:D

    .line 48
    .line 49
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 50
    .line 51
    .line 52
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->owner:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz p0, :cond_2

    .line 55
    .line 56
    const/16 v0, 0x38

    .line 57
    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->likes:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 62
    .line 63
    if-eqz p0, :cond_3

    .line 64
    .line 65
    const/16 v0, 0x39

    .line 66
    .line 67
    sget-object v1, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 68
    .line 69
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 70
    .line 71
    .line 72
    :cond_3
    const/16 p0, 0x3a

    .line 73
    .line 74
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->haveLiked:Z

    .line 75
    .line 76
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 77
    .line 78
    .line 79
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->location:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 80
    .line 81
    if-eqz p0, :cond_4

    .line 82
    .line 83
    const/16 v0, 0x3b

    .line 84
    .line 85
    sget-object v1, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 88
    .line 89
    .line 90
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->media:Ljava/util/List;

    .line 91
    .line 92
    if-eqz p0, :cond_5

    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    const/16 v1, 0x3c

    .line 101
    .line 102
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 103
    .line 104
    .line 105
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->landingPage:Ljava/lang/String;

    .line 106
    .line 107
    if-eqz p0, :cond_6

    .line 108
    .line 109
    const/16 v0, 0x3d

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 112
    .line 113
    .line 114
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->messages:Lcom/p1/mobile/putong/data/PartialIdList;

    .line 115
    .line 116
    if-eqz p0, :cond_7

    .line 117
    .line 118
    const/16 v0, 0x3e

    .line 119
    .line 120
    sget-object v1, Lcom/p1/mobile/putong/data/PartialIdList;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 123
    .line 124
    .line 125
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->settings:Lcom/p1/mobile/putong/feed/data/MomentSettings;

    .line 126
    .line 127
    if-eqz p0, :cond_8

    .line 128
    .line 129
    const/16 v0, 0x3f

    .line 130
    .line 131
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 134
    .line 135
    .line 136
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 137
    .line 138
    if-eqz p0, :cond_9

    .line 139
    .line 140
    const/16 v0, 0x40

    .line 141
    .line 142
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 143
    .line 144
    .line 145
    move-result p0

    .line 146
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 147
    .line 148
    .line 149
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->musicId:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz p0, :cond_a

    .line 152
    .line 153
    const/16 v0, 0x41

    .line 154
    .line 155
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 156
    .line 157
    .line 158
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->status:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz p0, :cond_b

    .line 161
    .line 162
    const/16 v0, 0x42

    .line 163
    .line 164
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 168
    .line 169
    if-eqz p0, :cond_c

    .line 170
    .line 171
    const/16 v0, 0x43

    .line 172
    .line 173
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 174
    .line 175
    .line 176
    move-result p0

    .line 177
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 178
    .line 179
    .line 180
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->topics:Ljava/util/List;

    .line 181
    .line 182
    if-eqz p0, :cond_d

    .line 183
    .line 184
    sget-object v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    const/16 v1, 0x44

    .line 191
    .line 192
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 193
    .line 194
    .line 195
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->hyperlink:Ljava/lang/String;

    .line 196
    .line 197
    if-eqz p0, :cond_e

    .line 198
    .line 199
    const/16 v0, 0x45

    .line 200
    .line 201
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 202
    .line 203
    .line 204
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->dynamicType:Lcom/p1/mobile/putong/data/DyMomentSource;

    .line 205
    .line 206
    if-eqz p0, :cond_f

    .line 207
    .line 208
    const/16 v0, 0x46

    .line 209
    .line 210
    sget-object v1, Lcom/p1/mobile/putong/data/DyMomentSource;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 213
    .line 214
    .line 215
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->momentType:Lcom/p1/mobile/putong/data/MomentType;

    .line 216
    .line 217
    if-eqz p0, :cond_10

    .line 218
    .line 219
    const/16 v0, 0x47

    .line 220
    .line 221
    sget-object v1, Lcom/p1/mobile/putong/data/MomentType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 222
    .line 223
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 224
    .line 225
    .line 226
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 227
    .line 228
    if-eqz p0, :cond_11

    .line 229
    .line 230
    const/16 v0, 0x48

    .line 231
    .line 232
    sget-object v1, Lcom/p1/mobile/putong/feed/data/UserSetVisibility;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 233
    .line 234
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 235
    .line 236
    .line 237
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->userSetVisibility:Lcom/p1/mobile/putong/feed/data/UserSetVisibility;

    .line 238
    .line 239
    if-eqz p0, :cond_12

    .line 240
    .line 241
    const/16 v0, 0x49

    .line 242
    .line 243
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 244
    .line 245
    .line 246
    move-result p0

    .line 247
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 248
    .line 249
    .line 250
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->simpleActivity:Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;

    .line 251
    .line 252
    if-eqz p0, :cond_13

    .line 253
    .line 254
    const/16 v0, 0x4a

    .line 255
    .line 256
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentSimpleActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 257
    .line 258
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 259
    .line 260
    .line 261
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->additionalData:Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;

    .line 262
    .line 263
    if-eqz p0, :cond_14

    .line 264
    .line 265
    const/16 v0, 0x4b

    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentAdditionalData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 270
    .line 271
    .line 272
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->group:Lcom/p1/mobile/putong/feed/data/GroupIdBox;

    .line 273
    .line 274
    if-eqz p0, :cond_15

    .line 275
    .line 276
    const/16 v0, 0x4c

    .line 277
    .line 278
    sget-object v1, Lcom/p1/mobile/putong/feed/data/GroupIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 281
    .line 282
    .line 283
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->deeplink:Ljava/lang/String;

    .line 284
    .line 285
    if-eqz p0, :cond_16

    .line 286
    .line 287
    const/16 v0, 0x4d

    .line 288
    .line 289
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 290
    .line 291
    .line 292
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->thirdShareSource:Lcom/p1/mobile/putong/feed/data/ThirdShareSource;

    .line 293
    .line 294
    if-eqz p0, :cond_17

    .line 295
    .line 296
    const/16 v0, 0x4e

    .line 297
    .line 298
    sget-object v1, Lcom/p1/mobile/putong/feed/data/ThirdShareSource;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    .line 300
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 301
    .line 302
    .line 303
    :cond_17
    const/16 p0, 0x4f

    .line 304
    .line 305
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudeId:I

    .line 306
    .line 307
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 308
    .line 309
    .line 310
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->attitudes:Lcom/p1/mobile/putong/feed/data/Attitudes;

    .line 311
    .line 312
    if-eqz p0, :cond_18

    .line 313
    .line 314
    const/16 v0, 0x50

    .line 315
    .line 316
    sget-object v1, Lcom/p1/mobile/putong/feed/data/Attitudes;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 317
    .line 318
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 319
    .line 320
    .line 321
    :cond_18
    const/16 p0, 0x51

    .line 322
    .line 323
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->shareMyVote:Z

    .line 324
    .line 325
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 326
    .line 327
    .line 328
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->allowForward:Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;

    .line 329
    .line 330
    if-eqz p0, :cond_19

    .line 331
    .line 332
    const/16 v0, 0x52

    .line 333
    .line 334
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentAllowForwardState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 335
    .line 336
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 337
    .line 338
    .line 339
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Moment;->forwards:Lcom/p1/mobile/putong/feed/data/MomentForwards;

    .line 340
    .line 341
    if-eqz p0, :cond_1a

    .line 342
    .line 343
    const/16 v0, 0x53

    .line 344
    .line 345
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentForwards;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 346
    .line 347
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 348
    .line 349
    .line 350
    :cond_1a
    const/16 p0, 0x54

    .line 351
    .line 352
    iget-boolean p1, p1, Lcom/p1/mobile/putong/feed/data/Moment;->isNewUserAIMoment:Z

    .line 353
    .line 354
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 355
    .line 356
    .line 357
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 358
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Moment;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Moment$1;->serialize(Lcom/p1/mobile/putong/feed/data/Moment;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
