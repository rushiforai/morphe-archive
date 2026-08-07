.class Lcom/p1/mobile/putong/feed/data/MomentMessage$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/MomentMessage;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/MomentMessage;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentMessage;)I
    .locals 3

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 3
    .line 4
    invoke-static {p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 5
    .line 6
    .line 7
    move-result p0

    .line 8
    iget-object v0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

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
    const/16 v0, 0x33

    .line 19
    .line 20
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 21
    .line 22
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->j(IJ)I

    .line 23
    .line 24
    .line 25
    move-result v0

    .line 26
    add-int/2addr p0, v0

    .line 27
    const/16 v0, 0x34

    .line 28
    .line 29
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 30
    .line 31
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 32
    .line 33
    .line 34
    move-result v0

    .line 35
    add-int/2addr p0, v0

    .line 36
    const/16 v0, 0x35

    .line 37
    .line 38
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 39
    .line 40
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 41
    .line 42
    .line 43
    move-result v0

    .line 44
    add-int/2addr p0, v0

    .line 45
    const/16 v0, 0x36

    .line 46
    .line 47
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 48
    .line 49
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 50
    .line 51
    .line 52
    move-result v0

    .line 53
    add-int/2addr p0, v0

    .line 54
    const/16 v0, 0x37

    .line 55
    .line 56
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 57
    .line 58
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 59
    .line 60
    .line 61
    move-result v0

    .line 62
    add-int/2addr p0, v0

    .line 63
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 64
    .line 65
    if-eqz v0, :cond_1

    .line 66
    .line 67
    const/16 v1, 0x38

    .line 68
    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_1
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_2

    .line 77
    .line 78
    const/16 v1, 0x39

    .line 79
    .line 80
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 86
    .line 87
    if-eqz v0, :cond_3

    .line 88
    .line 89
    sget-object v1, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 90
    .line 91
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 92
    .line 93
    .line 94
    move-result-object v1

    .line 95
    const/16 v2, 0x3a

    .line 96
    .line 97
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 98
    .line 99
    .line 100
    move-result v0

    .line 101
    add-int/2addr p0, v0

    .line 102
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz v0, :cond_4

    .line 105
    .line 106
    const/16 v1, 0x3b

    .line 107
    .line 108
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 109
    .line 110
    .line 111
    move-result v0

    .line 112
    add-int/2addr p0, v0

    .line 113
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 114
    .line 115
    if-eqz v0, :cond_5

    .line 116
    .line 117
    const/16 v1, 0x3c

    .line 118
    .line 119
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 120
    .line 121
    .line 122
    move-result v0

    .line 123
    add-int/2addr p0, v0

    .line 124
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 125
    .line 126
    if-eqz v0, :cond_6

    .line 127
    .line 128
    const/16 v1, 0x3d

    .line 129
    .line 130
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 131
    .line 132
    .line 133
    move-result v0

    .line 134
    add-int/2addr p0, v0

    .line 135
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 136
    .line 137
    if-eqz v0, :cond_7

    .line 138
    .line 139
    const/16 v1, 0x3e

    .line 140
    .line 141
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 142
    .line 143
    .line 144
    move-result v0

    .line 145
    add-int/2addr p0, v0

    .line 146
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 147
    .line 148
    if-eqz v0, :cond_8

    .line 149
    .line 150
    const/16 v1, 0x3f

    .line 151
    .line 152
    invoke-virtual {v0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 157
    .line 158
    .line 159
    move-result v0

    .line 160
    add-int/2addr p0, v0

    .line 161
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 162
    .line 163
    if-eqz v0, :cond_9

    .line 164
    .line 165
    const/16 v1, 0x40

    .line 166
    .line 167
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 172
    .line 173
    .line 174
    move-result v0

    .line 175
    add-int/2addr p0, v0

    .line 176
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 177
    .line 178
    if-eqz v0, :cond_a

    .line 179
    .line 180
    const/16 v1, 0x41

    .line 181
    .line 182
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 190
    .line 191
    if-eqz v0, :cond_b

    .line 192
    .line 193
    const/16 v1, 0x42

    .line 194
    .line 195
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 196
    .line 197
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 198
    .line 199
    .line 200
    move-result v0

    .line 201
    add-int/2addr p0, v0

    .line 202
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 203
    .line 204
    if-eqz v0, :cond_c

    .line 205
    .line 206
    const/16 v1, 0x43

    .line 207
    .line 208
    sget-object v2, Lcom/p1/mobile/putong/feed/data/CommentStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 209
    .line 210
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 211
    .line 212
    .line 213
    move-result v0

    .line 214
    add-int/2addr p0, v0

    .line 215
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 216
    .line 217
    if-eqz v0, :cond_d

    .line 218
    .line 219
    const/16 v1, 0x44

    .line 220
    .line 221
    sget-object v2, Lcom/p1/mobile/putong/feed/data/Accessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 224
    .line 225
    .line 226
    move-result v0

    .line 227
    add-int/2addr p0, v0

    .line 228
    :cond_d
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 229
    .line 230
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 231
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/MomentMessage;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentMessage;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/MomentMessage;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 54
    .line 55
    .line 56
    move-result-object p1

    .line 57
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 58
    .line 59
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 60
    .line 61
    if-nez p1, :cond_4

    .line 62
    .line 63
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 64
    .line 65
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 66
    .line 67
    if-nez p1, :cond_5

    .line 68
    .line 69
    new-instance p1, Ljava/util/ArrayList;

    .line 70
    .line 71
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 72
    .line 73
    .line 74
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 75
    .line 76
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 77
    .line 78
    if-nez p1, :cond_6

    .line 79
    .line 80
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 81
    .line 82
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 83
    .line 84
    if-nez p1, :cond_7

    .line 85
    .line 86
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 87
    .line 88
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 89
    .line 90
    if-nez p1, :cond_8

    .line 91
    .line 92
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 93
    .line 94
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 95
    .line 96
    if-nez p1, :cond_9

    .line 97
    .line 98
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->new_()Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 99
    .line 100
    .line 101
    move-result-object p1

    .line 102
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 103
    .line 104
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 105
    .line 106
    if-nez p1, :cond_a

    .line 107
    .line 108
    sget-object p1, Lcom/p1/mobile/putong/feed/data/CommentStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 109
    .line 110
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 111
    .line 112
    .line 113
    move-result-object p1

    .line 114
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 115
    .line 116
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 117
    .line 118
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 119
    .line 120
    if-nez p1, :cond_16

    .line 121
    .line 122
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Accessory;->new_()Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 123
    .line 124
    .line 125
    move-result-object p1

    .line 126
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 127
    .line 128
    return-object p0

    .line 129
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/feed/data/Accessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 132
    .line 133
    .line 134
    move-result-object v2

    .line 135
    check-cast v2, Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 136
    .line 137
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/feed/data/CommentStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 144
    .line 145
    .line 146
    move-result-object v2

    .line 147
    check-cast v2, Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 148
    .line 149
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 150
    .line 151
    goto/16 :goto_0

    .line 152
    .line 153
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 154
    .line 155
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 156
    .line 157
    .line 158
    move-result-object v2

    .line 159
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 160
    .line 161
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 166
    .line 167
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 168
    .line 169
    .line 170
    move-result-object v2

    .line 171
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 172
    .line 173
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 174
    .line 175
    goto/16 :goto_0

    .line 176
    .line 177
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 178
    .line 179
    .line 180
    move-result v1

    .line 181
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 182
    .line 183
    .line 184
    move-result-object v1

    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 188
    .line 189
    .line 190
    move-result v2

    .line 191
    invoke-static {v2}, Ljava/lang/Boolean;->valueOf(Z)Ljava/lang/Boolean;

    .line 192
    .line 193
    .line 194
    move-result-object v2

    .line 195
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 196
    .line 197
    goto/16 :goto_0

    .line 198
    .line 199
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 204
    .line 205
    goto/16 :goto_0

    .line 206
    .line 207
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 208
    .line 209
    .line 210
    move-result-object v2

    .line 211
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 212
    .line 213
    goto/16 :goto_0

    .line 214
    .line 215
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 216
    .line 217
    .line 218
    move-result-object v2

    .line 219
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 220
    .line 221
    goto/16 :goto_0

    .line 222
    .line 223
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 228
    .line 229
    goto/16 :goto_0

    .line 230
    .line 231
    :sswitch_a
    sget-object v2, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 232
    .line 233
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 234
    .line 235
    .line 236
    move-result-object v2

    .line 237
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 238
    .line 239
    .line 240
    move-result-object v2

    .line 241
    check-cast v2, Ljava/util/List;

    .line 242
    .line 243
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 244
    .line 245
    goto/16 :goto_0

    .line 246
    .line 247
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 252
    .line 253
    goto/16 :goto_0

    .line 254
    .line 255
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 256
    .line 257
    .line 258
    move-result-object v2

    .line 259
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 260
    .line 261
    goto/16 :goto_0

    .line 262
    .line 263
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 264
    .line 265
    .line 266
    move-result-wide v2

    .line 267
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 268
    .line 269
    goto/16 :goto_0

    .line 270
    .line 271
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 272
    .line 273
    .line 274
    move-result v2

    .line 275
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 276
    .line 277
    goto/16 :goto_0

    .line 278
    .line 279
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 280
    .line 281
    .line 282
    move-result v2

    .line 283
    iput-boolean v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 284
    .line 285
    goto/16 :goto_0

    .line 286
    .line 287
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 288
    .line 289
    .line 290
    move-result v2

    .line 291
    iput v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 292
    .line 293
    goto/16 :goto_0

    .line 294
    .line 295
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 296
    .line 297
    .line 298
    move-result-wide v2

    .line 299
    iput-wide v2, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 300
    .line 301
    goto/16 :goto_0

    .line 302
    .line 303
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 304
    .line 305
    .line 306
    move-result-object v2

    .line 307
    iput-object v2, p0, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

    .line 308
    .line 309
    goto/16 :goto_0

    .line 310
    .line 311
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 312
    .line 313
    .line 314
    move-result-wide v2

    .line 315
    iput-wide v2, p0, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 316
    .line 317
    goto/16 :goto_0

    .line 318
    .line 319
    :sswitch_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 320
    .line 321
    if-nez p1, :cond_b

    .line 322
    .line 323
    if-eqz v1, :cond_b

    .line 324
    .line 325
    sget-object p1, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 326
    .line 327
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 328
    .line 329
    .line 330
    move-result v1

    .line 331
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 332
    .line 333
    .line 334
    move-result-object p1

    .line 335
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 336
    .line 337
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 338
    .line 339
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 340
    .line 341
    if-nez p1, :cond_c

    .line 342
    .line 343
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->api_only_otherUser:Ljava/lang/String;

    .line 344
    .line 345
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 346
    .line 347
    if-nez p1, :cond_d

    .line 348
    .line 349
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 350
    .line 351
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 352
    .line 353
    if-nez p1, :cond_e

    .line 354
    .line 355
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/CommentInfo;->new_()Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 356
    .line 357
    .line 358
    move-result-object p1

    .line 359
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->commentInfo:Lcom/p1/mobile/putong/feed/data/CommentInfo;

    .line 360
    .line 361
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 362
    .line 363
    if-nez p1, :cond_f

    .line 364
    .line 365
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->parentCommentId:Ljava/lang/String;

    .line 366
    .line 367
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 368
    .line 369
    if-nez p1, :cond_10

    .line 370
    .line 371
    new-instance p1, Ljava/util/ArrayList;

    .line 372
    .line 373
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 374
    .line 375
    .line 376
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->subCommentIds:Ljava/util/List;

    .line 377
    .line 378
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 379
    .line 380
    if-nez p1, :cond_11

    .line 381
    .line 382
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moreSubComments:Ljava/lang/String;

    .line 383
    .line 384
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 385
    .line 386
    if-nez p1, :cond_12

    .line 387
    .line 388
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 389
    .line 390
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 391
    .line 392
    if-nez p1, :cond_13

    .line 393
    .line 394
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 395
    .line 396
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 397
    .line 398
    if-nez p1, :cond_14

    .line 399
    .line 400
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->new_()Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 401
    .line 402
    .line 403
    move-result-object p1

    .line 404
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 405
    .line 406
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 407
    .line 408
    if-nez p1, :cond_15

    .line 409
    .line 410
    sget-object p1, Lcom/p1/mobile/putong/feed/data/CommentStatus;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 411
    .line 412
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 413
    .line 414
    .line 415
    move-result-object p1

    .line 416
    check-cast p1, Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 417
    .line 418
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 419
    .line 420
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 421
    .line 422
    if-nez p1, :cond_16

    .line 423
    .line 424
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/Accessory;->new_()Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 425
    .line 426
    .line 427
    move-result-object p1

    .line 428
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 429
    .line 430
    :cond_16
    return-object p0

    .line 431
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_14
        0x8 -> :sswitch_13
        0x12 -> :sswitch_12
        0x198 -> :sswitch_11
        0x1a0 -> :sswitch_10
        0x1a8 -> :sswitch_f
        0x1b0 -> :sswitch_e
        0x1b9 -> :sswitch_d
        0x1c2 -> :sswitch_c
        0x1ca -> :sswitch_b
        0x1d2 -> :sswitch_a
        0x1da -> :sswitch_9
        0x1e2 -> :sswitch_8
        0x1ea -> :sswitch_7
        0x1f2 -> :sswitch_6
        0x1f8 -> :sswitch_5
        0x200 -> :sswitch_4
        0x20a -> :sswitch_3
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

    .line 431
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/MomentMessage$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/MomentMessage;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    const/4 p0, 0x1

    .line 2
    iget-wide v0, p1, Lcom/tantanapp/common/data/CopyObject;->_id:J

    .line 3
    .line 4
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 5
    .line 6
    .line 7
    iget-object p0, p1, Lcom/tantanapp/common/data/CopyObject;->id:Ljava/lang/String;

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
    const/16 p0, 0x33

    .line 16
    .line 17
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedTime:J

    .line 18
    .line 19
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->I(IJ)V

    .line 20
    .line 21
    .line 22
    const/16 p0, 0x34

    .line 23
    .line 24
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localCreatedSession:I

    .line 25
    .line 26
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 27
    .line 28
    .line 29
    const/16 p0, 0x35

    .line 30
    .line 31
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInMoment:Z

    .line 32
    .line 33
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 34
    .line 35
    .line 36
    const/16 p0, 0x36

    .line 37
    .line 38
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->localInConversation:Z

    .line 39
    .line 40
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 41
    .line 42
    .line 43
    const/16 p0, 0x37

    .line 44
    .line 45
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->createdTime:D

    .line 46
    .line 47
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 48
    .line 49
    .line 50
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->cid:Ljava/lang/String;

    .line 51
    .line 52
    if-eqz p0, :cond_1

    .line 53
    .line 54
    const/16 v0, 0x38

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->likeOfMoment:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_2

    .line 62
    .line 63
    const/16 v0, 0x39

    .line 64
    .line 65
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->media:Ljava/util/List;

    .line 69
    .line 70
    if-eqz p0, :cond_3

    .line 71
    .line 72
    sget-object v0, Lcom/p1/mobile/putong/data/Media;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 73
    .line 74
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 75
    .line 76
    .line 77
    move-result-object v0

    .line 78
    const/16 v1, 0x3a

    .line 79
    .line 80
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 81
    .line 82
    .line 83
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->sticker:Ljava/lang/String;

    .line 84
    .line 85
    if-eqz p0, :cond_4

    .line 86
    .line 87
    const/16 v0, 0x3b

    .line 88
    .line 89
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 90
    .line 91
    .line 92
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->moment:Ljava/lang/String;

    .line 93
    .line 94
    if-eqz p0, :cond_5

    .line 95
    .line 96
    const/16 v0, 0x3c

    .line 97
    .line 98
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 99
    .line 100
    .line 101
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->owner:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz p0, :cond_6

    .line 104
    .line 105
    const/16 v0, 0x3d

    .line 106
    .line 107
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 108
    .line 109
    .line 110
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->value:Ljava/lang/String;

    .line 111
    .line 112
    if-eqz p0, :cond_7

    .line 113
    .line 114
    const/16 v0, 0x3e

    .line 115
    .line 116
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 117
    .line 118
    .line 119
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->recalled:Ljava/lang/Boolean;

    .line 120
    .line 121
    if-eqz p0, :cond_8

    .line 122
    .line 123
    const/16 v0, 0x3f

    .line 124
    .line 125
    invoke-virtual {p0}, Ljava/lang/Boolean;->booleanValue()Z

    .line 126
    .line 127
    .line 128
    move-result p0

    .line 129
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 130
    .line 131
    .line 132
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 133
    .line 134
    if-eqz p0, :cond_9

    .line 135
    .line 136
    const/16 v0, 0x40

    .line 137
    .line 138
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 139
    .line 140
    .line 141
    move-result p0

    .line 142
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 143
    .line 144
    .line 145
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->settings:Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;

    .line 146
    .line 147
    if-eqz p0, :cond_a

    .line 148
    .line 149
    const/16 v0, 0x41

    .line 150
    .line 151
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMessageSetting;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 152
    .line 153
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 154
    .line 155
    .line 156
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->messageType:Lcom/p1/mobile/putong/feed/data/MomentMessageType;

    .line 157
    .line 158
    if-eqz p0, :cond_b

    .line 159
    .line 160
    const/16 v0, 0x42

    .line 161
    .line 162
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentMessageType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 163
    .line 164
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 165
    .line 166
    .line 167
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->status:Lcom/p1/mobile/putong/feed/data/CommentStatus;

    .line 168
    .line 169
    if-eqz p0, :cond_c

    .line 170
    .line 171
    const/16 v0, 0x43

    .line 172
    .line 173
    sget-object v1, Lcom/p1/mobile/putong/feed/data/CommentStatus;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 174
    .line 175
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 176
    .line 177
    .line 178
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;->accessory:Lcom/p1/mobile/putong/feed/data/Accessory;

    .line 179
    .line 180
    if-eqz p0, :cond_d

    .line 181
    .line 182
    const/16 p1, 0x44

    .line 183
    .line 184
    sget-object v0, Lcom/p1/mobile/putong/feed/data/Accessory;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 185
    .line 186
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 187
    .line 188
    .line 189
    :cond_d
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 190
    check-cast p1, Lcom/p1/mobile/putong/feed/data/MomentMessage;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/MomentMessage$1;->serialize(Lcom/p1/mobile/putong/feed/data/MomentMessage;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
