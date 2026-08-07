.class Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 23
    .line 24
    if-eqz v0, :cond_2

    .line 25
    .line 26
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 27
    .line 28
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 29
    .line 30
    .line 31
    move-result-object v1

    .line 32
    const/4 v2, 0x3

    .line 33
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 34
    .line 35
    .line 36
    move-result v0

    .line 37
    add-int/2addr p0, v0

    .line 38
    :cond_2
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 39
    .line 40
    if-eqz v0, :cond_3

    .line 41
    .line 42
    const/4 v1, 0x4

    .line 43
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 44
    .line 45
    .line 46
    move-result v0

    .line 47
    add-int/2addr p0, v0

    .line 48
    :cond_3
    const/4 v0, 0x5

    .line 49
    iget v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->memberCount:I

    .line 50
    .line 51
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->h(II)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 57
    .line 58
    if-eqz v0, :cond_4

    .line 59
    .line 60
    const/4 v1, 0x6

    .line 61
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 62
    .line 63
    .line 64
    move-result v0

    .line 65
    add-int/2addr p0, v0

    .line 66
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

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
    const/16 v0, 0x8

    .line 77
    .line 78
    iget-boolean v1, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 79
    .line 80
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 81
    .line 82
    .line 83
    move-result v0

    .line 84
    add-int/2addr p0, v0

    .line 85
    iget-object v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 86
    .line 87
    if-eqz v0, :cond_6

    .line 88
    .line 89
    const/16 v1, 0x9

    .line 90
    .line 91
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 92
    .line 93
    .line 94
    move-result v0

    .line 95
    add-int/2addr p0, v0

    .line 96
    :cond_6
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 97
    .line 98
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 99
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;-><init>()V

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
    if-eqz v0, :cond_f

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_e

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_d

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_c

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_b

    .line 29
    .line 30
    const/16 v2, 0x28

    .line 31
    .line 32
    if-eq v0, v2, :cond_a

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_9

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_8

    .line 41
    .line 42
    const/16 v2, 0x40

    .line 43
    .line 44
    if-eq v0, v2, :cond_7

    .line 45
    .line 46
    const/16 v2, 0x4a

    .line 47
    .line 48
    if-eq v0, v2, :cond_6

    .line 49
    .line 50
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_0

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_1

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 61
    .line 62
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 63
    .line 64
    if-nez p1, :cond_2

    .line 65
    .line 66
    new-instance p1, Ljava/util/ArrayList;

    .line 67
    .line 68
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 69
    .line 70
    .line 71
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 72
    .line 73
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 74
    .line 75
    if-nez p1, :cond_3

    .line 76
    .line 77
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 78
    .line 79
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 80
    .line 81
    if-nez p1, :cond_4

    .line 82
    .line 83
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 84
    .line 85
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 86
    .line 87
    if-nez p1, :cond_5

    .line 88
    .line 89
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 90
    .line 91
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 92
    .line 93
    if-nez p1, :cond_16

    .line 94
    .line 95
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

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
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 103
    .line 104
    goto :goto_0

    .line 105
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 106
    .line 107
    .line 108
    move-result v0

    .line 109
    iput-boolean v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 110
    .line 111
    goto :goto_0

    .line 112
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 113
    .line 114
    .line 115
    move-result-object v0

    .line 116
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 117
    .line 118
    goto :goto_0

    .line 119
    :cond_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 124
    .line 125
    goto :goto_0

    .line 126
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->j()I

    .line 127
    .line 128
    .line 129
    move-result v0

    .line 130
    iput v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->memberCount:I

    .line 131
    .line 132
    goto :goto_0

    .line 133
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 138
    .line 139
    goto/16 :goto_0

    .line 140
    .line 141
    :cond_c
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 142
    .line 143
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 144
    .line 145
    .line 146
    move-result-object v0

    .line 147
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    check-cast v0, Ljava/util/List;

    .line 152
    .line 153
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 154
    .line 155
    goto/16 :goto_0

    .line 156
    .line 157
    :cond_d
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 162
    .line 163
    goto/16 :goto_0

    .line 164
    .line 165
    :cond_e
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 166
    .line 167
    .line 168
    move-result-object v0

    .line 169
    iput-object v0, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 170
    .line 171
    goto/16 :goto_0

    .line 172
    .line 173
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 174
    .line 175
    if-nez p1, :cond_10

    .line 176
    .line 177
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

    .line 178
    .line 179
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_11

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

    .line 184
    .line 185
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 186
    .line 187
    if-nez p1, :cond_12

    .line 188
    .line 189
    new-instance p1, Ljava/util/ArrayList;

    .line 190
    .line 191
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 192
    .line 193
    .line 194
    iput-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 195
    .line 196
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 197
    .line 198
    if-nez p1, :cond_13

    .line 199
    .line 200
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 201
    .line 202
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 203
    .line 204
    if-nez p1, :cond_14

    .line 205
    .line 206
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 207
    .line 208
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 209
    .line 210
    if-nez p1, :cond_15

    .line 211
    .line 212
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

    .line 213
    .line 214
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 215
    .line 216
    if-nez p1, :cond_16

    .line 217
    .line 218
    iput-object v1, p0, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 219
    .line 220
    :cond_16
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 221
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->avatars:Ljava/util/List;

    .line 18
    .line 19
    if-eqz p0, :cond_2

    .line 20
    .line 21
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 22
    .line 23
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 24
    .line 25
    .line 26
    move-result-object v0

    .line 27
    const/4 v1, 0x3

    .line 28
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->liveId:Ljava/lang/String;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    const/4 v0, 0x4

    .line 36
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 37
    .line 38
    .line 39
    :cond_3
    const/4 p0, 0x5

    .line 40
    iget v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->memberCount:I

    .line 41
    .line 42
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->G(II)V

    .line 43
    .line 44
    .line 45
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateText:Ljava/lang/String;

    .line 46
    .line 47
    if-eqz p0, :cond_4

    .line 48
    .line 49
    const/4 v0, 0x6

    .line 50
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 51
    .line 52
    .line 53
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->roomStateTextColor:Ljava/lang/String;

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
    const/16 p0, 0x8

    .line 62
    .line 63
    iget-boolean v0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->isLiving:Z

    .line 64
    .line 65
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 66
    .line 67
    .line 68
    iget-object p0, p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;->anchorId:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_6

    .line 71
    .line 72
    const/16 p1, 0x9

    .line 73
    .line 74
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
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

    .line 78
    check-cast p1, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom$1;->serialize(Lcom/p1/mobile/putong/data/VirtualVoiceGroupConversationItemRoom;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
