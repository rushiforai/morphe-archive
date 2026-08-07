.class Lcom/p1/mobile/putong/data/Order$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Order;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Order;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Order;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 76
    .line 77
    .line 78
    move-result v0

    .line 79
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    const/16 v1, 0x8

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->affiliateTransaction:Lcom/p1/mobile/putong/data/GPAffiliateTransaction;

    .line 96
    .line 97
    if-eqz v0, :cond_8

    .line 98
    .line 99
    const/16 v1, 0x9

    .line 100
    .line 101
    sget-object v2, Lcom/p1/mobile/putong/data/GPAffiliateTransaction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 104
    .line 105
    .line 106
    move-result v0

    .line 107
    add-int/2addr p0, v0

    .line 108
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 109
    .line 110
    if-eqz v0, :cond_9

    .line 111
    .line 112
    const/16 v1, 0xa

    .line 113
    .line 114
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 120
    .line 121
    if-eqz v0, :cond_a

    .line 122
    .line 123
    const/16 v1, 0xb

    .line 124
    .line 125
    sget-object v2, Lcom/p1/mobile/putong/data/PayMethod;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 126
    .line 127
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 128
    .line 129
    .line 130
    move-result v0

    .line 131
    add-int/2addr p0, v0

    .line 132
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 133
    .line 134
    if-eqz v0, :cond_b

    .line 135
    .line 136
    const/16 v1, 0xc

    .line 137
    .line 138
    sget-object v2, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 139
    .line 140
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 146
    .line 147
    if-eqz v0, :cond_c

    .line 148
    .line 149
    const/16 v1, 0xd

    .line 150
    .line 151
    sget-object v2, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 152
    .line 153
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 154
    .line 155
    .line 156
    move-result v0

    .line 157
    add-int/2addr p0, v0

    .line 158
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 159
    .line 160
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 161
    check-cast p1, Lcom/p1/mobile/putong/data/Order;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Order$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Order;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Order;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Order;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Order;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    move-object v3, v2

    .line 10
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const-string v5, ""

    .line 15
    .line 16
    sparse-switch v4, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/data/PayMethod;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 46
    .line 47
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 48
    .line 49
    .line 50
    move-result v1

    .line 51
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 52
    .line 53
    .line 54
    move-result-object p1

    .line 55
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 66
    .line 67
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 68
    .line 69
    .line 70
    move-result v1

    .line 71
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 72
    .line 73
    .line 74
    move-result-object p1

    .line 75
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 78
    .line 79
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 84
    .line 85
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_4

    .line 88
    .line 89
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

    .line 90
    .line 91
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 92
    .line 93
    if-nez p1, :cond_5

    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/data/PayMethod;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 104
    .line 105
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 106
    .line 107
    if-nez p1, :cond_6

    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 116
    .line 117
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 118
    .line 119
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 120
    .line 121
    if-nez p1, :cond_7

    .line 122
    .line 123
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 124
    .line 125
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 126
    .line 127
    if-nez p1, :cond_8

    .line 128
    .line 129
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 130
    .line 131
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 132
    .line 133
    if-nez p1, :cond_9

    .line 134
    .line 135
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 142
    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 144
    .line 145
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_a

    .line 148
    .line 149
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 150
    .line 151
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 152
    .line 153
    if-nez p1, :cond_16

    .line 154
    .line 155
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 156
    .line 157
    return-object p0

    .line 158
    :sswitch_0
    sget-object v4, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 159
    .line 160
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 161
    .line 162
    .line 163
    move-result-object v4

    .line 164
    check-cast v4, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 165
    .line 166
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_1
    sget-object v4, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 171
    .line 172
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v4

    .line 176
    check-cast v4, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 177
    .line 178
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_2
    sget-object v4, Lcom/p1/mobile/putong/data/PayMethod;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v4

    .line 188
    check-cast v4, Lcom/p1/mobile/putong/data/PayMethod;

    .line 189
    .line 190
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_4
    sget-object v4, Lcom/p1/mobile/putong/data/GPAffiliateTransaction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    .line 204
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    check-cast v4, Lcom/p1/mobile/putong/data/GPAffiliateTransaction;

    .line 209
    .line 210
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->affiliateTransaction:Lcom/p1/mobile/putong/data/GPAffiliateTransaction;

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 215
    .line 216
    .line 217
    move-result-object v4

    .line 218
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 219
    .line 220
    goto/16 :goto_0

    .line 221
    .line 222
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 223
    .line 224
    .line 225
    move-result v3

    .line 226
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 227
    .line 228
    .line 229
    move-result-object v3

    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v4

    .line 236
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v4

    .line 244
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 249
    .line 250
    .line 251
    move-result v2

    .line 252
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 253
    .line 254
    .line 255
    move-result-object v2

    .line 256
    goto/16 :goto_0

    .line 257
    .line 258
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 259
    .line 260
    .line 261
    move-result v1

    .line 262
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 263
    .line 264
    .line 265
    move-result-object v1

    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v4

    .line 272
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v4

    .line 280
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 285
    .line 286
    if-nez p1, :cond_b

    .line 287
    .line 288
    if-eqz v1, :cond_b

    .line 289
    .line 290
    sget-object p1, Lcom/p1/mobile/putong/data/PayMethod;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 291
    .line 292
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 293
    .line 294
    .line 295
    move-result v1

    .line 296
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 297
    .line 298
    .line 299
    move-result-object p1

    .line 300
    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    .line 301
    .line 302
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 303
    .line 304
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 305
    .line 306
    if-nez p1, :cond_c

    .line 307
    .line 308
    if-eqz v2, :cond_c

    .line 309
    .line 310
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 311
    .line 312
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 313
    .line 314
    .line 315
    move-result v1

    .line 316
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 317
    .line 318
    .line 319
    move-result-object p1

    .line 320
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 321
    .line 322
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 323
    .line 324
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 325
    .line 326
    if-nez p1, :cond_d

    .line 327
    .line 328
    if-eqz v3, :cond_d

    .line 329
    .line 330
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 331
    .line 332
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 333
    .line 334
    .line 335
    move-result v1

    .line 336
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 337
    .line 338
    .line 339
    move-result-object p1

    .line 340
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 341
    .line 342
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 343
    .line 344
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 345
    .line 346
    if-nez p1, :cond_e

    .line 347
    .line 348
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

    .line 349
    .line 350
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

    .line 351
    .line 352
    if-nez p1, :cond_f

    .line 353
    .line 354
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

    .line 355
    .line 356
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 357
    .line 358
    if-nez p1, :cond_10

    .line 359
    .line 360
    sget-object p1, Lcom/p1/mobile/putong/data/PayMethod;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 361
    .line 362
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 363
    .line 364
    .line 365
    move-result-object p1

    .line 366
    check-cast p1, Lcom/p1/mobile/putong/data/PayMethod;

    .line 367
    .line 368
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 369
    .line 370
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 371
    .line 372
    if-nez p1, :cond_11

    .line 373
    .line 374
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 375
    .line 376
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 377
    .line 378
    .line 379
    move-result-object p1

    .line 380
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 381
    .line 382
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 383
    .line 384
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 385
    .line 386
    if-nez p1, :cond_12

    .line 387
    .line 388
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

    .line 389
    .line 390
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 391
    .line 392
    if-nez p1, :cond_13

    .line 393
    .line 394
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

    .line 395
    .line 396
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 397
    .line 398
    if-nez p1, :cond_14

    .line 399
    .line 400
    sget-object p1, Lcom/p1/mobile/putong/data/BundleStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 401
    .line 402
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 403
    .line 404
    .line 405
    move-result-object p1

    .line 406
    check-cast p1, Lcom/p1/mobile/putong/data/BundleStatus;

    .line 407
    .line 408
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 409
    .line 410
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 411
    .line 412
    if-nez p1, :cond_15

    .line 413
    .line 414
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 415
    .line 416
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 417
    .line 418
    if-nez p1, :cond_16

    .line 419
    .line 420
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 421
    .line 422
    :cond_16
    return-object p0

    .line 423
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x18 -> :sswitch_a
        0x20 -> :sswitch_9
        0x2a -> :sswitch_8
        0x32 -> :sswitch_7
        0x38 -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x52 -> :sswitch_3
        0x5a -> :sswitch_2
        0x62 -> :sswitch_1
        0x6a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 423
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Order$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Order;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Order;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->orderId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->itemId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->paymentRequest:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->contractId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 v0, 0x7

    .line 62
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 63
    .line 64
    .line 65
    move-result p0

    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 67
    .line 68
    .line 69
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->signRequest:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    const/16 v0, 0x8

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->affiliateTransaction:Lcom/p1/mobile/putong/data/GPAffiliateTransaction;

    .line 79
    .line 80
    if-eqz p0, :cond_8

    .line 81
    .line 82
    const/16 v0, 0x9

    .line 83
    .line 84
    sget-object v1, Lcom/p1/mobile/putong/data/GPAffiliateTransaction;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 87
    .line 88
    .line 89
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->signAndPayRequest:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz p0, :cond_9

    .line 92
    .line 93
    const/16 v0, 0xa

    .line 94
    .line 95
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 96
    .line 97
    .line 98
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->payMethod:Lcom/p1/mobile/putong/data/PayMethod;

    .line 99
    .line 100
    if-eqz p0, :cond_a

    .line 101
    .line 102
    const/16 v0, 0xb

    .line 103
    .line 104
    sget-object v1, Lcom/p1/mobile/putong/data/PayMethod;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 107
    .line 108
    .line 109
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->orderStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 110
    .line 111
    if-eqz p0, :cond_b

    .line 112
    .line 113
    const/16 v0, 0xc

    .line 114
    .line 115
    sget-object v1, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 118
    .line 119
    .line 120
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Order;->contractStatus:Lcom/p1/mobile/putong/data/BundleStatus;

    .line 121
    .line 122
    if-eqz p0, :cond_c

    .line 123
    .line 124
    const/16 p1, 0xd

    .line 125
    .line 126
    sget-object v0, Lcom/p1/mobile/putong/data/BundleStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 129
    .line 130
    .line 131
    :cond_c
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 132
    check-cast p1, Lcom/p1/mobile/putong/data/Order;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Order$1;->serialize(Lcom/p1/mobile/putong/data/Order;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
