.class Lcom/p1/mobile/putong/core/data/CoreSendGiftBody$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    sget-object v2, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 28
    .line 29
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    const/4 v0, 0x4

    .line 35
    iget v1, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftAmount:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x6

    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 68
    .line 69
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 85
    .line 86
    .line 87
    move-result v0

    .line 88
    add-int/2addr p0, v0

    .line 89
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 90
    .line 91
    if-eqz v0, :cond_7

    .line 92
    .line 93
    const/16 v1, 0x9

    .line 94
    .line 95
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 96
    .line 97
    .line 98
    move-result v0

    .line 99
    add-int/2addr p0, v0

    .line 100
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 101
    .line 102
    if-eqz v0, :cond_8

    .line 103
    .line 104
    const/16 v1, 0xa

    .line 105
    .line 106
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 107
    .line 108
    .line 109
    move-result v0

    .line 110
    add-int/2addr p0, v0

    .line 111
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 112
    .line 113
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->new_()Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 58
    .line 59
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 60
    .line 61
    if-nez p1, :cond_4

    .line 62
    .line 63
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 64
    .line 65
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 66
    .line 67
    if-nez p1, :cond_5

    .line 68
    .line 69
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 70
    .line 71
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 72
    .line 73
    if-nez p1, :cond_6

    .line 74
    .line 75
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 76
    .line 77
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 78
    .line 79
    .line 80
    move-result-object p1

    .line 81
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 82
    .line 83
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 84
    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 90
    .line 91
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_10

    .line 94
    .line 95
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 96
    .line 97
    return-object p0

    .line 98
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 113
    .line 114
    .line 115
    move-result v1

    .line 116
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    goto :goto_0

    .line 121
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 122
    .line 123
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    check-cast v2, Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 128
    .line 129
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v2

    .line 144
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 149
    .line 150
    .line 151
    move-result v2

    .line 152
    iput v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftAmount:I

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_7
    sget-object v2, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 157
    .line 158
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    check-cast v2, Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 163
    .line 164
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 177
    .line 178
    .line 179
    move-result-object v2

    .line 180
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 185
    .line 186
    if-nez p1, :cond_8

    .line 187
    .line 188
    if-eqz v1, :cond_8

    .line 189
    .line 190
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 191
    .line 192
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 193
    .line 194
    .line 195
    move-result v1

    .line 196
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 201
    .line 202
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 203
    .line 204
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

    .line 205
    .line 206
    if-nez p1, :cond_9

    .line 207
    .line 208
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

    .line 209
    .line 210
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

    .line 211
    .line 212
    if-nez p1, :cond_a

    .line 213
    .line 214
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

    .line 215
    .line 216
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 217
    .line 218
    if-nez p1, :cond_b

    .line 219
    .line 220
    invoke-static {}, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->new_()Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 221
    .line 222
    .line 223
    move-result-object p1

    .line 224
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 225
    .line 226
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 227
    .line 228
    if-nez p1, :cond_c

    .line 229
    .line 230
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 231
    .line 232
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 233
    .line 234
    if-nez p1, :cond_d

    .line 235
    .line 236
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 237
    .line 238
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 239
    .line 240
    if-nez p1, :cond_e

    .line 241
    .line 242
    sget-object p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 243
    .line 244
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 245
    .line 246
    .line 247
    move-result-object p1

    .line 248
    check-cast p1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 249
    .line 250
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 251
    .line 252
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 253
    .line 254
    if-nez p1, :cond_f

    .line 255
    .line 256
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 257
    .line 258
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 259
    .line 260
    if-nez p1, :cond_10

    .line 261
    .line 262
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 263
    .line 264
    :cond_10
    return-object p0

    .line 265
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x20 -> :sswitch_6
        0x2a -> :sswitch_5
        0x32 -> :sswitch_4
        0x3a -> :sswitch_3
        0x40 -> :sswitch_2
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

    .line 265
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizIdentifier:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->bizType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->extra:Lcom/p1/mobile/putong/core/data/SendGiftExtra;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    sget-object v1, Lcom/p1/mobile/putong/core/data/SendGiftExtra;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 23
    .line 24
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    const/4 p0, 0x4

    .line 28
    iget v0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftAmount:I

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->giftID:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->recvUserID:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/GiftSubBizType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->subBizType:Lcom/p1/mobile/putong/core/data/GiftSubBizType;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 66
    .line 67
    .line 68
    move-result p0

    .line 69
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 70
    .line 71
    .line 72
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->consumeType:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz p0, :cond_7

    .line 75
    .line 76
    const/16 v0, 0x9

    .line 77
    .line 78
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 79
    .line 80
    .line 81
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;->coinSign:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz p0, :cond_8

    .line 84
    .line 85
    const/16 p1, 0xa

    .line 86
    .line 87
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 88
    .line 89
    .line 90
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

    .line 91
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreSendGiftBody$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreSendGiftBody;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
