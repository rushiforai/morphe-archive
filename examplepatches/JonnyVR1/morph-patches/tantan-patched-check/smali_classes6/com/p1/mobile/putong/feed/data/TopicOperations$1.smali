.class Lcom/p1/mobile/putong/feed/data/TopicOperations$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/TopicOperations;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/TopicOperations;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/TopicOperations;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

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
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

    .line 35
    invoke-virtual {v0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 36
    .line 37
    .line 38
    move-result v0

    .line 39
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v0, :cond_3

    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 51
    .line 52
    .line 53
    move-result-object v1

    .line 54
    const/4 v2, 0x5

    .line 55
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 56
    .line 57
    .line 58
    move-result v0

    .line 59
    add-int/2addr p0, v0

    .line 60
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 61
    .line 62
    if-eqz v0, :cond_4

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/feed/data/SingleTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 73
    .line 74
    if-eqz v0, :cond_5

    .line 75
    .line 76
    const/4 v1, 0x7

    .line 77
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PostGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 78
    .line 79
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 80
    .line 81
    .line 82
    move-result v0

    .line 83
    add-int/2addr p0, v0

    .line 84
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 85
    .line 86
    if-eqz v0, :cond_6

    .line 87
    .line 88
    const/16 v1, 0x8

    .line 89
    .line 90
    sget-object v2, Lcom/p1/mobile/putong/feed/data/OperationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 91
    .line 92
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 93
    .line 94
    .line 95
    move-result v0

    .line 96
    add-int/2addr p0, v0

    .line 97
    :cond_6
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 98
    .line 99
    if-eqz v0, :cond_7

    .line 100
    .line 101
    sget-object v1, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 104
    .line 105
    .line 106
    move-result-object v1

    .line 107
    const/16 v2, 0x9

    .line 108
    .line 109
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 110
    .line 111
    .line 112
    move-result v0

    .line 113
    add-int/2addr p0, v0

    .line 114
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 115
    .line 116
    if-eqz v0, :cond_8

    .line 117
    .line 118
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 121
    .line 122
    .line 123
    move-result-object v1

    .line 124
    const/16 v2, 0xa

    .line 125
    .line 126
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    add-int/2addr p0, v0

    .line 131
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 132
    .line 133
    if-eqz v0, :cond_9

    .line 134
    .line 135
    const/16 v1, 0xb

    .line 136
    .line 137
    sget-object v2, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 138
    .line 139
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 140
    .line 141
    .line 142
    move-result v0

    .line 143
    add-int/2addr p0, v0

    .line 144
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 145
    .line 146
    if-eqz v0, :cond_a

    .line 147
    .line 148
    const/16 v1, 0xc

    .line 149
    .line 150
    sget-object v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 151
    .line 152
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 153
    .line 154
    .line 155
    move-result v0

    .line 156
    add-int/2addr p0, v0

    .line 157
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 158
    .line 159
    if-eqz v0, :cond_b

    .line 160
    .line 161
    const/16 v1, 0xd

    .line 162
    .line 163
    sget-object v2, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 164
    .line 165
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 166
    .line 167
    .line 168
    move-result v0

    .line 169
    add-int/2addr p0, v0

    .line 170
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 171
    .line 172
    if-eqz v0, :cond_c

    .line 173
    .line 174
    const/16 v1, 0xe

    .line 175
    .line 176
    sget-object v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 179
    .line 180
    .line 181
    move-result v0

    .line 182
    add-int/2addr p0, v0

    .line 183
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 184
    .line 185
    if-eqz v0, :cond_d

    .line 186
    .line 187
    const/16 v1, 0xf

    .line 188
    .line 189
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 190
    .line 191
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 192
    .line 193
    .line 194
    move-result v0

    .line 195
    add-int/2addr p0, v0

    .line 196
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 197
    .line 198
    if-eqz v0, :cond_e

    .line 199
    .line 200
    const/16 v1, 0x10

    .line 201
    .line 202
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PoiGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 203
    .line 204
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 205
    .line 206
    .line 207
    move-result v0

    .line 208
    add-int/2addr p0, v0

    .line 209
    :cond_e
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 210
    .line 211
    if-eqz v0, :cond_f

    .line 212
    .line 213
    const/16 v1, 0x11

    .line 214
    .line 215
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 216
    .line 217
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 218
    .line 219
    .line 220
    move-result v0

    .line 221
    add-int/2addr p0, v0

    .line 222
    :cond_f
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 223
    .line 224
    if-eqz v0, :cond_10

    .line 225
    .line 226
    const/16 v1, 0x12

    .line 227
    .line 228
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PublishGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 229
    .line 230
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 231
    .line 232
    .line 233
    move-result v0

    .line 234
    add-int/2addr p0, v0

    .line 235
    :cond_10
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 236
    .line 237
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 238
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/TopicOperations$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/TopicOperations;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/TopicOperations;
    .locals 4
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/TopicOperations;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 18
    .line 19
    if-nez p1, :cond_0

    .line 20
    .line 21
    if-eqz v1, :cond_0

    .line 22
    .line 23
    sget-object p1, Lcom/p1/mobile/putong/feed/data/OperationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 34
    .line 35
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 36
    .line 37
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 38
    .line 39
    if-nez p1, :cond_1

    .line 40
    .line 41
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 42
    .line 43
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 44
    .line 45
    if-nez p1, :cond_2

    .line 46
    .line 47
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 48
    .line 49
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 50
    .line 51
    if-nez p1, :cond_3

    .line 52
    .line 53
    sget-object p1, Lcom/p1/mobile/putong/feed/data/OperationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 54
    .line 55
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 56
    .line 57
    .line 58
    move-result-object p1

    .line 59
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 60
    .line 61
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 62
    .line 63
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 64
    .line 65
    if-nez p1, :cond_4

    .line 66
    .line 67
    new-instance p1, Ljava/util/ArrayList;

    .line 68
    .line 69
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 70
    .line 71
    .line 72
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 73
    .line 74
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 75
    .line 76
    if-nez p1, :cond_5

    .line 77
    .line 78
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/SingleTopic;->new_()Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 79
    .line 80
    .line 81
    move-result-object p1

    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 83
    .line 84
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 85
    .line 86
    if-nez p1, :cond_6

    .line 87
    .line 88
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PostGuide;->new_()Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 89
    .line 90
    .line 91
    move-result-object p1

    .line 92
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 93
    .line 94
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 95
    .line 96
    if-nez p1, :cond_7

    .line 97
    .line 98
    new-instance p1, Ljava/util/ArrayList;

    .line 99
    .line 100
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 101
    .line 102
    .line 103
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 104
    .line 105
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 106
    .line 107
    if-nez p1, :cond_8

    .line 108
    .line 109
    new-instance p1, Ljava/util/ArrayList;

    .line 110
    .line 111
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 112
    .line 113
    .line 114
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 115
    .line 116
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 117
    .line 118
    if-nez p1, :cond_9

    .line 119
    .line 120
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->new_()Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 121
    .line 122
    .line 123
    move-result-object p1

    .line 124
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 125
    .line 126
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 127
    .line 128
    if-nez p1, :cond_a

    .line 129
    .line 130
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->new_()Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 131
    .line 132
    .line 133
    move-result-object p1

    .line 134
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 135
    .line 136
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 137
    .line 138
    if-nez p1, :cond_b

    .line 139
    .line 140
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->new_()Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 141
    .line 142
    .line 143
    move-result-object p1

    .line 144
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 145
    .line 146
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 147
    .line 148
    if-nez p1, :cond_c

    .line 149
    .line 150
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->new_()Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 151
    .line 152
    .line 153
    move-result-object p1

    .line 154
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 155
    .line 156
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 157
    .line 158
    if-nez p1, :cond_d

    .line 159
    .line 160
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 161
    .line 162
    .line 163
    move-result-object p1

    .line 164
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 165
    .line 166
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 167
    .line 168
    if-nez p1, :cond_e

    .line 169
    .line 170
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiGuide;->new_()Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 171
    .line 172
    .line 173
    move-result-object p1

    .line 174
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 175
    .line 176
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 177
    .line 178
    if-nez p1, :cond_f

    .line 179
    .line 180
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->new_()Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 181
    .line 182
    .line 183
    move-result-object p1

    .line 184
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 185
    .line 186
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 187
    .line 188
    if-nez p1, :cond_20

    .line 189
    .line 190
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PublishGuide;->new_()Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 191
    .line 192
    .line 193
    move-result-object p1

    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 195
    .line 196
    return-object p0

    .line 197
    :sswitch_0
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PublishGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 198
    .line 199
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 200
    .line 201
    .line 202
    move-result-object v2

    .line 203
    check-cast v2, Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 204
    .line 205
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 206
    .line 207
    goto/16 :goto_0

    .line 208
    .line 209
    :sswitch_1
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 210
    .line 211
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 212
    .line 213
    .line 214
    move-result-object v2

    .line 215
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 216
    .line 217
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 218
    .line 219
    goto/16 :goto_0

    .line 220
    .line 221
    :sswitch_2
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PoiGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 222
    .line 223
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 224
    .line 225
    .line 226
    move-result-object v2

    .line 227
    check-cast v2, Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 228
    .line 229
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 230
    .line 231
    goto/16 :goto_0

    .line 232
    .line 233
    :sswitch_3
    sget-object v2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 234
    .line 235
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 236
    .line 237
    .line 238
    move-result-object v2

    .line 239
    check-cast v2, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 240
    .line 241
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 242
    .line 243
    goto/16 :goto_0

    .line 244
    .line 245
    :sswitch_4
    sget-object v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 246
    .line 247
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 248
    .line 249
    .line 250
    move-result-object v2

    .line 251
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 252
    .line 253
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 254
    .line 255
    goto/16 :goto_0

    .line 256
    .line 257
    :sswitch_5
    sget-object v2, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 258
    .line 259
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 260
    .line 261
    .line 262
    move-result-object v2

    .line 263
    check-cast v2, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 264
    .line 265
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 266
    .line 267
    goto/16 :goto_0

    .line 268
    .line 269
    :sswitch_6
    sget-object v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 270
    .line 271
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 272
    .line 273
    .line 274
    move-result-object v2

    .line 275
    check-cast v2, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 276
    .line 277
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 278
    .line 279
    goto/16 :goto_0

    .line 280
    .line 281
    :sswitch_7
    sget-object v2, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 282
    .line 283
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 284
    .line 285
    .line 286
    move-result-object v2

    .line 287
    check-cast v2, Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 288
    .line 289
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 290
    .line 291
    goto/16 :goto_0

    .line 292
    .line 293
    :sswitch_8
    sget-object v2, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 294
    .line 295
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 296
    .line 297
    .line 298
    move-result-object v2

    .line 299
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 300
    .line 301
    .line 302
    move-result-object v2

    .line 303
    check-cast v2, Ljava/util/List;

    .line 304
    .line 305
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 306
    .line 307
    goto/16 :goto_0

    .line 308
    .line 309
    :sswitch_9
    sget-object v2, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 310
    .line 311
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 312
    .line 313
    .line 314
    move-result-object v2

    .line 315
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 316
    .line 317
    .line 318
    move-result-object v2

    .line 319
    check-cast v2, Ljava/util/List;

    .line 320
    .line 321
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 322
    .line 323
    goto/16 :goto_0

    .line 324
    .line 325
    :sswitch_a
    sget-object v2, Lcom/p1/mobile/putong/feed/data/OperationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 326
    .line 327
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 328
    .line 329
    .line 330
    move-result-object v2

    .line 331
    check-cast v2, Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 332
    .line 333
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 334
    .line 335
    goto/16 :goto_0

    .line 336
    .line 337
    :sswitch_b
    sget-object v2, Lcom/p1/mobile/putong/feed/data/PostGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 338
    .line 339
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 340
    .line 341
    .line 342
    move-result-object v2

    .line 343
    check-cast v2, Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 344
    .line 345
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 346
    .line 347
    goto/16 :goto_0

    .line 348
    .line 349
    :sswitch_c
    sget-object v2, Lcom/p1/mobile/putong/feed/data/SingleTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 350
    .line 351
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 352
    .line 353
    .line 354
    move-result-object v2

    .line 355
    check-cast v2, Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 356
    .line 357
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 358
    .line 359
    goto/16 :goto_0

    .line 360
    .line 361
    :sswitch_d
    sget-object v2, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 362
    .line 363
    invoke-virtual {v2}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 364
    .line 365
    .line 366
    move-result-object v2

    .line 367
    invoke-virtual {p1, v2}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 368
    .line 369
    .line 370
    move-result-object v2

    .line 371
    check-cast v2, Ljava/util/List;

    .line 372
    .line 373
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 374
    .line 375
    goto/16 :goto_0

    .line 376
    .line 377
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 378
    .line 379
    .line 380
    move-result v1

    .line 381
    invoke-static {v1}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;

    .line 382
    .line 383
    .line 384
    move-result-object v1

    .line 385
    goto/16 :goto_0

    .line 386
    .line 387
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 388
    .line 389
    .line 390
    move-result v2

    .line 391
    iput v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 392
    .line 393
    goto/16 :goto_0

    .line 394
    .line 395
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 396
    .line 397
    .line 398
    move-result-object v2

    .line 399
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 400
    .line 401
    goto/16 :goto_0

    .line 402
    .line 403
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 404
    .line 405
    .line 406
    move-result-object v2

    .line 407
    iput-object v2, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 408
    .line 409
    goto/16 :goto_0

    .line 410
    .line 411
    :sswitch_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 412
    .line 413
    if-nez p1, :cond_10

    .line 414
    .line 415
    if-eqz v1, :cond_10

    .line 416
    .line 417
    sget-object p1, Lcom/p1/mobile/putong/feed/data/OperationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 418
    .line 419
    invoke-virtual {v1}, Ljava/lang/Integer;->intValue()I

    .line 420
    .line 421
    .line 422
    move-result v1

    .line 423
    invoke-virtual {p1, v0, v1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->newTEnum(Ljava/lang/String;I)Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 424
    .line 425
    .line 426
    move-result-object p1

    .line 427
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 428
    .line 429
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 430
    .line 431
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 432
    .line 433
    if-nez p1, :cond_11

    .line 434
    .line 435
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

    .line 436
    .line 437
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 438
    .line 439
    if-nez p1, :cond_12

    .line 440
    .line 441
    iput-object v3, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

    .line 442
    .line 443
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 444
    .line 445
    if-nez p1, :cond_13

    .line 446
    .line 447
    sget-object p1, Lcom/p1/mobile/putong/feed/data/OperationType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 448
    .line 449
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 450
    .line 451
    .line 452
    move-result-object p1

    .line 453
    check-cast p1, Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 454
    .line 455
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 456
    .line 457
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 458
    .line 459
    if-nez p1, :cond_14

    .line 460
    .line 461
    new-instance p1, Ljava/util/ArrayList;

    .line 462
    .line 463
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 464
    .line 465
    .line 466
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 467
    .line 468
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 469
    .line 470
    if-nez p1, :cond_15

    .line 471
    .line 472
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/SingleTopic;->new_()Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 473
    .line 474
    .line 475
    move-result-object p1

    .line 476
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 477
    .line 478
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 479
    .line 480
    if-nez p1, :cond_16

    .line 481
    .line 482
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PostGuide;->new_()Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 483
    .line 484
    .line 485
    move-result-object p1

    .line 486
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 487
    .line 488
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 489
    .line 490
    if-nez p1, :cond_17

    .line 491
    .line 492
    new-instance p1, Ljava/util/ArrayList;

    .line 493
    .line 494
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 495
    .line 496
    .line 497
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 498
    .line 499
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 500
    .line 501
    if-nez p1, :cond_18

    .line 502
    .line 503
    new-instance p1, Ljava/util/ArrayList;

    .line 504
    .line 505
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 506
    .line 507
    .line 508
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 509
    .line 510
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 511
    .line 512
    if-nez p1, :cond_19

    .line 513
    .line 514
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->new_()Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 515
    .line 516
    .line 517
    move-result-object p1

    .line 518
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 519
    .line 520
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 521
    .line 522
    if-nez p1, :cond_1a

    .line 523
    .line 524
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->new_()Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 525
    .line 526
    .line 527
    move-result-object p1

    .line 528
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 529
    .line 530
    :cond_1a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 531
    .line 532
    if-nez p1, :cond_1b

    .line 533
    .line 534
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->new_()Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 535
    .line 536
    .line 537
    move-result-object p1

    .line 538
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 539
    .line 540
    :cond_1b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 541
    .line 542
    if-nez p1, :cond_1c

    .line 543
    .line 544
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->new_()Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 545
    .line 546
    .line 547
    move-result-object p1

    .line 548
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 549
    .line 550
    :cond_1c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 551
    .line 552
    if-nez p1, :cond_1d

    .line 553
    .line 554
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->new_()Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 555
    .line 556
    .line 557
    move-result-object p1

    .line 558
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 559
    .line 560
    :cond_1d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 561
    .line 562
    if-nez p1, :cond_1e

    .line 563
    .line 564
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PoiGuide;->new_()Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 565
    .line 566
    .line 567
    move-result-object p1

    .line 568
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 569
    .line 570
    :cond_1e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 571
    .line 572
    if-nez p1, :cond_1f

    .line 573
    .line 574
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->new_()Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 575
    .line 576
    .line 577
    move-result-object p1

    .line 578
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 579
    .line 580
    :cond_1f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 581
    .line 582
    if-nez p1, :cond_20

    .line 583
    .line 584
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/PublishGuide;->new_()Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 585
    .line 586
    .line 587
    move-result-object p1

    .line 588
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 589
    .line 590
    :cond_20
    return-object p0

    .line 591
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_12
        0xa -> :sswitch_11
        0x12 -> :sswitch_10
        0x18 -> :sswitch_f
        0x20 -> :sswitch_e
        0x2a -> :sswitch_d
        0x32 -> :sswitch_c
        0x3a -> :sswitch_b
        0x42 -> :sswitch_a
        0x4a -> :sswitch_9
        0x52 -> :sswitch_8
        0x5a -> :sswitch_7
        0x62 -> :sswitch_6
        0x6a -> :sswitch_5
        0x72 -> :sswitch_4
        0x7a -> :sswitch_3
        0x82 -> :sswitch_2
        0x8a -> :sswitch_1
        0x92 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 591
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/TopicOperations$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/TopicOperations;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->name:Ljava/lang/String;

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
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->position:I

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p0}, Lcom/p1/mobile/putong/data/tenum/TEnum;->ordinal()I

    .line 29
    .line 30
    .line 31
    move-result p0

    .line 32
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 33
    .line 34
    .line 35
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->categoryTopic:Ljava/util/List;

    .line 36
    .line 37
    if-eqz p0, :cond_3

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/feed/data/CategoryTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 42
    .line 43
    .line 44
    move-result-object v0

    .line 45
    const/4 v1, 0x5

    .line 46
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 47
    .line 48
    .line 49
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleTopic:Lcom/p1/mobile/putong/feed/data/SingleTopic;

    .line 50
    .line 51
    if-eqz p0, :cond_4

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/feed/data/SingleTopic;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->postGuide:Lcom/p1/mobile/putong/feed/data/PostGuide;

    .line 60
    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    const/4 v0, 0x7

    .line 64
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PostGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 67
    .line 68
    .line 69
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->operationType:Lcom/p1/mobile/putong/feed/data/OperationType;

    .line 70
    .line 71
    if-eqz p0, :cond_6

    .line 72
    .line 73
    const/16 v0, 0x8

    .line 74
    .line 75
    sget-object v1, Lcom/p1/mobile/putong/feed/data/OperationType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 76
    .line 77
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 78
    .line 79
    .line 80
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendUsers:Ljava/util/List;

    .line 81
    .line 82
    if-eqz p0, :cond_7

    .line 83
    .line 84
    sget-object v0, Lcom/p1/mobile/putong/feed/data/RecommendUsers;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 87
    .line 88
    .line 89
    move-result-object v0

    .line 90
    const/16 v1, 0x9

    .line 91
    .line 92
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 93
    .line 94
    .line 95
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->recommendTopics:Ljava/util/List;

    .line 96
    .line 97
    if-eqz p0, :cond_8

    .line 98
    .line 99
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    const/16 v1, 0xa

    .line 106
    .line 107
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 108
    .line 109
    .line 110
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->nearbyOnline:Lcom/p1/mobile/putong/feed/data/NearbyOnline;

    .line 111
    .line 112
    if-eqz p0, :cond_9

    .line 113
    .line 114
    const/16 v0, 0xb

    .line 115
    .line 116
    sget-object v1, Lcom/p1/mobile/putong/feed/data/NearbyOnline;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 119
    .line 120
    .line 121
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->group:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 122
    .line 123
    if-eqz p0, :cond_a

    .line 124
    .line 125
    const/16 v0, 0xc

    .line 126
    .line 127
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 128
    .line 129
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 130
    .line 131
    .line 132
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->stateSquareEntrance:Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;

    .line 133
    .line 134
    if-eqz p0, :cond_b

    .line 135
    .line 136
    const/16 v0, 0xd

    .line 137
    .line 138
    sget-object v1, Lcom/p1/mobile/putong/feed/data/StateSquareEntrance;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 141
    .line 142
    .line 143
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->singleGroup:Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;

    .line 144
    .line 145
    if-eqz p0, :cond_c

    .line 146
    .line 147
    const/16 v0, 0xe

    .line 148
    .line 149
    sget-object v1, Lcom/p1/mobile/putong/feed/data/TopicOperationsGroup;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 150
    .line 151
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 152
    .line 153
    .line 154
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->momentViewer:Lcom/p1/mobile/putong/feed/data/MomentViewerBox;

    .line 155
    .line 156
    if-eqz p0, :cond_d

    .line 157
    .line 158
    const/16 v0, 0xf

    .line 159
    .line 160
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MomentViewerBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 163
    .line 164
    .line 165
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->poiGuide:Lcom/p1/mobile/putong/feed/data/PoiGuide;

    .line 166
    .line 167
    if-eqz p0, :cond_e

    .line 168
    .line 169
    const/16 v0, 0x10

    .line 170
    .line 171
    sget-object v1, Lcom/p1/mobile/putong/feed/data/PoiGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 174
    .line 175
    .line 176
    :cond_e
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->myTabPostGuide:Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;

    .line 177
    .line 178
    if-eqz p0, :cond_f

    .line 179
    .line 180
    const/16 v0, 0x11

    .line 181
    .line 182
    sget-object v1, Lcom/p1/mobile/putong/feed/data/MyTabPostGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 183
    .line 184
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 185
    .line 186
    .line 187
    :cond_f
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;->publishGuide:Lcom/p1/mobile/putong/feed/data/PublishGuide;

    .line 188
    .line 189
    if-eqz p0, :cond_10

    .line 190
    .line 191
    const/16 p1, 0x12

    .line 192
    .line 193
    sget-object v0, Lcom/p1/mobile/putong/feed/data/PublishGuide;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 196
    .line 197
    .line 198
    :cond_10
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 199
    check-cast p1, Lcom/p1/mobile/putong/feed/data/TopicOperations;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/TopicOperations$1;->serialize(Lcom/p1/mobile/putong/feed/data/TopicOperations;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
