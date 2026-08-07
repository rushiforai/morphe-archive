.class Lcom/p1/mobile/putong/data/VerifyData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VerifyData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VerifyData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VerifyData;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 3
    .line 4
    invoke-static {p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 104
    .line 105
    if-eqz v0, :cond_7

    .line 106
    .line 107
    const/16 v1, 0xb

    .line 108
    .line 109
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 115
    .line 116
    if-eqz v0, :cond_8

    .line 117
    .line 118
    const/16 v1, 0xc

    .line 119
    .line 120
    sget-object v2, Lcom/p1/mobile/putong/data/VerifyReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_8
    const/16 v0, 0xd

    .line 128
    .line 129
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VerifyData;->forceLogin:Z

    .line 130
    .line 131
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 137
    .line 138
    if-eqz v0, :cond_9

    .line 139
    .line 140
    const/16 v1, 0xe

    .line 141
    .line 142
    sget-object v2, Lcom/p1/mobile/putong/data/Captcha;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 143
    .line 144
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 145
    .line 146
    .line 147
    move-result v0

    .line 148
    add-int/2addr p0, v0

    .line 149
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 150
    .line 151
    if-eqz v0, :cond_a

    .line 152
    .line 153
    const/16 v1, 0xf

    .line 154
    .line 155
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 156
    .line 157
    .line 158
    move-result v0

    .line 159
    add-int/2addr p0, v0

    .line 160
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 161
    .line 162
    if-eqz v0, :cond_b

    .line 163
    .line 164
    const/16 v1, 0x10

    .line 165
    .line 166
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 167
    .line 168
    .line 169
    move-result v0

    .line 170
    add-int/2addr p0, v0

    .line 171
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 172
    .line 173
    if-eqz v0, :cond_c

    .line 174
    .line 175
    const/16 v1, 0x11

    .line 176
    .line 177
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 178
    .line 179
    .line 180
    move-result v0

    .line 181
    add-int/2addr p0, v0

    .line 182
    :cond_c
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 183
    .line 184
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 185
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerifyData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VerifyData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerifyData;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VerifyData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VerifyData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 84
    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 90
    .line 91
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_8

    .line 94
    .line 95
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 96
    .line 97
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 98
    .line 99
    if-nez p1, :cond_9

    .line 100
    .line 101
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 102
    .line 103
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 104
    .line 105
    if-nez p1, :cond_a

    .line 106
    .line 107
    invoke-static {}, Lcom/p1/mobile/putong/data/Captcha;->new_()Lcom/p1/mobile/putong/data/Captcha;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 112
    .line 113
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 114
    .line 115
    if-nez p1, :cond_b

    .line 116
    .line 117
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 118
    .line 119
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 120
    .line 121
    if-nez p1, :cond_18

    .line 122
    .line 123
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 124
    .line 125
    return-object p0

    .line 126
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 127
    .line 128
    .line 129
    move-result-object v2

    .line 130
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v2

    .line 137
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 142
    .line 143
    .line 144
    move-result-object v2

    .line 145
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/data/Captcha;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v2

    .line 155
    check-cast v2, Lcom/p1/mobile/putong/data/Captcha;

    .line 156
    .line 157
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    iput-boolean v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->forceLogin:Z

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/data/VerifyReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 170
    .line 171
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    check-cast v2, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 176
    .line 177
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 178
    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v2

    .line 185
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 198
    .line 199
    .line 200
    move-result-object v2

    .line 201
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 202
    .line 203
    goto/16 :goto_0

    .line 204
    .line 205
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 206
    .line 207
    .line 208
    move-result-object v2

    .line 209
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 210
    .line 211
    goto/16 :goto_0

    .line 212
    .line 213
    :sswitch_a
    sget-object v2, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 214
    .line 215
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    check-cast v2, Lcom/p1/mobile/putong/data/Device;

    .line 220
    .line 221
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 222
    .line 223
    goto/16 :goto_0

    .line 224
    .line 225
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 226
    .line 227
    .line 228
    move-result v2

    .line 229
    iput v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 234
    .line 235
    .line 236
    move-result v1

    .line 237
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 238
    .line 239
    .line 240
    move-result-object v1

    .line 241
    goto/16 :goto_0

    .line 242
    .line 243
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 244
    .line 245
    .line 246
    move-result-object v2

    .line 247
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 248
    .line 249
    goto/16 :goto_0

    .line 250
    .line 251
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 252
    .line 253
    .line 254
    move-result v2

    .line 255
    iput v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 256
    .line 257
    goto/16 :goto_0

    .line 258
    .line 259
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    iput-object v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 264
    .line 265
    goto/16 :goto_0

    .line 266
    .line 267
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 268
    .line 269
    .line 270
    move-result v2

    .line 271
    iput v2, p0, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 272
    .line 273
    goto/16 :goto_0

    .line 274
    .line 275
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 276
    .line 277
    if-nez p1, :cond_c

    .line 278
    .line 279
    if-eqz v1, :cond_c

    .line 280
    .line 281
    sget-object p1, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 282
    .line 283
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 284
    .line 285
    .line 286
    move-result v1

    .line 287
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 288
    .line 289
    .line 290
    move-result-object p1

    .line 291
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 292
    .line 293
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 294
    .line 295
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 296
    .line 297
    if-nez p1, :cond_d

    .line 298
    .line 299
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

    .line 300
    .line 301
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 302
    .line 303
    if-nez p1, :cond_e

    .line 304
    .line 305
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

    .line 306
    .line 307
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 308
    .line 309
    if-nez p1, :cond_f

    .line 310
    .line 311
    sget-object p1, Lcom/p1/mobile/putong/data/VerifyReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 312
    .line 313
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 314
    .line 315
    .line 316
    move-result-object p1

    .line 317
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyReason;

    .line 318
    .line 319
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 320
    .line 321
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 322
    .line 323
    if-nez p1, :cond_10

    .line 324
    .line 325
    invoke-static {}, Lcom/p1/mobile/putong/data/Device;->new_()Lcom/p1/mobile/putong/data/Device;

    .line 326
    .line 327
    .line 328
    move-result-object p1

    .line 329
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 330
    .line 331
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 332
    .line 333
    if-nez p1, :cond_11

    .line 334
    .line 335
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

    .line 336
    .line 337
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 338
    .line 339
    if-nez p1, :cond_12

    .line 340
    .line 341
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

    .line 342
    .line 343
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 344
    .line 345
    if-nez p1, :cond_13

    .line 346
    .line 347
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

    .line 348
    .line 349
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 350
    .line 351
    if-nez p1, :cond_14

    .line 352
    .line 353
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 354
    .line 355
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 356
    .line 357
    if-nez p1, :cond_15

    .line 358
    .line 359
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 360
    .line 361
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 362
    .line 363
    if-nez p1, :cond_16

    .line 364
    .line 365
    invoke-static {}, Lcom/p1/mobile/putong/data/Captcha;->new_()Lcom/p1/mobile/putong/data/Captcha;

    .line 366
    .line 367
    .line 368
    move-result-object p1

    .line 369
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 370
    .line 371
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 372
    .line 373
    if-nez p1, :cond_17

    .line 374
    .line 375
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 376
    .line 377
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 378
    .line 379
    if-nez p1, :cond_18

    .line 380
    .line 381
    iput-object v3, p0, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 382
    .line 383
    :cond_18
    return-object p0

    .line 384
    nop

    .line 385
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0x8 -> :sswitch_10
        0x12 -> :sswitch_f
        0x18 -> :sswitch_e
        0x22 -> :sswitch_d
        0x28 -> :sswitch_c
        0x30 -> :sswitch_b
        0x3a -> :sswitch_a
        0x42 -> :sswitch_9
        0x4a -> :sswitch_8
        0x52 -> :sswitch_7
        0x5a -> :sswitch_6
        0x62 -> :sswitch_5
        0x68 -> :sswitch_4
        0x72 -> :sswitch_3
        0x7a -> :sswitch_2
        0x82 -> :sswitch_1
        0x8a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 385
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VerifyData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VerifyData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VerifyData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->countryCode:I

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->mobileNumber:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->code:I

    .line 17
    .line 18
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 19
    .line 20
    .line 21
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->language:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->codeLength:I

    .line 43
    .line 44
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->device:Lcom/p1/mobile/putong/data/Device;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->clientId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->category:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaToken:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->captchaValue:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_7

    .line 87
    .line 88
    const/16 v0, 0xb

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->action:Lcom/p1/mobile/putong/data/VerifyReason;

    .line 94
    .line 95
    if-eqz p0, :cond_8

    .line 96
    .line 97
    const/16 v0, 0xc

    .line 98
    .line 99
    sget-object v1, Lcom/p1/mobile/putong/data/VerifyReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 102
    .line 103
    .line 104
    :cond_8
    const/16 p0, 0xd

    .line 105
    .line 106
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VerifyData;->forceLogin:Z

    .line 107
    .line 108
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 109
    .line 110
    .line 111
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->captcha:Lcom/p1/mobile/putong/data/Captcha;

    .line 112
    .line 113
    if-eqz p0, :cond_9

    .line 114
    .line 115
    const/16 v0, 0xe

    .line 116
    .line 117
    sget-object v1, Lcom/p1/mobile/putong/data/Captcha;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 120
    .line 121
    .line 122
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->ttt_signin_token:Ljava/lang/String;

    .line 123
    .line 124
    if-eqz p0, :cond_a

    .line 125
    .line 126
    const/16 v0, 0xf

    .line 127
    .line 128
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 129
    .line 130
    .line 131
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->email:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz p0, :cond_b

    .line 134
    .line 135
    const/16 v0, 0x10

    .line 136
    .line 137
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 138
    .line 139
    .line 140
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VerifyData;->verifyType:Ljava/lang/String;

    .line 141
    .line 142
    if-eqz p0, :cond_c

    .line 143
    .line 144
    const/16 p1, 0x11

    .line 145
    .line 146
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 147
    .line 148
    .line 149
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

    .line 150
    check-cast p1, Lcom/p1/mobile/putong/data/VerifyData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VerifyData$1;->serialize(Lcom/p1/mobile/putong/data/VerifyData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
