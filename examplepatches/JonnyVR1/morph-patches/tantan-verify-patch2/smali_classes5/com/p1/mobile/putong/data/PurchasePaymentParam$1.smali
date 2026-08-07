.class Lcom/p1/mobile/putong/data/PurchasePaymentParam$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/PurchasePaymentParam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/PurchasePaymentParam;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

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
    const/4 v0, 0x4

    .line 33
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 34
    .line 35
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    const/4 v0, 0x5

    .line 41
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->signAndPay:Z

    .line 42
    .line 43
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_3

    .line 51
    .line 52
    const/4 v1, 0x6

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 59
    .line 60
    if-eqz v0, :cond_4

    .line 61
    .line 62
    const/4 v1, 0x7

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/data/PaymentParamExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_5

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    add-int/2addr p0, v0

    .line 81
    :cond_5
    const/16 v0, 0x9

    .line 82
    .line 83
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useJDNew:Z

    .line 84
    .line 85
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 86
    .line 87
    .line 88
    move-result v0

    .line 89
    add-int/2addr p0, v0

    .line 90
    iget-object v0, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 91
    .line 92
    if-eqz v0, :cond_6

    .line 93
    .line 94
    const/16 v1, 0x33

    .line 95
    .line 96
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_6
    const/16 v0, 0x34

    .line 102
    .line 103
    iget v1, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 104
    .line 105
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    const/16 v0, 0x35

    .line 111
    .line 112
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->useHuaBei:Z

    .line 113
    .line 114
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 115
    .line 116
    .line 117
    move-result v0

    .line 118
    add-int/2addr p0, v0

    .line 119
    const/16 v0, 0x36

    .line 120
    .line 121
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->jsBridge:Z

    .line 122
    .line 123
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    add-int/2addr p0, v0

    .line 128
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 129
    .line 130
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 131
    check-cast p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PurchasePaymentParam$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/PurchasePaymentParam;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PurchasePaymentParam;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PurchasePaymentParam;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentParamExtra;->new_()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 54
    .line 55
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 56
    .line 57
    if-nez p1, :cond_c

    .line 58
    .line 59
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 60
    .line 61
    return-object p0

    .line 62
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 63
    .line 64
    .line 65
    move-result v0

    .line 66
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->jsBridge:Z

    .line 67
    .line 68
    goto :goto_0

    .line 69
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->useHuaBei:Z

    .line 74
    .line 75
    goto :goto_0

    .line 76
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 77
    .line 78
    .line 79
    move-result v0

    .line 80
    iput v0, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 81
    .line 82
    goto :goto_0

    .line 83
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 84
    .line 85
    .line 86
    move-result-object v0

    .line 87
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 88
    .line 89
    goto :goto_0

    .line 90
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->useJDNew:Z

    .line 95
    .line 96
    goto :goto_0

    .line 97
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 102
    .line 103
    goto :goto_0

    .line 104
    :sswitch_6
    sget-object v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 105
    .line 106
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 107
    .line 108
    .line 109
    move-result-object v0

    .line 110
    check-cast v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 111
    .line 112
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->signAndPay:Z

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 142
    .line 143
    goto/16 :goto_0

    .line 144
    .line 145
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 146
    .line 147
    .line 148
    move-result-object v0

    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 162
    .line 163
    if-nez p1, :cond_6

    .line 164
    .line 165
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 166
    .line 167
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 168
    .line 169
    if-nez p1, :cond_7

    .line 170
    .line 171
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 172
    .line 173
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 174
    .line 175
    if-nez p1, :cond_8

    .line 176
    .line 177
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 178
    .line 179
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_9

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 184
    .line 185
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 186
    .line 187
    if-nez p1, :cond_a

    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentParamExtra;->new_()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 194
    .line 195
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 196
    .line 197
    if-nez p1, :cond_b

    .line 198
    .line 199
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 200
    .line 201
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 202
    .line 203
    if-nez p1, :cond_c

    .line 204
    .line 205
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 206
    .line 207
    :cond_c
    return-object p0

    .line 208
    nop

    .line 209
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x12 -> :sswitch_b
        0x1a -> :sswitch_a
        0x20 -> :sswitch_9
        0x28 -> :sswitch_8
        0x32 -> :sswitch_7
        0x3a -> :sswitch_6
        0x42 -> :sswitch_5
        0x48 -> :sswitch_4
        0x19a -> :sswitch_3
        0x1a0 -> :sswitch_2
        0x1a8 -> :sswitch_1
        0x1b0 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 209
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PurchasePaymentParam$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

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
    const/4 p0, 0x4

    .line 26
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 29
    .line 30
    .line 31
    const/4 p0, 0x5

    .line 32
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->signAndPay:Z

    .line 33
    .line 34
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 35
    .line 36
    .line 37
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_3

    .line 40
    .line 41
    const/4 v0, 0x6

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x7

    .line 50
    sget-object v1, Lcom/p1/mobile/putong/data/PaymentParamExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 62
    .line 63
    .line 64
    :cond_5
    const/16 p0, 0x9

    .line 65
    .line 66
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useJDNew:Z

    .line 67
    .line 68
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 69
    .line 70
    .line 71
    iget-object p0, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->orderId:Ljava/lang/String;

    .line 72
    .line 73
    if-eqz p0, :cond_6

    .line 74
    .line 75
    const/16 v0, 0x33

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 78
    .line 79
    .line 80
    :cond_6
    const/16 p0, 0x34

    .line 81
    .line 82
    iget v0, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->quantity:I

    .line 83
    .line 84
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 85
    .line 86
    .line 87
    const/16 p0, 0x35

    .line 88
    .line 89
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->useHuaBei:Z

    .line 90
    .line 91
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 92
    .line 93
    .line 94
    const/16 p0, 0x36

    .line 95
    .line 96
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;->jsBridge:Z

    .line 97
    .line 98
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 99
    .line 100
    .line 101
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 102
    check-cast p1, Lcom/p1/mobile/putong/data/PurchasePaymentParam;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/PurchasePaymentParam$1;->serialize(Lcom/p1/mobile/putong/data/PurchasePaymentParam;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
