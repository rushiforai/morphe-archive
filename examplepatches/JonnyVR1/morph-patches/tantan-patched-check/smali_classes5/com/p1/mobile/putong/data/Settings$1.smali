.class Lcom/p1/mobile/putong/data/Settings$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Settings;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Settings;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Settings;)I
    .locals 4

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-static {v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 9
    .line 10
    .line 11
    move-result p0

    .line 12
    goto :goto_0

    .line 13
    :cond_0
    const/4 p0, 0x0

    .line 14
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 15
    .line 16
    if-eqz v0, :cond_1

    .line 17
    .line 18
    const/4 v1, 0x2

    .line 19
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 24
    .line 25
    .line 26
    move-result v0

    .line 27
    add-int/2addr p0, v0

    .line 28
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 29
    .line 30
    if-eqz v0, :cond_2

    .line 31
    .line 32
    const/4 v1, 0x3

    .line 33
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 43
    .line 44
    if-eqz v0, :cond_3

    .line 45
    .line 46
    const/4 v1, 0x4

    .line 47
    invoke-virtual {v0}, Ljava/lang/Double;->doubleValue()D

    .line 48
    .line 49
    .line 50
    move-result-wide v2

    .line 51
    invoke-static {v1, v2, v3}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x5

    .line 61
    sget-object v2, Lcom/p1/mobile/putong/data/SearchRadius;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 64
    .line 65
    .line 66
    move-result v0

    .line 67
    add-int/2addr p0, v0

    .line 68
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 69
    .line 70
    if-eqz v0, :cond_5

    .line 71
    .line 72
    const/4 v1, 0x6

    .line 73
    sget-object v2, Lcom/p1/mobile/putong/data/SettingsNotifications;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 81
    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    const/4 v1, 0x7

    .line 85
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 95
    .line 96
    if-eqz v0, :cond_7

    .line 97
    .line 98
    const/16 v1, 0x8

    .line 99
    .line 100
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 110
    .line 111
    if-eqz v0, :cond_8

    .line 112
    .line 113
    const/16 v1, 0x9

    .line 114
    .line 115
    sget-object v2, Lcom/p1/mobile/putong/data/SearchAge;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 116
    .line 117
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 123
    .line 124
    if-eqz v0, :cond_9

    .line 125
    .line 126
    const/16 v1, 0xa

    .line 127
    .line 128
    sget-object v2, Lcom/p1/mobile/putong/data/SettingsConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 136
    .line 137
    if-eqz v0, :cond_a

    .line 138
    .line 139
    const/16 v1, 0xb

    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 149
    .line 150
    if-eqz v0, :cond_b

    .line 151
    .line 152
    const/16 v1, 0xc

    .line 153
    .line 154
    sget-object v2, Lcom/p1/mobile/putong/data/SettingsBoost;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 162
    .line 163
    if-eqz v0, :cond_c

    .line 164
    .line 165
    const/16 v1, 0xd

    .line 166
    .line 167
    sget-object v2, Lcom/p1/mobile/putong/data/Verification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 175
    .line 176
    if-eqz v0, :cond_d

    .line 177
    .line 178
    invoke-static {v0}, Lcom/p1/mobile/putong/data/SearchPriority;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 179
    .line 180
    .line 181
    move-result-object v0

    .line 182
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    .line 187
    move-result-object v1

    .line 188
    const/16 v2, 0xe

    .line 189
    .line 190
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    add-int/2addr p0, v0

    .line 195
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 196
    .line 197
    if-eqz v0, :cond_e

    .line 198
    .line 199
    const/16 v1, 0xf

    .line 200
    .line 201
    sget-object v2, Lcom/p1/mobile/putong/data/SettingsMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 202
    .line 203
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    add-int/2addr p0, v0

    .line 208
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 209
    .line 210
    if-eqz v0, :cond_f

    .line 211
    .line 212
    const/16 v1, 0x10

    .line 213
    .line 214
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 215
    .line 216
    .line 217
    move-result v0

    .line 218
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    add-int/2addr p0, v0

    .line 223
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->tbh:Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 224
    .line 225
    if-eqz v0, :cond_10

    .line 226
    .line 227
    const/16 v1, 0x11

    .line 228
    .line 229
    sget-object v2, Lcom/p1/mobile/putong/data/SettingsTbh;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 230
    .line 231
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 232
    .line 233
    .line 234
    move-result v0

    .line 235
    add-int/2addr p0, v0

    .line 236
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->greeting:Ljava/lang/String;

    .line 237
    .line 238
    if-eqz v0, :cond_11

    .line 239
    .line 240
    const/16 v1, 0x12

    .line 241
    .line 242
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 243
    .line 244
    .line 245
    move-result v0

    .line 246
    add-int/2addr p0, v0

    .line 247
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 248
    .line 249
    if-eqz v0, :cond_12

    .line 250
    .line 251
    const/16 v1, 0x13

    .line 252
    .line 253
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 254
    .line 255
    .line 256
    move-result v0

    .line 257
    add-int/2addr p0, v0

    .line 258
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 259
    .line 260
    if-eqz v0, :cond_13

    .line 261
    .line 262
    const/16 v1, 0x14

    .line 263
    .line 264
    sget-object v2, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 272
    .line 273
    if-eqz v0, :cond_14

    .line 274
    .line 275
    sget-object v1, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 276
    .line 277
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 278
    .line 279
    .line 280
    move-result-object v1

    .line 281
    const/16 v2, 0x15

    .line 282
    .line 283
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 284
    .line 285
    .line 286
    move-result v0

    .line 287
    add-int/2addr p0, v0

    .line 288
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 289
    .line 290
    if-eqz v0, :cond_15

    .line 291
    .line 292
    const/16 v1, 0x16

    .line 293
    .line 294
    sget-object v2, Lcom/p1/mobile/putong/data/LookingFor;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 295
    .line 296
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 297
    .line 298
    .line 299
    move-result v0

    .line 300
    add-int/2addr p0, v0

    .line 301
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 302
    .line 303
    if-eqz v0, :cond_16

    .line 304
    .line 305
    const/16 v1, 0x17

    .line 306
    .line 307
    sget-object v2, Lcom/p1/mobile/putong/data/SettingsIntent;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 308
    .line 309
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 310
    .line 311
    .line 312
    move-result v0

    .line 313
    add-int/2addr p0, v0

    .line 314
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 315
    .line 316
    if-eqz v0, :cond_17

    .line 317
    .line 318
    sget-object v1, Lcom/p1/mobile/putong/data/SearchPriority;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 319
    .line 320
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 321
    .line 322
    .line 323
    move-result-object v1

    .line 324
    const/16 v2, 0x18

    .line 325
    .line 326
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 327
    .line 328
    .line 329
    move-result v0

    .line 330
    add-int/2addr p0, v0

    .line 331
    :cond_17
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 332
    .line 333
    if-eqz v0, :cond_18

    .line 334
    .line 335
    const/16 v1, 0x19

    .line 336
    .line 337
    sget-object v2, Lcom/p1/mobile/putong/data/OmsSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_18
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 345
    .line 346
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 347
    check-cast p1, Lcom/p1/mobile/putong/data/Settings;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Settings$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Settings;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Settings;
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
    new-instance v0, Lcom/p1/mobile/putong/data/Settings;

    .line 8
    .line 9
    invoke-direct {v0}, Lcom/p1/mobile/putong/data/Settings;-><init>()V

    .line 10
    .line 11
    .line 12
    const/4 v1, 0x0

    .line 13
    move-object v2, v1

    .line 14
    move-object v3, v2

    .line 15
    move-object v4, v3

    .line 16
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 17
    .line 18
    .line 19
    move-result v5

    .line 20
    const-string v6, ""

    .line 21
    .line 22
    sparse-switch v5, :sswitch_data_0

    .line 23
    .line 24
    .line 25
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 26
    .line 27
    if-nez p1, :cond_0

    .line 28
    .line 29
    if-eqz v2, :cond_0

    .line 30
    .line 31
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 32
    .line 33
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 34
    .line 35
    .line 36
    move-result v2

    .line 37
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 38
    .line 39
    .line 40
    move-result-object p1

    .line 41
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 42
    .line 43
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 44
    .line 45
    :cond_0
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 46
    .line 47
    if-nez p1, :cond_1

    .line 48
    .line 49
    if-eqz v3, :cond_1

    .line 50
    .line 51
    sget-object p1, Lcom/p1/mobile/putong/data/SettingsIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 52
    .line 53
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 54
    .line 55
    .line 56
    move-result v2

    .line 57
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 58
    .line 59
    .line 60
    move-result-object p1

    .line 61
    check-cast p1, Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 62
    .line 63
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 64
    .line 65
    :cond_1
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 66
    .line 67
    if-nez p1, :cond_2

    .line 68
    .line 69
    if-eqz v4, :cond_2

    .line 70
    .line 71
    invoke-static {v4}, Lcom/p1/mobile/putong/data/SearchPriority;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 76
    .line 77
    :cond_2
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 78
    .line 79
    if-nez p1, :cond_3

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 86
    .line 87
    :cond_3
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 88
    .line 89
    if-nez p1, :cond_4

    .line 90
    .line 91
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 98
    .line 99
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 100
    .line 101
    :cond_4
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 102
    .line 103
    if-nez p1, :cond_5

    .line 104
    .line 105
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 106
    .line 107
    :cond_5
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 108
    .line 109
    if-nez p0, :cond_6

    .line 110
    .line 111
    invoke-static {}, Lcom/p1/mobile/putong/data/SearchRadius;->new_()Lcom/p1/mobile/putong/data/SearchRadius;

    .line 112
    .line 113
    .line 114
    move-result-object p0

    .line 115
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 116
    .line 117
    :cond_6
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 118
    .line 119
    if-nez p0, :cond_7

    .line 120
    .line 121
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsNotifications;->new_()Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 122
    .line 123
    .line 124
    move-result-object p0

    .line 125
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 126
    .line 127
    :cond_7
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 128
    .line 129
    if-nez p0, :cond_8

    .line 130
    .line 131
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 132
    .line 133
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 134
    .line 135
    :cond_8
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 136
    .line 137
    if-nez p0, :cond_9

    .line 138
    .line 139
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 140
    .line 141
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 142
    .line 143
    :cond_9
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 144
    .line 145
    if-nez p0, :cond_a

    .line 146
    .line 147
    invoke-static {}, Lcom/p1/mobile/putong/data/SearchAge;->new_()Lcom/p1/mobile/putong/data/SearchAge;

    .line 148
    .line 149
    .line 150
    move-result-object p0

    .line 151
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 152
    .line 153
    :cond_a
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 154
    .line 155
    if-nez p0, :cond_b

    .line 156
    .line 157
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsConversations;->new_()Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 158
    .line 159
    .line 160
    move-result-object p0

    .line 161
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 162
    .line 163
    :cond_b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 164
    .line 165
    if-nez p0, :cond_c

    .line 166
    .line 167
    invoke-static {}, Lcom/p1/mobile/putong/data/MessageLocation;->new_()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 168
    .line 169
    .line 170
    move-result-object p0

    .line 171
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 172
    .line 173
    :cond_c
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 174
    .line 175
    if-nez p0, :cond_d

    .line 176
    .line 177
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsBoost;->new_()Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 178
    .line 179
    .line 180
    move-result-object p0

    .line 181
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 182
    .line 183
    :cond_d
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 184
    .line 185
    if-nez p0, :cond_e

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/data/Verification;->new_()Lcom/p1/mobile/putong/data/Verification;

    .line 188
    .line 189
    .line 190
    move-result-object p0

    .line 191
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 192
    .line 193
    :cond_e
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 194
    .line 195
    if-nez p0, :cond_f

    .line 196
    .line 197
    new-instance p0, Ljava/util/ArrayList;

    .line 198
    .line 199
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 200
    .line 201
    .line 202
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 203
    .line 204
    :cond_f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 205
    .line 206
    if-nez p0, :cond_10

    .line 207
    .line 208
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsMoment;->new_()Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 209
    .line 210
    .line 211
    move-result-object p0

    .line 212
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 213
    .line 214
    :cond_10
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 215
    .line 216
    if-nez p0, :cond_11

    .line 217
    .line 218
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 219
    .line 220
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 221
    .line 222
    :cond_11
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 223
    .line 224
    if-nez p0, :cond_12

    .line 225
    .line 226
    iput-object v6, v0, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 227
    .line 228
    :cond_12
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 229
    .line 230
    if-nez p0, :cond_26

    .line 231
    .line 232
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 233
    .line 234
    .line 235
    move-result-object p0

    .line 236
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 237
    .line 238
    return-object v0

    .line 239
    :sswitch_0
    sget-object v5, Lcom/p1/mobile/putong/data/OmsSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 240
    .line 241
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 242
    .line 243
    .line 244
    move-result-object v5

    .line 245
    check-cast v5, Lcom/p1/mobile/putong/data/OmsSetting;

    .line 246
    .line 247
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_1
    sget-object v5, Lcom/p1/mobile/putong/data/SearchPriority;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 252
    .line 253
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 254
    .line 255
    .line 256
    move-result-object v5

    .line 257
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 258
    .line 259
    .line 260
    move-result-object v5

    .line 261
    check-cast v5, Ljava/util/List;

    .line 262
    .line 263
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_2
    sget-object v5, Lcom/p1/mobile/putong/data/SettingsIntent;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 268
    .line 269
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 270
    .line 271
    .line 272
    move-result-object v5

    .line 273
    check-cast v5, Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 274
    .line 275
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_3
    sget-object v5, Lcom/p1/mobile/putong/data/LookingFor;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 280
    .line 281
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 282
    .line 283
    .line 284
    move-result-object v5

    .line 285
    check-cast v5, Lcom/p1/mobile/putong/data/LookingFor;

    .line 286
    .line 287
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 288
    .line 289
    goto/16 :goto_0

    .line 290
    .line 291
    :sswitch_4
    sget-object v5, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 292
    .line 293
    invoke-virtual {v5}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 294
    .line 295
    .line 296
    move-result-object v5

    .line 297
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 298
    .line 299
    .line 300
    move-result-object v5

    .line 301
    check-cast v5, Ljava/util/List;

    .line 302
    .line 303
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 304
    .line 305
    goto/16 :goto_0

    .line 306
    .line 307
    :sswitch_5
    sget-object v5, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 308
    .line 309
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 310
    .line 311
    .line 312
    move-result-object v5

    .line 313
    check-cast v5, Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 314
    .line 315
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v5

    .line 323
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v5

    .line 331
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->greeting:Ljava/lang/String;

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :sswitch_8
    sget-object v5, Lcom/p1/mobile/putong/data/SettingsTbh;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 336
    .line 337
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 338
    .line 339
    .line 340
    move-result-object v5

    .line 341
    check-cast v5, Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 342
    .line 343
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->tbh:Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 344
    .line 345
    goto/16 :goto_0

    .line 346
    .line 347
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 348
    .line 349
    .line 350
    move-result v5

    .line 351
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 352
    .line 353
    .line 354
    move-result-object v5

    .line 355
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 356
    .line 357
    goto/16 :goto_0

    .line 358
    .line 359
    :sswitch_a
    sget-object v5, Lcom/p1/mobile/putong/data/SettingsMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 360
    .line 361
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 362
    .line 363
    .line 364
    move-result-object v5

    .line 365
    check-cast v5, Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 366
    .line 367
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 368
    .line 369
    goto/16 :goto_0

    .line 370
    .line 371
    :sswitch_b
    sget-object v4, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 372
    .line 373
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 374
    .line 375
    .line 376
    move-result-object v4

    .line 377
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 378
    .line 379
    .line 380
    move-result-object v4

    .line 381
    check-cast v4, Ljava/util/List;

    .line 382
    .line 383
    goto/16 :goto_0

    .line 384
    .line 385
    :sswitch_c
    sget-object v5, Lcom/p1/mobile/putong/data/Verification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 386
    .line 387
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 388
    .line 389
    .line 390
    move-result-object v5

    .line 391
    check-cast v5, Lcom/p1/mobile/putong/data/Verification;

    .line 392
    .line 393
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 394
    .line 395
    goto/16 :goto_0

    .line 396
    .line 397
    :sswitch_d
    sget-object v5, Lcom/p1/mobile/putong/data/SettingsBoost;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 398
    .line 399
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 400
    .line 401
    .line 402
    move-result-object v5

    .line 403
    check-cast v5, Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 404
    .line 405
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 406
    .line 407
    goto/16 :goto_0

    .line 408
    .line 409
    :sswitch_e
    sget-object v5, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 410
    .line 411
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 412
    .line 413
    .line 414
    move-result-object v5

    .line 415
    check-cast v5, Lcom/p1/mobile/putong/data/MessageLocation;

    .line 416
    .line 417
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 418
    .line 419
    goto/16 :goto_0

    .line 420
    .line 421
    :sswitch_f
    sget-object v5, Lcom/p1/mobile/putong/data/SettingsConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 422
    .line 423
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 424
    .line 425
    .line 426
    move-result-object v5

    .line 427
    check-cast v5, Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 428
    .line 429
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 430
    .line 431
    goto/16 :goto_0

    .line 432
    .line 433
    :sswitch_10
    sget-object v5, Lcom/p1/mobile/putong/data/SearchAge;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 434
    .line 435
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 436
    .line 437
    .line 438
    move-result-object v5

    .line 439
    check-cast v5, Lcom/p1/mobile/putong/data/SearchAge;

    .line 440
    .line 441
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 442
    .line 443
    goto/16 :goto_0

    .line 444
    .line 445
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 446
    .line 447
    .line 448
    move-result v5

    .line 449
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 450
    .line 451
    .line 452
    move-result-object v5

    .line 453
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 454
    .line 455
    goto/16 :goto_0

    .line 456
    .line 457
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 458
    .line 459
    .line 460
    move-result v5

    .line 461
    invoke-static {v5}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 462
    .line 463
    .line 464
    move-result-object v5

    .line 465
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 466
    .line 467
    goto/16 :goto_0

    .line 468
    .line 469
    :sswitch_13
    sget-object v5, Lcom/p1/mobile/putong/data/SettingsNotifications;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 470
    .line 471
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 472
    .line 473
    .line 474
    move-result-object v5

    .line 475
    check-cast v5, Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 476
    .line 477
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 478
    .line 479
    goto/16 :goto_0

    .line 480
    .line 481
    :sswitch_14
    sget-object v5, Lcom/p1/mobile/putong/data/SearchRadius;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 482
    .line 483
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 484
    .line 485
    .line 486
    move-result-object v5

    .line 487
    check-cast v5, Lcom/p1/mobile/putong/data/SearchRadius;

    .line 488
    .line 489
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 490
    .line 491
    goto/16 :goto_0

    .line 492
    .line 493
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 494
    .line 495
    .line 496
    move-result-wide v5

    .line 497
    invoke-static {v5, v6}, Ljava/lang/Double;->valueOf(D)Ljava/lang/Double;

    .line 498
    .line 499
    .line 500
    move-result-object v5

    .line 501
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 502
    .line 503
    goto/16 :goto_0

    .line 504
    .line 505
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 506
    .line 507
    .line 508
    move-result v3

    .line 509
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 510
    .line 511
    .line 512
    move-result-object v3

    .line 513
    goto/16 :goto_0

    .line 514
    .line 515
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 516
    .line 517
    .line 518
    move-result v2

    .line 519
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 520
    .line 521
    .line 522
    move-result-object v2

    .line 523
    goto/16 :goto_0

    .line 524
    .line 525
    :sswitch_18
    sget-object v5, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 526
    .line 527
    invoke-virtual {p1, v5}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 528
    .line 529
    .line 530
    move-result-object v5

    .line 531
    check-cast v5, Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 532
    .line 533
    iput-object v5, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 534
    .line 535
    goto/16 :goto_0

    .line 536
    .line 537
    :sswitch_19
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 538
    .line 539
    if-nez p1, :cond_13

    .line 540
    .line 541
    if-eqz v2, :cond_13

    .line 542
    .line 543
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 544
    .line 545
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 546
    .line 547
    .line 548
    move-result v2

    .line 549
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 550
    .line 551
    .line 552
    move-result-object p1

    .line 553
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 554
    .line 555
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 556
    .line 557
    :cond_13
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 558
    .line 559
    if-nez p1, :cond_14

    .line 560
    .line 561
    if-eqz v3, :cond_14

    .line 562
    .line 563
    sget-object p1, Lcom/p1/mobile/putong/data/SettingsIntent;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 564
    .line 565
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 566
    .line 567
    .line 568
    move-result v2

    .line 569
    invoke-virtual {p1, v1, v2}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 570
    .line 571
    .line 572
    move-result-object p1

    .line 573
    check-cast p1, Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 574
    .line 575
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 576
    .line 577
    :cond_14
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 578
    .line 579
    if-nez p1, :cond_15

    .line 580
    .line 581
    if-eqz v4, :cond_15

    .line 582
    .line 583
    invoke-static {v4}, Lcom/p1/mobile/putong/data/SearchPriority;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 584
    .line 585
    .line 586
    move-result-object p1

    .line 587
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 588
    .line 589
    :cond_15
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 590
    .line 591
    if-nez p1, :cond_16

    .line 592
    .line 593
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 594
    .line 595
    .line 596
    move-result-object p1

    .line 597
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 598
    .line 599
    :cond_16
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 600
    .line 601
    if-nez p1, :cond_17

    .line 602
    .line 603
    sget-object p1, Lcom/p1/mobile/putong/data/LookingFor;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 604
    .line 605
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 606
    .line 607
    .line 608
    move-result-object p1

    .line 609
    check-cast p1, Lcom/p1/mobile/putong/data/LookingFor;

    .line 610
    .line 611
    iput-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 612
    .line 613
    :cond_17
    iget-object p1, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 614
    .line 615
    if-nez p1, :cond_18

    .line 616
    .line 617
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 618
    .line 619
    :cond_18
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 620
    .line 621
    if-nez p0, :cond_19

    .line 622
    .line 623
    invoke-static {}, Lcom/p1/mobile/putong/data/SearchRadius;->new_()Lcom/p1/mobile/putong/data/SearchRadius;

    .line 624
    .line 625
    .line 626
    move-result-object p0

    .line 627
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 628
    .line 629
    :cond_19
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 630
    .line 631
    if-nez p0, :cond_1a

    .line 632
    .line 633
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsNotifications;->new_()Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 634
    .line 635
    .line 636
    move-result-object p0

    .line 637
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 638
    .line 639
    :cond_1a
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 640
    .line 641
    if-nez p0, :cond_1b

    .line 642
    .line 643
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 644
    .line 645
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 646
    .line 647
    :cond_1b
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 648
    .line 649
    if-nez p0, :cond_1c

    .line 650
    .line 651
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 652
    .line 653
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 654
    .line 655
    :cond_1c
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 656
    .line 657
    if-nez p0, :cond_1d

    .line 658
    .line 659
    invoke-static {}, Lcom/p1/mobile/putong/data/SearchAge;->new_()Lcom/p1/mobile/putong/data/SearchAge;

    .line 660
    .line 661
    .line 662
    move-result-object p0

    .line 663
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 664
    .line 665
    :cond_1d
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 666
    .line 667
    if-nez p0, :cond_1e

    .line 668
    .line 669
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsConversations;->new_()Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 670
    .line 671
    .line 672
    move-result-object p0

    .line 673
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 674
    .line 675
    :cond_1e
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 676
    .line 677
    if-nez p0, :cond_1f

    .line 678
    .line 679
    invoke-static {}, Lcom/p1/mobile/putong/data/MessageLocation;->new_()Lcom/p1/mobile/putong/data/MessageLocation;

    .line 680
    .line 681
    .line 682
    move-result-object p0

    .line 683
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 684
    .line 685
    :cond_1f
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 686
    .line 687
    if-nez p0, :cond_20

    .line 688
    .line 689
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsBoost;->new_()Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 690
    .line 691
    .line 692
    move-result-object p0

    .line 693
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 694
    .line 695
    :cond_20
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 696
    .line 697
    if-nez p0, :cond_21

    .line 698
    .line 699
    invoke-static {}, Lcom/p1/mobile/putong/data/Verification;->new_()Lcom/p1/mobile/putong/data/Verification;

    .line 700
    .line 701
    .line 702
    move-result-object p0

    .line 703
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 704
    .line 705
    :cond_21
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 706
    .line 707
    if-nez p0, :cond_22

    .line 708
    .line 709
    new-instance p0, Ljava/util/ArrayList;

    .line 710
    .line 711
    invoke-direct {p0}, Ljava/util/ArrayList;-><init>()V

    .line 712
    .line 713
    .line 714
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 715
    .line 716
    :cond_22
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 717
    .line 718
    if-nez p0, :cond_23

    .line 719
    .line 720
    invoke-static {}, Lcom/p1/mobile/putong/data/SettingsMoment;->new_()Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 721
    .line 722
    .line 723
    move-result-object p0

    .line 724
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 725
    .line 726
    :cond_23
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 727
    .line 728
    if-nez p0, :cond_24

    .line 729
    .line 730
    sget-object p0, Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;

    .line 731
    .line 732
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 733
    .line 734
    :cond_24
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 735
    .line 736
    if-nez p0, :cond_25

    .line 737
    .line 738
    iput-object v6, v0, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 739
    .line 740
    :cond_25
    iget-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 741
    .line 742
    if-nez p0, :cond_26

    .line 743
    .line 744
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 745
    .line 746
    .line 747
    move-result-object p0

    .line 748
    iput-object p0, v0, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 749
    .line 750
    :cond_26
    return-object v0

    .line 751
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_19
        0xa -> :sswitch_18
        0x10 -> :sswitch_17
        0x18 -> :sswitch_16
        0x21 -> :sswitch_15
        0x2a -> :sswitch_14
        0x32 -> :sswitch_13
        0x38 -> :sswitch_12
        0x40 -> :sswitch_11
        0x4a -> :sswitch_10
        0x52 -> :sswitch_f
        0x5a -> :sswitch_e
        0x62 -> :sswitch_d
        0x6a -> :sswitch_c
        0x72 -> :sswitch_b
        0x7a -> :sswitch_a
        0x80 -> :sswitch_9
        0x8a -> :sswitch_8
        0x92 -> :sswitch_7
        0x9a -> :sswitch_6
        0xa2 -> :sswitch_5
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

    .line 751
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Settings$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Settings;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Settings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->phoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    sget-object v1, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 7
    .line 8
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 9
    .line 10
    .line 11
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 12
    .line 13
    if-eqz p0, :cond_1

    .line 14
    .line 15
    const/4 v0, 0x2

    .line 16
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 17
    .line 18
    .line 19
    move-result p0

    .line 20
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x3

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->birthdate:Ljava/lang/Double;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    const/4 v0, 0x4

    .line 40
    invoke-virtual {p0}, Ljava/lang/Double;->doubleValue()D

    .line 41
    .line 42
    .line 43
    move-result-wide v1

    .line 44
    invoke-virtual {p2, v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 45
    .line 46
    .line 47
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchRadius:Lcom/p1/mobile/putong/data/SearchRadius;

    .line 48
    .line 49
    if-eqz p0, :cond_4

    .line 50
    .line 51
    const/4 v0, 0x5

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/data/SearchRadius;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->notifications:Lcom/p1/mobile/putong/data/SettingsNotifications;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/4 v0, 0x6

    .line 62
    sget-object v1, Lcom/p1/mobile/putong/data/SettingsNotifications;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->hideContacts:Ljava/lang/Boolean;

    .line 68
    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    const/4 v0, 0x7

    .line 72
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 73
    .line 74
    .line 75
    move-result p0

    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 77
    .line 78
    .line 79
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->hideMutualContacts:Ljava/lang/Boolean;

    .line 80
    .line 81
    if-eqz p0, :cond_7

    .line 82
    .line 83
    const/16 v0, 0x8

    .line 84
    .line 85
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 86
    .line 87
    .line 88
    move-result p0

    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 90
    .line 91
    .line 92
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchAge:Lcom/p1/mobile/putong/data/SearchAge;

    .line 93
    .line 94
    if-eqz p0, :cond_8

    .line 95
    .line 96
    const/16 v0, 0x9

    .line 97
    .line 98
    sget-object v1, Lcom/p1/mobile/putong/data/SearchAge;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 101
    .line 102
    .line 103
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->conversations:Lcom/p1/mobile/putong/data/SettingsConversations;

    .line 104
    .line 105
    if-eqz p0, :cond_9

    .line 106
    .line 107
    const/16 v0, 0xa

    .line 108
    .line 109
    sget-object v1, Lcom/p1/mobile/putong/data/SettingsConversations;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 112
    .line 113
    .line 114
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchLocation:Lcom/p1/mobile/putong/data/MessageLocation;

    .line 115
    .line 116
    if-eqz p0, :cond_a

    .line 117
    .line 118
    const/16 v0, 0xb

    .line 119
    .line 120
    sget-object v1, Lcom/p1/mobile/putong/data/MessageLocation;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 123
    .line 124
    .line 125
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->boost:Lcom/p1/mobile/putong/data/SettingsBoost;

    .line 126
    .line 127
    if-eqz p0, :cond_b

    .line 128
    .line 129
    const/16 v0, 0xc

    .line 130
    .line 131
    sget-object v1, Lcom/p1/mobile/putong/data/SettingsBoost;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 134
    .line 135
    .line 136
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->verification:Lcom/p1/mobile/putong/data/Verification;

    .line 137
    .line 138
    if-eqz p0, :cond_c

    .line 139
    .line 140
    const/16 v0, 0xd

    .line 141
    .line 142
    sget-object v1, Lcom/p1/mobile/putong/data/Verification;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 145
    .line 146
    .line 147
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 148
    .line 149
    if-eqz p0, :cond_d

    .line 150
    .line 151
    invoke-static {p0}, Lcom/p1/mobile/putong/data/SearchPriority;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 152
    .line 153
    .line 154
    move-result-object p0

    .line 155
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    const/16 v1, 0xe

    .line 162
    .line 163
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 164
    .line 165
    .line 166
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->moment:Lcom/p1/mobile/putong/data/SettingsMoment;

    .line 167
    .line 168
    if-eqz p0, :cond_e

    .line 169
    .line 170
    const/16 v0, 0xf

    .line 171
    .line 172
    sget-object v1, Lcom/p1/mobile/putong/data/SettingsMoment;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 173
    .line 174
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 175
    .line 176
    .line 177
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->autoAdjustSuggestRadius:Ljava/lang/Boolean;

    .line 178
    .line 179
    if-eqz p0, :cond_f

    .line 180
    .line 181
    const/16 v0, 0x10

    .line 182
    .line 183
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 184
    .line 185
    .line 186
    move-result p0

    .line 187
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 188
    .line 189
    .line 190
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->tbh:Lcom/p1/mobile/putong/data/SettingsTbh;

    .line 191
    .line 192
    if-eqz p0, :cond_10

    .line 193
    .line 194
    const/16 v0, 0x11

    .line 195
    .line 196
    sget-object v1, Lcom/p1/mobile/putong/data/SettingsTbh;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 199
    .line 200
    .line 201
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->greeting:Ljava/lang/String;

    .line 202
    .line 203
    if-eqz p0, :cond_11

    .line 204
    .line 205
    const/16 v0, 0x12

    .line 206
    .line 207
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 208
    .line 209
    .line 210
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->email:Ljava/lang/String;

    .line 211
    .line 212
    if-eqz p0, :cond_12

    .line 213
    .line 214
    const/16 v0, 0x13

    .line 215
    .line 216
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 217
    .line 218
    .line 219
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->linkedPhoneNumber:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 220
    .line 221
    if-eqz p0, :cond_13

    .line 222
    .line 223
    const/16 v0, 0x14

    .line 224
    .line 225
    sget-object v1, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 226
    .line 227
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 228
    .line 229
    .line 230
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->settingGroups:Ljava/util/List;

    .line 231
    .line 232
    if-eqz p0, :cond_14

    .line 233
    .line 234
    sget-object v0, Lcom/p1/mobile/putong/data/SettingGroups;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 235
    .line 236
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    .line 238
    .line 239
    move-result-object v0

    .line 240
    const/16 v1, 0x15

    .line 241
    .line 242
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 243
    .line 244
    .line 245
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->lookingFor:Lcom/p1/mobile/putong/data/LookingFor;

    .line 246
    .line 247
    if-eqz p0, :cond_15

    .line 248
    .line 249
    const/16 v0, 0x16

    .line 250
    .line 251
    sget-object v1, Lcom/p1/mobile/putong/data/LookingFor;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 252
    .line 253
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 254
    .line 255
    .line 256
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->intent:Lcom/p1/mobile/putong/data/SettingsIntent;

    .line 257
    .line 258
    if-eqz p0, :cond_16

    .line 259
    .line 260
    const/16 v0, 0x17

    .line 261
    .line 262
    sget-object v1, Lcom/p1/mobile/putong/data/SettingsIntent;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 263
    .line 264
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 265
    .line 266
    .line 267
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->searchPriorities:Ljava/util/List;

    .line 268
    .line 269
    if-eqz p0, :cond_17

    .line 270
    .line 271
    sget-object v0, Lcom/p1/mobile/putong/data/SearchPriority;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 272
    .line 273
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 274
    .line 275
    .line 276
    move-result-object v0

    .line 277
    const/16 v1, 0x18

    .line 278
    .line 279
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 280
    .line 281
    .line 282
    :cond_17
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Settings;->omsSetting:Lcom/p1/mobile/putong/data/OmsSetting;

    .line 283
    .line 284
    if-eqz p0, :cond_18

    .line 285
    .line 286
    const/16 p1, 0x19

    .line 287
    .line 288
    sget-object v0, Lcom/p1/mobile/putong/data/OmsSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 289
    .line 290
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 291
    .line 292
    .line 293
    :cond_18
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 294
    check-cast p1, Lcom/p1/mobile/putong/data/Settings;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Settings$1;->serialize(Lcom/p1/mobile/putong/data/Settings;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
