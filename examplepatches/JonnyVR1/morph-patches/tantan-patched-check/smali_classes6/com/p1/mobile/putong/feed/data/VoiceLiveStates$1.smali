.class Lcom/p1/mobile/putong/feed/data/VoiceLiveStates$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 49
    .line 50
    if-eqz v0, :cond_4

    .line 51
    .line 52
    const/4 v1, 0x5

    .line 53
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    const/4 v1, 0x6

    .line 63
    sget-object v2, Lcom/p1/mobile/putong/data/TextTheme;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 64
    .line 65
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 66
    .line 67
    .line 68
    move-result v0

    .line 69
    add-int/2addr p0, v0

    .line 70
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 71
    .line 72
    if-eqz v0, :cond_6

    .line 73
    .line 74
    const/4 v1, 0x7

    .line 75
    sget-object v2, Lcom/p1/mobile/putong/data/Emotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    invoke-static {v1, v0, v2}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates$1;->computeAndCacheSize(Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;
    .locals 3
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;-><init>()V

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
    if-eqz v0, :cond_c

    .line 13
    .line 14
    const/16 v2, 0xa

    .line 15
    .line 16
    if-eq v0, v2, :cond_b

    .line 17
    .line 18
    const/16 v2, 0x12

    .line 19
    .line 20
    if-eq v0, v2, :cond_a

    .line 21
    .line 22
    const/16 v2, 0x1a

    .line 23
    .line 24
    if-eq v0, v2, :cond_9

    .line 25
    .line 26
    const/16 v2, 0x22

    .line 27
    .line 28
    if-eq v0, v2, :cond_8

    .line 29
    .line 30
    const/16 v2, 0x2a

    .line 31
    .line 32
    if-eq v0, v2, :cond_7

    .line 33
    .line 34
    const/16 v2, 0x32

    .line 35
    .line 36
    if-eq v0, v2, :cond_6

    .line 37
    .line 38
    const/16 v2, 0x3a

    .line 39
    .line 40
    if-eq v0, v2, :cond_5

    .line 41
    .line 42
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

    .line 43
    .line 44
    if-nez p1, :cond_0

    .line 45
    .line 46
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

    .line 47
    .line 48
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

    .line 49
    .line 50
    if-nez p1, :cond_1

    .line 51
    .line 52
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

    .line 53
    .line 54
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 55
    .line 56
    if-nez p1, :cond_2

    .line 57
    .line 58
    new-instance p1, Ljava/util/ArrayList;

    .line 59
    .line 60
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 61
    .line 62
    .line 63
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 64
    .line 65
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

    .line 66
    .line 67
    if-nez p1, :cond_3

    .line 68
    .line 69
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

    .line 70
    .line 71
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 72
    .line 73
    if-nez p1, :cond_4

    .line 74
    .line 75
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 76
    .line 77
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 78
    .line 79
    if-nez p1, :cond_12

    .line 80
    .line 81
    invoke-static {}, Lcom/p1/mobile/putong/data/TextTheme;->new_()Lcom/p1/mobile/putong/data/TextTheme;

    .line 82
    .line 83
    .line 84
    move-result-object p1

    .line 85
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 86
    .line 87
    return-object p0

    .line 88
    :cond_5
    sget-object v0, Lcom/p1/mobile/putong/data/Emotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 91
    .line 92
    .line 93
    move-result-object v0

    .line 94
    check-cast v0, Lcom/p1/mobile/putong/data/Emotion;

    .line 95
    .line 96
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 97
    .line 98
    goto :goto_0

    .line 99
    :cond_6
    sget-object v0, Lcom/p1/mobile/putong/data/TextTheme;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 100
    .line 101
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 102
    .line 103
    .line 104
    move-result-object v0

    .line 105
    check-cast v0, Lcom/p1/mobile/putong/data/TextTheme;

    .line 106
    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :cond_7
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :cond_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :cond_9
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 125
    .line 126
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 127
    .line 128
    .line 129
    move-result-object v0

    .line 130
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 131
    .line 132
    .line 133
    move-result-object v0

    .line 134
    check-cast v0, Ljava/util/List;

    .line 135
    .line 136
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 137
    .line 138
    goto/16 :goto_0

    .line 139
    .line 140
    :cond_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 141
    .line 142
    .line 143
    move-result-object v0

    .line 144
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

    .line 145
    .line 146
    goto/16 :goto_0

    .line 147
    .line 148
    :cond_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 149
    .line 150
    .line 151
    move-result-object v0

    .line 152
    iput-object v0, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

    .line 153
    .line 154
    goto/16 :goto_0

    .line 155
    .line 156
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

    .line 157
    .line 158
    if-nez p1, :cond_d

    .line 159
    .line 160
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

    .line 161
    .line 162
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

    .line 163
    .line 164
    if-nez p1, :cond_e

    .line 165
    .line 166
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

    .line 167
    .line 168
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 169
    .line 170
    if-nez p1, :cond_f

    .line 171
    .line 172
    new-instance p1, Ljava/util/ArrayList;

    .line 173
    .line 174
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 175
    .line 176
    .line 177
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

    .line 178
    .line 179
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

    .line 180
    .line 181
    if-nez p1, :cond_10

    .line 182
    .line 183
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

    .line 184
    .line 185
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 186
    .line 187
    if-nez p1, :cond_11

    .line 188
    .line 189
    iput-object v1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 190
    .line 191
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 192
    .line 193
    if-nez p1, :cond_12

    .line 194
    .line 195
    invoke-static {}, Lcom/p1/mobile/putong/data/TextTheme;->new_()Lcom/p1/mobile/putong/data/TextTheme;

    .line 196
    .line 197
    .line 198
    move-result-object p1

    .line 199
    iput-object p1, p0, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 200
    .line 201
    :cond_12
    return-object p0
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 202
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->userAvatars:Ljava/util/List;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicId:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->topicName:Ljava/lang/String;

    .line 40
    .line 41
    if-eqz p0, :cond_4

    .line 42
    .line 43
    const/4 v0, 0x5

    .line 44
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->textTheme:Lcom/p1/mobile/putong/data/TextTheme;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    const/4 v0, 0x6

    .line 52
    sget-object v1, Lcom/p1/mobile/putong/data/TextTheme;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 53
    .line 54
    invoke-virtual {p2, v0, p0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 55
    .line 56
    .line 57
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;->emotion:Lcom/p1/mobile/putong/data/Emotion;

    .line 58
    .line 59
    if-eqz p0, :cond_6

    .line 60
    .line 61
    const/4 p1, 0x7

    .line 62
    sget-object v0, Lcom/p1/mobile/putong/data/Emotion;->PROTOBUF_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {p2, p1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

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
    check-cast p1, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/feed/data/VoiceLiveStates$1;->serialize(Lcom/p1/mobile/putong/feed/data/VoiceLiveStates;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
