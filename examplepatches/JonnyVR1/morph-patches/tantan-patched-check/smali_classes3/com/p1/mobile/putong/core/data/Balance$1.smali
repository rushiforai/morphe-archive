.class Lcom/p1/mobile/putong/core/data/Balance$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/Balance;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/Balance;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Balance;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 18
    .line 19
    .line 20
    move-result v0

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    const/4 v0, 0x3

    .line 27
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Balance;->amount:D

    .line 28
    .line 29
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    const/4 v0, 0x4

    .line 35
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Balance;->actualAmount:D

    .line 36
    .line 37
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 43
    .line 44
    if-eqz v0, :cond_2

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
    :cond_2
    const/4 v0, 0x6

    .line 57
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Balance;->createdTime:D

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
    const/4 v0, 0x7

    .line 65
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/Balance;->updatedTime:D

    .line 66
    .line 67
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_3

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz v0, :cond_4

    .line 86
    .line 87
    const/16 v1, 0x9

    .line 88
    .line 89
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 95
    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    const/16 v1, 0xa

    .line 99
    .line 100
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 110
    .line 111
    if-eqz v0, :cond_6

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    sget-object v2, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 116
    .line 117
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 123
    .line 124
    if-eqz v0, :cond_7

    .line 125
    .line 126
    const/16 v1, 0xc

    .line 127
    .line 128
    sget-object v2, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 129
    .line 130
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-int/2addr p0, v0

    .line 135
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 136
    .line 137
    if-eqz v0, :cond_8

    .line 138
    .line 139
    const/16 v1, 0xd

    .line 140
    .line 141
    sget-object v2, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 142
    .line 143
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 144
    .line 145
    .line 146
    move-result v0

    .line 147
    add-int/2addr p0, v0

    .line 148
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 149
    .line 150
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/core/data/Balance;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Balance$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/Balance;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Balance;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/Balance;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/Balance;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 56
    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 58
    .line 59
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 60
    .line 61
    if-nez p1, :cond_2

    .line 62
    .line 63
    if-eqz v3, :cond_2

    .line 64
    .line 65
    sget-object p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 76
    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 78
    .line 79
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_3

    .line 82
    .line 83
    iput-object v5, p0, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

    .line 84
    .line 85
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 86
    .line 87
    if-nez p1, :cond_4

    .line 88
    .line 89
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 90
    .line 91
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 92
    .line 93
    .line 94
    move-result-object p1

    .line 95
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 98
    .line 99
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 100
    .line 101
    if-nez p1, :cond_5

    .line 102
    .line 103
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 104
    .line 105
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 106
    .line 107
    .line 108
    move-result-object p1

    .line 109
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 110
    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 112
    .line 113
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_6

    .line 116
    .line 117
    iput-object v5, p0, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 118
    .line 119
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 120
    .line 121
    if-nez p1, :cond_7

    .line 122
    .line 123
    iput-object v5, p0, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 124
    .line 125
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 126
    .line 127
    if-nez p1, :cond_10

    .line 128
    .line 129
    sget-object p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 130
    .line 131
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 132
    .line 133
    .line 134
    move-result-object p1

    .line 135
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 136
    .line 137
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 138
    .line 139
    return-object p0

    .line 140
    :sswitch_0
    sget-object v4, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 141
    .line 142
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v4

    .line 146
    check-cast v4, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 147
    .line 148
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_1
    sget-object v4, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v4

    .line 158
    check-cast v4, Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 159
    .line 160
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_2
    sget-object v4, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 165
    .line 166
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 167
    .line 168
    .line 169
    move-result-object v4

    .line 170
    check-cast v4, Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 171
    .line 172
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 177
    .line 178
    .line 179
    move-result v3

    .line 180
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 181
    .line 182
    .line 183
    move-result-object v3

    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v4

    .line 190
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 195
    .line 196
    .line 197
    move-result-object v4

    .line 198
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 199
    .line 200
    goto/16 :goto_0

    .line 201
    .line 202
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 203
    .line 204
    .line 205
    move-result-wide v4

    .line 206
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->updatedTime:D

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 211
    .line 212
    .line 213
    move-result-wide v4

    .line 214
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->createdTime:D

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 219
    .line 220
    .line 221
    move-result v2

    .line 222
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 223
    .line 224
    .line 225
    move-result-object v2

    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 229
    .line 230
    .line 231
    move-result-wide v4

    .line 232
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->actualAmount:D

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 237
    .line 238
    .line 239
    move-result-wide v4

    .line 240
    iput-wide v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->amount:D

    .line 241
    .line 242
    goto/16 :goto_0

    .line 243
    .line 244
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 249
    .line 250
    .line 251
    move-result-object v1

    .line 252
    goto/16 :goto_0

    .line 253
    .line 254
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 255
    .line 256
    .line 257
    move-result-object v4

    .line 258
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

    .line 259
    .line 260
    goto/16 :goto_0

    .line 261
    .line 262
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 263
    .line 264
    if-nez p1, :cond_8

    .line 265
    .line 266
    if-eqz v1, :cond_8

    .line 267
    .line 268
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 269
    .line 270
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 271
    .line 272
    .line 273
    move-result v1

    .line 274
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 275
    .line 276
    .line 277
    move-result-object p1

    .line 278
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 279
    .line 280
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 281
    .line 282
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 283
    .line 284
    if-nez p1, :cond_9

    .line 285
    .line 286
    if-eqz v2, :cond_9

    .line 287
    .line 288
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 289
    .line 290
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 291
    .line 292
    .line 293
    move-result v1

    .line 294
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 295
    .line 296
    .line 297
    move-result-object p1

    .line 298
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 299
    .line 300
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 301
    .line 302
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 303
    .line 304
    if-nez p1, :cond_a

    .line 305
    .line 306
    if-eqz v3, :cond_a

    .line 307
    .line 308
    sget-object p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 309
    .line 310
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 319
    .line 320
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 321
    .line 322
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

    .line 323
    .line 324
    if-nez p1, :cond_b

    .line 325
    .line 326
    iput-object v5, p0, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

    .line 327
    .line 328
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 329
    .line 330
    if-nez p1, :cond_c

    .line 331
    .line 332
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 333
    .line 334
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 335
    .line 336
    .line 337
    move-result-object p1

    .line 338
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 339
    .line 340
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 341
    .line 342
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 343
    .line 344
    if-nez p1, :cond_d

    .line 345
    .line 346
    sget-object p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 347
    .line 348
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 349
    .line 350
    .line 351
    move-result-object p1

    .line 352
    check-cast p1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 353
    .line 354
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 355
    .line 356
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 357
    .line 358
    if-nez p1, :cond_e

    .line 359
    .line 360
    iput-object v5, p0, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 361
    .line 362
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 363
    .line 364
    if-nez p1, :cond_f

    .line 365
    .line 366
    iput-object v5, p0, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 367
    .line 368
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 369
    .line 370
    if-nez p1, :cond_10

    .line 371
    .line 372
    sget-object p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 373
    .line 374
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 379
    .line 380
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 381
    .line 382
    :cond_10
    return-object p0

    .line 383
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0xa -> :sswitch_c
        0x10 -> :sswitch_b
        0x19 -> :sswitch_a
        0x21 -> :sswitch_9
        0x28 -> :sswitch_8
        0x31 -> :sswitch_7
        0x39 -> :sswitch_6
        0x42 -> :sswitch_5
        0x4a -> :sswitch_4
        0x50 -> :sswitch_3
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

    .line 383
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/Balance$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/Balance;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/Balance;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 15
    .line 16
    .line 17
    move-result p0

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    :cond_1
    const/4 p0, 0x3

    .line 22
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->amount:D

    .line 23
    .line 24
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 25
    .line 26
    .line 27
    const/4 p0, 0x4

    .line 28
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->actualAmount:D

    .line 29
    .line 30
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 31
    .line 32
    .line 33
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 34
    .line 35
    if-eqz p0, :cond_2

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
    :cond_2
    const/4 p0, 0x6

    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->createdTime:D

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x7

    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/Balance;->updatedTime:D

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->failedReason:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_3

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->otherUserName:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz p0, :cond_4

    .line 69
    .line 70
    const/16 v0, 0x9

    .line 71
    .line 72
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const/16 v0, 0xa

    .line 80
    .line 81
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 82
    .line 83
    .line 84
    move-result p0

    .line 85
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 86
    .line 87
    .line 88
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->operation:Lcom/p1/mobile/putong/core/data/BalanceOpsType;

    .line 89
    .line 90
    if-eqz p0, :cond_6

    .line 91
    .line 92
    const/16 v0, 0xb

    .line 93
    .line 94
    sget-object v1, Lcom/p1/mobile/putong/core/data/BalanceOpsType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->status:Lcom/p1/mobile/putong/core/data/BalanceStatusType;

    .line 100
    .line 101
    if-eqz p0, :cond_7

    .line 102
    .line 103
    const/16 v0, 0xc

    .line 104
    .line 105
    sget-object v1, Lcom/p1/mobile/putong/core/data/BalanceStatusType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 108
    .line 109
    .line 110
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/Balance;->giftType:Lcom/p1/mobile/putong/core/data/RedPacketGiftType;

    .line 111
    .line 112
    if-eqz p0, :cond_8

    .line 113
    .line 114
    const/16 p1, 0xd

    .line 115
    .line 116
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacketGiftType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 119
    .line 120
    .line 121
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

    .line 122
    check-cast p1, Lcom/p1/mobile/putong/core/data/Balance;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/Balance$1;->serialize(Lcom/p1/mobile/putong/core/data/Balance;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
