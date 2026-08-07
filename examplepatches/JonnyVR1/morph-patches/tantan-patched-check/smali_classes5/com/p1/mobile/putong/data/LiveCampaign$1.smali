.class Lcom/p1/mobile/putong/data/LiveCampaign$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/LiveCampaign;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/LiveCampaign;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveCampaign;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->position:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x5

    .line 51
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x7

    .line 77
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 83
    .line 84
    if-eqz v0, :cond_6

    .line 85
    .line 86
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v1

    .line 92
    const/16 v2, 0x8

    .line 93
    .line 94
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 95
    .line 96
    .line 97
    move-result v0

    .line 98
    add-int/2addr p0, v0

    .line 99
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 100
    .line 101
    if-eqz v0, :cond_7

    .line 102
    .line 103
    const/16 v1, 0x9

    .line 104
    .line 105
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveCampaign;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveCampaign$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/LiveCampaign;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveCampaign;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/LiveCampaign;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/LiveCampaign;-><init>()V

    .line 4
    .line 5
    .line 6
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 7
    .line 8
    .line 9
    move-result v0

    .line 10
    const-string v1, ""

    .line 11
    .line 12
    if-eqz v0, :cond_10

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_f

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_e

    .line 21
    .line 22
    const/16 v2, 0x18

    .line 23
    .line 24
    if-eq v0, v2, :cond_d

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_c

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_b

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_a

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_9

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_8

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_7

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    new-instance p1, Ljava/util/ArrayList;

    .line 73
    .line 74
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 75
    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 78
    .line 79
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_4

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 84
    .line 85
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 86
    .line 87
    if-nez p1, :cond_5

    .line 88
    .line 89
    new-instance p1, Ljava/util/ArrayList;

    .line 90
    .line 91
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 92
    .line 93
    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 95
    .line 96
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 97
    .line 98
    if-nez p1, :cond_6

    .line 99
    .line 100
    new-instance p1, Ljava/util/ArrayList;

    .line 101
    .line 102
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 103
    .line 104
    .line 105
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 106
    .line 107
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 108
    .line 109
    if-nez p1, :cond_18

    .line 110
    .line 111
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 112
    .line 113
    return-object p0

    .line 114
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 115
    .line 116
    .line 117
    move-result-object v0

    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_8
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Ljava/util/List;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Ljava/util/List;

    .line 148
    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_b
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 162
    .line 163
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    .line 166
    move-result-object v0

    .line 167
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    check-cast v0, Ljava/util/List;

    .line 172
    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    iput v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->position:I

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v0

    .line 197
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :cond_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 202
    .line 203
    .line 204
    move-result-object v0

    .line 205
    iput-object v0, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 210
    .line 211
    if-nez p1, :cond_11

    .line 212
    .line 213
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

    .line 214
    .line 215
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 216
    .line 217
    if-nez p1, :cond_12

    .line 218
    .line 219
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

    .line 220
    .line 221
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 222
    .line 223
    if-nez p1, :cond_13

    .line 224
    .line 225
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 226
    .line 227
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 228
    .line 229
    if-nez p1, :cond_14

    .line 230
    .line 231
    new-instance p1, Ljava/util/ArrayList;

    .line 232
    .line 233
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 234
    .line 235
    .line 236
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 237
    .line 238
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 239
    .line 240
    if-nez p1, :cond_15

    .line 241
    .line 242
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 243
    .line 244
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 245
    .line 246
    if-nez p1, :cond_16

    .line 247
    .line 248
    new-instance p1, Ljava/util/ArrayList;

    .line 249
    .line 250
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 251
    .line 252
    .line 253
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 254
    .line 255
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 256
    .line 257
    if-nez p1, :cond_17

    .line 258
    .line 259
    new-instance p1, Ljava/util/ArrayList;

    .line 260
    .line 261
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 262
    .line 263
    .line 264
    iput-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 265
    .line 266
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 267
    .line 268
    if-nez p1, :cond_18

    .line 269
    .line 270
    iput-object v1, p0, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 271
    .line 272
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

    .line 273
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/LiveCampaign$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/LiveCampaign;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/LiveCampaign;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->type:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->position:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceUrl:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->entranceSize:Ljava/util/List;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->INT_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailUrl:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->detailInset:Ljava/util/List;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->DOUBLE_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x7

    .line 64
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->validPeriod:Ljava/util/List;

    .line 68
    .line 69
    if-eqz p0, :cond_6

    .line 70
    .line 71
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->LONG_BOXED_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    .line 76
    move-result-object v0

    .line 77
    const/16 v1, 0x8

    .line 78
    .line 79
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 80
    .line 81
    .line 82
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/LiveCampaign;->campaignType:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz p0, :cond_7

    .line 85
    .line 86
    const/16 p1, 0x9

    .line 87
    .line 88
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

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
    check-cast p1, Lcom/p1/mobile/putong/data/LiveCampaign;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/LiveCampaign$1;->serialize(Lcom/p1/mobile/putong/data/LiveCampaign;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
