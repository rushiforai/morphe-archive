.class Lcom/p1/mobile/putong/data/Broadcast$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Broadcast;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Broadcast;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Broadcast;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    const/4 v0, 0x4

    .line 41
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

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
    const/4 v0, 0x5

    .line 49
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 50
    .line 51
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    const/4 v0, 0x6

    .line 57
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 58
    .line 59
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_3

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_4

    .line 77
    .line 78
    const/16 v1, 0x8

    .line 79
    .line 80
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_4
    const/16 v0, 0x9

    .line 86
    .line 87
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 88
    .line 89
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 95
    .line 96
    if-eqz v0, :cond_5

    .line 97
    .line 98
    const/16 v1, 0xa

    .line 99
    .line 100
    sget-object v2, Lcom/p1/mobile/putong/data/BroadcastType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 101
    .line 102
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 108
    .line 109
    if-eqz v0, :cond_6

    .line 110
    .line 111
    const/16 v1, 0xb

    .line 112
    .line 113
    sget-object v2, Lcom/p1/mobile/putong/data/BroadcastStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 114
    .line 115
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 121
    .line 122
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 123
    check-cast p1, Lcom/p1/mobile/putong/data/Broadcast;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Broadcast$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Broadcast;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Broadcast;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Broadcast;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Broadcast;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 17
    .line 18
    if-nez p1, :cond_0

    .line 19
    .line 20
    if-eqz v1, :cond_0

    .line 21
    .line 22
    sget-object p1, Lcom/p1/mobile/putong/data/BroadcastType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/BroadcastType;

    .line 33
    .line 34
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 35
    .line 36
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 37
    .line 38
    if-nez p1, :cond_2

    .line 39
    .line 40
    if-eqz v2, :cond_2

    .line 41
    .line 42
    sget-object p1, Lcom/p1/mobile/putong/data/BroadcastStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 53
    .line 54
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 55
    .line 56
    return-object p0

    .line 57
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/data/BroadcastStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 60
    .line 61
    .line 62
    move-result-object v3

    .line 63
    check-cast v3, Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 64
    .line 65
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 66
    .line 67
    goto :goto_0

    .line 68
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/BroadcastType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 69
    .line 70
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 71
    .line 72
    .line 73
    move-result-object v3

    .line 74
    check-cast v3, Lcom/p1/mobile/putong/data/BroadcastType;

    .line 75
    .line 76
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 77
    .line 78
    goto :goto_0

    .line 79
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 80
    .line 81
    .line 82
    move-result-wide v3

    .line 83
    iput-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 84
    .line 85
    goto :goto_0

    .line 86
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v3

    .line 90
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v3

    .line 97
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 101
    .line 102
    .line 103
    move-result-wide v3

    .line 104
    iput-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 105
    .line 106
    goto :goto_0

    .line 107
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 108
    .line 109
    .line 110
    move-result-wide v3

    .line 111
    iput-wide v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 115
    .line 116
    .line 117
    move-result v3

    .line 118
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 119
    .line 120
    goto :goto_0

    .line 121
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 122
    .line 123
    .line 124
    move-result v2

    .line 125
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    goto :goto_0

    .line 130
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 131
    .line 132
    .line 133
    move-result v1

    .line 134
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 135
    .line 136
    .line 137
    move-result-object v1

    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v3

    .line 144
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 149
    .line 150
    if-nez p1, :cond_1

    .line 151
    .line 152
    if-eqz v1, :cond_1

    .line 153
    .line 154
    sget-object p1, Lcom/p1/mobile/putong/data/BroadcastType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 155
    .line 156
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 157
    .line 158
    .line 159
    move-result v1

    .line 160
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    check-cast p1, Lcom/p1/mobile/putong/data/BroadcastType;

    .line 165
    .line 166
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 167
    .line 168
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 169
    .line 170
    if-nez p1, :cond_2

    .line 171
    .line 172
    if-eqz v2, :cond_2

    .line 173
    .line 174
    sget-object p1, Lcom/p1/mobile/putong/data/BroadcastStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 175
    .line 176
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 177
    .line 178
    .line 179
    move-result v1

    .line 180
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    check-cast p1, Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 185
    .line 186
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 187
    .line 188
    :cond_2
    return-object p0

    .line 189
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x10 -> :sswitch_9
        0x18 -> :sswitch_8
        0x20 -> :sswitch_7
        0x29 -> :sswitch_6
        0x30 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
        0x49 -> :sswitch_2
        0x52 -> :sswitch_1
        0x5a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 189
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Broadcast$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Broadcast;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Broadcast;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    :cond_2
    const/4 p0, 0x4

    .line 34
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->active:Z

    .line 35
    .line 36
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 37
    .line 38
    .line 39
    const/4 p0, 0x5

    .line 40
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->expiresTime:D

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 43
    .line 44
    .line 45
    const/4 p0, 0x6

    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->duration:J

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->contentID:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_3

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->customContent:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_4

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    const/16 p0, 0x9

    .line 69
    .line 70
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Broadcast;->checkStartTime:D

    .line 71
    .line 72
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 73
    .line 74
    .line 75
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->type:Lcom/p1/mobile/putong/data/BroadcastType;

    .line 76
    .line 77
    if-eqz p0, :cond_5

    .line 78
    .line 79
    const/16 v0, 0xa

    .line 80
    .line 81
    sget-object v1, Lcom/p1/mobile/putong/data/BroadcastType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 82
    .line 83
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 84
    .line 85
    .line 86
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Broadcast;->status:Lcom/p1/mobile/putong/data/BroadcastStatus;

    .line 87
    .line 88
    if-eqz p0, :cond_6

    .line 89
    .line 90
    const/16 p1, 0xb

    .line 91
    .line 92
    sget-object v0, Lcom/p1/mobile/putong/data/BroadcastStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 93
    .line 94
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 95
    .line 96
    .line 97
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 98
    check-cast p1, Lcom/p1/mobile/putong/data/Broadcast;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Broadcast$1;->serialize(Lcom/p1/mobile/putong/data/Broadcast;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
