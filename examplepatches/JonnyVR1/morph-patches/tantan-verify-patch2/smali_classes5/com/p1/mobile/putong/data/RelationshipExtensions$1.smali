.class Lcom/p1/mobile/putong/data/RelationshipExtensions$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/RelationshipExtensions;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/RelationshipExtensions;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/RelationshipExtensions;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

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
    iget v1, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->soulScore:I

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 55
    .line 56
    if-eqz v0, :cond_4

    .line 57
    .line 58
    const/4 v1, 0x6

    .line 59
    sget-object v2, Lcom/p1/mobile/putong/data/SuperlikeReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 60
    .line 61
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 67
    .line 68
    if-eqz v0, :cond_5

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 77
    .line 78
    if-eqz v0, :cond_6

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
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 88
    .line 89
    if-eqz v0, :cond_7

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
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 99
    .line 100
    if-eqz v0, :cond_8

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
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 110
    .line 111
    if-eqz v0, :cond_9

    .line 112
    .line 113
    const/16 v1, 0xb

    .line 114
    .line 115
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 116
    .line 117
    .line 118
    move-result v0

    .line 119
    add-int/2addr p0, v0

    .line 120
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 121
    .line 122
    if-eqz v0, :cond_a

    .line 123
    .line 124
    const/16 v1, 0xc

    .line 125
    .line 126
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 132
    .line 133
    if-eqz v0, :cond_b

    .line 134
    .line 135
    const/16 v1, 0xd

    .line 136
    .line 137
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 138
    .line 139
    .line 140
    move-result v0

    .line 141
    add-int/2addr p0, v0

    .line 142
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 143
    .line 144
    if-eqz v0, :cond_c

    .line 145
    .line 146
    const/16 v1, 0xe

    .line 147
    .line 148
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 149
    .line 150
    .line 151
    move-result v0

    .line 152
    add-int/2addr p0, v0

    .line 153
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 154
    .line 155
    if-eqz v0, :cond_d

    .line 156
    .line 157
    const/16 v1, 0xf

    .line 158
    .line 159
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 160
    .line 161
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 162
    .line 163
    .line 164
    move-result v0

    .line 165
    add-int/2addr p0, v0

    .line 166
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 167
    .line 168
    if-eqz v0, :cond_e

    .line 169
    .line 170
    const/16 v1, 0x10

    .line 171
    .line 172
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 173
    .line 174
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 175
    .line 176
    .line 177
    move-result v0

    .line 178
    add-int/2addr p0, v0

    .line 179
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 180
    .line 181
    if-eqz v0, :cond_f

    .line 182
    .line 183
    const/16 v1, 0x11

    .line 184
    .line 185
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 186
    .line 187
    .line 188
    move-result v0

    .line 189
    add-int/2addr p0, v0

    .line 190
    :cond_f
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 191
    .line 192
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 193
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/RelationshipExtensions$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/RelationshipExtensions;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/RelationshipExtensions;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/RelationshipExtensions;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/data/SuperlikeReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

    .line 54
    .line 55
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 56
    .line 57
    if-nez p1, :cond_4

    .line 58
    .line 59
    sget-object p1, Lcom/p1/mobile/putong/data/SuperlikeReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 60
    .line 61
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 62
    .line 63
    .line 64
    move-result-object p1

    .line 65
    check-cast p1, Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 66
    .line 67
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 68
    .line 69
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 70
    .line 71
    if-nez p1, :cond_5

    .line 72
    .line 73
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 74
    .line 75
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 76
    .line 77
    if-nez p1, :cond_6

    .line 78
    .line 79
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 80
    .line 81
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 82
    .line 83
    if-nez p1, :cond_7

    .line 84
    .line 85
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 86
    .line 87
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 88
    .line 89
    if-nez p1, :cond_8

    .line 90
    .line 91
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 92
    .line 93
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 94
    .line 95
    if-nez p1, :cond_9

    .line 96
    .line 97
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 98
    .line 99
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 100
    .line 101
    if-nez p1, :cond_a

    .line 102
    .line 103
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 104
    .line 105
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 106
    .line 107
    if-nez p1, :cond_b

    .line 108
    .line 109
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 110
    .line 111
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 112
    .line 113
    if-nez p1, :cond_c

    .line 114
    .line 115
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 116
    .line 117
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 118
    .line 119
    if-nez p1, :cond_d

    .line 120
    .line 121
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 122
    .line 123
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 124
    .line 125
    .line 126
    move-result-object p1

    .line 127
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 128
    .line 129
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 130
    .line 131
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 132
    .line 133
    if-nez p1, :cond_e

    .line 134
    .line 135
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 136
    .line 137
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 138
    .line 139
    .line 140
    move-result-object p1

    .line 141
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 142
    .line 143
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 144
    .line 145
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 146
    .line 147
    if-nez p1, :cond_1e

    .line 148
    .line 149
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 150
    .line 151
    return-object p0

    .line 152
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 153
    .line 154
    .line 155
    move-result-object v2

    .line 156
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 157
    .line 158
    goto/16 :goto_0

    .line 159
    .line 160
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 163
    .line 164
    .line 165
    move-result-object v2

    .line 166
    check-cast v2, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 167
    .line 168
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 169
    .line 170
    goto/16 :goto_0

    .line 171
    .line 172
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 173
    .line 174
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v2

    .line 178
    check-cast v2, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 179
    .line 180
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 185
    .line 186
    .line 187
    move-result-object v2

    .line 188
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 193
    .line 194
    .line 195
    move-result-object v2

    .line 196
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 197
    .line 198
    goto/16 :goto_0

    .line 199
    .line 200
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 201
    .line 202
    .line 203
    move-result-object v2

    .line 204
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 205
    .line 206
    goto/16 :goto_0

    .line 207
    .line 208
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 209
    .line 210
    .line 211
    move-result-object v2

    .line 212
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 213
    .line 214
    goto/16 :goto_0

    .line 215
    .line 216
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 217
    .line 218
    .line 219
    move-result-object v2

    .line 220
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 221
    .line 222
    goto/16 :goto_0

    .line 223
    .line 224
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 225
    .line 226
    .line 227
    move-result-object v2

    .line 228
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 229
    .line 230
    goto/16 :goto_0

    .line 231
    .line 232
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 233
    .line 234
    .line 235
    move-result-object v2

    .line 236
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 237
    .line 238
    goto/16 :goto_0

    .line 239
    .line 240
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 241
    .line 242
    .line 243
    move-result-object v2

    .line 244
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 245
    .line 246
    goto/16 :goto_0

    .line 247
    .line 248
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/data/SuperlikeReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 249
    .line 250
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 251
    .line 252
    .line 253
    move-result-object v2

    .line 254
    check-cast v2, Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 255
    .line 256
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 257
    .line 258
    goto/16 :goto_0

    .line 259
    .line 260
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 261
    .line 262
    .line 263
    move-result v2

    .line 264
    iput v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->soulScore:I

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 269
    .line 270
    .line 271
    move-result v1

    .line 272
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 273
    .line 274
    .line 275
    move-result-object v1

    .line 276
    goto/16 :goto_0

    .line 277
    .line 278
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 279
    .line 280
    .line 281
    move-result-object v2

    .line 282
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

    .line 283
    .line 284
    goto/16 :goto_0

    .line 285
    .line 286
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 287
    .line 288
    .line 289
    move-result-object v2

    .line 290
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 291
    .line 292
    goto/16 :goto_0

    .line 293
    .line 294
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 295
    .line 296
    .line 297
    move-result-object v2

    .line 298
    iput-object v2, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

    .line 299
    .line 300
    goto/16 :goto_0

    .line 301
    .line 302
    :sswitch_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 303
    .line 304
    if-nez p1, :cond_f

    .line 305
    .line 306
    if-eqz v1, :cond_f

    .line 307
    .line 308
    sget-object p1, Lcom/p1/mobile/putong/data/SuperlikeReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 309
    .line 310
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 311
    .line 312
    .line 313
    move-result v1

    .line 314
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 315
    .line 316
    .line 317
    move-result-object p1

    .line 318
    check-cast p1, Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 319
    .line 320
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 321
    .line 322
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

    .line 323
    .line 324
    if-nez p1, :cond_10

    .line 325
    .line 326
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

    .line 327
    .line 328
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 329
    .line 330
    if-nez p1, :cond_11

    .line 331
    .line 332
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

    .line 333
    .line 334
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

    .line 335
    .line 336
    if-nez p1, :cond_12

    .line 337
    .line 338
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

    .line 339
    .line 340
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 341
    .line 342
    if-nez p1, :cond_13

    .line 343
    .line 344
    sget-object p1, Lcom/p1/mobile/putong/data/SuperlikeReason;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 345
    .line 346
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 347
    .line 348
    .line 349
    move-result-object p1

    .line 350
    check-cast p1, Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 351
    .line 352
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 353
    .line 354
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 355
    .line 356
    if-nez p1, :cond_14

    .line 357
    .line 358
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 359
    .line 360
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 361
    .line 362
    if-nez p1, :cond_15

    .line 363
    .line 364
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 365
    .line 366
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 367
    .line 368
    if-nez p1, :cond_16

    .line 369
    .line 370
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 371
    .line 372
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 373
    .line 374
    if-nez p1, :cond_17

    .line 375
    .line 376
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 377
    .line 378
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 379
    .line 380
    if-nez p1, :cond_18

    .line 381
    .line 382
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 383
    .line 384
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 385
    .line 386
    if-nez p1, :cond_19

    .line 387
    .line 388
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 389
    .line 390
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 391
    .line 392
    if-nez p1, :cond_1a

    .line 393
    .line 394
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 395
    .line 396
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 397
    .line 398
    if-nez p1, :cond_1b

    .line 399
    .line 400
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 401
    .line 402
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 403
    .line 404
    if-nez p1, :cond_1c

    .line 405
    .line 406
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 407
    .line 408
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 409
    .line 410
    .line 411
    move-result-object p1

    .line 412
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 413
    .line 414
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 415
    .line 416
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 417
    .line 418
    if-nez p1, :cond_1d

    .line 419
    .line 420
    sget-object p1, Lcom/p1/mobile/putong/data/RelationshipStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 421
    .line 422
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 423
    .line 424
    .line 425
    move-result-object p1

    .line 426
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 427
    .line 428
    iput-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 429
    .line 430
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 431
    .line 432
    if-nez p1, :cond_1e

    .line 433
    .line 434
    iput-object v3, p0, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 435
    .line 436
    :cond_1e
    return-object p0

    .line 437
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_11
        0xa -> :sswitch_10
        0x12 -> :sswitch_f
        0x1a -> :sswitch_e
        0x20 -> :sswitch_d
        0x28 -> :sswitch_c
        0x32 -> :sswitch_b
        0x3a -> :sswitch_a
        0x42 -> :sswitch_9
        0x4a -> :sswitch_8
        0x52 -> :sswitch_7
        0x5a -> :sswitch_6
        0x62 -> :sswitch_5
        0x6a -> :sswitch_4
        0x72 -> :sswitch_3
        0x7a -> :sswitch_2
        0x82 -> :sswitch_1
        0x8a -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 437
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/RelationshipExtensions$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/RelationshipExtensions;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/RelationshipExtensions;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->letter:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLetter:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeNum:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

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
    iget v0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->soulScore:I

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 41
    .line 42
    .line 43
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->superlikeReason:Lcom/p1/mobile/putong/data/SuperlikeReason;

    .line 44
    .line 45
    if-eqz p0, :cond_4

    .line 46
    .line 47
    const/4 v0, 0x6

    .line 48
    sget-object v1, Lcom/p1/mobile/putong/data/SuperlikeReason;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherLiteratureCommentId:Ljava/lang/String;

    .line 54
    .line 55
    if-eqz p0, :cond_5

    .line 56
    .line 57
    const/4 v0, 0x7

    .line 58
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureCommentId:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/16 v0, 0x8

    .line 66
    .line 67
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 68
    .line 69
    .line 70
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->literatureId:Ljava/lang/String;

    .line 71
    .line 72
    if-eqz p0, :cond_7

    .line 73
    .line 74
    const/16 v0, 0x9

    .line 75
    .line 76
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 77
    .line 78
    .line 79
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->business_type:Ljava/lang/String;

    .line 80
    .line 81
    if-eqz p0, :cond_8

    .line 82
    .line 83
    const/16 v0, 0xa

    .line 84
    .line 85
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 86
    .line 87
    .line 88
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->sendSuperLikedNum:Ljava/lang/String;

    .line 89
    .line 90
    if-eqz p0, :cond_9

    .line 91
    .line 92
    const/16 v0, 0xb

    .line 93
    .line 94
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 95
    .line 96
    .line 97
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->recvSuperLikedNum:Ljava/lang/String;

    .line 98
    .line 99
    if-eqz p0, :cond_a

    .line 100
    .line 101
    const/16 v0, 0xc

    .line 102
    .line 103
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 104
    .line 105
    .line 106
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->momentId:Ljava/lang/String;

    .line 107
    .line 108
    if-eqz p0, :cond_b

    .line 109
    .line 110
    const/16 v0, 0xd

    .line 111
    .line 112
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 113
    .line 114
    .line 115
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherMomentId:Ljava/lang/String;

    .line 116
    .line 117
    if-eqz p0, :cond_c

    .line 118
    .line 119
    const/16 v0, 0xe

    .line 120
    .line 121
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 122
    .line 123
    .line 124
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->relationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 125
    .line 126
    if-eqz p0, :cond_d

    .line 127
    .line 128
    const/16 v0, 0xf

    .line 129
    .line 130
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 131
    .line 132
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 133
    .line 134
    .line 135
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->otherRelationType:Lcom/p1/mobile/putong/data/RelationshipStatus;

    .line 136
    .line 137
    if-eqz p0, :cond_e

    .line 138
    .line 139
    const/16 v0, 0x10

    .line 140
    .line 141
    sget-object v1, Lcom/p1/mobile/putong/data/RelationshipStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 144
    .line 145
    .line 146
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;->roomID:Ljava/lang/String;

    .line 147
    .line 148
    if-eqz p0, :cond_f

    .line 149
    .line 150
    const/16 p1, 0x11

    .line 151
    .line 152
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 153
    .line 154
    .line 155
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

    .line 156
    check-cast p1, Lcom/p1/mobile/putong/data/RelationshipExtensions;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/RelationshipExtensions$1;->serialize(Lcom/p1/mobile/putong/data/RelationshipExtensions;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
