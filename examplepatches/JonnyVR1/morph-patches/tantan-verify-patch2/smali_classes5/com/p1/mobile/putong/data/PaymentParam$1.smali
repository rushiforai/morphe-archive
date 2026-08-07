.class Lcom/p1/mobile/putong/data/PaymentParam$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/PaymentParam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/PaymentParam;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/PaymentParam;)I
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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 91
    .line 92
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/data/PaymentParam;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PaymentParam$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/PaymentParam;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PaymentParam;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/PaymentParam;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/PaymentParam;-><init>()V

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
    if-eqz v0, :cond_e

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_d

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_c

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_b

    .line 25
    .line 26
    const/16 v2, 0x20

    .line 27
    .line 28
    if-eq v0, v2, :cond_a

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_9

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_8

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_7

    .line 41
    .line 42
    const/16 v2, 0x42

    .line 43
    .line 44
    if-eq v0, v2, :cond_6

    .line 45
    .line 46
    const/16 v2, 0x48

    .line 47
    .line 48
    if-eq v0, v2, :cond_5

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 73
    .line 74
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 75
    .line 76
    if-nez p1, :cond_4

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentParamExtra;->new_()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 83
    .line 84
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_14

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 89
    .line 90
    return-object p0

    .line 91
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->useJDNew:Z

    .line 96
    .line 97
    goto :goto_0

    .line 98
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 124
    .line 125
    .line 126
    move-result v0

    .line 127
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->signAndPay:Z

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->useAutoDeduct:Z

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v0

    .line 150
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    iput-object v0, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 163
    .line 164
    if-nez p1, :cond_f

    .line 165
    .line 166
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->itemId:Ljava/lang/String;

    .line 167
    .line 168
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 169
    .line 170
    if-nez p1, :cond_10

    .line 171
    .line 172
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->receipt:Ljava/lang/String;

    .line 173
    .line 174
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 175
    .line 176
    if-nez p1, :cond_11

    .line 177
    .line 178
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->url:Ljava/lang/String;

    .line 179
    .line 180
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 181
    .line 182
    if-nez p1, :cond_12

    .line 183
    .line 184
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->tracker:Ljava/lang/String;

    .line 185
    .line 186
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 187
    .line 188
    if-nez p1, :cond_13

    .line 189
    .line 190
    invoke-static {}, Lcom/p1/mobile/putong/data/PaymentParamExtra;->new_()Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->ext:Lcom/p1/mobile/putong/data/PaymentParamExtra;

    .line 195
    .line 196
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_14

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/data/PaymentParam;->couponId:Ljava/lang/String;

    .line 201
    .line 202
    :cond_14
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 203
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/PaymentParam$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/PaymentParam;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/PaymentParam;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/PaymentParam;->useJDNew:Z

    .line 67
    .line 68
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 69
    .line 70
    .line 71
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 72
    check-cast p1, Lcom/p1/mobile/putong/data/PaymentParam;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/PaymentParam$1;->serialize(Lcom/p1/mobile/putong/data/PaymentParam;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
