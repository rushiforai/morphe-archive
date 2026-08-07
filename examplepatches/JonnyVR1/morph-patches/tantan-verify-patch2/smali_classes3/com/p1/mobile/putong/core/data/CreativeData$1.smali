.class Lcom/p1/mobile/putong/core/data/CreativeData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CreativeData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CreativeData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CreativeData;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 22
    .line 23
    .line 24
    move-result-wide v2

    .line 25
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x3

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    invoke-static {v0}, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 59
    .line 60
    .line 61
    move-result-object v0

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/4 v2, 0x5

    .line 69
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 75
    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    const/4 v1, 0x6

    .line 79
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 80
    .line 81
    .line 82
    move-result-wide v2

    .line 83
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 84
    .line 85
    .line 86
    move-result v0

    .line 87
    add-int/2addr p0, v0

    .line 88
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 89
    .line 90
    if-eqz v0, :cond_6

    .line 91
    .line 92
    const/4 v1, 0x7

    .line 93
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 94
    .line 95
    .line 96
    move-result-wide v2

    .line 97
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_6
    const/16 v0, 0x8

    .line 103
    .line 104
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 105
    .line 106
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    const/16 v0, 0x9

    .line 112
    .line 113
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 114
    .line 115
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz v0, :cond_7

    .line 123
    .line 124
    const/16 v1, 0xa

    .line 125
    .line 126
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz v0, :cond_8

    .line 134
    .line 135
    const/16 v1, 0xb

    .line 136
    .line 137
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 143
    .line 144
    if-eqz v0, :cond_9

    .line 145
    .line 146
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 147
    .line 148
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 149
    .line 150
    .line 151
    move-result-object v1

    .line 152
    const/16 v2, 0xc

    .line 153
    .line 154
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 155
    .line 156
    .line 157
    move-result v0

    .line 158
    add-int/2addr p0, v0

    .line 159
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 160
    .line 161
    if-eqz v0, :cond_a

    .line 162
    .line 163
    const/16 v1, 0xd

    .line 164
    .line 165
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    add-int/2addr p0, v0

    .line 170
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 171
    .line 172
    if-eqz v0, :cond_b

    .line 173
    .line 174
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    const/16 v2, 0xe

    .line 181
    .line 182
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 183
    .line 184
    .line 185
    move-result v0

    .line 186
    add-int/2addr p0, v0

    .line 187
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v0, :cond_c

    .line 190
    .line 191
    const/16 v1, 0xf

    .line 192
    .line 193
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 194
    .line 195
    .line 196
    move-result v0

    .line 197
    add-int/2addr p0, v0

    .line 198
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 199
    .line 200
    if-eqz v0, :cond_d

    .line 201
    .line 202
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    .line 204
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    .line 207
    move-result-object v1

    .line 208
    const/16 v2, 0x10

    .line 209
    .line 210
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    add-int/2addr p0, v0

    .line 215
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 216
    .line 217
    if-eqz v0, :cond_e

    .line 218
    .line 219
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 220
    .line 221
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    .line 224
    move-result-object v1

    .line 225
    const/16 v2, 0x11

    .line 226
    .line 227
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    add-int/2addr p0, v0

    .line 232
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 233
    .line 234
    if-eqz v0, :cond_f

    .line 235
    .line 236
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    .line 238
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    .line 241
    move-result-object v1

    .line 242
    const/16 v2, 0x12

    .line 243
    .line 244
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 245
    .line 246
    .line 247
    move-result v0

    .line 248
    add-int/2addr p0, v0

    .line 249
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 250
    .line 251
    if-eqz v0, :cond_10

    .line 252
    .line 253
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    .line 255
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 256
    .line 257
    .line 258
    move-result-object v1

    .line 259
    const/16 v2, 0x13

    .line 260
    .line 261
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    add-int/2addr p0, v0

    .line 266
    :cond_10
    const/16 v0, 0x14

    .line 267
    .line 268
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 269
    .line 270
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 271
    .line 272
    .line 273
    move-result v0

    .line 274
    add-int/2addr p0, v0

    .line 275
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 276
    .line 277
    if-eqz v0, :cond_11

    .line 278
    .line 279
    const/16 v1, 0x15

    .line 280
    .line 281
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 282
    .line 283
    .line 284
    move-result v0

    .line 285
    add-int/2addr p0, v0

    .line 286
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 287
    .line 288
    if-eqz v0, :cond_12

    .line 289
    .line 290
    const/16 v1, 0x16

    .line 291
    .line 292
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    add-int/2addr p0, v0

    .line 297
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 298
    .line 299
    if-eqz v0, :cond_13

    .line 300
    .line 301
    const/16 v1, 0x17

    .line 302
    .line 303
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 304
    .line 305
    .line 306
    move-result v0

    .line 307
    add-int/2addr p0, v0

    .line 308
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 309
    .line 310
    if-eqz v0, :cond_14

    .line 311
    .line 312
    const/16 v1, 0x18

    .line 313
    .line 314
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 315
    .line 316
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 317
    .line 318
    .line 319
    move-result v0

    .line 320
    add-int/2addr p0, v0

    .line 321
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 322
    .line 323
    if-eqz v0, :cond_15

    .line 324
    .line 325
    sget-object v1, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 326
    .line 327
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 328
    .line 329
    .line 330
    move-result-object v1

    .line 331
    const/16 v2, 0x19

    .line 332
    .line 333
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 334
    .line 335
    .line 336
    move-result v0

    .line 337
    add-int/2addr p0, v0

    .line 338
    :cond_15
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 339
    .line 340
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 341
    check-cast p1, Lcom/p1/mobile/putong/core/data/CreativeData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CreativeData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CreativeData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CreativeData;
    .locals 7
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const-wide/16 v0, 0x0

    .line 2
    .line 3
    invoke-static {v0, v1}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 4
    .line 5
    .line 6
    move-result-object p0

    .line 7
    const-wide/16 v0, 0x0

    .line 8
    .line 9
    invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 10
    .line 11
    .line 12
    move-result-object v0

    .line 13
    new-instance v1, Lcom/p1/mobile/putong/core/data/CreativeData;

    .line 14
    .line 15
    invoke-direct {v1}, Lcom/p1/mobile/putong/core/data/CreativeData;-><init>()V

    .line 16
    .line 17
    .line 18
    const/4 v2, 0x0

    .line 19
    move-object v3, v2

    .line 20
    move-object v4, v3

    .line 21
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 22
    .line 23
    .line 24
    move-result v5

    .line 25
    const-string v6, ""

    .line 26
    .line 27
    sparse-switch v5, :sswitch_data_0

    .line 28
    .line 29
    .line 30
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 31
    .line 32
    if-nez p1, :cond_0

    .line 33
    .line 34
    if-eqz v3, :cond_0

    .line 35
    .line 36
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 37
    .line 38
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 39
    .line 40
    .line 41
    move-result v3

    .line 42
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 43
    .line 44
    .line 45
    move-result-object p1

    .line 46
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 47
    .line 48
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 49
    .line 50
    :cond_0
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 51
    .line 52
    if-nez p1, :cond_1

    .line 53
    .line 54
    if-eqz v4, :cond_1

    .line 55
    .line 56
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 61
    .line 62
    :cond_1
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 67
    .line 68
    :cond_2
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 73
    .line 74
    :cond_3
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 85
    .line 86
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 87
    .line 88
    :cond_4
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 93
    .line 94
    :cond_5
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 95
    .line 96
    if-nez p1, :cond_6

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 104
    .line 105
    :cond_6
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 106
    .line 107
    if-nez p1, :cond_7

    .line 108
    .line 109
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 110
    .line 111
    :cond_7
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 112
    .line 113
    if-nez p1, :cond_8

    .line 114
    .line 115
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 116
    .line 117
    :cond_8
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 118
    .line 119
    if-nez p0, :cond_9

    .line 120
    .line 121
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 122
    .line 123
    :cond_9
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 124
    .line 125
    if-nez p0, :cond_a

    .line 126
    .line 127
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 128
    .line 129
    :cond_a
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 130
    .line 131
    if-nez p0, :cond_b

    .line 132
    .line 133
    new-instance p0, Ljava/util/ArrayList;

    .line 134
    .line 135
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 136
    .line 137
    .line 138
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 139
    .line 140
    :cond_b
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p0, :cond_c

    .line 143
    .line 144
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 145
    .line 146
    :cond_c
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 147
    .line 148
    if-nez p0, :cond_d

    .line 149
    .line 150
    new-instance p0, Ljava/util/ArrayList;

    .line 151
    .line 152
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 153
    .line 154
    .line 155
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 156
    .line 157
    :cond_d
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 158
    .line 159
    if-nez p0, :cond_e

    .line 160
    .line 161
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 162
    .line 163
    :cond_e
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 164
    .line 165
    if-nez p0, :cond_f

    .line 166
    .line 167
    new-instance p0, Ljava/util/ArrayList;

    .line 168
    .line 169
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 170
    .line 171
    .line 172
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 173
    .line 174
    :cond_f
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 175
    .line 176
    if-nez p0, :cond_10

    .line 177
    .line 178
    new-instance p0, Ljava/util/ArrayList;

    .line 179
    .line 180
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 181
    .line 182
    .line 183
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 184
    .line 185
    :cond_10
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 186
    .line 187
    if-nez p0, :cond_11

    .line 188
    .line 189
    new-instance p0, Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 195
    .line 196
    :cond_11
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 197
    .line 198
    if-nez p0, :cond_12

    .line 199
    .line 200
    new-instance p0, Ljava/util/ArrayList;

    .line 201
    .line 202
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 203
    .line 204
    .line 205
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 206
    .line 207
    :cond_12
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 208
    .line 209
    if-nez p0, :cond_13

    .line 210
    .line 211
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 212
    .line 213
    :cond_13
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 214
    .line 215
    if-nez p0, :cond_14

    .line 216
    .line 217
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 218
    .line 219
    :cond_14
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 220
    .line 221
    if-nez p0, :cond_2a

    .line 222
    .line 223
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 224
    .line 225
    return-object v1

    .line 226
    :sswitch_0
    sget-object v5, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 227
    .line 228
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    .line 231
    move-result-object v5

    .line 232
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 233
    .line 234
    .line 235
    move-result-object v5

    .line 236
    check-cast v5, Ljava/util/List;

    .line 237
    .line 238
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 239
    .line 240
    goto/16 :goto_0

    .line 241
    .line 242
    :sswitch_1
    sget-object v5, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 245
    .line 246
    .line 247
    move-result-object v5

    .line 248
    check-cast v5, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 249
    .line 250
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 251
    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v5

    .line 258
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 263
    .line 264
    .line 265
    move-result-object v5

    .line 266
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 267
    .line 268
    goto/16 :goto_0

    .line 269
    .line 270
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 279
    .line 280
    .line 281
    move-result v5

    .line 282
    iput-boolean v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :sswitch_6
    sget-object v5, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 287
    .line 288
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 289
    .line 290
    .line 291
    move-result-object v5

    .line 292
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 293
    .line 294
    .line 295
    move-result-object v5

    .line 296
    check-cast v5, Ljava/util/List;

    .line 297
    .line 298
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :sswitch_7
    sget-object v5, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 303
    .line 304
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 305
    .line 306
    .line 307
    move-result-object v5

    .line 308
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 309
    .line 310
    .line 311
    move-result-object v5

    .line 312
    check-cast v5, Ljava/util/List;

    .line 313
    .line 314
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 315
    .line 316
    goto/16 :goto_0

    .line 317
    .line 318
    :sswitch_8
    sget-object v5, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 319
    .line 320
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 321
    .line 322
    .line 323
    move-result-object v5

    .line 324
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 325
    .line 326
    .line 327
    move-result-object v5

    .line 328
    check-cast v5, Ljava/util/List;

    .line 329
    .line 330
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 331
    .line 332
    goto/16 :goto_0

    .line 333
    .line 334
    :sswitch_9
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 335
    .line 336
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 337
    .line 338
    .line 339
    move-result-object v5

    .line 340
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 341
    .line 342
    .line 343
    move-result-object v5

    .line 344
    check-cast v5, Ljava/util/List;

    .line 345
    .line 346
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 351
    .line 352
    .line 353
    move-result-object v5

    .line 354
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 355
    .line 356
    goto/16 :goto_0

    .line 357
    .line 358
    :sswitch_b
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 359
    .line 360
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 361
    .line 362
    .line 363
    move-result-object v5

    .line 364
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 365
    .line 366
    .line 367
    move-result-object v5

    .line 368
    check-cast v5, Ljava/util/List;

    .line 369
    .line 370
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 371
    .line 372
    goto/16 :goto_0

    .line 373
    .line 374
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 375
    .line 376
    .line 377
    move-result-object v5

    .line 378
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 379
    .line 380
    goto/16 :goto_0

    .line 381
    .line 382
    :sswitch_d
    sget-object v5, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 383
    .line 384
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 385
    .line 386
    .line 387
    move-result-object v5

    .line 388
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 389
    .line 390
    .line 391
    move-result-object v5

    .line 392
    check-cast v5, Ljava/util/List;

    .line 393
    .line 394
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 395
    .line 396
    goto/16 :goto_0

    .line 397
    .line 398
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 399
    .line 400
    .line 401
    move-result-object v5

    .line 402
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 403
    .line 404
    goto/16 :goto_0

    .line 405
    .line 406
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 407
    .line 408
    .line 409
    move-result-object v5

    .line 410
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 411
    .line 412
    goto/16 :goto_0

    .line 413
    .line 414
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 415
    .line 416
    .line 417
    move-result v5

    .line 418
    iput-boolean v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 419
    .line 420
    goto/16 :goto_0

    .line 421
    .line 422
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 423
    .line 424
    .line 425
    move-result v5

    .line 426
    iput-boolean v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 427
    .line 428
    goto/16 :goto_0

    .line 429
    .line 430
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 431
    .line 432
    .line 433
    move-result-wide v5

    .line 434
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 435
    .line 436
    .line 437
    move-result-object v5

    .line 438
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 439
    .line 440
    goto/16 :goto_0

    .line 441
    .line 442
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 443
    .line 444
    .line 445
    move-result-wide v5

    .line 446
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 447
    .line 448
    .line 449
    move-result-object v5

    .line 450
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 451
    .line 452
    goto/16 :goto_0

    .line 453
    .line 454
    :sswitch_14
    sget-object v4, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 455
    .line 456
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 457
    .line 458
    .line 459
    move-result-object v4

    .line 460
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    move-result-object v4

    .line 464
    check-cast v4, Ljava/util/List;

    .line 465
    .line 466
    goto/16 :goto_0

    .line 467
    .line 468
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 469
    .line 470
    .line 471
    move-result-object v5

    .line 472
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 473
    .line 474
    goto/16 :goto_0

    .line 475
    .line 476
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 477
    .line 478
    .line 479
    move-result v3

    .line 480
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 481
    .line 482
    .line 483
    move-result-object v3

    .line 484
    goto/16 :goto_0

    .line 485
    .line 486
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 487
    .line 488
    .line 489
    move-result-wide v5

    .line 490
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 491
    .line 492
    .line 493
    move-result-object v5

    .line 494
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 495
    .line 496
    goto/16 :goto_0

    .line 497
    .line 498
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 499
    .line 500
    .line 501
    move-result-wide v5

    .line 502
    invoke-static {v5, v6}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 503
    .line 504
    .line 505
    move-result-object v5

    .line 506
    iput-object v5, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 507
    .line 508
    goto/16 :goto_0

    .line 509
    .line 510
    :sswitch_19
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 511
    .line 512
    if-nez p1, :cond_15

    .line 513
    .line 514
    if-eqz v3, :cond_15

    .line 515
    .line 516
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 517
    .line 518
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 519
    .line 520
    .line 521
    move-result v3

    .line 522
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 523
    .line 524
    .line 525
    move-result-object p1

    .line 526
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 527
    .line 528
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 529
    .line 530
    :cond_15
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 531
    .line 532
    if-nez p1, :cond_16

    .line 533
    .line 534
    if-eqz v4, :cond_16

    .line 535
    .line 536
    invoke-static {v4}, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 537
    .line 538
    .line 539
    move-result-object p1

    .line 540
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 541
    .line 542
    :cond_16
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 543
    .line 544
    if-nez p1, :cond_17

    .line 545
    .line 546
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 547
    .line 548
    :cond_17
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 549
    .line 550
    if-nez p1, :cond_18

    .line 551
    .line 552
    iput-object v0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 553
    .line 554
    :cond_18
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 555
    .line 556
    if-nez p1, :cond_19

    .line 557
    .line 558
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 559
    .line 560
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 561
    .line 562
    .line 563
    move-result-object p1

    .line 564
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 565
    .line 566
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 567
    .line 568
    :cond_19
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 569
    .line 570
    if-nez p1, :cond_1a

    .line 571
    .line 572
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 573
    .line 574
    :cond_1a
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 575
    .line 576
    if-nez p1, :cond_1b

    .line 577
    .line 578
    new-instance p1, Ljava/util/ArrayList;

    .line 579
    .line 580
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 581
    .line 582
    .line 583
    iput-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 584
    .line 585
    :cond_1b
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 586
    .line 587
    if-nez p1, :cond_1c

    .line 588
    .line 589
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 590
    .line 591
    :cond_1c
    iget-object p1, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 592
    .line 593
    if-nez p1, :cond_1d

    .line 594
    .line 595
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 596
    .line 597
    :cond_1d
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 598
    .line 599
    if-nez p0, :cond_1e

    .line 600
    .line 601
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 602
    .line 603
    :cond_1e
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 604
    .line 605
    if-nez p0, :cond_1f

    .line 606
    .line 607
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 608
    .line 609
    :cond_1f
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 610
    .line 611
    if-nez p0, :cond_20

    .line 612
    .line 613
    new-instance p0, Ljava/util/ArrayList;

    .line 614
    .line 615
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 616
    .line 617
    .line 618
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 619
    .line 620
    :cond_20
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 621
    .line 622
    if-nez p0, :cond_21

    .line 623
    .line 624
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 625
    .line 626
    :cond_21
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 627
    .line 628
    if-nez p0, :cond_22

    .line 629
    .line 630
    new-instance p0, Ljava/util/ArrayList;

    .line 631
    .line 632
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 633
    .line 634
    .line 635
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 636
    .line 637
    :cond_22
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 638
    .line 639
    if-nez p0, :cond_23

    .line 640
    .line 641
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 642
    .line 643
    :cond_23
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 644
    .line 645
    if-nez p0, :cond_24

    .line 646
    .line 647
    new-instance p0, Ljava/util/ArrayList;

    .line 648
    .line 649
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 650
    .line 651
    .line 652
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 653
    .line 654
    :cond_24
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 655
    .line 656
    if-nez p0, :cond_25

    .line 657
    .line 658
    new-instance p0, Ljava/util/ArrayList;

    .line 659
    .line 660
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 661
    .line 662
    .line 663
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 664
    .line 665
    :cond_25
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 666
    .line 667
    if-nez p0, :cond_26

    .line 668
    .line 669
    new-instance p0, Ljava/util/ArrayList;

    .line 670
    .line 671
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 672
    .line 673
    .line 674
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 675
    .line 676
    :cond_26
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 677
    .line 678
    if-nez p0, :cond_27

    .line 679
    .line 680
    new-instance p0, Ljava/util/ArrayList;

    .line 681
    .line 682
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 683
    .line 684
    .line 685
    iput-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 686
    .line 687
    :cond_27
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 688
    .line 689
    if-nez p0, :cond_28

    .line 690
    .line 691
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 692
    .line 693
    :cond_28
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 694
    .line 695
    if-nez p0, :cond_29

    .line 696
    .line 697
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 698
    .line 699
    :cond_29
    iget-object p0, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 700
    .line 701
    if-nez p0, :cond_2a

    .line 702
    .line 703
    iput-object v6, v1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 704
    .line 705
    :cond_2a
    return-object v1

    .line 706
    nop

    .line 707
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_19
        0x8 -> :sswitch_18
        0x10 -> :sswitch_17
        0x18 -> :sswitch_16
        0x22 -> :sswitch_15
        0x2a -> :sswitch_14
        0x31 -> :sswitch_13
        0x39 -> :sswitch_12
        0x40 -> :sswitch_11
        0x48 -> :sswitch_10
        0x52 -> :sswitch_f
        0x5a -> :sswitch_e
        0x62 -> :sswitch_d
        0x6a -> :sswitch_c
        0x72 -> :sswitch_b
        0x7a -> :sswitch_a
        0x82 -> :sswitch_9
        0x8a -> :sswitch_8
        0x92 -> :sswitch_7
        0x9a -> :sswitch_6
        0xa0 -> :sswitch_5
        0xaa -> :sswitch_4
        0xb2 -> :sswitch_3
        0xba -> :sswitch_2
        0xc2 -> :sswitch_1
        0xca -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 707
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CreativeData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CreativeData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CreativeData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->startTime:Ljava/lang/Long;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 7
    .line 8
    .line 9
    move-result-wide v1

    .line 10
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->endTime:Ljava/lang/Long;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 19
    .line 20
    .line 21
    move-result-wide v1

    .line 22
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 23
    .line 24
    .line 25
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    if-eqz p0, :cond_2

    .line 28
    .line 29
    const/4 v0, 0x3

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->promotionName:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    invoke-static {p0}, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 50
    .line 51
    .line 52
    move-result-object p0

    .line 53
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 54
    .line 55
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    .line 58
    move-result-object v0

    .line 59
    const/4 v1, 0x5

    .line 60
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->normalPrice:Ljava/lang/Double;

    .line 64
    .line 65
    if-eqz p0, :cond_5

    .line 66
    .line 67
    const/4 v0, 0x6

    .line 68
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 69
    .line 70
    .line 71
    move-result-wide v1

    .line 72
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->discountPrice:Ljava/lang/Double;

    .line 76
    .line 77
    if-eqz p0, :cond_6

    .line 78
    .line 79
    const/4 v0, 0x7

    .line 80
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 81
    .line 82
    .line 83
    move-result-wide v1

    .line 84
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 85
    .line 86
    .line 87
    :cond_6
    const/16 p0, 0x8

    .line 88
    .line 89
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->popUpWindow:Z

    .line 90
    .line 91
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 92
    .line 93
    .line 94
    const/16 p0, 0x9

    .line 95
    .line 96
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->autoRenewable:Z

    .line 97
    .line 98
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 99
    .line 100
    .line 101
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currencyCode:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz p0, :cond_7

    .line 104
    .line 105
    const/16 v0, 0xa

    .line 106
    .line 107
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textTitle:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz p0, :cond_8

    .line 113
    .line 114
    const/16 v0, 0xb

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->textContent:Ljava/util/List;

    .line 120
    .line 121
    if-eqz p0, :cond_9

    .line 122
    .line 123
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    .line 128
    move-result-object v0

    .line 129
    const/16 v1, 0xc

    .line 130
    .line 131
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 132
    .line 133
    .line 134
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->terms:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz p0, :cond_a

    .line 137
    .line 138
    const/16 v0, 0xd

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 141
    .line 142
    .line 143
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->clause:Ljava/util/List;

    .line 144
    .line 145
    if-eqz p0, :cond_b

    .line 146
    .line 147
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    const/16 v1, 0xe

    .line 154
    .line 155
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 156
    .line 157
    .line 158
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonText:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz p0, :cond_c

    .line 161
    .line 162
    const/16 v0, 0xf

    .line 163
    .line 164
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->buttonTexts:Ljava/util/List;

    .line 168
    .line 169
    if-eqz p0, :cond_d

    .line 170
    .line 171
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    const/16 v1, 0x10

    .line 178
    .line 179
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 180
    .line 181
    .line 182
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->backgroundPicture:Ljava/util/List;

    .line 183
    .line 184
    if-eqz p0, :cond_e

    .line 185
    .line 186
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    .line 188
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 189
    .line 190
    .line 191
    move-result-object v0

    .line 192
    const/16 v1, 0x11

    .line 193
    .line 194
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 195
    .line 196
    .line 197
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->iconPicture:Ljava/util/List;

    .line 198
    .line 199
    if-eqz p0, :cond_f

    .line 200
    .line 201
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    .line 203
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    const/16 v1, 0x12

    .line 208
    .line 209
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 210
    .line 211
    .line 212
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->positionPicture:Ljava/util/List;

    .line 213
    .line 214
    if-eqz p0, :cond_10

    .line 215
    .line 216
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 217
    .line 218
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    const/16 v1, 0x13

    .line 223
    .line 224
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 225
    .line 226
    .line 227
    :cond_10
    const/16 p0, 0x14

    .line 228
    .line 229
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->displayPrice:Z

    .line 230
    .line 231
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 232
    .line 233
    .line 234
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->currency:Ljava/lang/String;

    .line 235
    .line 236
    if-eqz p0, :cond_11

    .line 237
    .line 238
    const/16 v0, 0x15

    .line 239
    .line 240
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 241
    .line 242
    .line 243
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->skuID:Ljava/lang/String;

    .line 244
    .line 245
    if-eqz p0, :cond_12

    .line 246
    .line 247
    const/16 v0, 0x16

    .line 248
    .line 249
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 250
    .line 251
    .line 252
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->itemID:Ljava/lang/String;

    .line 253
    .line 254
    if-eqz p0, :cond_13

    .line 255
    .line 256
    const/16 v0, 0x17

    .line 257
    .line 258
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 259
    .line 260
    .line 261
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 262
    .line 263
    if-eqz p0, :cond_14

    .line 264
    .line 265
    const/16 v0, 0x18

    .line 266
    .line 267
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 270
    .line 271
    .line 272
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CreativeData;->payPlatform:Ljava/util/List;

    .line 273
    .line 274
    if-eqz p0, :cond_15

    .line 275
    .line 276
    sget-object p1, Lcom/p1/mobile/putong/core/data/PaymentPlatform;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 277
    .line 278
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 279
    .line 280
    .line 281
    move-result-object p1

    .line 282
    const/16 v0, 0x19

    .line 283
    .line 284
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 285
    .line 286
    .line 287
    :cond_15
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 288
    check-cast p1, Lcom/p1/mobile/putong/core/data/CreativeData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CreativeData$1;->serialize(Lcom/p1/mobile/putong/core/data/CreativeData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
