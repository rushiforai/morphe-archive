.class Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    add-int/2addr p0, v0

    .line 80
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 81
    .line 82
    if-eqz v0, :cond_7

    .line 83
    .line 84
    const/16 v1, 0x8

    .line 85
    .line 86
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz v0, :cond_8

    .line 94
    .line 95
    const/16 v1, 0x9

    .line 96
    .line 97
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_9

    .line 105
    .line 106
    const/16 v1, 0xa

    .line 107
    .line 108
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz v0, :cond_a

    .line 116
    .line 117
    const/16 v1, 0xb

    .line 118
    .line 119
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/2addr p0, v0

    .line 124
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v0, :cond_b

    .line 127
    .line 128
    const/16 v1, 0xc

    .line 129
    .line 130
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-int/2addr p0, v0

    .line 135
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 136
    .line 137
    if-eqz v0, :cond_c

    .line 138
    .line 139
    const/16 v1, 0xd

    .line 140
    .line 141
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz v0, :cond_d

    .line 149
    .line 150
    const/16 v1, 0xe

    .line 151
    .line 152
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    add-int/2addr p0, v0

    .line 157
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 158
    .line 159
    if-eqz v0, :cond_e

    .line 160
    .line 161
    const/16 v1, 0xf

    .line 162
    .line 163
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 164
    .line 165
    .line 166
    move-result v0

    .line 167
    add-int/2addr p0, v0

    .line 168
    :cond_e
    const/16 v0, 0x10

    .line 169
    .line 170
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 171
    .line 172
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 173
    .line 174
    .line 175
    move-result v0

    .line 176
    add-int/2addr p0, v0

    .line 177
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 178
    .line 179
    if-eqz v0, :cond_f

    .line 180
    .line 181
    const/16 v1, 0x11

    .line 182
    .line 183
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 184
    .line 185
    .line 186
    move-result v0

    .line 187
    add-int/2addr p0, v0

    .line 188
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 189
    .line 190
    if-eqz v0, :cond_10

    .line 191
    .line 192
    const/16 v1, 0x12

    .line 193
    .line 194
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 195
    .line 196
    .line 197
    move-result v0

    .line 198
    add-int/2addr p0, v0

    .line 199
    :cond_10
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 200
    .line 201
    if-eqz v0, :cond_11

    .line 202
    .line 203
    const/16 v1, 0x13

    .line 204
    .line 205
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 206
    .line 207
    .line 208
    move-result v0

    .line 209
    add-int/2addr p0, v0

    .line 210
    :cond_11
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 211
    .line 212
    if-eqz v0, :cond_12

    .line 213
    .line 214
    const/16 v1, 0x14

    .line 215
    .line 216
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    add-int/2addr p0, v0

    .line 221
    :cond_12
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 222
    .line 223
    if-eqz v0, :cond_13

    .line 224
    .line 225
    const/16 v1, 0x15

    .line 226
    .line 227
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 228
    .line 229
    .line 230
    move-result v0

    .line 231
    add-int/2addr p0, v0

    .line 232
    :cond_13
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 233
    .line 234
    if-eqz v0, :cond_14

    .line 235
    .line 236
    const/16 v1, 0x16

    .line 237
    .line 238
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 239
    .line 240
    .line 241
    move-result v0

    .line 242
    add-int/2addr p0, v0

    .line 243
    :cond_14
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 244
    .line 245
    if-eqz v0, :cond_15

    .line 246
    .line 247
    const/16 v1, 0x17

    .line 248
    .line 249
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 250
    .line 251
    .line 252
    move-result v0

    .line 253
    add-int/2addr p0, v0

    .line 254
    :cond_15
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 255
    .line 256
    if-eqz v0, :cond_16

    .line 257
    .line 258
    const/16 v1, 0x18

    .line 259
    .line 260
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_16
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 268
    .line 269
    if-eqz v0, :cond_17

    .line 270
    .line 271
    const/16 v1, 0x19

    .line 272
    .line 273
    sget-object v2, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_17
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 281
    .line 282
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 283
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 69
    .line 70
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 71
    .line 72
    .line 73
    move-result-object p1

    .line 74
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 75
    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 83
    .line 84
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 85
    .line 86
    .line 87
    move-result-object p1

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 89
    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 97
    .line 98
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 99
    .line 100
    if-nez p1, :cond_6

    .line 101
    .line 102
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 103
    .line 104
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 105
    .line 106
    if-nez p1, :cond_7

    .line 107
    .line 108
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 109
    .line 110
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 111
    .line 112
    if-nez p1, :cond_8

    .line 113
    .line 114
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 115
    .line 116
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 117
    .line 118
    if-nez p1, :cond_9

    .line 119
    .line 120
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 121
    .line 122
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 123
    .line 124
    if-nez p1, :cond_a

    .line 125
    .line 126
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 127
    .line 128
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 129
    .line 130
    if-nez p1, :cond_b

    .line 131
    .line 132
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 133
    .line 134
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 135
    .line 136
    if-nez p1, :cond_c

    .line 137
    .line 138
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 139
    .line 140
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 141
    .line 142
    if-nez p1, :cond_d

    .line 143
    .line 144
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 145
    .line 146
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 147
    .line 148
    if-nez p1, :cond_e

    .line 149
    .line 150
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 151
    .line 152
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 153
    .line 154
    if-nez p1, :cond_f

    .line 155
    .line 156
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 157
    .line 158
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 159
    .line 160
    if-nez p1, :cond_10

    .line 161
    .line 162
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 163
    .line 164
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_11

    .line 167
    .line 168
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 169
    .line 170
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_12

    .line 173
    .line 174
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 175
    .line 176
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_13

    .line 179
    .line 180
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 181
    .line 182
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 183
    .line 184
    if-nez p1, :cond_14

    .line 185
    .line 186
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 187
    .line 188
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 189
    .line 190
    if-nez p1, :cond_15

    .line 191
    .line 192
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 193
    .line 194
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 195
    .line 196
    if-nez p1, :cond_16

    .line 197
    .line 198
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 199
    .line 200
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 201
    .line 202
    if-nez p1, :cond_2e

    .line 203
    .line 204
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 205
    .line 206
    return-object p0

    .line 207
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 208
    .line 209
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 210
    .line 211
    .line 212
    move-result-object v3

    .line 213
    check-cast v3, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 214
    .line 215
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 220
    .line 221
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 222
    .line 223
    .line 224
    move-result-object v3

    .line 225
    check-cast v3, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 226
    .line 227
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 228
    .line 229
    goto/16 :goto_0

    .line 230
    .line 231
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 232
    .line 233
    .line 234
    move-result-object v3

    .line 235
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 236
    .line 237
    goto/16 :goto_0

    .line 238
    .line 239
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 240
    .line 241
    .line 242
    move-result-object v3

    .line 243
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v3

    .line 251
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v3

    .line 259
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 264
    .line 265
    .line 266
    move-result-object v3

    .line 267
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 272
    .line 273
    .line 274
    move-result-object v3

    .line 275
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 280
    .line 281
    .line 282
    move-result-object v3

    .line 283
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 284
    .line 285
    goto/16 :goto_0

    .line 286
    .line 287
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 288
    .line 289
    .line 290
    move-result v3

    .line 291
    iput-boolean v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 296
    .line 297
    .line 298
    move-result-object v3

    .line 299
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v3

    .line 307
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 308
    .line 309
    goto/16 :goto_0

    .line 310
    .line 311
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 312
    .line 313
    .line 314
    move-result-object v3

    .line 315
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 320
    .line 321
    .line 322
    move-result-object v3

    .line 323
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 324
    .line 325
    goto/16 :goto_0

    .line 326
    .line 327
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 328
    .line 329
    .line 330
    move-result-object v3

    .line 331
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 332
    .line 333
    goto/16 :goto_0

    .line 334
    .line 335
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 336
    .line 337
    .line 338
    move-result-object v3

    .line 339
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 340
    .line 341
    goto/16 :goto_0

    .line 342
    .line 343
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 344
    .line 345
    .line 346
    move-result-object v3

    .line 347
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 348
    .line 349
    goto/16 :goto_0

    .line 350
    .line 351
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 352
    .line 353
    .line 354
    move-result-object v3

    .line 355
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 356
    .line 357
    goto/16 :goto_0

    .line 358
    .line 359
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 360
    .line 361
    .line 362
    move-result-object v3

    .line 363
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 364
    .line 365
    goto/16 :goto_0

    .line 366
    .line 367
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 368
    .line 369
    .line 370
    move-result-object v3

    .line 371
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 372
    .line 373
    goto/16 :goto_0

    .line 374
    .line 375
    :sswitch_14
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 376
    .line 377
    .line 378
    move-result-object v3

    .line 379
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 380
    .line 381
    goto/16 :goto_0

    .line 382
    .line 383
    :sswitch_15
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 384
    .line 385
    .line 386
    move-result-object v3

    .line 387
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 388
    .line 389
    goto/16 :goto_0

    .line 390
    .line 391
    :sswitch_16
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 392
    .line 393
    .line 394
    move-result v2

    .line 395
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 396
    .line 397
    .line 398
    move-result-object v2

    .line 399
    goto/16 :goto_0

    .line 400
    .line 401
    :sswitch_17
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 402
    .line 403
    .line 404
    move-result v1

    .line 405
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 406
    .line 407
    .line 408
    move-result-object v1

    .line 409
    goto/16 :goto_0

    .line 410
    .line 411
    :sswitch_18
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 412
    .line 413
    .line 414
    move-result-object v3

    .line 415
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 416
    .line 417
    goto/16 :goto_0

    .line 418
    .line 419
    :sswitch_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 420
    .line 421
    if-nez p1, :cond_17

    .line 422
    .line 423
    if-eqz v1, :cond_17

    .line 424
    .line 425
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 426
    .line 427
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 428
    .line 429
    .line 430
    move-result v1

    .line 431
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 432
    .line 433
    .line 434
    move-result-object p1

    .line 435
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 436
    .line 437
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 438
    .line 439
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 440
    .line 441
    if-nez p1, :cond_18

    .line 442
    .line 443
    if-eqz v2, :cond_18

    .line 444
    .line 445
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 446
    .line 447
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 448
    .line 449
    .line 450
    move-result v1

    .line 451
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 452
    .line 453
    .line 454
    move-result-object p1

    .line 455
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 456
    .line 457
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 458
    .line 459
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 460
    .line 461
    if-nez p1, :cond_19

    .line 462
    .line 463
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

    .line 464
    .line 465
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 466
    .line 467
    if-nez p1, :cond_1a

    .line 468
    .line 469
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 470
    .line 471
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 472
    .line 473
    .line 474
    move-result-object p1

    .line 475
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 476
    .line 477
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 478
    .line 479
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 480
    .line 481
    if-nez p1, :cond_1b

    .line 482
    .line 483
    sget-object p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 484
    .line 485
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 486
    .line 487
    .line 488
    move-result-object p1

    .line 489
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 490
    .line 491
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 492
    .line 493
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 494
    .line 495
    if-nez p1, :cond_1c

    .line 496
    .line 497
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 498
    .line 499
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 500
    .line 501
    if-nez p1, :cond_1d

    .line 502
    .line 503
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 504
    .line 505
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 506
    .line 507
    if-nez p1, :cond_1e

    .line 508
    .line 509
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 510
    .line 511
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 512
    .line 513
    if-nez p1, :cond_1f

    .line 514
    .line 515
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 516
    .line 517
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 518
    .line 519
    if-nez p1, :cond_20

    .line 520
    .line 521
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 522
    .line 523
    :cond_20
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 524
    .line 525
    if-nez p1, :cond_21

    .line 526
    .line 527
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 528
    .line 529
    :cond_21
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 530
    .line 531
    if-nez p1, :cond_22

    .line 532
    .line 533
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 534
    .line 535
    :cond_22
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 536
    .line 537
    if-nez p1, :cond_23

    .line 538
    .line 539
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 540
    .line 541
    :cond_23
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 542
    .line 543
    if-nez p1, :cond_24

    .line 544
    .line 545
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 546
    .line 547
    :cond_24
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 548
    .line 549
    if-nez p1, :cond_25

    .line 550
    .line 551
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 552
    .line 553
    :cond_25
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 554
    .line 555
    if-nez p1, :cond_26

    .line 556
    .line 557
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 558
    .line 559
    :cond_26
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 560
    .line 561
    if-nez p1, :cond_27

    .line 562
    .line 563
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 564
    .line 565
    :cond_27
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 566
    .line 567
    if-nez p1, :cond_28

    .line 568
    .line 569
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 570
    .line 571
    :cond_28
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 572
    .line 573
    if-nez p1, :cond_29

    .line 574
    .line 575
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 576
    .line 577
    :cond_29
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 578
    .line 579
    if-nez p1, :cond_2a

    .line 580
    .line 581
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 582
    .line 583
    :cond_2a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 584
    .line 585
    if-nez p1, :cond_2b

    .line 586
    .line 587
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 588
    .line 589
    :cond_2b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 590
    .line 591
    if-nez p1, :cond_2c

    .line 592
    .line 593
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 594
    .line 595
    :cond_2c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 596
    .line 597
    if-nez p1, :cond_2d

    .line 598
    .line 599
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 600
    .line 601
    :cond_2d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 602
    .line 603
    if-nez p1, :cond_2e

    .line 604
    .line 605
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 606
    .line 607
    :cond_2e
    return-object p0

    .line 608
    nop

    .line 609
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_19
        0xa -> :sswitch_18
        0x10 -> :sswitch_17
        0x18 -> :sswitch_16
        0x22 -> :sswitch_15
        0x2a -> :sswitch_14
        0x32 -> :sswitch_13
        0x3a -> :sswitch_12
        0x42 -> :sswitch_11
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

    .line 609
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->background:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->icon:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buttonTextColor:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->title:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->subTitle:Ljava/lang/String;

    .line 66
    .line 67
    if-eqz p0, :cond_7

    .line 68
    .line 69
    const/16 v0, 0x8

    .line 70
    .line 71
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 72
    .line 73
    .line 74
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleMale:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz p0, :cond_8

    .line 77
    .line 78
    const/16 v0, 0x9

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyTitleFemale:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_9

    .line 86
    .line 87
    const/16 v0, 0xa

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleMale:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p0, :cond_a

    .line 95
    .line 96
    const/16 v0, 0xb

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buySubTitleFemale:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz p0, :cond_b

    .line 104
    .line 105
    const/16 v0, 0xc

    .line 106
    .line 107
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextMale:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz p0, :cond_c

    .line 113
    .line 114
    const/16 v0, 0xd

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyButtonTextFemale:Ljava/lang/String;

    .line 120
    .line 121
    if-eqz p0, :cond_d

    .line 122
    .line 123
    const/16 v0, 0xe

    .line 124
    .line 125
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 126
    .line 127
    .line 128
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->buyBackground:Ljava/lang/String;

    .line 129
    .line 130
    if-eqz p0, :cond_e

    .line 131
    .line 132
    const/16 v0, 0xf

    .line 133
    .line 134
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 135
    .line 136
    .line 137
    :cond_e
    const/16 p0, 0x10

    .line 138
    .line 139
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->limitTime:Z

    .line 140
    .line 141
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 142
    .line 143
    .line 144
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->matchText:Ljava/lang/String;

    .line 145
    .line 146
    if-eqz p0, :cond_f

    .line 147
    .line 148
    const/16 v0, 0x11

    .line 149
    .line 150
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 151
    .line 152
    .line 153
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastBackground:Ljava/lang/String;

    .line 154
    .line 155
    if-eqz p0, :cond_10

    .line 156
    .line 157
    const/16 v0, 0x12

    .line 158
    .line 159
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 160
    .line 161
    .line 162
    :cond_10
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleMale:Ljava/lang/String;

    .line 163
    .line 164
    if-eqz p0, :cond_11

    .line 165
    .line 166
    const/16 v0, 0x13

    .line 167
    .line 168
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 169
    .line 170
    .line 171
    :cond_11
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastTitleFemale:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz p0, :cond_12

    .line 174
    .line 175
    const/16 v0, 0x14

    .line 176
    .line 177
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 178
    .line 179
    .line 180
    :cond_12
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextMale:Ljava/lang/String;

    .line 181
    .line 182
    if-eqz p0, :cond_13

    .line 183
    .line 184
    const/16 v0, 0x15

    .line 185
    .line 186
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 187
    .line 188
    .line 189
    :cond_13
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonTextFemale:Ljava/lang/String;

    .line 190
    .line 191
    if-eqz p0, :cond_14

    .line 192
    .line 193
    const/16 v0, 0x16

    .line 194
    .line 195
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 196
    .line 197
    .line 198
    :cond_14
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->broadcastButtonIcon:Ljava/lang/String;

    .line 199
    .line 200
    if-eqz p0, :cond_15

    .line 201
    .line 202
    const/16 v0, 0x17

    .line 203
    .line 204
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 205
    .line 206
    .line 207
    :cond_15
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->category:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;

    .line 208
    .line 209
    if-eqz p0, :cond_16

    .line 210
    .line 211
    const/16 v0, 0x18

    .line 212
    .line 213
    sget-object v1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 214
    .line 215
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 216
    .line 217
    .line 218
    :cond_16
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;->showType:Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;

    .line 219
    .line 220
    if-eqz p0, :cond_17

    .line 221
    .line 222
    const/16 p1, 0x19

    .line 223
    .line 224
    sget-object v0, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopicShowType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 225
    .line 226
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 227
    .line 228
    .line 229
    :cond_17
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 230
    check-cast p1, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic$1;->serialize(Lcom/p1/mobile/putong/core/data/HomeTabModuleTopic;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
