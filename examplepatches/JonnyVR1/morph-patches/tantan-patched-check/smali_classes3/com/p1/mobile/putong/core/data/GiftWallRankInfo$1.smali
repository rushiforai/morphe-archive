.class Lcom/p1/mobile/putong/core/data/GiftWallRankInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 53
    .line 54
    if-eqz v0, :cond_5

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_5
    const/4 v0, 0x7

    .line 67
    iget v1, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->totalGiftAmount:I

    .line 68
    .line 69
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    sget-object v2, Lcom/p1/mobile/putong/core/data/RankLevel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 81
    .line 82
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 88
    .line 89
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;-><init>()V

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
    if-eqz v2, :cond_e

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_d

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_c

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_b

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_a

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_9

    .line 35
    .line 36
    const/16 v4, 0x30

    .line 37
    .line 38
    if-eq v2, v4, :cond_8

    .line 39
    .line 40
    const/16 v4, 0x38

    .line 41
    .line 42
    if-eq v2, v4, :cond_7

    .line 43
    .line 44
    const/16 v4, 0x42

    .line 45
    .line 46
    if-eq v2, v4, :cond_6

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/core/data/RankLevel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 67
    .line 68
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

    .line 79
    .line 80
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

    .line 85
    .line 86
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_4

    .line 89
    .line 90
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 93
    .line 94
    if-nez p1, :cond_5

    .line 95
    .line 96
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 97
    .line 98
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 99
    .line 100
    if-nez p1, :cond_15

    .line 101
    .line 102
    sget-object p1, Lcom/p1/mobile/putong/core/data/RankLevel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 103
    .line 104
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 105
    .line 106
    .line 107
    move-result-object p1

    .line 108
    check-cast p1, Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 109
    .line 110
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 111
    .line 112
    return-object p0

    .line 113
    :cond_6
    sget-object v2, Lcom/p1/mobile/putong/core/data/RankLevel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 116
    .line 117
    .line 118
    move-result-object v2

    .line 119
    check-cast v2, Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 120
    .line 121
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 125
    .line 126
    .line 127
    move-result v2

    .line 128
    iput v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->totalGiftAmount:I

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 132
    .line 133
    .line 134
    move-result v1

    .line 135
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 136
    .line 137
    .line 138
    move-result-object v1

    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v2

    .line 153
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v2

    .line 161
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 174
    .line 175
    .line 176
    move-result-object v2

    .line 177
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 182
    .line 183
    if-nez p1, :cond_f

    .line 184
    .line 185
    if-eqz v1, :cond_f

    .line 186
    .line 187
    sget-object p1, Lcom/p1/mobile/putong/core/data/RankLevel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 188
    .line 189
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 190
    .line 191
    .line 192
    move-result v1

    .line 193
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 194
    .line 195
    .line 196
    move-result-object p1

    .line 197
    check-cast p1, Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 198
    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 200
    .line 201
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 202
    .line 203
    if-nez p1, :cond_10

    .line 204
    .line 205
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

    .line 206
    .line 207
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

    .line 208
    .line 209
    if-nez p1, :cond_11

    .line 210
    .line 211
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

    .line 212
    .line 213
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

    .line 214
    .line 215
    if-nez p1, :cond_12

    .line 216
    .line 217
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

    .line 218
    .line 219
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 220
    .line 221
    if-nez p1, :cond_13

    .line 222
    .line 223
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 224
    .line 225
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 226
    .line 227
    if-nez p1, :cond_14

    .line 228
    .line 229
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 230
    .line 231
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 232
    .line 233
    if-nez p1, :cond_15

    .line 234
    .line 235
    sget-object p1, Lcom/p1/mobile/putong/core/data/RankLevel;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 236
    .line 237
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 238
    .line 239
    .line 240
    move-result-object p1

    .line 241
    check-cast p1, Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 242
    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 244
    .line 245
    :cond_15
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 246
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->city:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->country:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->district:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->province:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rank:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 47
    .line 48
    .line 49
    move-result p0

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 51
    .line 52
    .line 53
    :cond_5
    const/4 p0, 0x7

    .line 54
    iget v0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->totalGiftAmount:I

    .line 55
    .line 56
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 57
    .line 58
    .line 59
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;->rankLevel:Lcom/p1/mobile/putong/core/data/RankLevel;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/16 p1, 0x8

    .line 64
    .line 65
    sget-object v0, Lcom/p1/mobile/putong/core/data/RankLevel;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 68
    .line 69
    .line 70
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 71
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/GiftWallRankInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/GiftWallRankInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
