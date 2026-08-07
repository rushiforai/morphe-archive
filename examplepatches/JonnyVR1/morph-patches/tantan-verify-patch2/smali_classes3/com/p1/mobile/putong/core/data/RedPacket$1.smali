.class Lcom/p1/mobile/putong/core/data/RedPacket$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/RedPacket;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/RedPacket;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/RedPacket;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 18
    .line 19
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    const/4 v0, 0x4

    .line 37
    iget v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 38
    .line 39
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    const/4 v0, 0x5

    .line 45
    iget v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_3

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    const/4 v1, 0x7

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_5

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
    :cond_5
    const/16 v0, 0x9

    .line 84
    .line 85
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 86
    .line 87
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    const/16 v0, 0xa

    .line 93
    .line 94
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 95
    .line 96
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    const/16 v0, 0xb

    .line 102
    .line 103
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 104
    .line 105
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 111
    .line 112
    if-eqz v0, :cond_6

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const/16 v2, 0xc

    .line 121
    .line 122
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 128
    .line 129
    if-eqz v0, :cond_7

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    sget-object v2, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/2addr p0, v0

    .line 140
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz v0, :cond_8

    .line 143
    .line 144
    const/16 v1, 0xe

    .line 145
    .line 146
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 147
    .line 148
    .line 149
    move-result v0

    .line 150
    add-int/2addr p0, v0

    .line 151
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v0, :cond_9

    .line 154
    .line 155
    const/16 v1, 0xf

    .line 156
    .line 157
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 158
    .line 159
    .line 160
    move-result v0

    .line 161
    add-int/2addr p0, v0

    .line 162
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 163
    .line 164
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacket;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/RedPacket$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/RedPacket;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/RedPacket;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/RedPacket;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/RedPacket;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->new_()Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->new_()Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 36
    .line 37
    .line 38
    move-result-object p1

    .line 39
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 40
    .line 41
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 42
    .line 43
    if-nez p1, :cond_3

    .line 44
    .line 45
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 46
    .line 47
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 48
    .line 49
    if-nez p1, :cond_4

    .line 50
    .line 51
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 52
    .line 53
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 54
    .line 55
    if-nez p1, :cond_5

    .line 56
    .line 57
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 58
    .line 59
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 60
    .line 61
    if-nez p1, :cond_6

    .line 62
    .line 63
    new-instance p1, Ljava/util/ArrayList;

    .line 64
    .line 65
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 66
    .line 67
    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 69
    .line 70
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 71
    .line 72
    if-nez p1, :cond_e

    .line 73
    .line 74
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->new_()Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 75
    .line 76
    .line 77
    move-result-object p1

    .line 78
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 79
    .line 80
    return-object p0

    .line 81
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 89
    .line 90
    .line 91
    move-result-object v0

    .line 92
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 93
    .line 94
    goto :goto_0

    .line 95
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    check-cast v0, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 102
    .line 103
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 104
    .line 105
    goto :goto_0

    .line 106
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    .line 111
    move-result-object v0

    .line 112
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    check-cast v0, Ljava/util/List;

    .line 117
    .line 118
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 122
    .line 123
    .line 124
    move-result-wide v0

    .line 125
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 126
    .line 127
    goto :goto_0

    .line 128
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 129
    .line 130
    .line 131
    move-result-wide v0

    .line 132
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 137
    .line 138
    .line 139
    move-result-wide v0

    .line 140
    iput-wide v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v0

    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v0

    .line 156
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v0

    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 169
    .line 170
    .line 171
    move-result v0

    .line 172
    iput v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 177
    .line 178
    .line 179
    move-result v0

    .line 180
    iput v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_c
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 187
    .line 188
    .line 189
    move-result-object v0

    .line 190
    check-cast v0, Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 191
    .line 192
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 193
    .line 194
    goto/16 :goto_0

    .line 195
    .line 196
    :sswitch_d
    sget-object v0, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 197
    .line 198
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 199
    .line 200
    .line 201
    move-result-object v0

    .line 202
    check-cast v0, Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 203
    .line 204
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v0

    .line 212
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :sswitch_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 217
    .line 218
    if-nez p1, :cond_7

    .line 219
    .line 220
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

    .line 221
    .line 222
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 223
    .line 224
    if-nez p1, :cond_8

    .line 225
    .line 226
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->new_()Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 231
    .line 232
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 233
    .line 234
    if-nez p1, :cond_9

    .line 235
    .line 236
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->new_()Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 237
    .line 238
    .line 239
    move-result-object p1

    .line 240
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 241
    .line 242
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 243
    .line 244
    if-nez p1, :cond_a

    .line 245
    .line 246
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 247
    .line 248
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 249
    .line 250
    if-nez p1, :cond_b

    .line 251
    .line 252
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 253
    .line 254
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 255
    .line 256
    if-nez p1, :cond_c

    .line 257
    .line 258
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 259
    .line 260
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 261
    .line 262
    if-nez p1, :cond_d

    .line 263
    .line 264
    new-instance p1, Ljava/util/ArrayList;

    .line 265
    .line 266
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 267
    .line 268
    .line 269
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 270
    .line 271
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 272
    .line 273
    if-nez p1, :cond_e

    .line 274
    .line 275
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->new_()Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 276
    .line 277
    .line 278
    move-result-object p1

    .line 279
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 280
    .line 281
    :cond_e
    return-object p0

    .line 282
    nop

    .line 283
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_f
        0xa -> :sswitch_e
        0x12 -> :sswitch_d
        0x1a -> :sswitch_c
        0x20 -> :sswitch_b
        0x28 -> :sswitch_a
        0x32 -> :sswitch_9
        0x3a -> :sswitch_8
        0x42 -> :sswitch_7
        0x48 -> :sswitch_6
        0x50 -> :sswitch_5
        0x58 -> :sswitch_4
        0x62 -> :sswitch_3
        0x6a -> :sswitch_2
        0x72 -> :sswitch_1
        0x7a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 283
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/RedPacket$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/RedPacket;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/RedPacket;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->owner:Lcom/p1/mobile/putong/core/data/RedPacketOwner;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/RedPacketOwner;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->showInfo:Lcom/p1/mobile/putong/core/data/RedPacketInfo;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/core/data/RedPacketInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    const/4 p0, 0x4

    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->quantity:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    const/4 p0, 0x5

    .line 36
    iget v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignQuantity:I

    .line 37
    .line 38
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->totalAmount:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_3

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->assignAmount:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->splitType:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_5
    const/16 p0, 0x9

    .line 67
    .line 68
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->payExpireTime:J

    .line 69
    .line 70
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 71
    .line 72
    .line 73
    const/16 p0, 0xa

    .line 74
    .line 75
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->expireTime:J

    .line 76
    .line 77
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 78
    .line 79
    .line 80
    const/16 p0, 0xb

    .line 81
    .line 82
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->createTime:J

    .line 83
    .line 84
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 85
    .line 86
    .line 87
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->receiveRecords:Ljava/util/List;

    .line 88
    .line 89
    if-eqz p0, :cond_6

    .line 90
    .line 91
    sget-object v0, Lcom/p1/mobile/putong/core/data/ReceiveRecords;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    const/16 v1, 0xc

    .line 98
    .line 99
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->myInfo:Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;

    .line 103
    .line 104
    if-eqz p0, :cond_7

    .line 105
    .line 106
    const/16 v0, 0xd

    .line 107
    .line 108
    sget-object v1, Lcom/p1/mobile/putong/core/data/RedPacketMyInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->paySign:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz p0, :cond_8

    .line 116
    .line 117
    const/16 v0, 0xe

    .line 118
    .line 119
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/RedPacket;->status:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p0, :cond_9

    .line 125
    .line 126
    const/16 p1, 0xf

    .line 127
    .line 128
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_9
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
    check-cast p1, Lcom/p1/mobile/putong/core/data/RedPacket;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/RedPacket$1;->serialize(Lcom/p1/mobile/putong/core/data/RedPacket;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
