.class Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

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
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 24
    .line 25
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 26
    .line 27
    .line 28
    move-result v0

    .line 29
    add-int/2addr p0, v0

    .line 30
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 31
    .line 32
    if-eqz v0, :cond_2

    .line 33
    .line 34
    const/4 v1, 0x4

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 41
    .line 42
    if-eqz v0, :cond_3

    .line 43
    .line 44
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 45
    .line 46
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    .line 49
    move-result-object v1

    .line 50
    const/4 v2, 0x5

    .line 51
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 52
    .line 53
    .line 54
    move-result v0

    .line 55
    add-int/2addr p0, v0

    .line 56
    :cond_3
    const/4 v0, 0x6

    .line 57
    iget-boolean v1, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 58
    .line 59
    invoke-static {v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->b(IZ)I

    .line 60
    .line 61
    .line 62
    move-result v0

    .line 63
    add-int/2addr p0, v0

    .line 64
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 65
    .line 66
    if-eqz v0, :cond_4

    .line 67
    .line 68
    const/4 v1, 0x7

    .line 69
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_5

    .line 77
    .line 78
    const/16 v1, 0x8

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
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 97
    .line 98
    if-eqz v0, :cond_7

    .line 99
    .line 100
    const/16 v1, 0xa

    .line 101
    .line 102
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 103
    .line 104
    .line 105
    move-result v0

    .line 106
    add-int/2addr p0, v0

    .line 107
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 108
    .line 109
    if-eqz v0, :cond_8

    .line 110
    .line 111
    const/16 v1, 0xb

    .line 112
    .line 113
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 114
    .line 115
    .line 116
    move-result v0

    .line 117
    add-int/2addr p0, v0

    .line 118
    :cond_8
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 119
    .line 120
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$1;->computeAndCacheSize(Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    new-instance p1, Ljava/util/ArrayList;

    .line 38
    .line 39
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 40
    .line 41
    .line 42
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 43
    .line 44
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 45
    .line 46
    if-nez p1, :cond_4

    .line 47
    .line 48
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 55
    .line 56
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 57
    .line 58
    if-nez p1, :cond_6

    .line 59
    .line 60
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 61
    .line 62
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 63
    .line 64
    if-nez p1, :cond_7

    .line 65
    .line 66
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 67
    .line 68
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 69
    .line 70
    if-nez p1, :cond_10

    .line 71
    .line 72
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 73
    .line 74
    return-object p0

    .line 75
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 80
    .line 81
    goto :goto_0

    .line 82
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 83
    .line 84
    .line 85
    move-result-object v0

    .line 86
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 87
    .line 88
    goto :goto_0

    .line 89
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 90
    .line 91
    .line 92
    move-result-object v0

    .line 93
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 94
    .line 95
    goto :goto_0

    .line 96
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 97
    .line 98
    .line 99
    move-result-object v0

    .line 100
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 101
    .line 102
    goto :goto_0

    .line 103
    :sswitch_4
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 111
    .line 112
    .line 113
    move-result v0

    .line 114
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_6
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 118
    .line 119
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 120
    .line 121
    .line 122
    move-result-object v0

    .line 123
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 124
    .line 125
    .line 126
    move-result-object v0

    .line 127
    check-cast v0, Ljava/util/List;

    .line 128
    .line 129
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 130
    .line 131
    goto :goto_0

    .line 132
    :sswitch_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 133
    .line 134
    .line 135
    move-result-object v0

    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->g()Z

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    iput-boolean v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 157
    .line 158
    .line 159
    move-result-object v0

    .line 160
    iput-object v0, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 161
    .line 162
    goto/16 :goto_0

    .line 163
    .line 164
    :sswitch_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 165
    .line 166
    if-nez p1, :cond_8

    .line 167
    .line 168
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

    .line 169
    .line 170
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 171
    .line 172
    if-nez p1, :cond_9

    .line 173
    .line 174
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

    .line 175
    .line 176
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 177
    .line 178
    if-nez p1, :cond_a

    .line 179
    .line 180
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 181
    .line 182
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 183
    .line 184
    if-nez p1, :cond_b

    .line 185
    .line 186
    new-instance p1, Ljava/util/ArrayList;

    .line 187
    .line 188
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 189
    .line 190
    .line 191
    iput-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 192
    .line 193
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 194
    .line 195
    if-nez p1, :cond_c

    .line 196
    .line 197
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 198
    .line 199
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 200
    .line 201
    if-nez p1, :cond_d

    .line 202
    .line 203
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 204
    .line 205
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 206
    .line 207
    if-nez p1, :cond_e

    .line 208
    .line 209
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 210
    .line 211
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 212
    .line 213
    if-nez p1, :cond_f

    .line 214
    .line 215
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 216
    .line 217
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 218
    .line 219
    if-nez p1, :cond_10

    .line 220
    .line 221
    iput-object v1, p0, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 222
    .line 223
    :cond_10
    return-object p0

    .line 224
    nop

    .line 225
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_b
        0xa -> :sswitch_a
        0x12 -> :sswitch_9
        0x18 -> :sswitch_8
        0x22 -> :sswitch_7
        0x2a -> :sswitch_6
        0x30 -> :sswitch_5
        0x3a -> :sswitch_4
        0x42 -> :sswitch_3
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

    .line 225
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->title:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->subTitle:Ljava/lang/String;

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
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->isPersonal:Z

    .line 19
    .line 20
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 21
    .line 22
    .line 23
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->membersText:Ljava/lang/String;

    .line 24
    .line 25
    if-eqz p0, :cond_2

    .line 26
    .line 27
    const/4 v0, 0x4

    .line 28
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 29
    .line 30
    .line 31
    :cond_2
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->userAvatars:Ljava/util/List;

    .line 32
    .line 33
    if-eqz p0, :cond_3

    .line 34
    .line 35
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 36
    .line 37
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    .line 40
    move-result-object v0

    .line 41
    const/4 v1, 0x5

    .line 42
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 43
    .line 44
    .line 45
    :cond_3
    const/4 p0, 0x6

    .line 46
    iget-boolean v0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->needBuild:Z

    .line 47
    .line 48
    invoke-virtual {p2, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->A(IZ)V

    .line 49
    .line 50
    .line 51
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceLiveId:Ljava/lang/String;

    .line 52
    .line 53
    if-eqz p0, :cond_4

    .line 54
    .line 55
    const/4 v0, 0x7

    .line 56
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 57
    .line 58
    .line 59
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->voiceRoomId:Ljava/lang/String;

    .line 60
    .line 61
    if-eqz p0, :cond_5

    .line 62
    .line 63
    const/16 v0, 0x8

    .line 64
    .line 65
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 66
    .line 67
    .line 68
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->anchorId:Ljava/lang/String;

    .line 69
    .line 70
    if-eqz p0, :cond_6

    .line 71
    .line 72
    const/16 v0, 0x9

    .line 73
    .line 74
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 75
    .line 76
    .line 77
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->background:Ljava/lang/String;

    .line 78
    .line 79
    if-eqz p0, :cond_7

    .line 80
    .line 81
    const/16 v0, 0xa

    .line 82
    .line 83
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 84
    .line 85
    .line 86
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;->topicId:Ljava/lang/String;

    .line 87
    .line 88
    if-eqz p0, :cond_8

    .line 89
    .line 90
    const/16 p1, 0xb

    .line 91
    .line 92
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 93
    .line 94
    .line 95
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

    .line 96
    check-cast p1, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile$1;->serialize(Lcom/p1/mobile/putong/core/data/CoreLiveVoiceRoomInProfile;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
