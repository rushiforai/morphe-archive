.class Lcom/p1/mobile/putong/core/data/StickerBundle$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/StickerBundle;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/StickerBundle;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/StickerBundle;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->price:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    .line 39
    move-result-object v1

    .line 40
    const/4 v2, 0x4

    .line 41
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_3

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_5

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 81
    .line 82
    if-eqz v0, :cond_6

    .line 83
    .line 84
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    .line 89
    move-result-object v1

    .line 90
    const/16 v2, 0x8

    .line 91
    .line 92
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 98
    .line 99
    if-eqz v0, :cond_7

    .line 100
    .line 101
    const/16 v1, 0x9

    .line 102
    .line 103
    sget-object v2, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 111
    .line 112
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 113
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerBundle;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/StickerBundle$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/StickerBundle;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/StickerBundle;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/StickerBundle;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/StickerBundle;-><init>()V

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
    if-eqz v2, :cond_10

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_f

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_e

    .line 23
    .line 24
    const/16 v4, 0x18

    .line 25
    .line 26
    if-eq v2, v4, :cond_d

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_c

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_b

    .line 35
    .line 36
    const/16 v4, 0x30

    .line 37
    .line 38
    if-eq v2, v4, :cond_a

    .line 39
    .line 40
    const/16 v4, 0x3a

    .line 41
    .line 42
    if-eq v2, v4, :cond_9

    .line 43
    .line 44
    const/16 v4, 0x42

    .line 45
    .line 46
    if-eq v2, v4, :cond_8

    .line 47
    .line 48
    const/16 v4, 0x4a

    .line 49
    .line 50
    if-eq v2, v4, :cond_7

    .line 51
    .line 52
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 53
    .line 54
    if-nez p1, :cond_0

    .line 55
    .line 56
    if-eqz v1, :cond_0

    .line 57
    .line 58
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 59
    .line 60
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 61
    .line 62
    .line 63
    move-result v1

    .line 64
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 71
    .line 72
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

    .line 73
    .line 74
    if-nez p1, :cond_1

    .line 75
    .line 76
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

    .line 77
    .line 78
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

    .line 79
    .line 80
    if-nez p1, :cond_2

    .line 81
    .line 82
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    new-instance p1, Ljava/util/ArrayList;

    .line 89
    .line 90
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 91
    .line 92
    .line 93
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 94
    .line 95
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 96
    .line 97
    if-nez p1, :cond_4

    .line 98
    .line 99
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 100
    .line 101
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 102
    .line 103
    if-nez p1, :cond_5

    .line 104
    .line 105
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 112
    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 114
    .line 115
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 116
    .line 117
    if-nez p1, :cond_6

    .line 118
    .line 119
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 120
    .line 121
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 122
    .line 123
    if-nez p1, :cond_18

    .line 124
    .line 125
    new-instance p1, Ljava/util/ArrayList;

    .line 126
    .line 127
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 128
    .line 129
    .line 130
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 131
    .line 132
    return-object p0

    .line 133
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 136
    .line 137
    .line 138
    move-result-object v2

    .line 139
    check-cast v2, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 140
    .line 141
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :cond_8
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Ljava/util/List;

    .line 156
    .line 157
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v2

    .line 165
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 170
    .line 171
    .line 172
    move-result v1

    .line 173
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 174
    .line 175
    .line 176
    move-result-object v1

    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 180
    .line 181
    .line 182
    move-result-object v2

    .line 183
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :cond_c
    sget-object v2, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 188
    .line 189
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 194
    .line 195
    .line 196
    move-result-object v2

    .line 197
    check-cast v2, Ljava/util/List;

    .line 198
    .line 199
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 204
    .line 205
    .line 206
    move-result v2

    .line 207
    iput v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->price:I

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 220
    .line 221
    .line 222
    move-result-object v2

    .line 223
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

    .line 224
    .line 225
    goto/16 :goto_0

    .line 226
    .line 227
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 228
    .line 229
    if-nez p1, :cond_11

    .line 230
    .line 231
    if-eqz v1, :cond_11

    .line 232
    .line 233
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 234
    .line 235
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 236
    .line 237
    .line 238
    move-result v1

    .line 239
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 244
    .line 245
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 246
    .line 247
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_12

    .line 250
    .line 251
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

    .line 252
    .line 253
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_13

    .line 256
    .line 257
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

    .line 258
    .line 259
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 260
    .line 261
    if-nez p1, :cond_14

    .line 262
    .line 263
    new-instance p1, Ljava/util/ArrayList;

    .line 264
    .line 265
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 266
    .line 267
    .line 268
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 269
    .line 270
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_15

    .line 273
    .line 274
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 275
    .line 276
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 277
    .line 278
    if-nez p1, :cond_16

    .line 279
    .line 280
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 281
    .line 282
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 283
    .line 284
    .line 285
    move-result-object p1

    .line 286
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 287
    .line 288
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 289
    .line 290
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 291
    .line 292
    if-nez p1, :cond_17

    .line 293
    .line 294
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 295
    .line 296
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 297
    .line 298
    if-nez p1, :cond_18

    .line 299
    .line 300
    new-instance p1, Ljava/util/ArrayList;

    .line 301
    .line 302
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 303
    .line 304
    .line 305
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 306
    .line 307
    :cond_18
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 308
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/StickerBundle$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/StickerBundle;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/StickerBundle;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->description:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->price:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->pictures:Ljava/util/List;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    sget-object v0, Lcom/p1/mobile/putong/data/Picture;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    .line 32
    move-result-object v0

    .line 33
    const/4 v1, 0x4

    .line 34
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 35
    .line 36
    .line 37
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->currency:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 63
    .line 64
    .line 65
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->packages:Ljava/util/List;

    .line 66
    .line 67
    if-eqz p0, :cond_6

    .line 68
    .line 69
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    .line 74
    move-result-object v0

    .line 75
    const/16 v1, 0x8

    .line 76
    .line 77
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 78
    .line 79
    .line 80
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/StickerBundle;->status:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 81
    .line 82
    if-eqz p0, :cond_7

    .line 83
    .line 84
    const/16 p1, 0x9

    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 89
    .line 90
    .line 91
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 92
    check-cast p1, Lcom/p1/mobile/putong/core/data/StickerBundle;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/StickerBundle$1;->serialize(Lcom/p1/mobile/putong/core/data/StickerBundle;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
