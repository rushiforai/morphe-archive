.class Lcom/p1/mobile/putong/data/Followship$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Followship;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Followship;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Followship;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 38
    .line 39
    .line 40
    move-result v0

    .line 41
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 42
    .line 43
    .line 44
    move-result v0

    .line 45
    add-int/2addr p0, v0

    .line 46
    :cond_3
    const/4 v0, 0x5

    .line 47
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 48
    .line 49
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/4 v0, 0x6

    .line 55
    iget-wide v1, p1, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 56
    .line 57
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 58
    .line 59
    .line 60
    move-result v0

    .line 61
    add-int/2addr p0, v0

    .line 62
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 63
    .line 64
    if-eqz v0, :cond_4

    .line 65
    .line 66
    invoke-static {v0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 67
    .line 68
    .line 69
    move-result-object v0

    .line 70
    sget-object v1, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 71
    .line 72
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    .line 75
    move-result-object v1

    .line 76
    const/4 v2, 0x7

    .line 77
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 78
    .line 79
    .line 80
    move-result v0

    .line 81
    add-int/2addr p0, v0

    .line 82
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 83
    .line 84
    if-eqz v0, :cond_5

    .line 85
    .line 86
    const/16 v1, 0x8

    .line 87
    .line 88
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 89
    .line 90
    .line 91
    move-result v0

    .line 92
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 98
    .line 99
    if-eqz v0, :cond_6

    .line 100
    .line 101
    const/16 v1, 0x9

    .line 102
    .line 103
    sget-object v2, Lcom/p1/mobile/putong/data/FollowshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 104
    .line 105
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    add-int/2addr p0, v0

    .line 110
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 111
    .line 112
    if-eqz v0, :cond_7

    .line 113
    .line 114
    sget-object v1, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 115
    .line 116
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    .line 119
    move-result-object v1

    .line 120
    const/16 v2, 0xa

    .line 121
    .line 122
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 123
    .line 124
    .line 125
    move-result v0

    .line 126
    add-int/2addr p0, v0

    .line 127
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 128
    .line 129
    if-eqz v0, :cond_8

    .line 130
    .line 131
    const/16 v1, 0xb

    .line 132
    .line 133
    sget-object v2, Lcom/p1/mobile/putong/data/FollowshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 134
    .line 135
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 136
    .line 137
    .line 138
    move-result v0

    .line 139
    add-int/2addr p0, v0

    .line 140
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 141
    .line 142
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 143
    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Followship$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Followship;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Followship;
    .locals 6
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Followship;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Followship;-><init>()V

    .line 4
    .line 5
    .line 6
    const/4 v0, 0x0

    .line 7
    move-object v1, v0

    .line 8
    move-object v2, v1

    .line 9
    move-object v3, v2

    .line 10
    :goto_0
    invoke-virtual {p1}, Ll/nc5;->u()I

    .line 11
    .line 12
    .line 13
    move-result v4

    .line 14
    const-string v5, ""

    .line 15
    .line 16
    sparse-switch v4, :sswitch_data_0

    .line 17
    .line 18
    .line 19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 20
    .line 21
    if-nez p1, :cond_0

    .line 22
    .line 23
    if-eqz v1, :cond_0

    .line 24
    .line 25
    sget-object p1, Lcom/p1/mobile/putong/data/FollowshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 26
    .line 27
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 28
    .line 29
    .line 30
    move-result v1

    .line 31
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 32
    .line 33
    .line 34
    move-result-object p1

    .line 35
    check-cast p1, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 36
    .line 37
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 38
    .line 39
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 40
    .line 41
    if-nez p1, :cond_1

    .line 42
    .line 43
    if-eqz v2, :cond_1

    .line 44
    .line 45
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 46
    .line 47
    .line 48
    move-result-object p1

    .line 49
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 50
    .line 51
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 52
    .line 53
    if-nez p1, :cond_2

    .line 54
    .line 55
    if-eqz v3, :cond_2

    .line 56
    .line 57
    sget-object p1, Lcom/p1/mobile/putong/data/FollowshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 58
    .line 59
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

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
    check-cast p1, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 68
    .line 69
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 70
    .line 71
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

    .line 72
    .line 73
    if-nez p1, :cond_3

    .line 74
    .line 75
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

    .line 76
    .line 77
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

    .line 78
    .line 79
    if-nez p1, :cond_4

    .line 80
    .line 81
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

    .line 82
    .line 83
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 84
    .line 85
    if-nez p1, :cond_5

    .line 86
    .line 87
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 88
    .line 89
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 90
    .line 91
    if-nez p1, :cond_6

    .line 92
    .line 93
    sget-object p1, Lcom/p1/mobile/putong/data/FollowshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 94
    .line 95
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 96
    .line 97
    .line 98
    move-result-object p1

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 100
    .line 101
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 102
    .line 103
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 104
    .line 105
    if-nez p1, :cond_e

    .line 106
    .line 107
    new-instance p1, Ljava/util/ArrayList;

    .line 108
    .line 109
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 110
    .line 111
    .line 112
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 113
    .line 114
    return-object p0

    .line 115
    :sswitch_0
    sget-object v4, Lcom/p1/mobile/putong/data/FollowshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 116
    .line 117
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 118
    .line 119
    .line 120
    move-result-object v4

    .line 121
    check-cast v4, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 122
    .line 123
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :sswitch_1
    sget-object v4, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 127
    .line 128
    invoke-virtual {v4}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 129
    .line 130
    .line 131
    move-result-object v4

    .line 132
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 133
    .line 134
    .line 135
    move-result-object v4

    .line 136
    check-cast v4, Ljava/util/List;

    .line 137
    .line 138
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 139
    .line 140
    goto/16 :goto_0

    .line 141
    .line 142
    :sswitch_2
    sget-object v4, Lcom/p1/mobile/putong/data/FollowshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 143
    .line 144
    invoke-virtual {p1, v4}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 145
    .line 146
    .line 147
    move-result-object v4

    .line 148
    check-cast v4, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 149
    .line 150
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 151
    .line 152
    goto/16 :goto_0

    .line 153
    .line 154
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 155
    .line 156
    .line 157
    move-result v3

    .line 158
    invoke-static {v3}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 159
    .line 160
    .line 161
    move-result-object v3

    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 165
    .line 166
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 167
    .line 168
    .line 169
    move-result-object v2

    .line 170
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 171
    .line 172
    .line 173
    move-result-object v2

    .line 174
    check-cast v2, Ljava/util/List;

    .line 175
    .line 176
    goto/16 :goto_0

    .line 177
    .line 178
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 179
    .line 180
    .line 181
    move-result-wide v4

    .line 182
    iput-wide v4, p0, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 183
    .line 184
    goto/16 :goto_0

    .line 185
    .line 186
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 187
    .line 188
    .line 189
    move-result-wide v4

    .line 190
    iput-wide v4, p0, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 191
    .line 192
    goto/16 :goto_0

    .line 193
    .line 194
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 195
    .line 196
    .line 197
    move-result v1

    .line 198
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 199
    .line 200
    .line 201
    move-result-object v1

    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v4

    .line 208
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 213
    .line 214
    .line 215
    move-result-object v4

    .line 216
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 221
    .line 222
    .line 223
    move-result-object v4

    .line 224
    iput-object v4, p0, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 229
    .line 230
    if-nez p1, :cond_7

    .line 231
    .line 232
    if-eqz v1, :cond_7

    .line 233
    .line 234
    sget-object p1, Lcom/p1/mobile/putong/data/FollowshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 235
    .line 236
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 237
    .line 238
    .line 239
    move-result v1

    .line 240
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 241
    .line 242
    .line 243
    move-result-object p1

    .line 244
    check-cast p1, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 245
    .line 246
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 247
    .line 248
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 249
    .line 250
    if-nez p1, :cond_8

    .line 251
    .line 252
    if-eqz v2, :cond_8

    .line 253
    .line 254
    invoke-static {v2}, Lcom/p1/mobile/putong/data/MatchFrom;->oldEnumCovertList(Ljava/util/List;)Ljava/util/List;

    .line 255
    .line 256
    .line 257
    move-result-object p1

    .line 258
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 259
    .line 260
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 261
    .line 262
    if-nez p1, :cond_9

    .line 263
    .line 264
    if-eqz v3, :cond_9

    .line 265
    .line 266
    sget-object p1, Lcom/p1/mobile/putong/data/FollowshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 267
    .line 268
    invoke-virtual {v3}, Ljava/lang/Integer;->intValue()I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 273
    .line 274
    .line 275
    move-result-object p1

    .line 276
    check-cast p1, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 277
    .line 278
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 279
    .line 280
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

    .line 281
    .line 282
    if-nez p1, :cond_a

    .line 283
    .line 284
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

    .line 285
    .line 286
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

    .line 287
    .line 288
    if-nez p1, :cond_b

    .line 289
    .line 290
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

    .line 291
    .line 292
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 293
    .line 294
    if-nez p1, :cond_c

    .line 295
    .line 296
    iput-object v5, p0, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

    .line 297
    .line 298
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 299
    .line 300
    if-nez p1, :cond_d

    .line 301
    .line 302
    sget-object p1, Lcom/p1/mobile/putong/data/FollowshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 303
    .line 304
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 305
    .line 306
    .line 307
    move-result-object p1

    .line 308
    check-cast p1, Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 309
    .line 310
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 311
    .line 312
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 313
    .line 314
    if-nez p1, :cond_e

    .line 315
    .line 316
    new-instance p1, Ljava/util/ArrayList;

    .line 317
    .line 318
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 319
    .line 320
    .line 321
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 322
    .line 323
    :cond_e
    return-object p0

    .line 324
    nop

    .line 325
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x1a -> :sswitch_8
        0x20 -> :sswitch_7
        0x29 -> :sswitch_6
        0x31 -> :sswitch_5
        0x3a -> :sswitch_4
        0x40 -> :sswitch_3
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

    .line 325
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Followship$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Followship;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Followship;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->owner:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->otherUser:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 31
    .line 32
    .line 33
    move-result p0

    .line 34
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 35
    .line 36
    .line 37
    :cond_3
    const/4 p0, 0x5

    .line 38
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Followship;->userTime:D

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 41
    .line 42
    .line 43
    const/4 p0, 0x6

    .line 44
    iget-wide v0, p1, Lcom/p1/mobile/putong/data/Followship;->otherUserTime:D

    .line 45
    .line 46
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 47
    .line 48
    .line 49
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    invoke-static {p0}, Lcom/p1/mobile/putong/data/MatchFrom;->covertToOldEnumList(Ljava/util/List;)Ljava/util/List;

    .line 54
    .line 55
    .line 56
    move-result-object p0

    .line 57
    sget-object v0, Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/OldEnumProtobufAdapter;

    .line 58
    .line 59
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 60
    .line 61
    .line 62
    move-result-object v0

    .line 63
    const/4 v1, 0x7

    .line 64
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 65
    .line 66
    .line 67
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 68
    .line 69
    if-eqz p0, :cond_5

    .line 70
    .line 71
    const/16 v0, 0x8

    .line 72
    .line 73
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 74
    .line 75
    .line 76
    move-result p0

    .line 77
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 78
    .line 79
    .line 80
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->state:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 81
    .line 82
    if-eqz p0, :cond_6

    .line 83
    .line 84
    const/16 v0, 0x9

    .line 85
    .line 86
    sget-object v1, Lcom/p1/mobile/putong/data/FollowshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 87
    .line 88
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 89
    .line 90
    .line 91
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->status:Ljava/util/List;

    .line 92
    .line 93
    if-eqz p0, :cond_7

    .line 94
    .line 95
    sget-object v0, Lcom/p1/mobile/putong/data/MatchFrom;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 96
    .line 97
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 98
    .line 99
    .line 100
    move-result-object v0

    .line 101
    const/16 v1, 0xa

    .line 102
    .line 103
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 104
    .line 105
    .line 106
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Followship;->maskState:Lcom/p1/mobile/putong/data/FollowshipStatus;

    .line 107
    .line 108
    if-eqz p0, :cond_8

    .line 109
    .line 110
    const/16 p1, 0xb

    .line 111
    .line 112
    sget-object v0, Lcom/p1/mobile/putong/data/FollowshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 113
    .line 114
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 115
    .line 116
    .line 117
    :cond_8
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 118
    check-cast p1, Lcom/p1/mobile/putong/data/Followship;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Followship$1;->serialize(Lcom/p1/mobile/putong/data/Followship;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
