.class Lcom/p1/mobile/putong/data/Emotion$1;
.super Lcom/tantanapp/common/data/MessageNanoAdapter;
.source "SourceFile"


# annotations
.annotation system Ldalvik/annotation/EnclosingClass;
    value = Lcom/p1/mobile/putong/data/Emotion;
.end annotation

.annotation system Ldalvik/annotation/InnerClass;
    accessFlags = 0x1
    name = null
.end annotation

.annotation system Ldalvik/annotation/Signature;
    value = {
        "Lcom/tantanapp/common/data/MessageNanoAdapter<",
        "Lcom/p1/mobile/putong/data/Emotion;",
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
.method public computeAndCacheSize(Lcom/p1/mobile/putong/data/Emotion;)I
    .locals 3

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 43
    .line 44
    if-eqz v0, :cond_4

    .line 45
    .line 46
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 47
    .line 48
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 49
    .line 50
    .line 51
    move-result-object v1

    .line 52
    const/4 v2, 0x5

    .line 53
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 54
    .line 55
    .line 56
    move-result v0

    .line 57
    add-int/2addr p0, v0

    .line 58
    :cond_4
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 59
    .line 60
    if-eqz v0, :cond_5

    .line 61
    .line 62
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 63
    .line 64
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 65
    .line 66
    .line 67
    move-result-object v1

    .line 68
    const/4 v2, 0x6

    .line 69
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 70
    .line 71
    .line 72
    move-result v0

    .line 73
    add-int/2addr p0, v0

    .line 74
    :cond_5
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 75
    .line 76
    if-eqz v0, :cond_6

    .line 77
    .line 78
    const/4 v1, 0x7

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
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 85
    .line 86
    if-eqz v0, :cond_7

    .line 87
    .line 88
    sget-object v1, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 89
    .line 90
    invoke-virtual {v1}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 91
    .line 92
    .line 93
    move-result-object v1

    .line 94
    const/16 v2, 0x8

    .line 95
    .line 96
    invoke-static {v2, v0, v1}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->l(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)I

    .line 97
    .line 98
    .line 99
    move-result v0

    .line 100
    add-int/2addr p0, v0

    .line 101
    :cond_7
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 102
    .line 103
    if-eqz v0, :cond_8

    .line 104
    .line 105
    const/16 v1, 0x9

    .line 106
    .line 107
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 108
    .line 109
    .line 110
    move-result v0

    .line 111
    add-int/2addr p0, v0

    .line 112
    :cond_8
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 113
    .line 114
    if-eqz v0, :cond_9

    .line 115
    .line 116
    const/16 v1, 0xa

    .line 117
    .line 118
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 119
    .line 120
    .line 121
    move-result v0

    .line 122
    add-int/2addr p0, v0

    .line 123
    :cond_9
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 124
    .line 125
    if-eqz v0, :cond_a

    .line 126
    .line 127
    const/16 v1, 0xb

    .line 128
    .line 129
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 130
    .line 131
    .line 132
    move-result v0

    .line 133
    add-int/2addr p0, v0

    .line 134
    :cond_a
    iget-object v0, p1, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 135
    .line 136
    if-eqz v0, :cond_b

    .line 137
    .line 138
    const/16 v1, 0xc

    .line 139
    .line 140
    invoke-static {v1, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->o(ILjava/lang/String;)I

    .line 141
    .line 142
    .line 143
    move-result v0

    .line 144
    add-int/2addr p0, v0

    .line 145
    :cond_b
    iput p0, p1, Lcom/google/protobuf/nano/MessageNano;->cachedSize:I

    .line 146
    .line 147
    return p0
.end method

.method public bridge synthetic computeAndCacheSize(Ljava/lang/Object;)I
    .locals 0

    .line 148
    check-cast p1, Lcom/p1/mobile/putong/data/Emotion;

    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Emotion$1;->computeAndCacheSize(Lcom/p1/mobile/putong/data/Emotion;)I

    move-result p0

    return p0
.end method

.method public parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Emotion;
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    new-instance p0, Lcom/p1/mobile/putong/data/Emotion;

    .line 2
    .line 3
    invoke-direct {p0}, Lcom/p1/mobile/putong/data/Emotion;-><init>()V

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
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

    .line 16
    .line 17
    if-nez p1, :cond_0

    .line 18
    .line 19
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

    .line 20
    .line 21
    :cond_0
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 22
    .line 23
    if-nez p1, :cond_1

    .line 24
    .line 25
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 26
    .line 27
    :cond_1
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 28
    .line 29
    if-nez p1, :cond_2

    .line 30
    .line 31
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 32
    .line 33
    :cond_2
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 34
    .line 35
    if-nez p1, :cond_3

    .line 36
    .line 37
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 38
    .line 39
    :cond_3
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 40
    .line 41
    if-nez p1, :cond_4

    .line 42
    .line 43
    new-instance p1, Ljava/util/ArrayList;

    .line 44
    .line 45
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 46
    .line 47
    .line 48
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 49
    .line 50
    :cond_4
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 51
    .line 52
    if-nez p1, :cond_5

    .line 53
    .line 54
    new-instance p1, Ljava/util/ArrayList;

    .line 55
    .line 56
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 57
    .line 58
    .line 59
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 60
    .line 61
    :cond_5
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 62
    .line 63
    if-nez p1, :cond_6

    .line 64
    .line 65
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 66
    .line 67
    :cond_6
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 68
    .line 69
    if-nez p1, :cond_7

    .line 70
    .line 71
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 72
    .line 73
    :cond_7
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 74
    .line 75
    if-nez p1, :cond_8

    .line 76
    .line 77
    new-instance p1, Ljava/util/ArrayList;

    .line 78
    .line 79
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 80
    .line 81
    .line 82
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 83
    .line 84
    :cond_8
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 85
    .line 86
    if-nez p1, :cond_9

    .line 87
    .line 88
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 89
    .line 90
    :cond_9
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 91
    .line 92
    if-nez p1, :cond_a

    .line 93
    .line 94
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 95
    .line 96
    :cond_a
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 97
    .line 98
    if-nez p1, :cond_16

    .line 99
    .line 100
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 101
    .line 102
    return-object p0

    .line 103
    :sswitch_0
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 104
    .line 105
    .line 106
    move-result-object v0

    .line 107
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 108
    .line 109
    goto :goto_0

    .line 110
    :sswitch_1
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 111
    .line 112
    .line 113
    move-result-object v0

    .line 114
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 115
    .line 116
    goto :goto_0

    .line 117
    :sswitch_2
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 118
    .line 119
    .line 120
    move-result-object v0

    .line 121
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 122
    .line 123
    goto :goto_0

    .line 124
    :sswitch_3
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 125
    .line 126
    .line 127
    move-result-object v0

    .line 128
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 129
    .line 130
    goto :goto_0

    .line 131
    :sswitch_4
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 132
    .line 133
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 134
    .line 135
    .line 136
    move-result-object v0

    .line 137
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 138
    .line 139
    .line 140
    move-result-object v0

    .line 141
    check-cast v0, Ljava/util/List;

    .line 142
    .line 143
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 144
    .line 145
    goto/16 :goto_0

    .line 146
    .line 147
    :sswitch_5
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 148
    .line 149
    .line 150
    move-result-object v0

    .line 151
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 152
    .line 153
    goto/16 :goto_0

    .line 154
    .line 155
    :sswitch_6
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 156
    .line 157
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 158
    .line 159
    .line 160
    move-result-object v0

    .line 161
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 162
    .line 163
    .line 164
    move-result-object v0

    .line 165
    check-cast v0, Ljava/util/List;

    .line 166
    .line 167
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 168
    .line 169
    goto/16 :goto_0

    .line 170
    .line 171
    :sswitch_7
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 172
    .line 173
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 174
    .line 175
    .line 176
    move-result-object v0

    .line 177
    invoke-virtual {p1, v0}, Ll/nc5;->l(Lcom/tantanapp/common/data/ProtobufAdapter;)Ljava/lang/Object;

    .line 178
    .line 179
    .line 180
    move-result-object v0

    .line 181
    check-cast v0, Ljava/util/List;

    .line 182
    .line 183
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 184
    .line 185
    goto/16 :goto_0

    .line 186
    .line 187
    :sswitch_8
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 188
    .line 189
    .line 190
    move-result-object v0

    .line 191
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 192
    .line 193
    goto/16 :goto_0

    .line 194
    .line 195
    :sswitch_9
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 196
    .line 197
    .line 198
    move-result-object v0

    .line 199
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 200
    .line 201
    goto/16 :goto_0

    .line 202
    .line 203
    :sswitch_a
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 204
    .line 205
    .line 206
    move-result-object v0

    .line 207
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 208
    .line 209
    goto/16 :goto_0

    .line 210
    .line 211
    :sswitch_b
    invoke-virtual {p1}, Ll/nc5;->s()Ljava/lang/String;

    .line 212
    .line 213
    .line 214
    move-result-object v0

    .line 215
    iput-object v0, p0, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

    .line 216
    .line 217
    goto/16 :goto_0

    .line 218
    .line 219
    :sswitch_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

    .line 220
    .line 221
    if-nez p1, :cond_b

    .line 222
    .line 223
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

    .line 224
    .line 225
    :cond_b
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 226
    .line 227
    if-nez p1, :cond_c

    .line 228
    .line 229
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

    .line 230
    .line 231
    :cond_c
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 232
    .line 233
    if-nez p1, :cond_d

    .line 234
    .line 235
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

    .line 236
    .line 237
    :cond_d
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 238
    .line 239
    if-nez p1, :cond_e

    .line 240
    .line 241
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

    .line 242
    .line 243
    :cond_e
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 244
    .line 245
    if-nez p1, :cond_f

    .line 246
    .line 247
    new-instance p1, Ljava/util/ArrayList;

    .line 248
    .line 249
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 250
    .line 251
    .line 252
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 253
    .line 254
    :cond_f
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 255
    .line 256
    if-nez p1, :cond_10

    .line 257
    .line 258
    new-instance p1, Ljava/util/ArrayList;

    .line 259
    .line 260
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 261
    .line 262
    .line 263
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 264
    .line 265
    :cond_10
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 266
    .line 267
    if-nez p1, :cond_11

    .line 268
    .line 269
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 270
    .line 271
    :cond_11
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 272
    .line 273
    if-nez p1, :cond_12

    .line 274
    .line 275
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 276
    .line 277
    :cond_12
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 278
    .line 279
    if-nez p1, :cond_13

    .line 280
    .line 281
    new-instance p1, Ljava/util/ArrayList;

    .line 282
    .line 283
    invoke-direct {p1}, Ljava/util/ArrayList;-><init>()V

    .line 284
    .line 285
    .line 286
    iput-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 287
    .line 288
    :cond_13
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 289
    .line 290
    if-nez p1, :cond_14

    .line 291
    .line 292
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 293
    .line 294
    :cond_14
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 295
    .line 296
    if-nez p1, :cond_15

    .line 297
    .line 298
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 299
    .line 300
    :cond_15
    iget-object p1, p0, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 301
    .line 302
    if-nez p1, :cond_16

    .line 303
    .line 304
    iput-object v1, p0, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 305
    .line 306
    :cond_16
    return-object p0

    .line 307
    :sswitch_data_0
    .sparse-switch
        0x0 -> :sswitch_c
        0xa -> :sswitch_b
        0x12 -> :sswitch_a
        0x1a -> :sswitch_9
        0x22 -> :sswitch_8
        0x2a -> :sswitch_7
        0x32 -> :sswitch_6
        0x3a -> :sswitch_5
        0x42 -> :sswitch_4
        0x4a -> :sswitch_3
        0x52 -> :sswitch_2
        0x5a -> :sswitch_1
        0x62 -> :sswitch_0
    .end sparse-switch
.end method

.method public bridge synthetic parse(Ll/nc5;)Ljava/lang/Object;
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 307
    invoke-virtual {p0, p1}, Lcom/p1/mobile/putong/data/Emotion$1;->parse(Ll/nc5;)Lcom/p1/mobile/putong/data/Emotion;

    move-result-object p0

    return-object p0
.end method

.method public serialize(Lcom/p1/mobile/putong/data/Emotion;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 2
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 1
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->emoji:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->text:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->emojiUrl:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->id:Ljava/lang/String;

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
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->backgroundColor:Ljava/util/List;

    .line 34
    .line 35
    if-eqz p0, :cond_4

    .line 36
    .line 37
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 38
    .line 39
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 40
    .line 41
    .line 42
    move-result-object v0

    .line 43
    const/4 v1, 0x5

    .line 44
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 45
    .line 46
    .line 47
    :cond_4
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->iconColor:Ljava/util/List;

    .line 48
    .line 49
    if-eqz p0, :cond_5

    .line 50
    .line 51
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 52
    .line 53
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 54
    .line 55
    .line 56
    move-result-object v0

    .line 57
    const/4 v1, 0x6

    .line 58
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 59
    .line 60
    .line 61
    :cond_5
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->userId:Ljava/lang/String;

    .line 62
    .line 63
    if-eqz p0, :cond_6

    .line 64
    .line 65
    const/4 v0, 0x7

    .line 66
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 67
    .line 68
    .line 69
    :cond_6
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->userAvatars:Ljava/util/List;

    .line 70
    .line 71
    if-eqz p0, :cond_7

    .line 72
    .line 73
    sget-object v0, Lcom/tantanapp/common/data/ProtobufAdapter;->STRING_ADAPTER:Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 74
    .line 75
    invoke-virtual {v0}, Lcom/tantanapp/common/data/ProtobufAdapter;->ARRAY_ADAPTER()Lcom/tantanapp/common/data/ProtobufAdapter;

    .line 76
    .line 77
    .line 78
    move-result-object v0

    .line 79
    const/16 v1, 0x8

    .line 80
    .line 81
    invoke-virtual {p2, v1, p0, v0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->K(ILjava/lang/Object;Lcom/tantanapp/common/data/ProtobufAdapter;)V

    .line 82
    .line 83
    .line 84
    :cond_7
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->topicId:Ljava/lang/String;

    .line 85
    .line 86
    if-eqz p0, :cond_8

    .line 87
    .line 88
    const/16 v0, 0x9

    .line 89
    .line 90
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 91
    .line 92
    .line 93
    :cond_8
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->topicName:Ljava/lang/String;

    .line 94
    .line 95
    if-eqz p0, :cond_9

    .line 96
    .line 97
    const/16 v0, 0xa

    .line 98
    .line 99
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 100
    .line 101
    .line 102
    :cond_9
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->liveId:Ljava/lang/String;

    .line 103
    .line 104
    if-eqz p0, :cond_a

    .line 105
    .line 106
    const/16 v0, 0xb

    .line 107
    .line 108
    invoke-virtual {p2, v0, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 109
    .line 110
    .line 111
    :cond_a
    iget-object p0, p1, Lcom/p1/mobile/putong/data/Emotion;->defaultDoc:Ljava/lang/String;

    .line 112
    .line 113
    if-eqz p0, :cond_b

    .line 114
    .line 115
    const/16 p1, 0xc

    .line 116
    .line 117
    invoke-virtual {p2, p1, p0}, Lcom/google/protobuf/nano/CodedOutputByteBufferNano;->R(ILjava/lang/String;)V

    .line 118
    .line 119
    .line 120
    :cond_b
    return-void
.end method

.method public bridge synthetic serialize(Ljava/lang/Object;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V
    .locals 0
    .annotation system Ldalvik/annotation/Throws;
        value = {
            Ljava/io/IOException;
        }
    .end annotation

    .line 121
    check-cast p1, Lcom/p1/mobile/putong/data/Emotion;

    invoke-virtual {p0, p1, p2}, Lcom/p1/mobile/putong/data/Emotion$1;->serialize(Lcom/p1/mobile/putong/data/Emotion;Lcom/google/protobuf/nano/CodedOutputByteBufferNano;)V

    return-void
.end method
