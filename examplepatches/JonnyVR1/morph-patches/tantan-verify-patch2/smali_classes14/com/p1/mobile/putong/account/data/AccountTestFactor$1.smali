.class Lcom/p1/mobile/putong/account/data/AccountTestFactor$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/account/data/AccountTestFactor;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/account/data/AccountTestFactor;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 47
    .line 48
    if-eqz v0, :cond_4

    .line 49
    .line 50
    const/4 v1, 0x5

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v0, :cond_7

    .line 79
    .line 80
    const/16 v1, 0x8

    .line 81
    .line 82
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 83
    .line 84
    .line 85
    move-result v0

    .line 86
    add-int/2addr p0, v0

    .line 87
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v0, :cond_8

    .line 90
    .line 91
    const/16 v1, 0x9

    .line 92
    .line 93
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 94
    .line 95
    .line 96
    move-result v0

    .line 97
    add-int/2addr p0, v0

    .line 98
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v0, :cond_9

    .line 101
    .line 102
    const/16 v1, 0xa

    .line 103
    .line 104
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 105
    .line 106
    .line 107
    move-result v0

    .line 108
    add-int/2addr p0, v0

    .line 109
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 110
    .line 111
    if-eqz v0, :cond_a

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 116
    .line 117
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 118
    .line 119
    .line 120
    move-result v0

    .line 121
    add-int/2addr p0, v0

    .line 122
    :cond_a
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 123
    .line 124
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 125
    check-cast p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/AccountTestFactor$1;->computeAndCacheSize(Lcom/p1/mobile/putong/account/data/AccountTestFactor;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/account/data/AccountTestFactor;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/account/data/AccountTestFactor;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 48
    .line 49
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 50
    .line 51
    .line 52
    move-result-object p1

    .line 53
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 54
    .line 55
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 56
    .line 57
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

    .line 58
    .line 59
    if-nez p1, :cond_3

    .line 60
    .line 61
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 68
    .line 69
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_5

    .line 72
    .line 73
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 74
    .line 75
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_6

    .line 78
    .line 79
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

    .line 80
    .line 81
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_7

    .line 84
    .line 85
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_8

    .line 90
    .line 91
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 92
    .line 93
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_9

    .line 96
    .line 97
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 98
    .line 99
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_14

    .line 102
    .line 103
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 104
    .line 105
    return-object p0

    .line 106
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 107
    .line 108
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 109
    .line 110
    .line 111
    move-result-object v2

    .line 112
    check-cast v2, Lcom/p1/mobile/putong/data/Gender;

    .line 113
    .line 114
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v2

    .line 121
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v2

    .line 128
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 136
    .line 137
    goto/16 :goto_0

    .line 138
    .line 139
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 140
    .line 141
    .line 142
    move-result-object v2

    .line 143
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v2

    .line 151
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 160
    .line 161
    goto/16 :goto_0

    .line 162
    .line 163
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 172
    .line 173
    .line 174
    move-result-object v2

    .line 175
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

    .line 176
    .line 177
    goto/16 :goto_0

    .line 178
    .line 179
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 180
    .line 181
    .line 182
    move-result v1

    .line 183
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 184
    .line 185
    .line 186
    move-result-object v1

    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 190
    .line 191
    .line 192
    move-result-object v2

    .line 193
    iput-object v2, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

    .line 194
    .line 195
    goto/16 :goto_0

    .line 196
    .line 197
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 198
    .line 199
    if-nez p1, :cond_a

    .line 200
    .line 201
    if-eqz v1, :cond_a

    .line 202
    .line 203
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 204
    .line 205
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 206
    .line 207
    .line 208
    move-result v1

    .line 209
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 214
    .line 215
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 216
    .line 217
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

    .line 218
    .line 219
    if-nez p1, :cond_b

    .line 220
    .line 221
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

    .line 222
    .line 223
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 224
    .line 225
    if-nez p1, :cond_c

    .line 226
    .line 227
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 228
    .line 229
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 230
    .line 231
    .line 232
    move-result-object p1

    .line 233
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 234
    .line 235
    iput-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 236
    .line 237
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

    .line 238
    .line 239
    if-nez p1, :cond_d

    .line 240
    .line 241
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

    .line 242
    .line 243
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 244
    .line 245
    if-nez p1, :cond_e

    .line 246
    .line 247
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 248
    .line 249
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 250
    .line 251
    if-nez p1, :cond_f

    .line 252
    .line 253
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 254
    .line 255
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

    .line 256
    .line 257
    if-nez p1, :cond_10

    .line 258
    .line 259
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

    .line 260
    .line 261
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

    .line 262
    .line 263
    if-nez p1, :cond_11

    .line 264
    .line 265
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

    .line 266
    .line 267
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 268
    .line 269
    if-nez p1, :cond_12

    .line 270
    .line 271
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 272
    .line 273
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 274
    .line 275
    if-nez p1, :cond_13

    .line 276
    .line 277
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 278
    .line 279
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 280
    .line 281
    if-nez p1, :cond_14

    .line 282
    .line 283
    iput-object v3, p0, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 284
    .line 285
    :cond_14
    return-object p0

    .line 286
    nop

    .line 287
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x10 -> :sswitch_9
        0x1a -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x32 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
        0x4a -> :sswitch_2
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

    .line 287
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/account/data/AccountTestFactor$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/account/data/AccountTestFactor;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 1
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->birthdate:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->password:Ljava/lang/String;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 35
    .line 36
    .line 37
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->countryCode:Ljava/lang/String;

    .line 38
    .line 39
    if-eqz p0, :cond_4

    .line 40
    .line 41
    const/4 v0, 0x5

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 43
    .line 44
    .line 45
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->mobileNumber:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->thirdpartyType:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_7

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->step:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_8

    .line 73
    .line 74
    const/16 v0, 0x9

    .line 75
    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->channel:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz p0, :cond_9

    .line 82
    .line 83
    const/16 v0, 0xa

    .line 84
    .line 85
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 89
    .line 90
    if-eqz p0, :cond_a

    .line 91
    .line 92
    const/16 p1, 0xb

    .line 93
    .line 94
    sget-object v0, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 95
    .line 96
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 97
    .line 98
    .line 99
    :cond_a
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/account/data/AccountTestFactor;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/account/data/AccountTestFactor$1;->serialize(Lcom/p1/mobile/putong/account/data/AccountTestFactor;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
