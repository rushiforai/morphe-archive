.class Lcom/p1/mobile/putong/data/UserSearchSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserSearchSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserSearchSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserSearchSettings;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    const/4 v1, 0x4

    .line 49
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x5

    .line 63
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x6

    .line 77
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 82
    .line 83
    .line 84
    move-result v0

    .line 85
    add-int/2addr p0, v0

    .line 86
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 87
    .line 88
    if-eqz v0, :cond_6

    .line 89
    .line 90
    const/4 v1, 0x7

    .line 91
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SearchPriority;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 105
    .line 106
    .line 107
    move-result-object v0

    .line 108
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    .line 113
    move-result-object v1

    .line 114
    const/16 v2, 0x8

    .line 115
    .line 116
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 122
    .line 123
    if-eqz v0, :cond_8

    .line 124
    .line 125
    const/16 v1, 0x9

    .line 126
    .line 127
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 137
    .line 138
    if-eqz v0, :cond_9

    .line 139
    .line 140
    const/16 v1, 0xa

    .line 141
    .line 142
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 143
    .line 144
    .line 145
    move-result v0

    .line 146
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 152
    .line 153
    if-eqz v0, :cond_a

    .line 154
    .line 155
    const/16 v1, 0xb

    .line 156
    .line 157
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    add-int/2addr p0, v0

    .line 166
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 167
    .line 168
    if-eqz v0, :cond_b

    .line 169
    .line 170
    const/16 v1, 0xc

    .line 171
    .line 172
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 173
    .line 174
    .line 175
    move-result-wide v2

    .line 176
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    add-int/2addr p0, v0

    .line 181
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 182
    .line 183
    if-eqz v0, :cond_c

    .line 184
    .line 185
    const/16 v1, 0xd

    .line 186
    .line 187
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 188
    .line 189
    .line 190
    move-result-wide v2

    .line 191
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    add-int/2addr p0, v0

    .line 196
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 197
    .line 198
    if-eqz v0, :cond_d

    .line 199
    .line 200
    const/16 v1, 0xe

    .line 201
    .line 202
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 203
    .line 204
    .line 205
    move-result v0

    .line 206
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    add-int/2addr p0, v0

    .line 211
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->allowSmartAvatarOpen:Ljava/lang/Boolean;

    .line 212
    .line 213
    if-eqz v0, :cond_e

    .line 214
    .line 215
    const/16 v1, 0xf

    .line 216
    .line 217
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 222
    .line 223
    .line 224
    move-result v0

    .line 225
    add-int/2addr p0, v0

    .line 226
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 227
    .line 228
    if-eqz v0, :cond_f

    .line 229
    .line 230
    const/16 v1, 0x10

    .line 231
    .line 232
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

    .line 233
    .line 234
    .line 235
    move-result v0

    .line 236
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    add-int/2addr p0, v0

    .line 241
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 242
    .line 243
    if-eqz v0, :cond_10

    .line 244
    .line 245
    invoke-static {v0}, Lcom/p1/mobile/putong/data/Purpose;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 246
    .line 247
    .line 248
    move-result-object v0

    .line 249
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 250
    .line 251
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 252
    .line 253
    .line 254
    move-result-object v1

    .line 255
    const/16 v2, 0x11

    .line 256
    .line 257
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 258
    .line 259
    .line 260
    move-result v0

    .line 261
    add-int/2addr p0, v0

    .line 262
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 263
    .line 264
    if-eqz v0, :cond_11

    .line 265
    .line 266
    const/16 v1, 0x12

    .line 267
    .line 268
    sget-object v2, Lcom/p1/mobile/putong/data/LookingFor;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 276
    .line 277
    if-eqz v0, :cond_12

    .line 278
    .line 279
    sget-object v1, Lcom/p1/mobile/putong/data/SearchPriority;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    .line 284
    move-result-object v1

    .line 285
    const/16 v2, 0x13

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
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 293
    .line 294
    if-eqz v0, :cond_13

    .line 295
    .line 296
    sget-object v1, Lcom/p1/mobile/putong/data/Purpose;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 297
    .line 298
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    .line 300
    .line 301
    move-result-object v1

    .line 302
    const/16 v2, 0x14

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
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 310
    .line 311
    if-eqz v0, :cond_14

    .line 312
    .line 313
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 314
    .line 315
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 316
    .line 317
    .line 318
    move-result-object v1

    .line 319
    const/16 v2, 0x15

    .line 320
    .line 321
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 322
    .line 323
    .line 324
    move-result v0

    .line 325
    add-int/2addr p0, v0

    .line 326
    :cond_14
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 327
    .line 328
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 329
    check-cast p1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserSearchSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserSearchSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserSearchSettings;
    .locals 8
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
    const/4 v0, 0x0

    .line 8
    invoke-static {v0}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 9
    .line 10
    .line 11
    move-result-object v0

    .line 12
    new-instance v1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 13
    .line 14
    invoke-direct {v1}, Lcom/p1/mobile/putong/data/UserSearchSettings;-><init>()V

    .line 15
    .line 16
    .line 17
    const/4 v2, 0x0

    .line 18
    move-object v3, v2

    .line 19
    move-object v4, v3

    .line 20
    move-object v5, v4

    .line 21
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 22
    .line 23
    .line 24
    move-result v6

    .line 25
    sparse-switch v6, :sswitch_data_0

    .line 26
    .line 27
    .line 28
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 29
    .line 30
    if-nez p1, :cond_0

    .line 31
    .line 32
    if-eqz v3, :cond_0

    .line 33
    .line 34
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 35
    .line 36
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 37
    .line 38
    .line 39
    move-result v3

    .line 40
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 41
    .line 42
    .line 43
    move-result-object p1

    .line 44
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 45
    .line 46
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 47
    .line 48
    :cond_0
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    if-eqz v4, :cond_1

    .line 53
    .line 54
    invoke-static {v4}, Lcom/p1/mobile/putong/data/SearchPriority;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 55
    .line 56
    .line 57
    move-result-object p1

    .line 58
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 59
    .line 60
    :cond_1
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 61
    .line 62
    if-nez p1, :cond_2

    .line 63
    .line 64
    if-eqz v5, :cond_2

    .line 65
    .line 66
    invoke-static {v5}, Lcom/p1/mobile/putong/data/Purpose;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 71
    .line 72
    :cond_2
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 77
    .line 78
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 79
    .line 80
    :cond_3
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

    .line 81
    .line 82
    if-nez p1, :cond_4

    .line 83
    .line 84
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 85
    .line 86
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

    .line 87
    .line 88
    :cond_4
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 93
    .line 94
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 99
    .line 100
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 101
    .line 102
    :cond_5
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 103
    .line 104
    if-nez p1, :cond_6

    .line 105
    .line 106
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 107
    .line 108
    :cond_6
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 109
    .line 110
    if-nez p1, :cond_7

    .line 111
    .line 112
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 113
    .line 114
    :cond_7
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 115
    .line 116
    if-nez p1, :cond_8

    .line 117
    .line 118
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 119
    .line 120
    :cond_8
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 121
    .line 122
    if-nez p1, :cond_9

    .line 123
    .line 124
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 125
    .line 126
    :cond_9
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 127
    .line 128
    if-nez p1, :cond_a

    .line 129
    .line 130
    new-instance p1, Ljava/util/ArrayList;

    .line 131
    .line 132
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 133
    .line 134
    .line 135
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 136
    .line 137
    :cond_a
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 138
    .line 139
    if-nez p1, :cond_b

    .line 140
    .line 141
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 142
    .line 143
    :cond_b
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 144
    .line 145
    if-nez p1, :cond_c

    .line 146
    .line 147
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 148
    .line 149
    :cond_c
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 150
    .line 151
    if-nez p1, :cond_d

    .line 152
    .line 153
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 154
    .line 155
    :cond_d
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 156
    .line 157
    if-nez p1, :cond_e

    .line 158
    .line 159
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 160
    .line 161
    :cond_e
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 162
    .line 163
    if-nez p1, :cond_f

    .line 164
    .line 165
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 166
    .line 167
    :cond_f
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 168
    .line 169
    if-nez p0, :cond_10

    .line 170
    .line 171
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 172
    .line 173
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 174
    .line 175
    :cond_10
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 176
    .line 177
    if-nez p0, :cond_11

    .line 178
    .line 179
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 180
    .line 181
    :cond_11
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 182
    .line 183
    if-nez p0, :cond_12

    .line 184
    .line 185
    new-instance p0, Ljava/util/ArrayList;

    .line 186
    .line 187
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 188
    .line 189
    .line 190
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 191
    .line 192
    :cond_12
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 193
    .line 194
    if-nez p0, :cond_26

    .line 195
    .line 196
    new-instance p0, Ljava/util/ArrayList;

    .line 197
    .line 198
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 199
    .line 200
    .line 201
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 202
    .line 203
    return-object v1

    .line 204
    :sswitch_0
    sget-object v6, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    .line 209
    move-result-object v6

    .line 210
    invoke-virtual {p1, v6}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 211
    .line 212
    .line 213
    move-result-object v6

    .line 214
    check-cast v6, Ljava/util/List;

    .line 215
    .line 216
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_1
    sget-object v6, Lcom/p1/mobile/putong/data/Purpose;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 221
    .line 222
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 223
    .line 224
    .line 225
    move-result-object v6

    .line 226
    invoke-virtual {p1, v6}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 227
    .line 228
    .line 229
    move-result-object v6

    .line 230
    check-cast v6, Ljava/util/List;

    .line 231
    .line 232
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_2
    sget-object v6, Lcom/p1/mobile/putong/data/SearchPriority;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 237
    .line 238
    invoke-virtual {v6}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    .line 241
    move-result-object v6

    .line 242
    invoke-virtual {p1, v6}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v6

    .line 246
    check-cast v6, Ljava/util/List;

    .line 247
    .line 248
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_3
    sget-object v6, Lcom/p1/mobile/putong/data/LookingFor;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 253
    .line 254
    invoke-virtual {p1, v6}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v6

    .line 258
    check-cast v6, Lcom/p1/mobile/putong/data/LookingFor;

    .line 259
    .line 260
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :sswitch_4
    sget-object v5, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 265
    .line 266
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 267
    .line 268
    .line 269
    move-result-object v5

    .line 270
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 271
    .line 272
    .line 273
    move-result-object v5

    .line 274
    check-cast v5, Ljava/util/List;

    .line 275
    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 279
    .line 280
    .line 281
    move-result v6

    .line 282
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 283
    .line 284
    .line 285
    move-result-object v6

    .line 286
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 287
    .line 288
    goto/16 :goto_0

    .line 289
    .line 290
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 291
    .line 292
    .line 293
    move-result v6

    .line 294
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 295
    .line 296
    .line 297
    move-result-object v6

    .line 298
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->allowSmartAvatarOpen:Ljava/lang/Boolean;

    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 303
    .line 304
    .line 305
    move-result v6

    .line 306
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 307
    .line 308
    .line 309
    move-result-object v6

    .line 310
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 315
    .line 316
    .line 317
    move-result-wide v6

    .line 318
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 319
    .line 320
    .line 321
    move-result-object v6

    .line 322
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 323
    .line 324
    goto/16 :goto_0

    .line 325
    .line 326
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 327
    .line 328
    .line 329
    move-result-wide v6

    .line 330
    invoke-static {v6, v7}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 331
    .line 332
    .line 333
    move-result-object v6

    .line 334
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 339
    .line 340
    .line 341
    move-result v6

    .line 342
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 343
    .line 344
    .line 345
    move-result-object v6

    .line 346
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 347
    .line 348
    goto/16 :goto_0

    .line 349
    .line 350
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 351
    .line 352
    .line 353
    move-result v6

    .line 354
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 355
    .line 356
    .line 357
    move-result-object v6

    .line 358
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 363
    .line 364
    .line 365
    move-result v6

    .line 366
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 367
    .line 368
    .line 369
    move-result-object v6

    .line 370
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 371
    .line 372
    goto/16 :goto_0

    .line 373
    .line 374
    :sswitch_d
    sget-object v4, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 375
    .line 376
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 377
    .line 378
    .line 379
    move-result-object v4

    .line 380
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 381
    .line 382
    .line 383
    move-result-object v4

    .line 384
    check-cast v4, Ljava/util/List;

    .line 385
    .line 386
    goto/16 :goto_0

    .line 387
    .line 388
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 389
    .line 390
    .line 391
    move-result v6

    .line 392
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 393
    .line 394
    .line 395
    move-result-object v6

    .line 396
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 397
    .line 398
    goto/16 :goto_0

    .line 399
    .line 400
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 401
    .line 402
    .line 403
    move-result v6

    .line 404
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 405
    .line 406
    .line 407
    move-result-object v6

    .line 408
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 409
    .line 410
    goto/16 :goto_0

    .line 411
    .line 412
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 413
    .line 414
    .line 415
    move-result v6

    .line 416
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 417
    .line 418
    .line 419
    move-result-object v6

    .line 420
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 421
    .line 422
    goto/16 :goto_0

    .line 423
    .line 424
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 425
    .line 426
    .line 427
    move-result v6

    .line 428
    invoke-static {v6}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 429
    .line 430
    .line 431
    move-result-object v6

    .line 432
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 433
    .line 434
    goto/16 :goto_0

    .line 435
    .line 436
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 437
    .line 438
    .line 439
    move-result v3

    .line 440
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 441
    .line 442
    .line 443
    move-result-object v3

    .line 444
    goto/16 :goto_0

    .line 445
    .line 446
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 447
    .line 448
    .line 449
    move-result v6

    .line 450
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 451
    .line 452
    .line 453
    move-result-object v6

    .line 454
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

    .line 455
    .line 456
    goto/16 :goto_0

    .line 457
    .line 458
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 459
    .line 460
    .line 461
    move-result v6

    .line 462
    invoke-static {v6}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 463
    .line 464
    .line 465
    move-result-object v6

    .line 466
    iput-object v6, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 467
    .line 468
    goto/16 :goto_0

    .line 469
    .line 470
    :sswitch_15
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 471
    .line 472
    if-nez p1, :cond_13

    .line 473
    .line 474
    if-eqz v3, :cond_13

    .line 475
    .line 476
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 477
    .line 478
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 479
    .line 480
    .line 481
    move-result v3

    .line 482
    invoke-virtual {p1, v2, v3}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 487
    .line 488
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 489
    .line 490
    :cond_13
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 491
    .line 492
    if-nez p1, :cond_14

    .line 493
    .line 494
    if-eqz v4, :cond_14

    .line 495
    .line 496
    invoke-static {v4}, Lcom/p1/mobile/putong/data/SearchPriority;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 497
    .line 498
    .line 499
    move-result-object p1

    .line 500
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 501
    .line 502
    :cond_14
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 503
    .line 504
    if-nez p1, :cond_15

    .line 505
    .line 506
    if-eqz v5, :cond_15

    .line 507
    .line 508
    invoke-static {v5}, Lcom/p1/mobile/putong/data/Purpose;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 509
    .line 510
    .line 511
    move-result-object p1

    .line 512
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 513
    .line 514
    :cond_15
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 515
    .line 516
    if-nez p1, :cond_16

    .line 517
    .line 518
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 519
    .line 520
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

    .line 521
    .line 522
    :cond_16
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

    .line 523
    .line 524
    if-nez p1, :cond_17

    .line 525
    .line 526
    sget-object p1, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 527
    .line 528
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

    .line 529
    .line 530
    :cond_17
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 531
    .line 532
    if-nez p1, :cond_18

    .line 533
    .line 534
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 535
    .line 536
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 537
    .line 538
    .line 539
    move-result-object p1

    .line 540
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 541
    .line 542
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 543
    .line 544
    :cond_18
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 545
    .line 546
    if-nez p1, :cond_19

    .line 547
    .line 548
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 549
    .line 550
    :cond_19
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 551
    .line 552
    if-nez p1, :cond_1a

    .line 553
    .line 554
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 555
    .line 556
    :cond_1a
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 557
    .line 558
    if-nez p1, :cond_1b

    .line 559
    .line 560
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 561
    .line 562
    :cond_1b
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 563
    .line 564
    if-nez p1, :cond_1c

    .line 565
    .line 566
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 567
    .line 568
    :cond_1c
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 569
    .line 570
    if-nez p1, :cond_1d

    .line 571
    .line 572
    new-instance p1, Ljava/util/ArrayList;

    .line 573
    .line 574
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 575
    .line 576
    .line 577
    iput-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 578
    .line 579
    :cond_1d
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 580
    .line 581
    if-nez p1, :cond_1e

    .line 582
    .line 583
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 584
    .line 585
    :cond_1e
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 586
    .line 587
    if-nez p1, :cond_1f

    .line 588
    .line 589
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 590
    .line 591
    :cond_1f
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 592
    .line 593
    if-nez p1, :cond_20

    .line 594
    .line 595
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 596
    .line 597
    :cond_20
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 598
    .line 599
    if-nez p1, :cond_21

    .line 600
    .line 601
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 602
    .line 603
    :cond_21
    iget-object p1, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 604
    .line 605
    if-nez p1, :cond_22

    .line 606
    .line 607
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 608
    .line 609
    :cond_22
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 610
    .line 611
    if-nez p0, :cond_23

    .line 612
    .line 613
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 614
    .line 615
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 616
    .line 617
    :cond_23
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 618
    .line 619
    if-nez p0, :cond_24

    .line 620
    .line 621
    iput-object v0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 622
    .line 623
    :cond_24
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 624
    .line 625
    if-nez p0, :cond_25

    .line 626
    .line 627
    new-instance p0, Ljava/util/ArrayList;

    .line 628
    .line 629
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 630
    .line 631
    .line 632
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 633
    .line 634
    :cond_25
    iget-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 635
    .line 636
    if-nez p0, :cond_26

    .line 637
    .line 638
    new-instance p0, Ljava/util/ArrayList;

    .line 639
    .line 640
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 641
    .line 642
    .line 643
    iput-object p0, v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 644
    .line 645
    :cond_26
    return-object v1

    .line 646
    nop

    .line 647
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_15
        0x8 -> :sswitch_14
        0x10 -> :sswitch_13
        0x18 -> :sswitch_12
        0x20 -> :sswitch_11
        0x28 -> :sswitch_10
        0x30 -> :sswitch_f
        0x38 -> :sswitch_e
        0x42 -> :sswitch_d
        0x48 -> :sswitch_c
        0x50 -> :sswitch_b
        0x58 -> :sswitch_a
        0x61 -> :sswitch_9
        0x69 -> :sswitch_8
        0x70 -> :sswitch_7
        0x78 -> :sswitch_6
        0x80 -> :sswitch_5
        0x8a -> :sswitch_4
        0x92 -> :sswitch_3
        0x9a -> :sswitch_2
        0xa2 -> :sswitch_1
        0xaa -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 647
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserSearchSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserSearchSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserSearchSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->autoAdjustRadius:Ljava/lang/Boolean;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->intelligentAvatar:Ljava/lang/Boolean;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->maxAge:Ljava/lang/Integer;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x4

    .line 42
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 43
    .line 44
    .line 45
    move-result p0

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->minAge:Ljava/lang/Integer;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x5

    .line 54
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMinimum:Ljava/lang/Integer;

    .line 62
    .line 63
    if-eqz p0, :cond_5

    .line 64
    .line 65
    const/4 v0, 0x6

    .line 66
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 67
    .line 68
    .line 69
    move-result p0

    .line 70
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 71
    .line 72
    .line 73
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->ageAllowedMaximum:Ljava/lang/Integer;

    .line 74
    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    const/4 v0, 0x7

    .line 78
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 79
    .line 80
    .line 81
    move-result p0

    .line 82
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 83
    .line 84
    .line 85
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 86
    .line 87
    if-eqz p0, :cond_7

    .line 88
    .line 89
    invoke-static {p0}, Lcom/p1/mobile/putong/data/SearchPriority;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 90
    .line 91
    .line 92
    move-result-object p0

    .line 93
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 94
    .line 95
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    .line 98
    move-result-object v0

    .line 99
    const/16 v1, 0x8

    .line 100
    .line 101
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radius:Ljava/lang/Integer;

    .line 105
    .line 106
    if-eqz p0, :cond_8

    .line 107
    .line 108
    const/16 v0, 0x9

    .line 109
    .line 110
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 111
    .line 112
    .line 113
    move-result p0

    .line 114
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 115
    .line 116
    .line 117
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMinimum:Ljava/lang/Integer;

    .line 118
    .line 119
    if-eqz p0, :cond_9

    .line 120
    .line 121
    const/16 v0, 0xa

    .line 122
    .line 123
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 124
    .line 125
    .line 126
    move-result p0

    .line 127
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 128
    .line 129
    .line 130
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->radiusAllowedMaximum:Ljava/lang/Integer;

    .line 131
    .line 132
    if-eqz p0, :cond_a

    .line 133
    .line 134
    const/16 v0, 0xb

    .line 135
    .line 136
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 137
    .line 138
    .line 139
    move-result p0

    .line 140
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 141
    .line 142
    .line 143
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLatitude:Ljava/lang/Double;

    .line 144
    .line 145
    if-eqz p0, :cond_b

    .line 146
    .line 147
    const/16 v0, 0xc

    .line 148
    .line 149
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 150
    .line 151
    .line 152
    move-result-wide v1

    .line 153
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 154
    .line 155
    .line 156
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->roamingLongitude:Ljava/lang/Double;

    .line 157
    .line 158
    if-eqz p0, :cond_c

    .line 159
    .line 160
    const/16 v0, 0xd

    .line 161
    .line 162
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 163
    .line 164
    .line 165
    move-result-wide v1

    .line 166
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 167
    .line 168
    .line 169
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->smartAvatar:Ljava/lang/Boolean;

    .line 170
    .line 171
    if-eqz p0, :cond_d

    .line 172
    .line 173
    const/16 v0, 0xe

    .line 174
    .line 175
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 176
    .line 177
    .line 178
    move-result p0

    .line 179
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 180
    .line 181
    .line 182
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->allowSmartAvatarOpen:Ljava/lang/Boolean;

    .line 183
    .line 184
    if-eqz p0, :cond_e

    .line 185
    .line 186
    const/16 v0, 0xf

    .line 187
    .line 188
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 189
    .line 190
    .line 191
    move-result p0

    .line 192
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 193
    .line 194
    .line 195
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->invisibleRadius:Ljava/lang/Integer;

    .line 196
    .line 197
    if-eqz p0, :cond_f

    .line 198
    .line 199
    const/16 v0, 0x10

    .line 200
    .line 201
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 202
    .line 203
    .line 204
    move-result p0

    .line 205
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 206
    .line 207
    .line 208
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 209
    .line 210
    if-eqz p0, :cond_10

    .line 211
    .line 212
    invoke-static {p0}, Lcom/p1/mobile/putong/data/Purpose;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 213
    .line 214
    .line 215
    move-result-object p0

    .line 216
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 217
    .line 218
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    .line 221
    move-result-object v0

    .line 222
    const/16 v1, 0x11

    .line 223
    .line 224
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 225
    .line 226
    .line 227
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->lookingForGender:Lcom/p1/mobile/putong/data/LookingFor;

    .line 228
    .line 229
    if-eqz p0, :cond_11

    .line 230
    .line 231
    const/16 v0, 0x12

    .line 232
    .line 233
    sget-object v1, Lcom/p1/mobile/putong/data/LookingFor;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 234
    .line 235
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 236
    .line 237
    .line 238
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->priorities:Ljava/util/List;

    .line 239
    .line 240
    if-eqz p0, :cond_12

    .line 241
    .line 242
    sget-object v0, Lcom/p1/mobile/putong/data/SearchPriority;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 243
    .line 244
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 245
    .line 246
    .line 247
    move-result-object v0

    .line 248
    const/16 v1, 0x13

    .line 249
    .line 250
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 251
    .line 252
    .line 253
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->purpose:Ljava/util/List;

    .line 254
    .line 255
    if-eqz p0, :cond_13

    .line 256
    .line 257
    sget-object v0, Lcom/p1/mobile/putong/data/Purpose;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 258
    .line 259
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 260
    .line 261
    .line 262
    move-result-object v0

    .line 263
    const/16 v1, 0x14

    .line 264
    .line 265
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 266
    .line 267
    .line 268
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserSearchSettings;->friendPurpose:Ljava/util/List;

    .line 269
    .line 270
    if-eqz p0, :cond_14

    .line 271
    .line 272
    sget-object p1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 273
    .line 274
    invoke-virtual {p1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    const/16 v0, 0x15

    .line 279
    .line 280
    invoke-virtual {p2, v0, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 281
    .line 282
    .line 283
    :cond_14
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 284
    check-cast p1, Lcom/p1/mobile/putong/data/UserSearchSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserSearchSettings$1;->serialize(Lcom/p1/mobile/putong/data/UserSearchSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
