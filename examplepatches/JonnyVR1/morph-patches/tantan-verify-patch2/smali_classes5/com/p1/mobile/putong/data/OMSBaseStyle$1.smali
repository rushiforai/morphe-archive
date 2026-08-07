.class Lcom/p1/mobile/putong/data/OMSBaseStyle$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/OMSBaseStyle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/OMSBaseStyle;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSBaseStyle;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    const/4 v0, 0x2

    .line 9
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 10
    .line 11
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 12
    .line 13
    .line 14
    move-result v0

    .line 15
    add-int/2addr p0, v0

    .line 16
    const/4 v0, 0x3

    .line 17
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x4

    .line 25
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 26
    .line 27
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x5

    .line 33
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x6

    .line 41
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 49
    .line 50
    if-eqz v0, :cond_0

    .line 51
    .line 52
    const/4 v1, 0x7

    .line 53
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 63
    .line 64
    if-eqz v0, :cond_1

    .line 65
    .line 66
    const/16 v1, 0x8

    .line 67
    .line 68
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 73
    .line 74
    .line 75
    move-result v0

    .line 76
    add-int/2addr p0, v0

    .line 77
    :cond_1
    const/16 v0, 0x9

    .line 78
    .line 79
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 80
    .line 81
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    const/16 v0, 0xa

    .line 87
    .line 88
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 89
    .line 90
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    const/16 v0, 0xb

    .line 96
    .line 97
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 98
    .line 99
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    const/16 v0, 0xc

    .line 105
    .line 106
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 107
    .line 108
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    const/16 v0, 0xd

    .line 114
    .line 115
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 116
    .line 117
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    const/16 v0, 0xe

    .line 123
    .line 124
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 125
    .line 126
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    const/16 v0, 0xf

    .line 132
    .line 133
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 134
    .line 135
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/2addr p0, v0

    .line 140
    const/16 v0, 0x10

    .line 141
    .line 142
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 143
    .line 144
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    const/16 v0, 0x11

    .line 150
    .line 151
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 152
    .line 153
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 159
    .line 160
    if-eqz v0, :cond_2

    .line 161
    .line 162
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 165
    .line 166
    .line 167
    move-result-object v1

    .line 168
    const/16 v2, 0x12

    .line 169
    .line 170
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    add-int/2addr p0, v0

    .line 175
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 176
    .line 177
    if-eqz v0, :cond_3

    .line 178
    .line 179
    const/16 v1, 0x13

    .line 180
    .line 181
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 182
    .line 183
    .line 184
    move-result v0

    .line 185
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr p0, v0

    .line 190
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 191
    .line 192
    if-eqz v0, :cond_4

    .line 193
    .line 194
    const/16 v1, 0x14

    .line 195
    .line 196
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    add-int/2addr p0, v0

    .line 201
    :cond_4
    const/16 v0, 0x15

    .line 202
    .line 203
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 204
    .line 205
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    add-int/2addr p0, v0

    .line 210
    const/16 v0, 0x16

    .line 211
    .line 212
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 213
    .line 214
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    add-int/2addr p0, v0

    .line 219
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 220
    .line 221
    if-eqz v0, :cond_5

    .line 222
    .line 223
    const/16 v1, 0x17

    .line 224
    .line 225
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 226
    .line 227
    .line 228
    move-result v0

    .line 229
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    add-int/2addr p0, v0

    .line 234
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 235
    .line 236
    if-eqz v0, :cond_6

    .line 237
    .line 238
    invoke-static {v0}, Lcom/p1/mobile/putong/data/OMSLocationType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    .line 246
    .line 247
    move-result-object v1

    .line 248
    const/16 v2, 0x18

    .line 249
    .line 250
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 251
    .line 252
    .line 253
    move-result v0

    .line 254
    add-int/2addr p0, v0

    .line 255
    :cond_6
    const/16 v0, 0x19

    .line 256
    .line 257
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 258
    .line 259
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 260
    .line 261
    .line 262
    move-result v0

    .line 263
    add-int/2addr p0, v0

    .line 264
    const/16 v0, 0x1a

    .line 265
    .line 266
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 267
    .line 268
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 269
    .line 270
    .line 271
    move-result v0

    .line 272
    add-int/2addr p0, v0

    .line 273
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 274
    .line 275
    if-eqz v0, :cond_7

    .line 276
    .line 277
    const/16 v1, 0x1b

    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 280
    .line 281
    .line 282
    move-result v0

    .line 283
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    add-int/2addr p0, v0

    .line 288
    :cond_7
    const/16 v0, 0x1c

    .line 289
    .line 290
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 291
    .line 292
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 293
    .line 294
    .line 295
    move-result v0

    .line 296
    add-int/2addr p0, v0

    .line 297
    const/16 v0, 0x1d

    .line 298
    .line 299
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 300
    .line 301
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 302
    .line 303
    .line 304
    move-result v0

    .line 305
    add-int/2addr p0, v0

    .line 306
    const/16 v0, 0x1e

    .line 307
    .line 308
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 309
    .line 310
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 311
    .line 312
    .line 313
    move-result v0

    .line 314
    add-int/2addr p0, v0

    .line 315
    const/16 v0, 0x1f

    .line 316
    .line 317
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 318
    .line 319
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 320
    .line 321
    .line 322
    move-result v0

    .line 323
    add-int/2addr p0, v0

    .line 324
    const/16 v0, 0x20

    .line 325
    .line 326
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 327
    .line 328
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 329
    .line 330
    .line 331
    move-result v0

    .line 332
    add-int/2addr p0, v0

    .line 333
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 334
    .line 335
    if-eqz v0, :cond_8

    .line 336
    .line 337
    const/16 v1, 0x21

    .line 338
    .line 339
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 344
    .line 345
    .line 346
    move-result v0

    .line 347
    add-int/2addr p0, v0

    .line 348
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 349
    .line 350
    if-eqz v0, :cond_9

    .line 351
    .line 352
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 353
    .line 354
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 355
    .line 356
    .line 357
    move-result-object v1

    .line 358
    const/16 v2, 0x22

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
    :cond_9
    const/16 v0, 0x23

    .line 366
    .line 367
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 368
    .line 369
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 370
    .line 371
    .line 372
    move-result v0

    .line 373
    add-int/2addr p0, v0

    .line 374
    const/16 v0, 0x24

    .line 375
    .line 376
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 377
    .line 378
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    add-int/2addr p0, v0

    .line 383
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 384
    .line 385
    if-eqz v0, :cond_a

    .line 386
    .line 387
    const/16 v1, 0x25

    .line 388
    .line 389
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 390
    .line 391
    .line 392
    move-result v0

    .line 393
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 394
    .line 395
    .line 396
    move-result v0

    .line 397
    add-int/2addr p0, v0

    .line 398
    :cond_a
    const/16 v0, 0x26

    .line 399
    .line 400
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 401
    .line 402
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 403
    .line 404
    .line 405
    move-result v0

    .line 406
    add-int/2addr p0, v0

    .line 407
    const/16 v0, 0x27

    .line 408
    .line 409
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 410
    .line 411
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 412
    .line 413
    .line 414
    move-result v0

    .line 415
    add-int/2addr p0, v0

    .line 416
    const/16 v0, 0x28

    .line 417
    .line 418
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 419
    .line 420
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 421
    .line 422
    .line 423
    move-result v0

    .line 424
    add-int/2addr p0, v0

    .line 425
    const/16 v0, 0x29

    .line 426
    .line 427
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 428
    .line 429
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 430
    .line 431
    .line 432
    move-result v0

    .line 433
    add-int/2addr p0, v0

    .line 434
    const/16 v0, 0x2a

    .line 435
    .line 436
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 437
    .line 438
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 439
    .line 440
    .line 441
    move-result v0

    .line 442
    add-int/2addr p0, v0

    .line 443
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 444
    .line 445
    if-eqz v0, :cond_b

    .line 446
    .line 447
    const/16 v1, 0x2b

    .line 448
    .line 449
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 450
    .line 451
    .line 452
    move-result v0

    .line 453
    add-int/2addr p0, v0

    .line 454
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 455
    .line 456
    if-eqz v0, :cond_c

    .line 457
    .line 458
    const/16 v1, 0x2c

    .line 459
    .line 460
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 461
    .line 462
    .line 463
    move-result v0

    .line 464
    add-int/2addr p0, v0

    .line 465
    :cond_c
    const/16 v0, 0x2d

    .line 466
    .line 467
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 468
    .line 469
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 470
    .line 471
    .line 472
    move-result v0

    .line 473
    add-int/2addr p0, v0

    .line 474
    const/16 v0, 0x2e

    .line 475
    .line 476
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 477
    .line 478
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 479
    .line 480
    .line 481
    move-result v0

    .line 482
    add-int/2addr p0, v0

    .line 483
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 484
    .line 485
    if-eqz v0, :cond_d

    .line 486
    .line 487
    const/16 v1, 0x2f

    .line 488
    .line 489
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 490
    .line 491
    .line 492
    move-result v0

    .line 493
    add-int/2addr p0, v0

    .line 494
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 495
    .line 496
    if-eqz v0, :cond_e

    .line 497
    .line 498
    const/16 v1, 0x30

    .line 499
    .line 500
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 501
    .line 502
    .line 503
    move-result v0

    .line 504
    add-int/2addr p0, v0

    .line 505
    :cond_e
    const/16 v0, 0x31

    .line 506
    .line 507
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 508
    .line 509
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 510
    .line 511
    .line 512
    move-result v0

    .line 513
    add-int/2addr p0, v0

    .line 514
    const/16 v0, 0x32

    .line 515
    .line 516
    iget v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 517
    .line 518
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->f(IF)I

    .line 519
    .line 520
    .line 521
    move-result v0

    .line 522
    add-int/2addr p0, v0

    .line 523
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 524
    .line 525
    if-eqz v0, :cond_f

    .line 526
    .line 527
    const/16 v1, 0x33

    .line 528
    .line 529
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 530
    .line 531
    .line 532
    move-result v0

    .line 533
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 534
    .line 535
    .line 536
    move-result v0

    .line 537
    add-int/2addr p0, v0

    .line 538
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 539
    .line 540
    if-eqz v0, :cond_10

    .line 541
    .line 542
    const/16 v1, 0x34

    .line 543
    .line 544
    sget-object v2, Lcom/p1/mobile/putong/data/OMSSizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 545
    .line 546
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 547
    .line 548
    .line 549
    move-result v0

    .line 550
    add-int/2addr p0, v0

    .line 551
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 552
    .line 553
    if-eqz v0, :cond_11

    .line 554
    .line 555
    const/16 v1, 0x35

    .line 556
    .line 557
    sget-object v2, Lcom/p1/mobile/putong/data/OMSSizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 558
    .line 559
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 560
    .line 561
    .line 562
    move-result v0

    .line 563
    add-int/2addr p0, v0

    .line 564
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 565
    .line 566
    if-eqz v0, :cond_12

    .line 567
    .line 568
    const/16 v1, 0x36

    .line 569
    .line 570
    sget-object v2, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 571
    .line 572
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 573
    .line 574
    .line 575
    move-result v0

    .line 576
    add-int/2addr p0, v0

    .line 577
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 578
    .line 579
    if-eqz v0, :cond_13

    .line 580
    .line 581
    const/16 v1, 0x37

    .line 582
    .line 583
    sget-object v2, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 584
    .line 585
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 586
    .line 587
    .line 588
    move-result v0

    .line 589
    add-int/2addr p0, v0

    .line 590
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 591
    .line 592
    if-eqz v0, :cond_14

    .line 593
    .line 594
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 595
    .line 596
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 597
    .line 598
    .line 599
    move-result-object v1

    .line 600
    const/16 v2, 0x38

    .line 601
    .line 602
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 603
    .line 604
    .line 605
    move-result v0

    .line 606
    add-int/2addr p0, v0

    .line 607
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 608
    .line 609
    if-eqz v0, :cond_15

    .line 610
    .line 611
    const/16 v1, 0x39

    .line 612
    .line 613
    sget-object v2, Lcom/p1/mobile/putong/data/OMSImageScaleType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 614
    .line 615
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 616
    .line 617
    .line 618
    move-result v0

    .line 619
    add-int/2addr p0, v0

    .line 620
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 621
    .line 622
    if-eqz v0, :cond_16

    .line 623
    .line 624
    const/16 v1, 0x3a

    .line 625
    .line 626
    sget-object v2, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 627
    .line 628
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 629
    .line 630
    .line 631
    move-result v0

    .line 632
    add-int/2addr p0, v0

    .line 633
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 634
    .line 635
    if-eqz v0, :cond_17

    .line 636
    .line 637
    const/16 v1, 0x3b

    .line 638
    .line 639
    sget-object v2, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 640
    .line 641
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 642
    .line 643
    .line 644
    move-result v0

    .line 645
    add-int/2addr p0, v0

    .line 646
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 647
    .line 648
    if-eqz v0, :cond_18

    .line 649
    .line 650
    const/16 v1, 0x3c

    .line 651
    .line 652
    sget-object v2, Lcom/p1/mobile/putong/data/OMSUIType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 653
    .line 654
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 655
    .line 656
    .line 657
    move-result v0

    .line 658
    add-int/2addr p0, v0

    .line 659
    :cond_18
    const/16 v0, 0x3d

    .line 660
    .line 661
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 662
    .line 663
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 664
    .line 665
    .line 666
    move-result v0

    .line 667
    add-int/2addr p0, v0

    .line 668
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 669
    .line 670
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 671
    check-cast p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSBaseStyle$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/OMSBaseStyle;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSBaseStyle;
    .locals 12
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    invoke-direct {p0}, Lcom/p1/mobile/putong/data/OMSBaseStyle;-><init>()V

    const/4 v0, 0x0

    move-object v1, v0

    move-object v2, v1

    move-object v3, v2

    move-object v4, v3

    move-object v5, v4

    move-object v6, v5

    move-object v7, v6

    move-object v8, v7

    move-object v9, v8

    .line 2
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    move-result v10

    .line 3
    const-string v11, ""

    sparse-switch v10, :sswitch_data_0

    .line 4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_0

    if-eqz v1, :cond_0

    .line 5
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 6
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_1

    if-eqz v2, :cond_1

    .line 7
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 8
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_2

    if-eqz v3, :cond_2

    .line 9
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 10
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 11
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_3

    if-eqz v4, :cond_3

    .line 12
    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 13
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    if-nez p1, :cond_4

    if-eqz v5, :cond_4

    .line 14
    invoke-static {v5}, Lcom/p1/mobile/putong/data/OMSLocationType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 15
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    if-nez p1, :cond_5

    if-eqz v6, :cond_5

    .line 16
    sget-object p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 17
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_6

    if-eqz v7, :cond_6

    .line 18
    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 19
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_7

    if-eqz v8, :cond_7

    .line 20
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 21
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    if-nez p1, :cond_8

    if-eqz v9, :cond_8

    .line 22
    sget-object p1, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSUIType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 23
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_9

    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 24
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_a

    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 25
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    if-nez p1, :cond_b

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 26
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_c

    .line 27
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 28
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    if-nez p1, :cond_d

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 29
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_e

    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 30
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    if-nez p1, :cond_f

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 31
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    if-nez p1, :cond_10

    sget-object p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 32
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_11

    .line 33
    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 34
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    if-nez p1, :cond_12

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 35
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_13

    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 36
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    if-nez p1, :cond_14

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 37
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    if-nez p1, :cond_15

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 38
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    if-nez p1, :cond_16

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 39
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    if-nez p1, :cond_17

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 40
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    if-nez p1, :cond_30

    sget-object p1, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSUIType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    return-object p0

    .line 41
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v10

    iput-boolean v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    goto/16 :goto_0

    .line 42
    :sswitch_1
    sget-object v10, Lcom/p1/mobile/putong/data/OMSUIType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/OMSUIType;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    goto/16 :goto_0

    .line 43
    :sswitch_2
    sget-object v10, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    goto/16 :goto_0

    .line 44
    :sswitch_3
    sget-object v10, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    goto/16 :goto_0

    .line 45
    :sswitch_4
    sget-object v10, Lcom/p1/mobile/putong/data/OMSImageScaleType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    goto/16 :goto_0

    .line 46
    :sswitch_5
    sget-object v10, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 47
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    goto/16 :goto_0

    .line 48
    :sswitch_6
    sget-object v10, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    goto/16 :goto_0

    .line 49
    :sswitch_7
    sget-object v10, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    goto/16 :goto_0

    .line 50
    :sswitch_8
    sget-object v10, Lcom/p1/mobile/putong/data/OMSSizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    goto/16 :goto_0

    .line 51
    :sswitch_9
    sget-object v10, Lcom/p1/mobile/putong/data/OMSSizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    goto/16 :goto_0

    .line 52
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v9

    invoke-static {v9}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v9

    goto/16 :goto_0

    .line 53
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    goto/16 :goto_0

    .line 54
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    goto/16 :goto_0

    .line 55
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 56
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 57
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    goto/16 :goto_0

    .line 58
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    goto/16 :goto_0

    .line 59
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 60
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 61
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v10

    iput-boolean v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    goto/16 :goto_0

    .line 62
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    goto/16 :goto_0

    .line 63
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    goto/16 :goto_0

    .line 64
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v10

    iput-boolean v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    goto/16 :goto_0

    .line 65
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->g()Z

    move-result v10

    iput-boolean v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    goto/16 :goto_0

    .line 66
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v8

    invoke-static {v8}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v8

    goto/16 :goto_0

    .line 67
    :sswitch_19
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    goto/16 :goto_0

    .line 68
    :sswitch_1a
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    goto/16 :goto_0

    .line 69
    :sswitch_1b
    sget-object v10, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    goto/16 :goto_0

    .line 71
    :sswitch_1c
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v7

    invoke-static {v7}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v7

    goto/16 :goto_0

    .line 72
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    goto/16 :goto_0

    .line 73
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    goto/16 :goto_0

    .line 74
    :sswitch_1f
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    goto/16 :goto_0

    .line 75
    :sswitch_20
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    goto/16 :goto_0

    .line 76
    :sswitch_21
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    goto/16 :goto_0

    .line 77
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v6

    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v6

    goto/16 :goto_0

    .line 78
    :sswitch_23
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    goto/16 :goto_0

    .line 79
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    goto/16 :goto_0

    .line 80
    :sswitch_25
    sget-object v5, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 81
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v5

    .line 82
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v5

    check-cast v5, Ljava/util/List;

    goto/16 :goto_0

    .line 83
    :sswitch_26
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v4

    invoke-static {v4}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v4

    goto/16 :goto_0

    .line 84
    :sswitch_27
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    goto/16 :goto_0

    .line 85
    :sswitch_28
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    goto/16 :goto_0

    .line 86
    :sswitch_29
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v10

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    goto/16 :goto_0

    .line 87
    :sswitch_2a
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v3

    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v3

    goto/16 :goto_0

    .line 88
    :sswitch_2b
    sget-object v10, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    invoke-virtual {v10}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    move-result-object v10

    invoke-virtual {p1, v10}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v10

    check-cast v10, Ljava/util/List;

    iput-object v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    goto/16 :goto_0

    .line 90
    :sswitch_2c
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    goto/16 :goto_0

    .line 91
    :sswitch_2d
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    goto/16 :goto_0

    .line 92
    :sswitch_2e
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    goto/16 :goto_0

    .line 93
    :sswitch_2f
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    goto/16 :goto_0

    .line 94
    :sswitch_30
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    goto/16 :goto_0

    .line 95
    :sswitch_31
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    goto/16 :goto_0

    .line 96
    :sswitch_32
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    goto/16 :goto_0

    .line 97
    :sswitch_33
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    goto/16 :goto_0

    .line 98
    :sswitch_34
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    goto/16 :goto_0

    .line 99
    :sswitch_35
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v2

    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v2

    goto/16 :goto_0

    .line 100
    :sswitch_36
    invoke-virtual {p1}, Ll/nc5;->j()I

    move-result v1

    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    move-result-object v1

    goto/16 :goto_0

    .line 101
    :sswitch_37
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    goto/16 :goto_0

    .line 102
    :sswitch_38
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    goto/16 :goto_0

    .line 103
    :sswitch_39
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    goto/16 :goto_0

    .line 104
    :sswitch_3a
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    goto/16 :goto_0

    .line 105
    :sswitch_3b
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    goto/16 :goto_0

    .line 106
    :sswitch_3c
    invoke-virtual {p1}, Ll/nc5;->i()F

    move-result v10

    iput v10, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    goto/16 :goto_0

    .line 107
    :sswitch_3d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_18

    if-eqz v1, :cond_18

    .line 108
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 109
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_19

    if-eqz v2, :cond_19

    .line 110
    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 111
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_1a

    if-eqz v3, :cond_1a

    .line 112
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 113
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 114
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_1b

    if-eqz v4, :cond_1b

    .line 115
    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v4}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 116
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    if-nez p1, :cond_1c

    if-eqz v5, :cond_1c

    .line 117
    invoke-static {v5}, Lcom/p1/mobile/putong/data/OMSLocationType;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 118
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    if-nez p1, :cond_1d

    if-eqz v6, :cond_1d

    .line 119
    sget-object p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v6}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 120
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_1e

    if-eqz v7, :cond_1e

    .line 121
    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v7}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 122
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_1f

    if-eqz v8, :cond_1f

    .line 123
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v8}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 124
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    if-nez p1, :cond_20

    if-eqz v9, :cond_20

    .line 125
    sget-object p1, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {v9}, Ljava/lang/Integer;->intValue()I

    move-result v1

    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSUIType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 126
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_21

    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 127
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    if-nez p1, :cond_22

    sget-object p1, Lcom/p1/mobile/putong/data/OMSSizeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSSizeType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 128
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    if-nez p1, :cond_23

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 129
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_24

    .line 130
    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 131
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    if-nez p1, :cond_25

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 132
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_26

    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 133
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    if-nez p1, :cond_27

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 134
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    if-nez p1, :cond_28

    sget-object p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSImageScaleType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 135
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    if-nez p1, :cond_29

    .line 136
    sget-object p1, Lcom/p1/mobile/putong/data/OMSLocationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSLocationType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 137
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    if-nez p1, :cond_2a

    new-instance p1, Ljava/util/ArrayList;

    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 138
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    if-nez p1, :cond_2b

    sget-object p1, Lcom/p1/mobile/putong/data/ResourceDirection;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/ResourceDirection;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 139
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    if-nez p1, :cond_2c

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 140
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    if-nez p1, :cond_2d

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 141
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    if-nez p1, :cond_2e

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 142
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    if-nez p1, :cond_2f

    iput-object v11, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 143
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    if-nez p1, :cond_30

    sget-object p1, Lcom/p1/mobile/putong/data/OMSUIType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    move-result-object p1

    check-cast p1, Lcom/p1/mobile/putong/data/OMSUIType;

    iput-object p1, p0, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    :cond_30
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_3d
        0xd -> :sswitch_3c
        0x15 -> :sswitch_3b
        0x1d -> :sswitch_3a
        0x25 -> :sswitch_39
        0x2d -> :sswitch_38
        0x35 -> :sswitch_37
        0x38 -> :sswitch_36
        0x40 -> :sswitch_35
        0x4d -> :sswitch_34
        0x55 -> :sswitch_33
        0x5d -> :sswitch_32
        0x65 -> :sswitch_31
        0x6d -> :sswitch_30
        0x75 -> :sswitch_2f
        0x7d -> :sswitch_2e
        0x85 -> :sswitch_2d
        0x8d -> :sswitch_2c
        0x92 -> :sswitch_2b
        0x98 -> :sswitch_2a
        0xa2 -> :sswitch_29
        0xad -> :sswitch_28
        0xb5 -> :sswitch_27
        0xb8 -> :sswitch_26
        0xc2 -> :sswitch_25
        0xc8 -> :sswitch_24
        0xd5 -> :sswitch_23
        0xd8 -> :sswitch_22
        0xe5 -> :sswitch_21
        0xed -> :sswitch_20
        0xf5 -> :sswitch_1f
        0xfd -> :sswitch_1e
        0x105 -> :sswitch_1d
        0x108 -> :sswitch_1c
        0x112 -> :sswitch_1b
        0x11d -> :sswitch_1a
        0x125 -> :sswitch_19
        0x128 -> :sswitch_18
        0x130 -> :sswitch_17
        0x138 -> :sswitch_16
        0x140 -> :sswitch_15
        0x148 -> :sswitch_14
        0x150 -> :sswitch_13
        0x15a -> :sswitch_12
        0x162 -> :sswitch_11
        0x16d -> :sswitch_10
        0x175 -> :sswitch_f
        0x17a -> :sswitch_e
        0x182 -> :sswitch_d
        0x18d -> :sswitch_c
        0x195 -> :sswitch_b
        0x198 -> :sswitch_a
        0x1a2 -> :sswitch_9
        0x1aa -> :sswitch_8
        0x1b2 -> :sswitch_7
        0x1ba -> :sswitch_6
        0x1c2 -> :sswitch_5
        0x1ca -> :sswitch_4
        0x1d2 -> :sswitch_3
        0x1da -> :sswitch_2
        0x1e2 -> :sswitch_1
        0x1e8 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 144
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/OMSBaseStyle$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/OMSBaseStyle;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/OMSBaseStyle;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->width:F

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 5
    .line 6
    .line 7
    const/4 p0, 0x2

    .line 8
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->height:F

    .line 9
    .line 10
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 11
    .line 12
    .line 13
    const/4 p0, 0x3

    .line 14
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minWidth:F

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x4

    .line 20
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->minHeight:F

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x5

    .line 26
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxWidth:F

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x6

    .line 32
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->maxHeight:F

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 38
    .line 39
    if-eqz p0, :cond_0

    .line 40
    .line 41
    const/4 v0, 0x7

    .line 42
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 47
    .line 48
    .line 49
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 50
    .line 51
    if-eqz p0, :cond_1

    .line 52
    .line 53
    const/16 v0, 0x8

    .line 54
    .line 55
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 56
    .line 57
    .line 58
    move-result p0

    .line 59
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 60
    .line 61
    .line 62
    :cond_1
    const/16 p0, 0x9

    .line 63
    .line 64
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->ratio:F

    .line 65
    .line 66
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 67
    .line 68
    .line 69
    const/16 p0, 0xa

    .line 70
    .line 71
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingTop:F

    .line 72
    .line 73
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 74
    .line 75
    .line 76
    const/16 p0, 0xb

    .line 77
    .line 78
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingLeft:F

    .line 79
    .line 80
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 81
    .line 82
    .line 83
    const/16 p0, 0xc

    .line 84
    .line 85
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingBottom:F

    .line 86
    .line 87
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 88
    .line 89
    .line 90
    const/16 p0, 0xd

    .line 91
    .line 92
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->paddingRight:F

    .line 93
    .line 94
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 95
    .line 96
    .line 97
    const/16 p0, 0xe

    .line 98
    .line 99
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginTop:F

    .line 100
    .line 101
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 102
    .line 103
    .line 104
    const/16 p0, 0xf

    .line 105
    .line 106
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginLeft:F

    .line 107
    .line 108
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 109
    .line 110
    .line 111
    const/16 p0, 0x10

    .line 112
    .line 113
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginBottom:F

    .line 114
    .line 115
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 116
    .line 117
    .line 118
    const/16 p0, 0x11

    .line 119
    .line 120
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->marginRight:F

    .line 121
    .line 122
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 123
    .line 124
    .line 125
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColors:Ljava/util/List;

    .line 126
    .line 127
    if-eqz p0, :cond_2

    .line 128
    .line 129
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    const/16 v1, 0x12

    .line 136
    .line 137
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 138
    .line 139
    .line 140
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 141
    .line 142
    if-eqz p0, :cond_3

    .line 143
    .line 144
    const/16 v0, 0x13

    .line 145
    .line 146
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 147
    .line 148
    .line 149
    move-result p0

    .line 150
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 151
    .line 152
    .line 153
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderColor:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz p0, :cond_4

    .line 156
    .line 157
    const/16 v0, 0x14

    .line 158
    .line 159
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_4
    const/16 p0, 0x15

    .line 163
    .line 164
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->borderWidth:F

    .line 165
    .line 166
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 167
    .line 168
    .line 169
    const/16 p0, 0x16

    .line 170
    .line 171
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->cornerRadius:F

    .line 172
    .line 173
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 174
    .line 175
    .line 176
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 177
    .line 178
    if-eqz p0, :cond_5

    .line 179
    .line 180
    const/16 v0, 0x17

    .line 181
    .line 182
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 183
    .line 184
    .line 185
    move-result p0

    .line 186
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 187
    .line 188
    .line 189
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 190
    .line 191
    if-eqz p0, :cond_6

    .line 192
    .line 193
    invoke-static {p0}, Lcom/p1/mobile/putong/data/OMSLocationType;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 194
    .line 195
    .line 196
    move-result-object p0

    .line 197
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 198
    .line 199
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 200
    .line 201
    .line 202
    move-result-object v0

    .line 203
    const/16 v1, 0x18

    .line 204
    .line 205
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 206
    .line 207
    .line 208
    :cond_6
    const/16 p0, 0x19

    .line 209
    .line 210
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->numberOfLines:I

    .line 211
    .line 212
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 213
    .line 214
    .line 215
    const/16 p0, 0x1a

    .line 216
    .line 217
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->lineSpacing:F

    .line 218
    .line 219
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 220
    .line 221
    .line 222
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 223
    .line 224
    if-eqz p0, :cond_7

    .line 225
    .line 226
    const/16 v0, 0x1b

    .line 227
    .line 228
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 229
    .line 230
    .line 231
    move-result p0

    .line 232
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 233
    .line 234
    .line 235
    :cond_7
    const/16 p0, 0x1c

    .line 236
    .line 237
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapWidth:F

    .line 238
    .line 239
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 240
    .line 241
    .line 242
    const/16 p0, 0x1d

    .line 243
    .line 244
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapHeight:F

    .line 245
    .line 246
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 247
    .line 248
    .line 249
    const/16 p0, 0x1e

    .line 250
    .line 251
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->leftCapLayoutWidth:F

    .line 252
    .line 253
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 254
    .line 255
    .line 256
    const/16 p0, 0x1f

    .line 257
    .line 258
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->topCapLayoutHeight:F

    .line 259
    .line 260
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 261
    .line 262
    .line 263
    const/16 p0, 0x20

    .line 264
    .line 265
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->spacing:F

    .line 266
    .line 267
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 268
    .line 269
    .line 270
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 271
    .line 272
    if-eqz p0, :cond_8

    .line 273
    .line 274
    const/16 v0, 0x21

    .line 275
    .line 276
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 277
    .line 278
    .line 279
    move-result p0

    .line 280
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 281
    .line 282
    .line 283
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->imageSize:Ljava/util/List;

    .line 284
    .line 285
    if-eqz p0, :cond_9

    .line 286
    .line 287
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 288
    .line 289
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 290
    .line 291
    .line 292
    move-result-object v0

    .line 293
    const/16 v1, 0x22

    .line 294
    .line 295
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 296
    .line 297
    .line 298
    :cond_9
    const/16 p0, 0x23

    .line 299
    .line 300
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetX:F

    .line 301
    .line 302
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 303
    .line 304
    .line 305
    const/16 p0, 0x24

    .line 306
    .line 307
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->offsetY:F

    .line 308
    .line 309
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 310
    .line 311
    .line 312
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 313
    .line 314
    if-eqz p0, :cond_a

    .line 315
    .line 316
    const/16 v0, 0x25

    .line 317
    .line 318
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 319
    .line 320
    .line 321
    move-result p0

    .line 322
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 323
    .line 324
    .line 325
    :cond_a
    const/16 p0, 0x26

    .line 326
    .line 327
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitch:Z

    .line 328
    .line 329
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 330
    .line 331
    .line 332
    const/16 p0, 0x27

    .line 333
    .line 334
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->canSlide:Z

    .line 335
    .line 336
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 337
    .line 338
    .line 339
    const/16 p0, 0x28

    .line 340
    .line 341
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->stayTime:I

    .line 342
    .line 343
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 344
    .line 345
    .line 346
    const/16 p0, 0x29

    .line 347
    .line 348
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->autoSwitchTime:I

    .line 349
    .line 350
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 351
    .line 352
    .line 353
    const/16 p0, 0x2a

    .line 354
    .line 355
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->showIndicator:Z

    .line 356
    .line 357
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 358
    .line 359
    .line 360
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorColor:Ljava/lang/String;

    .line 361
    .line 362
    if-eqz p0, :cond_b

    .line 363
    .line 364
    const/16 v0, 0x2b

    .line 365
    .line 366
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 367
    .line 368
    .line 369
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorBgColor:Ljava/lang/String;

    .line 370
    .line 371
    if-eqz p0, :cond_c

    .line 372
    .line 373
    const/16 v0, 0x2c

    .line 374
    .line 375
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 376
    .line 377
    .line 378
    :cond_c
    const/16 p0, 0x2d

    .line 379
    .line 380
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->indicatorRadius:F

    .line 381
    .line 382
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 383
    .line 384
    .line 385
    const/16 p0, 0x2e

    .line 386
    .line 387
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurRadius:F

    .line 388
    .line 389
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 390
    .line 391
    .line 392
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->blurColor:Ljava/lang/String;

    .line 393
    .line 394
    if-eqz p0, :cond_d

    .line 395
    .line 396
    const/16 v0, 0x2f

    .line 397
    .line 398
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 399
    .line 400
    .line 401
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowColor:Ljava/lang/String;

    .line 402
    .line 403
    if-eqz p0, :cond_e

    .line 404
    .line 405
    const/16 v0, 0x30

    .line 406
    .line 407
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 408
    .line 409
    .line 410
    :cond_e
    const/16 p0, 0x31

    .line 411
    .line 412
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowRadius:F

    .line 413
    .line 414
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 415
    .line 416
    .line 417
    const/16 p0, 0x32

    .line 418
    .line 419
    iget v0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->shadowOpacity:F

    .line 420
    .line 421
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->E(IF)V

    .line 422
    .line 423
    .line 424
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 425
    .line 426
    if-eqz p0, :cond_f

    .line 427
    .line 428
    const/16 v0, 0x33

    .line 429
    .line 430
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 431
    .line 432
    .line 433
    move-result p0

    .line 434
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 435
    .line 436
    .line 437
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->widthType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 438
    .line 439
    if-eqz p0, :cond_10

    .line 440
    .line 441
    const/16 v0, 0x34

    .line 442
    .line 443
    sget-object v1, Lcom/p1/mobile/putong/data/OMSSizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 444
    .line 445
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 446
    .line 447
    .line 448
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->heightType:Lcom/p1/mobile/putong/data/OMSSizeType;

    .line 449
    .line 450
    if-eqz p0, :cond_11

    .line 451
    .line 452
    const/16 v0, 0x35

    .line 453
    .line 454
    sget-object v1, Lcom/p1/mobile/putong/data/OMSSizeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 455
    .line 456
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 457
    .line 458
    .line 459
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->bgColorsDirection:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 460
    .line 461
    if-eqz p0, :cond_12

    .line 462
    .line 463
    const/16 v0, 0x36

    .line 464
    .line 465
    sget-object v1, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 466
    .line 467
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 468
    .line 469
    .line 470
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->alignment:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 471
    .line 472
    if-eqz p0, :cond_13

    .line 473
    .line 474
    const/16 v0, 0x37

    .line 475
    .line 476
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 477
    .line 478
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 479
    .line 480
    .line 481
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->location:Ljava/util/List;

    .line 482
    .line 483
    if-eqz p0, :cond_14

    .line 484
    .line 485
    sget-object v0, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 486
    .line 487
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 488
    .line 489
    .line 490
    move-result-object v0

    .line 491
    const/16 v1, 0x38

    .line 492
    .line 493
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 494
    .line 495
    .line 496
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->scaleType:Lcom/p1/mobile/putong/data/OMSImageScaleType;

    .line 497
    .line 498
    if-eqz p0, :cond_15

    .line 499
    .line 500
    const/16 v0, 0x39

    .line 501
    .line 502
    sget-object v1, Lcom/p1/mobile/putong/data/OMSImageScaleType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 503
    .line 504
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 505
    .line 506
    .line 507
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->distribution:Lcom/p1/mobile/putong/data/OMSLocationType;

    .line 508
    .line 509
    if-eqz p0, :cond_16

    .line 510
    .line 511
    const/16 v0, 0x3a

    .line 512
    .line 513
    sget-object v1, Lcom/p1/mobile/putong/data/OMSLocationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 514
    .line 515
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 516
    .line 517
    .line 518
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->direction:Lcom/p1/mobile/putong/data/ResourceDirection;

    .line 519
    .line 520
    if-eqz p0, :cond_17

    .line 521
    .line 522
    const/16 v0, 0x3b

    .line 523
    .line 524
    sget-object v1, Lcom/p1/mobile/putong/data/ResourceDirection;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 525
    .line 526
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 527
    .line 528
    .line 529
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->uiType:Lcom/p1/mobile/putong/data/OMSUIType;

    .line 530
    .line 531
    if-eqz p0, :cond_18

    .line 532
    .line 533
    const/16 v0, 0x3c

    .line 534
    .line 535
    sget-object v1, Lcom/p1/mobile/putong/data/OMSUIType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 536
    .line 537
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 538
    .line 539
    .line 540
    :cond_18
    const/16 p0, 0x3d

    .line 541
    .line 542
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;->checked:Z

    .line 543
    .line 544
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 545
    .line 546
    .line 547
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 548
    check-cast p1, Lcom/p1/mobile/putong/data/OMSBaseStyle;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/OMSBaseStyle$1;->serialize(Lcom/p1/mobile/putong/data/OMSBaseStyle;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
