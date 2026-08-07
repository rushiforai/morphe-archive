.class Lcom/p1/mobile/putong/data/UserLiveState$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/UserLiveState;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/UserLiveState;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/UserLiveState;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-static {v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 11
    .line 12
    .line 13
    move-result p0

    .line 14
    goto :goto_0

    .line 15
    :cond_0
    const/4 p0, 0x0

    .line 16
    :goto_0
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->liveId:Ljava/lang/String;

    .line 17
    .line 18
    if-eqz v0, :cond_1

    .line 19
    .line 20
    const/4 v1, 0x2

    .line 21
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    sget-object v2, Lcom/p1/mobile/putong/data/UserLiveCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 32
    .line 33
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    sget-object v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 44
    .line 45
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    add-int/2addr p0, v0

    .line 50
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 66
    .line 67
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 85
    .line 86
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveState;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserLiveState$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/UserLiveState;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserLiveState;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/UserLiveState;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/UserLiveState;-><init>()V

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
    if-eqz v2, :cond_b

    .line 15
    .line 16
    const/16 v4, 0x8

    .line 17
    .line 18
    if-eq v2, v4, :cond_a

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_9

    .line 23
    .line 24
    const/16 v4, 0x1a

    .line 25
    .line 26
    if-eq v2, v4, :cond_8

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_7

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_6

    .line 35
    .line 36
    const/16 v4, 0x32

    .line 37
    .line 38
    if-eq v2, v4, :cond_5

    .line 39
    .line 40
    const/16 v4, 0x3a

    .line 41
    .line 42
    if-eq v2, v4, :cond_4

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveCallInfo;->new_()Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 69
    .line 70
    .line 71
    move-result-object p1

    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 75
    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveLabel;->new_()Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 83
    .line 84
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_3

    .line 87
    .line 88
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

    .line 89
    .line 90
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 91
    .line 92
    if-nez p1, :cond_10

    .line 93
    .line 94
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->new_()Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 95
    .line 96
    .line 97
    move-result-object p1

    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 104
    .line 105
    .line 106
    move-result-object v2

    .line 107
    check-cast v2, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 108
    .line 109
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 115
    .line 116
    .line 117
    move-result-object v2

    .line 118
    check-cast v2, Lcom/p1/mobile/putong/data/LiveState;

    .line 119
    .line 120
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 121
    .line 122
    goto :goto_0

    .line 123
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 124
    .line 125
    .line 126
    move-result-object v2

    .line 127
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

    .line 128
    .line 129
    goto :goto_0

    .line 130
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/data/UserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v2

    .line 136
    check-cast v2, Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 137
    .line 138
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/data/UserLiveCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    check-cast v2, Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 149
    .line 150
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iput-object v2, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveId:Ljava/lang/String;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 163
    .line 164
    .line 165
    move-result v1

    .line 166
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 167
    .line 168
    .line 169
    move-result-object v1

    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 173
    .line 174
    if-nez p1, :cond_c

    .line 175
    .line 176
    if-eqz v1, :cond_c

    .line 177
    .line 178
    sget-object p1, Lcom/p1/mobile/putong/data/LiveState;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 179
    .line 180
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 181
    .line 182
    .line 183
    move-result v1

    .line 184
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 185
    .line 186
    .line 187
    move-result-object p1

    .line 188
    check-cast p1, Lcom/p1/mobile/putong/data/LiveState;

    .line 189
    .line 190
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 191
    .line 192
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 193
    .line 194
    if-nez p1, :cond_d

    .line 195
    .line 196
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveCallInfo;->new_()Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 197
    .line 198
    .line 199
    move-result-object p1

    .line 200
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 201
    .line 202
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 203
    .line 204
    if-nez p1, :cond_e

    .line 205
    .line 206
    invoke-static {}, Lcom/p1/mobile/putong/data/UserLiveLabel;->new_()Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 211
    .line 212
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

    .line 213
    .line 214
    if-nez p1, :cond_f

    .line 215
    .line 216
    iput-object v3, p0, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

    .line 217
    .line 218
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 219
    .line 220
    if-nez p1, :cond_10

    .line 221
    .line 222
    invoke-static {}, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->new_()Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 223
    .line 224
    .line 225
    move-result-object p1

    .line 226
    iput-object p1, p0, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 227
    .line 228
    :cond_10
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 229
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/UserLiveState$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/UserLiveState;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/UserLiveState;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 2
    .line 3
    if-eqz p0, :cond_0

    .line 4
    .line 5
    const/4 v0, 0x1

    .line 6
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 7
    .line 8
    .line 9
    move-result p0

    .line 10
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 11
    .line 12
    .line 13
    :cond_0
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->liveId:Ljava/lang/String;

    .line 14
    .line 15
    if-eqz p0, :cond_1

    .line 16
    .line 17
    const/4 v0, 0x2

    .line 18
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 19
    .line 20
    .line 21
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->callInfo:Lcom/p1/mobile/putong/data/UserLiveCallInfo;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    sget-object v1, Lcom/p1/mobile/putong/data/UserLiveCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->liveLabel:Lcom/p1/mobile/putong/data/UserLiveLabel;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    sget-object v1, Lcom/p1/mobile/putong/data/UserLiveLabel;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 37
    .line 38
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->cityId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->state:Lcom/p1/mobile/putong/data/LiveState;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/data/LiveState;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/UserLiveState;->multiCallInfo:Lcom/p1/mobile/putong/data/LiveMultiCallInfo;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 p1, 0x7

    .line 64
    sget-object v0, Lcom/p1/mobile/putong/data/LiveMultiCallInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
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

    .line 70
    check-cast p1, Lcom/p1/mobile/putong/data/UserLiveState;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/UserLiveState$1;->serialize(Lcom/p1/mobile/putong/data/UserLiveState;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
