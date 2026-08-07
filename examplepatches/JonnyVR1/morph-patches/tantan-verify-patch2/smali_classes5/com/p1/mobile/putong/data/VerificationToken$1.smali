.class Lcom/p1/mobile/putong/data/VerificationToken$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VerificationToken;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VerificationToken;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VerificationToken;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz v0, :cond_4

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 53
    .line 54
    if-eqz v0, :cond_5

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_6

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 73
    .line 74
    if-eqz v0, :cond_7

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    sget-object v2, Lcom/p1/mobile/putong/data/TencentToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 79
    .line 80
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz v0, :cond_8

    .line 88
    .line 89
    const/16 v1, 0x9

    .line 90
    .line 91
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_8
    const/16 v0, 0xa

    .line 97
    .line 98
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->omitLiveData:Z

    .line 99
    .line 100
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    const/16 v0, 0xb

    .line 106
    .line 107
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VerificationToken;->withPV:Z

    .line 108
    .line 109
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 115
    .line 116
    if-eqz v0, :cond_9

    .line 117
    .line 118
    const/16 v1, 0xc

    .line 119
    .line 120
    sget-object v2, Lcom/p1/mobile/putong/data/ReflectResponse;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 128
    .line 129
    if-eqz v0, :cond_a

    .line 130
    .line 131
    const/16 v1, 0xd

    .line 132
    .line 133
    sget-object v2, Lcom/p1/mobile/putong/data/VolcEngineProToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->bizSeq:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz v0, :cond_b

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
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->transactionId:Ljava/lang/String;

    .line 152
    .line 153
    if-eqz v0, :cond_c

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
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 163
    .line 164
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 165
    check-cast p1, Lcom/p1/mobile/putong/data/VerificationToken;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerificationToken$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VerificationToken;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerificationToken;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VerificationToken;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VerificationToken;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 62
    .line 63
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 64
    .line 65
    if-nez p1, :cond_10

    .line 66
    .line 67
    invoke-static {}, Lcom/p1/mobile/putong/data/ReflectResponse;->new_()Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 68
    .line 69
    .line 70
    move-result-object p1

    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 72
    .line 73
    return-object p0

    .line 74
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->transactionId:Ljava/lang/String;

    .line 79
    .line 80
    goto :goto_0

    .line 81
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 82
    .line 83
    .line 84
    move-result-object v0

    .line 85
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->bizSeq:Ljava/lang/String;

    .line 86
    .line 87
    goto :goto_0

    .line 88
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/VolcEngineProToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/ReflectResponse;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->withPV:Z

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->omitLiveData:Z

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_7
    sget-object v0, Lcom/p1/mobile/putong/data/TencentToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/data/TencentToken;

    .line 138
    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 168
    .line 169
    .line 170
    move-result-object v0

    .line 171
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 172
    .line 173
    goto/16 :goto_0

    .line 174
    .line 175
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 176
    .line 177
    .line 178
    move-result-object v0

    .line 179
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 180
    .line 181
    goto/16 :goto_0

    .line 182
    .line 183
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 184
    .line 185
    .line 186
    move-result-object v0

    .line 187
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 188
    .line 189
    goto/16 :goto_0

    .line 190
    .line 191
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 192
    .line 193
    .line 194
    move-result-object v0

    .line 195
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_8

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

    .line 204
    .line 205
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 206
    .line 207
    if-nez p1, :cond_9

    .line 208
    .line 209
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

    .line 210
    .line 211
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 212
    .line 213
    if-nez p1, :cond_a

    .line 214
    .line 215
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

    .line 216
    .line 217
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 218
    .line 219
    if-nez p1, :cond_b

    .line 220
    .line 221
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 222
    .line 223
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 224
    .line 225
    if-nez p1, :cond_c

    .line 226
    .line 227
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 228
    .line 229
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 230
    .line 231
    if-nez p1, :cond_d

    .line 232
    .line 233
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 234
    .line 235
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 236
    .line 237
    if-nez p1, :cond_e

    .line 238
    .line 239
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 240
    .line 241
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_f

    .line 244
    .line 245
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 246
    .line 247
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 248
    .line 249
    if-nez p1, :cond_10

    .line 250
    .line 251
    invoke-static {}, Lcom/p1/mobile/putong/data/ReflectResponse;->new_()Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 252
    .line 253
    .line 254
    move-result-object p1

    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 256
    .line 257
    :cond_10
    return-object p0

    .line 258
    nop

    .line 259
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_f
        0xa -> :sswitch_e
        0x12 -> :sswitch_d
        0x1a -> :sswitch_c
        0x22 -> :sswitch_b
        0x2a -> :sswitch_a
        0x32 -> :sswitch_9
        0x3a -> :sswitch_8
        0x42 -> :sswitch_7
        0x4a -> :sswitch_6
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

    .line 259
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerificationToken$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerificationToken;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->uid:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->verifyType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->provider:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->token:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->bizId:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 39
    .line 40
    .line 41
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->expiredTime:Ljava/lang/String;

    .line 42
    .line 43
    if-eqz p0, :cond_5

    .line 44
    .line 45
    const/4 v0, 0x6

    .line 46
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 47
    .line 48
    .line 49
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->userId:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_6

    .line 52
    .line 53
    const/4 v0, 0x7

    .line 54
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->tencentToken:Lcom/p1/mobile/putong/data/TencentToken;

    .line 58
    .line 59
    if-eqz p0, :cond_7

    .line 60
    .line 61
    const/16 v0, 0x8

    .line 62
    .line 63
    sget-object v1, Lcom/p1/mobile/putong/data/TencentToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->certifyId:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_8

    .line 71
    .line 72
    const/16 v0, 0x9

    .line 73
    .line 74
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_8
    const/16 p0, 0xa

    .line 78
    .line 79
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->omitLiveData:Z

    .line 80
    .line 81
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 82
    .line 83
    .line 84
    const/16 p0, 0xb

    .line 85
    .line 86
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->withPV:Z

    .line 87
    .line 88
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 89
    .line 90
    .line 91
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->response:Lcom/p1/mobile/putong/data/ReflectResponse;

    .line 92
    .line 93
    if-eqz p0, :cond_9

    .line 94
    .line 95
    const/16 v0, 0xc

    .line 96
    .line 97
    sget-object v1, Lcom/p1/mobile/putong/data/ReflectResponse;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 100
    .line 101
    .line 102
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->volcEngineProToken:Lcom/p1/mobile/putong/data/VolcEngineProToken;

    .line 103
    .line 104
    if-eqz p0, :cond_a

    .line 105
    .line 106
    const/16 v0, 0xd

    .line 107
    .line 108
    sget-object v1, Lcom/p1/mobile/putong/data/VolcEngineProToken;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 109
    .line 110
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 111
    .line 112
    .line 113
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->bizSeq:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz p0, :cond_b

    .line 116
    .line 117
    const/16 v0, 0xe

    .line 118
    .line 119
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 120
    .line 121
    .line 122
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationToken;->transactionId:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p0, :cond_c

    .line 125
    .line 126
    const/16 p1, 0xf

    .line 127
    .line 128
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

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
    check-cast p1, Lcom/p1/mobile/putong/data/VerificationToken;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VerificationToken$1;->serialize(Lcom/p1/mobile/putong/data/VerificationToken;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
