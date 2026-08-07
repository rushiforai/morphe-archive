.class Lcom/p1/mobile/putong/core/data/ContractInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ContractInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ContractInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ContractInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

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
    const/4 v0, 0x3

    .line 23
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->continuousDays:I

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    const/4 v0, 0x4

    .line 31
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->privilegeExpiredDays:I

    .line 32
    .line 33
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    const/4 v0, 0x5

    .line 39
    iget v1, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractCanceledDays:I

    .line 40
    .line 41
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 47
    .line 48
    if-eqz v0, :cond_2

    .line 49
    .line 50
    const/4 v1, 0x6

    .line 51
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 61
    .line 62
    if-eqz v0, :cond_3

    .line 63
    .line 64
    const/4 v1, 0x7

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/core/data/Merchandise;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 73
    .line 74
    if-eqz v0, :cond_4

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    sget-object v2, Lcom/p1/mobile/putong/data/MembershipType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_4
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 86
    .line 87
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/core/data/ContractInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ContractInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ContractInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ContractInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ContractInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ContractInfo;-><init>()V

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
    if-eqz v2, :cond_c

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_b

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_a

    .line 23
    .line 24
    const/16 v4, 0x18

    .line 25
    .line 26
    if-eq v2, v4, :cond_9

    .line 27
    .line 28
    const/16 v4, 0x20

    .line 29
    .line 30
    if-eq v2, v4, :cond_8

    .line 31
    .line 32
    const/16 v4, 0x28

    .line 33
    .line 34
    if-eq v2, v4, :cond_7

    .line 35
    .line 36
    const/16 v4, 0x30

    .line 37
    .line 38
    if-eq v2, v4, :cond_6

    .line 39
    .line 40
    const/16 v4, 0x3a

    .line 41
    .line 42
    if-eq v2, v4, :cond_5

    .line 43
    .line 44
    const/16 v4, 0x42

    .line 45
    .line 46
    if-eq v2, v4, :cond_4

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 55
    .line 56
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 57
    .line 58
    .line 59
    move-result v1

    .line 60
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 61
    .line 62
    .line 63
    move-result-object p1

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 67
    .line 68
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 79
    .line 80
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 81
    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 85
    .line 86
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 87
    .line 88
    .line 89
    move-result-object p1

    .line 90
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 91
    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 93
    .line 94
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 95
    .line 96
    if-nez p1, :cond_11

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Merchandise;->new_()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 103
    .line 104
    return-object p0

    .line 105
    :cond_4
    sget-object v2, Lcom/p1/mobile/putong/data/MembershipType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v2

    .line 111
    check-cast v2, Lcom/p1/mobile/putong/data/MembershipType;

    .line 112
    .line 113
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/core/data/Merchandise;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 119
    .line 120
    .line 121
    move-result-object v2

    .line 122
    check-cast v2, Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 123
    .line 124
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 125
    .line 126
    goto :goto_0

    .line 127
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 128
    .line 129
    .line 130
    move-result v1

    .line 131
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 132
    .line 133
    .line 134
    move-result-object v1

    .line 135
    goto :goto_0

    .line 136
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 137
    .line 138
    .line 139
    move-result v2

    .line 140
    iput v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractCanceledDays:I

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 145
    .line 146
    .line 147
    move-result v2

    .line 148
    iput v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->privilegeExpiredDays:I

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 153
    .line 154
    .line 155
    move-result v2

    .line 156
    iput v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->continuousDays:I

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 161
    .line 162
    .line 163
    move-result-object v2

    .line 164
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 169
    .line 170
    .line 171
    move-result-object v2

    .line 172
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

    .line 173
    .line 174
    goto/16 :goto_0

    .line 175
    .line 176
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 177
    .line 178
    if-nez p1, :cond_d

    .line 179
    .line 180
    if-eqz v1, :cond_d

    .line 181
    .line 182
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 183
    .line 184
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 185
    .line 186
    .line 187
    move-result v1

    .line 188
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 189
    .line 190
    .line 191
    move-result-object p1

    .line 192
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 193
    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 195
    .line 196
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_e

    .line 199
    .line 200
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

    .line 201
    .line 202
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_f

    .line 205
    .line 206
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

    .line 207
    .line 208
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 209
    .line 210
    if-nez p1, :cond_10

    .line 211
    .line 212
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 213
    .line 214
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 215
    .line 216
    .line 217
    move-result-object p1

    .line 218
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 219
    .line 220
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 221
    .line 222
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 223
    .line 224
    if-nez p1, :cond_11

    .line 225
    .line 226
    invoke-static {}, Lcom/p1/mobile/putong/core/data/Merchandise;->new_()Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 227
    .line 228
    .line 229
    move-result-object p1

    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 231
    .line 232
    :cond_11
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 233
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ContractInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ContractInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ContractInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractID:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractStatus:Ljava/lang/String;

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
    const/4 p0, 0x3

    .line 18
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->continuousDays:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    const/4 p0, 0x4

    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->privilegeExpiredDays:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    const/4 p0, 0x5

    .line 30
    iget v0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->contractCanceledDays:I

    .line 31
    .line 32
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 36
    .line 37
    if-eqz p0, :cond_2

    .line 38
    .line 39
    const/4 v0, 0x6

    .line 40
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 41
    .line 42
    .line 43
    move-result p0

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 45
    .line 46
    .line 47
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->merchandise:Lcom/p1/mobile/putong/core/data/Merchandise;

    .line 48
    .line 49
    if-eqz p0, :cond_3

    .line 50
    .line 51
    const/4 v0, 0x7

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/core/data/Merchandise;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ContractInfo;->membershipType:Lcom/p1/mobile/putong/data/MembershipType;

    .line 58
    .line 59
    if-eqz p0, :cond_4

    .line 60
    .line 61
    const/16 p1, 0x8

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/data/MembershipType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 66
    .line 67
    .line 68
    :cond_4
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/ContractInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ContractInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/ContractInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
