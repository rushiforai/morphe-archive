.class Lcom/p1/mobile/putong/data/Profile$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Profile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Profile;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Profile;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    add-int/2addr p0, v0

    .line 22
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-virtual {v0}, Ljava/lang/Long;->longValue()J

    .line 38
    .line 39
    .line 40
    move-result-wide v2

    .line 41
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    .line 55
    move-result-object v1

    .line 56
    const/4 v2, 0x5

    .line 57
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    sget-object v1, Lcom/p1/mobile/putong/data/Social;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/16 v2, 0x8

    .line 95
    .line 96
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 108
    .line 109
    .line 110
    move-result-object v1

    .line 111
    const/16 v2, 0x9

    .line 112
    .line 113
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 119
    .line 120
    if-eqz v0, :cond_9

    .line 121
    .line 122
    const/16 v1, 0xa

    .line 123
    .line 124
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 125
    .line 126
    .line 127
    move-result v0

    .line 128
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    add-int/2addr p0, v0

    .line 133
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 134
    .line 135
    if-eqz v0, :cond_a

    .line 136
    .line 137
    const/16 v1, 0xb

    .line 138
    .line 139
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    add-int/2addr p0, v0

    .line 144
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 145
    .line 146
    if-eqz v0, :cond_b

    .line 147
    .line 148
    const/16 v1, 0xc

    .line 149
    .line 150
    sget-object v2, Lcom/p1/mobile/putong/data/Work;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    add-int/2addr p0, v0

    .line 157
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 158
    .line 159
    if-eqz v0, :cond_c

    .line 160
    .line 161
    const/16 v1, 0xd

    .line 162
    .line 163
    sget-object v2, Lcom/p1/mobile/putong/data/Studies;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    add-int/2addr p0, v0

    .line 170
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 171
    .line 172
    if-eqz v0, :cond_d

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
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 188
    .line 189
    if-eqz v0, :cond_e

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
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 199
    .line 200
    if-eqz v0, :cond_f

    .line 201
    .line 202
    const/16 v1, 0x10

    .line 203
    .line 204
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileTbh;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 205
    .line 206
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    add-int/2addr p0, v0

    .line 211
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 212
    .line 213
    if-eqz v0, :cond_10

    .line 214
    .line 215
    const/16 v1, 0x11

    .line 216
    .line 217
    sget-object v2, Lcom/p1/mobile/putong/data/FollowshipCounters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 218
    .line 219
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 220
    .line 221
    .line 222
    move-result v0

    .line 223
    add-int/2addr p0, v0

    .line 224
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 225
    .line 226
    if-eqz v0, :cond_11

    .line 227
    .line 228
    const/16 v1, 0x12

    .line 229
    .line 230
    sget-object v2, Lcom/p1/mobile/putong/data/Moments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 238
    .line 239
    if-eqz v0, :cond_12

    .line 240
    .line 241
    const/16 v1, 0x13

    .line 242
    .line 243
    sget-object v2, Lcom/p1/mobile/putong/data/UserProfileMood;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 251
    .line 252
    if-eqz v0, :cond_13

    .line 253
    .line 254
    const/16 v1, 0x14

    .line 255
    .line 256
    sget-object v2, Lcom/p1/mobile/putong/data/Extensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 264
    .line 265
    if-eqz v0, :cond_14

    .line 266
    .line 267
    const/16 v1, 0x15

    .line 268
    .line 269
    sget-object v2, Lcom/p1/mobile/putong/data/MoodMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 270
    .line 271
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 272
    .line 273
    .line 274
    move-result v0

    .line 275
    add-int/2addr p0, v0

    .line 276
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 277
    .line 278
    if-eqz v0, :cond_15

    .line 279
    .line 280
    const/16 v1, 0x16

    .line 281
    .line 282
    sget-object v2, Lcom/p1/mobile/putong/data/BizAnswers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 283
    .line 284
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 285
    .line 286
    .line 287
    move-result v0

    .line 288
    add-int/2addr p0, v0

    .line 289
    :cond_15
    const/16 v0, 0x17

    .line 290
    .line 291
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 292
    .line 293
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 294
    .line 295
    .line 296
    move-result v0

    .line 297
    add-int/2addr p0, v0

    .line 298
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 299
    .line 300
    if-eqz v0, :cond_16

    .line 301
    .line 302
    const/16 v1, 0x18

    .line 303
    .line 304
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 305
    .line 306
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    add-int/2addr p0, v0

    .line 311
    :cond_16
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 312
    .line 313
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 314
    check-cast p1, Lcom/p1/mobile/putong/data/Profile;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Profile$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Profile;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Profile;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Profile;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Profile;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 9
    .line 10
    .line 11
    move-result v2

    .line 12
    const-string v3, ""

    .line 13
    .line 14
    sparse-switch v2, :sswitch_data_0

    .line 15
    .line 16
    .line 17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 24
    .line 25
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 26
    .line 27
    .line 28
    move-result v1

    .line 29
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 30
    .line 31
    .line 32
    move-result-object p1

    .line 33
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    new-instance p1, Ljava/util/ArrayList;

    .line 60
    .line 61
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 62
    .line 63
    .line 64
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 65
    .line 66
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 67
    .line 68
    if-nez p1, :cond_5

    .line 69
    .line 70
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 71
    .line 72
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 73
    .line 74
    if-nez p1, :cond_6

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->new_()Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 81
    .line 82
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 83
    .line 84
    if-nez p1, :cond_7

    .line 85
    .line 86
    new-instance p1, Ljava/util/ArrayList;

    .line 87
    .line 88
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 89
    .line 90
    .line 91
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 92
    .line 93
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 94
    .line 95
    if-nez p1, :cond_8

    .line 96
    .line 97
    new-instance p1, Ljava/util/ArrayList;

    .line 98
    .line 99
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 100
    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 103
    .line 104
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 105
    .line 106
    if-nez p1, :cond_9

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 117
    .line 118
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 119
    .line 120
    if-nez p1, :cond_a

    .line 121
    .line 122
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 123
    .line 124
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 125
    .line 126
    if-nez p1, :cond_b

    .line 127
    .line 128
    invoke-static {}, Lcom/p1/mobile/putong/data/Work;->new_()Lcom/p1/mobile/putong/data/Work;

    .line 129
    .line 130
    .line 131
    move-result-object p1

    .line 132
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 133
    .line 134
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 135
    .line 136
    if-nez p1, :cond_c

    .line 137
    .line 138
    invoke-static {}, Lcom/p1/mobile/putong/data/Studies;->new_()Lcom/p1/mobile/putong/data/Studies;

    .line 139
    .line 140
    .line 141
    move-result-object p1

    .line 142
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 143
    .line 144
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 145
    .line 146
    if-nez p1, :cond_d

    .line 147
    .line 148
    new-instance p1, Ljava/util/ArrayList;

    .line 149
    .line 150
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 151
    .line 152
    .line 153
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 154
    .line 155
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 156
    .line 157
    if-nez p1, :cond_e

    .line 158
    .line 159
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 160
    .line 161
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 162
    .line 163
    if-nez p1, :cond_f

    .line 164
    .line 165
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileTbh;->new_()Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 166
    .line 167
    .line 168
    move-result-object p1

    .line 169
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 170
    .line 171
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 172
    .line 173
    if-nez p1, :cond_10

    .line 174
    .line 175
    invoke-static {}, Lcom/p1/mobile/putong/data/FollowshipCounters;->new_()Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 176
    .line 177
    .line 178
    move-result-object p1

    .line 179
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 180
    .line 181
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 182
    .line 183
    if-nez p1, :cond_11

    .line 184
    .line 185
    invoke-static {}, Lcom/p1/mobile/putong/data/Moments;->new_()Lcom/p1/mobile/putong/data/Moments;

    .line 186
    .line 187
    .line 188
    move-result-object p1

    .line 189
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 190
    .line 191
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 192
    .line 193
    if-nez p1, :cond_12

    .line 194
    .line 195
    invoke-static {}, Lcom/p1/mobile/putong/data/UserProfileMood;->new_()Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 200
    .line 201
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 202
    .line 203
    if-nez p1, :cond_13

    .line 204
    .line 205
    invoke-static {}, Lcom/p1/mobile/putong/data/Extensions;->new_()Lcom/p1/mobile/putong/data/Extensions;

    .line 206
    .line 207
    .line 208
    move-result-object p1

    .line 209
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 210
    .line 211
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 212
    .line 213
    if-nez p1, :cond_14

    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/data/MoodMoment;->new_()Lcom/p1/mobile/putong/data/MoodMoment;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 220
    .line 221
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 222
    .line 223
    if-nez p1, :cond_2a

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/data/BizAnswers;->new_()Lcom/p1/mobile/putong/data/BizAnswers;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 230
    .line 231
    return-object p0

    .line 232
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 233
    .line 234
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 235
    .line 236
    .line 237
    move-result-object v2

    .line 238
    check-cast v2, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 239
    .line 240
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 245
    .line 246
    .line 247
    move-result v2

    .line 248
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/data/BizAnswers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 253
    .line 254
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 255
    .line 256
    .line 257
    move-result-object v2

    .line 258
    check-cast v2, Lcom/p1/mobile/putong/data/BizAnswers;

    .line 259
    .line 260
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/data/MoodMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 265
    .line 266
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 267
    .line 268
    .line 269
    move-result-object v2

    .line 270
    check-cast v2, Lcom/p1/mobile/putong/data/MoodMoment;

    .line 271
    .line 272
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/data/Extensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 277
    .line 278
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    check-cast v2, Lcom/p1/mobile/putong/data/Extensions;

    .line 283
    .line 284
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 285
    .line 286
    goto/16 :goto_0

    .line 287
    .line 288
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/data/UserProfileMood;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 289
    .line 290
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 291
    .line 292
    .line 293
    move-result-object v2

    .line 294
    check-cast v2, Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 295
    .line 296
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/data/Moments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 301
    .line 302
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 303
    .line 304
    .line 305
    move-result-object v2

    .line 306
    check-cast v2, Lcom/p1/mobile/putong/data/Moments;

    .line 307
    .line 308
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 309
    .line 310
    goto/16 :goto_0

    .line 311
    .line 312
    :sswitch_7
    sget-object v2, Lcom/p1/mobile/putong/data/FollowshipCounters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 313
    .line 314
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 315
    .line 316
    .line 317
    move-result-object v2

    .line 318
    check-cast v2, Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 319
    .line 320
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_8
    sget-object v2, Lcom/p1/mobile/putong/data/ProfileTbh;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 327
    .line 328
    .line 329
    move-result-object v2

    .line 330
    check-cast v2, Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 331
    .line 332
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 333
    .line 334
    goto/16 :goto_0

    .line 335
    .line 336
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 337
    .line 338
    .line 339
    move-result-object v2

    .line 340
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 341
    .line 342
    goto/16 :goto_0

    .line 343
    .line 344
    :sswitch_a
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 345
    .line 346
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 347
    .line 348
    .line 349
    move-result-object v2

    .line 350
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 351
    .line 352
    .line 353
    move-result-object v2

    .line 354
    check-cast v2, Ljava/util/List;

    .line 355
    .line 356
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 357
    .line 358
    goto/16 :goto_0

    .line 359
    .line 360
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/data/Studies;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 361
    .line 362
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 363
    .line 364
    .line 365
    move-result-object v2

    .line 366
    check-cast v2, Lcom/p1/mobile/putong/data/Studies;

    .line 367
    .line 368
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 369
    .line 370
    goto/16 :goto_0

    .line 371
    .line 372
    :sswitch_c
    sget-object v2, Lcom/p1/mobile/putong/data/Work;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 373
    .line 374
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 375
    .line 376
    .line 377
    move-result-object v2

    .line 378
    check-cast v2, Lcom/p1/mobile/putong/data/Work;

    .line 379
    .line 380
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 381
    .line 382
    goto/16 :goto_0

    .line 383
    .line 384
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 385
    .line 386
    .line 387
    move-result-object v2

    .line 388
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 389
    .line 390
    goto/16 :goto_0

    .line 391
    .line 392
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 393
    .line 394
    .line 395
    move-result v1

    .line 396
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 397
    .line 398
    .line 399
    move-result-object v1

    .line 400
    goto/16 :goto_0

    .line 401
    .line 402
    :sswitch_f
    sget-object v2, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 403
    .line 404
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 405
    .line 406
    .line 407
    move-result-object v2

    .line 408
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 409
    .line 410
    .line 411
    move-result-object v2

    .line 412
    check-cast v2, Ljava/util/List;

    .line 413
    .line 414
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 415
    .line 416
    goto/16 :goto_0

    .line 417
    .line 418
    :sswitch_10
    sget-object v2, Lcom/p1/mobile/putong/data/Social;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 419
    .line 420
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 421
    .line 422
    .line 423
    move-result-object v2

    .line 424
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 425
    .line 426
    .line 427
    move-result-object v2

    .line 428
    check-cast v2, Ljava/util/List;

    .line 429
    .line 430
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 431
    .line 432
    goto/16 :goto_0

    .line 433
    .line 434
    :sswitch_11
    sget-object v2, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 435
    .line 436
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 437
    .line 438
    .line 439
    move-result-object v2

    .line 440
    check-cast v2, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 441
    .line 442
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 443
    .line 444
    goto/16 :goto_0

    .line 445
    .line 446
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 447
    .line 448
    .line 449
    move-result-object v2

    .line 450
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 451
    .line 452
    goto/16 :goto_0

    .line 453
    .line 454
    :sswitch_13
    sget-object v2, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 455
    .line 456
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 457
    .line 458
    .line 459
    move-result-object v2

    .line 460
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 461
    .line 462
    .line 463
    move-result-object v2

    .line 464
    check-cast v2, Ljava/util/List;

    .line 465
    .line 466
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 467
    .line 468
    goto/16 :goto_0

    .line 469
    .line 470
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 471
    .line 472
    .line 473
    move-result-wide v2

    .line 474
    invoke-static {v2, v3}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;

    .line 475
    .line 476
    .line 477
    move-result-object v2

    .line 478
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 479
    .line 480
    goto/16 :goto_0

    .line 481
    .line 482
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 483
    .line 484
    .line 485
    move-result-object v2

    .line 486
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 487
    .line 488
    goto/16 :goto_0

    .line 489
    .line 490
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 491
    .line 492
    .line 493
    move-result-object v2

    .line 494
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 495
    .line 496
    goto/16 :goto_0

    .line 497
    .line 498
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 499
    .line 500
    .line 501
    move-result-object v2

    .line 502
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 503
    .line 504
    goto/16 :goto_0

    .line 505
    .line 506
    :sswitch_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 507
    .line 508
    if-nez p1, :cond_15

    .line 509
    .line 510
    if-eqz v1, :cond_15

    .line 511
    .line 512
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 513
    .line 514
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 515
    .line 516
    .line 517
    move-result v1

    .line 518
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 519
    .line 520
    .line 521
    move-result-object p1

    .line 522
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 523
    .line 524
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 525
    .line 526
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 527
    .line 528
    if-nez p1, :cond_16

    .line 529
    .line 530
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

    .line 531
    .line 532
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 533
    .line 534
    if-nez p1, :cond_17

    .line 535
    .line 536
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 537
    .line 538
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 539
    .line 540
    if-nez p1, :cond_18

    .line 541
    .line 542
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 543
    .line 544
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 545
    .line 546
    if-nez p1, :cond_19

    .line 547
    .line 548
    new-instance p1, Ljava/util/ArrayList;

    .line 549
    .line 550
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 551
    .line 552
    .line 553
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 554
    .line 555
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 556
    .line 557
    if-nez p1, :cond_1a

    .line 558
    .line 559
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 560
    .line 561
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 562
    .line 563
    if-nez p1, :cond_1b

    .line 564
    .line 565
    invoke-static {}, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->new_()Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 566
    .line 567
    .line 568
    move-result-object p1

    .line 569
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 570
    .line 571
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 572
    .line 573
    if-nez p1, :cond_1c

    .line 574
    .line 575
    new-instance p1, Ljava/util/ArrayList;

    .line 576
    .line 577
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 578
    .line 579
    .line 580
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 581
    .line 582
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 583
    .line 584
    if-nez p1, :cond_1d

    .line 585
    .line 586
    new-instance p1, Ljava/util/ArrayList;

    .line 587
    .line 588
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 589
    .line 590
    .line 591
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 592
    .line 593
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 594
    .line 595
    if-nez p1, :cond_1e

    .line 596
    .line 597
    sget-object p1, Lcom/p1/mobile/putong/data/ProfileZodiac;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 598
    .line 599
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 600
    .line 601
    .line 602
    move-result-object p1

    .line 603
    check-cast p1, Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 604
    .line 605
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 606
    .line 607
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 608
    .line 609
    if-nez p1, :cond_1f

    .line 610
    .line 611
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 612
    .line 613
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 614
    .line 615
    if-nez p1, :cond_20

    .line 616
    .line 617
    invoke-static {}, Lcom/p1/mobile/putong/data/Work;->new_()Lcom/p1/mobile/putong/data/Work;

    .line 618
    .line 619
    .line 620
    move-result-object p1

    .line 621
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 622
    .line 623
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 624
    .line 625
    if-nez p1, :cond_21

    .line 626
    .line 627
    invoke-static {}, Lcom/p1/mobile/putong/data/Studies;->new_()Lcom/p1/mobile/putong/data/Studies;

    .line 628
    .line 629
    .line 630
    move-result-object p1

    .line 631
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 632
    .line 633
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 634
    .line 635
    if-nez p1, :cond_22

    .line 636
    .line 637
    new-instance p1, Ljava/util/ArrayList;

    .line 638
    .line 639
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 640
    .line 641
    .line 642
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 643
    .line 644
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 645
    .line 646
    if-nez p1, :cond_23

    .line 647
    .line 648
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 649
    .line 650
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 651
    .line 652
    if-nez p1, :cond_24

    .line 653
    .line 654
    invoke-static {}, Lcom/p1/mobile/putong/data/ProfileTbh;->new_()Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 655
    .line 656
    .line 657
    move-result-object p1

    .line 658
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 659
    .line 660
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 661
    .line 662
    if-nez p1, :cond_25

    .line 663
    .line 664
    invoke-static {}, Lcom/p1/mobile/putong/data/FollowshipCounters;->new_()Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 665
    .line 666
    .line 667
    move-result-object p1

    .line 668
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 669
    .line 670
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 671
    .line 672
    if-nez p1, :cond_26

    .line 673
    .line 674
    invoke-static {}, Lcom/p1/mobile/putong/data/Moments;->new_()Lcom/p1/mobile/putong/data/Moments;

    .line 675
    .line 676
    .line 677
    move-result-object p1

    .line 678
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 679
    .line 680
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 681
    .line 682
    if-nez p1, :cond_27

    .line 683
    .line 684
    invoke-static {}, Lcom/p1/mobile/putong/data/UserProfileMood;->new_()Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 685
    .line 686
    .line 687
    move-result-object p1

    .line 688
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 689
    .line 690
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 691
    .line 692
    if-nez p1, :cond_28

    .line 693
    .line 694
    invoke-static {}, Lcom/p1/mobile/putong/data/Extensions;->new_()Lcom/p1/mobile/putong/data/Extensions;

    .line 695
    .line 696
    .line 697
    move-result-object p1

    .line 698
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 699
    .line 700
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 701
    .line 702
    if-nez p1, :cond_29

    .line 703
    .line 704
    invoke-static {}, Lcom/p1/mobile/putong/data/MoodMoment;->new_()Lcom/p1/mobile/putong/data/MoodMoment;

    .line 705
    .line 706
    .line 707
    move-result-object p1

    .line 708
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 709
    .line 710
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 711
    .line 712
    if-nez p1, :cond_2a

    .line 713
    .line 714
    invoke-static {}, Lcom/p1/mobile/putong/data/BizAnswers;->new_()Lcom/p1/mobile/putong/data/BizAnswers;

    .line 715
    .line 716
    .line 717
    move-result-object p1

    .line 718
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 719
    .line 720
    :cond_2a
    return-object p0

    .line 721
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_18
        0xa -> :sswitch_17
        0x12 -> :sswitch_16
        0x1a -> :sswitch_15
        0x20 -> :sswitch_14
        0x2a -> :sswitch_13
        0x32 -> :sswitch_12
        0x3a -> :sswitch_11
        0x42 -> :sswitch_10
        0x4a -> :sswitch_f
        0x50 -> :sswitch_e
        0x5a -> :sswitch_d
        0x62 -> :sswitch_c
        0x6a -> :sswitch_b
        0x72 -> :sswitch_a
        0x7a -> :sswitch_9
        0x82 -> :sswitch_8
        0x8a -> :sswitch_7
        0x92 -> :sswitch_6
        0x9a -> :sswitch_5
        0xa2 -> :sswitch_4
        0xaa -> :sswitch_3
        0xb2 -> :sswitch_2
        0xb8 -> :sswitch_1
        0xc2 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 721
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Profile$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Profile;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Profile;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->school:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->hangouts:Ljava/lang/String;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 15
    .line 16
    .line 17
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->hometown:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikes:Ljava/lang/Long;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p0}, Ljava/lang/Long;->longValue()J

    .line 31
    .line 32
    .line 33
    move-result-wide v1

    .line 34
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->tags:Ljava/util/List;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    sget-object v0, Lcom/p1/mobile/putong/data/Tag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    .line 46
    move-result-object v0

    .line 47
    const/4 v1, 0x5

    .line 48
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->job:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->contactLookups:Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 v0, 0x7

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/data/MutualContactsLocalLookups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->social:Ljava/util/List;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    sget-object v0, Lcom/p1/mobile/putong/data/Social;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/16 v1, 0x8

    .line 80
    .line 81
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->answers:Ljava/util/List;

    .line 85
    .line 86
    if-eqz p0, :cond_8

    .line 87
    .line 88
    sget-object v0, Lcom/p1/mobile/putong/data/Answer;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    const/16 v1, 0x9

    .line 95
    .line 96
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 100
    .line 101
    if-eqz p0, :cond_9

    .line 102
    .line 103
    const/16 v0, 0xa

    .line 104
    .line 105
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 106
    .line 107
    .line 108
    move-result p0

    .line 109
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 110
    .line 111
    .line 112
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->occupation:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz p0, :cond_a

    .line 115
    .line 116
    const/16 v0, 0xb

    .line 117
    .line 118
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 119
    .line 120
    .line 121
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->work:Lcom/p1/mobile/putong/data/Work;

    .line 122
    .line 123
    if-eqz p0, :cond_b

    .line 124
    .line 125
    const/16 v0, 0xc

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/data/Work;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 130
    .line 131
    .line 132
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->studies:Lcom/p1/mobile/putong/data/Studies;

    .line 133
    .line 134
    if-eqz p0, :cond_c

    .line 135
    .line 136
    const/16 v0, 0xd

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/putong/data/Studies;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->scenarios:Ljava/util/List;

    .line 144
    .line 145
    if-eqz p0, :cond_d

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
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->receivedLikesRank:Ljava/lang/String;

    .line 159
    .line 160
    if-eqz p0, :cond_e

    .line 161
    .line 162
    const/16 v0, 0xf

    .line 163
    .line 164
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 165
    .line 166
    .line 167
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->tbh:Lcom/p1/mobile/putong/data/ProfileTbh;

    .line 168
    .line 169
    if-eqz p0, :cond_f

    .line 170
    .line 171
    const/16 v0, 0x10

    .line 172
    .line 173
    sget-object v1, Lcom/p1/mobile/putong/data/ProfileTbh;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 176
    .line 177
    .line 178
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->followships:Lcom/p1/mobile/putong/data/FollowshipCounters;

    .line 179
    .line 180
    if-eqz p0, :cond_10

    .line 181
    .line 182
    const/16 v0, 0x11

    .line 183
    .line 184
    sget-object v1, Lcom/p1/mobile/putong/data/FollowshipCounters;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 187
    .line 188
    .line 189
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->moments:Lcom/p1/mobile/putong/data/Moments;

    .line 190
    .line 191
    if-eqz p0, :cond_11

    .line 192
    .line 193
    const/16 v0, 0x12

    .line 194
    .line 195
    sget-object v1, Lcom/p1/mobile/putong/data/Moments;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 196
    .line 197
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 198
    .line 199
    .line 200
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->mood:Lcom/p1/mobile/putong/data/UserProfileMood;

    .line 201
    .line 202
    if-eqz p0, :cond_12

    .line 203
    .line 204
    const/16 v0, 0x13

    .line 205
    .line 206
    sget-object v1, Lcom/p1/mobile/putong/data/UserProfileMood;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 209
    .line 210
    .line 211
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->extensions:Lcom/p1/mobile/putong/data/Extensions;

    .line 212
    .line 213
    if-eqz p0, :cond_13

    .line 214
    .line 215
    const/16 v0, 0x14

    .line 216
    .line 217
    sget-object v1, Lcom/p1/mobile/putong/data/Extensions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 218
    .line 219
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 220
    .line 221
    .line 222
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->moodMoment:Lcom/p1/mobile/putong/data/MoodMoment;

    .line 223
    .line 224
    if-eqz p0, :cond_14

    .line 225
    .line 226
    const/16 v0, 0x15

    .line 227
    .line 228
    sget-object v1, Lcom/p1/mobile/putong/data/MoodMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 231
    .line 232
    .line 233
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->bizAnswers:Lcom/p1/mobile/putong/data/BizAnswers;

    .line 234
    .line 235
    if-eqz p0, :cond_15

    .line 236
    .line 237
    const/16 v0, 0x16

    .line 238
    .line 239
    sget-object v1, Lcom/p1/mobile/putong/data/BizAnswers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    .line 241
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 242
    .line 243
    .line 244
    :cond_15
    const/16 p0, 0x17

    .line 245
    .line 246
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Profile;->onlyShowAboutMeInside:Z

    .line 247
    .line 248
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 249
    .line 250
    .line 251
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Profile;->zodiac:Lcom/p1/mobile/putong/data/ProfileZodiac;

    .line 252
    .line 253
    if-eqz p0, :cond_16

    .line 254
    .line 255
    const/16 p1, 0x18

    .line 256
    .line 257
    sget-object v0, Lcom/p1/mobile/putong/data/ProfileZodiac;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 258
    .line 259
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 260
    .line 261
    .line 262
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

    .line 263
    check-cast p1, Lcom/p1/mobile/putong/data/Profile;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Profile$1;->serialize(Lcom/p1/mobile/putong/data/Profile;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
