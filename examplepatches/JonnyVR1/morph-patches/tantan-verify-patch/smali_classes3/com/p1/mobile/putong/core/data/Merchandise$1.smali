.class Lcom/p1/mobile/putong/core/data/Merchandise$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Merchandise;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Merchandise;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Merchandise;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 9
    .line 10
    if-eqz v0, :cond_0

    .line 11
    .line 12
    const/4 v1, 0x2

    .line 13
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 14
    .line 15
    .line 16
    move-result v0

    .line 17
    add-int/2addr p0, v0

    .line 18
    :cond_0
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 29
    .line 30
    .line 31
    move-result v0

    .line 32
    add-int/2addr p0, v0

    .line 33
    :cond_1
    const/16 v0, 0x34

    .line 34
    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 36
    .line 37
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 43
    .line 44
    if-eqz v0, :cond_2

    .line 45
    .line 46
    const/16 v1, 0x35

    .line 47
    .line 48
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 53
    .line 54
    .line 55
    move-result v0

    .line 56
    add-int/2addr p0, v0

    .line 57
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 58
    .line 59
    if-eqz v0, :cond_3

    .line 60
    .line 61
    const/16 v1, 0x36

    .line 62
    .line 63
    sget-object v2, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 71
    .line 72
    if-eqz v0, :cond_4

    .line 73
    .line 74
    const/16 v1, 0x37

    .line 75
    .line 76
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 77
    .line 78
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 84
    .line 85
    if-eqz v0, :cond_5

    .line 86
    .line 87
    const/16 v1, 0x38

    .line 88
    .line 89
    sget-object v2, Lcom/p1/mobile/putong/core/data/ProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 90
    .line 91
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 97
    .line 98
    if-eqz v0, :cond_6

    .line 99
    .line 100
    sget-object v1, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    .line 105
    move-result-object v1

    .line 106
    const/16 v2, 0x39

    .line 107
    .line 108
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 114
    .line 115
    if-eqz v0, :cond_7

    .line 116
    .line 117
    const/16 v1, 0x3a

    .line 118
    .line 119
    sget-object v2, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 127
    .line 128
    if-eqz v0, :cond_8

    .line 129
    .line 130
    const/16 v1, 0x3b

    .line 131
    .line 132
    sget-object v2, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 133
    .line 134
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 140
    .line 141
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 142
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Merchandise$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Merchandise;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Merchandise;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Merchandise;-><init>()V

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
    sparse-switch v3, :sswitch_data_0

    .line 14
    .line 15
    .line 16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 23
    .line 24
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 25
    .line 26
    .line 27
    move-result v1

    .line 28
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 29
    .line 30
    .line 31
    move-result-object p1

    .line 32
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 37
    .line 38
    if-nez p1, :cond_1

    .line 39
    .line 40
    if-eqz v2, :cond_1

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 43
    .line 44
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 45
    .line 46
    .line 47
    move-result v1

    .line 48
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 49
    .line 50
    .line 51
    move-result-object p1

    .line 52
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 55
    .line 56
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 57
    .line 58
    if-nez p1, :cond_2

    .line 59
    .line 60
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 61
    .line 62
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 63
    .line 64
    .line 65
    move-result-object p1

    .line 66
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 69
    .line 70
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 71
    .line 72
    if-nez p1, :cond_3

    .line 73
    .line 74
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 75
    .line 76
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 83
    .line 84
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 85
    .line 86
    if-nez p1, :cond_4

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->new_()Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 93
    .line 94
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 95
    .line 96
    if-nez p1, :cond_5

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 104
    .line 105
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 106
    .line 107
    if-nez p1, :cond_6

    .line 108
    .line 109
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 110
    .line 111
    .line 112
    move-result-object p1

    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 114
    .line 115
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 116
    .line 117
    if-nez p1, :cond_e

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 124
    .line 125
    return-object p0

    .line 126
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    check-cast v3, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 133
    .line 134
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 144
    .line 145
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v3

    .line 159
    check-cast v3, Ljava/util/List;

    .line 160
    .line 161
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_3
    sget-object v3, Lcom/p1/mobile/putong/core/data/ProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v3

    .line 171
    check-cast v3, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 172
    .line 173
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 178
    .line 179
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 180
    .line 181
    .line 182
    move-result-object v3

    .line 183
    check-cast v3, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 184
    .line 185
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 190
    .line 191
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 192
    .line 193
    .line 194
    move-result-object v3

    .line 195
    check-cast v3, Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 196
    .line 197
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 198
    .line 199
    goto/16 :goto_0

    .line 200
    .line 201
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 202
    .line 203
    .line 204
    move-result v2

    .line 205
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 212
    .line 213
    .line 214
    move-result v3

    .line 215
    iput v3, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 220
    .line 221
    .line 222
    move-result v1

    .line 223
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 224
    .line 225
    .line 226
    move-result-object v1

    .line 227
    goto/16 :goto_0

    .line 228
    .line 229
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 230
    .line 231
    .line 232
    move-result-object v3

    .line 233
    iput-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 234
    .line 235
    goto/16 :goto_0

    .line 236
    .line 237
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 238
    .line 239
    .line 240
    move-result-wide v3

    .line 241
    iput-wide v3, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 246
    .line 247
    if-nez p1, :cond_7

    .line 248
    .line 249
    if-eqz v1, :cond_7

    .line 250
    .line 251
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 252
    .line 253
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 254
    .line 255
    .line 256
    move-result v1

    .line 257
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 258
    .line 259
    .line 260
    move-result-object p1

    .line 261
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 262
    .line 263
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 264
    .line 265
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 266
    .line 267
    if-nez p1, :cond_8

    .line 268
    .line 269
    if-eqz v2, :cond_8

    .line 270
    .line 271
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 272
    .line 273
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 274
    .line 275
    .line 276
    move-result v1

    .line 277
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 278
    .line 279
    .line 280
    move-result-object p1

    .line 281
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 282
    .line 283
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 284
    .line 285
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 286
    .line 287
    if-nez p1, :cond_9

    .line 288
    .line 289
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductCategory;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 290
    .line 291
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 292
    .line 293
    .line 294
    move-result-object p1

    .line 295
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 296
    .line 297
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 298
    .line 299
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 300
    .line 301
    if-nez p1, :cond_a

    .line 302
    .line 303
    sget-object p1, Lcom/p1/mobile/putong/core/data/ProductType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 304
    .line 305
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 306
    .line 307
    .line 308
    move-result-object p1

    .line 309
    check-cast p1, Lcom/p1/mobile/putong/core/data/ProductType;

    .line 310
    .line 311
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 312
    .line 313
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 314
    .line 315
    if-nez p1, :cond_b

    .line 316
    .line 317
    invoke-static {}, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->new_()Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 318
    .line 319
    .line 320
    move-result-object p1

    .line 321
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 322
    .line 323
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 324
    .line 325
    if-nez p1, :cond_c

    .line 326
    .line 327
    new-instance p1, Ljava/util/ArrayList;

    .line 328
    .line 329
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 330
    .line 331
    .line 332
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 333
    .line 334
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 335
    .line 336
    if-nez p1, :cond_d

    .line 337
    .line 338
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 339
    .line 340
    .line 341
    move-result-object p1

    .line 342
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 343
    .line 344
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 345
    .line 346
    if-nez p1, :cond_e

    .line 347
    .line 348
    invoke-static {}, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->new_()Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 353
    .line 354
    :cond_e
    return-object p0

    .line 355
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0x8 -> :sswitch_a
        0x12 -> :sswitch_9
        0x198 -> :sswitch_8
        0x1a0 -> :sswitch_7
        0x1a8 -> :sswitch_6
        0x1b2 -> :sswitch_5
        0x1ba -> :sswitch_4
        0x1c2 -> :sswitch_3
        0x1ca -> :sswitch_2
        0x1d2 -> :sswitch_1
        0x1da -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 355
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Merchandise$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Merchandise;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 8
    .line 9
    if-eqz p0, :cond_0

    .line 10
    .line 11
    const/4 v0, 0x2

    .line 12
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 13
    .line 14
    .line 15
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 22
    .line 23
    .line 24
    move-result p0

    .line 25
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 26
    .line 27
    .line 28
    :cond_1
    const/16 p0, 0x34

    .line 29
    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->quantity:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/16 v0, 0x35

    .line 40
    .line 41
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result p0

    .line 45
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 46
    .line 47
    .line 48
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->defaultStockKeepUnit:Lcom/p1/mobile/putong/core/data/StockKeepUnit;

    .line 49
    .line 50
    if-eqz p0, :cond_3

    .line 51
    .line 52
    const/16 v0, 0x36

    .line 53
    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/StockKeepUnit;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->category:Lcom/p1/mobile/putong/core/data/ProductCategory;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const/16 v0, 0x37

    .line 64
    .line 65
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductCategory;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 68
    .line 69
    .line 70
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->productType:Lcom/p1/mobile/putong/core/data/ProductType;

    .line 71
    .line 72
    if-eqz p0, :cond_5

    .line 73
    .line 74
    const/16 v0, 0x38

    .line 75
    .line 76
    sget-object v1, Lcom/p1/mobile/putong/core/data/ProductType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 79
    .line 80
    .line 81
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->localCoupons:Ljava/util/List;

    .line 82
    .line 83
    if-eqz p0, :cond_6

    .line 84
    .line 85
    sget-object v0, Lcom/p1/mobile/putong/core/data/Coupon;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 88
    .line 89
    .line 90
    move-result-object v0

    .line 91
    const/16 v1, 0x39

    .line 92
    .line 93
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 94
    .line 95
    .line 96
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->duration:Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;

    .line 97
    .line 98
    if-eqz p0, :cond_7

    .line 99
    .line 100
    const/16 v0, 0x3a

    .line 101
    .line 102
    sget-object v1, Lcom/p1/mobile/putong/core/data/MerchandiseDurationDesc;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 103
    .line 104
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 105
    .line 106
    .line 107
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Merchandise;->extra:Lcom/p1/mobile/putong/core/data/MerchandiseExtra;

    .line 108
    .line 109
    if-eqz p0, :cond_8

    .line 110
    .line 111
    const/16 p1, 0x3b

    .line 112
    .line 113
    sget-object v0, Lcom/p1/mobile/putong/core/data/MerchandiseExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 114
    .line 115
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 116
    .line 117
    .line 118
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

    .line 119
    check-cast p1, Lcom/p1/mobile/putong/core/data/Merchandise;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Merchandise$1;->serialize(Lcom/p1/mobile/putong/core/data/Merchandise;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
