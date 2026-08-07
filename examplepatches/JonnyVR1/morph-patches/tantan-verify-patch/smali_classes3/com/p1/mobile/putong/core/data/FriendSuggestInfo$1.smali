.class Lcom/p1/mobile/putong/core/data/FriendSuggestInfo$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 37
    .line 38
    if-eqz v0, :cond_3

    .line 39
    .line 40
    const/4 v1, 0x4

    .line 41
    sget-object v2, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    sget-object v2, Lcom/p1/mobile/putong/core/data/InteractionType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/core/data/Relation;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

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
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 83
    .line 84
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 85
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;-><init>()V

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
    if-eqz v2, :cond_d

    .line 15
    .line 16
    const/16 v4, 0xa

    .line 17
    .line 18
    if-eq v2, v4, :cond_c

    .line 19
    .line 20
    const/16 v4, 0x12

    .line 21
    .line 22
    if-eq v2, v4, :cond_b

    .line 23
    .line 24
    const/16 v4, 0x18

    .line 25
    .line 26
    if-eq v2, v4, :cond_a

    .line 27
    .line 28
    const/16 v4, 0x22

    .line 29
    .line 30
    if-eq v2, v4, :cond_9

    .line 31
    .line 32
    const/16 v4, 0x2a

    .line 33
    .line 34
    if-eq v2, v4, :cond_8

    .line 35
    .line 36
    const/16 v4, 0x32

    .line 37
    .line 38
    if-eq v2, v4, :cond_7

    .line 39
    .line 40
    const/16 v4, 0x3a

    .line 41
    .line 42
    if-eq v2, v4, :cond_6

    .line 43
    .line 44
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 45
    .line 46
    if-nez p1, :cond_0

    .line 47
    .line 48
    if-eqz v1, :cond_0

    .line 49
    .line 50
    sget-object p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 51
    .line 52
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 53
    .line 54
    .line 55
    move-result v1

    .line 56
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 57
    .line 58
    .line 59
    move-result-object p1

    .line 60
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 61
    .line 62
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 63
    .line 64
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_1

    .line 67
    .line 68
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

    .line 69
    .line 70
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_2

    .line 73
    .line 74
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

    .line 75
    .line 76
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 77
    .line 78
    if-nez p1, :cond_3

    .line 79
    .line 80
    sget-object p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 81
    .line 82
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 83
    .line 84
    .line 85
    move-result-object p1

    .line 86
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 87
    .line 88
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 89
    .line 90
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 91
    .line 92
    if-nez p1, :cond_4

    .line 93
    .line 94
    sget-object p1, Lcom/p1/mobile/putong/core/data/InteractionType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 95
    .line 96
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 97
    .line 98
    .line 99
    move-result-object p1

    .line 100
    check-cast p1, Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 101
    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 103
    .line 104
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 105
    .line 106
    if-nez p1, :cond_5

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/core/data/Relation;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/core/data/Relation;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 117
    .line 118
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 119
    .line 120
    if-nez p1, :cond_14

    .line 121
    .line 122
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 123
    .line 124
    return-object p0

    .line 125
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 126
    .line 127
    .line 128
    move-result-object v2

    .line 129
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_7
    sget-object v2, Lcom/p1/mobile/putong/core/data/Relation;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 133
    .line 134
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 135
    .line 136
    .line 137
    move-result-object v2

    .line 138
    check-cast v2, Lcom/p1/mobile/putong/core/data/Relation;

    .line 139
    .line 140
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 141
    .line 142
    goto/16 :goto_0

    .line 143
    .line 144
    :cond_8
    sget-object v2, Lcom/p1/mobile/putong/core/data/InteractionType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 147
    .line 148
    .line 149
    move-result-object v2

    .line 150
    check-cast v2, Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 151
    .line 152
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_9
    sget-object v2, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 157
    .line 158
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    check-cast v2, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 163
    .line 164
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 169
    .line 170
    .line 171
    move-result v1

    .line 172
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 173
    .line 174
    .line 175
    move-result-object v1

    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 179
    .line 180
    .line 181
    move-result-object v2

    .line 182
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 187
    .line 188
    .line 189
    move-result-object v2

    .line 190
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 195
    .line 196
    if-nez p1, :cond_e

    .line 197
    .line 198
    if-eqz v1, :cond_e

    .line 199
    .line 200
    sget-object p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 201
    .line 202
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 203
    .line 204
    .line 205
    move-result v1

    .line 206
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 207
    .line 208
    .line 209
    move-result-object p1

    .line 210
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 211
    .line 212
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 213
    .line 214
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

    .line 215
    .line 216
    if-nez p1, :cond_f

    .line 217
    .line 218
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

    .line 219
    .line 220
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

    .line 221
    .line 222
    if-nez p1, :cond_10

    .line 223
    .line 224
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

    .line 225
    .line 226
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 227
    .line 228
    if-nez p1, :cond_11

    .line 229
    .line 230
    sget-object p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 231
    .line 232
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 233
    .line 234
    .line 235
    move-result-object p1

    .line 236
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 237
    .line 238
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 239
    .line 240
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 241
    .line 242
    if-nez p1, :cond_12

    .line 243
    .line 244
    sget-object p1, Lcom/p1/mobile/putong/core/data/InteractionType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 245
    .line 246
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 247
    .line 248
    .line 249
    move-result-object p1

    .line 250
    check-cast p1, Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 251
    .line 252
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 253
    .line 254
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 255
    .line 256
    if-nez p1, :cond_13

    .line 257
    .line 258
    sget-object p1, Lcom/p1/mobile/putong/core/data/Relation;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 259
    .line 260
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 261
    .line 262
    .line 263
    move-result-object p1

    .line 264
    check-cast p1, Lcom/p1/mobile/putong/core/data/Relation;

    .line 265
    .line 266
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 267
    .line 268
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 269
    .line 270
    if-nez p1, :cond_14

    .line 271
    .line 272
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 273
    .line 274
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

    .line 275
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->forceText:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->text:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 23
    .line 24
    .line 25
    move-result p0

    .line 26
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->reason:Lcom/p1/mobile/putong/core/data/FriendSuggestReason;

    .line 30
    .line 31
    if-eqz p0, :cond_3

    .line 32
    .line 33
    const/4 v0, 0x4

    .line 34
    sget-object v1, Lcom/p1/mobile/putong/core/data/FriendSuggestReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 35
    .line 36
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->interactionType:Lcom/p1/mobile/putong/core/data/InteractionType;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    sget-object v1, Lcom/p1/mobile/putong/core/data/InteractionType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->relation:Lcom/p1/mobile/putong/core/data/Relation;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/core/data/Relation;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;->roomId:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_6

    .line 62
    .line 63
    const/4 p1, 0x7

    .line 64
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 65
    .line 66
    .line 67
    :cond_6
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 68
    check-cast p1, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/FriendSuggestInfo$1;->serialize(Lcom/p1/mobile/putong/core/data/FriendSuggestInfo;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
