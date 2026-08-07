.class Lcom/p1/mobile/putong/data/SettingGroups$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/SettingGroups;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/SettingGroups;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/SettingGroups;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/UserBoostSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/data/UserLiveSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/data/UserPrivacySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/data/UserPushSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/data/UserSearchSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 66
    .line 67
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    const/16 v1, 0x8

    .line 89
    .line 90
    sget-object v2, Lcom/p1/mobile/putong/data/UserFakeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 98
    .line 99
    if-eqz v0, :cond_8

    .line 100
    .line 101
    const/16 v1, 0x9

    .line 102
    .line 103
    sget-object v2, Lcom/p1/mobile/putong/data/UserSVIPSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 111
    .line 112
    if-eqz v0, :cond_9

    .line 113
    .line 114
    const/16 v1, 0xa

    .line 115
    .line 116
    sget-object v2, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 124
    .line 125
    if-eqz v0, :cond_a

    .line 126
    .line 127
    const/16 v1, 0xb

    .line 128
    .line 129
    sget-object v2, Lcom/p1/mobile/putong/data/SeeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 137
    .line 138
    if-eqz v0, :cond_b

    .line 139
    .line 140
    const/16 v1, 0xc

    .line 141
    .line 142
    sget-object v2, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 150
    .line 151
    if-eqz v0, :cond_c

    .line 152
    .line 153
    const/16 v1, 0xd

    .line 154
    .line 155
    sget-object v2, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr p0, v0

    .line 162
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 163
    .line 164
    if-eqz v0, :cond_d

    .line 165
    .line 166
    const/16 v1, 0xe

    .line 167
    .line 168
    sget-object v2, Lcom/p1/mobile/putong/data/ChatSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 171
    .line 172
    .line 173
    move-result v0

    .line 174
    add-int/2addr p0, v0

    .line 175
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 176
    .line 177
    if-eqz v0, :cond_e

    .line 178
    .line 179
    const/16 v1, 0xf

    .line 180
    .line 181
    sget-object v2, Lcom/p1/mobile/putong/data/ChatSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 182
    .line 183
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    add-int/2addr p0, v0

    .line 188
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 189
    .line 190
    if-eqz v0, :cond_f

    .line 191
    .line 192
    const/16 v1, 0x10

    .line 193
    .line 194
    sget-object v2, Lcom/p1/mobile/putong/data/SoulMatchGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 195
    .line 196
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 197
    .line 198
    .line 199
    move-result v0

    .line 200
    add-int/2addr p0, v0

    .line 201
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 202
    .line 203
    if-eqz v0, :cond_10

    .line 204
    .line 205
    const/16 v1, 0x11

    .line 206
    .line 207
    sget-object v2, Lcom/p1/mobile/putong/data/ShareSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 208
    .line 209
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 210
    .line 211
    .line 212
    move-result v0

    .line 213
    add-int/2addr p0, v0

    .line 214
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 215
    .line 216
    if-eqz v0, :cond_11

    .line 217
    .line 218
    const/16 v1, 0x12

    .line 219
    .line 220
    sget-object v2, Lcom/p1/mobile/putong/data/DecorationSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 221
    .line 222
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 223
    .line 224
    .line 225
    move-result v0

    .line 226
    add-int/2addr p0, v0

    .line 227
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 228
    .line 229
    if-eqz v0, :cond_12

    .line 230
    .line 231
    const/16 v1, 0x13

    .line 232
    .line 233
    sget-object v2, Lcom/p1/mobile/putong/data/ComDiamond;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 241
    .line 242
    if-eqz v0, :cond_13

    .line 243
    .line 244
    const/16 v1, 0x14

    .line 245
    .line 246
    sget-object v2, Lcom/p1/mobile/putong/data/CharacterEvaluate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 247
    .line 248
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 249
    .line 250
    .line 251
    move-result v0

    .line 252
    add-int/2addr p0, v0

    .line 253
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 254
    .line 255
    if-eqz v0, :cond_14

    .line 256
    .line 257
    const/16 v1, 0x15

    .line 258
    .line 259
    sget-object v2, Lcom/p1/mobile/putong/data/Pet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 260
    .line 261
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 262
    .line 263
    .line 264
    move-result v0

    .line 265
    add-int/2addr p0, v0

    .line 266
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 267
    .line 268
    if-eqz v0, :cond_15

    .line 269
    .line 270
    const/16 v1, 0x16

    .line 271
    .line 272
    sget-object v2, Lcom/p1/mobile/putong/data/MomentLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 273
    .line 274
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 275
    .line 276
    .line 277
    move-result v0

    .line 278
    add-int/2addr p0, v0

    .line 279
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 280
    .line 281
    if-eqz v0, :cond_16

    .line 282
    .line 283
    const/16 v1, 0x17

    .line 284
    .line 285
    sget-object v2, Lcom/p1/mobile/putong/data/VipSearchSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 286
    .line 287
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 288
    .line 289
    .line 290
    move-result v0

    .line 291
    add-int/2addr p0, v0

    .line 292
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 293
    .line 294
    if-eqz v0, :cond_17

    .line 295
    .line 296
    const/16 v1, 0x18

    .line 297
    .line 298
    sget-object v2, Lcom/p1/mobile/putong/data/UserMomentSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 299
    .line 300
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 301
    .line 302
    .line 303
    move-result v0

    .line 304
    add-int/2addr p0, v0

    .line 305
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 306
    .line 307
    if-eqz v0, :cond_18

    .line 308
    .line 309
    const/16 v1, 0x19

    .line 310
    .line 311
    sget-object v2, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 312
    .line 313
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 314
    .line 315
    .line 316
    move-result v0

    .line 317
    add-int/2addr p0, v0

    .line 318
    :cond_18
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 319
    .line 320
    if-eqz v0, :cond_19

    .line 321
    .line 322
    const/16 v1, 0x1a

    .line 323
    .line 324
    sget-object v2, Lcom/p1/mobile/putong/data/PlatinumSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 325
    .line 326
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    add-int/2addr p0, v0

    .line 331
    :cond_19
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 332
    .line 333
    if-eqz v0, :cond_1a

    .line 334
    .line 335
    const/16 v1, 0x1b

    .line 336
    .line 337
    sget-object v2, Lcom/p1/mobile/putong/data/MarrySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 340
    .line 341
    .line 342
    move-result v0

    .line 343
    add-int/2addr p0, v0

    .line 344
    :cond_1a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 345
    .line 346
    if-eqz v0, :cond_1b

    .line 347
    .line 348
    const/16 v1, 0x1c

    .line 349
    .line 350
    sget-object v2, Lcom/p1/mobile/putong/data/CityC;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 351
    .line 352
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 353
    .line 354
    .line 355
    move-result v0

    .line 356
    add-int/2addr p0, v0

    .line 357
    :cond_1b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 358
    .line 359
    if-eqz v0, :cond_1c

    .line 360
    .line 361
    const/16 v1, 0x1d

    .line 362
    .line 363
    sget-object v2, Lcom/p1/mobile/putong/data/SpVip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 364
    .line 365
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 366
    .line 367
    .line 368
    move-result v0

    .line 369
    add-int/2addr p0, v0

    .line 370
    :cond_1c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 371
    .line 372
    if-eqz v0, :cond_1d

    .line 373
    .line 374
    const/16 v1, 0x1e

    .line 375
    .line 376
    sget-object v2, Lcom/p1/mobile/putong/data/GrowthSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 377
    .line 378
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 379
    .line 380
    .line 381
    move-result v0

    .line 382
    add-int/2addr p0, v0

    .line 383
    :cond_1d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 384
    .line 385
    if-eqz v0, :cond_1e

    .line 386
    .line 387
    const/16 v1, 0x1f

    .line 388
    .line 389
    sget-object v2, Lcom/p1/mobile/putong/data/FemaleVip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 390
    .line 391
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 392
    .line 393
    .line 394
    move-result v0

    .line 395
    add-int/2addr p0, v0

    .line 396
    :cond_1e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 397
    .line 398
    if-eqz v0, :cond_1f

    .line 399
    .line 400
    const/16 v1, 0x20

    .line 401
    .line 402
    sget-object v2, Lcom/p1/mobile/putong/data/SvipSearch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 403
    .line 404
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 405
    .line 406
    .line 407
    move-result v0

    .line 408
    add-int/2addr p0, v0

    .line 409
    :cond_1f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 410
    .line 411
    if-eqz v0, :cond_20

    .line 412
    .line 413
    const/16 v1, 0x21

    .line 414
    .line 415
    sget-object v2, Lcom/p1/mobile/putong/data/NotificationSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 416
    .line 417
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 418
    .line 419
    .line 420
    move-result v0

    .line 421
    add-int/2addr p0, v0

    .line 422
    :cond_20
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 423
    .line 424
    if-eqz v0, :cond_21

    .line 425
    .line 426
    const/16 v1, 0x22

    .line 427
    .line 428
    sget-object v2, Lcom/p1/mobile/putong/data/UserUpVipSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 429
    .line 430
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 431
    .line 432
    .line 433
    move-result v0

    .line 434
    add-int/2addr p0, v0

    .line 435
    :cond_21
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 436
    .line 437
    if-eqz v0, :cond_22

    .line 438
    .line 439
    const/16 v1, 0x23

    .line 440
    .line 441
    sget-object v2, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_22
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 449
    .line 450
    if-eqz v0, :cond_23

    .line 451
    .line 452
    const/16 v1, 0x24

    .line 453
    .line 454
    sget-object v2, Lcom/p1/mobile/putong/data/IntlMoreGender;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_23
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 462
    .line 463
    if-eqz v0, :cond_24

    .line 464
    .line 465
    const/16 v1, 0x25

    .line 466
    .line 467
    sget-object v2, Lcom/p1/mobile/putong/data/TribeSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 468
    .line 469
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 470
    .line 471
    .line 472
    move-result v0

    .line 473
    add-int/2addr p0, v0

    .line 474
    :cond_24
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 475
    .line 476
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 477
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SettingGroups$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/SettingGroups;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SettingGroups;
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SettingGroups;-><init>()V

    .line 2
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    move-result v0

    sparse-switch v0, :sswitch_data_0

    .line 3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    if-nez p1, :cond_0

    invoke-static {}, Lcom/p1/mobile/putong/data/UserBoostSettings;->new_()Lcom/p1/mobile/putong/data/UserBoostSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 4
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    if-nez p1, :cond_1

    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveSettings;->new_()Lcom/p1/mobile/putong/data/UserLiveSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 5
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    if-nez p1, :cond_2

    invoke-static {}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->new_()Lcom/p1/mobile/putong/data/UserPrivacySettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 6
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    if-nez p1, :cond_3

    invoke-static {}, Lcom/p1/mobile/putong/data/UserPushSettings;->new_()Lcom/p1/mobile/putong/data/UserPushSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 7
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    if-nez p1, :cond_4

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSearchSettings;->new_()Lcom/p1/mobile/putong/data/UserSearchSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 8
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    if-nez p1, :cond_5

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->new_()Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 9
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    if-nez p1, :cond_6

    invoke-static {}, Lcom/p1/mobile/putong/data/UserFakeSettings;->new_()Lcom/p1/mobile/putong/data/UserFakeSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 10
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    if-nez p1, :cond_7

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSVIPSettings;->new_()Lcom/p1/mobile/putong/data/UserSVIPSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 11
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    if-nez p1, :cond_8

    invoke-static {}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 12
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    if-nez p1, :cond_9

    .line 13
    invoke-static {}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 14
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    if-nez p1, :cond_a

    invoke-static {}, Lcom/p1/mobile/putong/data/ChatSetting;->new_()Lcom/p1/mobile/putong/data/ChatSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 15
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    if-nez p1, :cond_b

    invoke-static {}, Lcom/p1/mobile/putong/data/ChatSetting;->new_()Lcom/p1/mobile/putong/data/ChatSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 16
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    if-nez p1, :cond_c

    invoke-static {}, Lcom/p1/mobile/putong/data/SoulMatchGroup;->new_()Lcom/p1/mobile/putong/data/SoulMatchGroup;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 17
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    if-nez p1, :cond_d

    invoke-static {}, Lcom/p1/mobile/putong/data/ShareSetting;->new_()Lcom/p1/mobile/putong/data/ShareSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 18
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    if-nez p1, :cond_e

    invoke-static {}, Lcom/p1/mobile/putong/data/DecorationSettings;->new_()Lcom/p1/mobile/putong/data/DecorationSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 19
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    if-nez p1, :cond_f

    invoke-static {}, Lcom/p1/mobile/putong/data/ComDiamond;->new_()Lcom/p1/mobile/putong/data/ComDiamond;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 20
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    if-nez p1, :cond_10

    invoke-static {}, Lcom/p1/mobile/putong/data/Pet;->new_()Lcom/p1/mobile/putong/data/Pet;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 21
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    if-nez p1, :cond_11

    invoke-static {}, Lcom/p1/mobile/putong/data/MomentLevel;->new_()Lcom/p1/mobile/putong/data/MomentLevel;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 22
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    if-nez p1, :cond_12

    invoke-static {}, Lcom/p1/mobile/putong/data/VipSearchSettings;->new_()Lcom/p1/mobile/putong/data/VipSearchSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 23
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    if-nez p1, :cond_13

    invoke-static {}, Lcom/p1/mobile/putong/data/UserMomentSettings;->new_()Lcom/p1/mobile/putong/data/UserMomentSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 24
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    if-nez p1, :cond_14

    invoke-static {}, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->new_()Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 25
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    if-nez p1, :cond_15

    invoke-static {}, Lcom/p1/mobile/putong/data/PlatinumSettings;->new_()Lcom/p1/mobile/putong/data/PlatinumSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 26
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    if-nez p1, :cond_16

    invoke-static {}, Lcom/p1/mobile/putong/data/MarrySettings;->new_()Lcom/p1/mobile/putong/data/MarrySettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 27
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    if-nez p1, :cond_17

    invoke-static {}, Lcom/p1/mobile/putong/data/CityC;->new_()Lcom/p1/mobile/putong/data/CityC;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 28
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    if-nez p1, :cond_18

    invoke-static {}, Lcom/p1/mobile/putong/data/SpVip;->new_()Lcom/p1/mobile/putong/data/SpVip;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 29
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    if-nez p1, :cond_19

    invoke-static {}, Lcom/p1/mobile/putong/data/GrowthSettings;->new_()Lcom/p1/mobile/putong/data/GrowthSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 30
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    if-nez p1, :cond_1a

    invoke-static {}, Lcom/p1/mobile/putong/data/FemaleVip;->new_()Lcom/p1/mobile/putong/data/FemaleVip;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 31
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    if-nez p1, :cond_1b

    invoke-static {}, Lcom/p1/mobile/putong/data/SvipSearch;->new_()Lcom/p1/mobile/putong/data/SvipSearch;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 32
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    if-nez p1, :cond_1c

    invoke-static {}, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->new_()Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 33
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    if-nez p1, :cond_1d

    invoke-static {}, Lcom/p1/mobile/putong/data/UserUpVipSettings;->new_()Lcom/p1/mobile/putong/data/UserUpVipSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 34
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    if-nez p1, :cond_1e

    invoke-static {}, Lcom/p1/mobile/putong/data/IntlMoreGender;->new_()Lcom/p1/mobile/putong/data/IntlMoreGender;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 35
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    if-nez p1, :cond_3e

    invoke-static {}, Lcom/p1/mobile/putong/data/TribeSetting;->new_()Lcom/p1/mobile/putong/data/TribeSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    return-object p0

    .line 36
    :sswitch_0
    sget-object v0, Lcom/p1/mobile/putong/data/TribeSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/TribeSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    goto/16 :goto_0

    .line 37
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/IntlMoreGender;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/IntlMoreGender;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    goto/16 :goto_0

    .line 38
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    goto/16 :goto_0

    .line 39
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/UserUpVipSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserUpVipSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    goto/16 :goto_0

    .line 40
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/NotificationSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/NotificationSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    goto/16 :goto_0

    .line 41
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/data/SvipSearch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SvipSearch;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    goto/16 :goto_0

    .line 42
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/FemaleVip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/FemaleVip;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    goto/16 :goto_0

    .line 43
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/GrowthSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/GrowthSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    goto/16 :goto_0

    .line 44
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/SpVip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SpVip;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    goto/16 :goto_0

    .line 45
    :sswitch_9
    sget-object v0, Lcom/p1/mobile/putong/data/CityC;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/CityC;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    goto/16 :goto_0

    .line 46
    :sswitch_a
    sget-object v0, Lcom/p1/mobile/putong/data/MarrySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/MarrySettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    goto/16 :goto_0

    .line 47
    :sswitch_b
    sget-object v0, Lcom/p1/mobile/putong/data/PlatinumSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/PlatinumSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    goto/16 :goto_0

    .line 48
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    goto/16 :goto_0

    .line 49
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/data/UserMomentSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserMomentSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    goto/16 :goto_0

    .line 50
    :sswitch_e
    sget-object v0, Lcom/p1/mobile/putong/data/VipSearchSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/VipSearchSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    goto/16 :goto_0

    .line 51
    :sswitch_f
    sget-object v0, Lcom/p1/mobile/putong/data/MomentLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/MomentLevel;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    goto/16 :goto_0

    .line 52
    :sswitch_10
    sget-object v0, Lcom/p1/mobile/putong/data/Pet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/Pet;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    goto/16 :goto_0

    .line 53
    :sswitch_11
    sget-object v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/CharacterEvaluate;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    goto/16 :goto_0

    .line 54
    :sswitch_12
    sget-object v0, Lcom/p1/mobile/putong/data/ComDiamond;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/ComDiamond;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    goto/16 :goto_0

    .line 55
    :sswitch_13
    sget-object v0, Lcom/p1/mobile/putong/data/DecorationSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/DecorationSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    goto/16 :goto_0

    .line 56
    :sswitch_14
    sget-object v0, Lcom/p1/mobile/putong/data/ShareSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/ShareSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    goto/16 :goto_0

    .line 57
    :sswitch_15
    sget-object v0, Lcom/p1/mobile/putong/data/SoulMatchGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SoulMatchGroup;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    goto/16 :goto_0

    .line 58
    :sswitch_16
    sget-object v0, Lcom/p1/mobile/putong/data/ChatSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/ChatSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    goto/16 :goto_0

    .line 59
    :sswitch_17
    sget-object v0, Lcom/p1/mobile/putong/data/ChatSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/ChatSetting;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    goto/16 :goto_0

    .line 60
    :sswitch_18
    sget-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 61
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    goto/16 :goto_0

    .line 62
    :sswitch_19
    sget-object v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    goto/16 :goto_0

    .line 64
    :sswitch_1a
    sget-object v0, Lcom/p1/mobile/putong/data/SeeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SeeSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    goto/16 :goto_0

    .line 65
    :sswitch_1b
    sget-object v0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    goto/16 :goto_0

    .line 66
    :sswitch_1c
    sget-object v0, Lcom/p1/mobile/putong/data/UserSVIPSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserSVIPSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    goto/16 :goto_0

    .line 67
    :sswitch_1d
    sget-object v0, Lcom/p1/mobile/putong/data/UserFakeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserFakeSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    goto/16 :goto_0

    .line 68
    :sswitch_1e
    sget-object v0, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 69
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    goto/16 :goto_0

    .line 70
    :sswitch_1f
    sget-object v0, Lcom/p1/mobile/putong/data/UserSearchSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserSearchSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    goto/16 :goto_0

    .line 71
    :sswitch_20
    sget-object v0, Lcom/p1/mobile/putong/data/UserPushSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserPushSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    goto/16 :goto_0

    .line 72
    :sswitch_21
    sget-object v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserPrivacySettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    goto/16 :goto_0

    .line 73
    :sswitch_22
    sget-object v0, Lcom/p1/mobile/putong/data/UserLiveSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserLiveSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    goto/16 :goto_0

    .line 74
    :sswitch_23
    sget-object v0, Lcom/p1/mobile/putong/data/UserBoostSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    move-result-object v0

    check-cast v0, Lcom/p1/mobile/putong/data/UserBoostSettings;

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    goto/16 :goto_0

    .line 75
    :sswitch_24
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    move-result-object v0

    iput-object v0, p0, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

    goto/16 :goto_0

    .line 76
    :sswitch_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    if-nez p1, :cond_1f

    invoke-static {}, Lcom/p1/mobile/putong/data/UserBoostSettings;->new_()Lcom/p1/mobile/putong/data/UserBoostSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 77
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    if-nez p1, :cond_20

    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveSettings;->new_()Lcom/p1/mobile/putong/data/UserLiveSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 78
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    if-nez p1, :cond_21

    invoke-static {}, Lcom/p1/mobile/putong/data/UserPrivacySettings;->new_()Lcom/p1/mobile/putong/data/UserPrivacySettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 79
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    if-nez p1, :cond_22

    invoke-static {}, Lcom/p1/mobile/putong/data/UserPushSettings;->new_()Lcom/p1/mobile/putong/data/UserPushSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 80
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    if-nez p1, :cond_23

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSearchSettings;->new_()Lcom/p1/mobile/putong/data/UserSearchSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 81
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    if-nez p1, :cond_24

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->new_()Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 82
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    if-nez p1, :cond_25

    invoke-static {}, Lcom/p1/mobile/putong/data/UserFakeSettings;->new_()Lcom/p1/mobile/putong/data/UserFakeSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 83
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    if-nez p1, :cond_26

    invoke-static {}, Lcom/p1/mobile/putong/data/UserSVIPSettings;->new_()Lcom/p1/mobile/putong/data/UserSVIPSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 84
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    if-nez p1, :cond_27

    invoke-static {}, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 85
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    if-nez p1, :cond_28

    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->new_()Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 87
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    if-nez p1, :cond_29

    invoke-static {}, Lcom/p1/mobile/putong/data/ChatSetting;->new_()Lcom/p1/mobile/putong/data/ChatSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 88
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    if-nez p1, :cond_2a

    invoke-static {}, Lcom/p1/mobile/putong/data/ChatSetting;->new_()Lcom/p1/mobile/putong/data/ChatSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 89
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    if-nez p1, :cond_2b

    invoke-static {}, Lcom/p1/mobile/putong/data/SoulMatchGroup;->new_()Lcom/p1/mobile/putong/data/SoulMatchGroup;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 90
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    if-nez p1, :cond_2c

    invoke-static {}, Lcom/p1/mobile/putong/data/ShareSetting;->new_()Lcom/p1/mobile/putong/data/ShareSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 91
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    if-nez p1, :cond_2d

    invoke-static {}, Lcom/p1/mobile/putong/data/DecorationSettings;->new_()Lcom/p1/mobile/putong/data/DecorationSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 92
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    if-nez p1, :cond_2e

    invoke-static {}, Lcom/p1/mobile/putong/data/ComDiamond;->new_()Lcom/p1/mobile/putong/data/ComDiamond;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 93
    :cond_2e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    if-nez p1, :cond_2f

    invoke-static {}, Lcom/p1/mobile/putong/data/Pet;->new_()Lcom/p1/mobile/putong/data/Pet;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 94
    :cond_2f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    if-nez p1, :cond_30

    invoke-static {}, Lcom/p1/mobile/putong/data/MomentLevel;->new_()Lcom/p1/mobile/putong/data/MomentLevel;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 95
    :cond_30
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    if-nez p1, :cond_31

    invoke-static {}, Lcom/p1/mobile/putong/data/VipSearchSettings;->new_()Lcom/p1/mobile/putong/data/VipSearchSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 96
    :cond_31
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    if-nez p1, :cond_32

    invoke-static {}, Lcom/p1/mobile/putong/data/UserMomentSettings;->new_()Lcom/p1/mobile/putong/data/UserMomentSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 97
    :cond_32
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    if-nez p1, :cond_33

    invoke-static {}, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->new_()Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 98
    :cond_33
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    if-nez p1, :cond_34

    invoke-static {}, Lcom/p1/mobile/putong/data/PlatinumSettings;->new_()Lcom/p1/mobile/putong/data/PlatinumSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 99
    :cond_34
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    if-nez p1, :cond_35

    invoke-static {}, Lcom/p1/mobile/putong/data/MarrySettings;->new_()Lcom/p1/mobile/putong/data/MarrySettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 100
    :cond_35
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    if-nez p1, :cond_36

    invoke-static {}, Lcom/p1/mobile/putong/data/CityC;->new_()Lcom/p1/mobile/putong/data/CityC;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 101
    :cond_36
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    if-nez p1, :cond_37

    invoke-static {}, Lcom/p1/mobile/putong/data/SpVip;->new_()Lcom/p1/mobile/putong/data/SpVip;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 102
    :cond_37
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    if-nez p1, :cond_38

    invoke-static {}, Lcom/p1/mobile/putong/data/GrowthSettings;->new_()Lcom/p1/mobile/putong/data/GrowthSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 103
    :cond_38
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    if-nez p1, :cond_39

    invoke-static {}, Lcom/p1/mobile/putong/data/FemaleVip;->new_()Lcom/p1/mobile/putong/data/FemaleVip;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 104
    :cond_39
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    if-nez p1, :cond_3a

    invoke-static {}, Lcom/p1/mobile/putong/data/SvipSearch;->new_()Lcom/p1/mobile/putong/data/SvipSearch;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 105
    :cond_3a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    if-nez p1, :cond_3b

    invoke-static {}, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->new_()Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 106
    :cond_3b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    if-nez p1, :cond_3c

    invoke-static {}, Lcom/p1/mobile/putong/data/UserUpVipSettings;->new_()Lcom/p1/mobile/putong/data/UserUpVipSettings;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 107
    :cond_3c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    if-nez p1, :cond_3d

    invoke-static {}, Lcom/p1/mobile/putong/data/IntlMoreGender;->new_()Lcom/p1/mobile/putong/data/IntlMoreGender;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 108
    :cond_3d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    if-nez p1, :cond_3e

    invoke-static {}, Lcom/p1/mobile/putong/data/TribeSetting;->new_()Lcom/p1/mobile/putong/data/TribeSetting;

    move-result-object p1

    iput-object p1, p0, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    :cond_3e
    return-object p0

    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_25
        0xa -> :sswitch_24
        0x12 -> :sswitch_23
        0x1a -> :sswitch_22
        0x22 -> :sswitch_21
        0x2a -> :sswitch_20
        0x32 -> :sswitch_1f
        0x3a -> :sswitch_1e
        0x42 -> :sswitch_1d
        0x4a -> :sswitch_1c
        0x52 -> :sswitch_1b
        0x5a -> :sswitch_1a
        0x62 -> :sswitch_19
        0x6a -> :sswitch_18
        0x72 -> :sswitch_17
        0x7a -> :sswitch_16
        0x82 -> :sswitch_15
        0x8a -> :sswitch_14
        0x92 -> :sswitch_13
        0x9a -> :sswitch_12
        0xa2 -> :sswitch_11
        0xaa -> :sswitch_10
        0xb2 -> :sswitch_f
        0xba -> :sswitch_e
        0xc2 -> :sswitch_d
        0xca -> :sswitch_c
        0xd2 -> :sswitch_b
        0xda -> :sswitch_a
        0xe2 -> :sswitch_9
        0xea -> :sswitch_8
        0xf2 -> :sswitch_7
        0xfa -> :sswitch_6
        0x102 -> :sswitch_5
        0x10a -> :sswitch_4
        0x112 -> :sswitch_3
        0x11a -> :sswitch_2
        0x122 -> :sswitch_1
        0x12a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SettingGroups$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SettingGroups;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->boost:Lcom/p1/mobile/putong/data/UserBoostSettings;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/UserBoostSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->live:Lcom/p1/mobile/putong/data/UserLiveSettings;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/UserLiveSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->privacy:Lcom/p1/mobile/putong/data/UserPrivacySettings;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/UserPrivacySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->push:Lcom/p1/mobile/putong/data/UserPushSettings;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/data/UserPushSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->search:Lcom/p1/mobile/putong/data/UserSearchSettings;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/data/UserSearchSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->subscription:Lcom/p1/mobile/putong/data/UserSubscriptionSettings;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 v0, 0x7

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/data/UserSubscriptionSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fake:Lcom/p1/mobile/putong/data/UserFakeSettings;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    const/16 v0, 0x8

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/data/UserFakeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 78
    .line 79
    .line 80
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svip:Lcom/p1/mobile/putong/data/UserSVIPSettings;

    .line 81
    .line 82
    if-eqz p0, :cond_8

    .line 83
    .line 84
    const/16 v0, 0x9

    .line 85
    .line 86
    sget-object v1, Lcom/p1/mobile/putong/data/UserSVIPSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 89
    .line 90
    .line 91
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipPrivacy:Lcom/p1/mobile/putong/data/SvipPrivacySettings;

    .line 92
    .line 93
    if-eqz p0, :cond_9

    .line 94
    .line 95
    const/16 v0, 0xa

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/data/SvipPrivacySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->see:Lcom/p1/mobile/putong/data/SeeSettings;

    .line 103
    .line 104
    if-eqz p0, :cond_a

    .line 105
    .line 106
    const/16 v0, 0xb

    .line 107
    .line 108
    sget-object v1, Lcom/p1/mobile/putong/data/SeeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIP:Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;

    .line 114
    .line 115
    if-eqz p0, :cond_b

    .line 116
    .line 117
    const/16 v0, 0xc

    .line 118
    .line 119
    sget-object v1, Lcom/p1/mobile/putong/data/DiamondVIPPrivilegeSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 122
    .line 123
    .line 124
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->diamondVIPPrivateMatch:Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;

    .line 125
    .line 126
    if-eqz p0, :cond_c

    .line 127
    .line 128
    const/16 v0, 0xd

    .line 129
    .line 130
    sget-object v1, Lcom/p1/mobile/putong/data/DiamondVIPPrivateMatch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 133
    .line 134
    .line 135
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 136
    .line 137
    if-eqz p0, :cond_d

    .line 138
    .line 139
    const/16 v0, 0xe

    .line 140
    .line 141
    sget-object v1, Lcom/p1/mobile/putong/data/ChatSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 144
    .line 145
    .line 146
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->quickchatchat:Lcom/p1/mobile/putong/data/ChatSetting;

    .line 147
    .line 148
    if-eqz p0, :cond_e

    .line 149
    .line 150
    const/16 v0, 0xf

    .line 151
    .line 152
    sget-object v1, Lcom/p1/mobile/putong/data/ChatSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 155
    .line 156
    .line 157
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->soulmate:Lcom/p1/mobile/putong/data/SoulMatchGroup;

    .line 158
    .line 159
    if-eqz p0, :cond_f

    .line 160
    .line 161
    const/16 v0, 0x10

    .line 162
    .line 163
    sget-object v1, Lcom/p1/mobile/putong/data/SoulMatchGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 166
    .line 167
    .line 168
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->share:Lcom/p1/mobile/putong/data/ShareSetting;

    .line 169
    .line 170
    if-eqz p0, :cond_10

    .line 171
    .line 172
    const/16 v0, 0x11

    .line 173
    .line 174
    sget-object v1, Lcom/p1/mobile/putong/data/ShareSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 175
    .line 176
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 177
    .line 178
    .line 179
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->decoration:Lcom/p1/mobile/putong/data/DecorationSettings;

    .line 180
    .line 181
    if-eqz p0, :cond_11

    .line 182
    .line 183
    const/16 v0, 0x12

    .line 184
    .line 185
    sget-object v1, Lcom/p1/mobile/putong/data/DecorationSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 186
    .line 187
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 188
    .line 189
    .line 190
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->comDiamond:Lcom/p1/mobile/putong/data/ComDiamond;

    .line 191
    .line 192
    if-eqz p0, :cond_12

    .line 193
    .line 194
    const/16 v0, 0x13

    .line 195
    .line 196
    sget-object v1, Lcom/p1/mobile/putong/data/ComDiamond;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 199
    .line 200
    .line 201
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->characterEvaluate:Lcom/p1/mobile/putong/data/CharacterEvaluate;

    .line 202
    .line 203
    if-eqz p0, :cond_13

    .line 204
    .line 205
    const/16 v0, 0x14

    .line 206
    .line 207
    sget-object v1, Lcom/p1/mobile/putong/data/CharacterEvaluate;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 208
    .line 209
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 210
    .line 211
    .line 212
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pet:Lcom/p1/mobile/putong/data/Pet;

    .line 213
    .line 214
    if-eqz p0, :cond_14

    .line 215
    .line 216
    const/16 v0, 0x15

    .line 217
    .line 218
    sget-object v1, Lcom/p1/mobile/putong/data/Pet;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 219
    .line 220
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 221
    .line 222
    .line 223
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->momentLevel:Lcom/p1/mobile/putong/data/MomentLevel;

    .line 224
    .line 225
    if-eqz p0, :cond_15

    .line 226
    .line 227
    const/16 v0, 0x16

    .line 228
    .line 229
    sget-object v1, Lcom/p1/mobile/putong/data/MomentLevel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 232
    .line 233
    .line 234
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->vipSearch:Lcom/p1/mobile/putong/data/VipSearchSettings;

    .line 235
    .line 236
    if-eqz p0, :cond_16

    .line 237
    .line 238
    const/16 v0, 0x17

    .line 239
    .line 240
    sget-object v1, Lcom/p1/mobile/putong/data/VipSearchSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 241
    .line 242
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 243
    .line 244
    .line 245
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->moment:Lcom/p1/mobile/putong/data/UserMomentSettings;

    .line 246
    .line 247
    if-eqz p0, :cond_17

    .line 248
    .line 249
    const/16 v0, 0x18

    .line 250
    .line 251
    sget-object v1, Lcom/p1/mobile/putong/data/UserMomentSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 252
    .line 253
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 254
    .line 255
    .line 256
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->profile:Lcom/p1/mobile/putong/data/SettingGroupsProfile;

    .line 257
    .line 258
    if-eqz p0, :cond_18

    .line 259
    .line 260
    const/16 v0, 0x19

    .line 261
    .line 262
    sget-object v1, Lcom/p1/mobile/putong/data/SettingGroupsProfile;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 263
    .line 264
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 265
    .line 266
    .line 267
    :cond_18
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->pvip:Lcom/p1/mobile/putong/data/PlatinumSettings;

    .line 268
    .line 269
    if-eqz p0, :cond_19

    .line 270
    .line 271
    const/16 v0, 0x1a

    .line 272
    .line 273
    sget-object v1, Lcom/p1/mobile/putong/data/PlatinumSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 274
    .line 275
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 276
    .line 277
    .line 278
    :cond_19
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->marriage:Lcom/p1/mobile/putong/data/MarrySettings;

    .line 279
    .line 280
    if-eqz p0, :cond_1a

    .line 281
    .line 282
    const/16 v0, 0x1b

    .line 283
    .line 284
    sget-object v1, Lcom/p1/mobile/putong/data/MarrySettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 285
    .line 286
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 287
    .line 288
    .line 289
    :cond_1a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->cityC:Lcom/p1/mobile/putong/data/CityC;

    .line 290
    .line 291
    if-eqz p0, :cond_1b

    .line 292
    .line 293
    const/16 v0, 0x1c

    .line 294
    .line 295
    sget-object v1, Lcom/p1/mobile/putong/data/CityC;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 296
    .line 297
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 298
    .line 299
    .line 300
    :cond_1b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->spvip:Lcom/p1/mobile/putong/data/SpVip;

    .line 301
    .line 302
    if-eqz p0, :cond_1c

    .line 303
    .line 304
    const/16 v0, 0x1d

    .line 305
    .line 306
    sget-object v1, Lcom/p1/mobile/putong/data/SpVip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 307
    .line 308
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 309
    .line 310
    .line 311
    :cond_1c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->growth:Lcom/p1/mobile/putong/data/GrowthSettings;

    .line 312
    .line 313
    if-eqz p0, :cond_1d

    .line 314
    .line 315
    const/16 v0, 0x1e

    .line 316
    .line 317
    sget-object v1, Lcom/p1/mobile/putong/data/GrowthSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 318
    .line 319
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 320
    .line 321
    .line 322
    :cond_1d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->fvip:Lcom/p1/mobile/putong/data/FemaleVip;

    .line 323
    .line 324
    if-eqz p0, :cond_1e

    .line 325
    .line 326
    const/16 v0, 0x1f

    .line 327
    .line 328
    sget-object v1, Lcom/p1/mobile/putong/data/FemaleVip;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 329
    .line 330
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 331
    .line 332
    .line 333
    :cond_1e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->svipSearch:Lcom/p1/mobile/putong/data/SvipSearch;

    .line 334
    .line 335
    if-eqz p0, :cond_1f

    .line 336
    .line 337
    const/16 v0, 0x20

    .line 338
    .line 339
    sget-object v1, Lcom/p1/mobile/putong/data/SvipSearch;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 340
    .line 341
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 342
    .line 343
    .line 344
    :cond_1f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->noPush:Lcom/p1/mobile/putong/data/NotificationSetting;

    .line 345
    .line 346
    if-eqz p0, :cond_20

    .line 347
    .line 348
    const/16 v0, 0x21

    .line 349
    .line 350
    sget-object v1, Lcom/p1/mobile/putong/data/NotificationSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 351
    .line 352
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 353
    .line 354
    .line 355
    :cond_20
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->upvip:Lcom/p1/mobile/putong/data/UserUpVipSettings;

    .line 356
    .line 357
    if-eqz p0, :cond_21

    .line 358
    .line 359
    const/16 v0, 0x22

    .line 360
    .line 361
    sget-object v1, Lcom/p1/mobile/putong/data/UserUpVipSettings;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 362
    .line 363
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 364
    .line 365
    .line 366
    :cond_21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->adsMaterialRouter:Lcom/p1/mobile/putong/data/AdsMaterialRouter;

    .line 367
    .line 368
    if-eqz p0, :cond_22

    .line 369
    .line 370
    const/16 v0, 0x23

    .line 371
    .line 372
    sget-object v1, Lcom/p1/mobile/putong/data/AdsMaterialRouter;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 373
    .line 374
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 375
    .line 376
    .line 377
    :cond_22
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->gender:Lcom/p1/mobile/putong/data/IntlMoreGender;

    .line 378
    .line 379
    if-eqz p0, :cond_23

    .line 380
    .line 381
    const/16 v0, 0x24

    .line 382
    .line 383
    sget-object v1, Lcom/p1/mobile/putong/data/IntlMoreGender;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 384
    .line 385
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 386
    .line 387
    .line 388
    :cond_23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SettingGroups;->tttribe:Lcom/p1/mobile/putong/data/TribeSetting;

    .line 389
    .line 390
    if-eqz p0, :cond_24

    .line 391
    .line 392
    const/16 p1, 0x25

    .line 393
    .line 394
    sget-object v0, Lcom/p1/mobile/putong/data/TribeSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 395
    .line 396
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 397
    .line 398
    .line 399
    :cond_24
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 400
    check-cast p1, Lcom/p1/mobile/putong/data/SettingGroups;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/SettingGroups$1;->serialize(Lcom/p1/mobile/putong/data/SettingGroups;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
