.class Lcom/p1/mobile/putong/data/AppealPostData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/AppealPostData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/AppealPostData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/AppealPostData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/data/FaceidLiveData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 30
    .line 31
    .line 32
    move-result v0

    .line 33
    add-int/2addr p0, v0

    .line 34
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 35
    .line 36
    if-eqz v0, :cond_3

    .line 37
    .line 38
    const/4 v1, 0x4

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    const/4 v1, 0x5

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 55
    .line 56
    if-eqz v0, :cond_5

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/data/IdCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 67
    .line 68
    if-eqz v0, :cond_6

    .line 69
    .line 70
    const/4 v1, 0x7

    .line 71
    sget-object v2, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 72
    .line 73
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 74
    .line 75
    .line 76
    move-result v0

    .line 77
    add-int/2addr p0, v0

    .line 78
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 79
    .line 80
    if-eqz v0, :cond_7

    .line 81
    .line 82
    const/16 v1, 0x8

    .line 83
    .line 84
    sget-object v2, Lcom/p1/mobile/putong/data/AppealMaterial;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 87
    .line 88
    .line 89
    move-result v0

    .line 90
    add-int/2addr p0, v0

    .line 91
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 92
    .line 93
    if-eqz v0, :cond_8

    .line 94
    .line 95
    const/16 v1, 0x9

    .line 96
    .line 97
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->ticketId:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_9

    .line 105
    .line 106
    const/16 v1, 0xa

    .line 107
    .line 108
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_9
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 114
    .line 115
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 116
    check-cast p1, Lcom/p1/mobile/putong/data/AppealPostData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/AppealPostData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/AppealPostData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/AppealPostData;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/AppealPostData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/AppealPostData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    invoke-static {}, Lcom/p1/mobile/putong/data/FaceidLiveData;->new_()Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 26
    .line 27
    .line 28
    move-result-object p1

    .line 29
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 30
    .line 31
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 32
    .line 33
    if-nez p1, :cond_2

    .line 34
    .line 35
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 36
    .line 37
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_3

    .line 40
    .line 41
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 42
    .line 43
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_4

    .line 46
    .line 47
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 48
    .line 49
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 50
    .line 51
    if-nez p1, :cond_5

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/data/IdCard;->new_()Lcom/p1/mobile/putong/data/IdCard;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 58
    .line 59
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 60
    .line 61
    if-nez p1, :cond_6

    .line 62
    .line 63
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 68
    .line 69
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 70
    .line 71
    if-nez p1, :cond_7

    .line 72
    .line 73
    invoke-static {}, Lcom/p1/mobile/putong/data/AppealMaterial;->new_()Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 78
    .line 79
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_10

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 84
    .line 85
    return-object p0

    .line 86
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->ticketId:Ljava/lang/String;

    .line 91
    .line 92
    goto :goto_0

    .line 93
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 94
    .line 95
    .line 96
    move-result-object v0

    .line 97
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 98
    .line 99
    goto :goto_0

    .line 100
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/AppealMaterial;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 101
    .line 102
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 103
    .line 104
    .line 105
    move-result-object v0

    .line 106
    check-cast v0, Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 107
    .line 108
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 109
    .line 110
    goto :goto_0

    .line 111
    :sswitch_3
    sget-object v0, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 112
    .line 113
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 114
    .line 115
    .line 116
    move-result-object v0

    .line 117
    check-cast v0, Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 118
    .line 119
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 120
    .line 121
    goto :goto_0

    .line 122
    :sswitch_4
    sget-object v0, Lcom/p1/mobile/putong/data/IdCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 123
    .line 124
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    check-cast v0, Lcom/p1/mobile/putong/data/IdCard;

    .line 129
    .line 130
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v0

    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 150
    .line 151
    .line 152
    move-result-object v0

    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :sswitch_8
    sget-object v0, Lcom/p1/mobile/putong/data/FaceidLiveData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    check-cast v0, Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 164
    .line 165
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 170
    .line 171
    .line 172
    move-result-object v0

    .line 173
    iput-object v0, p0, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 178
    .line 179
    if-nez p1, :cond_8

    .line 180
    .line 181
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

    .line 182
    .line 183
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 184
    .line 185
    if-nez p1, :cond_9

    .line 186
    .line 187
    invoke-static {}, Lcom/p1/mobile/putong/data/FaceidLiveData;->new_()Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 188
    .line 189
    .line 190
    move-result-object p1

    .line 191
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 192
    .line 193
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 194
    .line 195
    if-nez p1, :cond_a

    .line 196
    .line 197
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 198
    .line 199
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_b

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 204
    .line 205
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 206
    .line 207
    if-nez p1, :cond_c

    .line 208
    .line 209
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 210
    .line 211
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 212
    .line 213
    if-nez p1, :cond_d

    .line 214
    .line 215
    invoke-static {}, Lcom/p1/mobile/putong/data/IdCard;->new_()Lcom/p1/mobile/putong/data/IdCard;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 220
    .line 221
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 222
    .line 223
    if-nez p1, :cond_e

    .line 224
    .line 225
    invoke-static {}, Lcom/p1/mobile/putong/data/PhoneNumber;->new_()Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 226
    .line 227
    .line 228
    move-result-object p1

    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 230
    .line 231
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 232
    .line 233
    if-nez p1, :cond_f

    .line 234
    .line 235
    invoke-static {}, Lcom/p1/mobile/putong/data/AppealMaterial;->new_()Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    iput-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 240
    .line 241
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 242
    .line 243
    if-nez p1, :cond_10

    .line 244
    .line 245
    iput-object v1, p0, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 246
    .line 247
    :cond_10
    return-object p0

    .line 248
    nop

    .line 249
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_a
        0xa -> :sswitch_9
        0x12 -> :sswitch_8
        0x1a -> :sswitch_7
        0x22 -> :sswitch_6
        0x2a -> :sswitch_5
        0x32 -> :sswitch_4
        0x3a -> :sswitch_3
        0x42 -> :sswitch_2
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

    .line 249
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/AppealPostData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/AppealPostData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/AppealPostData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->provider:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->providerData:Lcom/p1/mobile/putong/data/FaceidLiveData;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/data/FaceidLiveData;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->reason:Ljava/lang/String;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 25
    .line 26
    .line 27
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->ip:Ljava/lang/String;

    .line 28
    .line 29
    if-eqz p0, :cond_3

    .line 30
    .line 31
    const/4 v0, 0x4

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->verificationMethod:Ljava/lang/String;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    const/4 v0, 0x5

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 41
    .line 42
    .line 43
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->idCard:Lcom/p1/mobile/putong/data/IdCard;

    .line 44
    .line 45
    if-eqz p0, :cond_5

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/data/IdCard;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->smsPhone:Lcom/p1/mobile/putong/data/PhoneNumber;

    .line 54
    .line 55
    if-eqz p0, :cond_6

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    sget-object v1, Lcom/p1/mobile/putong/data/PhoneNumber;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->material:Lcom/p1/mobile/putong/data/AppealMaterial;

    .line 64
    .line 65
    if-eqz p0, :cond_7

    .line 66
    .line 67
    const/16 v0, 0x8

    .line 68
    .line 69
    sget-object v1, Lcom/p1/mobile/putong/data/AppealMaterial;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 72
    .line 73
    .line 74
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->appeal_type:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz p0, :cond_8

    .line 77
    .line 78
    const/16 v0, 0x9

    .line 79
    .line 80
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 81
    .line 82
    .line 83
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/AppealPostData;->ticketId:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_9

    .line 86
    .line 87
    const/16 p1, 0xa

    .line 88
    .line 89
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
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

    .line 93
    check-cast p1, Lcom/p1/mobile/putong/data/AppealPostData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/AppealPostData$1;->serialize(Lcom/p1/mobile/putong/data/AppealPostData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
