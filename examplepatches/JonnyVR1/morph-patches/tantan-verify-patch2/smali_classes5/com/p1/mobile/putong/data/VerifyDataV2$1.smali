.class Lcom/p1/mobile/putong/data/VerifyDataV2$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VerifyDataV2;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VerifyDataV2;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VerifyDataV2;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 19
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 20
    .line 21
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 22
    .line 23
    .line 24
    move-result v0

    .line 25
    add-int/2addr p0, v0

    .line 26
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_1

    .line 29
    .line 30
    const/4 v1, 0x4

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 37
    .line 38
    if-eqz v0, :cond_2

    .line 39
    .line 40
    const/4 v1, 0x5

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
    :cond_2
    const/4 v0, 0x6

    .line 51
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 52
    .line 53
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 59
    .line 60
    if-eqz v0, :cond_3

    .line 61
    .line 62
    const/4 v1, 0x7

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz v0, :cond_4

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 82
    .line 83
    if-eqz v0, :cond_5

    .line 84
    .line 85
    const/16 v1, 0x9

    .line 86
    .line 87
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz v0, :cond_6

    .line 95
    .line 96
    const/16 v1, 0xa

    .line 97
    .line 98
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 99
    .line 100
    .line 101
    move-result v0

    .line 102
    add-int/2addr p0, v0

    .line 103
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 104
    .line 105
    if-eqz v0, :cond_7

    .line 106
    .line 107
    const/16 v1, 0xb

    .line 108
    .line 109
    sget-object v2, Lcom/p1/mobile/putong/data/VerifyReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 110
    .line 111
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 112
    .line 113
    .line 114
    move-result v0

    .line 115
    add-int/2addr p0, v0

    .line 116
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 117
    .line 118
    if-eqz v0, :cond_8

    .line 119
    .line 120
    const/16 v1, 0xc

    .line 121
    .line 122
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 128
    .line 129
    if-eqz v0, :cond_9

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 134
    .line 135
    .line 136
    move-result v0

    .line 137
    add-int/2addr p0, v0

    .line 138
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 139
    .line 140
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyDataV2;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerifyDataV2$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VerifyDataV2;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerifyDataV2;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VerifyDataV2;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VerifyDataV2;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    sget-object p1, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/data/Device;->new_()Lcom/p1/mobile/putong/data/Device;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 84
    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 90
    .line 91
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_8

    .line 94
    .line 95
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 96
    .line 97
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 98
    .line 99
    if-nez p1, :cond_12

    .line 100
    .line 101
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 102
    .line 103
    return-object p0

    .line 104
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 105
    .line 106
    .line 107
    move-result-object v2

    .line 108
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 112
    .line 113
    .line 114
    move-result-object v2

    .line 115
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/data/VerifyReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 121
    .line 122
    .line 123
    move-result-object v2

    .line 124
    check-cast v2, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 125
    .line 126
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 130
    .line 131
    .line 132
    move-result-object v2

    .line 133
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 134
    .line 135
    goto :goto_0

    .line 136
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 137
    .line 138
    .line 139
    move-result-object v2

    .line 140
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 145
    .line 146
    .line 147
    move-result-object v2

    .line 148
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    check-cast v2, Lcom/p1/mobile/putong/data/Device;

    .line 159
    .line 160
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 165
    .line 166
    .line 167
    move-result v2

    .line 168
    iput v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 173
    .line 174
    .line 175
    move-result v1

    .line 176
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 177
    .line 178
    .line 179
    move-result-object v1

    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 183
    .line 184
    .line 185
    move-result-object v2

    .line 186
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 187
    .line 188
    goto/16 :goto_0

    .line 189
    .line 190
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 191
    .line 192
    .line 193
    move-result v2

    .line 194
    iput v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 199
    .line 200
    .line 201
    move-result-object v2

    .line 202
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    iput v2, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 211
    .line 212
    goto/16 :goto_0

    .line 213
    .line 214
    :sswitch_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 215
    .line 216
    if-nez p1, :cond_9

    .line 217
    .line 218
    if-eqz v1, :cond_9

    .line 219
    .line 220
    sget-object p1, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 221
    .line 222
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 223
    .line 224
    .line 225
    move-result v1

    .line 226
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 231
    .line 232
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 233
    .line 234
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 235
    .line 236
    if-nez p1, :cond_a

    .line 237
    .line 238
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

    .line 239
    .line 240
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 241
    .line 242
    if-nez p1, :cond_b

    .line 243
    .line 244
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 245
    .line 246
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 247
    .line 248
    if-nez p1, :cond_c

    .line 249
    .line 250
    sget-object p1, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 251
    .line 252
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 253
    .line 254
    .line 255
    move-result-object p1

    .line 256
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 257
    .line 258
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 259
    .line 260
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 261
    .line 262
    if-nez p1, :cond_d

    .line 263
    .line 264
    invoke-static {}, Lcom/p1/mobile/putong/data/Device;->new_()Lcom/p1/mobile/putong/data/Device;

    .line 265
    .line 266
    .line 267
    move-result-object p1

    .line 268
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 269
    .line 270
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_e

    .line 273
    .line 274
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 275
    .line 276
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 277
    .line 278
    if-nez p1, :cond_f

    .line 279
    .line 280
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 281
    .line 282
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 283
    .line 284
    if-nez p1, :cond_10

    .line 285
    .line 286
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 287
    .line 288
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 289
    .line 290
    if-nez p1, :cond_11

    .line 291
    .line 292
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 293
    .line 294
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 295
    .line 296
    if-nez p1, :cond_12

    .line 297
    .line 298
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 299
    .line 300
    :cond_12
    return-object p0

    .line 301
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_d
        0x8 -> :sswitch_c
        0x12 -> :sswitch_b
        0x18 -> :sswitch_a
        0x22 -> :sswitch_9
        0x28 -> :sswitch_8
        0x30 -> :sswitch_7
        0x3a -> :sswitch_6
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

    .line 301
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerifyDataV2$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerifyDataV2;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->countryCode:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->mobileNumber:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 16
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->code:I

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->language:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_1

    .line 24
    .line 25
    const/4 v0, 0x4

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 30
    .line 31
    if-eqz p0, :cond_2

    .line 32
    .line 33
    const/4 v0, 0x5

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
    :cond_2
    const/4 p0, 0x6

    .line 42
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->codeLength:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->device:Lcom/p1/mobile/putong/data/Device;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->clientId:Ljava/lang/String;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 64
    .line 65
    .line 66
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->category:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz p0, :cond_5

    .line 69
    .line 70
    const/16 v0, 0x9

    .line 71
    .line 72
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 73
    .line 74
    .line 75
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->userId:Ljava/lang/String;

    .line 76
    .line 77
    if-eqz p0, :cond_6

    .line 78
    .line 79
    const/16 v0, 0xa

    .line 80
    .line 81
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 82
    .line 83
    .line 84
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 85
    .line 86
    if-eqz p0, :cond_7

    .line 87
    .line 88
    const/16 v0, 0xb

    .line 89
    .line 90
    sget-object v1, Lcom/p1/mobile/putong/data/VerifyReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 91
    .line 92
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 93
    .line 94
    .line 95
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->email:Ljava/lang/String;

    .line 96
    .line 97
    if-eqz p0, :cond_8

    .line 98
    .line 99
    const/16 v0, 0xc

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 102
    .line 103
    .line 104
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyDataV2;->ttt_signin_token:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz p0, :cond_9

    .line 107
    .line 108
    const/16 p1, 0xd

    .line 109
    .line 110
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 111
    .line 112
    .line 113
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

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyDataV2;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VerifyDataV2$1;->serialize(Lcom/p1/mobile/putong/data/VerifyDataV2;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
