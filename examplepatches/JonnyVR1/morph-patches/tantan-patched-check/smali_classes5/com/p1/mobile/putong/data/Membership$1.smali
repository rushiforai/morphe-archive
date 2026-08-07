.class Lcom/p1/mobile/putong/data/Membership$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Membership;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Membership;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Membership;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

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
    const/4 v0, 0x2

    .line 17
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 18
    .line 19
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 20
    .line 21
    .line 22
    move-result v0

    .line 23
    add-int/2addr p0, v0

    .line 24
    const/4 v0, 0x3

    .line 25
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 26
    .line 27
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    const/4 v0, 0x4

    .line 33
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 34
    .line 35
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 41
    .line 42
    if-eqz v0, :cond_1

    .line 43
    .line 44
    const/4 v1, 0x5

    .line 45
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 46
    .line 47
    .line 48
    move-result v0

    .line 49
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    :cond_1
    const/4 v0, 0x6

    .line 55
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 56
    .line 57
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    const/4 v0, 0x7

    .line 63
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 64
    .line 65
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 71
    .line 72
    if-eqz v0, :cond_2

    .line 73
    .line 74
    const/16 v1, 0x8

    .line 75
    .line 76
    sget-object v2, Lcom/p1/mobile/putong/data/MembershipType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 77
    .line 78
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 79
    .line 80
    .line 81
    move-result v0

    .line 82
    add-int/2addr p0, v0

    .line 83
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 84
    .line 85
    if-eqz v0, :cond_3

    .line 86
    .line 87
    const/16 v1, 0x9

    .line 88
    .line 89
    sget-object v2, Lcom/p1/mobile/putong/data/VIPBadgeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 90
    .line 91
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_3
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 97
    .line 98
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/Membership;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Membership$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Membership;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Membership;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Membership;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Membership;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 10
    .line 11
    .line 12
    move-result v3

    .line 13
    if-eqz v3, :cond_c

    .line 14
    .line 15
    const/16 v4, 0x8

    .line 16
    .line 17
    if-eq v3, v4, :cond_b

    .line 18
    .line 19
    const/16 v4, 0x10

    .line 20
    .line 21
    if-eq v3, v4, :cond_a

    .line 22
    .line 23
    const/16 v4, 0x19

    .line 24
    .line 25
    if-eq v3, v4, :cond_9

    .line 26
    .line 27
    const/16 v4, 0x20

    .line 28
    .line 29
    if-eq v3, v4, :cond_8

    .line 30
    .line 31
    const/16 v4, 0x28

    .line 32
    .line 33
    if-eq v3, v4, :cond_7

    .line 34
    .line 35
    const/16 v4, 0x30

    .line 36
    .line 37
    if-eq v3, v4, :cond_6

    .line 38
    .line 39
    const/16 v4, 0x38

    .line 40
    .line 41
    if-eq v3, v4, :cond_5

    .line 42
    .line 43
    const/16 v4, 0x42

    .line 44
    .line 45
    if-eq v3, v4, :cond_4

    .line 46
    .line 47
    const/16 v4, 0x4a

    .line 48
    .line 49
    if-eq v3, v4, :cond_3

    .line 50
    .line 51
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 52
    .line 53
    if-nez p1, :cond_0

    .line 54
    .line 55
    if-eqz v1, :cond_0

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 58
    .line 59
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 60
    .line 61
    .line 62
    move-result v1

    .line 63
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 64
    .line 65
    .line 66
    move-result-object p1

    .line 67
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 70
    .line 71
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 72
    .line 73
    if-nez p1, :cond_1

    .line 74
    .line 75
    if-eqz v2, :cond_1

    .line 76
    .line 77
    sget-object p1, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 78
    .line 79
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 80
    .line 81
    .line 82
    move-result v1

    .line 83
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 84
    .line 85
    .line 86
    move-result-object p1

    .line 87
    check-cast p1, Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 88
    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 90
    .line 91
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 92
    .line 93
    if-nez p1, :cond_2

    .line 94
    .line 95
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 96
    .line 97
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 98
    .line 99
    .line 100
    move-result-object p1

    .line 101
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 104
    .line 105
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 106
    .line 107
    if-nez p1, :cond_10

    .line 108
    .line 109
    sget-object p1, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 110
    .line 111
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 112
    .line 113
    .line 114
    move-result-object p1

    .line 115
    check-cast p1, Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 116
    .line 117
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 118
    .line 119
    return-object p0

    .line 120
    :cond_3
    sget-object v3, Lcom/p1/mobile/putong/data/VIPBadgeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 121
    .line 122
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v3

    .line 126
    check-cast v3, Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 127
    .line 128
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_4
    sget-object v3, Lcom/p1/mobile/putong/data/MembershipType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v3

    .line 137
    check-cast v3, Lcom/p1/mobile/putong/data/MembershipType;

    .line 138
    .line 139
    iput-object v3, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 144
    .line 145
    .line 146
    move-result v3

    .line 147
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 152
    .line 153
    .line 154
    move-result v3

    .line 155
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 160
    .line 161
    .line 162
    move-result v2

    .line 163
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 164
    .line 165
    .line 166
    move-result-object v2

    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 170
    .line 171
    .line 172
    move-result-wide v3

    .line 173
    iput-wide v3, p0, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 178
    .line 179
    .line 180
    move-result-wide v3

    .line 181
    iput-wide v3, p0, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 182
    .line 183
    goto/16 :goto_0

    .line 184
    .line 185
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 186
    .line 187
    .line 188
    move-result v3

    .line 189
    iput-boolean v3, p0, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 190
    .line 191
    goto/16 :goto_0

    .line 192
    .line 193
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 194
    .line 195
    .line 196
    move-result v1

    .line 197
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 198
    .line 199
    .line 200
    move-result-object v1

    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 204
    .line 205
    if-nez p1, :cond_d

    .line 206
    .line 207
    if-eqz v1, :cond_d

    .line 208
    .line 209
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 210
    .line 211
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 212
    .line 213
    .line 214
    move-result v1

    .line 215
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 216
    .line 217
    .line 218
    move-result-object p1

    .line 219
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 220
    .line 221
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 222
    .line 223
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 224
    .line 225
    if-nez p1, :cond_e

    .line 226
    .line 227
    if-eqz v2, :cond_e

    .line 228
    .line 229
    sget-object p1, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 230
    .line 231
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 232
    .line 233
    .line 234
    move-result v1

    .line 235
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 236
    .line 237
    .line 238
    move-result-object p1

    .line 239
    check-cast p1, Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 240
    .line 241
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 242
    .line 243
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 244
    .line 245
    if-nez p1, :cond_f

    .line 246
    .line 247
    sget-object p1, Lcom/p1/mobile/putong/data/MembershipType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 248
    .line 249
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 250
    .line 251
    .line 252
    move-result-object p1

    .line 253
    check-cast p1, Lcom/p1/mobile/putong/data/MembershipType;

    .line 254
    .line 255
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 256
    .line 257
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 258
    .line 259
    if-nez p1, :cond_10

    .line 260
    .line 261
    sget-object p1, Lcom/p1/mobile/putong/data/VIPBadgeType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 262
    .line 263
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 264
    .line 265
    .line 266
    move-result-object p1

    .line 267
    check-cast p1, Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 268
    .line 269
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 270
    .line 271
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

    .line 272
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Membership$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Membership;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Membership;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

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
    const/4 p0, 0x2

    .line 14
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Membership;->active:Z

    .line 15
    .line 16
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 17
    .line 18
    .line 19
    const/4 p0, 0x3

    .line 20
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Membership;->expiresTime:D

    .line 21
    .line 22
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 23
    .line 24
    .line 25
    const/4 p0, 0x4

    .line 26
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Membership;->duration:J

    .line 27
    .line 28
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 29
    .line 30
    .line 31
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 32
    .line 33
    if-eqz p0, :cond_1

    .line 34
    .line 35
    const/4 v0, 0x5

    .line 36
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 37
    .line 38
    .line 39
    move-result p0

    .line 40
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    :cond_1
    const/4 p0, 0x6

    .line 44
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Membership;->hideVIP:Z

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 47
    .line 48
    .line 49
    const/4 p0, 0x7

    .line 50
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/Membership;->hideActivityTime:Z

    .line 51
    .line 52
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 53
    .line 54
    .line 55
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Membership;->name:Lcom/p1/mobile/putong/data/MembershipType;

    .line 56
    .line 57
    if-eqz p0, :cond_2

    .line 58
    .line 59
    const/16 v0, 0x8

    .line 60
    .line 61
    sget-object v1, Lcom/p1/mobile/putong/data/MembershipType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 62
    .line 63
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 64
    .line 65
    .line 66
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Membership;->vipBadgeType:Lcom/p1/mobile/putong/data/VIPBadgeType;

    .line 67
    .line 68
    if-eqz p0, :cond_3

    .line 69
    .line 70
    const/16 p1, 0x9

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/data/VIPBadgeType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 75
    .line 76
    .line 77
    :cond_3
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/Membership;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Membership$1;->serialize(Lcom/p1/mobile/putong/data/Membership;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
