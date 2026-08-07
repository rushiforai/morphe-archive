.class Lcom/p1/mobile/putong/core/data/VerificationCenter$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/VerificationCenter;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/VerificationCenter;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/VerificationCenter;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 19
    .line 20
    if-eqz v0, :cond_1

    .line 21
    .line 22
    const/16 v1, 0x33

    .line 23
    .line 24
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 25
    .line 26
    .line 27
    move-result v0

    .line 28
    add-int/2addr p0, v0

    .line 29
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz v0, :cond_2

    .line 32
    .line 33
    const/16 v1, 0x34

    .line 34
    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/16 v1, 0x35

    .line 45
    .line 46
    sget-object v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 49
    .line 50
    .line 51
    move-result v0

    .line 52
    add-int/2addr p0, v0

    .line 53
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 54
    .line 55
    if-eqz v0, :cond_4

    .line 56
    .line 57
    const/16 v1, 0x36

    .line 58
    .line 59
    sget-object v2, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 67
    .line 68
    if-eqz v0, :cond_5

    .line 69
    .line 70
    const/16 v1, 0x37

    .line 71
    .line 72
    sget-object v2, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 75
    .line 76
    .line 77
    move-result v0

    .line 78
    add-int/2addr p0, v0

    .line 79
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 80
    .line 81
    if-eqz v0, :cond_6

    .line 82
    .line 83
    const/16 v1, 0x38

    .line 84
    .line 85
    sget-object v2, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 86
    .line 87
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 88
    .line 89
    .line 90
    move-result v0

    .line 91
    add-int/2addr p0, v0

    .line 92
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 93
    .line 94
    if-eqz v0, :cond_7

    .line 95
    .line 96
    const/16 v1, 0x39

    .line 97
    .line 98
    sget-object v2, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 99
    .line 100
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 101
    .line 102
    .line 103
    move-result v0

    .line 104
    add-int/2addr p0, v0

    .line 105
    :cond_7
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 106
    .line 107
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 108
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/VerificationCenter;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/VerificationCenter;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/VerificationCenter;-><init>()V

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
    const/16 v2, 0x8

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
    const/16 v2, 0x19a

    .line 23
    .line 24
    if-eq v0, v2, :cond_b

    .line 25
    .line 26
    const/16 v2, 0x1a2

    .line 27
    .line 28
    if-eq v0, v2, :cond_a

    .line 29
    .line 30
    const/16 v2, 0x1aa

    .line 31
    .line 32
    if-eq v0, v2, :cond_9

    .line 33
    .line 34
    const/16 v2, 0x1b2

    .line 35
    .line 36
    if-eq v0, v2, :cond_8

    .line 37
    .line 38
    const/16 v2, 0x1ba

    .line 39
    .line 40
    if-eq v0, v2, :cond_7

    .line 41
    .line 42
    const/16 v2, 0x1c2

    .line 43
    .line 44
    if-eq v0, v2, :cond_6

    .line 45
    .line 46
    const/16 v2, 0x1ca

    .line 47
    .line 48
    if-eq v0, v2, :cond_5

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 67
    .line 68
    .line 69
    move-result-object p1

    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 77
    .line 78
    .line 79
    move-result-object p1

    .line 80
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 81
    .line 82
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 83
    .line 84
    if-nez p1, :cond_4

    .line 85
    .line 86
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->new_()Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 93
    .line 94
    if-nez p1, :cond_14

    .line 95
    .line 96
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 101
    .line 102
    return-object p0

    .line 103
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 106
    .line 107
    .line 108
    move-result-object v0

    .line 109
    check-cast v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 110
    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 186
    .line 187
    .line 188
    move-result-wide v0

    .line 189
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 194
    .line 195
    if-nez p1, :cond_f

    .line 196
    .line 197
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 198
    .line 199
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_10

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 204
    .line 205
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 206
    .line 207
    if-nez p1, :cond_11

    .line 208
    .line 209
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 214
    .line 215
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 216
    .line 217
    if-nez p1, :cond_12

    .line 218
    .line 219
    invoke-static {}, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 220
    .line 221
    .line 222
    move-result-object p1

    .line 223
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 224
    .line 225
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 226
    .line 227
    if-nez p1, :cond_13

    .line 228
    .line 229
    invoke-static {}, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->new_()Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 234
    .line 235
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 236
    .line 237
    if-nez p1, :cond_14

    .line 238
    .line 239
    invoke-static {}, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->new_()Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 240
    .line 241
    .line 242
    move-result-object p1

    .line 243
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 244
    .line 245
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

    .line 246
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/VerificationCenter$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/VerificationCenter;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->userId:Ljava/lang/String;

    .line 16
    .line 17
    if-eqz p0, :cond_1

    .line 18
    .line 19
    const/16 v0, 0x33

    .line 20
    .line 21
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 22
    .line 23
    .line 24
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->verificationType:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz p0, :cond_2

    .line 27
    .line 28
    const/16 v0, 0x34

    .line 29
    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->picVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/16 v0, 0x35

    .line 38
    .line 39
    sget-object v1, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 42
    .line 43
    .line 44
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->idCard:Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;

    .line 45
    .line 46
    if-eqz p0, :cond_4

    .line 47
    .line 48
    const/16 v0, 0x36

    .line 49
    .line 50
    sget-object v1, Lcom/p1/mobile/putong/core/data/IdCardVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 53
    .line 54
    .line 55
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ageVerificationInfo:Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;

    .line 56
    .line 57
    if-eqz p0, :cond_5

    .line 58
    .line 59
    const/16 v0, 0x37

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/core/data/AgeVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 64
    .line 65
    .line 66
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->voiceAnchor:Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;

    .line 67
    .line 68
    if-eqz p0, :cond_6

    .line 69
    .line 70
    const/16 v0, 0x38

    .line 71
    .line 72
    sget-object v1, Lcom/p1/mobile/putong/core/data/VoiceAnchorVerifyResult;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 75
    .line 76
    .line 77
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;->ctdidVerificationInfo:Lcom/p1/mobile/putong/core/data/PicVerificationInfo;

    .line 78
    .line 79
    if-eqz p0, :cond_7

    .line 80
    .line 81
    const/16 p1, 0x39

    .line 82
    .line 83
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicVerificationInfo;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 84
    .line 85
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 86
    .line 87
    .line 88
    :cond_7
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 89
    check-cast p1, Lcom/p1/mobile/putong/core/data/VerificationCenter;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/VerificationCenter$1;->serialize(Lcom/p1/mobile/putong/core/data/VerificationCenter;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
