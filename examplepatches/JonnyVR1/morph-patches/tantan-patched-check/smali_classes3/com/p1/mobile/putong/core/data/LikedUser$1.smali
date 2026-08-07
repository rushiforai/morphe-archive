.class Lcom/p1/mobile/putong/core/data/LikedUser$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/LikedUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/LikedUser;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LikedUser;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 27
    .line 28
    if-eqz v0, :cond_2

    .line 29
    .line 30
    const/4 v1, 0x3

    .line 31
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    add-int/2addr p0, v0

    .line 40
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/4 v1, 0x4

    .line 45
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 46
    .line 47
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    add-int/2addr p0, v0

    .line 52
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 53
    .line 54
    if-eqz v0, :cond_4

    .line 55
    .line 56
    const/4 v1, 0x5

    .line 57
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 58
    .line 59
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 65
    .line 66
    if-eqz v0, :cond_5

    .line 67
    .line 68
    const/4 v1, 0x6

    .line 69
    sget-object v2, Lcom/p1/mobile/putong/core/data/RelationshipExt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 70
    .line 71
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 72
    .line 73
    .line 74
    move-result v0

    .line 75
    add-int/2addr p0, v0

    .line 76
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 77
    .line 78
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 79
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LikedUser$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/LikedUser;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LikedUser;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/LikedUser;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/LikedUser;-><init>()V

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
    const-string v4, ""

    .line 14
    .line 15
    if-eqz v3, :cond_b

    .line 16
    .line 17
    const/16 v5, 0xa

    .line 18
    .line 19
    if-eq v3, v5, :cond_a

    .line 20
    .line 21
    const/16 v5, 0x10

    .line 22
    .line 23
    if-eq v3, v5, :cond_9

    .line 24
    .line 25
    const/16 v5, 0x18

    .line 26
    .line 27
    if-eq v3, v5, :cond_8

    .line 28
    .line 29
    const/16 v5, 0x22

    .line 30
    .line 31
    if-eq v3, v5, :cond_7

    .line 32
    .line 33
    const/16 v5, 0x2a

    .line 34
    .line 35
    if-eq v3, v5, :cond_6

    .line 36
    .line 37
    const/16 v5, 0x32

    .line 38
    .line 39
    if-eq v3, v5, :cond_5

    .line 40
    .line 41
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 42
    .line 43
    if-nez p1, :cond_0

    .line 44
    .line 45
    if-eqz v1, :cond_0

    .line 46
    .line 47
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 48
    .line 49
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 50
    .line 51
    .line 52
    move-result v1

    .line 53
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 60
    .line 61
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 62
    .line 63
    if-nez p1, :cond_1

    .line 64
    .line 65
    if-eqz v2, :cond_1

    .line 66
    .line 67
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 68
    .line 69
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 70
    .line 71
    .line 72
    move-result v1

    .line 73
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 74
    .line 75
    .line 76
    move-result-object p1

    .line 77
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 80
    .line 81
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_2

    .line 84
    .line 85
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 86
    .line 87
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 88
    .line 89
    if-nez p1, :cond_3

    .line 90
    .line 91
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 92
    .line 93
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 94
    .line 95
    .line 96
    move-result-object p1

    .line 97
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 98
    .line 99
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 100
    .line 101
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 102
    .line 103
    if-nez p1, :cond_4

    .line 104
    .line 105
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 106
    .line 107
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 108
    .line 109
    .line 110
    move-result-object p1

    .line 111
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 112
    .line 113
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 114
    .line 115
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 116
    .line 117
    if-nez p1, :cond_11

    .line 118
    .line 119
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RelationshipExt;->new_()Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 120
    .line 121
    .line 122
    move-result-object p1

    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 124
    .line 125
    return-object p0

    .line 126
    :cond_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/RelationshipExt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 129
    .line 130
    .line 131
    move-result-object v3

    .line 132
    check-cast v3, Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 133
    .line 134
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 135
    .line 136
    goto :goto_0

    .line 137
    :cond_6
    sget-object v3, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v3

    .line 143
    check-cast v3, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 144
    .line 145
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_7
    sget-object v3, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v3

    .line 155
    check-cast v3, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 156
    .line 157
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 158
    .line 159
    goto/16 :goto_0

    .line 160
    .line 161
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 162
    .line 163
    .line 164
    move-result v2

    .line 165
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 166
    .line 167
    .line 168
    move-result-object v2

    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 172
    .line 173
    .line 174
    move-result v1

    .line 175
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 176
    .line 177
    .line 178
    move-result-object v1

    .line 179
    goto/16 :goto_0

    .line 180
    .line 181
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 182
    .line 183
    .line 184
    move-result-object v3

    .line 185
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 186
    .line 187
    goto/16 :goto_0

    .line 188
    .line 189
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 190
    .line 191
    if-nez p1, :cond_c

    .line 192
    .line 193
    if-eqz v1, :cond_c

    .line 194
    .line 195
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 196
    .line 197
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 198
    .line 199
    .line 200
    move-result v1

    .line 201
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 202
    .line 203
    .line 204
    move-result-object p1

    .line 205
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 206
    .line 207
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 208
    .line 209
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 210
    .line 211
    if-nez p1, :cond_d

    .line 212
    .line 213
    if-eqz v2, :cond_d

    .line 214
    .line 215
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 216
    .line 217
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 218
    .line 219
    .line 220
    move-result v1

    .line 221
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 222
    .line 223
    .line 224
    move-result-object p1

    .line 225
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 226
    .line 227
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 228
    .line 229
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 230
    .line 231
    if-nez p1, :cond_e

    .line 232
    .line 233
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

    .line 234
    .line 235
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 236
    .line 237
    if-nez p1, :cond_f

    .line 238
    .line 239
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 240
    .line 241
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 242
    .line 243
    .line 244
    move-result-object p1

    .line 245
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 246
    .line 247
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 248
    .line 249
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 250
    .line 251
    if-nez p1, :cond_10

    .line 252
    .line 253
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 254
    .line 255
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 256
    .line 257
    .line 258
    move-result-object p1

    .line 259
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 260
    .line 261
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 262
    .line 263
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 264
    .line 265
    if-nez p1, :cond_11

    .line 266
    .line 267
    invoke-static {}, Lcom/p1/mobile/putong/core/data/RelationshipExt;->new_()Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 268
    .line 269
    .line 270
    move-result-object p1

    .line 271
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 272
    .line 273
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

    .line 274
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/LikedUser$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/LikedUser;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 22
    .line 23
    if-eqz p0, :cond_2

    .line 24
    .line 25
    const/4 v0, 0x3

    .line 26
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 27
    .line 28
    .line 29
    move-result p0

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 31
    .line 32
    .line 33
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/4 v0, 0x4

    .line 38
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 39
    .line 40
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 41
    .line 42
    .line 43
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 v0, 0x5

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/LikedUser;->relationshipExt:Lcom/p1/mobile/putong/core/data/RelationshipExt;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/4 p1, 0x6

    .line 58
    sget-object v0, Lcom/p1/mobile/putong/core/data/RelationshipExt;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 59
    .line 60
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 61
    .line 62
    .line 63
    :cond_5
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 64
    check-cast p1, Lcom/p1/mobile/putong/core/data/LikedUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/LikedUser$1;->serialize(Lcom/p1/mobile/putong/core/data/LikedUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
