.class Lcom/p1/mobile/putong/core/data/MembershipRecommendUser$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 13
    .line 14
    if-eqz v0, :cond_1

    .line 15
    .line 16
    const/4 v1, 0x2

    .line 17
    sget-object v2, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 25
    .line 26
    if-eqz v0, :cond_2

    .line 27
    .line 28
    const/4 v1, 0x3

    .line 29
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 30
    .line 31
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 42
    .line 43
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/data/PicksTagType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 54
    .line 55
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 71
    .line 72
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 73
    check-cast p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;-><init>()V

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
    if-eqz v0, :cond_b

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_a

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_9

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_8

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_7

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_6

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_5

    .line 37
    .line 38
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

    .line 39
    .line 40
    if-nez p1, :cond_0

    .line 41
    .line 42
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

    .line 43
    .line 44
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 45
    .line 46
    if-nez p1, :cond_1

    .line 47
    .line 48
    sget-object p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 49
    .line 50
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 63
    .line 64
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 69
    .line 70
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 71
    .line 72
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 73
    .line 74
    if-nez p1, :cond_3

    .line 75
    .line 76
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 77
    .line 78
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 83
    .line 84
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 85
    .line 86
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 87
    .line 88
    if-nez p1, :cond_4

    .line 89
    .line 90
    sget-object p1, Lcom/p1/mobile/putong/core/data/PicksTagType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 91
    .line 92
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 93
    .line 94
    .line 95
    move-result-object p1

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 97
    .line 98
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 99
    .line 100
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 101
    .line 102
    if-nez p1, :cond_11

    .line 103
    .line 104
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 112
    .line 113
    goto :goto_0

    .line 114
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/core/data/PicksTagType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 117
    .line 118
    .line 119
    move-result-object v0

    .line 120
    check-cast v0, Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 121
    .line 122
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 126
    .line 127
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 128
    .line 129
    .line 130
    move-result-object v0

    .line 131
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 132
    .line 133
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 134
    .line 135
    goto/16 :goto_0

    .line 136
    .line 137
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 138
    .line 139
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 140
    .line 141
    .line 142
    move-result-object v0

    .line 143
    check-cast v0, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 144
    .line 145
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 146
    .line 147
    goto/16 :goto_0

    .line 148
    .line 149
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    check-cast v0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 156
    .line 157
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

    .line 166
    .line 167
    goto/16 :goto_0

    .line 168
    .line 169
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

    .line 170
    .line 171
    if-nez p1, :cond_c

    .line 172
    .line 173
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

    .line 174
    .line 175
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 176
    .line 177
    if-nez p1, :cond_d

    .line 178
    .line 179
    sget-object p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 180
    .line 181
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 182
    .line 183
    .line 184
    move-result-object p1

    .line 185
    check-cast p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 186
    .line 187
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 188
    .line 189
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 190
    .line 191
    if-nez p1, :cond_e

    .line 192
    .line 193
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 194
    .line 195
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 200
    .line 201
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 202
    .line 203
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 204
    .line 205
    if-nez p1, :cond_f

    .line 206
    .line 207
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 208
    .line 209
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 210
    .line 211
    .line 212
    move-result-object p1

    .line 213
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 214
    .line 215
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 216
    .line 217
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 218
    .line 219
    if-nez p1, :cond_10

    .line 220
    .line 221
    sget-object p1, Lcom/p1/mobile/putong/core/data/PicksTagType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 222
    .line 223
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 224
    .line 225
    .line 226
    move-result-object p1

    .line 227
    check-cast p1, Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 228
    .line 229
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 230
    .line 231
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 232
    .line 233
    if-nez p1, :cond_11

    .line 234
    .line 235
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 236
    .line 237
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

    .line 238
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->type:Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;

    .line 10
    .line 11
    if-eqz p0, :cond_1

    .line 12
    .line 13
    const/4 v0, 0x2

    .line 14
    sget-object v1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUserType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 15
    .line 16
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 17
    .line 18
    .line 19
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->status:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 20
    .line 21
    if-eqz p0, :cond_2

    .line 22
    .line 23
    const/4 v0, 0x3

    .line 24
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 25
    .line 26
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->otherStatus:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTagType:Lcom/p1/mobile/putong/core/data/PicksTagType;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/data/PicksTagType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;->picksTracker:Ljava/lang/String;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 p1, 0x6

    .line 54
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 55
    .line 56
    .line 57
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

    .line 58
    check-cast p1, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/MembershipRecommendUser$1;->serialize(Lcom/p1/mobile/putong/core/data/MembershipRecommendUser;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
