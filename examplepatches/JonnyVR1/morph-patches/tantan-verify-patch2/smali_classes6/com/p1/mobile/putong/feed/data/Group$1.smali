.class Lcom/p1/mobile/putong/feed/data/Group$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/Group;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/Group;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/Group;)I
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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    const/16 v1, 0x39

    .line 89
    .line 90
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 91
    .line 92
    .line 93
    move-result v0

    .line 94
    add-int/2addr p0, v0

    .line 95
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 96
    .line 97
    if-eqz v0, :cond_8

    .line 98
    .line 99
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 102
    .line 103
    .line 104
    move-result-object v1

    .line 105
    const/16 v2, 0x3a

    .line 106
    .line 107
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    const/16 v0, 0x3b

    .line 113
    .line 114
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 115
    .line 116
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 117
    .line 118
    .line 119
    move-result v0

    .line 120
    add-int/2addr p0, v0

    .line 121
    const/16 v0, 0x3c

    .line 122
    .line 123
    iget v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 124
    .line 125
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 126
    .line 127
    .line 128
    move-result v0

    .line 129
    add-int/2addr p0, v0

    .line 130
    const/16 v0, 0x3d

    .line 131
    .line 132
    iget-boolean v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 133
    .line 134
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 135
    .line 136
    .line 137
    move-result v0

    .line 138
    add-int/2addr p0, v0

    .line 139
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 140
    .line 141
    if-eqz v0, :cond_9

    .line 142
    .line 143
    const/16 v1, 0x3e

    .line 144
    .line 145
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 146
    .line 147
    .line 148
    move-result v0

    .line 149
    add-int/2addr p0, v0

    .line 150
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 151
    .line 152
    if-eqz v0, :cond_a

    .line 153
    .line 154
    const/16 v1, 0x3f

    .line 155
    .line 156
    sget-object v2, Lcom/p1/mobile/putong/feed/data/GroupType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 157
    .line 158
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 159
    .line 160
    .line 161
    move-result v0

    .line 162
    add-int/2addr p0, v0

    .line 163
    :cond_a
    const/16 v0, 0x40

    .line 164
    .line 165
    iget-wide v1, p1, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 166
    .line 167
    invoke-static {v0, v1, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->d(ID)I

    .line 168
    .line 169
    .line 170
    move-result v0

    .line 171
    add-int/2addr p0, v0

    .line 172
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 173
    .line 174
    if-eqz v0, :cond_b

    .line 175
    .line 176
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 177
    .line 178
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 179
    .line 180
    .line 181
    move-result-object v1

    .line 182
    const/16 v2, 0x41

    .line 183
    .line 184
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 185
    .line 186
    .line 187
    move-result v0

    .line 188
    add-int/2addr p0, v0

    .line 189
    :cond_b
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 190
    .line 191
    if-eqz v0, :cond_c

    .line 192
    .line 193
    sget-object v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 194
    .line 195
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 196
    .line 197
    .line 198
    move-result-object v1

    .line 199
    const/16 v2, 0x42

    .line 200
    .line 201
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 202
    .line 203
    .line 204
    move-result v0

    .line 205
    add-int/2addr p0, v0

    .line 206
    :cond_c
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 207
    .line 208
    if-eqz v0, :cond_d

    .line 209
    .line 210
    sget-object v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 211
    .line 212
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 213
    .line 214
    .line 215
    move-result-object v1

    .line 216
    const/16 v2, 0x43

    .line 217
    .line 218
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 219
    .line 220
    .line 221
    move-result v0

    .line 222
    add-int/2addr p0, v0

    .line 223
    :cond_d
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 224
    .line 225
    if-eqz v0, :cond_e

    .line 226
    .line 227
    const/16 v1, 0x44

    .line 228
    .line 229
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 230
    .line 231
    .line 232
    move-result v0

    .line 233
    add-int/2addr p0, v0

    .line 234
    :cond_e
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 235
    .line 236
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 237
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Group$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/Group;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/Group;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/Group;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/Group;-><init>()V

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
    sparse-switch v0, :sswitch_data_0

    .line 13
    .line 14
    .line 15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 44
    .line 45
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 46
    .line 47
    if-nez p1, :cond_5

    .line 48
    .line 49
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 50
    .line 51
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 52
    .line 53
    if-nez p1, :cond_6

    .line 54
    .line 55
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 56
    .line 57
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 58
    .line 59
    if-nez p1, :cond_7

    .line 60
    .line 61
    new-instance p1, Ljava/util/ArrayList;

    .line 62
    .line 63
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 64
    .line 65
    .line 66
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 67
    .line 68
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_8

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 73
    .line 74
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 75
    .line 76
    if-nez p1, :cond_9

    .line 77
    .line 78
    sget-object p1, Lcom/p1/mobile/putong/feed/data/GroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 79
    .line 80
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 81
    .line 82
    .line 83
    move-result-object p1

    .line 84
    check-cast p1, Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 85
    .line 86
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 87
    .line 88
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 89
    .line 90
    if-nez p1, :cond_a

    .line 91
    .line 92
    new-instance p1, Ljava/util/ArrayList;

    .line 93
    .line 94
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 95
    .line 96
    .line 97
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 98
    .line 99
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 100
    .line 101
    if-nez p1, :cond_b

    .line 102
    .line 103
    new-instance p1, Ljava/util/ArrayList;

    .line 104
    .line 105
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 106
    .line 107
    .line 108
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 109
    .line 110
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 111
    .line 112
    if-nez p1, :cond_c

    .line 113
    .line 114
    new-instance p1, Ljava/util/ArrayList;

    .line 115
    .line 116
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 117
    .line 118
    .line 119
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 120
    .line 121
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 122
    .line 123
    if-nez p1, :cond_1a

    .line 124
    .line 125
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 126
    .line 127
    return-object p0

    .line 128
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 129
    .line 130
    .line 131
    move-result-object v0

    .line 132
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 133
    .line 134
    goto/16 :goto_0

    .line 135
    .line 136
    :sswitch_1
    sget-object v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 137
    .line 138
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 139
    .line 140
    .line 141
    move-result-object v0

    .line 142
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 143
    .line 144
    .line 145
    move-result-object v0

    .line 146
    check-cast v0, Ljava/util/List;

    .line 147
    .line 148
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 149
    .line 150
    goto/16 :goto_0

    .line 151
    .line 152
    :sswitch_2
    sget-object v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 153
    .line 154
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 155
    .line 156
    .line 157
    move-result-object v0

    .line 158
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 159
    .line 160
    .line 161
    move-result-object v0

    .line 162
    check-cast v0, Ljava/util/List;

    .line 163
    .line 164
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 165
    .line 166
    goto/16 :goto_0

    .line 167
    .line 168
    :sswitch_3
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 169
    .line 170
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 171
    .line 172
    .line 173
    move-result-object v0

    .line 174
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 175
    .line 176
    .line 177
    move-result-object v0

    .line 178
    check-cast v0, Ljava/util/List;

    .line 179
    .line 180
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 181
    .line 182
    goto/16 :goto_0

    .line 183
    .line 184
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->h()D

    .line 185
    .line 186
    .line 187
    move-result-wide v0

    .line 188
    iput-wide v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 189
    .line 190
    goto/16 :goto_0

    .line 191
    .line 192
    :sswitch_5
    sget-object v0, Lcom/p1/mobile/putong/feed/data/GroupType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 193
    .line 194
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 195
    .line 196
    .line 197
    move-result-object v0

    .line 198
    check-cast v0, Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 199
    .line 200
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 201
    .line 202
    goto/16 :goto_0

    .line 203
    .line 204
    :sswitch_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 205
    .line 206
    .line 207
    move-result-object v0

    .line 208
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 209
    .line 210
    goto/16 :goto_0

    .line 211
    .line 212
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 213
    .line 214
    .line 215
    move-result v0

    .line 216
    iput-boolean v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 217
    .line 218
    goto/16 :goto_0

    .line 219
    .line 220
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 221
    .line 222
    .line 223
    move-result v0

    .line 224
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 225
    .line 226
    goto/16 :goto_0

    .line 227
    .line 228
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 229
    .line 230
    .line 231
    move-result v0

    .line 232
    iput v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 233
    .line 234
    goto/16 :goto_0

    .line 235
    .line 236
    :sswitch_a
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 237
    .line 238
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 239
    .line 240
    .line 241
    move-result-object v0

    .line 242
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 243
    .line 244
    .line 245
    move-result-object v0

    .line 246
    check-cast v0, Ljava/util/List;

    .line 247
    .line 248
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 249
    .line 250
    goto/16 :goto_0

    .line 251
    .line 252
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 253
    .line 254
    .line 255
    move-result-object v0

    .line 256
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 257
    .line 258
    goto/16 :goto_0

    .line 259
    .line 260
    :sswitch_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 261
    .line 262
    .line 263
    move-result-object v0

    .line 264
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 265
    .line 266
    goto/16 :goto_0

    .line 267
    .line 268
    :sswitch_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 269
    .line 270
    .line 271
    move-result-object v0

    .line 272
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 273
    .line 274
    goto/16 :goto_0

    .line 275
    .line 276
    :sswitch_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 277
    .line 278
    .line 279
    move-result-object v0

    .line 280
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 281
    .line 282
    goto/16 :goto_0

    .line 283
    .line 284
    :sswitch_f
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 285
    .line 286
    .line 287
    move-result-object v0

    .line 288
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 289
    .line 290
    goto/16 :goto_0

    .line 291
    .line 292
    :sswitch_10
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 293
    .line 294
    .line 295
    move-result-object v0

    .line 296
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 297
    .line 298
    goto/16 :goto_0

    .line 299
    .line 300
    :sswitch_11
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 301
    .line 302
    .line 303
    move-result-object v0

    .line 304
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 305
    .line 306
    goto/16 :goto_0

    .line 307
    .line 308
    :sswitch_12
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 309
    .line 310
    .line 311
    move-result-object v0

    .line 312
    iput-object v0, p0, Lcom/tantanapp/common/data/DbObject;->id:Ljava/lang/String;

    .line 313
    .line 314
    goto/16 :goto_0

    .line 315
    .line 316
    :sswitch_13
    invoke-virtual {p1}, Ll/nc5;->k()J

    .line 317
    .line 318
    .line 319
    move-result-wide v0

    .line 320
    iput-wide v0, p0, Lcom/tantanapp/common/data/DbObject;->_id:J

    .line 321
    .line 322
    goto/16 :goto_0

    .line 323
    .line 324
    :sswitch_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 325
    .line 326
    if-nez p1, :cond_d

    .line 327
    .line 328
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

    .line 329
    .line 330
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 331
    .line 332
    if-nez p1, :cond_e

    .line 333
    .line 334
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

    .line 335
    .line 336
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 337
    .line 338
    if-nez p1, :cond_f

    .line 339
    .line 340
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

    .line 341
    .line 342
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 343
    .line 344
    if-nez p1, :cond_10

    .line 345
    .line 346
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

    .line 347
    .line 348
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 349
    .line 350
    if-nez p1, :cond_11

    .line 351
    .line 352
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

    .line 353
    .line 354
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 355
    .line 356
    if-nez p1, :cond_12

    .line 357
    .line 358
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

    .line 359
    .line 360
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 361
    .line 362
    if-nez p1, :cond_13

    .line 363
    .line 364
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 365
    .line 366
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 367
    .line 368
    if-nez p1, :cond_14

    .line 369
    .line 370
    new-instance p1, Ljava/util/ArrayList;

    .line 371
    .line 372
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 373
    .line 374
    .line 375
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 376
    .line 377
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 378
    .line 379
    if-nez p1, :cond_15

    .line 380
    .line 381
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 382
    .line 383
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 384
    .line 385
    if-nez p1, :cond_16

    .line 386
    .line 387
    sget-object p1, Lcom/p1/mobile/putong/feed/data/GroupType;->JSON_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;

    .line 388
    .line 389
    invoke-virtual {p1}, Lcom/p1/mobile/putong/data/tenum/TEnumJsonAdapter;->defaultEnum()Lcom/p1/mobile/putong/data/tenum/TEnum;

    .line 390
    .line 391
    .line 392
    move-result-object p1

    .line 393
    check-cast p1, Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 394
    .line 395
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 396
    .line 397
    :cond_16
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 398
    .line 399
    if-nez p1, :cond_17

    .line 400
    .line 401
    new-instance p1, Ljava/util/ArrayList;

    .line 402
    .line 403
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 404
    .line 405
    .line 406
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 407
    .line 408
    :cond_17
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 409
    .line 410
    if-nez p1, :cond_18

    .line 411
    .line 412
    new-instance p1, Ljava/util/ArrayList;

    .line 413
    .line 414
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 415
    .line 416
    .line 417
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 418
    .line 419
    :cond_18
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 420
    .line 421
    if-nez p1, :cond_19

    .line 422
    .line 423
    new-instance p1, Ljava/util/ArrayList;

    .line 424
    .line 425
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 426
    .line 427
    .line 428
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 429
    .line 430
    :cond_19
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 431
    .line 432
    if-nez p1, :cond_1a

    .line 433
    .line 434
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 435
    .line 436
    :cond_1a
    return-object p0

    .line 437
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
        0x1e0 -> :sswitch_8
        0x1e8 -> :sswitch_7
        0x1f2 -> :sswitch_6
        0x1fa -> :sswitch_5
        0x201 -> :sswitch_4
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

    .line 437
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/Group$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/Group;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/Group;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->description:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->preViewContent:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->memberRole:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->state:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->icon:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->headIcon:Ljava/lang/String;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    const/16 v0, 0x39

    .line 74
    .line 75
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 76
    .line 77
    .line 78
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->backgroundColors:Ljava/util/List;

    .line 79
    .line 80
    if-eqz p0, :cond_8

    .line 81
    .line 82
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 83
    .line 84
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 85
    .line 86
    .line 87
    move-result-object v0

    .line 88
    const/16 v1, 0x3a

    .line 89
    .line 90
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    const/16 p0, 0x3b

    .line 94
    .line 95
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->userCounter:I

    .line 96
    .line 97
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 98
    .line 99
    .line 100
    const/16 p0, 0x3c

    .line 101
    .line 102
    iget v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->unReadMomentCounter:I

    .line 103
    .line 104
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 105
    .line 106
    .line 107
    const/16 p0, 0x3d

    .line 108
    .line 109
    iget-boolean v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->joined:Z

    .line 110
    .line 111
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 112
    .line 113
    .line 114
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->status:Ljava/lang/String;

    .line 115
    .line 116
    if-eqz p0, :cond_9

    .line 117
    .line 118
    const/16 v0, 0x3e

    .line 119
    .line 120
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 121
    .line 122
    .line 123
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->groupType:Lcom/p1/mobile/putong/feed/data/GroupType;

    .line 124
    .line 125
    if-eqz p0, :cond_a

    .line 126
    .line 127
    const/16 v0, 0x3f

    .line 128
    .line 129
    sget-object v1, Lcom/p1/mobile/putong/feed/data/GroupType;->PROTOBUF_ADAPTER:Lcom/p1/mobile/putong/data/tenum/TEnumProtobufAdapter;

    .line 130
    .line 131
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 132
    .line 133
    .line 134
    :cond_a
    const/16 p0, 0x40

    .line 135
    .line 136
    iget-wide v0, p1, Lcom/p1/mobile/putong/feed/data/Group;->createdTime:D

    .line 137
    .line 138
    invoke-virtual {p2, p0, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->C(ID)V

    .line 139
    .line 140
    .line 141
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->userIds:Ljava/util/List;

    .line 142
    .line 143
    if-eqz p0, :cond_b

    .line 144
    .line 145
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 146
    .line 147
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    const/16 v1, 0x41

    .line 152
    .line 153
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 154
    .line 155
    .line 156
    :cond_b
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->topics:Ljava/util/List;

    .line 157
    .line 158
    if-eqz p0, :cond_c

    .line 159
    .line 160
    sget-object v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 161
    .line 162
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 163
    .line 164
    .line 165
    move-result-object v0

    .line 166
    const/16 v1, 0x42

    .line 167
    .line 168
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 169
    .line 170
    .line 171
    :cond_c
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->hotTopics:Ljava/util/List;

    .line 172
    .line 173
    if-eqz p0, :cond_d

    .line 174
    .line 175
    sget-object v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 176
    .line 177
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    const/16 v1, 0x43

    .line 182
    .line 183
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 184
    .line 185
    .line 186
    :cond_d
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/Group;->owner:Ljava/lang/String;

    .line 187
    .line 188
    if-eqz p0, :cond_e

    .line 189
    .line 190
    const/16 p1, 0x44

    .line 191
    .line 192
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 193
    .line 194
    .line 195
    :cond_e
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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/Group;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/Group$1;->serialize(Lcom/p1/mobile/putong/feed/data/Group;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
