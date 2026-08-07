.class Lcom/p1/mobile/putong/data/SignInData$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/SignInData;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/SignInData;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/SignInData;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-virtual {v0}, Ljava/lang/Integer;->intValue()I

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 51
    .line 52
    if-eqz v0, :cond_4

    .line 53
    .line 54
    const/4 v1, 0x5

    .line 55
    sget-object v2, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 56
    .line 57
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/4 v1, 0x6

    .line 67
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 73
    .line 74
    if-eqz v0, :cond_6

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 83
    .line 84
    if-eqz v0, :cond_7

    .line 85
    .line 86
    const/16 v1, 0x8

    .line 87
    .line 88
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    add-int/2addr p0, v0

    .line 93
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->operator:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz v0, :cond_8

    .line 96
    .line 97
    const/16 v1, 0x9

    .line 98
    .line 99
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 100
    .line 101
    .line 102
    move-result v0

    .line 103
    add-int/2addr p0, v0

    .line 104
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 105
    .line 106
    if-eqz v0, :cond_9

    .line 107
    .line 108
    const/16 v1, 0xa

    .line 109
    .line 110
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    add-int/2addr p0, v0

    .line 115
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz v0, :cond_a

    .line 118
    .line 119
    const/16 v1, 0xb

    .line 120
    .line 121
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 122
    .line 123
    .line 124
    move-result v0

    .line 125
    add-int/2addr p0, v0

    .line 126
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 127
    .line 128
    if-eqz v0, :cond_b

    .line 129
    .line 130
    const/16 v1, 0xc

    .line 131
    .line 132
    sget-object v2, Lcom/p1/mobile/putong/data/SignInGrantType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 133
    .line 134
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v0, :cond_c

    .line 142
    .line 143
    const/16 v1, 0xd

    .line 144
    .line 145
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 151
    .line 152
    if-eqz v0, :cond_d

    .line 153
    .line 154
    const/16 v1, 0xe

    .line 155
    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 162
    .line 163
    if-eqz v0, :cond_e

    .line 164
    .line 165
    const/16 v1, 0xf

    .line 166
    .line 167
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    add-int/2addr p0, v0

    .line 172
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 173
    .line 174
    if-eqz v0, :cond_f

    .line 175
    .line 176
    const/16 v1, 0x10

    .line 177
    .line 178
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    add-int/2addr p0, v0

    .line 183
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 184
    .line 185
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 186
    check-cast p1, Lcom/p1/mobile/putong/data/SignInData;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SignInData$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/SignInData;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SignInData;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/SignInData;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/SignInData;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/SignInGrantType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    sget-object p1, Lcom/p1/mobile/putong/data/SignInGrantType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 42
    .line 43
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 44
    .line 45
    .line 46
    move-result-object p1

    .line 47
    check-cast p1, Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 48
    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 50
    .line 51
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

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
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 72
    .line 73
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_5

    .line 76
    .line 77
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 78
    .line 79
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_6

    .line 82
    .line 83
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 84
    .line 85
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_7

    .line 88
    .line 89
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 90
    .line 91
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_10

    .line 94
    .line 95
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 96
    .line 97
    return-object p0

    .line 98
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v2

    .line 102
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 106
    .line 107
    .line 108
    move-result-object v2

    .line 109
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v2

    .line 116
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v2

    .line 123
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/data/SignInGrantType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v2

    .line 132
    check-cast v2, Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 133
    .line 134
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 135
    .line 136
    goto/16 :goto_0

    .line 137
    .line 138
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 139
    .line 140
    .line 141
    move-result-object v2

    .line 142
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 143
    .line 144
    goto/16 :goto_0

    .line 145
    .line 146
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 155
    .line 156
    .line 157
    move-result-object v2

    .line 158
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->operator:Ljava/lang/String;

    .line 159
    .line 160
    goto/16 :goto_0

    .line 161
    .line 162
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 167
    .line 168
    goto/16 :goto_0

    .line 169
    .line 170
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 187
    .line 188
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 189
    .line 190
    .line 191
    move-result-object v2

    .line 192
    check-cast v2, Lcom/p1/mobile/putong/data/Device;

    .line 193
    .line 194
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 195
    .line 196
    goto/16 :goto_0

    .line 197
    .line 198
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 199
    .line 200
    .line 201
    move-result v2

    .line 202
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 203
    .line 204
    .line 205
    move-result-object v2

    .line 206
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 207
    .line 208
    goto/16 :goto_0

    .line 209
    .line 210
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 215
    .line 216
    goto/16 :goto_0

    .line 217
    .line 218
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 219
    .line 220
    .line 221
    move-result-object v2

    .line 222
    iput-object v2, p0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 223
    .line 224
    goto/16 :goto_0

    .line 225
    .line 226
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 227
    .line 228
    .line 229
    move-result v1

    .line 230
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 231
    .line 232
    .line 233
    move-result-object v1

    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 237
    .line 238
    if-nez p1, :cond_8

    .line 239
    .line 240
    if-eqz v1, :cond_8

    .line 241
    .line 242
    sget-object p1, Lcom/p1/mobile/putong/data/SignInGrantType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 243
    .line 244
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 245
    .line 246
    .line 247
    move-result v1

    .line 248
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 249
    .line 250
    .line 251
    move-result-object p1

    .line 252
    check-cast p1, Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 253
    .line 254
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 255
    .line 256
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 257
    .line 258
    if-nez p1, :cond_9

    .line 259
    .line 260
    sget-object p1, Lcom/p1/mobile/putong/data/SignInGrantType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 261
    .line 262
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 263
    .line 264
    .line 265
    move-result-object p1

    .line 266
    check-cast p1, Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 267
    .line 268
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 269
    .line 270
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 271
    .line 272
    if-nez p1, :cond_a

    .line 273
    .line 274
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

    .line 275
    .line 276
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 277
    .line 278
    if-nez p1, :cond_b

    .line 279
    .line 280
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 281
    .line 282
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 283
    .line 284
    if-nez p1, :cond_c

    .line 285
    .line 286
    invoke-static {}, Lcom/p1/mobile/putong/data/Device;->new_()Lcom/p1/mobile/putong/data/Device;

    .line 287
    .line 288
    .line 289
    move-result-object p1

    .line 290
    iput-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 291
    .line 292
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 293
    .line 294
    if-nez p1, :cond_d

    .line 295
    .line 296
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 297
    .line 298
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 299
    .line 300
    if-nez p1, :cond_e

    .line 301
    .line 302
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 303
    .line 304
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 305
    .line 306
    if-nez p1, :cond_f

    .line 307
    .line 308
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 309
    .line 310
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 311
    .line 312
    if-nez p1, :cond_10

    .line 313
    .line 314
    iput-object v3, p0, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 315
    .line 316
    :cond_10
    return-object p0

    .line 317
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_10
        0x8 -> :sswitch_f
        0x12 -> :sswitch_e
        0x1a -> :sswitch_d
        0x20 -> :sswitch_c
        0x2a -> :sswitch_b
        0x32 -> :sswitch_a
        0x3a -> :sswitch_9
        0x42 -> :sswitch_8
        0x4a -> :sswitch_7
        0x52 -> :sswitch_6
        0x5a -> :sswitch_5
        0x62 -> :sswitch_4
        0x6a -> :sswitch_3
        0x72 -> :sswitch_2
        0x7a -> :sswitch_1
        0x82 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 317
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/SignInData$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/SignInData;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/SignInData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->username:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->password:Ljava/lang/String;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->code:Ljava/lang/Integer;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p0}, Ljava/lang/Integer;->intValue()I

    .line 35
    .line 36
    .line 37
    move-result p0

    .line 38
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 39
    .line 40
    .line 41
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->device:Lcom/p1/mobile/putong/data/Device;

    .line 42
    .line 43
    if-eqz p0, :cond_4

    .line 44
    .line 45
    const/4 v0, 0x5

    .line 46
    sget-object v1, Lcom/p1/mobile/putong/data/Device;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyId:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/4 v0, 0x6

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyToken:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 v0, 0x7

    .line 64
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->scope:Ljava/lang/String;

    .line 68
    .line 69
    if-eqz p0, :cond_7

    .line 70
    .line 71
    const/16 v0, 0x8

    .line 72
    .line 73
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 74
    .line 75
    .line 76
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->operator:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz p0, :cond_8

    .line 79
    .line 80
    const/16 v0, 0x9

    .line 81
    .line 82
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 83
    .line 84
    .line 85
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaToken:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz p0, :cond_9

    .line 88
    .line 89
    const/16 v0, 0xa

    .line 90
    .line 91
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 92
    .line 93
    .line 94
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->captchaValue:Ljava/lang/String;

    .line 95
    .line 96
    if-eqz p0, :cond_a

    .line 97
    .line 98
    const/16 v0, 0xb

    .line 99
    .line 100
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 101
    .line 102
    .line 103
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->grantType:Lcom/p1/mobile/putong/data/SignInGrantType;

    .line 104
    .line 105
    if-eqz p0, :cond_b

    .line 106
    .line 107
    const/16 v0, 0xc

    .line 108
    .line 109
    sget-object v1, Lcom/p1/mobile/putong/data/SignInGrantType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 110
    .line 111
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 112
    .line 113
    .line 114
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdPartyAccessCode:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p0, :cond_c

    .line 117
    .line 118
    const/16 v0, 0xd

    .line 119
    .line 120
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->ttcToken:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz p0, :cond_d

    .line 126
    .line 127
    const/16 v0, 0xe

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 130
    .line 131
    .line 132
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->thirdEmail:Ljava/lang/String;

    .line 133
    .line 134
    if-eqz p0, :cond_e

    .line 135
    .line 136
    const/16 v0, 0xf

    .line 137
    .line 138
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 139
    .line 140
    .line 141
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/SignInData;->verifyType:Ljava/lang/String;

    .line 142
    .line 143
    if-eqz p0, :cond_f

    .line 144
    .line 145
    const/16 p1, 0x10

    .line 146
    .line 147
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 148
    .line 149
    .line 150
    :cond_f
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 151
    check-cast p1, Lcom/p1/mobile/putong/data/SignInData;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/SignInData$1;->serialize(Lcom/p1/mobile/putong/data/SignInData;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
