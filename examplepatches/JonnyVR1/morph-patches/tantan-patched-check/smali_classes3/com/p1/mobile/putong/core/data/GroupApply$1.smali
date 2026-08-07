.class Lcom/p1/mobile/putong/core/data/GroupApply$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/GroupApply;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/GroupApply;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GroupApply;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    const/4 v1, 0x3

    .line 27
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 28
    .line 29
    .line 30
    move-result v0

    .line 31
    add-int/2addr p0, v0

    .line 32
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    add-int/2addr p0, v0

    .line 42
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    const/4 v1, 0x5

    .line 47
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 48
    .line 49
    .line 50
    move-result v0

    .line 51
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_4
    const/4 v0, 0x6

    .line 57
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->createdTime:D

    .line 58
    .line 59
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    const/4 v0, 0x7

    .line 65
    iget-wide v1, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->updatedTime:D

    .line 66
    .line 67
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 68
    .line 69
    .line 70
    move-result v0

    .line 71
    add-int/2addr p0, v0

    .line 72
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/16 v1, 0x8

    .line 77
    .line 78
    sget-object v2, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

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
    :cond_5
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 86
    .line 87
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 88
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApply;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GroupApply$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/GroupApply;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GroupApply;
    .locals 5
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/GroupApply;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/GroupApply;-><init>()V

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
    const/16 v4, 0x1a

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
    const/16 v4, 0x28

    .line 33
    .line 34
    if-eq v2, v4, :cond_8

    .line 35
    .line 36
    const/16 v4, 0x31

    .line 37
    .line 38
    if-eq v2, v4, :cond_7

    .line 39
    .line 40
    const/16 v4, 0x39

    .line 41
    .line 42
    if-eq v2, v4, :cond_6

    .line 43
    .line 44
    const/16 v4, 0x42

    .line 45
    .line 46
    if-eq v2, v4, :cond_5

    .line 47
    .line 48
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 49
    .line 50
    if-nez p1, :cond_0

    .line 51
    .line 52
    if-eqz v1, :cond_0

    .line 53
    .line 54
    sget-object p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 67
    .line 68
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_1

    .line 71
    .line 72
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 73
    .line 74
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 75
    .line 76
    if-nez p1, :cond_2

    .line 77
    .line 78
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 79
    .line 80
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 81
    .line 82
    if-nez p1, :cond_3

    .line 83
    .line 84
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 85
    .line 86
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 87
    .line 88
    if-nez p1, :cond_4

    .line 89
    .line 90
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 91
    .line 92
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 93
    .line 94
    if-nez p1, :cond_13

    .line 95
    .line 96
    sget-object p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 97
    .line 98
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 103
    .line 104
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 105
    .line 106
    return-object p0

    .line 107
    :cond_5
    sget-object v2, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 108
    .line 109
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 110
    .line 111
    .line 112
    move-result-object v2

    .line 113
    check-cast v2, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 114
    .line 115
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 116
    .line 117
    goto :goto_0

    .line 118
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 119
    .line 120
    .line 121
    move-result-wide v2

    .line 122
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->updatedTime:D

    .line 123
    .line 124
    goto :goto_0

    .line 125
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 126
    .line 127
    .line 128
    move-result-wide v2

    .line 129
    iput-wide v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->createdTime:D

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 133
    .line 134
    .line 135
    move-result v1

    .line 136
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 137
    .line 138
    .line 139
    move-result-object v1

    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 143
    .line 144
    .line 145
    move-result-object v2

    .line 146
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 147
    .line 148
    goto/16 :goto_0

    .line 149
    .line 150
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 151
    .line 152
    .line 153
    move-result-object v2

    .line 154
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 155
    .line 156
    goto/16 :goto_0

    .line 157
    .line 158
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 159
    .line 160
    .line 161
    move-result-object v2

    .line 162
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 163
    .line 164
    goto/16 :goto_0

    .line 165
    .line 166
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    iput-object v2, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 171
    .line 172
    goto/16 :goto_0

    .line 173
    .line 174
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 175
    .line 176
    if-nez p1, :cond_e

    .line 177
    .line 178
    if-eqz v1, :cond_e

    .line 179
    .line 180
    sget-object p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 181
    .line 182
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 183
    .line 184
    .line 185
    move-result v1

    .line 186
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 187
    .line 188
    .line 189
    move-result-object p1

    .line 190
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 191
    .line 192
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 193
    .line 194
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 195
    .line 196
    if-nez p1, :cond_f

    .line 197
    .line 198
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

    .line 199
    .line 200
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 201
    .line 202
    if-nez p1, :cond_10

    .line 203
    .line 204
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

    .line 205
    .line 206
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 207
    .line 208
    if-nez p1, :cond_11

    .line 209
    .line 210
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 211
    .line 212
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 213
    .line 214
    if-nez p1, :cond_12

    .line 215
    .line 216
    iput-object v3, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 217
    .line 218
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 219
    .line 220
    if-nez p1, :cond_13

    .line 221
    .line 222
    sget-object p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 223
    .line 224
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 225
    .line 226
    .line 227
    move-result-object p1

    .line 228
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 229
    .line 230
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 231
    .line 232
    :cond_13
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
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/GroupApply$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/GroupApply;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/GroupApply;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->groupId:Ljava/lang/String;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    const/4 v0, 0x3

    .line 22
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 23
    .line 24
    .line 25
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->reason:Ljava/lang/String;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 31
    .line 32
    .line 33
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    const/4 v0, 0x5

    .line 38
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 39
    .line 40
    .line 41
    move-result p0

    .line 42
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    :cond_4
    const/4 p0, 0x6

    .line 46
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->createdTime:D

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 49
    .line 50
    .line 51
    const/4 p0, 0x7

    .line 52
    iget-wide v0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->updatedTime:D

    .line 53
    .line 54
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 55
    .line 56
    .line 57
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/GroupApply;->status:Lcom/p1/mobile/putong/core/data/GroupApplyStatus;

    .line 58
    .line 59
    if-eqz p0, :cond_5

    .line 60
    .line 61
    const/16 p1, 0x8

    .line 62
    .line 63
    sget-object v0, Lcom/p1/mobile/putong/core/data/GroupApplyStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 64
    .line 65
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 66
    .line 67
    .line 68
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

    .line 69
    check-cast p1, Lcom/p1/mobile/putong/core/data/GroupApply;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/GroupApply$1;->serialize(Lcom/p1/mobile/putong/core/data/GroupApply;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
