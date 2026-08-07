.class Lcom/p1/mobile/putong/feed/data/NotifyUsers$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/NotifyUsers;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/NotifyUsers;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 33
    .line 34
    if-eqz v0, :cond_3

    .line 35
    .line 36
    const/4 v1, 0x4

    .line 37
    sget-object v2, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 40
    .line 41
    .line 42
    move-result v0

    .line 43
    add-int/2addr p0, v0

    .line 44
    :cond_3
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 45
    .line 46
    if-eqz v0, :cond_4

    .line 47
    .line 48
    sget-object v1, Lcom/p1/mobile/putong/feed/data/AtChatGuides;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 61
    .line 62
    if-eqz v0, :cond_5

    .line 63
    .line 64
    const/4 v1, 0x6

    .line 65
    sget-object v2, Lcom/p1/mobile/putong/feed/data/AlbumButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/NotifyUsers$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/NotifyUsers;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/NotifyUsers;-><init>()V

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
    if-eqz v0, :cond_d

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_c

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_b

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_a

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_9

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_8

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_7

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_6

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

    .line 59
    .line 60
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 61
    .line 62
    if-nez p1, :cond_3

    .line 63
    .line 64
    invoke-static {}, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->new_()Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 65
    .line 66
    .line 67
    move-result-object p1

    .line 68
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 69
    .line 70
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 71
    .line 72
    if-nez p1, :cond_4

    .line 73
    .line 74
    new-instance p1, Ljava/util/ArrayList;

    .line 75
    .line 76
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 77
    .line 78
    .line 79
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 80
    .line 81
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 82
    .line 83
    if-nez p1, :cond_5

    .line 84
    .line 85
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/AlbumButton;->new_()Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 86
    .line 87
    .line 88
    move-result-object p1

    .line 89
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 90
    .line 91
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_14

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

    .line 96
    .line 97
    return-object p0

    .line 98
    :cond_6
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 99
    .line 100
    .line 101
    move-result-object v0

    .line 102
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    sget-object v0, Lcom/p1/mobile/putong/feed/data/AlbumButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 106
    .line 107
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 108
    .line 109
    .line 110
    move-result-object v0

    .line 111
    check-cast v0, Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 112
    .line 113
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 114
    .line 115
    goto :goto_0

    .line 116
    :cond_8
    sget-object v0, Lcom/p1/mobile/putong/feed/data/AtChatGuides;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 117
    .line 118
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 119
    .line 120
    .line 121
    move-result-object v0

    .line 122
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 123
    .line 124
    .line 125
    move-result-object v0

    .line 126
    check-cast v0, Ljava/util/List;

    .line 127
    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :cond_9
    sget-object v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    check-cast v0, Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 138
    .line 139
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 140
    .line 141
    goto/16 :goto_0

    .line 142
    .line 143
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

    .line 148
    .line 149
    goto/16 :goto_0

    .line 150
    .line 151
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 152
    .line 153
    .line 154
    move-result-object v0

    .line 155
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 156
    .line 157
    goto/16 :goto_0

    .line 158
    .line 159
    :cond_c
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 160
    .line 161
    .line 162
    move-result-object v0

    .line 163
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 164
    .line 165
    goto/16 :goto_0

    .line 166
    .line 167
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 168
    .line 169
    if-nez p1, :cond_e

    .line 170
    .line 171
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

    .line 172
    .line 173
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 174
    .line 175
    if-nez p1, :cond_f

    .line 176
    .line 177
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

    .line 178
    .line 179
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_10

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

    .line 184
    .line 185
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 186
    .line 187
    if-nez p1, :cond_11

    .line 188
    .line 189
    invoke-static {}, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->new_()Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 190
    .line 191
    .line 192
    move-result-object p1

    .line 193
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 194
    .line 195
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 196
    .line 197
    if-nez p1, :cond_12

    .line 198
    .line 199
    new-instance p1, Ljava/util/ArrayList;

    .line 200
    .line 201
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 202
    .line 203
    .line 204
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 205
    .line 206
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 207
    .line 208
    if-nez p1, :cond_13

    .line 209
    .line 210
    invoke-static {}, Lcom/p1/mobile/putong/feed/data/AlbumButton;->new_()Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 211
    .line 212
    .line 213
    move-result-object p1

    .line 214
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 215
    .line 216
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

    .line 217
    .line 218
    if-nez p1, :cond_14

    .line 219
    .line 220
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

    .line 221
    .line 222
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

    .line 223
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/NotifyUsers$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->name:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->description:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->topic:Lcom/p1/mobile/putong/data/TopicMomentIdBox;

    .line 26
    .line 27
    if-eqz p0, :cond_3

    .line 28
    .line 29
    const/4 v0, 0x4

    .line 30
    sget-object v1, Lcom/p1/mobile/putong/data/TopicMomentIdBox;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 31
    .line 32
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 33
    .line 34
    .line 35
    :cond_3
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->guides:Ljava/util/List;

    .line 36
    .line 37
    if-eqz p0, :cond_4

    .line 38
    .line 39
    sget-object v0, Lcom/p1/mobile/putong/feed/data/AtChatGuides;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

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
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->albumButton:Lcom/p1/mobile/putong/feed/data/AlbumButton;

    .line 50
    .line 51
    if-eqz p0, :cond_5

    .line 52
    .line 53
    const/4 v0, 0x6

    .line 54
    sget-object v1, Lcom/p1/mobile/putong/feed/data/AlbumButton;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 55
    .line 56
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 57
    .line 58
    .line 59
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;->subtitle:Ljava/lang/String;

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/NotifyUsers;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/NotifyUsers$1;->serialize(Lcom/p1/mobile/putong/feed/data/NotifyUsers;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
