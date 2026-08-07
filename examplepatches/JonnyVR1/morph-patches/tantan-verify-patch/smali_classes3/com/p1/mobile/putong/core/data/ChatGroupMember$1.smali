.class Lcom/p1/mobile/putong/core/data/ChatGroupMember$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/ChatGroupMember;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/ChatGroupMember;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    const/16 v1, 0x35

    .line 45
    .line 46
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 47
    .line 48
    .line 49
    move-result v0

    .line 50
    add-int/2addr p0, v0

    .line 51
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz v0, :cond_4

    .line 54
    .line 55
    const/16 v1, 0x36

    .line 56
    .line 57
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 63
    .line 64
    if-eqz v0, :cond_5

    .line 65
    .line 66
    const/16 v1, 0x37

    .line 67
    .line 68
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 69
    .line 70
    .line 71
    move-result v0

    .line 72
    add-int/2addr p0, v0

    .line 73
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 74
    .line 75
    if-eqz v0, :cond_6

    .line 76
    .line 77
    const/16 v1, 0x38

    .line 78
    .line 79
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/16 v2, 0x39

    .line 95
    .line 96
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0x3a

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0x3b

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_9
    const/16 v0, 0x3c

    .line 128
    .line 129
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 130
    .line 131
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 132
    .line 133
    .line 134
    move-result v0

    .line 135
    add-int/2addr p0, v0

    .line 136
    const/16 v0, 0x3d

    .line 137
    .line 138
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 139
    .line 140
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    const/16 v0, 0x3e

    .line 146
    .line 147
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 148
    .line 149
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 150
    .line 151
    .line 152
    move-result v0

    .line 153
    add-int/2addr p0, v0

    .line 154
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 155
    .line 156
    if-eqz v0, :cond_a

    .line 157
    .line 158
    const/16 v1, 0x3f

    .line 159
    .line 160
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 163
    .line 164
    .line 165
    move-result v0

    .line 166
    add-int/2addr p0, v0

    .line 167
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 168
    .line 169
    if-eqz v0, :cond_b

    .line 170
    .line 171
    const/16 v1, 0x40

    .line 172
    .line 173
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 176
    .line 177
    .line 178
    move-result v0

    .line 179
    add-int/2addr p0, v0

    .line 180
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 181
    .line 182
    if-eqz v0, :cond_c

    .line 183
    .line 184
    const/16 v1, 0x41

    .line 185
    .line 186
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 187
    .line 188
    .line 189
    move-result v0

    .line 190
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 191
    .line 192
    .line 193
    move-result v0

    .line 194
    add-int/2addr p0, v0

    .line 195
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 196
    .line 197
    if-eqz v0, :cond_d

    .line 198
    .line 199
    const/16 v1, 0x42

    .line 200
    .line 201
    sget-object v2, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 202
    .line 203
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 204
    .line 205
    .line 206
    move-result v0

    .line 207
    add-int/2addr p0, v0

    .line 208
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 209
    .line 210
    if-eqz v0, :cond_e

    .line 211
    .line 212
    const/16 v1, 0x43

    .line 213
    .line 214
    sget-object v2, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 215
    .line 216
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 217
    .line 218
    .line 219
    move-result v0

    .line 220
    add-int/2addr p0, v0

    .line 221
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 222
    .line 223
    if-eqz v0, :cond_f

    .line 224
    .line 225
    const/16 v1, 0x44

    .line 226
    .line 227
    sget-object v2, Lcom/p1/mobile/putong/core/data/InModeration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 228
    .line 229
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    add-int/2addr p0, v0

    .line 234
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 235
    .line 236
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/ChatGroupMember;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/ChatGroupMember;-><init>()V

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
    sparse-switch v3, :sswitch_data_0

    .line 16
    .line 17
    .line 18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 19
    .line 20
    if-nez p1, :cond_0

    .line 21
    .line 22
    if-eqz v1, :cond_0

    .line 23
    .line 24
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 25
    .line 26
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 27
    .line 28
    .line 29
    move-result v1

    .line 30
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 31
    .line 32
    .line 33
    move-result-object p1

    .line 34
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 35
    .line 36
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 37
    .line 38
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 39
    .line 40
    if-nez p1, :cond_1

    .line 41
    .line 42
    if-eqz v2, :cond_1

    .line 43
    .line 44
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 45
    .line 46
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 47
    .line 48
    .line 49
    move-result v1

    .line 50
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 51
    .line 52
    .line 53
    move-result-object p1

    .line 54
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 55
    .line 56
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 57
    .line 58
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 59
    .line 60
    if-nez p1, :cond_2

    .line 61
    .line 62
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 63
    .line 64
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 65
    .line 66
    if-nez p1, :cond_3

    .line 67
    .line 68
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 75
    .line 76
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_5

    .line 79
    .line 80
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 81
    .line 82
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_6

    .line 85
    .line 86
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 87
    .line 88
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_7

    .line 91
    .line 92
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 93
    .line 94
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 95
    .line 96
    if-nez p1, :cond_8

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 104
    .line 105
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_9

    .line 108
    .line 109
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 110
    .line 111
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 112
    .line 113
    if-nez p1, :cond_a

    .line 114
    .line 115
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 116
    .line 117
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 118
    .line 119
    .line 120
    move-result-object p1

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 122
    .line 123
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 124
    .line 125
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 126
    .line 127
    if-nez p1, :cond_b

    .line 128
    .line 129
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 130
    .line 131
    .line 132
    move-result-object p1

    .line 133
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 134
    .line 135
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 136
    .line 137
    if-nez p1, :cond_c

    .line 138
    .line 139
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 140
    .line 141
    .line 142
    move-result-object p1

    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 144
    .line 145
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 146
    .line 147
    if-nez p1, :cond_d

    .line 148
    .line 149
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 150
    .line 151
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 152
    .line 153
    .line 154
    move-result-object p1

    .line 155
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 156
    .line 157
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 158
    .line 159
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 160
    .line 161
    if-nez p1, :cond_1c

    .line 162
    .line 163
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 164
    .line 165
    .line 166
    move-result-object p1

    .line 167
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 168
    .line 169
    return-object p0

    .line 170
    :sswitch_0
    sget-object v3, Lcom/p1/mobile/putong/core/data/InModeration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 173
    .line 174
    .line 175
    move-result-object v3

    .line 176
    check-cast v3, Lcom/p1/mobile/putong/core/data/InModeration;

    .line 177
    .line 178
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 179
    .line 180
    goto/16 :goto_0

    .line 181
    .line 182
    :sswitch_1
    sget-object v3, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 185
    .line 186
    .line 187
    move-result-object v3

    .line 188
    check-cast v3, Lcom/p1/mobile/putong/data/Gender;

    .line 189
    .line 190
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_2
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 195
    .line 196
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 197
    .line 198
    .line 199
    move-result-object v3

    .line 200
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 201
    .line 202
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 203
    .line 204
    goto/16 :goto_0

    .line 205
    .line 206
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 207
    .line 208
    .line 209
    move-result v2

    .line 210
    invoke-static {v2}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 211
    .line 212
    .line 213
    move-result-object v2

    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :sswitch_4
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 217
    .line 218
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 219
    .line 220
    .line 221
    move-result-object v3

    .line 222
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 223
    .line 224
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_5
    sget-object v3, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 231
    .line 232
    .line 233
    move-result-object v3

    .line 234
    check-cast v3, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 235
    .line 236
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 241
    .line 242
    .line 243
    move-result-wide v3

    .line 244
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 249
    .line 250
    .line 251
    move-result-wide v3

    .line 252
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 253
    .line 254
    goto/16 :goto_0

    .line 255
    .line 256
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 257
    .line 258
    .line 259
    move-result-wide v3

    .line 260
    iput-wide v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 261
    .line 262
    goto/16 :goto_0

    .line 263
    .line 264
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 265
    .line 266
    .line 267
    move-result v1

    .line 268
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 269
    .line 270
    .line 271
    move-result-object v1

    .line 272
    goto/16 :goto_0

    .line 273
    .line 274
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 275
    .line 276
    .line 277
    move-result-object v3

    .line 278
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 279
    .line 280
    goto/16 :goto_0

    .line 281
    .line 282
    :sswitch_b
    sget-object v3, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 283
    .line 284
    invoke-virtual {v3}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 285
    .line 286
    .line 287
    move-result-object v3

    .line 288
    invoke-virtual {p1, v3}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 289
    .line 290
    .line 291
    move-result-object v3

    .line 292
    check-cast v3, Ljava/util/List;

    .line 293
    .line 294
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 295
    .line 296
    goto/16 :goto_0

    .line 297
    .line 298
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 299
    .line 300
    .line 301
    move-result-object v3

    .line 302
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 303
    .line 304
    goto/16 :goto_0

    .line 305
    .line 306
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 307
    .line 308
    .line 309
    move-result-object v3

    .line 310
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 311
    .line 312
    goto/16 :goto_0

    .line 313
    .line 314
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 315
    .line 316
    .line 317
    move-result-object v3

    .line 318
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 319
    .line 320
    goto/16 :goto_0

    .line 321
    .line 322
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 323
    .line 324
    .line 325
    move-result-object v3

    .line 326
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 327
    .line 328
    goto/16 :goto_0

    .line 329
    .line 330
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 331
    .line 332
    .line 333
    move-result-object v3

    .line 334
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 335
    .line 336
    goto/16 :goto_0

    .line 337
    .line 338
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 339
    .line 340
    .line 341
    move-result-object v3

    .line 342
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 343
    .line 344
    goto/16 :goto_0

    .line 345
    .line 346
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 347
    .line 348
    .line 349
    move-result-object v3

    .line 350
    iput-object v3, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 351
    .line 352
    goto/16 :goto_0

    .line 353
    .line 354
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 355
    .line 356
    .line 357
    move-result-wide v3

    .line 358
    iput-wide v3, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 359
    .line 360
    goto/16 :goto_0

    .line 361
    .line 362
    :sswitch_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 363
    .line 364
    if-nez p1, :cond_e

    .line 365
    .line 366
    if-eqz v1, :cond_e

    .line 367
    .line 368
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 369
    .line 370
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 371
    .line 372
    .line 373
    move-result v1

    .line 374
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 375
    .line 376
    .line 377
    move-result-object p1

    .line 378
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 379
    .line 380
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 381
    .line 382
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 383
    .line 384
    if-nez p1, :cond_f

    .line 385
    .line 386
    if-eqz v2, :cond_f

    .line 387
    .line 388
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 389
    .line 390
    invoke-virtual {v2}, Ljava/lang/Integer;->intValue()I

    .line 391
    .line 392
    .line 393
    move-result v1

    .line 394
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 395
    .line 396
    .line 397
    move-result-object p1

    .line 398
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 399
    .line 400
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 401
    .line 402
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 403
    .line 404
    if-nez p1, :cond_10

    .line 405
    .line 406
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

    .line 407
    .line 408
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 409
    .line 410
    if-nez p1, :cond_11

    .line 411
    .line 412
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

    .line 413
    .line 414
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 415
    .line 416
    if-nez p1, :cond_12

    .line 417
    .line 418
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 419
    .line 420
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 421
    .line 422
    if-nez p1, :cond_13

    .line 423
    .line 424
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 425
    .line 426
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 427
    .line 428
    if-nez p1, :cond_14

    .line 429
    .line 430
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 431
    .line 432
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 433
    .line 434
    if-nez p1, :cond_15

    .line 435
    .line 436
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 437
    .line 438
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 439
    .line 440
    if-nez p1, :cond_16

    .line 441
    .line 442
    new-instance p1, Ljava/util/ArrayList;

    .line 443
    .line 444
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 445
    .line 446
    .line 447
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 448
    .line 449
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 450
    .line 451
    if-nez p1, :cond_17

    .line 452
    .line 453
    iput-object v4, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 454
    .line 455
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 456
    .line 457
    if-nez p1, :cond_18

    .line 458
    .line 459
    sget-object p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 460
    .line 461
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 462
    .line 463
    .line 464
    move-result-object p1

    .line 465
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 466
    .line 467
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 468
    .line 469
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 470
    .line 471
    if-nez p1, :cond_19

    .line 472
    .line 473
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 474
    .line 475
    .line 476
    move-result-object p1

    .line 477
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 478
    .line 479
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 480
    .line 481
    if-nez p1, :cond_1a

    .line 482
    .line 483
    invoke-static {}, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->new_()Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 484
    .line 485
    .line 486
    move-result-object p1

    .line 487
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 488
    .line 489
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 490
    .line 491
    if-nez p1, :cond_1b

    .line 492
    .line 493
    sget-object p1, Lcom/p1/mobile/putong/data/Gender;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 494
    .line 495
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 496
    .line 497
    .line 498
    move-result-object p1

    .line 499
    check-cast p1, Lcom/p1/mobile/putong/data/Gender;

    .line 500
    .line 501
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 502
    .line 503
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 504
    .line 505
    if-nez p1, :cond_1c

    .line 506
    .line 507
    invoke-static {}, Lcom/p1/mobile/putong/core/data/InModeration;->new_()Lcom/p1/mobile/putong/core/data/InModeration;

    .line 508
    .line 509
    .line 510
    move-result-object p1

    .line 511
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 512
    .line 513
    :cond_1c
    return-object p0

    .line 514
    nop

    .line 515
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_14
        0x8 -> :sswitch_13
        0x12 -> :sswitch_12
        0x19a -> :sswitch_11
        0x1a2 -> :sswitch_10
        0x1aa -> :sswitch_f
        0x1b2 -> :sswitch_e
        0x1ba -> :sswitch_d
        0x1c2 -> :sswitch_c
        0x1ca -> :sswitch_b
        0x1d2 -> :sswitch_a
        0x1d8 -> :sswitch_9
        0x1e1 -> :sswitch_8
        0x1e9 -> :sswitch_7
        0x1f1 -> :sswitch_6
        0x1fa -> :sswitch_5
        0x202 -> :sswitch_4
        0x208 -> :sswitch_3
        0x212 -> :sswitch_2
        0x21a -> :sswitch_1
        0x222 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 515
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->groupId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickName:Ljava/lang/String;

    .line 34
    .line 35
    if-eqz p0, :cond_3

    .line 36
    .line 37
    const/16 v0, 0x35

    .line 38
    .line 39
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 40
    .line 41
    .line 42
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->userName:Ljava/lang/String;

    .line 43
    .line 44
    if-eqz p0, :cond_4

    .line 45
    .line 46
    const/16 v0, 0x36

    .line 47
    .line 48
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 49
    .line 50
    .line 51
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->nickNamePinyin:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_5

    .line 54
    .line 55
    const/16 v0, 0x37

    .line 56
    .line 57
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 58
    .line 59
    .line 60
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->avatar:Ljava/lang/String;

    .line 61
    .line 62
    if-eqz p0, :cond_6

    .line 63
    .line 64
    const/16 v0, 0x38

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchIndices:Ljava/util/List;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/16 v1, 0x39

    .line 80
    .line 81
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->searchCategory:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_8

    .line 87
    .line 88
    const/16 v0, 0x3a

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0x3b

    .line 98
    .line 99
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 100
    .line 101
    .line 102
    move-result p0

    .line 103
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 104
    .line 105
    .line 106
    :cond_9
    const/16 p0, 0x3c

    .line 107
    .line 108
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->joinTime:D

    .line 109
    .line 110
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 111
    .line 112
    .line 113
    const/16 p0, 0x3d

    .line 114
    .line 115
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->createdTime:D

    .line 116
    .line 117
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 118
    .line 119
    .line 120
    const/16 p0, 0x3e

    .line 121
    .line 122
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->updatedTime:D

    .line 123
    .line 124
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 125
    .line 126
    .line 127
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->silence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 128
    .line 129
    if-eqz p0, :cond_a

    .line 130
    .line 131
    const/16 v0, 0x3f

    .line 132
    .line 133
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 136
    .line 137
    .line 138
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->operationSilence:Lcom/p1/mobile/putong/core/data/ChatGroupSilence;

    .line 139
    .line 140
    if-eqz p0, :cond_b

    .line 141
    .line 142
    const/16 v0, 0x40

    .line 143
    .line 144
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupSilence;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 145
    .line 146
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 147
    .line 148
    .line 149
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 150
    .line 151
    if-eqz p0, :cond_c

    .line 152
    .line 153
    const/16 v0, 0x41

    .line 154
    .line 155
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 156
    .line 157
    .line 158
    move-result p0

    .line 159
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 160
    .line 161
    .line 162
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->status:Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;

    .line 163
    .line 164
    if-eqz p0, :cond_d

    .line 165
    .line 166
    const/16 v0, 0x42

    .line 167
    .line 168
    sget-object v1, Lcom/p1/mobile/putong/core/data/ChatGroupMemberStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 169
    .line 170
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 171
    .line 172
    .line 173
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->gender:Lcom/p1/mobile/putong/data/Gender;

    .line 174
    .line 175
    if-eqz p0, :cond_e

    .line 176
    .line 177
    const/16 v0, 0x43

    .line 178
    .line 179
    sget-object v1, Lcom/p1/mobile/putong/data/Gender;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 180
    .line 181
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 182
    .line 183
    .line 184
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;->inModeration:Lcom/p1/mobile/putong/core/data/InModeration;

    .line 185
    .line 186
    if-eqz p0, :cond_f

    .line 187
    .line 188
    const/16 p1, 0x44

    .line 189
    .line 190
    sget-object v0, Lcom/p1/mobile/putong/core/data/InModeration;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 191
    .line 192
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 193
    .line 194
    .line 195
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

    .line 196
    check-cast p1, Lcom/p1/mobile/putong/core/data/ChatGroupMember;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/ChatGroupMember$1;->serialize(Lcom/p1/mobile/putong/core/data/ChatGroupMember;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
