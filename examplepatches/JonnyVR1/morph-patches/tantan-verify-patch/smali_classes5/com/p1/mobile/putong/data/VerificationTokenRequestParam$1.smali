.class Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    sget-object v2, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 50
    .line 51
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_5

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_6
    const/16 v0, 0x8

    .line 77
    .line 78
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->enableVolcEnginePro:Z

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    const/16 v0, 0x9

    .line 86
    .line 87
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    .line 88
    .line 89
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 90
    .line 91
    .line 92
    move-result v0

    .line 93
    add-int/2addr p0, v0

    .line 94
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 95
    .line 96
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;-><init>()V

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
    if-eqz v0, :cond_f

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_e

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_d

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_c

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_b

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_a

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_9

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_8

    .line 41
    .line 42
    const/16 v2, 0x40

    .line 43
    .line 44
    if-eq v0, v2, :cond_7

    .line 45
    .line 46
    const/16 v2, 0x48

    .line 47
    .line 48
    if-eq v0, v2, :cond_6

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 67
    .line 68
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 69
    .line 70
    if-nez p1, :cond_3

    .line 71
    .line 72
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 73
    .line 74
    .line 75
    move-result-object p1

    .line 76
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 77
    .line 78
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 79
    .line 80
    if-nez p1, :cond_4

    .line 81
    .line 82
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 87
    .line 88
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_5

    .line 91
    .line 92
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 93
    .line 94
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 95
    .line 96
    if-nez p1, :cond_16

    .line 97
    .line 98
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 99
    .line 100
    return-object p0

    .line 101
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 102
    .line 103
    .line 104
    move-result v0

    .line 105
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    .line 106
    .line 107
    goto :goto_0

    .line 108
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->enableVolcEnginePro:Z

    .line 113
    .line 114
    goto :goto_0

    .line 115
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 116
    .line 117
    .line 118
    move-result-object v0

    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 127
    .line 128
    goto :goto_0

    .line 129
    :cond_a
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v0

    .line 135
    check-cast v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 136
    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_b
    sget-object v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    check-cast v0, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 148
    .line 149
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 154
    .line 155
    .line 156
    move-result-object v0

    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 178
    .line 179
    if-nez p1, :cond_10

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

    .line 182
    .line 183
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 184
    .line 185
    if-nez p1, :cond_11

    .line 186
    .line 187
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

    .line 188
    .line 189
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 190
    .line 191
    if-nez p1, :cond_12

    .line 192
    .line 193
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

    .line 194
    .line 195
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 196
    .line 197
    if-nez p1, :cond_13

    .line 198
    .line 199
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 200
    .line 201
    .line 202
    move-result-object p1

    .line 203
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 204
    .line 205
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 206
    .line 207
    if-nez p1, :cond_14

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->new_()Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 214
    .line 215
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 216
    .line 217
    if-nez p1, :cond_15

    .line 218
    .line 219
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 220
    .line 221
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 222
    .line 223
    if-nez p1, :cond_16

    .line 224
    .line 225
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 226
    .line 227
    :cond_16
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 228
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->appId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->productId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->verifyType:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->identity:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->picture:Lcom/p1/mobile/putong/data/VerificationTokenIdentity;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    sget-object v1, Lcom/p1/mobile/putong/data/VerificationTokenIdentity;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 41
    .line 42
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->region:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_5

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->retrieveId:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_6
    const/16 p0, 0x8

    .line 62
    .line 63
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->enableVolcEnginePro:Z

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 66
    .line 67
    .line 68
    const/16 p0, 0x9

    .line 69
    .line 70
    iget-boolean p1, p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;->newProcess:Z

    .line 71
    .line 72
    invoke-virtual {p2, p0, p1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 73
    .line 74
    .line 75
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 76
    check-cast p1, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VerificationTokenRequestParam$1;->serialize(Lcom/p1/mobile/putong/data/VerificationTokenRequestParam;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
