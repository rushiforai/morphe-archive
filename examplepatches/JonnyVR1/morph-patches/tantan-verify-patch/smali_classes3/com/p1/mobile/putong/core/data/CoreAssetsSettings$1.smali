.class Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 v0, 0x2

    .line 19
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/core/data/PromptLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_1
    const/4 v0, 0x4

    .line 39
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 40
    .line 41
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    sget-object v2, Lcom/p1/mobile/putong/core/data/MissMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 71
    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_4
    const/16 v0, 0x8

    .line 83
    .line 84
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 85
    .line 86
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    const/16 v0, 0x9

    .line 92
    .line 93
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 94
    .line 95
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 101
    .line 102
    if-eqz v0, :cond_5

    .line 103
    .line 104
    const/16 v1, 0xa

    .line 105
    .line 106
    sget-object v2, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_5
    const/16 v0, 0xb

    .line 114
    .line 115
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 116
    .line 117
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 123
    .line 124
    if-eqz v0, :cond_6

    .line 125
    .line 126
    const/16 v1, 0xc

    .line 127
    .line 128
    sget-object v2, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-int/2addr p0, v0

    .line 135
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 136
    .line 137
    if-eqz v0, :cond_7

    .line 138
    .line 139
    const/16 v1, 0xd

    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr p0, v0

    .line 148
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 149
    .line 150
    if-eqz v0, :cond_8

    .line 151
    .line 152
    const/16 v1, 0xe

    .line 153
    .line 154
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 162
    .line 163
    if-eqz v0, :cond_9

    .line 164
    .line 165
    const/16 v1, 0xf

    .line 166
    .line 167
    sget-object v2, Lcom/p1/mobile/putong/core/data/GraduateActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 168
    .line 169
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 170
    .line 171
    .line 172
    move-result v0

    .line 173
    add-int/2addr p0, v0

    .line 174
    :cond_9
    const/16 v0, 0x10

    .line 175
    .line 176
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 177
    .line 178
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    add-int/2addr p0, v0

    .line 183
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 184
    .line 185
    if-eqz v0, :cond_a

    .line 186
    .line 187
    sget-object v1, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 190
    .line 191
    .line 192
    move-result-object v1

    .line 193
    const/16 v2, 0x11

    .line 194
    .line 195
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 196
    .line 197
    .line 198
    move-result v0

    .line 199
    add-int/2addr p0, v0

    .line 200
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 201
    .line 202
    if-eqz v0, :cond_b

    .line 203
    .line 204
    const/16 v1, 0x12

    .line 205
    .line 206
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 207
    .line 208
    .line 209
    move-result v0

    .line 210
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    add-int/2addr p0, v0

    .line 215
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 216
    .line 217
    if-eqz v0, :cond_c

    .line 218
    .line 219
    const/16 v1, 0x13

    .line 220
    .line 221
    sget-object v2, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    add-int/2addr p0, v0

    .line 228
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 229
    .line 230
    if-eqz v0, :cond_d

    .line 231
    .line 232
    const/16 v1, 0x14

    .line 233
    .line 234
    sget-object v2, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 235
    .line 236
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 237
    .line 238
    .line 239
    move-result v0

    .line 240
    add-int/2addr p0, v0

    .line 241
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 242
    .line 243
    if-eqz v0, :cond_e

    .line 244
    .line 245
    const/16 v1, 0x15

    .line 246
    .line 247
    sget-object v2, Lcom/p1/mobile/putong/core/data/KeepConnection;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 248
    .line 249
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    add-int/2addr p0, v0

    .line 254
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 255
    .line 256
    if-eqz v0, :cond_f

    .line 257
    .line 258
    const/16 v1, 0x16

    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 261
    .line 262
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 263
    .line 264
    .line 265
    move-result v0

    .line 266
    add-int/2addr p0, v0

    .line 267
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 268
    .line 269
    if-eqz v0, :cond_10

    .line 270
    .line 271
    const/16 v1, 0x17

    .line 272
    .line 273
    sget-object v2, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 274
    .line 275
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 276
    .line 277
    .line 278
    move-result v0

    .line 279
    add-int/2addr p0, v0

    .line 280
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 281
    .line 282
    if-eqz v0, :cond_11

    .line 283
    .line 284
    const/16 v1, 0x18

    .line 285
    .line 286
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_11
    const/16 v0, 0x19

    .line 294
    .line 295
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

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
    const/16 v0, 0x1a

    .line 303
    .line 304
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 305
    .line 306
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 307
    .line 308
    .line 309
    move-result v0

    .line 310
    add-int/2addr p0, v0

    .line 311
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 312
    .line 313
    if-eqz v0, :cond_12

    .line 314
    .line 315
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 316
    .line 317
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    .line 320
    move-result-object v1

    .line 321
    const/16 v2, 0x1b

    .line 322
    .line 323
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 324
    .line 325
    .line 326
    move-result v0

    .line 327
    add-int/2addr p0, v0

    .line 328
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 329
    .line 330
    if-eqz v0, :cond_13

    .line 331
    .line 332
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 333
    .line 334
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 335
    .line 336
    .line 337
    move-result-object v1

    .line 338
    const/16 v2, 0x1c

    .line 339
    .line 340
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 341
    .line 342
    .line 343
    move-result v0

    .line 344
    add-int/2addr p0, v0

    .line 345
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 346
    .line 347
    if-eqz v0, :cond_14

    .line 348
    .line 349
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 350
    .line 351
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 352
    .line 353
    .line 354
    move-result-object v1

    .line 355
    const/16 v2, 0x1d

    .line 356
    .line 357
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 358
    .line 359
    .line 360
    move-result v0

    .line 361
    add-int/2addr p0, v0

    .line 362
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 363
    .line 364
    if-eqz v0, :cond_15

    .line 365
    .line 366
    const/16 v1, 0x1e

    .line 367
    .line 368
    sget-object v2, Lcom/p1/mobile/putong/core/data/AnonymityImg;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 369
    .line 370
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 371
    .line 372
    .line 373
    move-result v0

    .line 374
    add-int/2addr p0, v0

    .line 375
    :cond_15
    const/16 v0, 0x1f

    .line 376
    .line 377
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 378
    .line 379
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 380
    .line 381
    .line 382
    move-result v0

    .line 383
    add-int/2addr p0, v0

    .line 384
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 385
    .line 386
    if-eqz v0, :cond_16

    .line 387
    .line 388
    const/16 v1, 0x20

    .line 389
    .line 390
    sget-object v2, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 391
    .line 392
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 393
    .line 394
    .line 395
    move-result v0

    .line 396
    add-int/2addr p0, v0

    .line 397
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 398
    .line 399
    if-eqz v0, :cond_17

    .line 400
    .line 401
    const/16 v1, 0x21

    .line 402
    .line 403
    sget-object v2, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 404
    .line 405
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 406
    .line 407
    .line 408
    move-result v0

    .line 409
    add-int/2addr p0, v0

    .line 410
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 411
    .line 412
    if-eqz v0, :cond_18

    .line 413
    .line 414
    const/16 v1, 0x22

    .line 415
    .line 416
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 417
    .line 418
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 419
    .line 420
    .line 421
    move-result v0

    .line 422
    add-int/2addr p0, v0

    .line 423
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 424
    .line 425
    if-eqz v0, :cond_19

    .line 426
    .line 427
    const/16 v1, 0x23

    .line 428
    .line 429
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 430
    .line 431
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 432
    .line 433
    .line 434
    move-result v0

    .line 435
    add-int/2addr p0, v0

    .line 436
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 437
    .line 438
    if-eqz v0, :cond_1a

    .line 439
    .line 440
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 441
    .line 442
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 443
    .line 444
    .line 445
    move-result-object v1

    .line 446
    const/16 v2, 0x24

    .line 447
    .line 448
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 449
    .line 450
    .line 451
    move-result v0

    .line 452
    add-int/2addr p0, v0

    .line 453
    :cond_1a
    const/16 v0, 0x25

    .line 454
    .line 455
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 456
    .line 457
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 458
    .line 459
    .line 460
    move-result v0

    .line 461
    add-int/2addr p0, v0

    .line 462
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 463
    .line 464
    if-eqz v0, :cond_1b

    .line 465
    .line 466
    const/16 v1, 0x26

    .line 467
    .line 468
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 476
    .line 477
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 478
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;-><init>()V

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
    sparse-switch v2, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    if-eqz v1, :cond_0

    .line 20
    .line 21
    sget-object p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 22
    .line 23
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 24
    .line 25
    .line 26
    move-result v1

    .line 27
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 28
    .line 29
    .line 30
    move-result-object p1

    .line 31
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 32
    .line 33
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 34
    .line 35
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 36
    .line 37
    if-nez p1, :cond_1

    .line 38
    .line 39
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PromptLimit;->new_()Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 40
    .line 41
    .line 42
    move-result-object p1

    .line 43
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 44
    .line 45
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 46
    .line 47
    if-nez p1, :cond_2

    .line 48
    .line 49
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MissMatch;->new_()Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 54
    .line 55
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 56
    .line 57
    if-nez p1, :cond_3

    .line 58
    .line 59
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SpecialCard;->new_()Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 60
    .line 61
    .line 62
    move-result-object p1

    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 64
    .line 65
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 66
    .line 67
    if-nez p1, :cond_4

    .line 68
    .line 69
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->new_()Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 70
    .line 71
    .line 72
    move-result-object p1

    .line 73
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 74
    .line 75
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 76
    .line 77
    if-nez p1, :cond_5

    .line 78
    .line 79
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->new_()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 80
    .line 81
    .line 82
    move-result-object p1

    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 84
    .line 85
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 86
    .line 87
    if-nez p1, :cond_6

    .line 88
    .line 89
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->new_()Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 90
    .line 91
    .line 92
    move-result-object p1

    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 94
    .line 95
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 96
    .line 97
    if-nez p1, :cond_7

    .line 98
    .line 99
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->new_()Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 100
    .line 101
    .line 102
    move-result-object p1

    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 104
    .line 105
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 106
    .line 107
    if-nez p1, :cond_8

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GraduateActivity;->new_()Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 114
    .line 115
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 116
    .line 117
    if-nez p1, :cond_9

    .line 118
    .line 119
    sget-object p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 120
    .line 121
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 122
    .line 123
    .line 124
    move-result-object p1

    .line 125
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 126
    .line 127
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 128
    .line 129
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 130
    .line 131
    if-nez p1, :cond_a

    .line 132
    .line 133
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->new_()Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 134
    .line 135
    .line 136
    move-result-object p1

    .line 137
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 138
    .line 139
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 140
    .line 141
    if-nez p1, :cond_b

    .line 142
    .line 143
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->new_()Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 144
    .line 145
    .line 146
    move-result-object p1

    .line 147
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 148
    .line 149
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 150
    .line 151
    if-nez p1, :cond_c

    .line 152
    .line 153
    invoke-static {}, Lcom/p1/mobile/putong/core/data/KeepConnection;->new_()Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 154
    .line 155
    .line 156
    move-result-object p1

    .line 157
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 158
    .line 159
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 160
    .line 161
    if-nez p1, :cond_d

    .line 162
    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->new_()Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 168
    .line 169
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 170
    .line 171
    if-nez p1, :cond_e

    .line 172
    .line 173
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->new_()Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 174
    .line 175
    .line 176
    move-result-object p1

    .line 177
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 178
    .line 179
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 180
    .line 181
    if-nez p1, :cond_f

    .line 182
    .line 183
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AnonymityImg;->new_()Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 184
    .line 185
    .line 186
    move-result-object p1

    .line 187
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 188
    .line 189
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 190
    .line 191
    if-nez p1, :cond_10

    .line 192
    .line 193
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->new_()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 198
    .line 199
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 200
    .line 201
    if-nez p1, :cond_11

    .line 202
    .line 203
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 204
    .line 205
    .line 206
    move-result-object p1

    .line 207
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 208
    .line 209
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 210
    .line 211
    if-nez p1, :cond_12

    .line 212
    .line 213
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->new_()Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 218
    .line 219
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 220
    .line 221
    if-nez p1, :cond_26

    .line 222
    .line 223
    new-instance p1, Ljava/util/ArrayList;

    .line 224
    .line 225
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 226
    .line 227
    .line 228
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 229
    .line 230
    return-object p0

    .line 231
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 232
    .line 233
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    check-cast v2, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 238
    .line 239
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 240
    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 244
    .line 245
    .line 246
    move-result v2

    .line 247
    iput v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 252
    .line 253
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    .line 255
    .line 256
    move-result-object v2

    .line 257
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v2

    .line 261
    check-cast v2, Ljava/util/List;

    .line 262
    .line 263
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v2

    .line 273
    check-cast v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 274
    .line 275
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v2

    .line 285
    check-cast v2, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 286
    .line 287
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 292
    .line 293
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 294
    .line 295
    .line 296
    move-result-object v2

    .line 297
    check-cast v2, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 298
    .line 299
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 304
    .line 305
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 306
    .line 307
    .line 308
    move-result-object v2

    .line 309
    check-cast v2, Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 310
    .line 311
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 312
    .line 313
    goto/16 :goto_0

    .line 314
    .line 315
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 316
    .line 317
    .line 318
    move-result v2

    .line 319
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 320
    .line 321
    goto/16 :goto_0

    .line 322
    .line 323
    :sswitch_8
    sget-object v2, Lcom/p1/mobile/putong/core/data/AnonymityImg;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 324
    .line 325
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 326
    .line 327
    .line 328
    move-result-object v2

    .line 329
    check-cast v2, Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 330
    .line 331
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :sswitch_9
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    .line 340
    move-result-object v2

    .line 341
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 342
    .line 343
    .line 344
    move-result-object v2

    .line 345
    check-cast v2, Ljava/util/List;

    .line 346
    .line 347
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_a
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 352
    .line 353
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 354
    .line 355
    .line 356
    move-result-object v2

    .line 357
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 358
    .line 359
    .line 360
    move-result-object v2

    .line 361
    check-cast v2, Ljava/util/List;

    .line 362
    .line 363
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 364
    .line 365
    goto/16 :goto_0

    .line 366
    .line 367
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 368
    .line 369
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    .line 372
    move-result-object v2

    .line 373
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 374
    .line 375
    .line 376
    move-result-object v2

    .line 377
    check-cast v2, Ljava/util/List;

    .line 378
    .line 379
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 380
    .line 381
    goto/16 :goto_0

    .line 382
    .line 383
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 384
    .line 385
    .line 386
    move-result v2

    .line 387
    iput v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 392
    .line 393
    .line 394
    move-result v2

    .line 395
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 396
    .line 397
    goto/16 :goto_0

    .line 398
    .line 399
    :sswitch_e
    sget-object v2, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 400
    .line 401
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 402
    .line 403
    .line 404
    move-result-object v2

    .line 405
    check-cast v2, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 406
    .line 407
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 408
    .line 409
    goto/16 :goto_0

    .line 410
    .line 411
    :sswitch_f
    sget-object v2, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 412
    .line 413
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 414
    .line 415
    .line 416
    move-result-object v2

    .line 417
    check-cast v2, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 418
    .line 419
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 420
    .line 421
    goto/16 :goto_0

    .line 422
    .line 423
    :sswitch_10
    sget-object v2, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 424
    .line 425
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 426
    .line 427
    .line 428
    move-result-object v2

    .line 429
    check-cast v2, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 430
    .line 431
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 432
    .line 433
    goto/16 :goto_0

    .line 434
    .line 435
    :sswitch_11
    sget-object v2, Lcom/p1/mobile/putong/core/data/KeepConnection;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 436
    .line 437
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 438
    .line 439
    .line 440
    move-result-object v2

    .line 441
    check-cast v2, Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 442
    .line 443
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 444
    .line 445
    goto/16 :goto_0

    .line 446
    .line 447
    :sswitch_12
    sget-object v2, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 448
    .line 449
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 450
    .line 451
    .line 452
    move-result-object v2

    .line 453
    check-cast v2, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 454
    .line 455
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 456
    .line 457
    goto/16 :goto_0

    .line 458
    .line 459
    :sswitch_13
    sget-object v2, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 460
    .line 461
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 462
    .line 463
    .line 464
    move-result-object v2

    .line 465
    check-cast v2, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 466
    .line 467
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 468
    .line 469
    goto/16 :goto_0

    .line 470
    .line 471
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 472
    .line 473
    .line 474
    move-result v1

    .line 475
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 476
    .line 477
    .line 478
    move-result-object v1

    .line 479
    goto/16 :goto_0

    .line 480
    .line 481
    :sswitch_15
    sget-object v2, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 482
    .line 483
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 484
    .line 485
    .line 486
    move-result-object v2

    .line 487
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 488
    .line 489
    .line 490
    move-result-object v2

    .line 491
    check-cast v2, Ljava/util/List;

    .line 492
    .line 493
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 494
    .line 495
    goto/16 :goto_0

    .line 496
    .line 497
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 498
    .line 499
    .line 500
    move-result v2

    .line 501
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 502
    .line 503
    goto/16 :goto_0

    .line 504
    .line 505
    :sswitch_17
    sget-object v2, Lcom/p1/mobile/putong/core/data/GraduateActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 506
    .line 507
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 508
    .line 509
    .line 510
    move-result-object v2

    .line 511
    check-cast v2, Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 512
    .line 513
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 514
    .line 515
    goto/16 :goto_0

    .line 516
    .line 517
    :sswitch_18
    sget-object v2, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 518
    .line 519
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 520
    .line 521
    .line 522
    move-result-object v2

    .line 523
    check-cast v2, Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 524
    .line 525
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 526
    .line 527
    goto/16 :goto_0

    .line 528
    .line 529
    :sswitch_19
    sget-object v2, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 530
    .line 531
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 532
    .line 533
    .line 534
    move-result-object v2

    .line 535
    check-cast v2, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 536
    .line 537
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 538
    .line 539
    goto/16 :goto_0

    .line 540
    .line 541
    :sswitch_1a
    sget-object v2, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 542
    .line 543
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 544
    .line 545
    .line 546
    move-result-object v2

    .line 547
    check-cast v2, Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 548
    .line 549
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 550
    .line 551
    goto/16 :goto_0

    .line 552
    .line 553
    :sswitch_1b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 554
    .line 555
    .line 556
    move-result v2

    .line 557
    iput v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 558
    .line 559
    goto/16 :goto_0

    .line 560
    .line 561
    :sswitch_1c
    sget-object v2, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 562
    .line 563
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 564
    .line 565
    .line 566
    move-result-object v2

    .line 567
    check-cast v2, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 568
    .line 569
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 570
    .line 571
    goto/16 :goto_0

    .line 572
    .line 573
    :sswitch_1d
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 574
    .line 575
    .line 576
    move-result-wide v2

    .line 577
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 578
    .line 579
    goto/16 :goto_0

    .line 580
    .line 581
    :sswitch_1e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 582
    .line 583
    .line 584
    move-result v2

    .line 585
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 586
    .line 587
    goto/16 :goto_0

    .line 588
    .line 589
    :sswitch_1f
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 590
    .line 591
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 592
    .line 593
    .line 594
    move-result-object v2

    .line 595
    check-cast v2, Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 596
    .line 597
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 598
    .line 599
    goto/16 :goto_0

    .line 600
    .line 601
    :sswitch_20
    sget-object v2, Lcom/p1/mobile/putong/core/data/SpecialCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 602
    .line 603
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 604
    .line 605
    .line 606
    move-result-object v2

    .line 607
    check-cast v2, Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 608
    .line 609
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 610
    .line 611
    goto/16 :goto_0

    .line 612
    .line 613
    :sswitch_21
    sget-object v2, Lcom/p1/mobile/putong/core/data/MissMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 614
    .line 615
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 616
    .line 617
    .line 618
    move-result-object v2

    .line 619
    check-cast v2, Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 620
    .line 621
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 622
    .line 623
    goto/16 :goto_0

    .line 624
    .line 625
    :sswitch_22
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 626
    .line 627
    .line 628
    move-result-wide v2

    .line 629
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 630
    .line 631
    goto/16 :goto_0

    .line 632
    .line 633
    :sswitch_23
    sget-object v2, Lcom/p1/mobile/putong/core/data/PromptLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 634
    .line 635
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 636
    .line 637
    .line 638
    move-result-object v2

    .line 639
    check-cast v2, Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 640
    .line 641
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 642
    .line 643
    goto/16 :goto_0

    .line 644
    .line 645
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 646
    .line 647
    .line 648
    move-result v2

    .line 649
    iput-boolean v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 650
    .line 651
    goto/16 :goto_0

    .line 652
    .line 653
    :sswitch_25
    sget-object v2, Lcom/p1/mobile/putong/core/data/InactivateReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 654
    .line 655
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 656
    .line 657
    .line 658
    move-result-object v2

    .line 659
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 660
    .line 661
    .line 662
    move-result-object v2

    .line 663
    check-cast v2, Ljava/util/List;

    .line 664
    .line 665
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 666
    .line 667
    goto/16 :goto_0

    .line 668
    .line 669
    :sswitch_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 670
    .line 671
    if-nez p1, :cond_13

    .line 672
    .line 673
    if-eqz v1, :cond_13

    .line 674
    .line 675
    sget-object p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 676
    .line 677
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 678
    .line 679
    .line 680
    move-result v1

    .line 681
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 682
    .line 683
    .line 684
    move-result-object p1

    .line 685
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 686
    .line 687
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 688
    .line 689
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 690
    .line 691
    if-nez p1, :cond_14

    .line 692
    .line 693
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PromptLimit;->new_()Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 694
    .line 695
    .line 696
    move-result-object p1

    .line 697
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 698
    .line 699
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 700
    .line 701
    if-nez p1, :cond_15

    .line 702
    .line 703
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MissMatch;->new_()Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 704
    .line 705
    .line 706
    move-result-object p1

    .line 707
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 708
    .line 709
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 710
    .line 711
    if-nez p1, :cond_16

    .line 712
    .line 713
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SpecialCard;->new_()Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 714
    .line 715
    .line 716
    move-result-object p1

    .line 717
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 718
    .line 719
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 720
    .line 721
    if-nez p1, :cond_17

    .line 722
    .line 723
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->new_()Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 724
    .line 725
    .line 726
    move-result-object p1

    .line 727
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 728
    .line 729
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 730
    .line 731
    if-nez p1, :cond_18

    .line 732
    .line 733
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->new_()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 734
    .line 735
    .line 736
    move-result-object p1

    .line 737
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 738
    .line 739
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 740
    .line 741
    if-nez p1, :cond_19

    .line 742
    .line 743
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->new_()Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 744
    .line 745
    .line 746
    move-result-object p1

    .line 747
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 748
    .line 749
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 750
    .line 751
    if-nez p1, :cond_1a

    .line 752
    .line 753
    invoke-static {}, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->new_()Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 754
    .line 755
    .line 756
    move-result-object p1

    .line 757
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 758
    .line 759
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 760
    .line 761
    if-nez p1, :cond_1b

    .line 762
    .line 763
    invoke-static {}, Lcom/p1/mobile/putong/core/data/GraduateActivity;->new_()Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 764
    .line 765
    .line 766
    move-result-object p1

    .line 767
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 768
    .line 769
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 770
    .line 771
    if-nez p1, :cond_1c

    .line 772
    .line 773
    sget-object p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 774
    .line 775
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 776
    .line 777
    .line 778
    move-result-object p1

    .line 779
    check-cast p1, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 780
    .line 781
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 782
    .line 783
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 784
    .line 785
    if-nez p1, :cond_1d

    .line 786
    .line 787
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->new_()Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 788
    .line 789
    .line 790
    move-result-object p1

    .line 791
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 792
    .line 793
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 794
    .line 795
    if-nez p1, :cond_1e

    .line 796
    .line 797
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->new_()Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 798
    .line 799
    .line 800
    move-result-object p1

    .line 801
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 802
    .line 803
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 804
    .line 805
    if-nez p1, :cond_1f

    .line 806
    .line 807
    invoke-static {}, Lcom/p1/mobile/putong/core/data/KeepConnection;->new_()Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 808
    .line 809
    .line 810
    move-result-object p1

    .line 811
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 812
    .line 813
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 814
    .line 815
    if-nez p1, :cond_20

    .line 816
    .line 817
    invoke-static {}, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->new_()Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 818
    .line 819
    .line 820
    move-result-object p1

    .line 821
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 822
    .line 823
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 824
    .line 825
    if-nez p1, :cond_21

    .line 826
    .line 827
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->new_()Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 828
    .line 829
    .line 830
    move-result-object p1

    .line 831
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 832
    .line 833
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 834
    .line 835
    if-nez p1, :cond_22

    .line 836
    .line 837
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AnonymityImg;->new_()Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 838
    .line 839
    .line 840
    move-result-object p1

    .line 841
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 842
    .line 843
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 844
    .line 845
    if-nez p1, :cond_23

    .line 846
    .line 847
    invoke-static {}, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->new_()Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 848
    .line 849
    .line 850
    move-result-object p1

    .line 851
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 852
    .line 853
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 854
    .line 855
    if-nez p1, :cond_24

    .line 856
    .line 857
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->new_()Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 858
    .line 859
    .line 860
    move-result-object p1

    .line 861
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 862
    .line 863
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 864
    .line 865
    if-nez p1, :cond_25

    .line 866
    .line 867
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->new_()Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 868
    .line 869
    .line 870
    move-result-object p1

    .line 871
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 872
    .line 873
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 874
    .line 875
    if-nez p1, :cond_26

    .line 876
    .line 877
    new-instance p1, Ljava/util/ArrayList;

    .line 878
    .line 879
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 880
    .line 881
    .line 882
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 883
    .line 884
    :cond_26
    return-object p0

    .line 885
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_26
        0xa -> :sswitch_25
        0x10 -> :sswitch_24
        0x1a -> :sswitch_23
        0x20 -> :sswitch_22
        0x2a -> :sswitch_21
        0x32 -> :sswitch_20
        0x3a -> :sswitch_1f
        0x40 -> :sswitch_1e
        0x49 -> :sswitch_1d
        0x52 -> :sswitch_1c
        0x58 -> :sswitch_1b
        0x62 -> :sswitch_1a
        0x6a -> :sswitch_19
        0x72 -> :sswitch_18
        0x7a -> :sswitch_17
        0x80 -> :sswitch_16
        0x8a -> :sswitch_15
        0x90 -> :sswitch_14
        0x9a -> :sswitch_13
        0xa2 -> :sswitch_12
        0xaa -> :sswitch_11
        0xb2 -> :sswitch_10
        0xba -> :sswitch_f
        0xc2 -> :sswitch_e
        0xc8 -> :sswitch_d
        0xd0 -> :sswitch_c
        0xda -> :sswitch_b
        0xe2 -> :sswitch_a
        0xea -> :sswitch_9
        0xf2 -> :sswitch_8
        0xf8 -> :sswitch_7
        0x102 -> :sswitch_6
        0x10a -> :sswitch_5
        0x112 -> :sswitch_4
        0x11a -> :sswitch_3
        0x122 -> :sswitch_2
        0x128 -> :sswitch_1
        0x132 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 885
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->inactivateReason:Ljava/util/List;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    sget-object v0, Lcom/p1/mobile/putong/core/data/InactivateReason;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    const/4 p0, 0x2

    .line 16
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->closeAct2GoodAll:Z

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->prompt:Lcom/p1/mobile/putong/core/data/PromptLimit;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/core/data/PromptLimit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_1
    const/4 p0, 0x4

    .line 32
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->counterPollingSeconds:J

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->missMatch:Lcom/p1/mobile/putong/core/data/MissMatch;

    .line 38
    .line 39
    if-eqz p0, :cond_2

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    sget-object v1, Lcom/p1/mobile/putong/core/data/MissMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 43
    .line 44
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->specialCard:Lcom/p1/mobile/putong/core/data/SpecialCard;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/SpecialCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatEffect:Lcom/p1/mobile/putong/core/data/ChatEffect;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatEffect;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    const/16 p0, 0x8

    .line 68
    .line 69
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBind:Z

    .line 70
    .line 71
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 72
    .line 73
    .line 74
    const/16 p0, 0x9

    .line 75
    .line 76
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->forcePhoneBindTime:D

    .line 77
    .line 78
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 79
    .line 80
    .line 81
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->thirdPartySticker:Lcom/p1/mobile/putong/core/data/ThirdPartySticker;

    .line 82
    .line 83
    if-eqz p0, :cond_5

    .line 84
    .line 85
    const/16 v0, 0xa

    .line 86
    .line 87
    sget-object v1, Lcom/p1/mobile/putong/core/data/ThirdPartySticker;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 90
    .line 91
    .line 92
    :cond_5
    const/16 p0, 0xb

    .line 93
    .line 94
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->enableVoiceCall:I

    .line 95
    .line 96
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 97
    .line 98
    .line 99
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->letterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 100
    .line 101
    if-eqz p0, :cond_6

    .line 102
    .line 103
    const/16 v0, 0xc

    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 108
    .line 109
    .line 110
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->showLiveForIntlAdUser:Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;

    .line 111
    .line 112
    if-eqz p0, :cond_7

    .line 113
    .line 114
    const/16 v0, 0xd

    .line 115
    .line 116
    sget-object v1, Lcom/p1/mobile/putong/core/data/ShowLiveForIntlAdUser;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 119
    .line 120
    .line 121
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlChatRequest:Lcom/p1/mobile/putong/core/data/IntlChatRequest;

    .line 122
    .line 123
    if-eqz p0, :cond_8

    .line 124
    .line 125
    const/16 v0, 0xe

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/core/data/IntlChatRequest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 130
    .line 131
    .line 132
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->graduateActivity:Lcom/p1/mobile/putong/core/data/GraduateActivity;

    .line 133
    .line 134
    if-eqz p0, :cond_9

    .line 135
    .line 136
    const/16 v0, 0xf

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/putong/core/data/GraduateActivity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_9
    const/16 p0, 0x10

    .line 144
    .line 145
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoReadConversation:Z

    .line 146
    .line 147
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 148
    .line 149
    .line 150
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->rateAlertSetting:Ljava/util/List;

    .line 151
    .line 152
    if-eqz p0, :cond_a

    .line 153
    .line 154
    sget-object v0, Lcom/p1/mobile/putong/core/data/RateAlertSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    const/16 v1, 0x11

    .line 161
    .line 162
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 163
    .line 164
    .line 165
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 166
    .line 167
    if-eqz p0, :cond_b

    .line 168
    .line 169
    const/16 v0, 0x12

    .line 170
    .line 171
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 172
    .line 173
    .line 174
    move-result p0

    .line 175
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 176
    .line 177
    .line 178
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->appUpdateVersionData:Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;

    .line 179
    .line 180
    if-eqz p0, :cond_c

    .line 181
    .line 182
    const/16 v0, 0x13

    .line 183
    .line 184
    sget-object v1, Lcom/p1/mobile/putong/core/data/AppUpdateVersionData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 187
    .line 188
    .line 189
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->schoolVerificationAgeRange:Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;

    .line 190
    .line 191
    if-eqz p0, :cond_d

    .line 192
    .line 193
    const/16 v0, 0x14

    .line 194
    .line 195
    sget-object v1, Lcom/p1/mobile/putong/core/data/SchoolVerificationAgeRange;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 196
    .line 197
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 198
    .line 199
    .line 200
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->keepConnection:Lcom/p1/mobile/putong/core/data/KeepConnection;

    .line 201
    .line 202
    if-eqz p0, :cond_e

    .line 203
    .line 204
    const/16 v0, 0x15

    .line 205
    .line 206
    sget-object v1, Lcom/p1/mobile/putong/core/data/KeepConnection;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 207
    .line 208
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 209
    .line 210
    .line 211
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userScrapeReporting:Lcom/p1/mobile/putong/core/data/UserScrapeReporting;

    .line 212
    .line 213
    if-eqz p0, :cond_f

    .line 214
    .line 215
    const/16 v0, 0x16

    .line 216
    .line 217
    sget-object v1, Lcom/p1/mobile/putong/core/data/UserScrapeReporting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 218
    .line 219
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 220
    .line 221
    .line 222
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->lowPriceFirstMonth:Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;

    .line 223
    .line 224
    if-eqz p0, :cond_10

    .line 225
    .line 226
    const/16 v0, 0x17

    .line 227
    .line 228
    sget-object v1, Lcom/p1/mobile/putong/core/data/LowPriceFirstMonth;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 231
    .line 232
    .line 233
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeMatchThenPay:Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;

    .line 234
    .line 235
    if-eqz p0, :cond_11

    .line 236
    .line 237
    const/16 v0, 0x18

    .line 238
    .line 239
    sget-object v1, Lcom/p1/mobile/putong/core/data/SeeMatchThenPay;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    .line 241
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 242
    .line 243
    .line 244
    :cond_11
    const/16 p0, 0x19

    .line 245
    .line 246
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoPayEnable:Z

    .line 247
    .line 248
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 249
    .line 250
    .line 251
    const/16 p0, 0x1a

    .line 252
    .line 253
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->seeSwipeCountInOneSession:I

    .line 254
    .line 255
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 256
    .line 257
    .line 258
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicHobbyTags:Ljava/util/List;

    .line 259
    .line 260
    if-eqz p0, :cond_12

    .line 261
    .line 262
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 263
    .line 264
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 265
    .line 266
    .line 267
    move-result-object v0

    .line 268
    const/16 v1, 0x1b

    .line 269
    .line 270
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 271
    .line 272
    .line 273
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicRecentTags:Ljava/util/List;

    .line 274
    .line 275
    if-eqz p0, :cond_13

    .line 276
    .line 277
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 278
    .line 279
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 280
    .line 281
    .line 282
    move-result-object v0

    .line 283
    const/16 v1, 0x1c

    .line 284
    .line 285
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 286
    .line 287
    .line 288
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileBasicTogetherTags:Ljava/util/List;

    .line 289
    .line 290
    if-eqz p0, :cond_14

    .line 291
    .line 292
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileBasicTag;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 293
    .line 294
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 295
    .line 296
    .line 297
    move-result-object v0

    .line 298
    const/16 v1, 0x1d

    .line 299
    .line 300
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 301
    .line 302
    .line 303
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->anonymityImg:Lcom/p1/mobile/putong/core/data/AnonymityImg;

    .line 304
    .line 305
    if-eqz p0, :cond_15

    .line 306
    .line 307
    const/16 v0, 0x1e

    .line 308
    .line 309
    sget-object v1, Lcom/p1/mobile/putong/core/data/AnonymityImg;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 310
    .line 311
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 312
    .line 313
    .line 314
    :cond_15
    const/16 p0, 0x1f

    .line 315
    .line 316
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatGuideExp:Z

    .line 317
    .line 318
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 319
    .line 320
    .line 321
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->intlLetterContent:Lcom/p1/mobile/putong/core/data/LetterMultilingual;

    .line 322
    .line 323
    if-eqz p0, :cond_16

    .line 324
    .line 325
    const/16 v0, 0x20

    .line 326
    .line 327
    sget-object v1, Lcom/p1/mobile/putong/core/data/LetterMultilingual;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 328
    .line 329
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 330
    .line 331
    .line 332
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->autoRenewalBenefit:Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;

    .line 333
    .line 334
    if-eqz p0, :cond_17

    .line 335
    .line 336
    const/16 v0, 0x21

    .line 337
    .line 338
    sget-object v1, Lcom/p1/mobile/putong/core/data/AutoRenewalBenefit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 339
    .line 340
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 341
    .line 342
    .line 343
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInputOrder:Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;

    .line 344
    .line 345
    if-eqz p0, :cond_18

    .line 346
    .line 347
    const/16 v0, 0x22

    .line 348
    .line 349
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInputOrder;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 350
    .line 351
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 352
    .line 353
    .line 354
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->guideText:Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;

    .line 355
    .line 356
    if-eqz p0, :cond_19

    .line 357
    .line 358
    const/16 v0, 0x23

    .line 359
    .line 360
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProfileUpgradeGuideText;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 361
    .line 362
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 363
    .line 364
    .line 365
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->profileUpgradeInterest:Ljava/util/List;

    .line 366
    .line 367
    if-eqz p0, :cond_1a

    .line 368
    .line 369
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProfileUpgradeInterest;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 370
    .line 371
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 372
    .line 373
    .line 374
    move-result-object v0

    .line 375
    const/16 v1, 0x24

    .line 376
    .line 377
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 378
    .line 379
    .line 380
    :cond_1a
    const/16 p0, 0x25

    .line 381
    .line 382
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->chatOnlineDuration:I

    .line 383
    .line 384
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 385
    .line 386
    .line 387
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;->userBanAppealSwitch:Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;

    .line 388
    .line 389
    if-eqz p0, :cond_1b

    .line 390
    .line 391
    const/16 p1, 0x26

    .line 392
    .line 393
    sget-object v0, Lcom/p1/mobile/putong/core/data/UserBanAppealSwitch;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 394
    .line 395
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 396
    .line 397
    .line 398
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

    .line 399
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreAssetsSettings$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreAssetsSettings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
