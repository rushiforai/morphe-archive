.class Lcom/p1/mobile/putong/data/Contract$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Contract;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Contract;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Contract;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

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
    const/4 v0, 0x6

    .line 53
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 54
    .line 55
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    const/16 v0, 0x8

    .line 75
    .line 76
    iget v1, p1, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 77
    .line 78
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    const/16 v0, 0x9

    .line 84
    .line 85
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 86
    .line 87
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    const/16 v1, 0xa

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 104
    .line 105
    if-eqz v0, :cond_7

    .line 106
    .line 107
    sget-object v1, Lcom/p1/mobile/putong/data/Promotions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 108
    .line 109
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 110
    .line 111
    .line 112
    move-result-object v1

    .line 113
    const/16 v2, 0xb

    .line 114
    .line 115
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 121
    .line 122
    if-eqz v0, :cond_8

    .line 123
    .line 124
    const/16 v1, 0xc

    .line 125
    .line 126
    sget-object v2, Lcom/p1/mobile/putong/data/ContractProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 127
    .line 128
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 129
    .line 130
    .line 131
    move-result v0

    .line 132
    add-int/2addr p0, v0

    .line 133
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 134
    .line 135
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 136
    check-cast p1, Lcom/p1/mobile/putong/data/Contract;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Contract$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Contract;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Contract;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Contract;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Contract;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/ContractProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/ContractProductType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 60
    .line 61
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 62
    .line 63
    if-nez p1, :cond_5

    .line 64
    .line 65
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 66
    .line 67
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 68
    .line 69
    if-nez p1, :cond_6

    .line 70
    .line 71
    sget-object p1, Lcom/p1/mobile/putong/data/ContractProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 72
    .line 73
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/ContractProductType;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 80
    .line 81
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_7

    .line 84
    .line 85
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 86
    .line 87
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 88
    .line 89
    if-nez p1, :cond_10

    .line 90
    .line 91
    new-instance p1, Ljava/util/ArrayList;

    .line 92
    .line 93
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 94
    .line 95
    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 97
    .line 98
    return-object p0

    .line 99
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/ContractProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v2

    .line 105
    check-cast v2, Lcom/p1/mobile/putong/data/ContractProductType;

    .line 106
    .line 107
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/Promotions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v2

    .line 120
    check-cast v2, Ljava/util/List;

    .line 121
    .line 122
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 133
    .line 134
    .line 135
    move-result-wide v2

    .line 136
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 141
    .line 142
    .line 143
    move-result v2

    .line 144
    iput v2, p0, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 149
    .line 150
    .line 151
    move-result v1

    .line 152
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 153
    .line 154
    .line 155
    move-result-object v1

    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 159
    .line 160
    .line 161
    move-result-wide v2

    .line 162
    iput-wide v2, p0, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 191
    .line 192
    .line 193
    move-result-object v2

    .line 194
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    iput-object v2, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 207
    .line 208
    if-nez p1, :cond_8

    .line 209
    .line 210
    if-eqz v1, :cond_8

    .line 211
    .line 212
    sget-object p1, Lcom/p1/mobile/putong/data/ContractProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 213
    .line 214
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 215
    .line 216
    .line 217
    move-result v1

    .line 218
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 219
    .line 220
    .line 221
    move-result-object p1

    .line 222
    check-cast p1, Lcom/p1/mobile/putong/data/ContractProductType;

    .line 223
    .line 224
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 225
    .line 226
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_9

    .line 229
    .line 230
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

    .line 231
    .line 232
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 233
    .line 234
    if-nez p1, :cond_a

    .line 235
    .line 236
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

    .line 237
    .line 238
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 239
    .line 240
    if-nez p1, :cond_b

    .line 241
    .line 242
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

    .line 243
    .line 244
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 245
    .line 246
    if-nez p1, :cond_c

    .line 247
    .line 248
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

    .line 249
    .line 250
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 251
    .line 252
    if-nez p1, :cond_d

    .line 253
    .line 254
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

    .line 255
    .line 256
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 257
    .line 258
    if-nez p1, :cond_e

    .line 259
    .line 260
    sget-object p1, Lcom/p1/mobile/putong/data/ContractProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 261
    .line 262
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    check-cast p1, Lcom/p1/mobile/putong/data/ContractProductType;

    .line 267
    .line 268
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 269
    .line 270
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_f

    .line 273
    .line 274
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 275
    .line 276
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 277
    .line 278
    if-nez p1, :cond_10

    .line 279
    .line 280
    new-instance p1, Ljava/util/ArrayList;

    .line 281
    .line 282
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 283
    .line 284
    .line 285
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 286
    .line 287
    :cond_10
    return-object p0

    .line 288
    nop

    .line 289
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x31 -> :sswitch_6
        0x38 -> :sswitch_5
        0x40 -> :sswitch_4
        0x49 -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 289
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Contract$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Contract;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Contract;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->platform:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->contractStatus:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->itemId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->itemName:Ljava/lang/String;

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
    const/4 p0, 0x6

    .line 42
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Contract;->signTime:D

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 53
    .line 54
    .line 55
    move-result p0

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 57
    .line 58
    .line 59
    :cond_5
    const/16 p0, 0x8

    .line 60
    .line 61
    iget v0, p1, Lcom/p1/mobile/putong/data/Contract;->signVersion:I

    .line 62
    .line 63
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 64
    .line 65
    .line 66
    const/16 p0, 0x9

    .line 67
    .line 68
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Contract;->nextDeductTime:D

    .line 69
    .line 70
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 71
    .line 72
    .line 73
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->nextDuductMoney:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz p0, :cond_6

    .line 76
    .line 77
    const/16 v0, 0xa

    .line 78
    .line 79
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 80
    .line 81
    .line 82
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->promotions:Ljava/util/List;

    .line 83
    .line 84
    if-eqz p0, :cond_7

    .line 85
    .line 86
    sget-object v0, Lcom/p1/mobile/putong/data/Promotions;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    const/16 v1, 0xb

    .line 93
    .line 94
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Contract;->productType:Lcom/p1/mobile/putong/data/ContractProductType;

    .line 98
    .line 99
    if-eqz p0, :cond_8

    .line 100
    .line 101
    const/16 p1, 0xc

    .line 102
    .line 103
    sget-object v0, Lcom/p1/mobile/putong/data/ContractProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 106
    .line 107
    .line 108
    :cond_8
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/data/Contract;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Contract$1;->serialize(Lcom/p1/mobile/putong/data/Contract;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
