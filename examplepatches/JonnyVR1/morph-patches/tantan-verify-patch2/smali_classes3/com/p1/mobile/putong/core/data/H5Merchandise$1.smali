.class Lcom/p1/mobile/putong/core/data/H5Merchandise$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/H5Merchandise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/H5Merchandise;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/H5Merchandise;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    const/4 v0, 0x5

    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 46
    .line 47
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 77
    .line 78
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/H5Merchandise$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/H5Merchandise;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/H5Merchandise;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/H5Merchandise;-><init>()V

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
    if-eqz v0, :cond_c

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_b

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_a

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_9

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_8

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_7

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_6

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_5

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 65
    .line 66
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 85
    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 87
    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 89
    .line 90
    if-nez p1, :cond_12

    .line 91
    .line 92
    invoke-static {}, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->new_()Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 97
    .line 98
    return-object p0

    .line 99
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 111
    .line 112
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    iput v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 129
    .line 130
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_d

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

    .line 169
    .line 170
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_e

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

    .line 175
    .line 176
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_f

    .line 179
    .line 180
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

    .line 181
    .line 182
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 183
    .line 184
    if-nez p1, :cond_10

    .line 185
    .line 186
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 187
    .line 188
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 193
    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 195
    .line 196
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 197
    .line 198
    if-nez p1, :cond_11

    .line 199
    .line 200
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 201
    .line 202
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 203
    .line 204
    .line 205
    move-result-object p1

    .line 206
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 207
    .line 208
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 209
    .line 210
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 211
    .line 212
    if-nez p1, :cond_12

    .line 213
    .line 214
    invoke-static {}, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->new_()Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 219
    .line 220
    :cond_12
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/H5Merchandise$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/H5Merchandise;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/H5Merchandise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->payment:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->tracker:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    const/4 p0, 0x5

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->quantity:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 p1, 0x7

    .line 56
    sget-object v0, Lcom/p1/mobile/putong/core/data/H5StockKeepUnit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 57
    .line 58
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 62
    check-cast p1, Lcom/p1/mobile/putong/core/data/H5Merchandise;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/H5Merchandise$1;->serialize(Lcom/p1/mobile/putong/core/data/H5Merchandise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
