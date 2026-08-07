.class Lcom/p1/mobile/putong/core/data/PaymentOrder$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/PaymentOrder;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/PaymentOrder;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PaymentOrder;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    const/4 v0, 0x6

    .line 57
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->amount:D

    .line 58
    .line 59
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_5
    const/16 v0, 0x8

    .line 79
    .line 80
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->createdTime:D

    .line 81
    .line 82
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 88
    .line 89
    if-eqz v0, :cond_6

    .line 90
    .line 91
    const/16 v1, 0x9

    .line 92
    .line 93
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 94
    .line 95
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 101
    .line 102
    if-eqz v0, :cond_7

    .line 103
    .line 104
    const/16 v1, 0xa

    .line 105
    .line 106
    sget-object v2, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 114
    .line 115
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 116
    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PaymentOrder$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/PaymentOrder;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PaymentOrder;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/PaymentOrder;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

    .line 81
    .line 82
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 83
    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 87
    .line 88
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 93
    .line 94
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 95
    .line 96
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 97
    .line 98
    if-nez p1, :cond_e

    .line 99
    .line 100
    sget-object p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 101
    .line 102
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 103
    .line 104
    .line 105
    move-result-object p1

    .line 106
    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 109
    .line 110
    return-object p0

    .line 111
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v3

    .line 117
    check-cast v3, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 118
    .line 119
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v3

    .line 128
    check-cast v3, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 129
    .line 130
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 134
    .line 135
    .line 136
    move-result-wide v3

    .line 137
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->createdTime:D

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 142
    .line 143
    .line 144
    move-result v2

    .line 145
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 146
    .line 147
    .line 148
    move-result-object v2

    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 152
    .line 153
    .line 154
    move-result-wide v3

    .line 155
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->amount:D

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 160
    .line 161
    .line 162
    move-result v1

    .line 163
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v1

    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v3

    .line 173
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v3

    .line 181
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 186
    .line 187
    .line 188
    move-result-object v3

    .line 189
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 194
    .line 195
    .line 196
    move-result-object v3

    .line 197
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 202
    .line 203
    if-nez p1, :cond_7

    .line 204
    .line 205
    if-eqz v1, :cond_7

    .line 206
    .line 207
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 208
    .line 209
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 210
    .line 211
    .line 212
    move-result v1

    .line 213
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 214
    .line 215
    .line 216
    move-result-object p1

    .line 217
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 218
    .line 219
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 220
    .line 221
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 222
    .line 223
    if-nez p1, :cond_8

    .line 224
    .line 225
    if-eqz v2, :cond_8

    .line 226
    .line 227
    sget-object p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 228
    .line 229
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 230
    .line 231
    .line 232
    move-result v1

    .line 233
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 234
    .line 235
    .line 236
    move-result-object p1

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 238
    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 240
    .line 241
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_9

    .line 244
    .line 245
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

    .line 246
    .line 247
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

    .line 248
    .line 249
    if-nez p1, :cond_a

    .line 250
    .line 251
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

    .line 252
    .line 253
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

    .line 254
    .line 255
    if-nez p1, :cond_b

    .line 256
    .line 257
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

    .line 258
    .line 259
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

    .line 260
    .line 261
    if-nez p1, :cond_c

    .line 262
    .line 263
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

    .line 264
    .line 265
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 266
    .line 267
    if-nez p1, :cond_d

    .line 268
    .line 269
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 270
    .line 271
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 272
    .line 273
    .line 274
    move-result-object p1

    .line 275
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 276
    .line 277
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 278
    .line 279
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 280
    .line 281
    if-nez p1, :cond_e

    .line 282
    .line 283
    sget-object p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 284
    .line 285
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 286
    .line 287
    .line 288
    move-result-object p1

    .line 289
    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 290
    .line 291
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 292
    .line 293
    :cond_e
    return-object p0

    .line 294
    nop

    .line 295
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x28 -> :sswitch_5
        0x31 -> :sswitch_4
        0x38 -> :sswitch_3
        0x41 -> :sswitch_2
        0x4a -> :sswitch_1
        0x52 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 295
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/PaymentOrder$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/PaymentOrder;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/PaymentOrder;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->type:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->itemName:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    :cond_4
    const/4 p0, 0x6

    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->amount:D

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 57
    .line 58
    .line 59
    move-result p0

    .line 60
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 61
    .line 62
    .line 63
    :cond_5
    const/16 p0, 0x8

    .line 64
    .line 65
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->createdTime:D

    .line 66
    .line 67
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 68
    .line 69
    .line 70
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->productType:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 71
    .line 72
    if-eqz p0, :cond_6

    .line 73
    .line 74
    const/16 v0, 0x9

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 79
    .line 80
    .line 81
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;->status:Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;

    .line 82
    .line 83
    if-eqz p0, :cond_7

    .line 84
    .line 85
    const/16 p1, 0xa

    .line 86
    .line 87
    sget-object v0, Lcom/p1/mobile/putong/core/data/PaymentOrderStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 88
    .line 89
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 90
    .line 91
    .line 92
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

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/core/data/PaymentOrder;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/PaymentOrder$1;->serialize(Lcom/p1/mobile/putong/core/data/PaymentOrder;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
